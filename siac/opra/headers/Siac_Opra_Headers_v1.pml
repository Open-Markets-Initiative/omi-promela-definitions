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
 *   - a Integrity rule
 *   - a run counted by a field
 *   - a length prefix framing what follows
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 10

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
  :: run check_control_message()
  fi
}
