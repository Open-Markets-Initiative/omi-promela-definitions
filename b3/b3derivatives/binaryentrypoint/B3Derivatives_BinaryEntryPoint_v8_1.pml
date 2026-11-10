/*
 * Brasil, Bolsa, Balcão Binary Entry Point
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
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 84

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

/* B3 Sbe message header — message identifiers and length of message root */
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

/* ---- Negotiate Response Message: 24 bytes ------------------------------------ */

/* NegotiateResponseMessage */
typedef NegotiateResponseMessage {
  byte session_id[4];
  byte session_ver_id[8];
  byte request_timestamp[8];
  byte entering_firm[4]
};

int negotiate_response_message_at;

/* every byte of Negotiate Response Message set to one value */
inline fill_negotiate_response_message(negotiate_response_message_record, negotiate_response_message_value) {
  negotiate_response_message_at = 0;
  do
  :: negotiate_response_message_at < 4 -> negotiate_response_message_record.session_id[negotiate_response_message_at] = negotiate_response_message_value; negotiate_response_message_at = negotiate_response_message_at + 1
  :: else -> break
  od;
  negotiate_response_message_at = 0;
  do
  :: negotiate_response_message_at < 8 -> negotiate_response_message_record.session_ver_id[negotiate_response_message_at] = negotiate_response_message_value; negotiate_response_message_at = negotiate_response_message_at + 1
  :: else -> break
  od;
  negotiate_response_message_at = 0;
  do
  :: negotiate_response_message_at < 8 -> negotiate_response_message_record.request_timestamp[negotiate_response_message_at] = negotiate_response_message_value; negotiate_response_message_at = negotiate_response_message_at + 1
  :: else -> break
  od;
  negotiate_response_message_at = 0;
  do
  :: negotiate_response_message_at < 4 -> negotiate_response_message_record.entering_firm[negotiate_response_message_at] = negotiate_response_message_value; negotiate_response_message_at = negotiate_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Negotiate Response Message set to where it lies, so a field read out of place says so */
inline ramp_negotiate_response_message(negotiate_response_message_record, negotiate_response_message_base) {
  negotiate_response_message_at = 0;
  do
  :: negotiate_response_message_at < 4 -> negotiate_response_message_record.session_id[negotiate_response_message_at] = (negotiate_response_message_base + 0 + negotiate_response_message_at + 1) % 256; negotiate_response_message_at = negotiate_response_message_at + 1
  :: else -> break
  od;
  negotiate_response_message_at = 0;
  do
  :: negotiate_response_message_at < 8 -> negotiate_response_message_record.session_ver_id[negotiate_response_message_at] = (negotiate_response_message_base + 4 + negotiate_response_message_at + 1) % 256; negotiate_response_message_at = negotiate_response_message_at + 1
  :: else -> break
  od;
  negotiate_response_message_at = 0;
  do
  :: negotiate_response_message_at < 8 -> negotiate_response_message_record.request_timestamp[negotiate_response_message_at] = (negotiate_response_message_base + 12 + negotiate_response_message_at + 1) % 256; negotiate_response_message_at = negotiate_response_message_at + 1
  :: else -> break
  od;
  negotiate_response_message_at = 0;
  do
  :: negotiate_response_message_at < 4 -> negotiate_response_message_record.entering_firm[negotiate_response_message_at] = (negotiate_response_message_base + 20 + negotiate_response_message_at + 1) % 256; negotiate_response_message_at = negotiate_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Negotiate Response Message to the wire, 24 bytes from where the cursor stands */
inline encode_negotiate_response_message(negotiate_response_message_record) {
  negotiate_response_message_at = 0;
  do
  :: negotiate_response_message_at < 4 -> wire[at] = negotiate_response_message_record.session_id[negotiate_response_message_at]; at = at + 1; negotiate_response_message_at = negotiate_response_message_at + 1
  :: else -> break
  od;
  negotiate_response_message_at = 0;
  do
  :: negotiate_response_message_at < 8 -> wire[at] = negotiate_response_message_record.session_ver_id[negotiate_response_message_at]; at = at + 1; negotiate_response_message_at = negotiate_response_message_at + 1
  :: else -> break
  od;
  negotiate_response_message_at = 0;
  do
  :: negotiate_response_message_at < 8 -> wire[at] = negotiate_response_message_record.request_timestamp[negotiate_response_message_at]; at = at + 1; negotiate_response_message_at = negotiate_response_message_at + 1
  :: else -> break
  od;
  negotiate_response_message_at = 0;
  do
  :: negotiate_response_message_at < 4 -> wire[at] = negotiate_response_message_record.entering_firm[negotiate_response_message_at]; at = at + 1; negotiate_response_message_at = negotiate_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Negotiate Response Message off the wire, 24 bytes from where the cursor stands */
inline decode_negotiate_response_message(negotiate_response_message_record) {
  negotiate_response_message_at = 0;
  do
  :: negotiate_response_message_at < 4 -> negotiate_response_message_record.session_id[negotiate_response_message_at] = wire[at]; at = at + 1; negotiate_response_message_at = negotiate_response_message_at + 1
  :: else -> break
  od;
  negotiate_response_message_at = 0;
  do
  :: negotiate_response_message_at < 8 -> negotiate_response_message_record.session_ver_id[negotiate_response_message_at] = wire[at]; at = at + 1; negotiate_response_message_at = negotiate_response_message_at + 1
  :: else -> break
  od;
  negotiate_response_message_at = 0;
  do
  :: negotiate_response_message_at < 8 -> negotiate_response_message_record.request_timestamp[negotiate_response_message_at] = wire[at]; at = at + 1; negotiate_response_message_at = negotiate_response_message_at + 1
  :: else -> break
  od;
  negotiate_response_message_at = 0;
  do
  :: negotiate_response_message_at < 4 -> negotiate_response_message_record.entering_firm[negotiate_response_message_at] = wire[at]; at = at + 1; negotiate_response_message_at = negotiate_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Negotiate Response Message is what was written, byte for byte */
inline equal_negotiate_response_message(negotiate_response_message_read, negotiate_response_message_written) {
  negotiate_response_message_at = 0;
  do
  :: negotiate_response_message_at < 4 -> assert(negotiate_response_message_read.session_id[negotiate_response_message_at] == negotiate_response_message_written.session_id[negotiate_response_message_at]); negotiate_response_message_at = negotiate_response_message_at + 1
  :: else -> break
  od;
  negotiate_response_message_at = 0;
  do
  :: negotiate_response_message_at < 8 -> assert(negotiate_response_message_read.session_ver_id[negotiate_response_message_at] == negotiate_response_message_written.session_ver_id[negotiate_response_message_at]); negotiate_response_message_at = negotiate_response_message_at + 1
  :: else -> break
  od;
  negotiate_response_message_at = 0;
  do
  :: negotiate_response_message_at < 8 -> assert(negotiate_response_message_read.request_timestamp[negotiate_response_message_at] == negotiate_response_message_written.request_timestamp[negotiate_response_message_at]); negotiate_response_message_at = negotiate_response_message_at + 1
  :: else -> break
  od;
  negotiate_response_message_at = 0;
  do
  :: negotiate_response_message_at < 4 -> assert(negotiate_response_message_read.entering_firm[negotiate_response_message_at] == negotiate_response_message_written.entering_firm[negotiate_response_message_at]); negotiate_response_message_at = negotiate_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Negotiate Reject Message: 36 bytes -------------------------------------- */

/* NegotiateRejectMessage */
typedef NegotiateRejectMessage {
  byte session_id[4];
  byte session_ver_id[8];
  byte request_timestamp[8];
  byte entering_firm_optional[4];
  byte negotiation_reject_code;
  byte offset_25_padding_3[3];
  byte current_session_ver_id[8]
};

int negotiate_reject_message_at;

/* every byte of Negotiate Reject Message set to one value */
inline fill_negotiate_reject_message(negotiate_reject_message_record, negotiate_reject_message_value) {
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 4 -> negotiate_reject_message_record.session_id[negotiate_reject_message_at] = negotiate_reject_message_value; negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 8 -> negotiate_reject_message_record.session_ver_id[negotiate_reject_message_at] = negotiate_reject_message_value; negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 8 -> negotiate_reject_message_record.request_timestamp[negotiate_reject_message_at] = negotiate_reject_message_value; negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 4 -> negotiate_reject_message_record.entering_firm_optional[negotiate_reject_message_at] = negotiate_reject_message_value; negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  negotiate_reject_message_record.negotiation_reject_code = negotiate_reject_message_value;
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 3 -> negotiate_reject_message_record.offset_25_padding_3[negotiate_reject_message_at] = negotiate_reject_message_value; negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 8 -> negotiate_reject_message_record.current_session_ver_id[negotiate_reject_message_at] = negotiate_reject_message_value; negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Negotiate Reject Message set to where it lies, so a field read out of place says so */
inline ramp_negotiate_reject_message(negotiate_reject_message_record, negotiate_reject_message_base) {
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 4 -> negotiate_reject_message_record.session_id[negotiate_reject_message_at] = (negotiate_reject_message_base + 0 + negotiate_reject_message_at + 1) % 256; negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 8 -> negotiate_reject_message_record.session_ver_id[negotiate_reject_message_at] = (negotiate_reject_message_base + 4 + negotiate_reject_message_at + 1) % 256; negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 8 -> negotiate_reject_message_record.request_timestamp[negotiate_reject_message_at] = (negotiate_reject_message_base + 12 + negotiate_reject_message_at + 1) % 256; negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 4 -> negotiate_reject_message_record.entering_firm_optional[negotiate_reject_message_at] = (negotiate_reject_message_base + 20 + negotiate_reject_message_at + 1) % 256; negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  negotiate_reject_message_record.negotiation_reject_code = (negotiate_reject_message_base + 24 + 1) % 256;
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 3 -> negotiate_reject_message_record.offset_25_padding_3[negotiate_reject_message_at] = (negotiate_reject_message_base + 25 + negotiate_reject_message_at + 1) % 256; negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 8 -> negotiate_reject_message_record.current_session_ver_id[negotiate_reject_message_at] = (negotiate_reject_message_base + 28 + negotiate_reject_message_at + 1) % 256; negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Negotiate Reject Message to the wire, 36 bytes from where the cursor stands */
inline encode_negotiate_reject_message(negotiate_reject_message_record) {
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 4 -> wire[at] = negotiate_reject_message_record.session_id[negotiate_reject_message_at]; at = at + 1; negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 8 -> wire[at] = negotiate_reject_message_record.session_ver_id[negotiate_reject_message_at]; at = at + 1; negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 8 -> wire[at] = negotiate_reject_message_record.request_timestamp[negotiate_reject_message_at]; at = at + 1; negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 4 -> wire[at] = negotiate_reject_message_record.entering_firm_optional[negotiate_reject_message_at]; at = at + 1; negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = negotiate_reject_message_record.negotiation_reject_code; at = at + 1;
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 3 -> wire[at] = negotiate_reject_message_record.offset_25_padding_3[negotiate_reject_message_at]; at = at + 1; negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 8 -> wire[at] = negotiate_reject_message_record.current_session_ver_id[negotiate_reject_message_at]; at = at + 1; negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Negotiate Reject Message off the wire, 36 bytes from where the cursor stands */
inline decode_negotiate_reject_message(negotiate_reject_message_record) {
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 4 -> negotiate_reject_message_record.session_id[negotiate_reject_message_at] = wire[at]; at = at + 1; negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 8 -> negotiate_reject_message_record.session_ver_id[negotiate_reject_message_at] = wire[at]; at = at + 1; negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 8 -> negotiate_reject_message_record.request_timestamp[negotiate_reject_message_at] = wire[at]; at = at + 1; negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 4 -> negotiate_reject_message_record.entering_firm_optional[negotiate_reject_message_at] = wire[at]; at = at + 1; negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  negotiate_reject_message_record.negotiation_reject_code = wire[at]; at = at + 1;
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 3 -> negotiate_reject_message_record.offset_25_padding_3[negotiate_reject_message_at] = wire[at]; at = at + 1; negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 8 -> negotiate_reject_message_record.current_session_ver_id[negotiate_reject_message_at] = wire[at]; at = at + 1; negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Negotiate Reject Message is what was written, byte for byte */
inline equal_negotiate_reject_message(negotiate_reject_message_read, negotiate_reject_message_written) {
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 4 -> assert(negotiate_reject_message_read.session_id[negotiate_reject_message_at] == negotiate_reject_message_written.session_id[negotiate_reject_message_at]); negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 8 -> assert(negotiate_reject_message_read.session_ver_id[negotiate_reject_message_at] == negotiate_reject_message_written.session_ver_id[negotiate_reject_message_at]); negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 8 -> assert(negotiate_reject_message_read.request_timestamp[negotiate_reject_message_at] == negotiate_reject_message_written.request_timestamp[negotiate_reject_message_at]); negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 4 -> assert(negotiate_reject_message_read.entering_firm_optional[negotiate_reject_message_at] == negotiate_reject_message_written.entering_firm_optional[negotiate_reject_message_at]); negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  assert(negotiate_reject_message_read.negotiation_reject_code == negotiate_reject_message_written.negotiation_reject_code);
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 3 -> assert(negotiate_reject_message_read.offset_25_padding_3[negotiate_reject_message_at] == negotiate_reject_message_written.offset_25_padding_3[negotiate_reject_message_at]); negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  negotiate_reject_message_at = 0;
  do
  :: negotiate_reject_message_at < 8 -> assert(negotiate_reject_message_read.current_session_ver_id[negotiate_reject_message_at] == negotiate_reject_message_written.current_session_ver_id[negotiate_reject_message_at]); negotiate_reject_message_at = negotiate_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Establish Ack Message: 36 bytes ----------------------------------------- */

/* EstablishAckMessage */
typedef EstablishAckMessage {
  byte session_id[4];
  byte session_ver_id[8];
  byte request_timestamp[8];
  byte keep_alive_interval[8];
  byte next_seq_no[4];
  byte last_incoming_seq_no[4]
};

int establish_ack_message_at;

/* every byte of Establish Ack Message set to one value */
inline fill_establish_ack_message(establish_ack_message_record, establish_ack_message_value) {
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 4 -> establish_ack_message_record.session_id[establish_ack_message_at] = establish_ack_message_value; establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 8 -> establish_ack_message_record.session_ver_id[establish_ack_message_at] = establish_ack_message_value; establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 8 -> establish_ack_message_record.request_timestamp[establish_ack_message_at] = establish_ack_message_value; establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 8 -> establish_ack_message_record.keep_alive_interval[establish_ack_message_at] = establish_ack_message_value; establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 4 -> establish_ack_message_record.next_seq_no[establish_ack_message_at] = establish_ack_message_value; establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 4 -> establish_ack_message_record.last_incoming_seq_no[establish_ack_message_at] = establish_ack_message_value; establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Establish Ack Message set to where it lies, so a field read out of place says so */
inline ramp_establish_ack_message(establish_ack_message_record, establish_ack_message_base) {
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 4 -> establish_ack_message_record.session_id[establish_ack_message_at] = (establish_ack_message_base + 0 + establish_ack_message_at + 1) % 256; establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 8 -> establish_ack_message_record.session_ver_id[establish_ack_message_at] = (establish_ack_message_base + 4 + establish_ack_message_at + 1) % 256; establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 8 -> establish_ack_message_record.request_timestamp[establish_ack_message_at] = (establish_ack_message_base + 12 + establish_ack_message_at + 1) % 256; establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 8 -> establish_ack_message_record.keep_alive_interval[establish_ack_message_at] = (establish_ack_message_base + 20 + establish_ack_message_at + 1) % 256; establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 4 -> establish_ack_message_record.next_seq_no[establish_ack_message_at] = (establish_ack_message_base + 28 + establish_ack_message_at + 1) % 256; establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 4 -> establish_ack_message_record.last_incoming_seq_no[establish_ack_message_at] = (establish_ack_message_base + 32 + establish_ack_message_at + 1) % 256; establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* Establish Ack Message to the wire, 36 bytes from where the cursor stands */
inline encode_establish_ack_message(establish_ack_message_record) {
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 4 -> wire[at] = establish_ack_message_record.session_id[establish_ack_message_at]; at = at + 1; establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 8 -> wire[at] = establish_ack_message_record.session_ver_id[establish_ack_message_at]; at = at + 1; establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 8 -> wire[at] = establish_ack_message_record.request_timestamp[establish_ack_message_at]; at = at + 1; establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 8 -> wire[at] = establish_ack_message_record.keep_alive_interval[establish_ack_message_at]; at = at + 1; establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 4 -> wire[at] = establish_ack_message_record.next_seq_no[establish_ack_message_at]; at = at + 1; establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 4 -> wire[at] = establish_ack_message_record.last_incoming_seq_no[establish_ack_message_at]; at = at + 1; establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* Establish Ack Message off the wire, 36 bytes from where the cursor stands */
inline decode_establish_ack_message(establish_ack_message_record) {
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 4 -> establish_ack_message_record.session_id[establish_ack_message_at] = wire[at]; at = at + 1; establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 8 -> establish_ack_message_record.session_ver_id[establish_ack_message_at] = wire[at]; at = at + 1; establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 8 -> establish_ack_message_record.request_timestamp[establish_ack_message_at] = wire[at]; at = at + 1; establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 8 -> establish_ack_message_record.keep_alive_interval[establish_ack_message_at] = wire[at]; at = at + 1; establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 4 -> establish_ack_message_record.next_seq_no[establish_ack_message_at] = wire[at]; at = at + 1; establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 4 -> establish_ack_message_record.last_incoming_seq_no[establish_ack_message_at] = wire[at]; at = at + 1; establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Establish Ack Message is what was written, byte for byte */
inline equal_establish_ack_message(establish_ack_message_read, establish_ack_message_written) {
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 4 -> assert(establish_ack_message_read.session_id[establish_ack_message_at] == establish_ack_message_written.session_id[establish_ack_message_at]); establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 8 -> assert(establish_ack_message_read.session_ver_id[establish_ack_message_at] == establish_ack_message_written.session_ver_id[establish_ack_message_at]); establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 8 -> assert(establish_ack_message_read.request_timestamp[establish_ack_message_at] == establish_ack_message_written.request_timestamp[establish_ack_message_at]); establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 8 -> assert(establish_ack_message_read.keep_alive_interval[establish_ack_message_at] == establish_ack_message_written.keep_alive_interval[establish_ack_message_at]); establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 4 -> assert(establish_ack_message_read.next_seq_no[establish_ack_message_at] == establish_ack_message_written.next_seq_no[establish_ack_message_at]); establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  establish_ack_message_at = 0;
  do
  :: establish_ack_message_at < 4 -> assert(establish_ack_message_read.last_incoming_seq_no[establish_ack_message_at] == establish_ack_message_written.last_incoming_seq_no[establish_ack_message_at]); establish_ack_message_at = establish_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Establish Reject Message: 26 bytes -------------------------------------- */

/* EstablishRejectMessage */
typedef EstablishRejectMessage {
  byte session_id[4];
  byte session_ver_id[8];
  byte request_timestamp[8];
  byte establishment_reject_code;
  byte offset_21_padding_1;
  byte last_incoming_seq_no_optional[4]
};

int establish_reject_message_at;

/* every byte of Establish Reject Message set to one value */
inline fill_establish_reject_message(establish_reject_message_record, establish_reject_message_value) {
  establish_reject_message_at = 0;
  do
  :: establish_reject_message_at < 4 -> establish_reject_message_record.session_id[establish_reject_message_at] = establish_reject_message_value; establish_reject_message_at = establish_reject_message_at + 1
  :: else -> break
  od;
  establish_reject_message_at = 0;
  do
  :: establish_reject_message_at < 8 -> establish_reject_message_record.session_ver_id[establish_reject_message_at] = establish_reject_message_value; establish_reject_message_at = establish_reject_message_at + 1
  :: else -> break
  od;
  establish_reject_message_at = 0;
  do
  :: establish_reject_message_at < 8 -> establish_reject_message_record.request_timestamp[establish_reject_message_at] = establish_reject_message_value; establish_reject_message_at = establish_reject_message_at + 1
  :: else -> break
  od;
  establish_reject_message_record.establishment_reject_code = establish_reject_message_value;
  establish_reject_message_record.offset_21_padding_1 = establish_reject_message_value;
  establish_reject_message_at = 0;
  do
  :: establish_reject_message_at < 4 -> establish_reject_message_record.last_incoming_seq_no_optional[establish_reject_message_at] = establish_reject_message_value; establish_reject_message_at = establish_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Establish Reject Message set to where it lies, so a field read out of place says so */
inline ramp_establish_reject_message(establish_reject_message_record, establish_reject_message_base) {
  establish_reject_message_at = 0;
  do
  :: establish_reject_message_at < 4 -> establish_reject_message_record.session_id[establish_reject_message_at] = (establish_reject_message_base + 0 + establish_reject_message_at + 1) % 256; establish_reject_message_at = establish_reject_message_at + 1
  :: else -> break
  od;
  establish_reject_message_at = 0;
  do
  :: establish_reject_message_at < 8 -> establish_reject_message_record.session_ver_id[establish_reject_message_at] = (establish_reject_message_base + 4 + establish_reject_message_at + 1) % 256; establish_reject_message_at = establish_reject_message_at + 1
  :: else -> break
  od;
  establish_reject_message_at = 0;
  do
  :: establish_reject_message_at < 8 -> establish_reject_message_record.request_timestamp[establish_reject_message_at] = (establish_reject_message_base + 12 + establish_reject_message_at + 1) % 256; establish_reject_message_at = establish_reject_message_at + 1
  :: else -> break
  od;
  establish_reject_message_record.establishment_reject_code = (establish_reject_message_base + 20 + 1) % 256;
  establish_reject_message_record.offset_21_padding_1 = (establish_reject_message_base + 21 + 1) % 256;
  establish_reject_message_at = 0;
  do
  :: establish_reject_message_at < 4 -> establish_reject_message_record.last_incoming_seq_no_optional[establish_reject_message_at] = (establish_reject_message_base + 22 + establish_reject_message_at + 1) % 256; establish_reject_message_at = establish_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Establish Reject Message to the wire, 26 bytes from where the cursor stands */
inline encode_establish_reject_message(establish_reject_message_record) {
  establish_reject_message_at = 0;
  do
  :: establish_reject_message_at < 4 -> wire[at] = establish_reject_message_record.session_id[establish_reject_message_at]; at = at + 1; establish_reject_message_at = establish_reject_message_at + 1
  :: else -> break
  od;
  establish_reject_message_at = 0;
  do
  :: establish_reject_message_at < 8 -> wire[at] = establish_reject_message_record.session_ver_id[establish_reject_message_at]; at = at + 1; establish_reject_message_at = establish_reject_message_at + 1
  :: else -> break
  od;
  establish_reject_message_at = 0;
  do
  :: establish_reject_message_at < 8 -> wire[at] = establish_reject_message_record.request_timestamp[establish_reject_message_at]; at = at + 1; establish_reject_message_at = establish_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = establish_reject_message_record.establishment_reject_code; at = at + 1;
  wire[at] = establish_reject_message_record.offset_21_padding_1; at = at + 1;
  establish_reject_message_at = 0;
  do
  :: establish_reject_message_at < 4 -> wire[at] = establish_reject_message_record.last_incoming_seq_no_optional[establish_reject_message_at]; at = at + 1; establish_reject_message_at = establish_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Establish Reject Message off the wire, 26 bytes from where the cursor stands */
inline decode_establish_reject_message(establish_reject_message_record) {
  establish_reject_message_at = 0;
  do
  :: establish_reject_message_at < 4 -> establish_reject_message_record.session_id[establish_reject_message_at] = wire[at]; at = at + 1; establish_reject_message_at = establish_reject_message_at + 1
  :: else -> break
  od;
  establish_reject_message_at = 0;
  do
  :: establish_reject_message_at < 8 -> establish_reject_message_record.session_ver_id[establish_reject_message_at] = wire[at]; at = at + 1; establish_reject_message_at = establish_reject_message_at + 1
  :: else -> break
  od;
  establish_reject_message_at = 0;
  do
  :: establish_reject_message_at < 8 -> establish_reject_message_record.request_timestamp[establish_reject_message_at] = wire[at]; at = at + 1; establish_reject_message_at = establish_reject_message_at + 1
  :: else -> break
  od;
  establish_reject_message_record.establishment_reject_code = wire[at]; at = at + 1;
  establish_reject_message_record.offset_21_padding_1 = wire[at]; at = at + 1;
  establish_reject_message_at = 0;
  do
  :: establish_reject_message_at < 4 -> establish_reject_message_record.last_incoming_seq_no_optional[establish_reject_message_at] = wire[at]; at = at + 1; establish_reject_message_at = establish_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Establish Reject Message is what was written, byte for byte */
inline equal_establish_reject_message(establish_reject_message_read, establish_reject_message_written) {
  establish_reject_message_at = 0;
  do
  :: establish_reject_message_at < 4 -> assert(establish_reject_message_read.session_id[establish_reject_message_at] == establish_reject_message_written.session_id[establish_reject_message_at]); establish_reject_message_at = establish_reject_message_at + 1
  :: else -> break
  od;
  establish_reject_message_at = 0;
  do
  :: establish_reject_message_at < 8 -> assert(establish_reject_message_read.session_ver_id[establish_reject_message_at] == establish_reject_message_written.session_ver_id[establish_reject_message_at]); establish_reject_message_at = establish_reject_message_at + 1
  :: else -> break
  od;
  establish_reject_message_at = 0;
  do
  :: establish_reject_message_at < 8 -> assert(establish_reject_message_read.request_timestamp[establish_reject_message_at] == establish_reject_message_written.request_timestamp[establish_reject_message_at]); establish_reject_message_at = establish_reject_message_at + 1
  :: else -> break
  od;
  assert(establish_reject_message_read.establishment_reject_code == establish_reject_message_written.establishment_reject_code);
  assert(establish_reject_message_read.offset_21_padding_1 == establish_reject_message_written.offset_21_padding_1);
  establish_reject_message_at = 0;
  do
  :: establish_reject_message_at < 4 -> assert(establish_reject_message_read.last_incoming_seq_no_optional[establish_reject_message_at] == establish_reject_message_written.last_incoming_seq_no_optional[establish_reject_message_at]); establish_reject_message_at = establish_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Terminate Message: 13 bytes --------------------------------------------- */

/* TerminateMessage */
typedef TerminateMessage {
  byte session_id[4];
  byte session_ver_id[8];
  byte termination_code
};

int terminate_message_at;

/* every byte of Terminate Message set to one value */
inline fill_terminate_message(terminate_message_record, terminate_message_value) {
  terminate_message_at = 0;
  do
  :: terminate_message_at < 4 -> terminate_message_record.session_id[terminate_message_at] = terminate_message_value; terminate_message_at = terminate_message_at + 1
  :: else -> break
  od;
  terminate_message_at = 0;
  do
  :: terminate_message_at < 8 -> terminate_message_record.session_ver_id[terminate_message_at] = terminate_message_value; terminate_message_at = terminate_message_at + 1
  :: else -> break
  od;
  terminate_message_record.termination_code = terminate_message_value;
  skip
}

/* each byte of Terminate Message set to where it lies, so a field read out of place says so */
inline ramp_terminate_message(terminate_message_record, terminate_message_base) {
  terminate_message_at = 0;
  do
  :: terminate_message_at < 4 -> terminate_message_record.session_id[terminate_message_at] = (terminate_message_base + 0 + terminate_message_at + 1) % 256; terminate_message_at = terminate_message_at + 1
  :: else -> break
  od;
  terminate_message_at = 0;
  do
  :: terminate_message_at < 8 -> terminate_message_record.session_ver_id[terminate_message_at] = (terminate_message_base + 4 + terminate_message_at + 1) % 256; terminate_message_at = terminate_message_at + 1
  :: else -> break
  od;
  terminate_message_record.termination_code = (terminate_message_base + 12 + 1) % 256;
  skip
}

/* Terminate Message to the wire, 13 bytes from where the cursor stands */
inline encode_terminate_message(terminate_message_record) {
  terminate_message_at = 0;
  do
  :: terminate_message_at < 4 -> wire[at] = terminate_message_record.session_id[terminate_message_at]; at = at + 1; terminate_message_at = terminate_message_at + 1
  :: else -> break
  od;
  terminate_message_at = 0;
  do
  :: terminate_message_at < 8 -> wire[at] = terminate_message_record.session_ver_id[terminate_message_at]; at = at + 1; terminate_message_at = terminate_message_at + 1
  :: else -> break
  od;
  wire[at] = terminate_message_record.termination_code; at = at + 1;
  skip
}

/* Terminate Message off the wire, 13 bytes from where the cursor stands */
inline decode_terminate_message(terminate_message_record) {
  terminate_message_at = 0;
  do
  :: terminate_message_at < 4 -> terminate_message_record.session_id[terminate_message_at] = wire[at]; at = at + 1; terminate_message_at = terminate_message_at + 1
  :: else -> break
  od;
  terminate_message_at = 0;
  do
  :: terminate_message_at < 8 -> terminate_message_record.session_ver_id[terminate_message_at] = wire[at]; at = at + 1; terminate_message_at = terminate_message_at + 1
  :: else -> break
  od;
  terminate_message_record.termination_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Terminate Message is what was written, byte for byte */
inline equal_terminate_message(terminate_message_read, terminate_message_written) {
  terminate_message_at = 0;
  do
  :: terminate_message_at < 4 -> assert(terminate_message_read.session_id[terminate_message_at] == terminate_message_written.session_id[terminate_message_at]); terminate_message_at = terminate_message_at + 1
  :: else -> break
  od;
  terminate_message_at = 0;
  do
  :: terminate_message_at < 8 -> assert(terminate_message_read.session_ver_id[terminate_message_at] == terminate_message_written.session_ver_id[terminate_message_at]); terminate_message_at = terminate_message_at + 1
  :: else -> break
  od;
  assert(terminate_message_read.termination_code == terminate_message_written.termination_code);
  skip
}

/* ---- Not Applied Message: 8 bytes -------------------------------------------- */

/* NotAppliedMessage */
typedef NotAppliedMessage {
  byte from_seq_no[4];
  byte count[4]
};

int not_applied_message_at;

/* every byte of Not Applied Message set to one value */
inline fill_not_applied_message(not_applied_message_record, not_applied_message_value) {
  not_applied_message_at = 0;
  do
  :: not_applied_message_at < 4 -> not_applied_message_record.from_seq_no[not_applied_message_at] = not_applied_message_value; not_applied_message_at = not_applied_message_at + 1
  :: else -> break
  od;
  not_applied_message_at = 0;
  do
  :: not_applied_message_at < 4 -> not_applied_message_record.count[not_applied_message_at] = not_applied_message_value; not_applied_message_at = not_applied_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Not Applied Message set to where it lies, so a field read out of place says so */
inline ramp_not_applied_message(not_applied_message_record, not_applied_message_base) {
  not_applied_message_at = 0;
  do
  :: not_applied_message_at < 4 -> not_applied_message_record.from_seq_no[not_applied_message_at] = (not_applied_message_base + 0 + not_applied_message_at + 1) % 256; not_applied_message_at = not_applied_message_at + 1
  :: else -> break
  od;
  not_applied_message_at = 0;
  do
  :: not_applied_message_at < 4 -> not_applied_message_record.count[not_applied_message_at] = (not_applied_message_base + 4 + not_applied_message_at + 1) % 256; not_applied_message_at = not_applied_message_at + 1
  :: else -> break
  od;
  skip
}

/* Not Applied Message to the wire, 8 bytes from where the cursor stands */
inline encode_not_applied_message(not_applied_message_record) {
  not_applied_message_at = 0;
  do
  :: not_applied_message_at < 4 -> wire[at] = not_applied_message_record.from_seq_no[not_applied_message_at]; at = at + 1; not_applied_message_at = not_applied_message_at + 1
  :: else -> break
  od;
  not_applied_message_at = 0;
  do
  :: not_applied_message_at < 4 -> wire[at] = not_applied_message_record.count[not_applied_message_at]; at = at + 1; not_applied_message_at = not_applied_message_at + 1
  :: else -> break
  od;
  skip
}

/* Not Applied Message off the wire, 8 bytes from where the cursor stands */
inline decode_not_applied_message(not_applied_message_record) {
  not_applied_message_at = 0;
  do
  :: not_applied_message_at < 4 -> not_applied_message_record.from_seq_no[not_applied_message_at] = wire[at]; at = at + 1; not_applied_message_at = not_applied_message_at + 1
  :: else -> break
  od;
  not_applied_message_at = 0;
  do
  :: not_applied_message_at < 4 -> not_applied_message_record.count[not_applied_message_at] = wire[at]; at = at + 1; not_applied_message_at = not_applied_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Not Applied Message is what was written, byte for byte */
inline equal_not_applied_message(not_applied_message_read, not_applied_message_written) {
  not_applied_message_at = 0;
  do
  :: not_applied_message_at < 4 -> assert(not_applied_message_read.from_seq_no[not_applied_message_at] == not_applied_message_written.from_seq_no[not_applied_message_at]); not_applied_message_at = not_applied_message_at + 1
  :: else -> break
  od;
  not_applied_message_at = 0;
  do
  :: not_applied_message_at < 4 -> assert(not_applied_message_read.count[not_applied_message_at] == not_applied_message_written.count[not_applied_message_at]); not_applied_message_at = not_applied_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sequence Message: 4 bytes ----------------------------------------------- */

/* SequenceMessage */
typedef SequenceMessage {
  byte next_seq_no[4]
};

int sequence_message_at;

/* every byte of Sequence Message set to one value */
inline fill_sequence_message(sequence_message_record, sequence_message_value) {
  sequence_message_at = 0;
  do
  :: sequence_message_at < 4 -> sequence_message_record.next_seq_no[sequence_message_at] = sequence_message_value; sequence_message_at = sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sequence Message set to where it lies, so a field read out of place says so */
inline ramp_sequence_message(sequence_message_record, sequence_message_base) {
  sequence_message_at = 0;
  do
  :: sequence_message_at < 4 -> sequence_message_record.next_seq_no[sequence_message_at] = (sequence_message_base + 0 + sequence_message_at + 1) % 256; sequence_message_at = sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Message to the wire, 4 bytes from where the cursor stands */
inline encode_sequence_message(sequence_message_record) {
  sequence_message_at = 0;
  do
  :: sequence_message_at < 4 -> wire[at] = sequence_message_record.next_seq_no[sequence_message_at]; at = at + 1; sequence_message_at = sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Message off the wire, 4 bytes from where the cursor stands */
inline decode_sequence_message(sequence_message_record) {
  sequence_message_at = 0;
  do
  :: sequence_message_at < 4 -> sequence_message_record.next_seq_no[sequence_message_at] = wire[at]; at = at + 1; sequence_message_at = sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sequence Message is what was written, byte for byte */
inline equal_sequence_message(sequence_message_read, sequence_message_written) {
  sequence_message_at = 0;
  do
  :: sequence_message_at < 4 -> assert(sequence_message_read.next_seq_no[sequence_message_at] == sequence_message_written.next_seq_no[sequence_message_at]); sequence_message_at = sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Retransmit Request Message: 20 bytes ------------------------------------ */

/* RetransmitRequestMessage */
typedef RetransmitRequestMessage {
  byte session_id[4];
  byte timestamp[8];
  byte from_seq_no[4];
  byte count[4]
};

int retransmit_request_message_at;

/* every byte of Retransmit Request Message set to one value */
inline fill_retransmit_request_message(retransmit_request_message_record, retransmit_request_message_value) {
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 4 -> retransmit_request_message_record.session_id[retransmit_request_message_at] = retransmit_request_message_value; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 8 -> retransmit_request_message_record.timestamp[retransmit_request_message_at] = retransmit_request_message_value; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 4 -> retransmit_request_message_record.from_seq_no[retransmit_request_message_at] = retransmit_request_message_value; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 4 -> retransmit_request_message_record.count[retransmit_request_message_at] = retransmit_request_message_value; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Retransmit Request Message set to where it lies, so a field read out of place says so */
inline ramp_retransmit_request_message(retransmit_request_message_record, retransmit_request_message_base) {
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 4 -> retransmit_request_message_record.session_id[retransmit_request_message_at] = (retransmit_request_message_base + 0 + retransmit_request_message_at + 1) % 256; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 8 -> retransmit_request_message_record.timestamp[retransmit_request_message_at] = (retransmit_request_message_base + 4 + retransmit_request_message_at + 1) % 256; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 4 -> retransmit_request_message_record.from_seq_no[retransmit_request_message_at] = (retransmit_request_message_base + 12 + retransmit_request_message_at + 1) % 256; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 4 -> retransmit_request_message_record.count[retransmit_request_message_at] = (retransmit_request_message_base + 16 + retransmit_request_message_at + 1) % 256; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmit Request Message to the wire, 20 bytes from where the cursor stands */
inline encode_retransmit_request_message(retransmit_request_message_record) {
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 4 -> wire[at] = retransmit_request_message_record.session_id[retransmit_request_message_at]; at = at + 1; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 8 -> wire[at] = retransmit_request_message_record.timestamp[retransmit_request_message_at]; at = at + 1; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 4 -> wire[at] = retransmit_request_message_record.from_seq_no[retransmit_request_message_at]; at = at + 1; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 4 -> wire[at] = retransmit_request_message_record.count[retransmit_request_message_at]; at = at + 1; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmit Request Message off the wire, 20 bytes from where the cursor stands */
inline decode_retransmit_request_message(retransmit_request_message_record) {
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 4 -> retransmit_request_message_record.session_id[retransmit_request_message_at] = wire[at]; at = at + 1; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 8 -> retransmit_request_message_record.timestamp[retransmit_request_message_at] = wire[at]; at = at + 1; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 4 -> retransmit_request_message_record.from_seq_no[retransmit_request_message_at] = wire[at]; at = at + 1; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 4 -> retransmit_request_message_record.count[retransmit_request_message_at] = wire[at]; at = at + 1; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Retransmit Request Message is what was written, byte for byte */
inline equal_retransmit_request_message(retransmit_request_message_read, retransmit_request_message_written) {
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 4 -> assert(retransmit_request_message_read.session_id[retransmit_request_message_at] == retransmit_request_message_written.session_id[retransmit_request_message_at]); retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 8 -> assert(retransmit_request_message_read.timestamp[retransmit_request_message_at] == retransmit_request_message_written.timestamp[retransmit_request_message_at]); retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 4 -> assert(retransmit_request_message_read.from_seq_no[retransmit_request_message_at] == retransmit_request_message_written.from_seq_no[retransmit_request_message_at]); retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 4 -> assert(retransmit_request_message_read.count[retransmit_request_message_at] == retransmit_request_message_written.count[retransmit_request_message_at]); retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Retransmission Message: 20 bytes ---------------------------------------- */

/* RetransmissionMessage */
typedef RetransmissionMessage {
  byte session_id[4];
  byte request_timestamp[8];
  byte next_seq_no[4];
  byte count[4]
};

int retransmission_message_at;

/* every byte of Retransmission Message set to one value */
inline fill_retransmission_message(retransmission_message_record, retransmission_message_value) {
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 4 -> retransmission_message_record.session_id[retransmission_message_at] = retransmission_message_value; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 8 -> retransmission_message_record.request_timestamp[retransmission_message_at] = retransmission_message_value; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 4 -> retransmission_message_record.next_seq_no[retransmission_message_at] = retransmission_message_value; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 4 -> retransmission_message_record.count[retransmission_message_at] = retransmission_message_value; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Retransmission Message set to where it lies, so a field read out of place says so */
inline ramp_retransmission_message(retransmission_message_record, retransmission_message_base) {
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 4 -> retransmission_message_record.session_id[retransmission_message_at] = (retransmission_message_base + 0 + retransmission_message_at + 1) % 256; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 8 -> retransmission_message_record.request_timestamp[retransmission_message_at] = (retransmission_message_base + 4 + retransmission_message_at + 1) % 256; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 4 -> retransmission_message_record.next_seq_no[retransmission_message_at] = (retransmission_message_base + 12 + retransmission_message_at + 1) % 256; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 4 -> retransmission_message_record.count[retransmission_message_at] = (retransmission_message_base + 16 + retransmission_message_at + 1) % 256; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Message to the wire, 20 bytes from where the cursor stands */
inline encode_retransmission_message(retransmission_message_record) {
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 4 -> wire[at] = retransmission_message_record.session_id[retransmission_message_at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 8 -> wire[at] = retransmission_message_record.request_timestamp[retransmission_message_at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 4 -> wire[at] = retransmission_message_record.next_seq_no[retransmission_message_at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 4 -> wire[at] = retransmission_message_record.count[retransmission_message_at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Message off the wire, 20 bytes from where the cursor stands */
inline decode_retransmission_message(retransmission_message_record) {
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 4 -> retransmission_message_record.session_id[retransmission_message_at] = wire[at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 8 -> retransmission_message_record.request_timestamp[retransmission_message_at] = wire[at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 4 -> retransmission_message_record.next_seq_no[retransmission_message_at] = wire[at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 4 -> retransmission_message_record.count[retransmission_message_at] = wire[at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Retransmission Message is what was written, byte for byte */
inline equal_retransmission_message(retransmission_message_read, retransmission_message_written) {
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 4 -> assert(retransmission_message_read.session_id[retransmission_message_at] == retransmission_message_written.session_id[retransmission_message_at]); retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 8 -> assert(retransmission_message_read.request_timestamp[retransmission_message_at] == retransmission_message_written.request_timestamp[retransmission_message_at]); retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 4 -> assert(retransmission_message_read.next_seq_no[retransmission_message_at] == retransmission_message_written.next_seq_no[retransmission_message_at]); retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 4 -> assert(retransmission_message_read.count[retransmission_message_at] == retransmission_message_written.count[retransmission_message_at]); retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Retransmit Reject Message: 13 bytes ------------------------------------- */

/* RetransmitRejectMessage */
typedef RetransmitRejectMessage {
  byte session_id[4];
  byte request_timestamp[8];
  byte retransmit_reject_code
};

int retransmit_reject_message_at;

/* every byte of Retransmit Reject Message set to one value */
inline fill_retransmit_reject_message(retransmit_reject_message_record, retransmit_reject_message_value) {
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 4 -> retransmit_reject_message_record.session_id[retransmit_reject_message_at] = retransmit_reject_message_value; retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 8 -> retransmit_reject_message_record.request_timestamp[retransmit_reject_message_at] = retransmit_reject_message_value; retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  retransmit_reject_message_record.retransmit_reject_code = retransmit_reject_message_value;
  skip
}

/* each byte of Retransmit Reject Message set to where it lies, so a field read out of place says so */
inline ramp_retransmit_reject_message(retransmit_reject_message_record, retransmit_reject_message_base) {
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 4 -> retransmit_reject_message_record.session_id[retransmit_reject_message_at] = (retransmit_reject_message_base + 0 + retransmit_reject_message_at + 1) % 256; retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 8 -> retransmit_reject_message_record.request_timestamp[retransmit_reject_message_at] = (retransmit_reject_message_base + 4 + retransmit_reject_message_at + 1) % 256; retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  retransmit_reject_message_record.retransmit_reject_code = (retransmit_reject_message_base + 12 + 1) % 256;
  skip
}

/* Retransmit Reject Message to the wire, 13 bytes from where the cursor stands */
inline encode_retransmit_reject_message(retransmit_reject_message_record) {
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 4 -> wire[at] = retransmit_reject_message_record.session_id[retransmit_reject_message_at]; at = at + 1; retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 8 -> wire[at] = retransmit_reject_message_record.request_timestamp[retransmit_reject_message_at]; at = at + 1; retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = retransmit_reject_message_record.retransmit_reject_code; at = at + 1;
  skip
}

/* Retransmit Reject Message off the wire, 13 bytes from where the cursor stands */
inline decode_retransmit_reject_message(retransmit_reject_message_record) {
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 4 -> retransmit_reject_message_record.session_id[retransmit_reject_message_at] = wire[at]; at = at + 1; retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 8 -> retransmit_reject_message_record.request_timestamp[retransmit_reject_message_at] = wire[at]; at = at + 1; retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  retransmit_reject_message_record.retransmit_reject_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Retransmit Reject Message is what was written, byte for byte */
inline equal_retransmit_reject_message(retransmit_reject_message_read, retransmit_reject_message_written) {
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 4 -> assert(retransmit_reject_message_read.session_id[retransmit_reject_message_at] == retransmit_reject_message_written.session_id[retransmit_reject_message_at]); retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 8 -> assert(retransmit_reject_message_read.request_timestamp[retransmit_reject_message_at] == retransmit_reject_message_written.request_timestamp[retransmit_reject_message_at]); retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  assert(retransmit_reject_message_read.retransmit_reject_code == retransmit_reject_message_written.retransmit_reject_code);
  skip
}

/* ---- Inbound Business Header: 18 bytes --------------------------------------- */

/* InboundBusinessHeader */
typedef InboundBusinessHeader {
  byte session_id[4];
  byte msg_seq_num[4];
  byte sending_time[8];
  byte market_segment_id;
  byte padding
};

int inbound_business_header_at;

/* every byte of Inbound Business Header set to one value */
inline fill_inbound_business_header(inbound_business_header_record, inbound_business_header_value) {
  inbound_business_header_at = 0;
  do
  :: inbound_business_header_at < 4 -> inbound_business_header_record.session_id[inbound_business_header_at] = inbound_business_header_value; inbound_business_header_at = inbound_business_header_at + 1
  :: else -> break
  od;
  inbound_business_header_at = 0;
  do
  :: inbound_business_header_at < 4 -> inbound_business_header_record.msg_seq_num[inbound_business_header_at] = inbound_business_header_value; inbound_business_header_at = inbound_business_header_at + 1
  :: else -> break
  od;
  inbound_business_header_at = 0;
  do
  :: inbound_business_header_at < 8 -> inbound_business_header_record.sending_time[inbound_business_header_at] = inbound_business_header_value; inbound_business_header_at = inbound_business_header_at + 1
  :: else -> break
  od;
  inbound_business_header_record.market_segment_id = inbound_business_header_value;
  inbound_business_header_record.padding = inbound_business_header_value;
  skip
}

/* each byte of Inbound Business Header set to where it lies, so a field read out of place says so */
inline ramp_inbound_business_header(inbound_business_header_record, inbound_business_header_base) {
  inbound_business_header_at = 0;
  do
  :: inbound_business_header_at < 4 -> inbound_business_header_record.session_id[inbound_business_header_at] = (inbound_business_header_base + 0 + inbound_business_header_at + 1) % 256; inbound_business_header_at = inbound_business_header_at + 1
  :: else -> break
  od;
  inbound_business_header_at = 0;
  do
  :: inbound_business_header_at < 4 -> inbound_business_header_record.msg_seq_num[inbound_business_header_at] = (inbound_business_header_base + 4 + inbound_business_header_at + 1) % 256; inbound_business_header_at = inbound_business_header_at + 1
  :: else -> break
  od;
  inbound_business_header_at = 0;
  do
  :: inbound_business_header_at < 8 -> inbound_business_header_record.sending_time[inbound_business_header_at] = (inbound_business_header_base + 8 + inbound_business_header_at + 1) % 256; inbound_business_header_at = inbound_business_header_at + 1
  :: else -> break
  od;
  inbound_business_header_record.market_segment_id = (inbound_business_header_base + 16 + 1) % 256;
  inbound_business_header_record.padding = (inbound_business_header_base + 17 + 1) % 256;
  skip
}

/* Inbound Business Header to the wire, 18 bytes from where the cursor stands */
inline encode_inbound_business_header(inbound_business_header_record) {
  inbound_business_header_at = 0;
  do
  :: inbound_business_header_at < 4 -> wire[at] = inbound_business_header_record.session_id[inbound_business_header_at]; at = at + 1; inbound_business_header_at = inbound_business_header_at + 1
  :: else -> break
  od;
  inbound_business_header_at = 0;
  do
  :: inbound_business_header_at < 4 -> wire[at] = inbound_business_header_record.msg_seq_num[inbound_business_header_at]; at = at + 1; inbound_business_header_at = inbound_business_header_at + 1
  :: else -> break
  od;
  inbound_business_header_at = 0;
  do
  :: inbound_business_header_at < 8 -> wire[at] = inbound_business_header_record.sending_time[inbound_business_header_at]; at = at + 1; inbound_business_header_at = inbound_business_header_at + 1
  :: else -> break
  od;
  wire[at] = inbound_business_header_record.market_segment_id; at = at + 1;
  wire[at] = inbound_business_header_record.padding; at = at + 1;
  skip
}

/* Inbound Business Header off the wire, 18 bytes from where the cursor stands */
inline decode_inbound_business_header(inbound_business_header_record) {
  inbound_business_header_at = 0;
  do
  :: inbound_business_header_at < 4 -> inbound_business_header_record.session_id[inbound_business_header_at] = wire[at]; at = at + 1; inbound_business_header_at = inbound_business_header_at + 1
  :: else -> break
  od;
  inbound_business_header_at = 0;
  do
  :: inbound_business_header_at < 4 -> inbound_business_header_record.msg_seq_num[inbound_business_header_at] = wire[at]; at = at + 1; inbound_business_header_at = inbound_business_header_at + 1
  :: else -> break
  od;
  inbound_business_header_at = 0;
  do
  :: inbound_business_header_at < 8 -> inbound_business_header_record.sending_time[inbound_business_header_at] = wire[at]; at = at + 1; inbound_business_header_at = inbound_business_header_at + 1
  :: else -> break
  od;
  inbound_business_header_record.market_segment_id = wire[at]; at = at + 1;
  inbound_business_header_record.padding = wire[at]; at = at + 1;
  skip
}

/* what was read of Inbound Business Header is what was written, byte for byte */
inline equal_inbound_business_header(inbound_business_header_read, inbound_business_header_written) {
  inbound_business_header_at = 0;
  do
  :: inbound_business_header_at < 4 -> assert(inbound_business_header_read.session_id[inbound_business_header_at] == inbound_business_header_written.session_id[inbound_business_header_at]); inbound_business_header_at = inbound_business_header_at + 1
  :: else -> break
  od;
  inbound_business_header_at = 0;
  do
  :: inbound_business_header_at < 4 -> assert(inbound_business_header_read.msg_seq_num[inbound_business_header_at] == inbound_business_header_written.msg_seq_num[inbound_business_header_at]); inbound_business_header_at = inbound_business_header_at + 1
  :: else -> break
  od;
  inbound_business_header_at = 0;
  do
  :: inbound_business_header_at < 8 -> assert(inbound_business_header_read.sending_time[inbound_business_header_at] == inbound_business_header_written.sending_time[inbound_business_header_at]); inbound_business_header_at = inbound_business_header_at + 1
  :: else -> break
  od;
  assert(inbound_business_header_read.market_segment_id == inbound_business_header_written.market_segment_id);
  assert(inbound_business_header_read.padding == inbound_business_header_written.padding);
  skip
}

/* ---- Investor Id: 8 bytes ---------------------------------------------------- */

/* SimpleNewOrderMessage */
typedef InvestorId {
  byte prefix[2];
  byte offset_2_padding_2[2];
  byte document[4]
};

int investor_id_at;

/* every byte of Investor Id set to one value */
inline fill_investor_id(investor_id_record, investor_id_value) {
  investor_id_at = 0;
  do
  :: investor_id_at < 2 -> investor_id_record.prefix[investor_id_at] = investor_id_value; investor_id_at = investor_id_at + 1
  :: else -> break
  od;
  investor_id_at = 0;
  do
  :: investor_id_at < 2 -> investor_id_record.offset_2_padding_2[investor_id_at] = investor_id_value; investor_id_at = investor_id_at + 1
  :: else -> break
  od;
  investor_id_at = 0;
  do
  :: investor_id_at < 4 -> investor_id_record.document[investor_id_at] = investor_id_value; investor_id_at = investor_id_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Investor Id set to where it lies, so a field read out of place says so */
inline ramp_investor_id(investor_id_record, investor_id_base) {
  investor_id_at = 0;
  do
  :: investor_id_at < 2 -> investor_id_record.prefix[investor_id_at] = (investor_id_base + 0 + investor_id_at + 1) % 256; investor_id_at = investor_id_at + 1
  :: else -> break
  od;
  investor_id_at = 0;
  do
  :: investor_id_at < 2 -> investor_id_record.offset_2_padding_2[investor_id_at] = (investor_id_base + 2 + investor_id_at + 1) % 256; investor_id_at = investor_id_at + 1
  :: else -> break
  od;
  investor_id_at = 0;
  do
  :: investor_id_at < 4 -> investor_id_record.document[investor_id_at] = (investor_id_base + 4 + investor_id_at + 1) % 256; investor_id_at = investor_id_at + 1
  :: else -> break
  od;
  skip
}

/* Investor Id to the wire, 8 bytes from where the cursor stands */
inline encode_investor_id(investor_id_record) {
  investor_id_at = 0;
  do
  :: investor_id_at < 2 -> wire[at] = investor_id_record.prefix[investor_id_at]; at = at + 1; investor_id_at = investor_id_at + 1
  :: else -> break
  od;
  investor_id_at = 0;
  do
  :: investor_id_at < 2 -> wire[at] = investor_id_record.offset_2_padding_2[investor_id_at]; at = at + 1; investor_id_at = investor_id_at + 1
  :: else -> break
  od;
  investor_id_at = 0;
  do
  :: investor_id_at < 4 -> wire[at] = investor_id_record.document[investor_id_at]; at = at + 1; investor_id_at = investor_id_at + 1
  :: else -> break
  od;
  skip
}

/* Investor Id off the wire, 8 bytes from where the cursor stands */
inline decode_investor_id(investor_id_record) {
  investor_id_at = 0;
  do
  :: investor_id_at < 2 -> investor_id_record.prefix[investor_id_at] = wire[at]; at = at + 1; investor_id_at = investor_id_at + 1
  :: else -> break
  od;
  investor_id_at = 0;
  do
  :: investor_id_at < 2 -> investor_id_record.offset_2_padding_2[investor_id_at] = wire[at]; at = at + 1; investor_id_at = investor_id_at + 1
  :: else -> break
  od;
  investor_id_at = 0;
  do
  :: investor_id_at < 4 -> investor_id_record.document[investor_id_at] = wire[at]; at = at + 1; investor_id_at = investor_id_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Investor Id is what was written, byte for byte */
inline equal_investor_id(investor_id_read, investor_id_written) {
  investor_id_at = 0;
  do
  :: investor_id_at < 2 -> assert(investor_id_read.prefix[investor_id_at] == investor_id_written.prefix[investor_id_at]); investor_id_at = investor_id_at + 1
  :: else -> break
  od;
  investor_id_at = 0;
  do
  :: investor_id_at < 2 -> assert(investor_id_read.offset_2_padding_2[investor_id_at] == investor_id_written.offset_2_padding_2[investor_id_at]); investor_id_at = investor_id_at + 1
  :: else -> break
  od;
  investor_id_at = 0;
  do
  :: investor_id_at < 4 -> assert(investor_id_read.document[investor_id_at] == investor_id_written.document[investor_id_at]); investor_id_at = investor_id_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Custodian Info: 12 bytes ------------------------------------------------ */

/* NewOrderSingleMessage */
typedef CustodianInfo {
  byte custodian[4];
  byte custody_account[4];
  byte custody_allocation_type[4]
};

int custodian_info_at;

/* every byte of Custodian Info set to one value */
inline fill_custodian_info(custodian_info_record, custodian_info_value) {
  custodian_info_at = 0;
  do
  :: custodian_info_at < 4 -> custodian_info_record.custodian[custodian_info_at] = custodian_info_value; custodian_info_at = custodian_info_at + 1
  :: else -> break
  od;
  custodian_info_at = 0;
  do
  :: custodian_info_at < 4 -> custodian_info_record.custody_account[custodian_info_at] = custodian_info_value; custodian_info_at = custodian_info_at + 1
  :: else -> break
  od;
  custodian_info_at = 0;
  do
  :: custodian_info_at < 4 -> custodian_info_record.custody_allocation_type[custodian_info_at] = custodian_info_value; custodian_info_at = custodian_info_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Custodian Info set to where it lies, so a field read out of place says so */
inline ramp_custodian_info(custodian_info_record, custodian_info_base) {
  custodian_info_at = 0;
  do
  :: custodian_info_at < 4 -> custodian_info_record.custodian[custodian_info_at] = (custodian_info_base + 0 + custodian_info_at + 1) % 256; custodian_info_at = custodian_info_at + 1
  :: else -> break
  od;
  custodian_info_at = 0;
  do
  :: custodian_info_at < 4 -> custodian_info_record.custody_account[custodian_info_at] = (custodian_info_base + 4 + custodian_info_at + 1) % 256; custodian_info_at = custodian_info_at + 1
  :: else -> break
  od;
  custodian_info_at = 0;
  do
  :: custodian_info_at < 4 -> custodian_info_record.custody_allocation_type[custodian_info_at] = (custodian_info_base + 8 + custodian_info_at + 1) % 256; custodian_info_at = custodian_info_at + 1
  :: else -> break
  od;
  skip
}

/* Custodian Info to the wire, 12 bytes from where the cursor stands */
inline encode_custodian_info(custodian_info_record) {
  custodian_info_at = 0;
  do
  :: custodian_info_at < 4 -> wire[at] = custodian_info_record.custodian[custodian_info_at]; at = at + 1; custodian_info_at = custodian_info_at + 1
  :: else -> break
  od;
  custodian_info_at = 0;
  do
  :: custodian_info_at < 4 -> wire[at] = custodian_info_record.custody_account[custodian_info_at]; at = at + 1; custodian_info_at = custodian_info_at + 1
  :: else -> break
  od;
  custodian_info_at = 0;
  do
  :: custodian_info_at < 4 -> wire[at] = custodian_info_record.custody_allocation_type[custodian_info_at]; at = at + 1; custodian_info_at = custodian_info_at + 1
  :: else -> break
  od;
  skip
}

/* Custodian Info off the wire, 12 bytes from where the cursor stands */
inline decode_custodian_info(custodian_info_record) {
  custodian_info_at = 0;
  do
  :: custodian_info_at < 4 -> custodian_info_record.custodian[custodian_info_at] = wire[at]; at = at + 1; custodian_info_at = custodian_info_at + 1
  :: else -> break
  od;
  custodian_info_at = 0;
  do
  :: custodian_info_at < 4 -> custodian_info_record.custody_account[custodian_info_at] = wire[at]; at = at + 1; custodian_info_at = custodian_info_at + 1
  :: else -> break
  od;
  custodian_info_at = 0;
  do
  :: custodian_info_at < 4 -> custodian_info_record.custody_allocation_type[custodian_info_at] = wire[at]; at = at + 1; custodian_info_at = custodian_info_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Custodian Info is what was written, byte for byte */
inline equal_custodian_info(custodian_info_read, custodian_info_written) {
  custodian_info_at = 0;
  do
  :: custodian_info_at < 4 -> assert(custodian_info_read.custodian[custodian_info_at] == custodian_info_written.custodian[custodian_info_at]); custodian_info_at = custodian_info_at + 1
  :: else -> break
  od;
  custodian_info_at = 0;
  do
  :: custodian_info_at < 4 -> assert(custodian_info_read.custody_account[custodian_info_at] == custodian_info_written.custody_account[custodian_info_at]); custodian_info_at = custodian_info_at + 1
  :: else -> break
  od;
  custodian_info_at = 0;
  do
  :: custodian_info_at < 4 -> assert(custodian_info_read.custody_allocation_type[custodian_info_at] == custodian_info_written.custody_allocation_type[custodian_info_at]); custodian_info_at = custodian_info_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Group Size Encoding: 3 bytes -------------------------------------------- */

/* GroupSizeEncoding */
typedef GroupSizeEncoding {
  byte block_length[2];
  byte num_in_group
};

int group_size_encoding_at;

/* every byte of Group Size Encoding set to one value */
inline fill_group_size_encoding(group_size_encoding_record, group_size_encoding_value) {
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> group_size_encoding_record.block_length[group_size_encoding_at] = group_size_encoding_value; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  group_size_encoding_record.num_in_group = group_size_encoding_value;
  skip
}

/* each byte of Group Size Encoding set to where it lies, so a field read out of place says so */
inline ramp_group_size_encoding(group_size_encoding_record, group_size_encoding_base) {
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> group_size_encoding_record.block_length[group_size_encoding_at] = (group_size_encoding_base + 0 + group_size_encoding_at + 1) % 256; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  group_size_encoding_record.num_in_group = (group_size_encoding_base + 2 + 1) % 256;
  skip
}

/* Group Size Encoding to the wire, 3 bytes from where the cursor stands */
inline encode_group_size_encoding(group_size_encoding_record) {
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> wire[at] = group_size_encoding_record.block_length[group_size_encoding_at]; at = at + 1; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  wire[at] = group_size_encoding_record.num_in_group; at = at + 1;
  skip
}

/* Group Size Encoding off the wire, 3 bytes from where the cursor stands */
inline decode_group_size_encoding(group_size_encoding_record) {
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> group_size_encoding_record.block_length[group_size_encoding_at] = wire[at]; at = at + 1; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  group_size_encoding_record.num_in_group = wire[at]; at = at + 1;
  skip
}

/* what was read of Group Size Encoding is what was written, byte for byte */
inline equal_group_size_encoding(group_size_encoding_read, group_size_encoding_written) {
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> assert(group_size_encoding_read.block_length[group_size_encoding_at] == group_size_encoding_written.block_length[group_size_encoding_at]); group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  assert(group_size_encoding_read.num_in_group == group_size_encoding_written.num_in_group);
  skip
}

/* ---- Outbound Business Header: 18 bytes -------------------------------------- */

/* OutboundBusinessHeader */
typedef OutboundBusinessHeader {
  byte session_id[4];
  byte msg_seq_num[4];
  byte sending_time[8];
  byte poss_resend;
  byte padding
};

int outbound_business_header_at;

/* every byte of Outbound Business Header set to one value */
inline fill_outbound_business_header(outbound_business_header_record, outbound_business_header_value) {
  outbound_business_header_at = 0;
  do
  :: outbound_business_header_at < 4 -> outbound_business_header_record.session_id[outbound_business_header_at] = outbound_business_header_value; outbound_business_header_at = outbound_business_header_at + 1
  :: else -> break
  od;
  outbound_business_header_at = 0;
  do
  :: outbound_business_header_at < 4 -> outbound_business_header_record.msg_seq_num[outbound_business_header_at] = outbound_business_header_value; outbound_business_header_at = outbound_business_header_at + 1
  :: else -> break
  od;
  outbound_business_header_at = 0;
  do
  :: outbound_business_header_at < 8 -> outbound_business_header_record.sending_time[outbound_business_header_at] = outbound_business_header_value; outbound_business_header_at = outbound_business_header_at + 1
  :: else -> break
  od;
  outbound_business_header_record.poss_resend = outbound_business_header_value;
  outbound_business_header_record.padding = outbound_business_header_value;
  skip
}

/* each byte of Outbound Business Header set to where it lies, so a field read out of place says so */
inline ramp_outbound_business_header(outbound_business_header_record, outbound_business_header_base) {
  outbound_business_header_at = 0;
  do
  :: outbound_business_header_at < 4 -> outbound_business_header_record.session_id[outbound_business_header_at] = (outbound_business_header_base + 0 + outbound_business_header_at + 1) % 256; outbound_business_header_at = outbound_business_header_at + 1
  :: else -> break
  od;
  outbound_business_header_at = 0;
  do
  :: outbound_business_header_at < 4 -> outbound_business_header_record.msg_seq_num[outbound_business_header_at] = (outbound_business_header_base + 4 + outbound_business_header_at + 1) % 256; outbound_business_header_at = outbound_business_header_at + 1
  :: else -> break
  od;
  outbound_business_header_at = 0;
  do
  :: outbound_business_header_at < 8 -> outbound_business_header_record.sending_time[outbound_business_header_at] = (outbound_business_header_base + 8 + outbound_business_header_at + 1) % 256; outbound_business_header_at = outbound_business_header_at + 1
  :: else -> break
  od;
  outbound_business_header_record.poss_resend = (outbound_business_header_base + 16 + 1) % 256;
  outbound_business_header_record.padding = (outbound_business_header_base + 17 + 1) % 256;
  skip
}

/* Outbound Business Header to the wire, 18 bytes from where the cursor stands */
inline encode_outbound_business_header(outbound_business_header_record) {
  outbound_business_header_at = 0;
  do
  :: outbound_business_header_at < 4 -> wire[at] = outbound_business_header_record.session_id[outbound_business_header_at]; at = at + 1; outbound_business_header_at = outbound_business_header_at + 1
  :: else -> break
  od;
  outbound_business_header_at = 0;
  do
  :: outbound_business_header_at < 4 -> wire[at] = outbound_business_header_record.msg_seq_num[outbound_business_header_at]; at = at + 1; outbound_business_header_at = outbound_business_header_at + 1
  :: else -> break
  od;
  outbound_business_header_at = 0;
  do
  :: outbound_business_header_at < 8 -> wire[at] = outbound_business_header_record.sending_time[outbound_business_header_at]; at = at + 1; outbound_business_header_at = outbound_business_header_at + 1
  :: else -> break
  od;
  wire[at] = outbound_business_header_record.poss_resend; at = at + 1;
  wire[at] = outbound_business_header_record.padding; at = at + 1;
  skip
}

/* Outbound Business Header off the wire, 18 bytes from where the cursor stands */
inline decode_outbound_business_header(outbound_business_header_record) {
  outbound_business_header_at = 0;
  do
  :: outbound_business_header_at < 4 -> outbound_business_header_record.session_id[outbound_business_header_at] = wire[at]; at = at + 1; outbound_business_header_at = outbound_business_header_at + 1
  :: else -> break
  od;
  outbound_business_header_at = 0;
  do
  :: outbound_business_header_at < 4 -> outbound_business_header_record.msg_seq_num[outbound_business_header_at] = wire[at]; at = at + 1; outbound_business_header_at = outbound_business_header_at + 1
  :: else -> break
  od;
  outbound_business_header_at = 0;
  do
  :: outbound_business_header_at < 8 -> outbound_business_header_record.sending_time[outbound_business_header_at] = wire[at]; at = at + 1; outbound_business_header_at = outbound_business_header_at + 1
  :: else -> break
  od;
  outbound_business_header_record.poss_resend = wire[at]; at = at + 1;
  outbound_business_header_record.padding = wire[at]; at = at + 1;
  skip
}

/* what was read of Outbound Business Header is what was written, byte for byte */
inline equal_outbound_business_header(outbound_business_header_read, outbound_business_header_written) {
  outbound_business_header_at = 0;
  do
  :: outbound_business_header_at < 4 -> assert(outbound_business_header_read.session_id[outbound_business_header_at] == outbound_business_header_written.session_id[outbound_business_header_at]); outbound_business_header_at = outbound_business_header_at + 1
  :: else -> break
  od;
  outbound_business_header_at = 0;
  do
  :: outbound_business_header_at < 4 -> assert(outbound_business_header_read.msg_seq_num[outbound_business_header_at] == outbound_business_header_written.msg_seq_num[outbound_business_header_at]); outbound_business_header_at = outbound_business_header_at + 1
  :: else -> break
  od;
  outbound_business_header_at = 0;
  do
  :: outbound_business_header_at < 8 -> assert(outbound_business_header_read.sending_time[outbound_business_header_at] == outbound_business_header_written.sending_time[outbound_business_header_at]); outbound_business_header_at = outbound_business_header_at + 1
  :: else -> break
  od;
  assert(outbound_business_header_read.poss_resend == outbound_business_header_written.poss_resend);
  assert(outbound_business_header_read.padding == outbound_business_header_written.padding);
  skip
}

/* ---- Security Definition Response Message: 83 bytes -------------------------- */

/* SecurityDefinitionResponseMessage */
typedef SecurityDefinitionResponseMessage {
  OutboundBusinessHeader outbound_business_header;
  byte offset_18_padding_2[2];
  byte security_req_id[8];
  byte security_id_optional[8];
  byte security_response_type;
  byte security_strategy_type[3];
  byte symbol[20];
  byte security_response_id[8];
  byte sender_location[10];
  byte entering_trader[5]
};

int security_definition_response_message_at;

/* every byte of Security Definition Response Message set to one value */
inline fill_security_definition_response_message(security_definition_response_message_record, security_definition_response_message_value) {
  fill_outbound_business_header(security_definition_response_message_record.outbound_business_header, security_definition_response_message_value);
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 2 -> security_definition_response_message_record.offset_18_padding_2[security_definition_response_message_at] = security_definition_response_message_value; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 8 -> security_definition_response_message_record.security_req_id[security_definition_response_message_at] = security_definition_response_message_value; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 8 -> security_definition_response_message_record.security_id_optional[security_definition_response_message_at] = security_definition_response_message_value; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_record.security_response_type = security_definition_response_message_value;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 3 -> security_definition_response_message_record.security_strategy_type[security_definition_response_message_at] = security_definition_response_message_value; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 20 -> security_definition_response_message_record.symbol[security_definition_response_message_at] = security_definition_response_message_value; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 8 -> security_definition_response_message_record.security_response_id[security_definition_response_message_at] = security_definition_response_message_value; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 10 -> security_definition_response_message_record.sender_location[security_definition_response_message_at] = security_definition_response_message_value; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 5 -> security_definition_response_message_record.entering_trader[security_definition_response_message_at] = security_definition_response_message_value; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Security Definition Response Message set to where it lies, so a field read out of place says so */
inline ramp_security_definition_response_message(security_definition_response_message_record, security_definition_response_message_base) {
  ramp_outbound_business_header(security_definition_response_message_record.outbound_business_header, security_definition_response_message_base + 0);
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 2 -> security_definition_response_message_record.offset_18_padding_2[security_definition_response_message_at] = (security_definition_response_message_base + 18 + security_definition_response_message_at + 1) % 256; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 8 -> security_definition_response_message_record.security_req_id[security_definition_response_message_at] = (security_definition_response_message_base + 20 + security_definition_response_message_at + 1) % 256; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 8 -> security_definition_response_message_record.security_id_optional[security_definition_response_message_at] = (security_definition_response_message_base + 28 + security_definition_response_message_at + 1) % 256; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_record.security_response_type = (security_definition_response_message_base + 36 + 1) % 256;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 3 -> security_definition_response_message_record.security_strategy_type[security_definition_response_message_at] = (security_definition_response_message_base + 37 + security_definition_response_message_at + 1) % 256; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 20 -> security_definition_response_message_record.symbol[security_definition_response_message_at] = (security_definition_response_message_base + 40 + security_definition_response_message_at + 1) % 256; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 8 -> security_definition_response_message_record.security_response_id[security_definition_response_message_at] = (security_definition_response_message_base + 60 + security_definition_response_message_at + 1) % 256; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 10 -> security_definition_response_message_record.sender_location[security_definition_response_message_at] = (security_definition_response_message_base + 68 + security_definition_response_message_at + 1) % 256; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 5 -> security_definition_response_message_record.entering_trader[security_definition_response_message_at] = (security_definition_response_message_base + 78 + security_definition_response_message_at + 1) % 256; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Definition Response Message to the wire, 83 bytes from where the cursor stands */
inline encode_security_definition_response_message(security_definition_response_message_record) {
  encode_outbound_business_header(security_definition_response_message_record.outbound_business_header);
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 2 -> wire[at] = security_definition_response_message_record.offset_18_padding_2[security_definition_response_message_at]; at = at + 1; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 8 -> wire[at] = security_definition_response_message_record.security_req_id[security_definition_response_message_at]; at = at + 1; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 8 -> wire[at] = security_definition_response_message_record.security_id_optional[security_definition_response_message_at]; at = at + 1; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  wire[at] = security_definition_response_message_record.security_response_type; at = at + 1;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 3 -> wire[at] = security_definition_response_message_record.security_strategy_type[security_definition_response_message_at]; at = at + 1; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 20 -> wire[at] = security_definition_response_message_record.symbol[security_definition_response_message_at]; at = at + 1; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 8 -> wire[at] = security_definition_response_message_record.security_response_id[security_definition_response_message_at]; at = at + 1; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 10 -> wire[at] = security_definition_response_message_record.sender_location[security_definition_response_message_at]; at = at + 1; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 5 -> wire[at] = security_definition_response_message_record.entering_trader[security_definition_response_message_at]; at = at + 1; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Definition Response Message off the wire, 83 bytes from where the cursor stands */
inline decode_security_definition_response_message(security_definition_response_message_record) {
  decode_outbound_business_header(security_definition_response_message_record.outbound_business_header);
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 2 -> security_definition_response_message_record.offset_18_padding_2[security_definition_response_message_at] = wire[at]; at = at + 1; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 8 -> security_definition_response_message_record.security_req_id[security_definition_response_message_at] = wire[at]; at = at + 1; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 8 -> security_definition_response_message_record.security_id_optional[security_definition_response_message_at] = wire[at]; at = at + 1; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_record.security_response_type = wire[at]; at = at + 1;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 3 -> security_definition_response_message_record.security_strategy_type[security_definition_response_message_at] = wire[at]; at = at + 1; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 20 -> security_definition_response_message_record.symbol[security_definition_response_message_at] = wire[at]; at = at + 1; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 8 -> security_definition_response_message_record.security_response_id[security_definition_response_message_at] = wire[at]; at = at + 1; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 10 -> security_definition_response_message_record.sender_location[security_definition_response_message_at] = wire[at]; at = at + 1; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 5 -> security_definition_response_message_record.entering_trader[security_definition_response_message_at] = wire[at]; at = at + 1; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Security Definition Response Message is what was written, byte for byte */
inline equal_security_definition_response_message(security_definition_response_message_read, security_definition_response_message_written) {
  equal_outbound_business_header(security_definition_response_message_read.outbound_business_header, security_definition_response_message_written.outbound_business_header);
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 2 -> assert(security_definition_response_message_read.offset_18_padding_2[security_definition_response_message_at] == security_definition_response_message_written.offset_18_padding_2[security_definition_response_message_at]); security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 8 -> assert(security_definition_response_message_read.security_req_id[security_definition_response_message_at] == security_definition_response_message_written.security_req_id[security_definition_response_message_at]); security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 8 -> assert(security_definition_response_message_read.security_id_optional[security_definition_response_message_at] == security_definition_response_message_written.security_id_optional[security_definition_response_message_at]); security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  assert(security_definition_response_message_read.security_response_type == security_definition_response_message_written.security_response_type);
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 3 -> assert(security_definition_response_message_read.security_strategy_type[security_definition_response_message_at] == security_definition_response_message_written.security_strategy_type[security_definition_response_message_at]); security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 20 -> assert(security_definition_response_message_read.symbol[security_definition_response_message_at] == security_definition_response_message_written.symbol[security_definition_response_message_at]); security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 8 -> assert(security_definition_response_message_read.security_response_id[security_definition_response_message_at] == security_definition_response_message_written.security_response_id[security_definition_response_message_at]); security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 10 -> assert(security_definition_response_message_read.sender_location[security_definition_response_message_at] == security_definition_response_message_written.sender_location[security_definition_response_message_at]); security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 5 -> assert(security_definition_response_message_read.entering_trader[security_definition_response_message_at] == security_definition_response_message_written.entering_trader[security_definition_response_message_at]); security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Bidirectional Business Header: 20 bytes --------------------------------- */

/* BidirectionalBusinessHeader */
typedef BidirectionalBusinessHeader {
  byte session_id[4];
  byte msg_seq_num[4];
  byte sending_time[8];
  byte poss_resend;
  byte market_segment_id_optional;
  byte padding_char_2[2]
};

int bidirectional_business_header_at;

/* every byte of Bidirectional Business Header set to one value */
inline fill_bidirectional_business_header(bidirectional_business_header_record, bidirectional_business_header_value) {
  bidirectional_business_header_at = 0;
  do
  :: bidirectional_business_header_at < 4 -> bidirectional_business_header_record.session_id[bidirectional_business_header_at] = bidirectional_business_header_value; bidirectional_business_header_at = bidirectional_business_header_at + 1
  :: else -> break
  od;
  bidirectional_business_header_at = 0;
  do
  :: bidirectional_business_header_at < 4 -> bidirectional_business_header_record.msg_seq_num[bidirectional_business_header_at] = bidirectional_business_header_value; bidirectional_business_header_at = bidirectional_business_header_at + 1
  :: else -> break
  od;
  bidirectional_business_header_at = 0;
  do
  :: bidirectional_business_header_at < 8 -> bidirectional_business_header_record.sending_time[bidirectional_business_header_at] = bidirectional_business_header_value; bidirectional_business_header_at = bidirectional_business_header_at + 1
  :: else -> break
  od;
  bidirectional_business_header_record.poss_resend = bidirectional_business_header_value;
  bidirectional_business_header_record.market_segment_id_optional = bidirectional_business_header_value;
  bidirectional_business_header_at = 0;
  do
  :: bidirectional_business_header_at < 2 -> bidirectional_business_header_record.padding_char_2[bidirectional_business_header_at] = bidirectional_business_header_value; bidirectional_business_header_at = bidirectional_business_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Bidirectional Business Header set to where it lies, so a field read out of place says so */
inline ramp_bidirectional_business_header(bidirectional_business_header_record, bidirectional_business_header_base) {
  bidirectional_business_header_at = 0;
  do
  :: bidirectional_business_header_at < 4 -> bidirectional_business_header_record.session_id[bidirectional_business_header_at] = (bidirectional_business_header_base + 0 + bidirectional_business_header_at + 1) % 256; bidirectional_business_header_at = bidirectional_business_header_at + 1
  :: else -> break
  od;
  bidirectional_business_header_at = 0;
  do
  :: bidirectional_business_header_at < 4 -> bidirectional_business_header_record.msg_seq_num[bidirectional_business_header_at] = (bidirectional_business_header_base + 4 + bidirectional_business_header_at + 1) % 256; bidirectional_business_header_at = bidirectional_business_header_at + 1
  :: else -> break
  od;
  bidirectional_business_header_at = 0;
  do
  :: bidirectional_business_header_at < 8 -> bidirectional_business_header_record.sending_time[bidirectional_business_header_at] = (bidirectional_business_header_base + 8 + bidirectional_business_header_at + 1) % 256; bidirectional_business_header_at = bidirectional_business_header_at + 1
  :: else -> break
  od;
  bidirectional_business_header_record.poss_resend = (bidirectional_business_header_base + 16 + 1) % 256;
  bidirectional_business_header_record.market_segment_id_optional = (bidirectional_business_header_base + 17 + 1) % 256;
  bidirectional_business_header_at = 0;
  do
  :: bidirectional_business_header_at < 2 -> bidirectional_business_header_record.padding_char_2[bidirectional_business_header_at] = (bidirectional_business_header_base + 18 + bidirectional_business_header_at + 1) % 256; bidirectional_business_header_at = bidirectional_business_header_at + 1
  :: else -> break
  od;
  skip
}

/* Bidirectional Business Header to the wire, 20 bytes from where the cursor stands */
inline encode_bidirectional_business_header(bidirectional_business_header_record) {
  bidirectional_business_header_at = 0;
  do
  :: bidirectional_business_header_at < 4 -> wire[at] = bidirectional_business_header_record.session_id[bidirectional_business_header_at]; at = at + 1; bidirectional_business_header_at = bidirectional_business_header_at + 1
  :: else -> break
  od;
  bidirectional_business_header_at = 0;
  do
  :: bidirectional_business_header_at < 4 -> wire[at] = bidirectional_business_header_record.msg_seq_num[bidirectional_business_header_at]; at = at + 1; bidirectional_business_header_at = bidirectional_business_header_at + 1
  :: else -> break
  od;
  bidirectional_business_header_at = 0;
  do
  :: bidirectional_business_header_at < 8 -> wire[at] = bidirectional_business_header_record.sending_time[bidirectional_business_header_at]; at = at + 1; bidirectional_business_header_at = bidirectional_business_header_at + 1
  :: else -> break
  od;
  wire[at] = bidirectional_business_header_record.poss_resend; at = at + 1;
  wire[at] = bidirectional_business_header_record.market_segment_id_optional; at = at + 1;
  bidirectional_business_header_at = 0;
  do
  :: bidirectional_business_header_at < 2 -> wire[at] = bidirectional_business_header_record.padding_char_2[bidirectional_business_header_at]; at = at + 1; bidirectional_business_header_at = bidirectional_business_header_at + 1
  :: else -> break
  od;
  skip
}

/* Bidirectional Business Header off the wire, 20 bytes from where the cursor stands */
inline decode_bidirectional_business_header(bidirectional_business_header_record) {
  bidirectional_business_header_at = 0;
  do
  :: bidirectional_business_header_at < 4 -> bidirectional_business_header_record.session_id[bidirectional_business_header_at] = wire[at]; at = at + 1; bidirectional_business_header_at = bidirectional_business_header_at + 1
  :: else -> break
  od;
  bidirectional_business_header_at = 0;
  do
  :: bidirectional_business_header_at < 4 -> bidirectional_business_header_record.msg_seq_num[bidirectional_business_header_at] = wire[at]; at = at + 1; bidirectional_business_header_at = bidirectional_business_header_at + 1
  :: else -> break
  od;
  bidirectional_business_header_at = 0;
  do
  :: bidirectional_business_header_at < 8 -> bidirectional_business_header_record.sending_time[bidirectional_business_header_at] = wire[at]; at = at + 1; bidirectional_business_header_at = bidirectional_business_header_at + 1
  :: else -> break
  od;
  bidirectional_business_header_record.poss_resend = wire[at]; at = at + 1;
  bidirectional_business_header_record.market_segment_id_optional = wire[at]; at = at + 1;
  bidirectional_business_header_at = 0;
  do
  :: bidirectional_business_header_at < 2 -> bidirectional_business_header_record.padding_char_2[bidirectional_business_header_at] = wire[at]; at = at + 1; bidirectional_business_header_at = bidirectional_business_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Bidirectional Business Header is what was written, byte for byte */
inline equal_bidirectional_business_header(bidirectional_business_header_read, bidirectional_business_header_written) {
  bidirectional_business_header_at = 0;
  do
  :: bidirectional_business_header_at < 4 -> assert(bidirectional_business_header_read.session_id[bidirectional_business_header_at] == bidirectional_business_header_written.session_id[bidirectional_business_header_at]); bidirectional_business_header_at = bidirectional_business_header_at + 1
  :: else -> break
  od;
  bidirectional_business_header_at = 0;
  do
  :: bidirectional_business_header_at < 4 -> assert(bidirectional_business_header_read.msg_seq_num[bidirectional_business_header_at] == bidirectional_business_header_written.msg_seq_num[bidirectional_business_header_at]); bidirectional_business_header_at = bidirectional_business_header_at + 1
  :: else -> break
  od;
  bidirectional_business_header_at = 0;
  do
  :: bidirectional_business_header_at < 8 -> assert(bidirectional_business_header_read.sending_time[bidirectional_business_header_at] == bidirectional_business_header_written.sending_time[bidirectional_business_header_at]); bidirectional_business_header_at = bidirectional_business_header_at + 1
  :: else -> break
  od;
  assert(bidirectional_business_header_read.poss_resend == bidirectional_business_header_written.poss_resend);
  assert(bidirectional_business_header_read.market_segment_id_optional == bidirectional_business_header_written.market_segment_id_optional);
  bidirectional_business_header_at = 0;
  do
  :: bidirectional_business_header_at < 2 -> assert(bidirectional_business_header_read.padding_char_2[bidirectional_business_header_at] == bidirectional_business_header_written.padding_char_2[bidirectional_business_header_at]); bidirectional_business_header_at = bidirectional_business_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Position Maintenance Cancel Request Message: 65 bytes ------------------- */

/* PositionMaintenanceCancelRequestMessage */
typedef PositionMaintenanceCancelRequestMessage {
  InboundBusinessHeader inbound_business_header;
  byte pos_req_id[8];
  byte security_id[8];
  byte orig_pos_req_ref_id[8];
  byte pos_maint_rpt_ref_id[8];
  byte sender_location[10];
  byte entering_trader[5]
};

int position_maintenance_cancel_request_message_at;

/* every byte of Position Maintenance Cancel Request Message set to one value */
inline fill_position_maintenance_cancel_request_message(position_maintenance_cancel_request_message_record, position_maintenance_cancel_request_message_value) {
  fill_inbound_business_header(position_maintenance_cancel_request_message_record.inbound_business_header, position_maintenance_cancel_request_message_value);
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 8 -> position_maintenance_cancel_request_message_record.pos_req_id[position_maintenance_cancel_request_message_at] = position_maintenance_cancel_request_message_value; position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 8 -> position_maintenance_cancel_request_message_record.security_id[position_maintenance_cancel_request_message_at] = position_maintenance_cancel_request_message_value; position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 8 -> position_maintenance_cancel_request_message_record.orig_pos_req_ref_id[position_maintenance_cancel_request_message_at] = position_maintenance_cancel_request_message_value; position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 8 -> position_maintenance_cancel_request_message_record.pos_maint_rpt_ref_id[position_maintenance_cancel_request_message_at] = position_maintenance_cancel_request_message_value; position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 10 -> position_maintenance_cancel_request_message_record.sender_location[position_maintenance_cancel_request_message_at] = position_maintenance_cancel_request_message_value; position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 5 -> position_maintenance_cancel_request_message_record.entering_trader[position_maintenance_cancel_request_message_at] = position_maintenance_cancel_request_message_value; position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Position Maintenance Cancel Request Message set to where it lies, so a field read out of place says so */
inline ramp_position_maintenance_cancel_request_message(position_maintenance_cancel_request_message_record, position_maintenance_cancel_request_message_base) {
  ramp_inbound_business_header(position_maintenance_cancel_request_message_record.inbound_business_header, position_maintenance_cancel_request_message_base + 0);
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 8 -> position_maintenance_cancel_request_message_record.pos_req_id[position_maintenance_cancel_request_message_at] = (position_maintenance_cancel_request_message_base + 18 + position_maintenance_cancel_request_message_at + 1) % 256; position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 8 -> position_maintenance_cancel_request_message_record.security_id[position_maintenance_cancel_request_message_at] = (position_maintenance_cancel_request_message_base + 26 + position_maintenance_cancel_request_message_at + 1) % 256; position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 8 -> position_maintenance_cancel_request_message_record.orig_pos_req_ref_id[position_maintenance_cancel_request_message_at] = (position_maintenance_cancel_request_message_base + 34 + position_maintenance_cancel_request_message_at + 1) % 256; position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 8 -> position_maintenance_cancel_request_message_record.pos_maint_rpt_ref_id[position_maintenance_cancel_request_message_at] = (position_maintenance_cancel_request_message_base + 42 + position_maintenance_cancel_request_message_at + 1) % 256; position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 10 -> position_maintenance_cancel_request_message_record.sender_location[position_maintenance_cancel_request_message_at] = (position_maintenance_cancel_request_message_base + 50 + position_maintenance_cancel_request_message_at + 1) % 256; position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 5 -> position_maintenance_cancel_request_message_record.entering_trader[position_maintenance_cancel_request_message_at] = (position_maintenance_cancel_request_message_base + 60 + position_maintenance_cancel_request_message_at + 1) % 256; position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Position Maintenance Cancel Request Message to the wire, 65 bytes from where the cursor stands */
inline encode_position_maintenance_cancel_request_message(position_maintenance_cancel_request_message_record) {
  encode_inbound_business_header(position_maintenance_cancel_request_message_record.inbound_business_header);
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 8 -> wire[at] = position_maintenance_cancel_request_message_record.pos_req_id[position_maintenance_cancel_request_message_at]; at = at + 1; position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 8 -> wire[at] = position_maintenance_cancel_request_message_record.security_id[position_maintenance_cancel_request_message_at]; at = at + 1; position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 8 -> wire[at] = position_maintenance_cancel_request_message_record.orig_pos_req_ref_id[position_maintenance_cancel_request_message_at]; at = at + 1; position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 8 -> wire[at] = position_maintenance_cancel_request_message_record.pos_maint_rpt_ref_id[position_maintenance_cancel_request_message_at]; at = at + 1; position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 10 -> wire[at] = position_maintenance_cancel_request_message_record.sender_location[position_maintenance_cancel_request_message_at]; at = at + 1; position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 5 -> wire[at] = position_maintenance_cancel_request_message_record.entering_trader[position_maintenance_cancel_request_message_at]; at = at + 1; position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Position Maintenance Cancel Request Message off the wire, 65 bytes from where the cursor stands */
inline decode_position_maintenance_cancel_request_message(position_maintenance_cancel_request_message_record) {
  decode_inbound_business_header(position_maintenance_cancel_request_message_record.inbound_business_header);
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 8 -> position_maintenance_cancel_request_message_record.pos_req_id[position_maintenance_cancel_request_message_at] = wire[at]; at = at + 1; position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 8 -> position_maintenance_cancel_request_message_record.security_id[position_maintenance_cancel_request_message_at] = wire[at]; at = at + 1; position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 8 -> position_maintenance_cancel_request_message_record.orig_pos_req_ref_id[position_maintenance_cancel_request_message_at] = wire[at]; at = at + 1; position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 8 -> position_maintenance_cancel_request_message_record.pos_maint_rpt_ref_id[position_maintenance_cancel_request_message_at] = wire[at]; at = at + 1; position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 10 -> position_maintenance_cancel_request_message_record.sender_location[position_maintenance_cancel_request_message_at] = wire[at]; at = at + 1; position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 5 -> position_maintenance_cancel_request_message_record.entering_trader[position_maintenance_cancel_request_message_at] = wire[at]; at = at + 1; position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Position Maintenance Cancel Request Message is what was written, byte for byte */
inline equal_position_maintenance_cancel_request_message(position_maintenance_cancel_request_message_read, position_maintenance_cancel_request_message_written) {
  equal_inbound_business_header(position_maintenance_cancel_request_message_read.inbound_business_header, position_maintenance_cancel_request_message_written.inbound_business_header);
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 8 -> assert(position_maintenance_cancel_request_message_read.pos_req_id[position_maintenance_cancel_request_message_at] == position_maintenance_cancel_request_message_written.pos_req_id[position_maintenance_cancel_request_message_at]); position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 8 -> assert(position_maintenance_cancel_request_message_read.security_id[position_maintenance_cancel_request_message_at] == position_maintenance_cancel_request_message_written.security_id[position_maintenance_cancel_request_message_at]); position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 8 -> assert(position_maintenance_cancel_request_message_read.orig_pos_req_ref_id[position_maintenance_cancel_request_message_at] == position_maintenance_cancel_request_message_written.orig_pos_req_ref_id[position_maintenance_cancel_request_message_at]); position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 8 -> assert(position_maintenance_cancel_request_message_read.pos_maint_rpt_ref_id[position_maintenance_cancel_request_message_at] == position_maintenance_cancel_request_message_written.pos_maint_rpt_ref_id[position_maintenance_cancel_request_message_at]); position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 10 -> assert(position_maintenance_cancel_request_message_read.sender_location[position_maintenance_cancel_request_message_at] == position_maintenance_cancel_request_message_written.sender_location[position_maintenance_cancel_request_message_at]); position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  position_maintenance_cancel_request_message_at = 0;
  do
  :: position_maintenance_cancel_request_message_at < 5 -> assert(position_maintenance_cancel_request_message_read.entering_trader[position_maintenance_cancel_request_message_at] == position_maintenance_cancel_request_message_written.entering_trader[position_maintenance_cancel_request_message_at]); position_maintenance_cancel_request_message_at = position_maintenance_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Allocation Report Message: 84 bytes ------------------------------------- */

/* AllocationReportMessage */
typedef AllocationReportMessage {
  OutboundBusinessHeader outbound_business_header;
  byte alloc_id[8];
  byte security_id[8];
  byte alloc_report_id[8];
  byte alloc_trans_type;
  byte alloc_report_type;
  byte alloc_no_orders_type;
  byte alloc_rej_code[4];
  byte quantity[8];
  byte alloc_status;
  byte trade_date_optional[2];
  byte transact_time[8];
  byte side;
  byte sender_location[10];
  byte entering_trader[5]
};

int allocation_report_message_at;

/* every byte of Allocation Report Message set to one value */
inline fill_allocation_report_message(allocation_report_message_record, allocation_report_message_value) {
  fill_outbound_business_header(allocation_report_message_record.outbound_business_header, allocation_report_message_value);
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 8 -> allocation_report_message_record.alloc_id[allocation_report_message_at] = allocation_report_message_value; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 8 -> allocation_report_message_record.security_id[allocation_report_message_at] = allocation_report_message_value; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 8 -> allocation_report_message_record.alloc_report_id[allocation_report_message_at] = allocation_report_message_value; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_record.alloc_trans_type = allocation_report_message_value;
  allocation_report_message_record.alloc_report_type = allocation_report_message_value;
  allocation_report_message_record.alloc_no_orders_type = allocation_report_message_value;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 4 -> allocation_report_message_record.alloc_rej_code[allocation_report_message_at] = allocation_report_message_value; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 8 -> allocation_report_message_record.quantity[allocation_report_message_at] = allocation_report_message_value; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_record.alloc_status = allocation_report_message_value;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 2 -> allocation_report_message_record.trade_date_optional[allocation_report_message_at] = allocation_report_message_value; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 8 -> allocation_report_message_record.transact_time[allocation_report_message_at] = allocation_report_message_value; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_record.side = allocation_report_message_value;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 10 -> allocation_report_message_record.sender_location[allocation_report_message_at] = allocation_report_message_value; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 5 -> allocation_report_message_record.entering_trader[allocation_report_message_at] = allocation_report_message_value; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Allocation Report Message set to where it lies, so a field read out of place says so */
inline ramp_allocation_report_message(allocation_report_message_record, allocation_report_message_base) {
  ramp_outbound_business_header(allocation_report_message_record.outbound_business_header, allocation_report_message_base + 0);
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 8 -> allocation_report_message_record.alloc_id[allocation_report_message_at] = (allocation_report_message_base + 18 + allocation_report_message_at + 1) % 256; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 8 -> allocation_report_message_record.security_id[allocation_report_message_at] = (allocation_report_message_base + 26 + allocation_report_message_at + 1) % 256; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 8 -> allocation_report_message_record.alloc_report_id[allocation_report_message_at] = (allocation_report_message_base + 34 + allocation_report_message_at + 1) % 256; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_record.alloc_trans_type = (allocation_report_message_base + 42 + 1) % 256;
  allocation_report_message_record.alloc_report_type = (allocation_report_message_base + 43 + 1) % 256;
  allocation_report_message_record.alloc_no_orders_type = (allocation_report_message_base + 44 + 1) % 256;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 4 -> allocation_report_message_record.alloc_rej_code[allocation_report_message_at] = (allocation_report_message_base + 45 + allocation_report_message_at + 1) % 256; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 8 -> allocation_report_message_record.quantity[allocation_report_message_at] = (allocation_report_message_base + 49 + allocation_report_message_at + 1) % 256; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_record.alloc_status = (allocation_report_message_base + 57 + 1) % 256;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 2 -> allocation_report_message_record.trade_date_optional[allocation_report_message_at] = (allocation_report_message_base + 58 + allocation_report_message_at + 1) % 256; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 8 -> allocation_report_message_record.transact_time[allocation_report_message_at] = (allocation_report_message_base + 60 + allocation_report_message_at + 1) % 256; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_record.side = (allocation_report_message_base + 68 + 1) % 256;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 10 -> allocation_report_message_record.sender_location[allocation_report_message_at] = (allocation_report_message_base + 69 + allocation_report_message_at + 1) % 256; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 5 -> allocation_report_message_record.entering_trader[allocation_report_message_at] = (allocation_report_message_base + 79 + allocation_report_message_at + 1) % 256; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Allocation Report Message to the wire, 84 bytes from where the cursor stands */
inline encode_allocation_report_message(allocation_report_message_record) {
  encode_outbound_business_header(allocation_report_message_record.outbound_business_header);
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 8 -> wire[at] = allocation_report_message_record.alloc_id[allocation_report_message_at]; at = at + 1; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 8 -> wire[at] = allocation_report_message_record.security_id[allocation_report_message_at]; at = at + 1; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 8 -> wire[at] = allocation_report_message_record.alloc_report_id[allocation_report_message_at]; at = at + 1; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  wire[at] = allocation_report_message_record.alloc_trans_type; at = at + 1;
  wire[at] = allocation_report_message_record.alloc_report_type; at = at + 1;
  wire[at] = allocation_report_message_record.alloc_no_orders_type; at = at + 1;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 4 -> wire[at] = allocation_report_message_record.alloc_rej_code[allocation_report_message_at]; at = at + 1; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 8 -> wire[at] = allocation_report_message_record.quantity[allocation_report_message_at]; at = at + 1; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  wire[at] = allocation_report_message_record.alloc_status; at = at + 1;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 2 -> wire[at] = allocation_report_message_record.trade_date_optional[allocation_report_message_at]; at = at + 1; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 8 -> wire[at] = allocation_report_message_record.transact_time[allocation_report_message_at]; at = at + 1; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  wire[at] = allocation_report_message_record.side; at = at + 1;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 10 -> wire[at] = allocation_report_message_record.sender_location[allocation_report_message_at]; at = at + 1; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 5 -> wire[at] = allocation_report_message_record.entering_trader[allocation_report_message_at]; at = at + 1; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Allocation Report Message off the wire, 84 bytes from where the cursor stands */
inline decode_allocation_report_message(allocation_report_message_record) {
  decode_outbound_business_header(allocation_report_message_record.outbound_business_header);
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 8 -> allocation_report_message_record.alloc_id[allocation_report_message_at] = wire[at]; at = at + 1; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 8 -> allocation_report_message_record.security_id[allocation_report_message_at] = wire[at]; at = at + 1; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 8 -> allocation_report_message_record.alloc_report_id[allocation_report_message_at] = wire[at]; at = at + 1; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_record.alloc_trans_type = wire[at]; at = at + 1;
  allocation_report_message_record.alloc_report_type = wire[at]; at = at + 1;
  allocation_report_message_record.alloc_no_orders_type = wire[at]; at = at + 1;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 4 -> allocation_report_message_record.alloc_rej_code[allocation_report_message_at] = wire[at]; at = at + 1; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 8 -> allocation_report_message_record.quantity[allocation_report_message_at] = wire[at]; at = at + 1; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_record.alloc_status = wire[at]; at = at + 1;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 2 -> allocation_report_message_record.trade_date_optional[allocation_report_message_at] = wire[at]; at = at + 1; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 8 -> allocation_report_message_record.transact_time[allocation_report_message_at] = wire[at]; at = at + 1; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_record.side = wire[at]; at = at + 1;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 10 -> allocation_report_message_record.sender_location[allocation_report_message_at] = wire[at]; at = at + 1; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 5 -> allocation_report_message_record.entering_trader[allocation_report_message_at] = wire[at]; at = at + 1; allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Allocation Report Message is what was written, byte for byte */
inline equal_allocation_report_message(allocation_report_message_read, allocation_report_message_written) {
  equal_outbound_business_header(allocation_report_message_read.outbound_business_header, allocation_report_message_written.outbound_business_header);
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 8 -> assert(allocation_report_message_read.alloc_id[allocation_report_message_at] == allocation_report_message_written.alloc_id[allocation_report_message_at]); allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 8 -> assert(allocation_report_message_read.security_id[allocation_report_message_at] == allocation_report_message_written.security_id[allocation_report_message_at]); allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 8 -> assert(allocation_report_message_read.alloc_report_id[allocation_report_message_at] == allocation_report_message_written.alloc_report_id[allocation_report_message_at]); allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  assert(allocation_report_message_read.alloc_trans_type == allocation_report_message_written.alloc_trans_type);
  assert(allocation_report_message_read.alloc_report_type == allocation_report_message_written.alloc_report_type);
  assert(allocation_report_message_read.alloc_no_orders_type == allocation_report_message_written.alloc_no_orders_type);
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 4 -> assert(allocation_report_message_read.alloc_rej_code[allocation_report_message_at] == allocation_report_message_written.alloc_rej_code[allocation_report_message_at]); allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 8 -> assert(allocation_report_message_read.quantity[allocation_report_message_at] == allocation_report_message_written.quantity[allocation_report_message_at]); allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  assert(allocation_report_message_read.alloc_status == allocation_report_message_written.alloc_status);
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 2 -> assert(allocation_report_message_read.trade_date_optional[allocation_report_message_at] == allocation_report_message_written.trade_date_optional[allocation_report_message_at]); allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 8 -> assert(allocation_report_message_read.transact_time[allocation_report_message_at] == allocation_report_message_written.transact_time[allocation_report_message_at]); allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  assert(allocation_report_message_read.side == allocation_report_message_written.side);
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 10 -> assert(allocation_report_message_read.sender_location[allocation_report_message_at] == allocation_report_message_written.sender_location[allocation_report_message_at]); allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  allocation_report_message_at = 0;
  do
  :: allocation_report_message_at < 5 -> assert(allocation_report_message_read.entering_trader[allocation_report_message_at] == allocation_report_message_written.entering_trader[allocation_report_message_at]); allocation_report_message_at = allocation_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Mass Action Request Message: 54 bytes ----------------------------- */

/* OrderMassActionRequestMessage */
typedef OrderMassActionRequestMessage {
  InboundBusinessHeader inbound_business_header;
  byte mass_action_type;
  byte mass_action_scope;
  byte cl_ord_id[8];
  byte mass_cancel_restatement_reason;
  byte ord_tag_id;
  byte side_optional;
  byte offset_31_padding_1;
  byte asset[6];
  byte security_id_optional[8];
  InvestorId investor_id
};

int order_mass_action_request_message_at;

/* every byte of Order Mass Action Request Message set to one value */
inline fill_order_mass_action_request_message(order_mass_action_request_message_record, order_mass_action_request_message_value) {
  fill_inbound_business_header(order_mass_action_request_message_record.inbound_business_header, order_mass_action_request_message_value);
  order_mass_action_request_message_record.mass_action_type = order_mass_action_request_message_value;
  order_mass_action_request_message_record.mass_action_scope = order_mass_action_request_message_value;
  order_mass_action_request_message_at = 0;
  do
  :: order_mass_action_request_message_at < 8 -> order_mass_action_request_message_record.cl_ord_id[order_mass_action_request_message_at] = order_mass_action_request_message_value; order_mass_action_request_message_at = order_mass_action_request_message_at + 1
  :: else -> break
  od;
  order_mass_action_request_message_record.mass_cancel_restatement_reason = order_mass_action_request_message_value;
  order_mass_action_request_message_record.ord_tag_id = order_mass_action_request_message_value;
  order_mass_action_request_message_record.side_optional = order_mass_action_request_message_value;
  order_mass_action_request_message_record.offset_31_padding_1 = order_mass_action_request_message_value;
  order_mass_action_request_message_at = 0;
  do
  :: order_mass_action_request_message_at < 6 -> order_mass_action_request_message_record.asset[order_mass_action_request_message_at] = order_mass_action_request_message_value; order_mass_action_request_message_at = order_mass_action_request_message_at + 1
  :: else -> break
  od;
  order_mass_action_request_message_at = 0;
  do
  :: order_mass_action_request_message_at < 8 -> order_mass_action_request_message_record.security_id_optional[order_mass_action_request_message_at] = order_mass_action_request_message_value; order_mass_action_request_message_at = order_mass_action_request_message_at + 1
  :: else -> break
  od;
  fill_investor_id(order_mass_action_request_message_record.investor_id, order_mass_action_request_message_value);
  skip
}

/* each byte of Order Mass Action Request Message set to where it lies, so a field read out of place says so */
inline ramp_order_mass_action_request_message(order_mass_action_request_message_record, order_mass_action_request_message_base) {
  ramp_inbound_business_header(order_mass_action_request_message_record.inbound_business_header, order_mass_action_request_message_base + 0);
  order_mass_action_request_message_record.mass_action_type = (order_mass_action_request_message_base + 18 + 1) % 256;
  order_mass_action_request_message_record.mass_action_scope = (order_mass_action_request_message_base + 19 + 1) % 256;
  order_mass_action_request_message_at = 0;
  do
  :: order_mass_action_request_message_at < 8 -> order_mass_action_request_message_record.cl_ord_id[order_mass_action_request_message_at] = (order_mass_action_request_message_base + 20 + order_mass_action_request_message_at + 1) % 256; order_mass_action_request_message_at = order_mass_action_request_message_at + 1
  :: else -> break
  od;
  order_mass_action_request_message_record.mass_cancel_restatement_reason = (order_mass_action_request_message_base + 28 + 1) % 256;
  order_mass_action_request_message_record.ord_tag_id = (order_mass_action_request_message_base + 29 + 1) % 256;
  order_mass_action_request_message_record.side_optional = (order_mass_action_request_message_base + 30 + 1) % 256;
  order_mass_action_request_message_record.offset_31_padding_1 = (order_mass_action_request_message_base + 31 + 1) % 256;
  order_mass_action_request_message_at = 0;
  do
  :: order_mass_action_request_message_at < 6 -> order_mass_action_request_message_record.asset[order_mass_action_request_message_at] = (order_mass_action_request_message_base + 32 + order_mass_action_request_message_at + 1) % 256; order_mass_action_request_message_at = order_mass_action_request_message_at + 1
  :: else -> break
  od;
  order_mass_action_request_message_at = 0;
  do
  :: order_mass_action_request_message_at < 8 -> order_mass_action_request_message_record.security_id_optional[order_mass_action_request_message_at] = (order_mass_action_request_message_base + 38 + order_mass_action_request_message_at + 1) % 256; order_mass_action_request_message_at = order_mass_action_request_message_at + 1
  :: else -> break
  od;
  ramp_investor_id(order_mass_action_request_message_record.investor_id, order_mass_action_request_message_base + 46);
  skip
}

/* Order Mass Action Request Message to the wire, 54 bytes from where the cursor stands */
inline encode_order_mass_action_request_message(order_mass_action_request_message_record) {
  encode_inbound_business_header(order_mass_action_request_message_record.inbound_business_header);
  wire[at] = order_mass_action_request_message_record.mass_action_type; at = at + 1;
  wire[at] = order_mass_action_request_message_record.mass_action_scope; at = at + 1;
  order_mass_action_request_message_at = 0;
  do
  :: order_mass_action_request_message_at < 8 -> wire[at] = order_mass_action_request_message_record.cl_ord_id[order_mass_action_request_message_at]; at = at + 1; order_mass_action_request_message_at = order_mass_action_request_message_at + 1
  :: else -> break
  od;
  wire[at] = order_mass_action_request_message_record.mass_cancel_restatement_reason; at = at + 1;
  wire[at] = order_mass_action_request_message_record.ord_tag_id; at = at + 1;
  wire[at] = order_mass_action_request_message_record.side_optional; at = at + 1;
  wire[at] = order_mass_action_request_message_record.offset_31_padding_1; at = at + 1;
  order_mass_action_request_message_at = 0;
  do
  :: order_mass_action_request_message_at < 6 -> wire[at] = order_mass_action_request_message_record.asset[order_mass_action_request_message_at]; at = at + 1; order_mass_action_request_message_at = order_mass_action_request_message_at + 1
  :: else -> break
  od;
  order_mass_action_request_message_at = 0;
  do
  :: order_mass_action_request_message_at < 8 -> wire[at] = order_mass_action_request_message_record.security_id_optional[order_mass_action_request_message_at]; at = at + 1; order_mass_action_request_message_at = order_mass_action_request_message_at + 1
  :: else -> break
  od;
  encode_investor_id(order_mass_action_request_message_record.investor_id);
  skip
}

/* Order Mass Action Request Message off the wire, 54 bytes from where the cursor stands */
inline decode_order_mass_action_request_message(order_mass_action_request_message_record) {
  decode_inbound_business_header(order_mass_action_request_message_record.inbound_business_header);
  order_mass_action_request_message_record.mass_action_type = wire[at]; at = at + 1;
  order_mass_action_request_message_record.mass_action_scope = wire[at]; at = at + 1;
  order_mass_action_request_message_at = 0;
  do
  :: order_mass_action_request_message_at < 8 -> order_mass_action_request_message_record.cl_ord_id[order_mass_action_request_message_at] = wire[at]; at = at + 1; order_mass_action_request_message_at = order_mass_action_request_message_at + 1
  :: else -> break
  od;
  order_mass_action_request_message_record.mass_cancel_restatement_reason = wire[at]; at = at + 1;
  order_mass_action_request_message_record.ord_tag_id = wire[at]; at = at + 1;
  order_mass_action_request_message_record.side_optional = wire[at]; at = at + 1;
  order_mass_action_request_message_record.offset_31_padding_1 = wire[at]; at = at + 1;
  order_mass_action_request_message_at = 0;
  do
  :: order_mass_action_request_message_at < 6 -> order_mass_action_request_message_record.asset[order_mass_action_request_message_at] = wire[at]; at = at + 1; order_mass_action_request_message_at = order_mass_action_request_message_at + 1
  :: else -> break
  od;
  order_mass_action_request_message_at = 0;
  do
  :: order_mass_action_request_message_at < 8 -> order_mass_action_request_message_record.security_id_optional[order_mass_action_request_message_at] = wire[at]; at = at + 1; order_mass_action_request_message_at = order_mass_action_request_message_at + 1
  :: else -> break
  od;
  decode_investor_id(order_mass_action_request_message_record.investor_id);
  skip
}

/* what was read of Order Mass Action Request Message is what was written, byte for byte */
inline equal_order_mass_action_request_message(order_mass_action_request_message_read, order_mass_action_request_message_written) {
  equal_inbound_business_header(order_mass_action_request_message_read.inbound_business_header, order_mass_action_request_message_written.inbound_business_header);
  assert(order_mass_action_request_message_read.mass_action_type == order_mass_action_request_message_written.mass_action_type);
  assert(order_mass_action_request_message_read.mass_action_scope == order_mass_action_request_message_written.mass_action_scope);
  order_mass_action_request_message_at = 0;
  do
  :: order_mass_action_request_message_at < 8 -> assert(order_mass_action_request_message_read.cl_ord_id[order_mass_action_request_message_at] == order_mass_action_request_message_written.cl_ord_id[order_mass_action_request_message_at]); order_mass_action_request_message_at = order_mass_action_request_message_at + 1
  :: else -> break
  od;
  assert(order_mass_action_request_message_read.mass_cancel_restatement_reason == order_mass_action_request_message_written.mass_cancel_restatement_reason);
  assert(order_mass_action_request_message_read.ord_tag_id == order_mass_action_request_message_written.ord_tag_id);
  assert(order_mass_action_request_message_read.side_optional == order_mass_action_request_message_written.side_optional);
  assert(order_mass_action_request_message_read.offset_31_padding_1 == order_mass_action_request_message_written.offset_31_padding_1);
  order_mass_action_request_message_at = 0;
  do
  :: order_mass_action_request_message_at < 6 -> assert(order_mass_action_request_message_read.asset[order_mass_action_request_message_at] == order_mass_action_request_message_written.asset[order_mass_action_request_message_at]); order_mass_action_request_message_at = order_mass_action_request_message_at + 1
  :: else -> break
  od;
  order_mass_action_request_message_at = 0;
  do
  :: order_mass_action_request_message_at < 8 -> assert(order_mass_action_request_message_read.security_id_optional[order_mass_action_request_message_at] == order_mass_action_request_message_written.security_id_optional[order_mass_action_request_message_at]); order_mass_action_request_message_at = order_mass_action_request_message_at + 1
  :: else -> break
  od;
  equal_investor_id(order_mass_action_request_message_read.investor_id, order_mass_action_request_message_written.investor_id);
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

/* Negotiate Response Message: encoded, read back, and compared */
proctype check_negotiate_response_message() {
  NegotiateResponseMessage negotiate_response_message_sent;
  NegotiateResponseMessage negotiate_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_negotiate_response_message(negotiate_response_message_sent, 0)
  :: pattern == 1 -> fill_negotiate_response_message(negotiate_response_message_sent, 32)
  :: pattern == 2 -> fill_negotiate_response_message(negotiate_response_message_sent, 255)
  :: else -> ramp_negotiate_response_message(negotiate_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_negotiate_response_message(negotiate_response_message_sent);
    assert(at == 24);
    at = 0;
    decode_negotiate_response_message(negotiate_response_message_got);
    assert(at == 24);
    equal_negotiate_response_message(negotiate_response_message_got, negotiate_response_message_sent)
  }
}

/* Negotiate Reject Message: encoded, read back, and compared */
proctype check_negotiate_reject_message() {
  NegotiateRejectMessage negotiate_reject_message_sent;
  NegotiateRejectMessage negotiate_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_negotiate_reject_message(negotiate_reject_message_sent, 0)
  :: pattern == 1 -> fill_negotiate_reject_message(negotiate_reject_message_sent, 32)
  :: pattern == 2 -> fill_negotiate_reject_message(negotiate_reject_message_sent, 255)
  :: else -> ramp_negotiate_reject_message(negotiate_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_negotiate_reject_message(negotiate_reject_message_sent);
    assert(at == 36);
    at = 0;
    decode_negotiate_reject_message(negotiate_reject_message_got);
    assert(at == 36);
    equal_negotiate_reject_message(negotiate_reject_message_got, negotiate_reject_message_sent)
  }
}

/* Establish Ack Message: encoded, read back, and compared */
proctype check_establish_ack_message() {
  EstablishAckMessage establish_ack_message_sent;
  EstablishAckMessage establish_ack_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_establish_ack_message(establish_ack_message_sent, 0)
  :: pattern == 1 -> fill_establish_ack_message(establish_ack_message_sent, 32)
  :: pattern == 2 -> fill_establish_ack_message(establish_ack_message_sent, 255)
  :: else -> ramp_establish_ack_message(establish_ack_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_establish_ack_message(establish_ack_message_sent);
    assert(at == 36);
    at = 0;
    decode_establish_ack_message(establish_ack_message_got);
    assert(at == 36);
    equal_establish_ack_message(establish_ack_message_got, establish_ack_message_sent)
  }
}

/* Establish Reject Message: encoded, read back, and compared */
proctype check_establish_reject_message() {
  EstablishRejectMessage establish_reject_message_sent;
  EstablishRejectMessage establish_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_establish_reject_message(establish_reject_message_sent, 0)
  :: pattern == 1 -> fill_establish_reject_message(establish_reject_message_sent, 32)
  :: pattern == 2 -> fill_establish_reject_message(establish_reject_message_sent, 255)
  :: else -> ramp_establish_reject_message(establish_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_establish_reject_message(establish_reject_message_sent);
    assert(at == 26);
    at = 0;
    decode_establish_reject_message(establish_reject_message_got);
    assert(at == 26);
    equal_establish_reject_message(establish_reject_message_got, establish_reject_message_sent)
  }
}

/* Terminate Message: encoded, read back, and compared */
proctype check_terminate_message() {
  TerminateMessage terminate_message_sent;
  TerminateMessage terminate_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_terminate_message(terminate_message_sent, 0)
  :: pattern == 1 -> fill_terminate_message(terminate_message_sent, 32)
  :: pattern == 2 -> fill_terminate_message(terminate_message_sent, 255)
  :: else -> ramp_terminate_message(terminate_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_terminate_message(terminate_message_sent);
    assert(at == 13);
    at = 0;
    decode_terminate_message(terminate_message_got);
    assert(at == 13);
    equal_terminate_message(terminate_message_got, terminate_message_sent)
  }
}

/* Not Applied Message: encoded, read back, and compared */
proctype check_not_applied_message() {
  NotAppliedMessage not_applied_message_sent;
  NotAppliedMessage not_applied_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_not_applied_message(not_applied_message_sent, 0)
  :: pattern == 1 -> fill_not_applied_message(not_applied_message_sent, 32)
  :: pattern == 2 -> fill_not_applied_message(not_applied_message_sent, 255)
  :: else -> ramp_not_applied_message(not_applied_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_not_applied_message(not_applied_message_sent);
    assert(at == 8);
    at = 0;
    decode_not_applied_message(not_applied_message_got);
    assert(at == 8);
    equal_not_applied_message(not_applied_message_got, not_applied_message_sent)
  }
}

/* Sequence Message: encoded, read back, and compared */
proctype check_sequence_message() {
  SequenceMessage sequence_message_sent;
  SequenceMessage sequence_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequence_message(sequence_message_sent, 0)
  :: pattern == 1 -> fill_sequence_message(sequence_message_sent, 32)
  :: pattern == 2 -> fill_sequence_message(sequence_message_sent, 255)
  :: else -> ramp_sequence_message(sequence_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequence_message(sequence_message_sent);
    assert(at == 4);
    at = 0;
    decode_sequence_message(sequence_message_got);
    assert(at == 4);
    equal_sequence_message(sequence_message_got, sequence_message_sent)
  }
}

/* Retransmit Request Message: encoded, read back, and compared */
proctype check_retransmit_request_message() {
  RetransmitRequestMessage retransmit_request_message_sent;
  RetransmitRequestMessage retransmit_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmit_request_message(retransmit_request_message_sent, 0)
  :: pattern == 1 -> fill_retransmit_request_message(retransmit_request_message_sent, 32)
  :: pattern == 2 -> fill_retransmit_request_message(retransmit_request_message_sent, 255)
  :: else -> ramp_retransmit_request_message(retransmit_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmit_request_message(retransmit_request_message_sent);
    assert(at == 20);
    at = 0;
    decode_retransmit_request_message(retransmit_request_message_got);
    assert(at == 20);
    equal_retransmit_request_message(retransmit_request_message_got, retransmit_request_message_sent)
  }
}

/* Retransmission Message: encoded, read back, and compared */
proctype check_retransmission_message() {
  RetransmissionMessage retransmission_message_sent;
  RetransmissionMessage retransmission_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmission_message(retransmission_message_sent, 0)
  :: pattern == 1 -> fill_retransmission_message(retransmission_message_sent, 32)
  :: pattern == 2 -> fill_retransmission_message(retransmission_message_sent, 255)
  :: else -> ramp_retransmission_message(retransmission_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmission_message(retransmission_message_sent);
    assert(at == 20);
    at = 0;
    decode_retransmission_message(retransmission_message_got);
    assert(at == 20);
    equal_retransmission_message(retransmission_message_got, retransmission_message_sent)
  }
}

/* Retransmit Reject Message: encoded, read back, and compared */
proctype check_retransmit_reject_message() {
  RetransmitRejectMessage retransmit_reject_message_sent;
  RetransmitRejectMessage retransmit_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmit_reject_message(retransmit_reject_message_sent, 0)
  :: pattern == 1 -> fill_retransmit_reject_message(retransmit_reject_message_sent, 32)
  :: pattern == 2 -> fill_retransmit_reject_message(retransmit_reject_message_sent, 255)
  :: else -> ramp_retransmit_reject_message(retransmit_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmit_reject_message(retransmit_reject_message_sent);
    assert(at == 13);
    at = 0;
    decode_retransmit_reject_message(retransmit_reject_message_got);
    assert(at == 13);
    equal_retransmit_reject_message(retransmit_reject_message_got, retransmit_reject_message_sent)
  }
}

/* Inbound Business Header: encoded, read back, and compared */
proctype check_inbound_business_header() {
  InboundBusinessHeader inbound_business_header_sent;
  InboundBusinessHeader inbound_business_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_inbound_business_header(inbound_business_header_sent, 0)
  :: pattern == 1 -> fill_inbound_business_header(inbound_business_header_sent, 32)
  :: pattern == 2 -> fill_inbound_business_header(inbound_business_header_sent, 255)
  :: else -> ramp_inbound_business_header(inbound_business_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_inbound_business_header(inbound_business_header_sent);
    assert(at == 18);
    at = 0;
    decode_inbound_business_header(inbound_business_header_got);
    assert(at == 18);
    equal_inbound_business_header(inbound_business_header_got, inbound_business_header_sent)
  }
}

/* Investor Id: encoded, read back, and compared */
proctype check_investor_id() {
  InvestorId investor_id_sent;
  InvestorId investor_id_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_investor_id(investor_id_sent, 0)
  :: pattern == 1 -> fill_investor_id(investor_id_sent, 32)
  :: pattern == 2 -> fill_investor_id(investor_id_sent, 255)
  :: else -> ramp_investor_id(investor_id_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_investor_id(investor_id_sent);
    assert(at == 8);
    at = 0;
    decode_investor_id(investor_id_got);
    assert(at == 8);
    equal_investor_id(investor_id_got, investor_id_sent)
  }
}

/* Custodian Info: encoded, read back, and compared */
proctype check_custodian_info() {
  CustodianInfo custodian_info_sent;
  CustodianInfo custodian_info_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_custodian_info(custodian_info_sent, 0)
  :: pattern == 1 -> fill_custodian_info(custodian_info_sent, 32)
  :: pattern == 2 -> fill_custodian_info(custodian_info_sent, 255)
  :: else -> ramp_custodian_info(custodian_info_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_custodian_info(custodian_info_sent);
    assert(at == 12);
    at = 0;
    decode_custodian_info(custodian_info_got);
    assert(at == 12);
    equal_custodian_info(custodian_info_got, custodian_info_sent)
  }
}

/* Group Size Encoding: encoded, read back, and compared */
proctype check_group_size_encoding() {
  GroupSizeEncoding group_size_encoding_sent;
  GroupSizeEncoding group_size_encoding_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_group_size_encoding(group_size_encoding_sent, 0)
  :: pattern == 1 -> fill_group_size_encoding(group_size_encoding_sent, 32)
  :: pattern == 2 -> fill_group_size_encoding(group_size_encoding_sent, 255)
  :: else -> ramp_group_size_encoding(group_size_encoding_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_group_size_encoding(group_size_encoding_sent);
    assert(at == 3);
    at = 0;
    decode_group_size_encoding(group_size_encoding_got);
    assert(at == 3);
    equal_group_size_encoding(group_size_encoding_got, group_size_encoding_sent)
  }
}

/* Outbound Business Header: encoded, read back, and compared */
proctype check_outbound_business_header() {
  OutboundBusinessHeader outbound_business_header_sent;
  OutboundBusinessHeader outbound_business_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_outbound_business_header(outbound_business_header_sent, 0)
  :: pattern == 1 -> fill_outbound_business_header(outbound_business_header_sent, 32)
  :: pattern == 2 -> fill_outbound_business_header(outbound_business_header_sent, 255)
  :: else -> ramp_outbound_business_header(outbound_business_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_outbound_business_header(outbound_business_header_sent);
    assert(at == 18);
    at = 0;
    decode_outbound_business_header(outbound_business_header_got);
    assert(at == 18);
    equal_outbound_business_header(outbound_business_header_got, outbound_business_header_sent)
  }
}

/* Security Definition Response Message: encoded, read back, and compared */
proctype check_security_definition_response_message() {
  SecurityDefinitionResponseMessage security_definition_response_message_sent;
  SecurityDefinitionResponseMessage security_definition_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_security_definition_response_message(security_definition_response_message_sent, 0)
  :: pattern == 1 -> fill_security_definition_response_message(security_definition_response_message_sent, 32)
  :: pattern == 2 -> fill_security_definition_response_message(security_definition_response_message_sent, 255)
  :: else -> ramp_security_definition_response_message(security_definition_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_security_definition_response_message(security_definition_response_message_sent);
    assert(at == 83);
    at = 0;
    decode_security_definition_response_message(security_definition_response_message_got);
    assert(at == 83);
    equal_security_definition_response_message(security_definition_response_message_got, security_definition_response_message_sent)
  }
}

/* Bidirectional Business Header: encoded, read back, and compared */
proctype check_bidirectional_business_header() {
  BidirectionalBusinessHeader bidirectional_business_header_sent;
  BidirectionalBusinessHeader bidirectional_business_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bidirectional_business_header(bidirectional_business_header_sent, 0)
  :: pattern == 1 -> fill_bidirectional_business_header(bidirectional_business_header_sent, 32)
  :: pattern == 2 -> fill_bidirectional_business_header(bidirectional_business_header_sent, 255)
  :: else -> ramp_bidirectional_business_header(bidirectional_business_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bidirectional_business_header(bidirectional_business_header_sent);
    assert(at == 20);
    at = 0;
    decode_bidirectional_business_header(bidirectional_business_header_got);
    assert(at == 20);
    equal_bidirectional_business_header(bidirectional_business_header_got, bidirectional_business_header_sent)
  }
}

/* Position Maintenance Cancel Request Message: encoded, read back, and compared */
proctype check_position_maintenance_cancel_request_message() {
  PositionMaintenanceCancelRequestMessage position_maintenance_cancel_request_message_sent;
  PositionMaintenanceCancelRequestMessage position_maintenance_cancel_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_position_maintenance_cancel_request_message(position_maintenance_cancel_request_message_sent, 0)
  :: pattern == 1 -> fill_position_maintenance_cancel_request_message(position_maintenance_cancel_request_message_sent, 32)
  :: pattern == 2 -> fill_position_maintenance_cancel_request_message(position_maintenance_cancel_request_message_sent, 255)
  :: else -> ramp_position_maintenance_cancel_request_message(position_maintenance_cancel_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_position_maintenance_cancel_request_message(position_maintenance_cancel_request_message_sent);
    assert(at == 65);
    at = 0;
    decode_position_maintenance_cancel_request_message(position_maintenance_cancel_request_message_got);
    assert(at == 65);
    equal_position_maintenance_cancel_request_message(position_maintenance_cancel_request_message_got, position_maintenance_cancel_request_message_sent)
  }
}

/* Allocation Report Message: encoded, read back, and compared */
proctype check_allocation_report_message() {
  AllocationReportMessage allocation_report_message_sent;
  AllocationReportMessage allocation_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_allocation_report_message(allocation_report_message_sent, 0)
  :: pattern == 1 -> fill_allocation_report_message(allocation_report_message_sent, 32)
  :: pattern == 2 -> fill_allocation_report_message(allocation_report_message_sent, 255)
  :: else -> ramp_allocation_report_message(allocation_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_allocation_report_message(allocation_report_message_sent);
    assert(at == 84);
    at = 0;
    decode_allocation_report_message(allocation_report_message_got);
    assert(at == 84);
    equal_allocation_report_message(allocation_report_message_got, allocation_report_message_sent)
  }
}

/* Order Mass Action Request Message: encoded, read back, and compared */
proctype check_order_mass_action_request_message() {
  OrderMassActionRequestMessage order_mass_action_request_message_sent;
  OrderMassActionRequestMessage order_mass_action_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_mass_action_request_message(order_mass_action_request_message_sent, 0)
  :: pattern == 1 -> fill_order_mass_action_request_message(order_mass_action_request_message_sent, 32)
  :: pattern == 2 -> fill_order_mass_action_request_message(order_mass_action_request_message_sent, 255)
  :: else -> ramp_order_mass_action_request_message(order_mass_action_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_mass_action_request_message(order_mass_action_request_message_sent);
    assert(at == 54);
    at = 0;
    decode_order_mass_action_request_message(order_mass_action_request_message_got);
    assert(at == 54);
    equal_order_mass_action_request_message(order_mass_action_request_message_got, order_mass_action_request_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_simple_open_framing_header()
  :: run check_message_header()
  :: run check_negotiate_response_message()
  :: run check_negotiate_reject_message()
  :: run check_establish_ack_message()
  :: run check_establish_reject_message()
  :: run check_terminate_message()
  :: run check_not_applied_message()
  :: run check_sequence_message()
  :: run check_retransmit_request_message()
  :: run check_retransmission_message()
  :: run check_retransmit_reject_message()
  :: run check_inbound_business_header()
  :: run check_investor_id()
  :: run check_custodian_info()
  :: run check_group_size_encoding()
  :: run check_outbound_business_header()
  :: run check_security_definition_response_message()
  :: run check_bidirectional_business_header()
  :: run check_position_maintenance_cancel_request_message()
  :: run check_allocation_report_message()
  :: run check_order_mass_action_request_message()
  fi
}
