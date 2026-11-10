/*
 * The Securities Industry Automation Corporation Output
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
 *   - the dispatch that chooses a message by its type
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 184

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Sip Block Timestamp: 8 bytes -------------------------------------------- */

/* Sip Block Timestamp */
typedef SipBlockTimestamp {
  byte seconds[4];
  byte nanoseconds[4]
};

int sip_block_timestamp_at;

/* every byte of Sip Block Timestamp set to one value */
inline fill_sip_block_timestamp(sip_block_timestamp_record, sip_block_timestamp_value) {
  sip_block_timestamp_at = 0;
  do
  :: sip_block_timestamp_at < 4 -> sip_block_timestamp_record.seconds[sip_block_timestamp_at] = sip_block_timestamp_value; sip_block_timestamp_at = sip_block_timestamp_at + 1
  :: else -> break
  od;
  sip_block_timestamp_at = 0;
  do
  :: sip_block_timestamp_at < 4 -> sip_block_timestamp_record.nanoseconds[sip_block_timestamp_at] = sip_block_timestamp_value; sip_block_timestamp_at = sip_block_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sip Block Timestamp set to where it lies, so a field read out of place says so */
inline ramp_sip_block_timestamp(sip_block_timestamp_record, sip_block_timestamp_base) {
  sip_block_timestamp_at = 0;
  do
  :: sip_block_timestamp_at < 4 -> sip_block_timestamp_record.seconds[sip_block_timestamp_at] = (sip_block_timestamp_base + 0 + sip_block_timestamp_at + 1) % 256; sip_block_timestamp_at = sip_block_timestamp_at + 1
  :: else -> break
  od;
  sip_block_timestamp_at = 0;
  do
  :: sip_block_timestamp_at < 4 -> sip_block_timestamp_record.nanoseconds[sip_block_timestamp_at] = (sip_block_timestamp_base + 4 + sip_block_timestamp_at + 1) % 256; sip_block_timestamp_at = sip_block_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* Sip Block Timestamp to the wire, 8 bytes from where the cursor stands */
inline encode_sip_block_timestamp(sip_block_timestamp_record) {
  sip_block_timestamp_at = 0;
  do
  :: sip_block_timestamp_at < 4 -> wire[at] = sip_block_timestamp_record.seconds[sip_block_timestamp_at]; at = at + 1; sip_block_timestamp_at = sip_block_timestamp_at + 1
  :: else -> break
  od;
  sip_block_timestamp_at = 0;
  do
  :: sip_block_timestamp_at < 4 -> wire[at] = sip_block_timestamp_record.nanoseconds[sip_block_timestamp_at]; at = at + 1; sip_block_timestamp_at = sip_block_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* Sip Block Timestamp off the wire, 8 bytes from where the cursor stands */
inline decode_sip_block_timestamp(sip_block_timestamp_record) {
  sip_block_timestamp_at = 0;
  do
  :: sip_block_timestamp_at < 4 -> sip_block_timestamp_record.seconds[sip_block_timestamp_at] = wire[at]; at = at + 1; sip_block_timestamp_at = sip_block_timestamp_at + 1
  :: else -> break
  od;
  sip_block_timestamp_at = 0;
  do
  :: sip_block_timestamp_at < 4 -> sip_block_timestamp_record.nanoseconds[sip_block_timestamp_at] = wire[at]; at = at + 1; sip_block_timestamp_at = sip_block_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sip Block Timestamp is what was written, byte for byte */
inline equal_sip_block_timestamp(sip_block_timestamp_read, sip_block_timestamp_written) {
  sip_block_timestamp_at = 0;
  do
  :: sip_block_timestamp_at < 4 -> assert(sip_block_timestamp_read.seconds[sip_block_timestamp_at] == sip_block_timestamp_written.seconds[sip_block_timestamp_at]); sip_block_timestamp_at = sip_block_timestamp_at + 1
  :: else -> break
  od;
  sip_block_timestamp_at = 0;
  do
  :: sip_block_timestamp_at < 4 -> assert(sip_block_timestamp_read.nanoseconds[sip_block_timestamp_at] == sip_block_timestamp_written.nanoseconds[sip_block_timestamp_at]); sip_block_timestamp_at = sip_block_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Block Header: 20 bytes -------------------------------------------------- */

/* Cta Output packet header */
typedef BlockHeader {
  byte version;
  byte block_size[2];
  byte data_feed_indicator;
  byte retransmission_indicator;
  byte block_sequence_number[4];
  byte messages_in_block;
  SipBlockTimestamp sip_block_timestamp;
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
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.block_sequence_number[block_header_at] = block_header_value; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.messages_in_block = block_header_value;
  fill_sip_block_timestamp(block_header_record.sip_block_timestamp, block_header_value);
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
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.block_sequence_number[block_header_at] = (block_header_base + 5 + block_header_at + 1) % 256; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.messages_in_block = (block_header_base + 9 + 1) % 256;
  ramp_sip_block_timestamp(block_header_record.sip_block_timestamp, block_header_base + 10);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_checksum[block_header_at] = (block_header_base + 18 + block_header_at + 1) % 256; block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* Block Header to the wire, 20 bytes from where the cursor stands */
inline encode_block_header(block_header_record) {
  wire[at] = block_header_record.version; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 2 -> wire[at] = block_header_record.block_size[block_header_at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  wire[at] = block_header_record.data_feed_indicator; at = at + 1;
  wire[at] = block_header_record.retransmission_indicator; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> wire[at] = block_header_record.block_sequence_number[block_header_at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  wire[at] = block_header_record.messages_in_block; at = at + 1;
  encode_sip_block_timestamp(block_header_record.sip_block_timestamp);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> wire[at] = block_header_record.block_checksum[block_header_at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* Block Header off the wire, 20 bytes from where the cursor stands */
inline decode_block_header(block_header_record) {
  block_header_record.version = wire[at]; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_size[block_header_at] = wire[at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.data_feed_indicator = wire[at]; at = at + 1;
  block_header_record.retransmission_indicator = wire[at]; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.block_sequence_number[block_header_at] = wire[at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.messages_in_block = wire[at]; at = at + 1;
  decode_sip_block_timestamp(block_header_record.sip_block_timestamp);
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
  block_header_at = 0;
  do
  :: block_header_at < 4 -> assert(block_header_read.block_sequence_number[block_header_at] == block_header_written.block_sequence_number[block_header_at]); block_header_at = block_header_at + 1
  :: else -> break
  od;
  assert(block_header_read.messages_in_block == block_header_written.messages_in_block);
  equal_sip_block_timestamp(block_header_read.sip_block_timestamp, block_header_written.sip_block_timestamp);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> assert(block_header_read.block_checksum[block_header_at] == block_header_written.block_checksum[block_header_at]); block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Timestamp 1: 8 bytes ---------------------------------------------------- */

/* Timestamp 1 */
typedef Timestamp1 {
  byte seconds[4];
  byte nanoseconds[4]
};

int timestamp1_at;

/* every byte of Timestamp 1 set to one value */
inline fill_timestamp1(timestamp1_record, timestamp1_value) {
  timestamp1_at = 0;
  do
  :: timestamp1_at < 4 -> timestamp1_record.seconds[timestamp1_at] = timestamp1_value; timestamp1_at = timestamp1_at + 1
  :: else -> break
  od;
  timestamp1_at = 0;
  do
  :: timestamp1_at < 4 -> timestamp1_record.nanoseconds[timestamp1_at] = timestamp1_value; timestamp1_at = timestamp1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Timestamp 1 set to where it lies, so a field read out of place says so */
inline ramp_timestamp1(timestamp1_record, timestamp1_base) {
  timestamp1_at = 0;
  do
  :: timestamp1_at < 4 -> timestamp1_record.seconds[timestamp1_at] = (timestamp1_base + 0 + timestamp1_at + 1) % 256; timestamp1_at = timestamp1_at + 1
  :: else -> break
  od;
  timestamp1_at = 0;
  do
  :: timestamp1_at < 4 -> timestamp1_record.nanoseconds[timestamp1_at] = (timestamp1_base + 4 + timestamp1_at + 1) % 256; timestamp1_at = timestamp1_at + 1
  :: else -> break
  od;
  skip
}

/* Timestamp 1 to the wire, 8 bytes from where the cursor stands */
inline encode_timestamp1(timestamp1_record) {
  timestamp1_at = 0;
  do
  :: timestamp1_at < 4 -> wire[at] = timestamp1_record.seconds[timestamp1_at]; at = at + 1; timestamp1_at = timestamp1_at + 1
  :: else -> break
  od;
  timestamp1_at = 0;
  do
  :: timestamp1_at < 4 -> wire[at] = timestamp1_record.nanoseconds[timestamp1_at]; at = at + 1; timestamp1_at = timestamp1_at + 1
  :: else -> break
  od;
  skip
}

/* Timestamp 1 off the wire, 8 bytes from where the cursor stands */
inline decode_timestamp1(timestamp1_record) {
  timestamp1_at = 0;
  do
  :: timestamp1_at < 4 -> timestamp1_record.seconds[timestamp1_at] = wire[at]; at = at + 1; timestamp1_at = timestamp1_at + 1
  :: else -> break
  od;
  timestamp1_at = 0;
  do
  :: timestamp1_at < 4 -> timestamp1_record.nanoseconds[timestamp1_at] = wire[at]; at = at + 1; timestamp1_at = timestamp1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Timestamp 1 is what was written, byte for byte */
inline equal_timestamp1(timestamp1_read, timestamp1_written) {
  timestamp1_at = 0;
  do
  :: timestamp1_at < 4 -> assert(timestamp1_read.seconds[timestamp1_at] == timestamp1_written.seconds[timestamp1_at]); timestamp1_at = timestamp1_at + 1
  :: else -> break
  od;
  timestamp1_at = 0;
  do
  :: timestamp1_at < 4 -> assert(timestamp1_read.nanoseconds[timestamp1_at] == timestamp1_written.nanoseconds[timestamp1_at]); timestamp1_at = timestamp1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Start Of End Of Day Summary Message: 22 bytes --------------------------- */

/* The Start of End of Day message signals the start of Consolidated End of Day Summary and Participant End of Day Summary message iterations */
typedef StartOfEndOfDaySummaryMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8]
};

int start_of_end_of_day_summary_message_at;

/* every byte of Start Of End Of Day Summary Message set to one value */
inline fill_start_of_end_of_day_summary_message(start_of_end_of_day_summary_message_record, start_of_end_of_day_summary_message_value) {
  start_of_end_of_day_summary_message_record.participant_id = start_of_end_of_day_summary_message_value;
  fill_timestamp1(start_of_end_of_day_summary_message_record.timestamp_1, start_of_end_of_day_summary_message_value);
  start_of_end_of_day_summary_message_record.message_id = start_of_end_of_day_summary_message_value;
  start_of_end_of_day_summary_message_at = 0;
  do
  :: start_of_end_of_day_summary_message_at < 4 -> start_of_end_of_day_summary_message_record.transaction_id[start_of_end_of_day_summary_message_at] = start_of_end_of_day_summary_message_value; start_of_end_of_day_summary_message_at = start_of_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  start_of_end_of_day_summary_message_at = 0;
  do
  :: start_of_end_of_day_summary_message_at < 8 -> start_of_end_of_day_summary_message_record.participant_reference_number[start_of_end_of_day_summary_message_at] = start_of_end_of_day_summary_message_value; start_of_end_of_day_summary_message_at = start_of_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Start Of End Of Day Summary Message set to where it lies, so a field read out of place says so */
inline ramp_start_of_end_of_day_summary_message(start_of_end_of_day_summary_message_record, start_of_end_of_day_summary_message_base) {
  start_of_end_of_day_summary_message_record.participant_id = (start_of_end_of_day_summary_message_base + 0 + 1) % 256;
  ramp_timestamp1(start_of_end_of_day_summary_message_record.timestamp_1, start_of_end_of_day_summary_message_base + 1);
  start_of_end_of_day_summary_message_record.message_id = (start_of_end_of_day_summary_message_base + 9 + 1) % 256;
  start_of_end_of_day_summary_message_at = 0;
  do
  :: start_of_end_of_day_summary_message_at < 4 -> start_of_end_of_day_summary_message_record.transaction_id[start_of_end_of_day_summary_message_at] = (start_of_end_of_day_summary_message_base + 10 + start_of_end_of_day_summary_message_at + 1) % 256; start_of_end_of_day_summary_message_at = start_of_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  start_of_end_of_day_summary_message_at = 0;
  do
  :: start_of_end_of_day_summary_message_at < 8 -> start_of_end_of_day_summary_message_record.participant_reference_number[start_of_end_of_day_summary_message_at] = (start_of_end_of_day_summary_message_base + 14 + start_of_end_of_day_summary_message_at + 1) % 256; start_of_end_of_day_summary_message_at = start_of_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of End Of Day Summary Message to the wire, 22 bytes from where the cursor stands */
inline encode_start_of_end_of_day_summary_message(start_of_end_of_day_summary_message_record) {
  wire[at] = start_of_end_of_day_summary_message_record.participant_id; at = at + 1;
  encode_timestamp1(start_of_end_of_day_summary_message_record.timestamp_1);
  wire[at] = start_of_end_of_day_summary_message_record.message_id; at = at + 1;
  start_of_end_of_day_summary_message_at = 0;
  do
  :: start_of_end_of_day_summary_message_at < 4 -> wire[at] = start_of_end_of_day_summary_message_record.transaction_id[start_of_end_of_day_summary_message_at]; at = at + 1; start_of_end_of_day_summary_message_at = start_of_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  start_of_end_of_day_summary_message_at = 0;
  do
  :: start_of_end_of_day_summary_message_at < 8 -> wire[at] = start_of_end_of_day_summary_message_record.participant_reference_number[start_of_end_of_day_summary_message_at]; at = at + 1; start_of_end_of_day_summary_message_at = start_of_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of End Of Day Summary Message off the wire, 22 bytes from where the cursor stands */
inline decode_start_of_end_of_day_summary_message(start_of_end_of_day_summary_message_record) {
  start_of_end_of_day_summary_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(start_of_end_of_day_summary_message_record.timestamp_1);
  start_of_end_of_day_summary_message_record.message_id = wire[at]; at = at + 1;
  start_of_end_of_day_summary_message_at = 0;
  do
  :: start_of_end_of_day_summary_message_at < 4 -> start_of_end_of_day_summary_message_record.transaction_id[start_of_end_of_day_summary_message_at] = wire[at]; at = at + 1; start_of_end_of_day_summary_message_at = start_of_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  start_of_end_of_day_summary_message_at = 0;
  do
  :: start_of_end_of_day_summary_message_at < 8 -> start_of_end_of_day_summary_message_record.participant_reference_number[start_of_end_of_day_summary_message_at] = wire[at]; at = at + 1; start_of_end_of_day_summary_message_at = start_of_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Start Of End Of Day Summary Message is what was written, byte for byte */
inline equal_start_of_end_of_day_summary_message(start_of_end_of_day_summary_message_read, start_of_end_of_day_summary_message_written) {
  assert(start_of_end_of_day_summary_message_read.participant_id == start_of_end_of_day_summary_message_written.participant_id);
  equal_timestamp1(start_of_end_of_day_summary_message_read.timestamp_1, start_of_end_of_day_summary_message_written.timestamp_1);
  assert(start_of_end_of_day_summary_message_read.message_id == start_of_end_of_day_summary_message_written.message_id);
  start_of_end_of_day_summary_message_at = 0;
  do
  :: start_of_end_of_day_summary_message_at < 4 -> assert(start_of_end_of_day_summary_message_read.transaction_id[start_of_end_of_day_summary_message_at] == start_of_end_of_day_summary_message_written.transaction_id[start_of_end_of_day_summary_message_at]); start_of_end_of_day_summary_message_at = start_of_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  start_of_end_of_day_summary_message_at = 0;
  do
  :: start_of_end_of_day_summary_message_at < 8 -> assert(start_of_end_of_day_summary_message_read.participant_reference_number[start_of_end_of_day_summary_message_at] == start_of_end_of_day_summary_message_written.participant_reference_number[start_of_end_of_day_summary_message_at]); start_of_end_of_day_summary_message_at = start_of_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of End Of Day Summary Message: 22 bytes ----------------------------- */

/* The End of End of Day message signals the end of Consolidated End of Day Summary and Participant End of Day Summary message iterations */
typedef EndOfEndOfDaySummaryMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8]
};

int end_of_end_of_day_summary_message_at;

/* every byte of End Of End Of Day Summary Message set to one value */
inline fill_end_of_end_of_day_summary_message(end_of_end_of_day_summary_message_record, end_of_end_of_day_summary_message_value) {
  end_of_end_of_day_summary_message_record.participant_id = end_of_end_of_day_summary_message_value;
  fill_timestamp1(end_of_end_of_day_summary_message_record.timestamp_1, end_of_end_of_day_summary_message_value);
  end_of_end_of_day_summary_message_record.message_id = end_of_end_of_day_summary_message_value;
  end_of_end_of_day_summary_message_at = 0;
  do
  :: end_of_end_of_day_summary_message_at < 4 -> end_of_end_of_day_summary_message_record.transaction_id[end_of_end_of_day_summary_message_at] = end_of_end_of_day_summary_message_value; end_of_end_of_day_summary_message_at = end_of_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  end_of_end_of_day_summary_message_at = 0;
  do
  :: end_of_end_of_day_summary_message_at < 8 -> end_of_end_of_day_summary_message_record.participant_reference_number[end_of_end_of_day_summary_message_at] = end_of_end_of_day_summary_message_value; end_of_end_of_day_summary_message_at = end_of_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of End Of Day Summary Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_end_of_day_summary_message(end_of_end_of_day_summary_message_record, end_of_end_of_day_summary_message_base) {
  end_of_end_of_day_summary_message_record.participant_id = (end_of_end_of_day_summary_message_base + 0 + 1) % 256;
  ramp_timestamp1(end_of_end_of_day_summary_message_record.timestamp_1, end_of_end_of_day_summary_message_base + 1);
  end_of_end_of_day_summary_message_record.message_id = (end_of_end_of_day_summary_message_base + 9 + 1) % 256;
  end_of_end_of_day_summary_message_at = 0;
  do
  :: end_of_end_of_day_summary_message_at < 4 -> end_of_end_of_day_summary_message_record.transaction_id[end_of_end_of_day_summary_message_at] = (end_of_end_of_day_summary_message_base + 10 + end_of_end_of_day_summary_message_at + 1) % 256; end_of_end_of_day_summary_message_at = end_of_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  end_of_end_of_day_summary_message_at = 0;
  do
  :: end_of_end_of_day_summary_message_at < 8 -> end_of_end_of_day_summary_message_record.participant_reference_number[end_of_end_of_day_summary_message_at] = (end_of_end_of_day_summary_message_base + 14 + end_of_end_of_day_summary_message_at + 1) % 256; end_of_end_of_day_summary_message_at = end_of_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of End Of Day Summary Message to the wire, 22 bytes from where the cursor stands */
inline encode_end_of_end_of_day_summary_message(end_of_end_of_day_summary_message_record) {
  wire[at] = end_of_end_of_day_summary_message_record.participant_id; at = at + 1;
  encode_timestamp1(end_of_end_of_day_summary_message_record.timestamp_1);
  wire[at] = end_of_end_of_day_summary_message_record.message_id; at = at + 1;
  end_of_end_of_day_summary_message_at = 0;
  do
  :: end_of_end_of_day_summary_message_at < 4 -> wire[at] = end_of_end_of_day_summary_message_record.transaction_id[end_of_end_of_day_summary_message_at]; at = at + 1; end_of_end_of_day_summary_message_at = end_of_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  end_of_end_of_day_summary_message_at = 0;
  do
  :: end_of_end_of_day_summary_message_at < 8 -> wire[at] = end_of_end_of_day_summary_message_record.participant_reference_number[end_of_end_of_day_summary_message_at]; at = at + 1; end_of_end_of_day_summary_message_at = end_of_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of End Of Day Summary Message off the wire, 22 bytes from where the cursor stands */
inline decode_end_of_end_of_day_summary_message(end_of_end_of_day_summary_message_record) {
  end_of_end_of_day_summary_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(end_of_end_of_day_summary_message_record.timestamp_1);
  end_of_end_of_day_summary_message_record.message_id = wire[at]; at = at + 1;
  end_of_end_of_day_summary_message_at = 0;
  do
  :: end_of_end_of_day_summary_message_at < 4 -> end_of_end_of_day_summary_message_record.transaction_id[end_of_end_of_day_summary_message_at] = wire[at]; at = at + 1; end_of_end_of_day_summary_message_at = end_of_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  end_of_end_of_day_summary_message_at = 0;
  do
  :: end_of_end_of_day_summary_message_at < 8 -> end_of_end_of_day_summary_message_record.participant_reference_number[end_of_end_of_day_summary_message_at] = wire[at]; at = at + 1; end_of_end_of_day_summary_message_at = end_of_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of End Of Day Summary Message is what was written, byte for byte */
inline equal_end_of_end_of_day_summary_message(end_of_end_of_day_summary_message_read, end_of_end_of_day_summary_message_written) {
  assert(end_of_end_of_day_summary_message_read.participant_id == end_of_end_of_day_summary_message_written.participant_id);
  equal_timestamp1(end_of_end_of_day_summary_message_read.timestamp_1, end_of_end_of_day_summary_message_written.timestamp_1);
  assert(end_of_end_of_day_summary_message_read.message_id == end_of_end_of_day_summary_message_written.message_id);
  end_of_end_of_day_summary_message_at = 0;
  do
  :: end_of_end_of_day_summary_message_at < 4 -> assert(end_of_end_of_day_summary_message_read.transaction_id[end_of_end_of_day_summary_message_at] == end_of_end_of_day_summary_message_written.transaction_id[end_of_end_of_day_summary_message_at]); end_of_end_of_day_summary_message_at = end_of_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  end_of_end_of_day_summary_message_at = 0;
  do
  :: end_of_end_of_day_summary_message_at < 8 -> assert(end_of_end_of_day_summary_message_read.participant_reference_number[end_of_end_of_day_summary_message_at] == end_of_end_of_day_summary_message_written.participant_reference_number[end_of_end_of_day_summary_message_at]); end_of_end_of_day_summary_message_at = end_of_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Start Of Start Of Day Summary Message: 22 bytes ------------------------- */

/* The Start of Start of Day message signals the end of Consolidated End of Day Summary and Participant End of Day Summary message iterations */
typedef StartOfStartOfDaySummaryMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8]
};

int start_of_start_of_day_summary_message_at;

/* every byte of Start Of Start Of Day Summary Message set to one value */
inline fill_start_of_start_of_day_summary_message(start_of_start_of_day_summary_message_record, start_of_start_of_day_summary_message_value) {
  start_of_start_of_day_summary_message_record.participant_id = start_of_start_of_day_summary_message_value;
  fill_timestamp1(start_of_start_of_day_summary_message_record.timestamp_1, start_of_start_of_day_summary_message_value);
  start_of_start_of_day_summary_message_record.message_id = start_of_start_of_day_summary_message_value;
  start_of_start_of_day_summary_message_at = 0;
  do
  :: start_of_start_of_day_summary_message_at < 4 -> start_of_start_of_day_summary_message_record.transaction_id[start_of_start_of_day_summary_message_at] = start_of_start_of_day_summary_message_value; start_of_start_of_day_summary_message_at = start_of_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  start_of_start_of_day_summary_message_at = 0;
  do
  :: start_of_start_of_day_summary_message_at < 8 -> start_of_start_of_day_summary_message_record.participant_reference_number[start_of_start_of_day_summary_message_at] = start_of_start_of_day_summary_message_value; start_of_start_of_day_summary_message_at = start_of_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Start Of Start Of Day Summary Message set to where it lies, so a field read out of place says so */
inline ramp_start_of_start_of_day_summary_message(start_of_start_of_day_summary_message_record, start_of_start_of_day_summary_message_base) {
  start_of_start_of_day_summary_message_record.participant_id = (start_of_start_of_day_summary_message_base + 0 + 1) % 256;
  ramp_timestamp1(start_of_start_of_day_summary_message_record.timestamp_1, start_of_start_of_day_summary_message_base + 1);
  start_of_start_of_day_summary_message_record.message_id = (start_of_start_of_day_summary_message_base + 9 + 1) % 256;
  start_of_start_of_day_summary_message_at = 0;
  do
  :: start_of_start_of_day_summary_message_at < 4 -> start_of_start_of_day_summary_message_record.transaction_id[start_of_start_of_day_summary_message_at] = (start_of_start_of_day_summary_message_base + 10 + start_of_start_of_day_summary_message_at + 1) % 256; start_of_start_of_day_summary_message_at = start_of_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  start_of_start_of_day_summary_message_at = 0;
  do
  :: start_of_start_of_day_summary_message_at < 8 -> start_of_start_of_day_summary_message_record.participant_reference_number[start_of_start_of_day_summary_message_at] = (start_of_start_of_day_summary_message_base + 14 + start_of_start_of_day_summary_message_at + 1) % 256; start_of_start_of_day_summary_message_at = start_of_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Start Of Day Summary Message to the wire, 22 bytes from where the cursor stands */
inline encode_start_of_start_of_day_summary_message(start_of_start_of_day_summary_message_record) {
  wire[at] = start_of_start_of_day_summary_message_record.participant_id; at = at + 1;
  encode_timestamp1(start_of_start_of_day_summary_message_record.timestamp_1);
  wire[at] = start_of_start_of_day_summary_message_record.message_id; at = at + 1;
  start_of_start_of_day_summary_message_at = 0;
  do
  :: start_of_start_of_day_summary_message_at < 4 -> wire[at] = start_of_start_of_day_summary_message_record.transaction_id[start_of_start_of_day_summary_message_at]; at = at + 1; start_of_start_of_day_summary_message_at = start_of_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  start_of_start_of_day_summary_message_at = 0;
  do
  :: start_of_start_of_day_summary_message_at < 8 -> wire[at] = start_of_start_of_day_summary_message_record.participant_reference_number[start_of_start_of_day_summary_message_at]; at = at + 1; start_of_start_of_day_summary_message_at = start_of_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Start Of Day Summary Message off the wire, 22 bytes from where the cursor stands */
inline decode_start_of_start_of_day_summary_message(start_of_start_of_day_summary_message_record) {
  start_of_start_of_day_summary_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(start_of_start_of_day_summary_message_record.timestamp_1);
  start_of_start_of_day_summary_message_record.message_id = wire[at]; at = at + 1;
  start_of_start_of_day_summary_message_at = 0;
  do
  :: start_of_start_of_day_summary_message_at < 4 -> start_of_start_of_day_summary_message_record.transaction_id[start_of_start_of_day_summary_message_at] = wire[at]; at = at + 1; start_of_start_of_day_summary_message_at = start_of_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  start_of_start_of_day_summary_message_at = 0;
  do
  :: start_of_start_of_day_summary_message_at < 8 -> start_of_start_of_day_summary_message_record.participant_reference_number[start_of_start_of_day_summary_message_at] = wire[at]; at = at + 1; start_of_start_of_day_summary_message_at = start_of_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Start Of Start Of Day Summary Message is what was written, byte for byte */
inline equal_start_of_start_of_day_summary_message(start_of_start_of_day_summary_message_read, start_of_start_of_day_summary_message_written) {
  assert(start_of_start_of_day_summary_message_read.participant_id == start_of_start_of_day_summary_message_written.participant_id);
  equal_timestamp1(start_of_start_of_day_summary_message_read.timestamp_1, start_of_start_of_day_summary_message_written.timestamp_1);
  assert(start_of_start_of_day_summary_message_read.message_id == start_of_start_of_day_summary_message_written.message_id);
  start_of_start_of_day_summary_message_at = 0;
  do
  :: start_of_start_of_day_summary_message_at < 4 -> assert(start_of_start_of_day_summary_message_read.transaction_id[start_of_start_of_day_summary_message_at] == start_of_start_of_day_summary_message_written.transaction_id[start_of_start_of_day_summary_message_at]); start_of_start_of_day_summary_message_at = start_of_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  start_of_start_of_day_summary_message_at = 0;
  do
  :: start_of_start_of_day_summary_message_at < 8 -> assert(start_of_start_of_day_summary_message_read.participant_reference_number[start_of_start_of_day_summary_message_at] == start_of_start_of_day_summary_message_written.participant_reference_number[start_of_start_of_day_summary_message_at]); start_of_start_of_day_summary_message_at = start_of_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Start Of Day Summary Message: 22 bytes --------------------------- */

/* The End of Start of Day message signals the start of Start of Day Summary message iterations */
typedef EndOfStartOfDaySummaryMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8]
};

int end_of_start_of_day_summary_message_at;

/* every byte of End Of Start Of Day Summary Message set to one value */
inline fill_end_of_start_of_day_summary_message(end_of_start_of_day_summary_message_record, end_of_start_of_day_summary_message_value) {
  end_of_start_of_day_summary_message_record.participant_id = end_of_start_of_day_summary_message_value;
  fill_timestamp1(end_of_start_of_day_summary_message_record.timestamp_1, end_of_start_of_day_summary_message_value);
  end_of_start_of_day_summary_message_record.message_id = end_of_start_of_day_summary_message_value;
  end_of_start_of_day_summary_message_at = 0;
  do
  :: end_of_start_of_day_summary_message_at < 4 -> end_of_start_of_day_summary_message_record.transaction_id[end_of_start_of_day_summary_message_at] = end_of_start_of_day_summary_message_value; end_of_start_of_day_summary_message_at = end_of_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  end_of_start_of_day_summary_message_at = 0;
  do
  :: end_of_start_of_day_summary_message_at < 8 -> end_of_start_of_day_summary_message_record.participant_reference_number[end_of_start_of_day_summary_message_at] = end_of_start_of_day_summary_message_value; end_of_start_of_day_summary_message_at = end_of_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Start Of Day Summary Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_start_of_day_summary_message(end_of_start_of_day_summary_message_record, end_of_start_of_day_summary_message_base) {
  end_of_start_of_day_summary_message_record.participant_id = (end_of_start_of_day_summary_message_base + 0 + 1) % 256;
  ramp_timestamp1(end_of_start_of_day_summary_message_record.timestamp_1, end_of_start_of_day_summary_message_base + 1);
  end_of_start_of_day_summary_message_record.message_id = (end_of_start_of_day_summary_message_base + 9 + 1) % 256;
  end_of_start_of_day_summary_message_at = 0;
  do
  :: end_of_start_of_day_summary_message_at < 4 -> end_of_start_of_day_summary_message_record.transaction_id[end_of_start_of_day_summary_message_at] = (end_of_start_of_day_summary_message_base + 10 + end_of_start_of_day_summary_message_at + 1) % 256; end_of_start_of_day_summary_message_at = end_of_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  end_of_start_of_day_summary_message_at = 0;
  do
  :: end_of_start_of_day_summary_message_at < 8 -> end_of_start_of_day_summary_message_record.participant_reference_number[end_of_start_of_day_summary_message_at] = (end_of_start_of_day_summary_message_base + 14 + end_of_start_of_day_summary_message_at + 1) % 256; end_of_start_of_day_summary_message_at = end_of_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Start Of Day Summary Message to the wire, 22 bytes from where the cursor stands */
inline encode_end_of_start_of_day_summary_message(end_of_start_of_day_summary_message_record) {
  wire[at] = end_of_start_of_day_summary_message_record.participant_id; at = at + 1;
  encode_timestamp1(end_of_start_of_day_summary_message_record.timestamp_1);
  wire[at] = end_of_start_of_day_summary_message_record.message_id; at = at + 1;
  end_of_start_of_day_summary_message_at = 0;
  do
  :: end_of_start_of_day_summary_message_at < 4 -> wire[at] = end_of_start_of_day_summary_message_record.transaction_id[end_of_start_of_day_summary_message_at]; at = at + 1; end_of_start_of_day_summary_message_at = end_of_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  end_of_start_of_day_summary_message_at = 0;
  do
  :: end_of_start_of_day_summary_message_at < 8 -> wire[at] = end_of_start_of_day_summary_message_record.participant_reference_number[end_of_start_of_day_summary_message_at]; at = at + 1; end_of_start_of_day_summary_message_at = end_of_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Start Of Day Summary Message off the wire, 22 bytes from where the cursor stands */
inline decode_end_of_start_of_day_summary_message(end_of_start_of_day_summary_message_record) {
  end_of_start_of_day_summary_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(end_of_start_of_day_summary_message_record.timestamp_1);
  end_of_start_of_day_summary_message_record.message_id = wire[at]; at = at + 1;
  end_of_start_of_day_summary_message_at = 0;
  do
  :: end_of_start_of_day_summary_message_at < 4 -> end_of_start_of_day_summary_message_record.transaction_id[end_of_start_of_day_summary_message_at] = wire[at]; at = at + 1; end_of_start_of_day_summary_message_at = end_of_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  end_of_start_of_day_summary_message_at = 0;
  do
  :: end_of_start_of_day_summary_message_at < 8 -> end_of_start_of_day_summary_message_record.participant_reference_number[end_of_start_of_day_summary_message_at] = wire[at]; at = at + 1; end_of_start_of_day_summary_message_at = end_of_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Start Of Day Summary Message is what was written, byte for byte */
inline equal_end_of_start_of_day_summary_message(end_of_start_of_day_summary_message_read, end_of_start_of_day_summary_message_written) {
  assert(end_of_start_of_day_summary_message_read.participant_id == end_of_start_of_day_summary_message_written.participant_id);
  equal_timestamp1(end_of_start_of_day_summary_message_read.timestamp_1, end_of_start_of_day_summary_message_written.timestamp_1);
  assert(end_of_start_of_day_summary_message_read.message_id == end_of_start_of_day_summary_message_written.message_id);
  end_of_start_of_day_summary_message_at = 0;
  do
  :: end_of_start_of_day_summary_message_at < 4 -> assert(end_of_start_of_day_summary_message_read.transaction_id[end_of_start_of_day_summary_message_at] == end_of_start_of_day_summary_message_written.transaction_id[end_of_start_of_day_summary_message_at]); end_of_start_of_day_summary_message_at = end_of_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  end_of_start_of_day_summary_message_at = 0;
  do
  :: end_of_start_of_day_summary_message_at < 8 -> assert(end_of_start_of_day_summary_message_read.participant_reference_number[end_of_start_of_day_summary_message_at] == end_of_start_of_day_summary_message_written.participant_reference_number[end_of_start_of_day_summary_message_at]); end_of_start_of_day_summary_message_at = end_of_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Start Of Day Message: 22 bytes ------------------------------------------ */

/* The Start of Day message signals the start of normal data dissemination over the multicast lines */
typedef StartOfDayMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8]
};

int start_of_day_message_at;

/* every byte of Start Of Day Message set to one value */
inline fill_start_of_day_message(start_of_day_message_record, start_of_day_message_value) {
  start_of_day_message_record.participant_id = start_of_day_message_value;
  fill_timestamp1(start_of_day_message_record.timestamp_1, start_of_day_message_value);
  start_of_day_message_record.message_id = start_of_day_message_value;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 4 -> start_of_day_message_record.transaction_id[start_of_day_message_at] = start_of_day_message_value; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.participant_reference_number[start_of_day_message_at] = start_of_day_message_value; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Start Of Day Message set to where it lies, so a field read out of place says so */
inline ramp_start_of_day_message(start_of_day_message_record, start_of_day_message_base) {
  start_of_day_message_record.participant_id = (start_of_day_message_base + 0 + 1) % 256;
  ramp_timestamp1(start_of_day_message_record.timestamp_1, start_of_day_message_base + 1);
  start_of_day_message_record.message_id = (start_of_day_message_base + 9 + 1) % 256;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 4 -> start_of_day_message_record.transaction_id[start_of_day_message_at] = (start_of_day_message_base + 10 + start_of_day_message_at + 1) % 256; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.participant_reference_number[start_of_day_message_at] = (start_of_day_message_base + 14 + start_of_day_message_at + 1) % 256; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Day Message to the wire, 22 bytes from where the cursor stands */
inline encode_start_of_day_message(start_of_day_message_record) {
  wire[at] = start_of_day_message_record.participant_id; at = at + 1;
  encode_timestamp1(start_of_day_message_record.timestamp_1);
  wire[at] = start_of_day_message_record.message_id; at = at + 1;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 4 -> wire[at] = start_of_day_message_record.transaction_id[start_of_day_message_at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> wire[at] = start_of_day_message_record.participant_reference_number[start_of_day_message_at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Day Message off the wire, 22 bytes from where the cursor stands */
inline decode_start_of_day_message(start_of_day_message_record) {
  start_of_day_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(start_of_day_message_record.timestamp_1);
  start_of_day_message_record.message_id = wire[at]; at = at + 1;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 4 -> start_of_day_message_record.transaction_id[start_of_day_message_at] = wire[at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.participant_reference_number[start_of_day_message_at] = wire[at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Start Of Day Message is what was written, byte for byte */
inline equal_start_of_day_message(start_of_day_message_read, start_of_day_message_written) {
  assert(start_of_day_message_read.participant_id == start_of_day_message_written.participant_id);
  equal_timestamp1(start_of_day_message_read.timestamp_1, start_of_day_message_written.timestamp_1);
  assert(start_of_day_message_read.message_id == start_of_day_message_written.message_id);
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 4 -> assert(start_of_day_message_read.transaction_id[start_of_day_message_at] == start_of_day_message_written.transaction_id[start_of_day_message_at]); start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> assert(start_of_day_message_read.participant_reference_number[start_of_day_message_at] == start_of_day_message_written.participant_reference_number[start_of_day_message_at]); start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reset Block Sequence Number Message: 22 bytes --------------------------- */

/* The Reset Block Sequence Number message is transmitted when the block sequence number on an output multicast line requires resetting. */
typedef ResetBlockSequenceNumberMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8]
};

int reset_block_sequence_number_message_at;

/* every byte of Reset Block Sequence Number Message set to one value */
inline fill_reset_block_sequence_number_message(reset_block_sequence_number_message_record, reset_block_sequence_number_message_value) {
  reset_block_sequence_number_message_record.participant_id = reset_block_sequence_number_message_value;
  fill_timestamp1(reset_block_sequence_number_message_record.timestamp_1, reset_block_sequence_number_message_value);
  reset_block_sequence_number_message_record.message_id = reset_block_sequence_number_message_value;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 4 -> reset_block_sequence_number_message_record.transaction_id[reset_block_sequence_number_message_at] = reset_block_sequence_number_message_value; reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 8 -> reset_block_sequence_number_message_record.participant_reference_number[reset_block_sequence_number_message_at] = reset_block_sequence_number_message_value; reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reset Block Sequence Number Message set to where it lies, so a field read out of place says so */
inline ramp_reset_block_sequence_number_message(reset_block_sequence_number_message_record, reset_block_sequence_number_message_base) {
  reset_block_sequence_number_message_record.participant_id = (reset_block_sequence_number_message_base + 0 + 1) % 256;
  ramp_timestamp1(reset_block_sequence_number_message_record.timestamp_1, reset_block_sequence_number_message_base + 1);
  reset_block_sequence_number_message_record.message_id = (reset_block_sequence_number_message_base + 9 + 1) % 256;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 4 -> reset_block_sequence_number_message_record.transaction_id[reset_block_sequence_number_message_at] = (reset_block_sequence_number_message_base + 10 + reset_block_sequence_number_message_at + 1) % 256; reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 8 -> reset_block_sequence_number_message_record.participant_reference_number[reset_block_sequence_number_message_at] = (reset_block_sequence_number_message_base + 14 + reset_block_sequence_number_message_at + 1) % 256; reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reset Block Sequence Number Message to the wire, 22 bytes from where the cursor stands */
inline encode_reset_block_sequence_number_message(reset_block_sequence_number_message_record) {
  wire[at] = reset_block_sequence_number_message_record.participant_id; at = at + 1;
  encode_timestamp1(reset_block_sequence_number_message_record.timestamp_1);
  wire[at] = reset_block_sequence_number_message_record.message_id; at = at + 1;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 4 -> wire[at] = reset_block_sequence_number_message_record.transaction_id[reset_block_sequence_number_message_at]; at = at + 1; reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 8 -> wire[at] = reset_block_sequence_number_message_record.participant_reference_number[reset_block_sequence_number_message_at]; at = at + 1; reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reset Block Sequence Number Message off the wire, 22 bytes from where the cursor stands */
inline decode_reset_block_sequence_number_message(reset_block_sequence_number_message_record) {
  reset_block_sequence_number_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(reset_block_sequence_number_message_record.timestamp_1);
  reset_block_sequence_number_message_record.message_id = wire[at]; at = at + 1;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 4 -> reset_block_sequence_number_message_record.transaction_id[reset_block_sequence_number_message_at] = wire[at]; at = at + 1; reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 8 -> reset_block_sequence_number_message_record.participant_reference_number[reset_block_sequence_number_message_at] = wire[at]; at = at + 1; reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reset Block Sequence Number Message is what was written, byte for byte */
inline equal_reset_block_sequence_number_message(reset_block_sequence_number_message_read, reset_block_sequence_number_message_written) {
  assert(reset_block_sequence_number_message_read.participant_id == reset_block_sequence_number_message_written.participant_id);
  equal_timestamp1(reset_block_sequence_number_message_read.timestamp_1, reset_block_sequence_number_message_written.timestamp_1);
  assert(reset_block_sequence_number_message_read.message_id == reset_block_sequence_number_message_written.message_id);
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 4 -> assert(reset_block_sequence_number_message_read.transaction_id[reset_block_sequence_number_message_at] == reset_block_sequence_number_message_written.transaction_id[reset_block_sequence_number_message_at]); reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 8 -> assert(reset_block_sequence_number_message_read.participant_reference_number[reset_block_sequence_number_message_at] == reset_block_sequence_number_message_written.participant_reference_number[reset_block_sequence_number_message_at]); reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Disaster Recovery Data Center Activation Message: 22 bytes -------------- */

/* The Disaster Recovery Data Center Activation message is transmitted to signify that the Consolidated Quotation System (CQS) has switched processing from the Primary Data Center to the Disaster Recovery Data Center */
typedef DisasterRecoveryDataCenterActivationMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8]
};

int disaster_recovery_data_center_activation_message_at;

/* every byte of Disaster Recovery Data Center Activation Message set to one value */
inline fill_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_record, disaster_recovery_data_center_activation_message_value) {
  disaster_recovery_data_center_activation_message_record.participant_id = disaster_recovery_data_center_activation_message_value;
  fill_timestamp1(disaster_recovery_data_center_activation_message_record.timestamp_1, disaster_recovery_data_center_activation_message_value);
  disaster_recovery_data_center_activation_message_record.message_id = disaster_recovery_data_center_activation_message_value;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 4 -> disaster_recovery_data_center_activation_message_record.transaction_id[disaster_recovery_data_center_activation_message_at] = disaster_recovery_data_center_activation_message_value; disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 8 -> disaster_recovery_data_center_activation_message_record.participant_reference_number[disaster_recovery_data_center_activation_message_at] = disaster_recovery_data_center_activation_message_value; disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Disaster Recovery Data Center Activation Message set to where it lies, so a field read out of place says so */
inline ramp_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_record, disaster_recovery_data_center_activation_message_base) {
  disaster_recovery_data_center_activation_message_record.participant_id = (disaster_recovery_data_center_activation_message_base + 0 + 1) % 256;
  ramp_timestamp1(disaster_recovery_data_center_activation_message_record.timestamp_1, disaster_recovery_data_center_activation_message_base + 1);
  disaster_recovery_data_center_activation_message_record.message_id = (disaster_recovery_data_center_activation_message_base + 9 + 1) % 256;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 4 -> disaster_recovery_data_center_activation_message_record.transaction_id[disaster_recovery_data_center_activation_message_at] = (disaster_recovery_data_center_activation_message_base + 10 + disaster_recovery_data_center_activation_message_at + 1) % 256; disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 8 -> disaster_recovery_data_center_activation_message_record.participant_reference_number[disaster_recovery_data_center_activation_message_at] = (disaster_recovery_data_center_activation_message_base + 14 + disaster_recovery_data_center_activation_message_at + 1) % 256; disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Disaster Recovery Data Center Activation Message to the wire, 22 bytes from where the cursor stands */
inline encode_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_record) {
  wire[at] = disaster_recovery_data_center_activation_message_record.participant_id; at = at + 1;
  encode_timestamp1(disaster_recovery_data_center_activation_message_record.timestamp_1);
  wire[at] = disaster_recovery_data_center_activation_message_record.message_id; at = at + 1;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 4 -> wire[at] = disaster_recovery_data_center_activation_message_record.transaction_id[disaster_recovery_data_center_activation_message_at]; at = at + 1; disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 8 -> wire[at] = disaster_recovery_data_center_activation_message_record.participant_reference_number[disaster_recovery_data_center_activation_message_at]; at = at + 1; disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Disaster Recovery Data Center Activation Message off the wire, 22 bytes from where the cursor stands */
inline decode_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_record) {
  disaster_recovery_data_center_activation_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(disaster_recovery_data_center_activation_message_record.timestamp_1);
  disaster_recovery_data_center_activation_message_record.message_id = wire[at]; at = at + 1;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 4 -> disaster_recovery_data_center_activation_message_record.transaction_id[disaster_recovery_data_center_activation_message_at] = wire[at]; at = at + 1; disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 8 -> disaster_recovery_data_center_activation_message_record.participant_reference_number[disaster_recovery_data_center_activation_message_at] = wire[at]; at = at + 1; disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Disaster Recovery Data Center Activation Message is what was written, byte for byte */
inline equal_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_read, disaster_recovery_data_center_activation_message_written) {
  assert(disaster_recovery_data_center_activation_message_read.participant_id == disaster_recovery_data_center_activation_message_written.participant_id);
  equal_timestamp1(disaster_recovery_data_center_activation_message_read.timestamp_1, disaster_recovery_data_center_activation_message_written.timestamp_1);
  assert(disaster_recovery_data_center_activation_message_read.message_id == disaster_recovery_data_center_activation_message_written.message_id);
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 4 -> assert(disaster_recovery_data_center_activation_message_read.transaction_id[disaster_recovery_data_center_activation_message_at] == disaster_recovery_data_center_activation_message_written.transaction_id[disaster_recovery_data_center_activation_message_at]); disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 8 -> assert(disaster_recovery_data_center_activation_message_read.participant_reference_number[disaster_recovery_data_center_activation_message_at] == disaster_recovery_data_center_activation_message_written.participant_reference_number[disaster_recovery_data_center_activation_message_at]); disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Line Integrity Message: 22 bytes ---------------------------------------- */

/* The Line Integrity message is transmitted over the multicast lines at intervals of sixty (60) seconds to verify continued integrity of multicast transmission */
typedef LineIntegrityMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8]
};

int line_integrity_message_at;

/* every byte of Line Integrity Message set to one value */
inline fill_line_integrity_message(line_integrity_message_record, line_integrity_message_value) {
  line_integrity_message_record.participant_id = line_integrity_message_value;
  fill_timestamp1(line_integrity_message_record.timestamp_1, line_integrity_message_value);
  line_integrity_message_record.message_id = line_integrity_message_value;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 4 -> line_integrity_message_record.transaction_id[line_integrity_message_at] = line_integrity_message_value; line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 8 -> line_integrity_message_record.participant_reference_number[line_integrity_message_at] = line_integrity_message_value; line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Line Integrity Message set to where it lies, so a field read out of place says so */
inline ramp_line_integrity_message(line_integrity_message_record, line_integrity_message_base) {
  line_integrity_message_record.participant_id = (line_integrity_message_base + 0 + 1) % 256;
  ramp_timestamp1(line_integrity_message_record.timestamp_1, line_integrity_message_base + 1);
  line_integrity_message_record.message_id = (line_integrity_message_base + 9 + 1) % 256;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 4 -> line_integrity_message_record.transaction_id[line_integrity_message_at] = (line_integrity_message_base + 10 + line_integrity_message_at + 1) % 256; line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 8 -> line_integrity_message_record.participant_reference_number[line_integrity_message_at] = (line_integrity_message_base + 14 + line_integrity_message_at + 1) % 256; line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  skip
}

/* Line Integrity Message to the wire, 22 bytes from where the cursor stands */
inline encode_line_integrity_message(line_integrity_message_record) {
  wire[at] = line_integrity_message_record.participant_id; at = at + 1;
  encode_timestamp1(line_integrity_message_record.timestamp_1);
  wire[at] = line_integrity_message_record.message_id; at = at + 1;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 4 -> wire[at] = line_integrity_message_record.transaction_id[line_integrity_message_at]; at = at + 1; line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 8 -> wire[at] = line_integrity_message_record.participant_reference_number[line_integrity_message_at]; at = at + 1; line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  skip
}

/* Line Integrity Message off the wire, 22 bytes from where the cursor stands */
inline decode_line_integrity_message(line_integrity_message_record) {
  line_integrity_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(line_integrity_message_record.timestamp_1);
  line_integrity_message_record.message_id = wire[at]; at = at + 1;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 4 -> line_integrity_message_record.transaction_id[line_integrity_message_at] = wire[at]; at = at + 1; line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 8 -> line_integrity_message_record.participant_reference_number[line_integrity_message_at] = wire[at]; at = at + 1; line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Line Integrity Message is what was written, byte for byte */
inline equal_line_integrity_message(line_integrity_message_read, line_integrity_message_written) {
  assert(line_integrity_message_read.participant_id == line_integrity_message_written.participant_id);
  equal_timestamp1(line_integrity_message_read.timestamp_1, line_integrity_message_written.timestamp_1);
  assert(line_integrity_message_read.message_id == line_integrity_message_written.message_id);
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 4 -> assert(line_integrity_message_read.transaction_id[line_integrity_message_at] == line_integrity_message_written.transaction_id[line_integrity_message_at]); line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 8 -> assert(line_integrity_message_read.participant_reference_number[line_integrity_message_at] == line_integrity_message_written.participant_reference_number[line_integrity_message_at]); line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Day Message: 22 bytes -------------------------------------------- */

/* The End of Day message is transmitted over the multicast lines to advise all Data Recipients that there are no further messages of any type transmitted for the day */
typedef EndOfDayMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8]
};

int end_of_day_message_at;

/* every byte of End Of Day Message set to one value */
inline fill_end_of_day_message(end_of_day_message_record, end_of_day_message_value) {
  end_of_day_message_record.participant_id = end_of_day_message_value;
  fill_timestamp1(end_of_day_message_record.timestamp_1, end_of_day_message_value);
  end_of_day_message_record.message_id = end_of_day_message_value;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 4 -> end_of_day_message_record.transaction_id[end_of_day_message_at] = end_of_day_message_value; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.participant_reference_number[end_of_day_message_at] = end_of_day_message_value; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Day Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_day_message(end_of_day_message_record, end_of_day_message_base) {
  end_of_day_message_record.participant_id = (end_of_day_message_base + 0 + 1) % 256;
  ramp_timestamp1(end_of_day_message_record.timestamp_1, end_of_day_message_base + 1);
  end_of_day_message_record.message_id = (end_of_day_message_base + 9 + 1) % 256;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 4 -> end_of_day_message_record.transaction_id[end_of_day_message_at] = (end_of_day_message_base + 10 + end_of_day_message_at + 1) % 256; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.participant_reference_number[end_of_day_message_at] = (end_of_day_message_base + 14 + end_of_day_message_at + 1) % 256; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Day Message to the wire, 22 bytes from where the cursor stands */
inline encode_end_of_day_message(end_of_day_message_record) {
  wire[at] = end_of_day_message_record.participant_id; at = at + 1;
  encode_timestamp1(end_of_day_message_record.timestamp_1);
  wire[at] = end_of_day_message_record.message_id; at = at + 1;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 4 -> wire[at] = end_of_day_message_record.transaction_id[end_of_day_message_at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> wire[at] = end_of_day_message_record.participant_reference_number[end_of_day_message_at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Day Message off the wire, 22 bytes from where the cursor stands */
inline decode_end_of_day_message(end_of_day_message_record) {
  end_of_day_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(end_of_day_message_record.timestamp_1);
  end_of_day_message_record.message_id = wire[at]; at = at + 1;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 4 -> end_of_day_message_record.transaction_id[end_of_day_message_at] = wire[at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.participant_reference_number[end_of_day_message_at] = wire[at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Day Message is what was written, byte for byte */
inline equal_end_of_day_message(end_of_day_message_read, end_of_day_message_written) {
  assert(end_of_day_message_read.participant_id == end_of_day_message_written.participant_id);
  equal_timestamp1(end_of_day_message_read.timestamp_1, end_of_day_message_written.timestamp_1);
  assert(end_of_day_message_read.message_id == end_of_day_message_written.message_id);
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 4 -> assert(end_of_day_message_read.transaction_id[end_of_day_message_at] == end_of_day_message_written.transaction_id[end_of_day_message_at]); end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> assert(end_of_day_message_read.participant_reference_number[end_of_day_message_at] == end_of_day_message_written.participant_reference_number[end_of_day_message_at]); end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Index Message: 41 bytes ------------------------------------------------- */

/* The Index message contains the index and the index value */
typedef IndexMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte index_symbol[11];
  byte index_value[8]
};

int index_message_at;

/* every byte of Index Message set to one value */
inline fill_index_message(index_message_record, index_message_value) {
  index_message_record.participant_id = index_message_value;
  fill_timestamp1(index_message_record.timestamp_1, index_message_value);
  index_message_record.message_id = index_message_value;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.transaction_id[index_message_at] = index_message_value; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 8 -> index_message_record.participant_reference_number[index_message_at] = index_message_value; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 11 -> index_message_record.index_symbol[index_message_at] = index_message_value; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 8 -> index_message_record.index_value[index_message_at] = index_message_value; index_message_at = index_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Index Message set to where it lies, so a field read out of place says so */
inline ramp_index_message(index_message_record, index_message_base) {
  index_message_record.participant_id = (index_message_base + 0 + 1) % 256;
  ramp_timestamp1(index_message_record.timestamp_1, index_message_base + 1);
  index_message_record.message_id = (index_message_base + 9 + 1) % 256;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.transaction_id[index_message_at] = (index_message_base + 10 + index_message_at + 1) % 256; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 8 -> index_message_record.participant_reference_number[index_message_at] = (index_message_base + 14 + index_message_at + 1) % 256; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 11 -> index_message_record.index_symbol[index_message_at] = (index_message_base + 22 + index_message_at + 1) % 256; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 8 -> index_message_record.index_value[index_message_at] = (index_message_base + 33 + index_message_at + 1) % 256; index_message_at = index_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Message to the wire, 41 bytes from where the cursor stands */
inline encode_index_message(index_message_record) {
  wire[at] = index_message_record.participant_id; at = at + 1;
  encode_timestamp1(index_message_record.timestamp_1);
  wire[at] = index_message_record.message_id; at = at + 1;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> wire[at] = index_message_record.transaction_id[index_message_at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 8 -> wire[at] = index_message_record.participant_reference_number[index_message_at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 11 -> wire[at] = index_message_record.index_symbol[index_message_at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 8 -> wire[at] = index_message_record.index_value[index_message_at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Message off the wire, 41 bytes from where the cursor stands */
inline decode_index_message(index_message_record) {
  index_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(index_message_record.timestamp_1);
  index_message_record.message_id = wire[at]; at = at + 1;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.transaction_id[index_message_at] = wire[at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 8 -> index_message_record.participant_reference_number[index_message_at] = wire[at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 11 -> index_message_record.index_symbol[index_message_at] = wire[at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 8 -> index_message_record.index_value[index_message_at] = wire[at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Index Message is what was written, byte for byte */
inline equal_index_message(index_message_read, index_message_written) {
  assert(index_message_read.participant_id == index_message_written.participant_id);
  equal_timestamp1(index_message_read.timestamp_1, index_message_written.timestamp_1);
  assert(index_message_read.message_id == index_message_written.message_id);
  index_message_at = 0;
  do
  :: index_message_at < 4 -> assert(index_message_read.transaction_id[index_message_at] == index_message_written.transaction_id[index_message_at]); index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 8 -> assert(index_message_read.participant_reference_number[index_message_at] == index_message_written.participant_reference_number[index_message_at]); index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 11 -> assert(index_message_read.index_symbol[index_message_at] == index_message_written.index_symbol[index_message_at]); index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 8 -> assert(index_message_read.index_value[index_message_at] == index_message_written.index_value[index_message_at]); index_message_at = index_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Bid And Offer Index Message: 49 bytes ----------------------------------- */

/* The Bid and Offer Index message contains the index Bid and Offer index values */
typedef BidAndOfferIndexMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte index_symbol[11];
  byte bid_index_value[8];
  byte offer_index_value[8]
};

int bid_and_offer_index_message_at;

/* every byte of Bid And Offer Index Message set to one value */
inline fill_bid_and_offer_index_message(bid_and_offer_index_message_record, bid_and_offer_index_message_value) {
  bid_and_offer_index_message_record.participant_id = bid_and_offer_index_message_value;
  fill_timestamp1(bid_and_offer_index_message_record.timestamp_1, bid_and_offer_index_message_value);
  bid_and_offer_index_message_record.message_id = bid_and_offer_index_message_value;
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 4 -> bid_and_offer_index_message_record.transaction_id[bid_and_offer_index_message_at] = bid_and_offer_index_message_value; bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 8 -> bid_and_offer_index_message_record.participant_reference_number[bid_and_offer_index_message_at] = bid_and_offer_index_message_value; bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 11 -> bid_and_offer_index_message_record.index_symbol[bid_and_offer_index_message_at] = bid_and_offer_index_message_value; bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 8 -> bid_and_offer_index_message_record.bid_index_value[bid_and_offer_index_message_at] = bid_and_offer_index_message_value; bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 8 -> bid_and_offer_index_message_record.offer_index_value[bid_and_offer_index_message_at] = bid_and_offer_index_message_value; bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Bid And Offer Index Message set to where it lies, so a field read out of place says so */
inline ramp_bid_and_offer_index_message(bid_and_offer_index_message_record, bid_and_offer_index_message_base) {
  bid_and_offer_index_message_record.participant_id = (bid_and_offer_index_message_base + 0 + 1) % 256;
  ramp_timestamp1(bid_and_offer_index_message_record.timestamp_1, bid_and_offer_index_message_base + 1);
  bid_and_offer_index_message_record.message_id = (bid_and_offer_index_message_base + 9 + 1) % 256;
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 4 -> bid_and_offer_index_message_record.transaction_id[bid_and_offer_index_message_at] = (bid_and_offer_index_message_base + 10 + bid_and_offer_index_message_at + 1) % 256; bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 8 -> bid_and_offer_index_message_record.participant_reference_number[bid_and_offer_index_message_at] = (bid_and_offer_index_message_base + 14 + bid_and_offer_index_message_at + 1) % 256; bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 11 -> bid_and_offer_index_message_record.index_symbol[bid_and_offer_index_message_at] = (bid_and_offer_index_message_base + 22 + bid_and_offer_index_message_at + 1) % 256; bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 8 -> bid_and_offer_index_message_record.bid_index_value[bid_and_offer_index_message_at] = (bid_and_offer_index_message_base + 33 + bid_and_offer_index_message_at + 1) % 256; bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 8 -> bid_and_offer_index_message_record.offer_index_value[bid_and_offer_index_message_at] = (bid_and_offer_index_message_base + 41 + bid_and_offer_index_message_at + 1) % 256; bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  skip
}

/* Bid And Offer Index Message to the wire, 49 bytes from where the cursor stands */
inline encode_bid_and_offer_index_message(bid_and_offer_index_message_record) {
  wire[at] = bid_and_offer_index_message_record.participant_id; at = at + 1;
  encode_timestamp1(bid_and_offer_index_message_record.timestamp_1);
  wire[at] = bid_and_offer_index_message_record.message_id; at = at + 1;
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 4 -> wire[at] = bid_and_offer_index_message_record.transaction_id[bid_and_offer_index_message_at]; at = at + 1; bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 8 -> wire[at] = bid_and_offer_index_message_record.participant_reference_number[bid_and_offer_index_message_at]; at = at + 1; bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 11 -> wire[at] = bid_and_offer_index_message_record.index_symbol[bid_and_offer_index_message_at]; at = at + 1; bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 8 -> wire[at] = bid_and_offer_index_message_record.bid_index_value[bid_and_offer_index_message_at]; at = at + 1; bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 8 -> wire[at] = bid_and_offer_index_message_record.offer_index_value[bid_and_offer_index_message_at]; at = at + 1; bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  skip
}

/* Bid And Offer Index Message off the wire, 49 bytes from where the cursor stands */
inline decode_bid_and_offer_index_message(bid_and_offer_index_message_record) {
  bid_and_offer_index_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(bid_and_offer_index_message_record.timestamp_1);
  bid_and_offer_index_message_record.message_id = wire[at]; at = at + 1;
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 4 -> bid_and_offer_index_message_record.transaction_id[bid_and_offer_index_message_at] = wire[at]; at = at + 1; bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 8 -> bid_and_offer_index_message_record.participant_reference_number[bid_and_offer_index_message_at] = wire[at]; at = at + 1; bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 11 -> bid_and_offer_index_message_record.index_symbol[bid_and_offer_index_message_at] = wire[at]; at = at + 1; bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 8 -> bid_and_offer_index_message_record.bid_index_value[bid_and_offer_index_message_at] = wire[at]; at = at + 1; bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 8 -> bid_and_offer_index_message_record.offer_index_value[bid_and_offer_index_message_at] = wire[at]; at = at + 1; bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Bid And Offer Index Message is what was written, byte for byte */
inline equal_bid_and_offer_index_message(bid_and_offer_index_message_read, bid_and_offer_index_message_written) {
  assert(bid_and_offer_index_message_read.participant_id == bid_and_offer_index_message_written.participant_id);
  equal_timestamp1(bid_and_offer_index_message_read.timestamp_1, bid_and_offer_index_message_written.timestamp_1);
  assert(bid_and_offer_index_message_read.message_id == bid_and_offer_index_message_written.message_id);
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 4 -> assert(bid_and_offer_index_message_read.transaction_id[bid_and_offer_index_message_at] == bid_and_offer_index_message_written.transaction_id[bid_and_offer_index_message_at]); bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 8 -> assert(bid_and_offer_index_message_read.participant_reference_number[bid_and_offer_index_message_at] == bid_and_offer_index_message_written.participant_reference_number[bid_and_offer_index_message_at]); bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 11 -> assert(bid_and_offer_index_message_read.index_symbol[bid_and_offer_index_message_at] == bid_and_offer_index_message_written.index_symbol[bid_and_offer_index_message_at]); bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 8 -> assert(bid_and_offer_index_message_read.bid_index_value[bid_and_offer_index_message_at] == bid_and_offer_index_message_written.bid_index_value[bid_and_offer_index_message_at]); bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 8 -> assert(bid_and_offer_index_message_read.offer_index_value[bid_and_offer_index_message_at] == bid_and_offer_index_message_written.offer_index_value[bid_and_offer_index_message_at]); bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Wide Circuit Breaker Decline Level Status Message: 47 bytes ------ */

/* The Market-Wide Circuit Breaker Decline Level Status message is used to report the calculated Level 1, Level 2 and Level 3 threshold values for the current trading day necessary to trigger a circuit breaker */
typedef MarketWideCircuitBreakerDeclineLevelStatusMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte mwcb_level_1[8];
  byte mwcb_level_2[8];
  byte mwcb_level_3[8];
  byte reserved
};

int market_wide_circuit_breaker_decline_level_status_message_at;

/* every byte of Market Wide Circuit Breaker Decline Level Status Message set to one value */
inline fill_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_record, market_wide_circuit_breaker_decline_level_status_message_value) {
  market_wide_circuit_breaker_decline_level_status_message_record.participant_id = market_wide_circuit_breaker_decline_level_status_message_value;
  fill_timestamp1(market_wide_circuit_breaker_decline_level_status_message_record.timestamp_1, market_wide_circuit_breaker_decline_level_status_message_value);
  market_wide_circuit_breaker_decline_level_status_message_record.message_id = market_wide_circuit_breaker_decline_level_status_message_value;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 4 -> market_wide_circuit_breaker_decline_level_status_message_record.transaction_id[market_wide_circuit_breaker_decline_level_status_message_at] = market_wide_circuit_breaker_decline_level_status_message_value; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.participant_reference_number[market_wide_circuit_breaker_decline_level_status_message_at] = market_wide_circuit_breaker_decline_level_status_message_value; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_1[market_wide_circuit_breaker_decline_level_status_message_at] = market_wide_circuit_breaker_decline_level_status_message_value; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_2[market_wide_circuit_breaker_decline_level_status_message_at] = market_wide_circuit_breaker_decline_level_status_message_value; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_3[market_wide_circuit_breaker_decline_level_status_message_at] = market_wide_circuit_breaker_decline_level_status_message_value; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_record.reserved = market_wide_circuit_breaker_decline_level_status_message_value;
  skip
}

/* each byte of Market Wide Circuit Breaker Decline Level Status Message set to where it lies, so a field read out of place says so */
inline ramp_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_record, market_wide_circuit_breaker_decline_level_status_message_base) {
  market_wide_circuit_breaker_decline_level_status_message_record.participant_id = (market_wide_circuit_breaker_decline_level_status_message_base + 0 + 1) % 256;
  ramp_timestamp1(market_wide_circuit_breaker_decline_level_status_message_record.timestamp_1, market_wide_circuit_breaker_decline_level_status_message_base + 1);
  market_wide_circuit_breaker_decline_level_status_message_record.message_id = (market_wide_circuit_breaker_decline_level_status_message_base + 9 + 1) % 256;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 4 -> market_wide_circuit_breaker_decline_level_status_message_record.transaction_id[market_wide_circuit_breaker_decline_level_status_message_at] = (market_wide_circuit_breaker_decline_level_status_message_base + 10 + market_wide_circuit_breaker_decline_level_status_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.participant_reference_number[market_wide_circuit_breaker_decline_level_status_message_at] = (market_wide_circuit_breaker_decline_level_status_message_base + 14 + market_wide_circuit_breaker_decline_level_status_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_1[market_wide_circuit_breaker_decline_level_status_message_at] = (market_wide_circuit_breaker_decline_level_status_message_base + 22 + market_wide_circuit_breaker_decline_level_status_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_2[market_wide_circuit_breaker_decline_level_status_message_at] = (market_wide_circuit_breaker_decline_level_status_message_base + 30 + market_wide_circuit_breaker_decline_level_status_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_3[market_wide_circuit_breaker_decline_level_status_message_at] = (market_wide_circuit_breaker_decline_level_status_message_base + 38 + market_wide_circuit_breaker_decline_level_status_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_record.reserved = (market_wide_circuit_breaker_decline_level_status_message_base + 46 + 1) % 256;
  skip
}

/* Market Wide Circuit Breaker Decline Level Status Message to the wire, 47 bytes from where the cursor stands */
inline encode_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_record) {
  wire[at] = market_wide_circuit_breaker_decline_level_status_message_record.participant_id; at = at + 1;
  encode_timestamp1(market_wide_circuit_breaker_decline_level_status_message_record.timestamp_1);
  wire[at] = market_wide_circuit_breaker_decline_level_status_message_record.message_id; at = at + 1;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 4 -> wire[at] = market_wide_circuit_breaker_decline_level_status_message_record.transaction_id[market_wide_circuit_breaker_decline_level_status_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_status_message_record.participant_reference_number[market_wide_circuit_breaker_decline_level_status_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_1[market_wide_circuit_breaker_decline_level_status_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_2[market_wide_circuit_breaker_decline_level_status_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_3[market_wide_circuit_breaker_decline_level_status_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  wire[at] = market_wide_circuit_breaker_decline_level_status_message_record.reserved; at = at + 1;
  skip
}

/* Market Wide Circuit Breaker Decline Level Status Message off the wire, 47 bytes from where the cursor stands */
inline decode_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_record) {
  market_wide_circuit_breaker_decline_level_status_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(market_wide_circuit_breaker_decline_level_status_message_record.timestamp_1);
  market_wide_circuit_breaker_decline_level_status_message_record.message_id = wire[at]; at = at + 1;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 4 -> market_wide_circuit_breaker_decline_level_status_message_record.transaction_id[market_wide_circuit_breaker_decline_level_status_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.participant_reference_number[market_wide_circuit_breaker_decline_level_status_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_1[market_wide_circuit_breaker_decline_level_status_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_2[market_wide_circuit_breaker_decline_level_status_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_3[market_wide_circuit_breaker_decline_level_status_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_record.reserved = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Wide Circuit Breaker Decline Level Status Message is what was written, byte for byte */
inline equal_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_read, market_wide_circuit_breaker_decline_level_status_message_written) {
  assert(market_wide_circuit_breaker_decline_level_status_message_read.participant_id == market_wide_circuit_breaker_decline_level_status_message_written.participant_id);
  equal_timestamp1(market_wide_circuit_breaker_decline_level_status_message_read.timestamp_1, market_wide_circuit_breaker_decline_level_status_message_written.timestamp_1);
  assert(market_wide_circuit_breaker_decline_level_status_message_read.message_id == market_wide_circuit_breaker_decline_level_status_message_written.message_id);
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 4 -> assert(market_wide_circuit_breaker_decline_level_status_message_read.transaction_id[market_wide_circuit_breaker_decline_level_status_message_at] == market_wide_circuit_breaker_decline_level_status_message_written.transaction_id[market_wide_circuit_breaker_decline_level_status_message_at]); market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_status_message_read.participant_reference_number[market_wide_circuit_breaker_decline_level_status_message_at] == market_wide_circuit_breaker_decline_level_status_message_written.participant_reference_number[market_wide_circuit_breaker_decline_level_status_message_at]); market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_status_message_read.mwcb_level_1[market_wide_circuit_breaker_decline_level_status_message_at] == market_wide_circuit_breaker_decline_level_status_message_written.mwcb_level_1[market_wide_circuit_breaker_decline_level_status_message_at]); market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_status_message_read.mwcb_level_2[market_wide_circuit_breaker_decline_level_status_message_at] == market_wide_circuit_breaker_decline_level_status_message_written.mwcb_level_2[market_wide_circuit_breaker_decline_level_status_message_at]); market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_status_message_read.mwcb_level_3[market_wide_circuit_breaker_decline_level_status_message_at] == market_wide_circuit_breaker_decline_level_status_message_written.mwcb_level_3[market_wide_circuit_breaker_decline_level_status_message_at]); market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  assert(market_wide_circuit_breaker_decline_level_status_message_read.reserved == market_wide_circuit_breaker_decline_level_status_message_written.reserved);
  skip
}

/* ---- Market Wide Circuit Breaker Status Message: 24 bytes -------------------- */

/* The Market-Wide Circuit Breaker Status message is used to report the Market-Wide Circuit Breaker threshold Level that has been breached. */
typedef MarketWideCircuitBreakerStatusMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte market_wide_circuit_breaker_level_indicator;
  byte reserved
};

int market_wide_circuit_breaker_status_message_at;

/* every byte of Market Wide Circuit Breaker Status Message set to one value */
inline fill_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_record, market_wide_circuit_breaker_status_message_value) {
  market_wide_circuit_breaker_status_message_record.participant_id = market_wide_circuit_breaker_status_message_value;
  fill_timestamp1(market_wide_circuit_breaker_status_message_record.timestamp_1, market_wide_circuit_breaker_status_message_value);
  market_wide_circuit_breaker_status_message_record.message_id = market_wide_circuit_breaker_status_message_value;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 4 -> market_wide_circuit_breaker_status_message_record.transaction_id[market_wide_circuit_breaker_status_message_at] = market_wide_circuit_breaker_status_message_value; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> market_wide_circuit_breaker_status_message_record.participant_reference_number[market_wide_circuit_breaker_status_message_at] = market_wide_circuit_breaker_status_message_value; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_record.market_wide_circuit_breaker_level_indicator = market_wide_circuit_breaker_status_message_value;
  market_wide_circuit_breaker_status_message_record.reserved = market_wide_circuit_breaker_status_message_value;
  skip
}

/* each byte of Market Wide Circuit Breaker Status Message set to where it lies, so a field read out of place says so */
inline ramp_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_record, market_wide_circuit_breaker_status_message_base) {
  market_wide_circuit_breaker_status_message_record.participant_id = (market_wide_circuit_breaker_status_message_base + 0 + 1) % 256;
  ramp_timestamp1(market_wide_circuit_breaker_status_message_record.timestamp_1, market_wide_circuit_breaker_status_message_base + 1);
  market_wide_circuit_breaker_status_message_record.message_id = (market_wide_circuit_breaker_status_message_base + 9 + 1) % 256;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 4 -> market_wide_circuit_breaker_status_message_record.transaction_id[market_wide_circuit_breaker_status_message_at] = (market_wide_circuit_breaker_status_message_base + 10 + market_wide_circuit_breaker_status_message_at + 1) % 256; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> market_wide_circuit_breaker_status_message_record.participant_reference_number[market_wide_circuit_breaker_status_message_at] = (market_wide_circuit_breaker_status_message_base + 14 + market_wide_circuit_breaker_status_message_at + 1) % 256; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_record.market_wide_circuit_breaker_level_indicator = (market_wide_circuit_breaker_status_message_base + 22 + 1) % 256;
  market_wide_circuit_breaker_status_message_record.reserved = (market_wide_circuit_breaker_status_message_base + 23 + 1) % 256;
  skip
}

/* Market Wide Circuit Breaker Status Message to the wire, 24 bytes from where the cursor stands */
inline encode_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_record) {
  wire[at] = market_wide_circuit_breaker_status_message_record.participant_id; at = at + 1;
  encode_timestamp1(market_wide_circuit_breaker_status_message_record.timestamp_1);
  wire[at] = market_wide_circuit_breaker_status_message_record.message_id; at = at + 1;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 4 -> wire[at] = market_wide_circuit_breaker_status_message_record.transaction_id[market_wide_circuit_breaker_status_message_at]; at = at + 1; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> wire[at] = market_wide_circuit_breaker_status_message_record.participant_reference_number[market_wide_circuit_breaker_status_message_at]; at = at + 1; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  wire[at] = market_wide_circuit_breaker_status_message_record.market_wide_circuit_breaker_level_indicator; at = at + 1;
  wire[at] = market_wide_circuit_breaker_status_message_record.reserved; at = at + 1;
  skip
}

/* Market Wide Circuit Breaker Status Message off the wire, 24 bytes from where the cursor stands */
inline decode_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_record) {
  market_wide_circuit_breaker_status_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(market_wide_circuit_breaker_status_message_record.timestamp_1);
  market_wide_circuit_breaker_status_message_record.message_id = wire[at]; at = at + 1;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 4 -> market_wide_circuit_breaker_status_message_record.transaction_id[market_wide_circuit_breaker_status_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> market_wide_circuit_breaker_status_message_record.participant_reference_number[market_wide_circuit_breaker_status_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_record.market_wide_circuit_breaker_level_indicator = wire[at]; at = at + 1;
  market_wide_circuit_breaker_status_message_record.reserved = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Wide Circuit Breaker Status Message is what was written, byte for byte */
inline equal_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_read, market_wide_circuit_breaker_status_message_written) {
  assert(market_wide_circuit_breaker_status_message_read.participant_id == market_wide_circuit_breaker_status_message_written.participant_id);
  equal_timestamp1(market_wide_circuit_breaker_status_message_read.timestamp_1, market_wide_circuit_breaker_status_message_written.timestamp_1);
  assert(market_wide_circuit_breaker_status_message_read.message_id == market_wide_circuit_breaker_status_message_written.message_id);
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 4 -> assert(market_wide_circuit_breaker_status_message_read.transaction_id[market_wide_circuit_breaker_status_message_at] == market_wide_circuit_breaker_status_message_written.transaction_id[market_wide_circuit_breaker_status_message_at]); market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> assert(market_wide_circuit_breaker_status_message_read.participant_reference_number[market_wide_circuit_breaker_status_message_at] == market_wide_circuit_breaker_status_message_written.participant_reference_number[market_wide_circuit_breaker_status_message_at]); market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  assert(market_wide_circuit_breaker_status_message_read.market_wide_circuit_breaker_level_indicator == market_wide_circuit_breaker_status_message_written.market_wide_circuit_breaker_level_indicator);
  assert(market_wide_circuit_breaker_status_message_read.reserved == market_wide_circuit_breaker_status_message_written.reserved);
  skip
}

/* ---- Approximate Trades And Total Dollar Value Message: 34 bytes ------------- */

/* The Approximate Trades and Total Dollar Value message allows a Participant to report the total trades and total dollar value of trades at their respective market centers. */
typedef ApproximateTradesAndTotalDollarValueMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte total_trades[4];
  byte dollar_value[8]
};

int approximate_trades_and_total_dollar_value_message_at;

/* every byte of Approximate Trades And Total Dollar Value Message set to one value */
inline fill_approximate_trades_and_total_dollar_value_message(approximate_trades_and_total_dollar_value_message_record, approximate_trades_and_total_dollar_value_message_value) {
  approximate_trades_and_total_dollar_value_message_record.participant_id = approximate_trades_and_total_dollar_value_message_value;
  fill_timestamp1(approximate_trades_and_total_dollar_value_message_record.timestamp_1, approximate_trades_and_total_dollar_value_message_value);
  approximate_trades_and_total_dollar_value_message_record.message_id = approximate_trades_and_total_dollar_value_message_value;
  approximate_trades_and_total_dollar_value_message_at = 0;
  do
  :: approximate_trades_and_total_dollar_value_message_at < 4 -> approximate_trades_and_total_dollar_value_message_record.transaction_id[approximate_trades_and_total_dollar_value_message_at] = approximate_trades_and_total_dollar_value_message_value; approximate_trades_and_total_dollar_value_message_at = approximate_trades_and_total_dollar_value_message_at + 1
  :: else -> break
  od;
  approximate_trades_and_total_dollar_value_message_at = 0;
  do
  :: approximate_trades_and_total_dollar_value_message_at < 8 -> approximate_trades_and_total_dollar_value_message_record.participant_reference_number[approximate_trades_and_total_dollar_value_message_at] = approximate_trades_and_total_dollar_value_message_value; approximate_trades_and_total_dollar_value_message_at = approximate_trades_and_total_dollar_value_message_at + 1
  :: else -> break
  od;
  approximate_trades_and_total_dollar_value_message_at = 0;
  do
  :: approximate_trades_and_total_dollar_value_message_at < 4 -> approximate_trades_and_total_dollar_value_message_record.total_trades[approximate_trades_and_total_dollar_value_message_at] = approximate_trades_and_total_dollar_value_message_value; approximate_trades_and_total_dollar_value_message_at = approximate_trades_and_total_dollar_value_message_at + 1
  :: else -> break
  od;
  approximate_trades_and_total_dollar_value_message_at = 0;
  do
  :: approximate_trades_and_total_dollar_value_message_at < 8 -> approximate_trades_and_total_dollar_value_message_record.dollar_value[approximate_trades_and_total_dollar_value_message_at] = approximate_trades_and_total_dollar_value_message_value; approximate_trades_and_total_dollar_value_message_at = approximate_trades_and_total_dollar_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Approximate Trades And Total Dollar Value Message set to where it lies, so a field read out of place says so */
inline ramp_approximate_trades_and_total_dollar_value_message(approximate_trades_and_total_dollar_value_message_record, approximate_trades_and_total_dollar_value_message_base) {
  approximate_trades_and_total_dollar_value_message_record.participant_id = (approximate_trades_and_total_dollar_value_message_base + 0 + 1) % 256;
  ramp_timestamp1(approximate_trades_and_total_dollar_value_message_record.timestamp_1, approximate_trades_and_total_dollar_value_message_base + 1);
  approximate_trades_and_total_dollar_value_message_record.message_id = (approximate_trades_and_total_dollar_value_message_base + 9 + 1) % 256;
  approximate_trades_and_total_dollar_value_message_at = 0;
  do
  :: approximate_trades_and_total_dollar_value_message_at < 4 -> approximate_trades_and_total_dollar_value_message_record.transaction_id[approximate_trades_and_total_dollar_value_message_at] = (approximate_trades_and_total_dollar_value_message_base + 10 + approximate_trades_and_total_dollar_value_message_at + 1) % 256; approximate_trades_and_total_dollar_value_message_at = approximate_trades_and_total_dollar_value_message_at + 1
  :: else -> break
  od;
  approximate_trades_and_total_dollar_value_message_at = 0;
  do
  :: approximate_trades_and_total_dollar_value_message_at < 8 -> approximate_trades_and_total_dollar_value_message_record.participant_reference_number[approximate_trades_and_total_dollar_value_message_at] = (approximate_trades_and_total_dollar_value_message_base + 14 + approximate_trades_and_total_dollar_value_message_at + 1) % 256; approximate_trades_and_total_dollar_value_message_at = approximate_trades_and_total_dollar_value_message_at + 1
  :: else -> break
  od;
  approximate_trades_and_total_dollar_value_message_at = 0;
  do
  :: approximate_trades_and_total_dollar_value_message_at < 4 -> approximate_trades_and_total_dollar_value_message_record.total_trades[approximate_trades_and_total_dollar_value_message_at] = (approximate_trades_and_total_dollar_value_message_base + 22 + approximate_trades_and_total_dollar_value_message_at + 1) % 256; approximate_trades_and_total_dollar_value_message_at = approximate_trades_and_total_dollar_value_message_at + 1
  :: else -> break
  od;
  approximate_trades_and_total_dollar_value_message_at = 0;
  do
  :: approximate_trades_and_total_dollar_value_message_at < 8 -> approximate_trades_and_total_dollar_value_message_record.dollar_value[approximate_trades_and_total_dollar_value_message_at] = (approximate_trades_and_total_dollar_value_message_base + 26 + approximate_trades_and_total_dollar_value_message_at + 1) % 256; approximate_trades_and_total_dollar_value_message_at = approximate_trades_and_total_dollar_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* Approximate Trades And Total Dollar Value Message to the wire, 34 bytes from where the cursor stands */
inline encode_approximate_trades_and_total_dollar_value_message(approximate_trades_and_total_dollar_value_message_record) {
  wire[at] = approximate_trades_and_total_dollar_value_message_record.participant_id; at = at + 1;
  encode_timestamp1(approximate_trades_and_total_dollar_value_message_record.timestamp_1);
  wire[at] = approximate_trades_and_total_dollar_value_message_record.message_id; at = at + 1;
  approximate_trades_and_total_dollar_value_message_at = 0;
  do
  :: approximate_trades_and_total_dollar_value_message_at < 4 -> wire[at] = approximate_trades_and_total_dollar_value_message_record.transaction_id[approximate_trades_and_total_dollar_value_message_at]; at = at + 1; approximate_trades_and_total_dollar_value_message_at = approximate_trades_and_total_dollar_value_message_at + 1
  :: else -> break
  od;
  approximate_trades_and_total_dollar_value_message_at = 0;
  do
  :: approximate_trades_and_total_dollar_value_message_at < 8 -> wire[at] = approximate_trades_and_total_dollar_value_message_record.participant_reference_number[approximate_trades_and_total_dollar_value_message_at]; at = at + 1; approximate_trades_and_total_dollar_value_message_at = approximate_trades_and_total_dollar_value_message_at + 1
  :: else -> break
  od;
  approximate_trades_and_total_dollar_value_message_at = 0;
  do
  :: approximate_trades_and_total_dollar_value_message_at < 4 -> wire[at] = approximate_trades_and_total_dollar_value_message_record.total_trades[approximate_trades_and_total_dollar_value_message_at]; at = at + 1; approximate_trades_and_total_dollar_value_message_at = approximate_trades_and_total_dollar_value_message_at + 1
  :: else -> break
  od;
  approximate_trades_and_total_dollar_value_message_at = 0;
  do
  :: approximate_trades_and_total_dollar_value_message_at < 8 -> wire[at] = approximate_trades_and_total_dollar_value_message_record.dollar_value[approximate_trades_and_total_dollar_value_message_at]; at = at + 1; approximate_trades_and_total_dollar_value_message_at = approximate_trades_and_total_dollar_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* Approximate Trades And Total Dollar Value Message off the wire, 34 bytes from where the cursor stands */
inline decode_approximate_trades_and_total_dollar_value_message(approximate_trades_and_total_dollar_value_message_record) {
  approximate_trades_and_total_dollar_value_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(approximate_trades_and_total_dollar_value_message_record.timestamp_1);
  approximate_trades_and_total_dollar_value_message_record.message_id = wire[at]; at = at + 1;
  approximate_trades_and_total_dollar_value_message_at = 0;
  do
  :: approximate_trades_and_total_dollar_value_message_at < 4 -> approximate_trades_and_total_dollar_value_message_record.transaction_id[approximate_trades_and_total_dollar_value_message_at] = wire[at]; at = at + 1; approximate_trades_and_total_dollar_value_message_at = approximate_trades_and_total_dollar_value_message_at + 1
  :: else -> break
  od;
  approximate_trades_and_total_dollar_value_message_at = 0;
  do
  :: approximate_trades_and_total_dollar_value_message_at < 8 -> approximate_trades_and_total_dollar_value_message_record.participant_reference_number[approximate_trades_and_total_dollar_value_message_at] = wire[at]; at = at + 1; approximate_trades_and_total_dollar_value_message_at = approximate_trades_and_total_dollar_value_message_at + 1
  :: else -> break
  od;
  approximate_trades_and_total_dollar_value_message_at = 0;
  do
  :: approximate_trades_and_total_dollar_value_message_at < 4 -> approximate_trades_and_total_dollar_value_message_record.total_trades[approximate_trades_and_total_dollar_value_message_at] = wire[at]; at = at + 1; approximate_trades_and_total_dollar_value_message_at = approximate_trades_and_total_dollar_value_message_at + 1
  :: else -> break
  od;
  approximate_trades_and_total_dollar_value_message_at = 0;
  do
  :: approximate_trades_and_total_dollar_value_message_at < 8 -> approximate_trades_and_total_dollar_value_message_record.dollar_value[approximate_trades_and_total_dollar_value_message_at] = wire[at]; at = at + 1; approximate_trades_and_total_dollar_value_message_at = approximate_trades_and_total_dollar_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Approximate Trades And Total Dollar Value Message is what was written, byte for byte */
inline equal_approximate_trades_and_total_dollar_value_message(approximate_trades_and_total_dollar_value_message_read, approximate_trades_and_total_dollar_value_message_written) {
  assert(approximate_trades_and_total_dollar_value_message_read.participant_id == approximate_trades_and_total_dollar_value_message_written.participant_id);
  equal_timestamp1(approximate_trades_and_total_dollar_value_message_read.timestamp_1, approximate_trades_and_total_dollar_value_message_written.timestamp_1);
  assert(approximate_trades_and_total_dollar_value_message_read.message_id == approximate_trades_and_total_dollar_value_message_written.message_id);
  approximate_trades_and_total_dollar_value_message_at = 0;
  do
  :: approximate_trades_and_total_dollar_value_message_at < 4 -> assert(approximate_trades_and_total_dollar_value_message_read.transaction_id[approximate_trades_and_total_dollar_value_message_at] == approximate_trades_and_total_dollar_value_message_written.transaction_id[approximate_trades_and_total_dollar_value_message_at]); approximate_trades_and_total_dollar_value_message_at = approximate_trades_and_total_dollar_value_message_at + 1
  :: else -> break
  od;
  approximate_trades_and_total_dollar_value_message_at = 0;
  do
  :: approximate_trades_and_total_dollar_value_message_at < 8 -> assert(approximate_trades_and_total_dollar_value_message_read.participant_reference_number[approximate_trades_and_total_dollar_value_message_at] == approximate_trades_and_total_dollar_value_message_written.participant_reference_number[approximate_trades_and_total_dollar_value_message_at]); approximate_trades_and_total_dollar_value_message_at = approximate_trades_and_total_dollar_value_message_at + 1
  :: else -> break
  od;
  approximate_trades_and_total_dollar_value_message_at = 0;
  do
  :: approximate_trades_and_total_dollar_value_message_at < 4 -> assert(approximate_trades_and_total_dollar_value_message_read.total_trades[approximate_trades_and_total_dollar_value_message_at] == approximate_trades_and_total_dollar_value_message_written.total_trades[approximate_trades_and_total_dollar_value_message_at]); approximate_trades_and_total_dollar_value_message_at = approximate_trades_and_total_dollar_value_message_at + 1
  :: else -> break
  od;
  approximate_trades_and_total_dollar_value_message_at = 0;
  do
  :: approximate_trades_and_total_dollar_value_message_at < 8 -> assert(approximate_trades_and_total_dollar_value_message_read.dollar_value[approximate_trades_and_total_dollar_value_message_at] == approximate_trades_and_total_dollar_value_message_written.dollar_value[approximate_trades_and_total_dollar_value_message_at]); approximate_trades_and_total_dollar_value_message_at = approximate_trades_and_total_dollar_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Crossing Session Summary Message: 46 bytes ------------------------------ */

/* The Crossing Session message is used to report the total volume and dollar value of trades transacted after the close of a Participant’s regular session. */
typedef CrossingSessionSummaryMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte crossing_session_i_total_trades_volume[8];
  byte crossing_session_ii_dollar_value[8];
  byte crossing_session_ii_total_trades_volume[8]
};

int crossing_session_summary_message_at;

/* every byte of Crossing Session Summary Message set to one value */
inline fill_crossing_session_summary_message(crossing_session_summary_message_record, crossing_session_summary_message_value) {
  crossing_session_summary_message_record.participant_id = crossing_session_summary_message_value;
  fill_timestamp1(crossing_session_summary_message_record.timestamp_1, crossing_session_summary_message_value);
  crossing_session_summary_message_record.message_id = crossing_session_summary_message_value;
  crossing_session_summary_message_at = 0;
  do
  :: crossing_session_summary_message_at < 4 -> crossing_session_summary_message_record.transaction_id[crossing_session_summary_message_at] = crossing_session_summary_message_value; crossing_session_summary_message_at = crossing_session_summary_message_at + 1
  :: else -> break
  od;
  crossing_session_summary_message_at = 0;
  do
  :: crossing_session_summary_message_at < 8 -> crossing_session_summary_message_record.participant_reference_number[crossing_session_summary_message_at] = crossing_session_summary_message_value; crossing_session_summary_message_at = crossing_session_summary_message_at + 1
  :: else -> break
  od;
  crossing_session_summary_message_at = 0;
  do
  :: crossing_session_summary_message_at < 8 -> crossing_session_summary_message_record.crossing_session_i_total_trades_volume[crossing_session_summary_message_at] = crossing_session_summary_message_value; crossing_session_summary_message_at = crossing_session_summary_message_at + 1
  :: else -> break
  od;
  crossing_session_summary_message_at = 0;
  do
  :: crossing_session_summary_message_at < 8 -> crossing_session_summary_message_record.crossing_session_ii_dollar_value[crossing_session_summary_message_at] = crossing_session_summary_message_value; crossing_session_summary_message_at = crossing_session_summary_message_at + 1
  :: else -> break
  od;
  crossing_session_summary_message_at = 0;
  do
  :: crossing_session_summary_message_at < 8 -> crossing_session_summary_message_record.crossing_session_ii_total_trades_volume[crossing_session_summary_message_at] = crossing_session_summary_message_value; crossing_session_summary_message_at = crossing_session_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Crossing Session Summary Message set to where it lies, so a field read out of place says so */
inline ramp_crossing_session_summary_message(crossing_session_summary_message_record, crossing_session_summary_message_base) {
  crossing_session_summary_message_record.participant_id = (crossing_session_summary_message_base + 0 + 1) % 256;
  ramp_timestamp1(crossing_session_summary_message_record.timestamp_1, crossing_session_summary_message_base + 1);
  crossing_session_summary_message_record.message_id = (crossing_session_summary_message_base + 9 + 1) % 256;
  crossing_session_summary_message_at = 0;
  do
  :: crossing_session_summary_message_at < 4 -> crossing_session_summary_message_record.transaction_id[crossing_session_summary_message_at] = (crossing_session_summary_message_base + 10 + crossing_session_summary_message_at + 1) % 256; crossing_session_summary_message_at = crossing_session_summary_message_at + 1
  :: else -> break
  od;
  crossing_session_summary_message_at = 0;
  do
  :: crossing_session_summary_message_at < 8 -> crossing_session_summary_message_record.participant_reference_number[crossing_session_summary_message_at] = (crossing_session_summary_message_base + 14 + crossing_session_summary_message_at + 1) % 256; crossing_session_summary_message_at = crossing_session_summary_message_at + 1
  :: else -> break
  od;
  crossing_session_summary_message_at = 0;
  do
  :: crossing_session_summary_message_at < 8 -> crossing_session_summary_message_record.crossing_session_i_total_trades_volume[crossing_session_summary_message_at] = (crossing_session_summary_message_base + 22 + crossing_session_summary_message_at + 1) % 256; crossing_session_summary_message_at = crossing_session_summary_message_at + 1
  :: else -> break
  od;
  crossing_session_summary_message_at = 0;
  do
  :: crossing_session_summary_message_at < 8 -> crossing_session_summary_message_record.crossing_session_ii_dollar_value[crossing_session_summary_message_at] = (crossing_session_summary_message_base + 30 + crossing_session_summary_message_at + 1) % 256; crossing_session_summary_message_at = crossing_session_summary_message_at + 1
  :: else -> break
  od;
  crossing_session_summary_message_at = 0;
  do
  :: crossing_session_summary_message_at < 8 -> crossing_session_summary_message_record.crossing_session_ii_total_trades_volume[crossing_session_summary_message_at] = (crossing_session_summary_message_base + 38 + crossing_session_summary_message_at + 1) % 256; crossing_session_summary_message_at = crossing_session_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Crossing Session Summary Message to the wire, 46 bytes from where the cursor stands */
inline encode_crossing_session_summary_message(crossing_session_summary_message_record) {
  wire[at] = crossing_session_summary_message_record.participant_id; at = at + 1;
  encode_timestamp1(crossing_session_summary_message_record.timestamp_1);
  wire[at] = crossing_session_summary_message_record.message_id; at = at + 1;
  crossing_session_summary_message_at = 0;
  do
  :: crossing_session_summary_message_at < 4 -> wire[at] = crossing_session_summary_message_record.transaction_id[crossing_session_summary_message_at]; at = at + 1; crossing_session_summary_message_at = crossing_session_summary_message_at + 1
  :: else -> break
  od;
  crossing_session_summary_message_at = 0;
  do
  :: crossing_session_summary_message_at < 8 -> wire[at] = crossing_session_summary_message_record.participant_reference_number[crossing_session_summary_message_at]; at = at + 1; crossing_session_summary_message_at = crossing_session_summary_message_at + 1
  :: else -> break
  od;
  crossing_session_summary_message_at = 0;
  do
  :: crossing_session_summary_message_at < 8 -> wire[at] = crossing_session_summary_message_record.crossing_session_i_total_trades_volume[crossing_session_summary_message_at]; at = at + 1; crossing_session_summary_message_at = crossing_session_summary_message_at + 1
  :: else -> break
  od;
  crossing_session_summary_message_at = 0;
  do
  :: crossing_session_summary_message_at < 8 -> wire[at] = crossing_session_summary_message_record.crossing_session_ii_dollar_value[crossing_session_summary_message_at]; at = at + 1; crossing_session_summary_message_at = crossing_session_summary_message_at + 1
  :: else -> break
  od;
  crossing_session_summary_message_at = 0;
  do
  :: crossing_session_summary_message_at < 8 -> wire[at] = crossing_session_summary_message_record.crossing_session_ii_total_trades_volume[crossing_session_summary_message_at]; at = at + 1; crossing_session_summary_message_at = crossing_session_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Crossing Session Summary Message off the wire, 46 bytes from where the cursor stands */
inline decode_crossing_session_summary_message(crossing_session_summary_message_record) {
  crossing_session_summary_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(crossing_session_summary_message_record.timestamp_1);
  crossing_session_summary_message_record.message_id = wire[at]; at = at + 1;
  crossing_session_summary_message_at = 0;
  do
  :: crossing_session_summary_message_at < 4 -> crossing_session_summary_message_record.transaction_id[crossing_session_summary_message_at] = wire[at]; at = at + 1; crossing_session_summary_message_at = crossing_session_summary_message_at + 1
  :: else -> break
  od;
  crossing_session_summary_message_at = 0;
  do
  :: crossing_session_summary_message_at < 8 -> crossing_session_summary_message_record.participant_reference_number[crossing_session_summary_message_at] = wire[at]; at = at + 1; crossing_session_summary_message_at = crossing_session_summary_message_at + 1
  :: else -> break
  od;
  crossing_session_summary_message_at = 0;
  do
  :: crossing_session_summary_message_at < 8 -> crossing_session_summary_message_record.crossing_session_i_total_trades_volume[crossing_session_summary_message_at] = wire[at]; at = at + 1; crossing_session_summary_message_at = crossing_session_summary_message_at + 1
  :: else -> break
  od;
  crossing_session_summary_message_at = 0;
  do
  :: crossing_session_summary_message_at < 8 -> crossing_session_summary_message_record.crossing_session_ii_dollar_value[crossing_session_summary_message_at] = wire[at]; at = at + 1; crossing_session_summary_message_at = crossing_session_summary_message_at + 1
  :: else -> break
  od;
  crossing_session_summary_message_at = 0;
  do
  :: crossing_session_summary_message_at < 8 -> crossing_session_summary_message_record.crossing_session_ii_total_trades_volume[crossing_session_summary_message_at] = wire[at]; at = at + 1; crossing_session_summary_message_at = crossing_session_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Crossing Session Summary Message is what was written, byte for byte */
inline equal_crossing_session_summary_message(crossing_session_summary_message_read, crossing_session_summary_message_written) {
  assert(crossing_session_summary_message_read.participant_id == crossing_session_summary_message_written.participant_id);
  equal_timestamp1(crossing_session_summary_message_read.timestamp_1, crossing_session_summary_message_written.timestamp_1);
  assert(crossing_session_summary_message_read.message_id == crossing_session_summary_message_written.message_id);
  crossing_session_summary_message_at = 0;
  do
  :: crossing_session_summary_message_at < 4 -> assert(crossing_session_summary_message_read.transaction_id[crossing_session_summary_message_at] == crossing_session_summary_message_written.transaction_id[crossing_session_summary_message_at]); crossing_session_summary_message_at = crossing_session_summary_message_at + 1
  :: else -> break
  od;
  crossing_session_summary_message_at = 0;
  do
  :: crossing_session_summary_message_at < 8 -> assert(crossing_session_summary_message_read.participant_reference_number[crossing_session_summary_message_at] == crossing_session_summary_message_written.participant_reference_number[crossing_session_summary_message_at]); crossing_session_summary_message_at = crossing_session_summary_message_at + 1
  :: else -> break
  od;
  crossing_session_summary_message_at = 0;
  do
  :: crossing_session_summary_message_at < 8 -> assert(crossing_session_summary_message_read.crossing_session_i_total_trades_volume[crossing_session_summary_message_at] == crossing_session_summary_message_written.crossing_session_i_total_trades_volume[crossing_session_summary_message_at]); crossing_session_summary_message_at = crossing_session_summary_message_at + 1
  :: else -> break
  od;
  crossing_session_summary_message_at = 0;
  do
  :: crossing_session_summary_message_at < 8 -> assert(crossing_session_summary_message_read.crossing_session_ii_dollar_value[crossing_session_summary_message_at] == crossing_session_summary_message_written.crossing_session_ii_dollar_value[crossing_session_summary_message_at]); crossing_session_summary_message_at = crossing_session_summary_message_at + 1
  :: else -> break
  od;
  crossing_session_summary_message_at = 0;
  do
  :: crossing_session_summary_message_at < 8 -> assert(crossing_session_summary_message_read.crossing_session_ii_total_trades_volume[crossing_session_summary_message_at] == crossing_session_summary_message_written.crossing_session_ii_total_trades_volume[crossing_session_summary_message_at]); crossing_session_summary_message_at = crossing_session_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sale Conditions: 4 bytes ------------------------------------------------ */

/* Sale Conditions */
typedef SaleConditions {
  byte settlement_type;
  byte trade_through_exempt_reason;
  byte extended_hours_or_sequence_type;
  byte sro_trade_detail
};

/* every byte of Sale Conditions set to one value */
inline fill_sale_conditions(sale_conditions_record, sale_conditions_value) {
  sale_conditions_record.settlement_type = sale_conditions_value;
  sale_conditions_record.trade_through_exempt_reason = sale_conditions_value;
  sale_conditions_record.extended_hours_or_sequence_type = sale_conditions_value;
  sale_conditions_record.sro_trade_detail = sale_conditions_value;
  skip
}

/* each byte of Sale Conditions set to where it lies, so a field read out of place says so */
inline ramp_sale_conditions(sale_conditions_record, sale_conditions_base) {
  sale_conditions_record.settlement_type = (sale_conditions_base + 0 + 1) % 256;
  sale_conditions_record.trade_through_exempt_reason = (sale_conditions_base + 1 + 1) % 256;
  sale_conditions_record.extended_hours_or_sequence_type = (sale_conditions_base + 2 + 1) % 256;
  sale_conditions_record.sro_trade_detail = (sale_conditions_base + 3 + 1) % 256;
  skip
}

/* Sale Conditions to the wire, 4 bytes from where the cursor stands */
inline encode_sale_conditions(sale_conditions_record) {
  wire[at] = sale_conditions_record.settlement_type; at = at + 1;
  wire[at] = sale_conditions_record.trade_through_exempt_reason; at = at + 1;
  wire[at] = sale_conditions_record.extended_hours_or_sequence_type; at = at + 1;
  wire[at] = sale_conditions_record.sro_trade_detail; at = at + 1;
  skip
}

/* Sale Conditions off the wire, 4 bytes from where the cursor stands */
inline decode_sale_conditions(sale_conditions_record) {
  sale_conditions_record.settlement_type = wire[at]; at = at + 1;
  sale_conditions_record.trade_through_exempt_reason = wire[at]; at = at + 1;
  sale_conditions_record.extended_hours_or_sequence_type = wire[at]; at = at + 1;
  sale_conditions_record.sro_trade_detail = wire[at]; at = at + 1;
  skip
}

/* what was read of Sale Conditions is what was written, byte for byte */
inline equal_sale_conditions(sale_conditions_read, sale_conditions_written) {
  assert(sale_conditions_read.settlement_type == sale_conditions_written.settlement_type);
  assert(sale_conditions_read.trade_through_exempt_reason == sale_conditions_written.trade_through_exempt_reason);
  assert(sale_conditions_read.extended_hours_or_sequence_type == sale_conditions_written.extended_hours_or_sequence_type);
  assert(sale_conditions_read.sro_trade_detail == sale_conditions_written.sro_trade_detail);
  skip
}

/* ---- Prior Day Trade Date And Time: 8 bytes ---------------------------------- */

/* Prior Day Trade Date and Time */
typedef PriorDayTradeDateAndTime {
  byte seconds[4];
  byte nanoseconds[4]
};

int prior_day_trade_date_and_time_at;

/* every byte of Prior Day Trade Date And Time set to one value */
inline fill_prior_day_trade_date_and_time(prior_day_trade_date_and_time_record, prior_day_trade_date_and_time_value) {
  prior_day_trade_date_and_time_at = 0;
  do
  :: prior_day_trade_date_and_time_at < 4 -> prior_day_trade_date_and_time_record.seconds[prior_day_trade_date_and_time_at] = prior_day_trade_date_and_time_value; prior_day_trade_date_and_time_at = prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  prior_day_trade_date_and_time_at = 0;
  do
  :: prior_day_trade_date_and_time_at < 4 -> prior_day_trade_date_and_time_record.nanoseconds[prior_day_trade_date_and_time_at] = prior_day_trade_date_and_time_value; prior_day_trade_date_and_time_at = prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Prior Day Trade Date And Time set to where it lies, so a field read out of place says so */
inline ramp_prior_day_trade_date_and_time(prior_day_trade_date_and_time_record, prior_day_trade_date_and_time_base) {
  prior_day_trade_date_and_time_at = 0;
  do
  :: prior_day_trade_date_and_time_at < 4 -> prior_day_trade_date_and_time_record.seconds[prior_day_trade_date_and_time_at] = (prior_day_trade_date_and_time_base + 0 + prior_day_trade_date_and_time_at + 1) % 256; prior_day_trade_date_and_time_at = prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  prior_day_trade_date_and_time_at = 0;
  do
  :: prior_day_trade_date_and_time_at < 4 -> prior_day_trade_date_and_time_record.nanoseconds[prior_day_trade_date_and_time_at] = (prior_day_trade_date_and_time_base + 4 + prior_day_trade_date_and_time_at + 1) % 256; prior_day_trade_date_and_time_at = prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  skip
}

/* Prior Day Trade Date And Time to the wire, 8 bytes from where the cursor stands */
inline encode_prior_day_trade_date_and_time(prior_day_trade_date_and_time_record) {
  prior_day_trade_date_and_time_at = 0;
  do
  :: prior_day_trade_date_and_time_at < 4 -> wire[at] = prior_day_trade_date_and_time_record.seconds[prior_day_trade_date_and_time_at]; at = at + 1; prior_day_trade_date_and_time_at = prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  prior_day_trade_date_and_time_at = 0;
  do
  :: prior_day_trade_date_and_time_at < 4 -> wire[at] = prior_day_trade_date_and_time_record.nanoseconds[prior_day_trade_date_and_time_at]; at = at + 1; prior_day_trade_date_and_time_at = prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  skip
}

/* Prior Day Trade Date And Time off the wire, 8 bytes from where the cursor stands */
inline decode_prior_day_trade_date_and_time(prior_day_trade_date_and_time_record) {
  prior_day_trade_date_and_time_at = 0;
  do
  :: prior_day_trade_date_and_time_at < 4 -> prior_day_trade_date_and_time_record.seconds[prior_day_trade_date_and_time_at] = wire[at]; at = at + 1; prior_day_trade_date_and_time_at = prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  prior_day_trade_date_and_time_at = 0;
  do
  :: prior_day_trade_date_and_time_at < 4 -> prior_day_trade_date_and_time_record.nanoseconds[prior_day_trade_date_and_time_at] = wire[at]; at = at + 1; prior_day_trade_date_and_time_at = prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Prior Day Trade Date And Time is what was written, byte for byte */
inline equal_prior_day_trade_date_and_time(prior_day_trade_date_and_time_read, prior_day_trade_date_and_time_written) {
  prior_day_trade_date_and_time_at = 0;
  do
  :: prior_day_trade_date_and_time_at < 4 -> assert(prior_day_trade_date_and_time_read.seconds[prior_day_trade_date_and_time_at] == prior_day_trade_date_and_time_written.seconds[prior_day_trade_date_and_time_at]); prior_day_trade_date_and_time_at = prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  prior_day_trade_date_and_time_at = 0;
  do
  :: prior_day_trade_date_and_time_at < 4 -> assert(prior_day_trade_date_and_time_read.nanoseconds[prior_day_trade_date_and_time_at] == prior_day_trade_date_and_time_written.nanoseconds[prior_day_trade_date_and_time_at]); prior_day_trade_date_and_time_at = prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Prior Day Corrected Trade: 28 bytes ------------------------------------- */

/* Prior Day Corrected Trade */
typedef PriorDayCorrectedTrade {
  SaleConditions sale_conditions;
  byte trade_price[8];
  byte trade_volume[4];
  byte sellers_sale_days;
  byte stop_stock_indicator;
  byte trade_through_exempt_indicator;
  byte short_sale_restriction_indicator;
  PriorDayTradeDateAndTime prior_day_trade_date_and_time
};

int prior_day_corrected_trade_at;

/* every byte of Prior Day Corrected Trade set to one value */
inline fill_prior_day_corrected_trade(prior_day_corrected_trade_record, prior_day_corrected_trade_value) {
  fill_sale_conditions(prior_day_corrected_trade_record.sale_conditions, prior_day_corrected_trade_value);
  prior_day_corrected_trade_at = 0;
  do
  :: prior_day_corrected_trade_at < 8 -> prior_day_corrected_trade_record.trade_price[prior_day_corrected_trade_at] = prior_day_corrected_trade_value; prior_day_corrected_trade_at = prior_day_corrected_trade_at + 1
  :: else -> break
  od;
  prior_day_corrected_trade_at = 0;
  do
  :: prior_day_corrected_trade_at < 4 -> prior_day_corrected_trade_record.trade_volume[prior_day_corrected_trade_at] = prior_day_corrected_trade_value; prior_day_corrected_trade_at = prior_day_corrected_trade_at + 1
  :: else -> break
  od;
  prior_day_corrected_trade_record.sellers_sale_days = prior_day_corrected_trade_value;
  prior_day_corrected_trade_record.stop_stock_indicator = prior_day_corrected_trade_value;
  prior_day_corrected_trade_record.trade_through_exempt_indicator = prior_day_corrected_trade_value;
  prior_day_corrected_trade_record.short_sale_restriction_indicator = prior_day_corrected_trade_value;
  fill_prior_day_trade_date_and_time(prior_day_corrected_trade_record.prior_day_trade_date_and_time, prior_day_corrected_trade_value);
  skip
}

/* each byte of Prior Day Corrected Trade set to where it lies, so a field read out of place says so */
inline ramp_prior_day_corrected_trade(prior_day_corrected_trade_record, prior_day_corrected_trade_base) {
  ramp_sale_conditions(prior_day_corrected_trade_record.sale_conditions, prior_day_corrected_trade_base + 0);
  prior_day_corrected_trade_at = 0;
  do
  :: prior_day_corrected_trade_at < 8 -> prior_day_corrected_trade_record.trade_price[prior_day_corrected_trade_at] = (prior_day_corrected_trade_base + 4 + prior_day_corrected_trade_at + 1) % 256; prior_day_corrected_trade_at = prior_day_corrected_trade_at + 1
  :: else -> break
  od;
  prior_day_corrected_trade_at = 0;
  do
  :: prior_day_corrected_trade_at < 4 -> prior_day_corrected_trade_record.trade_volume[prior_day_corrected_trade_at] = (prior_day_corrected_trade_base + 12 + prior_day_corrected_trade_at + 1) % 256; prior_day_corrected_trade_at = prior_day_corrected_trade_at + 1
  :: else -> break
  od;
  prior_day_corrected_trade_record.sellers_sale_days = (prior_day_corrected_trade_base + 16 + 1) % 256;
  prior_day_corrected_trade_record.stop_stock_indicator = (prior_day_corrected_trade_base + 17 + 1) % 256;
  prior_day_corrected_trade_record.trade_through_exempt_indicator = (prior_day_corrected_trade_base + 18 + 1) % 256;
  prior_day_corrected_trade_record.short_sale_restriction_indicator = (prior_day_corrected_trade_base + 19 + 1) % 256;
  ramp_prior_day_trade_date_and_time(prior_day_corrected_trade_record.prior_day_trade_date_and_time, prior_day_corrected_trade_base + 20);
  skip
}

/* Prior Day Corrected Trade to the wire, 28 bytes from where the cursor stands */
inline encode_prior_day_corrected_trade(prior_day_corrected_trade_record) {
  encode_sale_conditions(prior_day_corrected_trade_record.sale_conditions);
  prior_day_corrected_trade_at = 0;
  do
  :: prior_day_corrected_trade_at < 8 -> wire[at] = prior_day_corrected_trade_record.trade_price[prior_day_corrected_trade_at]; at = at + 1; prior_day_corrected_trade_at = prior_day_corrected_trade_at + 1
  :: else -> break
  od;
  prior_day_corrected_trade_at = 0;
  do
  :: prior_day_corrected_trade_at < 4 -> wire[at] = prior_day_corrected_trade_record.trade_volume[prior_day_corrected_trade_at]; at = at + 1; prior_day_corrected_trade_at = prior_day_corrected_trade_at + 1
  :: else -> break
  od;
  wire[at] = prior_day_corrected_trade_record.sellers_sale_days; at = at + 1;
  wire[at] = prior_day_corrected_trade_record.stop_stock_indicator; at = at + 1;
  wire[at] = prior_day_corrected_trade_record.trade_through_exempt_indicator; at = at + 1;
  wire[at] = prior_day_corrected_trade_record.short_sale_restriction_indicator; at = at + 1;
  encode_prior_day_trade_date_and_time(prior_day_corrected_trade_record.prior_day_trade_date_and_time);
  skip
}

/* Prior Day Corrected Trade off the wire, 28 bytes from where the cursor stands */
inline decode_prior_day_corrected_trade(prior_day_corrected_trade_record) {
  decode_sale_conditions(prior_day_corrected_trade_record.sale_conditions);
  prior_day_corrected_trade_at = 0;
  do
  :: prior_day_corrected_trade_at < 8 -> prior_day_corrected_trade_record.trade_price[prior_day_corrected_trade_at] = wire[at]; at = at + 1; prior_day_corrected_trade_at = prior_day_corrected_trade_at + 1
  :: else -> break
  od;
  prior_day_corrected_trade_at = 0;
  do
  :: prior_day_corrected_trade_at < 4 -> prior_day_corrected_trade_record.trade_volume[prior_day_corrected_trade_at] = wire[at]; at = at + 1; prior_day_corrected_trade_at = prior_day_corrected_trade_at + 1
  :: else -> break
  od;
  prior_day_corrected_trade_record.sellers_sale_days = wire[at]; at = at + 1;
  prior_day_corrected_trade_record.stop_stock_indicator = wire[at]; at = at + 1;
  prior_day_corrected_trade_record.trade_through_exempt_indicator = wire[at]; at = at + 1;
  prior_day_corrected_trade_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  decode_prior_day_trade_date_and_time(prior_day_corrected_trade_record.prior_day_trade_date_and_time);
  skip
}

/* what was read of Prior Day Corrected Trade is what was written, byte for byte */
inline equal_prior_day_corrected_trade(prior_day_corrected_trade_read, prior_day_corrected_trade_written) {
  equal_sale_conditions(prior_day_corrected_trade_read.sale_conditions, prior_day_corrected_trade_written.sale_conditions);
  prior_day_corrected_trade_at = 0;
  do
  :: prior_day_corrected_trade_at < 8 -> assert(prior_day_corrected_trade_read.trade_price[prior_day_corrected_trade_at] == prior_day_corrected_trade_written.trade_price[prior_day_corrected_trade_at]); prior_day_corrected_trade_at = prior_day_corrected_trade_at + 1
  :: else -> break
  od;
  prior_day_corrected_trade_at = 0;
  do
  :: prior_day_corrected_trade_at < 4 -> assert(prior_day_corrected_trade_read.trade_volume[prior_day_corrected_trade_at] == prior_day_corrected_trade_written.trade_volume[prior_day_corrected_trade_at]); prior_day_corrected_trade_at = prior_day_corrected_trade_at + 1
  :: else -> break
  od;
  assert(prior_day_corrected_trade_read.sellers_sale_days == prior_day_corrected_trade_written.sellers_sale_days);
  assert(prior_day_corrected_trade_read.stop_stock_indicator == prior_day_corrected_trade_written.stop_stock_indicator);
  assert(prior_day_corrected_trade_read.trade_through_exempt_indicator == prior_day_corrected_trade_written.trade_through_exempt_indicator);
  assert(prior_day_corrected_trade_read.short_sale_restriction_indicator == prior_day_corrected_trade_written.short_sale_restriction_indicator);
  equal_prior_day_trade_date_and_time(prior_day_corrected_trade_read.prior_day_trade_date_and_time, prior_day_corrected_trade_written.prior_day_trade_date_and_time);
  skip
}

/* ---- Prior Day Original Trade: 28 bytes -------------------------------------- */

/* Prior Day Original Trade */
typedef PriorDayOriginalTrade {
  SaleConditions sale_conditions;
  byte trade_price[8];
  byte trade_volume[4];
  byte sellers_sale_days;
  byte stop_stock_indicator;
  byte trade_through_exempt_indicator;
  byte short_sale_restriction_indicator;
  PriorDayTradeDateAndTime prior_day_trade_date_and_time
};

int prior_day_original_trade_at;

/* every byte of Prior Day Original Trade set to one value */
inline fill_prior_day_original_trade(prior_day_original_trade_record, prior_day_original_trade_value) {
  fill_sale_conditions(prior_day_original_trade_record.sale_conditions, prior_day_original_trade_value);
  prior_day_original_trade_at = 0;
  do
  :: prior_day_original_trade_at < 8 -> prior_day_original_trade_record.trade_price[prior_day_original_trade_at] = prior_day_original_trade_value; prior_day_original_trade_at = prior_day_original_trade_at + 1
  :: else -> break
  od;
  prior_day_original_trade_at = 0;
  do
  :: prior_day_original_trade_at < 4 -> prior_day_original_trade_record.trade_volume[prior_day_original_trade_at] = prior_day_original_trade_value; prior_day_original_trade_at = prior_day_original_trade_at + 1
  :: else -> break
  od;
  prior_day_original_trade_record.sellers_sale_days = prior_day_original_trade_value;
  prior_day_original_trade_record.stop_stock_indicator = prior_day_original_trade_value;
  prior_day_original_trade_record.trade_through_exempt_indicator = prior_day_original_trade_value;
  prior_day_original_trade_record.short_sale_restriction_indicator = prior_day_original_trade_value;
  fill_prior_day_trade_date_and_time(prior_day_original_trade_record.prior_day_trade_date_and_time, prior_day_original_trade_value);
  skip
}

/* each byte of Prior Day Original Trade set to where it lies, so a field read out of place says so */
inline ramp_prior_day_original_trade(prior_day_original_trade_record, prior_day_original_trade_base) {
  ramp_sale_conditions(prior_day_original_trade_record.sale_conditions, prior_day_original_trade_base + 0);
  prior_day_original_trade_at = 0;
  do
  :: prior_day_original_trade_at < 8 -> prior_day_original_trade_record.trade_price[prior_day_original_trade_at] = (prior_day_original_trade_base + 4 + prior_day_original_trade_at + 1) % 256; prior_day_original_trade_at = prior_day_original_trade_at + 1
  :: else -> break
  od;
  prior_day_original_trade_at = 0;
  do
  :: prior_day_original_trade_at < 4 -> prior_day_original_trade_record.trade_volume[prior_day_original_trade_at] = (prior_day_original_trade_base + 12 + prior_day_original_trade_at + 1) % 256; prior_day_original_trade_at = prior_day_original_trade_at + 1
  :: else -> break
  od;
  prior_day_original_trade_record.sellers_sale_days = (prior_day_original_trade_base + 16 + 1) % 256;
  prior_day_original_trade_record.stop_stock_indicator = (prior_day_original_trade_base + 17 + 1) % 256;
  prior_day_original_trade_record.trade_through_exempt_indicator = (prior_day_original_trade_base + 18 + 1) % 256;
  prior_day_original_trade_record.short_sale_restriction_indicator = (prior_day_original_trade_base + 19 + 1) % 256;
  ramp_prior_day_trade_date_and_time(prior_day_original_trade_record.prior_day_trade_date_and_time, prior_day_original_trade_base + 20);
  skip
}

/* Prior Day Original Trade to the wire, 28 bytes from where the cursor stands */
inline encode_prior_day_original_trade(prior_day_original_trade_record) {
  encode_sale_conditions(prior_day_original_trade_record.sale_conditions);
  prior_day_original_trade_at = 0;
  do
  :: prior_day_original_trade_at < 8 -> wire[at] = prior_day_original_trade_record.trade_price[prior_day_original_trade_at]; at = at + 1; prior_day_original_trade_at = prior_day_original_trade_at + 1
  :: else -> break
  od;
  prior_day_original_trade_at = 0;
  do
  :: prior_day_original_trade_at < 4 -> wire[at] = prior_day_original_trade_record.trade_volume[prior_day_original_trade_at]; at = at + 1; prior_day_original_trade_at = prior_day_original_trade_at + 1
  :: else -> break
  od;
  wire[at] = prior_day_original_trade_record.sellers_sale_days; at = at + 1;
  wire[at] = prior_day_original_trade_record.stop_stock_indicator; at = at + 1;
  wire[at] = prior_day_original_trade_record.trade_through_exempt_indicator; at = at + 1;
  wire[at] = prior_day_original_trade_record.short_sale_restriction_indicator; at = at + 1;
  encode_prior_day_trade_date_and_time(prior_day_original_trade_record.prior_day_trade_date_and_time);
  skip
}

/* Prior Day Original Trade off the wire, 28 bytes from where the cursor stands */
inline decode_prior_day_original_trade(prior_day_original_trade_record) {
  decode_sale_conditions(prior_day_original_trade_record.sale_conditions);
  prior_day_original_trade_at = 0;
  do
  :: prior_day_original_trade_at < 8 -> prior_day_original_trade_record.trade_price[prior_day_original_trade_at] = wire[at]; at = at + 1; prior_day_original_trade_at = prior_day_original_trade_at + 1
  :: else -> break
  od;
  prior_day_original_trade_at = 0;
  do
  :: prior_day_original_trade_at < 4 -> prior_day_original_trade_record.trade_volume[prior_day_original_trade_at] = wire[at]; at = at + 1; prior_day_original_trade_at = prior_day_original_trade_at + 1
  :: else -> break
  od;
  prior_day_original_trade_record.sellers_sale_days = wire[at]; at = at + 1;
  prior_day_original_trade_record.stop_stock_indicator = wire[at]; at = at + 1;
  prior_day_original_trade_record.trade_through_exempt_indicator = wire[at]; at = at + 1;
  prior_day_original_trade_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  decode_prior_day_trade_date_and_time(prior_day_original_trade_record.prior_day_trade_date_and_time);
  skip
}

/* what was read of Prior Day Original Trade is what was written, byte for byte */
inline equal_prior_day_original_trade(prior_day_original_trade_read, prior_day_original_trade_written) {
  equal_sale_conditions(prior_day_original_trade_read.sale_conditions, prior_day_original_trade_written.sale_conditions);
  prior_day_original_trade_at = 0;
  do
  :: prior_day_original_trade_at < 8 -> assert(prior_day_original_trade_read.trade_price[prior_day_original_trade_at] == prior_day_original_trade_written.trade_price[prior_day_original_trade_at]); prior_day_original_trade_at = prior_day_original_trade_at + 1
  :: else -> break
  od;
  prior_day_original_trade_at = 0;
  do
  :: prior_day_original_trade_at < 4 -> assert(prior_day_original_trade_read.trade_volume[prior_day_original_trade_at] == prior_day_original_trade_written.trade_volume[prior_day_original_trade_at]); prior_day_original_trade_at = prior_day_original_trade_at + 1
  :: else -> break
  od;
  assert(prior_day_original_trade_read.sellers_sale_days == prior_day_original_trade_written.sellers_sale_days);
  assert(prior_day_original_trade_read.stop_stock_indicator == prior_day_original_trade_written.stop_stock_indicator);
  assert(prior_day_original_trade_read.trade_through_exempt_indicator == prior_day_original_trade_written.trade_through_exempt_indicator);
  assert(prior_day_original_trade_read.short_sale_restriction_indicator == prior_day_original_trade_written.short_sale_restriction_indicator);
  equal_prior_day_trade_date_and_time(prior_day_original_trade_read.prior_day_trade_date_and_time, prior_day_original_trade_written.prior_day_trade_date_and_time);
  skip
}

/* ---- Prior Day Trade Correction Message: 91 bytes ---------------------------- */

/* Prior Day messages are used to report CTA eligible Equity, Local Issue or Bond trades, corrections, cancels or errors for transactions that occurred earlier than the current trading day and had not been reported */
typedef PriorDayTradeCorrectionMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte security_symbol[11];
  byte instrument_type;
  PriorDayCorrectedTrade prior_day_corrected_trade;
  byte trade_reporting_facility_id;
  PriorDayOriginalTrade prior_day_original_trade
};

int prior_day_trade_correction_message_at;

/* every byte of Prior Day Trade Correction Message set to one value */
inline fill_prior_day_trade_correction_message(prior_day_trade_correction_message_record, prior_day_trade_correction_message_value) {
  prior_day_trade_correction_message_record.participant_id = prior_day_trade_correction_message_value;
  fill_timestamp1(prior_day_trade_correction_message_record.timestamp_1, prior_day_trade_correction_message_value);
  prior_day_trade_correction_message_record.message_id = prior_day_trade_correction_message_value;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 4 -> prior_day_trade_correction_message_record.transaction_id[prior_day_trade_correction_message_at] = prior_day_trade_correction_message_value; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 8 -> prior_day_trade_correction_message_record.participant_reference_number[prior_day_trade_correction_message_at] = prior_day_trade_correction_message_value; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 11 -> prior_day_trade_correction_message_record.security_symbol[prior_day_trade_correction_message_at] = prior_day_trade_correction_message_value; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_record.instrument_type = prior_day_trade_correction_message_value;
  fill_prior_day_corrected_trade(prior_day_trade_correction_message_record.prior_day_corrected_trade, prior_day_trade_correction_message_value);
  prior_day_trade_correction_message_record.trade_reporting_facility_id = prior_day_trade_correction_message_value;
  fill_prior_day_original_trade(prior_day_trade_correction_message_record.prior_day_original_trade, prior_day_trade_correction_message_value);
  skip
}

/* each byte of Prior Day Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_prior_day_trade_correction_message(prior_day_trade_correction_message_record, prior_day_trade_correction_message_base) {
  prior_day_trade_correction_message_record.participant_id = (prior_day_trade_correction_message_base + 0 + 1) % 256;
  ramp_timestamp1(prior_day_trade_correction_message_record.timestamp_1, prior_day_trade_correction_message_base + 1);
  prior_day_trade_correction_message_record.message_id = (prior_day_trade_correction_message_base + 9 + 1) % 256;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 4 -> prior_day_trade_correction_message_record.transaction_id[prior_day_trade_correction_message_at] = (prior_day_trade_correction_message_base + 10 + prior_day_trade_correction_message_at + 1) % 256; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 8 -> prior_day_trade_correction_message_record.participant_reference_number[prior_day_trade_correction_message_at] = (prior_day_trade_correction_message_base + 14 + prior_day_trade_correction_message_at + 1) % 256; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 11 -> prior_day_trade_correction_message_record.security_symbol[prior_day_trade_correction_message_at] = (prior_day_trade_correction_message_base + 22 + prior_day_trade_correction_message_at + 1) % 256; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_record.instrument_type = (prior_day_trade_correction_message_base + 33 + 1) % 256;
  ramp_prior_day_corrected_trade(prior_day_trade_correction_message_record.prior_day_corrected_trade, prior_day_trade_correction_message_base + 34);
  prior_day_trade_correction_message_record.trade_reporting_facility_id = (prior_day_trade_correction_message_base + 62 + 1) % 256;
  ramp_prior_day_original_trade(prior_day_trade_correction_message_record.prior_day_original_trade, prior_day_trade_correction_message_base + 63);
  skip
}

/* Prior Day Trade Correction Message to the wire, 91 bytes from where the cursor stands */
inline encode_prior_day_trade_correction_message(prior_day_trade_correction_message_record) {
  wire[at] = prior_day_trade_correction_message_record.participant_id; at = at + 1;
  encode_timestamp1(prior_day_trade_correction_message_record.timestamp_1);
  wire[at] = prior_day_trade_correction_message_record.message_id; at = at + 1;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 4 -> wire[at] = prior_day_trade_correction_message_record.transaction_id[prior_day_trade_correction_message_at]; at = at + 1; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 8 -> wire[at] = prior_day_trade_correction_message_record.participant_reference_number[prior_day_trade_correction_message_at]; at = at + 1; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 11 -> wire[at] = prior_day_trade_correction_message_record.security_symbol[prior_day_trade_correction_message_at]; at = at + 1; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = prior_day_trade_correction_message_record.instrument_type; at = at + 1;
  encode_prior_day_corrected_trade(prior_day_trade_correction_message_record.prior_day_corrected_trade);
  wire[at] = prior_day_trade_correction_message_record.trade_reporting_facility_id; at = at + 1;
  encode_prior_day_original_trade(prior_day_trade_correction_message_record.prior_day_original_trade);
  skip
}

/* Prior Day Trade Correction Message off the wire, 91 bytes from where the cursor stands */
inline decode_prior_day_trade_correction_message(prior_day_trade_correction_message_record) {
  prior_day_trade_correction_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(prior_day_trade_correction_message_record.timestamp_1);
  prior_day_trade_correction_message_record.message_id = wire[at]; at = at + 1;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 4 -> prior_day_trade_correction_message_record.transaction_id[prior_day_trade_correction_message_at] = wire[at]; at = at + 1; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 8 -> prior_day_trade_correction_message_record.participant_reference_number[prior_day_trade_correction_message_at] = wire[at]; at = at + 1; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 11 -> prior_day_trade_correction_message_record.security_symbol[prior_day_trade_correction_message_at] = wire[at]; at = at + 1; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_record.instrument_type = wire[at]; at = at + 1;
  decode_prior_day_corrected_trade(prior_day_trade_correction_message_record.prior_day_corrected_trade);
  prior_day_trade_correction_message_record.trade_reporting_facility_id = wire[at]; at = at + 1;
  decode_prior_day_original_trade(prior_day_trade_correction_message_record.prior_day_original_trade);
  skip
}

/* what was read of Prior Day Trade Correction Message is what was written, byte for byte */
inline equal_prior_day_trade_correction_message(prior_day_trade_correction_message_read, prior_day_trade_correction_message_written) {
  assert(prior_day_trade_correction_message_read.participant_id == prior_day_trade_correction_message_written.participant_id);
  equal_timestamp1(prior_day_trade_correction_message_read.timestamp_1, prior_day_trade_correction_message_written.timestamp_1);
  assert(prior_day_trade_correction_message_read.message_id == prior_day_trade_correction_message_written.message_id);
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 4 -> assert(prior_day_trade_correction_message_read.transaction_id[prior_day_trade_correction_message_at] == prior_day_trade_correction_message_written.transaction_id[prior_day_trade_correction_message_at]); prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 8 -> assert(prior_day_trade_correction_message_read.participant_reference_number[prior_day_trade_correction_message_at] == prior_day_trade_correction_message_written.participant_reference_number[prior_day_trade_correction_message_at]); prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 11 -> assert(prior_day_trade_correction_message_read.security_symbol[prior_day_trade_correction_message_at] == prior_day_trade_correction_message_written.security_symbol[prior_day_trade_correction_message_at]); prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  assert(prior_day_trade_correction_message_read.instrument_type == prior_day_trade_correction_message_written.instrument_type);
  equal_prior_day_corrected_trade(prior_day_trade_correction_message_read.prior_day_corrected_trade, prior_day_trade_correction_message_written.prior_day_corrected_trade);
  assert(prior_day_trade_correction_message_read.trade_reporting_facility_id == prior_day_trade_correction_message_written.trade_reporting_facility_id);
  equal_prior_day_original_trade(prior_day_trade_correction_message_read.prior_day_original_trade, prior_day_trade_correction_message_written.prior_day_original_trade);
  skip
}

/* ---- Fractional Prior Day Corrected Trade: 32 bytes -------------------------- */

/* Fractional Prior Day Corrected Trade */
typedef FractionalPriorDayCorrectedTrade {
  SaleConditions sale_conditions;
  byte trade_price[8];
  byte fractional_trade_volume[8];
  byte sellers_sale_days;
  byte stop_stock_indicator;
  byte trade_through_exempt_indicator;
  byte short_sale_restriction_indicator;
  PriorDayTradeDateAndTime prior_day_trade_date_and_time
};

int fractional_prior_day_corrected_trade_at;

/* every byte of Fractional Prior Day Corrected Trade set to one value */
inline fill_fractional_prior_day_corrected_trade(fractional_prior_day_corrected_trade_record, fractional_prior_day_corrected_trade_value) {
  fill_sale_conditions(fractional_prior_day_corrected_trade_record.sale_conditions, fractional_prior_day_corrected_trade_value);
  fractional_prior_day_corrected_trade_at = 0;
  do
  :: fractional_prior_day_corrected_trade_at < 8 -> fractional_prior_day_corrected_trade_record.trade_price[fractional_prior_day_corrected_trade_at] = fractional_prior_day_corrected_trade_value; fractional_prior_day_corrected_trade_at = fractional_prior_day_corrected_trade_at + 1
  :: else -> break
  od;
  fractional_prior_day_corrected_trade_at = 0;
  do
  :: fractional_prior_day_corrected_trade_at < 8 -> fractional_prior_day_corrected_trade_record.fractional_trade_volume[fractional_prior_day_corrected_trade_at] = fractional_prior_day_corrected_trade_value; fractional_prior_day_corrected_trade_at = fractional_prior_day_corrected_trade_at + 1
  :: else -> break
  od;
  fractional_prior_day_corrected_trade_record.sellers_sale_days = fractional_prior_day_corrected_trade_value;
  fractional_prior_day_corrected_trade_record.stop_stock_indicator = fractional_prior_day_corrected_trade_value;
  fractional_prior_day_corrected_trade_record.trade_through_exempt_indicator = fractional_prior_day_corrected_trade_value;
  fractional_prior_day_corrected_trade_record.short_sale_restriction_indicator = fractional_prior_day_corrected_trade_value;
  fill_prior_day_trade_date_and_time(fractional_prior_day_corrected_trade_record.prior_day_trade_date_and_time, fractional_prior_day_corrected_trade_value);
  skip
}

/* each byte of Fractional Prior Day Corrected Trade set to where it lies, so a field read out of place says so */
inline ramp_fractional_prior_day_corrected_trade(fractional_prior_day_corrected_trade_record, fractional_prior_day_corrected_trade_base) {
  ramp_sale_conditions(fractional_prior_day_corrected_trade_record.sale_conditions, fractional_prior_day_corrected_trade_base + 0);
  fractional_prior_day_corrected_trade_at = 0;
  do
  :: fractional_prior_day_corrected_trade_at < 8 -> fractional_prior_day_corrected_trade_record.trade_price[fractional_prior_day_corrected_trade_at] = (fractional_prior_day_corrected_trade_base + 4 + fractional_prior_day_corrected_trade_at + 1) % 256; fractional_prior_day_corrected_trade_at = fractional_prior_day_corrected_trade_at + 1
  :: else -> break
  od;
  fractional_prior_day_corrected_trade_at = 0;
  do
  :: fractional_prior_day_corrected_trade_at < 8 -> fractional_prior_day_corrected_trade_record.fractional_trade_volume[fractional_prior_day_corrected_trade_at] = (fractional_prior_day_corrected_trade_base + 12 + fractional_prior_day_corrected_trade_at + 1) % 256; fractional_prior_day_corrected_trade_at = fractional_prior_day_corrected_trade_at + 1
  :: else -> break
  od;
  fractional_prior_day_corrected_trade_record.sellers_sale_days = (fractional_prior_day_corrected_trade_base + 20 + 1) % 256;
  fractional_prior_day_corrected_trade_record.stop_stock_indicator = (fractional_prior_day_corrected_trade_base + 21 + 1) % 256;
  fractional_prior_day_corrected_trade_record.trade_through_exempt_indicator = (fractional_prior_day_corrected_trade_base + 22 + 1) % 256;
  fractional_prior_day_corrected_trade_record.short_sale_restriction_indicator = (fractional_prior_day_corrected_trade_base + 23 + 1) % 256;
  ramp_prior_day_trade_date_and_time(fractional_prior_day_corrected_trade_record.prior_day_trade_date_and_time, fractional_prior_day_corrected_trade_base + 24);
  skip
}

/* Fractional Prior Day Corrected Trade to the wire, 32 bytes from where the cursor stands */
inline encode_fractional_prior_day_corrected_trade(fractional_prior_day_corrected_trade_record) {
  encode_sale_conditions(fractional_prior_day_corrected_trade_record.sale_conditions);
  fractional_prior_day_corrected_trade_at = 0;
  do
  :: fractional_prior_day_corrected_trade_at < 8 -> wire[at] = fractional_prior_day_corrected_trade_record.trade_price[fractional_prior_day_corrected_trade_at]; at = at + 1; fractional_prior_day_corrected_trade_at = fractional_prior_day_corrected_trade_at + 1
  :: else -> break
  od;
  fractional_prior_day_corrected_trade_at = 0;
  do
  :: fractional_prior_day_corrected_trade_at < 8 -> wire[at] = fractional_prior_day_corrected_trade_record.fractional_trade_volume[fractional_prior_day_corrected_trade_at]; at = at + 1; fractional_prior_day_corrected_trade_at = fractional_prior_day_corrected_trade_at + 1
  :: else -> break
  od;
  wire[at] = fractional_prior_day_corrected_trade_record.sellers_sale_days; at = at + 1;
  wire[at] = fractional_prior_day_corrected_trade_record.stop_stock_indicator; at = at + 1;
  wire[at] = fractional_prior_day_corrected_trade_record.trade_through_exempt_indicator; at = at + 1;
  wire[at] = fractional_prior_day_corrected_trade_record.short_sale_restriction_indicator; at = at + 1;
  encode_prior_day_trade_date_and_time(fractional_prior_day_corrected_trade_record.prior_day_trade_date_and_time);
  skip
}

/* Fractional Prior Day Corrected Trade off the wire, 32 bytes from where the cursor stands */
inline decode_fractional_prior_day_corrected_trade(fractional_prior_day_corrected_trade_record) {
  decode_sale_conditions(fractional_prior_day_corrected_trade_record.sale_conditions);
  fractional_prior_day_corrected_trade_at = 0;
  do
  :: fractional_prior_day_corrected_trade_at < 8 -> fractional_prior_day_corrected_trade_record.trade_price[fractional_prior_day_corrected_trade_at] = wire[at]; at = at + 1; fractional_prior_day_corrected_trade_at = fractional_prior_day_corrected_trade_at + 1
  :: else -> break
  od;
  fractional_prior_day_corrected_trade_at = 0;
  do
  :: fractional_prior_day_corrected_trade_at < 8 -> fractional_prior_day_corrected_trade_record.fractional_trade_volume[fractional_prior_day_corrected_trade_at] = wire[at]; at = at + 1; fractional_prior_day_corrected_trade_at = fractional_prior_day_corrected_trade_at + 1
  :: else -> break
  od;
  fractional_prior_day_corrected_trade_record.sellers_sale_days = wire[at]; at = at + 1;
  fractional_prior_day_corrected_trade_record.stop_stock_indicator = wire[at]; at = at + 1;
  fractional_prior_day_corrected_trade_record.trade_through_exempt_indicator = wire[at]; at = at + 1;
  fractional_prior_day_corrected_trade_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  decode_prior_day_trade_date_and_time(fractional_prior_day_corrected_trade_record.prior_day_trade_date_and_time);
  skip
}

/* what was read of Fractional Prior Day Corrected Trade is what was written, byte for byte */
inline equal_fractional_prior_day_corrected_trade(fractional_prior_day_corrected_trade_read, fractional_prior_day_corrected_trade_written) {
  equal_sale_conditions(fractional_prior_day_corrected_trade_read.sale_conditions, fractional_prior_day_corrected_trade_written.sale_conditions);
  fractional_prior_day_corrected_trade_at = 0;
  do
  :: fractional_prior_day_corrected_trade_at < 8 -> assert(fractional_prior_day_corrected_trade_read.trade_price[fractional_prior_day_corrected_trade_at] == fractional_prior_day_corrected_trade_written.trade_price[fractional_prior_day_corrected_trade_at]); fractional_prior_day_corrected_trade_at = fractional_prior_day_corrected_trade_at + 1
  :: else -> break
  od;
  fractional_prior_day_corrected_trade_at = 0;
  do
  :: fractional_prior_day_corrected_trade_at < 8 -> assert(fractional_prior_day_corrected_trade_read.fractional_trade_volume[fractional_prior_day_corrected_trade_at] == fractional_prior_day_corrected_trade_written.fractional_trade_volume[fractional_prior_day_corrected_trade_at]); fractional_prior_day_corrected_trade_at = fractional_prior_day_corrected_trade_at + 1
  :: else -> break
  od;
  assert(fractional_prior_day_corrected_trade_read.sellers_sale_days == fractional_prior_day_corrected_trade_written.sellers_sale_days);
  assert(fractional_prior_day_corrected_trade_read.stop_stock_indicator == fractional_prior_day_corrected_trade_written.stop_stock_indicator);
  assert(fractional_prior_day_corrected_trade_read.trade_through_exempt_indicator == fractional_prior_day_corrected_trade_written.trade_through_exempt_indicator);
  assert(fractional_prior_day_corrected_trade_read.short_sale_restriction_indicator == fractional_prior_day_corrected_trade_written.short_sale_restriction_indicator);
  equal_prior_day_trade_date_and_time(fractional_prior_day_corrected_trade_read.prior_day_trade_date_and_time, fractional_prior_day_corrected_trade_written.prior_day_trade_date_and_time);
  skip
}

/* ---- Fractional Prior Day Original Trade: 32 bytes --------------------------- */

/* Fractional Prior Day Original Trade */
typedef FractionalPriorDayOriginalTrade {
  SaleConditions sale_conditions;
  byte trade_price[8];
  byte fractional_trade_volume[8];
  byte sellers_sale_days;
  byte stop_stock_indicator;
  byte trade_through_exempt_indicator;
  byte short_sale_restriction_indicator;
  PriorDayTradeDateAndTime prior_day_trade_date_and_time
};

int fractional_prior_day_original_trade_at;

/* every byte of Fractional Prior Day Original Trade set to one value */
inline fill_fractional_prior_day_original_trade(fractional_prior_day_original_trade_record, fractional_prior_day_original_trade_value) {
  fill_sale_conditions(fractional_prior_day_original_trade_record.sale_conditions, fractional_prior_day_original_trade_value);
  fractional_prior_day_original_trade_at = 0;
  do
  :: fractional_prior_day_original_trade_at < 8 -> fractional_prior_day_original_trade_record.trade_price[fractional_prior_day_original_trade_at] = fractional_prior_day_original_trade_value; fractional_prior_day_original_trade_at = fractional_prior_day_original_trade_at + 1
  :: else -> break
  od;
  fractional_prior_day_original_trade_at = 0;
  do
  :: fractional_prior_day_original_trade_at < 8 -> fractional_prior_day_original_trade_record.fractional_trade_volume[fractional_prior_day_original_trade_at] = fractional_prior_day_original_trade_value; fractional_prior_day_original_trade_at = fractional_prior_day_original_trade_at + 1
  :: else -> break
  od;
  fractional_prior_day_original_trade_record.sellers_sale_days = fractional_prior_day_original_trade_value;
  fractional_prior_day_original_trade_record.stop_stock_indicator = fractional_prior_day_original_trade_value;
  fractional_prior_day_original_trade_record.trade_through_exempt_indicator = fractional_prior_day_original_trade_value;
  fractional_prior_day_original_trade_record.short_sale_restriction_indicator = fractional_prior_day_original_trade_value;
  fill_prior_day_trade_date_and_time(fractional_prior_day_original_trade_record.prior_day_trade_date_and_time, fractional_prior_day_original_trade_value);
  skip
}

/* each byte of Fractional Prior Day Original Trade set to where it lies, so a field read out of place says so */
inline ramp_fractional_prior_day_original_trade(fractional_prior_day_original_trade_record, fractional_prior_day_original_trade_base) {
  ramp_sale_conditions(fractional_prior_day_original_trade_record.sale_conditions, fractional_prior_day_original_trade_base + 0);
  fractional_prior_day_original_trade_at = 0;
  do
  :: fractional_prior_day_original_trade_at < 8 -> fractional_prior_day_original_trade_record.trade_price[fractional_prior_day_original_trade_at] = (fractional_prior_day_original_trade_base + 4 + fractional_prior_day_original_trade_at + 1) % 256; fractional_prior_day_original_trade_at = fractional_prior_day_original_trade_at + 1
  :: else -> break
  od;
  fractional_prior_day_original_trade_at = 0;
  do
  :: fractional_prior_day_original_trade_at < 8 -> fractional_prior_day_original_trade_record.fractional_trade_volume[fractional_prior_day_original_trade_at] = (fractional_prior_day_original_trade_base + 12 + fractional_prior_day_original_trade_at + 1) % 256; fractional_prior_day_original_trade_at = fractional_prior_day_original_trade_at + 1
  :: else -> break
  od;
  fractional_prior_day_original_trade_record.sellers_sale_days = (fractional_prior_day_original_trade_base + 20 + 1) % 256;
  fractional_prior_day_original_trade_record.stop_stock_indicator = (fractional_prior_day_original_trade_base + 21 + 1) % 256;
  fractional_prior_day_original_trade_record.trade_through_exempt_indicator = (fractional_prior_day_original_trade_base + 22 + 1) % 256;
  fractional_prior_day_original_trade_record.short_sale_restriction_indicator = (fractional_prior_day_original_trade_base + 23 + 1) % 256;
  ramp_prior_day_trade_date_and_time(fractional_prior_day_original_trade_record.prior_day_trade_date_and_time, fractional_prior_day_original_trade_base + 24);
  skip
}

/* Fractional Prior Day Original Trade to the wire, 32 bytes from where the cursor stands */
inline encode_fractional_prior_day_original_trade(fractional_prior_day_original_trade_record) {
  encode_sale_conditions(fractional_prior_day_original_trade_record.sale_conditions);
  fractional_prior_day_original_trade_at = 0;
  do
  :: fractional_prior_day_original_trade_at < 8 -> wire[at] = fractional_prior_day_original_trade_record.trade_price[fractional_prior_day_original_trade_at]; at = at + 1; fractional_prior_day_original_trade_at = fractional_prior_day_original_trade_at + 1
  :: else -> break
  od;
  fractional_prior_day_original_trade_at = 0;
  do
  :: fractional_prior_day_original_trade_at < 8 -> wire[at] = fractional_prior_day_original_trade_record.fractional_trade_volume[fractional_prior_day_original_trade_at]; at = at + 1; fractional_prior_day_original_trade_at = fractional_prior_day_original_trade_at + 1
  :: else -> break
  od;
  wire[at] = fractional_prior_day_original_trade_record.sellers_sale_days; at = at + 1;
  wire[at] = fractional_prior_day_original_trade_record.stop_stock_indicator; at = at + 1;
  wire[at] = fractional_prior_day_original_trade_record.trade_through_exempt_indicator; at = at + 1;
  wire[at] = fractional_prior_day_original_trade_record.short_sale_restriction_indicator; at = at + 1;
  encode_prior_day_trade_date_and_time(fractional_prior_day_original_trade_record.prior_day_trade_date_and_time);
  skip
}

/* Fractional Prior Day Original Trade off the wire, 32 bytes from where the cursor stands */
inline decode_fractional_prior_day_original_trade(fractional_prior_day_original_trade_record) {
  decode_sale_conditions(fractional_prior_day_original_trade_record.sale_conditions);
  fractional_prior_day_original_trade_at = 0;
  do
  :: fractional_prior_day_original_trade_at < 8 -> fractional_prior_day_original_trade_record.trade_price[fractional_prior_day_original_trade_at] = wire[at]; at = at + 1; fractional_prior_day_original_trade_at = fractional_prior_day_original_trade_at + 1
  :: else -> break
  od;
  fractional_prior_day_original_trade_at = 0;
  do
  :: fractional_prior_day_original_trade_at < 8 -> fractional_prior_day_original_trade_record.fractional_trade_volume[fractional_prior_day_original_trade_at] = wire[at]; at = at + 1; fractional_prior_day_original_trade_at = fractional_prior_day_original_trade_at + 1
  :: else -> break
  od;
  fractional_prior_day_original_trade_record.sellers_sale_days = wire[at]; at = at + 1;
  fractional_prior_day_original_trade_record.stop_stock_indicator = wire[at]; at = at + 1;
  fractional_prior_day_original_trade_record.trade_through_exempt_indicator = wire[at]; at = at + 1;
  fractional_prior_day_original_trade_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  decode_prior_day_trade_date_and_time(fractional_prior_day_original_trade_record.prior_day_trade_date_and_time);
  skip
}

/* what was read of Fractional Prior Day Original Trade is what was written, byte for byte */
inline equal_fractional_prior_day_original_trade(fractional_prior_day_original_trade_read, fractional_prior_day_original_trade_written) {
  equal_sale_conditions(fractional_prior_day_original_trade_read.sale_conditions, fractional_prior_day_original_trade_written.sale_conditions);
  fractional_prior_day_original_trade_at = 0;
  do
  :: fractional_prior_day_original_trade_at < 8 -> assert(fractional_prior_day_original_trade_read.trade_price[fractional_prior_day_original_trade_at] == fractional_prior_day_original_trade_written.trade_price[fractional_prior_day_original_trade_at]); fractional_prior_day_original_trade_at = fractional_prior_day_original_trade_at + 1
  :: else -> break
  od;
  fractional_prior_day_original_trade_at = 0;
  do
  :: fractional_prior_day_original_trade_at < 8 -> assert(fractional_prior_day_original_trade_read.fractional_trade_volume[fractional_prior_day_original_trade_at] == fractional_prior_day_original_trade_written.fractional_trade_volume[fractional_prior_day_original_trade_at]); fractional_prior_day_original_trade_at = fractional_prior_day_original_trade_at + 1
  :: else -> break
  od;
  assert(fractional_prior_day_original_trade_read.sellers_sale_days == fractional_prior_day_original_trade_written.sellers_sale_days);
  assert(fractional_prior_day_original_trade_read.stop_stock_indicator == fractional_prior_day_original_trade_written.stop_stock_indicator);
  assert(fractional_prior_day_original_trade_read.trade_through_exempt_indicator == fractional_prior_day_original_trade_written.trade_through_exempt_indicator);
  assert(fractional_prior_day_original_trade_read.short_sale_restriction_indicator == fractional_prior_day_original_trade_written.short_sale_restriction_indicator);
  equal_prior_day_trade_date_and_time(fractional_prior_day_original_trade_read.prior_day_trade_date_and_time, fractional_prior_day_original_trade_written.prior_day_trade_date_and_time);
  skip
}

/* ---- Fractional Prior Day Trade Correction Message: 99 bytes ----------------- */

/* Prior Day messages are used to report CTA eligible Equity, Local Issue or Bond trades, corrections, cancels or errors for transactions that occurred earlier than the current trading day and had not been reported */
typedef FractionalPriorDayTradeCorrectionMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte security_symbol[11];
  byte instrument_type;
  FractionalPriorDayCorrectedTrade fractional_prior_day_corrected_trade;
  byte trade_reporting_facility_id;
  FractionalPriorDayOriginalTrade fractional_prior_day_original_trade
};

int fractional_prior_day_trade_correction_message_at;

/* every byte of Fractional Prior Day Trade Correction Message set to one value */
inline fill_fractional_prior_day_trade_correction_message(fractional_prior_day_trade_correction_message_record, fractional_prior_day_trade_correction_message_value) {
  fractional_prior_day_trade_correction_message_record.participant_id = fractional_prior_day_trade_correction_message_value;
  fill_timestamp1(fractional_prior_day_trade_correction_message_record.timestamp_1, fractional_prior_day_trade_correction_message_value);
  fractional_prior_day_trade_correction_message_record.message_id = fractional_prior_day_trade_correction_message_value;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 4 -> fractional_prior_day_trade_correction_message_record.transaction_id[fractional_prior_day_trade_correction_message_at] = fractional_prior_day_trade_correction_message_value; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 8 -> fractional_prior_day_trade_correction_message_record.participant_reference_number[fractional_prior_day_trade_correction_message_at] = fractional_prior_day_trade_correction_message_value; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 11 -> fractional_prior_day_trade_correction_message_record.security_symbol[fractional_prior_day_trade_correction_message_at] = fractional_prior_day_trade_correction_message_value; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_record.instrument_type = fractional_prior_day_trade_correction_message_value;
  fill_fractional_prior_day_corrected_trade(fractional_prior_day_trade_correction_message_record.fractional_prior_day_corrected_trade, fractional_prior_day_trade_correction_message_value);
  fractional_prior_day_trade_correction_message_record.trade_reporting_facility_id = fractional_prior_day_trade_correction_message_value;
  fill_fractional_prior_day_original_trade(fractional_prior_day_trade_correction_message_record.fractional_prior_day_original_trade, fractional_prior_day_trade_correction_message_value);
  skip
}

/* each byte of Fractional Prior Day Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_fractional_prior_day_trade_correction_message(fractional_prior_day_trade_correction_message_record, fractional_prior_day_trade_correction_message_base) {
  fractional_prior_day_trade_correction_message_record.participant_id = (fractional_prior_day_trade_correction_message_base + 0 + 1) % 256;
  ramp_timestamp1(fractional_prior_day_trade_correction_message_record.timestamp_1, fractional_prior_day_trade_correction_message_base + 1);
  fractional_prior_day_trade_correction_message_record.message_id = (fractional_prior_day_trade_correction_message_base + 9 + 1) % 256;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 4 -> fractional_prior_day_trade_correction_message_record.transaction_id[fractional_prior_day_trade_correction_message_at] = (fractional_prior_day_trade_correction_message_base + 10 + fractional_prior_day_trade_correction_message_at + 1) % 256; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 8 -> fractional_prior_day_trade_correction_message_record.participant_reference_number[fractional_prior_day_trade_correction_message_at] = (fractional_prior_day_trade_correction_message_base + 14 + fractional_prior_day_trade_correction_message_at + 1) % 256; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 11 -> fractional_prior_day_trade_correction_message_record.security_symbol[fractional_prior_day_trade_correction_message_at] = (fractional_prior_day_trade_correction_message_base + 22 + fractional_prior_day_trade_correction_message_at + 1) % 256; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_record.instrument_type = (fractional_prior_day_trade_correction_message_base + 33 + 1) % 256;
  ramp_fractional_prior_day_corrected_trade(fractional_prior_day_trade_correction_message_record.fractional_prior_day_corrected_trade, fractional_prior_day_trade_correction_message_base + 34);
  fractional_prior_day_trade_correction_message_record.trade_reporting_facility_id = (fractional_prior_day_trade_correction_message_base + 66 + 1) % 256;
  ramp_fractional_prior_day_original_trade(fractional_prior_day_trade_correction_message_record.fractional_prior_day_original_trade, fractional_prior_day_trade_correction_message_base + 67);
  skip
}

/* Fractional Prior Day Trade Correction Message to the wire, 99 bytes from where the cursor stands */
inline encode_fractional_prior_day_trade_correction_message(fractional_prior_day_trade_correction_message_record) {
  wire[at] = fractional_prior_day_trade_correction_message_record.participant_id; at = at + 1;
  encode_timestamp1(fractional_prior_day_trade_correction_message_record.timestamp_1);
  wire[at] = fractional_prior_day_trade_correction_message_record.message_id; at = at + 1;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 4 -> wire[at] = fractional_prior_day_trade_correction_message_record.transaction_id[fractional_prior_day_trade_correction_message_at]; at = at + 1; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 8 -> wire[at] = fractional_prior_day_trade_correction_message_record.participant_reference_number[fractional_prior_day_trade_correction_message_at]; at = at + 1; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 11 -> wire[at] = fractional_prior_day_trade_correction_message_record.security_symbol[fractional_prior_day_trade_correction_message_at]; at = at + 1; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_prior_day_trade_correction_message_record.instrument_type; at = at + 1;
  encode_fractional_prior_day_corrected_trade(fractional_prior_day_trade_correction_message_record.fractional_prior_day_corrected_trade);
  wire[at] = fractional_prior_day_trade_correction_message_record.trade_reporting_facility_id; at = at + 1;
  encode_fractional_prior_day_original_trade(fractional_prior_day_trade_correction_message_record.fractional_prior_day_original_trade);
  skip
}

/* Fractional Prior Day Trade Correction Message off the wire, 99 bytes from where the cursor stands */
inline decode_fractional_prior_day_trade_correction_message(fractional_prior_day_trade_correction_message_record) {
  fractional_prior_day_trade_correction_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(fractional_prior_day_trade_correction_message_record.timestamp_1);
  fractional_prior_day_trade_correction_message_record.message_id = wire[at]; at = at + 1;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 4 -> fractional_prior_day_trade_correction_message_record.transaction_id[fractional_prior_day_trade_correction_message_at] = wire[at]; at = at + 1; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 8 -> fractional_prior_day_trade_correction_message_record.participant_reference_number[fractional_prior_day_trade_correction_message_at] = wire[at]; at = at + 1; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 11 -> fractional_prior_day_trade_correction_message_record.security_symbol[fractional_prior_day_trade_correction_message_at] = wire[at]; at = at + 1; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_record.instrument_type = wire[at]; at = at + 1;
  decode_fractional_prior_day_corrected_trade(fractional_prior_day_trade_correction_message_record.fractional_prior_day_corrected_trade);
  fractional_prior_day_trade_correction_message_record.trade_reporting_facility_id = wire[at]; at = at + 1;
  decode_fractional_prior_day_original_trade(fractional_prior_day_trade_correction_message_record.fractional_prior_day_original_trade);
  skip
}

/* what was read of Fractional Prior Day Trade Correction Message is what was written, byte for byte */
inline equal_fractional_prior_day_trade_correction_message(fractional_prior_day_trade_correction_message_read, fractional_prior_day_trade_correction_message_written) {
  assert(fractional_prior_day_trade_correction_message_read.participant_id == fractional_prior_day_trade_correction_message_written.participant_id);
  equal_timestamp1(fractional_prior_day_trade_correction_message_read.timestamp_1, fractional_prior_day_trade_correction_message_written.timestamp_1);
  assert(fractional_prior_day_trade_correction_message_read.message_id == fractional_prior_day_trade_correction_message_written.message_id);
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 4 -> assert(fractional_prior_day_trade_correction_message_read.transaction_id[fractional_prior_day_trade_correction_message_at] == fractional_prior_day_trade_correction_message_written.transaction_id[fractional_prior_day_trade_correction_message_at]); fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 8 -> assert(fractional_prior_day_trade_correction_message_read.participant_reference_number[fractional_prior_day_trade_correction_message_at] == fractional_prior_day_trade_correction_message_written.participant_reference_number[fractional_prior_day_trade_correction_message_at]); fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 11 -> assert(fractional_prior_day_trade_correction_message_read.security_symbol[fractional_prior_day_trade_correction_message_at] == fractional_prior_day_trade_correction_message_written.security_symbol[fractional_prior_day_trade_correction_message_at]); fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  assert(fractional_prior_day_trade_correction_message_read.instrument_type == fractional_prior_day_trade_correction_message_written.instrument_type);
  equal_fractional_prior_day_corrected_trade(fractional_prior_day_trade_correction_message_read.fractional_prior_day_corrected_trade, fractional_prior_day_trade_correction_message_written.fractional_prior_day_corrected_trade);
  assert(fractional_prior_day_trade_correction_message_read.trade_reporting_facility_id == fractional_prior_day_trade_correction_message_written.trade_reporting_facility_id);
  equal_fractional_prior_day_original_trade(fractional_prior_day_trade_correction_message_read.fractional_prior_day_original_trade, fractional_prior_day_trade_correction_message_written.fractional_prior_day_original_trade);
  skip
}

/* ---- Prior Day Trade Message: 63 bytes --------------------------------------- */

/* The Prior Day Trade message is used to report a Cta Equity, Local Issue or Bond transaction which occurred earlier than the current trading day and was not reported. */
typedef PriorDayTradeMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte security_symbol[11];
  byte instrument_type;
  SaleConditions sale_conditions;
  byte trade_price[8];
  byte trade_volume[4];
  byte sellers_sale_days;
  byte stop_stock_indicator;
  byte trade_through_exempt_indicator;
  byte short_sale_restriction_indicator;
  byte trade_reporting_facility_id;
  PriorDayTradeDateAndTime prior_day_trade_date_and_time
};

int prior_day_trade_message_at;

/* every byte of Prior Day Trade Message set to one value */
inline fill_prior_day_trade_message(prior_day_trade_message_record, prior_day_trade_message_value) {
  prior_day_trade_message_record.participant_id = prior_day_trade_message_value;
  fill_timestamp1(prior_day_trade_message_record.timestamp_1, prior_day_trade_message_value);
  prior_day_trade_message_record.message_id = prior_day_trade_message_value;
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 4 -> prior_day_trade_message_record.transaction_id[prior_day_trade_message_at] = prior_day_trade_message_value; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 8 -> prior_day_trade_message_record.participant_reference_number[prior_day_trade_message_at] = prior_day_trade_message_value; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 11 -> prior_day_trade_message_record.security_symbol[prior_day_trade_message_at] = prior_day_trade_message_value; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_record.instrument_type = prior_day_trade_message_value;
  fill_sale_conditions(prior_day_trade_message_record.sale_conditions, prior_day_trade_message_value);
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 8 -> prior_day_trade_message_record.trade_price[prior_day_trade_message_at] = prior_day_trade_message_value; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 4 -> prior_day_trade_message_record.trade_volume[prior_day_trade_message_at] = prior_day_trade_message_value; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_record.sellers_sale_days = prior_day_trade_message_value;
  prior_day_trade_message_record.stop_stock_indicator = prior_day_trade_message_value;
  prior_day_trade_message_record.trade_through_exempt_indicator = prior_day_trade_message_value;
  prior_day_trade_message_record.short_sale_restriction_indicator = prior_day_trade_message_value;
  prior_day_trade_message_record.trade_reporting_facility_id = prior_day_trade_message_value;
  fill_prior_day_trade_date_and_time(prior_day_trade_message_record.prior_day_trade_date_and_time, prior_day_trade_message_value);
  skip
}

/* each byte of Prior Day Trade Message set to where it lies, so a field read out of place says so */
inline ramp_prior_day_trade_message(prior_day_trade_message_record, prior_day_trade_message_base) {
  prior_day_trade_message_record.participant_id = (prior_day_trade_message_base + 0 + 1) % 256;
  ramp_timestamp1(prior_day_trade_message_record.timestamp_1, prior_day_trade_message_base + 1);
  prior_day_trade_message_record.message_id = (prior_day_trade_message_base + 9 + 1) % 256;
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 4 -> prior_day_trade_message_record.transaction_id[prior_day_trade_message_at] = (prior_day_trade_message_base + 10 + prior_day_trade_message_at + 1) % 256; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 8 -> prior_day_trade_message_record.participant_reference_number[prior_day_trade_message_at] = (prior_day_trade_message_base + 14 + prior_day_trade_message_at + 1) % 256; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 11 -> prior_day_trade_message_record.security_symbol[prior_day_trade_message_at] = (prior_day_trade_message_base + 22 + prior_day_trade_message_at + 1) % 256; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_record.instrument_type = (prior_day_trade_message_base + 33 + 1) % 256;
  ramp_sale_conditions(prior_day_trade_message_record.sale_conditions, prior_day_trade_message_base + 34);
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 8 -> prior_day_trade_message_record.trade_price[prior_day_trade_message_at] = (prior_day_trade_message_base + 38 + prior_day_trade_message_at + 1) % 256; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 4 -> prior_day_trade_message_record.trade_volume[prior_day_trade_message_at] = (prior_day_trade_message_base + 46 + prior_day_trade_message_at + 1) % 256; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_record.sellers_sale_days = (prior_day_trade_message_base + 50 + 1) % 256;
  prior_day_trade_message_record.stop_stock_indicator = (prior_day_trade_message_base + 51 + 1) % 256;
  prior_day_trade_message_record.trade_through_exempt_indicator = (prior_day_trade_message_base + 52 + 1) % 256;
  prior_day_trade_message_record.short_sale_restriction_indicator = (prior_day_trade_message_base + 53 + 1) % 256;
  prior_day_trade_message_record.trade_reporting_facility_id = (prior_day_trade_message_base + 54 + 1) % 256;
  ramp_prior_day_trade_date_and_time(prior_day_trade_message_record.prior_day_trade_date_and_time, prior_day_trade_message_base + 55);
  skip
}

/* Prior Day Trade Message to the wire, 63 bytes from where the cursor stands */
inline encode_prior_day_trade_message(prior_day_trade_message_record) {
  wire[at] = prior_day_trade_message_record.participant_id; at = at + 1;
  encode_timestamp1(prior_day_trade_message_record.timestamp_1);
  wire[at] = prior_day_trade_message_record.message_id; at = at + 1;
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 4 -> wire[at] = prior_day_trade_message_record.transaction_id[prior_day_trade_message_at]; at = at + 1; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 8 -> wire[at] = prior_day_trade_message_record.participant_reference_number[prior_day_trade_message_at]; at = at + 1; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 11 -> wire[at] = prior_day_trade_message_record.security_symbol[prior_day_trade_message_at]; at = at + 1; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = prior_day_trade_message_record.instrument_type; at = at + 1;
  encode_sale_conditions(prior_day_trade_message_record.sale_conditions);
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 8 -> wire[at] = prior_day_trade_message_record.trade_price[prior_day_trade_message_at]; at = at + 1; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 4 -> wire[at] = prior_day_trade_message_record.trade_volume[prior_day_trade_message_at]; at = at + 1; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = prior_day_trade_message_record.sellers_sale_days; at = at + 1;
  wire[at] = prior_day_trade_message_record.stop_stock_indicator; at = at + 1;
  wire[at] = prior_day_trade_message_record.trade_through_exempt_indicator; at = at + 1;
  wire[at] = prior_day_trade_message_record.short_sale_restriction_indicator; at = at + 1;
  wire[at] = prior_day_trade_message_record.trade_reporting_facility_id; at = at + 1;
  encode_prior_day_trade_date_and_time(prior_day_trade_message_record.prior_day_trade_date_and_time);
  skip
}

/* Prior Day Trade Message off the wire, 63 bytes from where the cursor stands */
inline decode_prior_day_trade_message(prior_day_trade_message_record) {
  prior_day_trade_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(prior_day_trade_message_record.timestamp_1);
  prior_day_trade_message_record.message_id = wire[at]; at = at + 1;
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 4 -> prior_day_trade_message_record.transaction_id[prior_day_trade_message_at] = wire[at]; at = at + 1; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 8 -> prior_day_trade_message_record.participant_reference_number[prior_day_trade_message_at] = wire[at]; at = at + 1; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 11 -> prior_day_trade_message_record.security_symbol[prior_day_trade_message_at] = wire[at]; at = at + 1; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_record.instrument_type = wire[at]; at = at + 1;
  decode_sale_conditions(prior_day_trade_message_record.sale_conditions);
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 8 -> prior_day_trade_message_record.trade_price[prior_day_trade_message_at] = wire[at]; at = at + 1; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 4 -> prior_day_trade_message_record.trade_volume[prior_day_trade_message_at] = wire[at]; at = at + 1; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_record.sellers_sale_days = wire[at]; at = at + 1;
  prior_day_trade_message_record.stop_stock_indicator = wire[at]; at = at + 1;
  prior_day_trade_message_record.trade_through_exempt_indicator = wire[at]; at = at + 1;
  prior_day_trade_message_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  prior_day_trade_message_record.trade_reporting_facility_id = wire[at]; at = at + 1;
  decode_prior_day_trade_date_and_time(prior_day_trade_message_record.prior_day_trade_date_and_time);
  skip
}

/* what was read of Prior Day Trade Message is what was written, byte for byte */
inline equal_prior_day_trade_message(prior_day_trade_message_read, prior_day_trade_message_written) {
  assert(prior_day_trade_message_read.participant_id == prior_day_trade_message_written.participant_id);
  equal_timestamp1(prior_day_trade_message_read.timestamp_1, prior_day_trade_message_written.timestamp_1);
  assert(prior_day_trade_message_read.message_id == prior_day_trade_message_written.message_id);
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 4 -> assert(prior_day_trade_message_read.transaction_id[prior_day_trade_message_at] == prior_day_trade_message_written.transaction_id[prior_day_trade_message_at]); prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 8 -> assert(prior_day_trade_message_read.participant_reference_number[prior_day_trade_message_at] == prior_day_trade_message_written.participant_reference_number[prior_day_trade_message_at]); prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 11 -> assert(prior_day_trade_message_read.security_symbol[prior_day_trade_message_at] == prior_day_trade_message_written.security_symbol[prior_day_trade_message_at]); prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  assert(prior_day_trade_message_read.instrument_type == prior_day_trade_message_written.instrument_type);
  equal_sale_conditions(prior_day_trade_message_read.sale_conditions, prior_day_trade_message_written.sale_conditions);
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 8 -> assert(prior_day_trade_message_read.trade_price[prior_day_trade_message_at] == prior_day_trade_message_written.trade_price[prior_day_trade_message_at]); prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 4 -> assert(prior_day_trade_message_read.trade_volume[prior_day_trade_message_at] == prior_day_trade_message_written.trade_volume[prior_day_trade_message_at]); prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  assert(prior_day_trade_message_read.sellers_sale_days == prior_day_trade_message_written.sellers_sale_days);
  assert(prior_day_trade_message_read.stop_stock_indicator == prior_day_trade_message_written.stop_stock_indicator);
  assert(prior_day_trade_message_read.trade_through_exempt_indicator == prior_day_trade_message_written.trade_through_exempt_indicator);
  assert(prior_day_trade_message_read.short_sale_restriction_indicator == prior_day_trade_message_written.short_sale_restriction_indicator);
  assert(prior_day_trade_message_read.trade_reporting_facility_id == prior_day_trade_message_written.trade_reporting_facility_id);
  equal_prior_day_trade_date_and_time(prior_day_trade_message_read.prior_day_trade_date_and_time, prior_day_trade_message_written.prior_day_trade_date_and_time);
  skip
}

/* ---- Fractional Prior Day Trade Message: 67 bytes ---------------------------- */

/* The Prior Day Trade message is used to report a Cta Equity, Local Issue or Bond transaction which occurred earlier than the current trading day and was not reported. */
typedef FractionalPriorDayTradeMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte security_symbol[11];
  byte instrument_type;
  SaleConditions sale_conditions;
  byte trade_price[8];
  byte fractional_trade_volume[8];
  byte sellers_sale_days;
  byte stop_stock_indicator;
  byte trade_through_exempt_indicator;
  byte short_sale_restriction_indicator;
  byte trade_reporting_facility_id;
  PriorDayTradeDateAndTime prior_day_trade_date_and_time
};

int fractional_prior_day_trade_message_at;

/* every byte of Fractional Prior Day Trade Message set to one value */
inline fill_fractional_prior_day_trade_message(fractional_prior_day_trade_message_record, fractional_prior_day_trade_message_value) {
  fractional_prior_day_trade_message_record.participant_id = fractional_prior_day_trade_message_value;
  fill_timestamp1(fractional_prior_day_trade_message_record.timestamp_1, fractional_prior_day_trade_message_value);
  fractional_prior_day_trade_message_record.message_id = fractional_prior_day_trade_message_value;
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 4 -> fractional_prior_day_trade_message_record.transaction_id[fractional_prior_day_trade_message_at] = fractional_prior_day_trade_message_value; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 8 -> fractional_prior_day_trade_message_record.participant_reference_number[fractional_prior_day_trade_message_at] = fractional_prior_day_trade_message_value; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 11 -> fractional_prior_day_trade_message_record.security_symbol[fractional_prior_day_trade_message_at] = fractional_prior_day_trade_message_value; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_record.instrument_type = fractional_prior_day_trade_message_value;
  fill_sale_conditions(fractional_prior_day_trade_message_record.sale_conditions, fractional_prior_day_trade_message_value);
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 8 -> fractional_prior_day_trade_message_record.trade_price[fractional_prior_day_trade_message_at] = fractional_prior_day_trade_message_value; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 8 -> fractional_prior_day_trade_message_record.fractional_trade_volume[fractional_prior_day_trade_message_at] = fractional_prior_day_trade_message_value; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_record.sellers_sale_days = fractional_prior_day_trade_message_value;
  fractional_prior_day_trade_message_record.stop_stock_indicator = fractional_prior_day_trade_message_value;
  fractional_prior_day_trade_message_record.trade_through_exempt_indicator = fractional_prior_day_trade_message_value;
  fractional_prior_day_trade_message_record.short_sale_restriction_indicator = fractional_prior_day_trade_message_value;
  fractional_prior_day_trade_message_record.trade_reporting_facility_id = fractional_prior_day_trade_message_value;
  fill_prior_day_trade_date_and_time(fractional_prior_day_trade_message_record.prior_day_trade_date_and_time, fractional_prior_day_trade_message_value);
  skip
}

/* each byte of Fractional Prior Day Trade Message set to where it lies, so a field read out of place says so */
inline ramp_fractional_prior_day_trade_message(fractional_prior_day_trade_message_record, fractional_prior_day_trade_message_base) {
  fractional_prior_day_trade_message_record.participant_id = (fractional_prior_day_trade_message_base + 0 + 1) % 256;
  ramp_timestamp1(fractional_prior_day_trade_message_record.timestamp_1, fractional_prior_day_trade_message_base + 1);
  fractional_prior_day_trade_message_record.message_id = (fractional_prior_day_trade_message_base + 9 + 1) % 256;
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 4 -> fractional_prior_day_trade_message_record.transaction_id[fractional_prior_day_trade_message_at] = (fractional_prior_day_trade_message_base + 10 + fractional_prior_day_trade_message_at + 1) % 256; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 8 -> fractional_prior_day_trade_message_record.participant_reference_number[fractional_prior_day_trade_message_at] = (fractional_prior_day_trade_message_base + 14 + fractional_prior_day_trade_message_at + 1) % 256; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 11 -> fractional_prior_day_trade_message_record.security_symbol[fractional_prior_day_trade_message_at] = (fractional_prior_day_trade_message_base + 22 + fractional_prior_day_trade_message_at + 1) % 256; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_record.instrument_type = (fractional_prior_day_trade_message_base + 33 + 1) % 256;
  ramp_sale_conditions(fractional_prior_day_trade_message_record.sale_conditions, fractional_prior_day_trade_message_base + 34);
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 8 -> fractional_prior_day_trade_message_record.trade_price[fractional_prior_day_trade_message_at] = (fractional_prior_day_trade_message_base + 38 + fractional_prior_day_trade_message_at + 1) % 256; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 8 -> fractional_prior_day_trade_message_record.fractional_trade_volume[fractional_prior_day_trade_message_at] = (fractional_prior_day_trade_message_base + 46 + fractional_prior_day_trade_message_at + 1) % 256; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_record.sellers_sale_days = (fractional_prior_day_trade_message_base + 54 + 1) % 256;
  fractional_prior_day_trade_message_record.stop_stock_indicator = (fractional_prior_day_trade_message_base + 55 + 1) % 256;
  fractional_prior_day_trade_message_record.trade_through_exempt_indicator = (fractional_prior_day_trade_message_base + 56 + 1) % 256;
  fractional_prior_day_trade_message_record.short_sale_restriction_indicator = (fractional_prior_day_trade_message_base + 57 + 1) % 256;
  fractional_prior_day_trade_message_record.trade_reporting_facility_id = (fractional_prior_day_trade_message_base + 58 + 1) % 256;
  ramp_prior_day_trade_date_and_time(fractional_prior_day_trade_message_record.prior_day_trade_date_and_time, fractional_prior_day_trade_message_base + 59);
  skip
}

/* Fractional Prior Day Trade Message to the wire, 67 bytes from where the cursor stands */
inline encode_fractional_prior_day_trade_message(fractional_prior_day_trade_message_record) {
  wire[at] = fractional_prior_day_trade_message_record.participant_id; at = at + 1;
  encode_timestamp1(fractional_prior_day_trade_message_record.timestamp_1);
  wire[at] = fractional_prior_day_trade_message_record.message_id; at = at + 1;
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 4 -> wire[at] = fractional_prior_day_trade_message_record.transaction_id[fractional_prior_day_trade_message_at]; at = at + 1; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 8 -> wire[at] = fractional_prior_day_trade_message_record.participant_reference_number[fractional_prior_day_trade_message_at]; at = at + 1; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 11 -> wire[at] = fractional_prior_day_trade_message_record.security_symbol[fractional_prior_day_trade_message_at]; at = at + 1; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_prior_day_trade_message_record.instrument_type; at = at + 1;
  encode_sale_conditions(fractional_prior_day_trade_message_record.sale_conditions);
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 8 -> wire[at] = fractional_prior_day_trade_message_record.trade_price[fractional_prior_day_trade_message_at]; at = at + 1; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 8 -> wire[at] = fractional_prior_day_trade_message_record.fractional_trade_volume[fractional_prior_day_trade_message_at]; at = at + 1; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_prior_day_trade_message_record.sellers_sale_days; at = at + 1;
  wire[at] = fractional_prior_day_trade_message_record.stop_stock_indicator; at = at + 1;
  wire[at] = fractional_prior_day_trade_message_record.trade_through_exempt_indicator; at = at + 1;
  wire[at] = fractional_prior_day_trade_message_record.short_sale_restriction_indicator; at = at + 1;
  wire[at] = fractional_prior_day_trade_message_record.trade_reporting_facility_id; at = at + 1;
  encode_prior_day_trade_date_and_time(fractional_prior_day_trade_message_record.prior_day_trade_date_and_time);
  skip
}

/* Fractional Prior Day Trade Message off the wire, 67 bytes from where the cursor stands */
inline decode_fractional_prior_day_trade_message(fractional_prior_day_trade_message_record) {
  fractional_prior_day_trade_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(fractional_prior_day_trade_message_record.timestamp_1);
  fractional_prior_day_trade_message_record.message_id = wire[at]; at = at + 1;
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 4 -> fractional_prior_day_trade_message_record.transaction_id[fractional_prior_day_trade_message_at] = wire[at]; at = at + 1; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 8 -> fractional_prior_day_trade_message_record.participant_reference_number[fractional_prior_day_trade_message_at] = wire[at]; at = at + 1; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 11 -> fractional_prior_day_trade_message_record.security_symbol[fractional_prior_day_trade_message_at] = wire[at]; at = at + 1; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_record.instrument_type = wire[at]; at = at + 1;
  decode_sale_conditions(fractional_prior_day_trade_message_record.sale_conditions);
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 8 -> fractional_prior_day_trade_message_record.trade_price[fractional_prior_day_trade_message_at] = wire[at]; at = at + 1; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 8 -> fractional_prior_day_trade_message_record.fractional_trade_volume[fractional_prior_day_trade_message_at] = wire[at]; at = at + 1; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_record.sellers_sale_days = wire[at]; at = at + 1;
  fractional_prior_day_trade_message_record.stop_stock_indicator = wire[at]; at = at + 1;
  fractional_prior_day_trade_message_record.trade_through_exempt_indicator = wire[at]; at = at + 1;
  fractional_prior_day_trade_message_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  fractional_prior_day_trade_message_record.trade_reporting_facility_id = wire[at]; at = at + 1;
  decode_prior_day_trade_date_and_time(fractional_prior_day_trade_message_record.prior_day_trade_date_and_time);
  skip
}

/* what was read of Fractional Prior Day Trade Message is what was written, byte for byte */
inline equal_fractional_prior_day_trade_message(fractional_prior_day_trade_message_read, fractional_prior_day_trade_message_written) {
  assert(fractional_prior_day_trade_message_read.participant_id == fractional_prior_day_trade_message_written.participant_id);
  equal_timestamp1(fractional_prior_day_trade_message_read.timestamp_1, fractional_prior_day_trade_message_written.timestamp_1);
  assert(fractional_prior_day_trade_message_read.message_id == fractional_prior_day_trade_message_written.message_id);
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 4 -> assert(fractional_prior_day_trade_message_read.transaction_id[fractional_prior_day_trade_message_at] == fractional_prior_day_trade_message_written.transaction_id[fractional_prior_day_trade_message_at]); fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 8 -> assert(fractional_prior_day_trade_message_read.participant_reference_number[fractional_prior_day_trade_message_at] == fractional_prior_day_trade_message_written.participant_reference_number[fractional_prior_day_trade_message_at]); fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 11 -> assert(fractional_prior_day_trade_message_read.security_symbol[fractional_prior_day_trade_message_at] == fractional_prior_day_trade_message_written.security_symbol[fractional_prior_day_trade_message_at]); fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  assert(fractional_prior_day_trade_message_read.instrument_type == fractional_prior_day_trade_message_written.instrument_type);
  equal_sale_conditions(fractional_prior_day_trade_message_read.sale_conditions, fractional_prior_day_trade_message_written.sale_conditions);
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 8 -> assert(fractional_prior_day_trade_message_read.trade_price[fractional_prior_day_trade_message_at] == fractional_prior_day_trade_message_written.trade_price[fractional_prior_day_trade_message_at]); fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 8 -> assert(fractional_prior_day_trade_message_read.fractional_trade_volume[fractional_prior_day_trade_message_at] == fractional_prior_day_trade_message_written.fractional_trade_volume[fractional_prior_day_trade_message_at]); fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  assert(fractional_prior_day_trade_message_read.sellers_sale_days == fractional_prior_day_trade_message_written.sellers_sale_days);
  assert(fractional_prior_day_trade_message_read.stop_stock_indicator == fractional_prior_day_trade_message_written.stop_stock_indicator);
  assert(fractional_prior_day_trade_message_read.trade_through_exempt_indicator == fractional_prior_day_trade_message_written.trade_through_exempt_indicator);
  assert(fractional_prior_day_trade_message_read.short_sale_restriction_indicator == fractional_prior_day_trade_message_written.short_sale_restriction_indicator);
  assert(fractional_prior_day_trade_message_read.trade_reporting_facility_id == fractional_prior_day_trade_message_written.trade_reporting_facility_id);
  equal_prior_day_trade_date_and_time(fractional_prior_day_trade_message_read.prior_day_trade_date_and_time, fractional_prior_day_trade_message_written.prior_day_trade_date_and_time);
  skip
}

/* ---- Prior Day Trade Cancel Error Message: 64 bytes -------------------------- */

/* The Prior Day Trade message is used to report a Cta Equity, Local Issue or Bond transaction which occurred earlier than the current trading day and was not reported. */
typedef PriorDayTradeCancelErrorMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte security_symbol[11];
  byte instrument_type;
  SaleConditions sale_conditions;
  byte trade_price[8];
  byte trade_volume[4];
  byte sellers_sale_days;
  byte stop_stock_indicator;
  byte trade_through_exempt_indicator;
  byte short_sale_restriction_indicator;
  byte trade_reporting_facility_id;
  PriorDayTradeDateAndTime prior_day_trade_date_and_time;
  byte cancel_error_action
};

int prior_day_trade_cancel_error_message_at;

/* every byte of Prior Day Trade Cancel Error Message set to one value */
inline fill_prior_day_trade_cancel_error_message(prior_day_trade_cancel_error_message_record, prior_day_trade_cancel_error_message_value) {
  prior_day_trade_cancel_error_message_record.participant_id = prior_day_trade_cancel_error_message_value;
  fill_timestamp1(prior_day_trade_cancel_error_message_record.timestamp_1, prior_day_trade_cancel_error_message_value);
  prior_day_trade_cancel_error_message_record.message_id = prior_day_trade_cancel_error_message_value;
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 4 -> prior_day_trade_cancel_error_message_record.transaction_id[prior_day_trade_cancel_error_message_at] = prior_day_trade_cancel_error_message_value; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 8 -> prior_day_trade_cancel_error_message_record.participant_reference_number[prior_day_trade_cancel_error_message_at] = prior_day_trade_cancel_error_message_value; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 11 -> prior_day_trade_cancel_error_message_record.security_symbol[prior_day_trade_cancel_error_message_at] = prior_day_trade_cancel_error_message_value; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_record.instrument_type = prior_day_trade_cancel_error_message_value;
  fill_sale_conditions(prior_day_trade_cancel_error_message_record.sale_conditions, prior_day_trade_cancel_error_message_value);
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 8 -> prior_day_trade_cancel_error_message_record.trade_price[prior_day_trade_cancel_error_message_at] = prior_day_trade_cancel_error_message_value; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 4 -> prior_day_trade_cancel_error_message_record.trade_volume[prior_day_trade_cancel_error_message_at] = prior_day_trade_cancel_error_message_value; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_record.sellers_sale_days = prior_day_trade_cancel_error_message_value;
  prior_day_trade_cancel_error_message_record.stop_stock_indicator = prior_day_trade_cancel_error_message_value;
  prior_day_trade_cancel_error_message_record.trade_through_exempt_indicator = prior_day_trade_cancel_error_message_value;
  prior_day_trade_cancel_error_message_record.short_sale_restriction_indicator = prior_day_trade_cancel_error_message_value;
  prior_day_trade_cancel_error_message_record.trade_reporting_facility_id = prior_day_trade_cancel_error_message_value;
  fill_prior_day_trade_date_and_time(prior_day_trade_cancel_error_message_record.prior_day_trade_date_and_time, prior_day_trade_cancel_error_message_value);
  prior_day_trade_cancel_error_message_record.cancel_error_action = prior_day_trade_cancel_error_message_value;
  skip
}

/* each byte of Prior Day Trade Cancel Error Message set to where it lies, so a field read out of place says so */
inline ramp_prior_day_trade_cancel_error_message(prior_day_trade_cancel_error_message_record, prior_day_trade_cancel_error_message_base) {
  prior_day_trade_cancel_error_message_record.participant_id = (prior_day_trade_cancel_error_message_base + 0 + 1) % 256;
  ramp_timestamp1(prior_day_trade_cancel_error_message_record.timestamp_1, prior_day_trade_cancel_error_message_base + 1);
  prior_day_trade_cancel_error_message_record.message_id = (prior_day_trade_cancel_error_message_base + 9 + 1) % 256;
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 4 -> prior_day_trade_cancel_error_message_record.transaction_id[prior_day_trade_cancel_error_message_at] = (prior_day_trade_cancel_error_message_base + 10 + prior_day_trade_cancel_error_message_at + 1) % 256; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 8 -> prior_day_trade_cancel_error_message_record.participant_reference_number[prior_day_trade_cancel_error_message_at] = (prior_day_trade_cancel_error_message_base + 14 + prior_day_trade_cancel_error_message_at + 1) % 256; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 11 -> prior_day_trade_cancel_error_message_record.security_symbol[prior_day_trade_cancel_error_message_at] = (prior_day_trade_cancel_error_message_base + 22 + prior_day_trade_cancel_error_message_at + 1) % 256; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_record.instrument_type = (prior_day_trade_cancel_error_message_base + 33 + 1) % 256;
  ramp_sale_conditions(prior_day_trade_cancel_error_message_record.sale_conditions, prior_day_trade_cancel_error_message_base + 34);
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 8 -> prior_day_trade_cancel_error_message_record.trade_price[prior_day_trade_cancel_error_message_at] = (prior_day_trade_cancel_error_message_base + 38 + prior_day_trade_cancel_error_message_at + 1) % 256; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 4 -> prior_day_trade_cancel_error_message_record.trade_volume[prior_day_trade_cancel_error_message_at] = (prior_day_trade_cancel_error_message_base + 46 + prior_day_trade_cancel_error_message_at + 1) % 256; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_record.sellers_sale_days = (prior_day_trade_cancel_error_message_base + 50 + 1) % 256;
  prior_day_trade_cancel_error_message_record.stop_stock_indicator = (prior_day_trade_cancel_error_message_base + 51 + 1) % 256;
  prior_day_trade_cancel_error_message_record.trade_through_exempt_indicator = (prior_day_trade_cancel_error_message_base + 52 + 1) % 256;
  prior_day_trade_cancel_error_message_record.short_sale_restriction_indicator = (prior_day_trade_cancel_error_message_base + 53 + 1) % 256;
  prior_day_trade_cancel_error_message_record.trade_reporting_facility_id = (prior_day_trade_cancel_error_message_base + 54 + 1) % 256;
  ramp_prior_day_trade_date_and_time(prior_day_trade_cancel_error_message_record.prior_day_trade_date_and_time, prior_day_trade_cancel_error_message_base + 55);
  prior_day_trade_cancel_error_message_record.cancel_error_action = (prior_day_trade_cancel_error_message_base + 63 + 1) % 256;
  skip
}

/* Prior Day Trade Cancel Error Message to the wire, 64 bytes from where the cursor stands */
inline encode_prior_day_trade_cancel_error_message(prior_day_trade_cancel_error_message_record) {
  wire[at] = prior_day_trade_cancel_error_message_record.participant_id; at = at + 1;
  encode_timestamp1(prior_day_trade_cancel_error_message_record.timestamp_1);
  wire[at] = prior_day_trade_cancel_error_message_record.message_id; at = at + 1;
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 4 -> wire[at] = prior_day_trade_cancel_error_message_record.transaction_id[prior_day_trade_cancel_error_message_at]; at = at + 1; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 8 -> wire[at] = prior_day_trade_cancel_error_message_record.participant_reference_number[prior_day_trade_cancel_error_message_at]; at = at + 1; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 11 -> wire[at] = prior_day_trade_cancel_error_message_record.security_symbol[prior_day_trade_cancel_error_message_at]; at = at + 1; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = prior_day_trade_cancel_error_message_record.instrument_type; at = at + 1;
  encode_sale_conditions(prior_day_trade_cancel_error_message_record.sale_conditions);
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 8 -> wire[at] = prior_day_trade_cancel_error_message_record.trade_price[prior_day_trade_cancel_error_message_at]; at = at + 1; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 4 -> wire[at] = prior_day_trade_cancel_error_message_record.trade_volume[prior_day_trade_cancel_error_message_at]; at = at + 1; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = prior_day_trade_cancel_error_message_record.sellers_sale_days; at = at + 1;
  wire[at] = prior_day_trade_cancel_error_message_record.stop_stock_indicator; at = at + 1;
  wire[at] = prior_day_trade_cancel_error_message_record.trade_through_exempt_indicator; at = at + 1;
  wire[at] = prior_day_trade_cancel_error_message_record.short_sale_restriction_indicator; at = at + 1;
  wire[at] = prior_day_trade_cancel_error_message_record.trade_reporting_facility_id; at = at + 1;
  encode_prior_day_trade_date_and_time(prior_day_trade_cancel_error_message_record.prior_day_trade_date_and_time);
  wire[at] = prior_day_trade_cancel_error_message_record.cancel_error_action; at = at + 1;
  skip
}

/* Prior Day Trade Cancel Error Message off the wire, 64 bytes from where the cursor stands */
inline decode_prior_day_trade_cancel_error_message(prior_day_trade_cancel_error_message_record) {
  prior_day_trade_cancel_error_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(prior_day_trade_cancel_error_message_record.timestamp_1);
  prior_day_trade_cancel_error_message_record.message_id = wire[at]; at = at + 1;
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 4 -> prior_day_trade_cancel_error_message_record.transaction_id[prior_day_trade_cancel_error_message_at] = wire[at]; at = at + 1; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 8 -> prior_day_trade_cancel_error_message_record.participant_reference_number[prior_day_trade_cancel_error_message_at] = wire[at]; at = at + 1; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 11 -> prior_day_trade_cancel_error_message_record.security_symbol[prior_day_trade_cancel_error_message_at] = wire[at]; at = at + 1; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_record.instrument_type = wire[at]; at = at + 1;
  decode_sale_conditions(prior_day_trade_cancel_error_message_record.sale_conditions);
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 8 -> prior_day_trade_cancel_error_message_record.trade_price[prior_day_trade_cancel_error_message_at] = wire[at]; at = at + 1; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 4 -> prior_day_trade_cancel_error_message_record.trade_volume[prior_day_trade_cancel_error_message_at] = wire[at]; at = at + 1; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_record.sellers_sale_days = wire[at]; at = at + 1;
  prior_day_trade_cancel_error_message_record.stop_stock_indicator = wire[at]; at = at + 1;
  prior_day_trade_cancel_error_message_record.trade_through_exempt_indicator = wire[at]; at = at + 1;
  prior_day_trade_cancel_error_message_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  prior_day_trade_cancel_error_message_record.trade_reporting_facility_id = wire[at]; at = at + 1;
  decode_prior_day_trade_date_and_time(prior_day_trade_cancel_error_message_record.prior_day_trade_date_and_time);
  prior_day_trade_cancel_error_message_record.cancel_error_action = wire[at]; at = at + 1;
  skip
}

/* what was read of Prior Day Trade Cancel Error Message is what was written, byte for byte */
inline equal_prior_day_trade_cancel_error_message(prior_day_trade_cancel_error_message_read, prior_day_trade_cancel_error_message_written) {
  assert(prior_day_trade_cancel_error_message_read.participant_id == prior_day_trade_cancel_error_message_written.participant_id);
  equal_timestamp1(prior_day_trade_cancel_error_message_read.timestamp_1, prior_day_trade_cancel_error_message_written.timestamp_1);
  assert(prior_day_trade_cancel_error_message_read.message_id == prior_day_trade_cancel_error_message_written.message_id);
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 4 -> assert(prior_day_trade_cancel_error_message_read.transaction_id[prior_day_trade_cancel_error_message_at] == prior_day_trade_cancel_error_message_written.transaction_id[prior_day_trade_cancel_error_message_at]); prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 8 -> assert(prior_day_trade_cancel_error_message_read.participant_reference_number[prior_day_trade_cancel_error_message_at] == prior_day_trade_cancel_error_message_written.participant_reference_number[prior_day_trade_cancel_error_message_at]); prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 11 -> assert(prior_day_trade_cancel_error_message_read.security_symbol[prior_day_trade_cancel_error_message_at] == prior_day_trade_cancel_error_message_written.security_symbol[prior_day_trade_cancel_error_message_at]); prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(prior_day_trade_cancel_error_message_read.instrument_type == prior_day_trade_cancel_error_message_written.instrument_type);
  equal_sale_conditions(prior_day_trade_cancel_error_message_read.sale_conditions, prior_day_trade_cancel_error_message_written.sale_conditions);
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 8 -> assert(prior_day_trade_cancel_error_message_read.trade_price[prior_day_trade_cancel_error_message_at] == prior_day_trade_cancel_error_message_written.trade_price[prior_day_trade_cancel_error_message_at]); prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 4 -> assert(prior_day_trade_cancel_error_message_read.trade_volume[prior_day_trade_cancel_error_message_at] == prior_day_trade_cancel_error_message_written.trade_volume[prior_day_trade_cancel_error_message_at]); prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(prior_day_trade_cancel_error_message_read.sellers_sale_days == prior_day_trade_cancel_error_message_written.sellers_sale_days);
  assert(prior_day_trade_cancel_error_message_read.stop_stock_indicator == prior_day_trade_cancel_error_message_written.stop_stock_indicator);
  assert(prior_day_trade_cancel_error_message_read.trade_through_exempt_indicator == prior_day_trade_cancel_error_message_written.trade_through_exempt_indicator);
  assert(prior_day_trade_cancel_error_message_read.short_sale_restriction_indicator == prior_day_trade_cancel_error_message_written.short_sale_restriction_indicator);
  assert(prior_day_trade_cancel_error_message_read.trade_reporting_facility_id == prior_day_trade_cancel_error_message_written.trade_reporting_facility_id);
  equal_prior_day_trade_date_and_time(prior_day_trade_cancel_error_message_read.prior_day_trade_date_and_time, prior_day_trade_cancel_error_message_written.prior_day_trade_date_and_time);
  assert(prior_day_trade_cancel_error_message_read.cancel_error_action == prior_day_trade_cancel_error_message_written.cancel_error_action);
  skip
}

/* ---- Fractional Prior Day Trade Cancel Error Message: 68 bytes --------------- */

/* The Fractional Prior Day Trade message is used to report a Cta Equity, Local Issue or Bond transaction which occurred earlier than the current trading day and was not reported. */
typedef FractionalPriorDayTradeCancelErrorMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte security_symbol[11];
  byte instrument_type;
  SaleConditions sale_conditions;
  byte trade_price[8];
  byte fractional_trade_volume[8];
  byte sellers_sale_days;
  byte stop_stock_indicator;
  byte trade_through_exempt_indicator;
  byte short_sale_restriction_indicator;
  byte trade_reporting_facility_id;
  PriorDayTradeDateAndTime prior_day_trade_date_and_time;
  byte cancel_error_action
};

int fractional_prior_day_trade_cancel_error_message_at;

/* every byte of Fractional Prior Day Trade Cancel Error Message set to one value */
inline fill_fractional_prior_day_trade_cancel_error_message(fractional_prior_day_trade_cancel_error_message_record, fractional_prior_day_trade_cancel_error_message_value) {
  fractional_prior_day_trade_cancel_error_message_record.participant_id = fractional_prior_day_trade_cancel_error_message_value;
  fill_timestamp1(fractional_prior_day_trade_cancel_error_message_record.timestamp_1, fractional_prior_day_trade_cancel_error_message_value);
  fractional_prior_day_trade_cancel_error_message_record.message_id = fractional_prior_day_trade_cancel_error_message_value;
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 4 -> fractional_prior_day_trade_cancel_error_message_record.transaction_id[fractional_prior_day_trade_cancel_error_message_at] = fractional_prior_day_trade_cancel_error_message_value; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 8 -> fractional_prior_day_trade_cancel_error_message_record.participant_reference_number[fractional_prior_day_trade_cancel_error_message_at] = fractional_prior_day_trade_cancel_error_message_value; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 11 -> fractional_prior_day_trade_cancel_error_message_record.security_symbol[fractional_prior_day_trade_cancel_error_message_at] = fractional_prior_day_trade_cancel_error_message_value; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_record.instrument_type = fractional_prior_day_trade_cancel_error_message_value;
  fill_sale_conditions(fractional_prior_day_trade_cancel_error_message_record.sale_conditions, fractional_prior_day_trade_cancel_error_message_value);
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 8 -> fractional_prior_day_trade_cancel_error_message_record.trade_price[fractional_prior_day_trade_cancel_error_message_at] = fractional_prior_day_trade_cancel_error_message_value; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 8 -> fractional_prior_day_trade_cancel_error_message_record.fractional_trade_volume[fractional_prior_day_trade_cancel_error_message_at] = fractional_prior_day_trade_cancel_error_message_value; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_record.sellers_sale_days = fractional_prior_day_trade_cancel_error_message_value;
  fractional_prior_day_trade_cancel_error_message_record.stop_stock_indicator = fractional_prior_day_trade_cancel_error_message_value;
  fractional_prior_day_trade_cancel_error_message_record.trade_through_exempt_indicator = fractional_prior_day_trade_cancel_error_message_value;
  fractional_prior_day_trade_cancel_error_message_record.short_sale_restriction_indicator = fractional_prior_day_trade_cancel_error_message_value;
  fractional_prior_day_trade_cancel_error_message_record.trade_reporting_facility_id = fractional_prior_day_trade_cancel_error_message_value;
  fill_prior_day_trade_date_and_time(fractional_prior_day_trade_cancel_error_message_record.prior_day_trade_date_and_time, fractional_prior_day_trade_cancel_error_message_value);
  fractional_prior_day_trade_cancel_error_message_record.cancel_error_action = fractional_prior_day_trade_cancel_error_message_value;
  skip
}

/* each byte of Fractional Prior Day Trade Cancel Error Message set to where it lies, so a field read out of place says so */
inline ramp_fractional_prior_day_trade_cancel_error_message(fractional_prior_day_trade_cancel_error_message_record, fractional_prior_day_trade_cancel_error_message_base) {
  fractional_prior_day_trade_cancel_error_message_record.participant_id = (fractional_prior_day_trade_cancel_error_message_base + 0 + 1) % 256;
  ramp_timestamp1(fractional_prior_day_trade_cancel_error_message_record.timestamp_1, fractional_prior_day_trade_cancel_error_message_base + 1);
  fractional_prior_day_trade_cancel_error_message_record.message_id = (fractional_prior_day_trade_cancel_error_message_base + 9 + 1) % 256;
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 4 -> fractional_prior_day_trade_cancel_error_message_record.transaction_id[fractional_prior_day_trade_cancel_error_message_at] = (fractional_prior_day_trade_cancel_error_message_base + 10 + fractional_prior_day_trade_cancel_error_message_at + 1) % 256; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 8 -> fractional_prior_day_trade_cancel_error_message_record.participant_reference_number[fractional_prior_day_trade_cancel_error_message_at] = (fractional_prior_day_trade_cancel_error_message_base + 14 + fractional_prior_day_trade_cancel_error_message_at + 1) % 256; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 11 -> fractional_prior_day_trade_cancel_error_message_record.security_symbol[fractional_prior_day_trade_cancel_error_message_at] = (fractional_prior_day_trade_cancel_error_message_base + 22 + fractional_prior_day_trade_cancel_error_message_at + 1) % 256; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_record.instrument_type = (fractional_prior_day_trade_cancel_error_message_base + 33 + 1) % 256;
  ramp_sale_conditions(fractional_prior_day_trade_cancel_error_message_record.sale_conditions, fractional_prior_day_trade_cancel_error_message_base + 34);
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 8 -> fractional_prior_day_trade_cancel_error_message_record.trade_price[fractional_prior_day_trade_cancel_error_message_at] = (fractional_prior_day_trade_cancel_error_message_base + 38 + fractional_prior_day_trade_cancel_error_message_at + 1) % 256; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 8 -> fractional_prior_day_trade_cancel_error_message_record.fractional_trade_volume[fractional_prior_day_trade_cancel_error_message_at] = (fractional_prior_day_trade_cancel_error_message_base + 46 + fractional_prior_day_trade_cancel_error_message_at + 1) % 256; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_record.sellers_sale_days = (fractional_prior_day_trade_cancel_error_message_base + 54 + 1) % 256;
  fractional_prior_day_trade_cancel_error_message_record.stop_stock_indicator = (fractional_prior_day_trade_cancel_error_message_base + 55 + 1) % 256;
  fractional_prior_day_trade_cancel_error_message_record.trade_through_exempt_indicator = (fractional_prior_day_trade_cancel_error_message_base + 56 + 1) % 256;
  fractional_prior_day_trade_cancel_error_message_record.short_sale_restriction_indicator = (fractional_prior_day_trade_cancel_error_message_base + 57 + 1) % 256;
  fractional_prior_day_trade_cancel_error_message_record.trade_reporting_facility_id = (fractional_prior_day_trade_cancel_error_message_base + 58 + 1) % 256;
  ramp_prior_day_trade_date_and_time(fractional_prior_day_trade_cancel_error_message_record.prior_day_trade_date_and_time, fractional_prior_day_trade_cancel_error_message_base + 59);
  fractional_prior_day_trade_cancel_error_message_record.cancel_error_action = (fractional_prior_day_trade_cancel_error_message_base + 67 + 1) % 256;
  skip
}

/* Fractional Prior Day Trade Cancel Error Message to the wire, 68 bytes from where the cursor stands */
inline encode_fractional_prior_day_trade_cancel_error_message(fractional_prior_day_trade_cancel_error_message_record) {
  wire[at] = fractional_prior_day_trade_cancel_error_message_record.participant_id; at = at + 1;
  encode_timestamp1(fractional_prior_day_trade_cancel_error_message_record.timestamp_1);
  wire[at] = fractional_prior_day_trade_cancel_error_message_record.message_id; at = at + 1;
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 4 -> wire[at] = fractional_prior_day_trade_cancel_error_message_record.transaction_id[fractional_prior_day_trade_cancel_error_message_at]; at = at + 1; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 8 -> wire[at] = fractional_prior_day_trade_cancel_error_message_record.participant_reference_number[fractional_prior_day_trade_cancel_error_message_at]; at = at + 1; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 11 -> wire[at] = fractional_prior_day_trade_cancel_error_message_record.security_symbol[fractional_prior_day_trade_cancel_error_message_at]; at = at + 1; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_prior_day_trade_cancel_error_message_record.instrument_type; at = at + 1;
  encode_sale_conditions(fractional_prior_day_trade_cancel_error_message_record.sale_conditions);
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 8 -> wire[at] = fractional_prior_day_trade_cancel_error_message_record.trade_price[fractional_prior_day_trade_cancel_error_message_at]; at = at + 1; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 8 -> wire[at] = fractional_prior_day_trade_cancel_error_message_record.fractional_trade_volume[fractional_prior_day_trade_cancel_error_message_at]; at = at + 1; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_prior_day_trade_cancel_error_message_record.sellers_sale_days; at = at + 1;
  wire[at] = fractional_prior_day_trade_cancel_error_message_record.stop_stock_indicator; at = at + 1;
  wire[at] = fractional_prior_day_trade_cancel_error_message_record.trade_through_exempt_indicator; at = at + 1;
  wire[at] = fractional_prior_day_trade_cancel_error_message_record.short_sale_restriction_indicator; at = at + 1;
  wire[at] = fractional_prior_day_trade_cancel_error_message_record.trade_reporting_facility_id; at = at + 1;
  encode_prior_day_trade_date_and_time(fractional_prior_day_trade_cancel_error_message_record.prior_day_trade_date_and_time);
  wire[at] = fractional_prior_day_trade_cancel_error_message_record.cancel_error_action; at = at + 1;
  skip
}

/* Fractional Prior Day Trade Cancel Error Message off the wire, 68 bytes from where the cursor stands */
inline decode_fractional_prior_day_trade_cancel_error_message(fractional_prior_day_trade_cancel_error_message_record) {
  fractional_prior_day_trade_cancel_error_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(fractional_prior_day_trade_cancel_error_message_record.timestamp_1);
  fractional_prior_day_trade_cancel_error_message_record.message_id = wire[at]; at = at + 1;
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 4 -> fractional_prior_day_trade_cancel_error_message_record.transaction_id[fractional_prior_day_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 8 -> fractional_prior_day_trade_cancel_error_message_record.participant_reference_number[fractional_prior_day_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 11 -> fractional_prior_day_trade_cancel_error_message_record.security_symbol[fractional_prior_day_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_record.instrument_type = wire[at]; at = at + 1;
  decode_sale_conditions(fractional_prior_day_trade_cancel_error_message_record.sale_conditions);
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 8 -> fractional_prior_day_trade_cancel_error_message_record.trade_price[fractional_prior_day_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 8 -> fractional_prior_day_trade_cancel_error_message_record.fractional_trade_volume[fractional_prior_day_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_record.sellers_sale_days = wire[at]; at = at + 1;
  fractional_prior_day_trade_cancel_error_message_record.stop_stock_indicator = wire[at]; at = at + 1;
  fractional_prior_day_trade_cancel_error_message_record.trade_through_exempt_indicator = wire[at]; at = at + 1;
  fractional_prior_day_trade_cancel_error_message_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  fractional_prior_day_trade_cancel_error_message_record.trade_reporting_facility_id = wire[at]; at = at + 1;
  decode_prior_day_trade_date_and_time(fractional_prior_day_trade_cancel_error_message_record.prior_day_trade_date_and_time);
  fractional_prior_day_trade_cancel_error_message_record.cancel_error_action = wire[at]; at = at + 1;
  skip
}

/* what was read of Fractional Prior Day Trade Cancel Error Message is what was written, byte for byte */
inline equal_fractional_prior_day_trade_cancel_error_message(fractional_prior_day_trade_cancel_error_message_read, fractional_prior_day_trade_cancel_error_message_written) {
  assert(fractional_prior_day_trade_cancel_error_message_read.participant_id == fractional_prior_day_trade_cancel_error_message_written.participant_id);
  equal_timestamp1(fractional_prior_day_trade_cancel_error_message_read.timestamp_1, fractional_prior_day_trade_cancel_error_message_written.timestamp_1);
  assert(fractional_prior_day_trade_cancel_error_message_read.message_id == fractional_prior_day_trade_cancel_error_message_written.message_id);
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 4 -> assert(fractional_prior_day_trade_cancel_error_message_read.transaction_id[fractional_prior_day_trade_cancel_error_message_at] == fractional_prior_day_trade_cancel_error_message_written.transaction_id[fractional_prior_day_trade_cancel_error_message_at]); fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 8 -> assert(fractional_prior_day_trade_cancel_error_message_read.participant_reference_number[fractional_prior_day_trade_cancel_error_message_at] == fractional_prior_day_trade_cancel_error_message_written.participant_reference_number[fractional_prior_day_trade_cancel_error_message_at]); fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 11 -> assert(fractional_prior_day_trade_cancel_error_message_read.security_symbol[fractional_prior_day_trade_cancel_error_message_at] == fractional_prior_day_trade_cancel_error_message_written.security_symbol[fractional_prior_day_trade_cancel_error_message_at]); fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(fractional_prior_day_trade_cancel_error_message_read.instrument_type == fractional_prior_day_trade_cancel_error_message_written.instrument_type);
  equal_sale_conditions(fractional_prior_day_trade_cancel_error_message_read.sale_conditions, fractional_prior_day_trade_cancel_error_message_written.sale_conditions);
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 8 -> assert(fractional_prior_day_trade_cancel_error_message_read.trade_price[fractional_prior_day_trade_cancel_error_message_at] == fractional_prior_day_trade_cancel_error_message_written.trade_price[fractional_prior_day_trade_cancel_error_message_at]); fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 8 -> assert(fractional_prior_day_trade_cancel_error_message_read.fractional_trade_volume[fractional_prior_day_trade_cancel_error_message_at] == fractional_prior_day_trade_cancel_error_message_written.fractional_trade_volume[fractional_prior_day_trade_cancel_error_message_at]); fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(fractional_prior_day_trade_cancel_error_message_read.sellers_sale_days == fractional_prior_day_trade_cancel_error_message_written.sellers_sale_days);
  assert(fractional_prior_day_trade_cancel_error_message_read.stop_stock_indicator == fractional_prior_day_trade_cancel_error_message_written.stop_stock_indicator);
  assert(fractional_prior_day_trade_cancel_error_message_read.trade_through_exempt_indicator == fractional_prior_day_trade_cancel_error_message_written.trade_through_exempt_indicator);
  assert(fractional_prior_day_trade_cancel_error_message_read.short_sale_restriction_indicator == fractional_prior_day_trade_cancel_error_message_written.short_sale_restriction_indicator);
  assert(fractional_prior_day_trade_cancel_error_message_read.trade_reporting_facility_id == fractional_prior_day_trade_cancel_error_message_written.trade_reporting_facility_id);
  equal_prior_day_trade_date_and_time(fractional_prior_day_trade_cancel_error_message_read.prior_day_trade_date_and_time, fractional_prior_day_trade_cancel_error_message_written.prior_day_trade_date_and_time);
  assert(fractional_prior_day_trade_cancel_error_message_read.cancel_error_action == fractional_prior_day_trade_cancel_error_message_written.cancel_error_action);
  skip
}

/* ---- Consolidated Start Of Day Summary Message: 51 bytes --------------------- */

/* The Consolidated Start of Day Summary messages are transmitted shortly after the Multicast Line ‘Start of Day’ message */
typedef ConsolidatedStartOfDaySummaryMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte security_symbol[11];
  byte instrument_type;
  byte summary_participant_id;
  byte previous_close_price_date[4];
  byte previous_close_price[8];
  byte short_sale_restriction_indicator;
  byte primary_listing_market_participant_id;
  byte financial_status_indicator;
  byte number_of_participants
};

int consolidated_start_of_day_summary_message_at;

/* every byte of Consolidated Start Of Day Summary Message set to one value */
inline fill_consolidated_start_of_day_summary_message(consolidated_start_of_day_summary_message_record, consolidated_start_of_day_summary_message_value) {
  consolidated_start_of_day_summary_message_record.participant_id = consolidated_start_of_day_summary_message_value;
  fill_timestamp1(consolidated_start_of_day_summary_message_record.timestamp_1, consolidated_start_of_day_summary_message_value);
  consolidated_start_of_day_summary_message_record.message_id = consolidated_start_of_day_summary_message_value;
  consolidated_start_of_day_summary_message_at = 0;
  do
  :: consolidated_start_of_day_summary_message_at < 4 -> consolidated_start_of_day_summary_message_record.transaction_id[consolidated_start_of_day_summary_message_at] = consolidated_start_of_day_summary_message_value; consolidated_start_of_day_summary_message_at = consolidated_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_start_of_day_summary_message_at = 0;
  do
  :: consolidated_start_of_day_summary_message_at < 8 -> consolidated_start_of_day_summary_message_record.participant_reference_number[consolidated_start_of_day_summary_message_at] = consolidated_start_of_day_summary_message_value; consolidated_start_of_day_summary_message_at = consolidated_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_start_of_day_summary_message_at = 0;
  do
  :: consolidated_start_of_day_summary_message_at < 11 -> consolidated_start_of_day_summary_message_record.security_symbol[consolidated_start_of_day_summary_message_at] = consolidated_start_of_day_summary_message_value; consolidated_start_of_day_summary_message_at = consolidated_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_start_of_day_summary_message_record.instrument_type = consolidated_start_of_day_summary_message_value;
  consolidated_start_of_day_summary_message_record.summary_participant_id = consolidated_start_of_day_summary_message_value;
  consolidated_start_of_day_summary_message_at = 0;
  do
  :: consolidated_start_of_day_summary_message_at < 4 -> consolidated_start_of_day_summary_message_record.previous_close_price_date[consolidated_start_of_day_summary_message_at] = consolidated_start_of_day_summary_message_value; consolidated_start_of_day_summary_message_at = consolidated_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_start_of_day_summary_message_at = 0;
  do
  :: consolidated_start_of_day_summary_message_at < 8 -> consolidated_start_of_day_summary_message_record.previous_close_price[consolidated_start_of_day_summary_message_at] = consolidated_start_of_day_summary_message_value; consolidated_start_of_day_summary_message_at = consolidated_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_start_of_day_summary_message_record.short_sale_restriction_indicator = consolidated_start_of_day_summary_message_value;
  consolidated_start_of_day_summary_message_record.primary_listing_market_participant_id = consolidated_start_of_day_summary_message_value;
  consolidated_start_of_day_summary_message_record.financial_status_indicator = consolidated_start_of_day_summary_message_value;
  consolidated_start_of_day_summary_message_record.number_of_participants = consolidated_start_of_day_summary_message_value;
  skip
}

/* each byte of Consolidated Start Of Day Summary Message set to where it lies, so a field read out of place says so */
inline ramp_consolidated_start_of_day_summary_message(consolidated_start_of_day_summary_message_record, consolidated_start_of_day_summary_message_base) {
  consolidated_start_of_day_summary_message_record.participant_id = (consolidated_start_of_day_summary_message_base + 0 + 1) % 256;
  ramp_timestamp1(consolidated_start_of_day_summary_message_record.timestamp_1, consolidated_start_of_day_summary_message_base + 1);
  consolidated_start_of_day_summary_message_record.message_id = (consolidated_start_of_day_summary_message_base + 9 + 1) % 256;
  consolidated_start_of_day_summary_message_at = 0;
  do
  :: consolidated_start_of_day_summary_message_at < 4 -> consolidated_start_of_day_summary_message_record.transaction_id[consolidated_start_of_day_summary_message_at] = (consolidated_start_of_day_summary_message_base + 10 + consolidated_start_of_day_summary_message_at + 1) % 256; consolidated_start_of_day_summary_message_at = consolidated_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_start_of_day_summary_message_at = 0;
  do
  :: consolidated_start_of_day_summary_message_at < 8 -> consolidated_start_of_day_summary_message_record.participant_reference_number[consolidated_start_of_day_summary_message_at] = (consolidated_start_of_day_summary_message_base + 14 + consolidated_start_of_day_summary_message_at + 1) % 256; consolidated_start_of_day_summary_message_at = consolidated_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_start_of_day_summary_message_at = 0;
  do
  :: consolidated_start_of_day_summary_message_at < 11 -> consolidated_start_of_day_summary_message_record.security_symbol[consolidated_start_of_day_summary_message_at] = (consolidated_start_of_day_summary_message_base + 22 + consolidated_start_of_day_summary_message_at + 1) % 256; consolidated_start_of_day_summary_message_at = consolidated_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_start_of_day_summary_message_record.instrument_type = (consolidated_start_of_day_summary_message_base + 33 + 1) % 256;
  consolidated_start_of_day_summary_message_record.summary_participant_id = (consolidated_start_of_day_summary_message_base + 34 + 1) % 256;
  consolidated_start_of_day_summary_message_at = 0;
  do
  :: consolidated_start_of_day_summary_message_at < 4 -> consolidated_start_of_day_summary_message_record.previous_close_price_date[consolidated_start_of_day_summary_message_at] = (consolidated_start_of_day_summary_message_base + 35 + consolidated_start_of_day_summary_message_at + 1) % 256; consolidated_start_of_day_summary_message_at = consolidated_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_start_of_day_summary_message_at = 0;
  do
  :: consolidated_start_of_day_summary_message_at < 8 -> consolidated_start_of_day_summary_message_record.previous_close_price[consolidated_start_of_day_summary_message_at] = (consolidated_start_of_day_summary_message_base + 39 + consolidated_start_of_day_summary_message_at + 1) % 256; consolidated_start_of_day_summary_message_at = consolidated_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_start_of_day_summary_message_record.short_sale_restriction_indicator = (consolidated_start_of_day_summary_message_base + 47 + 1) % 256;
  consolidated_start_of_day_summary_message_record.primary_listing_market_participant_id = (consolidated_start_of_day_summary_message_base + 48 + 1) % 256;
  consolidated_start_of_day_summary_message_record.financial_status_indicator = (consolidated_start_of_day_summary_message_base + 49 + 1) % 256;
  consolidated_start_of_day_summary_message_record.number_of_participants = (consolidated_start_of_day_summary_message_base + 50 + 1) % 256;
  skip
}

/* Consolidated Start Of Day Summary Message to the wire, 51 bytes from where the cursor stands */
inline encode_consolidated_start_of_day_summary_message(consolidated_start_of_day_summary_message_record) {
  wire[at] = consolidated_start_of_day_summary_message_record.participant_id; at = at + 1;
  encode_timestamp1(consolidated_start_of_day_summary_message_record.timestamp_1);
  wire[at] = consolidated_start_of_day_summary_message_record.message_id; at = at + 1;
  consolidated_start_of_day_summary_message_at = 0;
  do
  :: consolidated_start_of_day_summary_message_at < 4 -> wire[at] = consolidated_start_of_day_summary_message_record.transaction_id[consolidated_start_of_day_summary_message_at]; at = at + 1; consolidated_start_of_day_summary_message_at = consolidated_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_start_of_day_summary_message_at = 0;
  do
  :: consolidated_start_of_day_summary_message_at < 8 -> wire[at] = consolidated_start_of_day_summary_message_record.participant_reference_number[consolidated_start_of_day_summary_message_at]; at = at + 1; consolidated_start_of_day_summary_message_at = consolidated_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_start_of_day_summary_message_at = 0;
  do
  :: consolidated_start_of_day_summary_message_at < 11 -> wire[at] = consolidated_start_of_day_summary_message_record.security_symbol[consolidated_start_of_day_summary_message_at]; at = at + 1; consolidated_start_of_day_summary_message_at = consolidated_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = consolidated_start_of_day_summary_message_record.instrument_type; at = at + 1;
  wire[at] = consolidated_start_of_day_summary_message_record.summary_participant_id; at = at + 1;
  consolidated_start_of_day_summary_message_at = 0;
  do
  :: consolidated_start_of_day_summary_message_at < 4 -> wire[at] = consolidated_start_of_day_summary_message_record.previous_close_price_date[consolidated_start_of_day_summary_message_at]; at = at + 1; consolidated_start_of_day_summary_message_at = consolidated_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_start_of_day_summary_message_at = 0;
  do
  :: consolidated_start_of_day_summary_message_at < 8 -> wire[at] = consolidated_start_of_day_summary_message_record.previous_close_price[consolidated_start_of_day_summary_message_at]; at = at + 1; consolidated_start_of_day_summary_message_at = consolidated_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = consolidated_start_of_day_summary_message_record.short_sale_restriction_indicator; at = at + 1;
  wire[at] = consolidated_start_of_day_summary_message_record.primary_listing_market_participant_id; at = at + 1;
  wire[at] = consolidated_start_of_day_summary_message_record.financial_status_indicator; at = at + 1;
  wire[at] = consolidated_start_of_day_summary_message_record.number_of_participants; at = at + 1;
  skip
}

/* Consolidated Start Of Day Summary Message off the wire, 51 bytes from where the cursor stands */
inline decode_consolidated_start_of_day_summary_message(consolidated_start_of_day_summary_message_record) {
  consolidated_start_of_day_summary_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(consolidated_start_of_day_summary_message_record.timestamp_1);
  consolidated_start_of_day_summary_message_record.message_id = wire[at]; at = at + 1;
  consolidated_start_of_day_summary_message_at = 0;
  do
  :: consolidated_start_of_day_summary_message_at < 4 -> consolidated_start_of_day_summary_message_record.transaction_id[consolidated_start_of_day_summary_message_at] = wire[at]; at = at + 1; consolidated_start_of_day_summary_message_at = consolidated_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_start_of_day_summary_message_at = 0;
  do
  :: consolidated_start_of_day_summary_message_at < 8 -> consolidated_start_of_day_summary_message_record.participant_reference_number[consolidated_start_of_day_summary_message_at] = wire[at]; at = at + 1; consolidated_start_of_day_summary_message_at = consolidated_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_start_of_day_summary_message_at = 0;
  do
  :: consolidated_start_of_day_summary_message_at < 11 -> consolidated_start_of_day_summary_message_record.security_symbol[consolidated_start_of_day_summary_message_at] = wire[at]; at = at + 1; consolidated_start_of_day_summary_message_at = consolidated_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_start_of_day_summary_message_record.instrument_type = wire[at]; at = at + 1;
  consolidated_start_of_day_summary_message_record.summary_participant_id = wire[at]; at = at + 1;
  consolidated_start_of_day_summary_message_at = 0;
  do
  :: consolidated_start_of_day_summary_message_at < 4 -> consolidated_start_of_day_summary_message_record.previous_close_price_date[consolidated_start_of_day_summary_message_at] = wire[at]; at = at + 1; consolidated_start_of_day_summary_message_at = consolidated_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_start_of_day_summary_message_at = 0;
  do
  :: consolidated_start_of_day_summary_message_at < 8 -> consolidated_start_of_day_summary_message_record.previous_close_price[consolidated_start_of_day_summary_message_at] = wire[at]; at = at + 1; consolidated_start_of_day_summary_message_at = consolidated_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_start_of_day_summary_message_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  consolidated_start_of_day_summary_message_record.primary_listing_market_participant_id = wire[at]; at = at + 1;
  consolidated_start_of_day_summary_message_record.financial_status_indicator = wire[at]; at = at + 1;
  consolidated_start_of_day_summary_message_record.number_of_participants = wire[at]; at = at + 1;
  skip
}

/* what was read of Consolidated Start Of Day Summary Message is what was written, byte for byte */
inline equal_consolidated_start_of_day_summary_message(consolidated_start_of_day_summary_message_read, consolidated_start_of_day_summary_message_written) {
  assert(consolidated_start_of_day_summary_message_read.participant_id == consolidated_start_of_day_summary_message_written.participant_id);
  equal_timestamp1(consolidated_start_of_day_summary_message_read.timestamp_1, consolidated_start_of_day_summary_message_written.timestamp_1);
  assert(consolidated_start_of_day_summary_message_read.message_id == consolidated_start_of_day_summary_message_written.message_id);
  consolidated_start_of_day_summary_message_at = 0;
  do
  :: consolidated_start_of_day_summary_message_at < 4 -> assert(consolidated_start_of_day_summary_message_read.transaction_id[consolidated_start_of_day_summary_message_at] == consolidated_start_of_day_summary_message_written.transaction_id[consolidated_start_of_day_summary_message_at]); consolidated_start_of_day_summary_message_at = consolidated_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_start_of_day_summary_message_at = 0;
  do
  :: consolidated_start_of_day_summary_message_at < 8 -> assert(consolidated_start_of_day_summary_message_read.participant_reference_number[consolidated_start_of_day_summary_message_at] == consolidated_start_of_day_summary_message_written.participant_reference_number[consolidated_start_of_day_summary_message_at]); consolidated_start_of_day_summary_message_at = consolidated_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_start_of_day_summary_message_at = 0;
  do
  :: consolidated_start_of_day_summary_message_at < 11 -> assert(consolidated_start_of_day_summary_message_read.security_symbol[consolidated_start_of_day_summary_message_at] == consolidated_start_of_day_summary_message_written.security_symbol[consolidated_start_of_day_summary_message_at]); consolidated_start_of_day_summary_message_at = consolidated_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  assert(consolidated_start_of_day_summary_message_read.instrument_type == consolidated_start_of_day_summary_message_written.instrument_type);
  assert(consolidated_start_of_day_summary_message_read.summary_participant_id == consolidated_start_of_day_summary_message_written.summary_participant_id);
  consolidated_start_of_day_summary_message_at = 0;
  do
  :: consolidated_start_of_day_summary_message_at < 4 -> assert(consolidated_start_of_day_summary_message_read.previous_close_price_date[consolidated_start_of_day_summary_message_at] == consolidated_start_of_day_summary_message_written.previous_close_price_date[consolidated_start_of_day_summary_message_at]); consolidated_start_of_day_summary_message_at = consolidated_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_start_of_day_summary_message_at = 0;
  do
  :: consolidated_start_of_day_summary_message_at < 8 -> assert(consolidated_start_of_day_summary_message_read.previous_close_price[consolidated_start_of_day_summary_message_at] == consolidated_start_of_day_summary_message_written.previous_close_price[consolidated_start_of_day_summary_message_at]); consolidated_start_of_day_summary_message_at = consolidated_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  assert(consolidated_start_of_day_summary_message_read.short_sale_restriction_indicator == consolidated_start_of_day_summary_message_written.short_sale_restriction_indicator);
  assert(consolidated_start_of_day_summary_message_read.primary_listing_market_participant_id == consolidated_start_of_day_summary_message_written.primary_listing_market_participant_id);
  assert(consolidated_start_of_day_summary_message_read.financial_status_indicator == consolidated_start_of_day_summary_message_written.financial_status_indicator);
  assert(consolidated_start_of_day_summary_message_read.number_of_participants == consolidated_start_of_day_summary_message_written.number_of_participants);
  skip
}

/* ---- Participant Start Of Day Summary Message: 47 bytes ---------------------- */

/* The Participant Start of Day Summary messages are transmitted shortly after the Multicast Line ‘Start of Day’ message */
typedef ParticipantStartOfDaySummaryMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte security_symbol[11];
  byte instrument_type;
  byte summary_participant_id;
  byte previous_close_price_date[4];
  byte previous_close_price[8]
};

int participant_start_of_day_summary_message_at;

/* every byte of Participant Start Of Day Summary Message set to one value */
inline fill_participant_start_of_day_summary_message(participant_start_of_day_summary_message_record, participant_start_of_day_summary_message_value) {
  participant_start_of_day_summary_message_record.participant_id = participant_start_of_day_summary_message_value;
  fill_timestamp1(participant_start_of_day_summary_message_record.timestamp_1, participant_start_of_day_summary_message_value);
  participant_start_of_day_summary_message_record.message_id = participant_start_of_day_summary_message_value;
  participant_start_of_day_summary_message_at = 0;
  do
  :: participant_start_of_day_summary_message_at < 4 -> participant_start_of_day_summary_message_record.transaction_id[participant_start_of_day_summary_message_at] = participant_start_of_day_summary_message_value; participant_start_of_day_summary_message_at = participant_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_start_of_day_summary_message_at = 0;
  do
  :: participant_start_of_day_summary_message_at < 8 -> participant_start_of_day_summary_message_record.participant_reference_number[participant_start_of_day_summary_message_at] = participant_start_of_day_summary_message_value; participant_start_of_day_summary_message_at = participant_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_start_of_day_summary_message_at = 0;
  do
  :: participant_start_of_day_summary_message_at < 11 -> participant_start_of_day_summary_message_record.security_symbol[participant_start_of_day_summary_message_at] = participant_start_of_day_summary_message_value; participant_start_of_day_summary_message_at = participant_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_start_of_day_summary_message_record.instrument_type = participant_start_of_day_summary_message_value;
  participant_start_of_day_summary_message_record.summary_participant_id = participant_start_of_day_summary_message_value;
  participant_start_of_day_summary_message_at = 0;
  do
  :: participant_start_of_day_summary_message_at < 4 -> participant_start_of_day_summary_message_record.previous_close_price_date[participant_start_of_day_summary_message_at] = participant_start_of_day_summary_message_value; participant_start_of_day_summary_message_at = participant_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_start_of_day_summary_message_at = 0;
  do
  :: participant_start_of_day_summary_message_at < 8 -> participant_start_of_day_summary_message_record.previous_close_price[participant_start_of_day_summary_message_at] = participant_start_of_day_summary_message_value; participant_start_of_day_summary_message_at = participant_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Participant Start Of Day Summary Message set to where it lies, so a field read out of place says so */
inline ramp_participant_start_of_day_summary_message(participant_start_of_day_summary_message_record, participant_start_of_day_summary_message_base) {
  participant_start_of_day_summary_message_record.participant_id = (participant_start_of_day_summary_message_base + 0 + 1) % 256;
  ramp_timestamp1(participant_start_of_day_summary_message_record.timestamp_1, participant_start_of_day_summary_message_base + 1);
  participant_start_of_day_summary_message_record.message_id = (participant_start_of_day_summary_message_base + 9 + 1) % 256;
  participant_start_of_day_summary_message_at = 0;
  do
  :: participant_start_of_day_summary_message_at < 4 -> participant_start_of_day_summary_message_record.transaction_id[participant_start_of_day_summary_message_at] = (participant_start_of_day_summary_message_base + 10 + participant_start_of_day_summary_message_at + 1) % 256; participant_start_of_day_summary_message_at = participant_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_start_of_day_summary_message_at = 0;
  do
  :: participant_start_of_day_summary_message_at < 8 -> participant_start_of_day_summary_message_record.participant_reference_number[participant_start_of_day_summary_message_at] = (participant_start_of_day_summary_message_base + 14 + participant_start_of_day_summary_message_at + 1) % 256; participant_start_of_day_summary_message_at = participant_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_start_of_day_summary_message_at = 0;
  do
  :: participant_start_of_day_summary_message_at < 11 -> participant_start_of_day_summary_message_record.security_symbol[participant_start_of_day_summary_message_at] = (participant_start_of_day_summary_message_base + 22 + participant_start_of_day_summary_message_at + 1) % 256; participant_start_of_day_summary_message_at = participant_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_start_of_day_summary_message_record.instrument_type = (participant_start_of_day_summary_message_base + 33 + 1) % 256;
  participant_start_of_day_summary_message_record.summary_participant_id = (participant_start_of_day_summary_message_base + 34 + 1) % 256;
  participant_start_of_day_summary_message_at = 0;
  do
  :: participant_start_of_day_summary_message_at < 4 -> participant_start_of_day_summary_message_record.previous_close_price_date[participant_start_of_day_summary_message_at] = (participant_start_of_day_summary_message_base + 35 + participant_start_of_day_summary_message_at + 1) % 256; participant_start_of_day_summary_message_at = participant_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_start_of_day_summary_message_at = 0;
  do
  :: participant_start_of_day_summary_message_at < 8 -> participant_start_of_day_summary_message_record.previous_close_price[participant_start_of_day_summary_message_at] = (participant_start_of_day_summary_message_base + 39 + participant_start_of_day_summary_message_at + 1) % 256; participant_start_of_day_summary_message_at = participant_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Participant Start Of Day Summary Message to the wire, 47 bytes from where the cursor stands */
inline encode_participant_start_of_day_summary_message(participant_start_of_day_summary_message_record) {
  wire[at] = participant_start_of_day_summary_message_record.participant_id; at = at + 1;
  encode_timestamp1(participant_start_of_day_summary_message_record.timestamp_1);
  wire[at] = participant_start_of_day_summary_message_record.message_id; at = at + 1;
  participant_start_of_day_summary_message_at = 0;
  do
  :: participant_start_of_day_summary_message_at < 4 -> wire[at] = participant_start_of_day_summary_message_record.transaction_id[participant_start_of_day_summary_message_at]; at = at + 1; participant_start_of_day_summary_message_at = participant_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_start_of_day_summary_message_at = 0;
  do
  :: participant_start_of_day_summary_message_at < 8 -> wire[at] = participant_start_of_day_summary_message_record.participant_reference_number[participant_start_of_day_summary_message_at]; at = at + 1; participant_start_of_day_summary_message_at = participant_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_start_of_day_summary_message_at = 0;
  do
  :: participant_start_of_day_summary_message_at < 11 -> wire[at] = participant_start_of_day_summary_message_record.security_symbol[participant_start_of_day_summary_message_at]; at = at + 1; participant_start_of_day_summary_message_at = participant_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = participant_start_of_day_summary_message_record.instrument_type; at = at + 1;
  wire[at] = participant_start_of_day_summary_message_record.summary_participant_id; at = at + 1;
  participant_start_of_day_summary_message_at = 0;
  do
  :: participant_start_of_day_summary_message_at < 4 -> wire[at] = participant_start_of_day_summary_message_record.previous_close_price_date[participant_start_of_day_summary_message_at]; at = at + 1; participant_start_of_day_summary_message_at = participant_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_start_of_day_summary_message_at = 0;
  do
  :: participant_start_of_day_summary_message_at < 8 -> wire[at] = participant_start_of_day_summary_message_record.previous_close_price[participant_start_of_day_summary_message_at]; at = at + 1; participant_start_of_day_summary_message_at = participant_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Participant Start Of Day Summary Message off the wire, 47 bytes from where the cursor stands */
inline decode_participant_start_of_day_summary_message(participant_start_of_day_summary_message_record) {
  participant_start_of_day_summary_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(participant_start_of_day_summary_message_record.timestamp_1);
  participant_start_of_day_summary_message_record.message_id = wire[at]; at = at + 1;
  participant_start_of_day_summary_message_at = 0;
  do
  :: participant_start_of_day_summary_message_at < 4 -> participant_start_of_day_summary_message_record.transaction_id[participant_start_of_day_summary_message_at] = wire[at]; at = at + 1; participant_start_of_day_summary_message_at = participant_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_start_of_day_summary_message_at = 0;
  do
  :: participant_start_of_day_summary_message_at < 8 -> participant_start_of_day_summary_message_record.participant_reference_number[participant_start_of_day_summary_message_at] = wire[at]; at = at + 1; participant_start_of_day_summary_message_at = participant_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_start_of_day_summary_message_at = 0;
  do
  :: participant_start_of_day_summary_message_at < 11 -> participant_start_of_day_summary_message_record.security_symbol[participant_start_of_day_summary_message_at] = wire[at]; at = at + 1; participant_start_of_day_summary_message_at = participant_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_start_of_day_summary_message_record.instrument_type = wire[at]; at = at + 1;
  participant_start_of_day_summary_message_record.summary_participant_id = wire[at]; at = at + 1;
  participant_start_of_day_summary_message_at = 0;
  do
  :: participant_start_of_day_summary_message_at < 4 -> participant_start_of_day_summary_message_record.previous_close_price_date[participant_start_of_day_summary_message_at] = wire[at]; at = at + 1; participant_start_of_day_summary_message_at = participant_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_start_of_day_summary_message_at = 0;
  do
  :: participant_start_of_day_summary_message_at < 8 -> participant_start_of_day_summary_message_record.previous_close_price[participant_start_of_day_summary_message_at] = wire[at]; at = at + 1; participant_start_of_day_summary_message_at = participant_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Participant Start Of Day Summary Message is what was written, byte for byte */
inline equal_participant_start_of_day_summary_message(participant_start_of_day_summary_message_read, participant_start_of_day_summary_message_written) {
  assert(participant_start_of_day_summary_message_read.participant_id == participant_start_of_day_summary_message_written.participant_id);
  equal_timestamp1(participant_start_of_day_summary_message_read.timestamp_1, participant_start_of_day_summary_message_written.timestamp_1);
  assert(participant_start_of_day_summary_message_read.message_id == participant_start_of_day_summary_message_written.message_id);
  participant_start_of_day_summary_message_at = 0;
  do
  :: participant_start_of_day_summary_message_at < 4 -> assert(participant_start_of_day_summary_message_read.transaction_id[participant_start_of_day_summary_message_at] == participant_start_of_day_summary_message_written.transaction_id[participant_start_of_day_summary_message_at]); participant_start_of_day_summary_message_at = participant_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_start_of_day_summary_message_at = 0;
  do
  :: participant_start_of_day_summary_message_at < 8 -> assert(participant_start_of_day_summary_message_read.participant_reference_number[participant_start_of_day_summary_message_at] == participant_start_of_day_summary_message_written.participant_reference_number[participant_start_of_day_summary_message_at]); participant_start_of_day_summary_message_at = participant_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_start_of_day_summary_message_at = 0;
  do
  :: participant_start_of_day_summary_message_at < 11 -> assert(participant_start_of_day_summary_message_read.security_symbol[participant_start_of_day_summary_message_at] == participant_start_of_day_summary_message_written.security_symbol[participant_start_of_day_summary_message_at]); participant_start_of_day_summary_message_at = participant_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  assert(participant_start_of_day_summary_message_read.instrument_type == participant_start_of_day_summary_message_written.instrument_type);
  assert(participant_start_of_day_summary_message_read.summary_participant_id == participant_start_of_day_summary_message_written.summary_participant_id);
  participant_start_of_day_summary_message_at = 0;
  do
  :: participant_start_of_day_summary_message_at < 4 -> assert(participant_start_of_day_summary_message_read.previous_close_price_date[participant_start_of_day_summary_message_at] == participant_start_of_day_summary_message_written.previous_close_price_date[participant_start_of_day_summary_message_at]); participant_start_of_day_summary_message_at = participant_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_start_of_day_summary_message_at = 0;
  do
  :: participant_start_of_day_summary_message_at < 8 -> assert(participant_start_of_day_summary_message_read.previous_close_price[participant_start_of_day_summary_message_at] == participant_start_of_day_summary_message_written.previous_close_price[participant_start_of_day_summary_message_at]); participant_start_of_day_summary_message_at = participant_start_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Consolidated End Of Day Summary Message: 75 bytes ----------------------- */

/* The Consolidated End of Day Summary messages are transmitted shortly before the "Goodnight" messages */
typedef ConsolidatedEndOfDaySummaryMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte security_symbol[11];
  byte instrument_type;
  byte last_participant_id;
  byte previous_close_price_date[4];
  byte last_price[8];
  byte high_price[8];
  byte low_price[8];
  byte total_volume[8];
  byte short_sale_restriction_indicator;
  byte primary_listing_market_participant_id;
  byte financial_status_indicator;
  byte number_of_participants
};

int consolidated_end_of_day_summary_message_at;

/* every byte of Consolidated End Of Day Summary Message set to one value */
inline fill_consolidated_end_of_day_summary_message(consolidated_end_of_day_summary_message_record, consolidated_end_of_day_summary_message_value) {
  consolidated_end_of_day_summary_message_record.participant_id = consolidated_end_of_day_summary_message_value;
  fill_timestamp1(consolidated_end_of_day_summary_message_record.timestamp_1, consolidated_end_of_day_summary_message_value);
  consolidated_end_of_day_summary_message_record.message_id = consolidated_end_of_day_summary_message_value;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 4 -> consolidated_end_of_day_summary_message_record.transaction_id[consolidated_end_of_day_summary_message_at] = consolidated_end_of_day_summary_message_value; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 8 -> consolidated_end_of_day_summary_message_record.participant_reference_number[consolidated_end_of_day_summary_message_at] = consolidated_end_of_day_summary_message_value; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 11 -> consolidated_end_of_day_summary_message_record.security_symbol[consolidated_end_of_day_summary_message_at] = consolidated_end_of_day_summary_message_value; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_record.instrument_type = consolidated_end_of_day_summary_message_value;
  consolidated_end_of_day_summary_message_record.last_participant_id = consolidated_end_of_day_summary_message_value;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 4 -> consolidated_end_of_day_summary_message_record.previous_close_price_date[consolidated_end_of_day_summary_message_at] = consolidated_end_of_day_summary_message_value; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 8 -> consolidated_end_of_day_summary_message_record.last_price[consolidated_end_of_day_summary_message_at] = consolidated_end_of_day_summary_message_value; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 8 -> consolidated_end_of_day_summary_message_record.high_price[consolidated_end_of_day_summary_message_at] = consolidated_end_of_day_summary_message_value; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 8 -> consolidated_end_of_day_summary_message_record.low_price[consolidated_end_of_day_summary_message_at] = consolidated_end_of_day_summary_message_value; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 8 -> consolidated_end_of_day_summary_message_record.total_volume[consolidated_end_of_day_summary_message_at] = consolidated_end_of_day_summary_message_value; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_record.short_sale_restriction_indicator = consolidated_end_of_day_summary_message_value;
  consolidated_end_of_day_summary_message_record.primary_listing_market_participant_id = consolidated_end_of_day_summary_message_value;
  consolidated_end_of_day_summary_message_record.financial_status_indicator = consolidated_end_of_day_summary_message_value;
  consolidated_end_of_day_summary_message_record.number_of_participants = consolidated_end_of_day_summary_message_value;
  skip
}

/* each byte of Consolidated End Of Day Summary Message set to where it lies, so a field read out of place says so */
inline ramp_consolidated_end_of_day_summary_message(consolidated_end_of_day_summary_message_record, consolidated_end_of_day_summary_message_base) {
  consolidated_end_of_day_summary_message_record.participant_id = (consolidated_end_of_day_summary_message_base + 0 + 1) % 256;
  ramp_timestamp1(consolidated_end_of_day_summary_message_record.timestamp_1, consolidated_end_of_day_summary_message_base + 1);
  consolidated_end_of_day_summary_message_record.message_id = (consolidated_end_of_day_summary_message_base + 9 + 1) % 256;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 4 -> consolidated_end_of_day_summary_message_record.transaction_id[consolidated_end_of_day_summary_message_at] = (consolidated_end_of_day_summary_message_base + 10 + consolidated_end_of_day_summary_message_at + 1) % 256; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 8 -> consolidated_end_of_day_summary_message_record.participant_reference_number[consolidated_end_of_day_summary_message_at] = (consolidated_end_of_day_summary_message_base + 14 + consolidated_end_of_day_summary_message_at + 1) % 256; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 11 -> consolidated_end_of_day_summary_message_record.security_symbol[consolidated_end_of_day_summary_message_at] = (consolidated_end_of_day_summary_message_base + 22 + consolidated_end_of_day_summary_message_at + 1) % 256; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_record.instrument_type = (consolidated_end_of_day_summary_message_base + 33 + 1) % 256;
  consolidated_end_of_day_summary_message_record.last_participant_id = (consolidated_end_of_day_summary_message_base + 34 + 1) % 256;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 4 -> consolidated_end_of_day_summary_message_record.previous_close_price_date[consolidated_end_of_day_summary_message_at] = (consolidated_end_of_day_summary_message_base + 35 + consolidated_end_of_day_summary_message_at + 1) % 256; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 8 -> consolidated_end_of_day_summary_message_record.last_price[consolidated_end_of_day_summary_message_at] = (consolidated_end_of_day_summary_message_base + 39 + consolidated_end_of_day_summary_message_at + 1) % 256; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 8 -> consolidated_end_of_day_summary_message_record.high_price[consolidated_end_of_day_summary_message_at] = (consolidated_end_of_day_summary_message_base + 47 + consolidated_end_of_day_summary_message_at + 1) % 256; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 8 -> consolidated_end_of_day_summary_message_record.low_price[consolidated_end_of_day_summary_message_at] = (consolidated_end_of_day_summary_message_base + 55 + consolidated_end_of_day_summary_message_at + 1) % 256; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 8 -> consolidated_end_of_day_summary_message_record.total_volume[consolidated_end_of_day_summary_message_at] = (consolidated_end_of_day_summary_message_base + 63 + consolidated_end_of_day_summary_message_at + 1) % 256; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_record.short_sale_restriction_indicator = (consolidated_end_of_day_summary_message_base + 71 + 1) % 256;
  consolidated_end_of_day_summary_message_record.primary_listing_market_participant_id = (consolidated_end_of_day_summary_message_base + 72 + 1) % 256;
  consolidated_end_of_day_summary_message_record.financial_status_indicator = (consolidated_end_of_day_summary_message_base + 73 + 1) % 256;
  consolidated_end_of_day_summary_message_record.number_of_participants = (consolidated_end_of_day_summary_message_base + 74 + 1) % 256;
  skip
}

/* Consolidated End Of Day Summary Message to the wire, 75 bytes from where the cursor stands */
inline encode_consolidated_end_of_day_summary_message(consolidated_end_of_day_summary_message_record) {
  wire[at] = consolidated_end_of_day_summary_message_record.participant_id; at = at + 1;
  encode_timestamp1(consolidated_end_of_day_summary_message_record.timestamp_1);
  wire[at] = consolidated_end_of_day_summary_message_record.message_id; at = at + 1;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 4 -> wire[at] = consolidated_end_of_day_summary_message_record.transaction_id[consolidated_end_of_day_summary_message_at]; at = at + 1; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 8 -> wire[at] = consolidated_end_of_day_summary_message_record.participant_reference_number[consolidated_end_of_day_summary_message_at]; at = at + 1; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 11 -> wire[at] = consolidated_end_of_day_summary_message_record.security_symbol[consolidated_end_of_day_summary_message_at]; at = at + 1; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = consolidated_end_of_day_summary_message_record.instrument_type; at = at + 1;
  wire[at] = consolidated_end_of_day_summary_message_record.last_participant_id; at = at + 1;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 4 -> wire[at] = consolidated_end_of_day_summary_message_record.previous_close_price_date[consolidated_end_of_day_summary_message_at]; at = at + 1; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 8 -> wire[at] = consolidated_end_of_day_summary_message_record.last_price[consolidated_end_of_day_summary_message_at]; at = at + 1; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 8 -> wire[at] = consolidated_end_of_day_summary_message_record.high_price[consolidated_end_of_day_summary_message_at]; at = at + 1; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 8 -> wire[at] = consolidated_end_of_day_summary_message_record.low_price[consolidated_end_of_day_summary_message_at]; at = at + 1; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 8 -> wire[at] = consolidated_end_of_day_summary_message_record.total_volume[consolidated_end_of_day_summary_message_at]; at = at + 1; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = consolidated_end_of_day_summary_message_record.short_sale_restriction_indicator; at = at + 1;
  wire[at] = consolidated_end_of_day_summary_message_record.primary_listing_market_participant_id; at = at + 1;
  wire[at] = consolidated_end_of_day_summary_message_record.financial_status_indicator; at = at + 1;
  wire[at] = consolidated_end_of_day_summary_message_record.number_of_participants; at = at + 1;
  skip
}

/* Consolidated End Of Day Summary Message off the wire, 75 bytes from where the cursor stands */
inline decode_consolidated_end_of_day_summary_message(consolidated_end_of_day_summary_message_record) {
  consolidated_end_of_day_summary_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(consolidated_end_of_day_summary_message_record.timestamp_1);
  consolidated_end_of_day_summary_message_record.message_id = wire[at]; at = at + 1;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 4 -> consolidated_end_of_day_summary_message_record.transaction_id[consolidated_end_of_day_summary_message_at] = wire[at]; at = at + 1; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 8 -> consolidated_end_of_day_summary_message_record.participant_reference_number[consolidated_end_of_day_summary_message_at] = wire[at]; at = at + 1; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 11 -> consolidated_end_of_day_summary_message_record.security_symbol[consolidated_end_of_day_summary_message_at] = wire[at]; at = at + 1; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_record.instrument_type = wire[at]; at = at + 1;
  consolidated_end_of_day_summary_message_record.last_participant_id = wire[at]; at = at + 1;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 4 -> consolidated_end_of_day_summary_message_record.previous_close_price_date[consolidated_end_of_day_summary_message_at] = wire[at]; at = at + 1; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 8 -> consolidated_end_of_day_summary_message_record.last_price[consolidated_end_of_day_summary_message_at] = wire[at]; at = at + 1; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 8 -> consolidated_end_of_day_summary_message_record.high_price[consolidated_end_of_day_summary_message_at] = wire[at]; at = at + 1; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 8 -> consolidated_end_of_day_summary_message_record.low_price[consolidated_end_of_day_summary_message_at] = wire[at]; at = at + 1; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 8 -> consolidated_end_of_day_summary_message_record.total_volume[consolidated_end_of_day_summary_message_at] = wire[at]; at = at + 1; consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  consolidated_end_of_day_summary_message_record.primary_listing_market_participant_id = wire[at]; at = at + 1;
  consolidated_end_of_day_summary_message_record.financial_status_indicator = wire[at]; at = at + 1;
  consolidated_end_of_day_summary_message_record.number_of_participants = wire[at]; at = at + 1;
  skip
}

/* what was read of Consolidated End Of Day Summary Message is what was written, byte for byte */
inline equal_consolidated_end_of_day_summary_message(consolidated_end_of_day_summary_message_read, consolidated_end_of_day_summary_message_written) {
  assert(consolidated_end_of_day_summary_message_read.participant_id == consolidated_end_of_day_summary_message_written.participant_id);
  equal_timestamp1(consolidated_end_of_day_summary_message_read.timestamp_1, consolidated_end_of_day_summary_message_written.timestamp_1);
  assert(consolidated_end_of_day_summary_message_read.message_id == consolidated_end_of_day_summary_message_written.message_id);
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 4 -> assert(consolidated_end_of_day_summary_message_read.transaction_id[consolidated_end_of_day_summary_message_at] == consolidated_end_of_day_summary_message_written.transaction_id[consolidated_end_of_day_summary_message_at]); consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 8 -> assert(consolidated_end_of_day_summary_message_read.participant_reference_number[consolidated_end_of_day_summary_message_at] == consolidated_end_of_day_summary_message_written.participant_reference_number[consolidated_end_of_day_summary_message_at]); consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 11 -> assert(consolidated_end_of_day_summary_message_read.security_symbol[consolidated_end_of_day_summary_message_at] == consolidated_end_of_day_summary_message_written.security_symbol[consolidated_end_of_day_summary_message_at]); consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  assert(consolidated_end_of_day_summary_message_read.instrument_type == consolidated_end_of_day_summary_message_written.instrument_type);
  assert(consolidated_end_of_day_summary_message_read.last_participant_id == consolidated_end_of_day_summary_message_written.last_participant_id);
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 4 -> assert(consolidated_end_of_day_summary_message_read.previous_close_price_date[consolidated_end_of_day_summary_message_at] == consolidated_end_of_day_summary_message_written.previous_close_price_date[consolidated_end_of_day_summary_message_at]); consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 8 -> assert(consolidated_end_of_day_summary_message_read.last_price[consolidated_end_of_day_summary_message_at] == consolidated_end_of_day_summary_message_written.last_price[consolidated_end_of_day_summary_message_at]); consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 8 -> assert(consolidated_end_of_day_summary_message_read.high_price[consolidated_end_of_day_summary_message_at] == consolidated_end_of_day_summary_message_written.high_price[consolidated_end_of_day_summary_message_at]); consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 8 -> assert(consolidated_end_of_day_summary_message_read.low_price[consolidated_end_of_day_summary_message_at] == consolidated_end_of_day_summary_message_written.low_price[consolidated_end_of_day_summary_message_at]); consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  consolidated_end_of_day_summary_message_at = 0;
  do
  :: consolidated_end_of_day_summary_message_at < 8 -> assert(consolidated_end_of_day_summary_message_read.total_volume[consolidated_end_of_day_summary_message_at] == consolidated_end_of_day_summary_message_written.total_volume[consolidated_end_of_day_summary_message_at]); consolidated_end_of_day_summary_message_at = consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  assert(consolidated_end_of_day_summary_message_read.short_sale_restriction_indicator == consolidated_end_of_day_summary_message_written.short_sale_restriction_indicator);
  assert(consolidated_end_of_day_summary_message_read.primary_listing_market_participant_id == consolidated_end_of_day_summary_message_written.primary_listing_market_participant_id);
  assert(consolidated_end_of_day_summary_message_read.financial_status_indicator == consolidated_end_of_day_summary_message_written.financial_status_indicator);
  assert(consolidated_end_of_day_summary_message_read.number_of_participants == consolidated_end_of_day_summary_message_written.number_of_participants);
  skip
}

/* ---- Fractional Consolidated End Of Day Summary Message: 75 bytes ------------ */

/* The Consolidated End of Day Summary messages are transmitted shortly before the "Goodnight" messages */
typedef FractionalConsolidatedEndOfDaySummaryMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte security_symbol[11];
  byte instrument_type;
  byte last_participant_id;
  byte previous_close_price_date[4];
  byte last_price[8];
  byte high_price[8];
  byte low_price[8];
  byte fractional_total_volume[8];
  byte short_sale_restriction_indicator;
  byte primary_listing_market_participant_id;
  byte financial_status_indicator;
  byte number_of_participants
};

int fractional_consolidated_end_of_day_summary_message_at;

/* every byte of Fractional Consolidated End Of Day Summary Message set to one value */
inline fill_fractional_consolidated_end_of_day_summary_message(fractional_consolidated_end_of_day_summary_message_record, fractional_consolidated_end_of_day_summary_message_value) {
  fractional_consolidated_end_of_day_summary_message_record.participant_id = fractional_consolidated_end_of_day_summary_message_value;
  fill_timestamp1(fractional_consolidated_end_of_day_summary_message_record.timestamp_1, fractional_consolidated_end_of_day_summary_message_value);
  fractional_consolidated_end_of_day_summary_message_record.message_id = fractional_consolidated_end_of_day_summary_message_value;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 4 -> fractional_consolidated_end_of_day_summary_message_record.transaction_id[fractional_consolidated_end_of_day_summary_message_at] = fractional_consolidated_end_of_day_summary_message_value; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 8 -> fractional_consolidated_end_of_day_summary_message_record.participant_reference_number[fractional_consolidated_end_of_day_summary_message_at] = fractional_consolidated_end_of_day_summary_message_value; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 11 -> fractional_consolidated_end_of_day_summary_message_record.security_symbol[fractional_consolidated_end_of_day_summary_message_at] = fractional_consolidated_end_of_day_summary_message_value; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_record.instrument_type = fractional_consolidated_end_of_day_summary_message_value;
  fractional_consolidated_end_of_day_summary_message_record.last_participant_id = fractional_consolidated_end_of_day_summary_message_value;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 4 -> fractional_consolidated_end_of_day_summary_message_record.previous_close_price_date[fractional_consolidated_end_of_day_summary_message_at] = fractional_consolidated_end_of_day_summary_message_value; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 8 -> fractional_consolidated_end_of_day_summary_message_record.last_price[fractional_consolidated_end_of_day_summary_message_at] = fractional_consolidated_end_of_day_summary_message_value; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 8 -> fractional_consolidated_end_of_day_summary_message_record.high_price[fractional_consolidated_end_of_day_summary_message_at] = fractional_consolidated_end_of_day_summary_message_value; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 8 -> fractional_consolidated_end_of_day_summary_message_record.low_price[fractional_consolidated_end_of_day_summary_message_at] = fractional_consolidated_end_of_day_summary_message_value; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 8 -> fractional_consolidated_end_of_day_summary_message_record.fractional_total_volume[fractional_consolidated_end_of_day_summary_message_at] = fractional_consolidated_end_of_day_summary_message_value; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_record.short_sale_restriction_indicator = fractional_consolidated_end_of_day_summary_message_value;
  fractional_consolidated_end_of_day_summary_message_record.primary_listing_market_participant_id = fractional_consolidated_end_of_day_summary_message_value;
  fractional_consolidated_end_of_day_summary_message_record.financial_status_indicator = fractional_consolidated_end_of_day_summary_message_value;
  fractional_consolidated_end_of_day_summary_message_record.number_of_participants = fractional_consolidated_end_of_day_summary_message_value;
  skip
}

/* each byte of Fractional Consolidated End Of Day Summary Message set to where it lies, so a field read out of place says so */
inline ramp_fractional_consolidated_end_of_day_summary_message(fractional_consolidated_end_of_day_summary_message_record, fractional_consolidated_end_of_day_summary_message_base) {
  fractional_consolidated_end_of_day_summary_message_record.participant_id = (fractional_consolidated_end_of_day_summary_message_base + 0 + 1) % 256;
  ramp_timestamp1(fractional_consolidated_end_of_day_summary_message_record.timestamp_1, fractional_consolidated_end_of_day_summary_message_base + 1);
  fractional_consolidated_end_of_day_summary_message_record.message_id = (fractional_consolidated_end_of_day_summary_message_base + 9 + 1) % 256;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 4 -> fractional_consolidated_end_of_day_summary_message_record.transaction_id[fractional_consolidated_end_of_day_summary_message_at] = (fractional_consolidated_end_of_day_summary_message_base + 10 + fractional_consolidated_end_of_day_summary_message_at + 1) % 256; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 8 -> fractional_consolidated_end_of_day_summary_message_record.participant_reference_number[fractional_consolidated_end_of_day_summary_message_at] = (fractional_consolidated_end_of_day_summary_message_base + 14 + fractional_consolidated_end_of_day_summary_message_at + 1) % 256; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 11 -> fractional_consolidated_end_of_day_summary_message_record.security_symbol[fractional_consolidated_end_of_day_summary_message_at] = (fractional_consolidated_end_of_day_summary_message_base + 22 + fractional_consolidated_end_of_day_summary_message_at + 1) % 256; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_record.instrument_type = (fractional_consolidated_end_of_day_summary_message_base + 33 + 1) % 256;
  fractional_consolidated_end_of_day_summary_message_record.last_participant_id = (fractional_consolidated_end_of_day_summary_message_base + 34 + 1) % 256;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 4 -> fractional_consolidated_end_of_day_summary_message_record.previous_close_price_date[fractional_consolidated_end_of_day_summary_message_at] = (fractional_consolidated_end_of_day_summary_message_base + 35 + fractional_consolidated_end_of_day_summary_message_at + 1) % 256; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 8 -> fractional_consolidated_end_of_day_summary_message_record.last_price[fractional_consolidated_end_of_day_summary_message_at] = (fractional_consolidated_end_of_day_summary_message_base + 39 + fractional_consolidated_end_of_day_summary_message_at + 1) % 256; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 8 -> fractional_consolidated_end_of_day_summary_message_record.high_price[fractional_consolidated_end_of_day_summary_message_at] = (fractional_consolidated_end_of_day_summary_message_base + 47 + fractional_consolidated_end_of_day_summary_message_at + 1) % 256; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 8 -> fractional_consolidated_end_of_day_summary_message_record.low_price[fractional_consolidated_end_of_day_summary_message_at] = (fractional_consolidated_end_of_day_summary_message_base + 55 + fractional_consolidated_end_of_day_summary_message_at + 1) % 256; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 8 -> fractional_consolidated_end_of_day_summary_message_record.fractional_total_volume[fractional_consolidated_end_of_day_summary_message_at] = (fractional_consolidated_end_of_day_summary_message_base + 63 + fractional_consolidated_end_of_day_summary_message_at + 1) % 256; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_record.short_sale_restriction_indicator = (fractional_consolidated_end_of_day_summary_message_base + 71 + 1) % 256;
  fractional_consolidated_end_of_day_summary_message_record.primary_listing_market_participant_id = (fractional_consolidated_end_of_day_summary_message_base + 72 + 1) % 256;
  fractional_consolidated_end_of_day_summary_message_record.financial_status_indicator = (fractional_consolidated_end_of_day_summary_message_base + 73 + 1) % 256;
  fractional_consolidated_end_of_day_summary_message_record.number_of_participants = (fractional_consolidated_end_of_day_summary_message_base + 74 + 1) % 256;
  skip
}

/* Fractional Consolidated End Of Day Summary Message to the wire, 75 bytes from where the cursor stands */
inline encode_fractional_consolidated_end_of_day_summary_message(fractional_consolidated_end_of_day_summary_message_record) {
  wire[at] = fractional_consolidated_end_of_day_summary_message_record.participant_id; at = at + 1;
  encode_timestamp1(fractional_consolidated_end_of_day_summary_message_record.timestamp_1);
  wire[at] = fractional_consolidated_end_of_day_summary_message_record.message_id; at = at + 1;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 4 -> wire[at] = fractional_consolidated_end_of_day_summary_message_record.transaction_id[fractional_consolidated_end_of_day_summary_message_at]; at = at + 1; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 8 -> wire[at] = fractional_consolidated_end_of_day_summary_message_record.participant_reference_number[fractional_consolidated_end_of_day_summary_message_at]; at = at + 1; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 11 -> wire[at] = fractional_consolidated_end_of_day_summary_message_record.security_symbol[fractional_consolidated_end_of_day_summary_message_at]; at = at + 1; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_consolidated_end_of_day_summary_message_record.instrument_type; at = at + 1;
  wire[at] = fractional_consolidated_end_of_day_summary_message_record.last_participant_id; at = at + 1;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 4 -> wire[at] = fractional_consolidated_end_of_day_summary_message_record.previous_close_price_date[fractional_consolidated_end_of_day_summary_message_at]; at = at + 1; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 8 -> wire[at] = fractional_consolidated_end_of_day_summary_message_record.last_price[fractional_consolidated_end_of_day_summary_message_at]; at = at + 1; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 8 -> wire[at] = fractional_consolidated_end_of_day_summary_message_record.high_price[fractional_consolidated_end_of_day_summary_message_at]; at = at + 1; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 8 -> wire[at] = fractional_consolidated_end_of_day_summary_message_record.low_price[fractional_consolidated_end_of_day_summary_message_at]; at = at + 1; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 8 -> wire[at] = fractional_consolidated_end_of_day_summary_message_record.fractional_total_volume[fractional_consolidated_end_of_day_summary_message_at]; at = at + 1; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_consolidated_end_of_day_summary_message_record.short_sale_restriction_indicator; at = at + 1;
  wire[at] = fractional_consolidated_end_of_day_summary_message_record.primary_listing_market_participant_id; at = at + 1;
  wire[at] = fractional_consolidated_end_of_day_summary_message_record.financial_status_indicator; at = at + 1;
  wire[at] = fractional_consolidated_end_of_day_summary_message_record.number_of_participants; at = at + 1;
  skip
}

/* Fractional Consolidated End Of Day Summary Message off the wire, 75 bytes from where the cursor stands */
inline decode_fractional_consolidated_end_of_day_summary_message(fractional_consolidated_end_of_day_summary_message_record) {
  fractional_consolidated_end_of_day_summary_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(fractional_consolidated_end_of_day_summary_message_record.timestamp_1);
  fractional_consolidated_end_of_day_summary_message_record.message_id = wire[at]; at = at + 1;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 4 -> fractional_consolidated_end_of_day_summary_message_record.transaction_id[fractional_consolidated_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 8 -> fractional_consolidated_end_of_day_summary_message_record.participant_reference_number[fractional_consolidated_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 11 -> fractional_consolidated_end_of_day_summary_message_record.security_symbol[fractional_consolidated_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_record.instrument_type = wire[at]; at = at + 1;
  fractional_consolidated_end_of_day_summary_message_record.last_participant_id = wire[at]; at = at + 1;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 4 -> fractional_consolidated_end_of_day_summary_message_record.previous_close_price_date[fractional_consolidated_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 8 -> fractional_consolidated_end_of_day_summary_message_record.last_price[fractional_consolidated_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 8 -> fractional_consolidated_end_of_day_summary_message_record.high_price[fractional_consolidated_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 8 -> fractional_consolidated_end_of_day_summary_message_record.low_price[fractional_consolidated_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 8 -> fractional_consolidated_end_of_day_summary_message_record.fractional_total_volume[fractional_consolidated_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  fractional_consolidated_end_of_day_summary_message_record.primary_listing_market_participant_id = wire[at]; at = at + 1;
  fractional_consolidated_end_of_day_summary_message_record.financial_status_indicator = wire[at]; at = at + 1;
  fractional_consolidated_end_of_day_summary_message_record.number_of_participants = wire[at]; at = at + 1;
  skip
}

/* what was read of Fractional Consolidated End Of Day Summary Message is what was written, byte for byte */
inline equal_fractional_consolidated_end_of_day_summary_message(fractional_consolidated_end_of_day_summary_message_read, fractional_consolidated_end_of_day_summary_message_written) {
  assert(fractional_consolidated_end_of_day_summary_message_read.participant_id == fractional_consolidated_end_of_day_summary_message_written.participant_id);
  equal_timestamp1(fractional_consolidated_end_of_day_summary_message_read.timestamp_1, fractional_consolidated_end_of_day_summary_message_written.timestamp_1);
  assert(fractional_consolidated_end_of_day_summary_message_read.message_id == fractional_consolidated_end_of_day_summary_message_written.message_id);
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 4 -> assert(fractional_consolidated_end_of_day_summary_message_read.transaction_id[fractional_consolidated_end_of_day_summary_message_at] == fractional_consolidated_end_of_day_summary_message_written.transaction_id[fractional_consolidated_end_of_day_summary_message_at]); fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 8 -> assert(fractional_consolidated_end_of_day_summary_message_read.participant_reference_number[fractional_consolidated_end_of_day_summary_message_at] == fractional_consolidated_end_of_day_summary_message_written.participant_reference_number[fractional_consolidated_end_of_day_summary_message_at]); fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 11 -> assert(fractional_consolidated_end_of_day_summary_message_read.security_symbol[fractional_consolidated_end_of_day_summary_message_at] == fractional_consolidated_end_of_day_summary_message_written.security_symbol[fractional_consolidated_end_of_day_summary_message_at]); fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  assert(fractional_consolidated_end_of_day_summary_message_read.instrument_type == fractional_consolidated_end_of_day_summary_message_written.instrument_type);
  assert(fractional_consolidated_end_of_day_summary_message_read.last_participant_id == fractional_consolidated_end_of_day_summary_message_written.last_participant_id);
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 4 -> assert(fractional_consolidated_end_of_day_summary_message_read.previous_close_price_date[fractional_consolidated_end_of_day_summary_message_at] == fractional_consolidated_end_of_day_summary_message_written.previous_close_price_date[fractional_consolidated_end_of_day_summary_message_at]); fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 8 -> assert(fractional_consolidated_end_of_day_summary_message_read.last_price[fractional_consolidated_end_of_day_summary_message_at] == fractional_consolidated_end_of_day_summary_message_written.last_price[fractional_consolidated_end_of_day_summary_message_at]); fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 8 -> assert(fractional_consolidated_end_of_day_summary_message_read.high_price[fractional_consolidated_end_of_day_summary_message_at] == fractional_consolidated_end_of_day_summary_message_written.high_price[fractional_consolidated_end_of_day_summary_message_at]); fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 8 -> assert(fractional_consolidated_end_of_day_summary_message_read.low_price[fractional_consolidated_end_of_day_summary_message_at] == fractional_consolidated_end_of_day_summary_message_written.low_price[fractional_consolidated_end_of_day_summary_message_at]); fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_consolidated_end_of_day_summary_message_at = 0;
  do
  :: fractional_consolidated_end_of_day_summary_message_at < 8 -> assert(fractional_consolidated_end_of_day_summary_message_read.fractional_total_volume[fractional_consolidated_end_of_day_summary_message_at] == fractional_consolidated_end_of_day_summary_message_written.fractional_total_volume[fractional_consolidated_end_of_day_summary_message_at]); fractional_consolidated_end_of_day_summary_message_at = fractional_consolidated_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  assert(fractional_consolidated_end_of_day_summary_message_read.short_sale_restriction_indicator == fractional_consolidated_end_of_day_summary_message_written.short_sale_restriction_indicator);
  assert(fractional_consolidated_end_of_day_summary_message_read.primary_listing_market_participant_id == fractional_consolidated_end_of_day_summary_message_written.primary_listing_market_participant_id);
  assert(fractional_consolidated_end_of_day_summary_message_read.financial_status_indicator == fractional_consolidated_end_of_day_summary_message_written.financial_status_indicator);
  assert(fractional_consolidated_end_of_day_summary_message_read.number_of_participants == fractional_consolidated_end_of_day_summary_message_written.number_of_participants);
  skip
}

/* ---- Participant End Of Day Summary Message: 80 bytes ------------------------ */

/* The Participant End of Day Summary messages are transmitted shortly before the ‘Goodnight’ messages. */
typedef ParticipantEndOfDaySummaryMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte security_symbol[11];
  byte instrument_type;
  byte initiating_participant_id;
  byte previous_close_price_date[4];
  byte last_price[8];
  byte high_price[8];
  byte low_price[8];
  byte open_price[8];
  byte total_volume[8];
  byte tick
};

int participant_end_of_day_summary_message_at;

/* every byte of Participant End Of Day Summary Message set to one value */
inline fill_participant_end_of_day_summary_message(participant_end_of_day_summary_message_record, participant_end_of_day_summary_message_value) {
  participant_end_of_day_summary_message_record.participant_id = participant_end_of_day_summary_message_value;
  fill_timestamp1(participant_end_of_day_summary_message_record.timestamp_1, participant_end_of_day_summary_message_value);
  participant_end_of_day_summary_message_record.message_id = participant_end_of_day_summary_message_value;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 4 -> participant_end_of_day_summary_message_record.transaction_id[participant_end_of_day_summary_message_at] = participant_end_of_day_summary_message_value; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> participant_end_of_day_summary_message_record.participant_reference_number[participant_end_of_day_summary_message_at] = participant_end_of_day_summary_message_value; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 11 -> participant_end_of_day_summary_message_record.security_symbol[participant_end_of_day_summary_message_at] = participant_end_of_day_summary_message_value; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_record.instrument_type = participant_end_of_day_summary_message_value;
  participant_end_of_day_summary_message_record.initiating_participant_id = participant_end_of_day_summary_message_value;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 4 -> participant_end_of_day_summary_message_record.previous_close_price_date[participant_end_of_day_summary_message_at] = participant_end_of_day_summary_message_value; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> participant_end_of_day_summary_message_record.last_price[participant_end_of_day_summary_message_at] = participant_end_of_day_summary_message_value; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> participant_end_of_day_summary_message_record.high_price[participant_end_of_day_summary_message_at] = participant_end_of_day_summary_message_value; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> participant_end_of_day_summary_message_record.low_price[participant_end_of_day_summary_message_at] = participant_end_of_day_summary_message_value; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> participant_end_of_day_summary_message_record.open_price[participant_end_of_day_summary_message_at] = participant_end_of_day_summary_message_value; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> participant_end_of_day_summary_message_record.total_volume[participant_end_of_day_summary_message_at] = participant_end_of_day_summary_message_value; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_record.tick = participant_end_of_day_summary_message_value;
  skip
}

/* each byte of Participant End Of Day Summary Message set to where it lies, so a field read out of place says so */
inline ramp_participant_end_of_day_summary_message(participant_end_of_day_summary_message_record, participant_end_of_day_summary_message_base) {
  participant_end_of_day_summary_message_record.participant_id = (participant_end_of_day_summary_message_base + 0 + 1) % 256;
  ramp_timestamp1(participant_end_of_day_summary_message_record.timestamp_1, participant_end_of_day_summary_message_base + 1);
  participant_end_of_day_summary_message_record.message_id = (participant_end_of_day_summary_message_base + 9 + 1) % 256;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 4 -> participant_end_of_day_summary_message_record.transaction_id[participant_end_of_day_summary_message_at] = (participant_end_of_day_summary_message_base + 10 + participant_end_of_day_summary_message_at + 1) % 256; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> participant_end_of_day_summary_message_record.participant_reference_number[participant_end_of_day_summary_message_at] = (participant_end_of_day_summary_message_base + 14 + participant_end_of_day_summary_message_at + 1) % 256; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 11 -> participant_end_of_day_summary_message_record.security_symbol[participant_end_of_day_summary_message_at] = (participant_end_of_day_summary_message_base + 22 + participant_end_of_day_summary_message_at + 1) % 256; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_record.instrument_type = (participant_end_of_day_summary_message_base + 33 + 1) % 256;
  participant_end_of_day_summary_message_record.initiating_participant_id = (participant_end_of_day_summary_message_base + 34 + 1) % 256;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 4 -> participant_end_of_day_summary_message_record.previous_close_price_date[participant_end_of_day_summary_message_at] = (participant_end_of_day_summary_message_base + 35 + participant_end_of_day_summary_message_at + 1) % 256; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> participant_end_of_day_summary_message_record.last_price[participant_end_of_day_summary_message_at] = (participant_end_of_day_summary_message_base + 39 + participant_end_of_day_summary_message_at + 1) % 256; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> participant_end_of_day_summary_message_record.high_price[participant_end_of_day_summary_message_at] = (participant_end_of_day_summary_message_base + 47 + participant_end_of_day_summary_message_at + 1) % 256; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> participant_end_of_day_summary_message_record.low_price[participant_end_of_day_summary_message_at] = (participant_end_of_day_summary_message_base + 55 + participant_end_of_day_summary_message_at + 1) % 256; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> participant_end_of_day_summary_message_record.open_price[participant_end_of_day_summary_message_at] = (participant_end_of_day_summary_message_base + 63 + participant_end_of_day_summary_message_at + 1) % 256; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> participant_end_of_day_summary_message_record.total_volume[participant_end_of_day_summary_message_at] = (participant_end_of_day_summary_message_base + 71 + participant_end_of_day_summary_message_at + 1) % 256; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_record.tick = (participant_end_of_day_summary_message_base + 79 + 1) % 256;
  skip
}

/* Participant End Of Day Summary Message to the wire, 80 bytes from where the cursor stands */
inline encode_participant_end_of_day_summary_message(participant_end_of_day_summary_message_record) {
  wire[at] = participant_end_of_day_summary_message_record.participant_id; at = at + 1;
  encode_timestamp1(participant_end_of_day_summary_message_record.timestamp_1);
  wire[at] = participant_end_of_day_summary_message_record.message_id; at = at + 1;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 4 -> wire[at] = participant_end_of_day_summary_message_record.transaction_id[participant_end_of_day_summary_message_at]; at = at + 1; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> wire[at] = participant_end_of_day_summary_message_record.participant_reference_number[participant_end_of_day_summary_message_at]; at = at + 1; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 11 -> wire[at] = participant_end_of_day_summary_message_record.security_symbol[participant_end_of_day_summary_message_at]; at = at + 1; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = participant_end_of_day_summary_message_record.instrument_type; at = at + 1;
  wire[at] = participant_end_of_day_summary_message_record.initiating_participant_id; at = at + 1;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 4 -> wire[at] = participant_end_of_day_summary_message_record.previous_close_price_date[participant_end_of_day_summary_message_at]; at = at + 1; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> wire[at] = participant_end_of_day_summary_message_record.last_price[participant_end_of_day_summary_message_at]; at = at + 1; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> wire[at] = participant_end_of_day_summary_message_record.high_price[participant_end_of_day_summary_message_at]; at = at + 1; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> wire[at] = participant_end_of_day_summary_message_record.low_price[participant_end_of_day_summary_message_at]; at = at + 1; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> wire[at] = participant_end_of_day_summary_message_record.open_price[participant_end_of_day_summary_message_at]; at = at + 1; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> wire[at] = participant_end_of_day_summary_message_record.total_volume[participant_end_of_day_summary_message_at]; at = at + 1; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = participant_end_of_day_summary_message_record.tick; at = at + 1;
  skip
}

/* Participant End Of Day Summary Message off the wire, 80 bytes from where the cursor stands */
inline decode_participant_end_of_day_summary_message(participant_end_of_day_summary_message_record) {
  participant_end_of_day_summary_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(participant_end_of_day_summary_message_record.timestamp_1);
  participant_end_of_day_summary_message_record.message_id = wire[at]; at = at + 1;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 4 -> participant_end_of_day_summary_message_record.transaction_id[participant_end_of_day_summary_message_at] = wire[at]; at = at + 1; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> participant_end_of_day_summary_message_record.participant_reference_number[participant_end_of_day_summary_message_at] = wire[at]; at = at + 1; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 11 -> participant_end_of_day_summary_message_record.security_symbol[participant_end_of_day_summary_message_at] = wire[at]; at = at + 1; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_record.instrument_type = wire[at]; at = at + 1;
  participant_end_of_day_summary_message_record.initiating_participant_id = wire[at]; at = at + 1;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 4 -> participant_end_of_day_summary_message_record.previous_close_price_date[participant_end_of_day_summary_message_at] = wire[at]; at = at + 1; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> participant_end_of_day_summary_message_record.last_price[participant_end_of_day_summary_message_at] = wire[at]; at = at + 1; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> participant_end_of_day_summary_message_record.high_price[participant_end_of_day_summary_message_at] = wire[at]; at = at + 1; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> participant_end_of_day_summary_message_record.low_price[participant_end_of_day_summary_message_at] = wire[at]; at = at + 1; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> participant_end_of_day_summary_message_record.open_price[participant_end_of_day_summary_message_at] = wire[at]; at = at + 1; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> participant_end_of_day_summary_message_record.total_volume[participant_end_of_day_summary_message_at] = wire[at]; at = at + 1; participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_record.tick = wire[at]; at = at + 1;
  skip
}

/* what was read of Participant End Of Day Summary Message is what was written, byte for byte */
inline equal_participant_end_of_day_summary_message(participant_end_of_day_summary_message_read, participant_end_of_day_summary_message_written) {
  assert(participant_end_of_day_summary_message_read.participant_id == participant_end_of_day_summary_message_written.participant_id);
  equal_timestamp1(participant_end_of_day_summary_message_read.timestamp_1, participant_end_of_day_summary_message_written.timestamp_1);
  assert(participant_end_of_day_summary_message_read.message_id == participant_end_of_day_summary_message_written.message_id);
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 4 -> assert(participant_end_of_day_summary_message_read.transaction_id[participant_end_of_day_summary_message_at] == participant_end_of_day_summary_message_written.transaction_id[participant_end_of_day_summary_message_at]); participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> assert(participant_end_of_day_summary_message_read.participant_reference_number[participant_end_of_day_summary_message_at] == participant_end_of_day_summary_message_written.participant_reference_number[participant_end_of_day_summary_message_at]); participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 11 -> assert(participant_end_of_day_summary_message_read.security_symbol[participant_end_of_day_summary_message_at] == participant_end_of_day_summary_message_written.security_symbol[participant_end_of_day_summary_message_at]); participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  assert(participant_end_of_day_summary_message_read.instrument_type == participant_end_of_day_summary_message_written.instrument_type);
  assert(participant_end_of_day_summary_message_read.initiating_participant_id == participant_end_of_day_summary_message_written.initiating_participant_id);
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 4 -> assert(participant_end_of_day_summary_message_read.previous_close_price_date[participant_end_of_day_summary_message_at] == participant_end_of_day_summary_message_written.previous_close_price_date[participant_end_of_day_summary_message_at]); participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> assert(participant_end_of_day_summary_message_read.last_price[participant_end_of_day_summary_message_at] == participant_end_of_day_summary_message_written.last_price[participant_end_of_day_summary_message_at]); participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> assert(participant_end_of_day_summary_message_read.high_price[participant_end_of_day_summary_message_at] == participant_end_of_day_summary_message_written.high_price[participant_end_of_day_summary_message_at]); participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> assert(participant_end_of_day_summary_message_read.low_price[participant_end_of_day_summary_message_at] == participant_end_of_day_summary_message_written.low_price[participant_end_of_day_summary_message_at]); participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> assert(participant_end_of_day_summary_message_read.open_price[participant_end_of_day_summary_message_at] == participant_end_of_day_summary_message_written.open_price[participant_end_of_day_summary_message_at]); participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  participant_end_of_day_summary_message_at = 0;
  do
  :: participant_end_of_day_summary_message_at < 8 -> assert(participant_end_of_day_summary_message_read.total_volume[participant_end_of_day_summary_message_at] == participant_end_of_day_summary_message_written.total_volume[participant_end_of_day_summary_message_at]); participant_end_of_day_summary_message_at = participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  assert(participant_end_of_day_summary_message_read.tick == participant_end_of_day_summary_message_written.tick);
  skip
}

/* ---- Fractional Participant End Of Day Summary Message: 80 bytes ------------- */

/* The Participant End of Day Summary messages are transmitted shortly before the ‘Goodnight’ messages. */
typedef FractionalParticipantEndOfDaySummaryMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte security_symbol[11];
  byte instrument_type;
  byte initiating_participant_id;
  byte previous_close_price_date[4];
  byte last_price[8];
  byte high_price[8];
  byte low_price[8];
  byte open_price[8];
  byte fractional_total_volume[8];
  byte tick
};

int fractional_participant_end_of_day_summary_message_at;

/* every byte of Fractional Participant End Of Day Summary Message set to one value */
inline fill_fractional_participant_end_of_day_summary_message(fractional_participant_end_of_day_summary_message_record, fractional_participant_end_of_day_summary_message_value) {
  fractional_participant_end_of_day_summary_message_record.participant_id = fractional_participant_end_of_day_summary_message_value;
  fill_timestamp1(fractional_participant_end_of_day_summary_message_record.timestamp_1, fractional_participant_end_of_day_summary_message_value);
  fractional_participant_end_of_day_summary_message_record.message_id = fractional_participant_end_of_day_summary_message_value;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 4 -> fractional_participant_end_of_day_summary_message_record.transaction_id[fractional_participant_end_of_day_summary_message_at] = fractional_participant_end_of_day_summary_message_value; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> fractional_participant_end_of_day_summary_message_record.participant_reference_number[fractional_participant_end_of_day_summary_message_at] = fractional_participant_end_of_day_summary_message_value; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 11 -> fractional_participant_end_of_day_summary_message_record.security_symbol[fractional_participant_end_of_day_summary_message_at] = fractional_participant_end_of_day_summary_message_value; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_record.instrument_type = fractional_participant_end_of_day_summary_message_value;
  fractional_participant_end_of_day_summary_message_record.initiating_participant_id = fractional_participant_end_of_day_summary_message_value;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 4 -> fractional_participant_end_of_day_summary_message_record.previous_close_price_date[fractional_participant_end_of_day_summary_message_at] = fractional_participant_end_of_day_summary_message_value; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> fractional_participant_end_of_day_summary_message_record.last_price[fractional_participant_end_of_day_summary_message_at] = fractional_participant_end_of_day_summary_message_value; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> fractional_participant_end_of_day_summary_message_record.high_price[fractional_participant_end_of_day_summary_message_at] = fractional_participant_end_of_day_summary_message_value; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> fractional_participant_end_of_day_summary_message_record.low_price[fractional_participant_end_of_day_summary_message_at] = fractional_participant_end_of_day_summary_message_value; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> fractional_participant_end_of_day_summary_message_record.open_price[fractional_participant_end_of_day_summary_message_at] = fractional_participant_end_of_day_summary_message_value; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> fractional_participant_end_of_day_summary_message_record.fractional_total_volume[fractional_participant_end_of_day_summary_message_at] = fractional_participant_end_of_day_summary_message_value; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_record.tick = fractional_participant_end_of_day_summary_message_value;
  skip
}

/* each byte of Fractional Participant End Of Day Summary Message set to where it lies, so a field read out of place says so */
inline ramp_fractional_participant_end_of_day_summary_message(fractional_participant_end_of_day_summary_message_record, fractional_participant_end_of_day_summary_message_base) {
  fractional_participant_end_of_day_summary_message_record.participant_id = (fractional_participant_end_of_day_summary_message_base + 0 + 1) % 256;
  ramp_timestamp1(fractional_participant_end_of_day_summary_message_record.timestamp_1, fractional_participant_end_of_day_summary_message_base + 1);
  fractional_participant_end_of_day_summary_message_record.message_id = (fractional_participant_end_of_day_summary_message_base + 9 + 1) % 256;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 4 -> fractional_participant_end_of_day_summary_message_record.transaction_id[fractional_participant_end_of_day_summary_message_at] = (fractional_participant_end_of_day_summary_message_base + 10 + fractional_participant_end_of_day_summary_message_at + 1) % 256; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> fractional_participant_end_of_day_summary_message_record.participant_reference_number[fractional_participant_end_of_day_summary_message_at] = (fractional_participant_end_of_day_summary_message_base + 14 + fractional_participant_end_of_day_summary_message_at + 1) % 256; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 11 -> fractional_participant_end_of_day_summary_message_record.security_symbol[fractional_participant_end_of_day_summary_message_at] = (fractional_participant_end_of_day_summary_message_base + 22 + fractional_participant_end_of_day_summary_message_at + 1) % 256; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_record.instrument_type = (fractional_participant_end_of_day_summary_message_base + 33 + 1) % 256;
  fractional_participant_end_of_day_summary_message_record.initiating_participant_id = (fractional_participant_end_of_day_summary_message_base + 34 + 1) % 256;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 4 -> fractional_participant_end_of_day_summary_message_record.previous_close_price_date[fractional_participant_end_of_day_summary_message_at] = (fractional_participant_end_of_day_summary_message_base + 35 + fractional_participant_end_of_day_summary_message_at + 1) % 256; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> fractional_participant_end_of_day_summary_message_record.last_price[fractional_participant_end_of_day_summary_message_at] = (fractional_participant_end_of_day_summary_message_base + 39 + fractional_participant_end_of_day_summary_message_at + 1) % 256; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> fractional_participant_end_of_day_summary_message_record.high_price[fractional_participant_end_of_day_summary_message_at] = (fractional_participant_end_of_day_summary_message_base + 47 + fractional_participant_end_of_day_summary_message_at + 1) % 256; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> fractional_participant_end_of_day_summary_message_record.low_price[fractional_participant_end_of_day_summary_message_at] = (fractional_participant_end_of_day_summary_message_base + 55 + fractional_participant_end_of_day_summary_message_at + 1) % 256; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> fractional_participant_end_of_day_summary_message_record.open_price[fractional_participant_end_of_day_summary_message_at] = (fractional_participant_end_of_day_summary_message_base + 63 + fractional_participant_end_of_day_summary_message_at + 1) % 256; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> fractional_participant_end_of_day_summary_message_record.fractional_total_volume[fractional_participant_end_of_day_summary_message_at] = (fractional_participant_end_of_day_summary_message_base + 71 + fractional_participant_end_of_day_summary_message_at + 1) % 256; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_record.tick = (fractional_participant_end_of_day_summary_message_base + 79 + 1) % 256;
  skip
}

/* Fractional Participant End Of Day Summary Message to the wire, 80 bytes from where the cursor stands */
inline encode_fractional_participant_end_of_day_summary_message(fractional_participant_end_of_day_summary_message_record) {
  wire[at] = fractional_participant_end_of_day_summary_message_record.participant_id; at = at + 1;
  encode_timestamp1(fractional_participant_end_of_day_summary_message_record.timestamp_1);
  wire[at] = fractional_participant_end_of_day_summary_message_record.message_id; at = at + 1;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 4 -> wire[at] = fractional_participant_end_of_day_summary_message_record.transaction_id[fractional_participant_end_of_day_summary_message_at]; at = at + 1; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> wire[at] = fractional_participant_end_of_day_summary_message_record.participant_reference_number[fractional_participant_end_of_day_summary_message_at]; at = at + 1; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 11 -> wire[at] = fractional_participant_end_of_day_summary_message_record.security_symbol[fractional_participant_end_of_day_summary_message_at]; at = at + 1; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_participant_end_of_day_summary_message_record.instrument_type; at = at + 1;
  wire[at] = fractional_participant_end_of_day_summary_message_record.initiating_participant_id; at = at + 1;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 4 -> wire[at] = fractional_participant_end_of_day_summary_message_record.previous_close_price_date[fractional_participant_end_of_day_summary_message_at]; at = at + 1; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> wire[at] = fractional_participant_end_of_day_summary_message_record.last_price[fractional_participant_end_of_day_summary_message_at]; at = at + 1; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> wire[at] = fractional_participant_end_of_day_summary_message_record.high_price[fractional_participant_end_of_day_summary_message_at]; at = at + 1; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> wire[at] = fractional_participant_end_of_day_summary_message_record.low_price[fractional_participant_end_of_day_summary_message_at]; at = at + 1; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> wire[at] = fractional_participant_end_of_day_summary_message_record.open_price[fractional_participant_end_of_day_summary_message_at]; at = at + 1; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> wire[at] = fractional_participant_end_of_day_summary_message_record.fractional_total_volume[fractional_participant_end_of_day_summary_message_at]; at = at + 1; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_participant_end_of_day_summary_message_record.tick; at = at + 1;
  skip
}

/* Fractional Participant End Of Day Summary Message off the wire, 80 bytes from where the cursor stands */
inline decode_fractional_participant_end_of_day_summary_message(fractional_participant_end_of_day_summary_message_record) {
  fractional_participant_end_of_day_summary_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(fractional_participant_end_of_day_summary_message_record.timestamp_1);
  fractional_participant_end_of_day_summary_message_record.message_id = wire[at]; at = at + 1;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 4 -> fractional_participant_end_of_day_summary_message_record.transaction_id[fractional_participant_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> fractional_participant_end_of_day_summary_message_record.participant_reference_number[fractional_participant_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 11 -> fractional_participant_end_of_day_summary_message_record.security_symbol[fractional_participant_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_record.instrument_type = wire[at]; at = at + 1;
  fractional_participant_end_of_day_summary_message_record.initiating_participant_id = wire[at]; at = at + 1;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 4 -> fractional_participant_end_of_day_summary_message_record.previous_close_price_date[fractional_participant_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> fractional_participant_end_of_day_summary_message_record.last_price[fractional_participant_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> fractional_participant_end_of_day_summary_message_record.high_price[fractional_participant_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> fractional_participant_end_of_day_summary_message_record.low_price[fractional_participant_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> fractional_participant_end_of_day_summary_message_record.open_price[fractional_participant_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> fractional_participant_end_of_day_summary_message_record.fractional_total_volume[fractional_participant_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_record.tick = wire[at]; at = at + 1;
  skip
}

/* what was read of Fractional Participant End Of Day Summary Message is what was written, byte for byte */
inline equal_fractional_participant_end_of_day_summary_message(fractional_participant_end_of_day_summary_message_read, fractional_participant_end_of_day_summary_message_written) {
  assert(fractional_participant_end_of_day_summary_message_read.participant_id == fractional_participant_end_of_day_summary_message_written.participant_id);
  equal_timestamp1(fractional_participant_end_of_day_summary_message_read.timestamp_1, fractional_participant_end_of_day_summary_message_written.timestamp_1);
  assert(fractional_participant_end_of_day_summary_message_read.message_id == fractional_participant_end_of_day_summary_message_written.message_id);
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 4 -> assert(fractional_participant_end_of_day_summary_message_read.transaction_id[fractional_participant_end_of_day_summary_message_at] == fractional_participant_end_of_day_summary_message_written.transaction_id[fractional_participant_end_of_day_summary_message_at]); fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> assert(fractional_participant_end_of_day_summary_message_read.participant_reference_number[fractional_participant_end_of_day_summary_message_at] == fractional_participant_end_of_day_summary_message_written.participant_reference_number[fractional_participant_end_of_day_summary_message_at]); fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 11 -> assert(fractional_participant_end_of_day_summary_message_read.security_symbol[fractional_participant_end_of_day_summary_message_at] == fractional_participant_end_of_day_summary_message_written.security_symbol[fractional_participant_end_of_day_summary_message_at]); fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  assert(fractional_participant_end_of_day_summary_message_read.instrument_type == fractional_participant_end_of_day_summary_message_written.instrument_type);
  assert(fractional_participant_end_of_day_summary_message_read.initiating_participant_id == fractional_participant_end_of_day_summary_message_written.initiating_participant_id);
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 4 -> assert(fractional_participant_end_of_day_summary_message_read.previous_close_price_date[fractional_participant_end_of_day_summary_message_at] == fractional_participant_end_of_day_summary_message_written.previous_close_price_date[fractional_participant_end_of_day_summary_message_at]); fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> assert(fractional_participant_end_of_day_summary_message_read.last_price[fractional_participant_end_of_day_summary_message_at] == fractional_participant_end_of_day_summary_message_written.last_price[fractional_participant_end_of_day_summary_message_at]); fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> assert(fractional_participant_end_of_day_summary_message_read.high_price[fractional_participant_end_of_day_summary_message_at] == fractional_participant_end_of_day_summary_message_written.high_price[fractional_participant_end_of_day_summary_message_at]); fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> assert(fractional_participant_end_of_day_summary_message_read.low_price[fractional_participant_end_of_day_summary_message_at] == fractional_participant_end_of_day_summary_message_written.low_price[fractional_participant_end_of_day_summary_message_at]); fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> assert(fractional_participant_end_of_day_summary_message_read.open_price[fractional_participant_end_of_day_summary_message_at] == fractional_participant_end_of_day_summary_message_written.open_price[fractional_participant_end_of_day_summary_message_at]); fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_participant_end_of_day_summary_message_at = 0;
  do
  :: fractional_participant_end_of_day_summary_message_at < 8 -> assert(fractional_participant_end_of_day_summary_message_read.fractional_total_volume[fractional_participant_end_of_day_summary_message_at] == fractional_participant_end_of_day_summary_message_written.fractional_total_volume[fractional_participant_end_of_day_summary_message_at]); fractional_participant_end_of_day_summary_message_at = fractional_participant_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  assert(fractional_participant_end_of_day_summary_message_read.tick == fractional_participant_end_of_day_summary_message_written.tick);
  skip
}

/* ---- Auction Status Message: 124 bytes --------------------------------------- */

/* The Auction Status message is used when a Participant in a Cta eligible security, Local Issue or a Bond requires Auction Information */
typedef AuctionStatusMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte security_symbol[11];
  byte instrument_type;
  byte auction_collar_reference_price[8];
  byte auction_collar_upper_threshold_price[8];
  byte auction_collar_lower_threshold_price[8];
  byte number_of_extensions;
  byte short_sale_restriction_indicator;
  byte primary_listing_market_participant_id;
  byte financial_status_indicator;
  byte future_use[62]
};

int auction_status_message_at;

/* every byte of Auction Status Message set to one value */
inline fill_auction_status_message(auction_status_message_record, auction_status_message_value) {
  auction_status_message_record.participant_id = auction_status_message_value;
  fill_timestamp1(auction_status_message_record.timestamp_1, auction_status_message_value);
  auction_status_message_record.message_id = auction_status_message_value;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 4 -> auction_status_message_record.transaction_id[auction_status_message_at] = auction_status_message_value; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.participant_reference_number[auction_status_message_at] = auction_status_message_value; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 11 -> auction_status_message_record.security_symbol[auction_status_message_at] = auction_status_message_value; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_record.instrument_type = auction_status_message_value;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_reference_price[auction_status_message_at] = auction_status_message_value; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_upper_threshold_price[auction_status_message_at] = auction_status_message_value; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_lower_threshold_price[auction_status_message_at] = auction_status_message_value; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_record.number_of_extensions = auction_status_message_value;
  auction_status_message_record.short_sale_restriction_indicator = auction_status_message_value;
  auction_status_message_record.primary_listing_market_participant_id = auction_status_message_value;
  auction_status_message_record.financial_status_indicator = auction_status_message_value;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 62 -> auction_status_message_record.future_use[auction_status_message_at] = auction_status_message_value; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Status Message set to where it lies, so a field read out of place says so */
inline ramp_auction_status_message(auction_status_message_record, auction_status_message_base) {
  auction_status_message_record.participant_id = (auction_status_message_base + 0 + 1) % 256;
  ramp_timestamp1(auction_status_message_record.timestamp_1, auction_status_message_base + 1);
  auction_status_message_record.message_id = (auction_status_message_base + 9 + 1) % 256;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 4 -> auction_status_message_record.transaction_id[auction_status_message_at] = (auction_status_message_base + 10 + auction_status_message_at + 1) % 256; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.participant_reference_number[auction_status_message_at] = (auction_status_message_base + 14 + auction_status_message_at + 1) % 256; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 11 -> auction_status_message_record.security_symbol[auction_status_message_at] = (auction_status_message_base + 22 + auction_status_message_at + 1) % 256; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_record.instrument_type = (auction_status_message_base + 33 + 1) % 256;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_reference_price[auction_status_message_at] = (auction_status_message_base + 34 + auction_status_message_at + 1) % 256; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_upper_threshold_price[auction_status_message_at] = (auction_status_message_base + 42 + auction_status_message_at + 1) % 256; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_lower_threshold_price[auction_status_message_at] = (auction_status_message_base + 50 + auction_status_message_at + 1) % 256; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_record.number_of_extensions = (auction_status_message_base + 58 + 1) % 256;
  auction_status_message_record.short_sale_restriction_indicator = (auction_status_message_base + 59 + 1) % 256;
  auction_status_message_record.primary_listing_market_participant_id = (auction_status_message_base + 60 + 1) % 256;
  auction_status_message_record.financial_status_indicator = (auction_status_message_base + 61 + 1) % 256;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 62 -> auction_status_message_record.future_use[auction_status_message_at] = (auction_status_message_base + 62 + auction_status_message_at + 1) % 256; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Status Message to the wire, 124 bytes from where the cursor stands */
inline encode_auction_status_message(auction_status_message_record) {
  wire[at] = auction_status_message_record.participant_id; at = at + 1;
  encode_timestamp1(auction_status_message_record.timestamp_1);
  wire[at] = auction_status_message_record.message_id; at = at + 1;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 4 -> wire[at] = auction_status_message_record.transaction_id[auction_status_message_at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> wire[at] = auction_status_message_record.participant_reference_number[auction_status_message_at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 11 -> wire[at] = auction_status_message_record.security_symbol[auction_status_message_at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_status_message_record.instrument_type; at = at + 1;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> wire[at] = auction_status_message_record.auction_collar_reference_price[auction_status_message_at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> wire[at] = auction_status_message_record.auction_collar_upper_threshold_price[auction_status_message_at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> wire[at] = auction_status_message_record.auction_collar_lower_threshold_price[auction_status_message_at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_status_message_record.number_of_extensions; at = at + 1;
  wire[at] = auction_status_message_record.short_sale_restriction_indicator; at = at + 1;
  wire[at] = auction_status_message_record.primary_listing_market_participant_id; at = at + 1;
  wire[at] = auction_status_message_record.financial_status_indicator; at = at + 1;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 62 -> wire[at] = auction_status_message_record.future_use[auction_status_message_at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Status Message off the wire, 124 bytes from where the cursor stands */
inline decode_auction_status_message(auction_status_message_record) {
  auction_status_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(auction_status_message_record.timestamp_1);
  auction_status_message_record.message_id = wire[at]; at = at + 1;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 4 -> auction_status_message_record.transaction_id[auction_status_message_at] = wire[at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.participant_reference_number[auction_status_message_at] = wire[at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 11 -> auction_status_message_record.security_symbol[auction_status_message_at] = wire[at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_record.instrument_type = wire[at]; at = at + 1;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_reference_price[auction_status_message_at] = wire[at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_upper_threshold_price[auction_status_message_at] = wire[at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_lower_threshold_price[auction_status_message_at] = wire[at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_record.number_of_extensions = wire[at]; at = at + 1;
  auction_status_message_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  auction_status_message_record.primary_listing_market_participant_id = wire[at]; at = at + 1;
  auction_status_message_record.financial_status_indicator = wire[at]; at = at + 1;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 62 -> auction_status_message_record.future_use[auction_status_message_at] = wire[at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Status Message is what was written, byte for byte */
inline equal_auction_status_message(auction_status_message_read, auction_status_message_written) {
  assert(auction_status_message_read.participant_id == auction_status_message_written.participant_id);
  equal_timestamp1(auction_status_message_read.timestamp_1, auction_status_message_written.timestamp_1);
  assert(auction_status_message_read.message_id == auction_status_message_written.message_id);
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 4 -> assert(auction_status_message_read.transaction_id[auction_status_message_at] == auction_status_message_written.transaction_id[auction_status_message_at]); auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> assert(auction_status_message_read.participant_reference_number[auction_status_message_at] == auction_status_message_written.participant_reference_number[auction_status_message_at]); auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 11 -> assert(auction_status_message_read.security_symbol[auction_status_message_at] == auction_status_message_written.security_symbol[auction_status_message_at]); auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  assert(auction_status_message_read.instrument_type == auction_status_message_written.instrument_type);
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> assert(auction_status_message_read.auction_collar_reference_price[auction_status_message_at] == auction_status_message_written.auction_collar_reference_price[auction_status_message_at]); auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> assert(auction_status_message_read.auction_collar_upper_threshold_price[auction_status_message_at] == auction_status_message_written.auction_collar_upper_threshold_price[auction_status_message_at]); auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> assert(auction_status_message_read.auction_collar_lower_threshold_price[auction_status_message_at] == auction_status_message_written.auction_collar_lower_threshold_price[auction_status_message_at]); auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  assert(auction_status_message_read.number_of_extensions == auction_status_message_written.number_of_extensions);
  assert(auction_status_message_read.short_sale_restriction_indicator == auction_status_message_written.short_sale_restriction_indicator);
  assert(auction_status_message_read.primary_listing_market_participant_id == auction_status_message_written.primary_listing_market_participant_id);
  assert(auction_status_message_read.financial_status_indicator == auction_status_message_written.financial_status_indicator);
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 62 -> assert(auction_status_message_read.future_use[auction_status_message_at] == auction_status_message_written.future_use[auction_status_message_at]); auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Corrected Trade: 20 bytes ----------------------------------------------- */

/* Corrected Trade */
typedef CorrectedTrade {
  SaleConditions sale_conditions;
  byte trade_price[8];
  byte trade_volume[4];
  byte sellers_sale_days;
  byte stop_stock_indicator;
  byte trade_through_exempt_indicator;
  byte short_sale_restriction_indicator
};

int corrected_trade_at;

/* every byte of Corrected Trade set to one value */
inline fill_corrected_trade(corrected_trade_record, corrected_trade_value) {
  fill_sale_conditions(corrected_trade_record.sale_conditions, corrected_trade_value);
  corrected_trade_at = 0;
  do
  :: corrected_trade_at < 8 -> corrected_trade_record.trade_price[corrected_trade_at] = corrected_trade_value; corrected_trade_at = corrected_trade_at + 1
  :: else -> break
  od;
  corrected_trade_at = 0;
  do
  :: corrected_trade_at < 4 -> corrected_trade_record.trade_volume[corrected_trade_at] = corrected_trade_value; corrected_trade_at = corrected_trade_at + 1
  :: else -> break
  od;
  corrected_trade_record.sellers_sale_days = corrected_trade_value;
  corrected_trade_record.stop_stock_indicator = corrected_trade_value;
  corrected_trade_record.trade_through_exempt_indicator = corrected_trade_value;
  corrected_trade_record.short_sale_restriction_indicator = corrected_trade_value;
  skip
}

/* each byte of Corrected Trade set to where it lies, so a field read out of place says so */
inline ramp_corrected_trade(corrected_trade_record, corrected_trade_base) {
  ramp_sale_conditions(corrected_trade_record.sale_conditions, corrected_trade_base + 0);
  corrected_trade_at = 0;
  do
  :: corrected_trade_at < 8 -> corrected_trade_record.trade_price[corrected_trade_at] = (corrected_trade_base + 4 + corrected_trade_at + 1) % 256; corrected_trade_at = corrected_trade_at + 1
  :: else -> break
  od;
  corrected_trade_at = 0;
  do
  :: corrected_trade_at < 4 -> corrected_trade_record.trade_volume[corrected_trade_at] = (corrected_trade_base + 12 + corrected_trade_at + 1) % 256; corrected_trade_at = corrected_trade_at + 1
  :: else -> break
  od;
  corrected_trade_record.sellers_sale_days = (corrected_trade_base + 16 + 1) % 256;
  corrected_trade_record.stop_stock_indicator = (corrected_trade_base + 17 + 1) % 256;
  corrected_trade_record.trade_through_exempt_indicator = (corrected_trade_base + 18 + 1) % 256;
  corrected_trade_record.short_sale_restriction_indicator = (corrected_trade_base + 19 + 1) % 256;
  skip
}

/* Corrected Trade to the wire, 20 bytes from where the cursor stands */
inline encode_corrected_trade(corrected_trade_record) {
  encode_sale_conditions(corrected_trade_record.sale_conditions);
  corrected_trade_at = 0;
  do
  :: corrected_trade_at < 8 -> wire[at] = corrected_trade_record.trade_price[corrected_trade_at]; at = at + 1; corrected_trade_at = corrected_trade_at + 1
  :: else -> break
  od;
  corrected_trade_at = 0;
  do
  :: corrected_trade_at < 4 -> wire[at] = corrected_trade_record.trade_volume[corrected_trade_at]; at = at + 1; corrected_trade_at = corrected_trade_at + 1
  :: else -> break
  od;
  wire[at] = corrected_trade_record.sellers_sale_days; at = at + 1;
  wire[at] = corrected_trade_record.stop_stock_indicator; at = at + 1;
  wire[at] = corrected_trade_record.trade_through_exempt_indicator; at = at + 1;
  wire[at] = corrected_trade_record.short_sale_restriction_indicator; at = at + 1;
  skip
}

/* Corrected Trade off the wire, 20 bytes from where the cursor stands */
inline decode_corrected_trade(corrected_trade_record) {
  decode_sale_conditions(corrected_trade_record.sale_conditions);
  corrected_trade_at = 0;
  do
  :: corrected_trade_at < 8 -> corrected_trade_record.trade_price[corrected_trade_at] = wire[at]; at = at + 1; corrected_trade_at = corrected_trade_at + 1
  :: else -> break
  od;
  corrected_trade_at = 0;
  do
  :: corrected_trade_at < 4 -> corrected_trade_record.trade_volume[corrected_trade_at] = wire[at]; at = at + 1; corrected_trade_at = corrected_trade_at + 1
  :: else -> break
  od;
  corrected_trade_record.sellers_sale_days = wire[at]; at = at + 1;
  corrected_trade_record.stop_stock_indicator = wire[at]; at = at + 1;
  corrected_trade_record.trade_through_exempt_indicator = wire[at]; at = at + 1;
  corrected_trade_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Corrected Trade is what was written, byte for byte */
inline equal_corrected_trade(corrected_trade_read, corrected_trade_written) {
  equal_sale_conditions(corrected_trade_read.sale_conditions, corrected_trade_written.sale_conditions);
  corrected_trade_at = 0;
  do
  :: corrected_trade_at < 8 -> assert(corrected_trade_read.trade_price[corrected_trade_at] == corrected_trade_written.trade_price[corrected_trade_at]); corrected_trade_at = corrected_trade_at + 1
  :: else -> break
  od;
  corrected_trade_at = 0;
  do
  :: corrected_trade_at < 4 -> assert(corrected_trade_read.trade_volume[corrected_trade_at] == corrected_trade_written.trade_volume[corrected_trade_at]); corrected_trade_at = corrected_trade_at + 1
  :: else -> break
  od;
  assert(corrected_trade_read.sellers_sale_days == corrected_trade_written.sellers_sale_days);
  assert(corrected_trade_read.stop_stock_indicator == corrected_trade_written.stop_stock_indicator);
  assert(corrected_trade_read.trade_through_exempt_indicator == corrected_trade_written.trade_through_exempt_indicator);
  assert(corrected_trade_read.short_sale_restriction_indicator == corrected_trade_written.short_sale_restriction_indicator);
  skip
}

/* ---- Timestamp 2: 8 bytes ---------------------------------------------------- */

/* Timestamp 2 */
typedef Timestamp2 {
  byte seconds[4];
  byte nanoseconds[4]
};

int timestamp2_at;

/* every byte of Timestamp 2 set to one value */
inline fill_timestamp2(timestamp2_record, timestamp2_value) {
  timestamp2_at = 0;
  do
  :: timestamp2_at < 4 -> timestamp2_record.seconds[timestamp2_at] = timestamp2_value; timestamp2_at = timestamp2_at + 1
  :: else -> break
  od;
  timestamp2_at = 0;
  do
  :: timestamp2_at < 4 -> timestamp2_record.nanoseconds[timestamp2_at] = timestamp2_value; timestamp2_at = timestamp2_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Timestamp 2 set to where it lies, so a field read out of place says so */
inline ramp_timestamp2(timestamp2_record, timestamp2_base) {
  timestamp2_at = 0;
  do
  :: timestamp2_at < 4 -> timestamp2_record.seconds[timestamp2_at] = (timestamp2_base + 0 + timestamp2_at + 1) % 256; timestamp2_at = timestamp2_at + 1
  :: else -> break
  od;
  timestamp2_at = 0;
  do
  :: timestamp2_at < 4 -> timestamp2_record.nanoseconds[timestamp2_at] = (timestamp2_base + 4 + timestamp2_at + 1) % 256; timestamp2_at = timestamp2_at + 1
  :: else -> break
  od;
  skip
}

/* Timestamp 2 to the wire, 8 bytes from where the cursor stands */
inline encode_timestamp2(timestamp2_record) {
  timestamp2_at = 0;
  do
  :: timestamp2_at < 4 -> wire[at] = timestamp2_record.seconds[timestamp2_at]; at = at + 1; timestamp2_at = timestamp2_at + 1
  :: else -> break
  od;
  timestamp2_at = 0;
  do
  :: timestamp2_at < 4 -> wire[at] = timestamp2_record.nanoseconds[timestamp2_at]; at = at + 1; timestamp2_at = timestamp2_at + 1
  :: else -> break
  od;
  skip
}

/* Timestamp 2 off the wire, 8 bytes from where the cursor stands */
inline decode_timestamp2(timestamp2_record) {
  timestamp2_at = 0;
  do
  :: timestamp2_at < 4 -> timestamp2_record.seconds[timestamp2_at] = wire[at]; at = at + 1; timestamp2_at = timestamp2_at + 1
  :: else -> break
  od;
  timestamp2_at = 0;
  do
  :: timestamp2_at < 4 -> timestamp2_record.nanoseconds[timestamp2_at] = wire[at]; at = at + 1; timestamp2_at = timestamp2_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Timestamp 2 is what was written, byte for byte */
inline equal_timestamp2(timestamp2_read, timestamp2_written) {
  timestamp2_at = 0;
  do
  :: timestamp2_at < 4 -> assert(timestamp2_read.seconds[timestamp2_at] == timestamp2_written.seconds[timestamp2_at]); timestamp2_at = timestamp2_at + 1
  :: else -> break
  od;
  timestamp2_at = 0;
  do
  :: timestamp2_at < 4 -> assert(timestamp2_read.nanoseconds[timestamp2_at] == timestamp2_written.nanoseconds[timestamp2_at]); timestamp2_at = timestamp2_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Original Trade: 20 bytes ------------------------------------------------ */

/* Original Trade */
typedef OriginalTrade {
  SaleConditions sale_conditions;
  byte trade_price[8];
  byte trade_volume[4];
  byte sellers_sale_days;
  byte stop_stock_indicator;
  byte trade_through_exempt_indicator;
  byte short_sale_restriction_indicator
};

int original_trade_at;

/* every byte of Original Trade set to one value */
inline fill_original_trade(original_trade_record, original_trade_value) {
  fill_sale_conditions(original_trade_record.sale_conditions, original_trade_value);
  original_trade_at = 0;
  do
  :: original_trade_at < 8 -> original_trade_record.trade_price[original_trade_at] = original_trade_value; original_trade_at = original_trade_at + 1
  :: else -> break
  od;
  original_trade_at = 0;
  do
  :: original_trade_at < 4 -> original_trade_record.trade_volume[original_trade_at] = original_trade_value; original_trade_at = original_trade_at + 1
  :: else -> break
  od;
  original_trade_record.sellers_sale_days = original_trade_value;
  original_trade_record.stop_stock_indicator = original_trade_value;
  original_trade_record.trade_through_exempt_indicator = original_trade_value;
  original_trade_record.short_sale_restriction_indicator = original_trade_value;
  skip
}

/* each byte of Original Trade set to where it lies, so a field read out of place says so */
inline ramp_original_trade(original_trade_record, original_trade_base) {
  ramp_sale_conditions(original_trade_record.sale_conditions, original_trade_base + 0);
  original_trade_at = 0;
  do
  :: original_trade_at < 8 -> original_trade_record.trade_price[original_trade_at] = (original_trade_base + 4 + original_trade_at + 1) % 256; original_trade_at = original_trade_at + 1
  :: else -> break
  od;
  original_trade_at = 0;
  do
  :: original_trade_at < 4 -> original_trade_record.trade_volume[original_trade_at] = (original_trade_base + 12 + original_trade_at + 1) % 256; original_trade_at = original_trade_at + 1
  :: else -> break
  od;
  original_trade_record.sellers_sale_days = (original_trade_base + 16 + 1) % 256;
  original_trade_record.stop_stock_indicator = (original_trade_base + 17 + 1) % 256;
  original_trade_record.trade_through_exempt_indicator = (original_trade_base + 18 + 1) % 256;
  original_trade_record.short_sale_restriction_indicator = (original_trade_base + 19 + 1) % 256;
  skip
}

/* Original Trade to the wire, 20 bytes from where the cursor stands */
inline encode_original_trade(original_trade_record) {
  encode_sale_conditions(original_trade_record.sale_conditions);
  original_trade_at = 0;
  do
  :: original_trade_at < 8 -> wire[at] = original_trade_record.trade_price[original_trade_at]; at = at + 1; original_trade_at = original_trade_at + 1
  :: else -> break
  od;
  original_trade_at = 0;
  do
  :: original_trade_at < 4 -> wire[at] = original_trade_record.trade_volume[original_trade_at]; at = at + 1; original_trade_at = original_trade_at + 1
  :: else -> break
  od;
  wire[at] = original_trade_record.sellers_sale_days; at = at + 1;
  wire[at] = original_trade_record.stop_stock_indicator; at = at + 1;
  wire[at] = original_trade_record.trade_through_exempt_indicator; at = at + 1;
  wire[at] = original_trade_record.short_sale_restriction_indicator; at = at + 1;
  skip
}

/* Original Trade off the wire, 20 bytes from where the cursor stands */
inline decode_original_trade(original_trade_record) {
  decode_sale_conditions(original_trade_record.sale_conditions);
  original_trade_at = 0;
  do
  :: original_trade_at < 8 -> original_trade_record.trade_price[original_trade_at] = wire[at]; at = at + 1; original_trade_at = original_trade_at + 1
  :: else -> break
  od;
  original_trade_at = 0;
  do
  :: original_trade_at < 4 -> original_trade_record.trade_volume[original_trade_at] = wire[at]; at = at + 1; original_trade_at = original_trade_at + 1
  :: else -> break
  od;
  original_trade_record.sellers_sale_days = wire[at]; at = at + 1;
  original_trade_record.stop_stock_indicator = wire[at]; at = at + 1;
  original_trade_record.trade_through_exempt_indicator = wire[at]; at = at + 1;
  original_trade_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Original Trade is what was written, byte for byte */
inline equal_original_trade(original_trade_read, original_trade_written) {
  equal_sale_conditions(original_trade_read.sale_conditions, original_trade_written.sale_conditions);
  original_trade_at = 0;
  do
  :: original_trade_at < 8 -> assert(original_trade_read.trade_price[original_trade_at] == original_trade_written.trade_price[original_trade_at]); original_trade_at = original_trade_at + 1
  :: else -> break
  od;
  original_trade_at = 0;
  do
  :: original_trade_at < 4 -> assert(original_trade_read.trade_volume[original_trade_at] == original_trade_written.trade_volume[original_trade_at]); original_trade_at = original_trade_at + 1
  :: else -> break
  od;
  assert(original_trade_read.sellers_sale_days == original_trade_written.sellers_sale_days);
  assert(original_trade_read.stop_stock_indicator == original_trade_written.stop_stock_indicator);
  assert(original_trade_read.trade_through_exempt_indicator == original_trade_written.trade_through_exempt_indicator);
  assert(original_trade_read.short_sale_restriction_indicator == original_trade_written.short_sale_restriction_indicator);
  skip
}

/* ---- Consolidated Data: 34 bytes --------------------------------------------- */

/* Consolidated Data */
typedef ConsolidatedData {
  byte previous_close_price_date[4];
  byte last_participant_id;
  byte last_price[8];
  byte high_price[8];
  byte low_price[8];
  byte total_volume_short[4];
  byte tick
};

int consolidated_data_at;

/* every byte of Consolidated Data set to one value */
inline fill_consolidated_data(consolidated_data_record, consolidated_data_value) {
  consolidated_data_at = 0;
  do
  :: consolidated_data_at < 4 -> consolidated_data_record.previous_close_price_date[consolidated_data_at] = consolidated_data_value; consolidated_data_at = consolidated_data_at + 1
  :: else -> break
  od;
  consolidated_data_record.last_participant_id = consolidated_data_value;
  consolidated_data_at = 0;
  do
  :: consolidated_data_at < 8 -> consolidated_data_record.last_price[consolidated_data_at] = consolidated_data_value; consolidated_data_at = consolidated_data_at + 1
  :: else -> break
  od;
  consolidated_data_at = 0;
  do
  :: consolidated_data_at < 8 -> consolidated_data_record.high_price[consolidated_data_at] = consolidated_data_value; consolidated_data_at = consolidated_data_at + 1
  :: else -> break
  od;
  consolidated_data_at = 0;
  do
  :: consolidated_data_at < 8 -> consolidated_data_record.low_price[consolidated_data_at] = consolidated_data_value; consolidated_data_at = consolidated_data_at + 1
  :: else -> break
  od;
  consolidated_data_at = 0;
  do
  :: consolidated_data_at < 4 -> consolidated_data_record.total_volume_short[consolidated_data_at] = consolidated_data_value; consolidated_data_at = consolidated_data_at + 1
  :: else -> break
  od;
  consolidated_data_record.tick = consolidated_data_value;
  skip
}

/* each byte of Consolidated Data set to where it lies, so a field read out of place says so */
inline ramp_consolidated_data(consolidated_data_record, consolidated_data_base) {
  consolidated_data_at = 0;
  do
  :: consolidated_data_at < 4 -> consolidated_data_record.previous_close_price_date[consolidated_data_at] = (consolidated_data_base + 0 + consolidated_data_at + 1) % 256; consolidated_data_at = consolidated_data_at + 1
  :: else -> break
  od;
  consolidated_data_record.last_participant_id = (consolidated_data_base + 4 + 1) % 256;
  consolidated_data_at = 0;
  do
  :: consolidated_data_at < 8 -> consolidated_data_record.last_price[consolidated_data_at] = (consolidated_data_base + 5 + consolidated_data_at + 1) % 256; consolidated_data_at = consolidated_data_at + 1
  :: else -> break
  od;
  consolidated_data_at = 0;
  do
  :: consolidated_data_at < 8 -> consolidated_data_record.high_price[consolidated_data_at] = (consolidated_data_base + 13 + consolidated_data_at + 1) % 256; consolidated_data_at = consolidated_data_at + 1
  :: else -> break
  od;
  consolidated_data_at = 0;
  do
  :: consolidated_data_at < 8 -> consolidated_data_record.low_price[consolidated_data_at] = (consolidated_data_base + 21 + consolidated_data_at + 1) % 256; consolidated_data_at = consolidated_data_at + 1
  :: else -> break
  od;
  consolidated_data_at = 0;
  do
  :: consolidated_data_at < 4 -> consolidated_data_record.total_volume_short[consolidated_data_at] = (consolidated_data_base + 29 + consolidated_data_at + 1) % 256; consolidated_data_at = consolidated_data_at + 1
  :: else -> break
  od;
  consolidated_data_record.tick = (consolidated_data_base + 33 + 1) % 256;
  skip
}

/* Consolidated Data to the wire, 34 bytes from where the cursor stands */
inline encode_consolidated_data(consolidated_data_record) {
  consolidated_data_at = 0;
  do
  :: consolidated_data_at < 4 -> wire[at] = consolidated_data_record.previous_close_price_date[consolidated_data_at]; at = at + 1; consolidated_data_at = consolidated_data_at + 1
  :: else -> break
  od;
  wire[at] = consolidated_data_record.last_participant_id; at = at + 1;
  consolidated_data_at = 0;
  do
  :: consolidated_data_at < 8 -> wire[at] = consolidated_data_record.last_price[consolidated_data_at]; at = at + 1; consolidated_data_at = consolidated_data_at + 1
  :: else -> break
  od;
  consolidated_data_at = 0;
  do
  :: consolidated_data_at < 8 -> wire[at] = consolidated_data_record.high_price[consolidated_data_at]; at = at + 1; consolidated_data_at = consolidated_data_at + 1
  :: else -> break
  od;
  consolidated_data_at = 0;
  do
  :: consolidated_data_at < 8 -> wire[at] = consolidated_data_record.low_price[consolidated_data_at]; at = at + 1; consolidated_data_at = consolidated_data_at + 1
  :: else -> break
  od;
  consolidated_data_at = 0;
  do
  :: consolidated_data_at < 4 -> wire[at] = consolidated_data_record.total_volume_short[consolidated_data_at]; at = at + 1; consolidated_data_at = consolidated_data_at + 1
  :: else -> break
  od;
  wire[at] = consolidated_data_record.tick; at = at + 1;
  skip
}

/* Consolidated Data off the wire, 34 bytes from where the cursor stands */
inline decode_consolidated_data(consolidated_data_record) {
  consolidated_data_at = 0;
  do
  :: consolidated_data_at < 4 -> consolidated_data_record.previous_close_price_date[consolidated_data_at] = wire[at]; at = at + 1; consolidated_data_at = consolidated_data_at + 1
  :: else -> break
  od;
  consolidated_data_record.last_participant_id = wire[at]; at = at + 1;
  consolidated_data_at = 0;
  do
  :: consolidated_data_at < 8 -> consolidated_data_record.last_price[consolidated_data_at] = wire[at]; at = at + 1; consolidated_data_at = consolidated_data_at + 1
  :: else -> break
  od;
  consolidated_data_at = 0;
  do
  :: consolidated_data_at < 8 -> consolidated_data_record.high_price[consolidated_data_at] = wire[at]; at = at + 1; consolidated_data_at = consolidated_data_at + 1
  :: else -> break
  od;
  consolidated_data_at = 0;
  do
  :: consolidated_data_at < 8 -> consolidated_data_record.low_price[consolidated_data_at] = wire[at]; at = at + 1; consolidated_data_at = consolidated_data_at + 1
  :: else -> break
  od;
  consolidated_data_at = 0;
  do
  :: consolidated_data_at < 4 -> consolidated_data_record.total_volume_short[consolidated_data_at] = wire[at]; at = at + 1; consolidated_data_at = consolidated_data_at + 1
  :: else -> break
  od;
  consolidated_data_record.tick = wire[at]; at = at + 1;
  skip
}

/* what was read of Consolidated Data is what was written, byte for byte */
inline equal_consolidated_data(consolidated_data_read, consolidated_data_written) {
  consolidated_data_at = 0;
  do
  :: consolidated_data_at < 4 -> assert(consolidated_data_read.previous_close_price_date[consolidated_data_at] == consolidated_data_written.previous_close_price_date[consolidated_data_at]); consolidated_data_at = consolidated_data_at + 1
  :: else -> break
  od;
  assert(consolidated_data_read.last_participant_id == consolidated_data_written.last_participant_id);
  consolidated_data_at = 0;
  do
  :: consolidated_data_at < 8 -> assert(consolidated_data_read.last_price[consolidated_data_at] == consolidated_data_written.last_price[consolidated_data_at]); consolidated_data_at = consolidated_data_at + 1
  :: else -> break
  od;
  consolidated_data_at = 0;
  do
  :: consolidated_data_at < 8 -> assert(consolidated_data_read.high_price[consolidated_data_at] == consolidated_data_written.high_price[consolidated_data_at]); consolidated_data_at = consolidated_data_at + 1
  :: else -> break
  od;
  consolidated_data_at = 0;
  do
  :: consolidated_data_at < 8 -> assert(consolidated_data_read.low_price[consolidated_data_at] == consolidated_data_written.low_price[consolidated_data_at]); consolidated_data_at = consolidated_data_at + 1
  :: else -> break
  od;
  consolidated_data_at = 0;
  do
  :: consolidated_data_at < 4 -> assert(consolidated_data_read.total_volume_short[consolidated_data_at] == consolidated_data_written.total_volume_short[consolidated_data_at]); consolidated_data_at = consolidated_data_at + 1
  :: else -> break
  od;
  assert(consolidated_data_read.tick == consolidated_data_written.tick);
  skip
}

/* ---- Participant Data: 41 bytes ---------------------------------------------- */

/* Participant Data */
typedef ParticipantData {
  byte previous_close_price_date[4];
  byte last_price[8];
  byte high_price[8];
  byte low_price[8];
  byte open_price[8];
  byte total_volume_short[4];
  byte tick
};

int participant_data_at;

/* every byte of Participant Data set to one value */
inline fill_participant_data(participant_data_record, participant_data_value) {
  participant_data_at = 0;
  do
  :: participant_data_at < 4 -> participant_data_record.previous_close_price_date[participant_data_at] = participant_data_value; participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_at = 0;
  do
  :: participant_data_at < 8 -> participant_data_record.last_price[participant_data_at] = participant_data_value; participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_at = 0;
  do
  :: participant_data_at < 8 -> participant_data_record.high_price[participant_data_at] = participant_data_value; participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_at = 0;
  do
  :: participant_data_at < 8 -> participant_data_record.low_price[participant_data_at] = participant_data_value; participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_at = 0;
  do
  :: participant_data_at < 8 -> participant_data_record.open_price[participant_data_at] = participant_data_value; participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_at = 0;
  do
  :: participant_data_at < 4 -> participant_data_record.total_volume_short[participant_data_at] = participant_data_value; participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_record.tick = participant_data_value;
  skip
}

/* each byte of Participant Data set to where it lies, so a field read out of place says so */
inline ramp_participant_data(participant_data_record, participant_data_base) {
  participant_data_at = 0;
  do
  :: participant_data_at < 4 -> participant_data_record.previous_close_price_date[participant_data_at] = (participant_data_base + 0 + participant_data_at + 1) % 256; participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_at = 0;
  do
  :: participant_data_at < 8 -> participant_data_record.last_price[participant_data_at] = (participant_data_base + 4 + participant_data_at + 1) % 256; participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_at = 0;
  do
  :: participant_data_at < 8 -> participant_data_record.high_price[participant_data_at] = (participant_data_base + 12 + participant_data_at + 1) % 256; participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_at = 0;
  do
  :: participant_data_at < 8 -> participant_data_record.low_price[participant_data_at] = (participant_data_base + 20 + participant_data_at + 1) % 256; participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_at = 0;
  do
  :: participant_data_at < 8 -> participant_data_record.open_price[participant_data_at] = (participant_data_base + 28 + participant_data_at + 1) % 256; participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_at = 0;
  do
  :: participant_data_at < 4 -> participant_data_record.total_volume_short[participant_data_at] = (participant_data_base + 36 + participant_data_at + 1) % 256; participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_record.tick = (participant_data_base + 40 + 1) % 256;
  skip
}

/* Participant Data to the wire, 41 bytes from where the cursor stands */
inline encode_participant_data(participant_data_record) {
  participant_data_at = 0;
  do
  :: participant_data_at < 4 -> wire[at] = participant_data_record.previous_close_price_date[participant_data_at]; at = at + 1; participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_at = 0;
  do
  :: participant_data_at < 8 -> wire[at] = participant_data_record.last_price[participant_data_at]; at = at + 1; participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_at = 0;
  do
  :: participant_data_at < 8 -> wire[at] = participant_data_record.high_price[participant_data_at]; at = at + 1; participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_at = 0;
  do
  :: participant_data_at < 8 -> wire[at] = participant_data_record.low_price[participant_data_at]; at = at + 1; participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_at = 0;
  do
  :: participant_data_at < 8 -> wire[at] = participant_data_record.open_price[participant_data_at]; at = at + 1; participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_at = 0;
  do
  :: participant_data_at < 4 -> wire[at] = participant_data_record.total_volume_short[participant_data_at]; at = at + 1; participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  wire[at] = participant_data_record.tick; at = at + 1;
  skip
}

/* Participant Data off the wire, 41 bytes from where the cursor stands */
inline decode_participant_data(participant_data_record) {
  participant_data_at = 0;
  do
  :: participant_data_at < 4 -> participant_data_record.previous_close_price_date[participant_data_at] = wire[at]; at = at + 1; participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_at = 0;
  do
  :: participant_data_at < 8 -> participant_data_record.last_price[participant_data_at] = wire[at]; at = at + 1; participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_at = 0;
  do
  :: participant_data_at < 8 -> participant_data_record.high_price[participant_data_at] = wire[at]; at = at + 1; participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_at = 0;
  do
  :: participant_data_at < 8 -> participant_data_record.low_price[participant_data_at] = wire[at]; at = at + 1; participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_at = 0;
  do
  :: participant_data_at < 8 -> participant_data_record.open_price[participant_data_at] = wire[at]; at = at + 1; participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_at = 0;
  do
  :: participant_data_at < 4 -> participant_data_record.total_volume_short[participant_data_at] = wire[at]; at = at + 1; participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_record.tick = wire[at]; at = at + 1;
  skip
}

/* what was read of Participant Data is what was written, byte for byte */
inline equal_participant_data(participant_data_read, participant_data_written) {
  participant_data_at = 0;
  do
  :: participant_data_at < 4 -> assert(participant_data_read.previous_close_price_date[participant_data_at] == participant_data_written.previous_close_price_date[participant_data_at]); participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_at = 0;
  do
  :: participant_data_at < 8 -> assert(participant_data_read.last_price[participant_data_at] == participant_data_written.last_price[participant_data_at]); participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_at = 0;
  do
  :: participant_data_at < 8 -> assert(participant_data_read.high_price[participant_data_at] == participant_data_written.high_price[participant_data_at]); participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_at = 0;
  do
  :: participant_data_at < 8 -> assert(participant_data_read.low_price[participant_data_at] == participant_data_written.low_price[participant_data_at]); participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_at = 0;
  do
  :: participant_data_at < 8 -> assert(participant_data_read.open_price[participant_data_at] == participant_data_written.open_price[participant_data_at]); participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  participant_data_at = 0;
  do
  :: participant_data_at < 4 -> assert(participant_data_read.total_volume_short[participant_data_at] == participant_data_written.total_volume_short[participant_data_at]); participant_data_at = participant_data_at + 1
  :: else -> break
  od;
  assert(participant_data_read.tick == participant_data_written.tick);
  skip
}

/* ---- Trade Correction Message: 168 bytes ------------------------------------- */

/* The Trade Correction message is used to correct Cta eligible Equity, Local Issue or Bond information. */
typedef TradeCorrectionMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte security_symbol[11];
  byte instrument_type;
  CorrectedTrade corrected_trade;
  byte trade_reporting_facility_id;
  Timestamp2 timestamp_2;
  byte original_participant_reference_number[8];
  OriginalTrade original_trade;
  byte primary_listing_market_participant_id;
  byte financial_status_indicator;
  ConsolidatedData consolidated_data;
  ParticipantData participant_data
};

int trade_correction_message_at;

/* every byte of Trade Correction Message set to one value */
inline fill_trade_correction_message(trade_correction_message_record, trade_correction_message_value) {
  trade_correction_message_record.participant_id = trade_correction_message_value;
  fill_timestamp1(trade_correction_message_record.timestamp_1, trade_correction_message_value);
  trade_correction_message_record.message_id = trade_correction_message_value;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.transaction_id[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.participant_reference_number[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> trade_correction_message_record.security_symbol[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.instrument_type = trade_correction_message_value;
  fill_corrected_trade(trade_correction_message_record.corrected_trade, trade_correction_message_value);
  trade_correction_message_record.trade_reporting_facility_id = trade_correction_message_value;
  fill_timestamp2(trade_correction_message_record.timestamp_2, trade_correction_message_value);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.original_participant_reference_number[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  fill_original_trade(trade_correction_message_record.original_trade, trade_correction_message_value);
  trade_correction_message_record.primary_listing_market_participant_id = trade_correction_message_value;
  trade_correction_message_record.financial_status_indicator = trade_correction_message_value;
  fill_consolidated_data(trade_correction_message_record.consolidated_data, trade_correction_message_value);
  fill_participant_data(trade_correction_message_record.participant_data, trade_correction_message_value);
  skip
}

/* each byte of Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_trade_correction_message(trade_correction_message_record, trade_correction_message_base) {
  trade_correction_message_record.participant_id = (trade_correction_message_base + 0 + 1) % 256;
  ramp_timestamp1(trade_correction_message_record.timestamp_1, trade_correction_message_base + 1);
  trade_correction_message_record.message_id = (trade_correction_message_base + 9 + 1) % 256;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.transaction_id[trade_correction_message_at] = (trade_correction_message_base + 10 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.participant_reference_number[trade_correction_message_at] = (trade_correction_message_base + 14 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> trade_correction_message_record.security_symbol[trade_correction_message_at] = (trade_correction_message_base + 22 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.instrument_type = (trade_correction_message_base + 33 + 1) % 256;
  ramp_corrected_trade(trade_correction_message_record.corrected_trade, trade_correction_message_base + 34);
  trade_correction_message_record.trade_reporting_facility_id = (trade_correction_message_base + 54 + 1) % 256;
  ramp_timestamp2(trade_correction_message_record.timestamp_2, trade_correction_message_base + 55);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.original_participant_reference_number[trade_correction_message_at] = (trade_correction_message_base + 63 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  ramp_original_trade(trade_correction_message_record.original_trade, trade_correction_message_base + 71);
  trade_correction_message_record.primary_listing_market_participant_id = (trade_correction_message_base + 91 + 1) % 256;
  trade_correction_message_record.financial_status_indicator = (trade_correction_message_base + 92 + 1) % 256;
  ramp_consolidated_data(trade_correction_message_record.consolidated_data, trade_correction_message_base + 93);
  ramp_participant_data(trade_correction_message_record.participant_data, trade_correction_message_base + 127);
  skip
}

/* Trade Correction Message to the wire, 168 bytes from where the cursor stands */
inline encode_trade_correction_message(trade_correction_message_record) {
  wire[at] = trade_correction_message_record.participant_id; at = at + 1;
  encode_timestamp1(trade_correction_message_record.timestamp_1);
  wire[at] = trade_correction_message_record.message_id; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.transaction_id[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.participant_reference_number[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> wire[at] = trade_correction_message_record.security_symbol[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_message_record.instrument_type; at = at + 1;
  encode_corrected_trade(trade_correction_message_record.corrected_trade);
  wire[at] = trade_correction_message_record.trade_reporting_facility_id; at = at + 1;
  encode_timestamp2(trade_correction_message_record.timestamp_2);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.original_participant_reference_number[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  encode_original_trade(trade_correction_message_record.original_trade);
  wire[at] = trade_correction_message_record.primary_listing_market_participant_id; at = at + 1;
  wire[at] = trade_correction_message_record.financial_status_indicator; at = at + 1;
  encode_consolidated_data(trade_correction_message_record.consolidated_data);
  encode_participant_data(trade_correction_message_record.participant_data);
  skip
}

/* Trade Correction Message off the wire, 168 bytes from where the cursor stands */
inline decode_trade_correction_message(trade_correction_message_record) {
  trade_correction_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(trade_correction_message_record.timestamp_1);
  trade_correction_message_record.message_id = wire[at]; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.transaction_id[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.participant_reference_number[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> trade_correction_message_record.security_symbol[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.instrument_type = wire[at]; at = at + 1;
  decode_corrected_trade(trade_correction_message_record.corrected_trade);
  trade_correction_message_record.trade_reporting_facility_id = wire[at]; at = at + 1;
  decode_timestamp2(trade_correction_message_record.timestamp_2);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.original_participant_reference_number[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  decode_original_trade(trade_correction_message_record.original_trade);
  trade_correction_message_record.primary_listing_market_participant_id = wire[at]; at = at + 1;
  trade_correction_message_record.financial_status_indicator = wire[at]; at = at + 1;
  decode_consolidated_data(trade_correction_message_record.consolidated_data);
  decode_participant_data(trade_correction_message_record.participant_data);
  skip
}

/* what was read of Trade Correction Message is what was written, byte for byte */
inline equal_trade_correction_message(trade_correction_message_read, trade_correction_message_written) {
  assert(trade_correction_message_read.participant_id == trade_correction_message_written.participant_id);
  equal_timestamp1(trade_correction_message_read.timestamp_1, trade_correction_message_written.timestamp_1);
  assert(trade_correction_message_read.message_id == trade_correction_message_written.message_id);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.transaction_id[trade_correction_message_at] == trade_correction_message_written.transaction_id[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.participant_reference_number[trade_correction_message_at] == trade_correction_message_written.participant_reference_number[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> assert(trade_correction_message_read.security_symbol[trade_correction_message_at] == trade_correction_message_written.security_symbol[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_message_read.instrument_type == trade_correction_message_written.instrument_type);
  equal_corrected_trade(trade_correction_message_read.corrected_trade, trade_correction_message_written.corrected_trade);
  assert(trade_correction_message_read.trade_reporting_facility_id == trade_correction_message_written.trade_reporting_facility_id);
  equal_timestamp2(trade_correction_message_read.timestamp_2, trade_correction_message_written.timestamp_2);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.original_participant_reference_number[trade_correction_message_at] == trade_correction_message_written.original_participant_reference_number[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  equal_original_trade(trade_correction_message_read.original_trade, trade_correction_message_written.original_trade);
  assert(trade_correction_message_read.primary_listing_market_participant_id == trade_correction_message_written.primary_listing_market_participant_id);
  assert(trade_correction_message_read.financial_status_indicator == trade_correction_message_written.financial_status_indicator);
  equal_consolidated_data(trade_correction_message_read.consolidated_data, trade_correction_message_written.consolidated_data);
  equal_participant_data(trade_correction_message_read.participant_data, trade_correction_message_written.participant_data);
  skip
}

/* ---- Fractional Corrected Trade: 24 bytes ------------------------------------ */

/* Fractional Corrected Trade */
typedef FractionalCorrectedTrade {
  SaleConditions sale_conditions;
  byte trade_price[8];
  byte fractional_trade_volume[8];
  byte sellers_sale_days;
  byte stop_stock_indicator;
  byte trade_through_exempt_indicator;
  byte short_sale_restriction_indicator
};

int fractional_corrected_trade_at;

/* every byte of Fractional Corrected Trade set to one value */
inline fill_fractional_corrected_trade(fractional_corrected_trade_record, fractional_corrected_trade_value) {
  fill_sale_conditions(fractional_corrected_trade_record.sale_conditions, fractional_corrected_trade_value);
  fractional_corrected_trade_at = 0;
  do
  :: fractional_corrected_trade_at < 8 -> fractional_corrected_trade_record.trade_price[fractional_corrected_trade_at] = fractional_corrected_trade_value; fractional_corrected_trade_at = fractional_corrected_trade_at + 1
  :: else -> break
  od;
  fractional_corrected_trade_at = 0;
  do
  :: fractional_corrected_trade_at < 8 -> fractional_corrected_trade_record.fractional_trade_volume[fractional_corrected_trade_at] = fractional_corrected_trade_value; fractional_corrected_trade_at = fractional_corrected_trade_at + 1
  :: else -> break
  od;
  fractional_corrected_trade_record.sellers_sale_days = fractional_corrected_trade_value;
  fractional_corrected_trade_record.stop_stock_indicator = fractional_corrected_trade_value;
  fractional_corrected_trade_record.trade_through_exempt_indicator = fractional_corrected_trade_value;
  fractional_corrected_trade_record.short_sale_restriction_indicator = fractional_corrected_trade_value;
  skip
}

/* each byte of Fractional Corrected Trade set to where it lies, so a field read out of place says so */
inline ramp_fractional_corrected_trade(fractional_corrected_trade_record, fractional_corrected_trade_base) {
  ramp_sale_conditions(fractional_corrected_trade_record.sale_conditions, fractional_corrected_trade_base + 0);
  fractional_corrected_trade_at = 0;
  do
  :: fractional_corrected_trade_at < 8 -> fractional_corrected_trade_record.trade_price[fractional_corrected_trade_at] = (fractional_corrected_trade_base + 4 + fractional_corrected_trade_at + 1) % 256; fractional_corrected_trade_at = fractional_corrected_trade_at + 1
  :: else -> break
  od;
  fractional_corrected_trade_at = 0;
  do
  :: fractional_corrected_trade_at < 8 -> fractional_corrected_trade_record.fractional_trade_volume[fractional_corrected_trade_at] = (fractional_corrected_trade_base + 12 + fractional_corrected_trade_at + 1) % 256; fractional_corrected_trade_at = fractional_corrected_trade_at + 1
  :: else -> break
  od;
  fractional_corrected_trade_record.sellers_sale_days = (fractional_corrected_trade_base + 20 + 1) % 256;
  fractional_corrected_trade_record.stop_stock_indicator = (fractional_corrected_trade_base + 21 + 1) % 256;
  fractional_corrected_trade_record.trade_through_exempt_indicator = (fractional_corrected_trade_base + 22 + 1) % 256;
  fractional_corrected_trade_record.short_sale_restriction_indicator = (fractional_corrected_trade_base + 23 + 1) % 256;
  skip
}

/* Fractional Corrected Trade to the wire, 24 bytes from where the cursor stands */
inline encode_fractional_corrected_trade(fractional_corrected_trade_record) {
  encode_sale_conditions(fractional_corrected_trade_record.sale_conditions);
  fractional_corrected_trade_at = 0;
  do
  :: fractional_corrected_trade_at < 8 -> wire[at] = fractional_corrected_trade_record.trade_price[fractional_corrected_trade_at]; at = at + 1; fractional_corrected_trade_at = fractional_corrected_trade_at + 1
  :: else -> break
  od;
  fractional_corrected_trade_at = 0;
  do
  :: fractional_corrected_trade_at < 8 -> wire[at] = fractional_corrected_trade_record.fractional_trade_volume[fractional_corrected_trade_at]; at = at + 1; fractional_corrected_trade_at = fractional_corrected_trade_at + 1
  :: else -> break
  od;
  wire[at] = fractional_corrected_trade_record.sellers_sale_days; at = at + 1;
  wire[at] = fractional_corrected_trade_record.stop_stock_indicator; at = at + 1;
  wire[at] = fractional_corrected_trade_record.trade_through_exempt_indicator; at = at + 1;
  wire[at] = fractional_corrected_trade_record.short_sale_restriction_indicator; at = at + 1;
  skip
}

/* Fractional Corrected Trade off the wire, 24 bytes from where the cursor stands */
inline decode_fractional_corrected_trade(fractional_corrected_trade_record) {
  decode_sale_conditions(fractional_corrected_trade_record.sale_conditions);
  fractional_corrected_trade_at = 0;
  do
  :: fractional_corrected_trade_at < 8 -> fractional_corrected_trade_record.trade_price[fractional_corrected_trade_at] = wire[at]; at = at + 1; fractional_corrected_trade_at = fractional_corrected_trade_at + 1
  :: else -> break
  od;
  fractional_corrected_trade_at = 0;
  do
  :: fractional_corrected_trade_at < 8 -> fractional_corrected_trade_record.fractional_trade_volume[fractional_corrected_trade_at] = wire[at]; at = at + 1; fractional_corrected_trade_at = fractional_corrected_trade_at + 1
  :: else -> break
  od;
  fractional_corrected_trade_record.sellers_sale_days = wire[at]; at = at + 1;
  fractional_corrected_trade_record.stop_stock_indicator = wire[at]; at = at + 1;
  fractional_corrected_trade_record.trade_through_exempt_indicator = wire[at]; at = at + 1;
  fractional_corrected_trade_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Fractional Corrected Trade is what was written, byte for byte */
inline equal_fractional_corrected_trade(fractional_corrected_trade_read, fractional_corrected_trade_written) {
  equal_sale_conditions(fractional_corrected_trade_read.sale_conditions, fractional_corrected_trade_written.sale_conditions);
  fractional_corrected_trade_at = 0;
  do
  :: fractional_corrected_trade_at < 8 -> assert(fractional_corrected_trade_read.trade_price[fractional_corrected_trade_at] == fractional_corrected_trade_written.trade_price[fractional_corrected_trade_at]); fractional_corrected_trade_at = fractional_corrected_trade_at + 1
  :: else -> break
  od;
  fractional_corrected_trade_at = 0;
  do
  :: fractional_corrected_trade_at < 8 -> assert(fractional_corrected_trade_read.fractional_trade_volume[fractional_corrected_trade_at] == fractional_corrected_trade_written.fractional_trade_volume[fractional_corrected_trade_at]); fractional_corrected_trade_at = fractional_corrected_trade_at + 1
  :: else -> break
  od;
  assert(fractional_corrected_trade_read.sellers_sale_days == fractional_corrected_trade_written.sellers_sale_days);
  assert(fractional_corrected_trade_read.stop_stock_indicator == fractional_corrected_trade_written.stop_stock_indicator);
  assert(fractional_corrected_trade_read.trade_through_exempt_indicator == fractional_corrected_trade_written.trade_through_exempt_indicator);
  assert(fractional_corrected_trade_read.short_sale_restriction_indicator == fractional_corrected_trade_written.short_sale_restriction_indicator);
  skip
}

/* ---- Fractional Original Trade: 24 bytes ------------------------------------- */

/* Fractional Original Trade */
typedef FractionalOriginalTrade {
  SaleConditions sale_conditions;
  byte trade_price[8];
  byte fractional_trade_volume[8];
  byte sellers_sale_days;
  byte stop_stock_indicator;
  byte trade_through_exempt_indicator;
  byte short_sale_restriction_indicator
};

int fractional_original_trade_at;

/* every byte of Fractional Original Trade set to one value */
inline fill_fractional_original_trade(fractional_original_trade_record, fractional_original_trade_value) {
  fill_sale_conditions(fractional_original_trade_record.sale_conditions, fractional_original_trade_value);
  fractional_original_trade_at = 0;
  do
  :: fractional_original_trade_at < 8 -> fractional_original_trade_record.trade_price[fractional_original_trade_at] = fractional_original_trade_value; fractional_original_trade_at = fractional_original_trade_at + 1
  :: else -> break
  od;
  fractional_original_trade_at = 0;
  do
  :: fractional_original_trade_at < 8 -> fractional_original_trade_record.fractional_trade_volume[fractional_original_trade_at] = fractional_original_trade_value; fractional_original_trade_at = fractional_original_trade_at + 1
  :: else -> break
  od;
  fractional_original_trade_record.sellers_sale_days = fractional_original_trade_value;
  fractional_original_trade_record.stop_stock_indicator = fractional_original_trade_value;
  fractional_original_trade_record.trade_through_exempt_indicator = fractional_original_trade_value;
  fractional_original_trade_record.short_sale_restriction_indicator = fractional_original_trade_value;
  skip
}

/* each byte of Fractional Original Trade set to where it lies, so a field read out of place says so */
inline ramp_fractional_original_trade(fractional_original_trade_record, fractional_original_trade_base) {
  ramp_sale_conditions(fractional_original_trade_record.sale_conditions, fractional_original_trade_base + 0);
  fractional_original_trade_at = 0;
  do
  :: fractional_original_trade_at < 8 -> fractional_original_trade_record.trade_price[fractional_original_trade_at] = (fractional_original_trade_base + 4 + fractional_original_trade_at + 1) % 256; fractional_original_trade_at = fractional_original_trade_at + 1
  :: else -> break
  od;
  fractional_original_trade_at = 0;
  do
  :: fractional_original_trade_at < 8 -> fractional_original_trade_record.fractional_trade_volume[fractional_original_trade_at] = (fractional_original_trade_base + 12 + fractional_original_trade_at + 1) % 256; fractional_original_trade_at = fractional_original_trade_at + 1
  :: else -> break
  od;
  fractional_original_trade_record.sellers_sale_days = (fractional_original_trade_base + 20 + 1) % 256;
  fractional_original_trade_record.stop_stock_indicator = (fractional_original_trade_base + 21 + 1) % 256;
  fractional_original_trade_record.trade_through_exempt_indicator = (fractional_original_trade_base + 22 + 1) % 256;
  fractional_original_trade_record.short_sale_restriction_indicator = (fractional_original_trade_base + 23 + 1) % 256;
  skip
}

/* Fractional Original Trade to the wire, 24 bytes from where the cursor stands */
inline encode_fractional_original_trade(fractional_original_trade_record) {
  encode_sale_conditions(fractional_original_trade_record.sale_conditions);
  fractional_original_trade_at = 0;
  do
  :: fractional_original_trade_at < 8 -> wire[at] = fractional_original_trade_record.trade_price[fractional_original_trade_at]; at = at + 1; fractional_original_trade_at = fractional_original_trade_at + 1
  :: else -> break
  od;
  fractional_original_trade_at = 0;
  do
  :: fractional_original_trade_at < 8 -> wire[at] = fractional_original_trade_record.fractional_trade_volume[fractional_original_trade_at]; at = at + 1; fractional_original_trade_at = fractional_original_trade_at + 1
  :: else -> break
  od;
  wire[at] = fractional_original_trade_record.sellers_sale_days; at = at + 1;
  wire[at] = fractional_original_trade_record.stop_stock_indicator; at = at + 1;
  wire[at] = fractional_original_trade_record.trade_through_exempt_indicator; at = at + 1;
  wire[at] = fractional_original_trade_record.short_sale_restriction_indicator; at = at + 1;
  skip
}

/* Fractional Original Trade off the wire, 24 bytes from where the cursor stands */
inline decode_fractional_original_trade(fractional_original_trade_record) {
  decode_sale_conditions(fractional_original_trade_record.sale_conditions);
  fractional_original_trade_at = 0;
  do
  :: fractional_original_trade_at < 8 -> fractional_original_trade_record.trade_price[fractional_original_trade_at] = wire[at]; at = at + 1; fractional_original_trade_at = fractional_original_trade_at + 1
  :: else -> break
  od;
  fractional_original_trade_at = 0;
  do
  :: fractional_original_trade_at < 8 -> fractional_original_trade_record.fractional_trade_volume[fractional_original_trade_at] = wire[at]; at = at + 1; fractional_original_trade_at = fractional_original_trade_at + 1
  :: else -> break
  od;
  fractional_original_trade_record.sellers_sale_days = wire[at]; at = at + 1;
  fractional_original_trade_record.stop_stock_indicator = wire[at]; at = at + 1;
  fractional_original_trade_record.trade_through_exempt_indicator = wire[at]; at = at + 1;
  fractional_original_trade_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Fractional Original Trade is what was written, byte for byte */
inline equal_fractional_original_trade(fractional_original_trade_read, fractional_original_trade_written) {
  equal_sale_conditions(fractional_original_trade_read.sale_conditions, fractional_original_trade_written.sale_conditions);
  fractional_original_trade_at = 0;
  do
  :: fractional_original_trade_at < 8 -> assert(fractional_original_trade_read.trade_price[fractional_original_trade_at] == fractional_original_trade_written.trade_price[fractional_original_trade_at]); fractional_original_trade_at = fractional_original_trade_at + 1
  :: else -> break
  od;
  fractional_original_trade_at = 0;
  do
  :: fractional_original_trade_at < 8 -> assert(fractional_original_trade_read.fractional_trade_volume[fractional_original_trade_at] == fractional_original_trade_written.fractional_trade_volume[fractional_original_trade_at]); fractional_original_trade_at = fractional_original_trade_at + 1
  :: else -> break
  od;
  assert(fractional_original_trade_read.sellers_sale_days == fractional_original_trade_written.sellers_sale_days);
  assert(fractional_original_trade_read.stop_stock_indicator == fractional_original_trade_written.stop_stock_indicator);
  assert(fractional_original_trade_read.trade_through_exempt_indicator == fractional_original_trade_written.trade_through_exempt_indicator);
  assert(fractional_original_trade_read.short_sale_restriction_indicator == fractional_original_trade_written.short_sale_restriction_indicator);
  skip
}

/* ---- Fractional Consolidated Data: 38 bytes ---------------------------------- */

/* Fractional Consolidated Data */
typedef FractionalConsolidatedData {
  byte previous_close_price_date[4];
  byte last_participant_id;
  byte last_price[8];
  byte high_price[8];
  byte low_price[8];
  byte fractional_total_volume[8];
  byte tick
};

int fractional_consolidated_data_at;

/* every byte of Fractional Consolidated Data set to one value */
inline fill_fractional_consolidated_data(fractional_consolidated_data_record, fractional_consolidated_data_value) {
  fractional_consolidated_data_at = 0;
  do
  :: fractional_consolidated_data_at < 4 -> fractional_consolidated_data_record.previous_close_price_date[fractional_consolidated_data_at] = fractional_consolidated_data_value; fractional_consolidated_data_at = fractional_consolidated_data_at + 1
  :: else -> break
  od;
  fractional_consolidated_data_record.last_participant_id = fractional_consolidated_data_value;
  fractional_consolidated_data_at = 0;
  do
  :: fractional_consolidated_data_at < 8 -> fractional_consolidated_data_record.last_price[fractional_consolidated_data_at] = fractional_consolidated_data_value; fractional_consolidated_data_at = fractional_consolidated_data_at + 1
  :: else -> break
  od;
  fractional_consolidated_data_at = 0;
  do
  :: fractional_consolidated_data_at < 8 -> fractional_consolidated_data_record.high_price[fractional_consolidated_data_at] = fractional_consolidated_data_value; fractional_consolidated_data_at = fractional_consolidated_data_at + 1
  :: else -> break
  od;
  fractional_consolidated_data_at = 0;
  do
  :: fractional_consolidated_data_at < 8 -> fractional_consolidated_data_record.low_price[fractional_consolidated_data_at] = fractional_consolidated_data_value; fractional_consolidated_data_at = fractional_consolidated_data_at + 1
  :: else -> break
  od;
  fractional_consolidated_data_at = 0;
  do
  :: fractional_consolidated_data_at < 8 -> fractional_consolidated_data_record.fractional_total_volume[fractional_consolidated_data_at] = fractional_consolidated_data_value; fractional_consolidated_data_at = fractional_consolidated_data_at + 1
  :: else -> break
  od;
  fractional_consolidated_data_record.tick = fractional_consolidated_data_value;
  skip
}

/* each byte of Fractional Consolidated Data set to where it lies, so a field read out of place says so */
inline ramp_fractional_consolidated_data(fractional_consolidated_data_record, fractional_consolidated_data_base) {
  fractional_consolidated_data_at = 0;
  do
  :: fractional_consolidated_data_at < 4 -> fractional_consolidated_data_record.previous_close_price_date[fractional_consolidated_data_at] = (fractional_consolidated_data_base + 0 + fractional_consolidated_data_at + 1) % 256; fractional_consolidated_data_at = fractional_consolidated_data_at + 1
  :: else -> break
  od;
  fractional_consolidated_data_record.last_participant_id = (fractional_consolidated_data_base + 4 + 1) % 256;
  fractional_consolidated_data_at = 0;
  do
  :: fractional_consolidated_data_at < 8 -> fractional_consolidated_data_record.last_price[fractional_consolidated_data_at] = (fractional_consolidated_data_base + 5 + fractional_consolidated_data_at + 1) % 256; fractional_consolidated_data_at = fractional_consolidated_data_at + 1
  :: else -> break
  od;
  fractional_consolidated_data_at = 0;
  do
  :: fractional_consolidated_data_at < 8 -> fractional_consolidated_data_record.high_price[fractional_consolidated_data_at] = (fractional_consolidated_data_base + 13 + fractional_consolidated_data_at + 1) % 256; fractional_consolidated_data_at = fractional_consolidated_data_at + 1
  :: else -> break
  od;
  fractional_consolidated_data_at = 0;
  do
  :: fractional_consolidated_data_at < 8 -> fractional_consolidated_data_record.low_price[fractional_consolidated_data_at] = (fractional_consolidated_data_base + 21 + fractional_consolidated_data_at + 1) % 256; fractional_consolidated_data_at = fractional_consolidated_data_at + 1
  :: else -> break
  od;
  fractional_consolidated_data_at = 0;
  do
  :: fractional_consolidated_data_at < 8 -> fractional_consolidated_data_record.fractional_total_volume[fractional_consolidated_data_at] = (fractional_consolidated_data_base + 29 + fractional_consolidated_data_at + 1) % 256; fractional_consolidated_data_at = fractional_consolidated_data_at + 1
  :: else -> break
  od;
  fractional_consolidated_data_record.tick = (fractional_consolidated_data_base + 37 + 1) % 256;
  skip
}

/* Fractional Consolidated Data to the wire, 38 bytes from where the cursor stands */
inline encode_fractional_consolidated_data(fractional_consolidated_data_record) {
  fractional_consolidated_data_at = 0;
  do
  :: fractional_consolidated_data_at < 4 -> wire[at] = fractional_consolidated_data_record.previous_close_price_date[fractional_consolidated_data_at]; at = at + 1; fractional_consolidated_data_at = fractional_consolidated_data_at + 1
  :: else -> break
  od;
  wire[at] = fractional_consolidated_data_record.last_participant_id; at = at + 1;
  fractional_consolidated_data_at = 0;
  do
  :: fractional_consolidated_data_at < 8 -> wire[at] = fractional_consolidated_data_record.last_price[fractional_consolidated_data_at]; at = at + 1; fractional_consolidated_data_at = fractional_consolidated_data_at + 1
  :: else -> break
  od;
  fractional_consolidated_data_at = 0;
  do
  :: fractional_consolidated_data_at < 8 -> wire[at] = fractional_consolidated_data_record.high_price[fractional_consolidated_data_at]; at = at + 1; fractional_consolidated_data_at = fractional_consolidated_data_at + 1
  :: else -> break
  od;
  fractional_consolidated_data_at = 0;
  do
  :: fractional_consolidated_data_at < 8 -> wire[at] = fractional_consolidated_data_record.low_price[fractional_consolidated_data_at]; at = at + 1; fractional_consolidated_data_at = fractional_consolidated_data_at + 1
  :: else -> break
  od;
  fractional_consolidated_data_at = 0;
  do
  :: fractional_consolidated_data_at < 8 -> wire[at] = fractional_consolidated_data_record.fractional_total_volume[fractional_consolidated_data_at]; at = at + 1; fractional_consolidated_data_at = fractional_consolidated_data_at + 1
  :: else -> break
  od;
  wire[at] = fractional_consolidated_data_record.tick; at = at + 1;
  skip
}

/* Fractional Consolidated Data off the wire, 38 bytes from where the cursor stands */
inline decode_fractional_consolidated_data(fractional_consolidated_data_record) {
  fractional_consolidated_data_at = 0;
  do
  :: fractional_consolidated_data_at < 4 -> fractional_consolidated_data_record.previous_close_price_date[fractional_consolidated_data_at] = wire[at]; at = at + 1; fractional_consolidated_data_at = fractional_consolidated_data_at + 1
  :: else -> break
  od;
  fractional_consolidated_data_record.last_participant_id = wire[at]; at = at + 1;
  fractional_consolidated_data_at = 0;
  do
  :: fractional_consolidated_data_at < 8 -> fractional_consolidated_data_record.last_price[fractional_consolidated_data_at] = wire[at]; at = at + 1; fractional_consolidated_data_at = fractional_consolidated_data_at + 1
  :: else -> break
  od;
  fractional_consolidated_data_at = 0;
  do
  :: fractional_consolidated_data_at < 8 -> fractional_consolidated_data_record.high_price[fractional_consolidated_data_at] = wire[at]; at = at + 1; fractional_consolidated_data_at = fractional_consolidated_data_at + 1
  :: else -> break
  od;
  fractional_consolidated_data_at = 0;
  do
  :: fractional_consolidated_data_at < 8 -> fractional_consolidated_data_record.low_price[fractional_consolidated_data_at] = wire[at]; at = at + 1; fractional_consolidated_data_at = fractional_consolidated_data_at + 1
  :: else -> break
  od;
  fractional_consolidated_data_at = 0;
  do
  :: fractional_consolidated_data_at < 8 -> fractional_consolidated_data_record.fractional_total_volume[fractional_consolidated_data_at] = wire[at]; at = at + 1; fractional_consolidated_data_at = fractional_consolidated_data_at + 1
  :: else -> break
  od;
  fractional_consolidated_data_record.tick = wire[at]; at = at + 1;
  skip
}

/* what was read of Fractional Consolidated Data is what was written, byte for byte */
inline equal_fractional_consolidated_data(fractional_consolidated_data_read, fractional_consolidated_data_written) {
  fractional_consolidated_data_at = 0;
  do
  :: fractional_consolidated_data_at < 4 -> assert(fractional_consolidated_data_read.previous_close_price_date[fractional_consolidated_data_at] == fractional_consolidated_data_written.previous_close_price_date[fractional_consolidated_data_at]); fractional_consolidated_data_at = fractional_consolidated_data_at + 1
  :: else -> break
  od;
  assert(fractional_consolidated_data_read.last_participant_id == fractional_consolidated_data_written.last_participant_id);
  fractional_consolidated_data_at = 0;
  do
  :: fractional_consolidated_data_at < 8 -> assert(fractional_consolidated_data_read.last_price[fractional_consolidated_data_at] == fractional_consolidated_data_written.last_price[fractional_consolidated_data_at]); fractional_consolidated_data_at = fractional_consolidated_data_at + 1
  :: else -> break
  od;
  fractional_consolidated_data_at = 0;
  do
  :: fractional_consolidated_data_at < 8 -> assert(fractional_consolidated_data_read.high_price[fractional_consolidated_data_at] == fractional_consolidated_data_written.high_price[fractional_consolidated_data_at]); fractional_consolidated_data_at = fractional_consolidated_data_at + 1
  :: else -> break
  od;
  fractional_consolidated_data_at = 0;
  do
  :: fractional_consolidated_data_at < 8 -> assert(fractional_consolidated_data_read.low_price[fractional_consolidated_data_at] == fractional_consolidated_data_written.low_price[fractional_consolidated_data_at]); fractional_consolidated_data_at = fractional_consolidated_data_at + 1
  :: else -> break
  od;
  fractional_consolidated_data_at = 0;
  do
  :: fractional_consolidated_data_at < 8 -> assert(fractional_consolidated_data_read.fractional_total_volume[fractional_consolidated_data_at] == fractional_consolidated_data_written.fractional_total_volume[fractional_consolidated_data_at]); fractional_consolidated_data_at = fractional_consolidated_data_at + 1
  :: else -> break
  od;
  assert(fractional_consolidated_data_read.tick == fractional_consolidated_data_written.tick);
  skip
}

/* ---- Fractional Participant Data: 45 bytes ----------------------------------- */

/* Fractional Participant Data */
typedef FractionalParticipantData {
  byte previous_close_price_date[4];
  byte last_price[8];
  byte high_price[8];
  byte low_price[8];
  byte open_price[8];
  byte fractional_total_volume[8];
  byte tick
};

int fractional_participant_data_at;

/* every byte of Fractional Participant Data set to one value */
inline fill_fractional_participant_data(fractional_participant_data_record, fractional_participant_data_value) {
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 4 -> fractional_participant_data_record.previous_close_price_date[fractional_participant_data_at] = fractional_participant_data_value; fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 8 -> fractional_participant_data_record.last_price[fractional_participant_data_at] = fractional_participant_data_value; fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 8 -> fractional_participant_data_record.high_price[fractional_participant_data_at] = fractional_participant_data_value; fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 8 -> fractional_participant_data_record.low_price[fractional_participant_data_at] = fractional_participant_data_value; fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 8 -> fractional_participant_data_record.open_price[fractional_participant_data_at] = fractional_participant_data_value; fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 8 -> fractional_participant_data_record.fractional_total_volume[fractional_participant_data_at] = fractional_participant_data_value; fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_record.tick = fractional_participant_data_value;
  skip
}

/* each byte of Fractional Participant Data set to where it lies, so a field read out of place says so */
inline ramp_fractional_participant_data(fractional_participant_data_record, fractional_participant_data_base) {
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 4 -> fractional_participant_data_record.previous_close_price_date[fractional_participant_data_at] = (fractional_participant_data_base + 0 + fractional_participant_data_at + 1) % 256; fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 8 -> fractional_participant_data_record.last_price[fractional_participant_data_at] = (fractional_participant_data_base + 4 + fractional_participant_data_at + 1) % 256; fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 8 -> fractional_participant_data_record.high_price[fractional_participant_data_at] = (fractional_participant_data_base + 12 + fractional_participant_data_at + 1) % 256; fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 8 -> fractional_participant_data_record.low_price[fractional_participant_data_at] = (fractional_participant_data_base + 20 + fractional_participant_data_at + 1) % 256; fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 8 -> fractional_participant_data_record.open_price[fractional_participant_data_at] = (fractional_participant_data_base + 28 + fractional_participant_data_at + 1) % 256; fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 8 -> fractional_participant_data_record.fractional_total_volume[fractional_participant_data_at] = (fractional_participant_data_base + 36 + fractional_participant_data_at + 1) % 256; fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_record.tick = (fractional_participant_data_base + 44 + 1) % 256;
  skip
}

/* Fractional Participant Data to the wire, 45 bytes from where the cursor stands */
inline encode_fractional_participant_data(fractional_participant_data_record) {
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 4 -> wire[at] = fractional_participant_data_record.previous_close_price_date[fractional_participant_data_at]; at = at + 1; fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 8 -> wire[at] = fractional_participant_data_record.last_price[fractional_participant_data_at]; at = at + 1; fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 8 -> wire[at] = fractional_participant_data_record.high_price[fractional_participant_data_at]; at = at + 1; fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 8 -> wire[at] = fractional_participant_data_record.low_price[fractional_participant_data_at]; at = at + 1; fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 8 -> wire[at] = fractional_participant_data_record.open_price[fractional_participant_data_at]; at = at + 1; fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 8 -> wire[at] = fractional_participant_data_record.fractional_total_volume[fractional_participant_data_at]; at = at + 1; fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  wire[at] = fractional_participant_data_record.tick; at = at + 1;
  skip
}

/* Fractional Participant Data off the wire, 45 bytes from where the cursor stands */
inline decode_fractional_participant_data(fractional_participant_data_record) {
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 4 -> fractional_participant_data_record.previous_close_price_date[fractional_participant_data_at] = wire[at]; at = at + 1; fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 8 -> fractional_participant_data_record.last_price[fractional_participant_data_at] = wire[at]; at = at + 1; fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 8 -> fractional_participant_data_record.high_price[fractional_participant_data_at] = wire[at]; at = at + 1; fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 8 -> fractional_participant_data_record.low_price[fractional_participant_data_at] = wire[at]; at = at + 1; fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 8 -> fractional_participant_data_record.open_price[fractional_participant_data_at] = wire[at]; at = at + 1; fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 8 -> fractional_participant_data_record.fractional_total_volume[fractional_participant_data_at] = wire[at]; at = at + 1; fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_record.tick = wire[at]; at = at + 1;
  skip
}

/* what was read of Fractional Participant Data is what was written, byte for byte */
inline equal_fractional_participant_data(fractional_participant_data_read, fractional_participant_data_written) {
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 4 -> assert(fractional_participant_data_read.previous_close_price_date[fractional_participant_data_at] == fractional_participant_data_written.previous_close_price_date[fractional_participant_data_at]); fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 8 -> assert(fractional_participant_data_read.last_price[fractional_participant_data_at] == fractional_participant_data_written.last_price[fractional_participant_data_at]); fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 8 -> assert(fractional_participant_data_read.high_price[fractional_participant_data_at] == fractional_participant_data_written.high_price[fractional_participant_data_at]); fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 8 -> assert(fractional_participant_data_read.low_price[fractional_participant_data_at] == fractional_participant_data_written.low_price[fractional_participant_data_at]); fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 8 -> assert(fractional_participant_data_read.open_price[fractional_participant_data_at] == fractional_participant_data_written.open_price[fractional_participant_data_at]); fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  fractional_participant_data_at = 0;
  do
  :: fractional_participant_data_at < 8 -> assert(fractional_participant_data_read.fractional_total_volume[fractional_participant_data_at] == fractional_participant_data_written.fractional_total_volume[fractional_participant_data_at]); fractional_participant_data_at = fractional_participant_data_at + 1
  :: else -> break
  od;
  assert(fractional_participant_data_read.tick == fractional_participant_data_written.tick);
  skip
}

/* ---- Fractional Trade Correction Message: 184 bytes -------------------------- */

/* The Trade Correction message is used to correct Cta eligible Equity, Local Issue or Bond information. */
typedef FractionalTradeCorrectionMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte security_symbol[11];
  byte instrument_type;
  FractionalCorrectedTrade fractional_corrected_trade;
  byte trade_reporting_facility_id;
  Timestamp2 timestamp_2;
  byte original_participant_reference_number[8];
  FractionalOriginalTrade fractional_original_trade;
  byte primary_listing_market_participant_id;
  byte financial_status_indicator;
  FractionalConsolidatedData fractional_consolidated_data;
  FractionalParticipantData fractional_participant_data
};

int fractional_trade_correction_message_at;

/* every byte of Fractional Trade Correction Message set to one value */
inline fill_fractional_trade_correction_message(fractional_trade_correction_message_record, fractional_trade_correction_message_value) {
  fractional_trade_correction_message_record.participant_id = fractional_trade_correction_message_value;
  fill_timestamp1(fractional_trade_correction_message_record.timestamp_1, fractional_trade_correction_message_value);
  fractional_trade_correction_message_record.message_id = fractional_trade_correction_message_value;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> fractional_trade_correction_message_record.transaction_id[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.participant_reference_number[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 11 -> fractional_trade_correction_message_record.security_symbol[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.instrument_type = fractional_trade_correction_message_value;
  fill_fractional_corrected_trade(fractional_trade_correction_message_record.fractional_corrected_trade, fractional_trade_correction_message_value);
  fractional_trade_correction_message_record.trade_reporting_facility_id = fractional_trade_correction_message_value;
  fill_timestamp2(fractional_trade_correction_message_record.timestamp_2, fractional_trade_correction_message_value);
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.original_participant_reference_number[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fill_fractional_original_trade(fractional_trade_correction_message_record.fractional_original_trade, fractional_trade_correction_message_value);
  fractional_trade_correction_message_record.primary_listing_market_participant_id = fractional_trade_correction_message_value;
  fractional_trade_correction_message_record.financial_status_indicator = fractional_trade_correction_message_value;
  fill_fractional_consolidated_data(fractional_trade_correction_message_record.fractional_consolidated_data, fractional_trade_correction_message_value);
  fill_fractional_participant_data(fractional_trade_correction_message_record.fractional_participant_data, fractional_trade_correction_message_value);
  skip
}

/* each byte of Fractional Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_fractional_trade_correction_message(fractional_trade_correction_message_record, fractional_trade_correction_message_base) {
  fractional_trade_correction_message_record.participant_id = (fractional_trade_correction_message_base + 0 + 1) % 256;
  ramp_timestamp1(fractional_trade_correction_message_record.timestamp_1, fractional_trade_correction_message_base + 1);
  fractional_trade_correction_message_record.message_id = (fractional_trade_correction_message_base + 9 + 1) % 256;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> fractional_trade_correction_message_record.transaction_id[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 10 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.participant_reference_number[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 14 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 11 -> fractional_trade_correction_message_record.security_symbol[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 22 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.instrument_type = (fractional_trade_correction_message_base + 33 + 1) % 256;
  ramp_fractional_corrected_trade(fractional_trade_correction_message_record.fractional_corrected_trade, fractional_trade_correction_message_base + 34);
  fractional_trade_correction_message_record.trade_reporting_facility_id = (fractional_trade_correction_message_base + 58 + 1) % 256;
  ramp_timestamp2(fractional_trade_correction_message_record.timestamp_2, fractional_trade_correction_message_base + 59);
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.original_participant_reference_number[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 67 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  ramp_fractional_original_trade(fractional_trade_correction_message_record.fractional_original_trade, fractional_trade_correction_message_base + 75);
  fractional_trade_correction_message_record.primary_listing_market_participant_id = (fractional_trade_correction_message_base + 99 + 1) % 256;
  fractional_trade_correction_message_record.financial_status_indicator = (fractional_trade_correction_message_base + 100 + 1) % 256;
  ramp_fractional_consolidated_data(fractional_trade_correction_message_record.fractional_consolidated_data, fractional_trade_correction_message_base + 101);
  ramp_fractional_participant_data(fractional_trade_correction_message_record.fractional_participant_data, fractional_trade_correction_message_base + 139);
  skip
}

/* Fractional Trade Correction Message to the wire, 184 bytes from where the cursor stands */
inline encode_fractional_trade_correction_message(fractional_trade_correction_message_record) {
  wire[at] = fractional_trade_correction_message_record.participant_id; at = at + 1;
  encode_timestamp1(fractional_trade_correction_message_record.timestamp_1);
  wire[at] = fractional_trade_correction_message_record.message_id; at = at + 1;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> wire[at] = fractional_trade_correction_message_record.transaction_id[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.participant_reference_number[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 11 -> wire[at] = fractional_trade_correction_message_record.security_symbol[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_trade_correction_message_record.instrument_type; at = at + 1;
  encode_fractional_corrected_trade(fractional_trade_correction_message_record.fractional_corrected_trade);
  wire[at] = fractional_trade_correction_message_record.trade_reporting_facility_id; at = at + 1;
  encode_timestamp2(fractional_trade_correction_message_record.timestamp_2);
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.original_participant_reference_number[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  encode_fractional_original_trade(fractional_trade_correction_message_record.fractional_original_trade);
  wire[at] = fractional_trade_correction_message_record.primary_listing_market_participant_id; at = at + 1;
  wire[at] = fractional_trade_correction_message_record.financial_status_indicator; at = at + 1;
  encode_fractional_consolidated_data(fractional_trade_correction_message_record.fractional_consolidated_data);
  encode_fractional_participant_data(fractional_trade_correction_message_record.fractional_participant_data);
  skip
}

/* Fractional Trade Correction Message off the wire, 184 bytes from where the cursor stands */
inline decode_fractional_trade_correction_message(fractional_trade_correction_message_record) {
  fractional_trade_correction_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(fractional_trade_correction_message_record.timestamp_1);
  fractional_trade_correction_message_record.message_id = wire[at]; at = at + 1;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> fractional_trade_correction_message_record.transaction_id[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.participant_reference_number[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 11 -> fractional_trade_correction_message_record.security_symbol[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.instrument_type = wire[at]; at = at + 1;
  decode_fractional_corrected_trade(fractional_trade_correction_message_record.fractional_corrected_trade);
  fractional_trade_correction_message_record.trade_reporting_facility_id = wire[at]; at = at + 1;
  decode_timestamp2(fractional_trade_correction_message_record.timestamp_2);
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.original_participant_reference_number[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  decode_fractional_original_trade(fractional_trade_correction_message_record.fractional_original_trade);
  fractional_trade_correction_message_record.primary_listing_market_participant_id = wire[at]; at = at + 1;
  fractional_trade_correction_message_record.financial_status_indicator = wire[at]; at = at + 1;
  decode_fractional_consolidated_data(fractional_trade_correction_message_record.fractional_consolidated_data);
  decode_fractional_participant_data(fractional_trade_correction_message_record.fractional_participant_data);
  skip
}

/* what was read of Fractional Trade Correction Message is what was written, byte for byte */
inline equal_fractional_trade_correction_message(fractional_trade_correction_message_read, fractional_trade_correction_message_written) {
  assert(fractional_trade_correction_message_read.participant_id == fractional_trade_correction_message_written.participant_id);
  equal_timestamp1(fractional_trade_correction_message_read.timestamp_1, fractional_trade_correction_message_written.timestamp_1);
  assert(fractional_trade_correction_message_read.message_id == fractional_trade_correction_message_written.message_id);
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> assert(fractional_trade_correction_message_read.transaction_id[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.transaction_id[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.participant_reference_number[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.participant_reference_number[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 11 -> assert(fractional_trade_correction_message_read.security_symbol[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.security_symbol[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  assert(fractional_trade_correction_message_read.instrument_type == fractional_trade_correction_message_written.instrument_type);
  equal_fractional_corrected_trade(fractional_trade_correction_message_read.fractional_corrected_trade, fractional_trade_correction_message_written.fractional_corrected_trade);
  assert(fractional_trade_correction_message_read.trade_reporting_facility_id == fractional_trade_correction_message_written.trade_reporting_facility_id);
  equal_timestamp2(fractional_trade_correction_message_read.timestamp_2, fractional_trade_correction_message_written.timestamp_2);
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.original_participant_reference_number[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.original_participant_reference_number[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  equal_fractional_original_trade(fractional_trade_correction_message_read.fractional_original_trade, fractional_trade_correction_message_written.fractional_original_trade);
  assert(fractional_trade_correction_message_read.primary_listing_market_participant_id == fractional_trade_correction_message_written.primary_listing_market_participant_id);
  assert(fractional_trade_correction_message_read.financial_status_indicator == fractional_trade_correction_message_written.financial_status_indicator);
  equal_fractional_consolidated_data(fractional_trade_correction_message_read.fractional_consolidated_data, fractional_trade_correction_message_written.fractional_consolidated_data);
  equal_fractional_participant_data(fractional_trade_correction_message_read.fractional_participant_data, fractional_trade_correction_message_written.fractional_participant_data);
  skip
}

/* ---- Long Trade Message: 68 bytes -------------------------------------------- */

/* The Long Trade message is used to report trade information for Cta eligible Equity, Local Issue or Bonds. */
typedef LongTradeMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte security_symbol[11];
  byte instrument_type;
  SaleConditions sale_conditions;
  byte trade_price[8];
  byte trade_volume[4];
  byte sellers_sale_days;
  byte stop_stock_indicator;
  byte trade_through_exempt_indicator;
  byte trade_reporting_facility_id;
  Timestamp2 timestamp_2;
  byte short_sale_restriction_indicator;
  byte primary_listing_market_participant_id;
  byte financial_status_indicator;
  byte held_trade_indicator;
  byte consolidated_high_low_last_indicator;
  byte participant_open_high_low_last_indicator
};

int long_trade_message_at;

/* every byte of Long Trade Message set to one value */
inline fill_long_trade_message(long_trade_message_record, long_trade_message_value) {
  long_trade_message_record.participant_id = long_trade_message_value;
  fill_timestamp1(long_trade_message_record.timestamp_1, long_trade_message_value);
  long_trade_message_record.message_id = long_trade_message_value;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 4 -> long_trade_message_record.transaction_id[long_trade_message_at] = long_trade_message_value; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 8 -> long_trade_message_record.participant_reference_number[long_trade_message_at] = long_trade_message_value; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 11 -> long_trade_message_record.security_symbol[long_trade_message_at] = long_trade_message_value; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_record.instrument_type = long_trade_message_value;
  fill_sale_conditions(long_trade_message_record.sale_conditions, long_trade_message_value);
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 8 -> long_trade_message_record.trade_price[long_trade_message_at] = long_trade_message_value; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 4 -> long_trade_message_record.trade_volume[long_trade_message_at] = long_trade_message_value; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_record.sellers_sale_days = long_trade_message_value;
  long_trade_message_record.stop_stock_indicator = long_trade_message_value;
  long_trade_message_record.trade_through_exempt_indicator = long_trade_message_value;
  long_trade_message_record.trade_reporting_facility_id = long_trade_message_value;
  fill_timestamp2(long_trade_message_record.timestamp_2, long_trade_message_value);
  long_trade_message_record.short_sale_restriction_indicator = long_trade_message_value;
  long_trade_message_record.primary_listing_market_participant_id = long_trade_message_value;
  long_trade_message_record.financial_status_indicator = long_trade_message_value;
  long_trade_message_record.held_trade_indicator = long_trade_message_value;
  long_trade_message_record.consolidated_high_low_last_indicator = long_trade_message_value;
  long_trade_message_record.participant_open_high_low_last_indicator = long_trade_message_value;
  skip
}

/* each byte of Long Trade Message set to where it lies, so a field read out of place says so */
inline ramp_long_trade_message(long_trade_message_record, long_trade_message_base) {
  long_trade_message_record.participant_id = (long_trade_message_base + 0 + 1) % 256;
  ramp_timestamp1(long_trade_message_record.timestamp_1, long_trade_message_base + 1);
  long_trade_message_record.message_id = (long_trade_message_base + 9 + 1) % 256;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 4 -> long_trade_message_record.transaction_id[long_trade_message_at] = (long_trade_message_base + 10 + long_trade_message_at + 1) % 256; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 8 -> long_trade_message_record.participant_reference_number[long_trade_message_at] = (long_trade_message_base + 14 + long_trade_message_at + 1) % 256; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 11 -> long_trade_message_record.security_symbol[long_trade_message_at] = (long_trade_message_base + 22 + long_trade_message_at + 1) % 256; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_record.instrument_type = (long_trade_message_base + 33 + 1) % 256;
  ramp_sale_conditions(long_trade_message_record.sale_conditions, long_trade_message_base + 34);
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 8 -> long_trade_message_record.trade_price[long_trade_message_at] = (long_trade_message_base + 38 + long_trade_message_at + 1) % 256; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 4 -> long_trade_message_record.trade_volume[long_trade_message_at] = (long_trade_message_base + 46 + long_trade_message_at + 1) % 256; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_record.sellers_sale_days = (long_trade_message_base + 50 + 1) % 256;
  long_trade_message_record.stop_stock_indicator = (long_trade_message_base + 51 + 1) % 256;
  long_trade_message_record.trade_through_exempt_indicator = (long_trade_message_base + 52 + 1) % 256;
  long_trade_message_record.trade_reporting_facility_id = (long_trade_message_base + 53 + 1) % 256;
  ramp_timestamp2(long_trade_message_record.timestamp_2, long_trade_message_base + 54);
  long_trade_message_record.short_sale_restriction_indicator = (long_trade_message_base + 62 + 1) % 256;
  long_trade_message_record.primary_listing_market_participant_id = (long_trade_message_base + 63 + 1) % 256;
  long_trade_message_record.financial_status_indicator = (long_trade_message_base + 64 + 1) % 256;
  long_trade_message_record.held_trade_indicator = (long_trade_message_base + 65 + 1) % 256;
  long_trade_message_record.consolidated_high_low_last_indicator = (long_trade_message_base + 66 + 1) % 256;
  long_trade_message_record.participant_open_high_low_last_indicator = (long_trade_message_base + 67 + 1) % 256;
  skip
}

/* Long Trade Message to the wire, 68 bytes from where the cursor stands */
inline encode_long_trade_message(long_trade_message_record) {
  wire[at] = long_trade_message_record.participant_id; at = at + 1;
  encode_timestamp1(long_trade_message_record.timestamp_1);
  wire[at] = long_trade_message_record.message_id; at = at + 1;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 4 -> wire[at] = long_trade_message_record.transaction_id[long_trade_message_at]; at = at + 1; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 8 -> wire[at] = long_trade_message_record.participant_reference_number[long_trade_message_at]; at = at + 1; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 11 -> wire[at] = long_trade_message_record.security_symbol[long_trade_message_at]; at = at + 1; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = long_trade_message_record.instrument_type; at = at + 1;
  encode_sale_conditions(long_trade_message_record.sale_conditions);
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 8 -> wire[at] = long_trade_message_record.trade_price[long_trade_message_at]; at = at + 1; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 4 -> wire[at] = long_trade_message_record.trade_volume[long_trade_message_at]; at = at + 1; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = long_trade_message_record.sellers_sale_days; at = at + 1;
  wire[at] = long_trade_message_record.stop_stock_indicator; at = at + 1;
  wire[at] = long_trade_message_record.trade_through_exempt_indicator; at = at + 1;
  wire[at] = long_trade_message_record.trade_reporting_facility_id; at = at + 1;
  encode_timestamp2(long_trade_message_record.timestamp_2);
  wire[at] = long_trade_message_record.short_sale_restriction_indicator; at = at + 1;
  wire[at] = long_trade_message_record.primary_listing_market_participant_id; at = at + 1;
  wire[at] = long_trade_message_record.financial_status_indicator; at = at + 1;
  wire[at] = long_trade_message_record.held_trade_indicator; at = at + 1;
  wire[at] = long_trade_message_record.consolidated_high_low_last_indicator; at = at + 1;
  wire[at] = long_trade_message_record.participant_open_high_low_last_indicator; at = at + 1;
  skip
}

/* Long Trade Message off the wire, 68 bytes from where the cursor stands */
inline decode_long_trade_message(long_trade_message_record) {
  long_trade_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(long_trade_message_record.timestamp_1);
  long_trade_message_record.message_id = wire[at]; at = at + 1;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 4 -> long_trade_message_record.transaction_id[long_trade_message_at] = wire[at]; at = at + 1; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 8 -> long_trade_message_record.participant_reference_number[long_trade_message_at] = wire[at]; at = at + 1; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 11 -> long_trade_message_record.security_symbol[long_trade_message_at] = wire[at]; at = at + 1; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_record.instrument_type = wire[at]; at = at + 1;
  decode_sale_conditions(long_trade_message_record.sale_conditions);
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 8 -> long_trade_message_record.trade_price[long_trade_message_at] = wire[at]; at = at + 1; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 4 -> long_trade_message_record.trade_volume[long_trade_message_at] = wire[at]; at = at + 1; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_record.sellers_sale_days = wire[at]; at = at + 1;
  long_trade_message_record.stop_stock_indicator = wire[at]; at = at + 1;
  long_trade_message_record.trade_through_exempt_indicator = wire[at]; at = at + 1;
  long_trade_message_record.trade_reporting_facility_id = wire[at]; at = at + 1;
  decode_timestamp2(long_trade_message_record.timestamp_2);
  long_trade_message_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  long_trade_message_record.primary_listing_market_participant_id = wire[at]; at = at + 1;
  long_trade_message_record.financial_status_indicator = wire[at]; at = at + 1;
  long_trade_message_record.held_trade_indicator = wire[at]; at = at + 1;
  long_trade_message_record.consolidated_high_low_last_indicator = wire[at]; at = at + 1;
  long_trade_message_record.participant_open_high_low_last_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Long Trade Message is what was written, byte for byte */
inline equal_long_trade_message(long_trade_message_read, long_trade_message_written) {
  assert(long_trade_message_read.participant_id == long_trade_message_written.participant_id);
  equal_timestamp1(long_trade_message_read.timestamp_1, long_trade_message_written.timestamp_1);
  assert(long_trade_message_read.message_id == long_trade_message_written.message_id);
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 4 -> assert(long_trade_message_read.transaction_id[long_trade_message_at] == long_trade_message_written.transaction_id[long_trade_message_at]); long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 8 -> assert(long_trade_message_read.participant_reference_number[long_trade_message_at] == long_trade_message_written.participant_reference_number[long_trade_message_at]); long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 11 -> assert(long_trade_message_read.security_symbol[long_trade_message_at] == long_trade_message_written.security_symbol[long_trade_message_at]); long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  assert(long_trade_message_read.instrument_type == long_trade_message_written.instrument_type);
  equal_sale_conditions(long_trade_message_read.sale_conditions, long_trade_message_written.sale_conditions);
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 8 -> assert(long_trade_message_read.trade_price[long_trade_message_at] == long_trade_message_written.trade_price[long_trade_message_at]); long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 4 -> assert(long_trade_message_read.trade_volume[long_trade_message_at] == long_trade_message_written.trade_volume[long_trade_message_at]); long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  assert(long_trade_message_read.sellers_sale_days == long_trade_message_written.sellers_sale_days);
  assert(long_trade_message_read.stop_stock_indicator == long_trade_message_written.stop_stock_indicator);
  assert(long_trade_message_read.trade_through_exempt_indicator == long_trade_message_written.trade_through_exempt_indicator);
  assert(long_trade_message_read.trade_reporting_facility_id == long_trade_message_written.trade_reporting_facility_id);
  equal_timestamp2(long_trade_message_read.timestamp_2, long_trade_message_written.timestamp_2);
  assert(long_trade_message_read.short_sale_restriction_indicator == long_trade_message_written.short_sale_restriction_indicator);
  assert(long_trade_message_read.primary_listing_market_participant_id == long_trade_message_written.primary_listing_market_participant_id);
  assert(long_trade_message_read.financial_status_indicator == long_trade_message_written.financial_status_indicator);
  assert(long_trade_message_read.held_trade_indicator == long_trade_message_written.held_trade_indicator);
  assert(long_trade_message_read.consolidated_high_low_last_indicator == long_trade_message_written.consolidated_high_low_last_indicator);
  assert(long_trade_message_read.participant_open_high_low_last_indicator == long_trade_message_written.participant_open_high_low_last_indicator);
  skip
}

/* ---- Fractional Long Trade Message: 72 bytes --------------------------------- */

/* The Long Trade message is used to report trade information for Cta eligible Equity, Local Issue or Bonds. */
typedef FractionalLongTradeMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte security_symbol[11];
  byte instrument_type;
  SaleConditions sale_conditions;
  byte trade_price[8];
  byte fractional_trade_volume[8];
  byte sellers_sale_days;
  byte stop_stock_indicator;
  byte trade_through_exempt_indicator;
  byte trade_reporting_facility_id;
  Timestamp2 timestamp_2;
  byte short_sale_restriction_indicator;
  byte primary_listing_market_participant_id;
  byte financial_status_indicator;
  byte held_trade_indicator;
  byte consolidated_high_low_last_indicator;
  byte participant_open_high_low_last_indicator
};

int fractional_long_trade_message_at;

/* every byte of Fractional Long Trade Message set to one value */
inline fill_fractional_long_trade_message(fractional_long_trade_message_record, fractional_long_trade_message_value) {
  fractional_long_trade_message_record.participant_id = fractional_long_trade_message_value;
  fill_timestamp1(fractional_long_trade_message_record.timestamp_1, fractional_long_trade_message_value);
  fractional_long_trade_message_record.message_id = fractional_long_trade_message_value;
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 4 -> fractional_long_trade_message_record.transaction_id[fractional_long_trade_message_at] = fractional_long_trade_message_value; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 8 -> fractional_long_trade_message_record.participant_reference_number[fractional_long_trade_message_at] = fractional_long_trade_message_value; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 11 -> fractional_long_trade_message_record.security_symbol[fractional_long_trade_message_at] = fractional_long_trade_message_value; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_record.instrument_type = fractional_long_trade_message_value;
  fill_sale_conditions(fractional_long_trade_message_record.sale_conditions, fractional_long_trade_message_value);
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 8 -> fractional_long_trade_message_record.trade_price[fractional_long_trade_message_at] = fractional_long_trade_message_value; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 8 -> fractional_long_trade_message_record.fractional_trade_volume[fractional_long_trade_message_at] = fractional_long_trade_message_value; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_record.sellers_sale_days = fractional_long_trade_message_value;
  fractional_long_trade_message_record.stop_stock_indicator = fractional_long_trade_message_value;
  fractional_long_trade_message_record.trade_through_exempt_indicator = fractional_long_trade_message_value;
  fractional_long_trade_message_record.trade_reporting_facility_id = fractional_long_trade_message_value;
  fill_timestamp2(fractional_long_trade_message_record.timestamp_2, fractional_long_trade_message_value);
  fractional_long_trade_message_record.short_sale_restriction_indicator = fractional_long_trade_message_value;
  fractional_long_trade_message_record.primary_listing_market_participant_id = fractional_long_trade_message_value;
  fractional_long_trade_message_record.financial_status_indicator = fractional_long_trade_message_value;
  fractional_long_trade_message_record.held_trade_indicator = fractional_long_trade_message_value;
  fractional_long_trade_message_record.consolidated_high_low_last_indicator = fractional_long_trade_message_value;
  fractional_long_trade_message_record.participant_open_high_low_last_indicator = fractional_long_trade_message_value;
  skip
}

/* each byte of Fractional Long Trade Message set to where it lies, so a field read out of place says so */
inline ramp_fractional_long_trade_message(fractional_long_trade_message_record, fractional_long_trade_message_base) {
  fractional_long_trade_message_record.participant_id = (fractional_long_trade_message_base + 0 + 1) % 256;
  ramp_timestamp1(fractional_long_trade_message_record.timestamp_1, fractional_long_trade_message_base + 1);
  fractional_long_trade_message_record.message_id = (fractional_long_trade_message_base + 9 + 1) % 256;
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 4 -> fractional_long_trade_message_record.transaction_id[fractional_long_trade_message_at] = (fractional_long_trade_message_base + 10 + fractional_long_trade_message_at + 1) % 256; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 8 -> fractional_long_trade_message_record.participant_reference_number[fractional_long_trade_message_at] = (fractional_long_trade_message_base + 14 + fractional_long_trade_message_at + 1) % 256; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 11 -> fractional_long_trade_message_record.security_symbol[fractional_long_trade_message_at] = (fractional_long_trade_message_base + 22 + fractional_long_trade_message_at + 1) % 256; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_record.instrument_type = (fractional_long_trade_message_base + 33 + 1) % 256;
  ramp_sale_conditions(fractional_long_trade_message_record.sale_conditions, fractional_long_trade_message_base + 34);
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 8 -> fractional_long_trade_message_record.trade_price[fractional_long_trade_message_at] = (fractional_long_trade_message_base + 38 + fractional_long_trade_message_at + 1) % 256; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 8 -> fractional_long_trade_message_record.fractional_trade_volume[fractional_long_trade_message_at] = (fractional_long_trade_message_base + 46 + fractional_long_trade_message_at + 1) % 256; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_record.sellers_sale_days = (fractional_long_trade_message_base + 54 + 1) % 256;
  fractional_long_trade_message_record.stop_stock_indicator = (fractional_long_trade_message_base + 55 + 1) % 256;
  fractional_long_trade_message_record.trade_through_exempt_indicator = (fractional_long_trade_message_base + 56 + 1) % 256;
  fractional_long_trade_message_record.trade_reporting_facility_id = (fractional_long_trade_message_base + 57 + 1) % 256;
  ramp_timestamp2(fractional_long_trade_message_record.timestamp_2, fractional_long_trade_message_base + 58);
  fractional_long_trade_message_record.short_sale_restriction_indicator = (fractional_long_trade_message_base + 66 + 1) % 256;
  fractional_long_trade_message_record.primary_listing_market_participant_id = (fractional_long_trade_message_base + 67 + 1) % 256;
  fractional_long_trade_message_record.financial_status_indicator = (fractional_long_trade_message_base + 68 + 1) % 256;
  fractional_long_trade_message_record.held_trade_indicator = (fractional_long_trade_message_base + 69 + 1) % 256;
  fractional_long_trade_message_record.consolidated_high_low_last_indicator = (fractional_long_trade_message_base + 70 + 1) % 256;
  fractional_long_trade_message_record.participant_open_high_low_last_indicator = (fractional_long_trade_message_base + 71 + 1) % 256;
  skip
}

/* Fractional Long Trade Message to the wire, 72 bytes from where the cursor stands */
inline encode_fractional_long_trade_message(fractional_long_trade_message_record) {
  wire[at] = fractional_long_trade_message_record.participant_id; at = at + 1;
  encode_timestamp1(fractional_long_trade_message_record.timestamp_1);
  wire[at] = fractional_long_trade_message_record.message_id; at = at + 1;
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 4 -> wire[at] = fractional_long_trade_message_record.transaction_id[fractional_long_trade_message_at]; at = at + 1; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 8 -> wire[at] = fractional_long_trade_message_record.participant_reference_number[fractional_long_trade_message_at]; at = at + 1; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 11 -> wire[at] = fractional_long_trade_message_record.security_symbol[fractional_long_trade_message_at]; at = at + 1; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_long_trade_message_record.instrument_type; at = at + 1;
  encode_sale_conditions(fractional_long_trade_message_record.sale_conditions);
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 8 -> wire[at] = fractional_long_trade_message_record.trade_price[fractional_long_trade_message_at]; at = at + 1; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 8 -> wire[at] = fractional_long_trade_message_record.fractional_trade_volume[fractional_long_trade_message_at]; at = at + 1; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_long_trade_message_record.sellers_sale_days; at = at + 1;
  wire[at] = fractional_long_trade_message_record.stop_stock_indicator; at = at + 1;
  wire[at] = fractional_long_trade_message_record.trade_through_exempt_indicator; at = at + 1;
  wire[at] = fractional_long_trade_message_record.trade_reporting_facility_id; at = at + 1;
  encode_timestamp2(fractional_long_trade_message_record.timestamp_2);
  wire[at] = fractional_long_trade_message_record.short_sale_restriction_indicator; at = at + 1;
  wire[at] = fractional_long_trade_message_record.primary_listing_market_participant_id; at = at + 1;
  wire[at] = fractional_long_trade_message_record.financial_status_indicator; at = at + 1;
  wire[at] = fractional_long_trade_message_record.held_trade_indicator; at = at + 1;
  wire[at] = fractional_long_trade_message_record.consolidated_high_low_last_indicator; at = at + 1;
  wire[at] = fractional_long_trade_message_record.participant_open_high_low_last_indicator; at = at + 1;
  skip
}

/* Fractional Long Trade Message off the wire, 72 bytes from where the cursor stands */
inline decode_fractional_long_trade_message(fractional_long_trade_message_record) {
  fractional_long_trade_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(fractional_long_trade_message_record.timestamp_1);
  fractional_long_trade_message_record.message_id = wire[at]; at = at + 1;
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 4 -> fractional_long_trade_message_record.transaction_id[fractional_long_trade_message_at] = wire[at]; at = at + 1; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 8 -> fractional_long_trade_message_record.participant_reference_number[fractional_long_trade_message_at] = wire[at]; at = at + 1; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 11 -> fractional_long_trade_message_record.security_symbol[fractional_long_trade_message_at] = wire[at]; at = at + 1; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_record.instrument_type = wire[at]; at = at + 1;
  decode_sale_conditions(fractional_long_trade_message_record.sale_conditions);
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 8 -> fractional_long_trade_message_record.trade_price[fractional_long_trade_message_at] = wire[at]; at = at + 1; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 8 -> fractional_long_trade_message_record.fractional_trade_volume[fractional_long_trade_message_at] = wire[at]; at = at + 1; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_record.sellers_sale_days = wire[at]; at = at + 1;
  fractional_long_trade_message_record.stop_stock_indicator = wire[at]; at = at + 1;
  fractional_long_trade_message_record.trade_through_exempt_indicator = wire[at]; at = at + 1;
  fractional_long_trade_message_record.trade_reporting_facility_id = wire[at]; at = at + 1;
  decode_timestamp2(fractional_long_trade_message_record.timestamp_2);
  fractional_long_trade_message_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  fractional_long_trade_message_record.primary_listing_market_participant_id = wire[at]; at = at + 1;
  fractional_long_trade_message_record.financial_status_indicator = wire[at]; at = at + 1;
  fractional_long_trade_message_record.held_trade_indicator = wire[at]; at = at + 1;
  fractional_long_trade_message_record.consolidated_high_low_last_indicator = wire[at]; at = at + 1;
  fractional_long_trade_message_record.participant_open_high_low_last_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Fractional Long Trade Message is what was written, byte for byte */
inline equal_fractional_long_trade_message(fractional_long_trade_message_read, fractional_long_trade_message_written) {
  assert(fractional_long_trade_message_read.participant_id == fractional_long_trade_message_written.participant_id);
  equal_timestamp1(fractional_long_trade_message_read.timestamp_1, fractional_long_trade_message_written.timestamp_1);
  assert(fractional_long_trade_message_read.message_id == fractional_long_trade_message_written.message_id);
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 4 -> assert(fractional_long_trade_message_read.transaction_id[fractional_long_trade_message_at] == fractional_long_trade_message_written.transaction_id[fractional_long_trade_message_at]); fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 8 -> assert(fractional_long_trade_message_read.participant_reference_number[fractional_long_trade_message_at] == fractional_long_trade_message_written.participant_reference_number[fractional_long_trade_message_at]); fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 11 -> assert(fractional_long_trade_message_read.security_symbol[fractional_long_trade_message_at] == fractional_long_trade_message_written.security_symbol[fractional_long_trade_message_at]); fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  assert(fractional_long_trade_message_read.instrument_type == fractional_long_trade_message_written.instrument_type);
  equal_sale_conditions(fractional_long_trade_message_read.sale_conditions, fractional_long_trade_message_written.sale_conditions);
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 8 -> assert(fractional_long_trade_message_read.trade_price[fractional_long_trade_message_at] == fractional_long_trade_message_written.trade_price[fractional_long_trade_message_at]); fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 8 -> assert(fractional_long_trade_message_read.fractional_trade_volume[fractional_long_trade_message_at] == fractional_long_trade_message_written.fractional_trade_volume[fractional_long_trade_message_at]); fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  assert(fractional_long_trade_message_read.sellers_sale_days == fractional_long_trade_message_written.sellers_sale_days);
  assert(fractional_long_trade_message_read.stop_stock_indicator == fractional_long_trade_message_written.stop_stock_indicator);
  assert(fractional_long_trade_message_read.trade_through_exempt_indicator == fractional_long_trade_message_written.trade_through_exempt_indicator);
  assert(fractional_long_trade_message_read.trade_reporting_facility_id == fractional_long_trade_message_written.trade_reporting_facility_id);
  equal_timestamp2(fractional_long_trade_message_read.timestamp_2, fractional_long_trade_message_written.timestamp_2);
  assert(fractional_long_trade_message_read.short_sale_restriction_indicator == fractional_long_trade_message_written.short_sale_restriction_indicator);
  assert(fractional_long_trade_message_read.primary_listing_market_participant_id == fractional_long_trade_message_written.primary_listing_market_participant_id);
  assert(fractional_long_trade_message_read.financial_status_indicator == fractional_long_trade_message_written.financial_status_indicator);
  assert(fractional_long_trade_message_read.held_trade_indicator == fractional_long_trade_message_written.held_trade_indicator);
  assert(fractional_long_trade_message_read.consolidated_high_low_last_indicator == fractional_long_trade_message_written.consolidated_high_low_last_indicator);
  assert(fractional_long_trade_message_read.participant_open_high_low_last_indicator == fractional_long_trade_message_written.participant_open_high_low_last_indicator);
  skip
}

/* ---- Trading Status Message: 72 bytes ---------------------------------------- */

/* The Trading Status message is transmitted when a Participant in a Cta eligible security, Local Issue or a Bond elects to notify CTS of an Opening Delay, a Trading Halt, a Trading Resume, a Price Indication or a Market Imbalance. */
typedef TradingStatusMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte security_symbol[11];
  byte instrument_type;
  byte last_price[8];
  byte high_indication_price_upper_limit_price_band[8];
  byte low_indication_price_lower_limit_price_band[8];
  byte buy_volume[4];
  byte sell_volume[4];
  byte security_status;
  byte halt_reason;
  byte short_sale_restriction_indicator;
  byte primary_listing_market_participant_id;
  byte financial_status_indicator;
  byte limit_up_limit_down_indicator
};

int trading_status_message_at;

/* every byte of Trading Status Message set to one value */
inline fill_trading_status_message(trading_status_message_record, trading_status_message_value) {
  trading_status_message_record.participant_id = trading_status_message_value;
  fill_timestamp1(trading_status_message_record.timestamp_1, trading_status_message_value);
  trading_status_message_record.message_id = trading_status_message_value;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.transaction_id[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.participant_reference_number[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 11 -> trading_status_message_record.security_symbol[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.instrument_type = trading_status_message_value;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.last_price[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.high_indication_price_upper_limit_price_band[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.low_indication_price_lower_limit_price_band[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.buy_volume[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.sell_volume[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.security_status = trading_status_message_value;
  trading_status_message_record.halt_reason = trading_status_message_value;
  trading_status_message_record.short_sale_restriction_indicator = trading_status_message_value;
  trading_status_message_record.primary_listing_market_participant_id = trading_status_message_value;
  trading_status_message_record.financial_status_indicator = trading_status_message_value;
  trading_status_message_record.limit_up_limit_down_indicator = trading_status_message_value;
  skip
}

/* each byte of Trading Status Message set to where it lies, so a field read out of place says so */
inline ramp_trading_status_message(trading_status_message_record, trading_status_message_base) {
  trading_status_message_record.participant_id = (trading_status_message_base + 0 + 1) % 256;
  ramp_timestamp1(trading_status_message_record.timestamp_1, trading_status_message_base + 1);
  trading_status_message_record.message_id = (trading_status_message_base + 9 + 1) % 256;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.transaction_id[trading_status_message_at] = (trading_status_message_base + 10 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.participant_reference_number[trading_status_message_at] = (trading_status_message_base + 14 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 11 -> trading_status_message_record.security_symbol[trading_status_message_at] = (trading_status_message_base + 22 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.instrument_type = (trading_status_message_base + 33 + 1) % 256;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.last_price[trading_status_message_at] = (trading_status_message_base + 34 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.high_indication_price_upper_limit_price_band[trading_status_message_at] = (trading_status_message_base + 42 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.low_indication_price_lower_limit_price_band[trading_status_message_at] = (trading_status_message_base + 50 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.buy_volume[trading_status_message_at] = (trading_status_message_base + 58 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.sell_volume[trading_status_message_at] = (trading_status_message_base + 62 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.security_status = (trading_status_message_base + 66 + 1) % 256;
  trading_status_message_record.halt_reason = (trading_status_message_base + 67 + 1) % 256;
  trading_status_message_record.short_sale_restriction_indicator = (trading_status_message_base + 68 + 1) % 256;
  trading_status_message_record.primary_listing_market_participant_id = (trading_status_message_base + 69 + 1) % 256;
  trading_status_message_record.financial_status_indicator = (trading_status_message_base + 70 + 1) % 256;
  trading_status_message_record.limit_up_limit_down_indicator = (trading_status_message_base + 71 + 1) % 256;
  skip
}

/* Trading Status Message to the wire, 72 bytes from where the cursor stands */
inline encode_trading_status_message(trading_status_message_record) {
  wire[at] = trading_status_message_record.participant_id; at = at + 1;
  encode_timestamp1(trading_status_message_record.timestamp_1);
  wire[at] = trading_status_message_record.message_id; at = at + 1;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> wire[at] = trading_status_message_record.transaction_id[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> wire[at] = trading_status_message_record.participant_reference_number[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 11 -> wire[at] = trading_status_message_record.security_symbol[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_status_message_record.instrument_type; at = at + 1;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> wire[at] = trading_status_message_record.last_price[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> wire[at] = trading_status_message_record.high_indication_price_upper_limit_price_band[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> wire[at] = trading_status_message_record.low_indication_price_lower_limit_price_band[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> wire[at] = trading_status_message_record.buy_volume[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> wire[at] = trading_status_message_record.sell_volume[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_status_message_record.security_status; at = at + 1;
  wire[at] = trading_status_message_record.halt_reason; at = at + 1;
  wire[at] = trading_status_message_record.short_sale_restriction_indicator; at = at + 1;
  wire[at] = trading_status_message_record.primary_listing_market_participant_id; at = at + 1;
  wire[at] = trading_status_message_record.financial_status_indicator; at = at + 1;
  wire[at] = trading_status_message_record.limit_up_limit_down_indicator; at = at + 1;
  skip
}

/* Trading Status Message off the wire, 72 bytes from where the cursor stands */
inline decode_trading_status_message(trading_status_message_record) {
  trading_status_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(trading_status_message_record.timestamp_1);
  trading_status_message_record.message_id = wire[at]; at = at + 1;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.transaction_id[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.participant_reference_number[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 11 -> trading_status_message_record.security_symbol[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.instrument_type = wire[at]; at = at + 1;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.last_price[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.high_indication_price_upper_limit_price_band[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.low_indication_price_lower_limit_price_band[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.buy_volume[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.sell_volume[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.security_status = wire[at]; at = at + 1;
  trading_status_message_record.halt_reason = wire[at]; at = at + 1;
  trading_status_message_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  trading_status_message_record.primary_listing_market_participant_id = wire[at]; at = at + 1;
  trading_status_message_record.financial_status_indicator = wire[at]; at = at + 1;
  trading_status_message_record.limit_up_limit_down_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Trading Status Message is what was written, byte for byte */
inline equal_trading_status_message(trading_status_message_read, trading_status_message_written) {
  assert(trading_status_message_read.participant_id == trading_status_message_written.participant_id);
  equal_timestamp1(trading_status_message_read.timestamp_1, trading_status_message_written.timestamp_1);
  assert(trading_status_message_read.message_id == trading_status_message_written.message_id);
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> assert(trading_status_message_read.transaction_id[trading_status_message_at] == trading_status_message_written.transaction_id[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> assert(trading_status_message_read.participant_reference_number[trading_status_message_at] == trading_status_message_written.participant_reference_number[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 11 -> assert(trading_status_message_read.security_symbol[trading_status_message_at] == trading_status_message_written.security_symbol[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  assert(trading_status_message_read.instrument_type == trading_status_message_written.instrument_type);
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> assert(trading_status_message_read.last_price[trading_status_message_at] == trading_status_message_written.last_price[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> assert(trading_status_message_read.high_indication_price_upper_limit_price_band[trading_status_message_at] == trading_status_message_written.high_indication_price_upper_limit_price_band[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> assert(trading_status_message_read.low_indication_price_lower_limit_price_band[trading_status_message_at] == trading_status_message_written.low_indication_price_lower_limit_price_band[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> assert(trading_status_message_read.buy_volume[trading_status_message_at] == trading_status_message_written.buy_volume[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> assert(trading_status_message_read.sell_volume[trading_status_message_at] == trading_status_message_written.sell_volume[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  assert(trading_status_message_read.security_status == trading_status_message_written.security_status);
  assert(trading_status_message_read.halt_reason == trading_status_message_written.halt_reason);
  assert(trading_status_message_read.short_sale_restriction_indicator == trading_status_message_written.short_sale_restriction_indicator);
  assert(trading_status_message_read.primary_listing_market_participant_id == trading_status_message_written.primary_listing_market_participant_id);
  assert(trading_status_message_read.financial_status_indicator == trading_status_message_written.financial_status_indicator);
  assert(trading_status_message_read.limit_up_limit_down_indicator == trading_status_message_written.limit_up_limit_down_indicator);
  skip
}

/* ---- Short Trade Message: 36 bytes ------------------------------------------- */

/* The Short Trade message is used to report trade information for Cta eligible Equity only (not used for Local Issues or Bonds) if the trade meets message format requirements otherwise Long Trade message is used. */
typedef ShortTradeMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte security_symbol_short[5];
  byte sale_condition;
  byte sale_condition_category;
  byte trade_price_short[2];
  byte trade_volume_short[2];
  byte primary_listing_market_participant_id;
  byte consolidated_high_low_last_indicator;
  byte participant_open_high_low_last_indicator
};

int short_trade_message_at;

/* every byte of Short Trade Message set to one value */
inline fill_short_trade_message(short_trade_message_record, short_trade_message_value) {
  short_trade_message_record.participant_id = short_trade_message_value;
  fill_timestamp1(short_trade_message_record.timestamp_1, short_trade_message_value);
  short_trade_message_record.message_id = short_trade_message_value;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 4 -> short_trade_message_record.transaction_id[short_trade_message_at] = short_trade_message_value; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 8 -> short_trade_message_record.participant_reference_number[short_trade_message_at] = short_trade_message_value; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 5 -> short_trade_message_record.security_symbol_short[short_trade_message_at] = short_trade_message_value; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_record.sale_condition = short_trade_message_value;
  short_trade_message_record.sale_condition_category = short_trade_message_value;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 2 -> short_trade_message_record.trade_price_short[short_trade_message_at] = short_trade_message_value; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 2 -> short_trade_message_record.trade_volume_short[short_trade_message_at] = short_trade_message_value; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_record.primary_listing_market_participant_id = short_trade_message_value;
  short_trade_message_record.consolidated_high_low_last_indicator = short_trade_message_value;
  short_trade_message_record.participant_open_high_low_last_indicator = short_trade_message_value;
  skip
}

/* each byte of Short Trade Message set to where it lies, so a field read out of place says so */
inline ramp_short_trade_message(short_trade_message_record, short_trade_message_base) {
  short_trade_message_record.participant_id = (short_trade_message_base + 0 + 1) % 256;
  ramp_timestamp1(short_trade_message_record.timestamp_1, short_trade_message_base + 1);
  short_trade_message_record.message_id = (short_trade_message_base + 9 + 1) % 256;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 4 -> short_trade_message_record.transaction_id[short_trade_message_at] = (short_trade_message_base + 10 + short_trade_message_at + 1) % 256; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 8 -> short_trade_message_record.participant_reference_number[short_trade_message_at] = (short_trade_message_base + 14 + short_trade_message_at + 1) % 256; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 5 -> short_trade_message_record.security_symbol_short[short_trade_message_at] = (short_trade_message_base + 22 + short_trade_message_at + 1) % 256; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_record.sale_condition = (short_trade_message_base + 27 + 1) % 256;
  short_trade_message_record.sale_condition_category = (short_trade_message_base + 28 + 1) % 256;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 2 -> short_trade_message_record.trade_price_short[short_trade_message_at] = (short_trade_message_base + 29 + short_trade_message_at + 1) % 256; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 2 -> short_trade_message_record.trade_volume_short[short_trade_message_at] = (short_trade_message_base + 31 + short_trade_message_at + 1) % 256; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_record.primary_listing_market_participant_id = (short_trade_message_base + 33 + 1) % 256;
  short_trade_message_record.consolidated_high_low_last_indicator = (short_trade_message_base + 34 + 1) % 256;
  short_trade_message_record.participant_open_high_low_last_indicator = (short_trade_message_base + 35 + 1) % 256;
  skip
}

/* Short Trade Message to the wire, 36 bytes from where the cursor stands */
inline encode_short_trade_message(short_trade_message_record) {
  wire[at] = short_trade_message_record.participant_id; at = at + 1;
  encode_timestamp1(short_trade_message_record.timestamp_1);
  wire[at] = short_trade_message_record.message_id; at = at + 1;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 4 -> wire[at] = short_trade_message_record.transaction_id[short_trade_message_at]; at = at + 1; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 8 -> wire[at] = short_trade_message_record.participant_reference_number[short_trade_message_at]; at = at + 1; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 5 -> wire[at] = short_trade_message_record.security_symbol_short[short_trade_message_at]; at = at + 1; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = short_trade_message_record.sale_condition; at = at + 1;
  wire[at] = short_trade_message_record.sale_condition_category; at = at + 1;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 2 -> wire[at] = short_trade_message_record.trade_price_short[short_trade_message_at]; at = at + 1; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 2 -> wire[at] = short_trade_message_record.trade_volume_short[short_trade_message_at]; at = at + 1; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = short_trade_message_record.primary_listing_market_participant_id; at = at + 1;
  wire[at] = short_trade_message_record.consolidated_high_low_last_indicator; at = at + 1;
  wire[at] = short_trade_message_record.participant_open_high_low_last_indicator; at = at + 1;
  skip
}

/* Short Trade Message off the wire, 36 bytes from where the cursor stands */
inline decode_short_trade_message(short_trade_message_record) {
  short_trade_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(short_trade_message_record.timestamp_1);
  short_trade_message_record.message_id = wire[at]; at = at + 1;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 4 -> short_trade_message_record.transaction_id[short_trade_message_at] = wire[at]; at = at + 1; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 8 -> short_trade_message_record.participant_reference_number[short_trade_message_at] = wire[at]; at = at + 1; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 5 -> short_trade_message_record.security_symbol_short[short_trade_message_at] = wire[at]; at = at + 1; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_record.sale_condition = wire[at]; at = at + 1;
  short_trade_message_record.sale_condition_category = wire[at]; at = at + 1;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 2 -> short_trade_message_record.trade_price_short[short_trade_message_at] = wire[at]; at = at + 1; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 2 -> short_trade_message_record.trade_volume_short[short_trade_message_at] = wire[at]; at = at + 1; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_record.primary_listing_market_participant_id = wire[at]; at = at + 1;
  short_trade_message_record.consolidated_high_low_last_indicator = wire[at]; at = at + 1;
  short_trade_message_record.participant_open_high_low_last_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Short Trade Message is what was written, byte for byte */
inline equal_short_trade_message(short_trade_message_read, short_trade_message_written) {
  assert(short_trade_message_read.participant_id == short_trade_message_written.participant_id);
  equal_timestamp1(short_trade_message_read.timestamp_1, short_trade_message_written.timestamp_1);
  assert(short_trade_message_read.message_id == short_trade_message_written.message_id);
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 4 -> assert(short_trade_message_read.transaction_id[short_trade_message_at] == short_trade_message_written.transaction_id[short_trade_message_at]); short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 8 -> assert(short_trade_message_read.participant_reference_number[short_trade_message_at] == short_trade_message_written.participant_reference_number[short_trade_message_at]); short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 5 -> assert(short_trade_message_read.security_symbol_short[short_trade_message_at] == short_trade_message_written.security_symbol_short[short_trade_message_at]); short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  assert(short_trade_message_read.sale_condition == short_trade_message_written.sale_condition);
  assert(short_trade_message_read.sale_condition_category == short_trade_message_written.sale_condition_category);
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 2 -> assert(short_trade_message_read.trade_price_short[short_trade_message_at] == short_trade_message_written.trade_price_short[short_trade_message_at]); short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 2 -> assert(short_trade_message_read.trade_volume_short[short_trade_message_at] == short_trade_message_written.trade_volume_short[short_trade_message_at]); short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  assert(short_trade_message_read.primary_listing_market_participant_id == short_trade_message_written.primary_listing_market_participant_id);
  assert(short_trade_message_read.consolidated_high_low_last_indicator == short_trade_message_written.consolidated_high_low_last_indicator);
  assert(short_trade_message_read.participant_open_high_low_last_indicator == short_trade_message_written.participant_open_high_low_last_indicator);
  skip
}

/* ---- Fractional Short Trade Message: 38 bytes -------------------------------- */

/* The Short Trade message is used to report trade information for Cta eligible Equity only (not used for Local Issues or Bonds) if the trade meets message format requirements otherwise Long Trade message is used. */
typedef FractionalShortTradeMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte security_symbol_short[5];
  byte sale_condition;
  byte sale_condition_category;
  byte trade_price_short[2];
  byte fractional_trade_volume_short[4];
  byte primary_listing_market_participant_id;
  byte consolidated_high_low_last_indicator;
  byte participant_open_high_low_last_indicator
};

int fractional_short_trade_message_at;

/* every byte of Fractional Short Trade Message set to one value */
inline fill_fractional_short_trade_message(fractional_short_trade_message_record, fractional_short_trade_message_value) {
  fractional_short_trade_message_record.participant_id = fractional_short_trade_message_value;
  fill_timestamp1(fractional_short_trade_message_record.timestamp_1, fractional_short_trade_message_value);
  fractional_short_trade_message_record.message_id = fractional_short_trade_message_value;
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 4 -> fractional_short_trade_message_record.transaction_id[fractional_short_trade_message_at] = fractional_short_trade_message_value; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 8 -> fractional_short_trade_message_record.participant_reference_number[fractional_short_trade_message_at] = fractional_short_trade_message_value; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 5 -> fractional_short_trade_message_record.security_symbol_short[fractional_short_trade_message_at] = fractional_short_trade_message_value; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  fractional_short_trade_message_record.sale_condition = fractional_short_trade_message_value;
  fractional_short_trade_message_record.sale_condition_category = fractional_short_trade_message_value;
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 2 -> fractional_short_trade_message_record.trade_price_short[fractional_short_trade_message_at] = fractional_short_trade_message_value; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 4 -> fractional_short_trade_message_record.fractional_trade_volume_short[fractional_short_trade_message_at] = fractional_short_trade_message_value; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  fractional_short_trade_message_record.primary_listing_market_participant_id = fractional_short_trade_message_value;
  fractional_short_trade_message_record.consolidated_high_low_last_indicator = fractional_short_trade_message_value;
  fractional_short_trade_message_record.participant_open_high_low_last_indicator = fractional_short_trade_message_value;
  skip
}

/* each byte of Fractional Short Trade Message set to where it lies, so a field read out of place says so */
inline ramp_fractional_short_trade_message(fractional_short_trade_message_record, fractional_short_trade_message_base) {
  fractional_short_trade_message_record.participant_id = (fractional_short_trade_message_base + 0 + 1) % 256;
  ramp_timestamp1(fractional_short_trade_message_record.timestamp_1, fractional_short_trade_message_base + 1);
  fractional_short_trade_message_record.message_id = (fractional_short_trade_message_base + 9 + 1) % 256;
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 4 -> fractional_short_trade_message_record.transaction_id[fractional_short_trade_message_at] = (fractional_short_trade_message_base + 10 + fractional_short_trade_message_at + 1) % 256; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 8 -> fractional_short_trade_message_record.participant_reference_number[fractional_short_trade_message_at] = (fractional_short_trade_message_base + 14 + fractional_short_trade_message_at + 1) % 256; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 5 -> fractional_short_trade_message_record.security_symbol_short[fractional_short_trade_message_at] = (fractional_short_trade_message_base + 22 + fractional_short_trade_message_at + 1) % 256; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  fractional_short_trade_message_record.sale_condition = (fractional_short_trade_message_base + 27 + 1) % 256;
  fractional_short_trade_message_record.sale_condition_category = (fractional_short_trade_message_base + 28 + 1) % 256;
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 2 -> fractional_short_trade_message_record.trade_price_short[fractional_short_trade_message_at] = (fractional_short_trade_message_base + 29 + fractional_short_trade_message_at + 1) % 256; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 4 -> fractional_short_trade_message_record.fractional_trade_volume_short[fractional_short_trade_message_at] = (fractional_short_trade_message_base + 31 + fractional_short_trade_message_at + 1) % 256; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  fractional_short_trade_message_record.primary_listing_market_participant_id = (fractional_short_trade_message_base + 35 + 1) % 256;
  fractional_short_trade_message_record.consolidated_high_low_last_indicator = (fractional_short_trade_message_base + 36 + 1) % 256;
  fractional_short_trade_message_record.participant_open_high_low_last_indicator = (fractional_short_trade_message_base + 37 + 1) % 256;
  skip
}

/* Fractional Short Trade Message to the wire, 38 bytes from where the cursor stands */
inline encode_fractional_short_trade_message(fractional_short_trade_message_record) {
  wire[at] = fractional_short_trade_message_record.participant_id; at = at + 1;
  encode_timestamp1(fractional_short_trade_message_record.timestamp_1);
  wire[at] = fractional_short_trade_message_record.message_id; at = at + 1;
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 4 -> wire[at] = fractional_short_trade_message_record.transaction_id[fractional_short_trade_message_at]; at = at + 1; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 8 -> wire[at] = fractional_short_trade_message_record.participant_reference_number[fractional_short_trade_message_at]; at = at + 1; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 5 -> wire[at] = fractional_short_trade_message_record.security_symbol_short[fractional_short_trade_message_at]; at = at + 1; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_short_trade_message_record.sale_condition; at = at + 1;
  wire[at] = fractional_short_trade_message_record.sale_condition_category; at = at + 1;
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 2 -> wire[at] = fractional_short_trade_message_record.trade_price_short[fractional_short_trade_message_at]; at = at + 1; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 4 -> wire[at] = fractional_short_trade_message_record.fractional_trade_volume_short[fractional_short_trade_message_at]; at = at + 1; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_short_trade_message_record.primary_listing_market_participant_id; at = at + 1;
  wire[at] = fractional_short_trade_message_record.consolidated_high_low_last_indicator; at = at + 1;
  wire[at] = fractional_short_trade_message_record.participant_open_high_low_last_indicator; at = at + 1;
  skip
}

/* Fractional Short Trade Message off the wire, 38 bytes from where the cursor stands */
inline decode_fractional_short_trade_message(fractional_short_trade_message_record) {
  fractional_short_trade_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(fractional_short_trade_message_record.timestamp_1);
  fractional_short_trade_message_record.message_id = wire[at]; at = at + 1;
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 4 -> fractional_short_trade_message_record.transaction_id[fractional_short_trade_message_at] = wire[at]; at = at + 1; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 8 -> fractional_short_trade_message_record.participant_reference_number[fractional_short_trade_message_at] = wire[at]; at = at + 1; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 5 -> fractional_short_trade_message_record.security_symbol_short[fractional_short_trade_message_at] = wire[at]; at = at + 1; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  fractional_short_trade_message_record.sale_condition = wire[at]; at = at + 1;
  fractional_short_trade_message_record.sale_condition_category = wire[at]; at = at + 1;
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 2 -> fractional_short_trade_message_record.trade_price_short[fractional_short_trade_message_at] = wire[at]; at = at + 1; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 4 -> fractional_short_trade_message_record.fractional_trade_volume_short[fractional_short_trade_message_at] = wire[at]; at = at + 1; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  fractional_short_trade_message_record.primary_listing_market_participant_id = wire[at]; at = at + 1;
  fractional_short_trade_message_record.consolidated_high_low_last_indicator = wire[at]; at = at + 1;
  fractional_short_trade_message_record.participant_open_high_low_last_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Fractional Short Trade Message is what was written, byte for byte */
inline equal_fractional_short_trade_message(fractional_short_trade_message_read, fractional_short_trade_message_written) {
  assert(fractional_short_trade_message_read.participant_id == fractional_short_trade_message_written.participant_id);
  equal_timestamp1(fractional_short_trade_message_read.timestamp_1, fractional_short_trade_message_written.timestamp_1);
  assert(fractional_short_trade_message_read.message_id == fractional_short_trade_message_written.message_id);
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 4 -> assert(fractional_short_trade_message_read.transaction_id[fractional_short_trade_message_at] == fractional_short_trade_message_written.transaction_id[fractional_short_trade_message_at]); fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 8 -> assert(fractional_short_trade_message_read.participant_reference_number[fractional_short_trade_message_at] == fractional_short_trade_message_written.participant_reference_number[fractional_short_trade_message_at]); fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 5 -> assert(fractional_short_trade_message_read.security_symbol_short[fractional_short_trade_message_at] == fractional_short_trade_message_written.security_symbol_short[fractional_short_trade_message_at]); fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  assert(fractional_short_trade_message_read.sale_condition == fractional_short_trade_message_written.sale_condition);
  assert(fractional_short_trade_message_read.sale_condition_category == fractional_short_trade_message_written.sale_condition_category);
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 2 -> assert(fractional_short_trade_message_read.trade_price_short[fractional_short_trade_message_at] == fractional_short_trade_message_written.trade_price_short[fractional_short_trade_message_at]); fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 4 -> assert(fractional_short_trade_message_read.fractional_trade_volume_short[fractional_short_trade_message_at] == fractional_short_trade_message_written.fractional_trade_volume_short[fractional_short_trade_message_at]); fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  assert(fractional_short_trade_message_read.primary_listing_market_participant_id == fractional_short_trade_message_written.primary_listing_market_participant_id);
  assert(fractional_short_trade_message_read.consolidated_high_low_last_indicator == fractional_short_trade_message_written.consolidated_high_low_last_indicator);
  assert(fractional_short_trade_message_read.participant_open_high_low_last_indicator == fractional_short_trade_message_written.participant_open_high_low_last_indicator);
  skip
}

/* ---- Trade Cancel Error Message: 149 bytes ----------------------------------- */

/* The Trade Cancel/Error message is used cancel or error Cta eligible securities, Local Issues or Bond information. */
typedef TradeCancelErrorMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte security_symbol[11];
  byte instrument_type;
  SaleConditions sale_conditions;
  byte trade_price[8];
  byte trade_volume[4];
  byte sellers_sale_days;
  byte stop_stock_indicator;
  byte trade_through_exempt_indicator;
  byte trade_reporting_facility_id;
  byte original_participant_reference_number[8];
  Timestamp2 timestamp_2;
  byte cancel_error_action;
  byte short_sale_restriction_indicator;
  byte primary_listing_market_participant_id;
  byte financial_status_indicator;
  ConsolidatedData consolidated_data;
  ParticipantData participant_data
};

int trade_cancel_error_message_at;

/* every byte of Trade Cancel Error Message set to one value */
inline fill_trade_cancel_error_message(trade_cancel_error_message_record, trade_cancel_error_message_value) {
  trade_cancel_error_message_record.participant_id = trade_cancel_error_message_value;
  fill_timestamp1(trade_cancel_error_message_record.timestamp_1, trade_cancel_error_message_value);
  trade_cancel_error_message_record.message_id = trade_cancel_error_message_value;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.transaction_id[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.participant_reference_number[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 11 -> trade_cancel_error_message_record.security_symbol[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.instrument_type = trade_cancel_error_message_value;
  fill_sale_conditions(trade_cancel_error_message_record.sale_conditions, trade_cancel_error_message_value);
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.trade_price[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.trade_volume[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.sellers_sale_days = trade_cancel_error_message_value;
  trade_cancel_error_message_record.stop_stock_indicator = trade_cancel_error_message_value;
  trade_cancel_error_message_record.trade_through_exempt_indicator = trade_cancel_error_message_value;
  trade_cancel_error_message_record.trade_reporting_facility_id = trade_cancel_error_message_value;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.original_participant_reference_number[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fill_timestamp2(trade_cancel_error_message_record.timestamp_2, trade_cancel_error_message_value);
  trade_cancel_error_message_record.cancel_error_action = trade_cancel_error_message_value;
  trade_cancel_error_message_record.short_sale_restriction_indicator = trade_cancel_error_message_value;
  trade_cancel_error_message_record.primary_listing_market_participant_id = trade_cancel_error_message_value;
  trade_cancel_error_message_record.financial_status_indicator = trade_cancel_error_message_value;
  fill_consolidated_data(trade_cancel_error_message_record.consolidated_data, trade_cancel_error_message_value);
  fill_participant_data(trade_cancel_error_message_record.participant_data, trade_cancel_error_message_value);
  skip
}

/* each byte of Trade Cancel Error Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancel_error_message(trade_cancel_error_message_record, trade_cancel_error_message_base) {
  trade_cancel_error_message_record.participant_id = (trade_cancel_error_message_base + 0 + 1) % 256;
  ramp_timestamp1(trade_cancel_error_message_record.timestamp_1, trade_cancel_error_message_base + 1);
  trade_cancel_error_message_record.message_id = (trade_cancel_error_message_base + 9 + 1) % 256;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.transaction_id[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 10 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.participant_reference_number[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 14 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 11 -> trade_cancel_error_message_record.security_symbol[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 22 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.instrument_type = (trade_cancel_error_message_base + 33 + 1) % 256;
  ramp_sale_conditions(trade_cancel_error_message_record.sale_conditions, trade_cancel_error_message_base + 34);
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.trade_price[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 38 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.trade_volume[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 46 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.sellers_sale_days = (trade_cancel_error_message_base + 50 + 1) % 256;
  trade_cancel_error_message_record.stop_stock_indicator = (trade_cancel_error_message_base + 51 + 1) % 256;
  trade_cancel_error_message_record.trade_through_exempt_indicator = (trade_cancel_error_message_base + 52 + 1) % 256;
  trade_cancel_error_message_record.trade_reporting_facility_id = (trade_cancel_error_message_base + 53 + 1) % 256;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.original_participant_reference_number[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 54 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  ramp_timestamp2(trade_cancel_error_message_record.timestamp_2, trade_cancel_error_message_base + 62);
  trade_cancel_error_message_record.cancel_error_action = (trade_cancel_error_message_base + 70 + 1) % 256;
  trade_cancel_error_message_record.short_sale_restriction_indicator = (trade_cancel_error_message_base + 71 + 1) % 256;
  trade_cancel_error_message_record.primary_listing_market_participant_id = (trade_cancel_error_message_base + 72 + 1) % 256;
  trade_cancel_error_message_record.financial_status_indicator = (trade_cancel_error_message_base + 73 + 1) % 256;
  ramp_consolidated_data(trade_cancel_error_message_record.consolidated_data, trade_cancel_error_message_base + 74);
  ramp_participant_data(trade_cancel_error_message_record.participant_data, trade_cancel_error_message_base + 108);
  skip
}

/* Trade Cancel Error Message to the wire, 149 bytes from where the cursor stands */
inline encode_trade_cancel_error_message(trade_cancel_error_message_record) {
  wire[at] = trade_cancel_error_message_record.participant_id; at = at + 1;
  encode_timestamp1(trade_cancel_error_message_record.timestamp_1);
  wire[at] = trade_cancel_error_message_record.message_id; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> wire[at] = trade_cancel_error_message_record.transaction_id[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.participant_reference_number[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 11 -> wire[at] = trade_cancel_error_message_record.security_symbol[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_error_message_record.instrument_type; at = at + 1;
  encode_sale_conditions(trade_cancel_error_message_record.sale_conditions);
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.trade_price[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> wire[at] = trade_cancel_error_message_record.trade_volume[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_error_message_record.sellers_sale_days; at = at + 1;
  wire[at] = trade_cancel_error_message_record.stop_stock_indicator; at = at + 1;
  wire[at] = trade_cancel_error_message_record.trade_through_exempt_indicator; at = at + 1;
  wire[at] = trade_cancel_error_message_record.trade_reporting_facility_id; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.original_participant_reference_number[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  encode_timestamp2(trade_cancel_error_message_record.timestamp_2);
  wire[at] = trade_cancel_error_message_record.cancel_error_action; at = at + 1;
  wire[at] = trade_cancel_error_message_record.short_sale_restriction_indicator; at = at + 1;
  wire[at] = trade_cancel_error_message_record.primary_listing_market_participant_id; at = at + 1;
  wire[at] = trade_cancel_error_message_record.financial_status_indicator; at = at + 1;
  encode_consolidated_data(trade_cancel_error_message_record.consolidated_data);
  encode_participant_data(trade_cancel_error_message_record.participant_data);
  skip
}

/* Trade Cancel Error Message off the wire, 149 bytes from where the cursor stands */
inline decode_trade_cancel_error_message(trade_cancel_error_message_record) {
  trade_cancel_error_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(trade_cancel_error_message_record.timestamp_1);
  trade_cancel_error_message_record.message_id = wire[at]; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.transaction_id[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.participant_reference_number[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 11 -> trade_cancel_error_message_record.security_symbol[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.instrument_type = wire[at]; at = at + 1;
  decode_sale_conditions(trade_cancel_error_message_record.sale_conditions);
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.trade_price[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.trade_volume[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.sellers_sale_days = wire[at]; at = at + 1;
  trade_cancel_error_message_record.stop_stock_indicator = wire[at]; at = at + 1;
  trade_cancel_error_message_record.trade_through_exempt_indicator = wire[at]; at = at + 1;
  trade_cancel_error_message_record.trade_reporting_facility_id = wire[at]; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.original_participant_reference_number[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  decode_timestamp2(trade_cancel_error_message_record.timestamp_2);
  trade_cancel_error_message_record.cancel_error_action = wire[at]; at = at + 1;
  trade_cancel_error_message_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  trade_cancel_error_message_record.primary_listing_market_participant_id = wire[at]; at = at + 1;
  trade_cancel_error_message_record.financial_status_indicator = wire[at]; at = at + 1;
  decode_consolidated_data(trade_cancel_error_message_record.consolidated_data);
  decode_participant_data(trade_cancel_error_message_record.participant_data);
  skip
}

/* what was read of Trade Cancel Error Message is what was written, byte for byte */
inline equal_trade_cancel_error_message(trade_cancel_error_message_read, trade_cancel_error_message_written) {
  assert(trade_cancel_error_message_read.participant_id == trade_cancel_error_message_written.participant_id);
  equal_timestamp1(trade_cancel_error_message_read.timestamp_1, trade_cancel_error_message_written.timestamp_1);
  assert(trade_cancel_error_message_read.message_id == trade_cancel_error_message_written.message_id);
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> assert(trade_cancel_error_message_read.transaction_id[trade_cancel_error_message_at] == trade_cancel_error_message_written.transaction_id[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.participant_reference_number[trade_cancel_error_message_at] == trade_cancel_error_message_written.participant_reference_number[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 11 -> assert(trade_cancel_error_message_read.security_symbol[trade_cancel_error_message_at] == trade_cancel_error_message_written.security_symbol[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_error_message_read.instrument_type == trade_cancel_error_message_written.instrument_type);
  equal_sale_conditions(trade_cancel_error_message_read.sale_conditions, trade_cancel_error_message_written.sale_conditions);
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.trade_price[trade_cancel_error_message_at] == trade_cancel_error_message_written.trade_price[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> assert(trade_cancel_error_message_read.trade_volume[trade_cancel_error_message_at] == trade_cancel_error_message_written.trade_volume[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_error_message_read.sellers_sale_days == trade_cancel_error_message_written.sellers_sale_days);
  assert(trade_cancel_error_message_read.stop_stock_indicator == trade_cancel_error_message_written.stop_stock_indicator);
  assert(trade_cancel_error_message_read.trade_through_exempt_indicator == trade_cancel_error_message_written.trade_through_exempt_indicator);
  assert(trade_cancel_error_message_read.trade_reporting_facility_id == trade_cancel_error_message_written.trade_reporting_facility_id);
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.original_participant_reference_number[trade_cancel_error_message_at] == trade_cancel_error_message_written.original_participant_reference_number[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  equal_timestamp2(trade_cancel_error_message_read.timestamp_2, trade_cancel_error_message_written.timestamp_2);
  assert(trade_cancel_error_message_read.cancel_error_action == trade_cancel_error_message_written.cancel_error_action);
  assert(trade_cancel_error_message_read.short_sale_restriction_indicator == trade_cancel_error_message_written.short_sale_restriction_indicator);
  assert(trade_cancel_error_message_read.primary_listing_market_participant_id == trade_cancel_error_message_written.primary_listing_market_participant_id);
  assert(trade_cancel_error_message_read.financial_status_indicator == trade_cancel_error_message_written.financial_status_indicator);
  equal_consolidated_data(trade_cancel_error_message_read.consolidated_data, trade_cancel_error_message_written.consolidated_data);
  equal_participant_data(trade_cancel_error_message_read.participant_data, trade_cancel_error_message_written.participant_data);
  skip
}

/* ---- Fractional Trade Cancel Error Message: 161 bytes ------------------------ */

/* The Trade Cancel/Error message is used cancel or error Cta eligible securities, Local Issues or Bond information. */
typedef FractionalTradeCancelErrorMessage {
  byte participant_id;
  Timestamp1 timestamp_1;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte security_symbol[11];
  byte instrument_type;
  SaleConditions sale_conditions;
  byte trade_price[8];
  byte fractional_trade_volume[8];
  byte sellers_sale_days;
  byte stop_stock_indicator;
  byte trade_through_exempt_indicator;
  byte trade_reporting_facility_id;
  byte original_participant_reference_number[8];
  Timestamp2 timestamp_2;
  byte cancel_error_action;
  byte short_sale_restriction_indicator;
  byte primary_listing_market_participant_id;
  byte financial_status_indicator;
  FractionalConsolidatedData fractional_consolidated_data;
  FractionalParticipantData fractional_participant_data
};

int fractional_trade_cancel_error_message_at;

/* every byte of Fractional Trade Cancel Error Message set to one value */
inline fill_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_record, fractional_trade_cancel_error_message_value) {
  fractional_trade_cancel_error_message_record.participant_id = fractional_trade_cancel_error_message_value;
  fill_timestamp1(fractional_trade_cancel_error_message_record.timestamp_1, fractional_trade_cancel_error_message_value);
  fractional_trade_cancel_error_message_record.message_id = fractional_trade_cancel_error_message_value;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 4 -> fractional_trade_cancel_error_message_record.transaction_id[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.participant_reference_number[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 11 -> fractional_trade_cancel_error_message_record.security_symbol[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_record.instrument_type = fractional_trade_cancel_error_message_value;
  fill_sale_conditions(fractional_trade_cancel_error_message_record.sale_conditions, fractional_trade_cancel_error_message_value);
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.trade_price[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.fractional_trade_volume[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_record.sellers_sale_days = fractional_trade_cancel_error_message_value;
  fractional_trade_cancel_error_message_record.stop_stock_indicator = fractional_trade_cancel_error_message_value;
  fractional_trade_cancel_error_message_record.trade_through_exempt_indicator = fractional_trade_cancel_error_message_value;
  fractional_trade_cancel_error_message_record.trade_reporting_facility_id = fractional_trade_cancel_error_message_value;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.original_participant_reference_number[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fill_timestamp2(fractional_trade_cancel_error_message_record.timestamp_2, fractional_trade_cancel_error_message_value);
  fractional_trade_cancel_error_message_record.cancel_error_action = fractional_trade_cancel_error_message_value;
  fractional_trade_cancel_error_message_record.short_sale_restriction_indicator = fractional_trade_cancel_error_message_value;
  fractional_trade_cancel_error_message_record.primary_listing_market_participant_id = fractional_trade_cancel_error_message_value;
  fractional_trade_cancel_error_message_record.financial_status_indicator = fractional_trade_cancel_error_message_value;
  fill_fractional_consolidated_data(fractional_trade_cancel_error_message_record.fractional_consolidated_data, fractional_trade_cancel_error_message_value);
  fill_fractional_participant_data(fractional_trade_cancel_error_message_record.fractional_participant_data, fractional_trade_cancel_error_message_value);
  skip
}

/* each byte of Fractional Trade Cancel Error Message set to where it lies, so a field read out of place says so */
inline ramp_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_record, fractional_trade_cancel_error_message_base) {
  fractional_trade_cancel_error_message_record.participant_id = (fractional_trade_cancel_error_message_base + 0 + 1) % 256;
  ramp_timestamp1(fractional_trade_cancel_error_message_record.timestamp_1, fractional_trade_cancel_error_message_base + 1);
  fractional_trade_cancel_error_message_record.message_id = (fractional_trade_cancel_error_message_base + 9 + 1) % 256;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 4 -> fractional_trade_cancel_error_message_record.transaction_id[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 10 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.participant_reference_number[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 14 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 11 -> fractional_trade_cancel_error_message_record.security_symbol[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 22 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_record.instrument_type = (fractional_trade_cancel_error_message_base + 33 + 1) % 256;
  ramp_sale_conditions(fractional_trade_cancel_error_message_record.sale_conditions, fractional_trade_cancel_error_message_base + 34);
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.trade_price[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 38 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.fractional_trade_volume[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 46 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_record.sellers_sale_days = (fractional_trade_cancel_error_message_base + 54 + 1) % 256;
  fractional_trade_cancel_error_message_record.stop_stock_indicator = (fractional_trade_cancel_error_message_base + 55 + 1) % 256;
  fractional_trade_cancel_error_message_record.trade_through_exempt_indicator = (fractional_trade_cancel_error_message_base + 56 + 1) % 256;
  fractional_trade_cancel_error_message_record.trade_reporting_facility_id = (fractional_trade_cancel_error_message_base + 57 + 1) % 256;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.original_participant_reference_number[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 58 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  ramp_timestamp2(fractional_trade_cancel_error_message_record.timestamp_2, fractional_trade_cancel_error_message_base + 66);
  fractional_trade_cancel_error_message_record.cancel_error_action = (fractional_trade_cancel_error_message_base + 74 + 1) % 256;
  fractional_trade_cancel_error_message_record.short_sale_restriction_indicator = (fractional_trade_cancel_error_message_base + 75 + 1) % 256;
  fractional_trade_cancel_error_message_record.primary_listing_market_participant_id = (fractional_trade_cancel_error_message_base + 76 + 1) % 256;
  fractional_trade_cancel_error_message_record.financial_status_indicator = (fractional_trade_cancel_error_message_base + 77 + 1) % 256;
  ramp_fractional_consolidated_data(fractional_trade_cancel_error_message_record.fractional_consolidated_data, fractional_trade_cancel_error_message_base + 78);
  ramp_fractional_participant_data(fractional_trade_cancel_error_message_record.fractional_participant_data, fractional_trade_cancel_error_message_base + 116);
  skip
}

/* Fractional Trade Cancel Error Message to the wire, 161 bytes from where the cursor stands */
inline encode_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_record) {
  wire[at] = fractional_trade_cancel_error_message_record.participant_id; at = at + 1;
  encode_timestamp1(fractional_trade_cancel_error_message_record.timestamp_1);
  wire[at] = fractional_trade_cancel_error_message_record.message_id; at = at + 1;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 4 -> wire[at] = fractional_trade_cancel_error_message_record.transaction_id[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> wire[at] = fractional_trade_cancel_error_message_record.participant_reference_number[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 11 -> wire[at] = fractional_trade_cancel_error_message_record.security_symbol[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_trade_cancel_error_message_record.instrument_type; at = at + 1;
  encode_sale_conditions(fractional_trade_cancel_error_message_record.sale_conditions);
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> wire[at] = fractional_trade_cancel_error_message_record.trade_price[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> wire[at] = fractional_trade_cancel_error_message_record.fractional_trade_volume[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_trade_cancel_error_message_record.sellers_sale_days; at = at + 1;
  wire[at] = fractional_trade_cancel_error_message_record.stop_stock_indicator; at = at + 1;
  wire[at] = fractional_trade_cancel_error_message_record.trade_through_exempt_indicator; at = at + 1;
  wire[at] = fractional_trade_cancel_error_message_record.trade_reporting_facility_id; at = at + 1;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> wire[at] = fractional_trade_cancel_error_message_record.original_participant_reference_number[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  encode_timestamp2(fractional_trade_cancel_error_message_record.timestamp_2);
  wire[at] = fractional_trade_cancel_error_message_record.cancel_error_action; at = at + 1;
  wire[at] = fractional_trade_cancel_error_message_record.short_sale_restriction_indicator; at = at + 1;
  wire[at] = fractional_trade_cancel_error_message_record.primary_listing_market_participant_id; at = at + 1;
  wire[at] = fractional_trade_cancel_error_message_record.financial_status_indicator; at = at + 1;
  encode_fractional_consolidated_data(fractional_trade_cancel_error_message_record.fractional_consolidated_data);
  encode_fractional_participant_data(fractional_trade_cancel_error_message_record.fractional_participant_data);
  skip
}

/* Fractional Trade Cancel Error Message off the wire, 161 bytes from where the cursor stands */
inline decode_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_record) {
  fractional_trade_cancel_error_message_record.participant_id = wire[at]; at = at + 1;
  decode_timestamp1(fractional_trade_cancel_error_message_record.timestamp_1);
  fractional_trade_cancel_error_message_record.message_id = wire[at]; at = at + 1;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 4 -> fractional_trade_cancel_error_message_record.transaction_id[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.participant_reference_number[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 11 -> fractional_trade_cancel_error_message_record.security_symbol[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_record.instrument_type = wire[at]; at = at + 1;
  decode_sale_conditions(fractional_trade_cancel_error_message_record.sale_conditions);
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.trade_price[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.fractional_trade_volume[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_record.sellers_sale_days = wire[at]; at = at + 1;
  fractional_trade_cancel_error_message_record.stop_stock_indicator = wire[at]; at = at + 1;
  fractional_trade_cancel_error_message_record.trade_through_exempt_indicator = wire[at]; at = at + 1;
  fractional_trade_cancel_error_message_record.trade_reporting_facility_id = wire[at]; at = at + 1;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.original_participant_reference_number[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  decode_timestamp2(fractional_trade_cancel_error_message_record.timestamp_2);
  fractional_trade_cancel_error_message_record.cancel_error_action = wire[at]; at = at + 1;
  fractional_trade_cancel_error_message_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  fractional_trade_cancel_error_message_record.primary_listing_market_participant_id = wire[at]; at = at + 1;
  fractional_trade_cancel_error_message_record.financial_status_indicator = wire[at]; at = at + 1;
  decode_fractional_consolidated_data(fractional_trade_cancel_error_message_record.fractional_consolidated_data);
  decode_fractional_participant_data(fractional_trade_cancel_error_message_record.fractional_participant_data);
  skip
}

/* what was read of Fractional Trade Cancel Error Message is what was written, byte for byte */
inline equal_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_read, fractional_trade_cancel_error_message_written) {
  assert(fractional_trade_cancel_error_message_read.participant_id == fractional_trade_cancel_error_message_written.participant_id);
  equal_timestamp1(fractional_trade_cancel_error_message_read.timestamp_1, fractional_trade_cancel_error_message_written.timestamp_1);
  assert(fractional_trade_cancel_error_message_read.message_id == fractional_trade_cancel_error_message_written.message_id);
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 4 -> assert(fractional_trade_cancel_error_message_read.transaction_id[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.transaction_id[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> assert(fractional_trade_cancel_error_message_read.participant_reference_number[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.participant_reference_number[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 11 -> assert(fractional_trade_cancel_error_message_read.security_symbol[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.security_symbol[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(fractional_trade_cancel_error_message_read.instrument_type == fractional_trade_cancel_error_message_written.instrument_type);
  equal_sale_conditions(fractional_trade_cancel_error_message_read.sale_conditions, fractional_trade_cancel_error_message_written.sale_conditions);
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> assert(fractional_trade_cancel_error_message_read.trade_price[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.trade_price[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> assert(fractional_trade_cancel_error_message_read.fractional_trade_volume[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.fractional_trade_volume[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(fractional_trade_cancel_error_message_read.sellers_sale_days == fractional_trade_cancel_error_message_written.sellers_sale_days);
  assert(fractional_trade_cancel_error_message_read.stop_stock_indicator == fractional_trade_cancel_error_message_written.stop_stock_indicator);
  assert(fractional_trade_cancel_error_message_read.trade_through_exempt_indicator == fractional_trade_cancel_error_message_written.trade_through_exempt_indicator);
  assert(fractional_trade_cancel_error_message_read.trade_reporting_facility_id == fractional_trade_cancel_error_message_written.trade_reporting_facility_id);
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> assert(fractional_trade_cancel_error_message_read.original_participant_reference_number[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.original_participant_reference_number[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  equal_timestamp2(fractional_trade_cancel_error_message_read.timestamp_2, fractional_trade_cancel_error_message_written.timestamp_2);
  assert(fractional_trade_cancel_error_message_read.cancel_error_action == fractional_trade_cancel_error_message_written.cancel_error_action);
  assert(fractional_trade_cancel_error_message_read.short_sale_restriction_indicator == fractional_trade_cancel_error_message_written.short_sale_restriction_indicator);
  assert(fractional_trade_cancel_error_message_read.primary_listing_market_participant_id == fractional_trade_cancel_error_message_written.primary_listing_market_participant_id);
  assert(fractional_trade_cancel_error_message_read.financial_status_indicator == fractional_trade_cancel_error_message_written.financial_status_indicator);
  equal_fractional_consolidated_data(fractional_trade_cancel_error_message_read.fractional_consolidated_data, fractional_trade_cancel_error_message_written.fractional_consolidated_data);
  equal_fractional_participant_data(fractional_trade_cancel_error_message_read.fractional_participant_data, fractional_trade_cancel_error_message_written.fractional_participant_data);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Sip Block Timestamp: encoded, read back, and compared */
proctype check_sip_block_timestamp() {
  SipBlockTimestamp sip_block_timestamp_sent;
  SipBlockTimestamp sip_block_timestamp_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sip_block_timestamp(sip_block_timestamp_sent, 0)
  :: pattern == 1 -> fill_sip_block_timestamp(sip_block_timestamp_sent, 32)
  :: pattern == 2 -> fill_sip_block_timestamp(sip_block_timestamp_sent, 255)
  :: else -> ramp_sip_block_timestamp(sip_block_timestamp_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sip_block_timestamp(sip_block_timestamp_sent);
    assert(at == 8);
    at = 0;
    decode_sip_block_timestamp(sip_block_timestamp_got);
    assert(at == 8);
    equal_sip_block_timestamp(sip_block_timestamp_got, sip_block_timestamp_sent)
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
    assert(at == 20);
    at = 0;
    decode_block_header(block_header_got);
    assert(at == 20);
    equal_block_header(block_header_got, block_header_sent)
  }
}

/* Timestamp 1: encoded, read back, and compared */
proctype check_timestamp1() {
  Timestamp1 timestamp1_sent;
  Timestamp1 timestamp1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_timestamp1(timestamp1_sent, 0)
  :: pattern == 1 -> fill_timestamp1(timestamp1_sent, 32)
  :: pattern == 2 -> fill_timestamp1(timestamp1_sent, 255)
  :: else -> ramp_timestamp1(timestamp1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_timestamp1(timestamp1_sent);
    assert(at == 8);
    at = 0;
    decode_timestamp1(timestamp1_got);
    assert(at == 8);
    equal_timestamp1(timestamp1_got, timestamp1_sent)
  }
}

/* Start Of End Of Day Summary Message: encoded, read back, and compared */
proctype check_start_of_end_of_day_summary_message() {
  StartOfEndOfDaySummaryMessage start_of_end_of_day_summary_message_sent;
  StartOfEndOfDaySummaryMessage start_of_end_of_day_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_start_of_end_of_day_summary_message(start_of_end_of_day_summary_message_sent, 0)
  :: pattern == 1 -> fill_start_of_end_of_day_summary_message(start_of_end_of_day_summary_message_sent, 32)
  :: pattern == 2 -> fill_start_of_end_of_day_summary_message(start_of_end_of_day_summary_message_sent, 255)
  :: else -> ramp_start_of_end_of_day_summary_message(start_of_end_of_day_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_start_of_end_of_day_summary_message(start_of_end_of_day_summary_message_sent);
    assert(at == 22);
    at = 0;
    decode_start_of_end_of_day_summary_message(start_of_end_of_day_summary_message_got);
    assert(at == 22);
    equal_start_of_end_of_day_summary_message(start_of_end_of_day_summary_message_got, start_of_end_of_day_summary_message_sent)
  }
}

/* End Of End Of Day Summary Message: encoded, read back, and compared */
proctype check_end_of_end_of_day_summary_message() {
  EndOfEndOfDaySummaryMessage end_of_end_of_day_summary_message_sent;
  EndOfEndOfDaySummaryMessage end_of_end_of_day_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_end_of_day_summary_message(end_of_end_of_day_summary_message_sent, 0)
  :: pattern == 1 -> fill_end_of_end_of_day_summary_message(end_of_end_of_day_summary_message_sent, 32)
  :: pattern == 2 -> fill_end_of_end_of_day_summary_message(end_of_end_of_day_summary_message_sent, 255)
  :: else -> ramp_end_of_end_of_day_summary_message(end_of_end_of_day_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_end_of_day_summary_message(end_of_end_of_day_summary_message_sent);
    assert(at == 22);
    at = 0;
    decode_end_of_end_of_day_summary_message(end_of_end_of_day_summary_message_got);
    assert(at == 22);
    equal_end_of_end_of_day_summary_message(end_of_end_of_day_summary_message_got, end_of_end_of_day_summary_message_sent)
  }
}

/* Start Of Start Of Day Summary Message: encoded, read back, and compared */
proctype check_start_of_start_of_day_summary_message() {
  StartOfStartOfDaySummaryMessage start_of_start_of_day_summary_message_sent;
  StartOfStartOfDaySummaryMessage start_of_start_of_day_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_start_of_start_of_day_summary_message(start_of_start_of_day_summary_message_sent, 0)
  :: pattern == 1 -> fill_start_of_start_of_day_summary_message(start_of_start_of_day_summary_message_sent, 32)
  :: pattern == 2 -> fill_start_of_start_of_day_summary_message(start_of_start_of_day_summary_message_sent, 255)
  :: else -> ramp_start_of_start_of_day_summary_message(start_of_start_of_day_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_start_of_start_of_day_summary_message(start_of_start_of_day_summary_message_sent);
    assert(at == 22);
    at = 0;
    decode_start_of_start_of_day_summary_message(start_of_start_of_day_summary_message_got);
    assert(at == 22);
    equal_start_of_start_of_day_summary_message(start_of_start_of_day_summary_message_got, start_of_start_of_day_summary_message_sent)
  }
}

/* End Of Start Of Day Summary Message: encoded, read back, and compared */
proctype check_end_of_start_of_day_summary_message() {
  EndOfStartOfDaySummaryMessage end_of_start_of_day_summary_message_sent;
  EndOfStartOfDaySummaryMessage end_of_start_of_day_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_start_of_day_summary_message(end_of_start_of_day_summary_message_sent, 0)
  :: pattern == 1 -> fill_end_of_start_of_day_summary_message(end_of_start_of_day_summary_message_sent, 32)
  :: pattern == 2 -> fill_end_of_start_of_day_summary_message(end_of_start_of_day_summary_message_sent, 255)
  :: else -> ramp_end_of_start_of_day_summary_message(end_of_start_of_day_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_start_of_day_summary_message(end_of_start_of_day_summary_message_sent);
    assert(at == 22);
    at = 0;
    decode_end_of_start_of_day_summary_message(end_of_start_of_day_summary_message_got);
    assert(at == 22);
    equal_end_of_start_of_day_summary_message(end_of_start_of_day_summary_message_got, end_of_start_of_day_summary_message_sent)
  }
}

/* Start Of Day Message: encoded, read back, and compared */
proctype check_start_of_day_message() {
  StartOfDayMessage start_of_day_message_sent;
  StartOfDayMessage start_of_day_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_start_of_day_message(start_of_day_message_sent, 0)
  :: pattern == 1 -> fill_start_of_day_message(start_of_day_message_sent, 32)
  :: pattern == 2 -> fill_start_of_day_message(start_of_day_message_sent, 255)
  :: else -> ramp_start_of_day_message(start_of_day_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_start_of_day_message(start_of_day_message_sent);
    assert(at == 22);
    at = 0;
    decode_start_of_day_message(start_of_day_message_got);
    assert(at == 22);
    equal_start_of_day_message(start_of_day_message_got, start_of_day_message_sent)
  }
}

/* Reset Block Sequence Number Message: encoded, read back, and compared */
proctype check_reset_block_sequence_number_message() {
  ResetBlockSequenceNumberMessage reset_block_sequence_number_message_sent;
  ResetBlockSequenceNumberMessage reset_block_sequence_number_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reset_block_sequence_number_message(reset_block_sequence_number_message_sent, 0)
  :: pattern == 1 -> fill_reset_block_sequence_number_message(reset_block_sequence_number_message_sent, 32)
  :: pattern == 2 -> fill_reset_block_sequence_number_message(reset_block_sequence_number_message_sent, 255)
  :: else -> ramp_reset_block_sequence_number_message(reset_block_sequence_number_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reset_block_sequence_number_message(reset_block_sequence_number_message_sent);
    assert(at == 22);
    at = 0;
    decode_reset_block_sequence_number_message(reset_block_sequence_number_message_got);
    assert(at == 22);
    equal_reset_block_sequence_number_message(reset_block_sequence_number_message_got, reset_block_sequence_number_message_sent)
  }
}

/* Disaster Recovery Data Center Activation Message: encoded, read back, and compared */
proctype check_disaster_recovery_data_center_activation_message() {
  DisasterRecoveryDataCenterActivationMessage disaster_recovery_data_center_activation_message_sent;
  DisasterRecoveryDataCenterActivationMessage disaster_recovery_data_center_activation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_sent, 0)
  :: pattern == 1 -> fill_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_sent, 32)
  :: pattern == 2 -> fill_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_sent, 255)
  :: else -> ramp_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_sent);
    assert(at == 22);
    at = 0;
    decode_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_got);
    assert(at == 22);
    equal_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_got, disaster_recovery_data_center_activation_message_sent)
  }
}

/* Line Integrity Message: encoded, read back, and compared */
proctype check_line_integrity_message() {
  LineIntegrityMessage line_integrity_message_sent;
  LineIntegrityMessage line_integrity_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_line_integrity_message(line_integrity_message_sent, 0)
  :: pattern == 1 -> fill_line_integrity_message(line_integrity_message_sent, 32)
  :: pattern == 2 -> fill_line_integrity_message(line_integrity_message_sent, 255)
  :: else -> ramp_line_integrity_message(line_integrity_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_line_integrity_message(line_integrity_message_sent);
    assert(at == 22);
    at = 0;
    decode_line_integrity_message(line_integrity_message_got);
    assert(at == 22);
    equal_line_integrity_message(line_integrity_message_got, line_integrity_message_sent)
  }
}

/* End Of Day Message: encoded, read back, and compared */
proctype check_end_of_day_message() {
  EndOfDayMessage end_of_day_message_sent;
  EndOfDayMessage end_of_day_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_day_message(end_of_day_message_sent, 0)
  :: pattern == 1 -> fill_end_of_day_message(end_of_day_message_sent, 32)
  :: pattern == 2 -> fill_end_of_day_message(end_of_day_message_sent, 255)
  :: else -> ramp_end_of_day_message(end_of_day_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_day_message(end_of_day_message_sent);
    assert(at == 22);
    at = 0;
    decode_end_of_day_message(end_of_day_message_got);
    assert(at == 22);
    equal_end_of_day_message(end_of_day_message_got, end_of_day_message_sent)
  }
}

/* Index Message: encoded, read back, and compared */
proctype check_index_message() {
  IndexMessage index_message_sent;
  IndexMessage index_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_message(index_message_sent, 0)
  :: pattern == 1 -> fill_index_message(index_message_sent, 32)
  :: pattern == 2 -> fill_index_message(index_message_sent, 255)
  :: else -> ramp_index_message(index_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_message(index_message_sent);
    assert(at == 41);
    at = 0;
    decode_index_message(index_message_got);
    assert(at == 41);
    equal_index_message(index_message_got, index_message_sent)
  }
}

/* Bid And Offer Index Message: encoded, read back, and compared */
proctype check_bid_and_offer_index_message() {
  BidAndOfferIndexMessage bid_and_offer_index_message_sent;
  BidAndOfferIndexMessage bid_and_offer_index_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bid_and_offer_index_message(bid_and_offer_index_message_sent, 0)
  :: pattern == 1 -> fill_bid_and_offer_index_message(bid_and_offer_index_message_sent, 32)
  :: pattern == 2 -> fill_bid_and_offer_index_message(bid_and_offer_index_message_sent, 255)
  :: else -> ramp_bid_and_offer_index_message(bid_and_offer_index_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bid_and_offer_index_message(bid_and_offer_index_message_sent);
    assert(at == 49);
    at = 0;
    decode_bid_and_offer_index_message(bid_and_offer_index_message_got);
    assert(at == 49);
    equal_bid_and_offer_index_message(bid_and_offer_index_message_got, bid_and_offer_index_message_sent)
  }
}

/* Market Wide Circuit Breaker Decline Level Status Message: encoded, read back, and compared */
proctype check_market_wide_circuit_breaker_decline_level_status_message() {
  MarketWideCircuitBreakerDeclineLevelStatusMessage market_wide_circuit_breaker_decline_level_status_message_sent;
  MarketWideCircuitBreakerDeclineLevelStatusMessage market_wide_circuit_breaker_decline_level_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_sent, 0)
  :: pattern == 1 -> fill_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_sent, 32)
  :: pattern == 2 -> fill_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_sent, 255)
  :: else -> ramp_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_sent);
    assert(at == 47);
    at = 0;
    decode_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_got);
    assert(at == 47);
    equal_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_got, market_wide_circuit_breaker_decline_level_status_message_sent)
  }
}

/* Market Wide Circuit Breaker Status Message: encoded, read back, and compared */
proctype check_market_wide_circuit_breaker_status_message() {
  MarketWideCircuitBreakerStatusMessage market_wide_circuit_breaker_status_message_sent;
  MarketWideCircuitBreakerStatusMessage market_wide_circuit_breaker_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_sent, 0)
  :: pattern == 1 -> fill_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_sent, 32)
  :: pattern == 2 -> fill_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_sent, 255)
  :: else -> ramp_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_sent);
    assert(at == 24);
    at = 0;
    decode_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_got);
    assert(at == 24);
    equal_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_got, market_wide_circuit_breaker_status_message_sent)
  }
}

/* Approximate Trades And Total Dollar Value Message: encoded, read back, and compared */
proctype check_approximate_trades_and_total_dollar_value_message() {
  ApproximateTradesAndTotalDollarValueMessage approximate_trades_and_total_dollar_value_message_sent;
  ApproximateTradesAndTotalDollarValueMessage approximate_trades_and_total_dollar_value_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_approximate_trades_and_total_dollar_value_message(approximate_trades_and_total_dollar_value_message_sent, 0)
  :: pattern == 1 -> fill_approximate_trades_and_total_dollar_value_message(approximate_trades_and_total_dollar_value_message_sent, 32)
  :: pattern == 2 -> fill_approximate_trades_and_total_dollar_value_message(approximate_trades_and_total_dollar_value_message_sent, 255)
  :: else -> ramp_approximate_trades_and_total_dollar_value_message(approximate_trades_and_total_dollar_value_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_approximate_trades_and_total_dollar_value_message(approximate_trades_and_total_dollar_value_message_sent);
    assert(at == 34);
    at = 0;
    decode_approximate_trades_and_total_dollar_value_message(approximate_trades_and_total_dollar_value_message_got);
    assert(at == 34);
    equal_approximate_trades_and_total_dollar_value_message(approximate_trades_and_total_dollar_value_message_got, approximate_trades_and_total_dollar_value_message_sent)
  }
}

/* Crossing Session Summary Message: encoded, read back, and compared */
proctype check_crossing_session_summary_message() {
  CrossingSessionSummaryMessage crossing_session_summary_message_sent;
  CrossingSessionSummaryMessage crossing_session_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_crossing_session_summary_message(crossing_session_summary_message_sent, 0)
  :: pattern == 1 -> fill_crossing_session_summary_message(crossing_session_summary_message_sent, 32)
  :: pattern == 2 -> fill_crossing_session_summary_message(crossing_session_summary_message_sent, 255)
  :: else -> ramp_crossing_session_summary_message(crossing_session_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_crossing_session_summary_message(crossing_session_summary_message_sent);
    assert(at == 46);
    at = 0;
    decode_crossing_session_summary_message(crossing_session_summary_message_got);
    assert(at == 46);
    equal_crossing_session_summary_message(crossing_session_summary_message_got, crossing_session_summary_message_sent)
  }
}

/* Sale Conditions: encoded, read back, and compared */
proctype check_sale_conditions() {
  SaleConditions sale_conditions_sent;
  SaleConditions sale_conditions_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sale_conditions(sale_conditions_sent, 0)
  :: pattern == 1 -> fill_sale_conditions(sale_conditions_sent, 32)
  :: pattern == 2 -> fill_sale_conditions(sale_conditions_sent, 255)
  :: else -> ramp_sale_conditions(sale_conditions_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sale_conditions(sale_conditions_sent);
    assert(at == 4);
    at = 0;
    decode_sale_conditions(sale_conditions_got);
    assert(at == 4);
    equal_sale_conditions(sale_conditions_got, sale_conditions_sent)
  }
}

/* Prior Day Trade Date And Time: encoded, read back, and compared */
proctype check_prior_day_trade_date_and_time() {
  PriorDayTradeDateAndTime prior_day_trade_date_and_time_sent;
  PriorDayTradeDateAndTime prior_day_trade_date_and_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_prior_day_trade_date_and_time(prior_day_trade_date_and_time_sent, 0)
  :: pattern == 1 -> fill_prior_day_trade_date_and_time(prior_day_trade_date_and_time_sent, 32)
  :: pattern == 2 -> fill_prior_day_trade_date_and_time(prior_day_trade_date_and_time_sent, 255)
  :: else -> ramp_prior_day_trade_date_and_time(prior_day_trade_date_and_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_prior_day_trade_date_and_time(prior_day_trade_date_and_time_sent);
    assert(at == 8);
    at = 0;
    decode_prior_day_trade_date_and_time(prior_day_trade_date_and_time_got);
    assert(at == 8);
    equal_prior_day_trade_date_and_time(prior_day_trade_date_and_time_got, prior_day_trade_date_and_time_sent)
  }
}

/* Prior Day Corrected Trade: encoded, read back, and compared */
proctype check_prior_day_corrected_trade() {
  PriorDayCorrectedTrade prior_day_corrected_trade_sent;
  PriorDayCorrectedTrade prior_day_corrected_trade_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_prior_day_corrected_trade(prior_day_corrected_trade_sent, 0)
  :: pattern == 1 -> fill_prior_day_corrected_trade(prior_day_corrected_trade_sent, 32)
  :: pattern == 2 -> fill_prior_day_corrected_trade(prior_day_corrected_trade_sent, 255)
  :: else -> ramp_prior_day_corrected_trade(prior_day_corrected_trade_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_prior_day_corrected_trade(prior_day_corrected_trade_sent);
    assert(at == 28);
    at = 0;
    decode_prior_day_corrected_trade(prior_day_corrected_trade_got);
    assert(at == 28);
    equal_prior_day_corrected_trade(prior_day_corrected_trade_got, prior_day_corrected_trade_sent)
  }
}

/* Prior Day Original Trade: encoded, read back, and compared */
proctype check_prior_day_original_trade() {
  PriorDayOriginalTrade prior_day_original_trade_sent;
  PriorDayOriginalTrade prior_day_original_trade_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_prior_day_original_trade(prior_day_original_trade_sent, 0)
  :: pattern == 1 -> fill_prior_day_original_trade(prior_day_original_trade_sent, 32)
  :: pattern == 2 -> fill_prior_day_original_trade(prior_day_original_trade_sent, 255)
  :: else -> ramp_prior_day_original_trade(prior_day_original_trade_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_prior_day_original_trade(prior_day_original_trade_sent);
    assert(at == 28);
    at = 0;
    decode_prior_day_original_trade(prior_day_original_trade_got);
    assert(at == 28);
    equal_prior_day_original_trade(prior_day_original_trade_got, prior_day_original_trade_sent)
  }
}

/* Prior Day Trade Correction Message: encoded, read back, and compared */
proctype check_prior_day_trade_correction_message() {
  PriorDayTradeCorrectionMessage prior_day_trade_correction_message_sent;
  PriorDayTradeCorrectionMessage prior_day_trade_correction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_prior_day_trade_correction_message(prior_day_trade_correction_message_sent, 0)
  :: pattern == 1 -> fill_prior_day_trade_correction_message(prior_day_trade_correction_message_sent, 32)
  :: pattern == 2 -> fill_prior_day_trade_correction_message(prior_day_trade_correction_message_sent, 255)
  :: else -> ramp_prior_day_trade_correction_message(prior_day_trade_correction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_prior_day_trade_correction_message(prior_day_trade_correction_message_sent);
    assert(at == 91);
    at = 0;
    decode_prior_day_trade_correction_message(prior_day_trade_correction_message_got);
    assert(at == 91);
    equal_prior_day_trade_correction_message(prior_day_trade_correction_message_got, prior_day_trade_correction_message_sent)
  }
}

/* Fractional Prior Day Corrected Trade: encoded, read back, and compared */
proctype check_fractional_prior_day_corrected_trade() {
  FractionalPriorDayCorrectedTrade fractional_prior_day_corrected_trade_sent;
  FractionalPriorDayCorrectedTrade fractional_prior_day_corrected_trade_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fractional_prior_day_corrected_trade(fractional_prior_day_corrected_trade_sent, 0)
  :: pattern == 1 -> fill_fractional_prior_day_corrected_trade(fractional_prior_day_corrected_trade_sent, 32)
  :: pattern == 2 -> fill_fractional_prior_day_corrected_trade(fractional_prior_day_corrected_trade_sent, 255)
  :: else -> ramp_fractional_prior_day_corrected_trade(fractional_prior_day_corrected_trade_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fractional_prior_day_corrected_trade(fractional_prior_day_corrected_trade_sent);
    assert(at == 32);
    at = 0;
    decode_fractional_prior_day_corrected_trade(fractional_prior_day_corrected_trade_got);
    assert(at == 32);
    equal_fractional_prior_day_corrected_trade(fractional_prior_day_corrected_trade_got, fractional_prior_day_corrected_trade_sent)
  }
}

/* Fractional Prior Day Original Trade: encoded, read back, and compared */
proctype check_fractional_prior_day_original_trade() {
  FractionalPriorDayOriginalTrade fractional_prior_day_original_trade_sent;
  FractionalPriorDayOriginalTrade fractional_prior_day_original_trade_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fractional_prior_day_original_trade(fractional_prior_day_original_trade_sent, 0)
  :: pattern == 1 -> fill_fractional_prior_day_original_trade(fractional_prior_day_original_trade_sent, 32)
  :: pattern == 2 -> fill_fractional_prior_day_original_trade(fractional_prior_day_original_trade_sent, 255)
  :: else -> ramp_fractional_prior_day_original_trade(fractional_prior_day_original_trade_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fractional_prior_day_original_trade(fractional_prior_day_original_trade_sent);
    assert(at == 32);
    at = 0;
    decode_fractional_prior_day_original_trade(fractional_prior_day_original_trade_got);
    assert(at == 32);
    equal_fractional_prior_day_original_trade(fractional_prior_day_original_trade_got, fractional_prior_day_original_trade_sent)
  }
}

/* Fractional Prior Day Trade Correction Message: encoded, read back, and compared */
proctype check_fractional_prior_day_trade_correction_message() {
  FractionalPriorDayTradeCorrectionMessage fractional_prior_day_trade_correction_message_sent;
  FractionalPriorDayTradeCorrectionMessage fractional_prior_day_trade_correction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fractional_prior_day_trade_correction_message(fractional_prior_day_trade_correction_message_sent, 0)
  :: pattern == 1 -> fill_fractional_prior_day_trade_correction_message(fractional_prior_day_trade_correction_message_sent, 32)
  :: pattern == 2 -> fill_fractional_prior_day_trade_correction_message(fractional_prior_day_trade_correction_message_sent, 255)
  :: else -> ramp_fractional_prior_day_trade_correction_message(fractional_prior_day_trade_correction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fractional_prior_day_trade_correction_message(fractional_prior_day_trade_correction_message_sent);
    assert(at == 99);
    at = 0;
    decode_fractional_prior_day_trade_correction_message(fractional_prior_day_trade_correction_message_got);
    assert(at == 99);
    equal_fractional_prior_day_trade_correction_message(fractional_prior_day_trade_correction_message_got, fractional_prior_day_trade_correction_message_sent)
  }
}

/* Prior Day Trade Message: encoded, read back, and compared */
proctype check_prior_day_trade_message() {
  PriorDayTradeMessage prior_day_trade_message_sent;
  PriorDayTradeMessage prior_day_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_prior_day_trade_message(prior_day_trade_message_sent, 0)
  :: pattern == 1 -> fill_prior_day_trade_message(prior_day_trade_message_sent, 32)
  :: pattern == 2 -> fill_prior_day_trade_message(prior_day_trade_message_sent, 255)
  :: else -> ramp_prior_day_trade_message(prior_day_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_prior_day_trade_message(prior_day_trade_message_sent);
    assert(at == 63);
    at = 0;
    decode_prior_day_trade_message(prior_day_trade_message_got);
    assert(at == 63);
    equal_prior_day_trade_message(prior_day_trade_message_got, prior_day_trade_message_sent)
  }
}

/* Fractional Prior Day Trade Message: encoded, read back, and compared */
proctype check_fractional_prior_day_trade_message() {
  FractionalPriorDayTradeMessage fractional_prior_day_trade_message_sent;
  FractionalPriorDayTradeMessage fractional_prior_day_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fractional_prior_day_trade_message(fractional_prior_day_trade_message_sent, 0)
  :: pattern == 1 -> fill_fractional_prior_day_trade_message(fractional_prior_day_trade_message_sent, 32)
  :: pattern == 2 -> fill_fractional_prior_day_trade_message(fractional_prior_day_trade_message_sent, 255)
  :: else -> ramp_fractional_prior_day_trade_message(fractional_prior_day_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fractional_prior_day_trade_message(fractional_prior_day_trade_message_sent);
    assert(at == 67);
    at = 0;
    decode_fractional_prior_day_trade_message(fractional_prior_day_trade_message_got);
    assert(at == 67);
    equal_fractional_prior_day_trade_message(fractional_prior_day_trade_message_got, fractional_prior_day_trade_message_sent)
  }
}

/* Prior Day Trade Cancel Error Message: encoded, read back, and compared */
proctype check_prior_day_trade_cancel_error_message() {
  PriorDayTradeCancelErrorMessage prior_day_trade_cancel_error_message_sent;
  PriorDayTradeCancelErrorMessage prior_day_trade_cancel_error_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_prior_day_trade_cancel_error_message(prior_day_trade_cancel_error_message_sent, 0)
  :: pattern == 1 -> fill_prior_day_trade_cancel_error_message(prior_day_trade_cancel_error_message_sent, 32)
  :: pattern == 2 -> fill_prior_day_trade_cancel_error_message(prior_day_trade_cancel_error_message_sent, 255)
  :: else -> ramp_prior_day_trade_cancel_error_message(prior_day_trade_cancel_error_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_prior_day_trade_cancel_error_message(prior_day_trade_cancel_error_message_sent);
    assert(at == 64);
    at = 0;
    decode_prior_day_trade_cancel_error_message(prior_day_trade_cancel_error_message_got);
    assert(at == 64);
    equal_prior_day_trade_cancel_error_message(prior_day_trade_cancel_error_message_got, prior_day_trade_cancel_error_message_sent)
  }
}

/* Fractional Prior Day Trade Cancel Error Message: encoded, read back, and compared */
proctype check_fractional_prior_day_trade_cancel_error_message() {
  FractionalPriorDayTradeCancelErrorMessage fractional_prior_day_trade_cancel_error_message_sent;
  FractionalPriorDayTradeCancelErrorMessage fractional_prior_day_trade_cancel_error_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fractional_prior_day_trade_cancel_error_message(fractional_prior_day_trade_cancel_error_message_sent, 0)
  :: pattern == 1 -> fill_fractional_prior_day_trade_cancel_error_message(fractional_prior_day_trade_cancel_error_message_sent, 32)
  :: pattern == 2 -> fill_fractional_prior_day_trade_cancel_error_message(fractional_prior_day_trade_cancel_error_message_sent, 255)
  :: else -> ramp_fractional_prior_day_trade_cancel_error_message(fractional_prior_day_trade_cancel_error_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fractional_prior_day_trade_cancel_error_message(fractional_prior_day_trade_cancel_error_message_sent);
    assert(at == 68);
    at = 0;
    decode_fractional_prior_day_trade_cancel_error_message(fractional_prior_day_trade_cancel_error_message_got);
    assert(at == 68);
    equal_fractional_prior_day_trade_cancel_error_message(fractional_prior_day_trade_cancel_error_message_got, fractional_prior_day_trade_cancel_error_message_sent)
  }
}

/* Consolidated Start Of Day Summary Message: encoded, read back, and compared */
proctype check_consolidated_start_of_day_summary_message() {
  ConsolidatedStartOfDaySummaryMessage consolidated_start_of_day_summary_message_sent;
  ConsolidatedStartOfDaySummaryMessage consolidated_start_of_day_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_consolidated_start_of_day_summary_message(consolidated_start_of_day_summary_message_sent, 0)
  :: pattern == 1 -> fill_consolidated_start_of_day_summary_message(consolidated_start_of_day_summary_message_sent, 32)
  :: pattern == 2 -> fill_consolidated_start_of_day_summary_message(consolidated_start_of_day_summary_message_sent, 255)
  :: else -> ramp_consolidated_start_of_day_summary_message(consolidated_start_of_day_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_consolidated_start_of_day_summary_message(consolidated_start_of_day_summary_message_sent);
    assert(at == 51);
    at = 0;
    decode_consolidated_start_of_day_summary_message(consolidated_start_of_day_summary_message_got);
    assert(at == 51);
    equal_consolidated_start_of_day_summary_message(consolidated_start_of_day_summary_message_got, consolidated_start_of_day_summary_message_sent)
  }
}

/* Participant Start Of Day Summary Message: encoded, read back, and compared */
proctype check_participant_start_of_day_summary_message() {
  ParticipantStartOfDaySummaryMessage participant_start_of_day_summary_message_sent;
  ParticipantStartOfDaySummaryMessage participant_start_of_day_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_participant_start_of_day_summary_message(participant_start_of_day_summary_message_sent, 0)
  :: pattern == 1 -> fill_participant_start_of_day_summary_message(participant_start_of_day_summary_message_sent, 32)
  :: pattern == 2 -> fill_participant_start_of_day_summary_message(participant_start_of_day_summary_message_sent, 255)
  :: else -> ramp_participant_start_of_day_summary_message(participant_start_of_day_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_participant_start_of_day_summary_message(participant_start_of_day_summary_message_sent);
    assert(at == 47);
    at = 0;
    decode_participant_start_of_day_summary_message(participant_start_of_day_summary_message_got);
    assert(at == 47);
    equal_participant_start_of_day_summary_message(participant_start_of_day_summary_message_got, participant_start_of_day_summary_message_sent)
  }
}

/* Consolidated End Of Day Summary Message: encoded, read back, and compared */
proctype check_consolidated_end_of_day_summary_message() {
  ConsolidatedEndOfDaySummaryMessage consolidated_end_of_day_summary_message_sent;
  ConsolidatedEndOfDaySummaryMessage consolidated_end_of_day_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_consolidated_end_of_day_summary_message(consolidated_end_of_day_summary_message_sent, 0)
  :: pattern == 1 -> fill_consolidated_end_of_day_summary_message(consolidated_end_of_day_summary_message_sent, 32)
  :: pattern == 2 -> fill_consolidated_end_of_day_summary_message(consolidated_end_of_day_summary_message_sent, 255)
  :: else -> ramp_consolidated_end_of_day_summary_message(consolidated_end_of_day_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_consolidated_end_of_day_summary_message(consolidated_end_of_day_summary_message_sent);
    assert(at == 75);
    at = 0;
    decode_consolidated_end_of_day_summary_message(consolidated_end_of_day_summary_message_got);
    assert(at == 75);
    equal_consolidated_end_of_day_summary_message(consolidated_end_of_day_summary_message_got, consolidated_end_of_day_summary_message_sent)
  }
}

/* Fractional Consolidated End Of Day Summary Message: encoded, read back, and compared */
proctype check_fractional_consolidated_end_of_day_summary_message() {
  FractionalConsolidatedEndOfDaySummaryMessage fractional_consolidated_end_of_day_summary_message_sent;
  FractionalConsolidatedEndOfDaySummaryMessage fractional_consolidated_end_of_day_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fractional_consolidated_end_of_day_summary_message(fractional_consolidated_end_of_day_summary_message_sent, 0)
  :: pattern == 1 -> fill_fractional_consolidated_end_of_day_summary_message(fractional_consolidated_end_of_day_summary_message_sent, 32)
  :: pattern == 2 -> fill_fractional_consolidated_end_of_day_summary_message(fractional_consolidated_end_of_day_summary_message_sent, 255)
  :: else -> ramp_fractional_consolidated_end_of_day_summary_message(fractional_consolidated_end_of_day_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fractional_consolidated_end_of_day_summary_message(fractional_consolidated_end_of_day_summary_message_sent);
    assert(at == 75);
    at = 0;
    decode_fractional_consolidated_end_of_day_summary_message(fractional_consolidated_end_of_day_summary_message_got);
    assert(at == 75);
    equal_fractional_consolidated_end_of_day_summary_message(fractional_consolidated_end_of_day_summary_message_got, fractional_consolidated_end_of_day_summary_message_sent)
  }
}

/* Participant End Of Day Summary Message: encoded, read back, and compared */
proctype check_participant_end_of_day_summary_message() {
  ParticipantEndOfDaySummaryMessage participant_end_of_day_summary_message_sent;
  ParticipantEndOfDaySummaryMessage participant_end_of_day_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_participant_end_of_day_summary_message(participant_end_of_day_summary_message_sent, 0)
  :: pattern == 1 -> fill_participant_end_of_day_summary_message(participant_end_of_day_summary_message_sent, 32)
  :: pattern == 2 -> fill_participant_end_of_day_summary_message(participant_end_of_day_summary_message_sent, 255)
  :: else -> ramp_participant_end_of_day_summary_message(participant_end_of_day_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_participant_end_of_day_summary_message(participant_end_of_day_summary_message_sent);
    assert(at == 80);
    at = 0;
    decode_participant_end_of_day_summary_message(participant_end_of_day_summary_message_got);
    assert(at == 80);
    equal_participant_end_of_day_summary_message(participant_end_of_day_summary_message_got, participant_end_of_day_summary_message_sent)
  }
}

/* Fractional Participant End Of Day Summary Message: encoded, read back, and compared */
proctype check_fractional_participant_end_of_day_summary_message() {
  FractionalParticipantEndOfDaySummaryMessage fractional_participant_end_of_day_summary_message_sent;
  FractionalParticipantEndOfDaySummaryMessage fractional_participant_end_of_day_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fractional_participant_end_of_day_summary_message(fractional_participant_end_of_day_summary_message_sent, 0)
  :: pattern == 1 -> fill_fractional_participant_end_of_day_summary_message(fractional_participant_end_of_day_summary_message_sent, 32)
  :: pattern == 2 -> fill_fractional_participant_end_of_day_summary_message(fractional_participant_end_of_day_summary_message_sent, 255)
  :: else -> ramp_fractional_participant_end_of_day_summary_message(fractional_participant_end_of_day_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fractional_participant_end_of_day_summary_message(fractional_participant_end_of_day_summary_message_sent);
    assert(at == 80);
    at = 0;
    decode_fractional_participant_end_of_day_summary_message(fractional_participant_end_of_day_summary_message_got);
    assert(at == 80);
    equal_fractional_participant_end_of_day_summary_message(fractional_participant_end_of_day_summary_message_got, fractional_participant_end_of_day_summary_message_sent)
  }
}

/* Auction Status Message: encoded, read back, and compared */
proctype check_auction_status_message() {
  AuctionStatusMessage auction_status_message_sent;
  AuctionStatusMessage auction_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_status_message(auction_status_message_sent, 0)
  :: pattern == 1 -> fill_auction_status_message(auction_status_message_sent, 32)
  :: pattern == 2 -> fill_auction_status_message(auction_status_message_sent, 255)
  :: else -> ramp_auction_status_message(auction_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_status_message(auction_status_message_sent);
    assert(at == 124);
    at = 0;
    decode_auction_status_message(auction_status_message_got);
    assert(at == 124);
    equal_auction_status_message(auction_status_message_got, auction_status_message_sent)
  }
}

/* Corrected Trade: encoded, read back, and compared */
proctype check_corrected_trade() {
  CorrectedTrade corrected_trade_sent;
  CorrectedTrade corrected_trade_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_corrected_trade(corrected_trade_sent, 0)
  :: pattern == 1 -> fill_corrected_trade(corrected_trade_sent, 32)
  :: pattern == 2 -> fill_corrected_trade(corrected_trade_sent, 255)
  :: else -> ramp_corrected_trade(corrected_trade_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_corrected_trade(corrected_trade_sent);
    assert(at == 20);
    at = 0;
    decode_corrected_trade(corrected_trade_got);
    assert(at == 20);
    equal_corrected_trade(corrected_trade_got, corrected_trade_sent)
  }
}

/* Timestamp 2: encoded, read back, and compared */
proctype check_timestamp2() {
  Timestamp2 timestamp2_sent;
  Timestamp2 timestamp2_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_timestamp2(timestamp2_sent, 0)
  :: pattern == 1 -> fill_timestamp2(timestamp2_sent, 32)
  :: pattern == 2 -> fill_timestamp2(timestamp2_sent, 255)
  :: else -> ramp_timestamp2(timestamp2_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_timestamp2(timestamp2_sent);
    assert(at == 8);
    at = 0;
    decode_timestamp2(timestamp2_got);
    assert(at == 8);
    equal_timestamp2(timestamp2_got, timestamp2_sent)
  }
}

/* Original Trade: encoded, read back, and compared */
proctype check_original_trade() {
  OriginalTrade original_trade_sent;
  OriginalTrade original_trade_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_original_trade(original_trade_sent, 0)
  :: pattern == 1 -> fill_original_trade(original_trade_sent, 32)
  :: pattern == 2 -> fill_original_trade(original_trade_sent, 255)
  :: else -> ramp_original_trade(original_trade_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_original_trade(original_trade_sent);
    assert(at == 20);
    at = 0;
    decode_original_trade(original_trade_got);
    assert(at == 20);
    equal_original_trade(original_trade_got, original_trade_sent)
  }
}

/* Consolidated Data: encoded, read back, and compared */
proctype check_consolidated_data() {
  ConsolidatedData consolidated_data_sent;
  ConsolidatedData consolidated_data_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_consolidated_data(consolidated_data_sent, 0)
  :: pattern == 1 -> fill_consolidated_data(consolidated_data_sent, 32)
  :: pattern == 2 -> fill_consolidated_data(consolidated_data_sent, 255)
  :: else -> ramp_consolidated_data(consolidated_data_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_consolidated_data(consolidated_data_sent);
    assert(at == 34);
    at = 0;
    decode_consolidated_data(consolidated_data_got);
    assert(at == 34);
    equal_consolidated_data(consolidated_data_got, consolidated_data_sent)
  }
}

/* Participant Data: encoded, read back, and compared */
proctype check_participant_data() {
  ParticipantData participant_data_sent;
  ParticipantData participant_data_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_participant_data(participant_data_sent, 0)
  :: pattern == 1 -> fill_participant_data(participant_data_sent, 32)
  :: pattern == 2 -> fill_participant_data(participant_data_sent, 255)
  :: else -> ramp_participant_data(participant_data_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_participant_data(participant_data_sent);
    assert(at == 41);
    at = 0;
    decode_participant_data(participant_data_got);
    assert(at == 41);
    equal_participant_data(participant_data_got, participant_data_sent)
  }
}

/* Trade Correction Message: encoded, read back, and compared */
proctype check_trade_correction_message() {
  TradeCorrectionMessage trade_correction_message_sent;
  TradeCorrectionMessage trade_correction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_correction_message(trade_correction_message_sent, 0)
  :: pattern == 1 -> fill_trade_correction_message(trade_correction_message_sent, 32)
  :: pattern == 2 -> fill_trade_correction_message(trade_correction_message_sent, 255)
  :: else -> ramp_trade_correction_message(trade_correction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_correction_message(trade_correction_message_sent);
    assert(at == 168);
    at = 0;
    decode_trade_correction_message(trade_correction_message_got);
    assert(at == 168);
    equal_trade_correction_message(trade_correction_message_got, trade_correction_message_sent)
  }
}

/* Fractional Corrected Trade: encoded, read back, and compared */
proctype check_fractional_corrected_trade() {
  FractionalCorrectedTrade fractional_corrected_trade_sent;
  FractionalCorrectedTrade fractional_corrected_trade_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fractional_corrected_trade(fractional_corrected_trade_sent, 0)
  :: pattern == 1 -> fill_fractional_corrected_trade(fractional_corrected_trade_sent, 32)
  :: pattern == 2 -> fill_fractional_corrected_trade(fractional_corrected_trade_sent, 255)
  :: else -> ramp_fractional_corrected_trade(fractional_corrected_trade_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fractional_corrected_trade(fractional_corrected_trade_sent);
    assert(at == 24);
    at = 0;
    decode_fractional_corrected_trade(fractional_corrected_trade_got);
    assert(at == 24);
    equal_fractional_corrected_trade(fractional_corrected_trade_got, fractional_corrected_trade_sent)
  }
}

/* Fractional Original Trade: encoded, read back, and compared */
proctype check_fractional_original_trade() {
  FractionalOriginalTrade fractional_original_trade_sent;
  FractionalOriginalTrade fractional_original_trade_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fractional_original_trade(fractional_original_trade_sent, 0)
  :: pattern == 1 -> fill_fractional_original_trade(fractional_original_trade_sent, 32)
  :: pattern == 2 -> fill_fractional_original_trade(fractional_original_trade_sent, 255)
  :: else -> ramp_fractional_original_trade(fractional_original_trade_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fractional_original_trade(fractional_original_trade_sent);
    assert(at == 24);
    at = 0;
    decode_fractional_original_trade(fractional_original_trade_got);
    assert(at == 24);
    equal_fractional_original_trade(fractional_original_trade_got, fractional_original_trade_sent)
  }
}

/* Fractional Consolidated Data: encoded, read back, and compared */
proctype check_fractional_consolidated_data() {
  FractionalConsolidatedData fractional_consolidated_data_sent;
  FractionalConsolidatedData fractional_consolidated_data_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fractional_consolidated_data(fractional_consolidated_data_sent, 0)
  :: pattern == 1 -> fill_fractional_consolidated_data(fractional_consolidated_data_sent, 32)
  :: pattern == 2 -> fill_fractional_consolidated_data(fractional_consolidated_data_sent, 255)
  :: else -> ramp_fractional_consolidated_data(fractional_consolidated_data_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fractional_consolidated_data(fractional_consolidated_data_sent);
    assert(at == 38);
    at = 0;
    decode_fractional_consolidated_data(fractional_consolidated_data_got);
    assert(at == 38);
    equal_fractional_consolidated_data(fractional_consolidated_data_got, fractional_consolidated_data_sent)
  }
}

/* Fractional Participant Data: encoded, read back, and compared */
proctype check_fractional_participant_data() {
  FractionalParticipantData fractional_participant_data_sent;
  FractionalParticipantData fractional_participant_data_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fractional_participant_data(fractional_participant_data_sent, 0)
  :: pattern == 1 -> fill_fractional_participant_data(fractional_participant_data_sent, 32)
  :: pattern == 2 -> fill_fractional_participant_data(fractional_participant_data_sent, 255)
  :: else -> ramp_fractional_participant_data(fractional_participant_data_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fractional_participant_data(fractional_participant_data_sent);
    assert(at == 45);
    at = 0;
    decode_fractional_participant_data(fractional_participant_data_got);
    assert(at == 45);
    equal_fractional_participant_data(fractional_participant_data_got, fractional_participant_data_sent)
  }
}

/* Fractional Trade Correction Message: encoded, read back, and compared */
proctype check_fractional_trade_correction_message() {
  FractionalTradeCorrectionMessage fractional_trade_correction_message_sent;
  FractionalTradeCorrectionMessage fractional_trade_correction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fractional_trade_correction_message(fractional_trade_correction_message_sent, 0)
  :: pattern == 1 -> fill_fractional_trade_correction_message(fractional_trade_correction_message_sent, 32)
  :: pattern == 2 -> fill_fractional_trade_correction_message(fractional_trade_correction_message_sent, 255)
  :: else -> ramp_fractional_trade_correction_message(fractional_trade_correction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fractional_trade_correction_message(fractional_trade_correction_message_sent);
    assert(at == 184);
    at = 0;
    decode_fractional_trade_correction_message(fractional_trade_correction_message_got);
    assert(at == 184);
    equal_fractional_trade_correction_message(fractional_trade_correction_message_got, fractional_trade_correction_message_sent)
  }
}

/* Long Trade Message: encoded, read back, and compared */
proctype check_long_trade_message() {
  LongTradeMessage long_trade_message_sent;
  LongTradeMessage long_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_long_trade_message(long_trade_message_sent, 0)
  :: pattern == 1 -> fill_long_trade_message(long_trade_message_sent, 32)
  :: pattern == 2 -> fill_long_trade_message(long_trade_message_sent, 255)
  :: else -> ramp_long_trade_message(long_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_long_trade_message(long_trade_message_sent);
    assert(at == 68);
    at = 0;
    decode_long_trade_message(long_trade_message_got);
    assert(at == 68);
    equal_long_trade_message(long_trade_message_got, long_trade_message_sent)
  }
}

/* Fractional Long Trade Message: encoded, read back, and compared */
proctype check_fractional_long_trade_message() {
  FractionalLongTradeMessage fractional_long_trade_message_sent;
  FractionalLongTradeMessage fractional_long_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fractional_long_trade_message(fractional_long_trade_message_sent, 0)
  :: pattern == 1 -> fill_fractional_long_trade_message(fractional_long_trade_message_sent, 32)
  :: pattern == 2 -> fill_fractional_long_trade_message(fractional_long_trade_message_sent, 255)
  :: else -> ramp_fractional_long_trade_message(fractional_long_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fractional_long_trade_message(fractional_long_trade_message_sent);
    assert(at == 72);
    at = 0;
    decode_fractional_long_trade_message(fractional_long_trade_message_got);
    assert(at == 72);
    equal_fractional_long_trade_message(fractional_long_trade_message_got, fractional_long_trade_message_sent)
  }
}

/* Trading Status Message: encoded, read back, and compared */
proctype check_trading_status_message() {
  TradingStatusMessage trading_status_message_sent;
  TradingStatusMessage trading_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_status_message(trading_status_message_sent, 0)
  :: pattern == 1 -> fill_trading_status_message(trading_status_message_sent, 32)
  :: pattern == 2 -> fill_trading_status_message(trading_status_message_sent, 255)
  :: else -> ramp_trading_status_message(trading_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_status_message(trading_status_message_sent);
    assert(at == 72);
    at = 0;
    decode_trading_status_message(trading_status_message_got);
    assert(at == 72);
    equal_trading_status_message(trading_status_message_got, trading_status_message_sent)
  }
}

/* Short Trade Message: encoded, read back, and compared */
proctype check_short_trade_message() {
  ShortTradeMessage short_trade_message_sent;
  ShortTradeMessage short_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_short_trade_message(short_trade_message_sent, 0)
  :: pattern == 1 -> fill_short_trade_message(short_trade_message_sent, 32)
  :: pattern == 2 -> fill_short_trade_message(short_trade_message_sent, 255)
  :: else -> ramp_short_trade_message(short_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_short_trade_message(short_trade_message_sent);
    assert(at == 36);
    at = 0;
    decode_short_trade_message(short_trade_message_got);
    assert(at == 36);
    equal_short_trade_message(short_trade_message_got, short_trade_message_sent)
  }
}

/* Fractional Short Trade Message: encoded, read back, and compared */
proctype check_fractional_short_trade_message() {
  FractionalShortTradeMessage fractional_short_trade_message_sent;
  FractionalShortTradeMessage fractional_short_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fractional_short_trade_message(fractional_short_trade_message_sent, 0)
  :: pattern == 1 -> fill_fractional_short_trade_message(fractional_short_trade_message_sent, 32)
  :: pattern == 2 -> fill_fractional_short_trade_message(fractional_short_trade_message_sent, 255)
  :: else -> ramp_fractional_short_trade_message(fractional_short_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fractional_short_trade_message(fractional_short_trade_message_sent);
    assert(at == 38);
    at = 0;
    decode_fractional_short_trade_message(fractional_short_trade_message_got);
    assert(at == 38);
    equal_fractional_short_trade_message(fractional_short_trade_message_got, fractional_short_trade_message_sent)
  }
}

/* Trade Cancel Error Message: encoded, read back, and compared */
proctype check_trade_cancel_error_message() {
  TradeCancelErrorMessage trade_cancel_error_message_sent;
  TradeCancelErrorMessage trade_cancel_error_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancel_error_message(trade_cancel_error_message_sent, 0)
  :: pattern == 1 -> fill_trade_cancel_error_message(trade_cancel_error_message_sent, 32)
  :: pattern == 2 -> fill_trade_cancel_error_message(trade_cancel_error_message_sent, 255)
  :: else -> ramp_trade_cancel_error_message(trade_cancel_error_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancel_error_message(trade_cancel_error_message_sent);
    assert(at == 149);
    at = 0;
    decode_trade_cancel_error_message(trade_cancel_error_message_got);
    assert(at == 149);
    equal_trade_cancel_error_message(trade_cancel_error_message_got, trade_cancel_error_message_sent)
  }
}

/* Fractional Trade Cancel Error Message: encoded, read back, and compared */
proctype check_fractional_trade_cancel_error_message() {
  FractionalTradeCancelErrorMessage fractional_trade_cancel_error_message_sent;
  FractionalTradeCancelErrorMessage fractional_trade_cancel_error_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_sent, 0)
  :: pattern == 1 -> fill_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_sent, 32)
  :: pattern == 2 -> fill_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_sent, 255)
  :: else -> ramp_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_sent);
    assert(at == 161);
    at = 0;
    decode_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_got);
    assert(at == 161);
    equal_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_got, fractional_trade_cancel_error_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_sip_block_timestamp()
  :: run check_block_header()
  :: run check_timestamp1()
  :: run check_start_of_end_of_day_summary_message()
  :: run check_end_of_end_of_day_summary_message()
  :: run check_start_of_start_of_day_summary_message()
  :: run check_end_of_start_of_day_summary_message()
  :: run check_start_of_day_message()
  :: run check_reset_block_sequence_number_message()
  :: run check_disaster_recovery_data_center_activation_message()
  :: run check_line_integrity_message()
  :: run check_end_of_day_message()
  :: run check_index_message()
  :: run check_bid_and_offer_index_message()
  :: run check_market_wide_circuit_breaker_decline_level_status_message()
  :: run check_market_wide_circuit_breaker_status_message()
  :: run check_approximate_trades_and_total_dollar_value_message()
  :: run check_crossing_session_summary_message()
  :: run check_sale_conditions()
  :: run check_prior_day_trade_date_and_time()
  :: run check_prior_day_corrected_trade()
  :: run check_prior_day_original_trade()
  :: run check_prior_day_trade_correction_message()
  :: run check_fractional_prior_day_corrected_trade()
  :: run check_fractional_prior_day_original_trade()
  :: run check_fractional_prior_day_trade_correction_message()
  :: run check_prior_day_trade_message()
  :: run check_fractional_prior_day_trade_message()
  :: run check_prior_day_trade_cancel_error_message()
  :: run check_fractional_prior_day_trade_cancel_error_message()
  :: run check_consolidated_start_of_day_summary_message()
  :: run check_participant_start_of_day_summary_message()
  :: run check_consolidated_end_of_day_summary_message()
  :: run check_fractional_consolidated_end_of_day_summary_message()
  :: run check_participant_end_of_day_summary_message()
  :: run check_fractional_participant_end_of_day_summary_message()
  :: run check_auction_status_message()
  :: run check_corrected_trade()
  :: run check_timestamp2()
  :: run check_original_trade()
  :: run check_consolidated_data()
  :: run check_participant_data()
  :: run check_trade_correction_message()
  :: run check_fractional_corrected_trade()
  :: run check_fractional_original_trade()
  :: run check_fractional_consolidated_data()
  :: run check_fractional_participant_data()
  :: run check_fractional_trade_correction_message()
  :: run check_long_trade_message()
  :: run check_fractional_long_trade_message()
  :: run check_trading_status_message()
  :: run check_short_trade_message()
  :: run check_fractional_short_trade_message()
  :: run check_trade_cancel_error_message()
  :: run check_fractional_trade_cancel_error_message()
  fi
}
