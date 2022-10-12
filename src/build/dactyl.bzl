def generate_dactyl(name, binary, visibility = None):
    parts = ["left", "right", "left_plate", "right_plate"]

    for part in parts:
        native.genrule(
            name = "_".join([name, part]),
            srcs = [],
            outs = ["_".join([name, part]) + ".scad"],
            cmd = "./$(location " + binary + ") " + part + " > \"$@\"",
            tools = [binary],
            visibility = visibility,
        )

    native.filegroup(
        name = name,
        srcs = ["_".join([name, part]) for part in parts],
        visibility = visibility,
    )
