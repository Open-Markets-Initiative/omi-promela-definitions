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
 *   - a block whose stated length holds more than its fields
 *   - a run counted by a field
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 401

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

/* ---- Negotiation Reject: 68 bytes -------------------------------------------- */

/* The Negotiation Reject message is sent when CME rejects a Negotiate message sent by the customer. */
typedef NegotiationReject {
  byte reason[48];
  byte uuid[8];
  byte request_timestamp[8];
  byte error_codes[2];
  byte fault_tolerance_indicator;
  byte split_msg
};

int negotiation_reject_at;

/* every byte of Negotiation Reject set to one value */
inline fill_negotiation_reject(negotiation_reject_record, negotiation_reject_value) {
  negotiation_reject_at = 0;
  do
  :: negotiation_reject_at < 48 -> negotiation_reject_record.reason[negotiation_reject_at] = negotiation_reject_value; negotiation_reject_at = negotiation_reject_at + 1
  :: else -> break
  od;
  negotiation_reject_at = 0;
  do
  :: negotiation_reject_at < 8 -> negotiation_reject_record.uuid[negotiation_reject_at] = negotiation_reject_value; negotiation_reject_at = negotiation_reject_at + 1
  :: else -> break
  od;
  negotiation_reject_at = 0;
  do
  :: negotiation_reject_at < 8 -> negotiation_reject_record.request_timestamp[negotiation_reject_at] = negotiation_reject_value; negotiation_reject_at = negotiation_reject_at + 1
  :: else -> break
  od;
  negotiation_reject_at = 0;
  do
  :: negotiation_reject_at < 2 -> negotiation_reject_record.error_codes[negotiation_reject_at] = negotiation_reject_value; negotiation_reject_at = negotiation_reject_at + 1
  :: else -> break
  od;
  negotiation_reject_record.fault_tolerance_indicator = negotiation_reject_value;
  negotiation_reject_record.split_msg = negotiation_reject_value;
  skip
}

/* each byte of Negotiation Reject set to where it lies, so a field read out of place says so */
inline ramp_negotiation_reject(negotiation_reject_record, negotiation_reject_base) {
  negotiation_reject_at = 0;
  do
  :: negotiation_reject_at < 48 -> negotiation_reject_record.reason[negotiation_reject_at] = (negotiation_reject_base + 0 + negotiation_reject_at + 1) % 256; negotiation_reject_at = negotiation_reject_at + 1
  :: else -> break
  od;
  negotiation_reject_at = 0;
  do
  :: negotiation_reject_at < 8 -> negotiation_reject_record.uuid[negotiation_reject_at] = (negotiation_reject_base + 48 + negotiation_reject_at + 1) % 256; negotiation_reject_at = negotiation_reject_at + 1
  :: else -> break
  od;
  negotiation_reject_at = 0;
  do
  :: negotiation_reject_at < 8 -> negotiation_reject_record.request_timestamp[negotiation_reject_at] = (negotiation_reject_base + 56 + negotiation_reject_at + 1) % 256; negotiation_reject_at = negotiation_reject_at + 1
  :: else -> break
  od;
  negotiation_reject_at = 0;
  do
  :: negotiation_reject_at < 2 -> negotiation_reject_record.error_codes[negotiation_reject_at] = (negotiation_reject_base + 64 + negotiation_reject_at + 1) % 256; negotiation_reject_at = negotiation_reject_at + 1
  :: else -> break
  od;
  negotiation_reject_record.fault_tolerance_indicator = (negotiation_reject_base + 66 + 1) % 256;
  negotiation_reject_record.split_msg = (negotiation_reject_base + 67 + 1) % 256;
  skip
}

/* Negotiation Reject to the wire, 68 bytes from where the cursor stands */
inline encode_negotiation_reject(negotiation_reject_record) {
  negotiation_reject_at = 0;
  do
  :: negotiation_reject_at < 48 -> wire[at] = negotiation_reject_record.reason[negotiation_reject_at]; at = at + 1; negotiation_reject_at = negotiation_reject_at + 1
  :: else -> break
  od;
  negotiation_reject_at = 0;
  do
  :: negotiation_reject_at < 8 -> wire[at] = negotiation_reject_record.uuid[negotiation_reject_at]; at = at + 1; negotiation_reject_at = negotiation_reject_at + 1
  :: else -> break
  od;
  negotiation_reject_at = 0;
  do
  :: negotiation_reject_at < 8 -> wire[at] = negotiation_reject_record.request_timestamp[negotiation_reject_at]; at = at + 1; negotiation_reject_at = negotiation_reject_at + 1
  :: else -> break
  od;
  negotiation_reject_at = 0;
  do
  :: negotiation_reject_at < 2 -> wire[at] = negotiation_reject_record.error_codes[negotiation_reject_at]; at = at + 1; negotiation_reject_at = negotiation_reject_at + 1
  :: else -> break
  od;
  wire[at] = negotiation_reject_record.fault_tolerance_indicator; at = at + 1;
  wire[at] = negotiation_reject_record.split_msg; at = at + 1;
  skip
}

/* Negotiation Reject off the wire, 68 bytes from where the cursor stands */
inline decode_negotiation_reject(negotiation_reject_record) {
  negotiation_reject_at = 0;
  do
  :: negotiation_reject_at < 48 -> negotiation_reject_record.reason[negotiation_reject_at] = wire[at]; at = at + 1; negotiation_reject_at = negotiation_reject_at + 1
  :: else -> break
  od;
  negotiation_reject_at = 0;
  do
  :: negotiation_reject_at < 8 -> negotiation_reject_record.uuid[negotiation_reject_at] = wire[at]; at = at + 1; negotiation_reject_at = negotiation_reject_at + 1
  :: else -> break
  od;
  negotiation_reject_at = 0;
  do
  :: negotiation_reject_at < 8 -> negotiation_reject_record.request_timestamp[negotiation_reject_at] = wire[at]; at = at + 1; negotiation_reject_at = negotiation_reject_at + 1
  :: else -> break
  od;
  negotiation_reject_at = 0;
  do
  :: negotiation_reject_at < 2 -> negotiation_reject_record.error_codes[negotiation_reject_at] = wire[at]; at = at + 1; negotiation_reject_at = negotiation_reject_at + 1
  :: else -> break
  od;
  negotiation_reject_record.fault_tolerance_indicator = wire[at]; at = at + 1;
  negotiation_reject_record.split_msg = wire[at]; at = at + 1;
  skip
}

/* what was read of Negotiation Reject is what was written, byte for byte */
inline equal_negotiation_reject(negotiation_reject_read, negotiation_reject_written) {
  negotiation_reject_at = 0;
  do
  :: negotiation_reject_at < 48 -> assert(negotiation_reject_read.reason[negotiation_reject_at] == negotiation_reject_written.reason[negotiation_reject_at]); negotiation_reject_at = negotiation_reject_at + 1
  :: else -> break
  od;
  negotiation_reject_at = 0;
  do
  :: negotiation_reject_at < 8 -> assert(negotiation_reject_read.uuid[negotiation_reject_at] == negotiation_reject_written.uuid[negotiation_reject_at]); negotiation_reject_at = negotiation_reject_at + 1
  :: else -> break
  od;
  negotiation_reject_at = 0;
  do
  :: negotiation_reject_at < 8 -> assert(negotiation_reject_read.request_timestamp[negotiation_reject_at] == negotiation_reject_written.request_timestamp[negotiation_reject_at]); negotiation_reject_at = negotiation_reject_at + 1
  :: else -> break
  od;
  negotiation_reject_at = 0;
  do
  :: negotiation_reject_at < 2 -> assert(negotiation_reject_read.error_codes[negotiation_reject_at] == negotiation_reject_written.error_codes[negotiation_reject_at]); negotiation_reject_at = negotiation_reject_at + 1
  :: else -> break
  od;
  assert(negotiation_reject_read.fault_tolerance_indicator == negotiation_reject_written.fault_tolerance_indicator);
  assert(negotiation_reject_read.split_msg == negotiation_reject_written.split_msg);
  skip
}

/* ---- Establishment Ack: 38 bytes --------------------------------------------- */

/* The Establishment Acknowledgment message is sent when an Establish message from a customer is accepted by CME. */
typedef EstablishmentAck {
  byte uuid[8];
  byte request_timestamp[8];
  byte next_seq_no[4];
  byte previous_seq_no[4];
  byte previous_uuid[8];
  byte keep_alive_interval[2];
  byte secret_key_secure_id_expiration[2];
  byte fault_tolerance_indicator;
  byte split_msg
};

int establishment_ack_at;

/* every byte of Establishment Ack set to one value */
inline fill_establishment_ack(establishment_ack_record, establishment_ack_value) {
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 8 -> establishment_ack_record.uuid[establishment_ack_at] = establishment_ack_value; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 8 -> establishment_ack_record.request_timestamp[establishment_ack_at] = establishment_ack_value; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 4 -> establishment_ack_record.next_seq_no[establishment_ack_at] = establishment_ack_value; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 4 -> establishment_ack_record.previous_seq_no[establishment_ack_at] = establishment_ack_value; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 8 -> establishment_ack_record.previous_uuid[establishment_ack_at] = establishment_ack_value; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 2 -> establishment_ack_record.keep_alive_interval[establishment_ack_at] = establishment_ack_value; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 2 -> establishment_ack_record.secret_key_secure_id_expiration[establishment_ack_at] = establishment_ack_value; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_record.fault_tolerance_indicator = establishment_ack_value;
  establishment_ack_record.split_msg = establishment_ack_value;
  skip
}

/* each byte of Establishment Ack set to where it lies, so a field read out of place says so */
inline ramp_establishment_ack(establishment_ack_record, establishment_ack_base) {
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 8 -> establishment_ack_record.uuid[establishment_ack_at] = (establishment_ack_base + 0 + establishment_ack_at + 1) % 256; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 8 -> establishment_ack_record.request_timestamp[establishment_ack_at] = (establishment_ack_base + 8 + establishment_ack_at + 1) % 256; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 4 -> establishment_ack_record.next_seq_no[establishment_ack_at] = (establishment_ack_base + 16 + establishment_ack_at + 1) % 256; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 4 -> establishment_ack_record.previous_seq_no[establishment_ack_at] = (establishment_ack_base + 20 + establishment_ack_at + 1) % 256; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 8 -> establishment_ack_record.previous_uuid[establishment_ack_at] = (establishment_ack_base + 24 + establishment_ack_at + 1) % 256; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 2 -> establishment_ack_record.keep_alive_interval[establishment_ack_at] = (establishment_ack_base + 32 + establishment_ack_at + 1) % 256; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 2 -> establishment_ack_record.secret_key_secure_id_expiration[establishment_ack_at] = (establishment_ack_base + 34 + establishment_ack_at + 1) % 256; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_record.fault_tolerance_indicator = (establishment_ack_base + 36 + 1) % 256;
  establishment_ack_record.split_msg = (establishment_ack_base + 37 + 1) % 256;
  skip
}

/* Establishment Ack to the wire, 38 bytes from where the cursor stands */
inline encode_establishment_ack(establishment_ack_record) {
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 8 -> wire[at] = establishment_ack_record.uuid[establishment_ack_at]; at = at + 1; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 8 -> wire[at] = establishment_ack_record.request_timestamp[establishment_ack_at]; at = at + 1; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 4 -> wire[at] = establishment_ack_record.next_seq_no[establishment_ack_at]; at = at + 1; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 4 -> wire[at] = establishment_ack_record.previous_seq_no[establishment_ack_at]; at = at + 1; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 8 -> wire[at] = establishment_ack_record.previous_uuid[establishment_ack_at]; at = at + 1; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 2 -> wire[at] = establishment_ack_record.keep_alive_interval[establishment_ack_at]; at = at + 1; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 2 -> wire[at] = establishment_ack_record.secret_key_secure_id_expiration[establishment_ack_at]; at = at + 1; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  wire[at] = establishment_ack_record.fault_tolerance_indicator; at = at + 1;
  wire[at] = establishment_ack_record.split_msg; at = at + 1;
  skip
}

/* Establishment Ack off the wire, 38 bytes from where the cursor stands */
inline decode_establishment_ack(establishment_ack_record) {
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 8 -> establishment_ack_record.uuid[establishment_ack_at] = wire[at]; at = at + 1; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 8 -> establishment_ack_record.request_timestamp[establishment_ack_at] = wire[at]; at = at + 1; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 4 -> establishment_ack_record.next_seq_no[establishment_ack_at] = wire[at]; at = at + 1; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 4 -> establishment_ack_record.previous_seq_no[establishment_ack_at] = wire[at]; at = at + 1; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 8 -> establishment_ack_record.previous_uuid[establishment_ack_at] = wire[at]; at = at + 1; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 2 -> establishment_ack_record.keep_alive_interval[establishment_ack_at] = wire[at]; at = at + 1; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 2 -> establishment_ack_record.secret_key_secure_id_expiration[establishment_ack_at] = wire[at]; at = at + 1; establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_record.fault_tolerance_indicator = wire[at]; at = at + 1;
  establishment_ack_record.split_msg = wire[at]; at = at + 1;
  skip
}

/* what was read of Establishment Ack is what was written, byte for byte */
inline equal_establishment_ack(establishment_ack_read, establishment_ack_written) {
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 8 -> assert(establishment_ack_read.uuid[establishment_ack_at] == establishment_ack_written.uuid[establishment_ack_at]); establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 8 -> assert(establishment_ack_read.request_timestamp[establishment_ack_at] == establishment_ack_written.request_timestamp[establishment_ack_at]); establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 4 -> assert(establishment_ack_read.next_seq_no[establishment_ack_at] == establishment_ack_written.next_seq_no[establishment_ack_at]); establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 4 -> assert(establishment_ack_read.previous_seq_no[establishment_ack_at] == establishment_ack_written.previous_seq_no[establishment_ack_at]); establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 8 -> assert(establishment_ack_read.previous_uuid[establishment_ack_at] == establishment_ack_written.previous_uuid[establishment_ack_at]); establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 2 -> assert(establishment_ack_read.keep_alive_interval[establishment_ack_at] == establishment_ack_written.keep_alive_interval[establishment_ack_at]); establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  establishment_ack_at = 0;
  do
  :: establishment_ack_at < 2 -> assert(establishment_ack_read.secret_key_secure_id_expiration[establishment_ack_at] == establishment_ack_written.secret_key_secure_id_expiration[establishment_ack_at]); establishment_ack_at = establishment_ack_at + 1
  :: else -> break
  od;
  assert(establishment_ack_read.fault_tolerance_indicator == establishment_ack_written.fault_tolerance_indicator);
  assert(establishment_ack_read.split_msg == establishment_ack_written.split_msg);
  skip
}

/* ---- Establishment Reject: 72 bytes ------------------------------------------ */

/* The Establishment Reject message is sent when an Establish message from the customer is rejected by CME. */
typedef EstablishmentReject {
  byte reason[48];
  byte uuid[8];
  byte request_timestamp[8];
  byte next_seq_no[4];
  byte error_codes[2];
  byte fault_tolerance_indicator;
  byte split_msg
};

int establishment_reject_at;

/* every byte of Establishment Reject set to one value */
inline fill_establishment_reject(establishment_reject_record, establishment_reject_value) {
  establishment_reject_at = 0;
  do
  :: establishment_reject_at < 48 -> establishment_reject_record.reason[establishment_reject_at] = establishment_reject_value; establishment_reject_at = establishment_reject_at + 1
  :: else -> break
  od;
  establishment_reject_at = 0;
  do
  :: establishment_reject_at < 8 -> establishment_reject_record.uuid[establishment_reject_at] = establishment_reject_value; establishment_reject_at = establishment_reject_at + 1
  :: else -> break
  od;
  establishment_reject_at = 0;
  do
  :: establishment_reject_at < 8 -> establishment_reject_record.request_timestamp[establishment_reject_at] = establishment_reject_value; establishment_reject_at = establishment_reject_at + 1
  :: else -> break
  od;
  establishment_reject_at = 0;
  do
  :: establishment_reject_at < 4 -> establishment_reject_record.next_seq_no[establishment_reject_at] = establishment_reject_value; establishment_reject_at = establishment_reject_at + 1
  :: else -> break
  od;
  establishment_reject_at = 0;
  do
  :: establishment_reject_at < 2 -> establishment_reject_record.error_codes[establishment_reject_at] = establishment_reject_value; establishment_reject_at = establishment_reject_at + 1
  :: else -> break
  od;
  establishment_reject_record.fault_tolerance_indicator = establishment_reject_value;
  establishment_reject_record.split_msg = establishment_reject_value;
  skip
}

/* each byte of Establishment Reject set to where it lies, so a field read out of place says so */
inline ramp_establishment_reject(establishment_reject_record, establishment_reject_base) {
  establishment_reject_at = 0;
  do
  :: establishment_reject_at < 48 -> establishment_reject_record.reason[establishment_reject_at] = (establishment_reject_base + 0 + establishment_reject_at + 1) % 256; establishment_reject_at = establishment_reject_at + 1
  :: else -> break
  od;
  establishment_reject_at = 0;
  do
  :: establishment_reject_at < 8 -> establishment_reject_record.uuid[establishment_reject_at] = (establishment_reject_base + 48 + establishment_reject_at + 1) % 256; establishment_reject_at = establishment_reject_at + 1
  :: else -> break
  od;
  establishment_reject_at = 0;
  do
  :: establishment_reject_at < 8 -> establishment_reject_record.request_timestamp[establishment_reject_at] = (establishment_reject_base + 56 + establishment_reject_at + 1) % 256; establishment_reject_at = establishment_reject_at + 1
  :: else -> break
  od;
  establishment_reject_at = 0;
  do
  :: establishment_reject_at < 4 -> establishment_reject_record.next_seq_no[establishment_reject_at] = (establishment_reject_base + 64 + establishment_reject_at + 1) % 256; establishment_reject_at = establishment_reject_at + 1
  :: else -> break
  od;
  establishment_reject_at = 0;
  do
  :: establishment_reject_at < 2 -> establishment_reject_record.error_codes[establishment_reject_at] = (establishment_reject_base + 68 + establishment_reject_at + 1) % 256; establishment_reject_at = establishment_reject_at + 1
  :: else -> break
  od;
  establishment_reject_record.fault_tolerance_indicator = (establishment_reject_base + 70 + 1) % 256;
  establishment_reject_record.split_msg = (establishment_reject_base + 71 + 1) % 256;
  skip
}

/* Establishment Reject to the wire, 72 bytes from where the cursor stands */
inline encode_establishment_reject(establishment_reject_record) {
  establishment_reject_at = 0;
  do
  :: establishment_reject_at < 48 -> wire[at] = establishment_reject_record.reason[establishment_reject_at]; at = at + 1; establishment_reject_at = establishment_reject_at + 1
  :: else -> break
  od;
  establishment_reject_at = 0;
  do
  :: establishment_reject_at < 8 -> wire[at] = establishment_reject_record.uuid[establishment_reject_at]; at = at + 1; establishment_reject_at = establishment_reject_at + 1
  :: else -> break
  od;
  establishment_reject_at = 0;
  do
  :: establishment_reject_at < 8 -> wire[at] = establishment_reject_record.request_timestamp[establishment_reject_at]; at = at + 1; establishment_reject_at = establishment_reject_at + 1
  :: else -> break
  od;
  establishment_reject_at = 0;
  do
  :: establishment_reject_at < 4 -> wire[at] = establishment_reject_record.next_seq_no[establishment_reject_at]; at = at + 1; establishment_reject_at = establishment_reject_at + 1
  :: else -> break
  od;
  establishment_reject_at = 0;
  do
  :: establishment_reject_at < 2 -> wire[at] = establishment_reject_record.error_codes[establishment_reject_at]; at = at + 1; establishment_reject_at = establishment_reject_at + 1
  :: else -> break
  od;
  wire[at] = establishment_reject_record.fault_tolerance_indicator; at = at + 1;
  wire[at] = establishment_reject_record.split_msg; at = at + 1;
  skip
}

/* Establishment Reject off the wire, 72 bytes from where the cursor stands */
inline decode_establishment_reject(establishment_reject_record) {
  establishment_reject_at = 0;
  do
  :: establishment_reject_at < 48 -> establishment_reject_record.reason[establishment_reject_at] = wire[at]; at = at + 1; establishment_reject_at = establishment_reject_at + 1
  :: else -> break
  od;
  establishment_reject_at = 0;
  do
  :: establishment_reject_at < 8 -> establishment_reject_record.uuid[establishment_reject_at] = wire[at]; at = at + 1; establishment_reject_at = establishment_reject_at + 1
  :: else -> break
  od;
  establishment_reject_at = 0;
  do
  :: establishment_reject_at < 8 -> establishment_reject_record.request_timestamp[establishment_reject_at] = wire[at]; at = at + 1; establishment_reject_at = establishment_reject_at + 1
  :: else -> break
  od;
  establishment_reject_at = 0;
  do
  :: establishment_reject_at < 4 -> establishment_reject_record.next_seq_no[establishment_reject_at] = wire[at]; at = at + 1; establishment_reject_at = establishment_reject_at + 1
  :: else -> break
  od;
  establishment_reject_at = 0;
  do
  :: establishment_reject_at < 2 -> establishment_reject_record.error_codes[establishment_reject_at] = wire[at]; at = at + 1; establishment_reject_at = establishment_reject_at + 1
  :: else -> break
  od;
  establishment_reject_record.fault_tolerance_indicator = wire[at]; at = at + 1;
  establishment_reject_record.split_msg = wire[at]; at = at + 1;
  skip
}

/* what was read of Establishment Reject is what was written, byte for byte */
inline equal_establishment_reject(establishment_reject_read, establishment_reject_written) {
  establishment_reject_at = 0;
  do
  :: establishment_reject_at < 48 -> assert(establishment_reject_read.reason[establishment_reject_at] == establishment_reject_written.reason[establishment_reject_at]); establishment_reject_at = establishment_reject_at + 1
  :: else -> break
  od;
  establishment_reject_at = 0;
  do
  :: establishment_reject_at < 8 -> assert(establishment_reject_read.uuid[establishment_reject_at] == establishment_reject_written.uuid[establishment_reject_at]); establishment_reject_at = establishment_reject_at + 1
  :: else -> break
  od;
  establishment_reject_at = 0;
  do
  :: establishment_reject_at < 8 -> assert(establishment_reject_read.request_timestamp[establishment_reject_at] == establishment_reject_written.request_timestamp[establishment_reject_at]); establishment_reject_at = establishment_reject_at + 1
  :: else -> break
  od;
  establishment_reject_at = 0;
  do
  :: establishment_reject_at < 4 -> assert(establishment_reject_read.next_seq_no[establishment_reject_at] == establishment_reject_written.next_seq_no[establishment_reject_at]); establishment_reject_at = establishment_reject_at + 1
  :: else -> break
  od;
  establishment_reject_at = 0;
  do
  :: establishment_reject_at < 2 -> assert(establishment_reject_read.error_codes[establishment_reject_at] == establishment_reject_written.error_codes[establishment_reject_at]); establishment_reject_at = establishment_reject_at + 1
  :: else -> break
  od;
  assert(establishment_reject_read.fault_tolerance_indicator == establishment_reject_written.fault_tolerance_indicator);
  assert(establishment_reject_read.split_msg == establishment_reject_written.split_msg);
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

/* ---- Retransmission: 31 bytes ------------------------------------------------ */

/* The Retransmission message is sent when a Retransmit Request message from the customer is accepted by CME. */
typedef Retransmission {
  byte uuid[8];
  byte last_uuid[8];
  byte request_timestamp[8];
  byte from_seq_no[4];
  byte msg_count_16[2];
  byte split_msg
};

int retransmission_at;

/* every byte of Retransmission set to one value */
inline fill_retransmission(retransmission_record, retransmission_value) {
  retransmission_at = 0;
  do
  :: retransmission_at < 8 -> retransmission_record.uuid[retransmission_at] = retransmission_value; retransmission_at = retransmission_at + 1
  :: else -> break
  od;
  retransmission_at = 0;
  do
  :: retransmission_at < 8 -> retransmission_record.last_uuid[retransmission_at] = retransmission_value; retransmission_at = retransmission_at + 1
  :: else -> break
  od;
  retransmission_at = 0;
  do
  :: retransmission_at < 8 -> retransmission_record.request_timestamp[retransmission_at] = retransmission_value; retransmission_at = retransmission_at + 1
  :: else -> break
  od;
  retransmission_at = 0;
  do
  :: retransmission_at < 4 -> retransmission_record.from_seq_no[retransmission_at] = retransmission_value; retransmission_at = retransmission_at + 1
  :: else -> break
  od;
  retransmission_at = 0;
  do
  :: retransmission_at < 2 -> retransmission_record.msg_count_16[retransmission_at] = retransmission_value; retransmission_at = retransmission_at + 1
  :: else -> break
  od;
  retransmission_record.split_msg = retransmission_value;
  skip
}

/* each byte of Retransmission set to where it lies, so a field read out of place says so */
inline ramp_retransmission(retransmission_record, retransmission_base) {
  retransmission_at = 0;
  do
  :: retransmission_at < 8 -> retransmission_record.uuid[retransmission_at] = (retransmission_base + 0 + retransmission_at + 1) % 256; retransmission_at = retransmission_at + 1
  :: else -> break
  od;
  retransmission_at = 0;
  do
  :: retransmission_at < 8 -> retransmission_record.last_uuid[retransmission_at] = (retransmission_base + 8 + retransmission_at + 1) % 256; retransmission_at = retransmission_at + 1
  :: else -> break
  od;
  retransmission_at = 0;
  do
  :: retransmission_at < 8 -> retransmission_record.request_timestamp[retransmission_at] = (retransmission_base + 16 + retransmission_at + 1) % 256; retransmission_at = retransmission_at + 1
  :: else -> break
  od;
  retransmission_at = 0;
  do
  :: retransmission_at < 4 -> retransmission_record.from_seq_no[retransmission_at] = (retransmission_base + 24 + retransmission_at + 1) % 256; retransmission_at = retransmission_at + 1
  :: else -> break
  od;
  retransmission_at = 0;
  do
  :: retransmission_at < 2 -> retransmission_record.msg_count_16[retransmission_at] = (retransmission_base + 28 + retransmission_at + 1) % 256; retransmission_at = retransmission_at + 1
  :: else -> break
  od;
  retransmission_record.split_msg = (retransmission_base + 30 + 1) % 256;
  skip
}

/* Retransmission to the wire, 31 bytes from where the cursor stands */
inline encode_retransmission(retransmission_record) {
  retransmission_at = 0;
  do
  :: retransmission_at < 8 -> wire[at] = retransmission_record.uuid[retransmission_at]; at = at + 1; retransmission_at = retransmission_at + 1
  :: else -> break
  od;
  retransmission_at = 0;
  do
  :: retransmission_at < 8 -> wire[at] = retransmission_record.last_uuid[retransmission_at]; at = at + 1; retransmission_at = retransmission_at + 1
  :: else -> break
  od;
  retransmission_at = 0;
  do
  :: retransmission_at < 8 -> wire[at] = retransmission_record.request_timestamp[retransmission_at]; at = at + 1; retransmission_at = retransmission_at + 1
  :: else -> break
  od;
  retransmission_at = 0;
  do
  :: retransmission_at < 4 -> wire[at] = retransmission_record.from_seq_no[retransmission_at]; at = at + 1; retransmission_at = retransmission_at + 1
  :: else -> break
  od;
  retransmission_at = 0;
  do
  :: retransmission_at < 2 -> wire[at] = retransmission_record.msg_count_16[retransmission_at]; at = at + 1; retransmission_at = retransmission_at + 1
  :: else -> break
  od;
  wire[at] = retransmission_record.split_msg; at = at + 1;
  skip
}

/* Retransmission off the wire, 31 bytes from where the cursor stands */
inline decode_retransmission(retransmission_record) {
  retransmission_at = 0;
  do
  :: retransmission_at < 8 -> retransmission_record.uuid[retransmission_at] = wire[at]; at = at + 1; retransmission_at = retransmission_at + 1
  :: else -> break
  od;
  retransmission_at = 0;
  do
  :: retransmission_at < 8 -> retransmission_record.last_uuid[retransmission_at] = wire[at]; at = at + 1; retransmission_at = retransmission_at + 1
  :: else -> break
  od;
  retransmission_at = 0;
  do
  :: retransmission_at < 8 -> retransmission_record.request_timestamp[retransmission_at] = wire[at]; at = at + 1; retransmission_at = retransmission_at + 1
  :: else -> break
  od;
  retransmission_at = 0;
  do
  :: retransmission_at < 4 -> retransmission_record.from_seq_no[retransmission_at] = wire[at]; at = at + 1; retransmission_at = retransmission_at + 1
  :: else -> break
  od;
  retransmission_at = 0;
  do
  :: retransmission_at < 2 -> retransmission_record.msg_count_16[retransmission_at] = wire[at]; at = at + 1; retransmission_at = retransmission_at + 1
  :: else -> break
  od;
  retransmission_record.split_msg = wire[at]; at = at + 1;
  skip
}

/* what was read of Retransmission is what was written, byte for byte */
inline equal_retransmission(retransmission_read, retransmission_written) {
  retransmission_at = 0;
  do
  :: retransmission_at < 8 -> assert(retransmission_read.uuid[retransmission_at] == retransmission_written.uuid[retransmission_at]); retransmission_at = retransmission_at + 1
  :: else -> break
  od;
  retransmission_at = 0;
  do
  :: retransmission_at < 8 -> assert(retransmission_read.last_uuid[retransmission_at] == retransmission_written.last_uuid[retransmission_at]); retransmission_at = retransmission_at + 1
  :: else -> break
  od;
  retransmission_at = 0;
  do
  :: retransmission_at < 8 -> assert(retransmission_read.request_timestamp[retransmission_at] == retransmission_written.request_timestamp[retransmission_at]); retransmission_at = retransmission_at + 1
  :: else -> break
  od;
  retransmission_at = 0;
  do
  :: retransmission_at < 4 -> assert(retransmission_read.from_seq_no[retransmission_at] == retransmission_written.from_seq_no[retransmission_at]); retransmission_at = retransmission_at + 1
  :: else -> break
  od;
  retransmission_at = 0;
  do
  :: retransmission_at < 2 -> assert(retransmission_read.msg_count_16[retransmission_at] == retransmission_written.msg_count_16[retransmission_at]); retransmission_at = retransmission_at + 1
  :: else -> break
  od;
  assert(retransmission_read.split_msg == retransmission_written.split_msg);
  skip
}

/* ---- Retransmit Reject: 75 bytes --------------------------------------------- */

/* CME Globex sends a Retransmit Reject message when a Retransmit Request message from the customer is rejected. */
typedef RetransmitReject {
  byte reason[48];
  byte uuid[8];
  byte last_uuid[8];
  byte request_timestamp[8];
  byte error_codes[2];
  byte split_msg
};

int retransmit_reject_at;

/* every byte of Retransmit Reject set to one value */
inline fill_retransmit_reject(retransmit_reject_record, retransmit_reject_value) {
  retransmit_reject_at = 0;
  do
  :: retransmit_reject_at < 48 -> retransmit_reject_record.reason[retransmit_reject_at] = retransmit_reject_value; retransmit_reject_at = retransmit_reject_at + 1
  :: else -> break
  od;
  retransmit_reject_at = 0;
  do
  :: retransmit_reject_at < 8 -> retransmit_reject_record.uuid[retransmit_reject_at] = retransmit_reject_value; retransmit_reject_at = retransmit_reject_at + 1
  :: else -> break
  od;
  retransmit_reject_at = 0;
  do
  :: retransmit_reject_at < 8 -> retransmit_reject_record.last_uuid[retransmit_reject_at] = retransmit_reject_value; retransmit_reject_at = retransmit_reject_at + 1
  :: else -> break
  od;
  retransmit_reject_at = 0;
  do
  :: retransmit_reject_at < 8 -> retransmit_reject_record.request_timestamp[retransmit_reject_at] = retransmit_reject_value; retransmit_reject_at = retransmit_reject_at + 1
  :: else -> break
  od;
  retransmit_reject_at = 0;
  do
  :: retransmit_reject_at < 2 -> retransmit_reject_record.error_codes[retransmit_reject_at] = retransmit_reject_value; retransmit_reject_at = retransmit_reject_at + 1
  :: else -> break
  od;
  retransmit_reject_record.split_msg = retransmit_reject_value;
  skip
}

/* each byte of Retransmit Reject set to where it lies, so a field read out of place says so */
inline ramp_retransmit_reject(retransmit_reject_record, retransmit_reject_base) {
  retransmit_reject_at = 0;
  do
  :: retransmit_reject_at < 48 -> retransmit_reject_record.reason[retransmit_reject_at] = (retransmit_reject_base + 0 + retransmit_reject_at + 1) % 256; retransmit_reject_at = retransmit_reject_at + 1
  :: else -> break
  od;
  retransmit_reject_at = 0;
  do
  :: retransmit_reject_at < 8 -> retransmit_reject_record.uuid[retransmit_reject_at] = (retransmit_reject_base + 48 + retransmit_reject_at + 1) % 256; retransmit_reject_at = retransmit_reject_at + 1
  :: else -> break
  od;
  retransmit_reject_at = 0;
  do
  :: retransmit_reject_at < 8 -> retransmit_reject_record.last_uuid[retransmit_reject_at] = (retransmit_reject_base + 56 + retransmit_reject_at + 1) % 256; retransmit_reject_at = retransmit_reject_at + 1
  :: else -> break
  od;
  retransmit_reject_at = 0;
  do
  :: retransmit_reject_at < 8 -> retransmit_reject_record.request_timestamp[retransmit_reject_at] = (retransmit_reject_base + 64 + retransmit_reject_at + 1) % 256; retransmit_reject_at = retransmit_reject_at + 1
  :: else -> break
  od;
  retransmit_reject_at = 0;
  do
  :: retransmit_reject_at < 2 -> retransmit_reject_record.error_codes[retransmit_reject_at] = (retransmit_reject_base + 72 + retransmit_reject_at + 1) % 256; retransmit_reject_at = retransmit_reject_at + 1
  :: else -> break
  od;
  retransmit_reject_record.split_msg = (retransmit_reject_base + 74 + 1) % 256;
  skip
}

/* Retransmit Reject to the wire, 75 bytes from where the cursor stands */
inline encode_retransmit_reject(retransmit_reject_record) {
  retransmit_reject_at = 0;
  do
  :: retransmit_reject_at < 48 -> wire[at] = retransmit_reject_record.reason[retransmit_reject_at]; at = at + 1; retransmit_reject_at = retransmit_reject_at + 1
  :: else -> break
  od;
  retransmit_reject_at = 0;
  do
  :: retransmit_reject_at < 8 -> wire[at] = retransmit_reject_record.uuid[retransmit_reject_at]; at = at + 1; retransmit_reject_at = retransmit_reject_at + 1
  :: else -> break
  od;
  retransmit_reject_at = 0;
  do
  :: retransmit_reject_at < 8 -> wire[at] = retransmit_reject_record.last_uuid[retransmit_reject_at]; at = at + 1; retransmit_reject_at = retransmit_reject_at + 1
  :: else -> break
  od;
  retransmit_reject_at = 0;
  do
  :: retransmit_reject_at < 8 -> wire[at] = retransmit_reject_record.request_timestamp[retransmit_reject_at]; at = at + 1; retransmit_reject_at = retransmit_reject_at + 1
  :: else -> break
  od;
  retransmit_reject_at = 0;
  do
  :: retransmit_reject_at < 2 -> wire[at] = retransmit_reject_record.error_codes[retransmit_reject_at]; at = at + 1; retransmit_reject_at = retransmit_reject_at + 1
  :: else -> break
  od;
  wire[at] = retransmit_reject_record.split_msg; at = at + 1;
  skip
}

/* Retransmit Reject off the wire, 75 bytes from where the cursor stands */
inline decode_retransmit_reject(retransmit_reject_record) {
  retransmit_reject_at = 0;
  do
  :: retransmit_reject_at < 48 -> retransmit_reject_record.reason[retransmit_reject_at] = wire[at]; at = at + 1; retransmit_reject_at = retransmit_reject_at + 1
  :: else -> break
  od;
  retransmit_reject_at = 0;
  do
  :: retransmit_reject_at < 8 -> retransmit_reject_record.uuid[retransmit_reject_at] = wire[at]; at = at + 1; retransmit_reject_at = retransmit_reject_at + 1
  :: else -> break
  od;
  retransmit_reject_at = 0;
  do
  :: retransmit_reject_at < 8 -> retransmit_reject_record.last_uuid[retransmit_reject_at] = wire[at]; at = at + 1; retransmit_reject_at = retransmit_reject_at + 1
  :: else -> break
  od;
  retransmit_reject_at = 0;
  do
  :: retransmit_reject_at < 8 -> retransmit_reject_record.request_timestamp[retransmit_reject_at] = wire[at]; at = at + 1; retransmit_reject_at = retransmit_reject_at + 1
  :: else -> break
  od;
  retransmit_reject_at = 0;
  do
  :: retransmit_reject_at < 2 -> retransmit_reject_record.error_codes[retransmit_reject_at] = wire[at]; at = at + 1; retransmit_reject_at = retransmit_reject_at + 1
  :: else -> break
  od;
  retransmit_reject_record.split_msg = wire[at]; at = at + 1;
  skip
}

/* what was read of Retransmit Reject is what was written, byte for byte */
inline equal_retransmit_reject(retransmit_reject_read, retransmit_reject_written) {
  retransmit_reject_at = 0;
  do
  :: retransmit_reject_at < 48 -> assert(retransmit_reject_read.reason[retransmit_reject_at] == retransmit_reject_written.reason[retransmit_reject_at]); retransmit_reject_at = retransmit_reject_at + 1
  :: else -> break
  od;
  retransmit_reject_at = 0;
  do
  :: retransmit_reject_at < 8 -> assert(retransmit_reject_read.uuid[retransmit_reject_at] == retransmit_reject_written.uuid[retransmit_reject_at]); retransmit_reject_at = retransmit_reject_at + 1
  :: else -> break
  od;
  retransmit_reject_at = 0;
  do
  :: retransmit_reject_at < 8 -> assert(retransmit_reject_read.last_uuid[retransmit_reject_at] == retransmit_reject_written.last_uuid[retransmit_reject_at]); retransmit_reject_at = retransmit_reject_at + 1
  :: else -> break
  od;
  retransmit_reject_at = 0;
  do
  :: retransmit_reject_at < 8 -> assert(retransmit_reject_read.request_timestamp[retransmit_reject_at] == retransmit_reject_written.request_timestamp[retransmit_reject_at]); retransmit_reject_at = retransmit_reject_at + 1
  :: else -> break
  od;
  retransmit_reject_at = 0;
  do
  :: retransmit_reject_at < 2 -> assert(retransmit_reject_read.error_codes[retransmit_reject_at] == retransmit_reject_written.error_codes[retransmit_reject_at]); retransmit_reject_at = retransmit_reject_at + 1
  :: else -> break
  od;
  assert(retransmit_reject_read.split_msg == retransmit_reject_written.split_msg);
  skip
}

/* ---- Not Applied: 17 bytes --------------------------------------------------- */

/* The Not Applied message is sent when CME detects a sequence gap from the customer. */
typedef NotApplied {
  byte uuid[8];
  byte from_seq_no[4];
  byte msg_count[4];
  byte split_msg
};

int not_applied_at;

/* every byte of Not Applied set to one value */
inline fill_not_applied(not_applied_record, not_applied_value) {
  not_applied_at = 0;
  do
  :: not_applied_at < 8 -> not_applied_record.uuid[not_applied_at] = not_applied_value; not_applied_at = not_applied_at + 1
  :: else -> break
  od;
  not_applied_at = 0;
  do
  :: not_applied_at < 4 -> not_applied_record.from_seq_no[not_applied_at] = not_applied_value; not_applied_at = not_applied_at + 1
  :: else -> break
  od;
  not_applied_at = 0;
  do
  :: not_applied_at < 4 -> not_applied_record.msg_count[not_applied_at] = not_applied_value; not_applied_at = not_applied_at + 1
  :: else -> break
  od;
  not_applied_record.split_msg = not_applied_value;
  skip
}

/* each byte of Not Applied set to where it lies, so a field read out of place says so */
inline ramp_not_applied(not_applied_record, not_applied_base) {
  not_applied_at = 0;
  do
  :: not_applied_at < 8 -> not_applied_record.uuid[not_applied_at] = (not_applied_base + 0 + not_applied_at + 1) % 256; not_applied_at = not_applied_at + 1
  :: else -> break
  od;
  not_applied_at = 0;
  do
  :: not_applied_at < 4 -> not_applied_record.from_seq_no[not_applied_at] = (not_applied_base + 8 + not_applied_at + 1) % 256; not_applied_at = not_applied_at + 1
  :: else -> break
  od;
  not_applied_at = 0;
  do
  :: not_applied_at < 4 -> not_applied_record.msg_count[not_applied_at] = (not_applied_base + 12 + not_applied_at + 1) % 256; not_applied_at = not_applied_at + 1
  :: else -> break
  od;
  not_applied_record.split_msg = (not_applied_base + 16 + 1) % 256;
  skip
}

/* Not Applied to the wire, 17 bytes from where the cursor stands */
inline encode_not_applied(not_applied_record) {
  not_applied_at = 0;
  do
  :: not_applied_at < 8 -> wire[at] = not_applied_record.uuid[not_applied_at]; at = at + 1; not_applied_at = not_applied_at + 1
  :: else -> break
  od;
  not_applied_at = 0;
  do
  :: not_applied_at < 4 -> wire[at] = not_applied_record.from_seq_no[not_applied_at]; at = at + 1; not_applied_at = not_applied_at + 1
  :: else -> break
  od;
  not_applied_at = 0;
  do
  :: not_applied_at < 4 -> wire[at] = not_applied_record.msg_count[not_applied_at]; at = at + 1; not_applied_at = not_applied_at + 1
  :: else -> break
  od;
  wire[at] = not_applied_record.split_msg; at = at + 1;
  skip
}

/* Not Applied off the wire, 17 bytes from where the cursor stands */
inline decode_not_applied(not_applied_record) {
  not_applied_at = 0;
  do
  :: not_applied_at < 8 -> not_applied_record.uuid[not_applied_at] = wire[at]; at = at + 1; not_applied_at = not_applied_at + 1
  :: else -> break
  od;
  not_applied_at = 0;
  do
  :: not_applied_at < 4 -> not_applied_record.from_seq_no[not_applied_at] = wire[at]; at = at + 1; not_applied_at = not_applied_at + 1
  :: else -> break
  od;
  not_applied_at = 0;
  do
  :: not_applied_at < 4 -> not_applied_record.msg_count[not_applied_at] = wire[at]; at = at + 1; not_applied_at = not_applied_at + 1
  :: else -> break
  od;
  not_applied_record.split_msg = wire[at]; at = at + 1;
  skip
}

/* what was read of Not Applied is what was written, byte for byte */
inline equal_not_applied(not_applied_read, not_applied_written) {
  not_applied_at = 0;
  do
  :: not_applied_at < 8 -> assert(not_applied_read.uuid[not_applied_at] == not_applied_written.uuid[not_applied_at]); not_applied_at = not_applied_at + 1
  :: else -> break
  od;
  not_applied_at = 0;
  do
  :: not_applied_at < 4 -> assert(not_applied_read.from_seq_no[not_applied_at] == not_applied_written.from_seq_no[not_applied_at]); not_applied_at = not_applied_at + 1
  :: else -> break
  od;
  not_applied_at = 0;
  do
  :: not_applied_at < 4 -> assert(not_applied_read.msg_count[not_applied_at] == not_applied_written.msg_count[not_applied_at]); not_applied_at = not_applied_at + 1
  :: else -> break
  od;
  assert(not_applied_read.split_msg == not_applied_written.split_msg);
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

/* ---- Business Reject: 330 bytes ---------------------------------------------- */

/* The Business Message Reject message can reject an application-level message, which fulfills session level rules but fails the business rules. */
typedef BusinessReject {
  byte seq_num[4];
  byte uuid[8];
  byte text[256];
  byte sender_id_optional[20];
  byte party_details_list_req_id_optional[8];
  byte sending_time_epoch[8];
  byte business_reject_ref_id[8];
  byte location_optional[5];
  byte ref_seq_num[4];
  byte ref_tag_id[2];
  byte business_reject_reason[2];
  byte ref_msg_type[2];
  byte poss_retrans_flag;
  byte manual_order_indicator_optional;
  byte split_msg
};

int business_reject_at;

/* every byte of Business Reject set to one value */
inline fill_business_reject(business_reject_record, business_reject_value) {
  business_reject_at = 0;
  do
  :: business_reject_at < 4 -> business_reject_record.seq_num[business_reject_at] = business_reject_value; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 8 -> business_reject_record.uuid[business_reject_at] = business_reject_value; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 256 -> business_reject_record.text[business_reject_at] = business_reject_value; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 20 -> business_reject_record.sender_id_optional[business_reject_at] = business_reject_value; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 8 -> business_reject_record.party_details_list_req_id_optional[business_reject_at] = business_reject_value; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 8 -> business_reject_record.sending_time_epoch[business_reject_at] = business_reject_value; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 8 -> business_reject_record.business_reject_ref_id[business_reject_at] = business_reject_value; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 5 -> business_reject_record.location_optional[business_reject_at] = business_reject_value; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 4 -> business_reject_record.ref_seq_num[business_reject_at] = business_reject_value; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 2 -> business_reject_record.ref_tag_id[business_reject_at] = business_reject_value; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 2 -> business_reject_record.business_reject_reason[business_reject_at] = business_reject_value; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 2 -> business_reject_record.ref_msg_type[business_reject_at] = business_reject_value; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_record.poss_retrans_flag = business_reject_value;
  business_reject_record.manual_order_indicator_optional = business_reject_value;
  business_reject_record.split_msg = business_reject_value;
  skip
}

/* each byte of Business Reject set to where it lies, so a field read out of place says so */
inline ramp_business_reject(business_reject_record, business_reject_base) {
  business_reject_at = 0;
  do
  :: business_reject_at < 4 -> business_reject_record.seq_num[business_reject_at] = (business_reject_base + 0 + business_reject_at + 1) % 256; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 8 -> business_reject_record.uuid[business_reject_at] = (business_reject_base + 4 + business_reject_at + 1) % 256; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 256 -> business_reject_record.text[business_reject_at] = (business_reject_base + 12 + business_reject_at + 1) % 256; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 20 -> business_reject_record.sender_id_optional[business_reject_at] = (business_reject_base + 268 + business_reject_at + 1) % 256; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 8 -> business_reject_record.party_details_list_req_id_optional[business_reject_at] = (business_reject_base + 288 + business_reject_at + 1) % 256; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 8 -> business_reject_record.sending_time_epoch[business_reject_at] = (business_reject_base + 296 + business_reject_at + 1) % 256; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 8 -> business_reject_record.business_reject_ref_id[business_reject_at] = (business_reject_base + 304 + business_reject_at + 1) % 256; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 5 -> business_reject_record.location_optional[business_reject_at] = (business_reject_base + 312 + business_reject_at + 1) % 256; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 4 -> business_reject_record.ref_seq_num[business_reject_at] = (business_reject_base + 317 + business_reject_at + 1) % 256; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 2 -> business_reject_record.ref_tag_id[business_reject_at] = (business_reject_base + 321 + business_reject_at + 1) % 256; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 2 -> business_reject_record.business_reject_reason[business_reject_at] = (business_reject_base + 323 + business_reject_at + 1) % 256; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 2 -> business_reject_record.ref_msg_type[business_reject_at] = (business_reject_base + 325 + business_reject_at + 1) % 256; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_record.poss_retrans_flag = (business_reject_base + 327 + 1) % 256;
  business_reject_record.manual_order_indicator_optional = (business_reject_base + 328 + 1) % 256;
  business_reject_record.split_msg = (business_reject_base + 329 + 1) % 256;
  skip
}

/* Business Reject to the wire, 330 bytes from where the cursor stands */
inline encode_business_reject(business_reject_record) {
  business_reject_at = 0;
  do
  :: business_reject_at < 4 -> wire[at] = business_reject_record.seq_num[business_reject_at]; at = at + 1; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 8 -> wire[at] = business_reject_record.uuid[business_reject_at]; at = at + 1; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 256 -> wire[at] = business_reject_record.text[business_reject_at]; at = at + 1; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 20 -> wire[at] = business_reject_record.sender_id_optional[business_reject_at]; at = at + 1; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 8 -> wire[at] = business_reject_record.party_details_list_req_id_optional[business_reject_at]; at = at + 1; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 8 -> wire[at] = business_reject_record.sending_time_epoch[business_reject_at]; at = at + 1; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 8 -> wire[at] = business_reject_record.business_reject_ref_id[business_reject_at]; at = at + 1; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 5 -> wire[at] = business_reject_record.location_optional[business_reject_at]; at = at + 1; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 4 -> wire[at] = business_reject_record.ref_seq_num[business_reject_at]; at = at + 1; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 2 -> wire[at] = business_reject_record.ref_tag_id[business_reject_at]; at = at + 1; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 2 -> wire[at] = business_reject_record.business_reject_reason[business_reject_at]; at = at + 1; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 2 -> wire[at] = business_reject_record.ref_msg_type[business_reject_at]; at = at + 1; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  wire[at] = business_reject_record.poss_retrans_flag; at = at + 1;
  wire[at] = business_reject_record.manual_order_indicator_optional; at = at + 1;
  wire[at] = business_reject_record.split_msg; at = at + 1;
  skip
}

/* Business Reject off the wire, 330 bytes from where the cursor stands */
inline decode_business_reject(business_reject_record) {
  business_reject_at = 0;
  do
  :: business_reject_at < 4 -> business_reject_record.seq_num[business_reject_at] = wire[at]; at = at + 1; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 8 -> business_reject_record.uuid[business_reject_at] = wire[at]; at = at + 1; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 256 -> business_reject_record.text[business_reject_at] = wire[at]; at = at + 1; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 20 -> business_reject_record.sender_id_optional[business_reject_at] = wire[at]; at = at + 1; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 8 -> business_reject_record.party_details_list_req_id_optional[business_reject_at] = wire[at]; at = at + 1; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 8 -> business_reject_record.sending_time_epoch[business_reject_at] = wire[at]; at = at + 1; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 8 -> business_reject_record.business_reject_ref_id[business_reject_at] = wire[at]; at = at + 1; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 5 -> business_reject_record.location_optional[business_reject_at] = wire[at]; at = at + 1; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 4 -> business_reject_record.ref_seq_num[business_reject_at] = wire[at]; at = at + 1; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 2 -> business_reject_record.ref_tag_id[business_reject_at] = wire[at]; at = at + 1; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 2 -> business_reject_record.business_reject_reason[business_reject_at] = wire[at]; at = at + 1; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 2 -> business_reject_record.ref_msg_type[business_reject_at] = wire[at]; at = at + 1; business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_record.poss_retrans_flag = wire[at]; at = at + 1;
  business_reject_record.manual_order_indicator_optional = wire[at]; at = at + 1;
  business_reject_record.split_msg = wire[at]; at = at + 1;
  skip
}

/* what was read of Business Reject is what was written, byte for byte */
inline equal_business_reject(business_reject_read, business_reject_written) {
  business_reject_at = 0;
  do
  :: business_reject_at < 4 -> assert(business_reject_read.seq_num[business_reject_at] == business_reject_written.seq_num[business_reject_at]); business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 8 -> assert(business_reject_read.uuid[business_reject_at] == business_reject_written.uuid[business_reject_at]); business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 256 -> assert(business_reject_read.text[business_reject_at] == business_reject_written.text[business_reject_at]); business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 20 -> assert(business_reject_read.sender_id_optional[business_reject_at] == business_reject_written.sender_id_optional[business_reject_at]); business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 8 -> assert(business_reject_read.party_details_list_req_id_optional[business_reject_at] == business_reject_written.party_details_list_req_id_optional[business_reject_at]); business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 8 -> assert(business_reject_read.sending_time_epoch[business_reject_at] == business_reject_written.sending_time_epoch[business_reject_at]); business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 8 -> assert(business_reject_read.business_reject_ref_id[business_reject_at] == business_reject_written.business_reject_ref_id[business_reject_at]); business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 5 -> assert(business_reject_read.location_optional[business_reject_at] == business_reject_written.location_optional[business_reject_at]); business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 4 -> assert(business_reject_read.ref_seq_num[business_reject_at] == business_reject_written.ref_seq_num[business_reject_at]); business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 2 -> assert(business_reject_read.ref_tag_id[business_reject_at] == business_reject_written.ref_tag_id[business_reject_at]); business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 2 -> assert(business_reject_read.business_reject_reason[business_reject_at] == business_reject_written.business_reject_reason[business_reject_at]); business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  business_reject_at = 0;
  do
  :: business_reject_at < 2 -> assert(business_reject_read.ref_msg_type[business_reject_at] == business_reject_written.ref_msg_type[business_reject_at]); business_reject_at = business_reject_at + 1
  :: else -> break
  od;
  assert(business_reject_read.poss_retrans_flag == business_reject_written.poss_retrans_flag);
  assert(business_reject_read.manual_order_indicator_optional == business_reject_written.manual_order_indicator_optional);
  assert(business_reject_read.split_msg == business_reject_written.split_msg);
  skip
}

/* ---- Volatility: 9 bytes ----------------------------------------------------- */

/* ExecutionReportTradeSpreadLeg */
typedef Volatility {
  byte mantissa[8];
  byte exponent
};

int volatility_at;

/* every byte of Volatility set to one value */
inline fill_volatility(volatility_record, volatility_value) {
  volatility_at = 0;
  do
  :: volatility_at < 8 -> volatility_record.mantissa[volatility_at] = volatility_value; volatility_at = volatility_at + 1
  :: else -> break
  od;
  volatility_record.exponent = volatility_value;
  skip
}

/* each byte of Volatility set to where it lies, so a field read out of place says so */
inline ramp_volatility(volatility_record, volatility_base) {
  volatility_at = 0;
  do
  :: volatility_at < 8 -> volatility_record.mantissa[volatility_at] = (volatility_base + 0 + volatility_at + 1) % 256; volatility_at = volatility_at + 1
  :: else -> break
  od;
  volatility_record.exponent = (volatility_base + 8 + 1) % 256;
  skip
}

/* Volatility to the wire, 9 bytes from where the cursor stands */
inline encode_volatility(volatility_record) {
  volatility_at = 0;
  do
  :: volatility_at < 8 -> wire[at] = volatility_record.mantissa[volatility_at]; at = at + 1; volatility_at = volatility_at + 1
  :: else -> break
  od;
  wire[at] = volatility_record.exponent; at = at + 1;
  skip
}

/* Volatility off the wire, 9 bytes from where the cursor stands */
inline decode_volatility(volatility_record) {
  volatility_at = 0;
  do
  :: volatility_at < 8 -> volatility_record.mantissa[volatility_at] = wire[at]; at = at + 1; volatility_at = volatility_at + 1
  :: else -> break
  od;
  volatility_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Volatility is what was written, byte for byte */
inline equal_volatility(volatility_read, volatility_written) {
  volatility_at = 0;
  do
  :: volatility_at < 8 -> assert(volatility_read.mantissa[volatility_at] == volatility_written.mantissa[volatility_at]); volatility_at = volatility_at + 1
  :: else -> break
  od;
  assert(volatility_read.exponent == volatility_written.exponent);
  skip
}

/* ---- Option Delta: 5 bytes --------------------------------------------------- */

/* ExecutionReportTradeSpreadLeg */
typedef OptionDelta {
  byte mantissa_32[4];
  byte exponent
};

int option_delta_at;

/* every byte of Option Delta set to one value */
inline fill_option_delta(option_delta_record, option_delta_value) {
  option_delta_at = 0;
  do
  :: option_delta_at < 4 -> option_delta_record.mantissa_32[option_delta_at] = option_delta_value; option_delta_at = option_delta_at + 1
  :: else -> break
  od;
  option_delta_record.exponent = option_delta_value;
  skip
}

/* each byte of Option Delta set to where it lies, so a field read out of place says so */
inline ramp_option_delta(option_delta_record, option_delta_base) {
  option_delta_at = 0;
  do
  :: option_delta_at < 4 -> option_delta_record.mantissa_32[option_delta_at] = (option_delta_base + 0 + option_delta_at + 1) % 256; option_delta_at = option_delta_at + 1
  :: else -> break
  od;
  option_delta_record.exponent = (option_delta_base + 4 + 1) % 256;
  skip
}

/* Option Delta to the wire, 5 bytes from where the cursor stands */
inline encode_option_delta(option_delta_record) {
  option_delta_at = 0;
  do
  :: option_delta_at < 4 -> wire[at] = option_delta_record.mantissa_32[option_delta_at]; at = at + 1; option_delta_at = option_delta_at + 1
  :: else -> break
  od;
  wire[at] = option_delta_record.exponent; at = at + 1;
  skip
}

/* Option Delta off the wire, 5 bytes from where the cursor stands */
inline decode_option_delta(option_delta_record) {
  option_delta_at = 0;
  do
  :: option_delta_at < 4 -> option_delta_record.mantissa_32[option_delta_at] = wire[at]; at = at + 1; option_delta_at = option_delta_at + 1
  :: else -> break
  od;
  option_delta_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Option Delta is what was written, byte for byte */
inline equal_option_delta(option_delta_read, option_delta_written) {
  option_delta_at = 0;
  do
  :: option_delta_at < 4 -> assert(option_delta_read.mantissa_32[option_delta_at] == option_delta_written.mantissa_32[option_delta_at]); option_delta_at = option_delta_at + 1
  :: else -> break
  od;
  assert(option_delta_read.exponent == option_delta_written.exponent);
  skip
}

/* ---- Time To Expiration: 5 bytes --------------------------------------------- */

/* ExecutionReportTradeSpreadLeg */
typedef TimeToExpiration {
  byte mantissa_32[4];
  byte exponent
};

int time_to_expiration_at;

/* every byte of Time To Expiration set to one value */
inline fill_time_to_expiration(time_to_expiration_record, time_to_expiration_value) {
  time_to_expiration_at = 0;
  do
  :: time_to_expiration_at < 4 -> time_to_expiration_record.mantissa_32[time_to_expiration_at] = time_to_expiration_value; time_to_expiration_at = time_to_expiration_at + 1
  :: else -> break
  od;
  time_to_expiration_record.exponent = time_to_expiration_value;
  skip
}

/* each byte of Time To Expiration set to where it lies, so a field read out of place says so */
inline ramp_time_to_expiration(time_to_expiration_record, time_to_expiration_base) {
  time_to_expiration_at = 0;
  do
  :: time_to_expiration_at < 4 -> time_to_expiration_record.mantissa_32[time_to_expiration_at] = (time_to_expiration_base + 0 + time_to_expiration_at + 1) % 256; time_to_expiration_at = time_to_expiration_at + 1
  :: else -> break
  od;
  time_to_expiration_record.exponent = (time_to_expiration_base + 4 + 1) % 256;
  skip
}

/* Time To Expiration to the wire, 5 bytes from where the cursor stands */
inline encode_time_to_expiration(time_to_expiration_record) {
  time_to_expiration_at = 0;
  do
  :: time_to_expiration_at < 4 -> wire[at] = time_to_expiration_record.mantissa_32[time_to_expiration_at]; at = at + 1; time_to_expiration_at = time_to_expiration_at + 1
  :: else -> break
  od;
  wire[at] = time_to_expiration_record.exponent; at = at + 1;
  skip
}

/* Time To Expiration off the wire, 5 bytes from where the cursor stands */
inline decode_time_to_expiration(time_to_expiration_record) {
  time_to_expiration_at = 0;
  do
  :: time_to_expiration_at < 4 -> time_to_expiration_record.mantissa_32[time_to_expiration_at] = wire[at]; at = at + 1; time_to_expiration_at = time_to_expiration_at + 1
  :: else -> break
  od;
  time_to_expiration_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Time To Expiration is what was written, byte for byte */
inline equal_time_to_expiration(time_to_expiration_read, time_to_expiration_written) {
  time_to_expiration_at = 0;
  do
  :: time_to_expiration_at < 4 -> assert(time_to_expiration_read.mantissa_32[time_to_expiration_at] == time_to_expiration_written.mantissa_32[time_to_expiration_at]); time_to_expiration_at = time_to_expiration_at + 1
  :: else -> break
  od;
  assert(time_to_expiration_read.exponent == time_to_expiration_written.exponent);
  skip
}

/* ---- Risk Free Rate: 5 bytes ------------------------------------------------- */

/* ExecutionReportTradeSpreadLeg */
typedef RiskFreeRate {
  byte mantissa_32[4];
  byte exponent
};

int risk_free_rate_at;

/* every byte of Risk Free Rate set to one value */
inline fill_risk_free_rate(risk_free_rate_record, risk_free_rate_value) {
  risk_free_rate_at = 0;
  do
  :: risk_free_rate_at < 4 -> risk_free_rate_record.mantissa_32[risk_free_rate_at] = risk_free_rate_value; risk_free_rate_at = risk_free_rate_at + 1
  :: else -> break
  od;
  risk_free_rate_record.exponent = risk_free_rate_value;
  skip
}

/* each byte of Risk Free Rate set to where it lies, so a field read out of place says so */
inline ramp_risk_free_rate(risk_free_rate_record, risk_free_rate_base) {
  risk_free_rate_at = 0;
  do
  :: risk_free_rate_at < 4 -> risk_free_rate_record.mantissa_32[risk_free_rate_at] = (risk_free_rate_base + 0 + risk_free_rate_at + 1) % 256; risk_free_rate_at = risk_free_rate_at + 1
  :: else -> break
  od;
  risk_free_rate_record.exponent = (risk_free_rate_base + 4 + 1) % 256;
  skip
}

/* Risk Free Rate to the wire, 5 bytes from where the cursor stands */
inline encode_risk_free_rate(risk_free_rate_record) {
  risk_free_rate_at = 0;
  do
  :: risk_free_rate_at < 4 -> wire[at] = risk_free_rate_record.mantissa_32[risk_free_rate_at]; at = at + 1; risk_free_rate_at = risk_free_rate_at + 1
  :: else -> break
  od;
  wire[at] = risk_free_rate_record.exponent; at = at + 1;
  skip
}

/* Risk Free Rate off the wire, 5 bytes from where the cursor stands */
inline decode_risk_free_rate(risk_free_rate_record) {
  risk_free_rate_at = 0;
  do
  :: risk_free_rate_at < 4 -> risk_free_rate_record.mantissa_32[risk_free_rate_at] = wire[at]; at = at + 1; risk_free_rate_at = risk_free_rate_at + 1
  :: else -> break
  od;
  risk_free_rate_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Risk Free Rate is what was written, byte for byte */
inline equal_risk_free_rate(risk_free_rate_read, risk_free_rate_written) {
  risk_free_rate_at = 0;
  do
  :: risk_free_rate_at < 4 -> assert(risk_free_rate_read.mantissa_32[risk_free_rate_at] == risk_free_rate_written.mantissa_32[risk_free_rate_at]); risk_free_rate_at = risk_free_rate_at + 1
  :: else -> break
  od;
  assert(risk_free_rate_read.exponent == risk_free_rate_written.exponent);
  skip
}

/* ---- Order Cancel Reject: 401 bytes ------------------------------------------ */

/* The Order Cancel Reject message is issued upon receipt of a cancel request message which cannot be honored. */
typedef OrderCancelReject {
  byte seq_num[4];
  byte uuid[8];
  byte text[256];
  byte exec_id[40];
  byte sender_id[20];
  byte cl_ord_id[20];
  byte party_details_list_req_id[8];
  byte order_id[8];
  byte transact_time[8];
  byte sending_time_epoch[8];
  byte order_request_id[8];
  byte location[5];
  byte cxl_rej_reason[2];
  byte delay_duration[2];
  byte manual_order_indicator;
  byte poss_retrans_flag;
  byte split_msg;
  byte liquidity_flag
};

int order_cancel_reject_at;

/* every byte of Order Cancel Reject set to one value */
inline fill_order_cancel_reject(order_cancel_reject_record, order_cancel_reject_value) {
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 4 -> order_cancel_reject_record.seq_num[order_cancel_reject_at] = order_cancel_reject_value; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> order_cancel_reject_record.uuid[order_cancel_reject_at] = order_cancel_reject_value; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 256 -> order_cancel_reject_record.text[order_cancel_reject_at] = order_cancel_reject_value; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 40 -> order_cancel_reject_record.exec_id[order_cancel_reject_at] = order_cancel_reject_value; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 20 -> order_cancel_reject_record.sender_id[order_cancel_reject_at] = order_cancel_reject_value; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 20 -> order_cancel_reject_record.cl_ord_id[order_cancel_reject_at] = order_cancel_reject_value; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> order_cancel_reject_record.party_details_list_req_id[order_cancel_reject_at] = order_cancel_reject_value; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> order_cancel_reject_record.order_id[order_cancel_reject_at] = order_cancel_reject_value; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> order_cancel_reject_record.transact_time[order_cancel_reject_at] = order_cancel_reject_value; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> order_cancel_reject_record.sending_time_epoch[order_cancel_reject_at] = order_cancel_reject_value; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> order_cancel_reject_record.order_request_id[order_cancel_reject_at] = order_cancel_reject_value; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 5 -> order_cancel_reject_record.location[order_cancel_reject_at] = order_cancel_reject_value; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 2 -> order_cancel_reject_record.cxl_rej_reason[order_cancel_reject_at] = order_cancel_reject_value; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 2 -> order_cancel_reject_record.delay_duration[order_cancel_reject_at] = order_cancel_reject_value; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_record.manual_order_indicator = order_cancel_reject_value;
  order_cancel_reject_record.poss_retrans_flag = order_cancel_reject_value;
  order_cancel_reject_record.split_msg = order_cancel_reject_value;
  order_cancel_reject_record.liquidity_flag = order_cancel_reject_value;
  skip
}

/* each byte of Order Cancel Reject set to where it lies, so a field read out of place says so */
inline ramp_order_cancel_reject(order_cancel_reject_record, order_cancel_reject_base) {
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 4 -> order_cancel_reject_record.seq_num[order_cancel_reject_at] = (order_cancel_reject_base + 0 + order_cancel_reject_at + 1) % 256; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> order_cancel_reject_record.uuid[order_cancel_reject_at] = (order_cancel_reject_base + 4 + order_cancel_reject_at + 1) % 256; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 256 -> order_cancel_reject_record.text[order_cancel_reject_at] = (order_cancel_reject_base + 12 + order_cancel_reject_at + 1) % 256; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 40 -> order_cancel_reject_record.exec_id[order_cancel_reject_at] = (order_cancel_reject_base + 268 + order_cancel_reject_at + 1) % 256; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 20 -> order_cancel_reject_record.sender_id[order_cancel_reject_at] = (order_cancel_reject_base + 308 + order_cancel_reject_at + 1) % 256; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 20 -> order_cancel_reject_record.cl_ord_id[order_cancel_reject_at] = (order_cancel_reject_base + 328 + order_cancel_reject_at + 1) % 256; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> order_cancel_reject_record.party_details_list_req_id[order_cancel_reject_at] = (order_cancel_reject_base + 348 + order_cancel_reject_at + 1) % 256; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> order_cancel_reject_record.order_id[order_cancel_reject_at] = (order_cancel_reject_base + 356 + order_cancel_reject_at + 1) % 256; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> order_cancel_reject_record.transact_time[order_cancel_reject_at] = (order_cancel_reject_base + 364 + order_cancel_reject_at + 1) % 256; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> order_cancel_reject_record.sending_time_epoch[order_cancel_reject_at] = (order_cancel_reject_base + 372 + order_cancel_reject_at + 1) % 256; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> order_cancel_reject_record.order_request_id[order_cancel_reject_at] = (order_cancel_reject_base + 380 + order_cancel_reject_at + 1) % 256; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 5 -> order_cancel_reject_record.location[order_cancel_reject_at] = (order_cancel_reject_base + 388 + order_cancel_reject_at + 1) % 256; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 2 -> order_cancel_reject_record.cxl_rej_reason[order_cancel_reject_at] = (order_cancel_reject_base + 393 + order_cancel_reject_at + 1) % 256; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 2 -> order_cancel_reject_record.delay_duration[order_cancel_reject_at] = (order_cancel_reject_base + 395 + order_cancel_reject_at + 1) % 256; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_record.manual_order_indicator = (order_cancel_reject_base + 397 + 1) % 256;
  order_cancel_reject_record.poss_retrans_flag = (order_cancel_reject_base + 398 + 1) % 256;
  order_cancel_reject_record.split_msg = (order_cancel_reject_base + 399 + 1) % 256;
  order_cancel_reject_record.liquidity_flag = (order_cancel_reject_base + 400 + 1) % 256;
  skip
}

/* Order Cancel Reject to the wire, 401 bytes from where the cursor stands */
inline encode_order_cancel_reject(order_cancel_reject_record) {
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 4 -> wire[at] = order_cancel_reject_record.seq_num[order_cancel_reject_at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> wire[at] = order_cancel_reject_record.uuid[order_cancel_reject_at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 256 -> wire[at] = order_cancel_reject_record.text[order_cancel_reject_at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 40 -> wire[at] = order_cancel_reject_record.exec_id[order_cancel_reject_at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 20 -> wire[at] = order_cancel_reject_record.sender_id[order_cancel_reject_at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 20 -> wire[at] = order_cancel_reject_record.cl_ord_id[order_cancel_reject_at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> wire[at] = order_cancel_reject_record.party_details_list_req_id[order_cancel_reject_at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> wire[at] = order_cancel_reject_record.order_id[order_cancel_reject_at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> wire[at] = order_cancel_reject_record.transact_time[order_cancel_reject_at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> wire[at] = order_cancel_reject_record.sending_time_epoch[order_cancel_reject_at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> wire[at] = order_cancel_reject_record.order_request_id[order_cancel_reject_at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 5 -> wire[at] = order_cancel_reject_record.location[order_cancel_reject_at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 2 -> wire[at] = order_cancel_reject_record.cxl_rej_reason[order_cancel_reject_at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 2 -> wire[at] = order_cancel_reject_record.delay_duration[order_cancel_reject_at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  wire[at] = order_cancel_reject_record.manual_order_indicator; at = at + 1;
  wire[at] = order_cancel_reject_record.poss_retrans_flag; at = at + 1;
  wire[at] = order_cancel_reject_record.split_msg; at = at + 1;
  wire[at] = order_cancel_reject_record.liquidity_flag; at = at + 1;
  skip
}

/* Order Cancel Reject off the wire, 401 bytes from where the cursor stands */
inline decode_order_cancel_reject(order_cancel_reject_record) {
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 4 -> order_cancel_reject_record.seq_num[order_cancel_reject_at] = wire[at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> order_cancel_reject_record.uuid[order_cancel_reject_at] = wire[at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 256 -> order_cancel_reject_record.text[order_cancel_reject_at] = wire[at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 40 -> order_cancel_reject_record.exec_id[order_cancel_reject_at] = wire[at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 20 -> order_cancel_reject_record.sender_id[order_cancel_reject_at] = wire[at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 20 -> order_cancel_reject_record.cl_ord_id[order_cancel_reject_at] = wire[at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> order_cancel_reject_record.party_details_list_req_id[order_cancel_reject_at] = wire[at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> order_cancel_reject_record.order_id[order_cancel_reject_at] = wire[at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> order_cancel_reject_record.transact_time[order_cancel_reject_at] = wire[at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> order_cancel_reject_record.sending_time_epoch[order_cancel_reject_at] = wire[at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> order_cancel_reject_record.order_request_id[order_cancel_reject_at] = wire[at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 5 -> order_cancel_reject_record.location[order_cancel_reject_at] = wire[at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 2 -> order_cancel_reject_record.cxl_rej_reason[order_cancel_reject_at] = wire[at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 2 -> order_cancel_reject_record.delay_duration[order_cancel_reject_at] = wire[at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_record.manual_order_indicator = wire[at]; at = at + 1;
  order_cancel_reject_record.poss_retrans_flag = wire[at]; at = at + 1;
  order_cancel_reject_record.split_msg = wire[at]; at = at + 1;
  order_cancel_reject_record.liquidity_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Cancel Reject is what was written, byte for byte */
inline equal_order_cancel_reject(order_cancel_reject_read, order_cancel_reject_written) {
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 4 -> assert(order_cancel_reject_read.seq_num[order_cancel_reject_at] == order_cancel_reject_written.seq_num[order_cancel_reject_at]); order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> assert(order_cancel_reject_read.uuid[order_cancel_reject_at] == order_cancel_reject_written.uuid[order_cancel_reject_at]); order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 256 -> assert(order_cancel_reject_read.text[order_cancel_reject_at] == order_cancel_reject_written.text[order_cancel_reject_at]); order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 40 -> assert(order_cancel_reject_read.exec_id[order_cancel_reject_at] == order_cancel_reject_written.exec_id[order_cancel_reject_at]); order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 20 -> assert(order_cancel_reject_read.sender_id[order_cancel_reject_at] == order_cancel_reject_written.sender_id[order_cancel_reject_at]); order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 20 -> assert(order_cancel_reject_read.cl_ord_id[order_cancel_reject_at] == order_cancel_reject_written.cl_ord_id[order_cancel_reject_at]); order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> assert(order_cancel_reject_read.party_details_list_req_id[order_cancel_reject_at] == order_cancel_reject_written.party_details_list_req_id[order_cancel_reject_at]); order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> assert(order_cancel_reject_read.order_id[order_cancel_reject_at] == order_cancel_reject_written.order_id[order_cancel_reject_at]); order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> assert(order_cancel_reject_read.transact_time[order_cancel_reject_at] == order_cancel_reject_written.transact_time[order_cancel_reject_at]); order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> assert(order_cancel_reject_read.sending_time_epoch[order_cancel_reject_at] == order_cancel_reject_written.sending_time_epoch[order_cancel_reject_at]); order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 8 -> assert(order_cancel_reject_read.order_request_id[order_cancel_reject_at] == order_cancel_reject_written.order_request_id[order_cancel_reject_at]); order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 5 -> assert(order_cancel_reject_read.location[order_cancel_reject_at] == order_cancel_reject_written.location[order_cancel_reject_at]); order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 2 -> assert(order_cancel_reject_read.cxl_rej_reason[order_cancel_reject_at] == order_cancel_reject_written.cxl_rej_reason[order_cancel_reject_at]); order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 2 -> assert(order_cancel_reject_read.delay_duration[order_cancel_reject_at] == order_cancel_reject_written.delay_duration[order_cancel_reject_at]); order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  assert(order_cancel_reject_read.manual_order_indicator == order_cancel_reject_written.manual_order_indicator);
  assert(order_cancel_reject_read.poss_retrans_flag == order_cancel_reject_written.poss_retrans_flag);
  assert(order_cancel_reject_read.split_msg == order_cancel_reject_written.split_msg);
  assert(order_cancel_reject_read.liquidity_flag == order_cancel_reject_written.liquidity_flag);
  skip
}

/* ---- Order Cancel Replace Reject: 401 bytes ---------------------------------- */

/* The Order Cancel Replace Reject message is issued upon receipt of a cancel replace request message that cannot be honored. */
typedef OrderCancelReplaceReject {
  byte seq_num[4];
  byte uuid[8];
  byte text[256];
  byte exec_id[40];
  byte sender_id[20];
  byte cl_ord_id[20];
  byte party_details_list_req_id[8];
  byte order_id[8];
  byte transact_time[8];
  byte sending_time_epoch[8];
  byte order_request_id[8];
  byte location[5];
  byte cxl_rej_reason[2];
  byte delay_duration[2];
  byte manual_order_indicator;
  byte poss_retrans_flag;
  byte split_msg;
  byte liquidity_flag
};

int order_cancel_replace_reject_at;

/* every byte of Order Cancel Replace Reject set to one value */
inline fill_order_cancel_replace_reject(order_cancel_replace_reject_record, order_cancel_replace_reject_value) {
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 4 -> order_cancel_replace_reject_record.seq_num[order_cancel_replace_reject_at] = order_cancel_replace_reject_value; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> order_cancel_replace_reject_record.uuid[order_cancel_replace_reject_at] = order_cancel_replace_reject_value; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 256 -> order_cancel_replace_reject_record.text[order_cancel_replace_reject_at] = order_cancel_replace_reject_value; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 40 -> order_cancel_replace_reject_record.exec_id[order_cancel_replace_reject_at] = order_cancel_replace_reject_value; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 20 -> order_cancel_replace_reject_record.sender_id[order_cancel_replace_reject_at] = order_cancel_replace_reject_value; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 20 -> order_cancel_replace_reject_record.cl_ord_id[order_cancel_replace_reject_at] = order_cancel_replace_reject_value; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> order_cancel_replace_reject_record.party_details_list_req_id[order_cancel_replace_reject_at] = order_cancel_replace_reject_value; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> order_cancel_replace_reject_record.order_id[order_cancel_replace_reject_at] = order_cancel_replace_reject_value; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> order_cancel_replace_reject_record.transact_time[order_cancel_replace_reject_at] = order_cancel_replace_reject_value; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> order_cancel_replace_reject_record.sending_time_epoch[order_cancel_replace_reject_at] = order_cancel_replace_reject_value; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> order_cancel_replace_reject_record.order_request_id[order_cancel_replace_reject_at] = order_cancel_replace_reject_value; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 5 -> order_cancel_replace_reject_record.location[order_cancel_replace_reject_at] = order_cancel_replace_reject_value; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 2 -> order_cancel_replace_reject_record.cxl_rej_reason[order_cancel_replace_reject_at] = order_cancel_replace_reject_value; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 2 -> order_cancel_replace_reject_record.delay_duration[order_cancel_replace_reject_at] = order_cancel_replace_reject_value; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_record.manual_order_indicator = order_cancel_replace_reject_value;
  order_cancel_replace_reject_record.poss_retrans_flag = order_cancel_replace_reject_value;
  order_cancel_replace_reject_record.split_msg = order_cancel_replace_reject_value;
  order_cancel_replace_reject_record.liquidity_flag = order_cancel_replace_reject_value;
  skip
}

/* each byte of Order Cancel Replace Reject set to where it lies, so a field read out of place says so */
inline ramp_order_cancel_replace_reject(order_cancel_replace_reject_record, order_cancel_replace_reject_base) {
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 4 -> order_cancel_replace_reject_record.seq_num[order_cancel_replace_reject_at] = (order_cancel_replace_reject_base + 0 + order_cancel_replace_reject_at + 1) % 256; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> order_cancel_replace_reject_record.uuid[order_cancel_replace_reject_at] = (order_cancel_replace_reject_base + 4 + order_cancel_replace_reject_at + 1) % 256; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 256 -> order_cancel_replace_reject_record.text[order_cancel_replace_reject_at] = (order_cancel_replace_reject_base + 12 + order_cancel_replace_reject_at + 1) % 256; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 40 -> order_cancel_replace_reject_record.exec_id[order_cancel_replace_reject_at] = (order_cancel_replace_reject_base + 268 + order_cancel_replace_reject_at + 1) % 256; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 20 -> order_cancel_replace_reject_record.sender_id[order_cancel_replace_reject_at] = (order_cancel_replace_reject_base + 308 + order_cancel_replace_reject_at + 1) % 256; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 20 -> order_cancel_replace_reject_record.cl_ord_id[order_cancel_replace_reject_at] = (order_cancel_replace_reject_base + 328 + order_cancel_replace_reject_at + 1) % 256; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> order_cancel_replace_reject_record.party_details_list_req_id[order_cancel_replace_reject_at] = (order_cancel_replace_reject_base + 348 + order_cancel_replace_reject_at + 1) % 256; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> order_cancel_replace_reject_record.order_id[order_cancel_replace_reject_at] = (order_cancel_replace_reject_base + 356 + order_cancel_replace_reject_at + 1) % 256; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> order_cancel_replace_reject_record.transact_time[order_cancel_replace_reject_at] = (order_cancel_replace_reject_base + 364 + order_cancel_replace_reject_at + 1) % 256; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> order_cancel_replace_reject_record.sending_time_epoch[order_cancel_replace_reject_at] = (order_cancel_replace_reject_base + 372 + order_cancel_replace_reject_at + 1) % 256; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> order_cancel_replace_reject_record.order_request_id[order_cancel_replace_reject_at] = (order_cancel_replace_reject_base + 380 + order_cancel_replace_reject_at + 1) % 256; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 5 -> order_cancel_replace_reject_record.location[order_cancel_replace_reject_at] = (order_cancel_replace_reject_base + 388 + order_cancel_replace_reject_at + 1) % 256; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 2 -> order_cancel_replace_reject_record.cxl_rej_reason[order_cancel_replace_reject_at] = (order_cancel_replace_reject_base + 393 + order_cancel_replace_reject_at + 1) % 256; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 2 -> order_cancel_replace_reject_record.delay_duration[order_cancel_replace_reject_at] = (order_cancel_replace_reject_base + 395 + order_cancel_replace_reject_at + 1) % 256; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_record.manual_order_indicator = (order_cancel_replace_reject_base + 397 + 1) % 256;
  order_cancel_replace_reject_record.poss_retrans_flag = (order_cancel_replace_reject_base + 398 + 1) % 256;
  order_cancel_replace_reject_record.split_msg = (order_cancel_replace_reject_base + 399 + 1) % 256;
  order_cancel_replace_reject_record.liquidity_flag = (order_cancel_replace_reject_base + 400 + 1) % 256;
  skip
}

/* Order Cancel Replace Reject to the wire, 401 bytes from where the cursor stands */
inline encode_order_cancel_replace_reject(order_cancel_replace_reject_record) {
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 4 -> wire[at] = order_cancel_replace_reject_record.seq_num[order_cancel_replace_reject_at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> wire[at] = order_cancel_replace_reject_record.uuid[order_cancel_replace_reject_at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 256 -> wire[at] = order_cancel_replace_reject_record.text[order_cancel_replace_reject_at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 40 -> wire[at] = order_cancel_replace_reject_record.exec_id[order_cancel_replace_reject_at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 20 -> wire[at] = order_cancel_replace_reject_record.sender_id[order_cancel_replace_reject_at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 20 -> wire[at] = order_cancel_replace_reject_record.cl_ord_id[order_cancel_replace_reject_at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> wire[at] = order_cancel_replace_reject_record.party_details_list_req_id[order_cancel_replace_reject_at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> wire[at] = order_cancel_replace_reject_record.order_id[order_cancel_replace_reject_at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> wire[at] = order_cancel_replace_reject_record.transact_time[order_cancel_replace_reject_at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> wire[at] = order_cancel_replace_reject_record.sending_time_epoch[order_cancel_replace_reject_at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> wire[at] = order_cancel_replace_reject_record.order_request_id[order_cancel_replace_reject_at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 5 -> wire[at] = order_cancel_replace_reject_record.location[order_cancel_replace_reject_at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 2 -> wire[at] = order_cancel_replace_reject_record.cxl_rej_reason[order_cancel_replace_reject_at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 2 -> wire[at] = order_cancel_replace_reject_record.delay_duration[order_cancel_replace_reject_at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  wire[at] = order_cancel_replace_reject_record.manual_order_indicator; at = at + 1;
  wire[at] = order_cancel_replace_reject_record.poss_retrans_flag; at = at + 1;
  wire[at] = order_cancel_replace_reject_record.split_msg; at = at + 1;
  wire[at] = order_cancel_replace_reject_record.liquidity_flag; at = at + 1;
  skip
}

/* Order Cancel Replace Reject off the wire, 401 bytes from where the cursor stands */
inline decode_order_cancel_replace_reject(order_cancel_replace_reject_record) {
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 4 -> order_cancel_replace_reject_record.seq_num[order_cancel_replace_reject_at] = wire[at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> order_cancel_replace_reject_record.uuid[order_cancel_replace_reject_at] = wire[at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 256 -> order_cancel_replace_reject_record.text[order_cancel_replace_reject_at] = wire[at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 40 -> order_cancel_replace_reject_record.exec_id[order_cancel_replace_reject_at] = wire[at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 20 -> order_cancel_replace_reject_record.sender_id[order_cancel_replace_reject_at] = wire[at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 20 -> order_cancel_replace_reject_record.cl_ord_id[order_cancel_replace_reject_at] = wire[at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> order_cancel_replace_reject_record.party_details_list_req_id[order_cancel_replace_reject_at] = wire[at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> order_cancel_replace_reject_record.order_id[order_cancel_replace_reject_at] = wire[at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> order_cancel_replace_reject_record.transact_time[order_cancel_replace_reject_at] = wire[at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> order_cancel_replace_reject_record.sending_time_epoch[order_cancel_replace_reject_at] = wire[at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> order_cancel_replace_reject_record.order_request_id[order_cancel_replace_reject_at] = wire[at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 5 -> order_cancel_replace_reject_record.location[order_cancel_replace_reject_at] = wire[at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 2 -> order_cancel_replace_reject_record.cxl_rej_reason[order_cancel_replace_reject_at] = wire[at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 2 -> order_cancel_replace_reject_record.delay_duration[order_cancel_replace_reject_at] = wire[at]; at = at + 1; order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_record.manual_order_indicator = wire[at]; at = at + 1;
  order_cancel_replace_reject_record.poss_retrans_flag = wire[at]; at = at + 1;
  order_cancel_replace_reject_record.split_msg = wire[at]; at = at + 1;
  order_cancel_replace_reject_record.liquidity_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Cancel Replace Reject is what was written, byte for byte */
inline equal_order_cancel_replace_reject(order_cancel_replace_reject_read, order_cancel_replace_reject_written) {
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 4 -> assert(order_cancel_replace_reject_read.seq_num[order_cancel_replace_reject_at] == order_cancel_replace_reject_written.seq_num[order_cancel_replace_reject_at]); order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> assert(order_cancel_replace_reject_read.uuid[order_cancel_replace_reject_at] == order_cancel_replace_reject_written.uuid[order_cancel_replace_reject_at]); order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 256 -> assert(order_cancel_replace_reject_read.text[order_cancel_replace_reject_at] == order_cancel_replace_reject_written.text[order_cancel_replace_reject_at]); order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 40 -> assert(order_cancel_replace_reject_read.exec_id[order_cancel_replace_reject_at] == order_cancel_replace_reject_written.exec_id[order_cancel_replace_reject_at]); order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 20 -> assert(order_cancel_replace_reject_read.sender_id[order_cancel_replace_reject_at] == order_cancel_replace_reject_written.sender_id[order_cancel_replace_reject_at]); order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 20 -> assert(order_cancel_replace_reject_read.cl_ord_id[order_cancel_replace_reject_at] == order_cancel_replace_reject_written.cl_ord_id[order_cancel_replace_reject_at]); order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> assert(order_cancel_replace_reject_read.party_details_list_req_id[order_cancel_replace_reject_at] == order_cancel_replace_reject_written.party_details_list_req_id[order_cancel_replace_reject_at]); order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> assert(order_cancel_replace_reject_read.order_id[order_cancel_replace_reject_at] == order_cancel_replace_reject_written.order_id[order_cancel_replace_reject_at]); order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> assert(order_cancel_replace_reject_read.transact_time[order_cancel_replace_reject_at] == order_cancel_replace_reject_written.transact_time[order_cancel_replace_reject_at]); order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> assert(order_cancel_replace_reject_read.sending_time_epoch[order_cancel_replace_reject_at] == order_cancel_replace_reject_written.sending_time_epoch[order_cancel_replace_reject_at]); order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 8 -> assert(order_cancel_replace_reject_read.order_request_id[order_cancel_replace_reject_at] == order_cancel_replace_reject_written.order_request_id[order_cancel_replace_reject_at]); order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 5 -> assert(order_cancel_replace_reject_read.location[order_cancel_replace_reject_at] == order_cancel_replace_reject_written.location[order_cancel_replace_reject_at]); order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 2 -> assert(order_cancel_replace_reject_read.cxl_rej_reason[order_cancel_replace_reject_at] == order_cancel_replace_reject_written.cxl_rej_reason[order_cancel_replace_reject_at]); order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  order_cancel_replace_reject_at = 0;
  do
  :: order_cancel_replace_reject_at < 2 -> assert(order_cancel_replace_reject_read.delay_duration[order_cancel_replace_reject_at] == order_cancel_replace_reject_written.delay_duration[order_cancel_replace_reject_at]); order_cancel_replace_reject_at = order_cancel_replace_reject_at + 1
  :: else -> break
  od;
  assert(order_cancel_replace_reject_read.manual_order_indicator == order_cancel_replace_reject_written.manual_order_indicator);
  assert(order_cancel_replace_reject_read.poss_retrans_flag == order_cancel_replace_reject_written.poss_retrans_flag);
  assert(order_cancel_replace_reject_read.split_msg == order_cancel_replace_reject_written.split_msg);
  assert(order_cancel_replace_reject_read.liquidity_flag == order_cancel_replace_reject_written.liquidity_flag);
  skip
}

/* ---- Request For Quote Ack: 350 bytes ---------------------------------------- */

/* Request for Quote Acknowledgment message is used in response to a Request for Quote message to either accept it or reject it. */
typedef RequestForQuoteAck {
  byte seq_num[4];
  byte uuid[8];
  byte text[256];
  byte sender_id[20];
  byte exchange_quote_req_id[17];
  byte party_details_list_req_id[8];
  byte request_time[8];
  byte sending_time_epoch[8];
  byte quote_req_id[8];
  byte location[5];
  byte quote_reject_reason[2];
  byte delay_duration[2];
  byte quote_ack_status;
  byte manual_order_indicator;
  byte split_msg;
  byte poss_retrans_flag
};

int request_for_quote_ack_at;

/* every byte of Request For Quote Ack set to one value */
inline fill_request_for_quote_ack(request_for_quote_ack_record, request_for_quote_ack_value) {
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 4 -> request_for_quote_ack_record.seq_num[request_for_quote_ack_at] = request_for_quote_ack_value; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 8 -> request_for_quote_ack_record.uuid[request_for_quote_ack_at] = request_for_quote_ack_value; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 256 -> request_for_quote_ack_record.text[request_for_quote_ack_at] = request_for_quote_ack_value; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 20 -> request_for_quote_ack_record.sender_id[request_for_quote_ack_at] = request_for_quote_ack_value; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 17 -> request_for_quote_ack_record.exchange_quote_req_id[request_for_quote_ack_at] = request_for_quote_ack_value; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 8 -> request_for_quote_ack_record.party_details_list_req_id[request_for_quote_ack_at] = request_for_quote_ack_value; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 8 -> request_for_quote_ack_record.request_time[request_for_quote_ack_at] = request_for_quote_ack_value; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 8 -> request_for_quote_ack_record.sending_time_epoch[request_for_quote_ack_at] = request_for_quote_ack_value; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 8 -> request_for_quote_ack_record.quote_req_id[request_for_quote_ack_at] = request_for_quote_ack_value; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 5 -> request_for_quote_ack_record.location[request_for_quote_ack_at] = request_for_quote_ack_value; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 2 -> request_for_quote_ack_record.quote_reject_reason[request_for_quote_ack_at] = request_for_quote_ack_value; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 2 -> request_for_quote_ack_record.delay_duration[request_for_quote_ack_at] = request_for_quote_ack_value; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_record.quote_ack_status = request_for_quote_ack_value;
  request_for_quote_ack_record.manual_order_indicator = request_for_quote_ack_value;
  request_for_quote_ack_record.split_msg = request_for_quote_ack_value;
  request_for_quote_ack_record.poss_retrans_flag = request_for_quote_ack_value;
  skip
}

/* each byte of Request For Quote Ack set to where it lies, so a field read out of place says so */
inline ramp_request_for_quote_ack(request_for_quote_ack_record, request_for_quote_ack_base) {
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 4 -> request_for_quote_ack_record.seq_num[request_for_quote_ack_at] = (request_for_quote_ack_base + 0 + request_for_quote_ack_at + 1) % 256; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 8 -> request_for_quote_ack_record.uuid[request_for_quote_ack_at] = (request_for_quote_ack_base + 4 + request_for_quote_ack_at + 1) % 256; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 256 -> request_for_quote_ack_record.text[request_for_quote_ack_at] = (request_for_quote_ack_base + 12 + request_for_quote_ack_at + 1) % 256; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 20 -> request_for_quote_ack_record.sender_id[request_for_quote_ack_at] = (request_for_quote_ack_base + 268 + request_for_quote_ack_at + 1) % 256; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 17 -> request_for_quote_ack_record.exchange_quote_req_id[request_for_quote_ack_at] = (request_for_quote_ack_base + 288 + request_for_quote_ack_at + 1) % 256; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 8 -> request_for_quote_ack_record.party_details_list_req_id[request_for_quote_ack_at] = (request_for_quote_ack_base + 305 + request_for_quote_ack_at + 1) % 256; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 8 -> request_for_quote_ack_record.request_time[request_for_quote_ack_at] = (request_for_quote_ack_base + 313 + request_for_quote_ack_at + 1) % 256; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 8 -> request_for_quote_ack_record.sending_time_epoch[request_for_quote_ack_at] = (request_for_quote_ack_base + 321 + request_for_quote_ack_at + 1) % 256; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 8 -> request_for_quote_ack_record.quote_req_id[request_for_quote_ack_at] = (request_for_quote_ack_base + 329 + request_for_quote_ack_at + 1) % 256; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 5 -> request_for_quote_ack_record.location[request_for_quote_ack_at] = (request_for_quote_ack_base + 337 + request_for_quote_ack_at + 1) % 256; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 2 -> request_for_quote_ack_record.quote_reject_reason[request_for_quote_ack_at] = (request_for_quote_ack_base + 342 + request_for_quote_ack_at + 1) % 256; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 2 -> request_for_quote_ack_record.delay_duration[request_for_quote_ack_at] = (request_for_quote_ack_base + 344 + request_for_quote_ack_at + 1) % 256; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_record.quote_ack_status = (request_for_quote_ack_base + 346 + 1) % 256;
  request_for_quote_ack_record.manual_order_indicator = (request_for_quote_ack_base + 347 + 1) % 256;
  request_for_quote_ack_record.split_msg = (request_for_quote_ack_base + 348 + 1) % 256;
  request_for_quote_ack_record.poss_retrans_flag = (request_for_quote_ack_base + 349 + 1) % 256;
  skip
}

/* Request For Quote Ack to the wire, 350 bytes from where the cursor stands */
inline encode_request_for_quote_ack(request_for_quote_ack_record) {
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 4 -> wire[at] = request_for_quote_ack_record.seq_num[request_for_quote_ack_at]; at = at + 1; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 8 -> wire[at] = request_for_quote_ack_record.uuid[request_for_quote_ack_at]; at = at + 1; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 256 -> wire[at] = request_for_quote_ack_record.text[request_for_quote_ack_at]; at = at + 1; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 20 -> wire[at] = request_for_quote_ack_record.sender_id[request_for_quote_ack_at]; at = at + 1; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 17 -> wire[at] = request_for_quote_ack_record.exchange_quote_req_id[request_for_quote_ack_at]; at = at + 1; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 8 -> wire[at] = request_for_quote_ack_record.party_details_list_req_id[request_for_quote_ack_at]; at = at + 1; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 8 -> wire[at] = request_for_quote_ack_record.request_time[request_for_quote_ack_at]; at = at + 1; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 8 -> wire[at] = request_for_quote_ack_record.sending_time_epoch[request_for_quote_ack_at]; at = at + 1; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 8 -> wire[at] = request_for_quote_ack_record.quote_req_id[request_for_quote_ack_at]; at = at + 1; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 5 -> wire[at] = request_for_quote_ack_record.location[request_for_quote_ack_at]; at = at + 1; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 2 -> wire[at] = request_for_quote_ack_record.quote_reject_reason[request_for_quote_ack_at]; at = at + 1; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 2 -> wire[at] = request_for_quote_ack_record.delay_duration[request_for_quote_ack_at]; at = at + 1; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  wire[at] = request_for_quote_ack_record.quote_ack_status; at = at + 1;
  wire[at] = request_for_quote_ack_record.manual_order_indicator; at = at + 1;
  wire[at] = request_for_quote_ack_record.split_msg; at = at + 1;
  wire[at] = request_for_quote_ack_record.poss_retrans_flag; at = at + 1;
  skip
}

/* Request For Quote Ack off the wire, 350 bytes from where the cursor stands */
inline decode_request_for_quote_ack(request_for_quote_ack_record) {
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 4 -> request_for_quote_ack_record.seq_num[request_for_quote_ack_at] = wire[at]; at = at + 1; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 8 -> request_for_quote_ack_record.uuid[request_for_quote_ack_at] = wire[at]; at = at + 1; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 256 -> request_for_quote_ack_record.text[request_for_quote_ack_at] = wire[at]; at = at + 1; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 20 -> request_for_quote_ack_record.sender_id[request_for_quote_ack_at] = wire[at]; at = at + 1; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 17 -> request_for_quote_ack_record.exchange_quote_req_id[request_for_quote_ack_at] = wire[at]; at = at + 1; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 8 -> request_for_quote_ack_record.party_details_list_req_id[request_for_quote_ack_at] = wire[at]; at = at + 1; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 8 -> request_for_quote_ack_record.request_time[request_for_quote_ack_at] = wire[at]; at = at + 1; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 8 -> request_for_quote_ack_record.sending_time_epoch[request_for_quote_ack_at] = wire[at]; at = at + 1; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 8 -> request_for_quote_ack_record.quote_req_id[request_for_quote_ack_at] = wire[at]; at = at + 1; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 5 -> request_for_quote_ack_record.location[request_for_quote_ack_at] = wire[at]; at = at + 1; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 2 -> request_for_quote_ack_record.quote_reject_reason[request_for_quote_ack_at] = wire[at]; at = at + 1; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 2 -> request_for_quote_ack_record.delay_duration[request_for_quote_ack_at] = wire[at]; at = at + 1; request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_record.quote_ack_status = wire[at]; at = at + 1;
  request_for_quote_ack_record.manual_order_indicator = wire[at]; at = at + 1;
  request_for_quote_ack_record.split_msg = wire[at]; at = at + 1;
  request_for_quote_ack_record.poss_retrans_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Request For Quote Ack is what was written, byte for byte */
inline equal_request_for_quote_ack(request_for_quote_ack_read, request_for_quote_ack_written) {
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 4 -> assert(request_for_quote_ack_read.seq_num[request_for_quote_ack_at] == request_for_quote_ack_written.seq_num[request_for_quote_ack_at]); request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 8 -> assert(request_for_quote_ack_read.uuid[request_for_quote_ack_at] == request_for_quote_ack_written.uuid[request_for_quote_ack_at]); request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 256 -> assert(request_for_quote_ack_read.text[request_for_quote_ack_at] == request_for_quote_ack_written.text[request_for_quote_ack_at]); request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 20 -> assert(request_for_quote_ack_read.sender_id[request_for_quote_ack_at] == request_for_quote_ack_written.sender_id[request_for_quote_ack_at]); request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 17 -> assert(request_for_quote_ack_read.exchange_quote_req_id[request_for_quote_ack_at] == request_for_quote_ack_written.exchange_quote_req_id[request_for_quote_ack_at]); request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 8 -> assert(request_for_quote_ack_read.party_details_list_req_id[request_for_quote_ack_at] == request_for_quote_ack_written.party_details_list_req_id[request_for_quote_ack_at]); request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 8 -> assert(request_for_quote_ack_read.request_time[request_for_quote_ack_at] == request_for_quote_ack_written.request_time[request_for_quote_ack_at]); request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 8 -> assert(request_for_quote_ack_read.sending_time_epoch[request_for_quote_ack_at] == request_for_quote_ack_written.sending_time_epoch[request_for_quote_ack_at]); request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 8 -> assert(request_for_quote_ack_read.quote_req_id[request_for_quote_ack_at] == request_for_quote_ack_written.quote_req_id[request_for_quote_ack_at]); request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 5 -> assert(request_for_quote_ack_read.location[request_for_quote_ack_at] == request_for_quote_ack_written.location[request_for_quote_ack_at]); request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 2 -> assert(request_for_quote_ack_read.quote_reject_reason[request_for_quote_ack_at] == request_for_quote_ack_written.quote_reject_reason[request_for_quote_ack_at]); request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  request_for_quote_ack_at = 0;
  do
  :: request_for_quote_ack_at < 2 -> assert(request_for_quote_ack_read.delay_duration[request_for_quote_ack_at] == request_for_quote_ack_written.delay_duration[request_for_quote_ack_at]); request_for_quote_ack_at = request_for_quote_ack_at + 1
  :: else -> break
  od;
  assert(request_for_quote_ack_read.quote_ack_status == request_for_quote_ack_written.quote_ack_status);
  assert(request_for_quote_ack_read.manual_order_indicator == request_for_quote_ack_written.manual_order_indicator);
  assert(request_for_quote_ack_read.split_msg == request_for_quote_ack_written.split_msg);
  assert(request_for_quote_ack_read.poss_retrans_flag == request_for_quote_ack_written.poss_retrans_flag);
  skip
}

/* ---- Maturity Month Year: 5 bytes -------------------------------------------- */

/* SecurityDefinitionResponse */
typedef MaturityMonthYear {
  byte year[2];
  byte month;
  byte day;
  byte week
};

int maturity_month_year_at;

/* every byte of Maturity Month Year set to one value */
inline fill_maturity_month_year(maturity_month_year_record, maturity_month_year_value) {
  maturity_month_year_at = 0;
  do
  :: maturity_month_year_at < 2 -> maturity_month_year_record.year[maturity_month_year_at] = maturity_month_year_value; maturity_month_year_at = maturity_month_year_at + 1
  :: else -> break
  od;
  maturity_month_year_record.month = maturity_month_year_value;
  maturity_month_year_record.day = maturity_month_year_value;
  maturity_month_year_record.week = maturity_month_year_value;
  skip
}

/* each byte of Maturity Month Year set to where it lies, so a field read out of place says so */
inline ramp_maturity_month_year(maturity_month_year_record, maturity_month_year_base) {
  maturity_month_year_at = 0;
  do
  :: maturity_month_year_at < 2 -> maturity_month_year_record.year[maturity_month_year_at] = (maturity_month_year_base + 0 + maturity_month_year_at + 1) % 256; maturity_month_year_at = maturity_month_year_at + 1
  :: else -> break
  od;
  maturity_month_year_record.month = (maturity_month_year_base + 2 + 1) % 256;
  maturity_month_year_record.day = (maturity_month_year_base + 3 + 1) % 256;
  maturity_month_year_record.week = (maturity_month_year_base + 4 + 1) % 256;
  skip
}

/* Maturity Month Year to the wire, 5 bytes from where the cursor stands */
inline encode_maturity_month_year(maturity_month_year_record) {
  maturity_month_year_at = 0;
  do
  :: maturity_month_year_at < 2 -> wire[at] = maturity_month_year_record.year[maturity_month_year_at]; at = at + 1; maturity_month_year_at = maturity_month_year_at + 1
  :: else -> break
  od;
  wire[at] = maturity_month_year_record.month; at = at + 1;
  wire[at] = maturity_month_year_record.day; at = at + 1;
  wire[at] = maturity_month_year_record.week; at = at + 1;
  skip
}

/* Maturity Month Year off the wire, 5 bytes from where the cursor stands */
inline decode_maturity_month_year(maturity_month_year_record) {
  maturity_month_year_at = 0;
  do
  :: maturity_month_year_at < 2 -> maturity_month_year_record.year[maturity_month_year_at] = wire[at]; at = at + 1; maturity_month_year_at = maturity_month_year_at + 1
  :: else -> break
  od;
  maturity_month_year_record.month = wire[at]; at = at + 1;
  maturity_month_year_record.day = wire[at]; at = at + 1;
  maturity_month_year_record.week = wire[at]; at = at + 1;
  skip
}

/* what was read of Maturity Month Year is what was written, byte for byte */
inline equal_maturity_month_year(maturity_month_year_read, maturity_month_year_written) {
  maturity_month_year_at = 0;
  do
  :: maturity_month_year_at < 2 -> assert(maturity_month_year_read.year[maturity_month_year_at] == maturity_month_year_written.year[maturity_month_year_at]); maturity_month_year_at = maturity_month_year_at + 1
  :: else -> break
  od;
  assert(maturity_month_year_read.month == maturity_month_year_written.month);
  assert(maturity_month_year_read.day == maturity_month_year_written.day);
  assert(maturity_month_year_read.week == maturity_month_year_written.week);
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

/* Negotiation Reject: encoded, read back, and compared */
proctype check_negotiation_reject() {
  NegotiationReject negotiation_reject_sent;
  NegotiationReject negotiation_reject_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_negotiation_reject(negotiation_reject_sent, 0)
  :: pattern == 1 -> fill_negotiation_reject(negotiation_reject_sent, 32)
  :: pattern == 2 -> fill_negotiation_reject(negotiation_reject_sent, 255)
  :: else -> ramp_negotiation_reject(negotiation_reject_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_negotiation_reject(negotiation_reject_sent);
    assert(at == 68);
    at = 0;
    decode_negotiation_reject(negotiation_reject_got);
    assert(at == 68);
    equal_negotiation_reject(negotiation_reject_got, negotiation_reject_sent)
  }
}

/* Establishment Ack: encoded, read back, and compared */
proctype check_establishment_ack() {
  EstablishmentAck establishment_ack_sent;
  EstablishmentAck establishment_ack_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_establishment_ack(establishment_ack_sent, 0)
  :: pattern == 1 -> fill_establishment_ack(establishment_ack_sent, 32)
  :: pattern == 2 -> fill_establishment_ack(establishment_ack_sent, 255)
  :: else -> ramp_establishment_ack(establishment_ack_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_establishment_ack(establishment_ack_sent);
    assert(at == 38);
    at = 0;
    decode_establishment_ack(establishment_ack_got);
    assert(at == 38);
    equal_establishment_ack(establishment_ack_got, establishment_ack_sent)
  }
}

/* Establishment Reject: encoded, read back, and compared */
proctype check_establishment_reject() {
  EstablishmentReject establishment_reject_sent;
  EstablishmentReject establishment_reject_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_establishment_reject(establishment_reject_sent, 0)
  :: pattern == 1 -> fill_establishment_reject(establishment_reject_sent, 32)
  :: pattern == 2 -> fill_establishment_reject(establishment_reject_sent, 255)
  :: else -> ramp_establishment_reject(establishment_reject_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_establishment_reject(establishment_reject_sent);
    assert(at == 72);
    at = 0;
    decode_establishment_reject(establishment_reject_got);
    assert(at == 72);
    equal_establishment_reject(establishment_reject_got, establishment_reject_sent)
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

/* Retransmission: encoded, read back, and compared */
proctype check_retransmission() {
  Retransmission retransmission_sent;
  Retransmission retransmission_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmission(retransmission_sent, 0)
  :: pattern == 1 -> fill_retransmission(retransmission_sent, 32)
  :: pattern == 2 -> fill_retransmission(retransmission_sent, 255)
  :: else -> ramp_retransmission(retransmission_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmission(retransmission_sent);
    assert(at == 31);
    at = 0;
    decode_retransmission(retransmission_got);
    assert(at == 31);
    equal_retransmission(retransmission_got, retransmission_sent)
  }
}

/* Retransmit Reject: encoded, read back, and compared */
proctype check_retransmit_reject() {
  RetransmitReject retransmit_reject_sent;
  RetransmitReject retransmit_reject_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmit_reject(retransmit_reject_sent, 0)
  :: pattern == 1 -> fill_retransmit_reject(retransmit_reject_sent, 32)
  :: pattern == 2 -> fill_retransmit_reject(retransmit_reject_sent, 255)
  :: else -> ramp_retransmit_reject(retransmit_reject_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmit_reject(retransmit_reject_sent);
    assert(at == 75);
    at = 0;
    decode_retransmit_reject(retransmit_reject_got);
    assert(at == 75);
    equal_retransmit_reject(retransmit_reject_got, retransmit_reject_sent)
  }
}

/* Not Applied: encoded, read back, and compared */
proctype check_not_applied() {
  NotApplied not_applied_sent;
  NotApplied not_applied_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_not_applied(not_applied_sent, 0)
  :: pattern == 1 -> fill_not_applied(not_applied_sent, 32)
  :: pattern == 2 -> fill_not_applied(not_applied_sent, 255)
  :: else -> ramp_not_applied(not_applied_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_not_applied(not_applied_sent);
    assert(at == 17);
    at = 0;
    decode_not_applied(not_applied_got);
    assert(at == 17);
    equal_not_applied(not_applied_got, not_applied_sent)
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

/* Business Reject: encoded, read back, and compared */
proctype check_business_reject() {
  BusinessReject business_reject_sent;
  BusinessReject business_reject_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_business_reject(business_reject_sent, 0)
  :: pattern == 1 -> fill_business_reject(business_reject_sent, 32)
  :: pattern == 2 -> fill_business_reject(business_reject_sent, 255)
  :: else -> ramp_business_reject(business_reject_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_business_reject(business_reject_sent);
    assert(at == 330);
    at = 0;
    decode_business_reject(business_reject_got);
    assert(at == 330);
    equal_business_reject(business_reject_got, business_reject_sent)
  }
}

/* Volatility: encoded, read back, and compared */
proctype check_volatility() {
  Volatility volatility_sent;
  Volatility volatility_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_volatility(volatility_sent, 0)
  :: pattern == 1 -> fill_volatility(volatility_sent, 32)
  :: pattern == 2 -> fill_volatility(volatility_sent, 255)
  :: else -> ramp_volatility(volatility_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_volatility(volatility_sent);
    assert(at == 9);
    at = 0;
    decode_volatility(volatility_got);
    assert(at == 9);
    equal_volatility(volatility_got, volatility_sent)
  }
}

/* Option Delta: encoded, read back, and compared */
proctype check_option_delta() {
  OptionDelta option_delta_sent;
  OptionDelta option_delta_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_option_delta(option_delta_sent, 0)
  :: pattern == 1 -> fill_option_delta(option_delta_sent, 32)
  :: pattern == 2 -> fill_option_delta(option_delta_sent, 255)
  :: else -> ramp_option_delta(option_delta_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_option_delta(option_delta_sent);
    assert(at == 5);
    at = 0;
    decode_option_delta(option_delta_got);
    assert(at == 5);
    equal_option_delta(option_delta_got, option_delta_sent)
  }
}

/* Time To Expiration: encoded, read back, and compared */
proctype check_time_to_expiration() {
  TimeToExpiration time_to_expiration_sent;
  TimeToExpiration time_to_expiration_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_time_to_expiration(time_to_expiration_sent, 0)
  :: pattern == 1 -> fill_time_to_expiration(time_to_expiration_sent, 32)
  :: pattern == 2 -> fill_time_to_expiration(time_to_expiration_sent, 255)
  :: else -> ramp_time_to_expiration(time_to_expiration_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_time_to_expiration(time_to_expiration_sent);
    assert(at == 5);
    at = 0;
    decode_time_to_expiration(time_to_expiration_got);
    assert(at == 5);
    equal_time_to_expiration(time_to_expiration_got, time_to_expiration_sent)
  }
}

/* Risk Free Rate: encoded, read back, and compared */
proctype check_risk_free_rate() {
  RiskFreeRate risk_free_rate_sent;
  RiskFreeRate risk_free_rate_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_risk_free_rate(risk_free_rate_sent, 0)
  :: pattern == 1 -> fill_risk_free_rate(risk_free_rate_sent, 32)
  :: pattern == 2 -> fill_risk_free_rate(risk_free_rate_sent, 255)
  :: else -> ramp_risk_free_rate(risk_free_rate_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_risk_free_rate(risk_free_rate_sent);
    assert(at == 5);
    at = 0;
    decode_risk_free_rate(risk_free_rate_got);
    assert(at == 5);
    equal_risk_free_rate(risk_free_rate_got, risk_free_rate_sent)
  }
}

/* Order Cancel Reject: encoded, read back, and compared */
proctype check_order_cancel_reject() {
  OrderCancelReject order_cancel_reject_sent;
  OrderCancelReject order_cancel_reject_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancel_reject(order_cancel_reject_sent, 0)
  :: pattern == 1 -> fill_order_cancel_reject(order_cancel_reject_sent, 32)
  :: pattern == 2 -> fill_order_cancel_reject(order_cancel_reject_sent, 255)
  :: else -> ramp_order_cancel_reject(order_cancel_reject_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancel_reject(order_cancel_reject_sent);
    assert(at == 401);
    at = 0;
    decode_order_cancel_reject(order_cancel_reject_got);
    assert(at == 401);
    equal_order_cancel_reject(order_cancel_reject_got, order_cancel_reject_sent)
  }
}

/* Order Cancel Replace Reject: encoded, read back, and compared */
proctype check_order_cancel_replace_reject() {
  OrderCancelReplaceReject order_cancel_replace_reject_sent;
  OrderCancelReplaceReject order_cancel_replace_reject_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancel_replace_reject(order_cancel_replace_reject_sent, 0)
  :: pattern == 1 -> fill_order_cancel_replace_reject(order_cancel_replace_reject_sent, 32)
  :: pattern == 2 -> fill_order_cancel_replace_reject(order_cancel_replace_reject_sent, 255)
  :: else -> ramp_order_cancel_replace_reject(order_cancel_replace_reject_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancel_replace_reject(order_cancel_replace_reject_sent);
    assert(at == 401);
    at = 0;
    decode_order_cancel_replace_reject(order_cancel_replace_reject_got);
    assert(at == 401);
    equal_order_cancel_replace_reject(order_cancel_replace_reject_got, order_cancel_replace_reject_sent)
  }
}

/* Request For Quote Ack: encoded, read back, and compared */
proctype check_request_for_quote_ack() {
  RequestForQuoteAck request_for_quote_ack_sent;
  RequestForQuoteAck request_for_quote_ack_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_request_for_quote_ack(request_for_quote_ack_sent, 0)
  :: pattern == 1 -> fill_request_for_quote_ack(request_for_quote_ack_sent, 32)
  :: pattern == 2 -> fill_request_for_quote_ack(request_for_quote_ack_sent, 255)
  :: else -> ramp_request_for_quote_ack(request_for_quote_ack_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_request_for_quote_ack(request_for_quote_ack_sent);
    assert(at == 350);
    at = 0;
    decode_request_for_quote_ack(request_for_quote_ack_got);
    assert(at == 350);
    equal_request_for_quote_ack(request_for_quote_ack_got, request_for_quote_ack_sent)
  }
}

/* Maturity Month Year: encoded, read back, and compared */
proctype check_maturity_month_year() {
  MaturityMonthYear maturity_month_year_sent;
  MaturityMonthYear maturity_month_year_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_maturity_month_year(maturity_month_year_sent, 0)
  :: pattern == 1 -> fill_maturity_month_year(maturity_month_year_sent, 32)
  :: pattern == 2 -> fill_maturity_month_year(maturity_month_year_sent, 255)
  :: else -> ramp_maturity_month_year(maturity_month_year_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_maturity_month_year(maturity_month_year_sent);
    assert(at == 5);
    at = 0;
    decode_maturity_month_year(maturity_month_year_got);
    assert(at == 5);
    equal_maturity_month_year(maturity_month_year_got, maturity_month_year_sent)
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
  :: run check_negotiation_reject()
  :: run check_establishment_ack()
  :: run check_establishment_reject()
  :: run check_sequence()
  :: run check_terminate()
  :: run check_retransmission()
  :: run check_retransmit_reject()
  :: run check_not_applied()
  :: run check_group_size()
  :: run check_business_reject()
  :: run check_volatility()
  :: run check_option_delta()
  :: run check_time_to_expiration()
  :: run check_risk_free_rate()
  :: run check_order_cancel_reject()
  :: run check_order_cancel_replace_reject()
  :: run check_request_for_quote_ack()
  :: run check_maturity_month_year()
  :: run check_leg_option_delta()
  fi
}
