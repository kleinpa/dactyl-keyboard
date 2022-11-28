load("@rules_python//python:defs.bzl", "py_binary")
load("@py_deps//:requirements.bzl", "requirement")
load("//src:defs.bzl", "dactyl_manuform")

py_binary(
    name = "dactyl_manuform",
    srcs = [
        "dactyl_manuform.py",
        "helpers_cadquery.py",
    ],
    data = glob(["parts/*"]),
    visibility = ["//visibility:public"],
    deps = [
        requirement("absl-py"),
        requirement("numpy"),
        requirement("scipy"),
        # Loading cadquery's dep cadquery-ocp fails in bazel with an error like:
        #     AssertionError: In cadquery_ocp-7.6.3a0-cp39-cp39-manylinux_2_31_x86_64.whl, LICENSES_bundled.txt is not mentioned in RECORD
        # so for now just make sure it's already installed on the host. :(
        # requirement("cadquery"),
    ],
)

py_binary(
    name = "model_builder",
    srcs = ["model_builder.py"],
)

py_binary(
    name = "generate_configuration",
    srcs = ["generate_configuration.py"],
)

genrule(
    name = "configuration_default",
    outs = ["configuration_default.json"],
    cmd = "./$(location :generate_configuration) > $@",
    exec_tools = [":generate_configuration"],
)

dactyl_manuform(
    name = "default",
    config = ":configuration_default",
)

py_binary(
    name = "generate_configuration_mklasklasd",
    srcs = ["generate_configuration_mklasklasd.py"],
)

genrule(
    name = "configuration_mklasklasd",
    outs = ["configuration_mklasklasd.json"],
    cmd = "./$(location :generate_configuration_mklasklasd) > $@",
    exec_tools = [":generate_configuration_mklasklasd"],
)

# dactyl_manuform(
#     name = "mklasklasd",
#     config = ":configuration_mklasklasd",
# )

py_binary(
    name = "generate_configuration_orbyl_test",
    srcs = ["generate_configuration_orbyl_test.py"],
)

genrule(
    name = "configuration_orbyl_test",
    outs = ["configuration_orbyl_test.json"],
    cmd = "./$(location :generate_configuration_orbyl_test) > $@",
    exec_tools = [":generate_configuration_orbyl_test"],
)

# dactyl_manuform(
#     name = "orbyl_test",
#     config = ":configuration_orbyl_test",
# )

py_binary(
    name = "generate_configuration_test",
    srcs = ["generate_configuration_test.py"],
)

genrule(
    name = "configuration_test",
    outs = ["configuration_test.json"],
    cmd = "./$(location :generate_configuration_test) > $@",
    exec_tools = [":generate_configuration_test"],
)

dactyl_manuform(
    name = "test",
    config = ":configuration_test",
    defaults = True,
)

py_binary(
    name = "step_format",
    srcs = ["step_format.py"],
    visibility = ["//visibility:public"],
    deps = [
        requirement("absl-py"),
        # requirement("cadquery"),
    ],
)
