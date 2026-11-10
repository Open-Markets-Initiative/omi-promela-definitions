/*
 * CME Group iLink 3
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
 *   - a run filling what frames it
 *   - a field present only on a condition
 *   - a field read in bits
 *   - a block whose stated length holds more than its fields
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 101

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Simple Open Framing Header: 4 bytes ------------------------------------- */

/* Simple Open Framing Header */
typedef SimpleOpenFramingHeader {
  byte message_length[2];
  byte encoding_type[2]
};

int simple_open_framing_header_at;

/* every byte of Simple Open Framing Header set to one value */
inline fill_simple_open_framing_header(simple_open_framing_header_record, simple_open_framing_header_value) {
  simple_open_framing_header_at = 0;
  do
  :: simple_open_framing_header_at < 2 -> simple_open_framing_header_record.message_length[simple_open_framing_header_at] = simple_open_framing_header_value; simple_open_framing_header_at = simple_open_framing_header_at + 1
  :: else -> break
  od;
  simple_open_framing_header_at = 0;
  do
  :: simple_open_framing_header_at < 2 -> simple_open_framing_header_record.encoding_type[simple_open_framing_header_at] = simple_open_framing_header_value; simple_open_framing_header_at = simple_open_framing_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Simple Open Framing Header set to where it lies, so a field read out of place says so */
inline ramp_simple_open_framing_header(simple_open_framing_header_record, simple_open_framing_header_base) {
  simple_open_framing_header_at = 0;
  do
  :: simple_open_framing_header_at < 2 -> simple_open_framing_header_record.message_length[simple_open_framing_header_at] = (simple_open_framing_header_base + 0 + simple_open_framing_header_at + 1) % 256; simple_open_framing_header_at = simple_open_framing_header_at + 1
  :: else -> break
  od;
  simple_open_framing_header_at = 0;
  do
  :: simple_open_framing_header_at < 2 -> simple_open_framing_header_record.encoding_type[simple_open_framing_header_at] = (simple_open_framing_header_base + 2 + simple_open_framing_header_at + 1) % 256; simple_open_framing_header_at = simple_open_framing_header_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Open Framing Header to the wire, 4 bytes from where the cursor stands */
inline encode_simple_open_framing_header(simple_open_framing_header_record) {
  simple_open_framing_header_at = 0;
  do
  :: simple_open_framing_header_at < 2 -> wire[at] = simple_open_framing_header_record.message_length[simple_open_framing_header_at]; at = at + 1; simple_open_framing_header_at = simple_open_framing_header_at + 1
  :: else -> break
  od;
  simple_open_framing_header_at = 0;
  do
  :: simple_open_framing_header_at < 2 -> wire[at] = simple_open_framing_header_record.encoding_type[simple_open_framing_header_at]; at = at + 1; simple_open_framing_header_at = simple_open_framing_header_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Open Framing Header off the wire, 4 bytes from where the cursor stands */
inline decode_simple_open_framing_header(simple_open_framing_header_record) {
  simple_open_framing_header_at = 0;
  do
  :: simple_open_framing_header_at < 2 -> simple_open_framing_header_record.message_length[simple_open_framing_header_at] = wire[at]; at = at + 1; simple_open_framing_header_at = simple_open_framing_header_at + 1
  :: else -> break
  od;
  simple_open_framing_header_at = 0;
  do
  :: simple_open_framing_header_at < 2 -> simple_open_framing_header_record.encoding_type[simple_open_framing_header_at] = wire[at]; at = at + 1; simple_open_framing_header_at = simple_open_framing_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Simple Open Framing Header is what was written, byte for byte */
inline equal_simple_open_framing_header(simple_open_framing_header_read, simple_open_framing_header_written) {
  simple_open_framing_header_at = 0;
  do
  :: simple_open_framing_header_at < 2 -> assert(simple_open_framing_header_read.message_length[simple_open_framing_header_at] == simple_open_framing_header_written.message_length[simple_open_framing_header_at]); simple_open_framing_header_at = simple_open_framing_header_at + 1
  :: else -> break
  od;
  simple_open_framing_header_at = 0;
  do
  :: simple_open_framing_header_at < 2 -> assert(simple_open_framing_header_read.encoding_type[simple_open_framing_header_at] == simple_open_framing_header_written.encoding_type[simple_open_framing_header_at]); simple_open_framing_header_at = simple_open_framing_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 8 bytes ------------------------------------------------- */

/* Template ID and length of message root */
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

/* ---- Sequence: 14 bytes ------------------------------------------------------ */

/* The Sequence message is used in both Recoverable (CME to customer) and Idempotent (customer to CME) flows. */
typedef Sequence {
  byte uuid[8];
  byte next_seq_no[4];
  byte fault_tolerance_indicator;
  byte keep_alive_interval_lapsed
};

int sequence_at;

/* every byte of Sequence set to one value */
inline fill_sequence(sequence_record, sequence_value) {
  sequence_at = 0;
  do
  :: sequence_at < 8 -> sequence_record.uuid[sequence_at] = sequence_value; sequence_at = sequence_at + 1
  :: else -> break
  od;
  sequence_at = 0;
  do
  :: sequence_at < 4 -> sequence_record.next_seq_no[sequence_at] = sequence_value; sequence_at = sequence_at + 1
  :: else -> break
  od;
  sequence_record.fault_tolerance_indicator = sequence_value;
  sequence_record.keep_alive_interval_lapsed = sequence_value;
  skip
}

/* each byte of Sequence set to where it lies, so a field read out of place says so */
inline ramp_sequence(sequence_record, sequence_base) {
  sequence_at = 0;
  do
  :: sequence_at < 8 -> sequence_record.uuid[sequence_at] = (sequence_base + 0 + sequence_at + 1) % 256; sequence_at = sequence_at + 1
  :: else -> break
  od;
  sequence_at = 0;
  do
  :: sequence_at < 4 -> sequence_record.next_seq_no[sequence_at] = (sequence_base + 8 + sequence_at + 1) % 256; sequence_at = sequence_at + 1
  :: else -> break
  od;
  sequence_record.fault_tolerance_indicator = (sequence_base + 12 + 1) % 256;
  sequence_record.keep_alive_interval_lapsed = (sequence_base + 13 + 1) % 256;
  skip
}

/* Sequence to the wire, 14 bytes from where the cursor stands */
inline encode_sequence(sequence_record) {
  sequence_at = 0;
  do
  :: sequence_at < 8 -> wire[at] = sequence_record.uuid[sequence_at]; at = at + 1; sequence_at = sequence_at + 1
  :: else -> break
  od;
  sequence_at = 0;
  do
  :: sequence_at < 4 -> wire[at] = sequence_record.next_seq_no[sequence_at]; at = at + 1; sequence_at = sequence_at + 1
  :: else -> break
  od;
  wire[at] = sequence_record.fault_tolerance_indicator; at = at + 1;
  wire[at] = sequence_record.keep_alive_interval_lapsed; at = at + 1;
  skip
}

/* Sequence off the wire, 14 bytes from where the cursor stands */
inline decode_sequence(sequence_record) {
  sequence_at = 0;
  do
  :: sequence_at < 8 -> sequence_record.uuid[sequence_at] = wire[at]; at = at + 1; sequence_at = sequence_at + 1
  :: else -> break
  od;
  sequence_at = 0;
  do
  :: sequence_at < 4 -> sequence_record.next_seq_no[sequence_at] = wire[at]; at = at + 1; sequence_at = sequence_at + 1
  :: else -> break
  od;
  sequence_record.fault_tolerance_indicator = wire[at]; at = at + 1;
  sequence_record.keep_alive_interval_lapsed = wire[at]; at = at + 1;
  skip
}

/* what was read of Sequence is what was written, byte for byte */
inline equal_sequence(sequence_read, sequence_written) {
  sequence_at = 0;
  do
  :: sequence_at < 8 -> assert(sequence_read.uuid[sequence_at] == sequence_written.uuid[sequence_at]); sequence_at = sequence_at + 1
  :: else -> break
  od;
  sequence_at = 0;
  do
  :: sequence_at < 4 -> assert(sequence_read.next_seq_no[sequence_at] == sequence_written.next_seq_no[sequence_at]); sequence_at = sequence_at + 1
  :: else -> break
  od;
  assert(sequence_read.fault_tolerance_indicator == sequence_written.fault_tolerance_indicator);
  assert(sequence_read.keep_alive_interval_lapsed == sequence_written.keep_alive_interval_lapsed);
  skip
}

/* ---- Terminate: 67 bytes ----------------------------------------------------- */

/* The Terminate message is sent to indicate that the sender is going to disconnect the TCP socket connection. */
typedef Terminate {
  byte reason[48];
  byte uuid[8];
  byte request_timestamp[8];
  byte error_codes[2];
  byte split_msg
};

int terminate_at;

/* every byte of Terminate set to one value */
inline fill_terminate(terminate_record, terminate_value) {
  terminate_at = 0;
  do
  :: terminate_at < 48 -> terminate_record.reason[terminate_at] = terminate_value; terminate_at = terminate_at + 1
  :: else -> break
  od;
  terminate_at = 0;
  do
  :: terminate_at < 8 -> terminate_record.uuid[terminate_at] = terminate_value; terminate_at = terminate_at + 1
  :: else -> break
  od;
  terminate_at = 0;
  do
  :: terminate_at < 8 -> terminate_record.request_timestamp[terminate_at] = terminate_value; terminate_at = terminate_at + 1
  :: else -> break
  od;
  terminate_at = 0;
  do
  :: terminate_at < 2 -> terminate_record.error_codes[terminate_at] = terminate_value; terminate_at = terminate_at + 1
  :: else -> break
  od;
  terminate_record.split_msg = terminate_value;
  skip
}

/* each byte of Terminate set to where it lies, so a field read out of place says so */
inline ramp_terminate(terminate_record, terminate_base) {
  terminate_at = 0;
  do
  :: terminate_at < 48 -> terminate_record.reason[terminate_at] = (terminate_base + 0 + terminate_at + 1) % 256; terminate_at = terminate_at + 1
  :: else -> break
  od;
  terminate_at = 0;
  do
  :: terminate_at < 8 -> terminate_record.uuid[terminate_at] = (terminate_base + 48 + terminate_at + 1) % 256; terminate_at = terminate_at + 1
  :: else -> break
  od;
  terminate_at = 0;
  do
  :: terminate_at < 8 -> terminate_record.request_timestamp[terminate_at] = (terminate_base + 56 + terminate_at + 1) % 256; terminate_at = terminate_at + 1
  :: else -> break
  od;
  terminate_at = 0;
  do
  :: terminate_at < 2 -> terminate_record.error_codes[terminate_at] = (terminate_base + 64 + terminate_at + 1) % 256; terminate_at = terminate_at + 1
  :: else -> break
  od;
  terminate_record.split_msg = (terminate_base + 66 + 1) % 256;
  skip
}

/* Terminate to the wire, 67 bytes from where the cursor stands */
inline encode_terminate(terminate_record) {
  terminate_at = 0;
  do
  :: terminate_at < 48 -> wire[at] = terminate_record.reason[terminate_at]; at = at + 1; terminate_at = terminate_at + 1
  :: else -> break
  od;
  terminate_at = 0;
  do
  :: terminate_at < 8 -> wire[at] = terminate_record.uuid[terminate_at]; at = at + 1; terminate_at = terminate_at + 1
  :: else -> break
  od;
  terminate_at = 0;
  do
  :: terminate_at < 8 -> wire[at] = terminate_record.request_timestamp[terminate_at]; at = at + 1; terminate_at = terminate_at + 1
  :: else -> break
  od;
  terminate_at = 0;
  do
  :: terminate_at < 2 -> wire[at] = terminate_record.error_codes[terminate_at]; at = at + 1; terminate_at = terminate_at + 1
  :: else -> break
  od;
  wire[at] = terminate_record.split_msg; at = at + 1;
  skip
}

/* Terminate off the wire, 67 bytes from where the cursor stands */
inline decode_terminate(terminate_record) {
  terminate_at = 0;
  do
  :: terminate_at < 48 -> terminate_record.reason[terminate_at] = wire[at]; at = at + 1; terminate_at = terminate_at + 1
  :: else -> break
  od;
  terminate_at = 0;
  do
  :: terminate_at < 8 -> terminate_record.uuid[terminate_at] = wire[at]; at = at + 1; terminate_at = terminate_at + 1
  :: else -> break
  od;
  terminate_at = 0;
  do
  :: terminate_at < 8 -> terminate_record.request_timestamp[terminate_at] = wire[at]; at = at + 1; terminate_at = terminate_at + 1
  :: else -> break
  od;
  terminate_at = 0;
  do
  :: terminate_at < 2 -> terminate_record.error_codes[terminate_at] = wire[at]; at = at + 1; terminate_at = terminate_at + 1
  :: else -> break
  od;
  terminate_record.split_msg = wire[at]; at = at + 1;
  skip
}

/* what was read of Terminate is what was written, byte for byte */
inline equal_terminate(terminate_read, terminate_written) {
  terminate_at = 0;
  do
  :: terminate_at < 48 -> assert(terminate_read.reason[terminate_at] == terminate_written.reason[terminate_at]); terminate_at = terminate_at + 1
  :: else -> break
  od;
  terminate_at = 0;
  do
  :: terminate_at < 8 -> assert(terminate_read.uuid[terminate_at] == terminate_written.uuid[terminate_at]); terminate_at = terminate_at + 1
  :: else -> break
  od;
  terminate_at = 0;
  do
  :: terminate_at < 8 -> assert(terminate_read.request_timestamp[terminate_at] == terminate_written.request_timestamp[terminate_at]); terminate_at = terminate_at + 1
  :: else -> break
  od;
  terminate_at = 0;
  do
  :: terminate_at < 2 -> assert(terminate_read.error_codes[terminate_at] == terminate_written.error_codes[terminate_at]); terminate_at = terminate_at + 1
  :: else -> break
  od;
  assert(terminate_read.split_msg == terminate_written.split_msg);
  skip
}

/* ---- Retransmit Request: 30 bytes -------------------------------------------- */

/* Customers can send the Retransmit Request message to recover missed messages. */
typedef RetransmitRequest {
  byte uuid[8];
  byte last_uuid[8];
  byte request_timestamp[8];
  byte from_seq_no[4];
  byte msg_count_16[2]
};

int retransmit_request_at;

/* every byte of Retransmit Request set to one value */
inline fill_retransmit_request(retransmit_request_record, retransmit_request_value) {
  retransmit_request_at = 0;
  do
  :: retransmit_request_at < 8 -> retransmit_request_record.uuid[retransmit_request_at] = retransmit_request_value; retransmit_request_at = retransmit_request_at + 1
  :: else -> break
  od;
  retransmit_request_at = 0;
  do
  :: retransmit_request_at < 8 -> retransmit_request_record.last_uuid[retransmit_request_at] = retransmit_request_value; retransmit_request_at = retransmit_request_at + 1
  :: else -> break
  od;
  retransmit_request_at = 0;
  do
  :: retransmit_request_at < 8 -> retransmit_request_record.request_timestamp[retransmit_request_at] = retransmit_request_value; retransmit_request_at = retransmit_request_at + 1
  :: else -> break
  od;
  retransmit_request_at = 0;
  do
  :: retransmit_request_at < 4 -> retransmit_request_record.from_seq_no[retransmit_request_at] = retransmit_request_value; retransmit_request_at = retransmit_request_at + 1
  :: else -> break
  od;
  retransmit_request_at = 0;
  do
  :: retransmit_request_at < 2 -> retransmit_request_record.msg_count_16[retransmit_request_at] = retransmit_request_value; retransmit_request_at = retransmit_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Retransmit Request set to where it lies, so a field read out of place says so */
inline ramp_retransmit_request(retransmit_request_record, retransmit_request_base) {
  retransmit_request_at = 0;
  do
  :: retransmit_request_at < 8 -> retransmit_request_record.uuid[retransmit_request_at] = (retransmit_request_base + 0 + retransmit_request_at + 1) % 256; retransmit_request_at = retransmit_request_at + 1
  :: else -> break
  od;
  retransmit_request_at = 0;
  do
  :: retransmit_request_at < 8 -> retransmit_request_record.last_uuid[retransmit_request_at] = (retransmit_request_base + 8 + retransmit_request_at + 1) % 256; retransmit_request_at = retransmit_request_at + 1
  :: else -> break
  od;
  retransmit_request_at = 0;
  do
  :: retransmit_request_at < 8 -> retransmit_request_record.request_timestamp[retransmit_request_at] = (retransmit_request_base + 16 + retransmit_request_at + 1) % 256; retransmit_request_at = retransmit_request_at + 1
  :: else -> break
  od;
  retransmit_request_at = 0;
  do
  :: retransmit_request_at < 4 -> retransmit_request_record.from_seq_no[retransmit_request_at] = (retransmit_request_base + 24 + retransmit_request_at + 1) % 256; retransmit_request_at = retransmit_request_at + 1
  :: else -> break
  od;
  retransmit_request_at = 0;
  do
  :: retransmit_request_at < 2 -> retransmit_request_record.msg_count_16[retransmit_request_at] = (retransmit_request_base + 28 + retransmit_request_at + 1) % 256; retransmit_request_at = retransmit_request_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmit Request to the wire, 30 bytes from where the cursor stands */
inline encode_retransmit_request(retransmit_request_record) {
  retransmit_request_at = 0;
  do
  :: retransmit_request_at < 8 -> wire[at] = retransmit_request_record.uuid[retransmit_request_at]; at = at + 1; retransmit_request_at = retransmit_request_at + 1
  :: else -> break
  od;
  retransmit_request_at = 0;
  do
  :: retransmit_request_at < 8 -> wire[at] = retransmit_request_record.last_uuid[retransmit_request_at]; at = at + 1; retransmit_request_at = retransmit_request_at + 1
  :: else -> break
  od;
  retransmit_request_at = 0;
  do
  :: retransmit_request_at < 8 -> wire[at] = retransmit_request_record.request_timestamp[retransmit_request_at]; at = at + 1; retransmit_request_at = retransmit_request_at + 1
  :: else -> break
  od;
  retransmit_request_at = 0;
  do
  :: retransmit_request_at < 4 -> wire[at] = retransmit_request_record.from_seq_no[retransmit_request_at]; at = at + 1; retransmit_request_at = retransmit_request_at + 1
  :: else -> break
  od;
  retransmit_request_at = 0;
  do
  :: retransmit_request_at < 2 -> wire[at] = retransmit_request_record.msg_count_16[retransmit_request_at]; at = at + 1; retransmit_request_at = retransmit_request_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmit Request off the wire, 30 bytes from where the cursor stands */
inline decode_retransmit_request(retransmit_request_record) {
  retransmit_request_at = 0;
  do
  :: retransmit_request_at < 8 -> retransmit_request_record.uuid[retransmit_request_at] = wire[at]; at = at + 1; retransmit_request_at = retransmit_request_at + 1
  :: else -> break
  od;
  retransmit_request_at = 0;
  do
  :: retransmit_request_at < 8 -> retransmit_request_record.last_uuid[retransmit_request_at] = wire[at]; at = at + 1; retransmit_request_at = retransmit_request_at + 1
  :: else -> break
  od;
  retransmit_request_at = 0;
  do
  :: retransmit_request_at < 8 -> retransmit_request_record.request_timestamp[retransmit_request_at] = wire[at]; at = at + 1; retransmit_request_at = retransmit_request_at + 1
  :: else -> break
  od;
  retransmit_request_at = 0;
  do
  :: retransmit_request_at < 4 -> retransmit_request_record.from_seq_no[retransmit_request_at] = wire[at]; at = at + 1; retransmit_request_at = retransmit_request_at + 1
  :: else -> break
  od;
  retransmit_request_at = 0;
  do
  :: retransmit_request_at < 2 -> retransmit_request_record.msg_count_16[retransmit_request_at] = wire[at]; at = at + 1; retransmit_request_at = retransmit_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Retransmit Request is what was written, byte for byte */
inline equal_retransmit_request(retransmit_request_read, retransmit_request_written) {
  retransmit_request_at = 0;
  do
  :: retransmit_request_at < 8 -> assert(retransmit_request_read.uuid[retransmit_request_at] == retransmit_request_written.uuid[retransmit_request_at]); retransmit_request_at = retransmit_request_at + 1
  :: else -> break
  od;
  retransmit_request_at = 0;
  do
  :: retransmit_request_at < 8 -> assert(retransmit_request_read.last_uuid[retransmit_request_at] == retransmit_request_written.last_uuid[retransmit_request_at]); retransmit_request_at = retransmit_request_at + 1
  :: else -> break
  od;
  retransmit_request_at = 0;
  do
  :: retransmit_request_at < 8 -> assert(retransmit_request_read.request_timestamp[retransmit_request_at] == retransmit_request_written.request_timestamp[retransmit_request_at]); retransmit_request_at = retransmit_request_at + 1
  :: else -> break
  od;
  retransmit_request_at = 0;
  do
  :: retransmit_request_at < 4 -> assert(retransmit_request_read.from_seq_no[retransmit_request_at] == retransmit_request_written.from_seq_no[retransmit_request_at]); retransmit_request_at = retransmit_request_at + 1
  :: else -> break
  od;
  retransmit_request_at = 0;
  do
  :: retransmit_request_at < 2 -> assert(retransmit_request_read.msg_count_16[retransmit_request_at] == retransmit_request_written.msg_count_16[retransmit_request_at]); retransmit_request_at = retransmit_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancel Request: 88 bytes ------------------------------------------ */

/* Sent by client system to cancel an existing order; an order may be cancelled by referencing the Order ID. */
typedef OrderCancelRequest {
  byte order_id[8];
  byte party_details_list_req_id[8];
  byte manual_order_indicator;
  byte seq_num[4];
  byte sender_id[20];
  byte cl_ord_id[20];
  byte order_request_id[8];
  byte sending_time_epoch[8];
  byte location[5];
  byte security_id[4];
  byte side;
  byte liquidity_flag
};

int order_cancel_request_at;

/* every byte of Order Cancel Request set to one value */
inline fill_order_cancel_request(order_cancel_request_record, order_cancel_request_value) {
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 8 -> order_cancel_request_record.order_id[order_cancel_request_at] = order_cancel_request_value; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 8 -> order_cancel_request_record.party_details_list_req_id[order_cancel_request_at] = order_cancel_request_value; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_record.manual_order_indicator = order_cancel_request_value;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 4 -> order_cancel_request_record.seq_num[order_cancel_request_at] = order_cancel_request_value; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 20 -> order_cancel_request_record.sender_id[order_cancel_request_at] = order_cancel_request_value; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 20 -> order_cancel_request_record.cl_ord_id[order_cancel_request_at] = order_cancel_request_value; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 8 -> order_cancel_request_record.order_request_id[order_cancel_request_at] = order_cancel_request_value; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 8 -> order_cancel_request_record.sending_time_epoch[order_cancel_request_at] = order_cancel_request_value; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 5 -> order_cancel_request_record.location[order_cancel_request_at] = order_cancel_request_value; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 4 -> order_cancel_request_record.security_id[order_cancel_request_at] = order_cancel_request_value; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_record.side = order_cancel_request_value;
  order_cancel_request_record.liquidity_flag = order_cancel_request_value;
  skip
}

/* each byte of Order Cancel Request set to where it lies, so a field read out of place says so */
inline ramp_order_cancel_request(order_cancel_request_record, order_cancel_request_base) {
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 8 -> order_cancel_request_record.order_id[order_cancel_request_at] = (order_cancel_request_base + 0 + order_cancel_request_at + 1) % 256; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 8 -> order_cancel_request_record.party_details_list_req_id[order_cancel_request_at] = (order_cancel_request_base + 8 + order_cancel_request_at + 1) % 256; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_record.manual_order_indicator = (order_cancel_request_base + 16 + 1) % 256;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 4 -> order_cancel_request_record.seq_num[order_cancel_request_at] = (order_cancel_request_base + 17 + order_cancel_request_at + 1) % 256; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 20 -> order_cancel_request_record.sender_id[order_cancel_request_at] = (order_cancel_request_base + 21 + order_cancel_request_at + 1) % 256; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 20 -> order_cancel_request_record.cl_ord_id[order_cancel_request_at] = (order_cancel_request_base + 41 + order_cancel_request_at + 1) % 256; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 8 -> order_cancel_request_record.order_request_id[order_cancel_request_at] = (order_cancel_request_base + 61 + order_cancel_request_at + 1) % 256; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 8 -> order_cancel_request_record.sending_time_epoch[order_cancel_request_at] = (order_cancel_request_base + 69 + order_cancel_request_at + 1) % 256; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 5 -> order_cancel_request_record.location[order_cancel_request_at] = (order_cancel_request_base + 77 + order_cancel_request_at + 1) % 256; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 4 -> order_cancel_request_record.security_id[order_cancel_request_at] = (order_cancel_request_base + 82 + order_cancel_request_at + 1) % 256; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_record.side = (order_cancel_request_base + 86 + 1) % 256;
  order_cancel_request_record.liquidity_flag = (order_cancel_request_base + 87 + 1) % 256;
  skip
}

/* Order Cancel Request to the wire, 88 bytes from where the cursor stands */
inline encode_order_cancel_request(order_cancel_request_record) {
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 8 -> wire[at] = order_cancel_request_record.order_id[order_cancel_request_at]; at = at + 1; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 8 -> wire[at] = order_cancel_request_record.party_details_list_req_id[order_cancel_request_at]; at = at + 1; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  wire[at] = order_cancel_request_record.manual_order_indicator; at = at + 1;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 4 -> wire[at] = order_cancel_request_record.seq_num[order_cancel_request_at]; at = at + 1; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 20 -> wire[at] = order_cancel_request_record.sender_id[order_cancel_request_at]; at = at + 1; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 20 -> wire[at] = order_cancel_request_record.cl_ord_id[order_cancel_request_at]; at = at + 1; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 8 -> wire[at] = order_cancel_request_record.order_request_id[order_cancel_request_at]; at = at + 1; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 8 -> wire[at] = order_cancel_request_record.sending_time_epoch[order_cancel_request_at]; at = at + 1; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 5 -> wire[at] = order_cancel_request_record.location[order_cancel_request_at]; at = at + 1; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 4 -> wire[at] = order_cancel_request_record.security_id[order_cancel_request_at]; at = at + 1; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  wire[at] = order_cancel_request_record.side; at = at + 1;
  wire[at] = order_cancel_request_record.liquidity_flag; at = at + 1;
  skip
}

/* Order Cancel Request off the wire, 88 bytes from where the cursor stands */
inline decode_order_cancel_request(order_cancel_request_record) {
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 8 -> order_cancel_request_record.order_id[order_cancel_request_at] = wire[at]; at = at + 1; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 8 -> order_cancel_request_record.party_details_list_req_id[order_cancel_request_at] = wire[at]; at = at + 1; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_record.manual_order_indicator = wire[at]; at = at + 1;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 4 -> order_cancel_request_record.seq_num[order_cancel_request_at] = wire[at]; at = at + 1; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 20 -> order_cancel_request_record.sender_id[order_cancel_request_at] = wire[at]; at = at + 1; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 20 -> order_cancel_request_record.cl_ord_id[order_cancel_request_at] = wire[at]; at = at + 1; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 8 -> order_cancel_request_record.order_request_id[order_cancel_request_at] = wire[at]; at = at + 1; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 8 -> order_cancel_request_record.sending_time_epoch[order_cancel_request_at] = wire[at]; at = at + 1; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 5 -> order_cancel_request_record.location[order_cancel_request_at] = wire[at]; at = at + 1; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 4 -> order_cancel_request_record.security_id[order_cancel_request_at] = wire[at]; at = at + 1; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_record.side = wire[at]; at = at + 1;
  order_cancel_request_record.liquidity_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Cancel Request is what was written, byte for byte */
inline equal_order_cancel_request(order_cancel_request_read, order_cancel_request_written) {
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 8 -> assert(order_cancel_request_read.order_id[order_cancel_request_at] == order_cancel_request_written.order_id[order_cancel_request_at]); order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 8 -> assert(order_cancel_request_read.party_details_list_req_id[order_cancel_request_at] == order_cancel_request_written.party_details_list_req_id[order_cancel_request_at]); order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  assert(order_cancel_request_read.manual_order_indicator == order_cancel_request_written.manual_order_indicator);
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 4 -> assert(order_cancel_request_read.seq_num[order_cancel_request_at] == order_cancel_request_written.seq_num[order_cancel_request_at]); order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 20 -> assert(order_cancel_request_read.sender_id[order_cancel_request_at] == order_cancel_request_written.sender_id[order_cancel_request_at]); order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 20 -> assert(order_cancel_request_read.cl_ord_id[order_cancel_request_at] == order_cancel_request_written.cl_ord_id[order_cancel_request_at]); order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 8 -> assert(order_cancel_request_read.order_request_id[order_cancel_request_at] == order_cancel_request_written.order_request_id[order_cancel_request_at]); order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 8 -> assert(order_cancel_request_read.sending_time_epoch[order_cancel_request_at] == order_cancel_request_written.sending_time_epoch[order_cancel_request_at]); order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 5 -> assert(order_cancel_request_read.location[order_cancel_request_at] == order_cancel_request_written.location[order_cancel_request_at]); order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 4 -> assert(order_cancel_request_read.security_id[order_cancel_request_at] == order_cancel_request_written.security_id[order_cancel_request_at]); order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  assert(order_cancel_request_read.side == order_cancel_request_written.side);
  assert(order_cancel_request_read.liquidity_flag == order_cancel_request_written.liquidity_flag);
  skip
}

/* ---- Group Size: 3 bytes ----------------------------------------------------- */

/* Repeating group dimensions */
typedef GroupSize {
  byte block_length[2];
  byte num_in_group
};

int group_size_at;

/* every byte of Group Size set to one value */
inline fill_group_size(group_size_record, group_size_value) {
  group_size_at = 0;
  do
  :: group_size_at < 2 -> group_size_record.block_length[group_size_at] = group_size_value; group_size_at = group_size_at + 1
  :: else -> break
  od;
  group_size_record.num_in_group = group_size_value;
  skip
}

/* each byte of Group Size set to where it lies, so a field read out of place says so */
inline ramp_group_size(group_size_record, group_size_base) {
  group_size_at = 0;
  do
  :: group_size_at < 2 -> group_size_record.block_length[group_size_at] = (group_size_base + 0 + group_size_at + 1) % 256; group_size_at = group_size_at + 1
  :: else -> break
  od;
  group_size_record.num_in_group = (group_size_base + 2 + 1) % 256;
  skip
}

/* Group Size to the wire, 3 bytes from where the cursor stands */
inline encode_group_size(group_size_record) {
  group_size_at = 0;
  do
  :: group_size_at < 2 -> wire[at] = group_size_record.block_length[group_size_at]; at = at + 1; group_size_at = group_size_at + 1
  :: else -> break
  od;
  wire[at] = group_size_record.num_in_group; at = at + 1;
  skip
}

/* Group Size off the wire, 3 bytes from where the cursor stands */
inline decode_group_size(group_size_record) {
  group_size_at = 0;
  do
  :: group_size_at < 2 -> group_size_record.block_length[group_size_at] = wire[at]; at = at + 1; group_size_at = group_size_at + 1
  :: else -> break
  od;
  group_size_record.num_in_group = wire[at]; at = at + 1;
  skip
}

/* what was read of Group Size is what was written, byte for byte */
inline equal_group_size(group_size_read, group_size_written) {
  group_size_at = 0;
  do
  :: group_size_at < 2 -> assert(group_size_read.block_length[group_size_at] == group_size_written.block_length[group_size_at]); group_size_at = group_size_at + 1
  :: else -> break
  od;
  assert(group_size_read.num_in_group == group_size_written.num_in_group);
  skip
}

/* ---- Order Mass Action Request: 71 bytes ------------------------------------- */

/* An Order Mass Action Request is sent by the client system to cancel working orders for a particular SenderCompID for futures, options on futures, and BrokerTec markets on CME Globex. */
typedef OrderMassActionRequest {
  byte party_details_list_req_id[8];
  byte order_request_id[8];
  byte manual_order_indicator;
  byte seq_num[4];
  byte sender_id[20];
  byte sending_time_epoch[8];
  byte security_group[6];
  byte location[5];
  byte security_id_optional[4];
  byte mass_action_scope;
  byte market_segment_id;
  byte mass_cancel_request_type;
  byte side_optional;
  byte mass_action_ord_typ;
  byte mass_cancel_tif;
  byte liquidity_flag
};

int order_mass_action_request_at;

/* every byte of Order Mass Action Request set to one value */
inline fill_order_mass_action_request(order_mass_action_request_record, order_mass_action_request_value) {
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 8 -> order_mass_action_request_record.party_details_list_req_id[order_mass_action_request_at] = order_mass_action_request_value; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 8 -> order_mass_action_request_record.order_request_id[order_mass_action_request_at] = order_mass_action_request_value; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_record.manual_order_indicator = order_mass_action_request_value;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 4 -> order_mass_action_request_record.seq_num[order_mass_action_request_at] = order_mass_action_request_value; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 20 -> order_mass_action_request_record.sender_id[order_mass_action_request_at] = order_mass_action_request_value; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 8 -> order_mass_action_request_record.sending_time_epoch[order_mass_action_request_at] = order_mass_action_request_value; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 6 -> order_mass_action_request_record.security_group[order_mass_action_request_at] = order_mass_action_request_value; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 5 -> order_mass_action_request_record.location[order_mass_action_request_at] = order_mass_action_request_value; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 4 -> order_mass_action_request_record.security_id_optional[order_mass_action_request_at] = order_mass_action_request_value; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_record.mass_action_scope = order_mass_action_request_value;
  order_mass_action_request_record.market_segment_id = order_mass_action_request_value;
  order_mass_action_request_record.mass_cancel_request_type = order_mass_action_request_value;
  order_mass_action_request_record.side_optional = order_mass_action_request_value;
  order_mass_action_request_record.mass_action_ord_typ = order_mass_action_request_value;
  order_mass_action_request_record.mass_cancel_tif = order_mass_action_request_value;
  order_mass_action_request_record.liquidity_flag = order_mass_action_request_value;
  skip
}

/* each byte of Order Mass Action Request set to where it lies, so a field read out of place says so */
inline ramp_order_mass_action_request(order_mass_action_request_record, order_mass_action_request_base) {
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 8 -> order_mass_action_request_record.party_details_list_req_id[order_mass_action_request_at] = (order_mass_action_request_base + 0 + order_mass_action_request_at + 1) % 256; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 8 -> order_mass_action_request_record.order_request_id[order_mass_action_request_at] = (order_mass_action_request_base + 8 + order_mass_action_request_at + 1) % 256; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_record.manual_order_indicator = (order_mass_action_request_base + 16 + 1) % 256;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 4 -> order_mass_action_request_record.seq_num[order_mass_action_request_at] = (order_mass_action_request_base + 17 + order_mass_action_request_at + 1) % 256; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 20 -> order_mass_action_request_record.sender_id[order_mass_action_request_at] = (order_mass_action_request_base + 21 + order_mass_action_request_at + 1) % 256; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 8 -> order_mass_action_request_record.sending_time_epoch[order_mass_action_request_at] = (order_mass_action_request_base + 41 + order_mass_action_request_at + 1) % 256; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 6 -> order_mass_action_request_record.security_group[order_mass_action_request_at] = (order_mass_action_request_base + 49 + order_mass_action_request_at + 1) % 256; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 5 -> order_mass_action_request_record.location[order_mass_action_request_at] = (order_mass_action_request_base + 55 + order_mass_action_request_at + 1) % 256; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 4 -> order_mass_action_request_record.security_id_optional[order_mass_action_request_at] = (order_mass_action_request_base + 60 + order_mass_action_request_at + 1) % 256; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_record.mass_action_scope = (order_mass_action_request_base + 64 + 1) % 256;
  order_mass_action_request_record.market_segment_id = (order_mass_action_request_base + 65 + 1) % 256;
  order_mass_action_request_record.mass_cancel_request_type = (order_mass_action_request_base + 66 + 1) % 256;
  order_mass_action_request_record.side_optional = (order_mass_action_request_base + 67 + 1) % 256;
  order_mass_action_request_record.mass_action_ord_typ = (order_mass_action_request_base + 68 + 1) % 256;
  order_mass_action_request_record.mass_cancel_tif = (order_mass_action_request_base + 69 + 1) % 256;
  order_mass_action_request_record.liquidity_flag = (order_mass_action_request_base + 70 + 1) % 256;
  skip
}

/* Order Mass Action Request to the wire, 71 bytes from where the cursor stands */
inline encode_order_mass_action_request(order_mass_action_request_record) {
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 8 -> wire[at] = order_mass_action_request_record.party_details_list_req_id[order_mass_action_request_at]; at = at + 1; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 8 -> wire[at] = order_mass_action_request_record.order_request_id[order_mass_action_request_at]; at = at + 1; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  wire[at] = order_mass_action_request_record.manual_order_indicator; at = at + 1;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 4 -> wire[at] = order_mass_action_request_record.seq_num[order_mass_action_request_at]; at = at + 1; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 20 -> wire[at] = order_mass_action_request_record.sender_id[order_mass_action_request_at]; at = at + 1; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 8 -> wire[at] = order_mass_action_request_record.sending_time_epoch[order_mass_action_request_at]; at = at + 1; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 6 -> wire[at] = order_mass_action_request_record.security_group[order_mass_action_request_at]; at = at + 1; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 5 -> wire[at] = order_mass_action_request_record.location[order_mass_action_request_at]; at = at + 1; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 4 -> wire[at] = order_mass_action_request_record.security_id_optional[order_mass_action_request_at]; at = at + 1; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  wire[at] = order_mass_action_request_record.mass_action_scope; at = at + 1;
  wire[at] = order_mass_action_request_record.market_segment_id; at = at + 1;
  wire[at] = order_mass_action_request_record.mass_cancel_request_type; at = at + 1;
  wire[at] = order_mass_action_request_record.side_optional; at = at + 1;
  wire[at] = order_mass_action_request_record.mass_action_ord_typ; at = at + 1;
  wire[at] = order_mass_action_request_record.mass_cancel_tif; at = at + 1;
  wire[at] = order_mass_action_request_record.liquidity_flag; at = at + 1;
  skip
}

/* Order Mass Action Request off the wire, 71 bytes from where the cursor stands */
inline decode_order_mass_action_request(order_mass_action_request_record) {
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 8 -> order_mass_action_request_record.party_details_list_req_id[order_mass_action_request_at] = wire[at]; at = at + 1; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 8 -> order_mass_action_request_record.order_request_id[order_mass_action_request_at] = wire[at]; at = at + 1; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_record.manual_order_indicator = wire[at]; at = at + 1;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 4 -> order_mass_action_request_record.seq_num[order_mass_action_request_at] = wire[at]; at = at + 1; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 20 -> order_mass_action_request_record.sender_id[order_mass_action_request_at] = wire[at]; at = at + 1; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 8 -> order_mass_action_request_record.sending_time_epoch[order_mass_action_request_at] = wire[at]; at = at + 1; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 6 -> order_mass_action_request_record.security_group[order_mass_action_request_at] = wire[at]; at = at + 1; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 5 -> order_mass_action_request_record.location[order_mass_action_request_at] = wire[at]; at = at + 1; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 4 -> order_mass_action_request_record.security_id_optional[order_mass_action_request_at] = wire[at]; at = at + 1; order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_record.mass_action_scope = wire[at]; at = at + 1;
  order_mass_action_request_record.market_segment_id = wire[at]; at = at + 1;
  order_mass_action_request_record.mass_cancel_request_type = wire[at]; at = at + 1;
  order_mass_action_request_record.side_optional = wire[at]; at = at + 1;
  order_mass_action_request_record.mass_action_ord_typ = wire[at]; at = at + 1;
  order_mass_action_request_record.mass_cancel_tif = wire[at]; at = at + 1;
  order_mass_action_request_record.liquidity_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Mass Action Request is what was written, byte for byte */
inline equal_order_mass_action_request(order_mass_action_request_read, order_mass_action_request_written) {
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 8 -> assert(order_mass_action_request_read.party_details_list_req_id[order_mass_action_request_at] == order_mass_action_request_written.party_details_list_req_id[order_mass_action_request_at]); order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 8 -> assert(order_mass_action_request_read.order_request_id[order_mass_action_request_at] == order_mass_action_request_written.order_request_id[order_mass_action_request_at]); order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  assert(order_mass_action_request_read.manual_order_indicator == order_mass_action_request_written.manual_order_indicator);
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 4 -> assert(order_mass_action_request_read.seq_num[order_mass_action_request_at] == order_mass_action_request_written.seq_num[order_mass_action_request_at]); order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 20 -> assert(order_mass_action_request_read.sender_id[order_mass_action_request_at] == order_mass_action_request_written.sender_id[order_mass_action_request_at]); order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 8 -> assert(order_mass_action_request_read.sending_time_epoch[order_mass_action_request_at] == order_mass_action_request_written.sending_time_epoch[order_mass_action_request_at]); order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 6 -> assert(order_mass_action_request_read.security_group[order_mass_action_request_at] == order_mass_action_request_written.security_group[order_mass_action_request_at]); order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 5 -> assert(order_mass_action_request_read.location[order_mass_action_request_at] == order_mass_action_request_written.location[order_mass_action_request_at]); order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  order_mass_action_request_at = 0;
  do
  :: order_mass_action_request_at < 4 -> assert(order_mass_action_request_read.security_id_optional[order_mass_action_request_at] == order_mass_action_request_written.security_id_optional[order_mass_action_request_at]); order_mass_action_request_at = order_mass_action_request_at + 1
  :: else -> break
  od;
  assert(order_mass_action_request_read.mass_action_scope == order_mass_action_request_written.mass_action_scope);
  assert(order_mass_action_request_read.market_segment_id == order_mass_action_request_written.market_segment_id);
  assert(order_mass_action_request_read.mass_cancel_request_type == order_mass_action_request_written.mass_cancel_request_type);
  assert(order_mass_action_request_read.side_optional == order_mass_action_request_written.side_optional);
  assert(order_mass_action_request_read.mass_action_ord_typ == order_mass_action_request_written.mass_action_ord_typ);
  assert(order_mass_action_request_read.mass_cancel_tif == order_mass_action_request_written.mass_cancel_tif);
  assert(order_mass_action_request_read.liquidity_flag == order_mass_action_request_written.liquidity_flag);
  skip
}

/* ---- Order Mass Status Request: 68 bytes ------------------------------------- */

/* The Order Mass Status Request message requests the status for orders matching criteria specified within the request. */
typedef OrderMassStatusRequest {
  byte party_details_list_req_id[8];
  byte mass_status_req_id[8];
  byte manual_order_indicator;
  byte seq_num[4];
  byte sender_id[20];
  byte sending_time_epoch[8];
  byte security_group[6];
  byte location[5];
  byte security_id_optional[4];
  byte mass_status_req_type;
  byte ord_status_req_type;
  byte mass_status_tif;
  byte market_segment_id
};

int order_mass_status_request_at;

/* every byte of Order Mass Status Request set to one value */
inline fill_order_mass_status_request(order_mass_status_request_record, order_mass_status_request_value) {
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 8 -> order_mass_status_request_record.party_details_list_req_id[order_mass_status_request_at] = order_mass_status_request_value; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 8 -> order_mass_status_request_record.mass_status_req_id[order_mass_status_request_at] = order_mass_status_request_value; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_record.manual_order_indicator = order_mass_status_request_value;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 4 -> order_mass_status_request_record.seq_num[order_mass_status_request_at] = order_mass_status_request_value; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 20 -> order_mass_status_request_record.sender_id[order_mass_status_request_at] = order_mass_status_request_value; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 8 -> order_mass_status_request_record.sending_time_epoch[order_mass_status_request_at] = order_mass_status_request_value; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 6 -> order_mass_status_request_record.security_group[order_mass_status_request_at] = order_mass_status_request_value; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 5 -> order_mass_status_request_record.location[order_mass_status_request_at] = order_mass_status_request_value; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 4 -> order_mass_status_request_record.security_id_optional[order_mass_status_request_at] = order_mass_status_request_value; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_record.mass_status_req_type = order_mass_status_request_value;
  order_mass_status_request_record.ord_status_req_type = order_mass_status_request_value;
  order_mass_status_request_record.mass_status_tif = order_mass_status_request_value;
  order_mass_status_request_record.market_segment_id = order_mass_status_request_value;
  skip
}

/* each byte of Order Mass Status Request set to where it lies, so a field read out of place says so */
inline ramp_order_mass_status_request(order_mass_status_request_record, order_mass_status_request_base) {
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 8 -> order_mass_status_request_record.party_details_list_req_id[order_mass_status_request_at] = (order_mass_status_request_base + 0 + order_mass_status_request_at + 1) % 256; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 8 -> order_mass_status_request_record.mass_status_req_id[order_mass_status_request_at] = (order_mass_status_request_base + 8 + order_mass_status_request_at + 1) % 256; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_record.manual_order_indicator = (order_mass_status_request_base + 16 + 1) % 256;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 4 -> order_mass_status_request_record.seq_num[order_mass_status_request_at] = (order_mass_status_request_base + 17 + order_mass_status_request_at + 1) % 256; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 20 -> order_mass_status_request_record.sender_id[order_mass_status_request_at] = (order_mass_status_request_base + 21 + order_mass_status_request_at + 1) % 256; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 8 -> order_mass_status_request_record.sending_time_epoch[order_mass_status_request_at] = (order_mass_status_request_base + 41 + order_mass_status_request_at + 1) % 256; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 6 -> order_mass_status_request_record.security_group[order_mass_status_request_at] = (order_mass_status_request_base + 49 + order_mass_status_request_at + 1) % 256; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 5 -> order_mass_status_request_record.location[order_mass_status_request_at] = (order_mass_status_request_base + 55 + order_mass_status_request_at + 1) % 256; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 4 -> order_mass_status_request_record.security_id_optional[order_mass_status_request_at] = (order_mass_status_request_base + 60 + order_mass_status_request_at + 1) % 256; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_record.mass_status_req_type = (order_mass_status_request_base + 64 + 1) % 256;
  order_mass_status_request_record.ord_status_req_type = (order_mass_status_request_base + 65 + 1) % 256;
  order_mass_status_request_record.mass_status_tif = (order_mass_status_request_base + 66 + 1) % 256;
  order_mass_status_request_record.market_segment_id = (order_mass_status_request_base + 67 + 1) % 256;
  skip
}

/* Order Mass Status Request to the wire, 68 bytes from where the cursor stands */
inline encode_order_mass_status_request(order_mass_status_request_record) {
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 8 -> wire[at] = order_mass_status_request_record.party_details_list_req_id[order_mass_status_request_at]; at = at + 1; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 8 -> wire[at] = order_mass_status_request_record.mass_status_req_id[order_mass_status_request_at]; at = at + 1; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  wire[at] = order_mass_status_request_record.manual_order_indicator; at = at + 1;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 4 -> wire[at] = order_mass_status_request_record.seq_num[order_mass_status_request_at]; at = at + 1; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 20 -> wire[at] = order_mass_status_request_record.sender_id[order_mass_status_request_at]; at = at + 1; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 8 -> wire[at] = order_mass_status_request_record.sending_time_epoch[order_mass_status_request_at]; at = at + 1; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 6 -> wire[at] = order_mass_status_request_record.security_group[order_mass_status_request_at]; at = at + 1; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 5 -> wire[at] = order_mass_status_request_record.location[order_mass_status_request_at]; at = at + 1; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 4 -> wire[at] = order_mass_status_request_record.security_id_optional[order_mass_status_request_at]; at = at + 1; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  wire[at] = order_mass_status_request_record.mass_status_req_type; at = at + 1;
  wire[at] = order_mass_status_request_record.ord_status_req_type; at = at + 1;
  wire[at] = order_mass_status_request_record.mass_status_tif; at = at + 1;
  wire[at] = order_mass_status_request_record.market_segment_id; at = at + 1;
  skip
}

/* Order Mass Status Request off the wire, 68 bytes from where the cursor stands */
inline decode_order_mass_status_request(order_mass_status_request_record) {
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 8 -> order_mass_status_request_record.party_details_list_req_id[order_mass_status_request_at] = wire[at]; at = at + 1; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 8 -> order_mass_status_request_record.mass_status_req_id[order_mass_status_request_at] = wire[at]; at = at + 1; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_record.manual_order_indicator = wire[at]; at = at + 1;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 4 -> order_mass_status_request_record.seq_num[order_mass_status_request_at] = wire[at]; at = at + 1; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 20 -> order_mass_status_request_record.sender_id[order_mass_status_request_at] = wire[at]; at = at + 1; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 8 -> order_mass_status_request_record.sending_time_epoch[order_mass_status_request_at] = wire[at]; at = at + 1; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 6 -> order_mass_status_request_record.security_group[order_mass_status_request_at] = wire[at]; at = at + 1; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 5 -> order_mass_status_request_record.location[order_mass_status_request_at] = wire[at]; at = at + 1; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 4 -> order_mass_status_request_record.security_id_optional[order_mass_status_request_at] = wire[at]; at = at + 1; order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_record.mass_status_req_type = wire[at]; at = at + 1;
  order_mass_status_request_record.ord_status_req_type = wire[at]; at = at + 1;
  order_mass_status_request_record.mass_status_tif = wire[at]; at = at + 1;
  order_mass_status_request_record.market_segment_id = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Mass Status Request is what was written, byte for byte */
inline equal_order_mass_status_request(order_mass_status_request_read, order_mass_status_request_written) {
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 8 -> assert(order_mass_status_request_read.party_details_list_req_id[order_mass_status_request_at] == order_mass_status_request_written.party_details_list_req_id[order_mass_status_request_at]); order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 8 -> assert(order_mass_status_request_read.mass_status_req_id[order_mass_status_request_at] == order_mass_status_request_written.mass_status_req_id[order_mass_status_request_at]); order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  assert(order_mass_status_request_read.manual_order_indicator == order_mass_status_request_written.manual_order_indicator);
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 4 -> assert(order_mass_status_request_read.seq_num[order_mass_status_request_at] == order_mass_status_request_written.seq_num[order_mass_status_request_at]); order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 20 -> assert(order_mass_status_request_read.sender_id[order_mass_status_request_at] == order_mass_status_request_written.sender_id[order_mass_status_request_at]); order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 8 -> assert(order_mass_status_request_read.sending_time_epoch[order_mass_status_request_at] == order_mass_status_request_written.sending_time_epoch[order_mass_status_request_at]); order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 6 -> assert(order_mass_status_request_read.security_group[order_mass_status_request_at] == order_mass_status_request_written.security_group[order_mass_status_request_at]); order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 5 -> assert(order_mass_status_request_read.location[order_mass_status_request_at] == order_mass_status_request_written.location[order_mass_status_request_at]); order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  order_mass_status_request_at = 0;
  do
  :: order_mass_status_request_at < 4 -> assert(order_mass_status_request_read.security_id_optional[order_mass_status_request_at] == order_mass_status_request_written.security_id_optional[order_mass_status_request_at]); order_mass_status_request_at = order_mass_status_request_at + 1
  :: else -> break
  od;
  assert(order_mass_status_request_read.mass_status_req_type == order_mass_status_request_written.mass_status_req_type);
  assert(order_mass_status_request_read.ord_status_req_type == order_mass_status_request_written.ord_status_req_type);
  assert(order_mass_status_request_read.mass_status_tif == order_mass_status_request_written.mass_status_tif);
  assert(order_mass_status_request_read.market_segment_id == order_mass_status_request_written.market_segment_id);
  skip
}

/* ---- Order Status Request: 62 bytes ------------------------------------------ */

/* Submitted by the client system to obtain the current status of a specific order; CME Globex returns the order status in the form of an Execution Report (MsgType=8) with the status listed in tag 39-OrdStatus. */
typedef OrderStatusRequest {
  byte party_details_list_req_id[8];
  byte ord_status_req_id[8];
  byte manual_order_indicator;
  byte seq_num[4];
  byte sender_id[20];
  byte order_id[8];
  byte sending_time_epoch[8];
  byte location[5]
};

int order_status_request_at;

/* every byte of Order Status Request set to one value */
inline fill_order_status_request(order_status_request_record, order_status_request_value) {
  order_status_request_at = 0;
  do
  :: order_status_request_at < 8 -> order_status_request_record.party_details_list_req_id[order_status_request_at] = order_status_request_value; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 8 -> order_status_request_record.ord_status_req_id[order_status_request_at] = order_status_request_value; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_record.manual_order_indicator = order_status_request_value;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 4 -> order_status_request_record.seq_num[order_status_request_at] = order_status_request_value; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 20 -> order_status_request_record.sender_id[order_status_request_at] = order_status_request_value; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 8 -> order_status_request_record.order_id[order_status_request_at] = order_status_request_value; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 8 -> order_status_request_record.sending_time_epoch[order_status_request_at] = order_status_request_value; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 5 -> order_status_request_record.location[order_status_request_at] = order_status_request_value; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Status Request set to where it lies, so a field read out of place says so */
inline ramp_order_status_request(order_status_request_record, order_status_request_base) {
  order_status_request_at = 0;
  do
  :: order_status_request_at < 8 -> order_status_request_record.party_details_list_req_id[order_status_request_at] = (order_status_request_base + 0 + order_status_request_at + 1) % 256; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 8 -> order_status_request_record.ord_status_req_id[order_status_request_at] = (order_status_request_base + 8 + order_status_request_at + 1) % 256; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_record.manual_order_indicator = (order_status_request_base + 16 + 1) % 256;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 4 -> order_status_request_record.seq_num[order_status_request_at] = (order_status_request_base + 17 + order_status_request_at + 1) % 256; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 20 -> order_status_request_record.sender_id[order_status_request_at] = (order_status_request_base + 21 + order_status_request_at + 1) % 256; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 8 -> order_status_request_record.order_id[order_status_request_at] = (order_status_request_base + 41 + order_status_request_at + 1) % 256; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 8 -> order_status_request_record.sending_time_epoch[order_status_request_at] = (order_status_request_base + 49 + order_status_request_at + 1) % 256; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 5 -> order_status_request_record.location[order_status_request_at] = (order_status_request_base + 57 + order_status_request_at + 1) % 256; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  skip
}

/* Order Status Request to the wire, 62 bytes from where the cursor stands */
inline encode_order_status_request(order_status_request_record) {
  order_status_request_at = 0;
  do
  :: order_status_request_at < 8 -> wire[at] = order_status_request_record.party_details_list_req_id[order_status_request_at]; at = at + 1; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 8 -> wire[at] = order_status_request_record.ord_status_req_id[order_status_request_at]; at = at + 1; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  wire[at] = order_status_request_record.manual_order_indicator; at = at + 1;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 4 -> wire[at] = order_status_request_record.seq_num[order_status_request_at]; at = at + 1; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 20 -> wire[at] = order_status_request_record.sender_id[order_status_request_at]; at = at + 1; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 8 -> wire[at] = order_status_request_record.order_id[order_status_request_at]; at = at + 1; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 8 -> wire[at] = order_status_request_record.sending_time_epoch[order_status_request_at]; at = at + 1; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 5 -> wire[at] = order_status_request_record.location[order_status_request_at]; at = at + 1; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  skip
}

/* Order Status Request off the wire, 62 bytes from where the cursor stands */
inline decode_order_status_request(order_status_request_record) {
  order_status_request_at = 0;
  do
  :: order_status_request_at < 8 -> order_status_request_record.party_details_list_req_id[order_status_request_at] = wire[at]; at = at + 1; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 8 -> order_status_request_record.ord_status_req_id[order_status_request_at] = wire[at]; at = at + 1; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_record.manual_order_indicator = wire[at]; at = at + 1;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 4 -> order_status_request_record.seq_num[order_status_request_at] = wire[at]; at = at + 1; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 20 -> order_status_request_record.sender_id[order_status_request_at] = wire[at]; at = at + 1; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 8 -> order_status_request_record.order_id[order_status_request_at] = wire[at]; at = at + 1; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 8 -> order_status_request_record.sending_time_epoch[order_status_request_at] = wire[at]; at = at + 1; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 5 -> order_status_request_record.location[order_status_request_at] = wire[at]; at = at + 1; order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Status Request is what was written, byte for byte */
inline equal_order_status_request(order_status_request_read, order_status_request_written) {
  order_status_request_at = 0;
  do
  :: order_status_request_at < 8 -> assert(order_status_request_read.party_details_list_req_id[order_status_request_at] == order_status_request_written.party_details_list_req_id[order_status_request_at]); order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 8 -> assert(order_status_request_read.ord_status_req_id[order_status_request_at] == order_status_request_written.ord_status_req_id[order_status_request_at]); order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  assert(order_status_request_read.manual_order_indicator == order_status_request_written.manual_order_indicator);
  order_status_request_at = 0;
  do
  :: order_status_request_at < 4 -> assert(order_status_request_read.seq_num[order_status_request_at] == order_status_request_written.seq_num[order_status_request_at]); order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 20 -> assert(order_status_request_read.sender_id[order_status_request_at] == order_status_request_written.sender_id[order_status_request_at]); order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 8 -> assert(order_status_request_read.order_id[order_status_request_at] == order_status_request_written.order_id[order_status_request_at]); order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 8 -> assert(order_status_request_read.sending_time_epoch[order_status_request_at] == order_status_request_written.sending_time_epoch[order_status_request_at]); order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  order_status_request_at = 0;
  do
  :: order_status_request_at < 5 -> assert(order_status_request_read.location[order_status_request_at] == order_status_request_written.location[order_status_request_at]); order_status_request_at = order_status_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Execution Ack: 101 bytes ------------------------------------------------ */

/* The Execution Acknowledgment message notifies CME that a given fill has either been accepted or rejected by a counterparty for EU bilateral trades. */
typedef ExecutionAck {
  byte party_details_list_req_id[8];
  byte order_id[8];
  byte exec_ack_status;
  byte seq_num[4];
  byte cl_ord_id[20];
  byte sec_exec_id[8];
  byte last_px[8];
  byte security_id[4];
  byte last_qty[4];
  byte dk_reason;
  byte side;
  byte sender_id[20];
  byte sending_time_epoch[8];
  byte location[5];
  byte manual_order_indicator
};

int execution_ack_at;

/* every byte of Execution Ack set to one value */
inline fill_execution_ack(execution_ack_record, execution_ack_value) {
  execution_ack_at = 0;
  do
  :: execution_ack_at < 8 -> execution_ack_record.party_details_list_req_id[execution_ack_at] = execution_ack_value; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 8 -> execution_ack_record.order_id[execution_ack_at] = execution_ack_value; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_record.exec_ack_status = execution_ack_value;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 4 -> execution_ack_record.seq_num[execution_ack_at] = execution_ack_value; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 20 -> execution_ack_record.cl_ord_id[execution_ack_at] = execution_ack_value; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 8 -> execution_ack_record.sec_exec_id[execution_ack_at] = execution_ack_value; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 8 -> execution_ack_record.last_px[execution_ack_at] = execution_ack_value; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 4 -> execution_ack_record.security_id[execution_ack_at] = execution_ack_value; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 4 -> execution_ack_record.last_qty[execution_ack_at] = execution_ack_value; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_record.dk_reason = execution_ack_value;
  execution_ack_record.side = execution_ack_value;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 20 -> execution_ack_record.sender_id[execution_ack_at] = execution_ack_value; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 8 -> execution_ack_record.sending_time_epoch[execution_ack_at] = execution_ack_value; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 5 -> execution_ack_record.location[execution_ack_at] = execution_ack_value; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_record.manual_order_indicator = execution_ack_value;
  skip
}

/* each byte of Execution Ack set to where it lies, so a field read out of place says so */
inline ramp_execution_ack(execution_ack_record, execution_ack_base) {
  execution_ack_at = 0;
  do
  :: execution_ack_at < 8 -> execution_ack_record.party_details_list_req_id[execution_ack_at] = (execution_ack_base + 0 + execution_ack_at + 1) % 256; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 8 -> execution_ack_record.order_id[execution_ack_at] = (execution_ack_base + 8 + execution_ack_at + 1) % 256; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_record.exec_ack_status = (execution_ack_base + 16 + 1) % 256;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 4 -> execution_ack_record.seq_num[execution_ack_at] = (execution_ack_base + 17 + execution_ack_at + 1) % 256; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 20 -> execution_ack_record.cl_ord_id[execution_ack_at] = (execution_ack_base + 21 + execution_ack_at + 1) % 256; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 8 -> execution_ack_record.sec_exec_id[execution_ack_at] = (execution_ack_base + 41 + execution_ack_at + 1) % 256; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 8 -> execution_ack_record.last_px[execution_ack_at] = (execution_ack_base + 49 + execution_ack_at + 1) % 256; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 4 -> execution_ack_record.security_id[execution_ack_at] = (execution_ack_base + 57 + execution_ack_at + 1) % 256; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 4 -> execution_ack_record.last_qty[execution_ack_at] = (execution_ack_base + 61 + execution_ack_at + 1) % 256; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_record.dk_reason = (execution_ack_base + 65 + 1) % 256;
  execution_ack_record.side = (execution_ack_base + 66 + 1) % 256;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 20 -> execution_ack_record.sender_id[execution_ack_at] = (execution_ack_base + 67 + execution_ack_at + 1) % 256; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 8 -> execution_ack_record.sending_time_epoch[execution_ack_at] = (execution_ack_base + 87 + execution_ack_at + 1) % 256; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 5 -> execution_ack_record.location[execution_ack_at] = (execution_ack_base + 95 + execution_ack_at + 1) % 256; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_record.manual_order_indicator = (execution_ack_base + 100 + 1) % 256;
  skip
}

/* Execution Ack to the wire, 101 bytes from where the cursor stands */
inline encode_execution_ack(execution_ack_record) {
  execution_ack_at = 0;
  do
  :: execution_ack_at < 8 -> wire[at] = execution_ack_record.party_details_list_req_id[execution_ack_at]; at = at + 1; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 8 -> wire[at] = execution_ack_record.order_id[execution_ack_at]; at = at + 1; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  wire[at] = execution_ack_record.exec_ack_status; at = at + 1;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 4 -> wire[at] = execution_ack_record.seq_num[execution_ack_at]; at = at + 1; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 20 -> wire[at] = execution_ack_record.cl_ord_id[execution_ack_at]; at = at + 1; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 8 -> wire[at] = execution_ack_record.sec_exec_id[execution_ack_at]; at = at + 1; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 8 -> wire[at] = execution_ack_record.last_px[execution_ack_at]; at = at + 1; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 4 -> wire[at] = execution_ack_record.security_id[execution_ack_at]; at = at + 1; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 4 -> wire[at] = execution_ack_record.last_qty[execution_ack_at]; at = at + 1; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  wire[at] = execution_ack_record.dk_reason; at = at + 1;
  wire[at] = execution_ack_record.side; at = at + 1;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 20 -> wire[at] = execution_ack_record.sender_id[execution_ack_at]; at = at + 1; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 8 -> wire[at] = execution_ack_record.sending_time_epoch[execution_ack_at]; at = at + 1; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 5 -> wire[at] = execution_ack_record.location[execution_ack_at]; at = at + 1; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  wire[at] = execution_ack_record.manual_order_indicator; at = at + 1;
  skip
}

/* Execution Ack off the wire, 101 bytes from where the cursor stands */
inline decode_execution_ack(execution_ack_record) {
  execution_ack_at = 0;
  do
  :: execution_ack_at < 8 -> execution_ack_record.party_details_list_req_id[execution_ack_at] = wire[at]; at = at + 1; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 8 -> execution_ack_record.order_id[execution_ack_at] = wire[at]; at = at + 1; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_record.exec_ack_status = wire[at]; at = at + 1;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 4 -> execution_ack_record.seq_num[execution_ack_at] = wire[at]; at = at + 1; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 20 -> execution_ack_record.cl_ord_id[execution_ack_at] = wire[at]; at = at + 1; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 8 -> execution_ack_record.sec_exec_id[execution_ack_at] = wire[at]; at = at + 1; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 8 -> execution_ack_record.last_px[execution_ack_at] = wire[at]; at = at + 1; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 4 -> execution_ack_record.security_id[execution_ack_at] = wire[at]; at = at + 1; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 4 -> execution_ack_record.last_qty[execution_ack_at] = wire[at]; at = at + 1; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_record.dk_reason = wire[at]; at = at + 1;
  execution_ack_record.side = wire[at]; at = at + 1;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 20 -> execution_ack_record.sender_id[execution_ack_at] = wire[at]; at = at + 1; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 8 -> execution_ack_record.sending_time_epoch[execution_ack_at] = wire[at]; at = at + 1; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 5 -> execution_ack_record.location[execution_ack_at] = wire[at]; at = at + 1; execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_record.manual_order_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Execution Ack is what was written, byte for byte */
inline equal_execution_ack(execution_ack_read, execution_ack_written) {
  execution_ack_at = 0;
  do
  :: execution_ack_at < 8 -> assert(execution_ack_read.party_details_list_req_id[execution_ack_at] == execution_ack_written.party_details_list_req_id[execution_ack_at]); execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 8 -> assert(execution_ack_read.order_id[execution_ack_at] == execution_ack_written.order_id[execution_ack_at]); execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  assert(execution_ack_read.exec_ack_status == execution_ack_written.exec_ack_status);
  execution_ack_at = 0;
  do
  :: execution_ack_at < 4 -> assert(execution_ack_read.seq_num[execution_ack_at] == execution_ack_written.seq_num[execution_ack_at]); execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 20 -> assert(execution_ack_read.cl_ord_id[execution_ack_at] == execution_ack_written.cl_ord_id[execution_ack_at]); execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 8 -> assert(execution_ack_read.sec_exec_id[execution_ack_at] == execution_ack_written.sec_exec_id[execution_ack_at]); execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 8 -> assert(execution_ack_read.last_px[execution_ack_at] == execution_ack_written.last_px[execution_ack_at]); execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 4 -> assert(execution_ack_read.security_id[execution_ack_at] == execution_ack_written.security_id[execution_ack_at]); execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 4 -> assert(execution_ack_read.last_qty[execution_ack_at] == execution_ack_written.last_qty[execution_ack_at]); execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  assert(execution_ack_read.dk_reason == execution_ack_written.dk_reason);
  assert(execution_ack_read.side == execution_ack_written.side);
  execution_ack_at = 0;
  do
  :: execution_ack_at < 20 -> assert(execution_ack_read.sender_id[execution_ack_at] == execution_ack_written.sender_id[execution_ack_at]); execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 8 -> assert(execution_ack_read.sending_time_epoch[execution_ack_at] == execution_ack_written.sending_time_epoch[execution_ack_at]); execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  execution_ack_at = 0;
  do
  :: execution_ack_at < 5 -> assert(execution_ack_read.location[execution_ack_at] == execution_ack_written.location[execution_ack_at]); execution_ack_at = execution_ack_at + 1
  :: else -> break
  od;
  assert(execution_ack_read.manual_order_indicator == execution_ack_written.manual_order_indicator);
  skip
}

/* ---- Leg Option Delta: 5 bytes ----------------------------------------------- */

/* Up to 26 legs (i.e., repeating groups) supported for UDS for options. Up to 40 legs (i.e., repeating groups) supported for UDS for futures. Will be set to 0 for REPO */
typedef LegOptionDelta {
  byte mantissa_32[4];
  byte exponent
};

int leg_option_delta_at;

/* every byte of Leg Option Delta set to one value */
inline fill_leg_option_delta(leg_option_delta_record, leg_option_delta_value) {
  leg_option_delta_at = 0;
  do
  :: leg_option_delta_at < 4 -> leg_option_delta_record.mantissa_32[leg_option_delta_at] = leg_option_delta_value; leg_option_delta_at = leg_option_delta_at + 1
  :: else -> break
  od;
  leg_option_delta_record.exponent = leg_option_delta_value;
  skip
}

/* each byte of Leg Option Delta set to where it lies, so a field read out of place says so */
inline ramp_leg_option_delta(leg_option_delta_record, leg_option_delta_base) {
  leg_option_delta_at = 0;
  do
  :: leg_option_delta_at < 4 -> leg_option_delta_record.mantissa_32[leg_option_delta_at] = (leg_option_delta_base + 0 + leg_option_delta_at + 1) % 256; leg_option_delta_at = leg_option_delta_at + 1
  :: else -> break
  od;
  leg_option_delta_record.exponent = (leg_option_delta_base + 4 + 1) % 256;
  skip
}

/* Leg Option Delta to the wire, 5 bytes from where the cursor stands */
inline encode_leg_option_delta(leg_option_delta_record) {
  leg_option_delta_at = 0;
  do
  :: leg_option_delta_at < 4 -> wire[at] = leg_option_delta_record.mantissa_32[leg_option_delta_at]; at = at + 1; leg_option_delta_at = leg_option_delta_at + 1
  :: else -> break
  od;
  wire[at] = leg_option_delta_record.exponent; at = at + 1;
  skip
}

/* Leg Option Delta off the wire, 5 bytes from where the cursor stands */
inline decode_leg_option_delta(leg_option_delta_record) {
  leg_option_delta_at = 0;
  do
  :: leg_option_delta_at < 4 -> leg_option_delta_record.mantissa_32[leg_option_delta_at] = wire[at]; at = at + 1; leg_option_delta_at = leg_option_delta_at + 1
  :: else -> break
  od;
  leg_option_delta_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Leg Option Delta is what was written, byte for byte */
inline equal_leg_option_delta(leg_option_delta_read, leg_option_delta_written) {
  leg_option_delta_at = 0;
  do
  :: leg_option_delta_at < 4 -> assert(leg_option_delta_read.mantissa_32[leg_option_delta_at] == leg_option_delta_written.mantissa_32[leg_option_delta_at]); leg_option_delta_at = leg_option_delta_at + 1
  :: else -> break
  od;
  assert(leg_option_delta_read.exponent == leg_option_delta_written.exponent);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Simple Open Framing Header: encoded, read back, and compared */
proctype check_simple_open_framing_header() {
  SimpleOpenFramingHeader simple_open_framing_header_sent;
  SimpleOpenFramingHeader simple_open_framing_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_open_framing_header(simple_open_framing_header_sent, 0)
  :: pattern == 1 -> fill_simple_open_framing_header(simple_open_framing_header_sent, 32)
  :: pattern == 2 -> fill_simple_open_framing_header(simple_open_framing_header_sent, 255)
  :: else -> ramp_simple_open_framing_header(simple_open_framing_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_open_framing_header(simple_open_framing_header_sent);
    assert(at == 4);
    at = 0;
    decode_simple_open_framing_header(simple_open_framing_header_got);
    assert(at == 4);
    equal_simple_open_framing_header(simple_open_framing_header_got, simple_open_framing_header_sent)
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
    assert(at == 8);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 8);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Sequence: encoded, read back, and compared */
proctype check_sequence() {
  Sequence sequence_sent;
  Sequence sequence_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequence(sequence_sent, 0)
  :: pattern == 1 -> fill_sequence(sequence_sent, 32)
  :: pattern == 2 -> fill_sequence(sequence_sent, 255)
  :: else -> ramp_sequence(sequence_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequence(sequence_sent);
    assert(at == 14);
    at = 0;
    decode_sequence(sequence_got);
    assert(at == 14);
    equal_sequence(sequence_got, sequence_sent)
  }
}

/* Terminate: encoded, read back, and compared */
proctype check_terminate() {
  Terminate terminate_sent;
  Terminate terminate_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_terminate(terminate_sent, 0)
  :: pattern == 1 -> fill_terminate(terminate_sent, 32)
  :: pattern == 2 -> fill_terminate(terminate_sent, 255)
  :: else -> ramp_terminate(terminate_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_terminate(terminate_sent);
    assert(at == 67);
    at = 0;
    decode_terminate(terminate_got);
    assert(at == 67);
    equal_terminate(terminate_got, terminate_sent)
  }
}

/* Retransmit Request: encoded, read back, and compared */
proctype check_retransmit_request() {
  RetransmitRequest retransmit_request_sent;
  RetransmitRequest retransmit_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmit_request(retransmit_request_sent, 0)
  :: pattern == 1 -> fill_retransmit_request(retransmit_request_sent, 32)
  :: pattern == 2 -> fill_retransmit_request(retransmit_request_sent, 255)
  :: else -> ramp_retransmit_request(retransmit_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmit_request(retransmit_request_sent);
    assert(at == 30);
    at = 0;
    decode_retransmit_request(retransmit_request_got);
    assert(at == 30);
    equal_retransmit_request(retransmit_request_got, retransmit_request_sent)
  }
}

/* Order Cancel Request: encoded, read back, and compared */
proctype check_order_cancel_request() {
  OrderCancelRequest order_cancel_request_sent;
  OrderCancelRequest order_cancel_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancel_request(order_cancel_request_sent, 0)
  :: pattern == 1 -> fill_order_cancel_request(order_cancel_request_sent, 32)
  :: pattern == 2 -> fill_order_cancel_request(order_cancel_request_sent, 255)
  :: else -> ramp_order_cancel_request(order_cancel_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancel_request(order_cancel_request_sent);
    assert(at == 88);
    at = 0;
    decode_order_cancel_request(order_cancel_request_got);
    assert(at == 88);
    equal_order_cancel_request(order_cancel_request_got, order_cancel_request_sent)
  }
}

/* Group Size: encoded, read back, and compared */
proctype check_group_size() {
  GroupSize group_size_sent;
  GroupSize group_size_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_group_size(group_size_sent, 0)
  :: pattern == 1 -> fill_group_size(group_size_sent, 32)
  :: pattern == 2 -> fill_group_size(group_size_sent, 255)
  :: else -> ramp_group_size(group_size_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_group_size(group_size_sent);
    assert(at == 3);
    at = 0;
    decode_group_size(group_size_got);
    assert(at == 3);
    equal_group_size(group_size_got, group_size_sent)
  }
}

/* Order Mass Action Request: encoded, read back, and compared */
proctype check_order_mass_action_request() {
  OrderMassActionRequest order_mass_action_request_sent;
  OrderMassActionRequest order_mass_action_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_mass_action_request(order_mass_action_request_sent, 0)
  :: pattern == 1 -> fill_order_mass_action_request(order_mass_action_request_sent, 32)
  :: pattern == 2 -> fill_order_mass_action_request(order_mass_action_request_sent, 255)
  :: else -> ramp_order_mass_action_request(order_mass_action_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_mass_action_request(order_mass_action_request_sent);
    assert(at == 71);
    at = 0;
    decode_order_mass_action_request(order_mass_action_request_got);
    assert(at == 71);
    equal_order_mass_action_request(order_mass_action_request_got, order_mass_action_request_sent)
  }
}

/* Order Mass Status Request: encoded, read back, and compared */
proctype check_order_mass_status_request() {
  OrderMassStatusRequest order_mass_status_request_sent;
  OrderMassStatusRequest order_mass_status_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_mass_status_request(order_mass_status_request_sent, 0)
  :: pattern == 1 -> fill_order_mass_status_request(order_mass_status_request_sent, 32)
  :: pattern == 2 -> fill_order_mass_status_request(order_mass_status_request_sent, 255)
  :: else -> ramp_order_mass_status_request(order_mass_status_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_mass_status_request(order_mass_status_request_sent);
    assert(at == 68);
    at = 0;
    decode_order_mass_status_request(order_mass_status_request_got);
    assert(at == 68);
    equal_order_mass_status_request(order_mass_status_request_got, order_mass_status_request_sent)
  }
}

/* Order Status Request: encoded, read back, and compared */
proctype check_order_status_request() {
  OrderStatusRequest order_status_request_sent;
  OrderStatusRequest order_status_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_status_request(order_status_request_sent, 0)
  :: pattern == 1 -> fill_order_status_request(order_status_request_sent, 32)
  :: pattern == 2 -> fill_order_status_request(order_status_request_sent, 255)
  :: else -> ramp_order_status_request(order_status_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_status_request(order_status_request_sent);
    assert(at == 62);
    at = 0;
    decode_order_status_request(order_status_request_got);
    assert(at == 62);
    equal_order_status_request(order_status_request_got, order_status_request_sent)
  }
}

/* Execution Ack: encoded, read back, and compared */
proctype check_execution_ack() {
  ExecutionAck execution_ack_sent;
  ExecutionAck execution_ack_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_ack(execution_ack_sent, 0)
  :: pattern == 1 -> fill_execution_ack(execution_ack_sent, 32)
  :: pattern == 2 -> fill_execution_ack(execution_ack_sent, 255)
  :: else -> ramp_execution_ack(execution_ack_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_ack(execution_ack_sent);
    assert(at == 101);
    at = 0;
    decode_execution_ack(execution_ack_got);
    assert(at == 101);
    equal_execution_ack(execution_ack_got, execution_ack_sent)
  }
}

/* Leg Option Delta: encoded, read back, and compared */
proctype check_leg_option_delta() {
  LegOptionDelta leg_option_delta_sent;
  LegOptionDelta leg_option_delta_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_leg_option_delta(leg_option_delta_sent, 0)
  :: pattern == 1 -> fill_leg_option_delta(leg_option_delta_sent, 32)
  :: pattern == 2 -> fill_leg_option_delta(leg_option_delta_sent, 255)
  :: else -> ramp_leg_option_delta(leg_option_delta_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_leg_option_delta(leg_option_delta_sent);
    assert(at == 5);
    at = 0;
    decode_leg_option_delta(leg_option_delta_got);
    assert(at == 5);
    equal_leg_option_delta(leg_option_delta_got, leg_option_delta_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_simple_open_framing_header()
  :: run check_message_header()
  :: run check_sequence()
  :: run check_terminate()
  :: run check_retransmit_request()
  :: run check_order_cancel_request()
  :: run check_group_size()
  :: run check_order_mass_action_request()
  :: run check_order_mass_status_request()
  :: run check_order_status_request()
  :: run check_execution_ack()
  :: run check_leg_option_delta()
  fi
}
