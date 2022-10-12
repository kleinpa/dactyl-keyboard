load("@io_bazel_rules_docker//java:image.bzl", "jar_app_layer")

jar_app_layer(
    name = "server_image",
    base = "@java_image_base//image",
    binary = "//src/server",
    main_class = "server.main",
)
