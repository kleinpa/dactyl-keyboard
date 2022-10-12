load("@rules_clojure//:rules.bzl", "clojure_library")

clojure_library(
    name = "dactyl",
    srcs = [
        "common.clj",
        "generator.clj",
        "lightcycle.clj",
        "manuform.clj",
        "util.clj",
    ],
    aot = [
        "dactyl.common",
        "dactyl.generator",
        "dactyl.lightcycle",
        "dactyl.manuform",
        "dactyl.util",
    ],
    resource_strip_prefix = "src",
    visibility = ["//visibility:public"],
    deps = [
        "@maven//:org_clojure_clojure",
        "@maven//:org_clojure_core_specs_alpha",
        "@maven//:org_clojure_spec_alpha",
        "@maven//:scad_clj_scad_clj",
    ],
)
