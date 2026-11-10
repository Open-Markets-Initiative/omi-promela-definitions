/*
 * The Securities Industry Automation Corporation Headers
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
 *   - a run counted by a field
 *   - a length prefix framing what follows
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 21

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Block Timestamp: 8 bytes ------------------------------------------------ */

/* Opra packet timestamp */
typedef BlockTimestamp {
  byte seconds[4];
  byte nanoseconds[4]
};

int block_timestamp_at;

/* every byte of Block Timestamp set to one value */
inline fill_block_timestamp(block_timestamp_record, block_timestamp_value) {
  block_timestamp_at = 0;
  do
  :: block_timestamp_at < 4 -> block_timestamp_record.seconds[block_timestamp_at] = block_timestamp_value; block_timestamp_at = block_timestamp_at + 1
  :: else -> break
  od;
  block_timestamp_at = 0;
  do
  :: block_timestamp_at < 4 -> block_timestamp_record.nanoseconds[block_timestamp_at] = block_timestamp_value; block_timestamp_at = block_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Block Timestamp set to where it lies, so a field read out of place says so */
inline ramp_block_timestamp(block_timestamp_record, block_timestamp_base) {
  block_timestamp_at = 0;
  do
  :: block_timestamp_at < 4 -> block_timestamp_record.seconds[block_timestamp_at] = (block_timestamp_base + 0 + block_timestamp_at + 1) % 256; block_timestamp_at = block_timestamp_at + 1
  :: else -> break
  od;
  block_timestamp_at = 0;
  do
  :: block_timestamp_at < 4 -> block_timestamp_record.nanoseconds[block_timestamp_at] = (block_timestamp_base + 4 + block_timestamp_at + 1) % 256; block_timestamp_at = block_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* Block Timestamp to the wire, 8 bytes from where the cursor stands */
inline encode_block_timestamp(block_timestamp_record) {
  block_timestamp_at = 0;
  do
  :: block_timestamp_at < 4 -> wire[at] = block_timestamp_record.seconds[block_timestamp_at]; at = at + 1; block_timestamp_at = block_timestamp_at + 1
  :: else -> break
  od;
  block_timestamp_at = 0;
  do
  :: block_timestamp_at < 4 -> wire[at] = block_timestamp_record.nanoseconds[block_timestamp_at]; at = at + 1; block_timestamp_at = block_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* Block Timestamp off the wire, 8 bytes from where the cursor stands */
inline decode_block_timestamp(block_timestamp_record) {
  block_timestamp_at = 0;
  do
  :: block_timestamp_at < 4 -> block_timestamp_record.seconds[block_timestamp_at] = wire[at]; at = at + 1; block_timestamp_at = block_timestamp_at + 1
  :: else -> break
  od;
  block_timestamp_at = 0;
  do
  :: block_timestamp_at < 4 -> block_timestamp_record.nanoseconds[block_timestamp_at] = wire[at]; at = at + 1; block_timestamp_at = block_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Block Timestamp is what was written, byte for byte */
inline equal_block_timestamp(block_timestamp_read, block_timestamp_written) {
  block_timestamp_at = 0;
  do
  :: block_timestamp_at < 4 -> assert(block_timestamp_read.seconds[block_timestamp_at] == block_timestamp_written.seconds[block_timestamp_at]); block_timestamp_at = block_timestamp_at + 1
  :: else -> break
  od;
  block_timestamp_at = 0;
  do
  :: block_timestamp_at < 4 -> assert(block_timestamp_read.nanoseconds[block_timestamp_at] == block_timestamp_written.nanoseconds[block_timestamp_at]); block_timestamp_at = block_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Block Header: 21 bytes -------------------------------------------------- */

/* Opra packet header */
typedef BlockHeader {
  byte version;
  byte block_size[2];
  byte data_feed_indicator;
  byte retransmission_indicator;
  byte session_indicator;
  byte block_sequence_number[4];
  byte messages_in_block;
  BlockTimestamp block_timestamp;
  byte block_checksum[2]
};

int block_header_at;

/* every byte of Block Header set to one value */
inline fill_block_header(block_header_record, block_header_value) {
  block_header_record.version = block_header_value;
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_size[block_header_at] = block_header_value; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.data_feed_indicator = block_header_value;
  block_header_record.retransmission_indicator = block_header_value;
  block_header_record.session_indicator = block_header_value;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.block_sequence_number[block_header_at] = block_header_value; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.messages_in_block = block_header_value;
  fill_block_timestamp(block_header_record.block_timestamp, block_header_value);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_checksum[block_header_at] = block_header_value; block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Block Header set to where it lies, so a field read out of place says so */
inline ramp_block_header(block_header_record, block_header_base) {
  block_header_record.version = (block_header_base + 0 + 1) % 256;
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_size[block_header_at] = (block_header_base + 1 + block_header_at + 1) % 256; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.data_feed_indicator = (block_header_base + 3 + 1) % 256;
  block_header_record.retransmission_indicator = (block_header_base + 4 + 1) % 256;
  block_header_record.session_indicator = (block_header_base + 5 + 1) % 256;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.block_sequence_number[block_header_at] = (block_header_base + 6 + block_header_at + 1) % 256; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.messages_in_block = (block_header_base + 10 + 1) % 256;
  ramp_block_timestamp(block_header_record.block_timestamp, block_header_base + 11);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_checksum[block_header_at] = (block_header_base + 19 + block_header_at + 1) % 256; block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* Block Header to the wire, 21 bytes from where the cursor stands */
inline encode_block_header(block_header_record) {
  wire[at] = block_header_record.version; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 2 -> wire[at] = block_header_record.block_size[block_header_at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  wire[at] = block_header_record.data_feed_indicator; at = at + 1;
  wire[at] = block_header_record.retransmission_indicator; at = at + 1;
  wire[at] = block_header_record.session_indicator; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> wire[at] = block_header_record.block_sequence_number[block_header_at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  wire[at] = block_header_record.messages_in_block; at = at + 1;
  encode_block_timestamp(block_header_record.block_timestamp);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> wire[at] = block_header_record.block_checksum[block_header_at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* Block Header off the wire, 21 bytes from where the cursor stands */
inline decode_block_header(block_header_record) {
  block_header_record.version = wire[at]; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_size[block_header_at] = wire[at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.data_feed_indicator = wire[at]; at = at + 1;
  block_header_record.retransmission_indicator = wire[at]; at = at + 1;
  block_header_record.session_indicator = wire[at]; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.block_sequence_number[block_header_at] = wire[at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.messages_in_block = wire[at]; at = at + 1;
  decode_block_timestamp(block_header_record.block_timestamp);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_checksum[block_header_at] = wire[at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Block Header is what was written, byte for byte */
inline equal_block_header(block_header_read, block_header_written) {
  assert(block_header_read.version == block_header_written.version);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> assert(block_header_read.block_size[block_header_at] == block_header_written.block_size[block_header_at]); block_header_at = block_header_at + 1
  :: else -> break
  od;
  assert(block_header_read.data_feed_indicator == block_header_written.data_feed_indicator);
  assert(block_header_read.retransmission_indicator == block_header_written.retransmission_indicator);
  assert(block_header_read.session_indicator == block_header_written.session_indicator);
  block_header_at = 0;
  do
  :: block_header_at < 4 -> assert(block_header_read.block_sequence_number[block_header_at] == block_header_written.block_sequence_number[block_header_at]); block_header_at = block_header_at + 1
  :: else -> break
  od;
  assert(block_header_read.messages_in_block == block_header_written.messages_in_block);
  equal_block_timestamp(block_header_read.block_timestamp, block_header_written.block_timestamp);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> assert(block_header_read.block_checksum[block_header_at] == block_header_written.block_checksum[block_header_at]); block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Control Message: 10 bytes ----------------------------------------------- */

/* Control message */
typedef ControlMessage {
  byte control_message_type;
  byte message_indicator;
  byte transaction_id[4];
  byte participant_reference_number[4]
};

int control_message_at;

/* every byte of Control Message set to one value */
inline fill_control_message(control_message_record, control_message_value) {
  control_message_record.control_message_type = control_message_value;
  control_message_record.message_indicator = control_message_value;
  control_message_at = 0;
  do
  :: control_message_at < 4 -> control_message_record.transaction_id[control_message_at] = control_message_value; control_message_at = control_message_at + 1
  :: else -> break
  od;
  control_message_at = 0;
  do
  :: control_message_at < 4 -> control_message_record.participant_reference_number[control_message_at] = control_message_value; control_message_at = control_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Control Message set to where it lies, so a field read out of place says so */
inline ramp_control_message(control_message_record, control_message_base) {
  control_message_record.control_message_type = (control_message_base + 0 + 1) % 256;
  control_message_record.message_indicator = (control_message_base + 1 + 1) % 256;
  control_message_at = 0;
  do
  :: control_message_at < 4 -> control_message_record.transaction_id[control_message_at] = (control_message_base + 2 + control_message_at + 1) % 256; control_message_at = control_message_at + 1
  :: else -> break
  od;
  control_message_at = 0;
  do
  :: control_message_at < 4 -> control_message_record.participant_reference_number[control_message_at] = (control_message_base + 6 + control_message_at + 1) % 256; control_message_at = control_message_at + 1
  :: else -> break
  od;
  skip
}

/* Control Message to the wire, 10 bytes from where the cursor stands */
inline encode_control_message(control_message_record) {
  wire[at] = control_message_record.control_message_type; at = at + 1;
  wire[at] = control_message_record.message_indicator; at = at + 1;
  control_message_at = 0;
  do
  :: control_message_at < 4 -> wire[at] = control_message_record.transaction_id[control_message_at]; at = at + 1; control_message_at = control_message_at + 1
  :: else -> break
  od;
  control_message_at = 0;
  do
  :: control_message_at < 4 -> wire[at] = control_message_record.participant_reference_number[control_message_at]; at = at + 1; control_message_at = control_message_at + 1
  :: else -> break
  od;
  skip
}

/* Control Message off the wire, 10 bytes from where the cursor stands */
inline decode_control_message(control_message_record) {
  control_message_record.control_message_type = wire[at]; at = at + 1;
  control_message_record.message_indicator = wire[at]; at = at + 1;
  control_message_at = 0;
  do
  :: control_message_at < 4 -> control_message_record.transaction_id[control_message_at] = wire[at]; at = at + 1; control_message_at = control_message_at + 1
  :: else -> break
  od;
  control_message_at = 0;
  do
  :: control_message_at < 4 -> control_message_record.participant_reference_number[control_message_at] = wire[at]; at = at + 1; control_message_at = control_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Control Message is what was written, byte for byte */
inline equal_control_message(control_message_read, control_message_written) {
  assert(control_message_read.control_message_type == control_message_written.control_message_type);
  assert(control_message_read.message_indicator == control_message_written.message_indicator);
  control_message_at = 0;
  do
  :: control_message_at < 4 -> assert(control_message_read.transaction_id[control_message_at] == control_message_written.transaction_id[control_message_at]); control_message_at = control_message_at + 1
  :: else -> break
  od;
  control_message_at = 0;
  do
  :: control_message_at < 4 -> assert(control_message_read.participant_reference_number[control_message_at] == control_message_written.participant_reference_number[control_message_at]); control_message_at = control_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Block Timestamp: encoded, read back, and compared */
proctype check_block_timestamp() {
  BlockTimestamp block_timestamp_sent;
  BlockTimestamp block_timestamp_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_block_timestamp(block_timestamp_sent, 0)
  :: pattern == 1 -> fill_block_timestamp(block_timestamp_sent, 32)
  :: pattern == 2 -> fill_block_timestamp(block_timestamp_sent, 255)
  :: else -> ramp_block_timestamp(block_timestamp_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_block_timestamp(block_timestamp_sent);
    assert(at == 8);
    at = 0;
    decode_block_timestamp(block_timestamp_got);
    assert(at == 8);
    equal_block_timestamp(block_timestamp_got, block_timestamp_sent)
  }
}

/* Block Header: encoded, read back, and compared */
proctype check_block_header() {
  BlockHeader block_header_sent;
  BlockHeader block_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_block_header(block_header_sent, 0)
  :: pattern == 1 -> fill_block_header(block_header_sent, 32)
  :: pattern == 2 -> fill_block_header(block_header_sent, 255)
  :: else -> ramp_block_header(block_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_block_header(block_header_sent);
    assert(at == 21);
    at = 0;
    decode_block_header(block_header_got);
    assert(at == 21);
    equal_block_header(block_header_got, block_header_sent)
  }
}

/* Control Message: encoded, read back, and compared */
proctype check_control_message() {
  ControlMessage control_message_sent;
  ControlMessage control_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_control_message(control_message_sent, 0)
  :: pattern == 1 -> fill_control_message(control_message_sent, 32)
  :: pattern == 2 -> fill_control_message(control_message_sent, 255)
  :: else -> ramp_control_message(control_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_control_message(control_message_sent);
    assert(at == 10);
    at = 0;
    decode_control_message(control_message_got);
    assert(at == 10);
    equal_control_message(control_message_got, control_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_block_timestamp()
  :: run check_block_header()
  :: run check_control_message()
  fi
}
