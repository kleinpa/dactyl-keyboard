load("@rules_python//python:defs.bzl", "py_binary")
load("@bazel_skylib//rules:build_test.bzl", "build_test")

def py_dactyl(name, src, outs = None, defaults = False):
    """Convenience macro for testing the built-in configs."""

    if not outs:
        outs = [
            # Pre-declare outputs used by GitHub Action directly
            name + "_right.svg",
            name + "_left.stl",
            name + "_left_plate.stl",
            name + "_right.stl",
            name + "_right_plate.stl",
        ]
    bin_name = name + "_bin"
    py_binary(
        name = bin_name,
        main = src,
        srcs = [src],
    )

    config_name = name + "_config"
    generate_config(
        name = config_name,
        bin = bin_name,
    )

    dactyl_manuform(
        name = name,
        config = config_name,
        outs = outs,
        defaults = defaults,
    )

    test_name = name + "_test"
    build_test(
        name = test_name,
        targets = [name],
    )

def _generate_config(ctx):
    output_file = ctx.actions.declare_file("{}.json".format(ctx.label.name))

    ctx.actions.run(
        outputs = [output_file],
        arguments = [output_file.path],
        executable = ctx.executable.bin,
    )

    return [DefaultInfo(files = depset([output_file]))]

generate_config = rule(
    implementation = _generate_config,
    attrs = {
        "bin": attr.label(
            executable = True,
            cfg = "exec",
        ),
    },
)

def _dactyl_manuform(ctx):
    parts = ["right", "left", "left_plate", "right_plate"]
    formats = ["stl", "dxf", "svg"]

    default_output_files = []

    for part in parts:
        step_file = ctx.actions.declare_file("{}_{}.step".format(ctx.label.name, part))
        default_output_files.append(step_file)

        ctx.actions.run(
            inputs = [ctx.file.config],
            outputs = [step_file],
            arguments = [
                "--config={}".format(ctx.file.config.path),
                "--output={}".format(step_file.path),
                "--part={}".format(part),
                "--defaults" if ctx.attr.defaults else "--nodefaults",
            ],
            env = {"USERPROFILE": "."},  # requried on windows
            executable = ctx.executable._generator,
        )

        for format in formats:
            output_file = ctx.actions.declare_file("{}_{}.{}".format(ctx.label.name, part, format))

            ctx.actions.run(
                inputs = [step_file],
                outputs = [output_file],
                arguments = [
                    "--input={}".format(step_file.path),
                    "--output={}".format(output_file.path),
                    "--format={}".format(format),
                ],
                env = {"USERPROFILE": "."},  # requried on windows
                executable = ctx.executable._step_format,
            )

    return [DefaultInfo(files = depset(ctx.outputs.outs))]

dactyl_manuform = rule(
    implementation = _dactyl_manuform,
    attrs = {
        "config": attr.label(
            allow_single_file = [".json"],
            mandatory = True,
        ),
        "defaults": attr.bool(default = False),
        "outs": attr.output_list(),
        "_generator": attr.label(
            default = Label("//src:dactyl_manuform"),
            executable = True,
            cfg = "exec",
        ),
        "_step_format": attr.label(
            default = Label("//src:step_format"),
            executable = True,
            cfg = "exec",
        ),
    },
)
