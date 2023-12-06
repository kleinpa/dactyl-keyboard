# A Dactyl Keyboard

This is a parameterized, split-hand, concave, columnar, ergonomic keyboard within the Dactyl family.

This is a fork of:

- [joshreve's Python Dactyl-Manuform](https://github.com/joshreve/dactyl-keyboard) by Joshua Shreve
- [Dactyl-Manuform](https://github.com/tshort/dactyl-keyboard) by Tom Short
- [Dactyl](https://github.com/adereth/dactyl-keyboard) by Matthew Adereth

![dactyl](./resources/peterklein_dactyl.svg)

## Windows

To work around path length limits on Windows, set `output_user_root` in `%USERPROFILE%\.bazelrc`:

```
startup --output_user_root=C:/bazel
```
