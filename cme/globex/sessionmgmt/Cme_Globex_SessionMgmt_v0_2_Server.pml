/*
 * CME Group Session Management
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
 *   - the dispatch that chooses a message by its type
 *   - a block whose stated length holds more than its fields
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 105

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Server Technical Header: 14 bytes --------------------------------------- */

/* Cme Technical Header sent by Cme to the subscriber */
typedef ServerTechnicalHeader {
  byte encoding_type[2];
  byte message_sequence_number[4];
  byte sending_time[8]
};

int server_technical_header_at;

/* every byte of Server Technical Header set to one value */
inline fill_server_technical_header(server_technical_header_record, server_technical_header_value) {
  server_technical_header_at = 0;
  do
  :: server_technical_header_at < 2 -> server_technical_header_record.encoding_type[server_technical_header_at] = server_technical_header_value; server_technical_header_at = server_technical_header_at + 1
  :: else -> break
  od;
  server_technical_header_at = 0;
  do
  :: server_technical_header_at < 4 -> server_technical_header_record.message_sequence_number[server_technical_header_at] = server_technical_header_value; server_technical_header_at = server_technical_header_at + 1
  :: else -> break
  od;
  server_technical_header_at = 0;
  do
  :: server_technical_header_at < 8 -> server_technical_header_record.sending_time[server_technical_header_at] = server_technical_header_value; server_technical_header_at = server_technical_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Server Technical Header set to where it lies, so a field read out of place says so */
inline ramp_server_technical_header(server_technical_header_record, server_technical_header_base) {
  server_technical_header_at = 0;
  do
  :: server_technical_header_at < 2 -> server_technical_header_record.encoding_type[server_technical_header_at] = (server_technical_header_base + 0 + server_technical_header_at + 1) % 256; server_technical_header_at = server_technical_header_at + 1
  :: else -> break
  od;
  server_technical_header_at = 0;
  do
  :: server_technical_header_at < 4 -> server_technical_header_record.message_sequence_number[server_technical_header_at] = (server_technical_header_base + 2 + server_technical_header_at + 1) % 256; server_technical_header_at = server_technical_header_at + 1
  :: else -> break
  od;
  server_technical_header_at = 0;
  do
  :: server_technical_header_at < 8 -> server_technical_header_record.sending_time[server_technical_header_at] = (server_technical_header_base + 6 + server_technical_header_at + 1) % 256; server_technical_header_at = server_technical_header_at + 1
  :: else -> break
  od;
  skip
}

/* Server Technical Header to the wire, 14 bytes from where the cursor stands */
inline encode_server_technical_header(server_technical_header_record) {
  server_technical_header_at = 0;
  do
  :: server_technical_header_at < 2 -> wire[at] = server_technical_header_record.encoding_type[server_technical_header_at]; at = at + 1; server_technical_header_at = server_technical_header_at + 1
  :: else -> break
  od;
  server_technical_header_at = 0;
  do
  :: server_technical_header_at < 4 -> wire[at] = server_technical_header_record.message_sequence_number[server_technical_header_at]; at = at + 1; server_technical_header_at = server_technical_header_at + 1
  :: else -> break
  od;
  server_technical_header_at = 0;
  do
  :: server_technical_header_at < 8 -> wire[at] = server_technical_header_record.sending_time[server_technical_header_at]; at = at + 1; server_technical_header_at = server_technical_header_at + 1
  :: else -> break
  od;
  skip
}

/* Server Technical Header off the wire, 14 bytes from where the cursor stands */
inline decode_server_technical_header(server_technical_header_record) {
  server_technical_header_at = 0;
  do
  :: server_technical_header_at < 2 -> server_technical_header_record.encoding_type[server_technical_header_at] = wire[at]; at = at + 1; server_technical_header_at = server_technical_header_at + 1
  :: else -> break
  od;
  server_technical_header_at = 0;
  do
  :: server_technical_header_at < 4 -> server_technical_header_record.message_sequence_number[server_technical_header_at] = wire[at]; at = at + 1; server_technical_header_at = server_technical_header_at + 1
  :: else -> break
  od;
  server_technical_header_at = 0;
  do
  :: server_technical_header_at < 8 -> server_technical_header_record.sending_time[server_technical_header_at] = wire[at]; at = at + 1; server_technical_header_at = server_technical_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Server Technical Header is what was written, byte for byte */
inline equal_server_technical_header(server_technical_header_read, server_technical_header_written) {
  server_technical_header_at = 0;
  do
  :: server_technical_header_at < 2 -> assert(server_technical_header_read.encoding_type[server_technical_header_at] == server_technical_header_written.encoding_type[server_technical_header_at]); server_technical_header_at = server_technical_header_at + 1
  :: else -> break
  od;
  server_technical_header_at = 0;
  do
  :: server_technical_header_at < 4 -> assert(server_technical_header_read.message_sequence_number[server_technical_header_at] == server_technical_header_written.message_sequence_number[server_technical_header_at]); server_technical_header_at = server_technical_header_at + 1
  :: else -> break
  od;
  server_technical_header_at = 0;
  do
  :: server_technical_header_at < 8 -> assert(server_technical_header_read.sending_time[server_technical_header_at] == server_technical_header_written.sending_time[server_technical_header_at]); server_technical_header_at = server_technical_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Simple Binary Header: 8 bytes ------------------------------------------- */

/* Template ID and length of message root */
typedef SimpleBinaryHeader {
  byte block_length[2];
  byte template_id[2];
  byte schema_id[2];
  byte version[2]
};

int simple_binary_header_at;

/* every byte of Simple Binary Header set to one value */
inline fill_simple_binary_header(simple_binary_header_record, simple_binary_header_value) {
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> simple_binary_header_record.block_length[simple_binary_header_at] = simple_binary_header_value; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> simple_binary_header_record.template_id[simple_binary_header_at] = simple_binary_header_value; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> simple_binary_header_record.schema_id[simple_binary_header_at] = simple_binary_header_value; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> simple_binary_header_record.version[simple_binary_header_at] = simple_binary_header_value; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Simple Binary Header set to where it lies, so a field read out of place says so */
inline ramp_simple_binary_header(simple_binary_header_record, simple_binary_header_base) {
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> simple_binary_header_record.block_length[simple_binary_header_at] = (simple_binary_header_base + 0 + simple_binary_header_at + 1) % 256; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> simple_binary_header_record.template_id[simple_binary_header_at] = (simple_binary_header_base + 2 + simple_binary_header_at + 1) % 256; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> simple_binary_header_record.schema_id[simple_binary_header_at] = (simple_binary_header_base + 4 + simple_binary_header_at + 1) % 256; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> simple_binary_header_record.version[simple_binary_header_at] = (simple_binary_header_base + 6 + simple_binary_header_at + 1) % 256; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Binary Header to the wire, 8 bytes from where the cursor stands */
inline encode_simple_binary_header(simple_binary_header_record) {
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> wire[at] = simple_binary_header_record.block_length[simple_binary_header_at]; at = at + 1; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> wire[at] = simple_binary_header_record.template_id[simple_binary_header_at]; at = at + 1; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> wire[at] = simple_binary_header_record.schema_id[simple_binary_header_at]; at = at + 1; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> wire[at] = simple_binary_header_record.version[simple_binary_header_at]; at = at + 1; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Binary Header off the wire, 8 bytes from where the cursor stands */
inline decode_simple_binary_header(simple_binary_header_record) {
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> simple_binary_header_record.block_length[simple_binary_header_at] = wire[at]; at = at + 1; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> simple_binary_header_record.template_id[simple_binary_header_at] = wire[at]; at = at + 1; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> simple_binary_header_record.schema_id[simple_binary_header_at] = wire[at]; at = at + 1; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> simple_binary_header_record.version[simple_binary_header_at] = wire[at]; at = at + 1; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Simple Binary Header is what was written, byte for byte */
inline equal_simple_binary_header(simple_binary_header_read, simple_binary_header_written) {
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> assert(simple_binary_header_read.block_length[simple_binary_header_at] == simple_binary_header_written.block_length[simple_binary_header_at]); simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> assert(simple_binary_header_read.template_id[simple_binary_header_at] == simple_binary_header_written.template_id[simple_binary_header_at]); simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> assert(simple_binary_header_read.schema_id[simple_binary_header_at] == simple_binary_header_written.schema_id[simple_binary_header_at]); simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> assert(simple_binary_header_read.version[simple_binary_header_at] == simple_binary_header_written.version[simple_binary_header_at]); simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 10 bytes ------------------------------------------------ */

/* Message Size followed by the Simple Binary Header */
typedef MessageHeader {
  byte message_size[2];
  SimpleBinaryHeader simple_binary_header
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_size[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  fill_simple_binary_header(message_header_record.simple_binary_header, message_header_value);
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_size[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  ramp_simple_binary_header(message_header_record.simple_binary_header, message_header_base + 2);
  skip
}

/* Message Header to the wire, 10 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_size[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  encode_simple_binary_header(message_header_record.simple_binary_header);
  skip
}

/* Message Header off the wire, 10 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_size[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  decode_simple_binary_header(message_header_record.simple_binary_header);
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_size[message_header_at] == message_header_written.message_size[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  equal_simple_binary_header(message_header_read.simple_binary_header, message_header_written.simple_binary_header);
  skip
}

/* ---- Negotiation Reject: 70 bytes -------------------------------------------- */

/* NegotiationReject */
typedef NegotiationReject {
  byte reason[48];
  byte uuid[8];
  byte request_timestamp[8];
  byte error_codes;
  byte padding_5[5]
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
  negotiation_reject_record.error_codes = negotiation_reject_value;
  negotiation_reject_at = 0;
  do
  :: negotiation_reject_at < 5 -> negotiation_reject_record.padding_5[negotiation_reject_at] = negotiation_reject_value; negotiation_reject_at = negotiation_reject_at + 1
  :: else -> break
  od;
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
  negotiation_reject_record.error_codes = (negotiation_reject_base + 64 + 1) % 256;
  negotiation_reject_at = 0;
  do
  :: negotiation_reject_at < 5 -> negotiation_reject_record.padding_5[negotiation_reject_at] = (negotiation_reject_base + 65 + negotiation_reject_at + 1) % 256; negotiation_reject_at = negotiation_reject_at + 1
  :: else -> break
  od;
  skip
}

/* Negotiation Reject to the wire, 70 bytes from where the cursor stands */
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
  wire[at] = negotiation_reject_record.error_codes; at = at + 1;
  negotiation_reject_at = 0;
  do
  :: negotiation_reject_at < 5 -> wire[at] = negotiation_reject_record.padding_5[negotiation_reject_at]; at = at + 1; negotiation_reject_at = negotiation_reject_at + 1
  :: else -> break
  od;
  skip
}

/* Negotiation Reject off the wire, 70 bytes from where the cursor stands */
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
  negotiation_reject_record.error_codes = wire[at]; at = at + 1;
  negotiation_reject_at = 0;
  do
  :: negotiation_reject_at < 5 -> negotiation_reject_record.padding_5[negotiation_reject_at] = wire[at]; at = at + 1; negotiation_reject_at = negotiation_reject_at + 1
  :: else -> break
  od;
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
  assert(negotiation_reject_read.error_codes == negotiation_reject_written.error_codes);
  negotiation_reject_at = 0;
  do
  :: negotiation_reject_at < 5 -> assert(negotiation_reject_read.padding_5[negotiation_reject_at] == negotiation_reject_written.padding_5[negotiation_reject_at]); negotiation_reject_at = negotiation_reject_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Negotiation Response: 22 bytes ------------------------------------------ */

/* NegotiationResponse */
typedef NegotiationResponse {
  byte uuid[8];
  byte request_timestamp[8];
  byte secret_key_secure_id_expiration[2];
  byte padding_4[4]
};

int negotiation_response_at;

/* every byte of Negotiation Response set to one value */
inline fill_negotiation_response(negotiation_response_record, negotiation_response_value) {
  negotiation_response_at = 0;
  do
  :: negotiation_response_at < 8 -> negotiation_response_record.uuid[negotiation_response_at] = negotiation_response_value; negotiation_response_at = negotiation_response_at + 1
  :: else -> break
  od;
  negotiation_response_at = 0;
  do
  :: negotiation_response_at < 8 -> negotiation_response_record.request_timestamp[negotiation_response_at] = negotiation_response_value; negotiation_response_at = negotiation_response_at + 1
  :: else -> break
  od;
  negotiation_response_at = 0;
  do
  :: negotiation_response_at < 2 -> negotiation_response_record.secret_key_secure_id_expiration[negotiation_response_at] = negotiation_response_value; negotiation_response_at = negotiation_response_at + 1
  :: else -> break
  od;
  negotiation_response_at = 0;
  do
  :: negotiation_response_at < 4 -> negotiation_response_record.padding_4[negotiation_response_at] = negotiation_response_value; negotiation_response_at = negotiation_response_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Negotiation Response set to where it lies, so a field read out of place says so */
inline ramp_negotiation_response(negotiation_response_record, negotiation_response_base) {
  negotiation_response_at = 0;
  do
  :: negotiation_response_at < 8 -> negotiation_response_record.uuid[negotiation_response_at] = (negotiation_response_base + 0 + negotiation_response_at + 1) % 256; negotiation_response_at = negotiation_response_at + 1
  :: else -> break
  od;
  negotiation_response_at = 0;
  do
  :: negotiation_response_at < 8 -> negotiation_response_record.request_timestamp[negotiation_response_at] = (negotiation_response_base + 8 + negotiation_response_at + 1) % 256; negotiation_response_at = negotiation_response_at + 1
  :: else -> break
  od;
  negotiation_response_at = 0;
  do
  :: negotiation_response_at < 2 -> negotiation_response_record.secret_key_secure_id_expiration[negotiation_response_at] = (negotiation_response_base + 16 + negotiation_response_at + 1) % 256; negotiation_response_at = negotiation_response_at + 1
  :: else -> break
  od;
  negotiation_response_at = 0;
  do
  :: negotiation_response_at < 4 -> negotiation_response_record.padding_4[negotiation_response_at] = (negotiation_response_base + 18 + negotiation_response_at + 1) % 256; negotiation_response_at = negotiation_response_at + 1
  :: else -> break
  od;
  skip
}

/* Negotiation Response to the wire, 22 bytes from where the cursor stands */
inline encode_negotiation_response(negotiation_response_record) {
  negotiation_response_at = 0;
  do
  :: negotiation_response_at < 8 -> wire[at] = negotiation_response_record.uuid[negotiation_response_at]; at = at + 1; negotiation_response_at = negotiation_response_at + 1
  :: else -> break
  od;
  negotiation_response_at = 0;
  do
  :: negotiation_response_at < 8 -> wire[at] = negotiation_response_record.request_timestamp[negotiation_response_at]; at = at + 1; negotiation_response_at = negotiation_response_at + 1
  :: else -> break
  od;
  negotiation_response_at = 0;
  do
  :: negotiation_response_at < 2 -> wire[at] = negotiation_response_record.secret_key_secure_id_expiration[negotiation_response_at]; at = at + 1; negotiation_response_at = negotiation_response_at + 1
  :: else -> break
  od;
  negotiation_response_at = 0;
  do
  :: negotiation_response_at < 4 -> wire[at] = negotiation_response_record.padding_4[negotiation_response_at]; at = at + 1; negotiation_response_at = negotiation_response_at + 1
  :: else -> break
  od;
  skip
}

/* Negotiation Response off the wire, 22 bytes from where the cursor stands */
inline decode_negotiation_response(negotiation_response_record) {
  negotiation_response_at = 0;
  do
  :: negotiation_response_at < 8 -> negotiation_response_record.uuid[negotiation_response_at] = wire[at]; at = at + 1; negotiation_response_at = negotiation_response_at + 1
  :: else -> break
  od;
  negotiation_response_at = 0;
  do
  :: negotiation_response_at < 8 -> negotiation_response_record.request_timestamp[negotiation_response_at] = wire[at]; at = at + 1; negotiation_response_at = negotiation_response_at + 1
  :: else -> break
  od;
  negotiation_response_at = 0;
  do
  :: negotiation_response_at < 2 -> negotiation_response_record.secret_key_secure_id_expiration[negotiation_response_at] = wire[at]; at = at + 1; negotiation_response_at = negotiation_response_at + 1
  :: else -> break
  od;
  negotiation_response_at = 0;
  do
  :: negotiation_response_at < 4 -> negotiation_response_record.padding_4[negotiation_response_at] = wire[at]; at = at + 1; negotiation_response_at = negotiation_response_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Negotiation Response is what was written, byte for byte */
inline equal_negotiation_response(negotiation_response_read, negotiation_response_written) {
  negotiation_response_at = 0;
  do
  :: negotiation_response_at < 8 -> assert(negotiation_response_read.uuid[negotiation_response_at] == negotiation_response_written.uuid[negotiation_response_at]); negotiation_response_at = negotiation_response_at + 1
  :: else -> break
  od;
  negotiation_response_at = 0;
  do
  :: negotiation_response_at < 8 -> assert(negotiation_response_read.request_timestamp[negotiation_response_at] == negotiation_response_written.request_timestamp[negotiation_response_at]); negotiation_response_at = negotiation_response_at + 1
  :: else -> break
  od;
  negotiation_response_at = 0;
  do
  :: negotiation_response_at < 2 -> assert(negotiation_response_read.secret_key_secure_id_expiration[negotiation_response_at] == negotiation_response_written.secret_key_secure_id_expiration[negotiation_response_at]); negotiation_response_at = negotiation_response_at + 1
  :: else -> break
  od;
  negotiation_response_at = 0;
  do
  :: negotiation_response_at < 4 -> assert(negotiation_response_read.padding_4[negotiation_response_at] == negotiation_response_written.padding_4[negotiation_response_at]); negotiation_response_at = negotiation_response_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Terminate: 70 bytes ----------------------------------------------------- */

/* Terminate */
typedef Terminate {
  byte reason[48];
  byte uuid[8];
  byte request_timestamp[8];
  byte error_codes;
  byte padding_5[5]
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
  terminate_record.error_codes = terminate_value;
  terminate_at = 0;
  do
  :: terminate_at < 5 -> terminate_record.padding_5[terminate_at] = terminate_value; terminate_at = terminate_at + 1
  :: else -> break
  od;
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
  terminate_record.error_codes = (terminate_base + 64 + 1) % 256;
  terminate_at = 0;
  do
  :: terminate_at < 5 -> terminate_record.padding_5[terminate_at] = (terminate_base + 65 + terminate_at + 1) % 256; terminate_at = terminate_at + 1
  :: else -> break
  od;
  skip
}

/* Terminate to the wire, 70 bytes from where the cursor stands */
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
  wire[at] = terminate_record.error_codes; at = at + 1;
  terminate_at = 0;
  do
  :: terminate_at < 5 -> wire[at] = terminate_record.padding_5[terminate_at]; at = at + 1; terminate_at = terminate_at + 1
  :: else -> break
  od;
  skip
}

/* Terminate off the wire, 70 bytes from where the cursor stands */
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
  terminate_record.error_codes = wire[at]; at = at + 1;
  terminate_at = 0;
  do
  :: terminate_at < 5 -> terminate_record.padding_5[terminate_at] = wire[at]; at = at + 1; terminate_at = terminate_at + 1
  :: else -> break
  od;
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
  assert(terminate_read.error_codes == terminate_written.error_codes);
  terminate_at = 0;
  do
  :: terminate_at < 5 -> assert(terminate_read.padding_5[terminate_at] == terminate_written.padding_5[terminate_at]); terminate_at = terminate_at + 1
  :: else -> break
  od;
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

/* ---- Request Reject: 105 bytes ----------------------------------------------- */

/* RequestReject */
typedef RequestReject {
  byte md_req_id_optional[4];
  byte md_req_rej_reason;
  byte session_text[100]
};

int request_reject_at;

/* every byte of Request Reject set to one value */
inline fill_request_reject(request_reject_record, request_reject_value) {
  request_reject_at = 0;
  do
  :: request_reject_at < 4 -> request_reject_record.md_req_id_optional[request_reject_at] = request_reject_value; request_reject_at = request_reject_at + 1
  :: else -> break
  od;
  request_reject_record.md_req_rej_reason = request_reject_value;
  request_reject_at = 0;
  do
  :: request_reject_at < 100 -> request_reject_record.session_text[request_reject_at] = request_reject_value; request_reject_at = request_reject_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Request Reject set to where it lies, so a field read out of place says so */
inline ramp_request_reject(request_reject_record, request_reject_base) {
  request_reject_at = 0;
  do
  :: request_reject_at < 4 -> request_reject_record.md_req_id_optional[request_reject_at] = (request_reject_base + 0 + request_reject_at + 1) % 256; request_reject_at = request_reject_at + 1
  :: else -> break
  od;
  request_reject_record.md_req_rej_reason = (request_reject_base + 4 + 1) % 256;
  request_reject_at = 0;
  do
  :: request_reject_at < 100 -> request_reject_record.session_text[request_reject_at] = (request_reject_base + 5 + request_reject_at + 1) % 256; request_reject_at = request_reject_at + 1
  :: else -> break
  od;
  skip
}

/* Request Reject to the wire, 105 bytes from where the cursor stands */
inline encode_request_reject(request_reject_record) {
  request_reject_at = 0;
  do
  :: request_reject_at < 4 -> wire[at] = request_reject_record.md_req_id_optional[request_reject_at]; at = at + 1; request_reject_at = request_reject_at + 1
  :: else -> break
  od;
  wire[at] = request_reject_record.md_req_rej_reason; at = at + 1;
  request_reject_at = 0;
  do
  :: request_reject_at < 100 -> wire[at] = request_reject_record.session_text[request_reject_at]; at = at + 1; request_reject_at = request_reject_at + 1
  :: else -> break
  od;
  skip
}

/* Request Reject off the wire, 105 bytes from where the cursor stands */
inline decode_request_reject(request_reject_record) {
  request_reject_at = 0;
  do
  :: request_reject_at < 4 -> request_reject_record.md_req_id_optional[request_reject_at] = wire[at]; at = at + 1; request_reject_at = request_reject_at + 1
  :: else -> break
  od;
  request_reject_record.md_req_rej_reason = wire[at]; at = at + 1;
  request_reject_at = 0;
  do
  :: request_reject_at < 100 -> request_reject_record.session_text[request_reject_at] = wire[at]; at = at + 1; request_reject_at = request_reject_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Request Reject is what was written, byte for byte */
inline equal_request_reject(request_reject_read, request_reject_written) {
  request_reject_at = 0;
  do
  :: request_reject_at < 4 -> assert(request_reject_read.md_req_id_optional[request_reject_at] == request_reject_written.md_req_id_optional[request_reject_at]); request_reject_at = request_reject_at + 1
  :: else -> break
  od;
  assert(request_reject_read.md_req_rej_reason == request_reject_written.md_req_rej_reason);
  request_reject_at = 0;
  do
  :: request_reject_at < 100 -> assert(request_reject_read.session_text[request_reject_at] == request_reject_written.session_text[request_reject_at]); request_reject_at = request_reject_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Server Technical Header: encoded, read back, and compared */
proctype check_server_technical_header() {
  ServerTechnicalHeader server_technical_header_sent;
  ServerTechnicalHeader server_technical_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_server_technical_header(server_technical_header_sent, 0)
  :: pattern == 1 -> fill_server_technical_header(server_technical_header_sent, 32)
  :: pattern == 2 -> fill_server_technical_header(server_technical_header_sent, 255)
  :: else -> ramp_server_technical_header(server_technical_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_server_technical_header(server_technical_header_sent);
    assert(at == 14);
    at = 0;
    decode_server_technical_header(server_technical_header_got);
    assert(at == 14);
    equal_server_technical_header(server_technical_header_got, server_technical_header_sent)
  }
}

/* Simple Binary Header: encoded, read back, and compared */
proctype check_simple_binary_header() {
  SimpleBinaryHeader simple_binary_header_sent;
  SimpleBinaryHeader simple_binary_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_binary_header(simple_binary_header_sent, 0)
  :: pattern == 1 -> fill_simple_binary_header(simple_binary_header_sent, 32)
  :: pattern == 2 -> fill_simple_binary_header(simple_binary_header_sent, 255)
  :: else -> ramp_simple_binary_header(simple_binary_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_binary_header(simple_binary_header_sent);
    assert(at == 8);
    at = 0;
    decode_simple_binary_header(simple_binary_header_got);
    assert(at == 8);
    equal_simple_binary_header(simple_binary_header_got, simple_binary_header_sent)
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
    assert(at == 10);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 10);
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
    assert(at == 70);
    at = 0;
    decode_negotiation_reject(negotiation_reject_got);
    assert(at == 70);
    equal_negotiation_reject(negotiation_reject_got, negotiation_reject_sent)
  }
}

/* Negotiation Response: encoded, read back, and compared */
proctype check_negotiation_response() {
  NegotiationResponse negotiation_response_sent;
  NegotiationResponse negotiation_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_negotiation_response(negotiation_response_sent, 0)
  :: pattern == 1 -> fill_negotiation_response(negotiation_response_sent, 32)
  :: pattern == 2 -> fill_negotiation_response(negotiation_response_sent, 255)
  :: else -> ramp_negotiation_response(negotiation_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_negotiation_response(negotiation_response_sent);
    assert(at == 22);
    at = 0;
    decode_negotiation_response(negotiation_response_got);
    assert(at == 22);
    equal_negotiation_response(negotiation_response_got, negotiation_response_sent)
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
    assert(at == 70);
    at = 0;
    decode_terminate(terminate_got);
    assert(at == 70);
    equal_terminate(terminate_got, terminate_sent)
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

/* Request Reject: encoded, read back, and compared */
proctype check_request_reject() {
  RequestReject request_reject_sent;
  RequestReject request_reject_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_request_reject(request_reject_sent, 0)
  :: pattern == 1 -> fill_request_reject(request_reject_sent, 32)
  :: pattern == 2 -> fill_request_reject(request_reject_sent, 255)
  :: else -> ramp_request_reject(request_reject_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_request_reject(request_reject_sent);
    assert(at == 105);
    at = 0;
    decode_request_reject(request_reject_got);
    assert(at == 105);
    equal_request_reject(request_reject_got, request_reject_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_server_technical_header()
  :: run check_simple_binary_header()
  :: run check_message_header()
  :: run check_negotiation_reject()
  :: run check_negotiation_response()
  :: run check_terminate()
  :: run check_group_size()
  :: run check_request_reject()
  fi
}
