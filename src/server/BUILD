load("@rules_clojure//:rules.bzl", "clojure_binary", "clojure_library")

clojure_binary(
    name = "server",
    main_class = "server.main",
    visibility = ["//visibility:public"],
    deps = [":server_lib"],
)

filegroup(
    name = "resources",
    srcs = glob(["resources/**"]),
)

clojure_library(
    name = "server_lib",
    srcs = [
        "handler.clj",
        "main.clj",
    ],
    aot = [
        "server.main",
        "server.handler",
        "clout.core",
    ],
    resource_strip_prefix = "src",
    resources = [":resources"],
    deps = [
        "//src/dactyl",
        "@maven//:compojure_compojure",
        "@maven//:org_clojure_clojure",
        "@maven//:org_clojure_core_specs_alpha",
        "@maven//:org_clojure_spec_alpha",
        "@maven//:ring_ring_defaults",
        "@maven//:ring_ring_jetty_adapter",
        "@maven//:ring_ring_json",
        "@maven//:selmer_selmer",
    ],
)
