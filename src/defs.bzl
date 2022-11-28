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
