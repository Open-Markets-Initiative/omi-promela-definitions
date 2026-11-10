/*
 * CME Group Market Data Platform 3
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
#define WIRE 78

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Client Technical Header: 14 bytes --------------------------------------- */

/* Cme Technical Header sent by the firm to Cme */
typedef ClientTechnicalHeader {
  byte encoding_type[2];
  byte message_sequence_number[4];
  byte tcp_sending_time[8]
};

int client_technical_header_at;

/* every byte of Client Technical Header set to one value */
inline fill_client_technical_header(client_technical_header_record, client_technical_header_value) {
  client_technical_header_at = 0;
  do
  :: client_technical_header_at < 2 -> client_technical_header_record.encoding_type[client_technical_header_at] = client_technical_header_value; client_technical_header_at = client_technical_header_at + 1
  :: else -> break
  od;
  client_technical_header_at = 0;
  do
  :: client_technical_header_at < 4 -> client_technical_header_record.message_sequence_number[client_technical_header_at] = client_technical_header_value; client_technical_header_at = client_technical_header_at + 1
  :: else -> break
  od;
  client_technical_header_at = 0;
  do
  :: client_technical_header_at < 8 -> client_technical_header_record.tcp_sending_time[client_technical_header_at] = client_technical_header_value; client_technical_header_at = client_technical_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Client Technical Header set to where it lies, so a field read out of place says so */
inline ramp_client_technical_header(client_technical_header_record, client_technical_header_base) {
  client_technical_header_at = 0;
  do
  :: client_technical_header_at < 2 -> client_technical_header_record.encoding_type[client_technical_header_at] = (client_technical_header_base + 0 + client_technical_header_at + 1) % 256; client_technical_header_at = client_technical_header_at + 1
  :: else -> break
  od;
  client_technical_header_at = 0;
  do
  :: client_technical_header_at < 4 -> client_technical_header_record.message_sequence_number[client_technical_header_at] = (client_technical_header_base + 2 + client_technical_header_at + 1) % 256; client_technical_header_at = client_technical_header_at + 1
  :: else -> break
  od;
  client_technical_header_at = 0;
  do
  :: client_technical_header_at < 8 -> client_technical_header_record.tcp_sending_time[client_technical_header_at] = (client_technical_header_base + 6 + client_technical_header_at + 1) % 256; client_technical_header_at = client_technical_header_at + 1
  :: else -> break
  od;
  skip
}

/* Client Technical Header to the wire, 14 bytes from where the cursor stands */
inline encode_client_technical_header(client_technical_header_record) {
  client_technical_header_at = 0;
  do
  :: client_technical_header_at < 2 -> wire[at] = client_technical_header_record.encoding_type[client_technical_header_at]; at = at + 1; client_technical_header_at = client_technical_header_at + 1
  :: else -> break
  od;
  client_technical_header_at = 0;
  do
  :: client_technical_header_at < 4 -> wire[at] = client_technical_header_record.message_sequence_number[client_technical_header_at]; at = at + 1; client_technical_header_at = client_technical_header_at + 1
  :: else -> break
  od;
  client_technical_header_at = 0;
  do
  :: client_technical_header_at < 8 -> wire[at] = client_technical_header_record.tcp_sending_time[client_technical_header_at]; at = at + 1; client_technical_header_at = client_technical_header_at + 1
  :: else -> break
  od;
  skip
}

/* Client Technical Header off the wire, 14 bytes from where the cursor stands */
inline decode_client_technical_header(client_technical_header_record) {
  client_technical_header_at = 0;
  do
  :: client_technical_header_at < 2 -> client_technical_header_record.encoding_type[client_technical_header_at] = wire[at]; at = at + 1; client_technical_header_at = client_technical_header_at + 1
  :: else -> break
  od;
  client_technical_header_at = 0;
  do
  :: client_technical_header_at < 4 -> client_technical_header_record.message_sequence_number[client_technical_header_at] = wire[at]; at = at + 1; client_technical_header_at = client_technical_header_at + 1
  :: else -> break
  od;
  client_technical_header_at = 0;
  do
  :: client_technical_header_at < 8 -> client_technical_header_record.tcp_sending_time[client_technical_header_at] = wire[at]; at = at + 1; client_technical_header_at = client_technical_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Client Technical Header is what was written, byte for byte */
inline equal_client_technical_header(client_technical_header_read, client_technical_header_written) {
  client_technical_header_at = 0;
  do
  :: client_technical_header_at < 2 -> assert(client_technical_header_read.encoding_type[client_technical_header_at] == client_technical_header_written.encoding_type[client_technical_header_at]); client_technical_header_at = client_technical_header_at + 1
  :: else -> break
  od;
  client_technical_header_at = 0;
  do
  :: client_technical_header_at < 4 -> assert(client_technical_header_read.message_sequence_number[client_technical_header_at] == client_technical_header_written.message_sequence_number[client_technical_header_at]); client_technical_header_at = client_technical_header_at + 1
  :: else -> break
  od;
  client_technical_header_at = 0;
  do
  :: client_technical_header_at < 8 -> assert(client_technical_header_read.tcp_sending_time[client_technical_header_at] == client_technical_header_written.tcp_sending_time[client_technical_header_at]); client_technical_header_at = client_technical_header_at + 1
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

/* ---- Negotiate: 78 bytes ----------------------------------------------------- */

/* Negotiate */
typedef Negotiate {
  byte hmac_signature[32];
  byte access_key_id[20];
  byte uuid[8];
  byte request_timestamp[8];
  byte session[5];
  byte firm[5]
};

int negotiate_at;

/* every byte of Negotiate set to one value */
inline fill_negotiate(negotiate_record, negotiate_value) {
  negotiate_at = 0;
  do
  :: negotiate_at < 32 -> negotiate_record.hmac_signature[negotiate_at] = negotiate_value; negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  negotiate_at = 0;
  do
  :: negotiate_at < 20 -> negotiate_record.access_key_id[negotiate_at] = negotiate_value; negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  negotiate_at = 0;
  do
  :: negotiate_at < 8 -> negotiate_record.uuid[negotiate_at] = negotiate_value; negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  negotiate_at = 0;
  do
  :: negotiate_at < 8 -> negotiate_record.request_timestamp[negotiate_at] = negotiate_value; negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  negotiate_at = 0;
  do
  :: negotiate_at < 5 -> negotiate_record.session[negotiate_at] = negotiate_value; negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  negotiate_at = 0;
  do
  :: negotiate_at < 5 -> negotiate_record.firm[negotiate_at] = negotiate_value; negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Negotiate set to where it lies, so a field read out of place says so */
inline ramp_negotiate(negotiate_record, negotiate_base) {
  negotiate_at = 0;
  do
  :: negotiate_at < 32 -> negotiate_record.hmac_signature[negotiate_at] = (negotiate_base + 0 + negotiate_at + 1) % 256; negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  negotiate_at = 0;
  do
  :: negotiate_at < 20 -> negotiate_record.access_key_id[negotiate_at] = (negotiate_base + 32 + negotiate_at + 1) % 256; negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  negotiate_at = 0;
  do
  :: negotiate_at < 8 -> negotiate_record.uuid[negotiate_at] = (negotiate_base + 52 + negotiate_at + 1) % 256; negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  negotiate_at = 0;
  do
  :: negotiate_at < 8 -> negotiate_record.request_timestamp[negotiate_at] = (negotiate_base + 60 + negotiate_at + 1) % 256; negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  negotiate_at = 0;
  do
  :: negotiate_at < 5 -> negotiate_record.session[negotiate_at] = (negotiate_base + 68 + negotiate_at + 1) % 256; negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  negotiate_at = 0;
  do
  :: negotiate_at < 5 -> negotiate_record.firm[negotiate_at] = (negotiate_base + 73 + negotiate_at + 1) % 256; negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  skip
}

/* Negotiate to the wire, 78 bytes from where the cursor stands */
inline encode_negotiate(negotiate_record) {
  negotiate_at = 0;
  do
  :: negotiate_at < 32 -> wire[at] = negotiate_record.hmac_signature[negotiate_at]; at = at + 1; negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  negotiate_at = 0;
  do
  :: negotiate_at < 20 -> wire[at] = negotiate_record.access_key_id[negotiate_at]; at = at + 1; negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  negotiate_at = 0;
  do
  :: negotiate_at < 8 -> wire[at] = negotiate_record.uuid[negotiate_at]; at = at + 1; negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  negotiate_at = 0;
  do
  :: negotiate_at < 8 -> wire[at] = negotiate_record.request_timestamp[negotiate_at]; at = at + 1; negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  negotiate_at = 0;
  do
  :: negotiate_at < 5 -> wire[at] = negotiate_record.session[negotiate_at]; at = at + 1; negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  negotiate_at = 0;
  do
  :: negotiate_at < 5 -> wire[at] = negotiate_record.firm[negotiate_at]; at = at + 1; negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  skip
}

/* Negotiate off the wire, 78 bytes from where the cursor stands */
inline decode_negotiate(negotiate_record) {
  negotiate_at = 0;
  do
  :: negotiate_at < 32 -> negotiate_record.hmac_signature[negotiate_at] = wire[at]; at = at + 1; negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  negotiate_at = 0;
  do
  :: negotiate_at < 20 -> negotiate_record.access_key_id[negotiate_at] = wire[at]; at = at + 1; negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  negotiate_at = 0;
  do
  :: negotiate_at < 8 -> negotiate_record.uuid[negotiate_at] = wire[at]; at = at + 1; negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  negotiate_at = 0;
  do
  :: negotiate_at < 8 -> negotiate_record.request_timestamp[negotiate_at] = wire[at]; at = at + 1; negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  negotiate_at = 0;
  do
  :: negotiate_at < 5 -> negotiate_record.session[negotiate_at] = wire[at]; at = at + 1; negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  negotiate_at = 0;
  do
  :: negotiate_at < 5 -> negotiate_record.firm[negotiate_at] = wire[at]; at = at + 1; negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Negotiate is what was written, byte for byte */
inline equal_negotiate(negotiate_read, negotiate_written) {
  negotiate_at = 0;
  do
  :: negotiate_at < 32 -> assert(negotiate_read.hmac_signature[negotiate_at] == negotiate_written.hmac_signature[negotiate_at]); negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  negotiate_at = 0;
  do
  :: negotiate_at < 20 -> assert(negotiate_read.access_key_id[negotiate_at] == negotiate_written.access_key_id[negotiate_at]); negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  negotiate_at = 0;
  do
  :: negotiate_at < 8 -> assert(negotiate_read.uuid[negotiate_at] == negotiate_written.uuid[negotiate_at]); negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  negotiate_at = 0;
  do
  :: negotiate_at < 8 -> assert(negotiate_read.request_timestamp[negotiate_at] == negotiate_written.request_timestamp[negotiate_at]); negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  negotiate_at = 0;
  do
  :: negotiate_at < 5 -> assert(negotiate_read.session[negotiate_at] == negotiate_written.session[negotiate_at]); negotiate_at = negotiate_at + 1
  :: else -> break
  od;
  negotiate_at = 0;
  do
  :: negotiate_at < 5 -> assert(negotiate_read.firm[negotiate_at] == negotiate_written.firm[negotiate_at]); negotiate_at = negotiate_at + 1
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

/* ---- What spin checks -------------------------------------------------------- */

/* Client Technical Header: encoded, read back, and compared */
proctype check_client_technical_header() {
  ClientTechnicalHeader client_technical_header_sent;
  ClientTechnicalHeader client_technical_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_client_technical_header(client_technical_header_sent, 0)
  :: pattern == 1 -> fill_client_technical_header(client_technical_header_sent, 32)
  :: pattern == 2 -> fill_client_technical_header(client_technical_header_sent, 255)
  :: else -> ramp_client_technical_header(client_technical_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_client_technical_header(client_technical_header_sent);
    assert(at == 14);
    at = 0;
    decode_client_technical_header(client_technical_header_got);
    assert(at == 14);
    equal_client_technical_header(client_technical_header_got, client_technical_header_sent)
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

/* Negotiate: encoded, read back, and compared */
proctype check_negotiate() {
  Negotiate negotiate_sent;
  Negotiate negotiate_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_negotiate(negotiate_sent, 0)
  :: pattern == 1 -> fill_negotiate(negotiate_sent, 32)
  :: pattern == 2 -> fill_negotiate(negotiate_sent, 255)
  :: else -> ramp_negotiate(negotiate_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_negotiate(negotiate_sent);
    assert(at == 78);
    at = 0;
    decode_negotiate(negotiate_got);
    assert(at == 78);
    equal_negotiate(negotiate_got, negotiate_sent)
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

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_client_technical_header()
  :: run check_simple_binary_header()
  :: run check_message_header()
  :: run check_negotiate()
  :: run check_terminate()
  :: run check_group_size()
  fi
}
