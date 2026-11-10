/*
 * National Stock Exchange of India Ltd Mtbt Order Book Snapshot Recovery
 *
 * Generated from the binary model. Every record is a run of fields, and spin checks the two
 * claims the model's rules call for: that encoding a record writes the bytes its fields say,
 * and that decoding those bytes gives the record back and consumes exactly what was written.
 *
 * A field is the bytes it occupies. Nothing is read as an integer: spin evaluates an int in
 * 32 bits, as TLC does, so a field wider than that has no range a checker could enumerate,
 * and bytes are exact at any width. No rule stated here depends on a value.
 *
 * Each record is checked at four patterns: every byte zero, every byte the space a text
 * field pads with, every byte with all bits set, and the ramp - each byte holding where it
 * lies, which is what catches a field written or read out of place.
 *
 * What this definition does not state, and the model does:
 *   - a Reassemble rule
 *   - a run counted by a field
 *   - a Composite rule
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 16

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Snapshot Header: 16 bytes ----------------------------------------------- */

/* Snapshot header has a size of 16 bytes */
typedef SnapshotHeader {
  byte trans_code[2];
  byte size[4];
  byte number_of_records[4];
  byte last_sequence_number[4];
  byte stream_id[2]
};

int snapshot_header_at;

/* every byte of Snapshot Header set to one value */
inline fill_snapshot_header(snapshot_header_record, snapshot_header_value) {
  snapshot_header_at = 0;
  do
  :: snapshot_header_at < 2 -> snapshot_header_record.trans_code[snapshot_header_at] = snapshot_header_value; snapshot_header_at = snapshot_header_at + 1
  :: else -> break
  od;
  snapshot_header_at = 0;
  do
  :: snapshot_header_at < 4 -> snapshot_header_record.size[snapshot_header_at] = snapshot_header_value; snapshot_header_at = snapshot_header_at + 1
  :: else -> break
  od;
  snapshot_header_at = 0;
  do
  :: snapshot_header_at < 4 -> snapshot_header_record.number_of_records[snapshot_header_at] = snapshot_header_value; snapshot_header_at = snapshot_header_at + 1
  :: else -> break
  od;
  snapshot_header_at = 0;
  do
  :: snapshot_header_at < 4 -> snapshot_header_record.last_sequence_number[snapshot_header_at] = snapshot_header_value; snapshot_header_at = snapshot_header_at + 1
  :: else -> break
  od;
  snapshot_header_at = 0;
  do
  :: snapshot_header_at < 2 -> snapshot_header_record.stream_id[snapshot_header_at] = snapshot_header_value; snapshot_header_at = snapshot_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Snapshot Header set to where it lies, so a field read out of place says so */
inline ramp_snapshot_header(snapshot_header_record, snapshot_header_base) {
  snapshot_header_at = 0;
  do
  :: snapshot_header_at < 2 -> snapshot_header_record.trans_code[snapshot_header_at] = (snapshot_header_base + 0 + snapshot_header_at + 1) % 256; snapshot_header_at = snapshot_header_at + 1
  :: else -> break
  od;
  snapshot_header_at = 0;
  do
  :: snapshot_header_at < 4 -> snapshot_header_record.size[snapshot_header_at] = (snapshot_header_base + 2 + snapshot_header_at + 1) % 256; snapshot_header_at = snapshot_header_at + 1
  :: else -> break
  od;
  snapshot_header_at = 0;
  do
  :: snapshot_header_at < 4 -> snapshot_header_record.number_of_records[snapshot_header_at] = (snapshot_header_base + 6 + snapshot_header_at + 1) % 256; snapshot_header_at = snapshot_header_at + 1
  :: else -> break
  od;
  snapshot_header_at = 0;
  do
  :: snapshot_header_at < 4 -> snapshot_header_record.last_sequence_number[snapshot_header_at] = (snapshot_header_base + 10 + snapshot_header_at + 1) % 256; snapshot_header_at = snapshot_header_at + 1
  :: else -> break
  od;
  snapshot_header_at = 0;
  do
  :: snapshot_header_at < 2 -> snapshot_header_record.stream_id[snapshot_header_at] = (snapshot_header_base + 14 + snapshot_header_at + 1) % 256; snapshot_header_at = snapshot_header_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Header to the wire, 16 bytes from where the cursor stands */
inline encode_snapshot_header(snapshot_header_record) {
  snapshot_header_at = 0;
  do
  :: snapshot_header_at < 2 -> wire[at] = snapshot_header_record.trans_code[snapshot_header_at]; at = at + 1; snapshot_header_at = snapshot_header_at + 1
  :: else -> break
  od;
  snapshot_header_at = 0;
  do
  :: snapshot_header_at < 4 -> wire[at] = snapshot_header_record.size[snapshot_header_at]; at = at + 1; snapshot_header_at = snapshot_header_at + 1
  :: else -> break
  od;
  snapshot_header_at = 0;
  do
  :: snapshot_header_at < 4 -> wire[at] = snapshot_header_record.number_of_records[snapshot_header_at]; at = at + 1; snapshot_header_at = snapshot_header_at + 1
  :: else -> break
  od;
  snapshot_header_at = 0;
  do
  :: snapshot_header_at < 4 -> wire[at] = snapshot_header_record.last_sequence_number[snapshot_header_at]; at = at + 1; snapshot_header_at = snapshot_header_at + 1
  :: else -> break
  od;
  snapshot_header_at = 0;
  do
  :: snapshot_header_at < 2 -> wire[at] = snapshot_header_record.stream_id[snapshot_header_at]; at = at + 1; snapshot_header_at = snapshot_header_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Header off the wire, 16 bytes from where the cursor stands */
inline decode_snapshot_header(snapshot_header_record) {
  snapshot_header_at = 0;
  do
  :: snapshot_header_at < 2 -> snapshot_header_record.trans_code[snapshot_header_at] = wire[at]; at = at + 1; snapshot_header_at = snapshot_header_at + 1
  :: else -> break
  od;
  snapshot_header_at = 0;
  do
  :: snapshot_header_at < 4 -> snapshot_header_record.size[snapshot_header_at] = wire[at]; at = at + 1; snapshot_header_at = snapshot_header_at + 1
  :: else -> break
  od;
  snapshot_header_at = 0;
  do
  :: snapshot_header_at < 4 -> snapshot_header_record.number_of_records[snapshot_header_at] = wire[at]; at = at + 1; snapshot_header_at = snapshot_header_at + 1
  :: else -> break
  od;
  snapshot_header_at = 0;
  do
  :: snapshot_header_at < 4 -> snapshot_header_record.last_sequence_number[snapshot_header_at] = wire[at]; at = at + 1; snapshot_header_at = snapshot_header_at + 1
  :: else -> break
  od;
  snapshot_header_at = 0;
  do
  :: snapshot_header_at < 2 -> snapshot_header_record.stream_id[snapshot_header_at] = wire[at]; at = at + 1; snapshot_header_at = snapshot_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Snapshot Header is what was written, byte for byte */
inline equal_snapshot_header(snapshot_header_read, snapshot_header_written) {
  snapshot_header_at = 0;
  do
  :: snapshot_header_at < 2 -> assert(snapshot_header_read.trans_code[snapshot_header_at] == snapshot_header_written.trans_code[snapshot_header_at]); snapshot_header_at = snapshot_header_at + 1
  :: else -> break
  od;
  snapshot_header_at = 0;
  do
  :: snapshot_header_at < 4 -> assert(snapshot_header_read.size[snapshot_header_at] == snapshot_header_written.size[snapshot_header_at]); snapshot_header_at = snapshot_header_at + 1
  :: else -> break
  od;
  snapshot_header_at = 0;
  do
  :: snapshot_header_at < 4 -> assert(snapshot_header_read.number_of_records[snapshot_header_at] == snapshot_header_written.number_of_records[snapshot_header_at]); snapshot_header_at = snapshot_header_at + 1
  :: else -> break
  od;
  snapshot_header_at = 0;
  do
  :: snapshot_header_at < 4 -> assert(snapshot_header_read.last_sequence_number[snapshot_header_at] == snapshot_header_written.last_sequence_number[snapshot_header_at]); snapshot_header_at = snapshot_header_at + 1
  :: else -> break
  od;
  snapshot_header_at = 0;
  do
  :: snapshot_header_at < 2 -> assert(snapshot_header_read.stream_id[snapshot_header_at] == snapshot_header_written.stream_id[snapshot_header_at]); snapshot_header_at = snapshot_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Snapshot Header: encoded, read back, and compared */
proctype check_snapshot_header() {
  SnapshotHeader snapshot_header_sent;
  SnapshotHeader snapshot_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_snapshot_header(snapshot_header_sent, 0)
  :: pattern == 1 -> fill_snapshot_header(snapshot_header_sent, 32)
  :: pattern == 2 -> fill_snapshot_header(snapshot_header_sent, 255)
  :: else -> ramp_snapshot_header(snapshot_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_snapshot_header(snapshot_header_sent);
    assert(at == 16);
    at = 0;
    decode_snapshot_header(snapshot_header_got);
    assert(at == 16);
    equal_snapshot_header(snapshot_header_got, snapshot_header_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_snapshot_header()
  fi
}
