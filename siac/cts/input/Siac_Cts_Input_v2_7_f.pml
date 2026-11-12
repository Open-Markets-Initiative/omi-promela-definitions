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

/* Used for all errors to notify a Participant that CTS has found an error in the Block Header, Message Header or Message body of a Participant Input message. */
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

/* Sent from CTS to a Participant in response to a Block Sequence Number Gap. The block will still be processed by CTS. */
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

/* Generated by CTS to a Participant in response to a Sequence Information and Message Count Inquiry message. Transmitted in a separate block. */
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

/* ---- Test Message: 256 bytes ------------------------------------------------- */

/* Generated by CTS or a Participant to exercise the line and verify transmission integrity. Transmitted as the only message in a block. */
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

/* ---- Index Message: 19 bytes ------------------------------------------------- */

/* Contains the index and the index value. */
typedef IndexMessage {
  byte index_symbol[11];
  byte index_value[8]
};

int index_message_at;

/* every byte of Index Message set to one value */
inline fill_index_message(index_message_record, index_message_value) {
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
  index_message_at = 0;
  do
  :: index_message_at < 11 -> index_message_record.index_symbol[index_message_at] = (index_message_base + 0 + index_message_at + 1) % 256; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 8 -> index_message_record.index_value[index_message_at] = (index_message_base + 11 + index_message_at + 1) % 256; index_message_at = index_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Message to the wire, 19 bytes from where the cursor stands */
inline encode_index_message(index_message_record) {
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

/* Index Message off the wire, 19 bytes from where the cursor stands */
inline decode_index_message(index_message_record) {
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

/* ---- Bid And Offer Index Message: 27 bytes ----------------------------------- */

/* Contains the Bid and Offer index values. */
typedef BidAndOfferIndexMessage {
  byte index_symbol[11];
  byte bid_index_value[8];
  byte offer_index_value[8]
};

int bid_and_offer_index_message_at;

/* every byte of Bid And Offer Index Message set to one value */
inline fill_bid_and_offer_index_message(bid_and_offer_index_message_record, bid_and_offer_index_message_value) {
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
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 11 -> bid_and_offer_index_message_record.index_symbol[bid_and_offer_index_message_at] = (bid_and_offer_index_message_base + 0 + bid_and_offer_index_message_at + 1) % 256; bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 8 -> bid_and_offer_index_message_record.bid_index_value[bid_and_offer_index_message_at] = (bid_and_offer_index_message_base + 11 + bid_and_offer_index_message_at + 1) % 256; bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  bid_and_offer_index_message_at = 0;
  do
  :: bid_and_offer_index_message_at < 8 -> bid_and_offer_index_message_record.offer_index_value[bid_and_offer_index_message_at] = (bid_and_offer_index_message_base + 19 + bid_and_offer_index_message_at + 1) % 256; bid_and_offer_index_message_at = bid_and_offer_index_message_at + 1
  :: else -> break
  od;
  skip
}

/* Bid And Offer Index Message to the wire, 27 bytes from where the cursor stands */
inline encode_bid_and_offer_index_message(bid_and_offer_index_message_record) {
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

/* Bid And Offer Index Message off the wire, 27 bytes from where the cursor stands */
inline decode_bid_and_offer_index_message(bid_and_offer_index_message_record) {
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

/* ---- Approximate Trades And Total Dollar Value Message: 12 bytes ------------- */

/* Allows a Participant to report the total trades and total dollar value of trades at their respective market centers. */
typedef ApproximateTradesAndTotalDollarValueMessage {
  byte total_trades[4];
  byte dollar_value[8]
};

int approximate_trades_and_total_dollar_value_message_at;

/* every byte of Approximate Trades And Total Dollar Value Message set to one value */
inline fill_approximate_trades_and_total_dollar_value_message(approximate_trades_and_total_dollar_value_message_record, approximate_trades_and_total_dollar_value_message_value) {
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
  approximate_trades_and_total_dollar_value_message_at = 0;
  do
  :: approximate_trades_and_total_dollar_value_message_at < 4 -> approximate_trades_and_total_dollar_value_message_record.total_trades[approximate_trades_and_total_dollar_value_message_at] = (approximate_trades_and_total_dollar_value_message_base + 0 + approximate_trades_and_total_dollar_value_message_at + 1) % 256; approximate_trades_and_total_dollar_value_message_at = approximate_trades_and_total_dollar_value_message_at + 1
  :: else -> break
  od;
  approximate_trades_and_total_dollar_value_message_at = 0;
  do
  :: approximate_trades_and_total_dollar_value_message_at < 8 -> approximate_trades_and_total_dollar_value_message_record.dollar_value[approximate_trades_and_total_dollar_value_message_at] = (approximate_trades_and_total_dollar_value_message_base + 4 + approximate_trades_and_total_dollar_value_message_at + 1) % 256; approximate_trades_and_total_dollar_value_message_at = approximate_trades_and_total_dollar_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* Approximate Trades And Total Dollar Value Message to the wire, 12 bytes from where the cursor stands */
inline encode_approximate_trades_and_total_dollar_value_message(approximate_trades_and_total_dollar_value_message_record) {
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

/* Approximate Trades And Total Dollar Value Message off the wire, 12 bytes from where the cursor stands */
inline decode_approximate_trades_and_total_dollar_value_message(approximate_trades_and_total_dollar_value_message_record) {
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

/* ---- Crossing Session Message: 24 bytes -------------------------------------- */

/* Used to report the total volume and dollar value of trades transacted after the close of a Participant's regular session. */
typedef CrossingSessionMessage {
  byte crossing_session_i_total_trades_volume[8];
  byte crossing_session_ii_dollar_value[8];
  byte crossing_session_ii_total_trades_volume[8]
};

int crossing_session_message_at;

/* every byte of Crossing Session Message set to one value */
inline fill_crossing_session_message(crossing_session_message_record, crossing_session_message_value) {
  crossing_session_message_at = 0;
  do
  :: crossing_session_message_at < 8 -> crossing_session_message_record.crossing_session_i_total_trades_volume[crossing_session_message_at] = crossing_session_message_value; crossing_session_message_at = crossing_session_message_at + 1
  :: else -> break
  od;
  crossing_session_message_at = 0;
  do
  :: crossing_session_message_at < 8 -> crossing_session_message_record.crossing_session_ii_dollar_value[crossing_session_message_at] = crossing_session_message_value; crossing_session_message_at = crossing_session_message_at + 1
  :: else -> break
  od;
  crossing_session_message_at = 0;
  do
  :: crossing_session_message_at < 8 -> crossing_session_message_record.crossing_session_ii_total_trades_volume[crossing_session_message_at] = crossing_session_message_value; crossing_session_message_at = crossing_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Crossing Session Message set to where it lies, so a field read out of place says so */
inline ramp_crossing_session_message(crossing_session_message_record, crossing_session_message_base) {
  crossing_session_message_at = 0;
  do
  :: crossing_session_message_at < 8 -> crossing_session_message_record.crossing_session_i_total_trades_volume[crossing_session_message_at] = (crossing_session_message_base + 0 + crossing_session_message_at + 1) % 256; crossing_session_message_at = crossing_session_message_at + 1
  :: else -> break
  od;
  crossing_session_message_at = 0;
  do
  :: crossing_session_message_at < 8 -> crossing_session_message_record.crossing_session_ii_dollar_value[crossing_session_message_at] = (crossing_session_message_base + 8 + crossing_session_message_at + 1) % 256; crossing_session_message_at = crossing_session_message_at + 1
  :: else -> break
  od;
  crossing_session_message_at = 0;
  do
  :: crossing_session_message_at < 8 -> crossing_session_message_record.crossing_session_ii_total_trades_volume[crossing_session_message_at] = (crossing_session_message_base + 16 + crossing_session_message_at + 1) % 256; crossing_session_message_at = crossing_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* Crossing Session Message to the wire, 24 bytes from where the cursor stands */
inline encode_crossing_session_message(crossing_session_message_record) {
  crossing_session_message_at = 0;
  do
  :: crossing_session_message_at < 8 -> wire[at] = crossing_session_message_record.crossing_session_i_total_trades_volume[crossing_session_message_at]; at = at + 1; crossing_session_message_at = crossing_session_message_at + 1
  :: else -> break
  od;
  crossing_session_message_at = 0;
  do
  :: crossing_session_message_at < 8 -> wire[at] = crossing_session_message_record.crossing_session_ii_dollar_value[crossing_session_message_at]; at = at + 1; crossing_session_message_at = crossing_session_message_at + 1
  :: else -> break
  od;
  crossing_session_message_at = 0;
  do
  :: crossing_session_message_at < 8 -> wire[at] = crossing_session_message_record.crossing_session_ii_total_trades_volume[crossing_session_message_at]; at = at + 1; crossing_session_message_at = crossing_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* Crossing Session Message off the wire, 24 bytes from where the cursor stands */
inline decode_crossing_session_message(crossing_session_message_record) {
  crossing_session_message_at = 0;
  do
  :: crossing_session_message_at < 8 -> crossing_session_message_record.crossing_session_i_total_trades_volume[crossing_session_message_at] = wire[at]; at = at + 1; crossing_session_message_at = crossing_session_message_at + 1
  :: else -> break
  od;
  crossing_session_message_at = 0;
  do
  :: crossing_session_message_at < 8 -> crossing_session_message_record.crossing_session_ii_dollar_value[crossing_session_message_at] = wire[at]; at = at + 1; crossing_session_message_at = crossing_session_message_at + 1
  :: else -> break
  od;
  crossing_session_message_at = 0;
  do
  :: crossing_session_message_at < 8 -> crossing_session_message_record.crossing_session_ii_total_trades_volume[crossing_session_message_at] = wire[at]; at = at + 1; crossing_session_message_at = crossing_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Crossing Session Message is what was written, byte for byte */
inline equal_crossing_session_message(crossing_session_message_read, crossing_session_message_written) {
  crossing_session_message_at = 0;
  do
  :: crossing_session_message_at < 8 -> assert(crossing_session_message_read.crossing_session_i_total_trades_volume[crossing_session_message_at] == crossing_session_message_written.crossing_session_i_total_trades_volume[crossing_session_message_at]); crossing_session_message_at = crossing_session_message_at + 1
  :: else -> break
  od;
  crossing_session_message_at = 0;
  do
  :: crossing_session_message_at < 8 -> assert(crossing_session_message_read.crossing_session_ii_dollar_value[crossing_session_message_at] == crossing_session_message_written.crossing_session_ii_dollar_value[crossing_session_message_at]); crossing_session_message_at = crossing_session_message_at + 1
  :: else -> break
  od;
  crossing_session_message_at = 0;
  do
  :: crossing_session_message_at < 8 -> assert(crossing_session_message_read.crossing_session_ii_total_trades_volume[crossing_session_message_at] == crossing_session_message_written.crossing_session_ii_total_trades_volume[crossing_session_message_at]); crossing_session_message_at = crossing_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Corrected Prior Day Trade Date And Time: 8 bytes ------------------------ */

/* Corrected Prior Day Trade Date and Time */
typedef CorrectedPriorDayTradeDateAndTime {
  byte seconds[4];
  byte nanoseconds[4]
};

int corrected_prior_day_trade_date_and_time_at;

/* every byte of Corrected Prior Day Trade Date And Time set to one value */
inline fill_corrected_prior_day_trade_date_and_time(corrected_prior_day_trade_date_and_time_record, corrected_prior_day_trade_date_and_time_value) {
  corrected_prior_day_trade_date_and_time_at = 0;
  do
  :: corrected_prior_day_trade_date_and_time_at < 4 -> corrected_prior_day_trade_date_and_time_record.seconds[corrected_prior_day_trade_date_and_time_at] = corrected_prior_day_trade_date_and_time_value; corrected_prior_day_trade_date_and_time_at = corrected_prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  corrected_prior_day_trade_date_and_time_at = 0;
  do
  :: corrected_prior_day_trade_date_and_time_at < 4 -> corrected_prior_day_trade_date_and_time_record.nanoseconds[corrected_prior_day_trade_date_and_time_at] = corrected_prior_day_trade_date_and_time_value; corrected_prior_day_trade_date_and_time_at = corrected_prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Corrected Prior Day Trade Date And Time set to where it lies, so a field read out of place says so */
inline ramp_corrected_prior_day_trade_date_and_time(corrected_prior_day_trade_date_and_time_record, corrected_prior_day_trade_date_and_time_base) {
  corrected_prior_day_trade_date_and_time_at = 0;
  do
  :: corrected_prior_day_trade_date_and_time_at < 4 -> corrected_prior_day_trade_date_and_time_record.seconds[corrected_prior_day_trade_date_and_time_at] = (corrected_prior_day_trade_date_and_time_base + 0 + corrected_prior_day_trade_date_and_time_at + 1) % 256; corrected_prior_day_trade_date_and_time_at = corrected_prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  corrected_prior_day_trade_date_and_time_at = 0;
  do
  :: corrected_prior_day_trade_date_and_time_at < 4 -> corrected_prior_day_trade_date_and_time_record.nanoseconds[corrected_prior_day_trade_date_and_time_at] = (corrected_prior_day_trade_date_and_time_base + 4 + corrected_prior_day_trade_date_and_time_at + 1) % 256; corrected_prior_day_trade_date_and_time_at = corrected_prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  skip
}

/* Corrected Prior Day Trade Date And Time to the wire, 8 bytes from where the cursor stands */
inline encode_corrected_prior_day_trade_date_and_time(corrected_prior_day_trade_date_and_time_record) {
  corrected_prior_day_trade_date_and_time_at = 0;
  do
  :: corrected_prior_day_trade_date_and_time_at < 4 -> wire[at] = corrected_prior_day_trade_date_and_time_record.seconds[corrected_prior_day_trade_date_and_time_at]; at = at + 1; corrected_prior_day_trade_date_and_time_at = corrected_prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  corrected_prior_day_trade_date_and_time_at = 0;
  do
  :: corrected_prior_day_trade_date_and_time_at < 4 -> wire[at] = corrected_prior_day_trade_date_and_time_record.nanoseconds[corrected_prior_day_trade_date_and_time_at]; at = at + 1; corrected_prior_day_trade_date_and_time_at = corrected_prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  skip
}

/* Corrected Prior Day Trade Date And Time off the wire, 8 bytes from where the cursor stands */
inline decode_corrected_prior_day_trade_date_and_time(corrected_prior_day_trade_date_and_time_record) {
  corrected_prior_day_trade_date_and_time_at = 0;
  do
  :: corrected_prior_day_trade_date_and_time_at < 4 -> corrected_prior_day_trade_date_and_time_record.seconds[corrected_prior_day_trade_date_and_time_at] = wire[at]; at = at + 1; corrected_prior_day_trade_date_and_time_at = corrected_prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  corrected_prior_day_trade_date_and_time_at = 0;
  do
  :: corrected_prior_day_trade_date_and_time_at < 4 -> corrected_prior_day_trade_date_and_time_record.nanoseconds[corrected_prior_day_trade_date_and_time_at] = wire[at]; at = at + 1; corrected_prior_day_trade_date_and_time_at = corrected_prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Corrected Prior Day Trade Date And Time is what was written, byte for byte */
inline equal_corrected_prior_day_trade_date_and_time(corrected_prior_day_trade_date_and_time_read, corrected_prior_day_trade_date_and_time_written) {
  corrected_prior_day_trade_date_and_time_at = 0;
  do
  :: corrected_prior_day_trade_date_and_time_at < 4 -> assert(corrected_prior_day_trade_date_and_time_read.seconds[corrected_prior_day_trade_date_and_time_at] == corrected_prior_day_trade_date_and_time_written.seconds[corrected_prior_day_trade_date_and_time_at]); corrected_prior_day_trade_date_and_time_at = corrected_prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  corrected_prior_day_trade_date_and_time_at = 0;
  do
  :: corrected_prior_day_trade_date_and_time_at < 4 -> assert(corrected_prior_day_trade_date_and_time_read.nanoseconds[corrected_prior_day_trade_date_and_time_at] == corrected_prior_day_trade_date_and_time_written.nanoseconds[corrected_prior_day_trade_date_and_time_at]); corrected_prior_day_trade_date_and_time_at = corrected_prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Original Prior Day Trade Date And Time: 8 bytes ------------------------- */

/* Original Prior Day Trade Date and Time */
typedef OriginalPriorDayTradeDateAndTime {
  byte seconds[4];
  byte nanoseconds[4]
};

int original_prior_day_trade_date_and_time_at;

/* every byte of Original Prior Day Trade Date And Time set to one value */
inline fill_original_prior_day_trade_date_and_time(original_prior_day_trade_date_and_time_record, original_prior_day_trade_date_and_time_value) {
  original_prior_day_trade_date_and_time_at = 0;
  do
  :: original_prior_day_trade_date_and_time_at < 4 -> original_prior_day_trade_date_and_time_record.seconds[original_prior_day_trade_date_and_time_at] = original_prior_day_trade_date_and_time_value; original_prior_day_trade_date_and_time_at = original_prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  original_prior_day_trade_date_and_time_at = 0;
  do
  :: original_prior_day_trade_date_and_time_at < 4 -> original_prior_day_trade_date_and_time_record.nanoseconds[original_prior_day_trade_date_and_time_at] = original_prior_day_trade_date_and_time_value; original_prior_day_trade_date_and_time_at = original_prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Original Prior Day Trade Date And Time set to where it lies, so a field read out of place says so */
inline ramp_original_prior_day_trade_date_and_time(original_prior_day_trade_date_and_time_record, original_prior_day_trade_date_and_time_base) {
  original_prior_day_trade_date_and_time_at = 0;
  do
  :: original_prior_day_trade_date_and_time_at < 4 -> original_prior_day_trade_date_and_time_record.seconds[original_prior_day_trade_date_and_time_at] = (original_prior_day_trade_date_and_time_base + 0 + original_prior_day_trade_date_and_time_at + 1) % 256; original_prior_day_trade_date_and_time_at = original_prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  original_prior_day_trade_date_and_time_at = 0;
  do
  :: original_prior_day_trade_date_and_time_at < 4 -> original_prior_day_trade_date_and_time_record.nanoseconds[original_prior_day_trade_date_and_time_at] = (original_prior_day_trade_date_and_time_base + 4 + original_prior_day_trade_date_and_time_at + 1) % 256; original_prior_day_trade_date_and_time_at = original_prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  skip
}

/* Original Prior Day Trade Date And Time to the wire, 8 bytes from where the cursor stands */
inline encode_original_prior_day_trade_date_and_time(original_prior_day_trade_date_and_time_record) {
  original_prior_day_trade_date_and_time_at = 0;
  do
  :: original_prior_day_trade_date_and_time_at < 4 -> wire[at] = original_prior_day_trade_date_and_time_record.seconds[original_prior_day_trade_date_and_time_at]; at = at + 1; original_prior_day_trade_date_and_time_at = original_prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  original_prior_day_trade_date_and_time_at = 0;
  do
  :: original_prior_day_trade_date_and_time_at < 4 -> wire[at] = original_prior_day_trade_date_and_time_record.nanoseconds[original_prior_day_trade_date_and_time_at]; at = at + 1; original_prior_day_trade_date_and_time_at = original_prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  skip
}

/* Original Prior Day Trade Date And Time off the wire, 8 bytes from where the cursor stands */
inline decode_original_prior_day_trade_date_and_time(original_prior_day_trade_date_and_time_record) {
  original_prior_day_trade_date_and_time_at = 0;
  do
  :: original_prior_day_trade_date_and_time_at < 4 -> original_prior_day_trade_date_and_time_record.seconds[original_prior_day_trade_date_and_time_at] = wire[at]; at = at + 1; original_prior_day_trade_date_and_time_at = original_prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  original_prior_day_trade_date_and_time_at = 0;
  do
  :: original_prior_day_trade_date_and_time_at < 4 -> original_prior_day_trade_date_and_time_record.nanoseconds[original_prior_day_trade_date_and_time_at] = wire[at]; at = at + 1; original_prior_day_trade_date_and_time_at = original_prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Original Prior Day Trade Date And Time is what was written, byte for byte */
inline equal_original_prior_day_trade_date_and_time(original_prior_day_trade_date_and_time_read, original_prior_day_trade_date_and_time_written) {
  original_prior_day_trade_date_and_time_at = 0;
  do
  :: original_prior_day_trade_date_and_time_at < 4 -> assert(original_prior_day_trade_date_and_time_read.seconds[original_prior_day_trade_date_and_time_at] == original_prior_day_trade_date_and_time_written.seconds[original_prior_day_trade_date_and_time_at]); original_prior_day_trade_date_and_time_at = original_prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  original_prior_day_trade_date_and_time_at = 0;
  do
  :: original_prior_day_trade_date_and_time_at < 4 -> assert(original_prior_day_trade_date_and_time_read.nanoseconds[original_prior_day_trade_date_and_time_at] == original_prior_day_trade_date_and_time_written.nanoseconds[original_prior_day_trade_date_and_time_at]); original_prior_day_trade_date_and_time_at = original_prior_day_trade_date_and_time_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Prior Day Trade Correction Message: 69 bytes ---------------------------- */

/* Used to correct a transaction originally reported earlier than the current day. */
typedef PriorDayTradeCorrectionMessage {
  byte security_symbol[11];
  byte instrument_type;
  byte corrected_sale_condition[4];
  byte corrected_trade_price[8];
  byte corrected_trade_volume[4];
  byte corrected_sellers_sale_days;
  byte corrected_stop_stock_indicator;
  byte corrected_trade_through_exempt_indicator;
  byte corrected_short_sale_restriction_indicator;
  CorrectedPriorDayTradeDateAndTime corrected_prior_d_4u6u6a;
  byte trade_reporting_facility_id;
  byte original_sale_condition[4];
  byte original_trade_price[8];
  byte original_trade_volume[4];
  byte original_sellers_sale_days;
  byte original_stop_stock_indicator;
  byte original_trade_through_exempt_indicator;
  byte original_short_sale_restriction_indicator;
  OriginalPriorDayTradeDateAndTime original_prior_da_b4iazc
};

int prior_day_trade_correction_message_at;

/* every byte of Prior Day Trade Correction Message set to one value */
inline fill_prior_day_trade_correction_message(prior_day_trade_correction_message_record, prior_day_trade_correction_message_value) {
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 11 -> prior_day_trade_correction_message_record.security_symbol[prior_day_trade_correction_message_at] = prior_day_trade_correction_message_value; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_record.instrument_type = prior_day_trade_correction_message_value;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 4 -> prior_day_trade_correction_message_record.corrected_sale_condition[prior_day_trade_correction_message_at] = prior_day_trade_correction_message_value; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 8 -> prior_day_trade_correction_message_record.corrected_trade_price[prior_day_trade_correction_message_at] = prior_day_trade_correction_message_value; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 4 -> prior_day_trade_correction_message_record.corrected_trade_volume[prior_day_trade_correction_message_at] = prior_day_trade_correction_message_value; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_record.corrected_sellers_sale_days = prior_day_trade_correction_message_value;
  prior_day_trade_correction_message_record.corrected_stop_stock_indicator = prior_day_trade_correction_message_value;
  prior_day_trade_correction_message_record.corrected_trade_through_exempt_indicator = prior_day_trade_correction_message_value;
  prior_day_trade_correction_message_record.corrected_short_sale_restriction_indicator = prior_day_trade_correction_message_value;
  fill_corrected_prior_day_trade_date_and_time(prior_day_trade_correction_message_record.corrected_prior_d_4u6u6a, prior_day_trade_correction_message_value);
  prior_day_trade_correction_message_record.trade_reporting_facility_id = prior_day_trade_correction_message_value;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 4 -> prior_day_trade_correction_message_record.original_sale_condition[prior_day_trade_correction_message_at] = prior_day_trade_correction_message_value; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 8 -> prior_day_trade_correction_message_record.original_trade_price[prior_day_trade_correction_message_at] = prior_day_trade_correction_message_value; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 4 -> prior_day_trade_correction_message_record.original_trade_volume[prior_day_trade_correction_message_at] = prior_day_trade_correction_message_value; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_record.original_sellers_sale_days = prior_day_trade_correction_message_value;
  prior_day_trade_correction_message_record.original_stop_stock_indicator = prior_day_trade_correction_message_value;
  prior_day_trade_correction_message_record.original_trade_through_exempt_indicator = prior_day_trade_correction_message_value;
  prior_day_trade_correction_message_record.original_short_sale_restriction_indicator = prior_day_trade_correction_message_value;
  fill_original_prior_day_trade_date_and_time(prior_day_trade_correction_message_record.original_prior_da_b4iazc, prior_day_trade_correction_message_value);
  skip
}

/* each byte of Prior Day Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_prior_day_trade_correction_message(prior_day_trade_correction_message_record, prior_day_trade_correction_message_base) {
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 11 -> prior_day_trade_correction_message_record.security_symbol[prior_day_trade_correction_message_at] = (prior_day_trade_correction_message_base + 0 + prior_day_trade_correction_message_at + 1) % 256; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_record.instrument_type = (prior_day_trade_correction_message_base + 11 + 1) % 256;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 4 -> prior_day_trade_correction_message_record.corrected_sale_condition[prior_day_trade_correction_message_at] = (prior_day_trade_correction_message_base + 12 + prior_day_trade_correction_message_at + 1) % 256; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 8 -> prior_day_trade_correction_message_record.corrected_trade_price[prior_day_trade_correction_message_at] = (prior_day_trade_correction_message_base + 16 + prior_day_trade_correction_message_at + 1) % 256; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 4 -> prior_day_trade_correction_message_record.corrected_trade_volume[prior_day_trade_correction_message_at] = (prior_day_trade_correction_message_base + 24 + prior_day_trade_correction_message_at + 1) % 256; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_record.corrected_sellers_sale_days = (prior_day_trade_correction_message_base + 28 + 1) % 256;
  prior_day_trade_correction_message_record.corrected_stop_stock_indicator = (prior_day_trade_correction_message_base + 29 + 1) % 256;
  prior_day_trade_correction_message_record.corrected_trade_through_exempt_indicator = (prior_day_trade_correction_message_base + 30 + 1) % 256;
  prior_day_trade_correction_message_record.corrected_short_sale_restriction_indicator = (prior_day_trade_correction_message_base + 31 + 1) % 256;
  ramp_corrected_prior_day_trade_date_and_time(prior_day_trade_correction_message_record.corrected_prior_d_4u6u6a, prior_day_trade_correction_message_base + 32);
  prior_day_trade_correction_message_record.trade_reporting_facility_id = (prior_day_trade_correction_message_base + 40 + 1) % 256;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 4 -> prior_day_trade_correction_message_record.original_sale_condition[prior_day_trade_correction_message_at] = (prior_day_trade_correction_message_base + 41 + prior_day_trade_correction_message_at + 1) % 256; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 8 -> prior_day_trade_correction_message_record.original_trade_price[prior_day_trade_correction_message_at] = (prior_day_trade_correction_message_base + 45 + prior_day_trade_correction_message_at + 1) % 256; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 4 -> prior_day_trade_correction_message_record.original_trade_volume[prior_day_trade_correction_message_at] = (prior_day_trade_correction_message_base + 53 + prior_day_trade_correction_message_at + 1) % 256; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_record.original_sellers_sale_days = (prior_day_trade_correction_message_base + 57 + 1) % 256;
  prior_day_trade_correction_message_record.original_stop_stock_indicator = (prior_day_trade_correction_message_base + 58 + 1) % 256;
  prior_day_trade_correction_message_record.original_trade_through_exempt_indicator = (prior_day_trade_correction_message_base + 59 + 1) % 256;
  prior_day_trade_correction_message_record.original_short_sale_restriction_indicator = (prior_day_trade_correction_message_base + 60 + 1) % 256;
  ramp_original_prior_day_trade_date_and_time(prior_day_trade_correction_message_record.original_prior_da_b4iazc, prior_day_trade_correction_message_base + 61);
  skip
}

/* Prior Day Trade Correction Message to the wire, 69 bytes from where the cursor stands */
inline encode_prior_day_trade_correction_message(prior_day_trade_correction_message_record) {
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 11 -> wire[at] = prior_day_trade_correction_message_record.security_symbol[prior_day_trade_correction_message_at]; at = at + 1; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = prior_day_trade_correction_message_record.instrument_type; at = at + 1;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 4 -> wire[at] = prior_day_trade_correction_message_record.corrected_sale_condition[prior_day_trade_correction_message_at]; at = at + 1; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 8 -> wire[at] = prior_day_trade_correction_message_record.corrected_trade_price[prior_day_trade_correction_message_at]; at = at + 1; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 4 -> wire[at] = prior_day_trade_correction_message_record.corrected_trade_volume[prior_day_trade_correction_message_at]; at = at + 1; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = prior_day_trade_correction_message_record.corrected_sellers_sale_days; at = at + 1;
  wire[at] = prior_day_trade_correction_message_record.corrected_stop_stock_indicator; at = at + 1;
  wire[at] = prior_day_trade_correction_message_record.corrected_trade_through_exempt_indicator; at = at + 1;
  wire[at] = prior_day_trade_correction_message_record.corrected_short_sale_restriction_indicator; at = at + 1;
  encode_corrected_prior_day_trade_date_and_time(prior_day_trade_correction_message_record.corrected_prior_d_4u6u6a);
  wire[at] = prior_day_trade_correction_message_record.trade_reporting_facility_id; at = at + 1;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 4 -> wire[at] = prior_day_trade_correction_message_record.original_sale_condition[prior_day_trade_correction_message_at]; at = at + 1; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 8 -> wire[at] = prior_day_trade_correction_message_record.original_trade_price[prior_day_trade_correction_message_at]; at = at + 1; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 4 -> wire[at] = prior_day_trade_correction_message_record.original_trade_volume[prior_day_trade_correction_message_at]; at = at + 1; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = prior_day_trade_correction_message_record.original_sellers_sale_days; at = at + 1;
  wire[at] = prior_day_trade_correction_message_record.original_stop_stock_indicator; at = at + 1;
  wire[at] = prior_day_trade_correction_message_record.original_trade_through_exempt_indicator; at = at + 1;
  wire[at] = prior_day_trade_correction_message_record.original_short_sale_restriction_indicator; at = at + 1;
  encode_original_prior_day_trade_date_and_time(prior_day_trade_correction_message_record.original_prior_da_b4iazc);
  skip
}

/* Prior Day Trade Correction Message off the wire, 69 bytes from where the cursor stands */
inline decode_prior_day_trade_correction_message(prior_day_trade_correction_message_record) {
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 11 -> prior_day_trade_correction_message_record.security_symbol[prior_day_trade_correction_message_at] = wire[at]; at = at + 1; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_record.instrument_type = wire[at]; at = at + 1;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 4 -> prior_day_trade_correction_message_record.corrected_sale_condition[prior_day_trade_correction_message_at] = wire[at]; at = at + 1; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 8 -> prior_day_trade_correction_message_record.corrected_trade_price[prior_day_trade_correction_message_at] = wire[at]; at = at + 1; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 4 -> prior_day_trade_correction_message_record.corrected_trade_volume[prior_day_trade_correction_message_at] = wire[at]; at = at + 1; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_record.corrected_sellers_sale_days = wire[at]; at = at + 1;
  prior_day_trade_correction_message_record.corrected_stop_stock_indicator = wire[at]; at = at + 1;
  prior_day_trade_correction_message_record.corrected_trade_through_exempt_indicator = wire[at]; at = at + 1;
  prior_day_trade_correction_message_record.corrected_short_sale_restriction_indicator = wire[at]; at = at + 1;
  decode_corrected_prior_day_trade_date_and_time(prior_day_trade_correction_message_record.corrected_prior_d_4u6u6a);
  prior_day_trade_correction_message_record.trade_reporting_facility_id = wire[at]; at = at + 1;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 4 -> prior_day_trade_correction_message_record.original_sale_condition[prior_day_trade_correction_message_at] = wire[at]; at = at + 1; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 8 -> prior_day_trade_correction_message_record.original_trade_price[prior_day_trade_correction_message_at] = wire[at]; at = at + 1; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 4 -> prior_day_trade_correction_message_record.original_trade_volume[prior_day_trade_correction_message_at] = wire[at]; at = at + 1; prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_record.original_sellers_sale_days = wire[at]; at = at + 1;
  prior_day_trade_correction_message_record.original_stop_stock_indicator = wire[at]; at = at + 1;
  prior_day_trade_correction_message_record.original_trade_through_exempt_indicator = wire[at]; at = at + 1;
  prior_day_trade_correction_message_record.original_short_sale_restriction_indicator = wire[at]; at = at + 1;
  decode_original_prior_day_trade_date_and_time(prior_day_trade_correction_message_record.original_prior_da_b4iazc);
  skip
}

/* what was read of Prior Day Trade Correction Message is what was written, byte for byte */
inline equal_prior_day_trade_correction_message(prior_day_trade_correction_message_read, prior_day_trade_correction_message_written) {
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 11 -> assert(prior_day_trade_correction_message_read.security_symbol[prior_day_trade_correction_message_at] == prior_day_trade_correction_message_written.security_symbol[prior_day_trade_correction_message_at]); prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  assert(prior_day_trade_correction_message_read.instrument_type == prior_day_trade_correction_message_written.instrument_type);
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 4 -> assert(prior_day_trade_correction_message_read.corrected_sale_condition[prior_day_trade_correction_message_at] == prior_day_trade_correction_message_written.corrected_sale_condition[prior_day_trade_correction_message_at]); prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 8 -> assert(prior_day_trade_correction_message_read.corrected_trade_price[prior_day_trade_correction_message_at] == prior_day_trade_correction_message_written.corrected_trade_price[prior_day_trade_correction_message_at]); prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 4 -> assert(prior_day_trade_correction_message_read.corrected_trade_volume[prior_day_trade_correction_message_at] == prior_day_trade_correction_message_written.corrected_trade_volume[prior_day_trade_correction_message_at]); prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  assert(prior_day_trade_correction_message_read.corrected_sellers_sale_days == prior_day_trade_correction_message_written.corrected_sellers_sale_days);
  assert(prior_day_trade_correction_message_read.corrected_stop_stock_indicator == prior_day_trade_correction_message_written.corrected_stop_stock_indicator);
  assert(prior_day_trade_correction_message_read.corrected_trade_through_exempt_indicator == prior_day_trade_correction_message_written.corrected_trade_through_exempt_indicator);
  assert(prior_day_trade_correction_message_read.corrected_short_sale_restriction_indicator == prior_day_trade_correction_message_written.corrected_short_sale_restriction_indicator);
  equal_corrected_prior_day_trade_date_and_time(prior_day_trade_correction_message_read.corrected_prior_d_4u6u6a, prior_day_trade_correction_message_written.corrected_prior_d_4u6u6a);
  assert(prior_day_trade_correction_message_read.trade_reporting_facility_id == prior_day_trade_correction_message_written.trade_reporting_facility_id);
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 4 -> assert(prior_day_trade_correction_message_read.original_sale_condition[prior_day_trade_correction_message_at] == prior_day_trade_correction_message_written.original_sale_condition[prior_day_trade_correction_message_at]); prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 8 -> assert(prior_day_trade_correction_message_read.original_trade_price[prior_day_trade_correction_message_at] == prior_day_trade_correction_message_written.original_trade_price[prior_day_trade_correction_message_at]); prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  prior_day_trade_correction_message_at = 0;
  do
  :: prior_day_trade_correction_message_at < 4 -> assert(prior_day_trade_correction_message_read.original_trade_volume[prior_day_trade_correction_message_at] == prior_day_trade_correction_message_written.original_trade_volume[prior_day_trade_correction_message_at]); prior_day_trade_correction_message_at = prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  assert(prior_day_trade_correction_message_read.original_sellers_sale_days == prior_day_trade_correction_message_written.original_sellers_sale_days);
  assert(prior_day_trade_correction_message_read.original_stop_stock_indicator == prior_day_trade_correction_message_written.original_stop_stock_indicator);
  assert(prior_day_trade_correction_message_read.original_trade_through_exempt_indicator == prior_day_trade_correction_message_written.original_trade_through_exempt_indicator);
  assert(prior_day_trade_correction_message_read.original_short_sale_restriction_indicator == prior_day_trade_correction_message_written.original_short_sale_restriction_indicator);
  equal_original_prior_day_trade_date_and_time(prior_day_trade_correction_message_read.original_prior_da_b4iazc, prior_day_trade_correction_message_written.original_prior_da_b4iazc);
  skip
}

/* ---- Fractional Prior Day Trade Correction Message: 77 bytes ----------------- */

/* Used to correct a prior day transaction when either the original or corrected volume is a fractional value. */
typedef FractionalPriorDayTradeCorrectionMessage {
  byte security_symbol[11];
  byte instrument_type;
  byte corrected_sale_condition[4];
  byte corrected_trade_price[8];
  byte corrected_fractional_trade_volume[8];
  byte corrected_sellers_sale_days;
  byte corrected_stop_stock_indicator;
  byte corrected_trade_through_exempt_indicator;
  byte corrected_short_sale_restriction_indicator;
  CorrectedPriorDayTradeDateAndTime corrected_prior_d_4u6u6a;
  byte trade_reporting_facility_id;
  byte original_sale_condition[4];
  byte original_trade_price[8];
  byte original_fractional_trade_volume[8];
  byte original_sellers_sale_days;
  byte original_stop_stock_indicator;
  byte original_trade_through_exempt_indicator;
  byte original_short_sale_restriction_indicator;
  OriginalPriorDayTradeDateAndTime original_prior_da_b4iazc
};

int fractional_prior_day_trade_correction_message_at;

/* every byte of Fractional Prior Day Trade Correction Message set to one value */
inline fill_fractional_prior_day_trade_correction_message(fractional_prior_day_trade_correction_message_record, fractional_prior_day_trade_correction_message_value) {
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 11 -> fractional_prior_day_trade_correction_message_record.security_symbol[fractional_prior_day_trade_correction_message_at] = fractional_prior_day_trade_correction_message_value; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_record.instrument_type = fractional_prior_day_trade_correction_message_value;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 4 -> fractional_prior_day_trade_correction_message_record.corrected_sale_condition[fractional_prior_day_trade_correction_message_at] = fractional_prior_day_trade_correction_message_value; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 8 -> fractional_prior_day_trade_correction_message_record.corrected_trade_price[fractional_prior_day_trade_correction_message_at] = fractional_prior_day_trade_correction_message_value; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 8 -> fractional_prior_day_trade_correction_message_record.corrected_fractional_trade_volume[fractional_prior_day_trade_correction_message_at] = fractional_prior_day_trade_correction_message_value; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_record.corrected_sellers_sale_days = fractional_prior_day_trade_correction_message_value;
  fractional_prior_day_trade_correction_message_record.corrected_stop_stock_indicator = fractional_prior_day_trade_correction_message_value;
  fractional_prior_day_trade_correction_message_record.corrected_trade_through_exempt_indicator = fractional_prior_day_trade_correction_message_value;
  fractional_prior_day_trade_correction_message_record.corrected_short_sale_restriction_indicator = fractional_prior_day_trade_correction_message_value;
  fill_corrected_prior_day_trade_date_and_time(fractional_prior_day_trade_correction_message_record.corrected_prior_d_4u6u6a, fractional_prior_day_trade_correction_message_value);
  fractional_prior_day_trade_correction_message_record.trade_reporting_facility_id = fractional_prior_day_trade_correction_message_value;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 4 -> fractional_prior_day_trade_correction_message_record.original_sale_condition[fractional_prior_day_trade_correction_message_at] = fractional_prior_day_trade_correction_message_value; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 8 -> fractional_prior_day_trade_correction_message_record.original_trade_price[fractional_prior_day_trade_correction_message_at] = fractional_prior_day_trade_correction_message_value; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 8 -> fractional_prior_day_trade_correction_message_record.original_fractional_trade_volume[fractional_prior_day_trade_correction_message_at] = fractional_prior_day_trade_correction_message_value; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_record.original_sellers_sale_days = fractional_prior_day_trade_correction_message_value;
  fractional_prior_day_trade_correction_message_record.original_stop_stock_indicator = fractional_prior_day_trade_correction_message_value;
  fractional_prior_day_trade_correction_message_record.original_trade_through_exempt_indicator = fractional_prior_day_trade_correction_message_value;
  fractional_prior_day_trade_correction_message_record.original_short_sale_restriction_indicator = fractional_prior_day_trade_correction_message_value;
  fill_original_prior_day_trade_date_and_time(fractional_prior_day_trade_correction_message_record.original_prior_da_b4iazc, fractional_prior_day_trade_correction_message_value);
  skip
}

/* each byte of Fractional Prior Day Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_fractional_prior_day_trade_correction_message(fractional_prior_day_trade_correction_message_record, fractional_prior_day_trade_correction_message_base) {
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 11 -> fractional_prior_day_trade_correction_message_record.security_symbol[fractional_prior_day_trade_correction_message_at] = (fractional_prior_day_trade_correction_message_base + 0 + fractional_prior_day_trade_correction_message_at + 1) % 256; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_record.instrument_type = (fractional_prior_day_trade_correction_message_base + 11 + 1) % 256;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 4 -> fractional_prior_day_trade_correction_message_record.corrected_sale_condition[fractional_prior_day_trade_correction_message_at] = (fractional_prior_day_trade_correction_message_base + 12 + fractional_prior_day_trade_correction_message_at + 1) % 256; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 8 -> fractional_prior_day_trade_correction_message_record.corrected_trade_price[fractional_prior_day_trade_correction_message_at] = (fractional_prior_day_trade_correction_message_base + 16 + fractional_prior_day_trade_correction_message_at + 1) % 256; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 8 -> fractional_prior_day_trade_correction_message_record.corrected_fractional_trade_volume[fractional_prior_day_trade_correction_message_at] = (fractional_prior_day_trade_correction_message_base + 24 + fractional_prior_day_trade_correction_message_at + 1) % 256; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_record.corrected_sellers_sale_days = (fractional_prior_day_trade_correction_message_base + 32 + 1) % 256;
  fractional_prior_day_trade_correction_message_record.corrected_stop_stock_indicator = (fractional_prior_day_trade_correction_message_base + 33 + 1) % 256;
  fractional_prior_day_trade_correction_message_record.corrected_trade_through_exempt_indicator = (fractional_prior_day_trade_correction_message_base + 34 + 1) % 256;
  fractional_prior_day_trade_correction_message_record.corrected_short_sale_restriction_indicator = (fractional_prior_day_trade_correction_message_base + 35 + 1) % 256;
  ramp_corrected_prior_day_trade_date_and_time(fractional_prior_day_trade_correction_message_record.corrected_prior_d_4u6u6a, fractional_prior_day_trade_correction_message_base + 36);
  fractional_prior_day_trade_correction_message_record.trade_reporting_facility_id = (fractional_prior_day_trade_correction_message_base + 44 + 1) % 256;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 4 -> fractional_prior_day_trade_correction_message_record.original_sale_condition[fractional_prior_day_trade_correction_message_at] = (fractional_prior_day_trade_correction_message_base + 45 + fractional_prior_day_trade_correction_message_at + 1) % 256; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 8 -> fractional_prior_day_trade_correction_message_record.original_trade_price[fractional_prior_day_trade_correction_message_at] = (fractional_prior_day_trade_correction_message_base + 49 + fractional_prior_day_trade_correction_message_at + 1) % 256; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 8 -> fractional_prior_day_trade_correction_message_record.original_fractional_trade_volume[fractional_prior_day_trade_correction_message_at] = (fractional_prior_day_trade_correction_message_base + 57 + fractional_prior_day_trade_correction_message_at + 1) % 256; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_record.original_sellers_sale_days = (fractional_prior_day_trade_correction_message_base + 65 + 1) % 256;
  fractional_prior_day_trade_correction_message_record.original_stop_stock_indicator = (fractional_prior_day_trade_correction_message_base + 66 + 1) % 256;
  fractional_prior_day_trade_correction_message_record.original_trade_through_exempt_indicator = (fractional_prior_day_trade_correction_message_base + 67 + 1) % 256;
  fractional_prior_day_trade_correction_message_record.original_short_sale_restriction_indicator = (fractional_prior_day_trade_correction_message_base + 68 + 1) % 256;
  ramp_original_prior_day_trade_date_and_time(fractional_prior_day_trade_correction_message_record.original_prior_da_b4iazc, fractional_prior_day_trade_correction_message_base + 69);
  skip
}

/* Fractional Prior Day Trade Correction Message to the wire, 77 bytes from where the cursor stands */
inline encode_fractional_prior_day_trade_correction_message(fractional_prior_day_trade_correction_message_record) {
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 11 -> wire[at] = fractional_prior_day_trade_correction_message_record.security_symbol[fractional_prior_day_trade_correction_message_at]; at = at + 1; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_prior_day_trade_correction_message_record.instrument_type; at = at + 1;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 4 -> wire[at] = fractional_prior_day_trade_correction_message_record.corrected_sale_condition[fractional_prior_day_trade_correction_message_at]; at = at + 1; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 8 -> wire[at] = fractional_prior_day_trade_correction_message_record.corrected_trade_price[fractional_prior_day_trade_correction_message_at]; at = at + 1; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 8 -> wire[at] = fractional_prior_day_trade_correction_message_record.corrected_fractional_trade_volume[fractional_prior_day_trade_correction_message_at]; at = at + 1; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_prior_day_trade_correction_message_record.corrected_sellers_sale_days; at = at + 1;
  wire[at] = fractional_prior_day_trade_correction_message_record.corrected_stop_stock_indicator; at = at + 1;
  wire[at] = fractional_prior_day_trade_correction_message_record.corrected_trade_through_exempt_indicator; at = at + 1;
  wire[at] = fractional_prior_day_trade_correction_message_record.corrected_short_sale_restriction_indicator; at = at + 1;
  encode_corrected_prior_day_trade_date_and_time(fractional_prior_day_trade_correction_message_record.corrected_prior_d_4u6u6a);
  wire[at] = fractional_prior_day_trade_correction_message_record.trade_reporting_facility_id; at = at + 1;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 4 -> wire[at] = fractional_prior_day_trade_correction_message_record.original_sale_condition[fractional_prior_day_trade_correction_message_at]; at = at + 1; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 8 -> wire[at] = fractional_prior_day_trade_correction_message_record.original_trade_price[fractional_prior_day_trade_correction_message_at]; at = at + 1; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 8 -> wire[at] = fractional_prior_day_trade_correction_message_record.original_fractional_trade_volume[fractional_prior_day_trade_correction_message_at]; at = at + 1; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_prior_day_trade_correction_message_record.original_sellers_sale_days; at = at + 1;
  wire[at] = fractional_prior_day_trade_correction_message_record.original_stop_stock_indicator; at = at + 1;
  wire[at] = fractional_prior_day_trade_correction_message_record.original_trade_through_exempt_indicator; at = at + 1;
  wire[at] = fractional_prior_day_trade_correction_message_record.original_short_sale_restriction_indicator; at = at + 1;
  encode_original_prior_day_trade_date_and_time(fractional_prior_day_trade_correction_message_record.original_prior_da_b4iazc);
  skip
}

/* Fractional Prior Day Trade Correction Message off the wire, 77 bytes from where the cursor stands */
inline decode_fractional_prior_day_trade_correction_message(fractional_prior_day_trade_correction_message_record) {
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 11 -> fractional_prior_day_trade_correction_message_record.security_symbol[fractional_prior_day_trade_correction_message_at] = wire[at]; at = at + 1; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_record.instrument_type = wire[at]; at = at + 1;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 4 -> fractional_prior_day_trade_correction_message_record.corrected_sale_condition[fractional_prior_day_trade_correction_message_at] = wire[at]; at = at + 1; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 8 -> fractional_prior_day_trade_correction_message_record.corrected_trade_price[fractional_prior_day_trade_correction_message_at] = wire[at]; at = at + 1; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 8 -> fractional_prior_day_trade_correction_message_record.corrected_fractional_trade_volume[fractional_prior_day_trade_correction_message_at] = wire[at]; at = at + 1; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_record.corrected_sellers_sale_days = wire[at]; at = at + 1;
  fractional_prior_day_trade_correction_message_record.corrected_stop_stock_indicator = wire[at]; at = at + 1;
  fractional_prior_day_trade_correction_message_record.corrected_trade_through_exempt_indicator = wire[at]; at = at + 1;
  fractional_prior_day_trade_correction_message_record.corrected_short_sale_restriction_indicator = wire[at]; at = at + 1;
  decode_corrected_prior_day_trade_date_and_time(fractional_prior_day_trade_correction_message_record.corrected_prior_d_4u6u6a);
  fractional_prior_day_trade_correction_message_record.trade_reporting_facility_id = wire[at]; at = at + 1;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 4 -> fractional_prior_day_trade_correction_message_record.original_sale_condition[fractional_prior_day_trade_correction_message_at] = wire[at]; at = at + 1; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 8 -> fractional_prior_day_trade_correction_message_record.original_trade_price[fractional_prior_day_trade_correction_message_at] = wire[at]; at = at + 1; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 8 -> fractional_prior_day_trade_correction_message_record.original_fractional_trade_volume[fractional_prior_day_trade_correction_message_at] = wire[at]; at = at + 1; fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_record.original_sellers_sale_days = wire[at]; at = at + 1;
  fractional_prior_day_trade_correction_message_record.original_stop_stock_indicator = wire[at]; at = at + 1;
  fractional_prior_day_trade_correction_message_record.original_trade_through_exempt_indicator = wire[at]; at = at + 1;
  fractional_prior_day_trade_correction_message_record.original_short_sale_restriction_indicator = wire[at]; at = at + 1;
  decode_original_prior_day_trade_date_and_time(fractional_prior_day_trade_correction_message_record.original_prior_da_b4iazc);
  skip
}

/* what was read of Fractional Prior Day Trade Correction Message is what was written, byte for byte */
inline equal_fractional_prior_day_trade_correction_message(fractional_prior_day_trade_correction_message_read, fractional_prior_day_trade_correction_message_written) {
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 11 -> assert(fractional_prior_day_trade_correction_message_read.security_symbol[fractional_prior_day_trade_correction_message_at] == fractional_prior_day_trade_correction_message_written.security_symbol[fractional_prior_day_trade_correction_message_at]); fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  assert(fractional_prior_day_trade_correction_message_read.instrument_type == fractional_prior_day_trade_correction_message_written.instrument_type);
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 4 -> assert(fractional_prior_day_trade_correction_message_read.corrected_sale_condition[fractional_prior_day_trade_correction_message_at] == fractional_prior_day_trade_correction_message_written.corrected_sale_condition[fractional_prior_day_trade_correction_message_at]); fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 8 -> assert(fractional_prior_day_trade_correction_message_read.corrected_trade_price[fractional_prior_day_trade_correction_message_at] == fractional_prior_day_trade_correction_message_written.corrected_trade_price[fractional_prior_day_trade_correction_message_at]); fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 8 -> assert(fractional_prior_day_trade_correction_message_read.corrected_fractional_trade_volume[fractional_prior_day_trade_correction_message_at] == fractional_prior_day_trade_correction_message_written.corrected_fractional_trade_volume[fractional_prior_day_trade_correction_message_at]); fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  assert(fractional_prior_day_trade_correction_message_read.corrected_sellers_sale_days == fractional_prior_day_trade_correction_message_written.corrected_sellers_sale_days);
  assert(fractional_prior_day_trade_correction_message_read.corrected_stop_stock_indicator == fractional_prior_day_trade_correction_message_written.corrected_stop_stock_indicator);
  assert(fractional_prior_day_trade_correction_message_read.corrected_trade_through_exempt_indicator == fractional_prior_day_trade_correction_message_written.corrected_trade_through_exempt_indicator);
  assert(fractional_prior_day_trade_correction_message_read.corrected_short_sale_restriction_indicator == fractional_prior_day_trade_correction_message_written.corrected_short_sale_restriction_indicator);
  equal_corrected_prior_day_trade_date_and_time(fractional_prior_day_trade_correction_message_read.corrected_prior_d_4u6u6a, fractional_prior_day_trade_correction_message_written.corrected_prior_d_4u6u6a);
  assert(fractional_prior_day_trade_correction_message_read.trade_reporting_facility_id == fractional_prior_day_trade_correction_message_written.trade_reporting_facility_id);
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 4 -> assert(fractional_prior_day_trade_correction_message_read.original_sale_condition[fractional_prior_day_trade_correction_message_at] == fractional_prior_day_trade_correction_message_written.original_sale_condition[fractional_prior_day_trade_correction_message_at]); fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 8 -> assert(fractional_prior_day_trade_correction_message_read.original_trade_price[fractional_prior_day_trade_correction_message_at] == fractional_prior_day_trade_correction_message_written.original_trade_price[fractional_prior_day_trade_correction_message_at]); fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_correction_message_at = 0;
  do
  :: fractional_prior_day_trade_correction_message_at < 8 -> assert(fractional_prior_day_trade_correction_message_read.original_fractional_trade_volume[fractional_prior_day_trade_correction_message_at] == fractional_prior_day_trade_correction_message_written.original_fractional_trade_volume[fractional_prior_day_trade_correction_message_at]); fractional_prior_day_trade_correction_message_at = fractional_prior_day_trade_correction_message_at + 1
  :: else -> break
  od;
  assert(fractional_prior_day_trade_correction_message_read.original_sellers_sale_days == fractional_prior_day_trade_correction_message_written.original_sellers_sale_days);
  assert(fractional_prior_day_trade_correction_message_read.original_stop_stock_indicator == fractional_prior_day_trade_correction_message_written.original_stop_stock_indicator);
  assert(fractional_prior_day_trade_correction_message_read.original_trade_through_exempt_indicator == fractional_prior_day_trade_correction_message_written.original_trade_through_exempt_indicator);
  assert(fractional_prior_day_trade_correction_message_read.original_short_sale_restriction_indicator == fractional_prior_day_trade_correction_message_written.original_short_sale_restriction_indicator);
  equal_original_prior_day_trade_date_and_time(fractional_prior_day_trade_correction_message_read.original_prior_da_b4iazc, fractional_prior_day_trade_correction_message_written.original_prior_da_b4iazc);
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

/* ---- Prior Day Trade Message: 41 bytes --------------------------------------- */

/* Reports a CTA eligible Equity, Local Issue or Bond transaction which occurred earlier than the current trading day and was not reported. */
typedef PriorDayTradeMessage {
  byte security_symbol[11];
  byte instrument_type;
  byte sale_condition[4];
  byte trade_price[8];
  byte trade_volume[4];
  byte sellers_sale_days;
  byte stop_stock_indicator;
  byte trade_through_exempt_indicator;
  byte short_sale_restriction_indicator;
  byte trade_reporting_facility_id;
  PriorDayTradeDateAndTime prior_day_trade_d_3r4jde
};

int prior_day_trade_message_at;

/* every byte of Prior Day Trade Message set to one value */
inline fill_prior_day_trade_message(prior_day_trade_message_record, prior_day_trade_message_value) {
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 11 -> prior_day_trade_message_record.security_symbol[prior_day_trade_message_at] = prior_day_trade_message_value; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_record.instrument_type = prior_day_trade_message_value;
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 4 -> prior_day_trade_message_record.sale_condition[prior_day_trade_message_at] = prior_day_trade_message_value; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
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
  fill_prior_day_trade_date_and_time(prior_day_trade_message_record.prior_day_trade_d_3r4jde, prior_day_trade_message_value);
  skip
}

/* each byte of Prior Day Trade Message set to where it lies, so a field read out of place says so */
inline ramp_prior_day_trade_message(prior_day_trade_message_record, prior_day_trade_message_base) {
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 11 -> prior_day_trade_message_record.security_symbol[prior_day_trade_message_at] = (prior_day_trade_message_base + 0 + prior_day_trade_message_at + 1) % 256; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_record.instrument_type = (prior_day_trade_message_base + 11 + 1) % 256;
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 4 -> prior_day_trade_message_record.sale_condition[prior_day_trade_message_at] = (prior_day_trade_message_base + 12 + prior_day_trade_message_at + 1) % 256; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 8 -> prior_day_trade_message_record.trade_price[prior_day_trade_message_at] = (prior_day_trade_message_base + 16 + prior_day_trade_message_at + 1) % 256; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 4 -> prior_day_trade_message_record.trade_volume[prior_day_trade_message_at] = (prior_day_trade_message_base + 24 + prior_day_trade_message_at + 1) % 256; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_record.sellers_sale_days = (prior_day_trade_message_base + 28 + 1) % 256;
  prior_day_trade_message_record.stop_stock_indicator = (prior_day_trade_message_base + 29 + 1) % 256;
  prior_day_trade_message_record.trade_through_exempt_indicator = (prior_day_trade_message_base + 30 + 1) % 256;
  prior_day_trade_message_record.short_sale_restriction_indicator = (prior_day_trade_message_base + 31 + 1) % 256;
  prior_day_trade_message_record.trade_reporting_facility_id = (prior_day_trade_message_base + 32 + 1) % 256;
  ramp_prior_day_trade_date_and_time(prior_day_trade_message_record.prior_day_trade_d_3r4jde, prior_day_trade_message_base + 33);
  skip
}

/* Prior Day Trade Message to the wire, 41 bytes from where the cursor stands */
inline encode_prior_day_trade_message(prior_day_trade_message_record) {
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 11 -> wire[at] = prior_day_trade_message_record.security_symbol[prior_day_trade_message_at]; at = at + 1; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = prior_day_trade_message_record.instrument_type; at = at + 1;
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 4 -> wire[at] = prior_day_trade_message_record.sale_condition[prior_day_trade_message_at]; at = at + 1; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
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
  encode_prior_day_trade_date_and_time(prior_day_trade_message_record.prior_day_trade_d_3r4jde);
  skip
}

/* Prior Day Trade Message off the wire, 41 bytes from where the cursor stands */
inline decode_prior_day_trade_message(prior_day_trade_message_record) {
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 11 -> prior_day_trade_message_record.security_symbol[prior_day_trade_message_at] = wire[at]; at = at + 1; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  prior_day_trade_message_record.instrument_type = wire[at]; at = at + 1;
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 4 -> prior_day_trade_message_record.sale_condition[prior_day_trade_message_at] = wire[at]; at = at + 1; prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
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
  decode_prior_day_trade_date_and_time(prior_day_trade_message_record.prior_day_trade_d_3r4jde);
  skip
}

/* what was read of Prior Day Trade Message is what was written, byte for byte */
inline equal_prior_day_trade_message(prior_day_trade_message_read, prior_day_trade_message_written) {
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 11 -> assert(prior_day_trade_message_read.security_symbol[prior_day_trade_message_at] == prior_day_trade_message_written.security_symbol[prior_day_trade_message_at]); prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
  assert(prior_day_trade_message_read.instrument_type == prior_day_trade_message_written.instrument_type);
  prior_day_trade_message_at = 0;
  do
  :: prior_day_trade_message_at < 4 -> assert(prior_day_trade_message_read.sale_condition[prior_day_trade_message_at] == prior_day_trade_message_written.sale_condition[prior_day_trade_message_at]); prior_day_trade_message_at = prior_day_trade_message_at + 1
  :: else -> break
  od;
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
  equal_prior_day_trade_date_and_time(prior_day_trade_message_read.prior_day_trade_d_3r4jde, prior_day_trade_message_written.prior_day_trade_d_3r4jde);
  skip
}

/* ---- Fractional Prior Day Trade Message: 45 bytes ---------------------------- */

/* Reports a trade with fractional volume which occurred earlier than the current trading day and was not reported. */
typedef FractionalPriorDayTradeMessage {
  byte security_symbol[11];
  byte instrument_type;
  byte sale_condition[4];
  byte trade_price[8];
  byte fractional_trade_volume[8];
  byte sellers_sale_days;
  byte stop_stock_indicator;
  byte trade_through_exempt_indicator;
  byte short_sale_restriction_indicator;
  byte trade_reporting_facility_id;
  PriorDayTradeDateAndTime prior_day_trade_d_3r4jde
};

int fractional_prior_day_trade_message_at;

/* every byte of Fractional Prior Day Trade Message set to one value */
inline fill_fractional_prior_day_trade_message(fractional_prior_day_trade_message_record, fractional_prior_day_trade_message_value) {
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 11 -> fractional_prior_day_trade_message_record.security_symbol[fractional_prior_day_trade_message_at] = fractional_prior_day_trade_message_value; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_record.instrument_type = fractional_prior_day_trade_message_value;
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 4 -> fractional_prior_day_trade_message_record.sale_condition[fractional_prior_day_trade_message_at] = fractional_prior_day_trade_message_value; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
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
  fill_prior_day_trade_date_and_time(fractional_prior_day_trade_message_record.prior_day_trade_d_3r4jde, fractional_prior_day_trade_message_value);
  skip
}

/* each byte of Fractional Prior Day Trade Message set to where it lies, so a field read out of place says so */
inline ramp_fractional_prior_day_trade_message(fractional_prior_day_trade_message_record, fractional_prior_day_trade_message_base) {
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 11 -> fractional_prior_day_trade_message_record.security_symbol[fractional_prior_day_trade_message_at] = (fractional_prior_day_trade_message_base + 0 + fractional_prior_day_trade_message_at + 1) % 256; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_record.instrument_type = (fractional_prior_day_trade_message_base + 11 + 1) % 256;
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 4 -> fractional_prior_day_trade_message_record.sale_condition[fractional_prior_day_trade_message_at] = (fractional_prior_day_trade_message_base + 12 + fractional_prior_day_trade_message_at + 1) % 256; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 8 -> fractional_prior_day_trade_message_record.trade_price[fractional_prior_day_trade_message_at] = (fractional_prior_day_trade_message_base + 16 + fractional_prior_day_trade_message_at + 1) % 256; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 8 -> fractional_prior_day_trade_message_record.fractional_trade_volume[fractional_prior_day_trade_message_at] = (fractional_prior_day_trade_message_base + 24 + fractional_prior_day_trade_message_at + 1) % 256; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_record.sellers_sale_days = (fractional_prior_day_trade_message_base + 32 + 1) % 256;
  fractional_prior_day_trade_message_record.stop_stock_indicator = (fractional_prior_day_trade_message_base + 33 + 1) % 256;
  fractional_prior_day_trade_message_record.trade_through_exempt_indicator = (fractional_prior_day_trade_message_base + 34 + 1) % 256;
  fractional_prior_day_trade_message_record.short_sale_restriction_indicator = (fractional_prior_day_trade_message_base + 35 + 1) % 256;
  fractional_prior_day_trade_message_record.trade_reporting_facility_id = (fractional_prior_day_trade_message_base + 36 + 1) % 256;
  ramp_prior_day_trade_date_and_time(fractional_prior_day_trade_message_record.prior_day_trade_d_3r4jde, fractional_prior_day_trade_message_base + 37);
  skip
}

/* Fractional Prior Day Trade Message to the wire, 45 bytes from where the cursor stands */
inline encode_fractional_prior_day_trade_message(fractional_prior_day_trade_message_record) {
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 11 -> wire[at] = fractional_prior_day_trade_message_record.security_symbol[fractional_prior_day_trade_message_at]; at = at + 1; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_prior_day_trade_message_record.instrument_type; at = at + 1;
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 4 -> wire[at] = fractional_prior_day_trade_message_record.sale_condition[fractional_prior_day_trade_message_at]; at = at + 1; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
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
  encode_prior_day_trade_date_and_time(fractional_prior_day_trade_message_record.prior_day_trade_d_3r4jde);
  skip
}

/* Fractional Prior Day Trade Message off the wire, 45 bytes from where the cursor stands */
inline decode_fractional_prior_day_trade_message(fractional_prior_day_trade_message_record) {
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 11 -> fractional_prior_day_trade_message_record.security_symbol[fractional_prior_day_trade_message_at] = wire[at]; at = at + 1; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_message_record.instrument_type = wire[at]; at = at + 1;
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 4 -> fractional_prior_day_trade_message_record.sale_condition[fractional_prior_day_trade_message_at] = wire[at]; at = at + 1; fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
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
  decode_prior_day_trade_date_and_time(fractional_prior_day_trade_message_record.prior_day_trade_d_3r4jde);
  skip
}

/* what was read of Fractional Prior Day Trade Message is what was written, byte for byte */
inline equal_fractional_prior_day_trade_message(fractional_prior_day_trade_message_read, fractional_prior_day_trade_message_written) {
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 11 -> assert(fractional_prior_day_trade_message_read.security_symbol[fractional_prior_day_trade_message_at] == fractional_prior_day_trade_message_written.security_symbol[fractional_prior_day_trade_message_at]); fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  assert(fractional_prior_day_trade_message_read.instrument_type == fractional_prior_day_trade_message_written.instrument_type);
  fractional_prior_day_trade_message_at = 0;
  do
  :: fractional_prior_day_trade_message_at < 4 -> assert(fractional_prior_day_trade_message_read.sale_condition[fractional_prior_day_trade_message_at] == fractional_prior_day_trade_message_written.sale_condition[fractional_prior_day_trade_message_at]); fractional_prior_day_trade_message_at = fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
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
  equal_prior_day_trade_date_and_time(fractional_prior_day_trade_message_read.prior_day_trade_d_3r4jde, fractional_prior_day_trade_message_written.prior_day_trade_d_3r4jde);
  skip
}

/* ---- Prior Day Trade Cancel Error Message: 42 bytes -------------------------- */

/* Used to cancel or error a trade or correction originally reported earlier than the current day. */
typedef PriorDayTradeCancelErrorMessage {
  byte security_symbol[11];
  byte instrument_type;
  byte sale_condition[4];
  byte trade_price[8];
  byte trade_volume[4];
  byte sellers_sale_days;
  byte stop_stock_indicator;
  byte trade_through_exempt_indicator;
  byte short_sale_restriction_indicator;
  byte trade_reporting_facility_id;
  PriorDayTradeDateAndTime prior_day_trade_d_3r4jde;
  byte cancel_error_action
};

int prior_day_trade_cancel_error_message_at;

/* every byte of Prior Day Trade Cancel Error Message set to one value */
inline fill_prior_day_trade_cancel_error_message(prior_day_trade_cancel_error_message_record, prior_day_trade_cancel_error_message_value) {
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 11 -> prior_day_trade_cancel_error_message_record.security_symbol[prior_day_trade_cancel_error_message_at] = prior_day_trade_cancel_error_message_value; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_record.instrument_type = prior_day_trade_cancel_error_message_value;
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 4 -> prior_day_trade_cancel_error_message_record.sale_condition[prior_day_trade_cancel_error_message_at] = prior_day_trade_cancel_error_message_value; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
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
  fill_prior_day_trade_date_and_time(prior_day_trade_cancel_error_message_record.prior_day_trade_d_3r4jde, prior_day_trade_cancel_error_message_value);
  prior_day_trade_cancel_error_message_record.cancel_error_action = prior_day_trade_cancel_error_message_value;
  skip
}

/* each byte of Prior Day Trade Cancel Error Message set to where it lies, so a field read out of place says so */
inline ramp_prior_day_trade_cancel_error_message(prior_day_trade_cancel_error_message_record, prior_day_trade_cancel_error_message_base) {
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 11 -> prior_day_trade_cancel_error_message_record.security_symbol[prior_day_trade_cancel_error_message_at] = (prior_day_trade_cancel_error_message_base + 0 + prior_day_trade_cancel_error_message_at + 1) % 256; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_record.instrument_type = (prior_day_trade_cancel_error_message_base + 11 + 1) % 256;
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 4 -> prior_day_trade_cancel_error_message_record.sale_condition[prior_day_trade_cancel_error_message_at] = (prior_day_trade_cancel_error_message_base + 12 + prior_day_trade_cancel_error_message_at + 1) % 256; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 8 -> prior_day_trade_cancel_error_message_record.trade_price[prior_day_trade_cancel_error_message_at] = (prior_day_trade_cancel_error_message_base + 16 + prior_day_trade_cancel_error_message_at + 1) % 256; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 4 -> prior_day_trade_cancel_error_message_record.trade_volume[prior_day_trade_cancel_error_message_at] = (prior_day_trade_cancel_error_message_base + 24 + prior_day_trade_cancel_error_message_at + 1) % 256; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_record.sellers_sale_days = (prior_day_trade_cancel_error_message_base + 28 + 1) % 256;
  prior_day_trade_cancel_error_message_record.stop_stock_indicator = (prior_day_trade_cancel_error_message_base + 29 + 1) % 256;
  prior_day_trade_cancel_error_message_record.trade_through_exempt_indicator = (prior_day_trade_cancel_error_message_base + 30 + 1) % 256;
  prior_day_trade_cancel_error_message_record.short_sale_restriction_indicator = (prior_day_trade_cancel_error_message_base + 31 + 1) % 256;
  prior_day_trade_cancel_error_message_record.trade_reporting_facility_id = (prior_day_trade_cancel_error_message_base + 32 + 1) % 256;
  ramp_prior_day_trade_date_and_time(prior_day_trade_cancel_error_message_record.prior_day_trade_d_3r4jde, prior_day_trade_cancel_error_message_base + 33);
  prior_day_trade_cancel_error_message_record.cancel_error_action = (prior_day_trade_cancel_error_message_base + 41 + 1) % 256;
  skip
}

/* Prior Day Trade Cancel Error Message to the wire, 42 bytes from where the cursor stands */
inline encode_prior_day_trade_cancel_error_message(prior_day_trade_cancel_error_message_record) {
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 11 -> wire[at] = prior_day_trade_cancel_error_message_record.security_symbol[prior_day_trade_cancel_error_message_at]; at = at + 1; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = prior_day_trade_cancel_error_message_record.instrument_type; at = at + 1;
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 4 -> wire[at] = prior_day_trade_cancel_error_message_record.sale_condition[prior_day_trade_cancel_error_message_at]; at = at + 1; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
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
  encode_prior_day_trade_date_and_time(prior_day_trade_cancel_error_message_record.prior_day_trade_d_3r4jde);
  wire[at] = prior_day_trade_cancel_error_message_record.cancel_error_action; at = at + 1;
  skip
}

/* Prior Day Trade Cancel Error Message off the wire, 42 bytes from where the cursor stands */
inline decode_prior_day_trade_cancel_error_message(prior_day_trade_cancel_error_message_record) {
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 11 -> prior_day_trade_cancel_error_message_record.security_symbol[prior_day_trade_cancel_error_message_at] = wire[at]; at = at + 1; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  prior_day_trade_cancel_error_message_record.instrument_type = wire[at]; at = at + 1;
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 4 -> prior_day_trade_cancel_error_message_record.sale_condition[prior_day_trade_cancel_error_message_at] = wire[at]; at = at + 1; prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
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
  decode_prior_day_trade_date_and_time(prior_day_trade_cancel_error_message_record.prior_day_trade_d_3r4jde);
  prior_day_trade_cancel_error_message_record.cancel_error_action = wire[at]; at = at + 1;
  skip
}

/* what was read of Prior Day Trade Cancel Error Message is what was written, byte for byte */
inline equal_prior_day_trade_cancel_error_message(prior_day_trade_cancel_error_message_read, prior_day_trade_cancel_error_message_written) {
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 11 -> assert(prior_day_trade_cancel_error_message_read.security_symbol[prior_day_trade_cancel_error_message_at] == prior_day_trade_cancel_error_message_written.security_symbol[prior_day_trade_cancel_error_message_at]); prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(prior_day_trade_cancel_error_message_read.instrument_type == prior_day_trade_cancel_error_message_written.instrument_type);
  prior_day_trade_cancel_error_message_at = 0;
  do
  :: prior_day_trade_cancel_error_message_at < 4 -> assert(prior_day_trade_cancel_error_message_read.sale_condition[prior_day_trade_cancel_error_message_at] == prior_day_trade_cancel_error_message_written.sale_condition[prior_day_trade_cancel_error_message_at]); prior_day_trade_cancel_error_message_at = prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
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
  equal_prior_day_trade_date_and_time(prior_day_trade_cancel_error_message_read.prior_day_trade_d_3r4jde, prior_day_trade_cancel_error_message_written.prior_day_trade_d_3r4jde);
  assert(prior_day_trade_cancel_error_message_read.cancel_error_action == prior_day_trade_cancel_error_message_written.cancel_error_action);
  skip
}

/* ---- Fractional Prior Day Trade Cancel Error Message: 46 bytes --------------- */

/* Reports the cancellation or error of a fractional trade or correction originally reported earlier than the current day. */
typedef FractionalPriorDayTradeCancelErrorMessage {
  byte security_symbol[11];
  byte instrument_type;
  byte sale_condition[4];
  byte trade_price[8];
  byte fractional_trade_volume[8];
  byte sellers_sale_days;
  byte stop_stock_indicator;
  byte trade_through_exempt_indicator;
  byte short_sale_restriction_indicator;
  byte trade_reporting_facility_id;
  PriorDayTradeDateAndTime prior_day_trade_d_3r4jde;
  byte cancel_error_action
};

int fractional_prior_day_trade_cancel_error_message_at;

/* every byte of Fractional Prior Day Trade Cancel Error Message set to one value */
inline fill_fractional_prior_day_trade_cancel_error_message(fractional_prior_day_trade_cancel_error_message_record, fractional_prior_day_trade_cancel_error_message_value) {
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 11 -> fractional_prior_day_trade_cancel_error_message_record.security_symbol[fractional_prior_day_trade_cancel_error_message_at] = fractional_prior_day_trade_cancel_error_message_value; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_record.instrument_type = fractional_prior_day_trade_cancel_error_message_value;
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 4 -> fractional_prior_day_trade_cancel_error_message_record.sale_condition[fractional_prior_day_trade_cancel_error_message_at] = fractional_prior_day_trade_cancel_error_message_value; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
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
  fill_prior_day_trade_date_and_time(fractional_prior_day_trade_cancel_error_message_record.prior_day_trade_d_3r4jde, fractional_prior_day_trade_cancel_error_message_value);
  fractional_prior_day_trade_cancel_error_message_record.cancel_error_action = fractional_prior_day_trade_cancel_error_message_value;
  skip
}

/* each byte of Fractional Prior Day Trade Cancel Error Message set to where it lies, so a field read out of place says so */
inline ramp_fractional_prior_day_trade_cancel_error_message(fractional_prior_day_trade_cancel_error_message_record, fractional_prior_day_trade_cancel_error_message_base) {
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 11 -> fractional_prior_day_trade_cancel_error_message_record.security_symbol[fractional_prior_day_trade_cancel_error_message_at] = (fractional_prior_day_trade_cancel_error_message_base + 0 + fractional_prior_day_trade_cancel_error_message_at + 1) % 256; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_record.instrument_type = (fractional_prior_day_trade_cancel_error_message_base + 11 + 1) % 256;
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 4 -> fractional_prior_day_trade_cancel_error_message_record.sale_condition[fractional_prior_day_trade_cancel_error_message_at] = (fractional_prior_day_trade_cancel_error_message_base + 12 + fractional_prior_day_trade_cancel_error_message_at + 1) % 256; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 8 -> fractional_prior_day_trade_cancel_error_message_record.trade_price[fractional_prior_day_trade_cancel_error_message_at] = (fractional_prior_day_trade_cancel_error_message_base + 16 + fractional_prior_day_trade_cancel_error_message_at + 1) % 256; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 8 -> fractional_prior_day_trade_cancel_error_message_record.fractional_trade_volume[fractional_prior_day_trade_cancel_error_message_at] = (fractional_prior_day_trade_cancel_error_message_base + 24 + fractional_prior_day_trade_cancel_error_message_at + 1) % 256; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_record.sellers_sale_days = (fractional_prior_day_trade_cancel_error_message_base + 32 + 1) % 256;
  fractional_prior_day_trade_cancel_error_message_record.stop_stock_indicator = (fractional_prior_day_trade_cancel_error_message_base + 33 + 1) % 256;
  fractional_prior_day_trade_cancel_error_message_record.trade_through_exempt_indicator = (fractional_prior_day_trade_cancel_error_message_base + 34 + 1) % 256;
  fractional_prior_day_trade_cancel_error_message_record.short_sale_restriction_indicator = (fractional_prior_day_trade_cancel_error_message_base + 35 + 1) % 256;
  fractional_prior_day_trade_cancel_error_message_record.trade_reporting_facility_id = (fractional_prior_day_trade_cancel_error_message_base + 36 + 1) % 256;
  ramp_prior_day_trade_date_and_time(fractional_prior_day_trade_cancel_error_message_record.prior_day_trade_d_3r4jde, fractional_prior_day_trade_cancel_error_message_base + 37);
  fractional_prior_day_trade_cancel_error_message_record.cancel_error_action = (fractional_prior_day_trade_cancel_error_message_base + 45 + 1) % 256;
  skip
}

/* Fractional Prior Day Trade Cancel Error Message to the wire, 46 bytes from where the cursor stands */
inline encode_fractional_prior_day_trade_cancel_error_message(fractional_prior_day_trade_cancel_error_message_record) {
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 11 -> wire[at] = fractional_prior_day_trade_cancel_error_message_record.security_symbol[fractional_prior_day_trade_cancel_error_message_at]; at = at + 1; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_prior_day_trade_cancel_error_message_record.instrument_type; at = at + 1;
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 4 -> wire[at] = fractional_prior_day_trade_cancel_error_message_record.sale_condition[fractional_prior_day_trade_cancel_error_message_at]; at = at + 1; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
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
  encode_prior_day_trade_date_and_time(fractional_prior_day_trade_cancel_error_message_record.prior_day_trade_d_3r4jde);
  wire[at] = fractional_prior_day_trade_cancel_error_message_record.cancel_error_action; at = at + 1;
  skip
}

/* Fractional Prior Day Trade Cancel Error Message off the wire, 46 bytes from where the cursor stands */
inline decode_fractional_prior_day_trade_cancel_error_message(fractional_prior_day_trade_cancel_error_message_record) {
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 11 -> fractional_prior_day_trade_cancel_error_message_record.security_symbol[fractional_prior_day_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_prior_day_trade_cancel_error_message_record.instrument_type = wire[at]; at = at + 1;
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 4 -> fractional_prior_day_trade_cancel_error_message_record.sale_condition[fractional_prior_day_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
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
  decode_prior_day_trade_date_and_time(fractional_prior_day_trade_cancel_error_message_record.prior_day_trade_d_3r4jde);
  fractional_prior_day_trade_cancel_error_message_record.cancel_error_action = wire[at]; at = at + 1;
  skip
}

/* what was read of Fractional Prior Day Trade Cancel Error Message is what was written, byte for byte */
inline equal_fractional_prior_day_trade_cancel_error_message(fractional_prior_day_trade_cancel_error_message_read, fractional_prior_day_trade_cancel_error_message_written) {
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 11 -> assert(fractional_prior_day_trade_cancel_error_message_read.security_symbol[fractional_prior_day_trade_cancel_error_message_at] == fractional_prior_day_trade_cancel_error_message_written.security_symbol[fractional_prior_day_trade_cancel_error_message_at]); fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(fractional_prior_day_trade_cancel_error_message_read.instrument_type == fractional_prior_day_trade_cancel_error_message_written.instrument_type);
  fractional_prior_day_trade_cancel_error_message_at = 0;
  do
  :: fractional_prior_day_trade_cancel_error_message_at < 4 -> assert(fractional_prior_day_trade_cancel_error_message_read.sale_condition[fractional_prior_day_trade_cancel_error_message_at] == fractional_prior_day_trade_cancel_error_message_written.sale_condition[fractional_prior_day_trade_cancel_error_message_at]); fractional_prior_day_trade_cancel_error_message_at = fractional_prior_day_trade_cancel_error_message_at + 1
  :: else -> break
  od;
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
  equal_prior_day_trade_date_and_time(fractional_prior_day_trade_cancel_error_message_read.prior_day_trade_d_3r4jde, fractional_prior_day_trade_cancel_error_message_written.prior_day_trade_d_3r4jde);
  assert(fractional_prior_day_trade_cancel_error_message_read.cancel_error_action == fractional_prior_day_trade_cancel_error_message_written.cancel_error_action);
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

/* ---- Trade Correction Message: 49 bytes -------------------------------------- */

/* Used to correct CTA eligible Equity, Local Issue or Bond trade information. */
typedef TradeCorrectionMessage {
  byte security_symbol[11];
  byte instrument_type;
  byte corrected_sale_condition[4];
  byte corrected_trade_price[8];
  byte corrected_trade_volume[4];
  byte corrected_sellers_sale_days;
  byte corrected_stop_stock_indicator;
  byte corrected_trade_through_exempt_indicator;
  byte corrected_short_sale_restriction_indicator;
  byte trade_reporting_facility_id;
  Timestamp2 timestamp_2;
  byte original_participant_reference_number[8]
};

int trade_correction_message_at;

/* every byte of Trade Correction Message set to one value */
inline fill_trade_correction_message(trade_correction_message_record, trade_correction_message_value) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> trade_correction_message_record.security_symbol[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.instrument_type = trade_correction_message_value;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_sale_condition[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.corrected_trade_price[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_trade_volume[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.corrected_sellers_sale_days = trade_correction_message_value;
  trade_correction_message_record.corrected_stop_stock_indicator = trade_correction_message_value;
  trade_correction_message_record.corrected_trade_through_exempt_indicator = trade_correction_message_value;
  trade_correction_message_record.corrected_short_sale_restriction_indicator = trade_correction_message_value;
  trade_correction_message_record.trade_reporting_facility_id = trade_correction_message_value;
  fill_timestamp2(trade_correction_message_record.timestamp_2, trade_correction_message_value);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.original_participant_reference_number[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_trade_correction_message(trade_correction_message_record, trade_correction_message_base) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> trade_correction_message_record.security_symbol[trade_correction_message_at] = (trade_correction_message_base + 0 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.instrument_type = (trade_correction_message_base + 11 + 1) % 256;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_sale_condition[trade_correction_message_at] = (trade_correction_message_base + 12 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.corrected_trade_price[trade_correction_message_at] = (trade_correction_message_base + 16 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_trade_volume[trade_correction_message_at] = (trade_correction_message_base + 24 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.corrected_sellers_sale_days = (trade_correction_message_base + 28 + 1) % 256;
  trade_correction_message_record.corrected_stop_stock_indicator = (trade_correction_message_base + 29 + 1) % 256;
  trade_correction_message_record.corrected_trade_through_exempt_indicator = (trade_correction_message_base + 30 + 1) % 256;
  trade_correction_message_record.corrected_short_sale_restriction_indicator = (trade_correction_message_base + 31 + 1) % 256;
  trade_correction_message_record.trade_reporting_facility_id = (trade_correction_message_base + 32 + 1) % 256;
  ramp_timestamp2(trade_correction_message_record.timestamp_2, trade_correction_message_base + 33);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.original_participant_reference_number[trade_correction_message_at] = (trade_correction_message_base + 41 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Correction Message to the wire, 49 bytes from where the cursor stands */
inline encode_trade_correction_message(trade_correction_message_record) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> wire[at] = trade_correction_message_record.security_symbol[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_message_record.instrument_type; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.corrected_sale_condition[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.corrected_trade_price[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.corrected_trade_volume[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_message_record.corrected_sellers_sale_days; at = at + 1;
  wire[at] = trade_correction_message_record.corrected_stop_stock_indicator; at = at + 1;
  wire[at] = trade_correction_message_record.corrected_trade_through_exempt_indicator; at = at + 1;
  wire[at] = trade_correction_message_record.corrected_short_sale_restriction_indicator; at = at + 1;
  wire[at] = trade_correction_message_record.trade_reporting_facility_id; at = at + 1;
  encode_timestamp2(trade_correction_message_record.timestamp_2);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.original_participant_reference_number[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Correction Message off the wire, 49 bytes from where the cursor stands */
inline decode_trade_correction_message(trade_correction_message_record) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> trade_correction_message_record.security_symbol[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.instrument_type = wire[at]; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_sale_condition[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.corrected_trade_price[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_trade_volume[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.corrected_sellers_sale_days = wire[at]; at = at + 1;
  trade_correction_message_record.corrected_stop_stock_indicator = wire[at]; at = at + 1;
  trade_correction_message_record.corrected_trade_through_exempt_indicator = wire[at]; at = at + 1;
  trade_correction_message_record.corrected_short_sale_restriction_indicator = wire[at]; at = at + 1;
  trade_correction_message_record.trade_reporting_facility_id = wire[at]; at = at + 1;
  decode_timestamp2(trade_correction_message_record.timestamp_2);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.original_participant_reference_number[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Correction Message is what was written, byte for byte */
inline equal_trade_correction_message(trade_correction_message_read, trade_correction_message_written) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> assert(trade_correction_message_read.security_symbol[trade_correction_message_at] == trade_correction_message_written.security_symbol[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_message_read.instrument_type == trade_correction_message_written.instrument_type);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.corrected_sale_condition[trade_correction_message_at] == trade_correction_message_written.corrected_sale_condition[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.corrected_trade_price[trade_correction_message_at] == trade_correction_message_written.corrected_trade_price[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.corrected_trade_volume[trade_correction_message_at] == trade_correction_message_written.corrected_trade_volume[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_message_read.corrected_sellers_sale_days == trade_correction_message_written.corrected_sellers_sale_days);
  assert(trade_correction_message_read.corrected_stop_stock_indicator == trade_correction_message_written.corrected_stop_stock_indicator);
  assert(trade_correction_message_read.corrected_trade_through_exempt_indicator == trade_correction_message_written.corrected_trade_through_exempt_indicator);
  assert(trade_correction_message_read.corrected_short_sale_restriction_indicator == trade_correction_message_written.corrected_short_sale_restriction_indicator);
  assert(trade_correction_message_read.trade_reporting_facility_id == trade_correction_message_written.trade_reporting_facility_id);
  equal_timestamp2(trade_correction_message_read.timestamp_2, trade_correction_message_written.timestamp_2);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.original_participant_reference_number[trade_correction_message_at] == trade_correction_message_written.original_participant_reference_number[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Fractional Trade Correction Message: 53 bytes --------------------------- */

/* Used to correct a trade when the corrected Trade Volume is a fractional value. */
typedef FractionalTradeCorrectionMessage {
  byte security_symbol[11];
  byte instrument_type;
  byte corrected_sale_condition[4];
  byte corrected_trade_price[8];
  byte corrected_fractional_trade_volume[8];
  byte corrected_sellers_sale_days;
  byte corrected_stop_stock_indicator;
  byte corrected_trade_through_exempt_indicator;
  byte corrected_short_sale_restriction_indicator;
  byte trade_reporting_facility_id;
  Timestamp2 timestamp_2;
  byte original_participant_reference_number[8]
};

int fractional_trade_correction_message_at;

/* every byte of Fractional Trade Correction Message set to one value */
inline fill_fractional_trade_correction_message(fractional_trade_correction_message_record, fractional_trade_correction_message_value) {
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 11 -> fractional_trade_correction_message_record.security_symbol[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.instrument_type = fractional_trade_correction_message_value;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> fractional_trade_correction_message_record.corrected_sale_condition[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.corrected_trade_price[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.corrected_fractional_trade_volume[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.corrected_sellers_sale_days = fractional_trade_correction_message_value;
  fractional_trade_correction_message_record.corrected_stop_stock_indicator = fractional_trade_correction_message_value;
  fractional_trade_correction_message_record.corrected_trade_through_exempt_indicator = fractional_trade_correction_message_value;
  fractional_trade_correction_message_record.corrected_short_sale_restriction_indicator = fractional_trade_correction_message_value;
  fractional_trade_correction_message_record.trade_reporting_facility_id = fractional_trade_correction_message_value;
  fill_timestamp2(fractional_trade_correction_message_record.timestamp_2, fractional_trade_correction_message_value);
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.original_participant_reference_number[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Fractional Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_fractional_trade_correction_message(fractional_trade_correction_message_record, fractional_trade_correction_message_base) {
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 11 -> fractional_trade_correction_message_record.security_symbol[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 0 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.instrument_type = (fractional_trade_correction_message_base + 11 + 1) % 256;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> fractional_trade_correction_message_record.corrected_sale_condition[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 12 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.corrected_trade_price[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 16 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.corrected_fractional_trade_volume[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 24 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.corrected_sellers_sale_days = (fractional_trade_correction_message_base + 32 + 1) % 256;
  fractional_trade_correction_message_record.corrected_stop_stock_indicator = (fractional_trade_correction_message_base + 33 + 1) % 256;
  fractional_trade_correction_message_record.corrected_trade_through_exempt_indicator = (fractional_trade_correction_message_base + 34 + 1) % 256;
  fractional_trade_correction_message_record.corrected_short_sale_restriction_indicator = (fractional_trade_correction_message_base + 35 + 1) % 256;
  fractional_trade_correction_message_record.trade_reporting_facility_id = (fractional_trade_correction_message_base + 36 + 1) % 256;
  ramp_timestamp2(fractional_trade_correction_message_record.timestamp_2, fractional_trade_correction_message_base + 37);
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.original_participant_reference_number[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 45 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Fractional Trade Correction Message to the wire, 53 bytes from where the cursor stands */
inline encode_fractional_trade_correction_message(fractional_trade_correction_message_record) {
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 11 -> wire[at] = fractional_trade_correction_message_record.security_symbol[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_trade_correction_message_record.instrument_type; at = at + 1;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> wire[at] = fractional_trade_correction_message_record.corrected_sale_condition[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.corrected_trade_price[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.corrected_fractional_trade_volume[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_trade_correction_message_record.corrected_sellers_sale_days; at = at + 1;
  wire[at] = fractional_trade_correction_message_record.corrected_stop_stock_indicator; at = at + 1;
  wire[at] = fractional_trade_correction_message_record.corrected_trade_through_exempt_indicator; at = at + 1;
  wire[at] = fractional_trade_correction_message_record.corrected_short_sale_restriction_indicator; at = at + 1;
  wire[at] = fractional_trade_correction_message_record.trade_reporting_facility_id; at = at + 1;
  encode_timestamp2(fractional_trade_correction_message_record.timestamp_2);
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.original_participant_reference_number[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Fractional Trade Correction Message off the wire, 53 bytes from where the cursor stands */
inline decode_fractional_trade_correction_message(fractional_trade_correction_message_record) {
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 11 -> fractional_trade_correction_message_record.security_symbol[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.instrument_type = wire[at]; at = at + 1;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> fractional_trade_correction_message_record.corrected_sale_condition[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.corrected_trade_price[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.corrected_fractional_trade_volume[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.corrected_sellers_sale_days = wire[at]; at = at + 1;
  fractional_trade_correction_message_record.corrected_stop_stock_indicator = wire[at]; at = at + 1;
  fractional_trade_correction_message_record.corrected_trade_through_exempt_indicator = wire[at]; at = at + 1;
  fractional_trade_correction_message_record.corrected_short_sale_restriction_indicator = wire[at]; at = at + 1;
  fractional_trade_correction_message_record.trade_reporting_facility_id = wire[at]; at = at + 1;
  decode_timestamp2(fractional_trade_correction_message_record.timestamp_2);
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.original_participant_reference_number[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Fractional Trade Correction Message is what was written, byte for byte */
inline equal_fractional_trade_correction_message(fractional_trade_correction_message_read, fractional_trade_correction_message_written) {
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 11 -> assert(fractional_trade_correction_message_read.security_symbol[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.security_symbol[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  assert(fractional_trade_correction_message_read.instrument_type == fractional_trade_correction_message_written.instrument_type);
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> assert(fractional_trade_correction_message_read.corrected_sale_condition[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.corrected_sale_condition[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.corrected_trade_price[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.corrected_trade_price[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.corrected_fractional_trade_volume[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.corrected_fractional_trade_volume[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  assert(fractional_trade_correction_message_read.corrected_sellers_sale_days == fractional_trade_correction_message_written.corrected_sellers_sale_days);
  assert(fractional_trade_correction_message_read.corrected_stop_stock_indicator == fractional_trade_correction_message_written.corrected_stop_stock_indicator);
  assert(fractional_trade_correction_message_read.corrected_trade_through_exempt_indicator == fractional_trade_correction_message_written.corrected_trade_through_exempt_indicator);
  assert(fractional_trade_correction_message_read.corrected_short_sale_restriction_indicator == fractional_trade_correction_message_written.corrected_short_sale_restriction_indicator);
  assert(fractional_trade_correction_message_read.trade_reporting_facility_id == fractional_trade_correction_message_written.trade_reporting_facility_id);
  equal_timestamp2(fractional_trade_correction_message_read.timestamp_2, fractional_trade_correction_message_written.timestamp_2);
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.original_participant_reference_number[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.original_participant_reference_number[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Long Trade Message: 40 bytes -------------------------------------------- */

/* Used to report trade information for CTA eligible Equity, Local Issue or Bonds. */
typedef LongTradeMessage {
  byte security_symbol[11];
  byte instrument_type;
  byte sale_condition[4];
  byte trade_price[8];
  byte trade_volume[4];
  byte sellers_sale_days;
  byte stop_stock_indicator;
  byte trade_through_exempt_indicator;
  byte trade_reporting_facility_id;
  Timestamp2 timestamp_2
};

int long_trade_message_at;

/* every byte of Long Trade Message set to one value */
inline fill_long_trade_message(long_trade_message_record, long_trade_message_value) {
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 11 -> long_trade_message_record.security_symbol[long_trade_message_at] = long_trade_message_value; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_record.instrument_type = long_trade_message_value;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 4 -> long_trade_message_record.sale_condition[long_trade_message_at] = long_trade_message_value; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
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
  skip
}

/* each byte of Long Trade Message set to where it lies, so a field read out of place says so */
inline ramp_long_trade_message(long_trade_message_record, long_trade_message_base) {
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 11 -> long_trade_message_record.security_symbol[long_trade_message_at] = (long_trade_message_base + 0 + long_trade_message_at + 1) % 256; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_record.instrument_type = (long_trade_message_base + 11 + 1) % 256;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 4 -> long_trade_message_record.sale_condition[long_trade_message_at] = (long_trade_message_base + 12 + long_trade_message_at + 1) % 256; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 8 -> long_trade_message_record.trade_price[long_trade_message_at] = (long_trade_message_base + 16 + long_trade_message_at + 1) % 256; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 4 -> long_trade_message_record.trade_volume[long_trade_message_at] = (long_trade_message_base + 24 + long_trade_message_at + 1) % 256; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_record.sellers_sale_days = (long_trade_message_base + 28 + 1) % 256;
  long_trade_message_record.stop_stock_indicator = (long_trade_message_base + 29 + 1) % 256;
  long_trade_message_record.trade_through_exempt_indicator = (long_trade_message_base + 30 + 1) % 256;
  long_trade_message_record.trade_reporting_facility_id = (long_trade_message_base + 31 + 1) % 256;
  ramp_timestamp2(long_trade_message_record.timestamp_2, long_trade_message_base + 32);
  skip
}

/* Long Trade Message to the wire, 40 bytes from where the cursor stands */
inline encode_long_trade_message(long_trade_message_record) {
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 11 -> wire[at] = long_trade_message_record.security_symbol[long_trade_message_at]; at = at + 1; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = long_trade_message_record.instrument_type; at = at + 1;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 4 -> wire[at] = long_trade_message_record.sale_condition[long_trade_message_at]; at = at + 1; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
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
  skip
}

/* Long Trade Message off the wire, 40 bytes from where the cursor stands */
inline decode_long_trade_message(long_trade_message_record) {
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 11 -> long_trade_message_record.security_symbol[long_trade_message_at] = wire[at]; at = at + 1; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_record.instrument_type = wire[at]; at = at + 1;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 4 -> long_trade_message_record.sale_condition[long_trade_message_at] = wire[at]; at = at + 1; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
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
  skip
}

/* what was read of Long Trade Message is what was written, byte for byte */
inline equal_long_trade_message(long_trade_message_read, long_trade_message_written) {
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 11 -> assert(long_trade_message_read.security_symbol[long_trade_message_at] == long_trade_message_written.security_symbol[long_trade_message_at]); long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  assert(long_trade_message_read.instrument_type == long_trade_message_written.instrument_type);
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 4 -> assert(long_trade_message_read.sale_condition[long_trade_message_at] == long_trade_message_written.sale_condition[long_trade_message_at]); long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
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
  skip
}

/* ---- Fractional Long Trade Message: 44 bytes --------------------------------- */

/* Used to report trade information for CTA eligible Equity, Local Issues or Bonds in fractional volume. */
typedef FractionalLongTradeMessage {
  byte security_symbol[11];
  byte instrument_type;
  byte sale_condition[4];
  byte trade_price[8];
  byte fractional_trade_volume[8];
  byte sellers_sale_days;
  byte stop_stock_indicator;
  byte trade_through_exempt_indicator;
  byte trade_reporting_facility_id;
  Timestamp2 timestamp_2
};

int fractional_long_trade_message_at;

/* every byte of Fractional Long Trade Message set to one value */
inline fill_fractional_long_trade_message(fractional_long_trade_message_record, fractional_long_trade_message_value) {
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 11 -> fractional_long_trade_message_record.security_symbol[fractional_long_trade_message_at] = fractional_long_trade_message_value; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_record.instrument_type = fractional_long_trade_message_value;
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 4 -> fractional_long_trade_message_record.sale_condition[fractional_long_trade_message_at] = fractional_long_trade_message_value; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
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
  skip
}

/* each byte of Fractional Long Trade Message set to where it lies, so a field read out of place says so */
inline ramp_fractional_long_trade_message(fractional_long_trade_message_record, fractional_long_trade_message_base) {
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 11 -> fractional_long_trade_message_record.security_symbol[fractional_long_trade_message_at] = (fractional_long_trade_message_base + 0 + fractional_long_trade_message_at + 1) % 256; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_record.instrument_type = (fractional_long_trade_message_base + 11 + 1) % 256;
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 4 -> fractional_long_trade_message_record.sale_condition[fractional_long_trade_message_at] = (fractional_long_trade_message_base + 12 + fractional_long_trade_message_at + 1) % 256; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 8 -> fractional_long_trade_message_record.trade_price[fractional_long_trade_message_at] = (fractional_long_trade_message_base + 16 + fractional_long_trade_message_at + 1) % 256; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 8 -> fractional_long_trade_message_record.fractional_trade_volume[fractional_long_trade_message_at] = (fractional_long_trade_message_base + 24 + fractional_long_trade_message_at + 1) % 256; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_record.sellers_sale_days = (fractional_long_trade_message_base + 32 + 1) % 256;
  fractional_long_trade_message_record.stop_stock_indicator = (fractional_long_trade_message_base + 33 + 1) % 256;
  fractional_long_trade_message_record.trade_through_exempt_indicator = (fractional_long_trade_message_base + 34 + 1) % 256;
  fractional_long_trade_message_record.trade_reporting_facility_id = (fractional_long_trade_message_base + 35 + 1) % 256;
  ramp_timestamp2(fractional_long_trade_message_record.timestamp_2, fractional_long_trade_message_base + 36);
  skip
}

/* Fractional Long Trade Message to the wire, 44 bytes from where the cursor stands */
inline encode_fractional_long_trade_message(fractional_long_trade_message_record) {
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 11 -> wire[at] = fractional_long_trade_message_record.security_symbol[fractional_long_trade_message_at]; at = at + 1; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_long_trade_message_record.instrument_type; at = at + 1;
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 4 -> wire[at] = fractional_long_trade_message_record.sale_condition[fractional_long_trade_message_at]; at = at + 1; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
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
  skip
}

/* Fractional Long Trade Message off the wire, 44 bytes from where the cursor stands */
inline decode_fractional_long_trade_message(fractional_long_trade_message_record) {
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 11 -> fractional_long_trade_message_record.security_symbol[fractional_long_trade_message_at] = wire[at]; at = at + 1; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  fractional_long_trade_message_record.instrument_type = wire[at]; at = at + 1;
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 4 -> fractional_long_trade_message_record.sale_condition[fractional_long_trade_message_at] = wire[at]; at = at + 1; fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
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
  skip
}

/* what was read of Fractional Long Trade Message is what was written, byte for byte */
inline equal_fractional_long_trade_message(fractional_long_trade_message_read, fractional_long_trade_message_written) {
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 11 -> assert(fractional_long_trade_message_read.security_symbol[fractional_long_trade_message_at] == fractional_long_trade_message_written.security_symbol[fractional_long_trade_message_at]); fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
  assert(fractional_long_trade_message_read.instrument_type == fractional_long_trade_message_written.instrument_type);
  fractional_long_trade_message_at = 0;
  do
  :: fractional_long_trade_message_at < 4 -> assert(fractional_long_trade_message_read.sale_condition[fractional_long_trade_message_at] == fractional_long_trade_message_written.sale_condition[fractional_long_trade_message_at]); fractional_long_trade_message_at = fractional_long_trade_message_at + 1
  :: else -> break
  od;
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
  skip
}

/* ---- Trading Status Message: 51 bytes ---------------------------------------- */

/* Allows a Participant that is the listing exchange to notify CTS of Trading Halts, Resumes, Indications, Imbalances, Short Sale Restriction Indicators and LULD Reference Prices. Bidirectional. */
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

/* ---- Short Trade Message: 14 bytes ------------------------------------------- */

/* Reports trade information for CTA eligible Equity, Local Issues or Bonds when the trade meets all criteria for the compact Short format; otherwise the Long Trade message is used. */
typedef ShortTradeMessage {
  byte security_symbol_short[5];
  byte sale_condition_short;
  byte sale_condition_category;
  byte trade_price_short[2];
  byte trade_volume_short[2];
  byte reserved_3[3]
};

int short_trade_message_at;

/* every byte of Short Trade Message set to one value */
inline fill_short_trade_message(short_trade_message_record, short_trade_message_value) {
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 5 -> short_trade_message_record.security_symbol_short[short_trade_message_at] = short_trade_message_value; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_record.sale_condition_short = short_trade_message_value;
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
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 3 -> short_trade_message_record.reserved_3[short_trade_message_at] = short_trade_message_value; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Short Trade Message set to where it lies, so a field read out of place says so */
inline ramp_short_trade_message(short_trade_message_record, short_trade_message_base) {
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 5 -> short_trade_message_record.security_symbol_short[short_trade_message_at] = (short_trade_message_base + 0 + short_trade_message_at + 1) % 256; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_record.sale_condition_short = (short_trade_message_base + 5 + 1) % 256;
  short_trade_message_record.sale_condition_category = (short_trade_message_base + 6 + 1) % 256;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 2 -> short_trade_message_record.trade_price_short[short_trade_message_at] = (short_trade_message_base + 7 + short_trade_message_at + 1) % 256; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 2 -> short_trade_message_record.trade_volume_short[short_trade_message_at] = (short_trade_message_base + 9 + short_trade_message_at + 1) % 256; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 3 -> short_trade_message_record.reserved_3[short_trade_message_at] = (short_trade_message_base + 11 + short_trade_message_at + 1) % 256; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Short Trade Message to the wire, 14 bytes from where the cursor stands */
inline encode_short_trade_message(short_trade_message_record) {
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 5 -> wire[at] = short_trade_message_record.security_symbol_short[short_trade_message_at]; at = at + 1; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = short_trade_message_record.sale_condition_short; at = at + 1;
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
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 3 -> wire[at] = short_trade_message_record.reserved_3[short_trade_message_at]; at = at + 1; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Short Trade Message off the wire, 14 bytes from where the cursor stands */
inline decode_short_trade_message(short_trade_message_record) {
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 5 -> short_trade_message_record.security_symbol_short[short_trade_message_at] = wire[at]; at = at + 1; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_record.sale_condition_short = wire[at]; at = at + 1;
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
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 3 -> short_trade_message_record.reserved_3[short_trade_message_at] = wire[at]; at = at + 1; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Short Trade Message is what was written, byte for byte */
inline equal_short_trade_message(short_trade_message_read, short_trade_message_written) {
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 5 -> assert(short_trade_message_read.security_symbol_short[short_trade_message_at] == short_trade_message_written.security_symbol_short[short_trade_message_at]); short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  assert(short_trade_message_read.sale_condition_short == short_trade_message_written.sale_condition_short);
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
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 3 -> assert(short_trade_message_read.reserved_3[short_trade_message_at] == short_trade_message_written.reserved_3[short_trade_message_at]); short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Fractional Short Trade Message: 16 bytes -------------------------------- */

/* Reports trade information with fractional volume when the trade meets all criteria for the compact Short format; otherwise the Long Trade or Fractional Long Trade message is used. */
typedef FractionalShortTradeMessage {
  byte security_symbol_short[5];
  byte sale_condition_short;
  byte sale_condition_category;
  byte trade_price_short[2];
  byte fractional_trade_volume_short[4];
  byte reserved_3[3]
};

int fractional_short_trade_message_at;

/* every byte of Fractional Short Trade Message set to one value */
inline fill_fractional_short_trade_message(fractional_short_trade_message_record, fractional_short_trade_message_value) {
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 5 -> fractional_short_trade_message_record.security_symbol_short[fractional_short_trade_message_at] = fractional_short_trade_message_value; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  fractional_short_trade_message_record.sale_condition_short = fractional_short_trade_message_value;
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
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 3 -> fractional_short_trade_message_record.reserved_3[fractional_short_trade_message_at] = fractional_short_trade_message_value; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Fractional Short Trade Message set to where it lies, so a field read out of place says so */
inline ramp_fractional_short_trade_message(fractional_short_trade_message_record, fractional_short_trade_message_base) {
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 5 -> fractional_short_trade_message_record.security_symbol_short[fractional_short_trade_message_at] = (fractional_short_trade_message_base + 0 + fractional_short_trade_message_at + 1) % 256; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  fractional_short_trade_message_record.sale_condition_short = (fractional_short_trade_message_base + 5 + 1) % 256;
  fractional_short_trade_message_record.sale_condition_category = (fractional_short_trade_message_base + 6 + 1) % 256;
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 2 -> fractional_short_trade_message_record.trade_price_short[fractional_short_trade_message_at] = (fractional_short_trade_message_base + 7 + fractional_short_trade_message_at + 1) % 256; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 4 -> fractional_short_trade_message_record.fractional_trade_volume_short[fractional_short_trade_message_at] = (fractional_short_trade_message_base + 9 + fractional_short_trade_message_at + 1) % 256; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 3 -> fractional_short_trade_message_record.reserved_3[fractional_short_trade_message_at] = (fractional_short_trade_message_base + 13 + fractional_short_trade_message_at + 1) % 256; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Fractional Short Trade Message to the wire, 16 bytes from where the cursor stands */
inline encode_fractional_short_trade_message(fractional_short_trade_message_record) {
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 5 -> wire[at] = fractional_short_trade_message_record.security_symbol_short[fractional_short_trade_message_at]; at = at + 1; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_short_trade_message_record.sale_condition_short; at = at + 1;
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
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 3 -> wire[at] = fractional_short_trade_message_record.reserved_3[fractional_short_trade_message_at]; at = at + 1; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Fractional Short Trade Message off the wire, 16 bytes from where the cursor stands */
inline decode_fractional_short_trade_message(fractional_short_trade_message_record) {
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 5 -> fractional_short_trade_message_record.security_symbol_short[fractional_short_trade_message_at] = wire[at]; at = at + 1; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  fractional_short_trade_message_record.sale_condition_short = wire[at]; at = at + 1;
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
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 3 -> fractional_short_trade_message_record.reserved_3[fractional_short_trade_message_at] = wire[at]; at = at + 1; fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Fractional Short Trade Message is what was written, byte for byte */
inline equal_fractional_short_trade_message(fractional_short_trade_message_read, fractional_short_trade_message_written) {
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 5 -> assert(fractional_short_trade_message_read.security_symbol_short[fractional_short_trade_message_at] == fractional_short_trade_message_written.security_symbol_short[fractional_short_trade_message_at]); fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  assert(fractional_short_trade_message_read.sale_condition_short == fractional_short_trade_message_written.sale_condition_short);
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
  fractional_short_trade_message_at = 0;
  do
  :: fractional_short_trade_message_at < 3 -> assert(fractional_short_trade_message_read.reserved_3[fractional_short_trade_message_at] == fractional_short_trade_message_written.reserved_3[fractional_short_trade_message_at]); fractional_short_trade_message_at = fractional_short_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Cancel Error Message: 31 bytes ------------------------------------ */

/* Allows a Participant to cancel or error trade reports for CTA eligible Equity, Local Issue or Bond originally reported using a fixed message format. */
typedef TradeCancelErrorMessage {
  byte security_symbol[11];
  byte instrument_type;
  byte trade_through_exempt_indicator;
  byte trade_reporting_facility_id;
  byte original_participant_reference_number[8];
  Timestamp2 timestamp_2;
  byte cancel_error_action
};

int trade_cancel_error_message_at;

/* every byte of Trade Cancel Error Message set to one value */
inline fill_trade_cancel_error_message(trade_cancel_error_message_record, trade_cancel_error_message_value) {
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 11 -> trade_cancel_error_message_record.security_symbol[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.instrument_type = trade_cancel_error_message_value;
  trade_cancel_error_message_record.trade_through_exempt_indicator = trade_cancel_error_message_value;
  trade_cancel_error_message_record.trade_reporting_facility_id = trade_cancel_error_message_value;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.original_participant_reference_number[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fill_timestamp2(trade_cancel_error_message_record.timestamp_2, trade_cancel_error_message_value);
  trade_cancel_error_message_record.cancel_error_action = trade_cancel_error_message_value;
  skip
}

/* each byte of Trade Cancel Error Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancel_error_message(trade_cancel_error_message_record, trade_cancel_error_message_base) {
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 11 -> trade_cancel_error_message_record.security_symbol[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 0 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.instrument_type = (trade_cancel_error_message_base + 11 + 1) % 256;
  trade_cancel_error_message_record.trade_through_exempt_indicator = (trade_cancel_error_message_base + 12 + 1) % 256;
  trade_cancel_error_message_record.trade_reporting_facility_id = (trade_cancel_error_message_base + 13 + 1) % 256;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.original_participant_reference_number[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 14 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  ramp_timestamp2(trade_cancel_error_message_record.timestamp_2, trade_cancel_error_message_base + 22);
  trade_cancel_error_message_record.cancel_error_action = (trade_cancel_error_message_base + 30 + 1) % 256;
  skip
}

/* Trade Cancel Error Message to the wire, 31 bytes from where the cursor stands */
inline encode_trade_cancel_error_message(trade_cancel_error_message_record) {
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 11 -> wire[at] = trade_cancel_error_message_record.security_symbol[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_error_message_record.instrument_type; at = at + 1;
  wire[at] = trade_cancel_error_message_record.trade_through_exempt_indicator; at = at + 1;
  wire[at] = trade_cancel_error_message_record.trade_reporting_facility_id; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.original_participant_reference_number[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  encode_timestamp2(trade_cancel_error_message_record.timestamp_2);
  wire[at] = trade_cancel_error_message_record.cancel_error_action; at = at + 1;
  skip
}

/* Trade Cancel Error Message off the wire, 31 bytes from where the cursor stands */
inline decode_trade_cancel_error_message(trade_cancel_error_message_record) {
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 11 -> trade_cancel_error_message_record.security_symbol[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.instrument_type = wire[at]; at = at + 1;
  trade_cancel_error_message_record.trade_through_exempt_indicator = wire[at]; at = at + 1;
  trade_cancel_error_message_record.trade_reporting_facility_id = wire[at]; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.original_participant_reference_number[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  decode_timestamp2(trade_cancel_error_message_record.timestamp_2);
  trade_cancel_error_message_record.cancel_error_action = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Cancel Error Message is what was written, byte for byte */
inline equal_trade_cancel_error_message(trade_cancel_error_message_read, trade_cancel_error_message_written) {
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 11 -> assert(trade_cancel_error_message_read.security_symbol[trade_cancel_error_message_at] == trade_cancel_error_message_written.security_symbol[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_error_message_read.instrument_type == trade_cancel_error_message_written.instrument_type);
  assert(trade_cancel_error_message_read.trade_through_exempt_indicator == trade_cancel_error_message_written.trade_through_exempt_indicator);
  assert(trade_cancel_error_message_read.trade_reporting_facility_id == trade_cancel_error_message_written.trade_reporting_facility_id);
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.original_participant_reference_number[trade_cancel_error_message_at] == trade_cancel_error_message_written.original_participant_reference_number[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  equal_timestamp2(trade_cancel_error_message_read.timestamp_2, trade_cancel_error_message_written.timestamp_2);
  assert(trade_cancel_error_message_read.cancel_error_action == trade_cancel_error_message_written.cancel_error_action);
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
    assert(at == 19);
    at = 0;
    decode_index_message(index_message_got);
    assert(at == 19);
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
    assert(at == 27);
    at = 0;
    decode_bid_and_offer_index_message(bid_and_offer_index_message_got);
    assert(at == 27);
    equal_bid_and_offer_index_message(bid_and_offer_index_message_got, bid_and_offer_index_message_sent)
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
    assert(at == 12);
    at = 0;
    decode_approximate_trades_and_total_dollar_value_message(approximate_trades_and_total_dollar_value_message_got);
    assert(at == 12);
    equal_approximate_trades_and_total_dollar_value_message(approximate_trades_and_total_dollar_value_message_got, approximate_trades_and_total_dollar_value_message_sent)
  }
}

/* Crossing Session Message: encoded, read back, and compared */
proctype check_crossing_session_message() {
  CrossingSessionMessage crossing_session_message_sent;
  CrossingSessionMessage crossing_session_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_crossing_session_message(crossing_session_message_sent, 0)
  :: pattern == 1 -> fill_crossing_session_message(crossing_session_message_sent, 32)
  :: pattern == 2 -> fill_crossing_session_message(crossing_session_message_sent, 255)
  :: else -> ramp_crossing_session_message(crossing_session_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_crossing_session_message(crossing_session_message_sent);
    assert(at == 24);
    at = 0;
    decode_crossing_session_message(crossing_session_message_got);
    assert(at == 24);
    equal_crossing_session_message(crossing_session_message_got, crossing_session_message_sent)
  }
}

/* Corrected Prior Day Trade Date And Time: encoded, read back, and compared */
proctype check_corrected_prior_day_trade_date_and_time() {
  CorrectedPriorDayTradeDateAndTime corrected_prior_day_trade_date_and_time_sent;
  CorrectedPriorDayTradeDateAndTime corrected_prior_day_trade_date_and_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_corrected_prior_day_trade_date_and_time(corrected_prior_day_trade_date_and_time_sent, 0)
  :: pattern == 1 -> fill_corrected_prior_day_trade_date_and_time(corrected_prior_day_trade_date_and_time_sent, 32)
  :: pattern == 2 -> fill_corrected_prior_day_trade_date_and_time(corrected_prior_day_trade_date_and_time_sent, 255)
  :: else -> ramp_corrected_prior_day_trade_date_and_time(corrected_prior_day_trade_date_and_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_corrected_prior_day_trade_date_and_time(corrected_prior_day_trade_date_and_time_sent);
    assert(at == 8);
    at = 0;
    decode_corrected_prior_day_trade_date_and_time(corrected_prior_day_trade_date_and_time_got);
    assert(at == 8);
    equal_corrected_prior_day_trade_date_and_time(corrected_prior_day_trade_date_and_time_got, corrected_prior_day_trade_date_and_time_sent)
  }
}

/* Original Prior Day Trade Date And Time: encoded, read back, and compared */
proctype check_original_prior_day_trade_date_and_time() {
  OriginalPriorDayTradeDateAndTime original_prior_day_trade_date_and_time_sent;
  OriginalPriorDayTradeDateAndTime original_prior_day_trade_date_and_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_original_prior_day_trade_date_and_time(original_prior_day_trade_date_and_time_sent, 0)
  :: pattern == 1 -> fill_original_prior_day_trade_date_and_time(original_prior_day_trade_date_and_time_sent, 32)
  :: pattern == 2 -> fill_original_prior_day_trade_date_and_time(original_prior_day_trade_date_and_time_sent, 255)
  :: else -> ramp_original_prior_day_trade_date_and_time(original_prior_day_trade_date_and_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_original_prior_day_trade_date_and_time(original_prior_day_trade_date_and_time_sent);
    assert(at == 8);
    at = 0;
    decode_original_prior_day_trade_date_and_time(original_prior_day_trade_date_and_time_got);
    assert(at == 8);
    equal_original_prior_day_trade_date_and_time(original_prior_day_trade_date_and_time_got, original_prior_day_trade_date_and_time_sent)
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
    assert(at == 69);
    at = 0;
    decode_prior_day_trade_correction_message(prior_day_trade_correction_message_got);
    assert(at == 69);
    equal_prior_day_trade_correction_message(prior_day_trade_correction_message_got, prior_day_trade_correction_message_sent)
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
    assert(at == 77);
    at = 0;
    decode_fractional_prior_day_trade_correction_message(fractional_prior_day_trade_correction_message_got);
    assert(at == 77);
    equal_fractional_prior_day_trade_correction_message(fractional_prior_day_trade_correction_message_got, fractional_prior_day_trade_correction_message_sent)
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
    assert(at == 41);
    at = 0;
    decode_prior_day_trade_message(prior_day_trade_message_got);
    assert(at == 41);
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
    assert(at == 45);
    at = 0;
    decode_fractional_prior_day_trade_message(fractional_prior_day_trade_message_got);
    assert(at == 45);
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
    assert(at == 42);
    at = 0;
    decode_prior_day_trade_cancel_error_message(prior_day_trade_cancel_error_message_got);
    assert(at == 42);
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
    assert(at == 46);
    at = 0;
    decode_fractional_prior_day_trade_cancel_error_message(fractional_prior_day_trade_cancel_error_message_got);
    assert(at == 46);
    equal_fractional_prior_day_trade_cancel_error_message(fractional_prior_day_trade_cancel_error_message_got, fractional_prior_day_trade_cancel_error_message_sent)
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
    assert(at == 49);
    at = 0;
    decode_trade_correction_message(trade_correction_message_got);
    assert(at == 49);
    equal_trade_correction_message(trade_correction_message_got, trade_correction_message_sent)
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
    assert(at == 53);
    at = 0;
    decode_fractional_trade_correction_message(fractional_trade_correction_message_got);
    assert(at == 53);
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
    assert(at == 40);
    at = 0;
    decode_long_trade_message(long_trade_message_got);
    assert(at == 40);
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
    assert(at == 44);
    at = 0;
    decode_fractional_long_trade_message(fractional_long_trade_message_got);
    assert(at == 44);
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
    assert(at == 51);
    at = 0;
    decode_trading_status_message(trading_status_message_got);
    assert(at == 51);
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
    assert(at == 14);
    at = 0;
    decode_short_trade_message(short_trade_message_got);
    assert(at == 14);
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
    assert(at == 16);
    at = 0;
    decode_fractional_short_trade_message(fractional_short_trade_message_got);
    assert(at == 16);
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
    assert(at == 31);
    at = 0;
    decode_trade_cancel_error_message(trade_cancel_error_message_got);
    assert(at == 31);
    equal_trade_cancel_error_message(trade_cancel_error_message_got, trade_cancel_error_message_sent)
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
  :: run check_test_message()
  :: run check_index_message()
  :: run check_bid_and_offer_index_message()
  :: run check_approximate_trades_and_total_dollar_value_message()
  :: run check_crossing_session_message()
  :: run check_corrected_prior_day_trade_date_and_time()
  :: run check_original_prior_day_trade_date_and_time()
  :: run check_prior_day_trade_correction_message()
  :: run check_fractional_prior_day_trade_correction_message()
  :: run check_prior_day_trade_date_and_time()
  :: run check_prior_day_trade_message()
  :: run check_fractional_prior_day_trade_message()
  :: run check_prior_day_trade_cancel_error_message()
  :: run check_fractional_prior_day_trade_cancel_error_message()
  :: run check_auction_status_message()
  :: run check_timestamp2()
  :: run check_trade_correction_message()
  :: run check_fractional_trade_correction_message()
  :: run check_long_trade_message()
  :: run check_fractional_long_trade_message()
  :: run check_trading_status_message()
  :: run check_short_trade_message()
  :: run check_fractional_short_trade_message()
  :: run check_trade_cancel_error_message()
  fi
}
