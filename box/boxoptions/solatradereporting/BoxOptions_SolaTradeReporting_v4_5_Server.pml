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
#define WIRE 208

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

/* ---- Client Signon Acknowledgment: 8 bytes ----------------------------------- */

typedef ClientSignonAcknowledgment {
  byte last_user_sequence_number[8]
};

int client_signon_acknowledgment_at;

/* every byte of Client Signon Acknowledgment set to one value */
inline fill_client_signon_acknowledgment(client_signon_acknowledgment_record, client_signon_acknowledgment_value) {
  client_signon_acknowledgment_at = 0;
  do
  :: client_signon_acknowledgment_at < 8 -> client_signon_acknowledgment_record.last_user_sequence_number[client_signon_acknowledgment_at] = client_signon_acknowledgment_value; client_signon_acknowledgment_at = client_signon_acknowledgment_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Client Signon Acknowledgment set to where it lies, so a field read out of place says so */
inline ramp_client_signon_acknowledgment(client_signon_acknowledgment_record, client_signon_acknowledgment_base) {
  client_signon_acknowledgment_at = 0;
  do
  :: client_signon_acknowledgment_at < 8 -> client_signon_acknowledgment_record.last_user_sequence_number[client_signon_acknowledgment_at] = (client_signon_acknowledgment_base + 0 + client_signon_acknowledgment_at + 1) % 256; client_signon_acknowledgment_at = client_signon_acknowledgment_at + 1
  :: else -> break
  od;
  skip
}

/* Client Signon Acknowledgment to the wire, 8 bytes from where the cursor stands */
inline encode_client_signon_acknowledgment(client_signon_acknowledgment_record) {
  client_signon_acknowledgment_at = 0;
  do
  :: client_signon_acknowledgment_at < 8 -> wire[at] = client_signon_acknowledgment_record.last_user_sequence_number[client_signon_acknowledgment_at]; at = at + 1; client_signon_acknowledgment_at = client_signon_acknowledgment_at + 1
  :: else -> break
  od;
  skip
}

/* Client Signon Acknowledgment off the wire, 8 bytes from where the cursor stands */
inline decode_client_signon_acknowledgment(client_signon_acknowledgment_record) {
  client_signon_acknowledgment_at = 0;
  do
  :: client_signon_acknowledgment_at < 8 -> client_signon_acknowledgment_record.last_user_sequence_number[client_signon_acknowledgment_at] = wire[at]; at = at + 1; client_signon_acknowledgment_at = client_signon_acknowledgment_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Client Signon Acknowledgment is what was written, byte for byte */
inline equal_client_signon_acknowledgment(client_signon_acknowledgment_read, client_signon_acknowledgment_written) {
  client_signon_acknowledgment_at = 0;
  do
  :: client_signon_acknowledgment_at < 8 -> assert(client_signon_acknowledgment_read.last_user_sequence_number[client_signon_acknowledgment_at] == client_signon_acknowledgment_written.last_user_sequence_number[client_signon_acknowledgment_at]); client_signon_acknowledgment_at = client_signon_acknowledgment_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade: 200 bytes -------------------------------------------------------- */

/* The guide heads this message 212 bytes, while the fields it states measure 228 including the 28 byte header. */
typedef Trade {
  byte trade_number[15];
  byte transaction_type;
  byte timestamp[6];
  byte symbol[30];
  byte expiration_date[6];
  byte strike_price[8];
  byte strike_price_fraction_indicator;
  byte option_type;
  byte volume[8];
  byte price[8];
  byte cmta_broker[4];
  byte account_type;
  byte sub_trader_id[3];
  byte open_close;
  byte executing_broker[4];
  byte client_account_number[12];
  byte client_order_id[20];
  byte client_memo[16];
  byte liquidity_status;
  byte trade_type;
  byte opposite_account_type;
  byte participant_session_name[12];
  byte unique_transaction_id[10];
  byte parent_transaction_id[10];
  byte opposite_executing_broker[4];
  byte additional_client_memo[16]
};

int trade_at;

/* every byte of Trade set to one value */
inline fill_trade(trade_record, trade_value) {
  trade_at = 0;
  do
  :: trade_at < 15 -> trade_record.trade_number[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.transaction_type = trade_value;
  trade_at = 0;
  do
  :: trade_at < 6 -> trade_record.timestamp[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 30 -> trade_record.symbol[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 6 -> trade_record.expiration_date[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.strike_price[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.strike_price_fraction_indicator = trade_value;
  trade_record.option_type = trade_value;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.volume[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.price[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.cmta_broker[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.account_type = trade_value;
  trade_at = 0;
  do
  :: trade_at < 3 -> trade_record.sub_trader_id[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.open_close = trade_value;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.executing_broker[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 12 -> trade_record.client_account_number[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 20 -> trade_record.client_order_id[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 16 -> trade_record.client_memo[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.liquidity_status = trade_value;
  trade_record.trade_type = trade_value;
  trade_record.opposite_account_type = trade_value;
  trade_at = 0;
  do
  :: trade_at < 12 -> trade_record.participant_session_name[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 10 -> trade_record.unique_transaction_id[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 10 -> trade_record.parent_transaction_id[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.opposite_executing_broker[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 16 -> trade_record.additional_client_memo[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade set to where it lies, so a field read out of place says so */
inline ramp_trade(trade_record, trade_base) {
  trade_at = 0;
  do
  :: trade_at < 15 -> trade_record.trade_number[trade_at] = (trade_base + 0 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.transaction_type = (trade_base + 15 + 1) % 256;
  trade_at = 0;
  do
  :: trade_at < 6 -> trade_record.timestamp[trade_at] = (trade_base + 16 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 30 -> trade_record.symbol[trade_at] = (trade_base + 22 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 6 -> trade_record.expiration_date[trade_at] = (trade_base + 52 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.strike_price[trade_at] = (trade_base + 58 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.strike_price_fraction_indicator = (trade_base + 66 + 1) % 256;
  trade_record.option_type = (trade_base + 67 + 1) % 256;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.volume[trade_at] = (trade_base + 68 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.price[trade_at] = (trade_base + 76 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.cmta_broker[trade_at] = (trade_base + 84 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.account_type = (trade_base + 88 + 1) % 256;
  trade_at = 0;
  do
  :: trade_at < 3 -> trade_record.sub_trader_id[trade_at] = (trade_base + 89 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.open_close = (trade_base + 92 + 1) % 256;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.executing_broker[trade_at] = (trade_base + 93 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 12 -> trade_record.client_account_number[trade_at] = (trade_base + 97 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 20 -> trade_record.client_order_id[trade_at] = (trade_base + 109 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 16 -> trade_record.client_memo[trade_at] = (trade_base + 129 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.liquidity_status = (trade_base + 145 + 1) % 256;
  trade_record.trade_type = (trade_base + 146 + 1) % 256;
  trade_record.opposite_account_type = (trade_base + 147 + 1) % 256;
  trade_at = 0;
  do
  :: trade_at < 12 -> trade_record.participant_session_name[trade_at] = (trade_base + 148 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 10 -> trade_record.unique_transaction_id[trade_at] = (trade_base + 160 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 10 -> trade_record.parent_transaction_id[trade_at] = (trade_base + 170 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.opposite_executing_broker[trade_at] = (trade_base + 180 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 16 -> trade_record.additional_client_memo[trade_at] = (trade_base + 184 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  skip
}

/* Trade to the wire, 200 bytes from where the cursor stands */
inline encode_trade(trade_record) {
  trade_at = 0;
  do
  :: trade_at < 15 -> wire[at] = trade_record.trade_number[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  wire[at] = trade_record.transaction_type; at = at + 1;
  trade_at = 0;
  do
  :: trade_at < 6 -> wire[at] = trade_record.timestamp[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 30 -> wire[at] = trade_record.symbol[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 6 -> wire[at] = trade_record.expiration_date[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.strike_price[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  wire[at] = trade_record.strike_price_fraction_indicator; at = at + 1;
  wire[at] = trade_record.option_type; at = at + 1;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.volume[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.price[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> wire[at] = trade_record.cmta_broker[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  wire[at] = trade_record.account_type; at = at + 1;
  trade_at = 0;
  do
  :: trade_at < 3 -> wire[at] = trade_record.sub_trader_id[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  wire[at] = trade_record.open_close; at = at + 1;
  trade_at = 0;
  do
  :: trade_at < 4 -> wire[at] = trade_record.executing_broker[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 12 -> wire[at] = trade_record.client_account_number[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 20 -> wire[at] = trade_record.client_order_id[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 16 -> wire[at] = trade_record.client_memo[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  wire[at] = trade_record.liquidity_status; at = at + 1;
  wire[at] = trade_record.trade_type; at = at + 1;
  wire[at] = trade_record.opposite_account_type; at = at + 1;
  trade_at = 0;
  do
  :: trade_at < 12 -> wire[at] = trade_record.participant_session_name[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 10 -> wire[at] = trade_record.unique_transaction_id[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 10 -> wire[at] = trade_record.parent_transaction_id[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> wire[at] = trade_record.opposite_executing_broker[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 16 -> wire[at] = trade_record.additional_client_memo[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  skip
}

/* Trade off the wire, 200 bytes from where the cursor stands */
inline decode_trade(trade_record) {
  trade_at = 0;
  do
  :: trade_at < 15 -> trade_record.trade_number[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.transaction_type = wire[at]; at = at + 1;
  trade_at = 0;
  do
  :: trade_at < 6 -> trade_record.timestamp[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 30 -> trade_record.symbol[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 6 -> trade_record.expiration_date[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.strike_price[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.strike_price_fraction_indicator = wire[at]; at = at + 1;
  trade_record.option_type = wire[at]; at = at + 1;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.volume[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.price[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.cmta_broker[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.account_type = wire[at]; at = at + 1;
  trade_at = 0;
  do
  :: trade_at < 3 -> trade_record.sub_trader_id[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.open_close = wire[at]; at = at + 1;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.executing_broker[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 12 -> trade_record.client_account_number[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 20 -> trade_record.client_order_id[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 16 -> trade_record.client_memo[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.liquidity_status = wire[at]; at = at + 1;
  trade_record.trade_type = wire[at]; at = at + 1;
  trade_record.opposite_account_type = wire[at]; at = at + 1;
  trade_at = 0;
  do
  :: trade_at < 12 -> trade_record.participant_session_name[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 10 -> trade_record.unique_transaction_id[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 10 -> trade_record.parent_transaction_id[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.opposite_executing_broker[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 16 -> trade_record.additional_client_memo[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade is what was written, byte for byte */
inline equal_trade(trade_read, trade_written) {
  trade_at = 0;
  do
  :: trade_at < 15 -> assert(trade_read.trade_number[trade_at] == trade_written.trade_number[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  assert(trade_read.transaction_type == trade_written.transaction_type);
  trade_at = 0;
  do
  :: trade_at < 6 -> assert(trade_read.timestamp[trade_at] == trade_written.timestamp[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 30 -> assert(trade_read.symbol[trade_at] == trade_written.symbol[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 6 -> assert(trade_read.expiration_date[trade_at] == trade_written.expiration_date[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.strike_price[trade_at] == trade_written.strike_price[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  assert(trade_read.strike_price_fraction_indicator == trade_written.strike_price_fraction_indicator);
  assert(trade_read.option_type == trade_written.option_type);
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.volume[trade_at] == trade_written.volume[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.price[trade_at] == trade_written.price[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> assert(trade_read.cmta_broker[trade_at] == trade_written.cmta_broker[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  assert(trade_read.account_type == trade_written.account_type);
  trade_at = 0;
  do
  :: trade_at < 3 -> assert(trade_read.sub_trader_id[trade_at] == trade_written.sub_trader_id[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  assert(trade_read.open_close == trade_written.open_close);
  trade_at = 0;
  do
  :: trade_at < 4 -> assert(trade_read.executing_broker[trade_at] == trade_written.executing_broker[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 12 -> assert(trade_read.client_account_number[trade_at] == trade_written.client_account_number[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 20 -> assert(trade_read.client_order_id[trade_at] == trade_written.client_order_id[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 16 -> assert(trade_read.client_memo[trade_at] == trade_written.client_memo[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  assert(trade_read.liquidity_status == trade_written.liquidity_status);
  assert(trade_read.trade_type == trade_written.trade_type);
  assert(trade_read.opposite_account_type == trade_written.opposite_account_type);
  trade_at = 0;
  do
  :: trade_at < 12 -> assert(trade_read.participant_session_name[trade_at] == trade_written.participant_session_name[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 10 -> assert(trade_read.unique_transaction_id[trade_at] == trade_written.unique_transaction_id[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 10 -> assert(trade_read.parent_transaction_id[trade_at] == trade_written.parent_transaction_id[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> assert(trade_read.opposite_executing_broker[trade_at] == trade_written.opposite_executing_broker[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 16 -> assert(trade_read.additional_client_memo[trade_at] == trade_written.additional_client_memo[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Cancel: 200 bytes ------------------------------------------------- */

/* The guide states this message as having the same structure as message type 30, whose fields are written out here. The guide heads this message 212 bytes, while the fields it states measure 228 including the 28 byte header. */
typedef TradeCancel {
  byte trade_number[15];
  byte transaction_type;
  byte timestamp[6];
  byte symbol[30];
  byte expiration_date[6];
  byte strike_price[8];
  byte strike_price_fraction_indicator;
  byte option_type;
  byte volume[8];
  byte price[8];
  byte cmta_broker[4];
  byte account_type;
  byte sub_trader_id[3];
  byte open_close;
  byte executing_broker[4];
  byte client_account_number[12];
  byte client_order_id[20];
  byte client_memo[16];
  byte liquidity_status;
  byte trade_type;
  byte opposite_account_type;
  byte participant_session_name[12];
  byte unique_transaction_id[10];
  byte parent_transaction_id[10];
  byte opposite_executing_broker[4];
  byte additional_client_memo[16]
};

int trade_cancel_at;

/* every byte of Trade Cancel set to one value */
inline fill_trade_cancel(trade_cancel_record, trade_cancel_value) {
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 15 -> trade_cancel_record.trade_number[trade_cancel_at] = trade_cancel_value; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_record.transaction_type = trade_cancel_value;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 6 -> trade_cancel_record.timestamp[trade_cancel_at] = trade_cancel_value; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 30 -> trade_cancel_record.symbol[trade_cancel_at] = trade_cancel_value; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 6 -> trade_cancel_record.expiration_date[trade_cancel_at] = trade_cancel_value; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 8 -> trade_cancel_record.strike_price[trade_cancel_at] = trade_cancel_value; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_record.strike_price_fraction_indicator = trade_cancel_value;
  trade_cancel_record.option_type = trade_cancel_value;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 8 -> trade_cancel_record.volume[trade_cancel_at] = trade_cancel_value; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 8 -> trade_cancel_record.price[trade_cancel_at] = trade_cancel_value; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 4 -> trade_cancel_record.cmta_broker[trade_cancel_at] = trade_cancel_value; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_record.account_type = trade_cancel_value;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 3 -> trade_cancel_record.sub_trader_id[trade_cancel_at] = trade_cancel_value; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_record.open_close = trade_cancel_value;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 4 -> trade_cancel_record.executing_broker[trade_cancel_at] = trade_cancel_value; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 12 -> trade_cancel_record.client_account_number[trade_cancel_at] = trade_cancel_value; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 20 -> trade_cancel_record.client_order_id[trade_cancel_at] = trade_cancel_value; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 16 -> trade_cancel_record.client_memo[trade_cancel_at] = trade_cancel_value; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_record.liquidity_status = trade_cancel_value;
  trade_cancel_record.trade_type = trade_cancel_value;
  trade_cancel_record.opposite_account_type = trade_cancel_value;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 12 -> trade_cancel_record.participant_session_name[trade_cancel_at] = trade_cancel_value; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 10 -> trade_cancel_record.unique_transaction_id[trade_cancel_at] = trade_cancel_value; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 10 -> trade_cancel_record.parent_transaction_id[trade_cancel_at] = trade_cancel_value; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 4 -> trade_cancel_record.opposite_executing_broker[trade_cancel_at] = trade_cancel_value; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 16 -> trade_cancel_record.additional_client_memo[trade_cancel_at] = trade_cancel_value; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Cancel set to where it lies, so a field read out of place says so */
inline ramp_trade_cancel(trade_cancel_record, trade_cancel_base) {
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 15 -> trade_cancel_record.trade_number[trade_cancel_at] = (trade_cancel_base + 0 + trade_cancel_at + 1) % 256; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_record.transaction_type = (trade_cancel_base + 15 + 1) % 256;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 6 -> trade_cancel_record.timestamp[trade_cancel_at] = (trade_cancel_base + 16 + trade_cancel_at + 1) % 256; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 30 -> trade_cancel_record.symbol[trade_cancel_at] = (trade_cancel_base + 22 + trade_cancel_at + 1) % 256; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 6 -> trade_cancel_record.expiration_date[trade_cancel_at] = (trade_cancel_base + 52 + trade_cancel_at + 1) % 256; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 8 -> trade_cancel_record.strike_price[trade_cancel_at] = (trade_cancel_base + 58 + trade_cancel_at + 1) % 256; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_record.strike_price_fraction_indicator = (trade_cancel_base + 66 + 1) % 256;
  trade_cancel_record.option_type = (trade_cancel_base + 67 + 1) % 256;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 8 -> trade_cancel_record.volume[trade_cancel_at] = (trade_cancel_base + 68 + trade_cancel_at + 1) % 256; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 8 -> trade_cancel_record.price[trade_cancel_at] = (trade_cancel_base + 76 + trade_cancel_at + 1) % 256; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 4 -> trade_cancel_record.cmta_broker[trade_cancel_at] = (trade_cancel_base + 84 + trade_cancel_at + 1) % 256; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_record.account_type = (trade_cancel_base + 88 + 1) % 256;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 3 -> trade_cancel_record.sub_trader_id[trade_cancel_at] = (trade_cancel_base + 89 + trade_cancel_at + 1) % 256; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_record.open_close = (trade_cancel_base + 92 + 1) % 256;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 4 -> trade_cancel_record.executing_broker[trade_cancel_at] = (trade_cancel_base + 93 + trade_cancel_at + 1) % 256; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 12 -> trade_cancel_record.client_account_number[trade_cancel_at] = (trade_cancel_base + 97 + trade_cancel_at + 1) % 256; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 20 -> trade_cancel_record.client_order_id[trade_cancel_at] = (trade_cancel_base + 109 + trade_cancel_at + 1) % 256; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 16 -> trade_cancel_record.client_memo[trade_cancel_at] = (trade_cancel_base + 129 + trade_cancel_at + 1) % 256; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_record.liquidity_status = (trade_cancel_base + 145 + 1) % 256;
  trade_cancel_record.trade_type = (trade_cancel_base + 146 + 1) % 256;
  trade_cancel_record.opposite_account_type = (trade_cancel_base + 147 + 1) % 256;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 12 -> trade_cancel_record.participant_session_name[trade_cancel_at] = (trade_cancel_base + 148 + trade_cancel_at + 1) % 256; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 10 -> trade_cancel_record.unique_transaction_id[trade_cancel_at] = (trade_cancel_base + 160 + trade_cancel_at + 1) % 256; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 10 -> trade_cancel_record.parent_transaction_id[trade_cancel_at] = (trade_cancel_base + 170 + trade_cancel_at + 1) % 256; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 4 -> trade_cancel_record.opposite_executing_broker[trade_cancel_at] = (trade_cancel_base + 180 + trade_cancel_at + 1) % 256; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 16 -> trade_cancel_record.additional_client_memo[trade_cancel_at] = (trade_cancel_base + 184 + trade_cancel_at + 1) % 256; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel to the wire, 200 bytes from where the cursor stands */
inline encode_trade_cancel(trade_cancel_record) {
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 15 -> wire[at] = trade_cancel_record.trade_number[trade_cancel_at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_record.transaction_type; at = at + 1;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 6 -> wire[at] = trade_cancel_record.timestamp[trade_cancel_at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 30 -> wire[at] = trade_cancel_record.symbol[trade_cancel_at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 6 -> wire[at] = trade_cancel_record.expiration_date[trade_cancel_at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 8 -> wire[at] = trade_cancel_record.strike_price[trade_cancel_at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_record.strike_price_fraction_indicator; at = at + 1;
  wire[at] = trade_cancel_record.option_type; at = at + 1;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 8 -> wire[at] = trade_cancel_record.volume[trade_cancel_at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 8 -> wire[at] = trade_cancel_record.price[trade_cancel_at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 4 -> wire[at] = trade_cancel_record.cmta_broker[trade_cancel_at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_record.account_type; at = at + 1;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 3 -> wire[at] = trade_cancel_record.sub_trader_id[trade_cancel_at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_record.open_close; at = at + 1;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 4 -> wire[at] = trade_cancel_record.executing_broker[trade_cancel_at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 12 -> wire[at] = trade_cancel_record.client_account_number[trade_cancel_at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 20 -> wire[at] = trade_cancel_record.client_order_id[trade_cancel_at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 16 -> wire[at] = trade_cancel_record.client_memo[trade_cancel_at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_record.liquidity_status; at = at + 1;
  wire[at] = trade_cancel_record.trade_type; at = at + 1;
  wire[at] = trade_cancel_record.opposite_account_type; at = at + 1;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 12 -> wire[at] = trade_cancel_record.participant_session_name[trade_cancel_at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 10 -> wire[at] = trade_cancel_record.unique_transaction_id[trade_cancel_at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 10 -> wire[at] = trade_cancel_record.parent_transaction_id[trade_cancel_at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 4 -> wire[at] = trade_cancel_record.opposite_executing_broker[trade_cancel_at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 16 -> wire[at] = trade_cancel_record.additional_client_memo[trade_cancel_at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel off the wire, 200 bytes from where the cursor stands */
inline decode_trade_cancel(trade_cancel_record) {
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 15 -> trade_cancel_record.trade_number[trade_cancel_at] = wire[at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_record.transaction_type = wire[at]; at = at + 1;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 6 -> trade_cancel_record.timestamp[trade_cancel_at] = wire[at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 30 -> trade_cancel_record.symbol[trade_cancel_at] = wire[at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 6 -> trade_cancel_record.expiration_date[trade_cancel_at] = wire[at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 8 -> trade_cancel_record.strike_price[trade_cancel_at] = wire[at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_record.strike_price_fraction_indicator = wire[at]; at = at + 1;
  trade_cancel_record.option_type = wire[at]; at = at + 1;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 8 -> trade_cancel_record.volume[trade_cancel_at] = wire[at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 8 -> trade_cancel_record.price[trade_cancel_at] = wire[at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 4 -> trade_cancel_record.cmta_broker[trade_cancel_at] = wire[at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_record.account_type = wire[at]; at = at + 1;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 3 -> trade_cancel_record.sub_trader_id[trade_cancel_at] = wire[at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_record.open_close = wire[at]; at = at + 1;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 4 -> trade_cancel_record.executing_broker[trade_cancel_at] = wire[at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 12 -> trade_cancel_record.client_account_number[trade_cancel_at] = wire[at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 20 -> trade_cancel_record.client_order_id[trade_cancel_at] = wire[at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 16 -> trade_cancel_record.client_memo[trade_cancel_at] = wire[at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_record.liquidity_status = wire[at]; at = at + 1;
  trade_cancel_record.trade_type = wire[at]; at = at + 1;
  trade_cancel_record.opposite_account_type = wire[at]; at = at + 1;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 12 -> trade_cancel_record.participant_session_name[trade_cancel_at] = wire[at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 10 -> trade_cancel_record.unique_transaction_id[trade_cancel_at] = wire[at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 10 -> trade_cancel_record.parent_transaction_id[trade_cancel_at] = wire[at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 4 -> trade_cancel_record.opposite_executing_broker[trade_cancel_at] = wire[at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 16 -> trade_cancel_record.additional_client_memo[trade_cancel_at] = wire[at]; at = at + 1; trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Cancel is what was written, byte for byte */
inline equal_trade_cancel(trade_cancel_read, trade_cancel_written) {
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 15 -> assert(trade_cancel_read.trade_number[trade_cancel_at] == trade_cancel_written.trade_number[trade_cancel_at]); trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  assert(trade_cancel_read.transaction_type == trade_cancel_written.transaction_type);
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 6 -> assert(trade_cancel_read.timestamp[trade_cancel_at] == trade_cancel_written.timestamp[trade_cancel_at]); trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 30 -> assert(trade_cancel_read.symbol[trade_cancel_at] == trade_cancel_written.symbol[trade_cancel_at]); trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 6 -> assert(trade_cancel_read.expiration_date[trade_cancel_at] == trade_cancel_written.expiration_date[trade_cancel_at]); trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 8 -> assert(trade_cancel_read.strike_price[trade_cancel_at] == trade_cancel_written.strike_price[trade_cancel_at]); trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  assert(trade_cancel_read.strike_price_fraction_indicator == trade_cancel_written.strike_price_fraction_indicator);
  assert(trade_cancel_read.option_type == trade_cancel_written.option_type);
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 8 -> assert(trade_cancel_read.volume[trade_cancel_at] == trade_cancel_written.volume[trade_cancel_at]); trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 8 -> assert(trade_cancel_read.price[trade_cancel_at] == trade_cancel_written.price[trade_cancel_at]); trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 4 -> assert(trade_cancel_read.cmta_broker[trade_cancel_at] == trade_cancel_written.cmta_broker[trade_cancel_at]); trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  assert(trade_cancel_read.account_type == trade_cancel_written.account_type);
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 3 -> assert(trade_cancel_read.sub_trader_id[trade_cancel_at] == trade_cancel_written.sub_trader_id[trade_cancel_at]); trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  assert(trade_cancel_read.open_close == trade_cancel_written.open_close);
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 4 -> assert(trade_cancel_read.executing_broker[trade_cancel_at] == trade_cancel_written.executing_broker[trade_cancel_at]); trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 12 -> assert(trade_cancel_read.client_account_number[trade_cancel_at] == trade_cancel_written.client_account_number[trade_cancel_at]); trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 20 -> assert(trade_cancel_read.client_order_id[trade_cancel_at] == trade_cancel_written.client_order_id[trade_cancel_at]); trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 16 -> assert(trade_cancel_read.client_memo[trade_cancel_at] == trade_cancel_written.client_memo[trade_cancel_at]); trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  assert(trade_cancel_read.liquidity_status == trade_cancel_written.liquidity_status);
  assert(trade_cancel_read.trade_type == trade_cancel_written.trade_type);
  assert(trade_cancel_read.opposite_account_type == trade_cancel_written.opposite_account_type);
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 12 -> assert(trade_cancel_read.participant_session_name[trade_cancel_at] == trade_cancel_written.participant_session_name[trade_cancel_at]); trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 10 -> assert(trade_cancel_read.unique_transaction_id[trade_cancel_at] == trade_cancel_written.unique_transaction_id[trade_cancel_at]); trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 10 -> assert(trade_cancel_read.parent_transaction_id[trade_cancel_at] == trade_cancel_written.parent_transaction_id[trade_cancel_at]); trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 4 -> assert(trade_cancel_read.opposite_executing_broker[trade_cancel_at] == trade_cancel_written.opposite_executing_broker[trade_cancel_at]); trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  trade_cancel_at = 0;
  do
  :: trade_cancel_at < 16 -> assert(trade_cancel_read.additional_client_memo[trade_cancel_at] == trade_cancel_written.additional_client_memo[trade_cancel_at]); trade_cancel_at = trade_cancel_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Allocation: 200 bytes --------------------------------------------------- */

/* The guide states this message as having the same structure as message type 30, whose fields are written out here. The guide heads this message 212 bytes, while the fields it states measure 228 including the 28 byte header. */
typedef Allocation {
  byte trade_number[15];
  byte transaction_type;
  byte timestamp[6];
  byte symbol[30];
  byte expiration_date[6];
  byte strike_price[8];
  byte strike_price_fraction_indicator;
  byte option_type;
  byte volume[8];
  byte price[8];
  byte cmta_broker[4];
  byte account_type;
  byte sub_trader_id[3];
  byte open_close;
  byte executing_broker[4];
  byte client_account_number[12];
  byte client_order_id[20];
  byte client_memo[16];
  byte liquidity_status;
  byte trade_type;
  byte opposite_account_type;
  byte participant_session_name[12];
  byte unique_transaction_id[10];
  byte parent_transaction_id[10];
  byte opposite_executing_broker[4];
  byte additional_client_memo[16]
};

int allocation_at;

/* every byte of Allocation set to one value */
inline fill_allocation(allocation_record, allocation_value) {
  allocation_at = 0;
  do
  :: allocation_at < 15 -> allocation_record.trade_number[allocation_at] = allocation_value; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_record.transaction_type = allocation_value;
  allocation_at = 0;
  do
  :: allocation_at < 6 -> allocation_record.timestamp[allocation_at] = allocation_value; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 30 -> allocation_record.symbol[allocation_at] = allocation_value; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 6 -> allocation_record.expiration_date[allocation_at] = allocation_value; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 8 -> allocation_record.strike_price[allocation_at] = allocation_value; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_record.strike_price_fraction_indicator = allocation_value;
  allocation_record.option_type = allocation_value;
  allocation_at = 0;
  do
  :: allocation_at < 8 -> allocation_record.volume[allocation_at] = allocation_value; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 8 -> allocation_record.price[allocation_at] = allocation_value; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 4 -> allocation_record.cmta_broker[allocation_at] = allocation_value; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_record.account_type = allocation_value;
  allocation_at = 0;
  do
  :: allocation_at < 3 -> allocation_record.sub_trader_id[allocation_at] = allocation_value; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_record.open_close = allocation_value;
  allocation_at = 0;
  do
  :: allocation_at < 4 -> allocation_record.executing_broker[allocation_at] = allocation_value; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 12 -> allocation_record.client_account_number[allocation_at] = allocation_value; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 20 -> allocation_record.client_order_id[allocation_at] = allocation_value; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 16 -> allocation_record.client_memo[allocation_at] = allocation_value; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_record.liquidity_status = allocation_value;
  allocation_record.trade_type = allocation_value;
  allocation_record.opposite_account_type = allocation_value;
  allocation_at = 0;
  do
  :: allocation_at < 12 -> allocation_record.participant_session_name[allocation_at] = allocation_value; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 10 -> allocation_record.unique_transaction_id[allocation_at] = allocation_value; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 10 -> allocation_record.parent_transaction_id[allocation_at] = allocation_value; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 4 -> allocation_record.opposite_executing_broker[allocation_at] = allocation_value; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 16 -> allocation_record.additional_client_memo[allocation_at] = allocation_value; allocation_at = allocation_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Allocation set to where it lies, so a field read out of place says so */
inline ramp_allocation(allocation_record, allocation_base) {
  allocation_at = 0;
  do
  :: allocation_at < 15 -> allocation_record.trade_number[allocation_at] = (allocation_base + 0 + allocation_at + 1) % 256; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_record.transaction_type = (allocation_base + 15 + 1) % 256;
  allocation_at = 0;
  do
  :: allocation_at < 6 -> allocation_record.timestamp[allocation_at] = (allocation_base + 16 + allocation_at + 1) % 256; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 30 -> allocation_record.symbol[allocation_at] = (allocation_base + 22 + allocation_at + 1) % 256; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 6 -> allocation_record.expiration_date[allocation_at] = (allocation_base + 52 + allocation_at + 1) % 256; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 8 -> allocation_record.strike_price[allocation_at] = (allocation_base + 58 + allocation_at + 1) % 256; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_record.strike_price_fraction_indicator = (allocation_base + 66 + 1) % 256;
  allocation_record.option_type = (allocation_base + 67 + 1) % 256;
  allocation_at = 0;
  do
  :: allocation_at < 8 -> allocation_record.volume[allocation_at] = (allocation_base + 68 + allocation_at + 1) % 256; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 8 -> allocation_record.price[allocation_at] = (allocation_base + 76 + allocation_at + 1) % 256; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 4 -> allocation_record.cmta_broker[allocation_at] = (allocation_base + 84 + allocation_at + 1) % 256; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_record.account_type = (allocation_base + 88 + 1) % 256;
  allocation_at = 0;
  do
  :: allocation_at < 3 -> allocation_record.sub_trader_id[allocation_at] = (allocation_base + 89 + allocation_at + 1) % 256; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_record.open_close = (allocation_base + 92 + 1) % 256;
  allocation_at = 0;
  do
  :: allocation_at < 4 -> allocation_record.executing_broker[allocation_at] = (allocation_base + 93 + allocation_at + 1) % 256; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 12 -> allocation_record.client_account_number[allocation_at] = (allocation_base + 97 + allocation_at + 1) % 256; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 20 -> allocation_record.client_order_id[allocation_at] = (allocation_base + 109 + allocation_at + 1) % 256; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 16 -> allocation_record.client_memo[allocation_at] = (allocation_base + 129 + allocation_at + 1) % 256; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_record.liquidity_status = (allocation_base + 145 + 1) % 256;
  allocation_record.trade_type = (allocation_base + 146 + 1) % 256;
  allocation_record.opposite_account_type = (allocation_base + 147 + 1) % 256;
  allocation_at = 0;
  do
  :: allocation_at < 12 -> allocation_record.participant_session_name[allocation_at] = (allocation_base + 148 + allocation_at + 1) % 256; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 10 -> allocation_record.unique_transaction_id[allocation_at] = (allocation_base + 160 + allocation_at + 1) % 256; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 10 -> allocation_record.parent_transaction_id[allocation_at] = (allocation_base + 170 + allocation_at + 1) % 256; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 4 -> allocation_record.opposite_executing_broker[allocation_at] = (allocation_base + 180 + allocation_at + 1) % 256; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 16 -> allocation_record.additional_client_memo[allocation_at] = (allocation_base + 184 + allocation_at + 1) % 256; allocation_at = allocation_at + 1
  :: else -> break
  od;
  skip
}

/* Allocation to the wire, 200 bytes from where the cursor stands */
inline encode_allocation(allocation_record) {
  allocation_at = 0;
  do
  :: allocation_at < 15 -> wire[at] = allocation_record.trade_number[allocation_at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  wire[at] = allocation_record.transaction_type; at = at + 1;
  allocation_at = 0;
  do
  :: allocation_at < 6 -> wire[at] = allocation_record.timestamp[allocation_at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 30 -> wire[at] = allocation_record.symbol[allocation_at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 6 -> wire[at] = allocation_record.expiration_date[allocation_at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 8 -> wire[at] = allocation_record.strike_price[allocation_at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  wire[at] = allocation_record.strike_price_fraction_indicator; at = at + 1;
  wire[at] = allocation_record.option_type; at = at + 1;
  allocation_at = 0;
  do
  :: allocation_at < 8 -> wire[at] = allocation_record.volume[allocation_at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 8 -> wire[at] = allocation_record.price[allocation_at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 4 -> wire[at] = allocation_record.cmta_broker[allocation_at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  wire[at] = allocation_record.account_type; at = at + 1;
  allocation_at = 0;
  do
  :: allocation_at < 3 -> wire[at] = allocation_record.sub_trader_id[allocation_at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  wire[at] = allocation_record.open_close; at = at + 1;
  allocation_at = 0;
  do
  :: allocation_at < 4 -> wire[at] = allocation_record.executing_broker[allocation_at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 12 -> wire[at] = allocation_record.client_account_number[allocation_at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 20 -> wire[at] = allocation_record.client_order_id[allocation_at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 16 -> wire[at] = allocation_record.client_memo[allocation_at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  wire[at] = allocation_record.liquidity_status; at = at + 1;
  wire[at] = allocation_record.trade_type; at = at + 1;
  wire[at] = allocation_record.opposite_account_type; at = at + 1;
  allocation_at = 0;
  do
  :: allocation_at < 12 -> wire[at] = allocation_record.participant_session_name[allocation_at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 10 -> wire[at] = allocation_record.unique_transaction_id[allocation_at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 10 -> wire[at] = allocation_record.parent_transaction_id[allocation_at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 4 -> wire[at] = allocation_record.opposite_executing_broker[allocation_at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 16 -> wire[at] = allocation_record.additional_client_memo[allocation_at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  skip
}

/* Allocation off the wire, 200 bytes from where the cursor stands */
inline decode_allocation(allocation_record) {
  allocation_at = 0;
  do
  :: allocation_at < 15 -> allocation_record.trade_number[allocation_at] = wire[at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_record.transaction_type = wire[at]; at = at + 1;
  allocation_at = 0;
  do
  :: allocation_at < 6 -> allocation_record.timestamp[allocation_at] = wire[at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 30 -> allocation_record.symbol[allocation_at] = wire[at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 6 -> allocation_record.expiration_date[allocation_at] = wire[at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 8 -> allocation_record.strike_price[allocation_at] = wire[at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_record.strike_price_fraction_indicator = wire[at]; at = at + 1;
  allocation_record.option_type = wire[at]; at = at + 1;
  allocation_at = 0;
  do
  :: allocation_at < 8 -> allocation_record.volume[allocation_at] = wire[at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 8 -> allocation_record.price[allocation_at] = wire[at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 4 -> allocation_record.cmta_broker[allocation_at] = wire[at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_record.account_type = wire[at]; at = at + 1;
  allocation_at = 0;
  do
  :: allocation_at < 3 -> allocation_record.sub_trader_id[allocation_at] = wire[at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_record.open_close = wire[at]; at = at + 1;
  allocation_at = 0;
  do
  :: allocation_at < 4 -> allocation_record.executing_broker[allocation_at] = wire[at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 12 -> allocation_record.client_account_number[allocation_at] = wire[at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 20 -> allocation_record.client_order_id[allocation_at] = wire[at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 16 -> allocation_record.client_memo[allocation_at] = wire[at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_record.liquidity_status = wire[at]; at = at + 1;
  allocation_record.trade_type = wire[at]; at = at + 1;
  allocation_record.opposite_account_type = wire[at]; at = at + 1;
  allocation_at = 0;
  do
  :: allocation_at < 12 -> allocation_record.participant_session_name[allocation_at] = wire[at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 10 -> allocation_record.unique_transaction_id[allocation_at] = wire[at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 10 -> allocation_record.parent_transaction_id[allocation_at] = wire[at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 4 -> allocation_record.opposite_executing_broker[allocation_at] = wire[at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 16 -> allocation_record.additional_client_memo[allocation_at] = wire[at]; at = at + 1; allocation_at = allocation_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Allocation is what was written, byte for byte */
inline equal_allocation(allocation_read, allocation_written) {
  allocation_at = 0;
  do
  :: allocation_at < 15 -> assert(allocation_read.trade_number[allocation_at] == allocation_written.trade_number[allocation_at]); allocation_at = allocation_at + 1
  :: else -> break
  od;
  assert(allocation_read.transaction_type == allocation_written.transaction_type);
  allocation_at = 0;
  do
  :: allocation_at < 6 -> assert(allocation_read.timestamp[allocation_at] == allocation_written.timestamp[allocation_at]); allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 30 -> assert(allocation_read.symbol[allocation_at] == allocation_written.symbol[allocation_at]); allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 6 -> assert(allocation_read.expiration_date[allocation_at] == allocation_written.expiration_date[allocation_at]); allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 8 -> assert(allocation_read.strike_price[allocation_at] == allocation_written.strike_price[allocation_at]); allocation_at = allocation_at + 1
  :: else -> break
  od;
  assert(allocation_read.strike_price_fraction_indicator == allocation_written.strike_price_fraction_indicator);
  assert(allocation_read.option_type == allocation_written.option_type);
  allocation_at = 0;
  do
  :: allocation_at < 8 -> assert(allocation_read.volume[allocation_at] == allocation_written.volume[allocation_at]); allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 8 -> assert(allocation_read.price[allocation_at] == allocation_written.price[allocation_at]); allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 4 -> assert(allocation_read.cmta_broker[allocation_at] == allocation_written.cmta_broker[allocation_at]); allocation_at = allocation_at + 1
  :: else -> break
  od;
  assert(allocation_read.account_type == allocation_written.account_type);
  allocation_at = 0;
  do
  :: allocation_at < 3 -> assert(allocation_read.sub_trader_id[allocation_at] == allocation_written.sub_trader_id[allocation_at]); allocation_at = allocation_at + 1
  :: else -> break
  od;
  assert(allocation_read.open_close == allocation_written.open_close);
  allocation_at = 0;
  do
  :: allocation_at < 4 -> assert(allocation_read.executing_broker[allocation_at] == allocation_written.executing_broker[allocation_at]); allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 12 -> assert(allocation_read.client_account_number[allocation_at] == allocation_written.client_account_number[allocation_at]); allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 20 -> assert(allocation_read.client_order_id[allocation_at] == allocation_written.client_order_id[allocation_at]); allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 16 -> assert(allocation_read.client_memo[allocation_at] == allocation_written.client_memo[allocation_at]); allocation_at = allocation_at + 1
  :: else -> break
  od;
  assert(allocation_read.liquidity_status == allocation_written.liquidity_status);
  assert(allocation_read.trade_type == allocation_written.trade_type);
  assert(allocation_read.opposite_account_type == allocation_written.opposite_account_type);
  allocation_at = 0;
  do
  :: allocation_at < 12 -> assert(allocation_read.participant_session_name[allocation_at] == allocation_written.participant_session_name[allocation_at]); allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 10 -> assert(allocation_read.unique_transaction_id[allocation_at] == allocation_written.unique_transaction_id[allocation_at]); allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 10 -> assert(allocation_read.parent_transaction_id[allocation_at] == allocation_written.parent_transaction_id[allocation_at]); allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 4 -> assert(allocation_read.opposite_executing_broker[allocation_at] == allocation_written.opposite_executing_broker[allocation_at]); allocation_at = allocation_at + 1
  :: else -> break
  od;
  allocation_at = 0;
  do
  :: allocation_at < 16 -> assert(allocation_read.additional_client_memo[allocation_at] == allocation_written.additional_client_memo[allocation_at]); allocation_at = allocation_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Allocation Cancel: 200 bytes -------------------------------------------- */

/* The guide states this message as having the same structure as message type 30, whose fields are written out here. The guide heads this message 212 bytes, while the fields it states measure 228 including the 28 byte header. */
typedef AllocationCancel {
  byte trade_number[15];
  byte transaction_type;
  byte timestamp[6];
  byte symbol[30];
  byte expiration_date[6];
  byte strike_price[8];
  byte strike_price_fraction_indicator;
  byte option_type;
  byte volume[8];
  byte price[8];
  byte cmta_broker[4];
  byte account_type;
  byte sub_trader_id[3];
  byte open_close;
  byte executing_broker[4];
  byte client_account_number[12];
  byte client_order_id[20];
  byte client_memo[16];
  byte liquidity_status;
  byte trade_type;
  byte opposite_account_type;
  byte participant_session_name[12];
  byte unique_transaction_id[10];
  byte parent_transaction_id[10];
  byte opposite_executing_broker[4];
  byte additional_client_memo[16]
};

int allocation_cancel_at;

/* every byte of Allocation Cancel set to one value */
inline fill_allocation_cancel(allocation_cancel_record, allocation_cancel_value) {
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 15 -> allocation_cancel_record.trade_number[allocation_cancel_at] = allocation_cancel_value; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_record.transaction_type = allocation_cancel_value;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 6 -> allocation_cancel_record.timestamp[allocation_cancel_at] = allocation_cancel_value; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 30 -> allocation_cancel_record.symbol[allocation_cancel_at] = allocation_cancel_value; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 6 -> allocation_cancel_record.expiration_date[allocation_cancel_at] = allocation_cancel_value; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 8 -> allocation_cancel_record.strike_price[allocation_cancel_at] = allocation_cancel_value; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_record.strike_price_fraction_indicator = allocation_cancel_value;
  allocation_cancel_record.option_type = allocation_cancel_value;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 8 -> allocation_cancel_record.volume[allocation_cancel_at] = allocation_cancel_value; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 8 -> allocation_cancel_record.price[allocation_cancel_at] = allocation_cancel_value; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 4 -> allocation_cancel_record.cmta_broker[allocation_cancel_at] = allocation_cancel_value; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_record.account_type = allocation_cancel_value;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 3 -> allocation_cancel_record.sub_trader_id[allocation_cancel_at] = allocation_cancel_value; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_record.open_close = allocation_cancel_value;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 4 -> allocation_cancel_record.executing_broker[allocation_cancel_at] = allocation_cancel_value; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 12 -> allocation_cancel_record.client_account_number[allocation_cancel_at] = allocation_cancel_value; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 20 -> allocation_cancel_record.client_order_id[allocation_cancel_at] = allocation_cancel_value; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 16 -> allocation_cancel_record.client_memo[allocation_cancel_at] = allocation_cancel_value; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_record.liquidity_status = allocation_cancel_value;
  allocation_cancel_record.trade_type = allocation_cancel_value;
  allocation_cancel_record.opposite_account_type = allocation_cancel_value;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 12 -> allocation_cancel_record.participant_session_name[allocation_cancel_at] = allocation_cancel_value; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 10 -> allocation_cancel_record.unique_transaction_id[allocation_cancel_at] = allocation_cancel_value; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 10 -> allocation_cancel_record.parent_transaction_id[allocation_cancel_at] = allocation_cancel_value; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 4 -> allocation_cancel_record.opposite_executing_broker[allocation_cancel_at] = allocation_cancel_value; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 16 -> allocation_cancel_record.additional_client_memo[allocation_cancel_at] = allocation_cancel_value; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Allocation Cancel set to where it lies, so a field read out of place says so */
inline ramp_allocation_cancel(allocation_cancel_record, allocation_cancel_base) {
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 15 -> allocation_cancel_record.trade_number[allocation_cancel_at] = (allocation_cancel_base + 0 + allocation_cancel_at + 1) % 256; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_record.transaction_type = (allocation_cancel_base + 15 + 1) % 256;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 6 -> allocation_cancel_record.timestamp[allocation_cancel_at] = (allocation_cancel_base + 16 + allocation_cancel_at + 1) % 256; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 30 -> allocation_cancel_record.symbol[allocation_cancel_at] = (allocation_cancel_base + 22 + allocation_cancel_at + 1) % 256; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 6 -> allocation_cancel_record.expiration_date[allocation_cancel_at] = (allocation_cancel_base + 52 + allocation_cancel_at + 1) % 256; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 8 -> allocation_cancel_record.strike_price[allocation_cancel_at] = (allocation_cancel_base + 58 + allocation_cancel_at + 1) % 256; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_record.strike_price_fraction_indicator = (allocation_cancel_base + 66 + 1) % 256;
  allocation_cancel_record.option_type = (allocation_cancel_base + 67 + 1) % 256;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 8 -> allocation_cancel_record.volume[allocation_cancel_at] = (allocation_cancel_base + 68 + allocation_cancel_at + 1) % 256; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 8 -> allocation_cancel_record.price[allocation_cancel_at] = (allocation_cancel_base + 76 + allocation_cancel_at + 1) % 256; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 4 -> allocation_cancel_record.cmta_broker[allocation_cancel_at] = (allocation_cancel_base + 84 + allocation_cancel_at + 1) % 256; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_record.account_type = (allocation_cancel_base + 88 + 1) % 256;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 3 -> allocation_cancel_record.sub_trader_id[allocation_cancel_at] = (allocation_cancel_base + 89 + allocation_cancel_at + 1) % 256; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_record.open_close = (allocation_cancel_base + 92 + 1) % 256;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 4 -> allocation_cancel_record.executing_broker[allocation_cancel_at] = (allocation_cancel_base + 93 + allocation_cancel_at + 1) % 256; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 12 -> allocation_cancel_record.client_account_number[allocation_cancel_at] = (allocation_cancel_base + 97 + allocation_cancel_at + 1) % 256; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 20 -> allocation_cancel_record.client_order_id[allocation_cancel_at] = (allocation_cancel_base + 109 + allocation_cancel_at + 1) % 256; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 16 -> allocation_cancel_record.client_memo[allocation_cancel_at] = (allocation_cancel_base + 129 + allocation_cancel_at + 1) % 256; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_record.liquidity_status = (allocation_cancel_base + 145 + 1) % 256;
  allocation_cancel_record.trade_type = (allocation_cancel_base + 146 + 1) % 256;
  allocation_cancel_record.opposite_account_type = (allocation_cancel_base + 147 + 1) % 256;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 12 -> allocation_cancel_record.participant_session_name[allocation_cancel_at] = (allocation_cancel_base + 148 + allocation_cancel_at + 1) % 256; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 10 -> allocation_cancel_record.unique_transaction_id[allocation_cancel_at] = (allocation_cancel_base + 160 + allocation_cancel_at + 1) % 256; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 10 -> allocation_cancel_record.parent_transaction_id[allocation_cancel_at] = (allocation_cancel_base + 170 + allocation_cancel_at + 1) % 256; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 4 -> allocation_cancel_record.opposite_executing_broker[allocation_cancel_at] = (allocation_cancel_base + 180 + allocation_cancel_at + 1) % 256; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 16 -> allocation_cancel_record.additional_client_memo[allocation_cancel_at] = (allocation_cancel_base + 184 + allocation_cancel_at + 1) % 256; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  skip
}

/* Allocation Cancel to the wire, 200 bytes from where the cursor stands */
inline encode_allocation_cancel(allocation_cancel_record) {
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 15 -> wire[at] = allocation_cancel_record.trade_number[allocation_cancel_at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  wire[at] = allocation_cancel_record.transaction_type; at = at + 1;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 6 -> wire[at] = allocation_cancel_record.timestamp[allocation_cancel_at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 30 -> wire[at] = allocation_cancel_record.symbol[allocation_cancel_at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 6 -> wire[at] = allocation_cancel_record.expiration_date[allocation_cancel_at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 8 -> wire[at] = allocation_cancel_record.strike_price[allocation_cancel_at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  wire[at] = allocation_cancel_record.strike_price_fraction_indicator; at = at + 1;
  wire[at] = allocation_cancel_record.option_type; at = at + 1;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 8 -> wire[at] = allocation_cancel_record.volume[allocation_cancel_at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 8 -> wire[at] = allocation_cancel_record.price[allocation_cancel_at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 4 -> wire[at] = allocation_cancel_record.cmta_broker[allocation_cancel_at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  wire[at] = allocation_cancel_record.account_type; at = at + 1;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 3 -> wire[at] = allocation_cancel_record.sub_trader_id[allocation_cancel_at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  wire[at] = allocation_cancel_record.open_close; at = at + 1;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 4 -> wire[at] = allocation_cancel_record.executing_broker[allocation_cancel_at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 12 -> wire[at] = allocation_cancel_record.client_account_number[allocation_cancel_at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 20 -> wire[at] = allocation_cancel_record.client_order_id[allocation_cancel_at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 16 -> wire[at] = allocation_cancel_record.client_memo[allocation_cancel_at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  wire[at] = allocation_cancel_record.liquidity_status; at = at + 1;
  wire[at] = allocation_cancel_record.trade_type; at = at + 1;
  wire[at] = allocation_cancel_record.opposite_account_type; at = at + 1;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 12 -> wire[at] = allocation_cancel_record.participant_session_name[allocation_cancel_at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 10 -> wire[at] = allocation_cancel_record.unique_transaction_id[allocation_cancel_at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 10 -> wire[at] = allocation_cancel_record.parent_transaction_id[allocation_cancel_at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 4 -> wire[at] = allocation_cancel_record.opposite_executing_broker[allocation_cancel_at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 16 -> wire[at] = allocation_cancel_record.additional_client_memo[allocation_cancel_at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  skip
}

/* Allocation Cancel off the wire, 200 bytes from where the cursor stands */
inline decode_allocation_cancel(allocation_cancel_record) {
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 15 -> allocation_cancel_record.trade_number[allocation_cancel_at] = wire[at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_record.transaction_type = wire[at]; at = at + 1;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 6 -> allocation_cancel_record.timestamp[allocation_cancel_at] = wire[at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 30 -> allocation_cancel_record.symbol[allocation_cancel_at] = wire[at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 6 -> allocation_cancel_record.expiration_date[allocation_cancel_at] = wire[at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 8 -> allocation_cancel_record.strike_price[allocation_cancel_at] = wire[at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_record.strike_price_fraction_indicator = wire[at]; at = at + 1;
  allocation_cancel_record.option_type = wire[at]; at = at + 1;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 8 -> allocation_cancel_record.volume[allocation_cancel_at] = wire[at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 8 -> allocation_cancel_record.price[allocation_cancel_at] = wire[at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 4 -> allocation_cancel_record.cmta_broker[allocation_cancel_at] = wire[at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_record.account_type = wire[at]; at = at + 1;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 3 -> allocation_cancel_record.sub_trader_id[allocation_cancel_at] = wire[at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_record.open_close = wire[at]; at = at + 1;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 4 -> allocation_cancel_record.executing_broker[allocation_cancel_at] = wire[at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 12 -> allocation_cancel_record.client_account_number[allocation_cancel_at] = wire[at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 20 -> allocation_cancel_record.client_order_id[allocation_cancel_at] = wire[at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 16 -> allocation_cancel_record.client_memo[allocation_cancel_at] = wire[at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_record.liquidity_status = wire[at]; at = at + 1;
  allocation_cancel_record.trade_type = wire[at]; at = at + 1;
  allocation_cancel_record.opposite_account_type = wire[at]; at = at + 1;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 12 -> allocation_cancel_record.participant_session_name[allocation_cancel_at] = wire[at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 10 -> allocation_cancel_record.unique_transaction_id[allocation_cancel_at] = wire[at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 10 -> allocation_cancel_record.parent_transaction_id[allocation_cancel_at] = wire[at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 4 -> allocation_cancel_record.opposite_executing_broker[allocation_cancel_at] = wire[at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 16 -> allocation_cancel_record.additional_client_memo[allocation_cancel_at] = wire[at]; at = at + 1; allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Allocation Cancel is what was written, byte for byte */
inline equal_allocation_cancel(allocation_cancel_read, allocation_cancel_written) {
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 15 -> assert(allocation_cancel_read.trade_number[allocation_cancel_at] == allocation_cancel_written.trade_number[allocation_cancel_at]); allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  assert(allocation_cancel_read.transaction_type == allocation_cancel_written.transaction_type);
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 6 -> assert(allocation_cancel_read.timestamp[allocation_cancel_at] == allocation_cancel_written.timestamp[allocation_cancel_at]); allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 30 -> assert(allocation_cancel_read.symbol[allocation_cancel_at] == allocation_cancel_written.symbol[allocation_cancel_at]); allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 6 -> assert(allocation_cancel_read.expiration_date[allocation_cancel_at] == allocation_cancel_written.expiration_date[allocation_cancel_at]); allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 8 -> assert(allocation_cancel_read.strike_price[allocation_cancel_at] == allocation_cancel_written.strike_price[allocation_cancel_at]); allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  assert(allocation_cancel_read.strike_price_fraction_indicator == allocation_cancel_written.strike_price_fraction_indicator);
  assert(allocation_cancel_read.option_type == allocation_cancel_written.option_type);
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 8 -> assert(allocation_cancel_read.volume[allocation_cancel_at] == allocation_cancel_written.volume[allocation_cancel_at]); allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 8 -> assert(allocation_cancel_read.price[allocation_cancel_at] == allocation_cancel_written.price[allocation_cancel_at]); allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 4 -> assert(allocation_cancel_read.cmta_broker[allocation_cancel_at] == allocation_cancel_written.cmta_broker[allocation_cancel_at]); allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  assert(allocation_cancel_read.account_type == allocation_cancel_written.account_type);
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 3 -> assert(allocation_cancel_read.sub_trader_id[allocation_cancel_at] == allocation_cancel_written.sub_trader_id[allocation_cancel_at]); allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  assert(allocation_cancel_read.open_close == allocation_cancel_written.open_close);
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 4 -> assert(allocation_cancel_read.executing_broker[allocation_cancel_at] == allocation_cancel_written.executing_broker[allocation_cancel_at]); allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 12 -> assert(allocation_cancel_read.client_account_number[allocation_cancel_at] == allocation_cancel_written.client_account_number[allocation_cancel_at]); allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 20 -> assert(allocation_cancel_read.client_order_id[allocation_cancel_at] == allocation_cancel_written.client_order_id[allocation_cancel_at]); allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 16 -> assert(allocation_cancel_read.client_memo[allocation_cancel_at] == allocation_cancel_written.client_memo[allocation_cancel_at]); allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  assert(allocation_cancel_read.liquidity_status == allocation_cancel_written.liquidity_status);
  assert(allocation_cancel_read.trade_type == allocation_cancel_written.trade_type);
  assert(allocation_cancel_read.opposite_account_type == allocation_cancel_written.opposite_account_type);
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 12 -> assert(allocation_cancel_read.participant_session_name[allocation_cancel_at] == allocation_cancel_written.participant_session_name[allocation_cancel_at]); allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 10 -> assert(allocation_cancel_read.unique_transaction_id[allocation_cancel_at] == allocation_cancel_written.unique_transaction_id[allocation_cancel_at]); allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 10 -> assert(allocation_cancel_read.parent_transaction_id[allocation_cancel_at] == allocation_cancel_written.parent_transaction_id[allocation_cancel_at]); allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 4 -> assert(allocation_cancel_read.opposite_executing_broker[allocation_cancel_at] == allocation_cancel_written.opposite_executing_broker[allocation_cancel_at]); allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  allocation_cancel_at = 0;
  do
  :: allocation_cancel_at < 16 -> assert(allocation_cancel_read.additional_client_memo[allocation_cancel_at] == allocation_cancel_written.additional_client_memo[allocation_cancel_at]); allocation_cancel_at = allocation_cancel_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Give Up: 208 bytes ------------------------------------------------------ */

/* The guide heads this message 220 bytes, while the fields it states measure 236 including the 28 byte header. */
typedef GiveUp {
  byte trade_number[15];
  byte transaction_type;
  byte timestamp[6];
  byte symbol[30];
  byte expiration_date[6];
  byte strike_price[8];
  byte strike_price_fraction_indicator;
  byte option_type;
  byte volume[8];
  byte price[8];
  byte cmta_broker[4];
  byte account_type;
  byte sub_trader_id[3];
  byte open_close;
  byte executing_broker[4];
  byte client_account_number[12];
  byte client_order_id[20];
  byte client_memo[16];
  byte liquidity_status;
  byte trade_type;
  byte opposite_account_type;
  byte give_up_source[4];
  byte give_up_destination[4];
  byte participant_session_name[12];
  byte unique_transaction_id[10];
  byte parent_transaction_id[10];
  byte opposite_executing_broker[4];
  byte additional_client_memo[16]
};

int give_up_at;

/* every byte of Give Up set to one value */
inline fill_give_up(give_up_record, give_up_value) {
  give_up_at = 0;
  do
  :: give_up_at < 15 -> give_up_record.trade_number[give_up_at] = give_up_value; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_record.transaction_type = give_up_value;
  give_up_at = 0;
  do
  :: give_up_at < 6 -> give_up_record.timestamp[give_up_at] = give_up_value; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 30 -> give_up_record.symbol[give_up_at] = give_up_value; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 6 -> give_up_record.expiration_date[give_up_at] = give_up_value; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 8 -> give_up_record.strike_price[give_up_at] = give_up_value; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_record.strike_price_fraction_indicator = give_up_value;
  give_up_record.option_type = give_up_value;
  give_up_at = 0;
  do
  :: give_up_at < 8 -> give_up_record.volume[give_up_at] = give_up_value; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 8 -> give_up_record.price[give_up_at] = give_up_value; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 4 -> give_up_record.cmta_broker[give_up_at] = give_up_value; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_record.account_type = give_up_value;
  give_up_at = 0;
  do
  :: give_up_at < 3 -> give_up_record.sub_trader_id[give_up_at] = give_up_value; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_record.open_close = give_up_value;
  give_up_at = 0;
  do
  :: give_up_at < 4 -> give_up_record.executing_broker[give_up_at] = give_up_value; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 12 -> give_up_record.client_account_number[give_up_at] = give_up_value; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 20 -> give_up_record.client_order_id[give_up_at] = give_up_value; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 16 -> give_up_record.client_memo[give_up_at] = give_up_value; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_record.liquidity_status = give_up_value;
  give_up_record.trade_type = give_up_value;
  give_up_record.opposite_account_type = give_up_value;
  give_up_at = 0;
  do
  :: give_up_at < 4 -> give_up_record.give_up_source[give_up_at] = give_up_value; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 4 -> give_up_record.give_up_destination[give_up_at] = give_up_value; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 12 -> give_up_record.participant_session_name[give_up_at] = give_up_value; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 10 -> give_up_record.unique_transaction_id[give_up_at] = give_up_value; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 10 -> give_up_record.parent_transaction_id[give_up_at] = give_up_value; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 4 -> give_up_record.opposite_executing_broker[give_up_at] = give_up_value; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 16 -> give_up_record.additional_client_memo[give_up_at] = give_up_value; give_up_at = give_up_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Give Up set to where it lies, so a field read out of place says so */
inline ramp_give_up(give_up_record, give_up_base) {
  give_up_at = 0;
  do
  :: give_up_at < 15 -> give_up_record.trade_number[give_up_at] = (give_up_base + 0 + give_up_at + 1) % 256; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_record.transaction_type = (give_up_base + 15 + 1) % 256;
  give_up_at = 0;
  do
  :: give_up_at < 6 -> give_up_record.timestamp[give_up_at] = (give_up_base + 16 + give_up_at + 1) % 256; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 30 -> give_up_record.symbol[give_up_at] = (give_up_base + 22 + give_up_at + 1) % 256; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 6 -> give_up_record.expiration_date[give_up_at] = (give_up_base + 52 + give_up_at + 1) % 256; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 8 -> give_up_record.strike_price[give_up_at] = (give_up_base + 58 + give_up_at + 1) % 256; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_record.strike_price_fraction_indicator = (give_up_base + 66 + 1) % 256;
  give_up_record.option_type = (give_up_base + 67 + 1) % 256;
  give_up_at = 0;
  do
  :: give_up_at < 8 -> give_up_record.volume[give_up_at] = (give_up_base + 68 + give_up_at + 1) % 256; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 8 -> give_up_record.price[give_up_at] = (give_up_base + 76 + give_up_at + 1) % 256; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 4 -> give_up_record.cmta_broker[give_up_at] = (give_up_base + 84 + give_up_at + 1) % 256; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_record.account_type = (give_up_base + 88 + 1) % 256;
  give_up_at = 0;
  do
  :: give_up_at < 3 -> give_up_record.sub_trader_id[give_up_at] = (give_up_base + 89 + give_up_at + 1) % 256; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_record.open_close = (give_up_base + 92 + 1) % 256;
  give_up_at = 0;
  do
  :: give_up_at < 4 -> give_up_record.executing_broker[give_up_at] = (give_up_base + 93 + give_up_at + 1) % 256; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 12 -> give_up_record.client_account_number[give_up_at] = (give_up_base + 97 + give_up_at + 1) % 256; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 20 -> give_up_record.client_order_id[give_up_at] = (give_up_base + 109 + give_up_at + 1) % 256; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 16 -> give_up_record.client_memo[give_up_at] = (give_up_base + 129 + give_up_at + 1) % 256; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_record.liquidity_status = (give_up_base + 145 + 1) % 256;
  give_up_record.trade_type = (give_up_base + 146 + 1) % 256;
  give_up_record.opposite_account_type = (give_up_base + 147 + 1) % 256;
  give_up_at = 0;
  do
  :: give_up_at < 4 -> give_up_record.give_up_source[give_up_at] = (give_up_base + 148 + give_up_at + 1) % 256; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 4 -> give_up_record.give_up_destination[give_up_at] = (give_up_base + 152 + give_up_at + 1) % 256; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 12 -> give_up_record.participant_session_name[give_up_at] = (give_up_base + 156 + give_up_at + 1) % 256; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 10 -> give_up_record.unique_transaction_id[give_up_at] = (give_up_base + 168 + give_up_at + 1) % 256; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 10 -> give_up_record.parent_transaction_id[give_up_at] = (give_up_base + 178 + give_up_at + 1) % 256; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 4 -> give_up_record.opposite_executing_broker[give_up_at] = (give_up_base + 188 + give_up_at + 1) % 256; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 16 -> give_up_record.additional_client_memo[give_up_at] = (give_up_base + 192 + give_up_at + 1) % 256; give_up_at = give_up_at + 1
  :: else -> break
  od;
  skip
}

/* Give Up to the wire, 208 bytes from where the cursor stands */
inline encode_give_up(give_up_record) {
  give_up_at = 0;
  do
  :: give_up_at < 15 -> wire[at] = give_up_record.trade_number[give_up_at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  wire[at] = give_up_record.transaction_type; at = at + 1;
  give_up_at = 0;
  do
  :: give_up_at < 6 -> wire[at] = give_up_record.timestamp[give_up_at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 30 -> wire[at] = give_up_record.symbol[give_up_at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 6 -> wire[at] = give_up_record.expiration_date[give_up_at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 8 -> wire[at] = give_up_record.strike_price[give_up_at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  wire[at] = give_up_record.strike_price_fraction_indicator; at = at + 1;
  wire[at] = give_up_record.option_type; at = at + 1;
  give_up_at = 0;
  do
  :: give_up_at < 8 -> wire[at] = give_up_record.volume[give_up_at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 8 -> wire[at] = give_up_record.price[give_up_at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 4 -> wire[at] = give_up_record.cmta_broker[give_up_at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  wire[at] = give_up_record.account_type; at = at + 1;
  give_up_at = 0;
  do
  :: give_up_at < 3 -> wire[at] = give_up_record.sub_trader_id[give_up_at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  wire[at] = give_up_record.open_close; at = at + 1;
  give_up_at = 0;
  do
  :: give_up_at < 4 -> wire[at] = give_up_record.executing_broker[give_up_at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 12 -> wire[at] = give_up_record.client_account_number[give_up_at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 20 -> wire[at] = give_up_record.client_order_id[give_up_at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 16 -> wire[at] = give_up_record.client_memo[give_up_at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  wire[at] = give_up_record.liquidity_status; at = at + 1;
  wire[at] = give_up_record.trade_type; at = at + 1;
  wire[at] = give_up_record.opposite_account_type; at = at + 1;
  give_up_at = 0;
  do
  :: give_up_at < 4 -> wire[at] = give_up_record.give_up_source[give_up_at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 4 -> wire[at] = give_up_record.give_up_destination[give_up_at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 12 -> wire[at] = give_up_record.participant_session_name[give_up_at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 10 -> wire[at] = give_up_record.unique_transaction_id[give_up_at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 10 -> wire[at] = give_up_record.parent_transaction_id[give_up_at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 4 -> wire[at] = give_up_record.opposite_executing_broker[give_up_at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 16 -> wire[at] = give_up_record.additional_client_memo[give_up_at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  skip
}

/* Give Up off the wire, 208 bytes from where the cursor stands */
inline decode_give_up(give_up_record) {
  give_up_at = 0;
  do
  :: give_up_at < 15 -> give_up_record.trade_number[give_up_at] = wire[at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_record.transaction_type = wire[at]; at = at + 1;
  give_up_at = 0;
  do
  :: give_up_at < 6 -> give_up_record.timestamp[give_up_at] = wire[at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 30 -> give_up_record.symbol[give_up_at] = wire[at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 6 -> give_up_record.expiration_date[give_up_at] = wire[at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 8 -> give_up_record.strike_price[give_up_at] = wire[at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_record.strike_price_fraction_indicator = wire[at]; at = at + 1;
  give_up_record.option_type = wire[at]; at = at + 1;
  give_up_at = 0;
  do
  :: give_up_at < 8 -> give_up_record.volume[give_up_at] = wire[at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 8 -> give_up_record.price[give_up_at] = wire[at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 4 -> give_up_record.cmta_broker[give_up_at] = wire[at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_record.account_type = wire[at]; at = at + 1;
  give_up_at = 0;
  do
  :: give_up_at < 3 -> give_up_record.sub_trader_id[give_up_at] = wire[at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_record.open_close = wire[at]; at = at + 1;
  give_up_at = 0;
  do
  :: give_up_at < 4 -> give_up_record.executing_broker[give_up_at] = wire[at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 12 -> give_up_record.client_account_number[give_up_at] = wire[at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 20 -> give_up_record.client_order_id[give_up_at] = wire[at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 16 -> give_up_record.client_memo[give_up_at] = wire[at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_record.liquidity_status = wire[at]; at = at + 1;
  give_up_record.trade_type = wire[at]; at = at + 1;
  give_up_record.opposite_account_type = wire[at]; at = at + 1;
  give_up_at = 0;
  do
  :: give_up_at < 4 -> give_up_record.give_up_source[give_up_at] = wire[at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 4 -> give_up_record.give_up_destination[give_up_at] = wire[at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 12 -> give_up_record.participant_session_name[give_up_at] = wire[at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 10 -> give_up_record.unique_transaction_id[give_up_at] = wire[at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 10 -> give_up_record.parent_transaction_id[give_up_at] = wire[at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 4 -> give_up_record.opposite_executing_broker[give_up_at] = wire[at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 16 -> give_up_record.additional_client_memo[give_up_at] = wire[at]; at = at + 1; give_up_at = give_up_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Give Up is what was written, byte for byte */
inline equal_give_up(give_up_read, give_up_written) {
  give_up_at = 0;
  do
  :: give_up_at < 15 -> assert(give_up_read.trade_number[give_up_at] == give_up_written.trade_number[give_up_at]); give_up_at = give_up_at + 1
  :: else -> break
  od;
  assert(give_up_read.transaction_type == give_up_written.transaction_type);
  give_up_at = 0;
  do
  :: give_up_at < 6 -> assert(give_up_read.timestamp[give_up_at] == give_up_written.timestamp[give_up_at]); give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 30 -> assert(give_up_read.symbol[give_up_at] == give_up_written.symbol[give_up_at]); give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 6 -> assert(give_up_read.expiration_date[give_up_at] == give_up_written.expiration_date[give_up_at]); give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 8 -> assert(give_up_read.strike_price[give_up_at] == give_up_written.strike_price[give_up_at]); give_up_at = give_up_at + 1
  :: else -> break
  od;
  assert(give_up_read.strike_price_fraction_indicator == give_up_written.strike_price_fraction_indicator);
  assert(give_up_read.option_type == give_up_written.option_type);
  give_up_at = 0;
  do
  :: give_up_at < 8 -> assert(give_up_read.volume[give_up_at] == give_up_written.volume[give_up_at]); give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 8 -> assert(give_up_read.price[give_up_at] == give_up_written.price[give_up_at]); give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 4 -> assert(give_up_read.cmta_broker[give_up_at] == give_up_written.cmta_broker[give_up_at]); give_up_at = give_up_at + 1
  :: else -> break
  od;
  assert(give_up_read.account_type == give_up_written.account_type);
  give_up_at = 0;
  do
  :: give_up_at < 3 -> assert(give_up_read.sub_trader_id[give_up_at] == give_up_written.sub_trader_id[give_up_at]); give_up_at = give_up_at + 1
  :: else -> break
  od;
  assert(give_up_read.open_close == give_up_written.open_close);
  give_up_at = 0;
  do
  :: give_up_at < 4 -> assert(give_up_read.executing_broker[give_up_at] == give_up_written.executing_broker[give_up_at]); give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 12 -> assert(give_up_read.client_account_number[give_up_at] == give_up_written.client_account_number[give_up_at]); give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 20 -> assert(give_up_read.client_order_id[give_up_at] == give_up_written.client_order_id[give_up_at]); give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 16 -> assert(give_up_read.client_memo[give_up_at] == give_up_written.client_memo[give_up_at]); give_up_at = give_up_at + 1
  :: else -> break
  od;
  assert(give_up_read.liquidity_status == give_up_written.liquidity_status);
  assert(give_up_read.trade_type == give_up_written.trade_type);
  assert(give_up_read.opposite_account_type == give_up_written.opposite_account_type);
  give_up_at = 0;
  do
  :: give_up_at < 4 -> assert(give_up_read.give_up_source[give_up_at] == give_up_written.give_up_source[give_up_at]); give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 4 -> assert(give_up_read.give_up_destination[give_up_at] == give_up_written.give_up_destination[give_up_at]); give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 12 -> assert(give_up_read.participant_session_name[give_up_at] == give_up_written.participant_session_name[give_up_at]); give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 10 -> assert(give_up_read.unique_transaction_id[give_up_at] == give_up_written.unique_transaction_id[give_up_at]); give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 10 -> assert(give_up_read.parent_transaction_id[give_up_at] == give_up_written.parent_transaction_id[give_up_at]); give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 4 -> assert(give_up_read.opposite_executing_broker[give_up_at] == give_up_written.opposite_executing_broker[give_up_at]); give_up_at = give_up_at + 1
  :: else -> break
  od;
  give_up_at = 0;
  do
  :: give_up_at < 16 -> assert(give_up_read.additional_client_memo[give_up_at] == give_up_written.additional_client_memo[give_up_at]); give_up_at = give_up_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Give Up Cancel: 208 bytes ----------------------------------------------- */

/* The guide states this message as having the same structure as message type 50, whose fields are written out here. The guide heads this message 216 bytes, while the fields it states measure 236 including the 28 byte header. */
typedef GiveUpCancel {
  byte trade_number[15];
  byte transaction_type;
  byte timestamp[6];
  byte symbol[30];
  byte expiration_date[6];
  byte strike_price[8];
  byte strike_price_fraction_indicator;
  byte option_type;
  byte volume[8];
  byte price[8];
  byte cmta_broker[4];
  byte account_type;
  byte sub_trader_id[3];
  byte open_close;
  byte executing_broker[4];
  byte client_account_number[12];
  byte client_order_id[20];
  byte client_memo[16];
  byte liquidity_status;
  byte trade_type;
  byte opposite_account_type;
  byte give_up_source[4];
  byte give_up_destination[4];
  byte participant_session_name[12];
  byte unique_transaction_id[10];
  byte parent_transaction_id[10];
  byte opposite_executing_broker[4];
  byte additional_client_memo[16]
};

int give_up_cancel_at;

/* every byte of Give Up Cancel set to one value */
inline fill_give_up_cancel(give_up_cancel_record, give_up_cancel_value) {
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 15 -> give_up_cancel_record.trade_number[give_up_cancel_at] = give_up_cancel_value; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_record.transaction_type = give_up_cancel_value;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 6 -> give_up_cancel_record.timestamp[give_up_cancel_at] = give_up_cancel_value; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 30 -> give_up_cancel_record.symbol[give_up_cancel_at] = give_up_cancel_value; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 6 -> give_up_cancel_record.expiration_date[give_up_cancel_at] = give_up_cancel_value; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 8 -> give_up_cancel_record.strike_price[give_up_cancel_at] = give_up_cancel_value; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_record.strike_price_fraction_indicator = give_up_cancel_value;
  give_up_cancel_record.option_type = give_up_cancel_value;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 8 -> give_up_cancel_record.volume[give_up_cancel_at] = give_up_cancel_value; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 8 -> give_up_cancel_record.price[give_up_cancel_at] = give_up_cancel_value; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 4 -> give_up_cancel_record.cmta_broker[give_up_cancel_at] = give_up_cancel_value; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_record.account_type = give_up_cancel_value;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 3 -> give_up_cancel_record.sub_trader_id[give_up_cancel_at] = give_up_cancel_value; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_record.open_close = give_up_cancel_value;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 4 -> give_up_cancel_record.executing_broker[give_up_cancel_at] = give_up_cancel_value; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 12 -> give_up_cancel_record.client_account_number[give_up_cancel_at] = give_up_cancel_value; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 20 -> give_up_cancel_record.client_order_id[give_up_cancel_at] = give_up_cancel_value; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 16 -> give_up_cancel_record.client_memo[give_up_cancel_at] = give_up_cancel_value; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_record.liquidity_status = give_up_cancel_value;
  give_up_cancel_record.trade_type = give_up_cancel_value;
  give_up_cancel_record.opposite_account_type = give_up_cancel_value;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 4 -> give_up_cancel_record.give_up_source[give_up_cancel_at] = give_up_cancel_value; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 4 -> give_up_cancel_record.give_up_destination[give_up_cancel_at] = give_up_cancel_value; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 12 -> give_up_cancel_record.participant_session_name[give_up_cancel_at] = give_up_cancel_value; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 10 -> give_up_cancel_record.unique_transaction_id[give_up_cancel_at] = give_up_cancel_value; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 10 -> give_up_cancel_record.parent_transaction_id[give_up_cancel_at] = give_up_cancel_value; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 4 -> give_up_cancel_record.opposite_executing_broker[give_up_cancel_at] = give_up_cancel_value; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 16 -> give_up_cancel_record.additional_client_memo[give_up_cancel_at] = give_up_cancel_value; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Give Up Cancel set to where it lies, so a field read out of place says so */
inline ramp_give_up_cancel(give_up_cancel_record, give_up_cancel_base) {
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 15 -> give_up_cancel_record.trade_number[give_up_cancel_at] = (give_up_cancel_base + 0 + give_up_cancel_at + 1) % 256; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_record.transaction_type = (give_up_cancel_base + 15 + 1) % 256;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 6 -> give_up_cancel_record.timestamp[give_up_cancel_at] = (give_up_cancel_base + 16 + give_up_cancel_at + 1) % 256; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 30 -> give_up_cancel_record.symbol[give_up_cancel_at] = (give_up_cancel_base + 22 + give_up_cancel_at + 1) % 256; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 6 -> give_up_cancel_record.expiration_date[give_up_cancel_at] = (give_up_cancel_base + 52 + give_up_cancel_at + 1) % 256; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 8 -> give_up_cancel_record.strike_price[give_up_cancel_at] = (give_up_cancel_base + 58 + give_up_cancel_at + 1) % 256; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_record.strike_price_fraction_indicator = (give_up_cancel_base + 66 + 1) % 256;
  give_up_cancel_record.option_type = (give_up_cancel_base + 67 + 1) % 256;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 8 -> give_up_cancel_record.volume[give_up_cancel_at] = (give_up_cancel_base + 68 + give_up_cancel_at + 1) % 256; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 8 -> give_up_cancel_record.price[give_up_cancel_at] = (give_up_cancel_base + 76 + give_up_cancel_at + 1) % 256; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 4 -> give_up_cancel_record.cmta_broker[give_up_cancel_at] = (give_up_cancel_base + 84 + give_up_cancel_at + 1) % 256; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_record.account_type = (give_up_cancel_base + 88 + 1) % 256;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 3 -> give_up_cancel_record.sub_trader_id[give_up_cancel_at] = (give_up_cancel_base + 89 + give_up_cancel_at + 1) % 256; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_record.open_close = (give_up_cancel_base + 92 + 1) % 256;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 4 -> give_up_cancel_record.executing_broker[give_up_cancel_at] = (give_up_cancel_base + 93 + give_up_cancel_at + 1) % 256; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 12 -> give_up_cancel_record.client_account_number[give_up_cancel_at] = (give_up_cancel_base + 97 + give_up_cancel_at + 1) % 256; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 20 -> give_up_cancel_record.client_order_id[give_up_cancel_at] = (give_up_cancel_base + 109 + give_up_cancel_at + 1) % 256; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 16 -> give_up_cancel_record.client_memo[give_up_cancel_at] = (give_up_cancel_base + 129 + give_up_cancel_at + 1) % 256; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_record.liquidity_status = (give_up_cancel_base + 145 + 1) % 256;
  give_up_cancel_record.trade_type = (give_up_cancel_base + 146 + 1) % 256;
  give_up_cancel_record.opposite_account_type = (give_up_cancel_base + 147 + 1) % 256;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 4 -> give_up_cancel_record.give_up_source[give_up_cancel_at] = (give_up_cancel_base + 148 + give_up_cancel_at + 1) % 256; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 4 -> give_up_cancel_record.give_up_destination[give_up_cancel_at] = (give_up_cancel_base + 152 + give_up_cancel_at + 1) % 256; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 12 -> give_up_cancel_record.participant_session_name[give_up_cancel_at] = (give_up_cancel_base + 156 + give_up_cancel_at + 1) % 256; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 10 -> give_up_cancel_record.unique_transaction_id[give_up_cancel_at] = (give_up_cancel_base + 168 + give_up_cancel_at + 1) % 256; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 10 -> give_up_cancel_record.parent_transaction_id[give_up_cancel_at] = (give_up_cancel_base + 178 + give_up_cancel_at + 1) % 256; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 4 -> give_up_cancel_record.opposite_executing_broker[give_up_cancel_at] = (give_up_cancel_base + 188 + give_up_cancel_at + 1) % 256; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 16 -> give_up_cancel_record.additional_client_memo[give_up_cancel_at] = (give_up_cancel_base + 192 + give_up_cancel_at + 1) % 256; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  skip
}

/* Give Up Cancel to the wire, 208 bytes from where the cursor stands */
inline encode_give_up_cancel(give_up_cancel_record) {
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 15 -> wire[at] = give_up_cancel_record.trade_number[give_up_cancel_at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  wire[at] = give_up_cancel_record.transaction_type; at = at + 1;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 6 -> wire[at] = give_up_cancel_record.timestamp[give_up_cancel_at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 30 -> wire[at] = give_up_cancel_record.symbol[give_up_cancel_at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 6 -> wire[at] = give_up_cancel_record.expiration_date[give_up_cancel_at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 8 -> wire[at] = give_up_cancel_record.strike_price[give_up_cancel_at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  wire[at] = give_up_cancel_record.strike_price_fraction_indicator; at = at + 1;
  wire[at] = give_up_cancel_record.option_type; at = at + 1;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 8 -> wire[at] = give_up_cancel_record.volume[give_up_cancel_at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 8 -> wire[at] = give_up_cancel_record.price[give_up_cancel_at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 4 -> wire[at] = give_up_cancel_record.cmta_broker[give_up_cancel_at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  wire[at] = give_up_cancel_record.account_type; at = at + 1;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 3 -> wire[at] = give_up_cancel_record.sub_trader_id[give_up_cancel_at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  wire[at] = give_up_cancel_record.open_close; at = at + 1;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 4 -> wire[at] = give_up_cancel_record.executing_broker[give_up_cancel_at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 12 -> wire[at] = give_up_cancel_record.client_account_number[give_up_cancel_at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 20 -> wire[at] = give_up_cancel_record.client_order_id[give_up_cancel_at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 16 -> wire[at] = give_up_cancel_record.client_memo[give_up_cancel_at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  wire[at] = give_up_cancel_record.liquidity_status; at = at + 1;
  wire[at] = give_up_cancel_record.trade_type; at = at + 1;
  wire[at] = give_up_cancel_record.opposite_account_type; at = at + 1;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 4 -> wire[at] = give_up_cancel_record.give_up_source[give_up_cancel_at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 4 -> wire[at] = give_up_cancel_record.give_up_destination[give_up_cancel_at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 12 -> wire[at] = give_up_cancel_record.participant_session_name[give_up_cancel_at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 10 -> wire[at] = give_up_cancel_record.unique_transaction_id[give_up_cancel_at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 10 -> wire[at] = give_up_cancel_record.parent_transaction_id[give_up_cancel_at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 4 -> wire[at] = give_up_cancel_record.opposite_executing_broker[give_up_cancel_at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 16 -> wire[at] = give_up_cancel_record.additional_client_memo[give_up_cancel_at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  skip
}

/* Give Up Cancel off the wire, 208 bytes from where the cursor stands */
inline decode_give_up_cancel(give_up_cancel_record) {
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 15 -> give_up_cancel_record.trade_number[give_up_cancel_at] = wire[at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_record.transaction_type = wire[at]; at = at + 1;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 6 -> give_up_cancel_record.timestamp[give_up_cancel_at] = wire[at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 30 -> give_up_cancel_record.symbol[give_up_cancel_at] = wire[at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 6 -> give_up_cancel_record.expiration_date[give_up_cancel_at] = wire[at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 8 -> give_up_cancel_record.strike_price[give_up_cancel_at] = wire[at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_record.strike_price_fraction_indicator = wire[at]; at = at + 1;
  give_up_cancel_record.option_type = wire[at]; at = at + 1;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 8 -> give_up_cancel_record.volume[give_up_cancel_at] = wire[at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 8 -> give_up_cancel_record.price[give_up_cancel_at] = wire[at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 4 -> give_up_cancel_record.cmta_broker[give_up_cancel_at] = wire[at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_record.account_type = wire[at]; at = at + 1;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 3 -> give_up_cancel_record.sub_trader_id[give_up_cancel_at] = wire[at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_record.open_close = wire[at]; at = at + 1;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 4 -> give_up_cancel_record.executing_broker[give_up_cancel_at] = wire[at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 12 -> give_up_cancel_record.client_account_number[give_up_cancel_at] = wire[at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 20 -> give_up_cancel_record.client_order_id[give_up_cancel_at] = wire[at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 16 -> give_up_cancel_record.client_memo[give_up_cancel_at] = wire[at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_record.liquidity_status = wire[at]; at = at + 1;
  give_up_cancel_record.trade_type = wire[at]; at = at + 1;
  give_up_cancel_record.opposite_account_type = wire[at]; at = at + 1;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 4 -> give_up_cancel_record.give_up_source[give_up_cancel_at] = wire[at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 4 -> give_up_cancel_record.give_up_destination[give_up_cancel_at] = wire[at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 12 -> give_up_cancel_record.participant_session_name[give_up_cancel_at] = wire[at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 10 -> give_up_cancel_record.unique_transaction_id[give_up_cancel_at] = wire[at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 10 -> give_up_cancel_record.parent_transaction_id[give_up_cancel_at] = wire[at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 4 -> give_up_cancel_record.opposite_executing_broker[give_up_cancel_at] = wire[at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 16 -> give_up_cancel_record.additional_client_memo[give_up_cancel_at] = wire[at]; at = at + 1; give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Give Up Cancel is what was written, byte for byte */
inline equal_give_up_cancel(give_up_cancel_read, give_up_cancel_written) {
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 15 -> assert(give_up_cancel_read.trade_number[give_up_cancel_at] == give_up_cancel_written.trade_number[give_up_cancel_at]); give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  assert(give_up_cancel_read.transaction_type == give_up_cancel_written.transaction_type);
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 6 -> assert(give_up_cancel_read.timestamp[give_up_cancel_at] == give_up_cancel_written.timestamp[give_up_cancel_at]); give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 30 -> assert(give_up_cancel_read.symbol[give_up_cancel_at] == give_up_cancel_written.symbol[give_up_cancel_at]); give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 6 -> assert(give_up_cancel_read.expiration_date[give_up_cancel_at] == give_up_cancel_written.expiration_date[give_up_cancel_at]); give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 8 -> assert(give_up_cancel_read.strike_price[give_up_cancel_at] == give_up_cancel_written.strike_price[give_up_cancel_at]); give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  assert(give_up_cancel_read.strike_price_fraction_indicator == give_up_cancel_written.strike_price_fraction_indicator);
  assert(give_up_cancel_read.option_type == give_up_cancel_written.option_type);
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 8 -> assert(give_up_cancel_read.volume[give_up_cancel_at] == give_up_cancel_written.volume[give_up_cancel_at]); give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 8 -> assert(give_up_cancel_read.price[give_up_cancel_at] == give_up_cancel_written.price[give_up_cancel_at]); give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 4 -> assert(give_up_cancel_read.cmta_broker[give_up_cancel_at] == give_up_cancel_written.cmta_broker[give_up_cancel_at]); give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  assert(give_up_cancel_read.account_type == give_up_cancel_written.account_type);
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 3 -> assert(give_up_cancel_read.sub_trader_id[give_up_cancel_at] == give_up_cancel_written.sub_trader_id[give_up_cancel_at]); give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  assert(give_up_cancel_read.open_close == give_up_cancel_written.open_close);
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 4 -> assert(give_up_cancel_read.executing_broker[give_up_cancel_at] == give_up_cancel_written.executing_broker[give_up_cancel_at]); give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 12 -> assert(give_up_cancel_read.client_account_number[give_up_cancel_at] == give_up_cancel_written.client_account_number[give_up_cancel_at]); give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 20 -> assert(give_up_cancel_read.client_order_id[give_up_cancel_at] == give_up_cancel_written.client_order_id[give_up_cancel_at]); give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 16 -> assert(give_up_cancel_read.client_memo[give_up_cancel_at] == give_up_cancel_written.client_memo[give_up_cancel_at]); give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  assert(give_up_cancel_read.liquidity_status == give_up_cancel_written.liquidity_status);
  assert(give_up_cancel_read.trade_type == give_up_cancel_written.trade_type);
  assert(give_up_cancel_read.opposite_account_type == give_up_cancel_written.opposite_account_type);
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 4 -> assert(give_up_cancel_read.give_up_source[give_up_cancel_at] == give_up_cancel_written.give_up_source[give_up_cancel_at]); give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 4 -> assert(give_up_cancel_read.give_up_destination[give_up_cancel_at] == give_up_cancel_written.give_up_destination[give_up_cancel_at]); give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 12 -> assert(give_up_cancel_read.participant_session_name[give_up_cancel_at] == give_up_cancel_written.participant_session_name[give_up_cancel_at]); give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 10 -> assert(give_up_cancel_read.unique_transaction_id[give_up_cancel_at] == give_up_cancel_written.unique_transaction_id[give_up_cancel_at]); give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 10 -> assert(give_up_cancel_read.parent_transaction_id[give_up_cancel_at] == give_up_cancel_written.parent_transaction_id[give_up_cancel_at]); give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 4 -> assert(give_up_cancel_read.opposite_executing_broker[give_up_cancel_at] == give_up_cancel_written.opposite_executing_broker[give_up_cancel_at]); give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  give_up_cancel_at = 0;
  do
  :: give_up_cancel_at < 16 -> assert(give_up_cancel_read.additional_client_memo[give_up_cancel_at] == give_up_cancel_written.additional_client_memo[give_up_cancel_at]); give_up_cancel_at = give_up_cancel_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Error Message: 86 bytes ------------------------------------------------- */

/* The guide heads this message up to 112 bytes, while the fields it states measure 114 including the 28 byte header. */
typedef ErrorMessage {
  byte reference_message_type[2];
  byte error_code[4];
  byte error_text[80]
};

int error_message_at;

/* every byte of Error Message set to one value */
inline fill_error_message(error_message_record, error_message_value) {
  error_message_at = 0;
  do
  :: error_message_at < 2 -> error_message_record.reference_message_type[error_message_at] = error_message_value; error_message_at = error_message_at + 1
  :: else -> break
  od;
  error_message_at = 0;
  do
  :: error_message_at < 4 -> error_message_record.error_code[error_message_at] = error_message_value; error_message_at = error_message_at + 1
  :: else -> break
  od;
  error_message_at = 0;
  do
  :: error_message_at < 80 -> error_message_record.error_text[error_message_at] = error_message_value; error_message_at = error_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Error Message set to where it lies, so a field read out of place says so */
inline ramp_error_message(error_message_record, error_message_base) {
  error_message_at = 0;
  do
  :: error_message_at < 2 -> error_message_record.reference_message_type[error_message_at] = (error_message_base + 0 + error_message_at + 1) % 256; error_message_at = error_message_at + 1
  :: else -> break
  od;
  error_message_at = 0;
  do
  :: error_message_at < 4 -> error_message_record.error_code[error_message_at] = (error_message_base + 2 + error_message_at + 1) % 256; error_message_at = error_message_at + 1
  :: else -> break
  od;
  error_message_at = 0;
  do
  :: error_message_at < 80 -> error_message_record.error_text[error_message_at] = (error_message_base + 6 + error_message_at + 1) % 256; error_message_at = error_message_at + 1
  :: else -> break
  od;
  skip
}

/* Error Message to the wire, 86 bytes from where the cursor stands */
inline encode_error_message(error_message_record) {
  error_message_at = 0;
  do
  :: error_message_at < 2 -> wire[at] = error_message_record.reference_message_type[error_message_at]; at = at + 1; error_message_at = error_message_at + 1
  :: else -> break
  od;
  error_message_at = 0;
  do
  :: error_message_at < 4 -> wire[at] = error_message_record.error_code[error_message_at]; at = at + 1; error_message_at = error_message_at + 1
  :: else -> break
  od;
  error_message_at = 0;
  do
  :: error_message_at < 80 -> wire[at] = error_message_record.error_text[error_message_at]; at = at + 1; error_message_at = error_message_at + 1
  :: else -> break
  od;
  skip
}

/* Error Message off the wire, 86 bytes from where the cursor stands */
inline decode_error_message(error_message_record) {
  error_message_at = 0;
  do
  :: error_message_at < 2 -> error_message_record.reference_message_type[error_message_at] = wire[at]; at = at + 1; error_message_at = error_message_at + 1
  :: else -> break
  od;
  error_message_at = 0;
  do
  :: error_message_at < 4 -> error_message_record.error_code[error_message_at] = wire[at]; at = at + 1; error_message_at = error_message_at + 1
  :: else -> break
  od;
  error_message_at = 0;
  do
  :: error_message_at < 80 -> error_message_record.error_text[error_message_at] = wire[at]; at = at + 1; error_message_at = error_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Error Message is what was written, byte for byte */
inline equal_error_message(error_message_read, error_message_written) {
  error_message_at = 0;
  do
  :: error_message_at < 2 -> assert(error_message_read.reference_message_type[error_message_at] == error_message_written.reference_message_type[error_message_at]); error_message_at = error_message_at + 1
  :: else -> break
  od;
  error_message_at = 0;
  do
  :: error_message_at < 4 -> assert(error_message_read.error_code[error_message_at] == error_message_written.error_code[error_message_at]); error_message_at = error_message_at + 1
  :: else -> break
  od;
  error_message_at = 0;
  do
  :: error_message_at < 80 -> assert(error_message_read.error_text[error_message_at] == error_message_written.error_text[error_message_at]); error_message_at = error_message_at + 1
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

/* Client Signon Acknowledgment: encoded, read back, and compared */
proctype check_client_signon_acknowledgment() {
  ClientSignonAcknowledgment client_signon_acknowledgment_sent;
  ClientSignonAcknowledgment client_signon_acknowledgment_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_client_signon_acknowledgment(client_signon_acknowledgment_sent, 0)
  :: pattern == 1 -> fill_client_signon_acknowledgment(client_signon_acknowledgment_sent, 32)
  :: pattern == 2 -> fill_client_signon_acknowledgment(client_signon_acknowledgment_sent, 255)
  :: else -> ramp_client_signon_acknowledgment(client_signon_acknowledgment_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_client_signon_acknowledgment(client_signon_acknowledgment_sent);
    assert(at == 8);
    at = 0;
    decode_client_signon_acknowledgment(client_signon_acknowledgment_got);
    assert(at == 8);
    equal_client_signon_acknowledgment(client_signon_acknowledgment_got, client_signon_acknowledgment_sent)
  }
}

/* Trade: encoded, read back, and compared */
proctype check_trade() {
  Trade trade_sent;
  Trade trade_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade(trade_sent, 0)
  :: pattern == 1 -> fill_trade(trade_sent, 32)
  :: pattern == 2 -> fill_trade(trade_sent, 255)
  :: else -> ramp_trade(trade_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade(trade_sent);
    assert(at == 200);
    at = 0;
    decode_trade(trade_got);
    assert(at == 200);
    equal_trade(trade_got, trade_sent)
  }
}

/* Trade Cancel: encoded, read back, and compared */
proctype check_trade_cancel() {
  TradeCancel trade_cancel_sent;
  TradeCancel trade_cancel_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancel(trade_cancel_sent, 0)
  :: pattern == 1 -> fill_trade_cancel(trade_cancel_sent, 32)
  :: pattern == 2 -> fill_trade_cancel(trade_cancel_sent, 255)
  :: else -> ramp_trade_cancel(trade_cancel_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancel(trade_cancel_sent);
    assert(at == 200);
    at = 0;
    decode_trade_cancel(trade_cancel_got);
    assert(at == 200);
    equal_trade_cancel(trade_cancel_got, trade_cancel_sent)
  }
}

/* Allocation: encoded, read back, and compared */
proctype check_allocation() {
  Allocation allocation_sent;
  Allocation allocation_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_allocation(allocation_sent, 0)
  :: pattern == 1 -> fill_allocation(allocation_sent, 32)
  :: pattern == 2 -> fill_allocation(allocation_sent, 255)
  :: else -> ramp_allocation(allocation_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_allocation(allocation_sent);
    assert(at == 200);
    at = 0;
    decode_allocation(allocation_got);
    assert(at == 200);
    equal_allocation(allocation_got, allocation_sent)
  }
}

/* Allocation Cancel: encoded, read back, and compared */
proctype check_allocation_cancel() {
  AllocationCancel allocation_cancel_sent;
  AllocationCancel allocation_cancel_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_allocation_cancel(allocation_cancel_sent, 0)
  :: pattern == 1 -> fill_allocation_cancel(allocation_cancel_sent, 32)
  :: pattern == 2 -> fill_allocation_cancel(allocation_cancel_sent, 255)
  :: else -> ramp_allocation_cancel(allocation_cancel_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_allocation_cancel(allocation_cancel_sent);
    assert(at == 200);
    at = 0;
    decode_allocation_cancel(allocation_cancel_got);
    assert(at == 200);
    equal_allocation_cancel(allocation_cancel_got, allocation_cancel_sent)
  }
}

/* Give Up: encoded, read back, and compared */
proctype check_give_up() {
  GiveUp give_up_sent;
  GiveUp give_up_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_give_up(give_up_sent, 0)
  :: pattern == 1 -> fill_give_up(give_up_sent, 32)
  :: pattern == 2 -> fill_give_up(give_up_sent, 255)
  :: else -> ramp_give_up(give_up_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_give_up(give_up_sent);
    assert(at == 208);
    at = 0;
    decode_give_up(give_up_got);
    assert(at == 208);
    equal_give_up(give_up_got, give_up_sent)
  }
}

/* Give Up Cancel: encoded, read back, and compared */
proctype check_give_up_cancel() {
  GiveUpCancel give_up_cancel_sent;
  GiveUpCancel give_up_cancel_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_give_up_cancel(give_up_cancel_sent, 0)
  :: pattern == 1 -> fill_give_up_cancel(give_up_cancel_sent, 32)
  :: pattern == 2 -> fill_give_up_cancel(give_up_cancel_sent, 255)
  :: else -> ramp_give_up_cancel(give_up_cancel_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_give_up_cancel(give_up_cancel_sent);
    assert(at == 208);
    at = 0;
    decode_give_up_cancel(give_up_cancel_got);
    assert(at == 208);
    equal_give_up_cancel(give_up_cancel_got, give_up_cancel_sent)
  }
}

/* Error Message: encoded, read back, and compared */
proctype check_error_message() {
  ErrorMessage error_message_sent;
  ErrorMessage error_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_error_message(error_message_sent, 0)
  :: pattern == 1 -> fill_error_message(error_message_sent, 32)
  :: pattern == 2 -> fill_error_message(error_message_sent, 255)
  :: else -> ramp_error_message(error_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_error_message(error_message_sent);
    assert(at == 86);
    at = 0;
    decode_error_message(error_message_got);
    assert(at == 86);
    equal_error_message(error_message_got, error_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_client_signon_acknowledgment()
  :: run check_trade()
  :: run check_trade_cancel()
  :: run check_allocation()
  :: run check_allocation_cancel()
  :: run check_give_up()
  :: run check_give_up_cancel()
  :: run check_error_message()
  fi
}
