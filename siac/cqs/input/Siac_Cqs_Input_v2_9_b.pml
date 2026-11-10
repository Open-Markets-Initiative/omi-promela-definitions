/*
 * The Securities Industry Automation Corporation 
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
 *   - a field present only on a condition
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 256

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Block Header: 10 bytes -------------------------------------------------- */

/* Cta participant input block header */
typedef BlockHeader {
  byte version;
  byte block_size[2];
  byte block_sequence_number[4];
  byte messages_in_block;
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
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.block_sequence_number[block_header_at] = block_header_value; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.messages_in_block = block_header_value;
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
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.block_sequence_number[block_header_at] = (block_header_base + 3 + block_header_at + 1) % 256; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.messages_in_block = (block_header_base + 7 + 1) % 256;
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_checksum[block_header_at] = (block_header_base + 8 + block_header_at + 1) % 256; block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* Block Header to the wire, 10 bytes from where the cursor stands */
inline encode_block_header(block_header_record) {
  wire[at] = block_header_record.version; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 2 -> wire[at] = block_header_record.block_size[block_header_at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> wire[at] = block_header_record.block_sequence_number[block_header_at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  wire[at] = block_header_record.messages_in_block; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 2 -> wire[at] = block_header_record.block_checksum[block_header_at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* Block Header off the wire, 10 bytes from where the cursor stands */
inline decode_block_header(block_header_record) {
  block_header_record.version = wire[at]; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_size[block_header_at] = wire[at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.block_sequence_number[block_header_at] = wire[at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.messages_in_block = wire[at]; at = at + 1;
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
  block_header_at = 0;
  do
  :: block_header_at < 4 -> assert(block_header_read.block_sequence_number[block_header_at] == block_header_written.block_sequence_number[block_header_at]); block_header_at = block_header_at + 1
  :: else -> break
  od;
  assert(block_header_read.messages_in_block == block_header_written.messages_in_block);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> assert(block_header_read.block_checksum[block_header_at] == block_header_written.block_checksum[block_header_at]); block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Timestamp 1: 8 bytes ---------------------------------------------------- */

/* Participant-provided timestamp */
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

/* ---- Message Header: 26 bytes ------------------------------------------------ */

/* Cta participant input message header (26 bytes) */
typedef MessageHeader {
  byte message_length[2];
  byte message_category;
  byte message_type;
  byte participant_i_d;
  Timestamp1 timestamp_1;
  byte message_i_d;
  byte reserved[4];
  byte participant_reference_number[8]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_category = message_header_value;
  message_header_record.message_type = message_header_value;
  message_header_record.participant_i_d = message_header_value;
  fill_timestamp1(message_header_record.timestamp_1, message_header_value);
  message_header_record.message_i_d = message_header_value;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.reserved[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.participant_reference_number[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_category = (message_header_base + 2 + 1) % 256;
  message_header_record.message_type = (message_header_base + 3 + 1) % 256;
  message_header_record.participant_i_d = (message_header_base + 4 + 1) % 256;
  ramp_timestamp1(message_header_record.timestamp_1, message_header_base + 5);
  message_header_record.message_i_d = (message_header_base + 13 + 1) % 256;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.reserved[message_header_at] = (message_header_base + 14 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.participant_reference_number[message_header_at] = (message_header_base + 18 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 26 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.message_category; at = at + 1;
  wire[at] = message_header_record.message_type; at = at + 1;
  wire[at] = message_header_record.participant_i_d; at = at + 1;
  encode_timestamp1(message_header_record.timestamp_1);
  wire[at] = message_header_record.message_i_d; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.reserved[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.participant_reference_number[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 26 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_category = wire[at]; at = at + 1;
  message_header_record.message_type = wire[at]; at = at + 1;
  message_header_record.participant_i_d = wire[at]; at = at + 1;
  decode_timestamp1(message_header_record.timestamp_1);
  message_header_record.message_i_d = wire[at]; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.reserved[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.participant_reference_number[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_length[message_header_at] == message_header_written.message_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.message_category == message_header_written.message_category);
  assert(message_header_read.message_type == message_header_written.message_type);
  assert(message_header_read.participant_i_d == message_header_written.participant_i_d);
  equal_timestamp1(message_header_read.timestamp_1, message_header_written.timestamp_1);
  assert(message_header_read.message_i_d == message_header_written.message_i_d);
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.reserved[message_header_at] == message_header_written.reserved[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> assert(message_header_read.participant_reference_number[message_header_at] == message_header_written.participant_reference_number[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Rejection Message: 14 bytes --------------------------------------------- */

/* Used for all errors to notify a Participant that CQS has found an error in the Block Header, Message Header or Message body of a Participant Input message. */
typedef RejectionMessage {
  byte error_code;
  byte block_sequence_number[4];
  byte participant_reference_number[8];
  byte message_i_d
};

int rejection_message_at;

/* every byte of Rejection Message set to one value */
inline fill_rejection_message(rejection_message_record, rejection_message_value) {
  rejection_message_record.error_code = rejection_message_value;
  rejection_message_at = 0;
  do
  :: rejection_message_at < 4 -> rejection_message_record.block_sequence_number[rejection_message_at] = rejection_message_value; rejection_message_at = rejection_message_at + 1
  :: else -> break
  od;
  rejection_message_at = 0;
  do
  :: rejection_message_at < 8 -> rejection_message_record.participant_reference_number[rejection_message_at] = rejection_message_value; rejection_message_at = rejection_message_at + 1
  :: else -> break
  od;
  rejection_message_record.message_i_d = rejection_message_value;
  skip
}

/* each byte of Rejection Message set to where it lies, so a field read out of place says so */
inline ramp_rejection_message(rejection_message_record, rejection_message_base) {
  rejection_message_record.error_code = (rejection_message_base + 0 + 1) % 256;
  rejection_message_at = 0;
  do
  :: rejection_message_at < 4 -> rejection_message_record.block_sequence_number[rejection_message_at] = (rejection_message_base + 1 + rejection_message_at + 1) % 256; rejection_message_at = rejection_message_at + 1
  :: else -> break
  od;
  rejection_message_at = 0;
  do
  :: rejection_message_at < 8 -> rejection_message_record.participant_reference_number[rejection_message_at] = (rejection_message_base + 5 + rejection_message_at + 1) % 256; rejection_message_at = rejection_message_at + 1
  :: else -> break
  od;
  rejection_message_record.message_i_d = (rejection_message_base + 13 + 1) % 256;
  skip
}

/* Rejection Message to the wire, 14 bytes from where the cursor stands */
inline encode_rejection_message(rejection_message_record) {
  wire[at] = rejection_message_record.error_code; at = at + 1;
  rejection_message_at = 0;
  do
  :: rejection_message_at < 4 -> wire[at] = rejection_message_record.block_sequence_number[rejection_message_at]; at = at + 1; rejection_message_at = rejection_message_at + 1
  :: else -> break
  od;
  rejection_message_at = 0;
  do
  :: rejection_message_at < 8 -> wire[at] = rejection_message_record.participant_reference_number[rejection_message_at]; at = at + 1; rejection_message_at = rejection_message_at + 1
  :: else -> break
  od;
  wire[at] = rejection_message_record.message_i_d; at = at + 1;
  skip
}

/* Rejection Message off the wire, 14 bytes from where the cursor stands */
inline decode_rejection_message(rejection_message_record) {
  rejection_message_record.error_code = wire[at]; at = at + 1;
  rejection_message_at = 0;
  do
  :: rejection_message_at < 4 -> rejection_message_record.block_sequence_number[rejection_message_at] = wire[at]; at = at + 1; rejection_message_at = rejection_message_at + 1
  :: else -> break
  od;
  rejection_message_at = 0;
  do
  :: rejection_message_at < 8 -> rejection_message_record.participant_reference_number[rejection_message_at] = wire[at]; at = at + 1; rejection_message_at = rejection_message_at + 1
  :: else -> break
  od;
  rejection_message_record.message_i_d = wire[at]; at = at + 1;
  skip
}

/* what was read of Rejection Message is what was written, byte for byte */
inline equal_rejection_message(rejection_message_read, rejection_message_written) {
  assert(rejection_message_read.error_code == rejection_message_written.error_code);
  rejection_message_at = 0;
  do
  :: rejection_message_at < 4 -> assert(rejection_message_read.block_sequence_number[rejection_message_at] == rejection_message_written.block_sequence_number[rejection_message_at]); rejection_message_at = rejection_message_at + 1
  :: else -> break
  od;
  rejection_message_at = 0;
  do
  :: rejection_message_at < 8 -> assert(rejection_message_read.participant_reference_number[rejection_message_at] == rejection_message_written.participant_reference_number[rejection_message_at]); rejection_message_at = rejection_message_at + 1
  :: else -> break
  od;
  assert(rejection_message_read.message_i_d == rejection_message_written.message_i_d);
  skip
}

/* ---- Warning Message: 12 bytes ----------------------------------------------- */

/* Sent from CQS to a Participant in response to a Block Sequence Number Gap. The block will still be processed by CQS. */
typedef WarningMessage {
  byte previous_block_sequence_number[4];
  byte previous_participant_reference_number[8]
};

int warning_message_at;

/* every byte of Warning Message set to one value */
inline fill_warning_message(warning_message_record, warning_message_value) {
  warning_message_at = 0;
  do
  :: warning_message_at < 4 -> warning_message_record.previous_block_sequence_number[warning_message_at] = warning_message_value; warning_message_at = warning_message_at + 1
  :: else -> break
  od;
  warning_message_at = 0;
  do
  :: warning_message_at < 8 -> warning_message_record.previous_participant_reference_number[warning_message_at] = warning_message_value; warning_message_at = warning_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Warning Message set to where it lies, so a field read out of place says so */
inline ramp_warning_message(warning_message_record, warning_message_base) {
  warning_message_at = 0;
  do
  :: warning_message_at < 4 -> warning_message_record.previous_block_sequence_number[warning_message_at] = (warning_message_base + 0 + warning_message_at + 1) % 256; warning_message_at = warning_message_at + 1
  :: else -> break
  od;
  warning_message_at = 0;
  do
  :: warning_message_at < 8 -> warning_message_record.previous_participant_reference_number[warning_message_at] = (warning_message_base + 4 + warning_message_at + 1) % 256; warning_message_at = warning_message_at + 1
  :: else -> break
  od;
  skip
}

/* Warning Message to the wire, 12 bytes from where the cursor stands */
inline encode_warning_message(warning_message_record) {
  warning_message_at = 0;
  do
  :: warning_message_at < 4 -> wire[at] = warning_message_record.previous_block_sequence_number[warning_message_at]; at = at + 1; warning_message_at = warning_message_at + 1
  :: else -> break
  od;
  warning_message_at = 0;
  do
  :: warning_message_at < 8 -> wire[at] = warning_message_record.previous_participant_reference_number[warning_message_at]; at = at + 1; warning_message_at = warning_message_at + 1
  :: else -> break
  od;
  skip
}

/* Warning Message off the wire, 12 bytes from where the cursor stands */
inline decode_warning_message(warning_message_record) {
  warning_message_at = 0;
  do
  :: warning_message_at < 4 -> warning_message_record.previous_block_sequence_number[warning_message_at] = wire[at]; at = at + 1; warning_message_at = warning_message_at + 1
  :: else -> break
  od;
  warning_message_at = 0;
  do
  :: warning_message_at < 8 -> warning_message_record.previous_participant_reference_number[warning_message_at] = wire[at]; at = at + 1; warning_message_at = warning_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Warning Message is what was written, byte for byte */
inline equal_warning_message(warning_message_read, warning_message_written) {
  warning_message_at = 0;
  do
  :: warning_message_at < 4 -> assert(warning_message_read.previous_block_sequence_number[warning_message_at] == warning_message_written.previous_block_sequence_number[warning_message_at]); warning_message_at = warning_message_at + 1
  :: else -> break
  od;
  warning_message_at = 0;
  do
  :: warning_message_at < 8 -> assert(warning_message_read.previous_participant_reference_number[warning_message_at] == warning_message_written.previous_participant_reference_number[warning_message_at]); warning_message_at = warning_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sequence Information And Message Count Response Message: 20 bytes ------- */

/* Generated by CQS to a Participant in response to a Sequence Information and Message Count Inquiry message. Transmitted in a separate block. */
typedef SequenceInformationAndMessageCountResponseMessage {
  byte current_block_sequence_number[4];
  byte last_participant_reference_number[8];
  byte message_count[8]
};

int sequence_information_and_message_count_response_message_at;

/* every byte of Sequence Information And Message Count Response Message set to one value */
inline fill_sequence_information_and_message_count_response_message(sequence_information_and_message_count_response_message_record, sequence_information_and_message_count_response_message_value) {
  sequence_information_and_message_count_response_message_at = 0;
  do
  :: sequence_information_and_message_count_response_message_at < 4 -> sequence_information_and_message_count_response_message_record.current_block_sequence_number[sequence_information_and_message_count_response_message_at] = sequence_information_and_message_count_response_message_value; sequence_information_and_message_count_response_message_at = sequence_information_and_message_count_response_message_at + 1
  :: else -> break
  od;
  sequence_information_and_message_count_response_message_at = 0;
  do
  :: sequence_information_and_message_count_response_message_at < 8 -> sequence_information_and_message_count_response_message_record.last_participant_reference_number[sequence_information_and_message_count_response_message_at] = sequence_information_and_message_count_response_message_value; sequence_information_and_message_count_response_message_at = sequence_information_and_message_count_response_message_at + 1
  :: else -> break
  od;
  sequence_information_and_message_count_response_message_at = 0;
  do
  :: sequence_information_and_message_count_response_message_at < 8 -> sequence_information_and_message_count_response_message_record.message_count[sequence_information_and_message_count_response_message_at] = sequence_information_and_message_count_response_message_value; sequence_information_and_message_count_response_message_at = sequence_information_and_message_count_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sequence Information And Message Count Response Message set to where it lies, so a field read out of place says so */
inline ramp_sequence_information_and_message_count_response_message(sequence_information_and_message_count_response_message_record, sequence_information_and_message_count_response_message_base) {
  sequence_information_and_message_count_response_message_at = 0;
  do
  :: sequence_information_and_message_count_response_message_at < 4 -> sequence_information_and_message_count_response_message_record.current_block_sequence_number[sequence_information_and_message_count_response_message_at] = (sequence_information_and_message_count_response_message_base + 0 + sequence_information_and_message_count_response_message_at + 1) % 256; sequence_information_and_message_count_response_message_at = sequence_information_and_message_count_response_message_at + 1
  :: else -> break
  od;
  sequence_information_and_message_count_response_message_at = 0;
  do
  :: sequence_information_and_message_count_response_message_at < 8 -> sequence_information_and_message_count_response_message_record.last_participant_reference_number[sequence_information_and_message_count_response_message_at] = (sequence_information_and_message_count_response_message_base + 4 + sequence_information_and_message_count_response_message_at + 1) % 256; sequence_information_and_message_count_response_message_at = sequence_information_and_message_count_response_message_at + 1
  :: else -> break
  od;
  sequence_information_and_message_count_response_message_at = 0;
  do
  :: sequence_information_and_message_count_response_message_at < 8 -> sequence_information_and_message_count_response_message_record.message_count[sequence_information_and_message_count_response_message_at] = (sequence_information_and_message_count_response_message_base + 12 + sequence_information_and_message_count_response_message_at + 1) % 256; sequence_information_and_message_count_response_message_at = sequence_information_and_message_count_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Information And Message Count Response Message to the wire, 20 bytes from where the cursor stands */
inline encode_sequence_information_and_message_count_response_message(sequence_information_and_message_count_response_message_record) {
  sequence_information_and_message_count_response_message_at = 0;
  do
  :: sequence_information_and_message_count_response_message_at < 4 -> wire[at] = sequence_information_and_message_count_response_message_record.current_block_sequence_number[sequence_information_and_message_count_response_message_at]; at = at + 1; sequence_information_and_message_count_response_message_at = sequence_information_and_message_count_response_message_at + 1
  :: else -> break
  od;
  sequence_information_and_message_count_response_message_at = 0;
  do
  :: sequence_information_and_message_count_response_message_at < 8 -> wire[at] = sequence_information_and_message_count_response_message_record.last_participant_reference_number[sequence_information_and_message_count_response_message_at]; at = at + 1; sequence_information_and_message_count_response_message_at = sequence_information_and_message_count_response_message_at + 1
  :: else -> break
  od;
  sequence_information_and_message_count_response_message_at = 0;
  do
  :: sequence_information_and_message_count_response_message_at < 8 -> wire[at] = sequence_information_and_message_count_response_message_record.message_count[sequence_information_and_message_count_response_message_at]; at = at + 1; sequence_information_and_message_count_response_message_at = sequence_information_and_message_count_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Information And Message Count Response Message off the wire, 20 bytes from where the cursor stands */
inline decode_sequence_information_and_message_count_response_message(sequence_information_and_message_count_response_message_record) {
  sequence_information_and_message_count_response_message_at = 0;
  do
  :: sequence_information_and_message_count_response_message_at < 4 -> sequence_information_and_message_count_response_message_record.current_block_sequence_number[sequence_information_and_message_count_response_message_at] = wire[at]; at = at + 1; sequence_information_and_message_count_response_message_at = sequence_information_and_message_count_response_message_at + 1
  :: else -> break
  od;
  sequence_information_and_message_count_response_message_at = 0;
  do
  :: sequence_information_and_message_count_response_message_at < 8 -> sequence_information_and_message_count_response_message_record.last_participant_reference_number[sequence_information_and_message_count_response_message_at] = wire[at]; at = at + 1; sequence_information_and_message_count_response_message_at = sequence_information_and_message_count_response_message_at + 1
  :: else -> break
  od;
  sequence_information_and_message_count_response_message_at = 0;
  do
  :: sequence_information_and_message_count_response_message_at < 8 -> sequence_information_and_message_count_response_message_record.message_count[sequence_information_and_message_count_response_message_at] = wire[at]; at = at + 1; sequence_information_and_message_count_response_message_at = sequence_information_and_message_count_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sequence Information And Message Count Response Message is what was written, byte for byte */
inline equal_sequence_information_and_message_count_response_message(sequence_information_and_message_count_response_message_read, sequence_information_and_message_count_response_message_written) {
  sequence_information_and_message_count_response_message_at = 0;
  do
  :: sequence_information_and_message_count_response_message_at < 4 -> assert(sequence_information_and_message_count_response_message_read.current_block_sequence_number[sequence_information_and_message_count_response_message_at] == sequence_information_and_message_count_response_message_written.current_block_sequence_number[sequence_information_and_message_count_response_message_at]); sequence_information_and_message_count_response_message_at = sequence_information_and_message_count_response_message_at + 1
  :: else -> break
  od;
  sequence_information_and_message_count_response_message_at = 0;
  do
  :: sequence_information_and_message_count_response_message_at < 8 -> assert(sequence_information_and_message_count_response_message_read.last_participant_reference_number[sequence_information_and_message_count_response_message_at] == sequence_information_and_message_count_response_message_written.last_participant_reference_number[sequence_information_and_message_count_response_message_at]); sequence_information_and_message_count_response_message_at = sequence_information_and_message_count_response_message_at + 1
  :: else -> break
  od;
  sequence_information_and_message_count_response_message_at = 0;
  do
  :: sequence_information_and_message_count_response_message_at < 8 -> assert(sequence_information_and_message_count_response_message_read.message_count[sequence_information_and_message_count_response_message_at] == sequence_information_and_message_count_response_message_written.message_count[sequence_information_and_message_count_response_message_at]); sequence_information_and_message_count_response_message_at = sequence_information_and_message_count_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Odd Lot Refresh Request Message: 30 bytes ------------------------------- */

/* Generated by CQS to a Participant in case of a CQS failure where CQS may inadvertently lose quotes previously reported by the Participant. Provides start and end symbol ranges for affected symbols. */
typedef OddLotRefreshRequestMessage {
  byte security_symbol_begin_range[11];
  byte security_symbol_end_range[11];
  byte reserved_8[8]
};

int odd_lot_refresh_request_message_at;

/* every byte of Odd Lot Refresh Request Message set to one value */
inline fill_odd_lot_refresh_request_message(odd_lot_refresh_request_message_record, odd_lot_refresh_request_message_value) {
  odd_lot_refresh_request_message_at = 0;
  do
  :: odd_lot_refresh_request_message_at < 11 -> odd_lot_refresh_request_message_record.security_symbol_begin_range[odd_lot_refresh_request_message_at] = odd_lot_refresh_request_message_value; odd_lot_refresh_request_message_at = odd_lot_refresh_request_message_at + 1
  :: else -> break
  od;
  odd_lot_refresh_request_message_at = 0;
  do
  :: odd_lot_refresh_request_message_at < 11 -> odd_lot_refresh_request_message_record.security_symbol_end_range[odd_lot_refresh_request_message_at] = odd_lot_refresh_request_message_value; odd_lot_refresh_request_message_at = odd_lot_refresh_request_message_at + 1
  :: else -> break
  od;
  odd_lot_refresh_request_message_at = 0;
  do
  :: odd_lot_refresh_request_message_at < 8 -> odd_lot_refresh_request_message_record.reserved_8[odd_lot_refresh_request_message_at] = odd_lot_refresh_request_message_value; odd_lot_refresh_request_message_at = odd_lot_refresh_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Odd Lot Refresh Request Message set to where it lies, so a field read out of place says so */
inline ramp_odd_lot_refresh_request_message(odd_lot_refresh_request_message_record, odd_lot_refresh_request_message_base) {
  odd_lot_refresh_request_message_at = 0;
  do
  :: odd_lot_refresh_request_message_at < 11 -> odd_lot_refresh_request_message_record.security_symbol_begin_range[odd_lot_refresh_request_message_at] = (odd_lot_refresh_request_message_base + 0 + odd_lot_refresh_request_message_at + 1) % 256; odd_lot_refresh_request_message_at = odd_lot_refresh_request_message_at + 1
  :: else -> break
  od;
  odd_lot_refresh_request_message_at = 0;
  do
  :: odd_lot_refresh_request_message_at < 11 -> odd_lot_refresh_request_message_record.security_symbol_end_range[odd_lot_refresh_request_message_at] = (odd_lot_refresh_request_message_base + 11 + odd_lot_refresh_request_message_at + 1) % 256; odd_lot_refresh_request_message_at = odd_lot_refresh_request_message_at + 1
  :: else -> break
  od;
  odd_lot_refresh_request_message_at = 0;
  do
  :: odd_lot_refresh_request_message_at < 8 -> odd_lot_refresh_request_message_record.reserved_8[odd_lot_refresh_request_message_at] = (odd_lot_refresh_request_message_base + 22 + odd_lot_refresh_request_message_at + 1) % 256; odd_lot_refresh_request_message_at = odd_lot_refresh_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Odd Lot Refresh Request Message to the wire, 30 bytes from where the cursor stands */
inline encode_odd_lot_refresh_request_message(odd_lot_refresh_request_message_record) {
  odd_lot_refresh_request_message_at = 0;
  do
  :: odd_lot_refresh_request_message_at < 11 -> wire[at] = odd_lot_refresh_request_message_record.security_symbol_begin_range[odd_lot_refresh_request_message_at]; at = at + 1; odd_lot_refresh_request_message_at = odd_lot_refresh_request_message_at + 1
  :: else -> break
  od;
  odd_lot_refresh_request_message_at = 0;
  do
  :: odd_lot_refresh_request_message_at < 11 -> wire[at] = odd_lot_refresh_request_message_record.security_symbol_end_range[odd_lot_refresh_request_message_at]; at = at + 1; odd_lot_refresh_request_message_at = odd_lot_refresh_request_message_at + 1
  :: else -> break
  od;
  odd_lot_refresh_request_message_at = 0;
  do
  :: odd_lot_refresh_request_message_at < 8 -> wire[at] = odd_lot_refresh_request_message_record.reserved_8[odd_lot_refresh_request_message_at]; at = at + 1; odd_lot_refresh_request_message_at = odd_lot_refresh_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Odd Lot Refresh Request Message off the wire, 30 bytes from where the cursor stands */
inline decode_odd_lot_refresh_request_message(odd_lot_refresh_request_message_record) {
  odd_lot_refresh_request_message_at = 0;
  do
  :: odd_lot_refresh_request_message_at < 11 -> odd_lot_refresh_request_message_record.security_symbol_begin_range[odd_lot_refresh_request_message_at] = wire[at]; at = at + 1; odd_lot_refresh_request_message_at = odd_lot_refresh_request_message_at + 1
  :: else -> break
  od;
  odd_lot_refresh_request_message_at = 0;
  do
  :: odd_lot_refresh_request_message_at < 11 -> odd_lot_refresh_request_message_record.security_symbol_end_range[odd_lot_refresh_request_message_at] = wire[at]; at = at + 1; odd_lot_refresh_request_message_at = odd_lot_refresh_request_message_at + 1
  :: else -> break
  od;
  odd_lot_refresh_request_message_at = 0;
  do
  :: odd_lot_refresh_request_message_at < 8 -> odd_lot_refresh_request_message_record.reserved_8[odd_lot_refresh_request_message_at] = wire[at]; at = at + 1; odd_lot_refresh_request_message_at = odd_lot_refresh_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Odd Lot Refresh Request Message is what was written, byte for byte */
inline equal_odd_lot_refresh_request_message(odd_lot_refresh_request_message_read, odd_lot_refresh_request_message_written) {
  odd_lot_refresh_request_message_at = 0;
  do
  :: odd_lot_refresh_request_message_at < 11 -> assert(odd_lot_refresh_request_message_read.security_symbol_begin_range[odd_lot_refresh_request_message_at] == odd_lot_refresh_request_message_written.security_symbol_begin_range[odd_lot_refresh_request_message_at]); odd_lot_refresh_request_message_at = odd_lot_refresh_request_message_at + 1
  :: else -> break
  od;
  odd_lot_refresh_request_message_at = 0;
  do
  :: odd_lot_refresh_request_message_at < 11 -> assert(odd_lot_refresh_request_message_read.security_symbol_end_range[odd_lot_refresh_request_message_at] == odd_lot_refresh_request_message_written.security_symbol_end_range[odd_lot_refresh_request_message_at]); odd_lot_refresh_request_message_at = odd_lot_refresh_request_message_at + 1
  :: else -> break
  od;
  odd_lot_refresh_request_message_at = 0;
  do
  :: odd_lot_refresh_request_message_at < 8 -> assert(odd_lot_refresh_request_message_read.reserved_8[odd_lot_refresh_request_message_at] == odd_lot_refresh_request_message_written.reserved_8[odd_lot_refresh_request_message_at]); odd_lot_refresh_request_message_at = odd_lot_refresh_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Test Message: 256 bytes ------------------------------------------------- */

/* Generated by CQS or a Participant to exercise the line and verify transmission integrity. Transmitted as the only message in a block. */
typedef TestMessage {
  byte data[256]
};

int test_message_at;

/* every byte of Test Message set to one value */
inline fill_test_message(test_message_record, test_message_value) {
  test_message_at = 0;
  do
  :: test_message_at < 256 -> test_message_record.data[test_message_at] = test_message_value; test_message_at = test_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Test Message set to where it lies, so a field read out of place says so */
inline ramp_test_message(test_message_record, test_message_base) {
  test_message_at = 0;
  do
  :: test_message_at < 256 -> test_message_record.data[test_message_at] = (test_message_base + 0 + test_message_at + 1) % 256; test_message_at = test_message_at + 1
  :: else -> break
  od;
  skip
}

/* Test Message to the wire, 256 bytes from where the cursor stands */
inline encode_test_message(test_message_record) {
  test_message_at = 0;
  do
  :: test_message_at < 256 -> wire[at] = test_message_record.data[test_message_at]; at = at + 1; test_message_at = test_message_at + 1
  :: else -> break
  od;
  skip
}

/* Test Message off the wire, 256 bytes from where the cursor stands */
inline decode_test_message(test_message_record) {
  test_message_at = 0;
  do
  :: test_message_at < 256 -> test_message_record.data[test_message_at] = wire[at]; at = at + 1; test_message_at = test_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Test Message is what was written, byte for byte */
inline equal_test_message(test_message_read, test_message_written) {
  test_message_at = 0;
  do
  :: test_message_at < 256 -> assert(test_message_read.data[test_message_at] == test_message_written.data[test_message_at]); test_message_at = test_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Status Message: 99 bytes ---------------------------------------- */

/* Transmitted when a Participant in a CTA eligible security requires Auction Information. Initial Auction Collar is published after the LULD Trading Pause. */
typedef AuctionStatusMessage {
  byte security_symbol[11];
  byte instrument_type;
  byte auction_collar_reference_price[8];
  byte auction_collar_upper_threshold_price[8];
  byte auction_collar_lower_threshold_price[8];
  byte number_of_extensions;
  byte reserved_62[62]
};

int auction_status_message_at;

/* every byte of Auction Status Message set to one value */
inline fill_auction_status_message(auction_status_message_record, auction_status_message_value) {
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
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 62 -> auction_status_message_record.reserved_62[auction_status_message_at] = auction_status_message_value; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Status Message set to where it lies, so a field read out of place says so */
inline ramp_auction_status_message(auction_status_message_record, auction_status_message_base) {
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 11 -> auction_status_message_record.security_symbol[auction_status_message_at] = (auction_status_message_base + 0 + auction_status_message_at + 1) % 256; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_record.instrument_type = (auction_status_message_base + 11 + 1) % 256;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_reference_price[auction_status_message_at] = (auction_status_message_base + 12 + auction_status_message_at + 1) % 256; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_upper_threshold_price[auction_status_message_at] = (auction_status_message_base + 20 + auction_status_message_at + 1) % 256; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_lower_threshold_price[auction_status_message_at] = (auction_status_message_base + 28 + auction_status_message_at + 1) % 256; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_record.number_of_extensions = (auction_status_message_base + 36 + 1) % 256;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 62 -> auction_status_message_record.reserved_62[auction_status_message_at] = (auction_status_message_base + 37 + auction_status_message_at + 1) % 256; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Status Message to the wire, 99 bytes from where the cursor stands */
inline encode_auction_status_message(auction_status_message_record) {
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
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 62 -> wire[at] = auction_status_message_record.reserved_62[auction_status_message_at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Status Message off the wire, 99 bytes from where the cursor stands */
inline decode_auction_status_message(auction_status_message_record) {
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
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 62 -> auction_status_message_record.reserved_62[auction_status_message_at] = wire[at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Status Message is what was written, byte for byte */
inline equal_auction_status_message(auction_status_message_read, auction_status_message_written) {
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
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 62 -> assert(auction_status_message_read.reserved_62[auction_status_message_at] == auction_status_message_written.reserved_62[auction_status_message_at]); auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Short Quote Message: 15 bytes ------------------------------------------- */

/* Reports Bid and Offer quote information for a CTA eligible Equity, Local Issue or Bond meeting the Short Quote criteria. Will be discontinued in favor of Round Lot Short Quote. */
typedef ShortQuoteMessage {
  byte security_symbol_short[5];
  byte bid_price_short[2];
  byte bid_size_short[2];
  byte offer_price_short[2];
  byte offer_size_short[2];
  byte reserved_2[2]
};

int short_quote_message_at;

/* every byte of Short Quote Message set to one value */
inline fill_short_quote_message(short_quote_message_record, short_quote_message_value) {
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 5 -> short_quote_message_record.security_symbol_short[short_quote_message_at] = short_quote_message_value; short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 2 -> short_quote_message_record.bid_price_short[short_quote_message_at] = short_quote_message_value; short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 2 -> short_quote_message_record.bid_size_short[short_quote_message_at] = short_quote_message_value; short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 2 -> short_quote_message_record.offer_price_short[short_quote_message_at] = short_quote_message_value; short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 2 -> short_quote_message_record.offer_size_short[short_quote_message_at] = short_quote_message_value; short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 2 -> short_quote_message_record.reserved_2[short_quote_message_at] = short_quote_message_value; short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Short Quote Message set to where it lies, so a field read out of place says so */
inline ramp_short_quote_message(short_quote_message_record, short_quote_message_base) {
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 5 -> short_quote_message_record.security_symbol_short[short_quote_message_at] = (short_quote_message_base + 0 + short_quote_message_at + 1) % 256; short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 2 -> short_quote_message_record.bid_price_short[short_quote_message_at] = (short_quote_message_base + 5 + short_quote_message_at + 1) % 256; short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 2 -> short_quote_message_record.bid_size_short[short_quote_message_at] = (short_quote_message_base + 7 + short_quote_message_at + 1) % 256; short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 2 -> short_quote_message_record.offer_price_short[short_quote_message_at] = (short_quote_message_base + 9 + short_quote_message_at + 1) % 256; short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 2 -> short_quote_message_record.offer_size_short[short_quote_message_at] = (short_quote_message_base + 11 + short_quote_message_at + 1) % 256; short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 2 -> short_quote_message_record.reserved_2[short_quote_message_at] = (short_quote_message_base + 13 + short_quote_message_at + 1) % 256; short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Short Quote Message to the wire, 15 bytes from where the cursor stands */
inline encode_short_quote_message(short_quote_message_record) {
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 5 -> wire[at] = short_quote_message_record.security_symbol_short[short_quote_message_at]; at = at + 1; short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 2 -> wire[at] = short_quote_message_record.bid_price_short[short_quote_message_at]; at = at + 1; short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 2 -> wire[at] = short_quote_message_record.bid_size_short[short_quote_message_at]; at = at + 1; short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 2 -> wire[at] = short_quote_message_record.offer_price_short[short_quote_message_at]; at = at + 1; short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 2 -> wire[at] = short_quote_message_record.offer_size_short[short_quote_message_at]; at = at + 1; short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 2 -> wire[at] = short_quote_message_record.reserved_2[short_quote_message_at]; at = at + 1; short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Short Quote Message off the wire, 15 bytes from where the cursor stands */
inline decode_short_quote_message(short_quote_message_record) {
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 5 -> short_quote_message_record.security_symbol_short[short_quote_message_at] = wire[at]; at = at + 1; short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 2 -> short_quote_message_record.bid_price_short[short_quote_message_at] = wire[at]; at = at + 1; short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 2 -> short_quote_message_record.bid_size_short[short_quote_message_at] = wire[at]; at = at + 1; short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 2 -> short_quote_message_record.offer_price_short[short_quote_message_at] = wire[at]; at = at + 1; short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 2 -> short_quote_message_record.offer_size_short[short_quote_message_at] = wire[at]; at = at + 1; short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 2 -> short_quote_message_record.reserved_2[short_quote_message_at] = wire[at]; at = at + 1; short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Short Quote Message is what was written, byte for byte */
inline equal_short_quote_message(short_quote_message_read, short_quote_message_written) {
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 5 -> assert(short_quote_message_read.security_symbol_short[short_quote_message_at] == short_quote_message_written.security_symbol_short[short_quote_message_at]); short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 2 -> assert(short_quote_message_read.bid_price_short[short_quote_message_at] == short_quote_message_written.bid_price_short[short_quote_message_at]); short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 2 -> assert(short_quote_message_read.bid_size_short[short_quote_message_at] == short_quote_message_written.bid_size_short[short_quote_message_at]); short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 2 -> assert(short_quote_message_read.offer_price_short[short_quote_message_at] == short_quote_message_written.offer_price_short[short_quote_message_at]); short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 2 -> assert(short_quote_message_read.offer_size_short[short_quote_message_at] == short_quote_message_written.offer_size_short[short_quote_message_at]); short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
  short_quote_message_at = 0;
  do
  :: short_quote_message_at < 2 -> assert(short_quote_message_read.reserved_2[short_quote_message_at] == short_quote_message_written.reserved_2[short_quote_message_at]); short_quote_message_at = short_quote_message_at + 1
  :: else -> break
  od;
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

/* ---- Long Quote Message: 55 bytes -------------------------------------------- */

/* Reports quote information for a CTA eligible Equity, Local Issue or Bond. Used to report trading suspensions, price indications and trading range indications on the CQS input lines. Will be discontinued in favor of Round Lot Long Quote. */
typedef LongQuoteMessage {
  byte security_symbol[11];
  byte instrument_type;
  byte quote_condition;
  byte security_status_indicator;
  byte bid_price[8];
  byte bid_size[4];
  byte offer_price[8];
  byte offer_size[4];
  byte retail_interest_indicator;
  byte settlement_condition;
  byte market_condition;
  byte finra_market_maker_id[4];
  byte finra_bbo_indicator;
  Timestamp2 timestamp_2;
  byte short_sale_restriction_indicator
};

int long_quote_message_at;

/* every byte of Long Quote Message set to one value */
inline fill_long_quote_message(long_quote_message_record, long_quote_message_value) {
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 11 -> long_quote_message_record.security_symbol[long_quote_message_at] = long_quote_message_value; long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  long_quote_message_record.instrument_type = long_quote_message_value;
  long_quote_message_record.quote_condition = long_quote_message_value;
  long_quote_message_record.security_status_indicator = long_quote_message_value;
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 8 -> long_quote_message_record.bid_price[long_quote_message_at] = long_quote_message_value; long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 4 -> long_quote_message_record.bid_size[long_quote_message_at] = long_quote_message_value; long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 8 -> long_quote_message_record.offer_price[long_quote_message_at] = long_quote_message_value; long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 4 -> long_quote_message_record.offer_size[long_quote_message_at] = long_quote_message_value; long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  long_quote_message_record.retail_interest_indicator = long_quote_message_value;
  long_quote_message_record.settlement_condition = long_quote_message_value;
  long_quote_message_record.market_condition = long_quote_message_value;
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 4 -> long_quote_message_record.finra_market_maker_id[long_quote_message_at] = long_quote_message_value; long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  long_quote_message_record.finra_bbo_indicator = long_quote_message_value;
  fill_timestamp2(long_quote_message_record.timestamp_2, long_quote_message_value);
  long_quote_message_record.short_sale_restriction_indicator = long_quote_message_value;
  skip
}

/* each byte of Long Quote Message set to where it lies, so a field read out of place says so */
inline ramp_long_quote_message(long_quote_message_record, long_quote_message_base) {
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 11 -> long_quote_message_record.security_symbol[long_quote_message_at] = (long_quote_message_base + 0 + long_quote_message_at + 1) % 256; long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  long_quote_message_record.instrument_type = (long_quote_message_base + 11 + 1) % 256;
  long_quote_message_record.quote_condition = (long_quote_message_base + 12 + 1) % 256;
  long_quote_message_record.security_status_indicator = (long_quote_message_base + 13 + 1) % 256;
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 8 -> long_quote_message_record.bid_price[long_quote_message_at] = (long_quote_message_base + 14 + long_quote_message_at + 1) % 256; long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 4 -> long_quote_message_record.bid_size[long_quote_message_at] = (long_quote_message_base + 22 + long_quote_message_at + 1) % 256; long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 8 -> long_quote_message_record.offer_price[long_quote_message_at] = (long_quote_message_base + 26 + long_quote_message_at + 1) % 256; long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 4 -> long_quote_message_record.offer_size[long_quote_message_at] = (long_quote_message_base + 34 + long_quote_message_at + 1) % 256; long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  long_quote_message_record.retail_interest_indicator = (long_quote_message_base + 38 + 1) % 256;
  long_quote_message_record.settlement_condition = (long_quote_message_base + 39 + 1) % 256;
  long_quote_message_record.market_condition = (long_quote_message_base + 40 + 1) % 256;
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 4 -> long_quote_message_record.finra_market_maker_id[long_quote_message_at] = (long_quote_message_base + 41 + long_quote_message_at + 1) % 256; long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  long_quote_message_record.finra_bbo_indicator = (long_quote_message_base + 45 + 1) % 256;
  ramp_timestamp2(long_quote_message_record.timestamp_2, long_quote_message_base + 46);
  long_quote_message_record.short_sale_restriction_indicator = (long_quote_message_base + 54 + 1) % 256;
  skip
}

/* Long Quote Message to the wire, 55 bytes from where the cursor stands */
inline encode_long_quote_message(long_quote_message_record) {
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 11 -> wire[at] = long_quote_message_record.security_symbol[long_quote_message_at]; at = at + 1; long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = long_quote_message_record.instrument_type; at = at + 1;
  wire[at] = long_quote_message_record.quote_condition; at = at + 1;
  wire[at] = long_quote_message_record.security_status_indicator; at = at + 1;
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 8 -> wire[at] = long_quote_message_record.bid_price[long_quote_message_at]; at = at + 1; long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 4 -> wire[at] = long_quote_message_record.bid_size[long_quote_message_at]; at = at + 1; long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 8 -> wire[at] = long_quote_message_record.offer_price[long_quote_message_at]; at = at + 1; long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 4 -> wire[at] = long_quote_message_record.offer_size[long_quote_message_at]; at = at + 1; long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = long_quote_message_record.retail_interest_indicator; at = at + 1;
  wire[at] = long_quote_message_record.settlement_condition; at = at + 1;
  wire[at] = long_quote_message_record.market_condition; at = at + 1;
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 4 -> wire[at] = long_quote_message_record.finra_market_maker_id[long_quote_message_at]; at = at + 1; long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = long_quote_message_record.finra_bbo_indicator; at = at + 1;
  encode_timestamp2(long_quote_message_record.timestamp_2);
  wire[at] = long_quote_message_record.short_sale_restriction_indicator; at = at + 1;
  skip
}

/* Long Quote Message off the wire, 55 bytes from where the cursor stands */
inline decode_long_quote_message(long_quote_message_record) {
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 11 -> long_quote_message_record.security_symbol[long_quote_message_at] = wire[at]; at = at + 1; long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  long_quote_message_record.instrument_type = wire[at]; at = at + 1;
  long_quote_message_record.quote_condition = wire[at]; at = at + 1;
  long_quote_message_record.security_status_indicator = wire[at]; at = at + 1;
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 8 -> long_quote_message_record.bid_price[long_quote_message_at] = wire[at]; at = at + 1; long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 4 -> long_quote_message_record.bid_size[long_quote_message_at] = wire[at]; at = at + 1; long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 8 -> long_quote_message_record.offer_price[long_quote_message_at] = wire[at]; at = at + 1; long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 4 -> long_quote_message_record.offer_size[long_quote_message_at] = wire[at]; at = at + 1; long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  long_quote_message_record.retail_interest_indicator = wire[at]; at = at + 1;
  long_quote_message_record.settlement_condition = wire[at]; at = at + 1;
  long_quote_message_record.market_condition = wire[at]; at = at + 1;
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 4 -> long_quote_message_record.finra_market_maker_id[long_quote_message_at] = wire[at]; at = at + 1; long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  long_quote_message_record.finra_bbo_indicator = wire[at]; at = at + 1;
  decode_timestamp2(long_quote_message_record.timestamp_2);
  long_quote_message_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Long Quote Message is what was written, byte for byte */
inline equal_long_quote_message(long_quote_message_read, long_quote_message_written) {
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 11 -> assert(long_quote_message_read.security_symbol[long_quote_message_at] == long_quote_message_written.security_symbol[long_quote_message_at]); long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  assert(long_quote_message_read.instrument_type == long_quote_message_written.instrument_type);
  assert(long_quote_message_read.quote_condition == long_quote_message_written.quote_condition);
  assert(long_quote_message_read.security_status_indicator == long_quote_message_written.security_status_indicator);
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 8 -> assert(long_quote_message_read.bid_price[long_quote_message_at] == long_quote_message_written.bid_price[long_quote_message_at]); long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 4 -> assert(long_quote_message_read.bid_size[long_quote_message_at] == long_quote_message_written.bid_size[long_quote_message_at]); long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 8 -> assert(long_quote_message_read.offer_price[long_quote_message_at] == long_quote_message_written.offer_price[long_quote_message_at]); long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 4 -> assert(long_quote_message_read.offer_size[long_quote_message_at] == long_quote_message_written.offer_size[long_quote_message_at]); long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  assert(long_quote_message_read.retail_interest_indicator == long_quote_message_written.retail_interest_indicator);
  assert(long_quote_message_read.settlement_condition == long_quote_message_written.settlement_condition);
  assert(long_quote_message_read.market_condition == long_quote_message_written.market_condition);
  long_quote_message_at = 0;
  do
  :: long_quote_message_at < 4 -> assert(long_quote_message_read.finra_market_maker_id[long_quote_message_at] == long_quote_message_written.finra_market_maker_id[long_quote_message_at]); long_quote_message_at = long_quote_message_at + 1
  :: else -> break
  od;
  assert(long_quote_message_read.finra_bbo_indicator == long_quote_message_written.finra_bbo_indicator);
  equal_timestamp2(long_quote_message_read.timestamp_2, long_quote_message_written.timestamp_2);
  assert(long_quote_message_read.short_sale_restriction_indicator == long_quote_message_written.short_sale_restriction_indicator);
  skip
}

/* ---- Special Long Quote Message: 88 bytes ------------------------------------ */

/* Used only by FINRA ADF for CTA eligible Equity, Local Issue or Bond to identify the FINRA Best Bid and Best Offer at the Bid and/or Offer side. Will be discontinued in favor of Round Lot FINRA ADF Quote. */
typedef SpecialLongQuoteMessage {
  byte security_symbol[11];
  byte instrument_type;
  byte quote_condition;
  byte security_status_indicator;
  byte bid_price[8];
  byte bid_size[4];
  byte offer_price[8];
  byte offer_size[4];
  byte retail_interest_indicator;
  byte settlement_condition;
  byte market_condition;
  byte finra_market_maker_id[4];
  byte finra_best_bid_quote_condition;
  byte finra_best_bid_price[8];
  byte finra_best_bid_size[4];
  byte finra_best_bid_market_maker_id[4];
  byte finra_best_offer_quote_condition;
  byte finra_best_offer_price[8];
  byte finra_best_offer_size[4];
  byte finra_best_offer_market_maker_id[4];
  Timestamp2 timestamp_2;
  byte short_sale_restriction_indicator
};

int special_long_quote_message_at;

/* every byte of Special Long Quote Message set to one value */
inline fill_special_long_quote_message(special_long_quote_message_record, special_long_quote_message_value) {
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 11 -> special_long_quote_message_record.security_symbol[special_long_quote_message_at] = special_long_quote_message_value; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_record.instrument_type = special_long_quote_message_value;
  special_long_quote_message_record.quote_condition = special_long_quote_message_value;
  special_long_quote_message_record.security_status_indicator = special_long_quote_message_value;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 8 -> special_long_quote_message_record.bid_price[special_long_quote_message_at] = special_long_quote_message_value; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> special_long_quote_message_record.bid_size[special_long_quote_message_at] = special_long_quote_message_value; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 8 -> special_long_quote_message_record.offer_price[special_long_quote_message_at] = special_long_quote_message_value; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> special_long_quote_message_record.offer_size[special_long_quote_message_at] = special_long_quote_message_value; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_record.retail_interest_indicator = special_long_quote_message_value;
  special_long_quote_message_record.settlement_condition = special_long_quote_message_value;
  special_long_quote_message_record.market_condition = special_long_quote_message_value;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> special_long_quote_message_record.finra_market_maker_id[special_long_quote_message_at] = special_long_quote_message_value; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_record.finra_best_bid_quote_condition = special_long_quote_message_value;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 8 -> special_long_quote_message_record.finra_best_bid_price[special_long_quote_message_at] = special_long_quote_message_value; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> special_long_quote_message_record.finra_best_bid_size[special_long_quote_message_at] = special_long_quote_message_value; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> special_long_quote_message_record.finra_best_bid_market_maker_id[special_long_quote_message_at] = special_long_quote_message_value; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_record.finra_best_offer_quote_condition = special_long_quote_message_value;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 8 -> special_long_quote_message_record.finra_best_offer_price[special_long_quote_message_at] = special_long_quote_message_value; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> special_long_quote_message_record.finra_best_offer_size[special_long_quote_message_at] = special_long_quote_message_value; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> special_long_quote_message_record.finra_best_offer_market_maker_id[special_long_quote_message_at] = special_long_quote_message_value; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  fill_timestamp2(special_long_quote_message_record.timestamp_2, special_long_quote_message_value);
  special_long_quote_message_record.short_sale_restriction_indicator = special_long_quote_message_value;
  skip
}

/* each byte of Special Long Quote Message set to where it lies, so a field read out of place says so */
inline ramp_special_long_quote_message(special_long_quote_message_record, special_long_quote_message_base) {
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 11 -> special_long_quote_message_record.security_symbol[special_long_quote_message_at] = (special_long_quote_message_base + 0 + special_long_quote_message_at + 1) % 256; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_record.instrument_type = (special_long_quote_message_base + 11 + 1) % 256;
  special_long_quote_message_record.quote_condition = (special_long_quote_message_base + 12 + 1) % 256;
  special_long_quote_message_record.security_status_indicator = (special_long_quote_message_base + 13 + 1) % 256;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 8 -> special_long_quote_message_record.bid_price[special_long_quote_message_at] = (special_long_quote_message_base + 14 + special_long_quote_message_at + 1) % 256; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> special_long_quote_message_record.bid_size[special_long_quote_message_at] = (special_long_quote_message_base + 22 + special_long_quote_message_at + 1) % 256; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 8 -> special_long_quote_message_record.offer_price[special_long_quote_message_at] = (special_long_quote_message_base + 26 + special_long_quote_message_at + 1) % 256; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> special_long_quote_message_record.offer_size[special_long_quote_message_at] = (special_long_quote_message_base + 34 + special_long_quote_message_at + 1) % 256; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_record.retail_interest_indicator = (special_long_quote_message_base + 38 + 1) % 256;
  special_long_quote_message_record.settlement_condition = (special_long_quote_message_base + 39 + 1) % 256;
  special_long_quote_message_record.market_condition = (special_long_quote_message_base + 40 + 1) % 256;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> special_long_quote_message_record.finra_market_maker_id[special_long_quote_message_at] = (special_long_quote_message_base + 41 + special_long_quote_message_at + 1) % 256; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_record.finra_best_bid_quote_condition = (special_long_quote_message_base + 45 + 1) % 256;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 8 -> special_long_quote_message_record.finra_best_bid_price[special_long_quote_message_at] = (special_long_quote_message_base + 46 + special_long_quote_message_at + 1) % 256; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> special_long_quote_message_record.finra_best_bid_size[special_long_quote_message_at] = (special_long_quote_message_base + 54 + special_long_quote_message_at + 1) % 256; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> special_long_quote_message_record.finra_best_bid_market_maker_id[special_long_quote_message_at] = (special_long_quote_message_base + 58 + special_long_quote_message_at + 1) % 256; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_record.finra_best_offer_quote_condition = (special_long_quote_message_base + 62 + 1) % 256;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 8 -> special_long_quote_message_record.finra_best_offer_price[special_long_quote_message_at] = (special_long_quote_message_base + 63 + special_long_quote_message_at + 1) % 256; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> special_long_quote_message_record.finra_best_offer_size[special_long_quote_message_at] = (special_long_quote_message_base + 71 + special_long_quote_message_at + 1) % 256; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> special_long_quote_message_record.finra_best_offer_market_maker_id[special_long_quote_message_at] = (special_long_quote_message_base + 75 + special_long_quote_message_at + 1) % 256; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  ramp_timestamp2(special_long_quote_message_record.timestamp_2, special_long_quote_message_base + 79);
  special_long_quote_message_record.short_sale_restriction_indicator = (special_long_quote_message_base + 87 + 1) % 256;
  skip
}

/* Special Long Quote Message to the wire, 88 bytes from where the cursor stands */
inline encode_special_long_quote_message(special_long_quote_message_record) {
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 11 -> wire[at] = special_long_quote_message_record.security_symbol[special_long_quote_message_at]; at = at + 1; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = special_long_quote_message_record.instrument_type; at = at + 1;
  wire[at] = special_long_quote_message_record.quote_condition; at = at + 1;
  wire[at] = special_long_quote_message_record.security_status_indicator; at = at + 1;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 8 -> wire[at] = special_long_quote_message_record.bid_price[special_long_quote_message_at]; at = at + 1; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> wire[at] = special_long_quote_message_record.bid_size[special_long_quote_message_at]; at = at + 1; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 8 -> wire[at] = special_long_quote_message_record.offer_price[special_long_quote_message_at]; at = at + 1; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> wire[at] = special_long_quote_message_record.offer_size[special_long_quote_message_at]; at = at + 1; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = special_long_quote_message_record.retail_interest_indicator; at = at + 1;
  wire[at] = special_long_quote_message_record.settlement_condition; at = at + 1;
  wire[at] = special_long_quote_message_record.market_condition; at = at + 1;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> wire[at] = special_long_quote_message_record.finra_market_maker_id[special_long_quote_message_at]; at = at + 1; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = special_long_quote_message_record.finra_best_bid_quote_condition; at = at + 1;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 8 -> wire[at] = special_long_quote_message_record.finra_best_bid_price[special_long_quote_message_at]; at = at + 1; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> wire[at] = special_long_quote_message_record.finra_best_bid_size[special_long_quote_message_at]; at = at + 1; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> wire[at] = special_long_quote_message_record.finra_best_bid_market_maker_id[special_long_quote_message_at]; at = at + 1; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = special_long_quote_message_record.finra_best_offer_quote_condition; at = at + 1;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 8 -> wire[at] = special_long_quote_message_record.finra_best_offer_price[special_long_quote_message_at]; at = at + 1; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> wire[at] = special_long_quote_message_record.finra_best_offer_size[special_long_quote_message_at]; at = at + 1; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> wire[at] = special_long_quote_message_record.finra_best_offer_market_maker_id[special_long_quote_message_at]; at = at + 1; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  encode_timestamp2(special_long_quote_message_record.timestamp_2);
  wire[at] = special_long_quote_message_record.short_sale_restriction_indicator; at = at + 1;
  skip
}

/* Special Long Quote Message off the wire, 88 bytes from where the cursor stands */
inline decode_special_long_quote_message(special_long_quote_message_record) {
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 11 -> special_long_quote_message_record.security_symbol[special_long_quote_message_at] = wire[at]; at = at + 1; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_record.instrument_type = wire[at]; at = at + 1;
  special_long_quote_message_record.quote_condition = wire[at]; at = at + 1;
  special_long_quote_message_record.security_status_indicator = wire[at]; at = at + 1;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 8 -> special_long_quote_message_record.bid_price[special_long_quote_message_at] = wire[at]; at = at + 1; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> special_long_quote_message_record.bid_size[special_long_quote_message_at] = wire[at]; at = at + 1; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 8 -> special_long_quote_message_record.offer_price[special_long_quote_message_at] = wire[at]; at = at + 1; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> special_long_quote_message_record.offer_size[special_long_quote_message_at] = wire[at]; at = at + 1; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_record.retail_interest_indicator = wire[at]; at = at + 1;
  special_long_quote_message_record.settlement_condition = wire[at]; at = at + 1;
  special_long_quote_message_record.market_condition = wire[at]; at = at + 1;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> special_long_quote_message_record.finra_market_maker_id[special_long_quote_message_at] = wire[at]; at = at + 1; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_record.finra_best_bid_quote_condition = wire[at]; at = at + 1;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 8 -> special_long_quote_message_record.finra_best_bid_price[special_long_quote_message_at] = wire[at]; at = at + 1; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> special_long_quote_message_record.finra_best_bid_size[special_long_quote_message_at] = wire[at]; at = at + 1; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> special_long_quote_message_record.finra_best_bid_market_maker_id[special_long_quote_message_at] = wire[at]; at = at + 1; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_record.finra_best_offer_quote_condition = wire[at]; at = at + 1;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 8 -> special_long_quote_message_record.finra_best_offer_price[special_long_quote_message_at] = wire[at]; at = at + 1; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> special_long_quote_message_record.finra_best_offer_size[special_long_quote_message_at] = wire[at]; at = at + 1; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> special_long_quote_message_record.finra_best_offer_market_maker_id[special_long_quote_message_at] = wire[at]; at = at + 1; special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  decode_timestamp2(special_long_quote_message_record.timestamp_2);
  special_long_quote_message_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Special Long Quote Message is what was written, byte for byte */
inline equal_special_long_quote_message(special_long_quote_message_read, special_long_quote_message_written) {
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 11 -> assert(special_long_quote_message_read.security_symbol[special_long_quote_message_at] == special_long_quote_message_written.security_symbol[special_long_quote_message_at]); special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  assert(special_long_quote_message_read.instrument_type == special_long_quote_message_written.instrument_type);
  assert(special_long_quote_message_read.quote_condition == special_long_quote_message_written.quote_condition);
  assert(special_long_quote_message_read.security_status_indicator == special_long_quote_message_written.security_status_indicator);
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 8 -> assert(special_long_quote_message_read.bid_price[special_long_quote_message_at] == special_long_quote_message_written.bid_price[special_long_quote_message_at]); special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> assert(special_long_quote_message_read.bid_size[special_long_quote_message_at] == special_long_quote_message_written.bid_size[special_long_quote_message_at]); special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 8 -> assert(special_long_quote_message_read.offer_price[special_long_quote_message_at] == special_long_quote_message_written.offer_price[special_long_quote_message_at]); special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> assert(special_long_quote_message_read.offer_size[special_long_quote_message_at] == special_long_quote_message_written.offer_size[special_long_quote_message_at]); special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  assert(special_long_quote_message_read.retail_interest_indicator == special_long_quote_message_written.retail_interest_indicator);
  assert(special_long_quote_message_read.settlement_condition == special_long_quote_message_written.settlement_condition);
  assert(special_long_quote_message_read.market_condition == special_long_quote_message_written.market_condition);
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> assert(special_long_quote_message_read.finra_market_maker_id[special_long_quote_message_at] == special_long_quote_message_written.finra_market_maker_id[special_long_quote_message_at]); special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  assert(special_long_quote_message_read.finra_best_bid_quote_condition == special_long_quote_message_written.finra_best_bid_quote_condition);
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 8 -> assert(special_long_quote_message_read.finra_best_bid_price[special_long_quote_message_at] == special_long_quote_message_written.finra_best_bid_price[special_long_quote_message_at]); special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> assert(special_long_quote_message_read.finra_best_bid_size[special_long_quote_message_at] == special_long_quote_message_written.finra_best_bid_size[special_long_quote_message_at]); special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> assert(special_long_quote_message_read.finra_best_bid_market_maker_id[special_long_quote_message_at] == special_long_quote_message_written.finra_best_bid_market_maker_id[special_long_quote_message_at]); special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  assert(special_long_quote_message_read.finra_best_offer_quote_condition == special_long_quote_message_written.finra_best_offer_quote_condition);
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 8 -> assert(special_long_quote_message_read.finra_best_offer_price[special_long_quote_message_at] == special_long_quote_message_written.finra_best_offer_price[special_long_quote_message_at]); special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> assert(special_long_quote_message_read.finra_best_offer_size[special_long_quote_message_at] == special_long_quote_message_written.finra_best_offer_size[special_long_quote_message_at]); special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  special_long_quote_message_at = 0;
  do
  :: special_long_quote_message_at < 4 -> assert(special_long_quote_message_read.finra_best_offer_market_maker_id[special_long_quote_message_at] == special_long_quote_message_written.finra_best_offer_market_maker_id[special_long_quote_message_at]); special_long_quote_message_at = special_long_quote_message_at + 1
  :: else -> break
  od;
  equal_timestamp2(special_long_quote_message_read.timestamp_2, special_long_quote_message_written.timestamp_2);
  assert(special_long_quote_message_read.short_sale_restriction_indicator == special_long_quote_message_written.short_sale_restriction_indicator);
  skip
}

/* ---- Trading Status Message: 51 bytes ---------------------------------------- */

/* Allows a Participant that is the listing exchange to notify CQS of Trading Halts, Resumes, Indications, Imbalances, Short Sale Restriction Indicators and LULD Reference Prices. Bidirectional. Supported on both CQS and CTS input lines for redundancy. */
typedef TradingStatusMessage {
  byte security_symbol[11];
  byte instrument_type;
  byte last_price_opening_reopening_luld_reference_price[8];
  byte high_indication_price_upper_limit_price_band[8];
  byte low_indication_price_lower_limit_price_band[8];
  byte buy_volume[4];
  byte sell_volume[4];
  byte security_status;
  byte halt_reason;
  byte short_sale_restriction_indicator;
  byte trading_status_id[4]
};

int trading_status_message_at;

/* every byte of Trading Status Message set to one value */
inline fill_trading_status_message(trading_status_message_record, trading_status_message_value) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 11 -> trading_status_message_record.security_symbol[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.instrument_type = trading_status_message_value;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.last_price_opening_reopening_luld_reference_price[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
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
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.trading_status_id[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Status Message set to where it lies, so a field read out of place says so */
inline ramp_trading_status_message(trading_status_message_record, trading_status_message_base) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 11 -> trading_status_message_record.security_symbol[trading_status_message_at] = (trading_status_message_base + 0 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.instrument_type = (trading_status_message_base + 11 + 1) % 256;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.last_price_opening_reopening_luld_reference_price[trading_status_message_at] = (trading_status_message_base + 12 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.high_indication_price_upper_limit_price_band[trading_status_message_at] = (trading_status_message_base + 20 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.low_indication_price_lower_limit_price_band[trading_status_message_at] = (trading_status_message_base + 28 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.buy_volume[trading_status_message_at] = (trading_status_message_base + 36 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.sell_volume[trading_status_message_at] = (trading_status_message_base + 40 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.security_status = (trading_status_message_base + 44 + 1) % 256;
  trading_status_message_record.halt_reason = (trading_status_message_base + 45 + 1) % 256;
  trading_status_message_record.short_sale_restriction_indicator = (trading_status_message_base + 46 + 1) % 256;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.trading_status_id[trading_status_message_at] = (trading_status_message_base + 47 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Status Message to the wire, 51 bytes from where the cursor stands */
inline encode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 11 -> wire[at] = trading_status_message_record.security_symbol[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_status_message_record.instrument_type; at = at + 1;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> wire[at] = trading_status_message_record.last_price_opening_reopening_luld_reference_price[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
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
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> wire[at] = trading_status_message_record.trading_status_id[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Status Message off the wire, 51 bytes from where the cursor stands */
inline decode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 11 -> trading_status_message_record.security_symbol[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.instrument_type = wire[at]; at = at + 1;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.last_price_opening_reopening_luld_reference_price[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
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
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.trading_status_id[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Status Message is what was written, byte for byte */
inline equal_trading_status_message(trading_status_message_read, trading_status_message_written) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 11 -> assert(trading_status_message_read.security_symbol[trading_status_message_at] == trading_status_message_written.security_symbol[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  assert(trading_status_message_read.instrument_type == trading_status_message_written.instrument_type);
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> assert(trading_status_message_read.last_price_opening_reopening_luld_reference_price[trading_status_message_at] == trading_status_message_written.last_price_opening_reopening_luld_reference_price[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
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
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> assert(trading_status_message_read.trading_status_id[trading_status_message_at] == trading_status_message_written.trading_status_id[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

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
    assert(at == 10);
    at = 0;
    decode_block_header(block_header_got);
    assert(at == 10);
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
    assert(at == 26);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 26);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Rejection Message: encoded, read back, and compared */
proctype check_rejection_message() {
  RejectionMessage rejection_message_sent;
  RejectionMessage rejection_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_rejection_message(rejection_message_sent, 0)
  :: pattern == 1 -> fill_rejection_message(rejection_message_sent, 32)
  :: pattern == 2 -> fill_rejection_message(rejection_message_sent, 255)
  :: else -> ramp_rejection_message(rejection_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_rejection_message(rejection_message_sent);
    assert(at == 14);
    at = 0;
    decode_rejection_message(rejection_message_got);
    assert(at == 14);
    equal_rejection_message(rejection_message_got, rejection_message_sent)
  }
}

/* Warning Message: encoded, read back, and compared */
proctype check_warning_message() {
  WarningMessage warning_message_sent;
  WarningMessage warning_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_warning_message(warning_message_sent, 0)
  :: pattern == 1 -> fill_warning_message(warning_message_sent, 32)
  :: pattern == 2 -> fill_warning_message(warning_message_sent, 255)
  :: else -> ramp_warning_message(warning_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_warning_message(warning_message_sent);
    assert(at == 12);
    at = 0;
    decode_warning_message(warning_message_got);
    assert(at == 12);
    equal_warning_message(warning_message_got, warning_message_sent)
  }
}

/* Sequence Information And Message Count Response Message: encoded, read back, and compared */
proctype check_sequence_information_and_message_count_response_message() {
  SequenceInformationAndMessageCountResponseMessage sequence_information_and_message_count_response_message_sent;
  SequenceInformationAndMessageCountResponseMessage sequence_information_and_message_count_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequence_information_and_message_count_response_message(sequence_information_and_message_count_response_message_sent, 0)
  :: pattern == 1 -> fill_sequence_information_and_message_count_response_message(sequence_information_and_message_count_response_message_sent, 32)
  :: pattern == 2 -> fill_sequence_information_and_message_count_response_message(sequence_information_and_message_count_response_message_sent, 255)
  :: else -> ramp_sequence_information_and_message_count_response_message(sequence_information_and_message_count_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequence_information_and_message_count_response_message(sequence_information_and_message_count_response_message_sent);
    assert(at == 20);
    at = 0;
    decode_sequence_information_and_message_count_response_message(sequence_information_and_message_count_response_message_got);
    assert(at == 20);
    equal_sequence_information_and_message_count_response_message(sequence_information_and_message_count_response_message_got, sequence_information_and_message_count_response_message_sent)
  }
}

/* Odd Lot Refresh Request Message: encoded, read back, and compared */
proctype check_odd_lot_refresh_request_message() {
  OddLotRefreshRequestMessage odd_lot_refresh_request_message_sent;
  OddLotRefreshRequestMessage odd_lot_refresh_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_odd_lot_refresh_request_message(odd_lot_refresh_request_message_sent, 0)
  :: pattern == 1 -> fill_odd_lot_refresh_request_message(odd_lot_refresh_request_message_sent, 32)
  :: pattern == 2 -> fill_odd_lot_refresh_request_message(odd_lot_refresh_request_message_sent, 255)
  :: else -> ramp_odd_lot_refresh_request_message(odd_lot_refresh_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_odd_lot_refresh_request_message(odd_lot_refresh_request_message_sent);
    assert(at == 30);
    at = 0;
    decode_odd_lot_refresh_request_message(odd_lot_refresh_request_message_got);
    assert(at == 30);
    equal_odd_lot_refresh_request_message(odd_lot_refresh_request_message_got, odd_lot_refresh_request_message_sent)
  }
}

/* Test Message: encoded, read back, and compared */
proctype check_test_message() {
  TestMessage test_message_sent;
  TestMessage test_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_test_message(test_message_sent, 0)
  :: pattern == 1 -> fill_test_message(test_message_sent, 32)
  :: pattern == 2 -> fill_test_message(test_message_sent, 255)
  :: else -> ramp_test_message(test_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_test_message(test_message_sent);
    assert(at == 256);
    at = 0;
    decode_test_message(test_message_got);
    assert(at == 256);
    equal_test_message(test_message_got, test_message_sent)
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
    assert(at == 99);
    at = 0;
    decode_auction_status_message(auction_status_message_got);
    assert(at == 99);
    equal_auction_status_message(auction_status_message_got, auction_status_message_sent)
  }
}

/* Short Quote Message: encoded, read back, and compared */
proctype check_short_quote_message() {
  ShortQuoteMessage short_quote_message_sent;
  ShortQuoteMessage short_quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_short_quote_message(short_quote_message_sent, 0)
  :: pattern == 1 -> fill_short_quote_message(short_quote_message_sent, 32)
  :: pattern == 2 -> fill_short_quote_message(short_quote_message_sent, 255)
  :: else -> ramp_short_quote_message(short_quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_short_quote_message(short_quote_message_sent);
    assert(at == 15);
    at = 0;
    decode_short_quote_message(short_quote_message_got);
    assert(at == 15);
    equal_short_quote_message(short_quote_message_got, short_quote_message_sent)
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

/* Long Quote Message: encoded, read back, and compared */
proctype check_long_quote_message() {
  LongQuoteMessage long_quote_message_sent;
  LongQuoteMessage long_quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_long_quote_message(long_quote_message_sent, 0)
  :: pattern == 1 -> fill_long_quote_message(long_quote_message_sent, 32)
  :: pattern == 2 -> fill_long_quote_message(long_quote_message_sent, 255)
  :: else -> ramp_long_quote_message(long_quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_long_quote_message(long_quote_message_sent);
    assert(at == 55);
    at = 0;
    decode_long_quote_message(long_quote_message_got);
    assert(at == 55);
    equal_long_quote_message(long_quote_message_got, long_quote_message_sent)
  }
}

/* Special Long Quote Message: encoded, read back, and compared */
proctype check_special_long_quote_message() {
  SpecialLongQuoteMessage special_long_quote_message_sent;
  SpecialLongQuoteMessage special_long_quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_special_long_quote_message(special_long_quote_message_sent, 0)
  :: pattern == 1 -> fill_special_long_quote_message(special_long_quote_message_sent, 32)
  :: pattern == 2 -> fill_special_long_quote_message(special_long_quote_message_sent, 255)
  :: else -> ramp_special_long_quote_message(special_long_quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_special_long_quote_message(special_long_quote_message_sent);
    assert(at == 88);
    at = 0;
    decode_special_long_quote_message(special_long_quote_message_got);
    assert(at == 88);
    equal_special_long_quote_message(special_long_quote_message_got, special_long_quote_message_sent)
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
    assert(at == 51);
    at = 0;
    decode_trading_status_message(trading_status_message_got);
    assert(at == 51);
    equal_trading_status_message(trading_status_message_got, trading_status_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_block_header()
  :: run check_timestamp1()
  :: run check_message_header()
  :: run check_rejection_message()
  :: run check_warning_message()
  :: run check_sequence_information_and_message_count_response_message()
  :: run check_odd_lot_refresh_request_message()
  :: run check_test_message()
  :: run check_auction_status_message()
  :: run check_short_quote_message()
  :: run check_timestamp2()
  :: run check_long_quote_message()
  :: run check_special_long_quote_message()
  :: run check_trading_status_message()
  fi
}
