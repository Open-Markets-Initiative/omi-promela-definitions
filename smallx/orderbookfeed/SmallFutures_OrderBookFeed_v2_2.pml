/*
 * The Small Exchange Order Book Feed
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
 *   - a field read in bits
 *   - a length prefix framing what follows
 *   - a block whose stated length holds more than its fields
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 8

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 8 bytes ------------------------------------------------- */

/* SmallX Sbe message header */
typedef MessageHeader {
  byte block_length[2];
  byte template_id[2];
  byte schema_id[2];
  byte version[2]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.block_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.schema_id[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.version[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.block_length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = (message_header_base + 2 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.schema_id[message_header_at] = (message_header_base + 4 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.version[message_header_at] = (message_header_base + 6 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 8 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.block_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.template_id[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.schema_id[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.version[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 8 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.block_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.schema_id[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.version[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.block_length[message_header_at] == message_header_written.block_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.template_id[message_header_at] == message_header_written.template_id[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.schema_id[message_header_at] == message_header_written.schema_id[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.version[message_header_at] == message_header_written.version[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Group Dimension: 3 bytes ------------------------------------------------ */

/* GroupDimension */
typedef GroupDimension {
  byte block_length[2];
  byte num_in_group
};

int group_dimension_at;

/* every byte of Group Dimension set to one value */
inline fill_group_dimension(group_dimension_record, group_dimension_value) {
  group_dimension_at = 0;
  do
  :: group_dimension_at < 2 -> group_dimension_record.block_length[group_dimension_at] = group_dimension_value; group_dimension_at = group_dimension_at + 1
  :: else -> break
  od;
  group_dimension_record.num_in_group = group_dimension_value;
  skip
}

/* each byte of Group Dimension set to where it lies, so a field read out of place says so */
inline ramp_group_dimension(group_dimension_record, group_dimension_base) {
  group_dimension_at = 0;
  do
  :: group_dimension_at < 2 -> group_dimension_record.block_length[group_dimension_at] = (group_dimension_base + 0 + group_dimension_at + 1) % 256; group_dimension_at = group_dimension_at + 1
  :: else -> break
  od;
  group_dimension_record.num_in_group = (group_dimension_base + 2 + 1) % 256;
  skip
}

/* Group Dimension to the wire, 3 bytes from where the cursor stands */
inline encode_group_dimension(group_dimension_record) {
  group_dimension_at = 0;
  do
  :: group_dimension_at < 2 -> wire[at] = group_dimension_record.block_length[group_dimension_at]; at = at + 1; group_dimension_at = group_dimension_at + 1
  :: else -> break
  od;
  wire[at] = group_dimension_record.num_in_group; at = at + 1;
  skip
}

/* Group Dimension off the wire, 3 bytes from where the cursor stands */
inline decode_group_dimension(group_dimension_record) {
  group_dimension_at = 0;
  do
  :: group_dimension_at < 2 -> group_dimension_record.block_length[group_dimension_at] = wire[at]; at = at + 1; group_dimension_at = group_dimension_at + 1
  :: else -> break
  od;
  group_dimension_record.num_in_group = wire[at]; at = at + 1;
  skip
}

/* what was read of Group Dimension is what was written, byte for byte */
inline equal_group_dimension(group_dimension_read, group_dimension_written) {
  group_dimension_at = 0;
  do
  :: group_dimension_at < 2 -> assert(group_dimension_read.block_length[group_dimension_at] == group_dimension_written.block_length[group_dimension_at]); group_dimension_at = group_dimension_at + 1
  :: else -> break
  od;
  assert(group_dimension_read.num_in_group == group_dimension_written.num_in_group);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Message Header: encoded, read back, and compared */
proctype check_message_header() {
  MessageHeader message_header_sent;
  MessageHeader message_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_message_header(message_header_sent, 0)
  :: pattern == 1 -> fill_message_header(message_header_sent, 32)
  :: pattern == 2 -> fill_message_header(message_header_sent, 255)
  :: else -> ramp_message_header(message_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_message_header(message_header_sent);
    assert(at == 8);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 8);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Group Dimension: encoded, read back, and compared */
proctype check_group_dimension() {
  GroupDimension group_dimension_sent;
  GroupDimension group_dimension_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_group_dimension(group_dimension_sent, 0)
  :: pattern == 1 -> fill_group_dimension(group_dimension_sent, 32)
  :: pattern == 2 -> fill_group_dimension(group_dimension_sent, 255)
  :: else -> ramp_group_dimension(group_dimension_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_group_dimension(group_dimension_sent);
    assert(at == 3);
    at = 0;
    decode_group_dimension(group_dimension_got);
    assert(at == 3);
    equal_group_dimension(group_dimension_got, group_dimension_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_group_dimension()
  fi
}
