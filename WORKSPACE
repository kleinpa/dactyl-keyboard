load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_clojure",
    sha256 = "8776f2ba1e85f1d56bb4aee29ce810bc8cd3862a99d92c746770bacdc648d38a",
    strip_prefix = "rules_clojure-c8302dfe272bef9b53a16c6ba66ac017a1520be6",
    url = "https://github.com/griffinbank/rules_clojure/archive/c8302dfe272bef9b53a16c6ba66ac017a1520be6.zip",
)

load("@rules_clojure//:repositories.bzl", "rules_clojure_dependencies")

rules_clojure_dependencies()

load("@rules_clojure//:toolchains.bzl", "rules_clojure_default_toolchain")

rules_clojure_default_toolchain()

http_archive(
    name = "rules_jvm_external",
    sha256 = "cd1a77b7b02e8e008439ca76fd34f5b07aecb8c752961f9640dea15e9e5ba1ca",
    strip_prefix = "rules_jvm_external-4.2",
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/4.2.zip",
)

load("@rules_jvm_external//:repositories.bzl", "rules_jvm_external_deps")

rules_jvm_external_deps()

load("@rules_jvm_external//:setup.bzl", "rules_jvm_external_setup")

rules_jvm_external_setup()

load("@rules_jvm_external//:defs.bzl", "maven_install")
load("@rules_jvm_external//:specs.bzl", "maven")

maven_install(
    artifacts = [
        maven.artifact(
            artifact = "scad-clj",
            group = "scad-clj",
            version = "0.4.0",
        ),
        maven.artifact(
            artifact = "clojure",
            exclusions = [
                "org.clojure:spec.alpha",
                "org.clojure:core.specs.alpha",
            ],
            group = "org.clojure",
            version = "1.11.1",
        ),
        maven.artifact(
            artifact = "spec.alpha",
            exclusions = ["org.clojure:clojure"],
            group = "org.clojure",
            version = "0.3.218",
        ),
        maven.artifact(
            artifact = "core.specs.alpha",
            exclusions = [
                "org.clojure:clojure",
            ],
            group = "org.clojure",
            version = "0.2.62",
        ),
        maven.artifact(
            artifact = "data.json",
            group = "org.clojure",
            version = "2.4.0",
        ),
        maven.artifact(
            artifact = "compojure",
            group = "compojure",
            version = "1.7.0",
        ),
        maven.artifact(
            artifact = "ring-defaults",
            group = "ring",
            version = "0.3.2",
        ),
        maven.artifact(
            artifact = "ring-json",
            group = "ring",
            version = "0.5.0",
        ),
        maven.artifact(
            artifact = "ring-jetty-adapter",
            group = "ring",
            version = "1.8.0",
        ),
        maven.artifact(
            artifact = "selmer",
            group = "selmer",
            version = "1.12.18",
        ),
    ],
    repositories = [
        "https://repo1.maven.org/maven2",
        "https://repo.clojars.org",
    ],
)

http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "b1e80761a8a8243d03ebca8845e9cc1ba6c82ce7c5179ce2b295cd36f7e394bf",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.25.0/rules_docker-v0.25.0.tar.gz"],
)

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

container_repositories()

load(
    "@io_bazel_rules_docker//java:image.bzl",
    _java_image_repos = "repositories",
)

_java_image_repos()
