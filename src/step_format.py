""" Small utility to convert .step files into other cadquery formats. """

import cadquery as cq
from absl import app, flags

FLAGS = flags.FLAGS

flags.DEFINE_string('input', '', 'Input path')
flags.DEFINE_string('output', '', 'Output path.')
flags.DEFINE_enum('format', 'stl', ['dxf', 'stl', 'svg'],
                  'Type of output to generate.')


def main(argv):
    shape = cq.Workplane('XY').add(
        cq.importers.importShape(cq.exporters.ExportTypes.STEP, FLAGS.input))

    if FLAGS.format == "dxf":
        cq.exporters.export(w=shape, fname=FLAGS.output, exportType='DXF')
    elif FLAGS.format == "stl":
        cq.exporters.export(w=shape, fname=FLAGS.output, exportType='STL')
    elif FLAGS.format == "svg":
        # This is just a quick preview, probably not all that useful.
        cq.exporters.export(w=shape,
                            fname=FLAGS.output,
                            exportType='SVG',
                            opt={
                                "width": 1000,
                                "height": 600,
                                "projectionDir": (1.75, -1.7, 6),
                                "showHidden": False
                            })


if __name__ == "__main__":
    app.run(main)
