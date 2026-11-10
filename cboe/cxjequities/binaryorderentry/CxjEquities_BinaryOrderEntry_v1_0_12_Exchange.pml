/*
 * Chicago Board Options Exchange Binary Order Entry
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
#define WIRE 113

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Exchange Message Header: 12 bytes --------------------------------------- */

/* Message header of a packet sent by the exchange */
typedef ExchangeMessageHeader {
  byte start_of_message[2];
  byte message_length[2];
  byte exchange_message_type[2];
  byte matching_unit;
  byte reserved_field;
  byte sequence_number[4]
};

int exchange_message_header_at;

/* every byte of Exchange Message Header set to one value */
inline fill_exchange_message_header(exchange_message_header_record, exchange_message_header_value) {
  exchange_message_header_at = 0;
  do
  :: exchange_message_header_at < 2 -> exchange_message_header_record.start_of_message[exchange_message_header_at] = exchange_message_header_value; exchange_message_header_at = exchange_message_header_at + 1
  :: else -> break
  od;
  exchange_message_header_at = 0;
  do
  :: exchange_message_header_at < 2 -> exchange_message_header_record.message_length[exchange_message_header_at] = exchange_message_header_value; exchange_message_header_at = exchange_message_header_at + 1
  :: else -> break
  od;
  exchange_message_header_at = 0;
  do
  :: exchange_message_header_at < 2 -> exchange_message_header_record.exchange_message_type[exchange_message_header_at] = exchange_message_header_value; exchange_message_header_at = exchange_message_header_at + 1
  :: else -> break
  od;
  exchange_message_header_record.matching_unit = exchange_message_header_value;
  exchange_message_header_record.reserved_field = exchange_message_header_value;
  exchange_message_header_at = 0;
  do
  :: exchange_message_header_at < 4 -> exchange_message_header_record.sequence_number[exchange_message_header_at] = exchange_message_header_value; exchange_message_header_at = exchange_message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Exchange Message Header set to where it lies, so a field read out of place says so */
inline ramp_exchange_message_header(exchange_message_header_record, exchange_message_header_base) {
  exchange_message_header_at = 0;
  do
  :: exchange_message_header_at < 2 -> exchange_message_header_record.start_of_message[exchange_message_header_at] = (exchange_message_header_base + 0 + exchange_message_header_at + 1) % 256; exchange_message_header_at = exchange_message_header_at + 1
  :: else -> break
  od;
  exchange_message_header_at = 0;
  do
  :: exchange_message_header_at < 2 -> exchange_message_header_record.message_length[exchange_message_header_at] = (exchange_message_header_base + 2 + exchange_message_header_at + 1) % 256; exchange_message_header_at = exchange_message_header_at + 1
  :: else -> break
  od;
  exchange_message_header_at = 0;
  do
  :: exchange_message_header_at < 2 -> exchange_message_header_record.exchange_message_type[exchange_message_header_at] = (exchange_message_header_base + 4 + exchange_message_header_at + 1) % 256; exchange_message_header_at = exchange_message_header_at + 1
  :: else -> break
  od;
  exchange_message_header_record.matching_unit = (exchange_message_header_base + 6 + 1) % 256;
  exchange_message_header_record.reserved_field = (exchange_message_header_base + 7 + 1) % 256;
  exchange_message_header_at = 0;
  do
  :: exchange_message_header_at < 4 -> exchange_message_header_record.sequence_number[exchange_message_header_at] = (exchange_message_header_base + 8 + exchange_message_header_at + 1) % 256; exchange_message_header_at = exchange_message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Exchange Message Header to the wire, 12 bytes from where the cursor stands */
inline encode_exchange_message_header(exchange_message_header_record) {
  exchange_message_header_at = 0;
  do
  :: exchange_message_header_at < 2 -> wire[at] = exchange_message_header_record.start_of_message[exchange_message_header_at]; at = at + 1; exchange_message_header_at = exchange_message_header_at + 1
  :: else -> break
  od;
  exchange_message_header_at = 0;
  do
  :: exchange_message_header_at < 2 -> wire[at] = exchange_message_header_record.message_length[exchange_message_header_at]; at = at + 1; exchange_message_header_at = exchange_message_header_at + 1
  :: else -> break
  od;
  exchange_message_header_at = 0;
  do
  :: exchange_message_header_at < 2 -> wire[at] = exchange_message_header_record.exchange_message_type[exchange_message_header_at]; at = at + 1; exchange_message_header_at = exchange_message_header_at + 1
  :: else -> break
  od;
  wire[at] = exchange_message_header_record.matching_unit; at = at + 1;
  wire[at] = exchange_message_header_record.reserved_field; at = at + 1;
  exchange_message_header_at = 0;
  do
  :: exchange_message_header_at < 4 -> wire[at] = exchange_message_header_record.sequence_number[exchange_message_header_at]; at = at + 1; exchange_message_header_at = exchange_message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Exchange Message Header off the wire, 12 bytes from where the cursor stands */
inline decode_exchange_message_header(exchange_message_header_record) {
  exchange_message_header_at = 0;
  do
  :: exchange_message_header_at < 2 -> exchange_message_header_record.start_of_message[exchange_message_header_at] = wire[at]; at = at + 1; exchange_message_header_at = exchange_message_header_at + 1
  :: else -> break
  od;
  exchange_message_header_at = 0;
  do
  :: exchange_message_header_at < 2 -> exchange_message_header_record.message_length[exchange_message_header_at] = wire[at]; at = at + 1; exchange_message_header_at = exchange_message_header_at + 1
  :: else -> break
  od;
  exchange_message_header_at = 0;
  do
  :: exchange_message_header_at < 2 -> exchange_message_header_record.exchange_message_type[exchange_message_header_at] = wire[at]; at = at + 1; exchange_message_header_at = exchange_message_header_at + 1
  :: else -> break
  od;
  exchange_message_header_record.matching_unit = wire[at]; at = at + 1;
  exchange_message_header_record.reserved_field = wire[at]; at = at + 1;
  exchange_message_header_at = 0;
  do
  :: exchange_message_header_at < 4 -> exchange_message_header_record.sequence_number[exchange_message_header_at] = wire[at]; at = at + 1; exchange_message_header_at = exchange_message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Exchange Message Header is what was written, byte for byte */
inline equal_exchange_message_header(exchange_message_header_read, exchange_message_header_written) {
  exchange_message_header_at = 0;
  do
  :: exchange_message_header_at < 2 -> assert(exchange_message_header_read.start_of_message[exchange_message_header_at] == exchange_message_header_written.start_of_message[exchange_message_header_at]); exchange_message_header_at = exchange_message_header_at + 1
  :: else -> break
  od;
  exchange_message_header_at = 0;
  do
  :: exchange_message_header_at < 2 -> assert(exchange_message_header_read.message_length[exchange_message_header_at] == exchange_message_header_written.message_length[exchange_message_header_at]); exchange_message_header_at = exchange_message_header_at + 1
  :: else -> break
  od;
  exchange_message_header_at = 0;
  do
  :: exchange_message_header_at < 2 -> assert(exchange_message_header_read.exchange_message_type[exchange_message_header_at] == exchange_message_header_written.exchange_message_type[exchange_message_header_at]); exchange_message_header_at = exchange_message_header_at + 1
  :: else -> break
  od;
  assert(exchange_message_header_read.matching_unit == exchange_message_header_written.matching_unit);
  assert(exchange_message_header_read.reserved_field == exchange_message_header_written.reserved_field);
  exchange_message_header_at = 0;
  do
  :: exchange_message_header_at < 4 -> assert(exchange_message_header_read.sequence_number[exchange_message_header_at] == exchange_message_header_written.sequence_number[exchange_message_header_at]); exchange_message_header_at = exchange_message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Logout Response Message: 61 bytes --------------------------------------- */

/* A Logout Response is usually sent in response to a Logout Request */
typedef LogoutResponseMessage {
  byte logout_reason;
  byte logout_reason_text[60]
};

int logout_response_message_at;

/* every byte of Logout Response Message set to one value */
inline fill_logout_response_message(logout_response_message_record, logout_response_message_value) {
  logout_response_message_record.logout_reason = logout_response_message_value;
  logout_response_message_at = 0;
  do
  :: logout_response_message_at < 60 -> logout_response_message_record.logout_reason_text[logout_response_message_at] = logout_response_message_value; logout_response_message_at = logout_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logout Response Message set to where it lies, so a field read out of place says so */
inline ramp_logout_response_message(logout_response_message_record, logout_response_message_base) {
  logout_response_message_record.logout_reason = (logout_response_message_base + 0 + 1) % 256;
  logout_response_message_at = 0;
  do
  :: logout_response_message_at < 60 -> logout_response_message_record.logout_reason_text[logout_response_message_at] = (logout_response_message_base + 1 + logout_response_message_at + 1) % 256; logout_response_message_at = logout_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logout Response Message to the wire, 61 bytes from where the cursor stands */
inline encode_logout_response_message(logout_response_message_record) {
  wire[at] = logout_response_message_record.logout_reason; at = at + 1;
  logout_response_message_at = 0;
  do
  :: logout_response_message_at < 60 -> wire[at] = logout_response_message_record.logout_reason_text[logout_response_message_at]; at = at + 1; logout_response_message_at = logout_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logout Response Message off the wire, 61 bytes from where the cursor stands */
inline decode_logout_response_message(logout_response_message_record) {
  logout_response_message_record.logout_reason = wire[at]; at = at + 1;
  logout_response_message_at = 0;
  do
  :: logout_response_message_at < 60 -> logout_response_message_record.logout_reason_text[logout_response_message_at] = wire[at]; at = at + 1; logout_response_message_at = logout_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logout Response Message is what was written, byte for byte */
inline equal_logout_response_message(logout_response_message_read, logout_response_message_written) {
  assert(logout_response_message_read.logout_reason == logout_response_message_written.logout_reason);
  logout_response_message_at = 0;
  do
  :: logout_response_message_at < 60 -> assert(logout_response_message_read.logout_reason_text[logout_response_message_at] == logout_response_message_written.logout_reason_text[logout_response_message_at]); logout_response_message_at = logout_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Acknowledgement Jp Equities V 1: 104 bytes ------------------------ */

/* Order Acknowledgement messages are sent in response to a New Order message */
typedef OrderAcknowledgementJpEquitiesV1 {
  byte transaction_time[8];
  byte account[10];
  byte trading_firm[4];
  byte cl_ord_id[20];
  byte order_id[8];
  byte order_qty[4];
  byte ord_type;
  byte price[8];
  byte capacity;
  byte side;
  byte symbol[8];
  byte time_in_force;
  byte expire_time[8];
  byte cash_margin;
  byte risk_group_id[2];
  byte no_trade_feat;
  byte no_trade_key[10];
  byte posting_instruction;
  byte order_classification;
  byte margin_transaction_type;
  byte base_liquidity_indicator;
  byte company_id[4]
};

int order_acknowledgement_jp_equities_v1_at;

/* every byte of Order Acknowledgement Jp Equities V 1 set to one value */
inline fill_order_acknowledgement_jp_equities_v1(order_acknowledgement_jp_equities_v1_record, order_acknowledgement_jp_equities_v1_value) {
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 8 -> order_acknowledgement_jp_equities_v1_record.transaction_time[order_acknowledgement_jp_equities_v1_at] = order_acknowledgement_jp_equities_v1_value; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 10 -> order_acknowledgement_jp_equities_v1_record.account[order_acknowledgement_jp_equities_v1_at] = order_acknowledgement_jp_equities_v1_value; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 4 -> order_acknowledgement_jp_equities_v1_record.trading_firm[order_acknowledgement_jp_equities_v1_at] = order_acknowledgement_jp_equities_v1_value; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 20 -> order_acknowledgement_jp_equities_v1_record.cl_ord_id[order_acknowledgement_jp_equities_v1_at] = order_acknowledgement_jp_equities_v1_value; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 8 -> order_acknowledgement_jp_equities_v1_record.order_id[order_acknowledgement_jp_equities_v1_at] = order_acknowledgement_jp_equities_v1_value; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 4 -> order_acknowledgement_jp_equities_v1_record.order_qty[order_acknowledgement_jp_equities_v1_at] = order_acknowledgement_jp_equities_v1_value; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_record.ord_type = order_acknowledgement_jp_equities_v1_value;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 8 -> order_acknowledgement_jp_equities_v1_record.price[order_acknowledgement_jp_equities_v1_at] = order_acknowledgement_jp_equities_v1_value; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_record.capacity = order_acknowledgement_jp_equities_v1_value;
  order_acknowledgement_jp_equities_v1_record.side = order_acknowledgement_jp_equities_v1_value;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 8 -> order_acknowledgement_jp_equities_v1_record.symbol[order_acknowledgement_jp_equities_v1_at] = order_acknowledgement_jp_equities_v1_value; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_record.time_in_force = order_acknowledgement_jp_equities_v1_value;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 8 -> order_acknowledgement_jp_equities_v1_record.expire_time[order_acknowledgement_jp_equities_v1_at] = order_acknowledgement_jp_equities_v1_value; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_record.cash_margin = order_acknowledgement_jp_equities_v1_value;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 2 -> order_acknowledgement_jp_equities_v1_record.risk_group_id[order_acknowledgement_jp_equities_v1_at] = order_acknowledgement_jp_equities_v1_value; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_record.no_trade_feat = order_acknowledgement_jp_equities_v1_value;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 10 -> order_acknowledgement_jp_equities_v1_record.no_trade_key[order_acknowledgement_jp_equities_v1_at] = order_acknowledgement_jp_equities_v1_value; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_record.posting_instruction = order_acknowledgement_jp_equities_v1_value;
  order_acknowledgement_jp_equities_v1_record.order_classification = order_acknowledgement_jp_equities_v1_value;
  order_acknowledgement_jp_equities_v1_record.margin_transaction_type = order_acknowledgement_jp_equities_v1_value;
  order_acknowledgement_jp_equities_v1_record.base_liquidity_indicator = order_acknowledgement_jp_equities_v1_value;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 4 -> order_acknowledgement_jp_equities_v1_record.company_id[order_acknowledgement_jp_equities_v1_at] = order_acknowledgement_jp_equities_v1_value; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Acknowledgement Jp Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_order_acknowledgement_jp_equities_v1(order_acknowledgement_jp_equities_v1_record, order_acknowledgement_jp_equities_v1_base) {
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 8 -> order_acknowledgement_jp_equities_v1_record.transaction_time[order_acknowledgement_jp_equities_v1_at] = (order_acknowledgement_jp_equities_v1_base + 0 + order_acknowledgement_jp_equities_v1_at + 1) % 256; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 10 -> order_acknowledgement_jp_equities_v1_record.account[order_acknowledgement_jp_equities_v1_at] = (order_acknowledgement_jp_equities_v1_base + 8 + order_acknowledgement_jp_equities_v1_at + 1) % 256; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 4 -> order_acknowledgement_jp_equities_v1_record.trading_firm[order_acknowledgement_jp_equities_v1_at] = (order_acknowledgement_jp_equities_v1_base + 18 + order_acknowledgement_jp_equities_v1_at + 1) % 256; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 20 -> order_acknowledgement_jp_equities_v1_record.cl_ord_id[order_acknowledgement_jp_equities_v1_at] = (order_acknowledgement_jp_equities_v1_base + 22 + order_acknowledgement_jp_equities_v1_at + 1) % 256; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 8 -> order_acknowledgement_jp_equities_v1_record.order_id[order_acknowledgement_jp_equities_v1_at] = (order_acknowledgement_jp_equities_v1_base + 42 + order_acknowledgement_jp_equities_v1_at + 1) % 256; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 4 -> order_acknowledgement_jp_equities_v1_record.order_qty[order_acknowledgement_jp_equities_v1_at] = (order_acknowledgement_jp_equities_v1_base + 50 + order_acknowledgement_jp_equities_v1_at + 1) % 256; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_record.ord_type = (order_acknowledgement_jp_equities_v1_base + 54 + 1) % 256;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 8 -> order_acknowledgement_jp_equities_v1_record.price[order_acknowledgement_jp_equities_v1_at] = (order_acknowledgement_jp_equities_v1_base + 55 + order_acknowledgement_jp_equities_v1_at + 1) % 256; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_record.capacity = (order_acknowledgement_jp_equities_v1_base + 63 + 1) % 256;
  order_acknowledgement_jp_equities_v1_record.side = (order_acknowledgement_jp_equities_v1_base + 64 + 1) % 256;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 8 -> order_acknowledgement_jp_equities_v1_record.symbol[order_acknowledgement_jp_equities_v1_at] = (order_acknowledgement_jp_equities_v1_base + 65 + order_acknowledgement_jp_equities_v1_at + 1) % 256; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_record.time_in_force = (order_acknowledgement_jp_equities_v1_base + 73 + 1) % 256;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 8 -> order_acknowledgement_jp_equities_v1_record.expire_time[order_acknowledgement_jp_equities_v1_at] = (order_acknowledgement_jp_equities_v1_base + 74 + order_acknowledgement_jp_equities_v1_at + 1) % 256; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_record.cash_margin = (order_acknowledgement_jp_equities_v1_base + 82 + 1) % 256;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 2 -> order_acknowledgement_jp_equities_v1_record.risk_group_id[order_acknowledgement_jp_equities_v1_at] = (order_acknowledgement_jp_equities_v1_base + 83 + order_acknowledgement_jp_equities_v1_at + 1) % 256; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_record.no_trade_feat = (order_acknowledgement_jp_equities_v1_base + 85 + 1) % 256;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 10 -> order_acknowledgement_jp_equities_v1_record.no_trade_key[order_acknowledgement_jp_equities_v1_at] = (order_acknowledgement_jp_equities_v1_base + 86 + order_acknowledgement_jp_equities_v1_at + 1) % 256; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_record.posting_instruction = (order_acknowledgement_jp_equities_v1_base + 96 + 1) % 256;
  order_acknowledgement_jp_equities_v1_record.order_classification = (order_acknowledgement_jp_equities_v1_base + 97 + 1) % 256;
  order_acknowledgement_jp_equities_v1_record.margin_transaction_type = (order_acknowledgement_jp_equities_v1_base + 98 + 1) % 256;
  order_acknowledgement_jp_equities_v1_record.base_liquidity_indicator = (order_acknowledgement_jp_equities_v1_base + 99 + 1) % 256;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 4 -> order_acknowledgement_jp_equities_v1_record.company_id[order_acknowledgement_jp_equities_v1_at] = (order_acknowledgement_jp_equities_v1_base + 100 + order_acknowledgement_jp_equities_v1_at + 1) % 256; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Order Acknowledgement Jp Equities V 1 to the wire, 104 bytes from where the cursor stands */
inline encode_order_acknowledgement_jp_equities_v1(order_acknowledgement_jp_equities_v1_record) {
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 8 -> wire[at] = order_acknowledgement_jp_equities_v1_record.transaction_time[order_acknowledgement_jp_equities_v1_at]; at = at + 1; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 10 -> wire[at] = order_acknowledgement_jp_equities_v1_record.account[order_acknowledgement_jp_equities_v1_at]; at = at + 1; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 4 -> wire[at] = order_acknowledgement_jp_equities_v1_record.trading_firm[order_acknowledgement_jp_equities_v1_at]; at = at + 1; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 20 -> wire[at] = order_acknowledgement_jp_equities_v1_record.cl_ord_id[order_acknowledgement_jp_equities_v1_at]; at = at + 1; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 8 -> wire[at] = order_acknowledgement_jp_equities_v1_record.order_id[order_acknowledgement_jp_equities_v1_at]; at = at + 1; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 4 -> wire[at] = order_acknowledgement_jp_equities_v1_record.order_qty[order_acknowledgement_jp_equities_v1_at]; at = at + 1; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_jp_equities_v1_record.ord_type; at = at + 1;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 8 -> wire[at] = order_acknowledgement_jp_equities_v1_record.price[order_acknowledgement_jp_equities_v1_at]; at = at + 1; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_jp_equities_v1_record.capacity; at = at + 1;
  wire[at] = order_acknowledgement_jp_equities_v1_record.side; at = at + 1;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 8 -> wire[at] = order_acknowledgement_jp_equities_v1_record.symbol[order_acknowledgement_jp_equities_v1_at]; at = at + 1; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_jp_equities_v1_record.time_in_force; at = at + 1;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 8 -> wire[at] = order_acknowledgement_jp_equities_v1_record.expire_time[order_acknowledgement_jp_equities_v1_at]; at = at + 1; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_jp_equities_v1_record.cash_margin; at = at + 1;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 2 -> wire[at] = order_acknowledgement_jp_equities_v1_record.risk_group_id[order_acknowledgement_jp_equities_v1_at]; at = at + 1; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_jp_equities_v1_record.no_trade_feat; at = at + 1;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 10 -> wire[at] = order_acknowledgement_jp_equities_v1_record.no_trade_key[order_acknowledgement_jp_equities_v1_at]; at = at + 1; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_jp_equities_v1_record.posting_instruction; at = at + 1;
  wire[at] = order_acknowledgement_jp_equities_v1_record.order_classification; at = at + 1;
  wire[at] = order_acknowledgement_jp_equities_v1_record.margin_transaction_type; at = at + 1;
  wire[at] = order_acknowledgement_jp_equities_v1_record.base_liquidity_indicator; at = at + 1;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 4 -> wire[at] = order_acknowledgement_jp_equities_v1_record.company_id[order_acknowledgement_jp_equities_v1_at]; at = at + 1; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Order Acknowledgement Jp Equities V 1 off the wire, 104 bytes from where the cursor stands */
inline decode_order_acknowledgement_jp_equities_v1(order_acknowledgement_jp_equities_v1_record) {
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 8 -> order_acknowledgement_jp_equities_v1_record.transaction_time[order_acknowledgement_jp_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 10 -> order_acknowledgement_jp_equities_v1_record.account[order_acknowledgement_jp_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 4 -> order_acknowledgement_jp_equities_v1_record.trading_firm[order_acknowledgement_jp_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 20 -> order_acknowledgement_jp_equities_v1_record.cl_ord_id[order_acknowledgement_jp_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 8 -> order_acknowledgement_jp_equities_v1_record.order_id[order_acknowledgement_jp_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 4 -> order_acknowledgement_jp_equities_v1_record.order_qty[order_acknowledgement_jp_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_record.ord_type = wire[at]; at = at + 1;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 8 -> order_acknowledgement_jp_equities_v1_record.price[order_acknowledgement_jp_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_record.capacity = wire[at]; at = at + 1;
  order_acknowledgement_jp_equities_v1_record.side = wire[at]; at = at + 1;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 8 -> order_acknowledgement_jp_equities_v1_record.symbol[order_acknowledgement_jp_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_record.time_in_force = wire[at]; at = at + 1;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 8 -> order_acknowledgement_jp_equities_v1_record.expire_time[order_acknowledgement_jp_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_record.cash_margin = wire[at]; at = at + 1;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 2 -> order_acknowledgement_jp_equities_v1_record.risk_group_id[order_acknowledgement_jp_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_record.no_trade_feat = wire[at]; at = at + 1;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 10 -> order_acknowledgement_jp_equities_v1_record.no_trade_key[order_acknowledgement_jp_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_record.posting_instruction = wire[at]; at = at + 1;
  order_acknowledgement_jp_equities_v1_record.order_classification = wire[at]; at = at + 1;
  order_acknowledgement_jp_equities_v1_record.margin_transaction_type = wire[at]; at = at + 1;
  order_acknowledgement_jp_equities_v1_record.base_liquidity_indicator = wire[at]; at = at + 1;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 4 -> order_acknowledgement_jp_equities_v1_record.company_id[order_acknowledgement_jp_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Acknowledgement Jp Equities V 1 is what was written, byte for byte */
inline equal_order_acknowledgement_jp_equities_v1(order_acknowledgement_jp_equities_v1_read, order_acknowledgement_jp_equities_v1_written) {
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 8 -> assert(order_acknowledgement_jp_equities_v1_read.transaction_time[order_acknowledgement_jp_equities_v1_at] == order_acknowledgement_jp_equities_v1_written.transaction_time[order_acknowledgement_jp_equities_v1_at]); order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 10 -> assert(order_acknowledgement_jp_equities_v1_read.account[order_acknowledgement_jp_equities_v1_at] == order_acknowledgement_jp_equities_v1_written.account[order_acknowledgement_jp_equities_v1_at]); order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 4 -> assert(order_acknowledgement_jp_equities_v1_read.trading_firm[order_acknowledgement_jp_equities_v1_at] == order_acknowledgement_jp_equities_v1_written.trading_firm[order_acknowledgement_jp_equities_v1_at]); order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 20 -> assert(order_acknowledgement_jp_equities_v1_read.cl_ord_id[order_acknowledgement_jp_equities_v1_at] == order_acknowledgement_jp_equities_v1_written.cl_ord_id[order_acknowledgement_jp_equities_v1_at]); order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 8 -> assert(order_acknowledgement_jp_equities_v1_read.order_id[order_acknowledgement_jp_equities_v1_at] == order_acknowledgement_jp_equities_v1_written.order_id[order_acknowledgement_jp_equities_v1_at]); order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 4 -> assert(order_acknowledgement_jp_equities_v1_read.order_qty[order_acknowledgement_jp_equities_v1_at] == order_acknowledgement_jp_equities_v1_written.order_qty[order_acknowledgement_jp_equities_v1_at]); order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_jp_equities_v1_read.ord_type == order_acknowledgement_jp_equities_v1_written.ord_type);
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 8 -> assert(order_acknowledgement_jp_equities_v1_read.price[order_acknowledgement_jp_equities_v1_at] == order_acknowledgement_jp_equities_v1_written.price[order_acknowledgement_jp_equities_v1_at]); order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_jp_equities_v1_read.capacity == order_acknowledgement_jp_equities_v1_written.capacity);
  assert(order_acknowledgement_jp_equities_v1_read.side == order_acknowledgement_jp_equities_v1_written.side);
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 8 -> assert(order_acknowledgement_jp_equities_v1_read.symbol[order_acknowledgement_jp_equities_v1_at] == order_acknowledgement_jp_equities_v1_written.symbol[order_acknowledgement_jp_equities_v1_at]); order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_jp_equities_v1_read.time_in_force == order_acknowledgement_jp_equities_v1_written.time_in_force);
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 8 -> assert(order_acknowledgement_jp_equities_v1_read.expire_time[order_acknowledgement_jp_equities_v1_at] == order_acknowledgement_jp_equities_v1_written.expire_time[order_acknowledgement_jp_equities_v1_at]); order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_jp_equities_v1_read.cash_margin == order_acknowledgement_jp_equities_v1_written.cash_margin);
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 2 -> assert(order_acknowledgement_jp_equities_v1_read.risk_group_id[order_acknowledgement_jp_equities_v1_at] == order_acknowledgement_jp_equities_v1_written.risk_group_id[order_acknowledgement_jp_equities_v1_at]); order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_jp_equities_v1_read.no_trade_feat == order_acknowledgement_jp_equities_v1_written.no_trade_feat);
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 10 -> assert(order_acknowledgement_jp_equities_v1_read.no_trade_key[order_acknowledgement_jp_equities_v1_at] == order_acknowledgement_jp_equities_v1_written.no_trade_key[order_acknowledgement_jp_equities_v1_at]); order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_jp_equities_v1_read.posting_instruction == order_acknowledgement_jp_equities_v1_written.posting_instruction);
  assert(order_acknowledgement_jp_equities_v1_read.order_classification == order_acknowledgement_jp_equities_v1_written.order_classification);
  assert(order_acknowledgement_jp_equities_v1_read.margin_transaction_type == order_acknowledgement_jp_equities_v1_written.margin_transaction_type);
  assert(order_acknowledgement_jp_equities_v1_read.base_liquidity_indicator == order_acknowledgement_jp_equities_v1_written.base_liquidity_indicator);
  order_acknowledgement_jp_equities_v1_at = 0;
  do
  :: order_acknowledgement_jp_equities_v1_at < 4 -> assert(order_acknowledgement_jp_equities_v1_read.company_id[order_acknowledgement_jp_equities_v1_at] == order_acknowledgement_jp_equities_v1_written.company_id[order_acknowledgement_jp_equities_v1_at]); order_acknowledgement_jp_equities_v1_at = order_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Rejected Jp Equities V 1: 93 bytes -------------------------------- */

/* Order Rejected messages are sent in response to a New Order which must be rejected */
typedef OrderRejectedJpEquitiesV1 {
  byte transaction_time[8];
  byte trading_firm[4];
  byte cl_ord_id[20];
  byte order_reject_reason;
  byte text[60]
};

int order_rejected_jp_equities_v1_at;

/* every byte of Order Rejected Jp Equities V 1 set to one value */
inline fill_order_rejected_jp_equities_v1(order_rejected_jp_equities_v1_record, order_rejected_jp_equities_v1_value) {
  order_rejected_jp_equities_v1_at = 0;
  do
  :: order_rejected_jp_equities_v1_at < 8 -> order_rejected_jp_equities_v1_record.transaction_time[order_rejected_jp_equities_v1_at] = order_rejected_jp_equities_v1_value; order_rejected_jp_equities_v1_at = order_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_jp_equities_v1_at = 0;
  do
  :: order_rejected_jp_equities_v1_at < 4 -> order_rejected_jp_equities_v1_record.trading_firm[order_rejected_jp_equities_v1_at] = order_rejected_jp_equities_v1_value; order_rejected_jp_equities_v1_at = order_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_jp_equities_v1_at = 0;
  do
  :: order_rejected_jp_equities_v1_at < 20 -> order_rejected_jp_equities_v1_record.cl_ord_id[order_rejected_jp_equities_v1_at] = order_rejected_jp_equities_v1_value; order_rejected_jp_equities_v1_at = order_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_jp_equities_v1_record.order_reject_reason = order_rejected_jp_equities_v1_value;
  order_rejected_jp_equities_v1_at = 0;
  do
  :: order_rejected_jp_equities_v1_at < 60 -> order_rejected_jp_equities_v1_record.text[order_rejected_jp_equities_v1_at] = order_rejected_jp_equities_v1_value; order_rejected_jp_equities_v1_at = order_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Rejected Jp Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_order_rejected_jp_equities_v1(order_rejected_jp_equities_v1_record, order_rejected_jp_equities_v1_base) {
  order_rejected_jp_equities_v1_at = 0;
  do
  :: order_rejected_jp_equities_v1_at < 8 -> order_rejected_jp_equities_v1_record.transaction_time[order_rejected_jp_equities_v1_at] = (order_rejected_jp_equities_v1_base + 0 + order_rejected_jp_equities_v1_at + 1) % 256; order_rejected_jp_equities_v1_at = order_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_jp_equities_v1_at = 0;
  do
  :: order_rejected_jp_equities_v1_at < 4 -> order_rejected_jp_equities_v1_record.trading_firm[order_rejected_jp_equities_v1_at] = (order_rejected_jp_equities_v1_base + 8 + order_rejected_jp_equities_v1_at + 1) % 256; order_rejected_jp_equities_v1_at = order_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_jp_equities_v1_at = 0;
  do
  :: order_rejected_jp_equities_v1_at < 20 -> order_rejected_jp_equities_v1_record.cl_ord_id[order_rejected_jp_equities_v1_at] = (order_rejected_jp_equities_v1_base + 12 + order_rejected_jp_equities_v1_at + 1) % 256; order_rejected_jp_equities_v1_at = order_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_jp_equities_v1_record.order_reject_reason = (order_rejected_jp_equities_v1_base + 32 + 1) % 256;
  order_rejected_jp_equities_v1_at = 0;
  do
  :: order_rejected_jp_equities_v1_at < 60 -> order_rejected_jp_equities_v1_record.text[order_rejected_jp_equities_v1_at] = (order_rejected_jp_equities_v1_base + 33 + order_rejected_jp_equities_v1_at + 1) % 256; order_rejected_jp_equities_v1_at = order_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Order Rejected Jp Equities V 1 to the wire, 93 bytes from where the cursor stands */
inline encode_order_rejected_jp_equities_v1(order_rejected_jp_equities_v1_record) {
  order_rejected_jp_equities_v1_at = 0;
  do
  :: order_rejected_jp_equities_v1_at < 8 -> wire[at] = order_rejected_jp_equities_v1_record.transaction_time[order_rejected_jp_equities_v1_at]; at = at + 1; order_rejected_jp_equities_v1_at = order_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_jp_equities_v1_at = 0;
  do
  :: order_rejected_jp_equities_v1_at < 4 -> wire[at] = order_rejected_jp_equities_v1_record.trading_firm[order_rejected_jp_equities_v1_at]; at = at + 1; order_rejected_jp_equities_v1_at = order_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_jp_equities_v1_at = 0;
  do
  :: order_rejected_jp_equities_v1_at < 20 -> wire[at] = order_rejected_jp_equities_v1_record.cl_ord_id[order_rejected_jp_equities_v1_at]; at = at + 1; order_rejected_jp_equities_v1_at = order_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_rejected_jp_equities_v1_record.order_reject_reason; at = at + 1;
  order_rejected_jp_equities_v1_at = 0;
  do
  :: order_rejected_jp_equities_v1_at < 60 -> wire[at] = order_rejected_jp_equities_v1_record.text[order_rejected_jp_equities_v1_at]; at = at + 1; order_rejected_jp_equities_v1_at = order_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Order Rejected Jp Equities V 1 off the wire, 93 bytes from where the cursor stands */
inline decode_order_rejected_jp_equities_v1(order_rejected_jp_equities_v1_record) {
  order_rejected_jp_equities_v1_at = 0;
  do
  :: order_rejected_jp_equities_v1_at < 8 -> order_rejected_jp_equities_v1_record.transaction_time[order_rejected_jp_equities_v1_at] = wire[at]; at = at + 1; order_rejected_jp_equities_v1_at = order_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_jp_equities_v1_at = 0;
  do
  :: order_rejected_jp_equities_v1_at < 4 -> order_rejected_jp_equities_v1_record.trading_firm[order_rejected_jp_equities_v1_at] = wire[at]; at = at + 1; order_rejected_jp_equities_v1_at = order_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_jp_equities_v1_at = 0;
  do
  :: order_rejected_jp_equities_v1_at < 20 -> order_rejected_jp_equities_v1_record.cl_ord_id[order_rejected_jp_equities_v1_at] = wire[at]; at = at + 1; order_rejected_jp_equities_v1_at = order_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_jp_equities_v1_record.order_reject_reason = wire[at]; at = at + 1;
  order_rejected_jp_equities_v1_at = 0;
  do
  :: order_rejected_jp_equities_v1_at < 60 -> order_rejected_jp_equities_v1_record.text[order_rejected_jp_equities_v1_at] = wire[at]; at = at + 1; order_rejected_jp_equities_v1_at = order_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Rejected Jp Equities V 1 is what was written, byte for byte */
inline equal_order_rejected_jp_equities_v1(order_rejected_jp_equities_v1_read, order_rejected_jp_equities_v1_written) {
  order_rejected_jp_equities_v1_at = 0;
  do
  :: order_rejected_jp_equities_v1_at < 8 -> assert(order_rejected_jp_equities_v1_read.transaction_time[order_rejected_jp_equities_v1_at] == order_rejected_jp_equities_v1_written.transaction_time[order_rejected_jp_equities_v1_at]); order_rejected_jp_equities_v1_at = order_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_jp_equities_v1_at = 0;
  do
  :: order_rejected_jp_equities_v1_at < 4 -> assert(order_rejected_jp_equities_v1_read.trading_firm[order_rejected_jp_equities_v1_at] == order_rejected_jp_equities_v1_written.trading_firm[order_rejected_jp_equities_v1_at]); order_rejected_jp_equities_v1_at = order_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_jp_equities_v1_at = 0;
  do
  :: order_rejected_jp_equities_v1_at < 20 -> assert(order_rejected_jp_equities_v1_read.cl_ord_id[order_rejected_jp_equities_v1_at] == order_rejected_jp_equities_v1_written.cl_ord_id[order_rejected_jp_equities_v1_at]); order_rejected_jp_equities_v1_at = order_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_rejected_jp_equities_v1_read.order_reject_reason == order_rejected_jp_equities_v1_written.order_reject_reason);
  order_rejected_jp_equities_v1_at = 0;
  do
  :: order_rejected_jp_equities_v1_at < 60 -> assert(order_rejected_jp_equities_v1_read.text[order_rejected_jp_equities_v1_at] == order_rejected_jp_equities_v1_written.text[order_rejected_jp_equities_v1_at]); order_rejected_jp_equities_v1_at = order_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Modified Jp Equities V 1: 81 bytes -------------------------------- */

/* Order Modified messages are sent in response to a Modify Order to indicate that the order has been successfully modified */
typedef OrderModifiedJpEquitiesV1 {
  byte transaction_time[8];
  byte trading_firm[4];
  byte cl_ord_id[20];
  byte order_qty[4];
  byte orig_cl_ord_id[20];
  byte order_id[8];
  byte price[8];
  byte leaves_qty[4];
  byte base_liquidity_indicator;
  byte company_id[4]
};

int order_modified_jp_equities_v1_at;

/* every byte of Order Modified Jp Equities V 1 set to one value */
inline fill_order_modified_jp_equities_v1(order_modified_jp_equities_v1_record, order_modified_jp_equities_v1_value) {
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 8 -> order_modified_jp_equities_v1_record.transaction_time[order_modified_jp_equities_v1_at] = order_modified_jp_equities_v1_value; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 4 -> order_modified_jp_equities_v1_record.trading_firm[order_modified_jp_equities_v1_at] = order_modified_jp_equities_v1_value; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 20 -> order_modified_jp_equities_v1_record.cl_ord_id[order_modified_jp_equities_v1_at] = order_modified_jp_equities_v1_value; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 4 -> order_modified_jp_equities_v1_record.order_qty[order_modified_jp_equities_v1_at] = order_modified_jp_equities_v1_value; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 20 -> order_modified_jp_equities_v1_record.orig_cl_ord_id[order_modified_jp_equities_v1_at] = order_modified_jp_equities_v1_value; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 8 -> order_modified_jp_equities_v1_record.order_id[order_modified_jp_equities_v1_at] = order_modified_jp_equities_v1_value; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 8 -> order_modified_jp_equities_v1_record.price[order_modified_jp_equities_v1_at] = order_modified_jp_equities_v1_value; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 4 -> order_modified_jp_equities_v1_record.leaves_qty[order_modified_jp_equities_v1_at] = order_modified_jp_equities_v1_value; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_record.base_liquidity_indicator = order_modified_jp_equities_v1_value;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 4 -> order_modified_jp_equities_v1_record.company_id[order_modified_jp_equities_v1_at] = order_modified_jp_equities_v1_value; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Modified Jp Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_order_modified_jp_equities_v1(order_modified_jp_equities_v1_record, order_modified_jp_equities_v1_base) {
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 8 -> order_modified_jp_equities_v1_record.transaction_time[order_modified_jp_equities_v1_at] = (order_modified_jp_equities_v1_base + 0 + order_modified_jp_equities_v1_at + 1) % 256; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 4 -> order_modified_jp_equities_v1_record.trading_firm[order_modified_jp_equities_v1_at] = (order_modified_jp_equities_v1_base + 8 + order_modified_jp_equities_v1_at + 1) % 256; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 20 -> order_modified_jp_equities_v1_record.cl_ord_id[order_modified_jp_equities_v1_at] = (order_modified_jp_equities_v1_base + 12 + order_modified_jp_equities_v1_at + 1) % 256; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 4 -> order_modified_jp_equities_v1_record.order_qty[order_modified_jp_equities_v1_at] = (order_modified_jp_equities_v1_base + 32 + order_modified_jp_equities_v1_at + 1) % 256; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 20 -> order_modified_jp_equities_v1_record.orig_cl_ord_id[order_modified_jp_equities_v1_at] = (order_modified_jp_equities_v1_base + 36 + order_modified_jp_equities_v1_at + 1) % 256; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 8 -> order_modified_jp_equities_v1_record.order_id[order_modified_jp_equities_v1_at] = (order_modified_jp_equities_v1_base + 56 + order_modified_jp_equities_v1_at + 1) % 256; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 8 -> order_modified_jp_equities_v1_record.price[order_modified_jp_equities_v1_at] = (order_modified_jp_equities_v1_base + 64 + order_modified_jp_equities_v1_at + 1) % 256; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 4 -> order_modified_jp_equities_v1_record.leaves_qty[order_modified_jp_equities_v1_at] = (order_modified_jp_equities_v1_base + 72 + order_modified_jp_equities_v1_at + 1) % 256; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_record.base_liquidity_indicator = (order_modified_jp_equities_v1_base + 76 + 1) % 256;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 4 -> order_modified_jp_equities_v1_record.company_id[order_modified_jp_equities_v1_at] = (order_modified_jp_equities_v1_base + 77 + order_modified_jp_equities_v1_at + 1) % 256; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modified Jp Equities V 1 to the wire, 81 bytes from where the cursor stands */
inline encode_order_modified_jp_equities_v1(order_modified_jp_equities_v1_record) {
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 8 -> wire[at] = order_modified_jp_equities_v1_record.transaction_time[order_modified_jp_equities_v1_at]; at = at + 1; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 4 -> wire[at] = order_modified_jp_equities_v1_record.trading_firm[order_modified_jp_equities_v1_at]; at = at + 1; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 20 -> wire[at] = order_modified_jp_equities_v1_record.cl_ord_id[order_modified_jp_equities_v1_at]; at = at + 1; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 4 -> wire[at] = order_modified_jp_equities_v1_record.order_qty[order_modified_jp_equities_v1_at]; at = at + 1; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 20 -> wire[at] = order_modified_jp_equities_v1_record.orig_cl_ord_id[order_modified_jp_equities_v1_at]; at = at + 1; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 8 -> wire[at] = order_modified_jp_equities_v1_record.order_id[order_modified_jp_equities_v1_at]; at = at + 1; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 8 -> wire[at] = order_modified_jp_equities_v1_record.price[order_modified_jp_equities_v1_at]; at = at + 1; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 4 -> wire[at] = order_modified_jp_equities_v1_record.leaves_qty[order_modified_jp_equities_v1_at]; at = at + 1; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_modified_jp_equities_v1_record.base_liquidity_indicator; at = at + 1;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 4 -> wire[at] = order_modified_jp_equities_v1_record.company_id[order_modified_jp_equities_v1_at]; at = at + 1; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modified Jp Equities V 1 off the wire, 81 bytes from where the cursor stands */
inline decode_order_modified_jp_equities_v1(order_modified_jp_equities_v1_record) {
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 8 -> order_modified_jp_equities_v1_record.transaction_time[order_modified_jp_equities_v1_at] = wire[at]; at = at + 1; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 4 -> order_modified_jp_equities_v1_record.trading_firm[order_modified_jp_equities_v1_at] = wire[at]; at = at + 1; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 20 -> order_modified_jp_equities_v1_record.cl_ord_id[order_modified_jp_equities_v1_at] = wire[at]; at = at + 1; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 4 -> order_modified_jp_equities_v1_record.order_qty[order_modified_jp_equities_v1_at] = wire[at]; at = at + 1; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 20 -> order_modified_jp_equities_v1_record.orig_cl_ord_id[order_modified_jp_equities_v1_at] = wire[at]; at = at + 1; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 8 -> order_modified_jp_equities_v1_record.order_id[order_modified_jp_equities_v1_at] = wire[at]; at = at + 1; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 8 -> order_modified_jp_equities_v1_record.price[order_modified_jp_equities_v1_at] = wire[at]; at = at + 1; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 4 -> order_modified_jp_equities_v1_record.leaves_qty[order_modified_jp_equities_v1_at] = wire[at]; at = at + 1; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_record.base_liquidity_indicator = wire[at]; at = at + 1;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 4 -> order_modified_jp_equities_v1_record.company_id[order_modified_jp_equities_v1_at] = wire[at]; at = at + 1; order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Modified Jp Equities V 1 is what was written, byte for byte */
inline equal_order_modified_jp_equities_v1(order_modified_jp_equities_v1_read, order_modified_jp_equities_v1_written) {
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 8 -> assert(order_modified_jp_equities_v1_read.transaction_time[order_modified_jp_equities_v1_at] == order_modified_jp_equities_v1_written.transaction_time[order_modified_jp_equities_v1_at]); order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 4 -> assert(order_modified_jp_equities_v1_read.trading_firm[order_modified_jp_equities_v1_at] == order_modified_jp_equities_v1_written.trading_firm[order_modified_jp_equities_v1_at]); order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 20 -> assert(order_modified_jp_equities_v1_read.cl_ord_id[order_modified_jp_equities_v1_at] == order_modified_jp_equities_v1_written.cl_ord_id[order_modified_jp_equities_v1_at]); order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 4 -> assert(order_modified_jp_equities_v1_read.order_qty[order_modified_jp_equities_v1_at] == order_modified_jp_equities_v1_written.order_qty[order_modified_jp_equities_v1_at]); order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 20 -> assert(order_modified_jp_equities_v1_read.orig_cl_ord_id[order_modified_jp_equities_v1_at] == order_modified_jp_equities_v1_written.orig_cl_ord_id[order_modified_jp_equities_v1_at]); order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 8 -> assert(order_modified_jp_equities_v1_read.order_id[order_modified_jp_equities_v1_at] == order_modified_jp_equities_v1_written.order_id[order_modified_jp_equities_v1_at]); order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 8 -> assert(order_modified_jp_equities_v1_read.price[order_modified_jp_equities_v1_at] == order_modified_jp_equities_v1_written.price[order_modified_jp_equities_v1_at]); order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 4 -> assert(order_modified_jp_equities_v1_read.leaves_qty[order_modified_jp_equities_v1_at] == order_modified_jp_equities_v1_written.leaves_qty[order_modified_jp_equities_v1_at]); order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_modified_jp_equities_v1_read.base_liquidity_indicator == order_modified_jp_equities_v1_written.base_liquidity_indicator);
  order_modified_jp_equities_v1_at = 0;
  do
  :: order_modified_jp_equities_v1_at < 4 -> assert(order_modified_jp_equities_v1_read.company_id[order_modified_jp_equities_v1_at] == order_modified_jp_equities_v1_written.company_id[order_modified_jp_equities_v1_at]); order_modified_jp_equities_v1_at = order_modified_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Rejected Jp Equities V 1: 113 bytes ------------------------------ */

/* Modify Rejected messages are sent in response to a Modify Order for an order which cannot be modified */
typedef ModifyRejectedJpEquitiesV1 {
  byte transaction_time[8];
  byte trading_firm[4];
  byte cl_ord_id[20];
  byte orig_cl_ord_id[20];
  byte modify_reject_reason;
  byte text[60]
};

int modify_rejected_jp_equities_v1_at;

/* every byte of Modify Rejected Jp Equities V 1 set to one value */
inline fill_modify_rejected_jp_equities_v1(modify_rejected_jp_equities_v1_record, modify_rejected_jp_equities_v1_value) {
  modify_rejected_jp_equities_v1_at = 0;
  do
  :: modify_rejected_jp_equities_v1_at < 8 -> modify_rejected_jp_equities_v1_record.transaction_time[modify_rejected_jp_equities_v1_at] = modify_rejected_jp_equities_v1_value; modify_rejected_jp_equities_v1_at = modify_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_jp_equities_v1_at = 0;
  do
  :: modify_rejected_jp_equities_v1_at < 4 -> modify_rejected_jp_equities_v1_record.trading_firm[modify_rejected_jp_equities_v1_at] = modify_rejected_jp_equities_v1_value; modify_rejected_jp_equities_v1_at = modify_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_jp_equities_v1_at = 0;
  do
  :: modify_rejected_jp_equities_v1_at < 20 -> modify_rejected_jp_equities_v1_record.cl_ord_id[modify_rejected_jp_equities_v1_at] = modify_rejected_jp_equities_v1_value; modify_rejected_jp_equities_v1_at = modify_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_jp_equities_v1_at = 0;
  do
  :: modify_rejected_jp_equities_v1_at < 20 -> modify_rejected_jp_equities_v1_record.orig_cl_ord_id[modify_rejected_jp_equities_v1_at] = modify_rejected_jp_equities_v1_value; modify_rejected_jp_equities_v1_at = modify_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_jp_equities_v1_record.modify_reject_reason = modify_rejected_jp_equities_v1_value;
  modify_rejected_jp_equities_v1_at = 0;
  do
  :: modify_rejected_jp_equities_v1_at < 60 -> modify_rejected_jp_equities_v1_record.text[modify_rejected_jp_equities_v1_at] = modify_rejected_jp_equities_v1_value; modify_rejected_jp_equities_v1_at = modify_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Modify Rejected Jp Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_modify_rejected_jp_equities_v1(modify_rejected_jp_equities_v1_record, modify_rejected_jp_equities_v1_base) {
  modify_rejected_jp_equities_v1_at = 0;
  do
  :: modify_rejected_jp_equities_v1_at < 8 -> modify_rejected_jp_equities_v1_record.transaction_time[modify_rejected_jp_equities_v1_at] = (modify_rejected_jp_equities_v1_base + 0 + modify_rejected_jp_equities_v1_at + 1) % 256; modify_rejected_jp_equities_v1_at = modify_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_jp_equities_v1_at = 0;
  do
  :: modify_rejected_jp_equities_v1_at < 4 -> modify_rejected_jp_equities_v1_record.trading_firm[modify_rejected_jp_equities_v1_at] = (modify_rejected_jp_equities_v1_base + 8 + modify_rejected_jp_equities_v1_at + 1) % 256; modify_rejected_jp_equities_v1_at = modify_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_jp_equities_v1_at = 0;
  do
  :: modify_rejected_jp_equities_v1_at < 20 -> modify_rejected_jp_equities_v1_record.cl_ord_id[modify_rejected_jp_equities_v1_at] = (modify_rejected_jp_equities_v1_base + 12 + modify_rejected_jp_equities_v1_at + 1) % 256; modify_rejected_jp_equities_v1_at = modify_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_jp_equities_v1_at = 0;
  do
  :: modify_rejected_jp_equities_v1_at < 20 -> modify_rejected_jp_equities_v1_record.orig_cl_ord_id[modify_rejected_jp_equities_v1_at] = (modify_rejected_jp_equities_v1_base + 32 + modify_rejected_jp_equities_v1_at + 1) % 256; modify_rejected_jp_equities_v1_at = modify_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_jp_equities_v1_record.modify_reject_reason = (modify_rejected_jp_equities_v1_base + 52 + 1) % 256;
  modify_rejected_jp_equities_v1_at = 0;
  do
  :: modify_rejected_jp_equities_v1_at < 60 -> modify_rejected_jp_equities_v1_record.text[modify_rejected_jp_equities_v1_at] = (modify_rejected_jp_equities_v1_base + 53 + modify_rejected_jp_equities_v1_at + 1) % 256; modify_rejected_jp_equities_v1_at = modify_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Rejected Jp Equities V 1 to the wire, 113 bytes from where the cursor stands */
inline encode_modify_rejected_jp_equities_v1(modify_rejected_jp_equities_v1_record) {
  modify_rejected_jp_equities_v1_at = 0;
  do
  :: modify_rejected_jp_equities_v1_at < 8 -> wire[at] = modify_rejected_jp_equities_v1_record.transaction_time[modify_rejected_jp_equities_v1_at]; at = at + 1; modify_rejected_jp_equities_v1_at = modify_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_jp_equities_v1_at = 0;
  do
  :: modify_rejected_jp_equities_v1_at < 4 -> wire[at] = modify_rejected_jp_equities_v1_record.trading_firm[modify_rejected_jp_equities_v1_at]; at = at + 1; modify_rejected_jp_equities_v1_at = modify_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_jp_equities_v1_at = 0;
  do
  :: modify_rejected_jp_equities_v1_at < 20 -> wire[at] = modify_rejected_jp_equities_v1_record.cl_ord_id[modify_rejected_jp_equities_v1_at]; at = at + 1; modify_rejected_jp_equities_v1_at = modify_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_jp_equities_v1_at = 0;
  do
  :: modify_rejected_jp_equities_v1_at < 20 -> wire[at] = modify_rejected_jp_equities_v1_record.orig_cl_ord_id[modify_rejected_jp_equities_v1_at]; at = at + 1; modify_rejected_jp_equities_v1_at = modify_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = modify_rejected_jp_equities_v1_record.modify_reject_reason; at = at + 1;
  modify_rejected_jp_equities_v1_at = 0;
  do
  :: modify_rejected_jp_equities_v1_at < 60 -> wire[at] = modify_rejected_jp_equities_v1_record.text[modify_rejected_jp_equities_v1_at]; at = at + 1; modify_rejected_jp_equities_v1_at = modify_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Rejected Jp Equities V 1 off the wire, 113 bytes from where the cursor stands */
inline decode_modify_rejected_jp_equities_v1(modify_rejected_jp_equities_v1_record) {
  modify_rejected_jp_equities_v1_at = 0;
  do
  :: modify_rejected_jp_equities_v1_at < 8 -> modify_rejected_jp_equities_v1_record.transaction_time[modify_rejected_jp_equities_v1_at] = wire[at]; at = at + 1; modify_rejected_jp_equities_v1_at = modify_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_jp_equities_v1_at = 0;
  do
  :: modify_rejected_jp_equities_v1_at < 4 -> modify_rejected_jp_equities_v1_record.trading_firm[modify_rejected_jp_equities_v1_at] = wire[at]; at = at + 1; modify_rejected_jp_equities_v1_at = modify_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_jp_equities_v1_at = 0;
  do
  :: modify_rejected_jp_equities_v1_at < 20 -> modify_rejected_jp_equities_v1_record.cl_ord_id[modify_rejected_jp_equities_v1_at] = wire[at]; at = at + 1; modify_rejected_jp_equities_v1_at = modify_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_jp_equities_v1_at = 0;
  do
  :: modify_rejected_jp_equities_v1_at < 20 -> modify_rejected_jp_equities_v1_record.orig_cl_ord_id[modify_rejected_jp_equities_v1_at] = wire[at]; at = at + 1; modify_rejected_jp_equities_v1_at = modify_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_jp_equities_v1_record.modify_reject_reason = wire[at]; at = at + 1;
  modify_rejected_jp_equities_v1_at = 0;
  do
  :: modify_rejected_jp_equities_v1_at < 60 -> modify_rejected_jp_equities_v1_record.text[modify_rejected_jp_equities_v1_at] = wire[at]; at = at + 1; modify_rejected_jp_equities_v1_at = modify_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Modify Rejected Jp Equities V 1 is what was written, byte for byte */
inline equal_modify_rejected_jp_equities_v1(modify_rejected_jp_equities_v1_read, modify_rejected_jp_equities_v1_written) {
  modify_rejected_jp_equities_v1_at = 0;
  do
  :: modify_rejected_jp_equities_v1_at < 8 -> assert(modify_rejected_jp_equities_v1_read.transaction_time[modify_rejected_jp_equities_v1_at] == modify_rejected_jp_equities_v1_written.transaction_time[modify_rejected_jp_equities_v1_at]); modify_rejected_jp_equities_v1_at = modify_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_jp_equities_v1_at = 0;
  do
  :: modify_rejected_jp_equities_v1_at < 4 -> assert(modify_rejected_jp_equities_v1_read.trading_firm[modify_rejected_jp_equities_v1_at] == modify_rejected_jp_equities_v1_written.trading_firm[modify_rejected_jp_equities_v1_at]); modify_rejected_jp_equities_v1_at = modify_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_jp_equities_v1_at = 0;
  do
  :: modify_rejected_jp_equities_v1_at < 20 -> assert(modify_rejected_jp_equities_v1_read.cl_ord_id[modify_rejected_jp_equities_v1_at] == modify_rejected_jp_equities_v1_written.cl_ord_id[modify_rejected_jp_equities_v1_at]); modify_rejected_jp_equities_v1_at = modify_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_jp_equities_v1_at = 0;
  do
  :: modify_rejected_jp_equities_v1_at < 20 -> assert(modify_rejected_jp_equities_v1_read.orig_cl_ord_id[modify_rejected_jp_equities_v1_at] == modify_rejected_jp_equities_v1_written.orig_cl_ord_id[modify_rejected_jp_equities_v1_at]); modify_rejected_jp_equities_v1_at = modify_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  assert(modify_rejected_jp_equities_v1_read.modify_reject_reason == modify_rejected_jp_equities_v1_written.modify_reject_reason);
  modify_rejected_jp_equities_v1_at = 0;
  do
  :: modify_rejected_jp_equities_v1_at < 60 -> assert(modify_rejected_jp_equities_v1_read.text[modify_rejected_jp_equities_v1_at] == modify_rejected_jp_equities_v1_written.text[modify_rejected_jp_equities_v1_at]); modify_rejected_jp_equities_v1_at = modify_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Restated Jp Equities V 1: 78 bytes -------------------------------- */

/* If an order is cancelled or reduced due to Self-Trade Protection instructions, the order will be restated with reductions to OrderQty and/or LeavesQty */
typedef OrderRestatedJpEquitiesV1 {
  byte transaction_time[8];
  byte trading_firm[4];
  byte cl_ord_id[20];
  byte order_id[8];
  byte order_qty[4];
  byte price[8];
  byte leaves_qty[4];
  byte secondary_order_id[8];
  byte last_px[8];
  byte last_shares[4];
  byte base_liquidity_indicator;
  byte restatement_reason
};

int order_restated_jp_equities_v1_at;

/* every byte of Order Restated Jp Equities V 1 set to one value */
inline fill_order_restated_jp_equities_v1(order_restated_jp_equities_v1_record, order_restated_jp_equities_v1_value) {
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 8 -> order_restated_jp_equities_v1_record.transaction_time[order_restated_jp_equities_v1_at] = order_restated_jp_equities_v1_value; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 4 -> order_restated_jp_equities_v1_record.trading_firm[order_restated_jp_equities_v1_at] = order_restated_jp_equities_v1_value; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 20 -> order_restated_jp_equities_v1_record.cl_ord_id[order_restated_jp_equities_v1_at] = order_restated_jp_equities_v1_value; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 8 -> order_restated_jp_equities_v1_record.order_id[order_restated_jp_equities_v1_at] = order_restated_jp_equities_v1_value; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 4 -> order_restated_jp_equities_v1_record.order_qty[order_restated_jp_equities_v1_at] = order_restated_jp_equities_v1_value; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 8 -> order_restated_jp_equities_v1_record.price[order_restated_jp_equities_v1_at] = order_restated_jp_equities_v1_value; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 4 -> order_restated_jp_equities_v1_record.leaves_qty[order_restated_jp_equities_v1_at] = order_restated_jp_equities_v1_value; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 8 -> order_restated_jp_equities_v1_record.secondary_order_id[order_restated_jp_equities_v1_at] = order_restated_jp_equities_v1_value; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 8 -> order_restated_jp_equities_v1_record.last_px[order_restated_jp_equities_v1_at] = order_restated_jp_equities_v1_value; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 4 -> order_restated_jp_equities_v1_record.last_shares[order_restated_jp_equities_v1_at] = order_restated_jp_equities_v1_value; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_record.base_liquidity_indicator = order_restated_jp_equities_v1_value;
  order_restated_jp_equities_v1_record.restatement_reason = order_restated_jp_equities_v1_value;
  skip
}

/* each byte of Order Restated Jp Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_order_restated_jp_equities_v1(order_restated_jp_equities_v1_record, order_restated_jp_equities_v1_base) {
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 8 -> order_restated_jp_equities_v1_record.transaction_time[order_restated_jp_equities_v1_at] = (order_restated_jp_equities_v1_base + 0 + order_restated_jp_equities_v1_at + 1) % 256; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 4 -> order_restated_jp_equities_v1_record.trading_firm[order_restated_jp_equities_v1_at] = (order_restated_jp_equities_v1_base + 8 + order_restated_jp_equities_v1_at + 1) % 256; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 20 -> order_restated_jp_equities_v1_record.cl_ord_id[order_restated_jp_equities_v1_at] = (order_restated_jp_equities_v1_base + 12 + order_restated_jp_equities_v1_at + 1) % 256; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 8 -> order_restated_jp_equities_v1_record.order_id[order_restated_jp_equities_v1_at] = (order_restated_jp_equities_v1_base + 32 + order_restated_jp_equities_v1_at + 1) % 256; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 4 -> order_restated_jp_equities_v1_record.order_qty[order_restated_jp_equities_v1_at] = (order_restated_jp_equities_v1_base + 40 + order_restated_jp_equities_v1_at + 1) % 256; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 8 -> order_restated_jp_equities_v1_record.price[order_restated_jp_equities_v1_at] = (order_restated_jp_equities_v1_base + 44 + order_restated_jp_equities_v1_at + 1) % 256; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 4 -> order_restated_jp_equities_v1_record.leaves_qty[order_restated_jp_equities_v1_at] = (order_restated_jp_equities_v1_base + 52 + order_restated_jp_equities_v1_at + 1) % 256; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 8 -> order_restated_jp_equities_v1_record.secondary_order_id[order_restated_jp_equities_v1_at] = (order_restated_jp_equities_v1_base + 56 + order_restated_jp_equities_v1_at + 1) % 256; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 8 -> order_restated_jp_equities_v1_record.last_px[order_restated_jp_equities_v1_at] = (order_restated_jp_equities_v1_base + 64 + order_restated_jp_equities_v1_at + 1) % 256; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 4 -> order_restated_jp_equities_v1_record.last_shares[order_restated_jp_equities_v1_at] = (order_restated_jp_equities_v1_base + 72 + order_restated_jp_equities_v1_at + 1) % 256; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_record.base_liquidity_indicator = (order_restated_jp_equities_v1_base + 76 + 1) % 256;
  order_restated_jp_equities_v1_record.restatement_reason = (order_restated_jp_equities_v1_base + 77 + 1) % 256;
  skip
}

/* Order Restated Jp Equities V 1 to the wire, 78 bytes from where the cursor stands */
inline encode_order_restated_jp_equities_v1(order_restated_jp_equities_v1_record) {
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 8 -> wire[at] = order_restated_jp_equities_v1_record.transaction_time[order_restated_jp_equities_v1_at]; at = at + 1; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 4 -> wire[at] = order_restated_jp_equities_v1_record.trading_firm[order_restated_jp_equities_v1_at]; at = at + 1; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 20 -> wire[at] = order_restated_jp_equities_v1_record.cl_ord_id[order_restated_jp_equities_v1_at]; at = at + 1; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 8 -> wire[at] = order_restated_jp_equities_v1_record.order_id[order_restated_jp_equities_v1_at]; at = at + 1; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 4 -> wire[at] = order_restated_jp_equities_v1_record.order_qty[order_restated_jp_equities_v1_at]; at = at + 1; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 8 -> wire[at] = order_restated_jp_equities_v1_record.price[order_restated_jp_equities_v1_at]; at = at + 1; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 4 -> wire[at] = order_restated_jp_equities_v1_record.leaves_qty[order_restated_jp_equities_v1_at]; at = at + 1; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 8 -> wire[at] = order_restated_jp_equities_v1_record.secondary_order_id[order_restated_jp_equities_v1_at]; at = at + 1; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 8 -> wire[at] = order_restated_jp_equities_v1_record.last_px[order_restated_jp_equities_v1_at]; at = at + 1; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 4 -> wire[at] = order_restated_jp_equities_v1_record.last_shares[order_restated_jp_equities_v1_at]; at = at + 1; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_restated_jp_equities_v1_record.base_liquidity_indicator; at = at + 1;
  wire[at] = order_restated_jp_equities_v1_record.restatement_reason; at = at + 1;
  skip
}

/* Order Restated Jp Equities V 1 off the wire, 78 bytes from where the cursor stands */
inline decode_order_restated_jp_equities_v1(order_restated_jp_equities_v1_record) {
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 8 -> order_restated_jp_equities_v1_record.transaction_time[order_restated_jp_equities_v1_at] = wire[at]; at = at + 1; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 4 -> order_restated_jp_equities_v1_record.trading_firm[order_restated_jp_equities_v1_at] = wire[at]; at = at + 1; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 20 -> order_restated_jp_equities_v1_record.cl_ord_id[order_restated_jp_equities_v1_at] = wire[at]; at = at + 1; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 8 -> order_restated_jp_equities_v1_record.order_id[order_restated_jp_equities_v1_at] = wire[at]; at = at + 1; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 4 -> order_restated_jp_equities_v1_record.order_qty[order_restated_jp_equities_v1_at] = wire[at]; at = at + 1; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 8 -> order_restated_jp_equities_v1_record.price[order_restated_jp_equities_v1_at] = wire[at]; at = at + 1; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 4 -> order_restated_jp_equities_v1_record.leaves_qty[order_restated_jp_equities_v1_at] = wire[at]; at = at + 1; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 8 -> order_restated_jp_equities_v1_record.secondary_order_id[order_restated_jp_equities_v1_at] = wire[at]; at = at + 1; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 8 -> order_restated_jp_equities_v1_record.last_px[order_restated_jp_equities_v1_at] = wire[at]; at = at + 1; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 4 -> order_restated_jp_equities_v1_record.last_shares[order_restated_jp_equities_v1_at] = wire[at]; at = at + 1; order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_record.base_liquidity_indicator = wire[at]; at = at + 1;
  order_restated_jp_equities_v1_record.restatement_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Restated Jp Equities V 1 is what was written, byte for byte */
inline equal_order_restated_jp_equities_v1(order_restated_jp_equities_v1_read, order_restated_jp_equities_v1_written) {
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 8 -> assert(order_restated_jp_equities_v1_read.transaction_time[order_restated_jp_equities_v1_at] == order_restated_jp_equities_v1_written.transaction_time[order_restated_jp_equities_v1_at]); order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 4 -> assert(order_restated_jp_equities_v1_read.trading_firm[order_restated_jp_equities_v1_at] == order_restated_jp_equities_v1_written.trading_firm[order_restated_jp_equities_v1_at]); order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 20 -> assert(order_restated_jp_equities_v1_read.cl_ord_id[order_restated_jp_equities_v1_at] == order_restated_jp_equities_v1_written.cl_ord_id[order_restated_jp_equities_v1_at]); order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 8 -> assert(order_restated_jp_equities_v1_read.order_id[order_restated_jp_equities_v1_at] == order_restated_jp_equities_v1_written.order_id[order_restated_jp_equities_v1_at]); order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 4 -> assert(order_restated_jp_equities_v1_read.order_qty[order_restated_jp_equities_v1_at] == order_restated_jp_equities_v1_written.order_qty[order_restated_jp_equities_v1_at]); order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 8 -> assert(order_restated_jp_equities_v1_read.price[order_restated_jp_equities_v1_at] == order_restated_jp_equities_v1_written.price[order_restated_jp_equities_v1_at]); order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 4 -> assert(order_restated_jp_equities_v1_read.leaves_qty[order_restated_jp_equities_v1_at] == order_restated_jp_equities_v1_written.leaves_qty[order_restated_jp_equities_v1_at]); order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 8 -> assert(order_restated_jp_equities_v1_read.secondary_order_id[order_restated_jp_equities_v1_at] == order_restated_jp_equities_v1_written.secondary_order_id[order_restated_jp_equities_v1_at]); order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 8 -> assert(order_restated_jp_equities_v1_read.last_px[order_restated_jp_equities_v1_at] == order_restated_jp_equities_v1_written.last_px[order_restated_jp_equities_v1_at]); order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_jp_equities_v1_at = 0;
  do
  :: order_restated_jp_equities_v1_at < 4 -> assert(order_restated_jp_equities_v1_read.last_shares[order_restated_jp_equities_v1_at] == order_restated_jp_equities_v1_written.last_shares[order_restated_jp_equities_v1_at]); order_restated_jp_equities_v1_at = order_restated_jp_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_restated_jp_equities_v1_read.base_liquidity_indicator == order_restated_jp_equities_v1_written.base_liquidity_indicator);
  assert(order_restated_jp_equities_v1_read.restatement_reason == order_restated_jp_equities_v1_written.restatement_reason);
  skip
}

/* ---- Order Execution Jp Equities V 1: 67 bytes ------------------------------- */

/* An Order Execution is sent for each fill on an order */
typedef OrderExecutionJpEquitiesV1 {
  byte transaction_time[8];
  byte trading_firm[4];
  byte cl_ord_id[20];
  byte exec_id[8];
  byte last_capacity;
  byte last_px[8];
  byte last_shares[4];
  byte side;
  byte symbol[8];
  byte leaves_qty[4];
  byte base_liquidity_indicator
};

int order_execution_jp_equities_v1_at;

/* every byte of Order Execution Jp Equities V 1 set to one value */
inline fill_order_execution_jp_equities_v1(order_execution_jp_equities_v1_record, order_execution_jp_equities_v1_value) {
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 8 -> order_execution_jp_equities_v1_record.transaction_time[order_execution_jp_equities_v1_at] = order_execution_jp_equities_v1_value; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 4 -> order_execution_jp_equities_v1_record.trading_firm[order_execution_jp_equities_v1_at] = order_execution_jp_equities_v1_value; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 20 -> order_execution_jp_equities_v1_record.cl_ord_id[order_execution_jp_equities_v1_at] = order_execution_jp_equities_v1_value; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 8 -> order_execution_jp_equities_v1_record.exec_id[order_execution_jp_equities_v1_at] = order_execution_jp_equities_v1_value; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_record.last_capacity = order_execution_jp_equities_v1_value;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 8 -> order_execution_jp_equities_v1_record.last_px[order_execution_jp_equities_v1_at] = order_execution_jp_equities_v1_value; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 4 -> order_execution_jp_equities_v1_record.last_shares[order_execution_jp_equities_v1_at] = order_execution_jp_equities_v1_value; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_record.side = order_execution_jp_equities_v1_value;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 8 -> order_execution_jp_equities_v1_record.symbol[order_execution_jp_equities_v1_at] = order_execution_jp_equities_v1_value; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 4 -> order_execution_jp_equities_v1_record.leaves_qty[order_execution_jp_equities_v1_at] = order_execution_jp_equities_v1_value; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_record.base_liquidity_indicator = order_execution_jp_equities_v1_value;
  skip
}

/* each byte of Order Execution Jp Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_order_execution_jp_equities_v1(order_execution_jp_equities_v1_record, order_execution_jp_equities_v1_base) {
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 8 -> order_execution_jp_equities_v1_record.transaction_time[order_execution_jp_equities_v1_at] = (order_execution_jp_equities_v1_base + 0 + order_execution_jp_equities_v1_at + 1) % 256; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 4 -> order_execution_jp_equities_v1_record.trading_firm[order_execution_jp_equities_v1_at] = (order_execution_jp_equities_v1_base + 8 + order_execution_jp_equities_v1_at + 1) % 256; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 20 -> order_execution_jp_equities_v1_record.cl_ord_id[order_execution_jp_equities_v1_at] = (order_execution_jp_equities_v1_base + 12 + order_execution_jp_equities_v1_at + 1) % 256; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 8 -> order_execution_jp_equities_v1_record.exec_id[order_execution_jp_equities_v1_at] = (order_execution_jp_equities_v1_base + 32 + order_execution_jp_equities_v1_at + 1) % 256; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_record.last_capacity = (order_execution_jp_equities_v1_base + 40 + 1) % 256;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 8 -> order_execution_jp_equities_v1_record.last_px[order_execution_jp_equities_v1_at] = (order_execution_jp_equities_v1_base + 41 + order_execution_jp_equities_v1_at + 1) % 256; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 4 -> order_execution_jp_equities_v1_record.last_shares[order_execution_jp_equities_v1_at] = (order_execution_jp_equities_v1_base + 49 + order_execution_jp_equities_v1_at + 1) % 256; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_record.side = (order_execution_jp_equities_v1_base + 53 + 1) % 256;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 8 -> order_execution_jp_equities_v1_record.symbol[order_execution_jp_equities_v1_at] = (order_execution_jp_equities_v1_base + 54 + order_execution_jp_equities_v1_at + 1) % 256; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 4 -> order_execution_jp_equities_v1_record.leaves_qty[order_execution_jp_equities_v1_at] = (order_execution_jp_equities_v1_base + 62 + order_execution_jp_equities_v1_at + 1) % 256; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_record.base_liquidity_indicator = (order_execution_jp_equities_v1_base + 66 + 1) % 256;
  skip
}

/* Order Execution Jp Equities V 1 to the wire, 67 bytes from where the cursor stands */
inline encode_order_execution_jp_equities_v1(order_execution_jp_equities_v1_record) {
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 8 -> wire[at] = order_execution_jp_equities_v1_record.transaction_time[order_execution_jp_equities_v1_at]; at = at + 1; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 4 -> wire[at] = order_execution_jp_equities_v1_record.trading_firm[order_execution_jp_equities_v1_at]; at = at + 1; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 20 -> wire[at] = order_execution_jp_equities_v1_record.cl_ord_id[order_execution_jp_equities_v1_at]; at = at + 1; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 8 -> wire[at] = order_execution_jp_equities_v1_record.exec_id[order_execution_jp_equities_v1_at]; at = at + 1; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_jp_equities_v1_record.last_capacity; at = at + 1;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 8 -> wire[at] = order_execution_jp_equities_v1_record.last_px[order_execution_jp_equities_v1_at]; at = at + 1; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 4 -> wire[at] = order_execution_jp_equities_v1_record.last_shares[order_execution_jp_equities_v1_at]; at = at + 1; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_jp_equities_v1_record.side; at = at + 1;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 8 -> wire[at] = order_execution_jp_equities_v1_record.symbol[order_execution_jp_equities_v1_at]; at = at + 1; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 4 -> wire[at] = order_execution_jp_equities_v1_record.leaves_qty[order_execution_jp_equities_v1_at]; at = at + 1; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_jp_equities_v1_record.base_liquidity_indicator; at = at + 1;
  skip
}

/* Order Execution Jp Equities V 1 off the wire, 67 bytes from where the cursor stands */
inline decode_order_execution_jp_equities_v1(order_execution_jp_equities_v1_record) {
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 8 -> order_execution_jp_equities_v1_record.transaction_time[order_execution_jp_equities_v1_at] = wire[at]; at = at + 1; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 4 -> order_execution_jp_equities_v1_record.trading_firm[order_execution_jp_equities_v1_at] = wire[at]; at = at + 1; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 20 -> order_execution_jp_equities_v1_record.cl_ord_id[order_execution_jp_equities_v1_at] = wire[at]; at = at + 1; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 8 -> order_execution_jp_equities_v1_record.exec_id[order_execution_jp_equities_v1_at] = wire[at]; at = at + 1; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_record.last_capacity = wire[at]; at = at + 1;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 8 -> order_execution_jp_equities_v1_record.last_px[order_execution_jp_equities_v1_at] = wire[at]; at = at + 1; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 4 -> order_execution_jp_equities_v1_record.last_shares[order_execution_jp_equities_v1_at] = wire[at]; at = at + 1; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_record.side = wire[at]; at = at + 1;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 8 -> order_execution_jp_equities_v1_record.symbol[order_execution_jp_equities_v1_at] = wire[at]; at = at + 1; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 4 -> order_execution_jp_equities_v1_record.leaves_qty[order_execution_jp_equities_v1_at] = wire[at]; at = at + 1; order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_record.base_liquidity_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Execution Jp Equities V 1 is what was written, byte for byte */
inline equal_order_execution_jp_equities_v1(order_execution_jp_equities_v1_read, order_execution_jp_equities_v1_written) {
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 8 -> assert(order_execution_jp_equities_v1_read.transaction_time[order_execution_jp_equities_v1_at] == order_execution_jp_equities_v1_written.transaction_time[order_execution_jp_equities_v1_at]); order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 4 -> assert(order_execution_jp_equities_v1_read.trading_firm[order_execution_jp_equities_v1_at] == order_execution_jp_equities_v1_written.trading_firm[order_execution_jp_equities_v1_at]); order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 20 -> assert(order_execution_jp_equities_v1_read.cl_ord_id[order_execution_jp_equities_v1_at] == order_execution_jp_equities_v1_written.cl_ord_id[order_execution_jp_equities_v1_at]); order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 8 -> assert(order_execution_jp_equities_v1_read.exec_id[order_execution_jp_equities_v1_at] == order_execution_jp_equities_v1_written.exec_id[order_execution_jp_equities_v1_at]); order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_execution_jp_equities_v1_read.last_capacity == order_execution_jp_equities_v1_written.last_capacity);
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 8 -> assert(order_execution_jp_equities_v1_read.last_px[order_execution_jp_equities_v1_at] == order_execution_jp_equities_v1_written.last_px[order_execution_jp_equities_v1_at]); order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 4 -> assert(order_execution_jp_equities_v1_read.last_shares[order_execution_jp_equities_v1_at] == order_execution_jp_equities_v1_written.last_shares[order_execution_jp_equities_v1_at]); order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_execution_jp_equities_v1_read.side == order_execution_jp_equities_v1_written.side);
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 8 -> assert(order_execution_jp_equities_v1_read.symbol[order_execution_jp_equities_v1_at] == order_execution_jp_equities_v1_written.symbol[order_execution_jp_equities_v1_at]); order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_jp_equities_v1_at = 0;
  do
  :: order_execution_jp_equities_v1_at < 4 -> assert(order_execution_jp_equities_v1_read.leaves_qty[order_execution_jp_equities_v1_at] == order_execution_jp_equities_v1_written.leaves_qty[order_execution_jp_equities_v1_at]); order_execution_jp_equities_v1_at = order_execution_jp_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_execution_jp_equities_v1_read.base_liquidity_indicator == order_execution_jp_equities_v1_written.base_liquidity_indicator);
  skip
}

/* ---- Order Cancelled Jp Equities V 1: 33 bytes ------------------------------- */

/* Order Cancelled message */
typedef OrderCancelledJpEquitiesV1 {
  byte transaction_time[8];
  byte trading_firm[4];
  byte cl_ord_id[20];
  byte cancel_reason
};

int order_cancelled_jp_equities_v1_at;

/* every byte of Order Cancelled Jp Equities V 1 set to one value */
inline fill_order_cancelled_jp_equities_v1(order_cancelled_jp_equities_v1_record, order_cancelled_jp_equities_v1_value) {
  order_cancelled_jp_equities_v1_at = 0;
  do
  :: order_cancelled_jp_equities_v1_at < 8 -> order_cancelled_jp_equities_v1_record.transaction_time[order_cancelled_jp_equities_v1_at] = order_cancelled_jp_equities_v1_value; order_cancelled_jp_equities_v1_at = order_cancelled_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_jp_equities_v1_at = 0;
  do
  :: order_cancelled_jp_equities_v1_at < 4 -> order_cancelled_jp_equities_v1_record.trading_firm[order_cancelled_jp_equities_v1_at] = order_cancelled_jp_equities_v1_value; order_cancelled_jp_equities_v1_at = order_cancelled_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_jp_equities_v1_at = 0;
  do
  :: order_cancelled_jp_equities_v1_at < 20 -> order_cancelled_jp_equities_v1_record.cl_ord_id[order_cancelled_jp_equities_v1_at] = order_cancelled_jp_equities_v1_value; order_cancelled_jp_equities_v1_at = order_cancelled_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_jp_equities_v1_record.cancel_reason = order_cancelled_jp_equities_v1_value;
  skip
}

/* each byte of Order Cancelled Jp Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_order_cancelled_jp_equities_v1(order_cancelled_jp_equities_v1_record, order_cancelled_jp_equities_v1_base) {
  order_cancelled_jp_equities_v1_at = 0;
  do
  :: order_cancelled_jp_equities_v1_at < 8 -> order_cancelled_jp_equities_v1_record.transaction_time[order_cancelled_jp_equities_v1_at] = (order_cancelled_jp_equities_v1_base + 0 + order_cancelled_jp_equities_v1_at + 1) % 256; order_cancelled_jp_equities_v1_at = order_cancelled_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_jp_equities_v1_at = 0;
  do
  :: order_cancelled_jp_equities_v1_at < 4 -> order_cancelled_jp_equities_v1_record.trading_firm[order_cancelled_jp_equities_v1_at] = (order_cancelled_jp_equities_v1_base + 8 + order_cancelled_jp_equities_v1_at + 1) % 256; order_cancelled_jp_equities_v1_at = order_cancelled_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_jp_equities_v1_at = 0;
  do
  :: order_cancelled_jp_equities_v1_at < 20 -> order_cancelled_jp_equities_v1_record.cl_ord_id[order_cancelled_jp_equities_v1_at] = (order_cancelled_jp_equities_v1_base + 12 + order_cancelled_jp_equities_v1_at + 1) % 256; order_cancelled_jp_equities_v1_at = order_cancelled_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_jp_equities_v1_record.cancel_reason = (order_cancelled_jp_equities_v1_base + 32 + 1) % 256;
  skip
}

/* Order Cancelled Jp Equities V 1 to the wire, 33 bytes from where the cursor stands */
inline encode_order_cancelled_jp_equities_v1(order_cancelled_jp_equities_v1_record) {
  order_cancelled_jp_equities_v1_at = 0;
  do
  :: order_cancelled_jp_equities_v1_at < 8 -> wire[at] = order_cancelled_jp_equities_v1_record.transaction_time[order_cancelled_jp_equities_v1_at]; at = at + 1; order_cancelled_jp_equities_v1_at = order_cancelled_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_jp_equities_v1_at = 0;
  do
  :: order_cancelled_jp_equities_v1_at < 4 -> wire[at] = order_cancelled_jp_equities_v1_record.trading_firm[order_cancelled_jp_equities_v1_at]; at = at + 1; order_cancelled_jp_equities_v1_at = order_cancelled_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_jp_equities_v1_at = 0;
  do
  :: order_cancelled_jp_equities_v1_at < 20 -> wire[at] = order_cancelled_jp_equities_v1_record.cl_ord_id[order_cancelled_jp_equities_v1_at]; at = at + 1; order_cancelled_jp_equities_v1_at = order_cancelled_jp_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_cancelled_jp_equities_v1_record.cancel_reason; at = at + 1;
  skip
}

/* Order Cancelled Jp Equities V 1 off the wire, 33 bytes from where the cursor stands */
inline decode_order_cancelled_jp_equities_v1(order_cancelled_jp_equities_v1_record) {
  order_cancelled_jp_equities_v1_at = 0;
  do
  :: order_cancelled_jp_equities_v1_at < 8 -> order_cancelled_jp_equities_v1_record.transaction_time[order_cancelled_jp_equities_v1_at] = wire[at]; at = at + 1; order_cancelled_jp_equities_v1_at = order_cancelled_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_jp_equities_v1_at = 0;
  do
  :: order_cancelled_jp_equities_v1_at < 4 -> order_cancelled_jp_equities_v1_record.trading_firm[order_cancelled_jp_equities_v1_at] = wire[at]; at = at + 1; order_cancelled_jp_equities_v1_at = order_cancelled_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_jp_equities_v1_at = 0;
  do
  :: order_cancelled_jp_equities_v1_at < 20 -> order_cancelled_jp_equities_v1_record.cl_ord_id[order_cancelled_jp_equities_v1_at] = wire[at]; at = at + 1; order_cancelled_jp_equities_v1_at = order_cancelled_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_jp_equities_v1_record.cancel_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Cancelled Jp Equities V 1 is what was written, byte for byte */
inline equal_order_cancelled_jp_equities_v1(order_cancelled_jp_equities_v1_read, order_cancelled_jp_equities_v1_written) {
  order_cancelled_jp_equities_v1_at = 0;
  do
  :: order_cancelled_jp_equities_v1_at < 8 -> assert(order_cancelled_jp_equities_v1_read.transaction_time[order_cancelled_jp_equities_v1_at] == order_cancelled_jp_equities_v1_written.transaction_time[order_cancelled_jp_equities_v1_at]); order_cancelled_jp_equities_v1_at = order_cancelled_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_jp_equities_v1_at = 0;
  do
  :: order_cancelled_jp_equities_v1_at < 4 -> assert(order_cancelled_jp_equities_v1_read.trading_firm[order_cancelled_jp_equities_v1_at] == order_cancelled_jp_equities_v1_written.trading_firm[order_cancelled_jp_equities_v1_at]); order_cancelled_jp_equities_v1_at = order_cancelled_jp_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_jp_equities_v1_at = 0;
  do
  :: order_cancelled_jp_equities_v1_at < 20 -> assert(order_cancelled_jp_equities_v1_read.cl_ord_id[order_cancelled_jp_equities_v1_at] == order_cancelled_jp_equities_v1_written.cl_ord_id[order_cancelled_jp_equities_v1_at]); order_cancelled_jp_equities_v1_at = order_cancelled_jp_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_cancelled_jp_equities_v1_read.cancel_reason == order_cancelled_jp_equities_v1_written.cancel_reason);
  skip
}

/* ---- Cancel Rejected Jp Equities V 1: 93 bytes ------------------------------- */

/* A Cancel Rejected message is sent in response to a Cancel Order message to indicate that the cancellation cannot occur */
typedef CancelRejectedJpEquitiesV1 {
  byte transaction_time[8];
  byte trading_firm[4];
  byte cl_ord_id[20];
  byte cancel_reject_reason;
  byte text[60]
};

int cancel_rejected_jp_equities_v1_at;

/* every byte of Cancel Rejected Jp Equities V 1 set to one value */
inline fill_cancel_rejected_jp_equities_v1(cancel_rejected_jp_equities_v1_record, cancel_rejected_jp_equities_v1_value) {
  cancel_rejected_jp_equities_v1_at = 0;
  do
  :: cancel_rejected_jp_equities_v1_at < 8 -> cancel_rejected_jp_equities_v1_record.transaction_time[cancel_rejected_jp_equities_v1_at] = cancel_rejected_jp_equities_v1_value; cancel_rejected_jp_equities_v1_at = cancel_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_jp_equities_v1_at = 0;
  do
  :: cancel_rejected_jp_equities_v1_at < 4 -> cancel_rejected_jp_equities_v1_record.trading_firm[cancel_rejected_jp_equities_v1_at] = cancel_rejected_jp_equities_v1_value; cancel_rejected_jp_equities_v1_at = cancel_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_jp_equities_v1_at = 0;
  do
  :: cancel_rejected_jp_equities_v1_at < 20 -> cancel_rejected_jp_equities_v1_record.cl_ord_id[cancel_rejected_jp_equities_v1_at] = cancel_rejected_jp_equities_v1_value; cancel_rejected_jp_equities_v1_at = cancel_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_jp_equities_v1_record.cancel_reject_reason = cancel_rejected_jp_equities_v1_value;
  cancel_rejected_jp_equities_v1_at = 0;
  do
  :: cancel_rejected_jp_equities_v1_at < 60 -> cancel_rejected_jp_equities_v1_record.text[cancel_rejected_jp_equities_v1_at] = cancel_rejected_jp_equities_v1_value; cancel_rejected_jp_equities_v1_at = cancel_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Rejected Jp Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_cancel_rejected_jp_equities_v1(cancel_rejected_jp_equities_v1_record, cancel_rejected_jp_equities_v1_base) {
  cancel_rejected_jp_equities_v1_at = 0;
  do
  :: cancel_rejected_jp_equities_v1_at < 8 -> cancel_rejected_jp_equities_v1_record.transaction_time[cancel_rejected_jp_equities_v1_at] = (cancel_rejected_jp_equities_v1_base + 0 + cancel_rejected_jp_equities_v1_at + 1) % 256; cancel_rejected_jp_equities_v1_at = cancel_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_jp_equities_v1_at = 0;
  do
  :: cancel_rejected_jp_equities_v1_at < 4 -> cancel_rejected_jp_equities_v1_record.trading_firm[cancel_rejected_jp_equities_v1_at] = (cancel_rejected_jp_equities_v1_base + 8 + cancel_rejected_jp_equities_v1_at + 1) % 256; cancel_rejected_jp_equities_v1_at = cancel_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_jp_equities_v1_at = 0;
  do
  :: cancel_rejected_jp_equities_v1_at < 20 -> cancel_rejected_jp_equities_v1_record.cl_ord_id[cancel_rejected_jp_equities_v1_at] = (cancel_rejected_jp_equities_v1_base + 12 + cancel_rejected_jp_equities_v1_at + 1) % 256; cancel_rejected_jp_equities_v1_at = cancel_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_jp_equities_v1_record.cancel_reject_reason = (cancel_rejected_jp_equities_v1_base + 32 + 1) % 256;
  cancel_rejected_jp_equities_v1_at = 0;
  do
  :: cancel_rejected_jp_equities_v1_at < 60 -> cancel_rejected_jp_equities_v1_record.text[cancel_rejected_jp_equities_v1_at] = (cancel_rejected_jp_equities_v1_base + 33 + cancel_rejected_jp_equities_v1_at + 1) % 256; cancel_rejected_jp_equities_v1_at = cancel_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Rejected Jp Equities V 1 to the wire, 93 bytes from where the cursor stands */
inline encode_cancel_rejected_jp_equities_v1(cancel_rejected_jp_equities_v1_record) {
  cancel_rejected_jp_equities_v1_at = 0;
  do
  :: cancel_rejected_jp_equities_v1_at < 8 -> wire[at] = cancel_rejected_jp_equities_v1_record.transaction_time[cancel_rejected_jp_equities_v1_at]; at = at + 1; cancel_rejected_jp_equities_v1_at = cancel_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_jp_equities_v1_at = 0;
  do
  :: cancel_rejected_jp_equities_v1_at < 4 -> wire[at] = cancel_rejected_jp_equities_v1_record.trading_firm[cancel_rejected_jp_equities_v1_at]; at = at + 1; cancel_rejected_jp_equities_v1_at = cancel_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_jp_equities_v1_at = 0;
  do
  :: cancel_rejected_jp_equities_v1_at < 20 -> wire[at] = cancel_rejected_jp_equities_v1_record.cl_ord_id[cancel_rejected_jp_equities_v1_at]; at = at + 1; cancel_rejected_jp_equities_v1_at = cancel_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = cancel_rejected_jp_equities_v1_record.cancel_reject_reason; at = at + 1;
  cancel_rejected_jp_equities_v1_at = 0;
  do
  :: cancel_rejected_jp_equities_v1_at < 60 -> wire[at] = cancel_rejected_jp_equities_v1_record.text[cancel_rejected_jp_equities_v1_at]; at = at + 1; cancel_rejected_jp_equities_v1_at = cancel_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Rejected Jp Equities V 1 off the wire, 93 bytes from where the cursor stands */
inline decode_cancel_rejected_jp_equities_v1(cancel_rejected_jp_equities_v1_record) {
  cancel_rejected_jp_equities_v1_at = 0;
  do
  :: cancel_rejected_jp_equities_v1_at < 8 -> cancel_rejected_jp_equities_v1_record.transaction_time[cancel_rejected_jp_equities_v1_at] = wire[at]; at = at + 1; cancel_rejected_jp_equities_v1_at = cancel_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_jp_equities_v1_at = 0;
  do
  :: cancel_rejected_jp_equities_v1_at < 4 -> cancel_rejected_jp_equities_v1_record.trading_firm[cancel_rejected_jp_equities_v1_at] = wire[at]; at = at + 1; cancel_rejected_jp_equities_v1_at = cancel_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_jp_equities_v1_at = 0;
  do
  :: cancel_rejected_jp_equities_v1_at < 20 -> cancel_rejected_jp_equities_v1_record.cl_ord_id[cancel_rejected_jp_equities_v1_at] = wire[at]; at = at + 1; cancel_rejected_jp_equities_v1_at = cancel_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_jp_equities_v1_record.cancel_reject_reason = wire[at]; at = at + 1;
  cancel_rejected_jp_equities_v1_at = 0;
  do
  :: cancel_rejected_jp_equities_v1_at < 60 -> cancel_rejected_jp_equities_v1_record.text[cancel_rejected_jp_equities_v1_at] = wire[at]; at = at + 1; cancel_rejected_jp_equities_v1_at = cancel_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Rejected Jp Equities V 1 is what was written, byte for byte */
inline equal_cancel_rejected_jp_equities_v1(cancel_rejected_jp_equities_v1_read, cancel_rejected_jp_equities_v1_written) {
  cancel_rejected_jp_equities_v1_at = 0;
  do
  :: cancel_rejected_jp_equities_v1_at < 8 -> assert(cancel_rejected_jp_equities_v1_read.transaction_time[cancel_rejected_jp_equities_v1_at] == cancel_rejected_jp_equities_v1_written.transaction_time[cancel_rejected_jp_equities_v1_at]); cancel_rejected_jp_equities_v1_at = cancel_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_jp_equities_v1_at = 0;
  do
  :: cancel_rejected_jp_equities_v1_at < 4 -> assert(cancel_rejected_jp_equities_v1_read.trading_firm[cancel_rejected_jp_equities_v1_at] == cancel_rejected_jp_equities_v1_written.trading_firm[cancel_rejected_jp_equities_v1_at]); cancel_rejected_jp_equities_v1_at = cancel_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_jp_equities_v1_at = 0;
  do
  :: cancel_rejected_jp_equities_v1_at < 20 -> assert(cancel_rejected_jp_equities_v1_read.cl_ord_id[cancel_rejected_jp_equities_v1_at] == cancel_rejected_jp_equities_v1_written.cl_ord_id[cancel_rejected_jp_equities_v1_at]); cancel_rejected_jp_equities_v1_at = cancel_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  assert(cancel_rejected_jp_equities_v1_read.cancel_reject_reason == cancel_rejected_jp_equities_v1_written.cancel_reject_reason);
  cancel_rejected_jp_equities_v1_at = 0;
  do
  :: cancel_rejected_jp_equities_v1_at < 60 -> assert(cancel_rejected_jp_equities_v1_read.text[cancel_rejected_jp_equities_v1_at] == cancel_rejected_jp_equities_v1_written.text[cancel_rejected_jp_equities_v1_at]); cancel_rejected_jp_equities_v1_at = cancel_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Purge Acknowledgement Jp Equities V 1: 32 bytes ------------------------- */

/* A Purge Acknowledgment is an unsequenced message sent when a Purge Orders message requesting an order purge has completed cancelling all individual orders */
typedef PurgeAcknowledgementJpEquitiesV1 {
  byte transaction_time[8];
  byte mass_cancel_id[20];
  byte cancelled_order_count[4]
};

int purge_acknowledgement_jp_equities_v1_at;

/* every byte of Purge Acknowledgement Jp Equities V 1 set to one value */
inline fill_purge_acknowledgement_jp_equities_v1(purge_acknowledgement_jp_equities_v1_record, purge_acknowledgement_jp_equities_v1_value) {
  purge_acknowledgement_jp_equities_v1_at = 0;
  do
  :: purge_acknowledgement_jp_equities_v1_at < 8 -> purge_acknowledgement_jp_equities_v1_record.transaction_time[purge_acknowledgement_jp_equities_v1_at] = purge_acknowledgement_jp_equities_v1_value; purge_acknowledgement_jp_equities_v1_at = purge_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_jp_equities_v1_at = 0;
  do
  :: purge_acknowledgement_jp_equities_v1_at < 20 -> purge_acknowledgement_jp_equities_v1_record.mass_cancel_id[purge_acknowledgement_jp_equities_v1_at] = purge_acknowledgement_jp_equities_v1_value; purge_acknowledgement_jp_equities_v1_at = purge_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_jp_equities_v1_at = 0;
  do
  :: purge_acknowledgement_jp_equities_v1_at < 4 -> purge_acknowledgement_jp_equities_v1_record.cancelled_order_count[purge_acknowledgement_jp_equities_v1_at] = purge_acknowledgement_jp_equities_v1_value; purge_acknowledgement_jp_equities_v1_at = purge_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Purge Acknowledgement Jp Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_purge_acknowledgement_jp_equities_v1(purge_acknowledgement_jp_equities_v1_record, purge_acknowledgement_jp_equities_v1_base) {
  purge_acknowledgement_jp_equities_v1_at = 0;
  do
  :: purge_acknowledgement_jp_equities_v1_at < 8 -> purge_acknowledgement_jp_equities_v1_record.transaction_time[purge_acknowledgement_jp_equities_v1_at] = (purge_acknowledgement_jp_equities_v1_base + 0 + purge_acknowledgement_jp_equities_v1_at + 1) % 256; purge_acknowledgement_jp_equities_v1_at = purge_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_jp_equities_v1_at = 0;
  do
  :: purge_acknowledgement_jp_equities_v1_at < 20 -> purge_acknowledgement_jp_equities_v1_record.mass_cancel_id[purge_acknowledgement_jp_equities_v1_at] = (purge_acknowledgement_jp_equities_v1_base + 8 + purge_acknowledgement_jp_equities_v1_at + 1) % 256; purge_acknowledgement_jp_equities_v1_at = purge_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_jp_equities_v1_at = 0;
  do
  :: purge_acknowledgement_jp_equities_v1_at < 4 -> purge_acknowledgement_jp_equities_v1_record.cancelled_order_count[purge_acknowledgement_jp_equities_v1_at] = (purge_acknowledgement_jp_equities_v1_base + 28 + purge_acknowledgement_jp_equities_v1_at + 1) % 256; purge_acknowledgement_jp_equities_v1_at = purge_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Purge Acknowledgement Jp Equities V 1 to the wire, 32 bytes from where the cursor stands */
inline encode_purge_acknowledgement_jp_equities_v1(purge_acknowledgement_jp_equities_v1_record) {
  purge_acknowledgement_jp_equities_v1_at = 0;
  do
  :: purge_acknowledgement_jp_equities_v1_at < 8 -> wire[at] = purge_acknowledgement_jp_equities_v1_record.transaction_time[purge_acknowledgement_jp_equities_v1_at]; at = at + 1; purge_acknowledgement_jp_equities_v1_at = purge_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_jp_equities_v1_at = 0;
  do
  :: purge_acknowledgement_jp_equities_v1_at < 20 -> wire[at] = purge_acknowledgement_jp_equities_v1_record.mass_cancel_id[purge_acknowledgement_jp_equities_v1_at]; at = at + 1; purge_acknowledgement_jp_equities_v1_at = purge_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_jp_equities_v1_at = 0;
  do
  :: purge_acknowledgement_jp_equities_v1_at < 4 -> wire[at] = purge_acknowledgement_jp_equities_v1_record.cancelled_order_count[purge_acknowledgement_jp_equities_v1_at]; at = at + 1; purge_acknowledgement_jp_equities_v1_at = purge_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Purge Acknowledgement Jp Equities V 1 off the wire, 32 bytes from where the cursor stands */
inline decode_purge_acknowledgement_jp_equities_v1(purge_acknowledgement_jp_equities_v1_record) {
  purge_acknowledgement_jp_equities_v1_at = 0;
  do
  :: purge_acknowledgement_jp_equities_v1_at < 8 -> purge_acknowledgement_jp_equities_v1_record.transaction_time[purge_acknowledgement_jp_equities_v1_at] = wire[at]; at = at + 1; purge_acknowledgement_jp_equities_v1_at = purge_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_jp_equities_v1_at = 0;
  do
  :: purge_acknowledgement_jp_equities_v1_at < 20 -> purge_acknowledgement_jp_equities_v1_record.mass_cancel_id[purge_acknowledgement_jp_equities_v1_at] = wire[at]; at = at + 1; purge_acknowledgement_jp_equities_v1_at = purge_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_jp_equities_v1_at = 0;
  do
  :: purge_acknowledgement_jp_equities_v1_at < 4 -> purge_acknowledgement_jp_equities_v1_record.cancelled_order_count[purge_acknowledgement_jp_equities_v1_at] = wire[at]; at = at + 1; purge_acknowledgement_jp_equities_v1_at = purge_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Purge Acknowledgement Jp Equities V 1 is what was written, byte for byte */
inline equal_purge_acknowledgement_jp_equities_v1(purge_acknowledgement_jp_equities_v1_read, purge_acknowledgement_jp_equities_v1_written) {
  purge_acknowledgement_jp_equities_v1_at = 0;
  do
  :: purge_acknowledgement_jp_equities_v1_at < 8 -> assert(purge_acknowledgement_jp_equities_v1_read.transaction_time[purge_acknowledgement_jp_equities_v1_at] == purge_acknowledgement_jp_equities_v1_written.transaction_time[purge_acknowledgement_jp_equities_v1_at]); purge_acknowledgement_jp_equities_v1_at = purge_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_jp_equities_v1_at = 0;
  do
  :: purge_acknowledgement_jp_equities_v1_at < 20 -> assert(purge_acknowledgement_jp_equities_v1_read.mass_cancel_id[purge_acknowledgement_jp_equities_v1_at] == purge_acknowledgement_jp_equities_v1_written.mass_cancel_id[purge_acknowledgement_jp_equities_v1_at]); purge_acknowledgement_jp_equities_v1_at = purge_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_jp_equities_v1_at = 0;
  do
  :: purge_acknowledgement_jp_equities_v1_at < 4 -> assert(purge_acknowledgement_jp_equities_v1_read.cancelled_order_count[purge_acknowledgement_jp_equities_v1_at] == purge_acknowledgement_jp_equities_v1_written.cancelled_order_count[purge_acknowledgement_jp_equities_v1_at]); purge_acknowledgement_jp_equities_v1_at = purge_acknowledgement_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Purge Rejected Jp Equities V 1: 89 bytes -------------------------------- */

/* A Purge Rejected message is sent in response to a Purge Orders message to indicate that the mass cancellation cannot occur */
typedef PurgeRejectedJpEquitiesV1 {
  byte transaction_time[8];
  byte mass_cancel_id[20];
  byte purge_reject_reason;
  byte text[60]
};

int purge_rejected_jp_equities_v1_at;

/* every byte of Purge Rejected Jp Equities V 1 set to one value */
inline fill_purge_rejected_jp_equities_v1(purge_rejected_jp_equities_v1_record, purge_rejected_jp_equities_v1_value) {
  purge_rejected_jp_equities_v1_at = 0;
  do
  :: purge_rejected_jp_equities_v1_at < 8 -> purge_rejected_jp_equities_v1_record.transaction_time[purge_rejected_jp_equities_v1_at] = purge_rejected_jp_equities_v1_value; purge_rejected_jp_equities_v1_at = purge_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_jp_equities_v1_at = 0;
  do
  :: purge_rejected_jp_equities_v1_at < 20 -> purge_rejected_jp_equities_v1_record.mass_cancel_id[purge_rejected_jp_equities_v1_at] = purge_rejected_jp_equities_v1_value; purge_rejected_jp_equities_v1_at = purge_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_jp_equities_v1_record.purge_reject_reason = purge_rejected_jp_equities_v1_value;
  purge_rejected_jp_equities_v1_at = 0;
  do
  :: purge_rejected_jp_equities_v1_at < 60 -> purge_rejected_jp_equities_v1_record.text[purge_rejected_jp_equities_v1_at] = purge_rejected_jp_equities_v1_value; purge_rejected_jp_equities_v1_at = purge_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Purge Rejected Jp Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_purge_rejected_jp_equities_v1(purge_rejected_jp_equities_v1_record, purge_rejected_jp_equities_v1_base) {
  purge_rejected_jp_equities_v1_at = 0;
  do
  :: purge_rejected_jp_equities_v1_at < 8 -> purge_rejected_jp_equities_v1_record.transaction_time[purge_rejected_jp_equities_v1_at] = (purge_rejected_jp_equities_v1_base + 0 + purge_rejected_jp_equities_v1_at + 1) % 256; purge_rejected_jp_equities_v1_at = purge_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_jp_equities_v1_at = 0;
  do
  :: purge_rejected_jp_equities_v1_at < 20 -> purge_rejected_jp_equities_v1_record.mass_cancel_id[purge_rejected_jp_equities_v1_at] = (purge_rejected_jp_equities_v1_base + 8 + purge_rejected_jp_equities_v1_at + 1) % 256; purge_rejected_jp_equities_v1_at = purge_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_jp_equities_v1_record.purge_reject_reason = (purge_rejected_jp_equities_v1_base + 28 + 1) % 256;
  purge_rejected_jp_equities_v1_at = 0;
  do
  :: purge_rejected_jp_equities_v1_at < 60 -> purge_rejected_jp_equities_v1_record.text[purge_rejected_jp_equities_v1_at] = (purge_rejected_jp_equities_v1_base + 29 + purge_rejected_jp_equities_v1_at + 1) % 256; purge_rejected_jp_equities_v1_at = purge_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Purge Rejected Jp Equities V 1 to the wire, 89 bytes from where the cursor stands */
inline encode_purge_rejected_jp_equities_v1(purge_rejected_jp_equities_v1_record) {
  purge_rejected_jp_equities_v1_at = 0;
  do
  :: purge_rejected_jp_equities_v1_at < 8 -> wire[at] = purge_rejected_jp_equities_v1_record.transaction_time[purge_rejected_jp_equities_v1_at]; at = at + 1; purge_rejected_jp_equities_v1_at = purge_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_jp_equities_v1_at = 0;
  do
  :: purge_rejected_jp_equities_v1_at < 20 -> wire[at] = purge_rejected_jp_equities_v1_record.mass_cancel_id[purge_rejected_jp_equities_v1_at]; at = at + 1; purge_rejected_jp_equities_v1_at = purge_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = purge_rejected_jp_equities_v1_record.purge_reject_reason; at = at + 1;
  purge_rejected_jp_equities_v1_at = 0;
  do
  :: purge_rejected_jp_equities_v1_at < 60 -> wire[at] = purge_rejected_jp_equities_v1_record.text[purge_rejected_jp_equities_v1_at]; at = at + 1; purge_rejected_jp_equities_v1_at = purge_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Purge Rejected Jp Equities V 1 off the wire, 89 bytes from where the cursor stands */
inline decode_purge_rejected_jp_equities_v1(purge_rejected_jp_equities_v1_record) {
  purge_rejected_jp_equities_v1_at = 0;
  do
  :: purge_rejected_jp_equities_v1_at < 8 -> purge_rejected_jp_equities_v1_record.transaction_time[purge_rejected_jp_equities_v1_at] = wire[at]; at = at + 1; purge_rejected_jp_equities_v1_at = purge_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_jp_equities_v1_at = 0;
  do
  :: purge_rejected_jp_equities_v1_at < 20 -> purge_rejected_jp_equities_v1_record.mass_cancel_id[purge_rejected_jp_equities_v1_at] = wire[at]; at = at + 1; purge_rejected_jp_equities_v1_at = purge_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_jp_equities_v1_record.purge_reject_reason = wire[at]; at = at + 1;
  purge_rejected_jp_equities_v1_at = 0;
  do
  :: purge_rejected_jp_equities_v1_at < 60 -> purge_rejected_jp_equities_v1_record.text[purge_rejected_jp_equities_v1_at] = wire[at]; at = at + 1; purge_rejected_jp_equities_v1_at = purge_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Purge Rejected Jp Equities V 1 is what was written, byte for byte */
inline equal_purge_rejected_jp_equities_v1(purge_rejected_jp_equities_v1_read, purge_rejected_jp_equities_v1_written) {
  purge_rejected_jp_equities_v1_at = 0;
  do
  :: purge_rejected_jp_equities_v1_at < 8 -> assert(purge_rejected_jp_equities_v1_read.transaction_time[purge_rejected_jp_equities_v1_at] == purge_rejected_jp_equities_v1_written.transaction_time[purge_rejected_jp_equities_v1_at]); purge_rejected_jp_equities_v1_at = purge_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_jp_equities_v1_at = 0;
  do
  :: purge_rejected_jp_equities_v1_at < 20 -> assert(purge_rejected_jp_equities_v1_read.mass_cancel_id[purge_rejected_jp_equities_v1_at] == purge_rejected_jp_equities_v1_written.mass_cancel_id[purge_rejected_jp_equities_v1_at]); purge_rejected_jp_equities_v1_at = purge_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  assert(purge_rejected_jp_equities_v1_read.purge_reject_reason == purge_rejected_jp_equities_v1_written.purge_reject_reason);
  purge_rejected_jp_equities_v1_at = 0;
  do
  :: purge_rejected_jp_equities_v1_at < 60 -> assert(purge_rejected_jp_equities_v1_read.text[purge_rejected_jp_equities_v1_at] == purge_rejected_jp_equities_v1_written.text[purge_rejected_jp_equities_v1_at]); purge_rejected_jp_equities_v1_at = purge_rejected_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Exchange Message Header: encoded, read back, and compared */
proctype check_exchange_message_header() {
  ExchangeMessageHeader exchange_message_header_sent;
  ExchangeMessageHeader exchange_message_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_exchange_message_header(exchange_message_header_sent, 0)
  :: pattern == 1 -> fill_exchange_message_header(exchange_message_header_sent, 32)
  :: pattern == 2 -> fill_exchange_message_header(exchange_message_header_sent, 255)
  :: else -> ramp_exchange_message_header(exchange_message_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_exchange_message_header(exchange_message_header_sent);
    assert(at == 12);
    at = 0;
    decode_exchange_message_header(exchange_message_header_got);
    assert(at == 12);
    equal_exchange_message_header(exchange_message_header_got, exchange_message_header_sent)
  }
}

/* Logout Response Message: encoded, read back, and compared */
proctype check_logout_response_message() {
  LogoutResponseMessage logout_response_message_sent;
  LogoutResponseMessage logout_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logout_response_message(logout_response_message_sent, 0)
  :: pattern == 1 -> fill_logout_response_message(logout_response_message_sent, 32)
  :: pattern == 2 -> fill_logout_response_message(logout_response_message_sent, 255)
  :: else -> ramp_logout_response_message(logout_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logout_response_message(logout_response_message_sent);
    assert(at == 61);
    at = 0;
    decode_logout_response_message(logout_response_message_got);
    assert(at == 61);
    equal_logout_response_message(logout_response_message_got, logout_response_message_sent)
  }
}

/* Order Acknowledgement Jp Equities V 1: encoded, read back, and compared */
proctype check_order_acknowledgement_jp_equities_v1() {
  OrderAcknowledgementJpEquitiesV1 order_acknowledgement_jp_equities_v1_sent;
  OrderAcknowledgementJpEquitiesV1 order_acknowledgement_jp_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_acknowledgement_jp_equities_v1(order_acknowledgement_jp_equities_v1_sent, 0)
  :: pattern == 1 -> fill_order_acknowledgement_jp_equities_v1(order_acknowledgement_jp_equities_v1_sent, 32)
  :: pattern == 2 -> fill_order_acknowledgement_jp_equities_v1(order_acknowledgement_jp_equities_v1_sent, 255)
  :: else -> ramp_order_acknowledgement_jp_equities_v1(order_acknowledgement_jp_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_acknowledgement_jp_equities_v1(order_acknowledgement_jp_equities_v1_sent);
    assert(at == 104);
    at = 0;
    decode_order_acknowledgement_jp_equities_v1(order_acknowledgement_jp_equities_v1_got);
    assert(at == 104);
    equal_order_acknowledgement_jp_equities_v1(order_acknowledgement_jp_equities_v1_got, order_acknowledgement_jp_equities_v1_sent)
  }
}

/* Order Rejected Jp Equities V 1: encoded, read back, and compared */
proctype check_order_rejected_jp_equities_v1() {
  OrderRejectedJpEquitiesV1 order_rejected_jp_equities_v1_sent;
  OrderRejectedJpEquitiesV1 order_rejected_jp_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_rejected_jp_equities_v1(order_rejected_jp_equities_v1_sent, 0)
  :: pattern == 1 -> fill_order_rejected_jp_equities_v1(order_rejected_jp_equities_v1_sent, 32)
  :: pattern == 2 -> fill_order_rejected_jp_equities_v1(order_rejected_jp_equities_v1_sent, 255)
  :: else -> ramp_order_rejected_jp_equities_v1(order_rejected_jp_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_rejected_jp_equities_v1(order_rejected_jp_equities_v1_sent);
    assert(at == 93);
    at = 0;
    decode_order_rejected_jp_equities_v1(order_rejected_jp_equities_v1_got);
    assert(at == 93);
    equal_order_rejected_jp_equities_v1(order_rejected_jp_equities_v1_got, order_rejected_jp_equities_v1_sent)
  }
}

/* Order Modified Jp Equities V 1: encoded, read back, and compared */
proctype check_order_modified_jp_equities_v1() {
  OrderModifiedJpEquitiesV1 order_modified_jp_equities_v1_sent;
  OrderModifiedJpEquitiesV1 order_modified_jp_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_modified_jp_equities_v1(order_modified_jp_equities_v1_sent, 0)
  :: pattern == 1 -> fill_order_modified_jp_equities_v1(order_modified_jp_equities_v1_sent, 32)
  :: pattern == 2 -> fill_order_modified_jp_equities_v1(order_modified_jp_equities_v1_sent, 255)
  :: else -> ramp_order_modified_jp_equities_v1(order_modified_jp_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_modified_jp_equities_v1(order_modified_jp_equities_v1_sent);
    assert(at == 81);
    at = 0;
    decode_order_modified_jp_equities_v1(order_modified_jp_equities_v1_got);
    assert(at == 81);
    equal_order_modified_jp_equities_v1(order_modified_jp_equities_v1_got, order_modified_jp_equities_v1_sent)
  }
}

/* Modify Rejected Jp Equities V 1: encoded, read back, and compared */
proctype check_modify_rejected_jp_equities_v1() {
  ModifyRejectedJpEquitiesV1 modify_rejected_jp_equities_v1_sent;
  ModifyRejectedJpEquitiesV1 modify_rejected_jp_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_rejected_jp_equities_v1(modify_rejected_jp_equities_v1_sent, 0)
  :: pattern == 1 -> fill_modify_rejected_jp_equities_v1(modify_rejected_jp_equities_v1_sent, 32)
  :: pattern == 2 -> fill_modify_rejected_jp_equities_v1(modify_rejected_jp_equities_v1_sent, 255)
  :: else -> ramp_modify_rejected_jp_equities_v1(modify_rejected_jp_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_rejected_jp_equities_v1(modify_rejected_jp_equities_v1_sent);
    assert(at == 113);
    at = 0;
    decode_modify_rejected_jp_equities_v1(modify_rejected_jp_equities_v1_got);
    assert(at == 113);
    equal_modify_rejected_jp_equities_v1(modify_rejected_jp_equities_v1_got, modify_rejected_jp_equities_v1_sent)
  }
}

/* Order Restated Jp Equities V 1: encoded, read back, and compared */
proctype check_order_restated_jp_equities_v1() {
  OrderRestatedJpEquitiesV1 order_restated_jp_equities_v1_sent;
  OrderRestatedJpEquitiesV1 order_restated_jp_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_restated_jp_equities_v1(order_restated_jp_equities_v1_sent, 0)
  :: pattern == 1 -> fill_order_restated_jp_equities_v1(order_restated_jp_equities_v1_sent, 32)
  :: pattern == 2 -> fill_order_restated_jp_equities_v1(order_restated_jp_equities_v1_sent, 255)
  :: else -> ramp_order_restated_jp_equities_v1(order_restated_jp_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_restated_jp_equities_v1(order_restated_jp_equities_v1_sent);
    assert(at == 78);
    at = 0;
    decode_order_restated_jp_equities_v1(order_restated_jp_equities_v1_got);
    assert(at == 78);
    equal_order_restated_jp_equities_v1(order_restated_jp_equities_v1_got, order_restated_jp_equities_v1_sent)
  }
}

/* Order Execution Jp Equities V 1: encoded, read back, and compared */
proctype check_order_execution_jp_equities_v1() {
  OrderExecutionJpEquitiesV1 order_execution_jp_equities_v1_sent;
  OrderExecutionJpEquitiesV1 order_execution_jp_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_execution_jp_equities_v1(order_execution_jp_equities_v1_sent, 0)
  :: pattern == 1 -> fill_order_execution_jp_equities_v1(order_execution_jp_equities_v1_sent, 32)
  :: pattern == 2 -> fill_order_execution_jp_equities_v1(order_execution_jp_equities_v1_sent, 255)
  :: else -> ramp_order_execution_jp_equities_v1(order_execution_jp_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_execution_jp_equities_v1(order_execution_jp_equities_v1_sent);
    assert(at == 67);
    at = 0;
    decode_order_execution_jp_equities_v1(order_execution_jp_equities_v1_got);
    assert(at == 67);
    equal_order_execution_jp_equities_v1(order_execution_jp_equities_v1_got, order_execution_jp_equities_v1_sent)
  }
}

/* Order Cancelled Jp Equities V 1: encoded, read back, and compared */
proctype check_order_cancelled_jp_equities_v1() {
  OrderCancelledJpEquitiesV1 order_cancelled_jp_equities_v1_sent;
  OrderCancelledJpEquitiesV1 order_cancelled_jp_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancelled_jp_equities_v1(order_cancelled_jp_equities_v1_sent, 0)
  :: pattern == 1 -> fill_order_cancelled_jp_equities_v1(order_cancelled_jp_equities_v1_sent, 32)
  :: pattern == 2 -> fill_order_cancelled_jp_equities_v1(order_cancelled_jp_equities_v1_sent, 255)
  :: else -> ramp_order_cancelled_jp_equities_v1(order_cancelled_jp_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancelled_jp_equities_v1(order_cancelled_jp_equities_v1_sent);
    assert(at == 33);
    at = 0;
    decode_order_cancelled_jp_equities_v1(order_cancelled_jp_equities_v1_got);
    assert(at == 33);
    equal_order_cancelled_jp_equities_v1(order_cancelled_jp_equities_v1_got, order_cancelled_jp_equities_v1_sent)
  }
}

/* Cancel Rejected Jp Equities V 1: encoded, read back, and compared */
proctype check_cancel_rejected_jp_equities_v1() {
  CancelRejectedJpEquitiesV1 cancel_rejected_jp_equities_v1_sent;
  CancelRejectedJpEquitiesV1 cancel_rejected_jp_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_rejected_jp_equities_v1(cancel_rejected_jp_equities_v1_sent, 0)
  :: pattern == 1 -> fill_cancel_rejected_jp_equities_v1(cancel_rejected_jp_equities_v1_sent, 32)
  :: pattern == 2 -> fill_cancel_rejected_jp_equities_v1(cancel_rejected_jp_equities_v1_sent, 255)
  :: else -> ramp_cancel_rejected_jp_equities_v1(cancel_rejected_jp_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_rejected_jp_equities_v1(cancel_rejected_jp_equities_v1_sent);
    assert(at == 93);
    at = 0;
    decode_cancel_rejected_jp_equities_v1(cancel_rejected_jp_equities_v1_got);
    assert(at == 93);
    equal_cancel_rejected_jp_equities_v1(cancel_rejected_jp_equities_v1_got, cancel_rejected_jp_equities_v1_sent)
  }
}

/* Purge Acknowledgement Jp Equities V 1: encoded, read back, and compared */
proctype check_purge_acknowledgement_jp_equities_v1() {
  PurgeAcknowledgementJpEquitiesV1 purge_acknowledgement_jp_equities_v1_sent;
  PurgeAcknowledgementJpEquitiesV1 purge_acknowledgement_jp_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_purge_acknowledgement_jp_equities_v1(purge_acknowledgement_jp_equities_v1_sent, 0)
  :: pattern == 1 -> fill_purge_acknowledgement_jp_equities_v1(purge_acknowledgement_jp_equities_v1_sent, 32)
  :: pattern == 2 -> fill_purge_acknowledgement_jp_equities_v1(purge_acknowledgement_jp_equities_v1_sent, 255)
  :: else -> ramp_purge_acknowledgement_jp_equities_v1(purge_acknowledgement_jp_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_purge_acknowledgement_jp_equities_v1(purge_acknowledgement_jp_equities_v1_sent);
    assert(at == 32);
    at = 0;
    decode_purge_acknowledgement_jp_equities_v1(purge_acknowledgement_jp_equities_v1_got);
    assert(at == 32);
    equal_purge_acknowledgement_jp_equities_v1(purge_acknowledgement_jp_equities_v1_got, purge_acknowledgement_jp_equities_v1_sent)
  }
}

/* Purge Rejected Jp Equities V 1: encoded, read back, and compared */
proctype check_purge_rejected_jp_equities_v1() {
  PurgeRejectedJpEquitiesV1 purge_rejected_jp_equities_v1_sent;
  PurgeRejectedJpEquitiesV1 purge_rejected_jp_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_purge_rejected_jp_equities_v1(purge_rejected_jp_equities_v1_sent, 0)
  :: pattern == 1 -> fill_purge_rejected_jp_equities_v1(purge_rejected_jp_equities_v1_sent, 32)
  :: pattern == 2 -> fill_purge_rejected_jp_equities_v1(purge_rejected_jp_equities_v1_sent, 255)
  :: else -> ramp_purge_rejected_jp_equities_v1(purge_rejected_jp_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_purge_rejected_jp_equities_v1(purge_rejected_jp_equities_v1_sent);
    assert(at == 89);
    at = 0;
    decode_purge_rejected_jp_equities_v1(purge_rejected_jp_equities_v1_got);
    assert(at == 89);
    equal_purge_rejected_jp_equities_v1(purge_rejected_jp_equities_v1_got, purge_rejected_jp_equities_v1_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_exchange_message_header()
  :: run check_logout_response_message()
  :: run check_order_acknowledgement_jp_equities_v1()
  :: run check_order_rejected_jp_equities_v1()
  :: run check_order_modified_jp_equities_v1()
  :: run check_modify_rejected_jp_equities_v1()
  :: run check_order_restated_jp_equities_v1()
  :: run check_order_execution_jp_equities_v1()
  :: run check_order_cancelled_jp_equities_v1()
  :: run check_cancel_rejected_jp_equities_v1()
  :: run check_purge_acknowledgement_jp_equities_v1()
  :: run check_purge_rejected_jp_equities_v1()
  fi
}
