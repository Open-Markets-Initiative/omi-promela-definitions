# Agent Notes

Every file in this repository is generated from the Open Markets Initiative binary data
models. Editing one here is lost on the next generation: the change belongs in the generator
or in the model it reads.

## What is here

- `<organization>/<division>/<protocol>/<Name>.pml` — one Promela model per protocol
  framing: a typedef per record, an encoder, a decoder, and a process that checks the two
  agree. Each model is self contained, so spin reads one without reading any other.
- `check.sh`, `Makefile` — what a check runs.

## Checking it

```sh
sh ./check.sh                      # every definition
sh ./check.sh nasdaq               # the ones under a directory
sh ./check.sh path/to/Model.pml    # one
```

Spin writes its verifier into the working directory as `pan.c`, whatever the model was
called, so `check.sh` checks each model in a directory of its own. Two checked at once in
one directory would overwrite each other's verifier.

A definition that does not check is a generator defect, not a file to patch.

## What a check here claims

For each record: that encoding it writes exactly the bytes its fields say, and that decoding
those bytes gives the record back, byte for byte, consuming exactly what was written.

Each record is checked at four patterns — every byte zero, every byte `32` (the space a text
field pads with), every byte `255`, and the ramp, where each byte holds the position it lies
at. The ramp is the one that matters most: a record filled with a single value says nothing
about the order of its fields, because swapping two of equal width leaves every byte as it
was. Under the ramp a field written or read out of place holds a value that says so.

A field is the bytes it occupies. Nothing is read as an integer: spin evaluates an `int` in
32 bits, so a field wider than that has no range a checker could enumerate, and bytes are
exact at any width.

A definition's header says what of its model it does **not** state — the framing, the
dispatch, a counted run — so nothing here is read as a claim about a whole packet.

## The same protocols, elsewhere

The Open Markets Initiative provides protocol definitions in several formats:

- [Kaitai Struct Definitions][Kaitai.Definitions.Repository] — Cross language binary parsers with the kaitai struct compiler
- [DFDL Definitions][Dfdl.Definitions.Repository] — Declarative DFDL schemas for cross language parsing
- [P4 Definitions][P4.Definitions.Repository] — P4 programs for software and hardware data planes
- [Spicy Definitions][Spicy.Definitions.Repository] — Declarative Spicy grammars for the spicy toolchain and the zeek network security monitor
- [Lean Definitions][Lean.Definitions.Repository] — Lean 4 definitions with machine checked encode and decode proofs
- [Rocq Definitions][Rocq.Definitions.Repository] — Rocq Prover definitions whose encode and decode proofs the prover checks
- [TLA+ Definitions][Tla.Definitions.Repository] — TLA+ modules whose encode and decode are model checked with TLC
- [FIX Dictionaries][Fix.Dictionaries.Repository] — QuickFIX format xml data dictionaries, one per FIX version
- [Xml Specifications][Xml.Specifications.Repository] — Formatted exchange specification xmls

[Kaitai.Definitions.Repository]: https://github.com/Open-Markets-Initiative/omi-kaitai-struct-definitions "Omi Kaitai Struct Definitions"
[Dfdl.Definitions.Repository]: https://github.com/Open-Markets-Initiative/omi-dfdl-definitions "Omi DFDL Definitions"
[P4.Definitions.Repository]: https://github.com/Open-Markets-Initiative/omi-p4-definitions "Omi P4 Definitions"
[Spicy.Definitions.Repository]: https://github.com/Open-Markets-Initiative/omi-spicy-definitions "Omi Spicy Definitions"
[Lean.Definitions.Repository]: https://github.com/Open-Markets-Initiative/omi-lean4-definitions "Omi Lean Definitions"
[Rocq.Definitions.Repository]: https://github.com/Open-Markets-Initiative/omi-rocq-definitions "Omi Rocq Definitions"
[Tla.Definitions.Repository]: https://github.com/Open-Markets-Initiative/omi-tlaplus-definitions "Omi TLA+ Definitions"
[Fix.Dictionaries.Repository]: https://github.com/Open-Markets-Initiative/omi-fix-dictionaries "Omi FIX Dictionaries"
[Xml.Specifications.Repository]: https://github.com/Open-Markets-Initiative/omi-xml-specifications "Omi Xml Specifications"
