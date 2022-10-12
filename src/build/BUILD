load("@rules_clojure//:rules.bzl", "clojure_binary", "clojure_library")

clojure_binary(
    name = "build",
    main_class = "build.main",
    visibility = ["//visibility:public"],
    deps = [":build_lib"],
)

clojure_library(
    name = "build_lib",
    srcs = [
        "main.clj",
    ],
    aot = [
        "build.main",
    ],
    resource_strip_prefix = "src",
    deps = [
        "//src/dactyl",
        "@maven//:org_clojure_clojure",
        "@maven//:org_clojure_core_specs_alpha",
        "@maven//:org_clojure_spec_alpha",
    ],
)
