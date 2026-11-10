/*
 * Box Options Market Sola Trade Reporting
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
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 94

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 28 bytes ------------------------------------------------ */

/* Atr message header, twenty eight bytes opening every message either way */
typedef MessageHeader {
  byte source[4];
  byte destination[4];
  byte message_type[2];
  byte message_flag;
  byte control_byte;
  byte sequence_number[8];
  byte acknowledgement_sequence_number[8]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.source[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.destination[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_flag = message_header_value;
  message_header_record.control_byte = message_header_value;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.sequence_number[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.acknowledgement_sequence_number[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.source[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.destination[message_header_at] = (message_header_base + 4 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = (message_header_base + 8 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_flag = (message_header_base + 10 + 1) % 256;
  message_header_record.control_byte = (message_header_base + 11 + 1) % 256;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.sequence_number[message_header_at] = (message_header_base + 12 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.acknowledgement_sequence_number[message_header_at] = (message_header_base + 20 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 28 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.source[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.destination[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_type[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.message_flag; at = at + 1;
  wire[at] = message_header_record.control_byte; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.sequence_number[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.acknowledgement_sequence_number[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 28 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.source[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.destination[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_flag = wire[at]; at = at + 1;
  message_header_record.control_byte = wire[at]; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.sequence_number[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.acknowledgement_sequence_number[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.source[message_header_at] == message_header_written.source[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.destination[message_header_at] == message_header_written.destination[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_type[message_header_at] == message_header_written.message_type[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.message_flag == message_header_written.message_flag);
  assert(message_header_read.control_byte == message_header_written.control_byte);
  message_header_at = 0;
  do
  :: message_header_at < 8 -> assert(message_header_read.sequence_number[message_header_at] == message_header_written.sequence_number[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> assert(message_header_read.acknowledgement_sequence_number[message_header_at] == message_header_written.acknowledgement_sequence_number[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Restart Request: 8 bytes ------------------------------------------------ */

typedef RestartRequest {
  byte sequence_number[8]
};

int restart_request_at;

/* every byte of Restart Request set to one value */
inline fill_restart_request(restart_request_record, restart_request_value) {
  restart_request_at = 0;
  do
  :: restart_request_at < 8 -> restart_request_record.sequence_number[restart_request_at] = restart_request_value; restart_request_at = restart_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Restart Request set to where it lies, so a field read out of place says so */
inline ramp_restart_request(restart_request_record, restart_request_base) {
  restart_request_at = 0;
  do
  :: restart_request_at < 8 -> restart_request_record.sequence_number[restart_request_at] = (restart_request_base + 0 + restart_request_at + 1) % 256; restart_request_at = restart_request_at + 1
  :: else -> break
  od;
  skip
}

/* Restart Request to the wire, 8 bytes from where the cursor stands */
inline encode_restart_request(restart_request_record) {
  restart_request_at = 0;
  do
  :: restart_request_at < 8 -> wire[at] = restart_request_record.sequence_number[restart_request_at]; at = at + 1; restart_request_at = restart_request_at + 1
  :: else -> break
  od;
  skip
}

/* Restart Request off the wire, 8 bytes from where the cursor stands */
inline decode_restart_request(restart_request_record) {
  restart_request_at = 0;
  do
  :: restart_request_at < 8 -> restart_request_record.sequence_number[restart_request_at] = wire[at]; at = at + 1; restart_request_at = restart_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Restart Request is what was written, byte for byte */
inline equal_restart_request(restart_request_read, restart_request_written) {
  restart_request_at = 0;
  do
  :: restart_request_at < 8 -> assert(restart_request_read.sequence_number[restart_request_at] == restart_request_written.sequence_number[restart_request_at]); restart_request_at = restart_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Client Signon: 36 bytes ------------------------------------------------- */

typedef ClientSignon {
  byte member_number[4];
  byte initial_sequence_number[8];
  byte protocol_version[2];
  byte time[6];
  byte username[8];
  byte password_md_5_encryption[8]
};

int client_signon_at;

/* every byte of Client Signon set to one value */
inline fill_client_signon(client_signon_record, client_signon_value) {
  client_signon_at = 0;
  do
  :: client_signon_at < 4 -> client_signon_record.member_number[client_signon_at] = client_signon_value; client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  client_signon_at = 0;
  do
  :: client_signon_at < 8 -> client_signon_record.initial_sequence_number[client_signon_at] = client_signon_value; client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  client_signon_at = 0;
  do
  :: client_signon_at < 2 -> client_signon_record.protocol_version[client_signon_at] = client_signon_value; client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  client_signon_at = 0;
  do
  :: client_signon_at < 6 -> client_signon_record.time[client_signon_at] = client_signon_value; client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  client_signon_at = 0;
  do
  :: client_signon_at < 8 -> client_signon_record.username[client_signon_at] = client_signon_value; client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  client_signon_at = 0;
  do
  :: client_signon_at < 8 -> client_signon_record.password_md_5_encryption[client_signon_at] = client_signon_value; client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Client Signon set to where it lies, so a field read out of place says so */
inline ramp_client_signon(client_signon_record, client_signon_base) {
  client_signon_at = 0;
  do
  :: client_signon_at < 4 -> client_signon_record.member_number[client_signon_at] = (client_signon_base + 0 + client_signon_at + 1) % 256; client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  client_signon_at = 0;
  do
  :: client_signon_at < 8 -> client_signon_record.initial_sequence_number[client_signon_at] = (client_signon_base + 4 + client_signon_at + 1) % 256; client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  client_signon_at = 0;
  do
  :: client_signon_at < 2 -> client_signon_record.protocol_version[client_signon_at] = (client_signon_base + 12 + client_signon_at + 1) % 256; client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  client_signon_at = 0;
  do
  :: client_signon_at < 6 -> client_signon_record.time[client_signon_at] = (client_signon_base + 14 + client_signon_at + 1) % 256; client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  client_signon_at = 0;
  do
  :: client_signon_at < 8 -> client_signon_record.username[client_signon_at] = (client_signon_base + 20 + client_signon_at + 1) % 256; client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  client_signon_at = 0;
  do
  :: client_signon_at < 8 -> client_signon_record.password_md_5_encryption[client_signon_at] = (client_signon_base + 28 + client_signon_at + 1) % 256; client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  skip
}

/* Client Signon to the wire, 36 bytes from where the cursor stands */
inline encode_client_signon(client_signon_record) {
  client_signon_at = 0;
  do
  :: client_signon_at < 4 -> wire[at] = client_signon_record.member_number[client_signon_at]; at = at + 1; client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  client_signon_at = 0;
  do
  :: client_signon_at < 8 -> wire[at] = client_signon_record.initial_sequence_number[client_signon_at]; at = at + 1; client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  client_signon_at = 0;
  do
  :: client_signon_at < 2 -> wire[at] = client_signon_record.protocol_version[client_signon_at]; at = at + 1; client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  client_signon_at = 0;
  do
  :: client_signon_at < 6 -> wire[at] = client_signon_record.time[client_signon_at]; at = at + 1; client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  client_signon_at = 0;
  do
  :: client_signon_at < 8 -> wire[at] = client_signon_record.username[client_signon_at]; at = at + 1; client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  client_signon_at = 0;
  do
  :: client_signon_at < 8 -> wire[at] = client_signon_record.password_md_5_encryption[client_signon_at]; at = at + 1; client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  skip
}

/* Client Signon off the wire, 36 bytes from where the cursor stands */
inline decode_client_signon(client_signon_record) {
  client_signon_at = 0;
  do
  :: client_signon_at < 4 -> client_signon_record.member_number[client_signon_at] = wire[at]; at = at + 1; client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  client_signon_at = 0;
  do
  :: client_signon_at < 8 -> client_signon_record.initial_sequence_number[client_signon_at] = wire[at]; at = at + 1; client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  client_signon_at = 0;
  do
  :: client_signon_at < 2 -> client_signon_record.protocol_version[client_signon_at] = wire[at]; at = at + 1; client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  client_signon_at = 0;
  do
  :: client_signon_at < 6 -> client_signon_record.time[client_signon_at] = wire[at]; at = at + 1; client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  client_signon_at = 0;
  do
  :: client_signon_at < 8 -> client_signon_record.username[client_signon_at] = wire[at]; at = at + 1; client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  client_signon_at = 0;
  do
  :: client_signon_at < 8 -> client_signon_record.password_md_5_encryption[client_signon_at] = wire[at]; at = at + 1; client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Client Signon is what was written, byte for byte */
inline equal_client_signon(client_signon_read, client_signon_written) {
  client_signon_at = 0;
  do
  :: client_signon_at < 4 -> assert(client_signon_read.member_number[client_signon_at] == client_signon_written.member_number[client_signon_at]); client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  client_signon_at = 0;
  do
  :: client_signon_at < 8 -> assert(client_signon_read.initial_sequence_number[client_signon_at] == client_signon_written.initial_sequence_number[client_signon_at]); client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  client_signon_at = 0;
  do
  :: client_signon_at < 2 -> assert(client_signon_read.protocol_version[client_signon_at] == client_signon_written.protocol_version[client_signon_at]); client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  client_signon_at = 0;
  do
  :: client_signon_at < 6 -> assert(client_signon_read.time[client_signon_at] == client_signon_written.time[client_signon_at]); client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  client_signon_at = 0;
  do
  :: client_signon_at < 8 -> assert(client_signon_read.username[client_signon_at] == client_signon_written.username[client_signon_at]); client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  client_signon_at = 0;
  do
  :: client_signon_at < 8 -> assert(client_signon_read.password_md_5_encryption[client_signon_at] == client_signon_written.password_md_5_encryption[client_signon_at]); client_signon_at = client_signon_at + 1
  :: else -> break
  od;
  skip
}

/* ---- New Allocation: 94 bytes ------------------------------------------------ */

/* The guide heads this message 106 bytes, while the fields it states measure 122 including the 28 byte header. */
typedef NewAllocation {
  byte reference_transaction_id[10];
  byte reference_trade_number[15];
  byte give_up_firm[4];
  byte volume[8];
  byte account_type;
  byte open_close;
  byte client_account_number[12];
  byte sub_trader_id[3];
  byte cmta_broker[4];
  byte client_memo[16];
  byte additional_firm[4];
  byte additional_client_memo[16]
};

int new_allocation_at;

/* every byte of New Allocation set to one value */
inline fill_new_allocation(new_allocation_record, new_allocation_value) {
  new_allocation_at = 0;
  do
  :: new_allocation_at < 10 -> new_allocation_record.reference_transaction_id[new_allocation_at] = new_allocation_value; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 15 -> new_allocation_record.reference_trade_number[new_allocation_at] = new_allocation_value; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 4 -> new_allocation_record.give_up_firm[new_allocation_at] = new_allocation_value; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 8 -> new_allocation_record.volume[new_allocation_at] = new_allocation_value; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_record.account_type = new_allocation_value;
  new_allocation_record.open_close = new_allocation_value;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 12 -> new_allocation_record.client_account_number[new_allocation_at] = new_allocation_value; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 3 -> new_allocation_record.sub_trader_id[new_allocation_at] = new_allocation_value; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 4 -> new_allocation_record.cmta_broker[new_allocation_at] = new_allocation_value; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 16 -> new_allocation_record.client_memo[new_allocation_at] = new_allocation_value; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 4 -> new_allocation_record.additional_firm[new_allocation_at] = new_allocation_value; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 16 -> new_allocation_record.additional_client_memo[new_allocation_at] = new_allocation_value; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of New Allocation set to where it lies, so a field read out of place says so */
inline ramp_new_allocation(new_allocation_record, new_allocation_base) {
  new_allocation_at = 0;
  do
  :: new_allocation_at < 10 -> new_allocation_record.reference_transaction_id[new_allocation_at] = (new_allocation_base + 0 + new_allocation_at + 1) % 256; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 15 -> new_allocation_record.reference_trade_number[new_allocation_at] = (new_allocation_base + 10 + new_allocation_at + 1) % 256; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 4 -> new_allocation_record.give_up_firm[new_allocation_at] = (new_allocation_base + 25 + new_allocation_at + 1) % 256; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 8 -> new_allocation_record.volume[new_allocation_at] = (new_allocation_base + 29 + new_allocation_at + 1) % 256; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_record.account_type = (new_allocation_base + 37 + 1) % 256;
  new_allocation_record.open_close = (new_allocation_base + 38 + 1) % 256;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 12 -> new_allocation_record.client_account_number[new_allocation_at] = (new_allocation_base + 39 + new_allocation_at + 1) % 256; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 3 -> new_allocation_record.sub_trader_id[new_allocation_at] = (new_allocation_base + 51 + new_allocation_at + 1) % 256; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 4 -> new_allocation_record.cmta_broker[new_allocation_at] = (new_allocation_base + 54 + new_allocation_at + 1) % 256; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 16 -> new_allocation_record.client_memo[new_allocation_at] = (new_allocation_base + 58 + new_allocation_at + 1) % 256; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 4 -> new_allocation_record.additional_firm[new_allocation_at] = (new_allocation_base + 74 + new_allocation_at + 1) % 256; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 16 -> new_allocation_record.additional_client_memo[new_allocation_at] = (new_allocation_base + 78 + new_allocation_at + 1) % 256; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  skip
}

/* New Allocation to the wire, 94 bytes from where the cursor stands */
inline encode_new_allocation(new_allocation_record) {
  new_allocation_at = 0;
  do
  :: new_allocation_at < 10 -> wire[at] = new_allocation_record.reference_transaction_id[new_allocation_at]; at = at + 1; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 15 -> wire[at] = new_allocation_record.reference_trade_number[new_allocation_at]; at = at + 1; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 4 -> wire[at] = new_allocation_record.give_up_firm[new_allocation_at]; at = at + 1; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 8 -> wire[at] = new_allocation_record.volume[new_allocation_at]; at = at + 1; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  wire[at] = new_allocation_record.account_type; at = at + 1;
  wire[at] = new_allocation_record.open_close; at = at + 1;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 12 -> wire[at] = new_allocation_record.client_account_number[new_allocation_at]; at = at + 1; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 3 -> wire[at] = new_allocation_record.sub_trader_id[new_allocation_at]; at = at + 1; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 4 -> wire[at] = new_allocation_record.cmta_broker[new_allocation_at]; at = at + 1; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 16 -> wire[at] = new_allocation_record.client_memo[new_allocation_at]; at = at + 1; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 4 -> wire[at] = new_allocation_record.additional_firm[new_allocation_at]; at = at + 1; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 16 -> wire[at] = new_allocation_record.additional_client_memo[new_allocation_at]; at = at + 1; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  skip
}

/* New Allocation off the wire, 94 bytes from where the cursor stands */
inline decode_new_allocation(new_allocation_record) {
  new_allocation_at = 0;
  do
  :: new_allocation_at < 10 -> new_allocation_record.reference_transaction_id[new_allocation_at] = wire[at]; at = at + 1; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 15 -> new_allocation_record.reference_trade_number[new_allocation_at] = wire[at]; at = at + 1; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 4 -> new_allocation_record.give_up_firm[new_allocation_at] = wire[at]; at = at + 1; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 8 -> new_allocation_record.volume[new_allocation_at] = wire[at]; at = at + 1; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_record.account_type = wire[at]; at = at + 1;
  new_allocation_record.open_close = wire[at]; at = at + 1;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 12 -> new_allocation_record.client_account_number[new_allocation_at] = wire[at]; at = at + 1; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 3 -> new_allocation_record.sub_trader_id[new_allocation_at] = wire[at]; at = at + 1; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 4 -> new_allocation_record.cmta_broker[new_allocation_at] = wire[at]; at = at + 1; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 16 -> new_allocation_record.client_memo[new_allocation_at] = wire[at]; at = at + 1; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 4 -> new_allocation_record.additional_firm[new_allocation_at] = wire[at]; at = at + 1; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 16 -> new_allocation_record.additional_client_memo[new_allocation_at] = wire[at]; at = at + 1; new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of New Allocation is what was written, byte for byte */
inline equal_new_allocation(new_allocation_read, new_allocation_written) {
  new_allocation_at = 0;
  do
  :: new_allocation_at < 10 -> assert(new_allocation_read.reference_transaction_id[new_allocation_at] == new_allocation_written.reference_transaction_id[new_allocation_at]); new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 15 -> assert(new_allocation_read.reference_trade_number[new_allocation_at] == new_allocation_written.reference_trade_number[new_allocation_at]); new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 4 -> assert(new_allocation_read.give_up_firm[new_allocation_at] == new_allocation_written.give_up_firm[new_allocation_at]); new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 8 -> assert(new_allocation_read.volume[new_allocation_at] == new_allocation_written.volume[new_allocation_at]); new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  assert(new_allocation_read.account_type == new_allocation_written.account_type);
  assert(new_allocation_read.open_close == new_allocation_written.open_close);
  new_allocation_at = 0;
  do
  :: new_allocation_at < 12 -> assert(new_allocation_read.client_account_number[new_allocation_at] == new_allocation_written.client_account_number[new_allocation_at]); new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 3 -> assert(new_allocation_read.sub_trader_id[new_allocation_at] == new_allocation_written.sub_trader_id[new_allocation_at]); new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 4 -> assert(new_allocation_read.cmta_broker[new_allocation_at] == new_allocation_written.cmta_broker[new_allocation_at]); new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 16 -> assert(new_allocation_read.client_memo[new_allocation_at] == new_allocation_written.client_memo[new_allocation_at]); new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 4 -> assert(new_allocation_read.additional_firm[new_allocation_at] == new_allocation_written.additional_firm[new_allocation_at]); new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  new_allocation_at = 0;
  do
  :: new_allocation_at < 16 -> assert(new_allocation_read.additional_client_memo[new_allocation_at] == new_allocation_written.additional_client_memo[new_allocation_at]); new_allocation_at = new_allocation_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Allocation: 94 bytes --------------------------------------------- */

/* The guide states this message as having the same structure as message type 42, whose fields are written out here. The guide heads this message 106 bytes, while the fields it states measure 122 including the 28 byte header. */
typedef ModifyAllocation {
  byte reference_transaction_id[10];
  byte reference_trade_number[15];
  byte give_up_firm[4];
  byte volume[8];
  byte account_type;
  byte open_close;
  byte client_account_number[12];
  byte sub_trader_id[3];
  byte cmta_broker[4];
  byte client_memo[16];
  byte additional_firm[4];
  byte additional_client_memo[16]
};

int modify_allocation_at;

/* every byte of Modify Allocation set to one value */
inline fill_modify_allocation(modify_allocation_record, modify_allocation_value) {
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 10 -> modify_allocation_record.reference_transaction_id[modify_allocation_at] = modify_allocation_value; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 15 -> modify_allocation_record.reference_trade_number[modify_allocation_at] = modify_allocation_value; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 4 -> modify_allocation_record.give_up_firm[modify_allocation_at] = modify_allocation_value; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 8 -> modify_allocation_record.volume[modify_allocation_at] = modify_allocation_value; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_record.account_type = modify_allocation_value;
  modify_allocation_record.open_close = modify_allocation_value;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 12 -> modify_allocation_record.client_account_number[modify_allocation_at] = modify_allocation_value; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 3 -> modify_allocation_record.sub_trader_id[modify_allocation_at] = modify_allocation_value; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 4 -> modify_allocation_record.cmta_broker[modify_allocation_at] = modify_allocation_value; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 16 -> modify_allocation_record.client_memo[modify_allocation_at] = modify_allocation_value; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 4 -> modify_allocation_record.additional_firm[modify_allocation_at] = modify_allocation_value; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 16 -> modify_allocation_record.additional_client_memo[modify_allocation_at] = modify_allocation_value; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Modify Allocation set to where it lies, so a field read out of place says so */
inline ramp_modify_allocation(modify_allocation_record, modify_allocation_base) {
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 10 -> modify_allocation_record.reference_transaction_id[modify_allocation_at] = (modify_allocation_base + 0 + modify_allocation_at + 1) % 256; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 15 -> modify_allocation_record.reference_trade_number[modify_allocation_at] = (modify_allocation_base + 10 + modify_allocation_at + 1) % 256; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 4 -> modify_allocation_record.give_up_firm[modify_allocation_at] = (modify_allocation_base + 25 + modify_allocation_at + 1) % 256; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 8 -> modify_allocation_record.volume[modify_allocation_at] = (modify_allocation_base + 29 + modify_allocation_at + 1) % 256; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_record.account_type = (modify_allocation_base + 37 + 1) % 256;
  modify_allocation_record.open_close = (modify_allocation_base + 38 + 1) % 256;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 12 -> modify_allocation_record.client_account_number[modify_allocation_at] = (modify_allocation_base + 39 + modify_allocation_at + 1) % 256; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 3 -> modify_allocation_record.sub_trader_id[modify_allocation_at] = (modify_allocation_base + 51 + modify_allocation_at + 1) % 256; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 4 -> modify_allocation_record.cmta_broker[modify_allocation_at] = (modify_allocation_base + 54 + modify_allocation_at + 1) % 256; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 16 -> modify_allocation_record.client_memo[modify_allocation_at] = (modify_allocation_base + 58 + modify_allocation_at + 1) % 256; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 4 -> modify_allocation_record.additional_firm[modify_allocation_at] = (modify_allocation_base + 74 + modify_allocation_at + 1) % 256; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 16 -> modify_allocation_record.additional_client_memo[modify_allocation_at] = (modify_allocation_base + 78 + modify_allocation_at + 1) % 256; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Allocation to the wire, 94 bytes from where the cursor stands */
inline encode_modify_allocation(modify_allocation_record) {
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 10 -> wire[at] = modify_allocation_record.reference_transaction_id[modify_allocation_at]; at = at + 1; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 15 -> wire[at] = modify_allocation_record.reference_trade_number[modify_allocation_at]; at = at + 1; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 4 -> wire[at] = modify_allocation_record.give_up_firm[modify_allocation_at]; at = at + 1; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 8 -> wire[at] = modify_allocation_record.volume[modify_allocation_at]; at = at + 1; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  wire[at] = modify_allocation_record.account_type; at = at + 1;
  wire[at] = modify_allocation_record.open_close; at = at + 1;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 12 -> wire[at] = modify_allocation_record.client_account_number[modify_allocation_at]; at = at + 1; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 3 -> wire[at] = modify_allocation_record.sub_trader_id[modify_allocation_at]; at = at + 1; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 4 -> wire[at] = modify_allocation_record.cmta_broker[modify_allocation_at]; at = at + 1; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 16 -> wire[at] = modify_allocation_record.client_memo[modify_allocation_at]; at = at + 1; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 4 -> wire[at] = modify_allocation_record.additional_firm[modify_allocation_at]; at = at + 1; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 16 -> wire[at] = modify_allocation_record.additional_client_memo[modify_allocation_at]; at = at + 1; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Allocation off the wire, 94 bytes from where the cursor stands */
inline decode_modify_allocation(modify_allocation_record) {
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 10 -> modify_allocation_record.reference_transaction_id[modify_allocation_at] = wire[at]; at = at + 1; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 15 -> modify_allocation_record.reference_trade_number[modify_allocation_at] = wire[at]; at = at + 1; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 4 -> modify_allocation_record.give_up_firm[modify_allocation_at] = wire[at]; at = at + 1; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 8 -> modify_allocation_record.volume[modify_allocation_at] = wire[at]; at = at + 1; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_record.account_type = wire[at]; at = at + 1;
  modify_allocation_record.open_close = wire[at]; at = at + 1;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 12 -> modify_allocation_record.client_account_number[modify_allocation_at] = wire[at]; at = at + 1; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 3 -> modify_allocation_record.sub_trader_id[modify_allocation_at] = wire[at]; at = at + 1; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 4 -> modify_allocation_record.cmta_broker[modify_allocation_at] = wire[at]; at = at + 1; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 16 -> modify_allocation_record.client_memo[modify_allocation_at] = wire[at]; at = at + 1; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 4 -> modify_allocation_record.additional_firm[modify_allocation_at] = wire[at]; at = at + 1; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 16 -> modify_allocation_record.additional_client_memo[modify_allocation_at] = wire[at]; at = at + 1; modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Modify Allocation is what was written, byte for byte */
inline equal_modify_allocation(modify_allocation_read, modify_allocation_written) {
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 10 -> assert(modify_allocation_read.reference_transaction_id[modify_allocation_at] == modify_allocation_written.reference_transaction_id[modify_allocation_at]); modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 15 -> assert(modify_allocation_read.reference_trade_number[modify_allocation_at] == modify_allocation_written.reference_trade_number[modify_allocation_at]); modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 4 -> assert(modify_allocation_read.give_up_firm[modify_allocation_at] == modify_allocation_written.give_up_firm[modify_allocation_at]); modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 8 -> assert(modify_allocation_read.volume[modify_allocation_at] == modify_allocation_written.volume[modify_allocation_at]); modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  assert(modify_allocation_read.account_type == modify_allocation_written.account_type);
  assert(modify_allocation_read.open_close == modify_allocation_written.open_close);
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 12 -> assert(modify_allocation_read.client_account_number[modify_allocation_at] == modify_allocation_written.client_account_number[modify_allocation_at]); modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 3 -> assert(modify_allocation_read.sub_trader_id[modify_allocation_at] == modify_allocation_written.sub_trader_id[modify_allocation_at]); modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 4 -> assert(modify_allocation_read.cmta_broker[modify_allocation_at] == modify_allocation_written.cmta_broker[modify_allocation_at]); modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 16 -> assert(modify_allocation_read.client_memo[modify_allocation_at] == modify_allocation_written.client_memo[modify_allocation_at]); modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 4 -> assert(modify_allocation_read.additional_firm[modify_allocation_at] == modify_allocation_written.additional_firm[modify_allocation_at]); modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  modify_allocation_at = 0;
  do
  :: modify_allocation_at < 16 -> assert(modify_allocation_read.additional_client_memo[modify_allocation_at] == modify_allocation_written.additional_client_memo[modify_allocation_at]); modify_allocation_at = modify_allocation_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Delete Allocation: 25 bytes --------------------------------------------- */

typedef DeleteAllocation {
  byte reference_transaction_id[10];
  byte reference_trade_number[15]
};

int delete_allocation_at;

/* every byte of Delete Allocation set to one value */
inline fill_delete_allocation(delete_allocation_record, delete_allocation_value) {
  delete_allocation_at = 0;
  do
  :: delete_allocation_at < 10 -> delete_allocation_record.reference_transaction_id[delete_allocation_at] = delete_allocation_value; delete_allocation_at = delete_allocation_at + 1
  :: else -> break
  od;
  delete_allocation_at = 0;
  do
  :: delete_allocation_at < 15 -> delete_allocation_record.reference_trade_number[delete_allocation_at] = delete_allocation_value; delete_allocation_at = delete_allocation_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Delete Allocation set to where it lies, so a field read out of place says so */
inline ramp_delete_allocation(delete_allocation_record, delete_allocation_base) {
  delete_allocation_at = 0;
  do
  :: delete_allocation_at < 10 -> delete_allocation_record.reference_transaction_id[delete_allocation_at] = (delete_allocation_base + 0 + delete_allocation_at + 1) % 256; delete_allocation_at = delete_allocation_at + 1
  :: else -> break
  od;
  delete_allocation_at = 0;
  do
  :: delete_allocation_at < 15 -> delete_allocation_record.reference_trade_number[delete_allocation_at] = (delete_allocation_base + 10 + delete_allocation_at + 1) % 256; delete_allocation_at = delete_allocation_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Allocation to the wire, 25 bytes from where the cursor stands */
inline encode_delete_allocation(delete_allocation_record) {
  delete_allocation_at = 0;
  do
  :: delete_allocation_at < 10 -> wire[at] = delete_allocation_record.reference_transaction_id[delete_allocation_at]; at = at + 1; delete_allocation_at = delete_allocation_at + 1
  :: else -> break
  od;
  delete_allocation_at = 0;
  do
  :: delete_allocation_at < 15 -> wire[at] = delete_allocation_record.reference_trade_number[delete_allocation_at]; at = at + 1; delete_allocation_at = delete_allocation_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Allocation off the wire, 25 bytes from where the cursor stands */
inline decode_delete_allocation(delete_allocation_record) {
  delete_allocation_at = 0;
  do
  :: delete_allocation_at < 10 -> delete_allocation_record.reference_transaction_id[delete_allocation_at] = wire[at]; at = at + 1; delete_allocation_at = delete_allocation_at + 1
  :: else -> break
  od;
  delete_allocation_at = 0;
  do
  :: delete_allocation_at < 15 -> delete_allocation_record.reference_trade_number[delete_allocation_at] = wire[at]; at = at + 1; delete_allocation_at = delete_allocation_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Delete Allocation is what was written, byte for byte */
inline equal_delete_allocation(delete_allocation_read, delete_allocation_written) {
  delete_allocation_at = 0;
  do
  :: delete_allocation_at < 10 -> assert(delete_allocation_read.reference_transaction_id[delete_allocation_at] == delete_allocation_written.reference_transaction_id[delete_allocation_at]); delete_allocation_at = delete_allocation_at + 1
  :: else -> break
  od;
  delete_allocation_at = 0;
  do
  :: delete_allocation_at < 15 -> assert(delete_allocation_read.reference_trade_number[delete_allocation_at] == delete_allocation_written.reference_trade_number[delete_allocation_at]); delete_allocation_at = delete_allocation_at + 1
  :: else -> break
  od;
  skip
}

/* ---- New Give Up: 94 bytes --------------------------------------------------- */

/* The guide states this message as having the same structure as message type 42, whose fields are written out here. The guide heads this message 106 bytes, while the fields it states measure 122 including the 28 byte header. */
typedef NewGiveUp {
  byte reference_transaction_id[10];
  byte reference_trade_number[15];
  byte give_up_firm[4];
  byte volume[8];
  byte account_type;
  byte open_close;
  byte client_account_number[12];
  byte sub_trader_id[3];
  byte cmta_broker[4];
  byte client_memo[16];
  byte additional_firm[4];
  byte additional_client_memo[16]
};

int new_give_up_at;

/* every byte of New Give Up set to one value */
inline fill_new_give_up(new_give_up_record, new_give_up_value) {
  new_give_up_at = 0;
  do
  :: new_give_up_at < 10 -> new_give_up_record.reference_transaction_id[new_give_up_at] = new_give_up_value; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 15 -> new_give_up_record.reference_trade_number[new_give_up_at] = new_give_up_value; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 4 -> new_give_up_record.give_up_firm[new_give_up_at] = new_give_up_value; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 8 -> new_give_up_record.volume[new_give_up_at] = new_give_up_value; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_record.account_type = new_give_up_value;
  new_give_up_record.open_close = new_give_up_value;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 12 -> new_give_up_record.client_account_number[new_give_up_at] = new_give_up_value; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 3 -> new_give_up_record.sub_trader_id[new_give_up_at] = new_give_up_value; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 4 -> new_give_up_record.cmta_broker[new_give_up_at] = new_give_up_value; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 16 -> new_give_up_record.client_memo[new_give_up_at] = new_give_up_value; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 4 -> new_give_up_record.additional_firm[new_give_up_at] = new_give_up_value; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 16 -> new_give_up_record.additional_client_memo[new_give_up_at] = new_give_up_value; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of New Give Up set to where it lies, so a field read out of place says so */
inline ramp_new_give_up(new_give_up_record, new_give_up_base) {
  new_give_up_at = 0;
  do
  :: new_give_up_at < 10 -> new_give_up_record.reference_transaction_id[new_give_up_at] = (new_give_up_base + 0 + new_give_up_at + 1) % 256; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 15 -> new_give_up_record.reference_trade_number[new_give_up_at] = (new_give_up_base + 10 + new_give_up_at + 1) % 256; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 4 -> new_give_up_record.give_up_firm[new_give_up_at] = (new_give_up_base + 25 + new_give_up_at + 1) % 256; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 8 -> new_give_up_record.volume[new_give_up_at] = (new_give_up_base + 29 + new_give_up_at + 1) % 256; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_record.account_type = (new_give_up_base + 37 + 1) % 256;
  new_give_up_record.open_close = (new_give_up_base + 38 + 1) % 256;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 12 -> new_give_up_record.client_account_number[new_give_up_at] = (new_give_up_base + 39 + new_give_up_at + 1) % 256; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 3 -> new_give_up_record.sub_trader_id[new_give_up_at] = (new_give_up_base + 51 + new_give_up_at + 1) % 256; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 4 -> new_give_up_record.cmta_broker[new_give_up_at] = (new_give_up_base + 54 + new_give_up_at + 1) % 256; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 16 -> new_give_up_record.client_memo[new_give_up_at] = (new_give_up_base + 58 + new_give_up_at + 1) % 256; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 4 -> new_give_up_record.additional_firm[new_give_up_at] = (new_give_up_base + 74 + new_give_up_at + 1) % 256; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 16 -> new_give_up_record.additional_client_memo[new_give_up_at] = (new_give_up_base + 78 + new_give_up_at + 1) % 256; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  skip
}

/* New Give Up to the wire, 94 bytes from where the cursor stands */
inline encode_new_give_up(new_give_up_record) {
  new_give_up_at = 0;
  do
  :: new_give_up_at < 10 -> wire[at] = new_give_up_record.reference_transaction_id[new_give_up_at]; at = at + 1; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 15 -> wire[at] = new_give_up_record.reference_trade_number[new_give_up_at]; at = at + 1; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 4 -> wire[at] = new_give_up_record.give_up_firm[new_give_up_at]; at = at + 1; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 8 -> wire[at] = new_give_up_record.volume[new_give_up_at]; at = at + 1; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  wire[at] = new_give_up_record.account_type; at = at + 1;
  wire[at] = new_give_up_record.open_close; at = at + 1;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 12 -> wire[at] = new_give_up_record.client_account_number[new_give_up_at]; at = at + 1; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 3 -> wire[at] = new_give_up_record.sub_trader_id[new_give_up_at]; at = at + 1; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 4 -> wire[at] = new_give_up_record.cmta_broker[new_give_up_at]; at = at + 1; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 16 -> wire[at] = new_give_up_record.client_memo[new_give_up_at]; at = at + 1; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 4 -> wire[at] = new_give_up_record.additional_firm[new_give_up_at]; at = at + 1; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 16 -> wire[at] = new_give_up_record.additional_client_memo[new_give_up_at]; at = at + 1; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  skip
}

/* New Give Up off the wire, 94 bytes from where the cursor stands */
inline decode_new_give_up(new_give_up_record) {
  new_give_up_at = 0;
  do
  :: new_give_up_at < 10 -> new_give_up_record.reference_transaction_id[new_give_up_at] = wire[at]; at = at + 1; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 15 -> new_give_up_record.reference_trade_number[new_give_up_at] = wire[at]; at = at + 1; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 4 -> new_give_up_record.give_up_firm[new_give_up_at] = wire[at]; at = at + 1; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 8 -> new_give_up_record.volume[new_give_up_at] = wire[at]; at = at + 1; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_record.account_type = wire[at]; at = at + 1;
  new_give_up_record.open_close = wire[at]; at = at + 1;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 12 -> new_give_up_record.client_account_number[new_give_up_at] = wire[at]; at = at + 1; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 3 -> new_give_up_record.sub_trader_id[new_give_up_at] = wire[at]; at = at + 1; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 4 -> new_give_up_record.cmta_broker[new_give_up_at] = wire[at]; at = at + 1; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 16 -> new_give_up_record.client_memo[new_give_up_at] = wire[at]; at = at + 1; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 4 -> new_give_up_record.additional_firm[new_give_up_at] = wire[at]; at = at + 1; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 16 -> new_give_up_record.additional_client_memo[new_give_up_at] = wire[at]; at = at + 1; new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of New Give Up is what was written, byte for byte */
inline equal_new_give_up(new_give_up_read, new_give_up_written) {
  new_give_up_at = 0;
  do
  :: new_give_up_at < 10 -> assert(new_give_up_read.reference_transaction_id[new_give_up_at] == new_give_up_written.reference_transaction_id[new_give_up_at]); new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 15 -> assert(new_give_up_read.reference_trade_number[new_give_up_at] == new_give_up_written.reference_trade_number[new_give_up_at]); new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 4 -> assert(new_give_up_read.give_up_firm[new_give_up_at] == new_give_up_written.give_up_firm[new_give_up_at]); new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 8 -> assert(new_give_up_read.volume[new_give_up_at] == new_give_up_written.volume[new_give_up_at]); new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  assert(new_give_up_read.account_type == new_give_up_written.account_type);
  assert(new_give_up_read.open_close == new_give_up_written.open_close);
  new_give_up_at = 0;
  do
  :: new_give_up_at < 12 -> assert(new_give_up_read.client_account_number[new_give_up_at] == new_give_up_written.client_account_number[new_give_up_at]); new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 3 -> assert(new_give_up_read.sub_trader_id[new_give_up_at] == new_give_up_written.sub_trader_id[new_give_up_at]); new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 4 -> assert(new_give_up_read.cmta_broker[new_give_up_at] == new_give_up_written.cmta_broker[new_give_up_at]); new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 16 -> assert(new_give_up_read.client_memo[new_give_up_at] == new_give_up_written.client_memo[new_give_up_at]); new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 4 -> assert(new_give_up_read.additional_firm[new_give_up_at] == new_give_up_written.additional_firm[new_give_up_at]); new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  new_give_up_at = 0;
  do
  :: new_give_up_at < 16 -> assert(new_give_up_read.additional_client_memo[new_give_up_at] == new_give_up_written.additional_client_memo[new_give_up_at]); new_give_up_at = new_give_up_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Give Up: 94 bytes ------------------------------------------------ */

/* The guide states this message as having the same structure as message type 42, whose fields are written out here. The guide heads this message 106 bytes, while the fields it states measure 122 including the 28 byte header. */
typedef ModifyGiveUp {
  byte reference_transaction_id[10];
  byte reference_trade_number[15];
  byte give_up_firm[4];
  byte volume[8];
  byte account_type;
  byte open_close;
  byte client_account_number[12];
  byte sub_trader_id[3];
  byte cmta_broker[4];
  byte client_memo[16];
  byte additional_firm[4];
  byte additional_client_memo[16]
};

int modify_give_up_at;

/* every byte of Modify Give Up set to one value */
inline fill_modify_give_up(modify_give_up_record, modify_give_up_value) {
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 10 -> modify_give_up_record.reference_transaction_id[modify_give_up_at] = modify_give_up_value; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 15 -> modify_give_up_record.reference_trade_number[modify_give_up_at] = modify_give_up_value; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 4 -> modify_give_up_record.give_up_firm[modify_give_up_at] = modify_give_up_value; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 8 -> modify_give_up_record.volume[modify_give_up_at] = modify_give_up_value; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_record.account_type = modify_give_up_value;
  modify_give_up_record.open_close = modify_give_up_value;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 12 -> modify_give_up_record.client_account_number[modify_give_up_at] = modify_give_up_value; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 3 -> modify_give_up_record.sub_trader_id[modify_give_up_at] = modify_give_up_value; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 4 -> modify_give_up_record.cmta_broker[modify_give_up_at] = modify_give_up_value; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 16 -> modify_give_up_record.client_memo[modify_give_up_at] = modify_give_up_value; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 4 -> modify_give_up_record.additional_firm[modify_give_up_at] = modify_give_up_value; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 16 -> modify_give_up_record.additional_client_memo[modify_give_up_at] = modify_give_up_value; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Modify Give Up set to where it lies, so a field read out of place says so */
inline ramp_modify_give_up(modify_give_up_record, modify_give_up_base) {
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 10 -> modify_give_up_record.reference_transaction_id[modify_give_up_at] = (modify_give_up_base + 0 + modify_give_up_at + 1) % 256; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 15 -> modify_give_up_record.reference_trade_number[modify_give_up_at] = (modify_give_up_base + 10 + modify_give_up_at + 1) % 256; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 4 -> modify_give_up_record.give_up_firm[modify_give_up_at] = (modify_give_up_base + 25 + modify_give_up_at + 1) % 256; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 8 -> modify_give_up_record.volume[modify_give_up_at] = (modify_give_up_base + 29 + modify_give_up_at + 1) % 256; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_record.account_type = (modify_give_up_base + 37 + 1) % 256;
  modify_give_up_record.open_close = (modify_give_up_base + 38 + 1) % 256;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 12 -> modify_give_up_record.client_account_number[modify_give_up_at] = (modify_give_up_base + 39 + modify_give_up_at + 1) % 256; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 3 -> modify_give_up_record.sub_trader_id[modify_give_up_at] = (modify_give_up_base + 51 + modify_give_up_at + 1) % 256; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 4 -> modify_give_up_record.cmta_broker[modify_give_up_at] = (modify_give_up_base + 54 + modify_give_up_at + 1) % 256; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 16 -> modify_give_up_record.client_memo[modify_give_up_at] = (modify_give_up_base + 58 + modify_give_up_at + 1) % 256; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 4 -> modify_give_up_record.additional_firm[modify_give_up_at] = (modify_give_up_base + 74 + modify_give_up_at + 1) % 256; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 16 -> modify_give_up_record.additional_client_memo[modify_give_up_at] = (modify_give_up_base + 78 + modify_give_up_at + 1) % 256; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Give Up to the wire, 94 bytes from where the cursor stands */
inline encode_modify_give_up(modify_give_up_record) {
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 10 -> wire[at] = modify_give_up_record.reference_transaction_id[modify_give_up_at]; at = at + 1; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 15 -> wire[at] = modify_give_up_record.reference_trade_number[modify_give_up_at]; at = at + 1; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 4 -> wire[at] = modify_give_up_record.give_up_firm[modify_give_up_at]; at = at + 1; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 8 -> wire[at] = modify_give_up_record.volume[modify_give_up_at]; at = at + 1; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  wire[at] = modify_give_up_record.account_type; at = at + 1;
  wire[at] = modify_give_up_record.open_close; at = at + 1;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 12 -> wire[at] = modify_give_up_record.client_account_number[modify_give_up_at]; at = at + 1; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 3 -> wire[at] = modify_give_up_record.sub_trader_id[modify_give_up_at]; at = at + 1; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 4 -> wire[at] = modify_give_up_record.cmta_broker[modify_give_up_at]; at = at + 1; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 16 -> wire[at] = modify_give_up_record.client_memo[modify_give_up_at]; at = at + 1; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 4 -> wire[at] = modify_give_up_record.additional_firm[modify_give_up_at]; at = at + 1; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 16 -> wire[at] = modify_give_up_record.additional_client_memo[modify_give_up_at]; at = at + 1; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Give Up off the wire, 94 bytes from where the cursor stands */
inline decode_modify_give_up(modify_give_up_record) {
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 10 -> modify_give_up_record.reference_transaction_id[modify_give_up_at] = wire[at]; at = at + 1; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 15 -> modify_give_up_record.reference_trade_number[modify_give_up_at] = wire[at]; at = at + 1; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 4 -> modify_give_up_record.give_up_firm[modify_give_up_at] = wire[at]; at = at + 1; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 8 -> modify_give_up_record.volume[modify_give_up_at] = wire[at]; at = at + 1; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_record.account_type = wire[at]; at = at + 1;
  modify_give_up_record.open_close = wire[at]; at = at + 1;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 12 -> modify_give_up_record.client_account_number[modify_give_up_at] = wire[at]; at = at + 1; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 3 -> modify_give_up_record.sub_trader_id[modify_give_up_at] = wire[at]; at = at + 1; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 4 -> modify_give_up_record.cmta_broker[modify_give_up_at] = wire[at]; at = at + 1; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 16 -> modify_give_up_record.client_memo[modify_give_up_at] = wire[at]; at = at + 1; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 4 -> modify_give_up_record.additional_firm[modify_give_up_at] = wire[at]; at = at + 1; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 16 -> modify_give_up_record.additional_client_memo[modify_give_up_at] = wire[at]; at = at + 1; modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Modify Give Up is what was written, byte for byte */
inline equal_modify_give_up(modify_give_up_read, modify_give_up_written) {
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 10 -> assert(modify_give_up_read.reference_transaction_id[modify_give_up_at] == modify_give_up_written.reference_transaction_id[modify_give_up_at]); modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 15 -> assert(modify_give_up_read.reference_trade_number[modify_give_up_at] == modify_give_up_written.reference_trade_number[modify_give_up_at]); modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 4 -> assert(modify_give_up_read.give_up_firm[modify_give_up_at] == modify_give_up_written.give_up_firm[modify_give_up_at]); modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 8 -> assert(modify_give_up_read.volume[modify_give_up_at] == modify_give_up_written.volume[modify_give_up_at]); modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  assert(modify_give_up_read.account_type == modify_give_up_written.account_type);
  assert(modify_give_up_read.open_close == modify_give_up_written.open_close);
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 12 -> assert(modify_give_up_read.client_account_number[modify_give_up_at] == modify_give_up_written.client_account_number[modify_give_up_at]); modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 3 -> assert(modify_give_up_read.sub_trader_id[modify_give_up_at] == modify_give_up_written.sub_trader_id[modify_give_up_at]); modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 4 -> assert(modify_give_up_read.cmta_broker[modify_give_up_at] == modify_give_up_written.cmta_broker[modify_give_up_at]); modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 16 -> assert(modify_give_up_read.client_memo[modify_give_up_at] == modify_give_up_written.client_memo[modify_give_up_at]); modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 4 -> assert(modify_give_up_read.additional_firm[modify_give_up_at] == modify_give_up_written.additional_firm[modify_give_up_at]); modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  modify_give_up_at = 0;
  do
  :: modify_give_up_at < 16 -> assert(modify_give_up_read.additional_client_memo[modify_give_up_at] == modify_give_up_written.additional_client_memo[modify_give_up_at]); modify_give_up_at = modify_give_up_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Delete Give Up: 25 bytes ------------------------------------------------ */

/* The guide states this message as having the same structure as message type 44, whose fields are written out here. */
typedef DeleteGiveUp {
  byte reference_transaction_id[10];
  byte reference_trade_number[15]
};

int delete_give_up_at;

/* every byte of Delete Give Up set to one value */
inline fill_delete_give_up(delete_give_up_record, delete_give_up_value) {
  delete_give_up_at = 0;
  do
  :: delete_give_up_at < 10 -> delete_give_up_record.reference_transaction_id[delete_give_up_at] = delete_give_up_value; delete_give_up_at = delete_give_up_at + 1
  :: else -> break
  od;
  delete_give_up_at = 0;
  do
  :: delete_give_up_at < 15 -> delete_give_up_record.reference_trade_number[delete_give_up_at] = delete_give_up_value; delete_give_up_at = delete_give_up_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Delete Give Up set to where it lies, so a field read out of place says so */
inline ramp_delete_give_up(delete_give_up_record, delete_give_up_base) {
  delete_give_up_at = 0;
  do
  :: delete_give_up_at < 10 -> delete_give_up_record.reference_transaction_id[delete_give_up_at] = (delete_give_up_base + 0 + delete_give_up_at + 1) % 256; delete_give_up_at = delete_give_up_at + 1
  :: else -> break
  od;
  delete_give_up_at = 0;
  do
  :: delete_give_up_at < 15 -> delete_give_up_record.reference_trade_number[delete_give_up_at] = (delete_give_up_base + 10 + delete_give_up_at + 1) % 256; delete_give_up_at = delete_give_up_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Give Up to the wire, 25 bytes from where the cursor stands */
inline encode_delete_give_up(delete_give_up_record) {
  delete_give_up_at = 0;
  do
  :: delete_give_up_at < 10 -> wire[at] = delete_give_up_record.reference_transaction_id[delete_give_up_at]; at = at + 1; delete_give_up_at = delete_give_up_at + 1
  :: else -> break
  od;
  delete_give_up_at = 0;
  do
  :: delete_give_up_at < 15 -> wire[at] = delete_give_up_record.reference_trade_number[delete_give_up_at]; at = at + 1; delete_give_up_at = delete_give_up_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Give Up off the wire, 25 bytes from where the cursor stands */
inline decode_delete_give_up(delete_give_up_record) {
  delete_give_up_at = 0;
  do
  :: delete_give_up_at < 10 -> delete_give_up_record.reference_transaction_id[delete_give_up_at] = wire[at]; at = at + 1; delete_give_up_at = delete_give_up_at + 1
  :: else -> break
  od;
  delete_give_up_at = 0;
  do
  :: delete_give_up_at < 15 -> delete_give_up_record.reference_trade_number[delete_give_up_at] = wire[at]; at = at + 1; delete_give_up_at = delete_give_up_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Delete Give Up is what was written, byte for byte */
inline equal_delete_give_up(delete_give_up_read, delete_give_up_written) {
  delete_give_up_at = 0;
  do
  :: delete_give_up_at < 10 -> assert(delete_give_up_read.reference_transaction_id[delete_give_up_at] == delete_give_up_written.reference_transaction_id[delete_give_up_at]); delete_give_up_at = delete_give_up_at + 1
  :: else -> break
  od;
  delete_give_up_at = 0;
  do
  :: delete_give_up_at < 15 -> assert(delete_give_up_read.reference_trade_number[delete_give_up_at] == delete_give_up_written.reference_trade_number[delete_give_up_at]); delete_give_up_at = delete_give_up_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

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
    assert(at == 28);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 28);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Restart Request: encoded, read back, and compared */
proctype check_restart_request() {
  RestartRequest restart_request_sent;
  RestartRequest restart_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_restart_request(restart_request_sent, 0)
  :: pattern == 1 -> fill_restart_request(restart_request_sent, 32)
  :: pattern == 2 -> fill_restart_request(restart_request_sent, 255)
  :: else -> ramp_restart_request(restart_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_restart_request(restart_request_sent);
    assert(at == 8);
    at = 0;
    decode_restart_request(restart_request_got);
    assert(at == 8);
    equal_restart_request(restart_request_got, restart_request_sent)
  }
}

/* Client Signon: encoded, read back, and compared */
proctype check_client_signon() {
  ClientSignon client_signon_sent;
  ClientSignon client_signon_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_client_signon(client_signon_sent, 0)
  :: pattern == 1 -> fill_client_signon(client_signon_sent, 32)
  :: pattern == 2 -> fill_client_signon(client_signon_sent, 255)
  :: else -> ramp_client_signon(client_signon_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_client_signon(client_signon_sent);
    assert(at == 36);
    at = 0;
    decode_client_signon(client_signon_got);
    assert(at == 36);
    equal_client_signon(client_signon_got, client_signon_sent)
  }
}

/* New Allocation: encoded, read back, and compared */
proctype check_new_allocation() {
  NewAllocation new_allocation_sent;
  NewAllocation new_allocation_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_allocation(new_allocation_sent, 0)
  :: pattern == 1 -> fill_new_allocation(new_allocation_sent, 32)
  :: pattern == 2 -> fill_new_allocation(new_allocation_sent, 255)
  :: else -> ramp_new_allocation(new_allocation_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_allocation(new_allocation_sent);
    assert(at == 94);
    at = 0;
    decode_new_allocation(new_allocation_got);
    assert(at == 94);
    equal_new_allocation(new_allocation_got, new_allocation_sent)
  }
}

/* Modify Allocation: encoded, read back, and compared */
proctype check_modify_allocation() {
  ModifyAllocation modify_allocation_sent;
  ModifyAllocation modify_allocation_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_allocation(modify_allocation_sent, 0)
  :: pattern == 1 -> fill_modify_allocation(modify_allocation_sent, 32)
  :: pattern == 2 -> fill_modify_allocation(modify_allocation_sent, 255)
  :: else -> ramp_modify_allocation(modify_allocation_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_allocation(modify_allocation_sent);
    assert(at == 94);
    at = 0;
    decode_modify_allocation(modify_allocation_got);
    assert(at == 94);
    equal_modify_allocation(modify_allocation_got, modify_allocation_sent)
  }
}

/* Delete Allocation: encoded, read back, and compared */
proctype check_delete_allocation() {
  DeleteAllocation delete_allocation_sent;
  DeleteAllocation delete_allocation_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_delete_allocation(delete_allocation_sent, 0)
  :: pattern == 1 -> fill_delete_allocation(delete_allocation_sent, 32)
  :: pattern == 2 -> fill_delete_allocation(delete_allocation_sent, 255)
  :: else -> ramp_delete_allocation(delete_allocation_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_delete_allocation(delete_allocation_sent);
    assert(at == 25);
    at = 0;
    decode_delete_allocation(delete_allocation_got);
    assert(at == 25);
    equal_delete_allocation(delete_allocation_got, delete_allocation_sent)
  }
}

/* New Give Up: encoded, read back, and compared */
proctype check_new_give_up() {
  NewGiveUp new_give_up_sent;
  NewGiveUp new_give_up_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_give_up(new_give_up_sent, 0)
  :: pattern == 1 -> fill_new_give_up(new_give_up_sent, 32)
  :: pattern == 2 -> fill_new_give_up(new_give_up_sent, 255)
  :: else -> ramp_new_give_up(new_give_up_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_give_up(new_give_up_sent);
    assert(at == 94);
    at = 0;
    decode_new_give_up(new_give_up_got);
    assert(at == 94);
    equal_new_give_up(new_give_up_got, new_give_up_sent)
  }
}

/* Modify Give Up: encoded, read back, and compared */
proctype check_modify_give_up() {
  ModifyGiveUp modify_give_up_sent;
  ModifyGiveUp modify_give_up_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_give_up(modify_give_up_sent, 0)
  :: pattern == 1 -> fill_modify_give_up(modify_give_up_sent, 32)
  :: pattern == 2 -> fill_modify_give_up(modify_give_up_sent, 255)
  :: else -> ramp_modify_give_up(modify_give_up_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_give_up(modify_give_up_sent);
    assert(at == 94);
    at = 0;
    decode_modify_give_up(modify_give_up_got);
    assert(at == 94);
    equal_modify_give_up(modify_give_up_got, modify_give_up_sent)
  }
}

/* Delete Give Up: encoded, read back, and compared */
proctype check_delete_give_up() {
  DeleteGiveUp delete_give_up_sent;
  DeleteGiveUp delete_give_up_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_delete_give_up(delete_give_up_sent, 0)
  :: pattern == 1 -> fill_delete_give_up(delete_give_up_sent, 32)
  :: pattern == 2 -> fill_delete_give_up(delete_give_up_sent, 255)
  :: else -> ramp_delete_give_up(delete_give_up_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_delete_give_up(delete_give_up_sent);
    assert(at == 25);
    at = 0;
    decode_delete_give_up(delete_give_up_got);
    assert(at == 25);
    equal_delete_give_up(delete_give_up_got, delete_give_up_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_restart_request()
  :: run check_client_signon()
  :: run check_new_allocation()
  :: run check_modify_allocation()
  :: run check_delete_allocation()
  :: run check_new_give_up()
  :: run check_modify_give_up()
  :: run check_delete_give_up()
  fi
}
