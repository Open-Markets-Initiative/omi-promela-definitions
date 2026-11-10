/*
 * Chicago Board Options Exchange Futures Binary Order Entry
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
#define WIRE 161

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

/* ---- Prevent Match: 3 bytes -------------------------------------------------- */

typedef PreventMatch {
  byte mtp_modifier;
  byte unique_id_level;
  byte trading_group_id
};

/* every byte of Prevent Match set to one value */
inline fill_prevent_match(prevent_match_record, prevent_match_value) {
  prevent_match_record.mtp_modifier = prevent_match_value;
  prevent_match_record.unique_id_level = prevent_match_value;
  prevent_match_record.trading_group_id = prevent_match_value;
  skip
}

/* each byte of Prevent Match set to where it lies, so a field read out of place says so */
inline ramp_prevent_match(prevent_match_record, prevent_match_base) {
  prevent_match_record.mtp_modifier = (prevent_match_base + 0 + 1) % 256;
  prevent_match_record.unique_id_level = (prevent_match_base + 1 + 1) % 256;
  prevent_match_record.trading_group_id = (prevent_match_base + 2 + 1) % 256;
  skip
}

/* Prevent Match to the wire, 3 bytes from where the cursor stands */
inline encode_prevent_match(prevent_match_record) {
  wire[at] = prevent_match_record.mtp_modifier; at = at + 1;
  wire[at] = prevent_match_record.unique_id_level; at = at + 1;
  wire[at] = prevent_match_record.trading_group_id; at = at + 1;
  skip
}

/* Prevent Match off the wire, 3 bytes from where the cursor stands */
inline decode_prevent_match(prevent_match_record) {
  prevent_match_record.mtp_modifier = wire[at]; at = at + 1;
  prevent_match_record.unique_id_level = wire[at]; at = at + 1;
  prevent_match_record.trading_group_id = wire[at]; at = at + 1;
  skip
}

/* what was read of Prevent Match is what was written, byte for byte */
inline equal_prevent_match(prevent_match_read, prevent_match_written) {
  assert(prevent_match_read.mtp_modifier == prevent_match_written.mtp_modifier);
  assert(prevent_match_read.unique_id_level == prevent_match_written.unique_id_level);
  assert(prevent_match_read.trading_group_id == prevent_match_written.trading_group_id);
  skip
}

/* ---- Order Acknowledgement: 161 bytes ---------------------------------------- */

/* Order Acknowledgement messages are sent in response to a new order message */
typedef OrderAcknowledgement {
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte order_id[8];
  byte side;
  byte price[8];
  byte ord_type;
  byte time_in_force;
  byte min_qty[4];
  byte symbol[8];
  byte capacity;
  byte account[16];
  byte clearing_firm[4];
  byte clearing_account[4];
  byte order_qty[4];
  PreventMatch prevent_match;
  byte maturity_date[4];
  byte open_close;
  byte leaves_qty[4];
  byte base_liquidity_indicator;
  byte expire_time[8];
  byte sub_liquidity_indicator;
  byte stop_px[8];
  byte cmta_number[4];
  byte cti_code;
  byte manual_order_indicator;
  byte oeo_id[18];
  byte cum_qty[4];
  byte frequent_trader_id[6];
  byte cust_order_handling_inst;
  byte request_received_time[8]
};

int order_acknowledgement_at;

/* every byte of Order Acknowledgement set to one value */
inline fill_order_acknowledgement(order_acknowledgement_record, order_acknowledgement_value) {
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.transaction_time[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 20 -> order_acknowledgement_record.cl_ord_id[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.order_id[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.side = order_acknowledgement_value;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.price[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.ord_type = order_acknowledgement_value;
  order_acknowledgement_record.time_in_force = order_acknowledgement_value;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.min_qty[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.symbol[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.capacity = order_acknowledgement_value;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 16 -> order_acknowledgement_record.account[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.clearing_firm[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.clearing_account[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.order_qty[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  fill_prevent_match(order_acknowledgement_record.prevent_match, order_acknowledgement_value);
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.maturity_date[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.open_close = order_acknowledgement_value;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.leaves_qty[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.base_liquidity_indicator = order_acknowledgement_value;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.expire_time[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.sub_liquidity_indicator = order_acknowledgement_value;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.stop_px[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.cmta_number[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.cti_code = order_acknowledgement_value;
  order_acknowledgement_record.manual_order_indicator = order_acknowledgement_value;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 18 -> order_acknowledgement_record.oeo_id[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.cum_qty[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 6 -> order_acknowledgement_record.frequent_trader_id[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.cust_order_handling_inst = order_acknowledgement_value;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.request_received_time[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Acknowledgement set to where it lies, so a field read out of place says so */
inline ramp_order_acknowledgement(order_acknowledgement_record, order_acknowledgement_base) {
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.transaction_time[order_acknowledgement_at] = (order_acknowledgement_base + 0 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 20 -> order_acknowledgement_record.cl_ord_id[order_acknowledgement_at] = (order_acknowledgement_base + 8 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.order_id[order_acknowledgement_at] = (order_acknowledgement_base + 28 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.side = (order_acknowledgement_base + 36 + 1) % 256;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.price[order_acknowledgement_at] = (order_acknowledgement_base + 37 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.ord_type = (order_acknowledgement_base + 45 + 1) % 256;
  order_acknowledgement_record.time_in_force = (order_acknowledgement_base + 46 + 1) % 256;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.min_qty[order_acknowledgement_at] = (order_acknowledgement_base + 47 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.symbol[order_acknowledgement_at] = (order_acknowledgement_base + 51 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.capacity = (order_acknowledgement_base + 59 + 1) % 256;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 16 -> order_acknowledgement_record.account[order_acknowledgement_at] = (order_acknowledgement_base + 60 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.clearing_firm[order_acknowledgement_at] = (order_acknowledgement_base + 76 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.clearing_account[order_acknowledgement_at] = (order_acknowledgement_base + 80 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.order_qty[order_acknowledgement_at] = (order_acknowledgement_base + 84 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  ramp_prevent_match(order_acknowledgement_record.prevent_match, order_acknowledgement_base + 88);
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.maturity_date[order_acknowledgement_at] = (order_acknowledgement_base + 91 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.open_close = (order_acknowledgement_base + 95 + 1) % 256;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.leaves_qty[order_acknowledgement_at] = (order_acknowledgement_base + 96 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.base_liquidity_indicator = (order_acknowledgement_base + 100 + 1) % 256;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.expire_time[order_acknowledgement_at] = (order_acknowledgement_base + 101 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.sub_liquidity_indicator = (order_acknowledgement_base + 109 + 1) % 256;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.stop_px[order_acknowledgement_at] = (order_acknowledgement_base + 110 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.cmta_number[order_acknowledgement_at] = (order_acknowledgement_base + 118 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.cti_code = (order_acknowledgement_base + 122 + 1) % 256;
  order_acknowledgement_record.manual_order_indicator = (order_acknowledgement_base + 123 + 1) % 256;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 18 -> order_acknowledgement_record.oeo_id[order_acknowledgement_at] = (order_acknowledgement_base + 124 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.cum_qty[order_acknowledgement_at] = (order_acknowledgement_base + 142 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 6 -> order_acknowledgement_record.frequent_trader_id[order_acknowledgement_at] = (order_acknowledgement_base + 146 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.cust_order_handling_inst = (order_acknowledgement_base + 152 + 1) % 256;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.request_received_time[order_acknowledgement_at] = (order_acknowledgement_base + 153 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Order Acknowledgement to the wire, 161 bytes from where the cursor stands */
inline encode_order_acknowledgement(order_acknowledgement_record) {
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> wire[at] = order_acknowledgement_record.transaction_time[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 20 -> wire[at] = order_acknowledgement_record.cl_ord_id[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> wire[at] = order_acknowledgement_record.order_id[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_record.side; at = at + 1;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> wire[at] = order_acknowledgement_record.price[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_record.ord_type; at = at + 1;
  wire[at] = order_acknowledgement_record.time_in_force; at = at + 1;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> wire[at] = order_acknowledgement_record.min_qty[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> wire[at] = order_acknowledgement_record.symbol[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_record.capacity; at = at + 1;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 16 -> wire[at] = order_acknowledgement_record.account[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> wire[at] = order_acknowledgement_record.clearing_firm[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> wire[at] = order_acknowledgement_record.clearing_account[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> wire[at] = order_acknowledgement_record.order_qty[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  encode_prevent_match(order_acknowledgement_record.prevent_match);
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> wire[at] = order_acknowledgement_record.maturity_date[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_record.open_close; at = at + 1;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> wire[at] = order_acknowledgement_record.leaves_qty[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_record.base_liquidity_indicator; at = at + 1;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> wire[at] = order_acknowledgement_record.expire_time[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_record.sub_liquidity_indicator; at = at + 1;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> wire[at] = order_acknowledgement_record.stop_px[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> wire[at] = order_acknowledgement_record.cmta_number[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_record.cti_code; at = at + 1;
  wire[at] = order_acknowledgement_record.manual_order_indicator; at = at + 1;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 18 -> wire[at] = order_acknowledgement_record.oeo_id[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> wire[at] = order_acknowledgement_record.cum_qty[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 6 -> wire[at] = order_acknowledgement_record.frequent_trader_id[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_record.cust_order_handling_inst; at = at + 1;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> wire[at] = order_acknowledgement_record.request_received_time[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Order Acknowledgement off the wire, 161 bytes from where the cursor stands */
inline decode_order_acknowledgement(order_acknowledgement_record) {
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.transaction_time[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 20 -> order_acknowledgement_record.cl_ord_id[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.order_id[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.side = wire[at]; at = at + 1;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.price[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.ord_type = wire[at]; at = at + 1;
  order_acknowledgement_record.time_in_force = wire[at]; at = at + 1;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.min_qty[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.symbol[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.capacity = wire[at]; at = at + 1;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 16 -> order_acknowledgement_record.account[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.clearing_firm[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.clearing_account[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.order_qty[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  decode_prevent_match(order_acknowledgement_record.prevent_match);
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.maturity_date[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.open_close = wire[at]; at = at + 1;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.leaves_qty[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.base_liquidity_indicator = wire[at]; at = at + 1;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.expire_time[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.sub_liquidity_indicator = wire[at]; at = at + 1;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.stop_px[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.cmta_number[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.cti_code = wire[at]; at = at + 1;
  order_acknowledgement_record.manual_order_indicator = wire[at]; at = at + 1;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 18 -> order_acknowledgement_record.oeo_id[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.cum_qty[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 6 -> order_acknowledgement_record.frequent_trader_id[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.cust_order_handling_inst = wire[at]; at = at + 1;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.request_received_time[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Acknowledgement is what was written, byte for byte */
inline equal_order_acknowledgement(order_acknowledgement_read, order_acknowledgement_written) {
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> assert(order_acknowledgement_read.transaction_time[order_acknowledgement_at] == order_acknowledgement_written.transaction_time[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 20 -> assert(order_acknowledgement_read.cl_ord_id[order_acknowledgement_at] == order_acknowledgement_written.cl_ord_id[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> assert(order_acknowledgement_read.order_id[order_acknowledgement_at] == order_acknowledgement_written.order_id[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_read.side == order_acknowledgement_written.side);
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> assert(order_acknowledgement_read.price[order_acknowledgement_at] == order_acknowledgement_written.price[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_read.ord_type == order_acknowledgement_written.ord_type);
  assert(order_acknowledgement_read.time_in_force == order_acknowledgement_written.time_in_force);
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> assert(order_acknowledgement_read.min_qty[order_acknowledgement_at] == order_acknowledgement_written.min_qty[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> assert(order_acknowledgement_read.symbol[order_acknowledgement_at] == order_acknowledgement_written.symbol[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_read.capacity == order_acknowledgement_written.capacity);
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 16 -> assert(order_acknowledgement_read.account[order_acknowledgement_at] == order_acknowledgement_written.account[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> assert(order_acknowledgement_read.clearing_firm[order_acknowledgement_at] == order_acknowledgement_written.clearing_firm[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> assert(order_acknowledgement_read.clearing_account[order_acknowledgement_at] == order_acknowledgement_written.clearing_account[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> assert(order_acknowledgement_read.order_qty[order_acknowledgement_at] == order_acknowledgement_written.order_qty[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  equal_prevent_match(order_acknowledgement_read.prevent_match, order_acknowledgement_written.prevent_match);
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> assert(order_acknowledgement_read.maturity_date[order_acknowledgement_at] == order_acknowledgement_written.maturity_date[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_read.open_close == order_acknowledgement_written.open_close);
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> assert(order_acknowledgement_read.leaves_qty[order_acknowledgement_at] == order_acknowledgement_written.leaves_qty[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_read.base_liquidity_indicator == order_acknowledgement_written.base_liquidity_indicator);
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> assert(order_acknowledgement_read.expire_time[order_acknowledgement_at] == order_acknowledgement_written.expire_time[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_read.sub_liquidity_indicator == order_acknowledgement_written.sub_liquidity_indicator);
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> assert(order_acknowledgement_read.stop_px[order_acknowledgement_at] == order_acknowledgement_written.stop_px[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> assert(order_acknowledgement_read.cmta_number[order_acknowledgement_at] == order_acknowledgement_written.cmta_number[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_read.cti_code == order_acknowledgement_written.cti_code);
  assert(order_acknowledgement_read.manual_order_indicator == order_acknowledgement_written.manual_order_indicator);
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 18 -> assert(order_acknowledgement_read.oeo_id[order_acknowledgement_at] == order_acknowledgement_written.oeo_id[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> assert(order_acknowledgement_read.cum_qty[order_acknowledgement_at] == order_acknowledgement_written.cum_qty[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 6 -> assert(order_acknowledgement_read.frequent_trader_id[order_acknowledgement_at] == order_acknowledgement_written.frequent_trader_id[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_read.cust_order_handling_inst == order_acknowledgement_written.cust_order_handling_inst);
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> assert(order_acknowledgement_read.request_received_time[order_acknowledgement_at] == order_acknowledgement_written.request_received_time[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Rejected: 93 bytes ------------------------------------------------ */

/* Order Rejected messages are sent in response to a New Order which must be rejected */
typedef OrderRejected {
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte clearing_firm[4];
  byte order_reject_reason;
  byte text[60]
};

int order_rejected_at;

/* every byte of Order Rejected set to one value */
inline fill_order_rejected(order_rejected_record, order_rejected_value) {
  order_rejected_at = 0;
  do
  :: order_rejected_at < 8 -> order_rejected_record.transaction_time[order_rejected_at] = order_rejected_value; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  order_rejected_at = 0;
  do
  :: order_rejected_at < 20 -> order_rejected_record.cl_ord_id[order_rejected_at] = order_rejected_value; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  order_rejected_at = 0;
  do
  :: order_rejected_at < 4 -> order_rejected_record.clearing_firm[order_rejected_at] = order_rejected_value; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  order_rejected_record.order_reject_reason = order_rejected_value;
  order_rejected_at = 0;
  do
  :: order_rejected_at < 60 -> order_rejected_record.text[order_rejected_at] = order_rejected_value; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Rejected set to where it lies, so a field read out of place says so */
inline ramp_order_rejected(order_rejected_record, order_rejected_base) {
  order_rejected_at = 0;
  do
  :: order_rejected_at < 8 -> order_rejected_record.transaction_time[order_rejected_at] = (order_rejected_base + 0 + order_rejected_at + 1) % 256; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  order_rejected_at = 0;
  do
  :: order_rejected_at < 20 -> order_rejected_record.cl_ord_id[order_rejected_at] = (order_rejected_base + 8 + order_rejected_at + 1) % 256; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  order_rejected_at = 0;
  do
  :: order_rejected_at < 4 -> order_rejected_record.clearing_firm[order_rejected_at] = (order_rejected_base + 28 + order_rejected_at + 1) % 256; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  order_rejected_record.order_reject_reason = (order_rejected_base + 32 + 1) % 256;
  order_rejected_at = 0;
  do
  :: order_rejected_at < 60 -> order_rejected_record.text[order_rejected_at] = (order_rejected_base + 33 + order_rejected_at + 1) % 256; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* Order Rejected to the wire, 93 bytes from where the cursor stands */
inline encode_order_rejected(order_rejected_record) {
  order_rejected_at = 0;
  do
  :: order_rejected_at < 8 -> wire[at] = order_rejected_record.transaction_time[order_rejected_at]; at = at + 1; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  order_rejected_at = 0;
  do
  :: order_rejected_at < 20 -> wire[at] = order_rejected_record.cl_ord_id[order_rejected_at]; at = at + 1; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  order_rejected_at = 0;
  do
  :: order_rejected_at < 4 -> wire[at] = order_rejected_record.clearing_firm[order_rejected_at]; at = at + 1; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  wire[at] = order_rejected_record.order_reject_reason; at = at + 1;
  order_rejected_at = 0;
  do
  :: order_rejected_at < 60 -> wire[at] = order_rejected_record.text[order_rejected_at]; at = at + 1; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* Order Rejected off the wire, 93 bytes from where the cursor stands */
inline decode_order_rejected(order_rejected_record) {
  order_rejected_at = 0;
  do
  :: order_rejected_at < 8 -> order_rejected_record.transaction_time[order_rejected_at] = wire[at]; at = at + 1; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  order_rejected_at = 0;
  do
  :: order_rejected_at < 20 -> order_rejected_record.cl_ord_id[order_rejected_at] = wire[at]; at = at + 1; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  order_rejected_at = 0;
  do
  :: order_rejected_at < 4 -> order_rejected_record.clearing_firm[order_rejected_at] = wire[at]; at = at + 1; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  order_rejected_record.order_reject_reason = wire[at]; at = at + 1;
  order_rejected_at = 0;
  do
  :: order_rejected_at < 60 -> order_rejected_record.text[order_rejected_at] = wire[at]; at = at + 1; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Rejected is what was written, byte for byte */
inline equal_order_rejected(order_rejected_read, order_rejected_written) {
  order_rejected_at = 0;
  do
  :: order_rejected_at < 8 -> assert(order_rejected_read.transaction_time[order_rejected_at] == order_rejected_written.transaction_time[order_rejected_at]); order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  order_rejected_at = 0;
  do
  :: order_rejected_at < 20 -> assert(order_rejected_read.cl_ord_id[order_rejected_at] == order_rejected_written.cl_ord_id[order_rejected_at]); order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  order_rejected_at = 0;
  do
  :: order_rejected_at < 4 -> assert(order_rejected_read.clearing_firm[order_rejected_at] == order_rejected_written.clearing_firm[order_rejected_at]); order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  assert(order_rejected_read.order_reject_reason == order_rejected_written.order_reject_reason);
  order_rejected_at = 0;
  do
  :: order_rejected_at < 60 -> assert(order_rejected_read.text[order_rejected_at] == order_rejected_written.text[order_rejected_at]); order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Modified: 101 bytes ----------------------------------------------- */

/* Order Modified messages are sent in response to a Modify Order to indicate that the orderhas been successfully modified */
typedef OrderModified {
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte orig_cl_ord_id[20];
  byte order_id[8];
  byte clearing_firm[4];
  byte price[8];
  byte ord_type;
  byte order_qty[4];
  byte leaves_qty[4];
  byte base_liquidity_indicator;
  byte stop_px[8];
  byte frequent_trader_id[6];
  byte cust_order_handling_inst;
  byte request_received_time[8]
};

int order_modified_at;

/* every byte of Order Modified set to one value */
inline fill_order_modified(order_modified_record, order_modified_value) {
  order_modified_at = 0;
  do
  :: order_modified_at < 8 -> order_modified_record.transaction_time[order_modified_at] = order_modified_value; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 20 -> order_modified_record.cl_ord_id[order_modified_at] = order_modified_value; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 20 -> order_modified_record.orig_cl_ord_id[order_modified_at] = order_modified_value; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 8 -> order_modified_record.order_id[order_modified_at] = order_modified_value; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 4 -> order_modified_record.clearing_firm[order_modified_at] = order_modified_value; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 8 -> order_modified_record.price[order_modified_at] = order_modified_value; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_record.ord_type = order_modified_value;
  order_modified_at = 0;
  do
  :: order_modified_at < 4 -> order_modified_record.order_qty[order_modified_at] = order_modified_value; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 4 -> order_modified_record.leaves_qty[order_modified_at] = order_modified_value; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_record.base_liquidity_indicator = order_modified_value;
  order_modified_at = 0;
  do
  :: order_modified_at < 8 -> order_modified_record.stop_px[order_modified_at] = order_modified_value; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 6 -> order_modified_record.frequent_trader_id[order_modified_at] = order_modified_value; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_record.cust_order_handling_inst = order_modified_value;
  order_modified_at = 0;
  do
  :: order_modified_at < 8 -> order_modified_record.request_received_time[order_modified_at] = order_modified_value; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Modified set to where it lies, so a field read out of place says so */
inline ramp_order_modified(order_modified_record, order_modified_base) {
  order_modified_at = 0;
  do
  :: order_modified_at < 8 -> order_modified_record.transaction_time[order_modified_at] = (order_modified_base + 0 + order_modified_at + 1) % 256; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 20 -> order_modified_record.cl_ord_id[order_modified_at] = (order_modified_base + 8 + order_modified_at + 1) % 256; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 20 -> order_modified_record.orig_cl_ord_id[order_modified_at] = (order_modified_base + 28 + order_modified_at + 1) % 256; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 8 -> order_modified_record.order_id[order_modified_at] = (order_modified_base + 48 + order_modified_at + 1) % 256; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 4 -> order_modified_record.clearing_firm[order_modified_at] = (order_modified_base + 56 + order_modified_at + 1) % 256; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 8 -> order_modified_record.price[order_modified_at] = (order_modified_base + 60 + order_modified_at + 1) % 256; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_record.ord_type = (order_modified_base + 68 + 1) % 256;
  order_modified_at = 0;
  do
  :: order_modified_at < 4 -> order_modified_record.order_qty[order_modified_at] = (order_modified_base + 69 + order_modified_at + 1) % 256; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 4 -> order_modified_record.leaves_qty[order_modified_at] = (order_modified_base + 73 + order_modified_at + 1) % 256; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_record.base_liquidity_indicator = (order_modified_base + 77 + 1) % 256;
  order_modified_at = 0;
  do
  :: order_modified_at < 8 -> order_modified_record.stop_px[order_modified_at] = (order_modified_base + 78 + order_modified_at + 1) % 256; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 6 -> order_modified_record.frequent_trader_id[order_modified_at] = (order_modified_base + 86 + order_modified_at + 1) % 256; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_record.cust_order_handling_inst = (order_modified_base + 92 + 1) % 256;
  order_modified_at = 0;
  do
  :: order_modified_at < 8 -> order_modified_record.request_received_time[order_modified_at] = (order_modified_base + 93 + order_modified_at + 1) % 256; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modified to the wire, 101 bytes from where the cursor stands */
inline encode_order_modified(order_modified_record) {
  order_modified_at = 0;
  do
  :: order_modified_at < 8 -> wire[at] = order_modified_record.transaction_time[order_modified_at]; at = at + 1; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 20 -> wire[at] = order_modified_record.cl_ord_id[order_modified_at]; at = at + 1; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 20 -> wire[at] = order_modified_record.orig_cl_ord_id[order_modified_at]; at = at + 1; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 8 -> wire[at] = order_modified_record.order_id[order_modified_at]; at = at + 1; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 4 -> wire[at] = order_modified_record.clearing_firm[order_modified_at]; at = at + 1; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 8 -> wire[at] = order_modified_record.price[order_modified_at]; at = at + 1; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  wire[at] = order_modified_record.ord_type; at = at + 1;
  order_modified_at = 0;
  do
  :: order_modified_at < 4 -> wire[at] = order_modified_record.order_qty[order_modified_at]; at = at + 1; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 4 -> wire[at] = order_modified_record.leaves_qty[order_modified_at]; at = at + 1; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  wire[at] = order_modified_record.base_liquidity_indicator; at = at + 1;
  order_modified_at = 0;
  do
  :: order_modified_at < 8 -> wire[at] = order_modified_record.stop_px[order_modified_at]; at = at + 1; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 6 -> wire[at] = order_modified_record.frequent_trader_id[order_modified_at]; at = at + 1; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  wire[at] = order_modified_record.cust_order_handling_inst; at = at + 1;
  order_modified_at = 0;
  do
  :: order_modified_at < 8 -> wire[at] = order_modified_record.request_received_time[order_modified_at]; at = at + 1; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modified off the wire, 101 bytes from where the cursor stands */
inline decode_order_modified(order_modified_record) {
  order_modified_at = 0;
  do
  :: order_modified_at < 8 -> order_modified_record.transaction_time[order_modified_at] = wire[at]; at = at + 1; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 20 -> order_modified_record.cl_ord_id[order_modified_at] = wire[at]; at = at + 1; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 20 -> order_modified_record.orig_cl_ord_id[order_modified_at] = wire[at]; at = at + 1; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 8 -> order_modified_record.order_id[order_modified_at] = wire[at]; at = at + 1; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 4 -> order_modified_record.clearing_firm[order_modified_at] = wire[at]; at = at + 1; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 8 -> order_modified_record.price[order_modified_at] = wire[at]; at = at + 1; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_record.ord_type = wire[at]; at = at + 1;
  order_modified_at = 0;
  do
  :: order_modified_at < 4 -> order_modified_record.order_qty[order_modified_at] = wire[at]; at = at + 1; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 4 -> order_modified_record.leaves_qty[order_modified_at] = wire[at]; at = at + 1; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_record.base_liquidity_indicator = wire[at]; at = at + 1;
  order_modified_at = 0;
  do
  :: order_modified_at < 8 -> order_modified_record.stop_px[order_modified_at] = wire[at]; at = at + 1; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 6 -> order_modified_record.frequent_trader_id[order_modified_at] = wire[at]; at = at + 1; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_record.cust_order_handling_inst = wire[at]; at = at + 1;
  order_modified_at = 0;
  do
  :: order_modified_at < 8 -> order_modified_record.request_received_time[order_modified_at] = wire[at]; at = at + 1; order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Modified is what was written, byte for byte */
inline equal_order_modified(order_modified_read, order_modified_written) {
  order_modified_at = 0;
  do
  :: order_modified_at < 8 -> assert(order_modified_read.transaction_time[order_modified_at] == order_modified_written.transaction_time[order_modified_at]); order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 20 -> assert(order_modified_read.cl_ord_id[order_modified_at] == order_modified_written.cl_ord_id[order_modified_at]); order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 20 -> assert(order_modified_read.orig_cl_ord_id[order_modified_at] == order_modified_written.orig_cl_ord_id[order_modified_at]); order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 8 -> assert(order_modified_read.order_id[order_modified_at] == order_modified_written.order_id[order_modified_at]); order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 4 -> assert(order_modified_read.clearing_firm[order_modified_at] == order_modified_written.clearing_firm[order_modified_at]); order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 8 -> assert(order_modified_read.price[order_modified_at] == order_modified_written.price[order_modified_at]); order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  assert(order_modified_read.ord_type == order_modified_written.ord_type);
  order_modified_at = 0;
  do
  :: order_modified_at < 4 -> assert(order_modified_read.order_qty[order_modified_at] == order_modified_written.order_qty[order_modified_at]); order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 4 -> assert(order_modified_read.leaves_qty[order_modified_at] == order_modified_written.leaves_qty[order_modified_at]); order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  assert(order_modified_read.base_liquidity_indicator == order_modified_written.base_liquidity_indicator);
  order_modified_at = 0;
  do
  :: order_modified_at < 8 -> assert(order_modified_read.stop_px[order_modified_at] == order_modified_written.stop_px[order_modified_at]); order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  order_modified_at = 0;
  do
  :: order_modified_at < 6 -> assert(order_modified_read.frequent_trader_id[order_modified_at] == order_modified_written.frequent_trader_id[order_modified_at]); order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  assert(order_modified_read.cust_order_handling_inst == order_modified_written.cust_order_handling_inst);
  order_modified_at = 0;
  do
  :: order_modified_at < 8 -> assert(order_modified_read.request_received_time[order_modified_at] == order_modified_written.request_received_time[order_modified_at]); order_modified_at = order_modified_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Rejected: 113 bytes ---------------------------------------------- */

/* Modify Rejected messages are sent in response to a Modify Order for an order which cannot be modified */
typedef ModifyRejected {
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte orig_cl_ord_id[20];
  byte clearing_firm[4];
  byte modify_reject_reason;
  byte text[60]
};

int modify_rejected_at;

/* every byte of Modify Rejected set to one value */
inline fill_modify_rejected(modify_rejected_record, modify_rejected_value) {
  modify_rejected_at = 0;
  do
  :: modify_rejected_at < 8 -> modify_rejected_record.transaction_time[modify_rejected_at] = modify_rejected_value; modify_rejected_at = modify_rejected_at + 1
  :: else -> break
  od;
  modify_rejected_at = 0;
  do
  :: modify_rejected_at < 20 -> modify_rejected_record.cl_ord_id[modify_rejected_at] = modify_rejected_value; modify_rejected_at = modify_rejected_at + 1
  :: else -> break
  od;
  modify_rejected_at = 0;
  do
  :: modify_rejected_at < 20 -> modify_rejected_record.orig_cl_ord_id[modify_rejected_at] = modify_rejected_value; modify_rejected_at = modify_rejected_at + 1
  :: else -> break
  od;
  modify_rejected_at = 0;
  do
  :: modify_rejected_at < 4 -> modify_rejected_record.clearing_firm[modify_rejected_at] = modify_rejected_value; modify_rejected_at = modify_rejected_at + 1
  :: else -> break
  od;
  modify_rejected_record.modify_reject_reason = modify_rejected_value;
  modify_rejected_at = 0;
  do
  :: modify_rejected_at < 60 -> modify_rejected_record.text[modify_rejected_at] = modify_rejected_value; modify_rejected_at = modify_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Modify Rejected set to where it lies, so a field read out of place says so */
inline ramp_modify_rejected(modify_rejected_record, modify_rejected_base) {
  modify_rejected_at = 0;
  do
  :: modify_rejected_at < 8 -> modify_rejected_record.transaction_time[modify_rejected_at] = (modify_rejected_base + 0 + modify_rejected_at + 1) % 256; modify_rejected_at = modify_rejected_at + 1
  :: else -> break
  od;
  modify_rejected_at = 0;
  do
  :: modify_rejected_at < 20 -> modify_rejected_record.cl_ord_id[modify_rejected_at] = (modify_rejected_base + 8 + modify_rejected_at + 1) % 256; modify_rejected_at = modify_rejected_at + 1
  :: else -> break
  od;
  modify_rejected_at = 0;
  do
  :: modify_rejected_at < 20 -> modify_rejected_record.orig_cl_ord_id[modify_rejected_at] = (modify_rejected_base + 28 + modify_rejected_at + 1) % 256; modify_rejected_at = modify_rejected_at + 1
  :: else -> break
  od;
  modify_rejected_at = 0;
  do
  :: modify_rejected_at < 4 -> modify_rejected_record.clearing_firm[modify_rejected_at] = (modify_rejected_base + 48 + modify_rejected_at + 1) % 256; modify_rejected_at = modify_rejected_at + 1
  :: else -> break
  od;
  modify_rejected_record.modify_reject_reason = (modify_rejected_base + 52 + 1) % 256;
  modify_rejected_at = 0;
  do
  :: modify_rejected_at < 60 -> modify_rejected_record.text[modify_rejected_at] = (modify_rejected_base + 53 + modify_rejected_at + 1) % 256; modify_rejected_at = modify_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Rejected to the wire, 113 bytes from where the cursor stands */
inline encode_modify_rejected(modify_rejected_record) {
  modify_rejected_at = 0;
  do
  :: modify_rejected_at < 8 -> wire[at] = modify_rejected_record.transaction_time[modify_rejected_at]; at = at + 1; modify_rejected_at = modify_rejected_at + 1
  :: else -> break
  od;
  modify_rejected_at = 0;
  do
  :: modify_rejected_at < 20 -> wire[at] = modify_rejected_record.cl_ord_id[modify_rejected_at]; at = at + 1; modify_rejected_at = modify_rejected_at + 1
  :: else -> break
  od;
  modify_rejected_at = 0;
  do
  :: modify_rejected_at < 20 -> wire[at] = modify_rejected_record.orig_cl_ord_id[modify_rejected_at]; at = at + 1; modify_rejected_at = modify_rejected_at + 1
  :: else -> break
  od;
  modify_rejected_at = 0;
  do
  :: modify_rejected_at < 4 -> wire[at] = modify_rejected_record.clearing_firm[modify_rejected_at]; at = at + 1; modify_rejected_at = modify_rejected_at + 1
  :: else -> break
  od;
  wire[at] = modify_rejected_record.modify_reject_reason; at = at + 1;
  modify_rejected_at = 0;
  do
  :: modify_rejected_at < 60 -> wire[at] = modify_rejected_record.text[modify_rejected_at]; at = at + 1; modify_rejected_at = modify_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Rejected off the wire, 113 bytes from where the cursor stands */
inline decode_modify_rejected(modify_rejected_record) {
  modify_rejected_at = 0;
  do
  :: modify_rejected_at < 8 -> modify_rejected_record.transaction_time[modify_rejected_at] = wire[at]; at = at + 1; modify_rejected_at = modify_rejected_at + 1
  :: else -> break
  od;
  modify_rejected_at = 0;
  do
  :: modify_rejected_at < 20 -> modify_rejected_record.cl_ord_id[modify_rejected_at] = wire[at]; at = at + 1; modify_rejected_at = modify_rejected_at + 1
  :: else -> break
  od;
  modify_rejected_at = 0;
  do
  :: modify_rejected_at < 20 -> modify_rejected_record.orig_cl_ord_id[modify_rejected_at] = wire[at]; at = at + 1; modify_rejected_at = modify_rejected_at + 1
  :: else -> break
  od;
  modify_rejected_at = 0;
  do
  :: modify_rejected_at < 4 -> modify_rejected_record.clearing_firm[modify_rejected_at] = wire[at]; at = at + 1; modify_rejected_at = modify_rejected_at + 1
  :: else -> break
  od;
  modify_rejected_record.modify_reject_reason = wire[at]; at = at + 1;
  modify_rejected_at = 0;
  do
  :: modify_rejected_at < 60 -> modify_rejected_record.text[modify_rejected_at] = wire[at]; at = at + 1; modify_rejected_at = modify_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Modify Rejected is what was written, byte for byte */
inline equal_modify_rejected(modify_rejected_read, modify_rejected_written) {
  modify_rejected_at = 0;
  do
  :: modify_rejected_at < 8 -> assert(modify_rejected_read.transaction_time[modify_rejected_at] == modify_rejected_written.transaction_time[modify_rejected_at]); modify_rejected_at = modify_rejected_at + 1
  :: else -> break
  od;
  modify_rejected_at = 0;
  do
  :: modify_rejected_at < 20 -> assert(modify_rejected_read.cl_ord_id[modify_rejected_at] == modify_rejected_written.cl_ord_id[modify_rejected_at]); modify_rejected_at = modify_rejected_at + 1
  :: else -> break
  od;
  modify_rejected_at = 0;
  do
  :: modify_rejected_at < 20 -> assert(modify_rejected_read.orig_cl_ord_id[modify_rejected_at] == modify_rejected_written.orig_cl_ord_id[modify_rejected_at]); modify_rejected_at = modify_rejected_at + 1
  :: else -> break
  od;
  modify_rejected_at = 0;
  do
  :: modify_rejected_at < 4 -> assert(modify_rejected_read.clearing_firm[modify_rejected_at] == modify_rejected_written.clearing_firm[modify_rejected_at]); modify_rejected_at = modify_rejected_at + 1
  :: else -> break
  od;
  assert(modify_rejected_read.modify_reject_reason == modify_rejected_written.modify_reject_reason);
  modify_rejected_at = 0;
  do
  :: modify_rejected_at < 60 -> assert(modify_rejected_read.text[modify_rejected_at] == modify_rejected_written.text[modify_rejected_at]); modify_rejected_at = modify_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Execution: 91 bytes ----------------------------------------------- */

/* AnOrder Executionis sent for each fill on an order */
typedef OrderExecution {
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte exec_id[8];
  byte last_shares[4];
  byte last_px[8];
  byte leaves_qty[4];
  byte base_liquidity_indicator;
  byte sub_liquidity_indicator;
  byte side;
  byte symbol[8];
  byte clearing_firm[4];
  byte maturity_date[4];
  byte fee_code[2];
  byte trade_date[4];
  byte clearing_size[4];
  byte pending_status;
  byte multileg_reporting_type;
  byte secondary_exec_id[8]
};

int order_execution_at;

/* every byte of Order Execution set to one value */
inline fill_order_execution(order_execution_record, order_execution_value) {
  order_execution_at = 0;
  do
  :: order_execution_at < 8 -> order_execution_record.transaction_time[order_execution_at] = order_execution_value; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 20 -> order_execution_record.cl_ord_id[order_execution_at] = order_execution_value; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 8 -> order_execution_record.exec_id[order_execution_at] = order_execution_value; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> order_execution_record.last_shares[order_execution_at] = order_execution_value; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 8 -> order_execution_record.last_px[order_execution_at] = order_execution_value; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> order_execution_record.leaves_qty[order_execution_at] = order_execution_value; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_record.base_liquidity_indicator = order_execution_value;
  order_execution_record.sub_liquidity_indicator = order_execution_value;
  order_execution_record.side = order_execution_value;
  order_execution_at = 0;
  do
  :: order_execution_at < 8 -> order_execution_record.symbol[order_execution_at] = order_execution_value; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> order_execution_record.clearing_firm[order_execution_at] = order_execution_value; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> order_execution_record.maturity_date[order_execution_at] = order_execution_value; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 2 -> order_execution_record.fee_code[order_execution_at] = order_execution_value; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> order_execution_record.trade_date[order_execution_at] = order_execution_value; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> order_execution_record.clearing_size[order_execution_at] = order_execution_value; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_record.pending_status = order_execution_value;
  order_execution_record.multileg_reporting_type = order_execution_value;
  order_execution_at = 0;
  do
  :: order_execution_at < 8 -> order_execution_record.secondary_exec_id[order_execution_at] = order_execution_value; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Execution set to where it lies, so a field read out of place says so */
inline ramp_order_execution(order_execution_record, order_execution_base) {
  order_execution_at = 0;
  do
  :: order_execution_at < 8 -> order_execution_record.transaction_time[order_execution_at] = (order_execution_base + 0 + order_execution_at + 1) % 256; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 20 -> order_execution_record.cl_ord_id[order_execution_at] = (order_execution_base + 8 + order_execution_at + 1) % 256; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 8 -> order_execution_record.exec_id[order_execution_at] = (order_execution_base + 28 + order_execution_at + 1) % 256; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> order_execution_record.last_shares[order_execution_at] = (order_execution_base + 36 + order_execution_at + 1) % 256; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 8 -> order_execution_record.last_px[order_execution_at] = (order_execution_base + 40 + order_execution_at + 1) % 256; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> order_execution_record.leaves_qty[order_execution_at] = (order_execution_base + 48 + order_execution_at + 1) % 256; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_record.base_liquidity_indicator = (order_execution_base + 52 + 1) % 256;
  order_execution_record.sub_liquidity_indicator = (order_execution_base + 53 + 1) % 256;
  order_execution_record.side = (order_execution_base + 54 + 1) % 256;
  order_execution_at = 0;
  do
  :: order_execution_at < 8 -> order_execution_record.symbol[order_execution_at] = (order_execution_base + 55 + order_execution_at + 1) % 256; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> order_execution_record.clearing_firm[order_execution_at] = (order_execution_base + 63 + order_execution_at + 1) % 256; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> order_execution_record.maturity_date[order_execution_at] = (order_execution_base + 67 + order_execution_at + 1) % 256; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 2 -> order_execution_record.fee_code[order_execution_at] = (order_execution_base + 71 + order_execution_at + 1) % 256; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> order_execution_record.trade_date[order_execution_at] = (order_execution_base + 73 + order_execution_at + 1) % 256; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> order_execution_record.clearing_size[order_execution_at] = (order_execution_base + 77 + order_execution_at + 1) % 256; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_record.pending_status = (order_execution_base + 81 + 1) % 256;
  order_execution_record.multileg_reporting_type = (order_execution_base + 82 + 1) % 256;
  order_execution_at = 0;
  do
  :: order_execution_at < 8 -> order_execution_record.secondary_exec_id[order_execution_at] = (order_execution_base + 83 + order_execution_at + 1) % 256; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  skip
}

/* Order Execution to the wire, 91 bytes from where the cursor stands */
inline encode_order_execution(order_execution_record) {
  order_execution_at = 0;
  do
  :: order_execution_at < 8 -> wire[at] = order_execution_record.transaction_time[order_execution_at]; at = at + 1; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 20 -> wire[at] = order_execution_record.cl_ord_id[order_execution_at]; at = at + 1; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 8 -> wire[at] = order_execution_record.exec_id[order_execution_at]; at = at + 1; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> wire[at] = order_execution_record.last_shares[order_execution_at]; at = at + 1; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 8 -> wire[at] = order_execution_record.last_px[order_execution_at]; at = at + 1; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> wire[at] = order_execution_record.leaves_qty[order_execution_at]; at = at + 1; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_record.base_liquidity_indicator; at = at + 1;
  wire[at] = order_execution_record.sub_liquidity_indicator; at = at + 1;
  wire[at] = order_execution_record.side; at = at + 1;
  order_execution_at = 0;
  do
  :: order_execution_at < 8 -> wire[at] = order_execution_record.symbol[order_execution_at]; at = at + 1; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> wire[at] = order_execution_record.clearing_firm[order_execution_at]; at = at + 1; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> wire[at] = order_execution_record.maturity_date[order_execution_at]; at = at + 1; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 2 -> wire[at] = order_execution_record.fee_code[order_execution_at]; at = at + 1; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> wire[at] = order_execution_record.trade_date[order_execution_at]; at = at + 1; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> wire[at] = order_execution_record.clearing_size[order_execution_at]; at = at + 1; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_record.pending_status; at = at + 1;
  wire[at] = order_execution_record.multileg_reporting_type; at = at + 1;
  order_execution_at = 0;
  do
  :: order_execution_at < 8 -> wire[at] = order_execution_record.secondary_exec_id[order_execution_at]; at = at + 1; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  skip
}

/* Order Execution off the wire, 91 bytes from where the cursor stands */
inline decode_order_execution(order_execution_record) {
  order_execution_at = 0;
  do
  :: order_execution_at < 8 -> order_execution_record.transaction_time[order_execution_at] = wire[at]; at = at + 1; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 20 -> order_execution_record.cl_ord_id[order_execution_at] = wire[at]; at = at + 1; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 8 -> order_execution_record.exec_id[order_execution_at] = wire[at]; at = at + 1; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> order_execution_record.last_shares[order_execution_at] = wire[at]; at = at + 1; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 8 -> order_execution_record.last_px[order_execution_at] = wire[at]; at = at + 1; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> order_execution_record.leaves_qty[order_execution_at] = wire[at]; at = at + 1; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_record.base_liquidity_indicator = wire[at]; at = at + 1;
  order_execution_record.sub_liquidity_indicator = wire[at]; at = at + 1;
  order_execution_record.side = wire[at]; at = at + 1;
  order_execution_at = 0;
  do
  :: order_execution_at < 8 -> order_execution_record.symbol[order_execution_at] = wire[at]; at = at + 1; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> order_execution_record.clearing_firm[order_execution_at] = wire[at]; at = at + 1; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> order_execution_record.maturity_date[order_execution_at] = wire[at]; at = at + 1; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 2 -> order_execution_record.fee_code[order_execution_at] = wire[at]; at = at + 1; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> order_execution_record.trade_date[order_execution_at] = wire[at]; at = at + 1; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> order_execution_record.clearing_size[order_execution_at] = wire[at]; at = at + 1; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_record.pending_status = wire[at]; at = at + 1;
  order_execution_record.multileg_reporting_type = wire[at]; at = at + 1;
  order_execution_at = 0;
  do
  :: order_execution_at < 8 -> order_execution_record.secondary_exec_id[order_execution_at] = wire[at]; at = at + 1; order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Execution is what was written, byte for byte */
inline equal_order_execution(order_execution_read, order_execution_written) {
  order_execution_at = 0;
  do
  :: order_execution_at < 8 -> assert(order_execution_read.transaction_time[order_execution_at] == order_execution_written.transaction_time[order_execution_at]); order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 20 -> assert(order_execution_read.cl_ord_id[order_execution_at] == order_execution_written.cl_ord_id[order_execution_at]); order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 8 -> assert(order_execution_read.exec_id[order_execution_at] == order_execution_written.exec_id[order_execution_at]); order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> assert(order_execution_read.last_shares[order_execution_at] == order_execution_written.last_shares[order_execution_at]); order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 8 -> assert(order_execution_read.last_px[order_execution_at] == order_execution_written.last_px[order_execution_at]); order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> assert(order_execution_read.leaves_qty[order_execution_at] == order_execution_written.leaves_qty[order_execution_at]); order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  assert(order_execution_read.base_liquidity_indicator == order_execution_written.base_liquidity_indicator);
  assert(order_execution_read.sub_liquidity_indicator == order_execution_written.sub_liquidity_indicator);
  assert(order_execution_read.side == order_execution_written.side);
  order_execution_at = 0;
  do
  :: order_execution_at < 8 -> assert(order_execution_read.symbol[order_execution_at] == order_execution_written.symbol[order_execution_at]); order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> assert(order_execution_read.clearing_firm[order_execution_at] == order_execution_written.clearing_firm[order_execution_at]); order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> assert(order_execution_read.maturity_date[order_execution_at] == order_execution_written.maturity_date[order_execution_at]); order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 2 -> assert(order_execution_read.fee_code[order_execution_at] == order_execution_written.fee_code[order_execution_at]); order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> assert(order_execution_read.trade_date[order_execution_at] == order_execution_written.trade_date[order_execution_at]); order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  order_execution_at = 0;
  do
  :: order_execution_at < 4 -> assert(order_execution_read.clearing_size[order_execution_at] == order_execution_written.clearing_size[order_execution_at]); order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  assert(order_execution_read.pending_status == order_execution_written.pending_status);
  assert(order_execution_read.multileg_reporting_type == order_execution_written.multileg_reporting_type);
  order_execution_at = 0;
  do
  :: order_execution_at < 8 -> assert(order_execution_read.secondary_exec_id[order_execution_at] == order_execution_written.secondary_exec_id[order_execution_at]); order_execution_at = order_execution_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Execution Option: 103 bytes --------------------------------------- */

/* An Order Execution is sent for each fill on an order */
typedef OrderExecutionOption {
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte exec_id[8];
  byte last_shares[4];
  byte last_px[8];
  byte leaves_qty[4];
  byte base_liquidity_indicator;
  byte sub_liquidity_indicator;
  byte side;
  byte symbol[8];
  byte clearing_firm[4];
  byte security_desc[16];
  byte fee_code[2];
  byte trade_date[4];
  byte clearing_size[4];
  byte pending_status;
  byte multileg_reporting_type;
  byte secondary_exec_id[8]
};

int order_execution_option_at;

/* every byte of Order Execution Option set to one value */
inline fill_order_execution_option(order_execution_option_record, order_execution_option_value) {
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 8 -> order_execution_option_record.transaction_time[order_execution_option_at] = order_execution_option_value; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 20 -> order_execution_option_record.cl_ord_id[order_execution_option_at] = order_execution_option_value; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 8 -> order_execution_option_record.exec_id[order_execution_option_at] = order_execution_option_value; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 4 -> order_execution_option_record.last_shares[order_execution_option_at] = order_execution_option_value; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 8 -> order_execution_option_record.last_px[order_execution_option_at] = order_execution_option_value; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 4 -> order_execution_option_record.leaves_qty[order_execution_option_at] = order_execution_option_value; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_record.base_liquidity_indicator = order_execution_option_value;
  order_execution_option_record.sub_liquidity_indicator = order_execution_option_value;
  order_execution_option_record.side = order_execution_option_value;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 8 -> order_execution_option_record.symbol[order_execution_option_at] = order_execution_option_value; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 4 -> order_execution_option_record.clearing_firm[order_execution_option_at] = order_execution_option_value; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 16 -> order_execution_option_record.security_desc[order_execution_option_at] = order_execution_option_value; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 2 -> order_execution_option_record.fee_code[order_execution_option_at] = order_execution_option_value; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 4 -> order_execution_option_record.trade_date[order_execution_option_at] = order_execution_option_value; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 4 -> order_execution_option_record.clearing_size[order_execution_option_at] = order_execution_option_value; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_record.pending_status = order_execution_option_value;
  order_execution_option_record.multileg_reporting_type = order_execution_option_value;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 8 -> order_execution_option_record.secondary_exec_id[order_execution_option_at] = order_execution_option_value; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Execution Option set to where it lies, so a field read out of place says so */
inline ramp_order_execution_option(order_execution_option_record, order_execution_option_base) {
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 8 -> order_execution_option_record.transaction_time[order_execution_option_at] = (order_execution_option_base + 0 + order_execution_option_at + 1) % 256; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 20 -> order_execution_option_record.cl_ord_id[order_execution_option_at] = (order_execution_option_base + 8 + order_execution_option_at + 1) % 256; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 8 -> order_execution_option_record.exec_id[order_execution_option_at] = (order_execution_option_base + 28 + order_execution_option_at + 1) % 256; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 4 -> order_execution_option_record.last_shares[order_execution_option_at] = (order_execution_option_base + 36 + order_execution_option_at + 1) % 256; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 8 -> order_execution_option_record.last_px[order_execution_option_at] = (order_execution_option_base + 40 + order_execution_option_at + 1) % 256; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 4 -> order_execution_option_record.leaves_qty[order_execution_option_at] = (order_execution_option_base + 48 + order_execution_option_at + 1) % 256; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_record.base_liquidity_indicator = (order_execution_option_base + 52 + 1) % 256;
  order_execution_option_record.sub_liquidity_indicator = (order_execution_option_base + 53 + 1) % 256;
  order_execution_option_record.side = (order_execution_option_base + 54 + 1) % 256;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 8 -> order_execution_option_record.symbol[order_execution_option_at] = (order_execution_option_base + 55 + order_execution_option_at + 1) % 256; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 4 -> order_execution_option_record.clearing_firm[order_execution_option_at] = (order_execution_option_base + 63 + order_execution_option_at + 1) % 256; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 16 -> order_execution_option_record.security_desc[order_execution_option_at] = (order_execution_option_base + 67 + order_execution_option_at + 1) % 256; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 2 -> order_execution_option_record.fee_code[order_execution_option_at] = (order_execution_option_base + 83 + order_execution_option_at + 1) % 256; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 4 -> order_execution_option_record.trade_date[order_execution_option_at] = (order_execution_option_base + 85 + order_execution_option_at + 1) % 256; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 4 -> order_execution_option_record.clearing_size[order_execution_option_at] = (order_execution_option_base + 89 + order_execution_option_at + 1) % 256; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_record.pending_status = (order_execution_option_base + 93 + 1) % 256;
  order_execution_option_record.multileg_reporting_type = (order_execution_option_base + 94 + 1) % 256;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 8 -> order_execution_option_record.secondary_exec_id[order_execution_option_at] = (order_execution_option_base + 95 + order_execution_option_at + 1) % 256; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  skip
}

/* Order Execution Option to the wire, 103 bytes from where the cursor stands */
inline encode_order_execution_option(order_execution_option_record) {
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 8 -> wire[at] = order_execution_option_record.transaction_time[order_execution_option_at]; at = at + 1; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 20 -> wire[at] = order_execution_option_record.cl_ord_id[order_execution_option_at]; at = at + 1; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 8 -> wire[at] = order_execution_option_record.exec_id[order_execution_option_at]; at = at + 1; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 4 -> wire[at] = order_execution_option_record.last_shares[order_execution_option_at]; at = at + 1; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 8 -> wire[at] = order_execution_option_record.last_px[order_execution_option_at]; at = at + 1; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 4 -> wire[at] = order_execution_option_record.leaves_qty[order_execution_option_at]; at = at + 1; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_option_record.base_liquidity_indicator; at = at + 1;
  wire[at] = order_execution_option_record.sub_liquidity_indicator; at = at + 1;
  wire[at] = order_execution_option_record.side; at = at + 1;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 8 -> wire[at] = order_execution_option_record.symbol[order_execution_option_at]; at = at + 1; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 4 -> wire[at] = order_execution_option_record.clearing_firm[order_execution_option_at]; at = at + 1; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 16 -> wire[at] = order_execution_option_record.security_desc[order_execution_option_at]; at = at + 1; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 2 -> wire[at] = order_execution_option_record.fee_code[order_execution_option_at]; at = at + 1; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 4 -> wire[at] = order_execution_option_record.trade_date[order_execution_option_at]; at = at + 1; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 4 -> wire[at] = order_execution_option_record.clearing_size[order_execution_option_at]; at = at + 1; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_option_record.pending_status; at = at + 1;
  wire[at] = order_execution_option_record.multileg_reporting_type; at = at + 1;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 8 -> wire[at] = order_execution_option_record.secondary_exec_id[order_execution_option_at]; at = at + 1; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  skip
}

/* Order Execution Option off the wire, 103 bytes from where the cursor stands */
inline decode_order_execution_option(order_execution_option_record) {
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 8 -> order_execution_option_record.transaction_time[order_execution_option_at] = wire[at]; at = at + 1; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 20 -> order_execution_option_record.cl_ord_id[order_execution_option_at] = wire[at]; at = at + 1; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 8 -> order_execution_option_record.exec_id[order_execution_option_at] = wire[at]; at = at + 1; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 4 -> order_execution_option_record.last_shares[order_execution_option_at] = wire[at]; at = at + 1; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 8 -> order_execution_option_record.last_px[order_execution_option_at] = wire[at]; at = at + 1; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 4 -> order_execution_option_record.leaves_qty[order_execution_option_at] = wire[at]; at = at + 1; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_record.base_liquidity_indicator = wire[at]; at = at + 1;
  order_execution_option_record.sub_liquidity_indicator = wire[at]; at = at + 1;
  order_execution_option_record.side = wire[at]; at = at + 1;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 8 -> order_execution_option_record.symbol[order_execution_option_at] = wire[at]; at = at + 1; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 4 -> order_execution_option_record.clearing_firm[order_execution_option_at] = wire[at]; at = at + 1; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 16 -> order_execution_option_record.security_desc[order_execution_option_at] = wire[at]; at = at + 1; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 2 -> order_execution_option_record.fee_code[order_execution_option_at] = wire[at]; at = at + 1; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 4 -> order_execution_option_record.trade_date[order_execution_option_at] = wire[at]; at = at + 1; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 4 -> order_execution_option_record.clearing_size[order_execution_option_at] = wire[at]; at = at + 1; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_record.pending_status = wire[at]; at = at + 1;
  order_execution_option_record.multileg_reporting_type = wire[at]; at = at + 1;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 8 -> order_execution_option_record.secondary_exec_id[order_execution_option_at] = wire[at]; at = at + 1; order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Execution Option is what was written, byte for byte */
inline equal_order_execution_option(order_execution_option_read, order_execution_option_written) {
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 8 -> assert(order_execution_option_read.transaction_time[order_execution_option_at] == order_execution_option_written.transaction_time[order_execution_option_at]); order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 20 -> assert(order_execution_option_read.cl_ord_id[order_execution_option_at] == order_execution_option_written.cl_ord_id[order_execution_option_at]); order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 8 -> assert(order_execution_option_read.exec_id[order_execution_option_at] == order_execution_option_written.exec_id[order_execution_option_at]); order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 4 -> assert(order_execution_option_read.last_shares[order_execution_option_at] == order_execution_option_written.last_shares[order_execution_option_at]); order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 8 -> assert(order_execution_option_read.last_px[order_execution_option_at] == order_execution_option_written.last_px[order_execution_option_at]); order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 4 -> assert(order_execution_option_read.leaves_qty[order_execution_option_at] == order_execution_option_written.leaves_qty[order_execution_option_at]); order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  assert(order_execution_option_read.base_liquidity_indicator == order_execution_option_written.base_liquidity_indicator);
  assert(order_execution_option_read.sub_liquidity_indicator == order_execution_option_written.sub_liquidity_indicator);
  assert(order_execution_option_read.side == order_execution_option_written.side);
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 8 -> assert(order_execution_option_read.symbol[order_execution_option_at] == order_execution_option_written.symbol[order_execution_option_at]); order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 4 -> assert(order_execution_option_read.clearing_firm[order_execution_option_at] == order_execution_option_written.clearing_firm[order_execution_option_at]); order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 16 -> assert(order_execution_option_read.security_desc[order_execution_option_at] == order_execution_option_written.security_desc[order_execution_option_at]); order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 2 -> assert(order_execution_option_read.fee_code[order_execution_option_at] == order_execution_option_written.fee_code[order_execution_option_at]); order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 4 -> assert(order_execution_option_read.trade_date[order_execution_option_at] == order_execution_option_written.trade_date[order_execution_option_at]); order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 4 -> assert(order_execution_option_read.clearing_size[order_execution_option_at] == order_execution_option_written.clearing_size[order_execution_option_at]); order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  assert(order_execution_option_read.pending_status == order_execution_option_written.pending_status);
  assert(order_execution_option_read.multileg_reporting_type == order_execution_option_written.multileg_reporting_type);
  order_execution_option_at = 0;
  do
  :: order_execution_option_at < 8 -> assert(order_execution_option_read.secondary_exec_id[order_execution_option_at] == order_execution_option_written.secondary_exec_id[order_execution_option_at]); order_execution_option_at = order_execution_option_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancelled: 41 bytes ----------------------------------------------- */

/* Order Cancelled message */
typedef OrderCancelled {
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte clearing_firm[4];
  byte cancel_reason;
  byte request_received_time[8]
};

int order_cancelled_at;

/* every byte of Order Cancelled set to one value */
inline fill_order_cancelled(order_cancelled_record, order_cancelled_value) {
  order_cancelled_at = 0;
  do
  :: order_cancelled_at < 8 -> order_cancelled_record.transaction_time[order_cancelled_at] = order_cancelled_value; order_cancelled_at = order_cancelled_at + 1
  :: else -> break
  od;
  order_cancelled_at = 0;
  do
  :: order_cancelled_at < 20 -> order_cancelled_record.cl_ord_id[order_cancelled_at] = order_cancelled_value; order_cancelled_at = order_cancelled_at + 1
  :: else -> break
  od;
  order_cancelled_at = 0;
  do
  :: order_cancelled_at < 4 -> order_cancelled_record.clearing_firm[order_cancelled_at] = order_cancelled_value; order_cancelled_at = order_cancelled_at + 1
  :: else -> break
  od;
  order_cancelled_record.cancel_reason = order_cancelled_value;
  order_cancelled_at = 0;
  do
  :: order_cancelled_at < 8 -> order_cancelled_record.request_received_time[order_cancelled_at] = order_cancelled_value; order_cancelled_at = order_cancelled_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancelled set to where it lies, so a field read out of place says so */
inline ramp_order_cancelled(order_cancelled_record, order_cancelled_base) {
  order_cancelled_at = 0;
  do
  :: order_cancelled_at < 8 -> order_cancelled_record.transaction_time[order_cancelled_at] = (order_cancelled_base + 0 + order_cancelled_at + 1) % 256; order_cancelled_at = order_cancelled_at + 1
  :: else -> break
  od;
  order_cancelled_at = 0;
  do
  :: order_cancelled_at < 20 -> order_cancelled_record.cl_ord_id[order_cancelled_at] = (order_cancelled_base + 8 + order_cancelled_at + 1) % 256; order_cancelled_at = order_cancelled_at + 1
  :: else -> break
  od;
  order_cancelled_at = 0;
  do
  :: order_cancelled_at < 4 -> order_cancelled_record.clearing_firm[order_cancelled_at] = (order_cancelled_base + 28 + order_cancelled_at + 1) % 256; order_cancelled_at = order_cancelled_at + 1
  :: else -> break
  od;
  order_cancelled_record.cancel_reason = (order_cancelled_base + 32 + 1) % 256;
  order_cancelled_at = 0;
  do
  :: order_cancelled_at < 8 -> order_cancelled_record.request_received_time[order_cancelled_at] = (order_cancelled_base + 33 + order_cancelled_at + 1) % 256; order_cancelled_at = order_cancelled_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancelled to the wire, 41 bytes from where the cursor stands */
inline encode_order_cancelled(order_cancelled_record) {
  order_cancelled_at = 0;
  do
  :: order_cancelled_at < 8 -> wire[at] = order_cancelled_record.transaction_time[order_cancelled_at]; at = at + 1; order_cancelled_at = order_cancelled_at + 1
  :: else -> break
  od;
  order_cancelled_at = 0;
  do
  :: order_cancelled_at < 20 -> wire[at] = order_cancelled_record.cl_ord_id[order_cancelled_at]; at = at + 1; order_cancelled_at = order_cancelled_at + 1
  :: else -> break
  od;
  order_cancelled_at = 0;
  do
  :: order_cancelled_at < 4 -> wire[at] = order_cancelled_record.clearing_firm[order_cancelled_at]; at = at + 1; order_cancelled_at = order_cancelled_at + 1
  :: else -> break
  od;
  wire[at] = order_cancelled_record.cancel_reason; at = at + 1;
  order_cancelled_at = 0;
  do
  :: order_cancelled_at < 8 -> wire[at] = order_cancelled_record.request_received_time[order_cancelled_at]; at = at + 1; order_cancelled_at = order_cancelled_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancelled off the wire, 41 bytes from where the cursor stands */
inline decode_order_cancelled(order_cancelled_record) {
  order_cancelled_at = 0;
  do
  :: order_cancelled_at < 8 -> order_cancelled_record.transaction_time[order_cancelled_at] = wire[at]; at = at + 1; order_cancelled_at = order_cancelled_at + 1
  :: else -> break
  od;
  order_cancelled_at = 0;
  do
  :: order_cancelled_at < 20 -> order_cancelled_record.cl_ord_id[order_cancelled_at] = wire[at]; at = at + 1; order_cancelled_at = order_cancelled_at + 1
  :: else -> break
  od;
  order_cancelled_at = 0;
  do
  :: order_cancelled_at < 4 -> order_cancelled_record.clearing_firm[order_cancelled_at] = wire[at]; at = at + 1; order_cancelled_at = order_cancelled_at + 1
  :: else -> break
  od;
  order_cancelled_record.cancel_reason = wire[at]; at = at + 1;
  order_cancelled_at = 0;
  do
  :: order_cancelled_at < 8 -> order_cancelled_record.request_received_time[order_cancelled_at] = wire[at]; at = at + 1; order_cancelled_at = order_cancelled_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancelled is what was written, byte for byte */
inline equal_order_cancelled(order_cancelled_read, order_cancelled_written) {
  order_cancelled_at = 0;
  do
  :: order_cancelled_at < 8 -> assert(order_cancelled_read.transaction_time[order_cancelled_at] == order_cancelled_written.transaction_time[order_cancelled_at]); order_cancelled_at = order_cancelled_at + 1
  :: else -> break
  od;
  order_cancelled_at = 0;
  do
  :: order_cancelled_at < 20 -> assert(order_cancelled_read.cl_ord_id[order_cancelled_at] == order_cancelled_written.cl_ord_id[order_cancelled_at]); order_cancelled_at = order_cancelled_at + 1
  :: else -> break
  od;
  order_cancelled_at = 0;
  do
  :: order_cancelled_at < 4 -> assert(order_cancelled_read.clearing_firm[order_cancelled_at] == order_cancelled_written.clearing_firm[order_cancelled_at]); order_cancelled_at = order_cancelled_at + 1
  :: else -> break
  od;
  assert(order_cancelled_read.cancel_reason == order_cancelled_written.cancel_reason);
  order_cancelled_at = 0;
  do
  :: order_cancelled_at < 8 -> assert(order_cancelled_read.request_received_time[order_cancelled_at] == order_cancelled_written.request_received_time[order_cancelled_at]); order_cancelled_at = order_cancelled_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel Rejected: 93 bytes ----------------------------------------------- */

/* A Cancel Rejected message is sent in response to a Cancel Order message to indicate that the cancellation cannot occur */
typedef CancelRejected {
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte clearing_firm[4];
  byte cancel_reject_reason;
  byte text[60]
};

int cancel_rejected_at;

/* every byte of Cancel Rejected set to one value */
inline fill_cancel_rejected(cancel_rejected_record, cancel_rejected_value) {
  cancel_rejected_at = 0;
  do
  :: cancel_rejected_at < 8 -> cancel_rejected_record.transaction_time[cancel_rejected_at] = cancel_rejected_value; cancel_rejected_at = cancel_rejected_at + 1
  :: else -> break
  od;
  cancel_rejected_at = 0;
  do
  :: cancel_rejected_at < 20 -> cancel_rejected_record.cl_ord_id[cancel_rejected_at] = cancel_rejected_value; cancel_rejected_at = cancel_rejected_at + 1
  :: else -> break
  od;
  cancel_rejected_at = 0;
  do
  :: cancel_rejected_at < 4 -> cancel_rejected_record.clearing_firm[cancel_rejected_at] = cancel_rejected_value; cancel_rejected_at = cancel_rejected_at + 1
  :: else -> break
  od;
  cancel_rejected_record.cancel_reject_reason = cancel_rejected_value;
  cancel_rejected_at = 0;
  do
  :: cancel_rejected_at < 60 -> cancel_rejected_record.text[cancel_rejected_at] = cancel_rejected_value; cancel_rejected_at = cancel_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Rejected set to where it lies, so a field read out of place says so */
inline ramp_cancel_rejected(cancel_rejected_record, cancel_rejected_base) {
  cancel_rejected_at = 0;
  do
  :: cancel_rejected_at < 8 -> cancel_rejected_record.transaction_time[cancel_rejected_at] = (cancel_rejected_base + 0 + cancel_rejected_at + 1) % 256; cancel_rejected_at = cancel_rejected_at + 1
  :: else -> break
  od;
  cancel_rejected_at = 0;
  do
  :: cancel_rejected_at < 20 -> cancel_rejected_record.cl_ord_id[cancel_rejected_at] = (cancel_rejected_base + 8 + cancel_rejected_at + 1) % 256; cancel_rejected_at = cancel_rejected_at + 1
  :: else -> break
  od;
  cancel_rejected_at = 0;
  do
  :: cancel_rejected_at < 4 -> cancel_rejected_record.clearing_firm[cancel_rejected_at] = (cancel_rejected_base + 28 + cancel_rejected_at + 1) % 256; cancel_rejected_at = cancel_rejected_at + 1
  :: else -> break
  od;
  cancel_rejected_record.cancel_reject_reason = (cancel_rejected_base + 32 + 1) % 256;
  cancel_rejected_at = 0;
  do
  :: cancel_rejected_at < 60 -> cancel_rejected_record.text[cancel_rejected_at] = (cancel_rejected_base + 33 + cancel_rejected_at + 1) % 256; cancel_rejected_at = cancel_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Rejected to the wire, 93 bytes from where the cursor stands */
inline encode_cancel_rejected(cancel_rejected_record) {
  cancel_rejected_at = 0;
  do
  :: cancel_rejected_at < 8 -> wire[at] = cancel_rejected_record.transaction_time[cancel_rejected_at]; at = at + 1; cancel_rejected_at = cancel_rejected_at + 1
  :: else -> break
  od;
  cancel_rejected_at = 0;
  do
  :: cancel_rejected_at < 20 -> wire[at] = cancel_rejected_record.cl_ord_id[cancel_rejected_at]; at = at + 1; cancel_rejected_at = cancel_rejected_at + 1
  :: else -> break
  od;
  cancel_rejected_at = 0;
  do
  :: cancel_rejected_at < 4 -> wire[at] = cancel_rejected_record.clearing_firm[cancel_rejected_at]; at = at + 1; cancel_rejected_at = cancel_rejected_at + 1
  :: else -> break
  od;
  wire[at] = cancel_rejected_record.cancel_reject_reason; at = at + 1;
  cancel_rejected_at = 0;
  do
  :: cancel_rejected_at < 60 -> wire[at] = cancel_rejected_record.text[cancel_rejected_at]; at = at + 1; cancel_rejected_at = cancel_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Rejected off the wire, 93 bytes from where the cursor stands */
inline decode_cancel_rejected(cancel_rejected_record) {
  cancel_rejected_at = 0;
  do
  :: cancel_rejected_at < 8 -> cancel_rejected_record.transaction_time[cancel_rejected_at] = wire[at]; at = at + 1; cancel_rejected_at = cancel_rejected_at + 1
  :: else -> break
  od;
  cancel_rejected_at = 0;
  do
  :: cancel_rejected_at < 20 -> cancel_rejected_record.cl_ord_id[cancel_rejected_at] = wire[at]; at = at + 1; cancel_rejected_at = cancel_rejected_at + 1
  :: else -> break
  od;
  cancel_rejected_at = 0;
  do
  :: cancel_rejected_at < 4 -> cancel_rejected_record.clearing_firm[cancel_rejected_at] = wire[at]; at = at + 1; cancel_rejected_at = cancel_rejected_at + 1
  :: else -> break
  od;
  cancel_rejected_record.cancel_reject_reason = wire[at]; at = at + 1;
  cancel_rejected_at = 0;
  do
  :: cancel_rejected_at < 60 -> cancel_rejected_record.text[cancel_rejected_at] = wire[at]; at = at + 1; cancel_rejected_at = cancel_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Rejected is what was written, byte for byte */
inline equal_cancel_rejected(cancel_rejected_read, cancel_rejected_written) {
  cancel_rejected_at = 0;
  do
  :: cancel_rejected_at < 8 -> assert(cancel_rejected_read.transaction_time[cancel_rejected_at] == cancel_rejected_written.transaction_time[cancel_rejected_at]); cancel_rejected_at = cancel_rejected_at + 1
  :: else -> break
  od;
  cancel_rejected_at = 0;
  do
  :: cancel_rejected_at < 20 -> assert(cancel_rejected_read.cl_ord_id[cancel_rejected_at] == cancel_rejected_written.cl_ord_id[cancel_rejected_at]); cancel_rejected_at = cancel_rejected_at + 1
  :: else -> break
  od;
  cancel_rejected_at = 0;
  do
  :: cancel_rejected_at < 4 -> assert(cancel_rejected_read.clearing_firm[cancel_rejected_at] == cancel_rejected_written.clearing_firm[cancel_rejected_at]); cancel_rejected_at = cancel_rejected_at + 1
  :: else -> break
  od;
  assert(cancel_rejected_read.cancel_reject_reason == cancel_rejected_written.cancel_reject_reason);
  cancel_rejected_at = 0;
  do
  :: cancel_rejected_at < 60 -> assert(cancel_rejected_read.text[cancel_rejected_at] == cancel_rejected_written.text[cancel_rejected_at]); cancel_rejected_at = cancel_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mass Cancel Acknowledgement: 40 bytes ----------------------------------- */

/* A Mass Cancel Acknowledgment is an unsequenced message sent when a Cancel Order or Purge Orders message requesting a mass cancellation has completed cancelling all individual orders */
typedef MassCancelAcknowledgement {
  byte transaction_time[8];
  byte mass_cancel_id[20];
  byte cancelled_order_count[4];
  byte request_received_time[8]
};

int mass_cancel_acknowledgement_at;

/* every byte of Mass Cancel Acknowledgement set to one value */
inline fill_mass_cancel_acknowledgement(mass_cancel_acknowledgement_record, mass_cancel_acknowledgement_value) {
  mass_cancel_acknowledgement_at = 0;
  do
  :: mass_cancel_acknowledgement_at < 8 -> mass_cancel_acknowledgement_record.transaction_time[mass_cancel_acknowledgement_at] = mass_cancel_acknowledgement_value; mass_cancel_acknowledgement_at = mass_cancel_acknowledgement_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_at = 0;
  do
  :: mass_cancel_acknowledgement_at < 20 -> mass_cancel_acknowledgement_record.mass_cancel_id[mass_cancel_acknowledgement_at] = mass_cancel_acknowledgement_value; mass_cancel_acknowledgement_at = mass_cancel_acknowledgement_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_at = 0;
  do
  :: mass_cancel_acknowledgement_at < 4 -> mass_cancel_acknowledgement_record.cancelled_order_count[mass_cancel_acknowledgement_at] = mass_cancel_acknowledgement_value; mass_cancel_acknowledgement_at = mass_cancel_acknowledgement_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_at = 0;
  do
  :: mass_cancel_acknowledgement_at < 8 -> mass_cancel_acknowledgement_record.request_received_time[mass_cancel_acknowledgement_at] = mass_cancel_acknowledgement_value; mass_cancel_acknowledgement_at = mass_cancel_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mass Cancel Acknowledgement set to where it lies, so a field read out of place says so */
inline ramp_mass_cancel_acknowledgement(mass_cancel_acknowledgement_record, mass_cancel_acknowledgement_base) {
  mass_cancel_acknowledgement_at = 0;
  do
  :: mass_cancel_acknowledgement_at < 8 -> mass_cancel_acknowledgement_record.transaction_time[mass_cancel_acknowledgement_at] = (mass_cancel_acknowledgement_base + 0 + mass_cancel_acknowledgement_at + 1) % 256; mass_cancel_acknowledgement_at = mass_cancel_acknowledgement_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_at = 0;
  do
  :: mass_cancel_acknowledgement_at < 20 -> mass_cancel_acknowledgement_record.mass_cancel_id[mass_cancel_acknowledgement_at] = (mass_cancel_acknowledgement_base + 8 + mass_cancel_acknowledgement_at + 1) % 256; mass_cancel_acknowledgement_at = mass_cancel_acknowledgement_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_at = 0;
  do
  :: mass_cancel_acknowledgement_at < 4 -> mass_cancel_acknowledgement_record.cancelled_order_count[mass_cancel_acknowledgement_at] = (mass_cancel_acknowledgement_base + 28 + mass_cancel_acknowledgement_at + 1) % 256; mass_cancel_acknowledgement_at = mass_cancel_acknowledgement_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_at = 0;
  do
  :: mass_cancel_acknowledgement_at < 8 -> mass_cancel_acknowledgement_record.request_received_time[mass_cancel_acknowledgement_at] = (mass_cancel_acknowledgement_base + 32 + mass_cancel_acknowledgement_at + 1) % 256; mass_cancel_acknowledgement_at = mass_cancel_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Acknowledgement to the wire, 40 bytes from where the cursor stands */
inline encode_mass_cancel_acknowledgement(mass_cancel_acknowledgement_record) {
  mass_cancel_acknowledgement_at = 0;
  do
  :: mass_cancel_acknowledgement_at < 8 -> wire[at] = mass_cancel_acknowledgement_record.transaction_time[mass_cancel_acknowledgement_at]; at = at + 1; mass_cancel_acknowledgement_at = mass_cancel_acknowledgement_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_at = 0;
  do
  :: mass_cancel_acknowledgement_at < 20 -> wire[at] = mass_cancel_acknowledgement_record.mass_cancel_id[mass_cancel_acknowledgement_at]; at = at + 1; mass_cancel_acknowledgement_at = mass_cancel_acknowledgement_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_at = 0;
  do
  :: mass_cancel_acknowledgement_at < 4 -> wire[at] = mass_cancel_acknowledgement_record.cancelled_order_count[mass_cancel_acknowledgement_at]; at = at + 1; mass_cancel_acknowledgement_at = mass_cancel_acknowledgement_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_at = 0;
  do
  :: mass_cancel_acknowledgement_at < 8 -> wire[at] = mass_cancel_acknowledgement_record.request_received_time[mass_cancel_acknowledgement_at]; at = at + 1; mass_cancel_acknowledgement_at = mass_cancel_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Acknowledgement off the wire, 40 bytes from where the cursor stands */
inline decode_mass_cancel_acknowledgement(mass_cancel_acknowledgement_record) {
  mass_cancel_acknowledgement_at = 0;
  do
  :: mass_cancel_acknowledgement_at < 8 -> mass_cancel_acknowledgement_record.transaction_time[mass_cancel_acknowledgement_at] = wire[at]; at = at + 1; mass_cancel_acknowledgement_at = mass_cancel_acknowledgement_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_at = 0;
  do
  :: mass_cancel_acknowledgement_at < 20 -> mass_cancel_acknowledgement_record.mass_cancel_id[mass_cancel_acknowledgement_at] = wire[at]; at = at + 1; mass_cancel_acknowledgement_at = mass_cancel_acknowledgement_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_at = 0;
  do
  :: mass_cancel_acknowledgement_at < 4 -> mass_cancel_acknowledgement_record.cancelled_order_count[mass_cancel_acknowledgement_at] = wire[at]; at = at + 1; mass_cancel_acknowledgement_at = mass_cancel_acknowledgement_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_at = 0;
  do
  :: mass_cancel_acknowledgement_at < 8 -> mass_cancel_acknowledgement_record.request_received_time[mass_cancel_acknowledgement_at] = wire[at]; at = at + 1; mass_cancel_acknowledgement_at = mass_cancel_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mass Cancel Acknowledgement is what was written, byte for byte */
inline equal_mass_cancel_acknowledgement(mass_cancel_acknowledgement_read, mass_cancel_acknowledgement_written) {
  mass_cancel_acknowledgement_at = 0;
  do
  :: mass_cancel_acknowledgement_at < 8 -> assert(mass_cancel_acknowledgement_read.transaction_time[mass_cancel_acknowledgement_at] == mass_cancel_acknowledgement_written.transaction_time[mass_cancel_acknowledgement_at]); mass_cancel_acknowledgement_at = mass_cancel_acknowledgement_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_at = 0;
  do
  :: mass_cancel_acknowledgement_at < 20 -> assert(mass_cancel_acknowledgement_read.mass_cancel_id[mass_cancel_acknowledgement_at] == mass_cancel_acknowledgement_written.mass_cancel_id[mass_cancel_acknowledgement_at]); mass_cancel_acknowledgement_at = mass_cancel_acknowledgement_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_at = 0;
  do
  :: mass_cancel_acknowledgement_at < 4 -> assert(mass_cancel_acknowledgement_read.cancelled_order_count[mass_cancel_acknowledgement_at] == mass_cancel_acknowledgement_written.cancelled_order_count[mass_cancel_acknowledgement_at]); mass_cancel_acknowledgement_at = mass_cancel_acknowledgement_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_at = 0;
  do
  :: mass_cancel_acknowledgement_at < 8 -> assert(mass_cancel_acknowledgement_read.request_received_time[mass_cancel_acknowledgement_at] == mass_cancel_acknowledgement_written.request_received_time[mass_cancel_acknowledgement_at]); mass_cancel_acknowledgement_at = mass_cancel_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mass Cancel Rejected: 89 bytes ------------------------------------------ */

/* A Mass Cancel Rejected message is sent in response to a Mass Cancel Order message to indicate that the mass cancellation cannot occur */
typedef MassCancelRejected {
  byte transaction_time[8];
  byte mass_cancel_id[20];
  byte mass_cancel_reject_reason;
  byte text[60]
};

int mass_cancel_rejected_at;

/* every byte of Mass Cancel Rejected set to one value */
inline fill_mass_cancel_rejected(mass_cancel_rejected_record, mass_cancel_rejected_value) {
  mass_cancel_rejected_at = 0;
  do
  :: mass_cancel_rejected_at < 8 -> mass_cancel_rejected_record.transaction_time[mass_cancel_rejected_at] = mass_cancel_rejected_value; mass_cancel_rejected_at = mass_cancel_rejected_at + 1
  :: else -> break
  od;
  mass_cancel_rejected_at = 0;
  do
  :: mass_cancel_rejected_at < 20 -> mass_cancel_rejected_record.mass_cancel_id[mass_cancel_rejected_at] = mass_cancel_rejected_value; mass_cancel_rejected_at = mass_cancel_rejected_at + 1
  :: else -> break
  od;
  mass_cancel_rejected_record.mass_cancel_reject_reason = mass_cancel_rejected_value;
  mass_cancel_rejected_at = 0;
  do
  :: mass_cancel_rejected_at < 60 -> mass_cancel_rejected_record.text[mass_cancel_rejected_at] = mass_cancel_rejected_value; mass_cancel_rejected_at = mass_cancel_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mass Cancel Rejected set to where it lies, so a field read out of place says so */
inline ramp_mass_cancel_rejected(mass_cancel_rejected_record, mass_cancel_rejected_base) {
  mass_cancel_rejected_at = 0;
  do
  :: mass_cancel_rejected_at < 8 -> mass_cancel_rejected_record.transaction_time[mass_cancel_rejected_at] = (mass_cancel_rejected_base + 0 + mass_cancel_rejected_at + 1) % 256; mass_cancel_rejected_at = mass_cancel_rejected_at + 1
  :: else -> break
  od;
  mass_cancel_rejected_at = 0;
  do
  :: mass_cancel_rejected_at < 20 -> mass_cancel_rejected_record.mass_cancel_id[mass_cancel_rejected_at] = (mass_cancel_rejected_base + 8 + mass_cancel_rejected_at + 1) % 256; mass_cancel_rejected_at = mass_cancel_rejected_at + 1
  :: else -> break
  od;
  mass_cancel_rejected_record.mass_cancel_reject_reason = (mass_cancel_rejected_base + 28 + 1) % 256;
  mass_cancel_rejected_at = 0;
  do
  :: mass_cancel_rejected_at < 60 -> mass_cancel_rejected_record.text[mass_cancel_rejected_at] = (mass_cancel_rejected_base + 29 + mass_cancel_rejected_at + 1) % 256; mass_cancel_rejected_at = mass_cancel_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Rejected to the wire, 89 bytes from where the cursor stands */
inline encode_mass_cancel_rejected(mass_cancel_rejected_record) {
  mass_cancel_rejected_at = 0;
  do
  :: mass_cancel_rejected_at < 8 -> wire[at] = mass_cancel_rejected_record.transaction_time[mass_cancel_rejected_at]; at = at + 1; mass_cancel_rejected_at = mass_cancel_rejected_at + 1
  :: else -> break
  od;
  mass_cancel_rejected_at = 0;
  do
  :: mass_cancel_rejected_at < 20 -> wire[at] = mass_cancel_rejected_record.mass_cancel_id[mass_cancel_rejected_at]; at = at + 1; mass_cancel_rejected_at = mass_cancel_rejected_at + 1
  :: else -> break
  od;
  wire[at] = mass_cancel_rejected_record.mass_cancel_reject_reason; at = at + 1;
  mass_cancel_rejected_at = 0;
  do
  :: mass_cancel_rejected_at < 60 -> wire[at] = mass_cancel_rejected_record.text[mass_cancel_rejected_at]; at = at + 1; mass_cancel_rejected_at = mass_cancel_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Rejected off the wire, 89 bytes from where the cursor stands */
inline decode_mass_cancel_rejected(mass_cancel_rejected_record) {
  mass_cancel_rejected_at = 0;
  do
  :: mass_cancel_rejected_at < 8 -> mass_cancel_rejected_record.transaction_time[mass_cancel_rejected_at] = wire[at]; at = at + 1; mass_cancel_rejected_at = mass_cancel_rejected_at + 1
  :: else -> break
  od;
  mass_cancel_rejected_at = 0;
  do
  :: mass_cancel_rejected_at < 20 -> mass_cancel_rejected_record.mass_cancel_id[mass_cancel_rejected_at] = wire[at]; at = at + 1; mass_cancel_rejected_at = mass_cancel_rejected_at + 1
  :: else -> break
  od;
  mass_cancel_rejected_record.mass_cancel_reject_reason = wire[at]; at = at + 1;
  mass_cancel_rejected_at = 0;
  do
  :: mass_cancel_rejected_at < 60 -> mass_cancel_rejected_record.text[mass_cancel_rejected_at] = wire[at]; at = at + 1; mass_cancel_rejected_at = mass_cancel_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mass Cancel Rejected is what was written, byte for byte */
inline equal_mass_cancel_rejected(mass_cancel_rejected_read, mass_cancel_rejected_written) {
  mass_cancel_rejected_at = 0;
  do
  :: mass_cancel_rejected_at < 8 -> assert(mass_cancel_rejected_read.transaction_time[mass_cancel_rejected_at] == mass_cancel_rejected_written.transaction_time[mass_cancel_rejected_at]); mass_cancel_rejected_at = mass_cancel_rejected_at + 1
  :: else -> break
  od;
  mass_cancel_rejected_at = 0;
  do
  :: mass_cancel_rejected_at < 20 -> assert(mass_cancel_rejected_read.mass_cancel_id[mass_cancel_rejected_at] == mass_cancel_rejected_written.mass_cancel_id[mass_cancel_rejected_at]); mass_cancel_rejected_at = mass_cancel_rejected_at + 1
  :: else -> break
  od;
  assert(mass_cancel_rejected_read.mass_cancel_reject_reason == mass_cancel_rejected_written.mass_cancel_reject_reason);
  mass_cancel_rejected_at = 0;
  do
  :: mass_cancel_rejected_at < 60 -> assert(mass_cancel_rejected_read.text[mass_cancel_rejected_at] == mass_cancel_rejected_written.text[mass_cancel_rejected_at]); mass_cancel_rejected_at = mass_cancel_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Purge Acknowledgement: 40 bytes ----------------------------------------- */

/* A Purge Acknowledgment is an unsequenced message sent when a Purge Orders message requesting an order purge has completed cancelling all individual orders */
typedef PurgeAcknowledgement {
  byte transaction_time[8];
  byte mass_cancel_id[20];
  byte cancelled_order_count[4];
  byte request_received_time[8]
};

int purge_acknowledgement_at;

/* every byte of Purge Acknowledgement set to one value */
inline fill_purge_acknowledgement(purge_acknowledgement_record, purge_acknowledgement_value) {
  purge_acknowledgement_at = 0;
  do
  :: purge_acknowledgement_at < 8 -> purge_acknowledgement_record.transaction_time[purge_acknowledgement_at] = purge_acknowledgement_value; purge_acknowledgement_at = purge_acknowledgement_at + 1
  :: else -> break
  od;
  purge_acknowledgement_at = 0;
  do
  :: purge_acknowledgement_at < 20 -> purge_acknowledgement_record.mass_cancel_id[purge_acknowledgement_at] = purge_acknowledgement_value; purge_acknowledgement_at = purge_acknowledgement_at + 1
  :: else -> break
  od;
  purge_acknowledgement_at = 0;
  do
  :: purge_acknowledgement_at < 4 -> purge_acknowledgement_record.cancelled_order_count[purge_acknowledgement_at] = purge_acknowledgement_value; purge_acknowledgement_at = purge_acknowledgement_at + 1
  :: else -> break
  od;
  purge_acknowledgement_at = 0;
  do
  :: purge_acknowledgement_at < 8 -> purge_acknowledgement_record.request_received_time[purge_acknowledgement_at] = purge_acknowledgement_value; purge_acknowledgement_at = purge_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Purge Acknowledgement set to where it lies, so a field read out of place says so */
inline ramp_purge_acknowledgement(purge_acknowledgement_record, purge_acknowledgement_base) {
  purge_acknowledgement_at = 0;
  do
  :: purge_acknowledgement_at < 8 -> purge_acknowledgement_record.transaction_time[purge_acknowledgement_at] = (purge_acknowledgement_base + 0 + purge_acknowledgement_at + 1) % 256; purge_acknowledgement_at = purge_acknowledgement_at + 1
  :: else -> break
  od;
  purge_acknowledgement_at = 0;
  do
  :: purge_acknowledgement_at < 20 -> purge_acknowledgement_record.mass_cancel_id[purge_acknowledgement_at] = (purge_acknowledgement_base + 8 + purge_acknowledgement_at + 1) % 256; purge_acknowledgement_at = purge_acknowledgement_at + 1
  :: else -> break
  od;
  purge_acknowledgement_at = 0;
  do
  :: purge_acknowledgement_at < 4 -> purge_acknowledgement_record.cancelled_order_count[purge_acknowledgement_at] = (purge_acknowledgement_base + 28 + purge_acknowledgement_at + 1) % 256; purge_acknowledgement_at = purge_acknowledgement_at + 1
  :: else -> break
  od;
  purge_acknowledgement_at = 0;
  do
  :: purge_acknowledgement_at < 8 -> purge_acknowledgement_record.request_received_time[purge_acknowledgement_at] = (purge_acknowledgement_base + 32 + purge_acknowledgement_at + 1) % 256; purge_acknowledgement_at = purge_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Purge Acknowledgement to the wire, 40 bytes from where the cursor stands */
inline encode_purge_acknowledgement(purge_acknowledgement_record) {
  purge_acknowledgement_at = 0;
  do
  :: purge_acknowledgement_at < 8 -> wire[at] = purge_acknowledgement_record.transaction_time[purge_acknowledgement_at]; at = at + 1; purge_acknowledgement_at = purge_acknowledgement_at + 1
  :: else -> break
  od;
  purge_acknowledgement_at = 0;
  do
  :: purge_acknowledgement_at < 20 -> wire[at] = purge_acknowledgement_record.mass_cancel_id[purge_acknowledgement_at]; at = at + 1; purge_acknowledgement_at = purge_acknowledgement_at + 1
  :: else -> break
  od;
  purge_acknowledgement_at = 0;
  do
  :: purge_acknowledgement_at < 4 -> wire[at] = purge_acknowledgement_record.cancelled_order_count[purge_acknowledgement_at]; at = at + 1; purge_acknowledgement_at = purge_acknowledgement_at + 1
  :: else -> break
  od;
  purge_acknowledgement_at = 0;
  do
  :: purge_acknowledgement_at < 8 -> wire[at] = purge_acknowledgement_record.request_received_time[purge_acknowledgement_at]; at = at + 1; purge_acknowledgement_at = purge_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Purge Acknowledgement off the wire, 40 bytes from where the cursor stands */
inline decode_purge_acknowledgement(purge_acknowledgement_record) {
  purge_acknowledgement_at = 0;
  do
  :: purge_acknowledgement_at < 8 -> purge_acknowledgement_record.transaction_time[purge_acknowledgement_at] = wire[at]; at = at + 1; purge_acknowledgement_at = purge_acknowledgement_at + 1
  :: else -> break
  od;
  purge_acknowledgement_at = 0;
  do
  :: purge_acknowledgement_at < 20 -> purge_acknowledgement_record.mass_cancel_id[purge_acknowledgement_at] = wire[at]; at = at + 1; purge_acknowledgement_at = purge_acknowledgement_at + 1
  :: else -> break
  od;
  purge_acknowledgement_at = 0;
  do
  :: purge_acknowledgement_at < 4 -> purge_acknowledgement_record.cancelled_order_count[purge_acknowledgement_at] = wire[at]; at = at + 1; purge_acknowledgement_at = purge_acknowledgement_at + 1
  :: else -> break
  od;
  purge_acknowledgement_at = 0;
  do
  :: purge_acknowledgement_at < 8 -> purge_acknowledgement_record.request_received_time[purge_acknowledgement_at] = wire[at]; at = at + 1; purge_acknowledgement_at = purge_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Purge Acknowledgement is what was written, byte for byte */
inline equal_purge_acknowledgement(purge_acknowledgement_read, purge_acknowledgement_written) {
  purge_acknowledgement_at = 0;
  do
  :: purge_acknowledgement_at < 8 -> assert(purge_acknowledgement_read.transaction_time[purge_acknowledgement_at] == purge_acknowledgement_written.transaction_time[purge_acknowledgement_at]); purge_acknowledgement_at = purge_acknowledgement_at + 1
  :: else -> break
  od;
  purge_acknowledgement_at = 0;
  do
  :: purge_acknowledgement_at < 20 -> assert(purge_acknowledgement_read.mass_cancel_id[purge_acknowledgement_at] == purge_acknowledgement_written.mass_cancel_id[purge_acknowledgement_at]); purge_acknowledgement_at = purge_acknowledgement_at + 1
  :: else -> break
  od;
  purge_acknowledgement_at = 0;
  do
  :: purge_acknowledgement_at < 4 -> assert(purge_acknowledgement_read.cancelled_order_count[purge_acknowledgement_at] == purge_acknowledgement_written.cancelled_order_count[purge_acknowledgement_at]); purge_acknowledgement_at = purge_acknowledgement_at + 1
  :: else -> break
  od;
  purge_acknowledgement_at = 0;
  do
  :: purge_acknowledgement_at < 8 -> assert(purge_acknowledgement_read.request_received_time[purge_acknowledgement_at] == purge_acknowledgement_written.request_received_time[purge_acknowledgement_at]); purge_acknowledgement_at = purge_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Purge Rejected: 89 bytes ------------------------------------------------ */

/* A Purge Rejected message is sent in response to a Purge Orders message to indicate that the mass cancellation cannot occur */
typedef PurgeRejected {
  byte transaction_time[8];
  byte mass_cancel_id[20];
  byte purge_reject_reason;
  byte text[60]
};

int purge_rejected_at;

/* every byte of Purge Rejected set to one value */
inline fill_purge_rejected(purge_rejected_record, purge_rejected_value) {
  purge_rejected_at = 0;
  do
  :: purge_rejected_at < 8 -> purge_rejected_record.transaction_time[purge_rejected_at] = purge_rejected_value; purge_rejected_at = purge_rejected_at + 1
  :: else -> break
  od;
  purge_rejected_at = 0;
  do
  :: purge_rejected_at < 20 -> purge_rejected_record.mass_cancel_id[purge_rejected_at] = purge_rejected_value; purge_rejected_at = purge_rejected_at + 1
  :: else -> break
  od;
  purge_rejected_record.purge_reject_reason = purge_rejected_value;
  purge_rejected_at = 0;
  do
  :: purge_rejected_at < 60 -> purge_rejected_record.text[purge_rejected_at] = purge_rejected_value; purge_rejected_at = purge_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Purge Rejected set to where it lies, so a field read out of place says so */
inline ramp_purge_rejected(purge_rejected_record, purge_rejected_base) {
  purge_rejected_at = 0;
  do
  :: purge_rejected_at < 8 -> purge_rejected_record.transaction_time[purge_rejected_at] = (purge_rejected_base + 0 + purge_rejected_at + 1) % 256; purge_rejected_at = purge_rejected_at + 1
  :: else -> break
  od;
  purge_rejected_at = 0;
  do
  :: purge_rejected_at < 20 -> purge_rejected_record.mass_cancel_id[purge_rejected_at] = (purge_rejected_base + 8 + purge_rejected_at + 1) % 256; purge_rejected_at = purge_rejected_at + 1
  :: else -> break
  od;
  purge_rejected_record.purge_reject_reason = (purge_rejected_base + 28 + 1) % 256;
  purge_rejected_at = 0;
  do
  :: purge_rejected_at < 60 -> purge_rejected_record.text[purge_rejected_at] = (purge_rejected_base + 29 + purge_rejected_at + 1) % 256; purge_rejected_at = purge_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* Purge Rejected to the wire, 89 bytes from where the cursor stands */
inline encode_purge_rejected(purge_rejected_record) {
  purge_rejected_at = 0;
  do
  :: purge_rejected_at < 8 -> wire[at] = purge_rejected_record.transaction_time[purge_rejected_at]; at = at + 1; purge_rejected_at = purge_rejected_at + 1
  :: else -> break
  od;
  purge_rejected_at = 0;
  do
  :: purge_rejected_at < 20 -> wire[at] = purge_rejected_record.mass_cancel_id[purge_rejected_at]; at = at + 1; purge_rejected_at = purge_rejected_at + 1
  :: else -> break
  od;
  wire[at] = purge_rejected_record.purge_reject_reason; at = at + 1;
  purge_rejected_at = 0;
  do
  :: purge_rejected_at < 60 -> wire[at] = purge_rejected_record.text[purge_rejected_at]; at = at + 1; purge_rejected_at = purge_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* Purge Rejected off the wire, 89 bytes from where the cursor stands */
inline decode_purge_rejected(purge_rejected_record) {
  purge_rejected_at = 0;
  do
  :: purge_rejected_at < 8 -> purge_rejected_record.transaction_time[purge_rejected_at] = wire[at]; at = at + 1; purge_rejected_at = purge_rejected_at + 1
  :: else -> break
  od;
  purge_rejected_at = 0;
  do
  :: purge_rejected_at < 20 -> purge_rejected_record.mass_cancel_id[purge_rejected_at] = wire[at]; at = at + 1; purge_rejected_at = purge_rejected_at + 1
  :: else -> break
  od;
  purge_rejected_record.purge_reject_reason = wire[at]; at = at + 1;
  purge_rejected_at = 0;
  do
  :: purge_rejected_at < 60 -> purge_rejected_record.text[purge_rejected_at] = wire[at]; at = at + 1; purge_rejected_at = purge_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Purge Rejected is what was written, byte for byte */
inline equal_purge_rejected(purge_rejected_read, purge_rejected_written) {
  purge_rejected_at = 0;
  do
  :: purge_rejected_at < 8 -> assert(purge_rejected_read.transaction_time[purge_rejected_at] == purge_rejected_written.transaction_time[purge_rejected_at]); purge_rejected_at = purge_rejected_at + 1
  :: else -> break
  od;
  purge_rejected_at = 0;
  do
  :: purge_rejected_at < 20 -> assert(purge_rejected_read.mass_cancel_id[purge_rejected_at] == purge_rejected_written.mass_cancel_id[purge_rejected_at]); purge_rejected_at = purge_rejected_at + 1
  :: else -> break
  od;
  assert(purge_rejected_read.purge_reject_reason == purge_rejected_written.purge_reject_reason);
  purge_rejected_at = 0;
  do
  :: purge_rejected_at < 60 -> assert(purge_rejected_read.text[purge_rejected_at] == purge_rejected_written.text[purge_rejected_at]); purge_rejected_at = purge_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Cancel Correct: 92 bytes ------------------------------------------ */

/* Used to provide notification that a trade has been cancelled or corrected */
typedef TradeCancelCorrect {
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte exec_ref_id[8];
  byte side;
  byte base_liquidity_indicator;
  byte clearing_firm[4];
  byte clearing_account[4];
  byte last_shares[4];
  byte last_px[8];
  byte corrected_price[8];
  byte orig_time[8];
  byte symbol[8];
  byte capacity;
  byte maturity_date[4];
  byte open_close;
  byte cmta_number[4]
};

int trade_cancel_correct_at;

/* every byte of Trade Cancel Correct set to one value */
inline fill_trade_cancel_correct(trade_cancel_correct_record, trade_cancel_correct_value) {
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> trade_cancel_correct_record.transaction_time[trade_cancel_correct_at] = trade_cancel_correct_value; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 20 -> trade_cancel_correct_record.cl_ord_id[trade_cancel_correct_at] = trade_cancel_correct_value; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> trade_cancel_correct_record.exec_ref_id[trade_cancel_correct_at] = trade_cancel_correct_value; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_record.side = trade_cancel_correct_value;
  trade_cancel_correct_record.base_liquidity_indicator = trade_cancel_correct_value;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 4 -> trade_cancel_correct_record.clearing_firm[trade_cancel_correct_at] = trade_cancel_correct_value; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 4 -> trade_cancel_correct_record.clearing_account[trade_cancel_correct_at] = trade_cancel_correct_value; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 4 -> trade_cancel_correct_record.last_shares[trade_cancel_correct_at] = trade_cancel_correct_value; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> trade_cancel_correct_record.last_px[trade_cancel_correct_at] = trade_cancel_correct_value; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> trade_cancel_correct_record.corrected_price[trade_cancel_correct_at] = trade_cancel_correct_value; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> trade_cancel_correct_record.orig_time[trade_cancel_correct_at] = trade_cancel_correct_value; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> trade_cancel_correct_record.symbol[trade_cancel_correct_at] = trade_cancel_correct_value; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_record.capacity = trade_cancel_correct_value;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 4 -> trade_cancel_correct_record.maturity_date[trade_cancel_correct_at] = trade_cancel_correct_value; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_record.open_close = trade_cancel_correct_value;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 4 -> trade_cancel_correct_record.cmta_number[trade_cancel_correct_at] = trade_cancel_correct_value; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Cancel Correct set to where it lies, so a field read out of place says so */
inline ramp_trade_cancel_correct(trade_cancel_correct_record, trade_cancel_correct_base) {
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> trade_cancel_correct_record.transaction_time[trade_cancel_correct_at] = (trade_cancel_correct_base + 0 + trade_cancel_correct_at + 1) % 256; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 20 -> trade_cancel_correct_record.cl_ord_id[trade_cancel_correct_at] = (trade_cancel_correct_base + 8 + trade_cancel_correct_at + 1) % 256; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> trade_cancel_correct_record.exec_ref_id[trade_cancel_correct_at] = (trade_cancel_correct_base + 28 + trade_cancel_correct_at + 1) % 256; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_record.side = (trade_cancel_correct_base + 36 + 1) % 256;
  trade_cancel_correct_record.base_liquidity_indicator = (trade_cancel_correct_base + 37 + 1) % 256;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 4 -> trade_cancel_correct_record.clearing_firm[trade_cancel_correct_at] = (trade_cancel_correct_base + 38 + trade_cancel_correct_at + 1) % 256; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 4 -> trade_cancel_correct_record.clearing_account[trade_cancel_correct_at] = (trade_cancel_correct_base + 42 + trade_cancel_correct_at + 1) % 256; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 4 -> trade_cancel_correct_record.last_shares[trade_cancel_correct_at] = (trade_cancel_correct_base + 46 + trade_cancel_correct_at + 1) % 256; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> trade_cancel_correct_record.last_px[trade_cancel_correct_at] = (trade_cancel_correct_base + 50 + trade_cancel_correct_at + 1) % 256; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> trade_cancel_correct_record.corrected_price[trade_cancel_correct_at] = (trade_cancel_correct_base + 58 + trade_cancel_correct_at + 1) % 256; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> trade_cancel_correct_record.orig_time[trade_cancel_correct_at] = (trade_cancel_correct_base + 66 + trade_cancel_correct_at + 1) % 256; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> trade_cancel_correct_record.symbol[trade_cancel_correct_at] = (trade_cancel_correct_base + 74 + trade_cancel_correct_at + 1) % 256; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_record.capacity = (trade_cancel_correct_base + 82 + 1) % 256;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 4 -> trade_cancel_correct_record.maturity_date[trade_cancel_correct_at] = (trade_cancel_correct_base + 83 + trade_cancel_correct_at + 1) % 256; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_record.open_close = (trade_cancel_correct_base + 87 + 1) % 256;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 4 -> trade_cancel_correct_record.cmta_number[trade_cancel_correct_at] = (trade_cancel_correct_base + 88 + trade_cancel_correct_at + 1) % 256; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel Correct to the wire, 92 bytes from where the cursor stands */
inline encode_trade_cancel_correct(trade_cancel_correct_record) {
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> wire[at] = trade_cancel_correct_record.transaction_time[trade_cancel_correct_at]; at = at + 1; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 20 -> wire[at] = trade_cancel_correct_record.cl_ord_id[trade_cancel_correct_at]; at = at + 1; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> wire[at] = trade_cancel_correct_record.exec_ref_id[trade_cancel_correct_at]; at = at + 1; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_correct_record.side; at = at + 1;
  wire[at] = trade_cancel_correct_record.base_liquidity_indicator; at = at + 1;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 4 -> wire[at] = trade_cancel_correct_record.clearing_firm[trade_cancel_correct_at]; at = at + 1; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 4 -> wire[at] = trade_cancel_correct_record.clearing_account[trade_cancel_correct_at]; at = at + 1; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 4 -> wire[at] = trade_cancel_correct_record.last_shares[trade_cancel_correct_at]; at = at + 1; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> wire[at] = trade_cancel_correct_record.last_px[trade_cancel_correct_at]; at = at + 1; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> wire[at] = trade_cancel_correct_record.corrected_price[trade_cancel_correct_at]; at = at + 1; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> wire[at] = trade_cancel_correct_record.orig_time[trade_cancel_correct_at]; at = at + 1; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> wire[at] = trade_cancel_correct_record.symbol[trade_cancel_correct_at]; at = at + 1; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_correct_record.capacity; at = at + 1;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 4 -> wire[at] = trade_cancel_correct_record.maturity_date[trade_cancel_correct_at]; at = at + 1; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_correct_record.open_close; at = at + 1;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 4 -> wire[at] = trade_cancel_correct_record.cmta_number[trade_cancel_correct_at]; at = at + 1; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel Correct off the wire, 92 bytes from where the cursor stands */
inline decode_trade_cancel_correct(trade_cancel_correct_record) {
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> trade_cancel_correct_record.transaction_time[trade_cancel_correct_at] = wire[at]; at = at + 1; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 20 -> trade_cancel_correct_record.cl_ord_id[trade_cancel_correct_at] = wire[at]; at = at + 1; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> trade_cancel_correct_record.exec_ref_id[trade_cancel_correct_at] = wire[at]; at = at + 1; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_record.side = wire[at]; at = at + 1;
  trade_cancel_correct_record.base_liquidity_indicator = wire[at]; at = at + 1;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 4 -> trade_cancel_correct_record.clearing_firm[trade_cancel_correct_at] = wire[at]; at = at + 1; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 4 -> trade_cancel_correct_record.clearing_account[trade_cancel_correct_at] = wire[at]; at = at + 1; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 4 -> trade_cancel_correct_record.last_shares[trade_cancel_correct_at] = wire[at]; at = at + 1; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> trade_cancel_correct_record.last_px[trade_cancel_correct_at] = wire[at]; at = at + 1; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> trade_cancel_correct_record.corrected_price[trade_cancel_correct_at] = wire[at]; at = at + 1; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> trade_cancel_correct_record.orig_time[trade_cancel_correct_at] = wire[at]; at = at + 1; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> trade_cancel_correct_record.symbol[trade_cancel_correct_at] = wire[at]; at = at + 1; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_record.capacity = wire[at]; at = at + 1;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 4 -> trade_cancel_correct_record.maturity_date[trade_cancel_correct_at] = wire[at]; at = at + 1; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_record.open_close = wire[at]; at = at + 1;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 4 -> trade_cancel_correct_record.cmta_number[trade_cancel_correct_at] = wire[at]; at = at + 1; trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Cancel Correct is what was written, byte for byte */
inline equal_trade_cancel_correct(trade_cancel_correct_read, trade_cancel_correct_written) {
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> assert(trade_cancel_correct_read.transaction_time[trade_cancel_correct_at] == trade_cancel_correct_written.transaction_time[trade_cancel_correct_at]); trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 20 -> assert(trade_cancel_correct_read.cl_ord_id[trade_cancel_correct_at] == trade_cancel_correct_written.cl_ord_id[trade_cancel_correct_at]); trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> assert(trade_cancel_correct_read.exec_ref_id[trade_cancel_correct_at] == trade_cancel_correct_written.exec_ref_id[trade_cancel_correct_at]); trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  assert(trade_cancel_correct_read.side == trade_cancel_correct_written.side);
  assert(trade_cancel_correct_read.base_liquidity_indicator == trade_cancel_correct_written.base_liquidity_indicator);
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 4 -> assert(trade_cancel_correct_read.clearing_firm[trade_cancel_correct_at] == trade_cancel_correct_written.clearing_firm[trade_cancel_correct_at]); trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 4 -> assert(trade_cancel_correct_read.clearing_account[trade_cancel_correct_at] == trade_cancel_correct_written.clearing_account[trade_cancel_correct_at]); trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 4 -> assert(trade_cancel_correct_read.last_shares[trade_cancel_correct_at] == trade_cancel_correct_written.last_shares[trade_cancel_correct_at]); trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> assert(trade_cancel_correct_read.last_px[trade_cancel_correct_at] == trade_cancel_correct_written.last_px[trade_cancel_correct_at]); trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> assert(trade_cancel_correct_read.corrected_price[trade_cancel_correct_at] == trade_cancel_correct_written.corrected_price[trade_cancel_correct_at]); trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> assert(trade_cancel_correct_read.orig_time[trade_cancel_correct_at] == trade_cancel_correct_written.orig_time[trade_cancel_correct_at]); trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 8 -> assert(trade_cancel_correct_read.symbol[trade_cancel_correct_at] == trade_cancel_correct_written.symbol[trade_cancel_correct_at]); trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  assert(trade_cancel_correct_read.capacity == trade_cancel_correct_written.capacity);
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 4 -> assert(trade_cancel_correct_read.maturity_date[trade_cancel_correct_at] == trade_cancel_correct_written.maturity_date[trade_cancel_correct_at]); trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  assert(trade_cancel_correct_read.open_close == trade_cancel_correct_written.open_close);
  trade_cancel_correct_at = 0;
  do
  :: trade_cancel_correct_at < 4 -> assert(trade_cancel_correct_read.cmta_number[trade_cancel_correct_at] == trade_cancel_correct_written.cmta_number[trade_cancel_correct_at]); trade_cancel_correct_at = trade_cancel_correct_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Cancel Correct Option: 104 bytes ---------------------------------- */

/* Used to provide notification that an option trade has been cancelled or corrected */
typedef TradeCancelCorrectOption {
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte exec_ref_id[8];
  byte side;
  byte base_liquidity_indicator;
  byte clearing_firm[4];
  byte clearing_account[4];
  byte last_shares[4];
  byte last_px[8];
  byte corrected_price[8];
  byte orig_time[8];
  byte symbol[8];
  byte capacity;
  byte security_desc[16];
  byte open_close;
  byte cmta_number[4]
};

int trade_cancel_correct_option_at;

/* every byte of Trade Cancel Correct Option set to one value */
inline fill_trade_cancel_correct_option(trade_cancel_correct_option_record, trade_cancel_correct_option_value) {
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> trade_cancel_correct_option_record.transaction_time[trade_cancel_correct_option_at] = trade_cancel_correct_option_value; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 20 -> trade_cancel_correct_option_record.cl_ord_id[trade_cancel_correct_option_at] = trade_cancel_correct_option_value; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> trade_cancel_correct_option_record.exec_ref_id[trade_cancel_correct_option_at] = trade_cancel_correct_option_value; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_record.side = trade_cancel_correct_option_value;
  trade_cancel_correct_option_record.base_liquidity_indicator = trade_cancel_correct_option_value;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 4 -> trade_cancel_correct_option_record.clearing_firm[trade_cancel_correct_option_at] = trade_cancel_correct_option_value; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 4 -> trade_cancel_correct_option_record.clearing_account[trade_cancel_correct_option_at] = trade_cancel_correct_option_value; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 4 -> trade_cancel_correct_option_record.last_shares[trade_cancel_correct_option_at] = trade_cancel_correct_option_value; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> trade_cancel_correct_option_record.last_px[trade_cancel_correct_option_at] = trade_cancel_correct_option_value; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> trade_cancel_correct_option_record.corrected_price[trade_cancel_correct_option_at] = trade_cancel_correct_option_value; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> trade_cancel_correct_option_record.orig_time[trade_cancel_correct_option_at] = trade_cancel_correct_option_value; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> trade_cancel_correct_option_record.symbol[trade_cancel_correct_option_at] = trade_cancel_correct_option_value; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_record.capacity = trade_cancel_correct_option_value;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 16 -> trade_cancel_correct_option_record.security_desc[trade_cancel_correct_option_at] = trade_cancel_correct_option_value; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_record.open_close = trade_cancel_correct_option_value;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 4 -> trade_cancel_correct_option_record.cmta_number[trade_cancel_correct_option_at] = trade_cancel_correct_option_value; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Cancel Correct Option set to where it lies, so a field read out of place says so */
inline ramp_trade_cancel_correct_option(trade_cancel_correct_option_record, trade_cancel_correct_option_base) {
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> trade_cancel_correct_option_record.transaction_time[trade_cancel_correct_option_at] = (trade_cancel_correct_option_base + 0 + trade_cancel_correct_option_at + 1) % 256; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 20 -> trade_cancel_correct_option_record.cl_ord_id[trade_cancel_correct_option_at] = (trade_cancel_correct_option_base + 8 + trade_cancel_correct_option_at + 1) % 256; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> trade_cancel_correct_option_record.exec_ref_id[trade_cancel_correct_option_at] = (trade_cancel_correct_option_base + 28 + trade_cancel_correct_option_at + 1) % 256; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_record.side = (trade_cancel_correct_option_base + 36 + 1) % 256;
  trade_cancel_correct_option_record.base_liquidity_indicator = (trade_cancel_correct_option_base + 37 + 1) % 256;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 4 -> trade_cancel_correct_option_record.clearing_firm[trade_cancel_correct_option_at] = (trade_cancel_correct_option_base + 38 + trade_cancel_correct_option_at + 1) % 256; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 4 -> trade_cancel_correct_option_record.clearing_account[trade_cancel_correct_option_at] = (trade_cancel_correct_option_base + 42 + trade_cancel_correct_option_at + 1) % 256; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 4 -> trade_cancel_correct_option_record.last_shares[trade_cancel_correct_option_at] = (trade_cancel_correct_option_base + 46 + trade_cancel_correct_option_at + 1) % 256; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> trade_cancel_correct_option_record.last_px[trade_cancel_correct_option_at] = (trade_cancel_correct_option_base + 50 + trade_cancel_correct_option_at + 1) % 256; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> trade_cancel_correct_option_record.corrected_price[trade_cancel_correct_option_at] = (trade_cancel_correct_option_base + 58 + trade_cancel_correct_option_at + 1) % 256; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> trade_cancel_correct_option_record.orig_time[trade_cancel_correct_option_at] = (trade_cancel_correct_option_base + 66 + trade_cancel_correct_option_at + 1) % 256; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> trade_cancel_correct_option_record.symbol[trade_cancel_correct_option_at] = (trade_cancel_correct_option_base + 74 + trade_cancel_correct_option_at + 1) % 256; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_record.capacity = (trade_cancel_correct_option_base + 82 + 1) % 256;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 16 -> trade_cancel_correct_option_record.security_desc[trade_cancel_correct_option_at] = (trade_cancel_correct_option_base + 83 + trade_cancel_correct_option_at + 1) % 256; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_record.open_close = (trade_cancel_correct_option_base + 99 + 1) % 256;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 4 -> trade_cancel_correct_option_record.cmta_number[trade_cancel_correct_option_at] = (trade_cancel_correct_option_base + 100 + trade_cancel_correct_option_at + 1) % 256; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel Correct Option to the wire, 104 bytes from where the cursor stands */
inline encode_trade_cancel_correct_option(trade_cancel_correct_option_record) {
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> wire[at] = trade_cancel_correct_option_record.transaction_time[trade_cancel_correct_option_at]; at = at + 1; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 20 -> wire[at] = trade_cancel_correct_option_record.cl_ord_id[trade_cancel_correct_option_at]; at = at + 1; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> wire[at] = trade_cancel_correct_option_record.exec_ref_id[trade_cancel_correct_option_at]; at = at + 1; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_correct_option_record.side; at = at + 1;
  wire[at] = trade_cancel_correct_option_record.base_liquidity_indicator; at = at + 1;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 4 -> wire[at] = trade_cancel_correct_option_record.clearing_firm[trade_cancel_correct_option_at]; at = at + 1; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 4 -> wire[at] = trade_cancel_correct_option_record.clearing_account[trade_cancel_correct_option_at]; at = at + 1; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 4 -> wire[at] = trade_cancel_correct_option_record.last_shares[trade_cancel_correct_option_at]; at = at + 1; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> wire[at] = trade_cancel_correct_option_record.last_px[trade_cancel_correct_option_at]; at = at + 1; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> wire[at] = trade_cancel_correct_option_record.corrected_price[trade_cancel_correct_option_at]; at = at + 1; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> wire[at] = trade_cancel_correct_option_record.orig_time[trade_cancel_correct_option_at]; at = at + 1; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> wire[at] = trade_cancel_correct_option_record.symbol[trade_cancel_correct_option_at]; at = at + 1; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_correct_option_record.capacity; at = at + 1;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 16 -> wire[at] = trade_cancel_correct_option_record.security_desc[trade_cancel_correct_option_at]; at = at + 1; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_correct_option_record.open_close; at = at + 1;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 4 -> wire[at] = trade_cancel_correct_option_record.cmta_number[trade_cancel_correct_option_at]; at = at + 1; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel Correct Option off the wire, 104 bytes from where the cursor stands */
inline decode_trade_cancel_correct_option(trade_cancel_correct_option_record) {
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> trade_cancel_correct_option_record.transaction_time[trade_cancel_correct_option_at] = wire[at]; at = at + 1; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 20 -> trade_cancel_correct_option_record.cl_ord_id[trade_cancel_correct_option_at] = wire[at]; at = at + 1; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> trade_cancel_correct_option_record.exec_ref_id[trade_cancel_correct_option_at] = wire[at]; at = at + 1; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_record.side = wire[at]; at = at + 1;
  trade_cancel_correct_option_record.base_liquidity_indicator = wire[at]; at = at + 1;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 4 -> trade_cancel_correct_option_record.clearing_firm[trade_cancel_correct_option_at] = wire[at]; at = at + 1; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 4 -> trade_cancel_correct_option_record.clearing_account[trade_cancel_correct_option_at] = wire[at]; at = at + 1; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 4 -> trade_cancel_correct_option_record.last_shares[trade_cancel_correct_option_at] = wire[at]; at = at + 1; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> trade_cancel_correct_option_record.last_px[trade_cancel_correct_option_at] = wire[at]; at = at + 1; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> trade_cancel_correct_option_record.corrected_price[trade_cancel_correct_option_at] = wire[at]; at = at + 1; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> trade_cancel_correct_option_record.orig_time[trade_cancel_correct_option_at] = wire[at]; at = at + 1; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> trade_cancel_correct_option_record.symbol[trade_cancel_correct_option_at] = wire[at]; at = at + 1; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_record.capacity = wire[at]; at = at + 1;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 16 -> trade_cancel_correct_option_record.security_desc[trade_cancel_correct_option_at] = wire[at]; at = at + 1; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_record.open_close = wire[at]; at = at + 1;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 4 -> trade_cancel_correct_option_record.cmta_number[trade_cancel_correct_option_at] = wire[at]; at = at + 1; trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Cancel Correct Option is what was written, byte for byte */
inline equal_trade_cancel_correct_option(trade_cancel_correct_option_read, trade_cancel_correct_option_written) {
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> assert(trade_cancel_correct_option_read.transaction_time[trade_cancel_correct_option_at] == trade_cancel_correct_option_written.transaction_time[trade_cancel_correct_option_at]); trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 20 -> assert(trade_cancel_correct_option_read.cl_ord_id[trade_cancel_correct_option_at] == trade_cancel_correct_option_written.cl_ord_id[trade_cancel_correct_option_at]); trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> assert(trade_cancel_correct_option_read.exec_ref_id[trade_cancel_correct_option_at] == trade_cancel_correct_option_written.exec_ref_id[trade_cancel_correct_option_at]); trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  assert(trade_cancel_correct_option_read.side == trade_cancel_correct_option_written.side);
  assert(trade_cancel_correct_option_read.base_liquidity_indicator == trade_cancel_correct_option_written.base_liquidity_indicator);
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 4 -> assert(trade_cancel_correct_option_read.clearing_firm[trade_cancel_correct_option_at] == trade_cancel_correct_option_written.clearing_firm[trade_cancel_correct_option_at]); trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 4 -> assert(trade_cancel_correct_option_read.clearing_account[trade_cancel_correct_option_at] == trade_cancel_correct_option_written.clearing_account[trade_cancel_correct_option_at]); trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 4 -> assert(trade_cancel_correct_option_read.last_shares[trade_cancel_correct_option_at] == trade_cancel_correct_option_written.last_shares[trade_cancel_correct_option_at]); trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> assert(trade_cancel_correct_option_read.last_px[trade_cancel_correct_option_at] == trade_cancel_correct_option_written.last_px[trade_cancel_correct_option_at]); trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> assert(trade_cancel_correct_option_read.corrected_price[trade_cancel_correct_option_at] == trade_cancel_correct_option_written.corrected_price[trade_cancel_correct_option_at]); trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> assert(trade_cancel_correct_option_read.orig_time[trade_cancel_correct_option_at] == trade_cancel_correct_option_written.orig_time[trade_cancel_correct_option_at]); trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 8 -> assert(trade_cancel_correct_option_read.symbol[trade_cancel_correct_option_at] == trade_cancel_correct_option_written.symbol[trade_cancel_correct_option_at]); trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  assert(trade_cancel_correct_option_read.capacity == trade_cancel_correct_option_written.capacity);
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 16 -> assert(trade_cancel_correct_option_read.security_desc[trade_cancel_correct_option_at] == trade_cancel_correct_option_written.security_desc[trade_cancel_correct_option_at]); trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  assert(trade_cancel_correct_option_read.open_close == trade_cancel_correct_option_written.open_close);
  trade_cancel_correct_option_at = 0;
  do
  :: trade_cancel_correct_option_at < 4 -> assert(trade_cancel_correct_option_read.cmta_number[trade_cancel_correct_option_at] == trade_cancel_correct_option_written.cmta_number[trade_cancel_correct_option_at]); trade_cancel_correct_option_at = trade_cancel_correct_option_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Tas Restatement: 104 bytes ---------------------------------------------- */

/* A Tas Restatement is sent post-settlement time for each TAS execution during the associated business day to communicate the updated Price and Symbol associated with the cleared execution */
typedef TasRestatement {
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte clearing_firm[4];
  byte exec_id[8];
  byte side;
  byte price[8];
  byte symbol[8];
  byte maturity_date[4];
  byte last_shares[4];
  byte last_px[8];
  byte fee_code[2];
  byte trade_date[4];
  byte clearing_price[8];
  byte clearing_symbol[8];
  byte multileg_reporting_type;
  byte secondary_exec_id[8]
};

int tas_restatement_at;

/* every byte of Tas Restatement set to one value */
inline fill_tas_restatement(tas_restatement_record, tas_restatement_value) {
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> tas_restatement_record.transaction_time[tas_restatement_at] = tas_restatement_value; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 20 -> tas_restatement_record.cl_ord_id[tas_restatement_at] = tas_restatement_value; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 4 -> tas_restatement_record.clearing_firm[tas_restatement_at] = tas_restatement_value; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> tas_restatement_record.exec_id[tas_restatement_at] = tas_restatement_value; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_record.side = tas_restatement_value;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> tas_restatement_record.price[tas_restatement_at] = tas_restatement_value; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> tas_restatement_record.symbol[tas_restatement_at] = tas_restatement_value; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 4 -> tas_restatement_record.maturity_date[tas_restatement_at] = tas_restatement_value; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 4 -> tas_restatement_record.last_shares[tas_restatement_at] = tas_restatement_value; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> tas_restatement_record.last_px[tas_restatement_at] = tas_restatement_value; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 2 -> tas_restatement_record.fee_code[tas_restatement_at] = tas_restatement_value; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 4 -> tas_restatement_record.trade_date[tas_restatement_at] = tas_restatement_value; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> tas_restatement_record.clearing_price[tas_restatement_at] = tas_restatement_value; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> tas_restatement_record.clearing_symbol[tas_restatement_at] = tas_restatement_value; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_record.multileg_reporting_type = tas_restatement_value;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> tas_restatement_record.secondary_exec_id[tas_restatement_at] = tas_restatement_value; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Tas Restatement set to where it lies, so a field read out of place says so */
inline ramp_tas_restatement(tas_restatement_record, tas_restatement_base) {
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> tas_restatement_record.transaction_time[tas_restatement_at] = (tas_restatement_base + 0 + tas_restatement_at + 1) % 256; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 20 -> tas_restatement_record.cl_ord_id[tas_restatement_at] = (tas_restatement_base + 8 + tas_restatement_at + 1) % 256; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 4 -> tas_restatement_record.clearing_firm[tas_restatement_at] = (tas_restatement_base + 28 + tas_restatement_at + 1) % 256; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> tas_restatement_record.exec_id[tas_restatement_at] = (tas_restatement_base + 32 + tas_restatement_at + 1) % 256; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_record.side = (tas_restatement_base + 40 + 1) % 256;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> tas_restatement_record.price[tas_restatement_at] = (tas_restatement_base + 41 + tas_restatement_at + 1) % 256; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> tas_restatement_record.symbol[tas_restatement_at] = (tas_restatement_base + 49 + tas_restatement_at + 1) % 256; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 4 -> tas_restatement_record.maturity_date[tas_restatement_at] = (tas_restatement_base + 57 + tas_restatement_at + 1) % 256; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 4 -> tas_restatement_record.last_shares[tas_restatement_at] = (tas_restatement_base + 61 + tas_restatement_at + 1) % 256; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> tas_restatement_record.last_px[tas_restatement_at] = (tas_restatement_base + 65 + tas_restatement_at + 1) % 256; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 2 -> tas_restatement_record.fee_code[tas_restatement_at] = (tas_restatement_base + 73 + tas_restatement_at + 1) % 256; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 4 -> tas_restatement_record.trade_date[tas_restatement_at] = (tas_restatement_base + 75 + tas_restatement_at + 1) % 256; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> tas_restatement_record.clearing_price[tas_restatement_at] = (tas_restatement_base + 79 + tas_restatement_at + 1) % 256; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> tas_restatement_record.clearing_symbol[tas_restatement_at] = (tas_restatement_base + 87 + tas_restatement_at + 1) % 256; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_record.multileg_reporting_type = (tas_restatement_base + 95 + 1) % 256;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> tas_restatement_record.secondary_exec_id[tas_restatement_at] = (tas_restatement_base + 96 + tas_restatement_at + 1) % 256; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  skip
}

/* Tas Restatement to the wire, 104 bytes from where the cursor stands */
inline encode_tas_restatement(tas_restatement_record) {
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> wire[at] = tas_restatement_record.transaction_time[tas_restatement_at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 20 -> wire[at] = tas_restatement_record.cl_ord_id[tas_restatement_at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 4 -> wire[at] = tas_restatement_record.clearing_firm[tas_restatement_at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> wire[at] = tas_restatement_record.exec_id[tas_restatement_at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  wire[at] = tas_restatement_record.side; at = at + 1;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> wire[at] = tas_restatement_record.price[tas_restatement_at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> wire[at] = tas_restatement_record.symbol[tas_restatement_at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 4 -> wire[at] = tas_restatement_record.maturity_date[tas_restatement_at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 4 -> wire[at] = tas_restatement_record.last_shares[tas_restatement_at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> wire[at] = tas_restatement_record.last_px[tas_restatement_at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 2 -> wire[at] = tas_restatement_record.fee_code[tas_restatement_at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 4 -> wire[at] = tas_restatement_record.trade_date[tas_restatement_at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> wire[at] = tas_restatement_record.clearing_price[tas_restatement_at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> wire[at] = tas_restatement_record.clearing_symbol[tas_restatement_at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  wire[at] = tas_restatement_record.multileg_reporting_type; at = at + 1;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> wire[at] = tas_restatement_record.secondary_exec_id[tas_restatement_at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  skip
}

/* Tas Restatement off the wire, 104 bytes from where the cursor stands */
inline decode_tas_restatement(tas_restatement_record) {
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> tas_restatement_record.transaction_time[tas_restatement_at] = wire[at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 20 -> tas_restatement_record.cl_ord_id[tas_restatement_at] = wire[at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 4 -> tas_restatement_record.clearing_firm[tas_restatement_at] = wire[at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> tas_restatement_record.exec_id[tas_restatement_at] = wire[at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_record.side = wire[at]; at = at + 1;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> tas_restatement_record.price[tas_restatement_at] = wire[at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> tas_restatement_record.symbol[tas_restatement_at] = wire[at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 4 -> tas_restatement_record.maturity_date[tas_restatement_at] = wire[at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 4 -> tas_restatement_record.last_shares[tas_restatement_at] = wire[at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> tas_restatement_record.last_px[tas_restatement_at] = wire[at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 2 -> tas_restatement_record.fee_code[tas_restatement_at] = wire[at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 4 -> tas_restatement_record.trade_date[tas_restatement_at] = wire[at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> tas_restatement_record.clearing_price[tas_restatement_at] = wire[at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> tas_restatement_record.clearing_symbol[tas_restatement_at] = wire[at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_record.multileg_reporting_type = wire[at]; at = at + 1;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> tas_restatement_record.secondary_exec_id[tas_restatement_at] = wire[at]; at = at + 1; tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Tas Restatement is what was written, byte for byte */
inline equal_tas_restatement(tas_restatement_read, tas_restatement_written) {
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> assert(tas_restatement_read.transaction_time[tas_restatement_at] == tas_restatement_written.transaction_time[tas_restatement_at]); tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 20 -> assert(tas_restatement_read.cl_ord_id[tas_restatement_at] == tas_restatement_written.cl_ord_id[tas_restatement_at]); tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 4 -> assert(tas_restatement_read.clearing_firm[tas_restatement_at] == tas_restatement_written.clearing_firm[tas_restatement_at]); tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> assert(tas_restatement_read.exec_id[tas_restatement_at] == tas_restatement_written.exec_id[tas_restatement_at]); tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  assert(tas_restatement_read.side == tas_restatement_written.side);
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> assert(tas_restatement_read.price[tas_restatement_at] == tas_restatement_written.price[tas_restatement_at]); tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> assert(tas_restatement_read.symbol[tas_restatement_at] == tas_restatement_written.symbol[tas_restatement_at]); tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 4 -> assert(tas_restatement_read.maturity_date[tas_restatement_at] == tas_restatement_written.maturity_date[tas_restatement_at]); tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 4 -> assert(tas_restatement_read.last_shares[tas_restatement_at] == tas_restatement_written.last_shares[tas_restatement_at]); tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> assert(tas_restatement_read.last_px[tas_restatement_at] == tas_restatement_written.last_px[tas_restatement_at]); tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 2 -> assert(tas_restatement_read.fee_code[tas_restatement_at] == tas_restatement_written.fee_code[tas_restatement_at]); tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 4 -> assert(tas_restatement_read.trade_date[tas_restatement_at] == tas_restatement_written.trade_date[tas_restatement_at]); tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> assert(tas_restatement_read.clearing_price[tas_restatement_at] == tas_restatement_written.clearing_price[tas_restatement_at]); tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> assert(tas_restatement_read.clearing_symbol[tas_restatement_at] == tas_restatement_written.clearing_symbol[tas_restatement_at]); tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  assert(tas_restatement_read.multileg_reporting_type == tas_restatement_written.multileg_reporting_type);
  tas_restatement_at = 0;
  do
  :: tas_restatement_at < 8 -> assert(tas_restatement_read.secondary_exec_id[tas_restatement_at] == tas_restatement_written.secondary_exec_id[tas_restatement_at]); tas_restatement_at = tas_restatement_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Update Rejected: 25 bytes ----------------------------------------- */

/* Quote Update Rejected messages are sent in response to a Quote Update or Quote Update Option message when the entire quote block is rejected by the order handler */
typedef QuoteUpdateRejected {
  byte transaction_time[8];
  byte quote_update_id[16];
  byte quote_reject_reason
};

int quote_update_rejected_at;

/* every byte of Quote Update Rejected set to one value */
inline fill_quote_update_rejected(quote_update_rejected_record, quote_update_rejected_value) {
  quote_update_rejected_at = 0;
  do
  :: quote_update_rejected_at < 8 -> quote_update_rejected_record.transaction_time[quote_update_rejected_at] = quote_update_rejected_value; quote_update_rejected_at = quote_update_rejected_at + 1
  :: else -> break
  od;
  quote_update_rejected_at = 0;
  do
  :: quote_update_rejected_at < 16 -> quote_update_rejected_record.quote_update_id[quote_update_rejected_at] = quote_update_rejected_value; quote_update_rejected_at = quote_update_rejected_at + 1
  :: else -> break
  od;
  quote_update_rejected_record.quote_reject_reason = quote_update_rejected_value;
  skip
}

/* each byte of Quote Update Rejected set to where it lies, so a field read out of place says so */
inline ramp_quote_update_rejected(quote_update_rejected_record, quote_update_rejected_base) {
  quote_update_rejected_at = 0;
  do
  :: quote_update_rejected_at < 8 -> quote_update_rejected_record.transaction_time[quote_update_rejected_at] = (quote_update_rejected_base + 0 + quote_update_rejected_at + 1) % 256; quote_update_rejected_at = quote_update_rejected_at + 1
  :: else -> break
  od;
  quote_update_rejected_at = 0;
  do
  :: quote_update_rejected_at < 16 -> quote_update_rejected_record.quote_update_id[quote_update_rejected_at] = (quote_update_rejected_base + 8 + quote_update_rejected_at + 1) % 256; quote_update_rejected_at = quote_update_rejected_at + 1
  :: else -> break
  od;
  quote_update_rejected_record.quote_reject_reason = (quote_update_rejected_base + 24 + 1) % 256;
  skip
}

/* Quote Update Rejected to the wire, 25 bytes from where the cursor stands */
inline encode_quote_update_rejected(quote_update_rejected_record) {
  quote_update_rejected_at = 0;
  do
  :: quote_update_rejected_at < 8 -> wire[at] = quote_update_rejected_record.transaction_time[quote_update_rejected_at]; at = at + 1; quote_update_rejected_at = quote_update_rejected_at + 1
  :: else -> break
  od;
  quote_update_rejected_at = 0;
  do
  :: quote_update_rejected_at < 16 -> wire[at] = quote_update_rejected_record.quote_update_id[quote_update_rejected_at]; at = at + 1; quote_update_rejected_at = quote_update_rejected_at + 1
  :: else -> break
  od;
  wire[at] = quote_update_rejected_record.quote_reject_reason; at = at + 1;
  skip
}

/* Quote Update Rejected off the wire, 25 bytes from where the cursor stands */
inline decode_quote_update_rejected(quote_update_rejected_record) {
  quote_update_rejected_at = 0;
  do
  :: quote_update_rejected_at < 8 -> quote_update_rejected_record.transaction_time[quote_update_rejected_at] = wire[at]; at = at + 1; quote_update_rejected_at = quote_update_rejected_at + 1
  :: else -> break
  od;
  quote_update_rejected_at = 0;
  do
  :: quote_update_rejected_at < 16 -> quote_update_rejected_record.quote_update_id[quote_update_rejected_at] = wire[at]; at = at + 1; quote_update_rejected_at = quote_update_rejected_at + 1
  :: else -> break
  od;
  quote_update_rejected_record.quote_reject_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Quote Update Rejected is what was written, byte for byte */
inline equal_quote_update_rejected(quote_update_rejected_read, quote_update_rejected_written) {
  quote_update_rejected_at = 0;
  do
  :: quote_update_rejected_at < 8 -> assert(quote_update_rejected_read.transaction_time[quote_update_rejected_at] == quote_update_rejected_written.transaction_time[quote_update_rejected_at]); quote_update_rejected_at = quote_update_rejected_at + 1
  :: else -> break
  od;
  quote_update_rejected_at = 0;
  do
  :: quote_update_rejected_at < 16 -> assert(quote_update_rejected_read.quote_update_id[quote_update_rejected_at] == quote_update_rejected_written.quote_update_id[quote_update_rejected_at]); quote_update_rejected_at = quote_update_rejected_at + 1
  :: else -> break
  od;
  assert(quote_update_rejected_read.quote_reject_reason == quote_update_rejected_written.quote_reject_reason);
  skip
}

/* ---- Quote Restated: 52 bytes ------------------------------------------------ */

/* Quote Restatedmessages are sent to inform the TPH that an order has been asynchronously modified for some reason by CFE */
typedef QuoteRestated {
  byte transaction_time[8];
  byte quote_update_id[16];
  byte order_id[8];
  byte leaves_qty[4];
  byte working_price[8];
  byte quote_symbol[6];
  byte side;
  byte restatement_reason
};

int quote_restated_at;

/* every byte of Quote Restated set to one value */
inline fill_quote_restated(quote_restated_record, quote_restated_value) {
  quote_restated_at = 0;
  do
  :: quote_restated_at < 8 -> quote_restated_record.transaction_time[quote_restated_at] = quote_restated_value; quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_at = 0;
  do
  :: quote_restated_at < 16 -> quote_restated_record.quote_update_id[quote_restated_at] = quote_restated_value; quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_at = 0;
  do
  :: quote_restated_at < 8 -> quote_restated_record.order_id[quote_restated_at] = quote_restated_value; quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_at = 0;
  do
  :: quote_restated_at < 4 -> quote_restated_record.leaves_qty[quote_restated_at] = quote_restated_value; quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_at = 0;
  do
  :: quote_restated_at < 8 -> quote_restated_record.working_price[quote_restated_at] = quote_restated_value; quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_at = 0;
  do
  :: quote_restated_at < 6 -> quote_restated_record.quote_symbol[quote_restated_at] = quote_restated_value; quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_record.side = quote_restated_value;
  quote_restated_record.restatement_reason = quote_restated_value;
  skip
}

/* each byte of Quote Restated set to where it lies, so a field read out of place says so */
inline ramp_quote_restated(quote_restated_record, quote_restated_base) {
  quote_restated_at = 0;
  do
  :: quote_restated_at < 8 -> quote_restated_record.transaction_time[quote_restated_at] = (quote_restated_base + 0 + quote_restated_at + 1) % 256; quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_at = 0;
  do
  :: quote_restated_at < 16 -> quote_restated_record.quote_update_id[quote_restated_at] = (quote_restated_base + 8 + quote_restated_at + 1) % 256; quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_at = 0;
  do
  :: quote_restated_at < 8 -> quote_restated_record.order_id[quote_restated_at] = (quote_restated_base + 24 + quote_restated_at + 1) % 256; quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_at = 0;
  do
  :: quote_restated_at < 4 -> quote_restated_record.leaves_qty[quote_restated_at] = (quote_restated_base + 32 + quote_restated_at + 1) % 256; quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_at = 0;
  do
  :: quote_restated_at < 8 -> quote_restated_record.working_price[quote_restated_at] = (quote_restated_base + 36 + quote_restated_at + 1) % 256; quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_at = 0;
  do
  :: quote_restated_at < 6 -> quote_restated_record.quote_symbol[quote_restated_at] = (quote_restated_base + 44 + quote_restated_at + 1) % 256; quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_record.side = (quote_restated_base + 50 + 1) % 256;
  quote_restated_record.restatement_reason = (quote_restated_base + 51 + 1) % 256;
  skip
}

/* Quote Restated to the wire, 52 bytes from where the cursor stands */
inline encode_quote_restated(quote_restated_record) {
  quote_restated_at = 0;
  do
  :: quote_restated_at < 8 -> wire[at] = quote_restated_record.transaction_time[quote_restated_at]; at = at + 1; quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_at = 0;
  do
  :: quote_restated_at < 16 -> wire[at] = quote_restated_record.quote_update_id[quote_restated_at]; at = at + 1; quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_at = 0;
  do
  :: quote_restated_at < 8 -> wire[at] = quote_restated_record.order_id[quote_restated_at]; at = at + 1; quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_at = 0;
  do
  :: quote_restated_at < 4 -> wire[at] = quote_restated_record.leaves_qty[quote_restated_at]; at = at + 1; quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_at = 0;
  do
  :: quote_restated_at < 8 -> wire[at] = quote_restated_record.working_price[quote_restated_at]; at = at + 1; quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_at = 0;
  do
  :: quote_restated_at < 6 -> wire[at] = quote_restated_record.quote_symbol[quote_restated_at]; at = at + 1; quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  wire[at] = quote_restated_record.side; at = at + 1;
  wire[at] = quote_restated_record.restatement_reason; at = at + 1;
  skip
}

/* Quote Restated off the wire, 52 bytes from where the cursor stands */
inline decode_quote_restated(quote_restated_record) {
  quote_restated_at = 0;
  do
  :: quote_restated_at < 8 -> quote_restated_record.transaction_time[quote_restated_at] = wire[at]; at = at + 1; quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_at = 0;
  do
  :: quote_restated_at < 16 -> quote_restated_record.quote_update_id[quote_restated_at] = wire[at]; at = at + 1; quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_at = 0;
  do
  :: quote_restated_at < 8 -> quote_restated_record.order_id[quote_restated_at] = wire[at]; at = at + 1; quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_at = 0;
  do
  :: quote_restated_at < 4 -> quote_restated_record.leaves_qty[quote_restated_at] = wire[at]; at = at + 1; quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_at = 0;
  do
  :: quote_restated_at < 8 -> quote_restated_record.working_price[quote_restated_at] = wire[at]; at = at + 1; quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_at = 0;
  do
  :: quote_restated_at < 6 -> quote_restated_record.quote_symbol[quote_restated_at] = wire[at]; at = at + 1; quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_record.side = wire[at]; at = at + 1;
  quote_restated_record.restatement_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Quote Restated is what was written, byte for byte */
inline equal_quote_restated(quote_restated_read, quote_restated_written) {
  quote_restated_at = 0;
  do
  :: quote_restated_at < 8 -> assert(quote_restated_read.transaction_time[quote_restated_at] == quote_restated_written.transaction_time[quote_restated_at]); quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_at = 0;
  do
  :: quote_restated_at < 16 -> assert(quote_restated_read.quote_update_id[quote_restated_at] == quote_restated_written.quote_update_id[quote_restated_at]); quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_at = 0;
  do
  :: quote_restated_at < 8 -> assert(quote_restated_read.order_id[quote_restated_at] == quote_restated_written.order_id[quote_restated_at]); quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_at = 0;
  do
  :: quote_restated_at < 4 -> assert(quote_restated_read.leaves_qty[quote_restated_at] == quote_restated_written.leaves_qty[quote_restated_at]); quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_at = 0;
  do
  :: quote_restated_at < 8 -> assert(quote_restated_read.working_price[quote_restated_at] == quote_restated_written.working_price[quote_restated_at]); quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  quote_restated_at = 0;
  do
  :: quote_restated_at < 6 -> assert(quote_restated_read.quote_symbol[quote_restated_at] == quote_restated_written.quote_symbol[quote_restated_at]); quote_restated_at = quote_restated_at + 1
  :: else -> break
  od;
  assert(quote_restated_read.side == quote_restated_written.side);
  assert(quote_restated_read.restatement_reason == quote_restated_written.restatement_reason);
  skip
}

/* ---- Quote Execution: 71 bytes ----------------------------------------------- */

/* A Quote Execution message is used to indicate an execution has occurred on a resting quote */
typedef QuoteExecution {
  byte transaction_time[8];
  byte quote_update_id[16];
  byte order_id[8];
  byte exec_id[8];
  byte quote_symbol[6];
  byte clearing_firm[4];
  byte last_shares[4];
  byte last_px[8];
  byte leaves_qty[4];
  byte side;
  byte base_liquidity_indicator;
  byte sub_liquidity_indicator;
  byte fee_code[2]
};

int quote_execution_at;

/* every byte of Quote Execution set to one value */
inline fill_quote_execution(quote_execution_record, quote_execution_value) {
  quote_execution_at = 0;
  do
  :: quote_execution_at < 8 -> quote_execution_record.transaction_time[quote_execution_at] = quote_execution_value; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 16 -> quote_execution_record.quote_update_id[quote_execution_at] = quote_execution_value; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 8 -> quote_execution_record.order_id[quote_execution_at] = quote_execution_value; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 8 -> quote_execution_record.exec_id[quote_execution_at] = quote_execution_value; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 6 -> quote_execution_record.quote_symbol[quote_execution_at] = quote_execution_value; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 4 -> quote_execution_record.clearing_firm[quote_execution_at] = quote_execution_value; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 4 -> quote_execution_record.last_shares[quote_execution_at] = quote_execution_value; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 8 -> quote_execution_record.last_px[quote_execution_at] = quote_execution_value; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 4 -> quote_execution_record.leaves_qty[quote_execution_at] = quote_execution_value; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_record.side = quote_execution_value;
  quote_execution_record.base_liquidity_indicator = quote_execution_value;
  quote_execution_record.sub_liquidity_indicator = quote_execution_value;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 2 -> quote_execution_record.fee_code[quote_execution_at] = quote_execution_value; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Execution set to where it lies, so a field read out of place says so */
inline ramp_quote_execution(quote_execution_record, quote_execution_base) {
  quote_execution_at = 0;
  do
  :: quote_execution_at < 8 -> quote_execution_record.transaction_time[quote_execution_at] = (quote_execution_base + 0 + quote_execution_at + 1) % 256; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 16 -> quote_execution_record.quote_update_id[quote_execution_at] = (quote_execution_base + 8 + quote_execution_at + 1) % 256; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 8 -> quote_execution_record.order_id[quote_execution_at] = (quote_execution_base + 24 + quote_execution_at + 1) % 256; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 8 -> quote_execution_record.exec_id[quote_execution_at] = (quote_execution_base + 32 + quote_execution_at + 1) % 256; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 6 -> quote_execution_record.quote_symbol[quote_execution_at] = (quote_execution_base + 40 + quote_execution_at + 1) % 256; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 4 -> quote_execution_record.clearing_firm[quote_execution_at] = (quote_execution_base + 46 + quote_execution_at + 1) % 256; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 4 -> quote_execution_record.last_shares[quote_execution_at] = (quote_execution_base + 50 + quote_execution_at + 1) % 256; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 8 -> quote_execution_record.last_px[quote_execution_at] = (quote_execution_base + 54 + quote_execution_at + 1) % 256; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 4 -> quote_execution_record.leaves_qty[quote_execution_at] = (quote_execution_base + 62 + quote_execution_at + 1) % 256; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_record.side = (quote_execution_base + 66 + 1) % 256;
  quote_execution_record.base_liquidity_indicator = (quote_execution_base + 67 + 1) % 256;
  quote_execution_record.sub_liquidity_indicator = (quote_execution_base + 68 + 1) % 256;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 2 -> quote_execution_record.fee_code[quote_execution_at] = (quote_execution_base + 69 + quote_execution_at + 1) % 256; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Execution to the wire, 71 bytes from where the cursor stands */
inline encode_quote_execution(quote_execution_record) {
  quote_execution_at = 0;
  do
  :: quote_execution_at < 8 -> wire[at] = quote_execution_record.transaction_time[quote_execution_at]; at = at + 1; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 16 -> wire[at] = quote_execution_record.quote_update_id[quote_execution_at]; at = at + 1; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 8 -> wire[at] = quote_execution_record.order_id[quote_execution_at]; at = at + 1; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 8 -> wire[at] = quote_execution_record.exec_id[quote_execution_at]; at = at + 1; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 6 -> wire[at] = quote_execution_record.quote_symbol[quote_execution_at]; at = at + 1; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 4 -> wire[at] = quote_execution_record.clearing_firm[quote_execution_at]; at = at + 1; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 4 -> wire[at] = quote_execution_record.last_shares[quote_execution_at]; at = at + 1; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 8 -> wire[at] = quote_execution_record.last_px[quote_execution_at]; at = at + 1; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 4 -> wire[at] = quote_execution_record.leaves_qty[quote_execution_at]; at = at + 1; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  wire[at] = quote_execution_record.side; at = at + 1;
  wire[at] = quote_execution_record.base_liquidity_indicator; at = at + 1;
  wire[at] = quote_execution_record.sub_liquidity_indicator; at = at + 1;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 2 -> wire[at] = quote_execution_record.fee_code[quote_execution_at]; at = at + 1; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Execution off the wire, 71 bytes from where the cursor stands */
inline decode_quote_execution(quote_execution_record) {
  quote_execution_at = 0;
  do
  :: quote_execution_at < 8 -> quote_execution_record.transaction_time[quote_execution_at] = wire[at]; at = at + 1; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 16 -> quote_execution_record.quote_update_id[quote_execution_at] = wire[at]; at = at + 1; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 8 -> quote_execution_record.order_id[quote_execution_at] = wire[at]; at = at + 1; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 8 -> quote_execution_record.exec_id[quote_execution_at] = wire[at]; at = at + 1; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 6 -> quote_execution_record.quote_symbol[quote_execution_at] = wire[at]; at = at + 1; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 4 -> quote_execution_record.clearing_firm[quote_execution_at] = wire[at]; at = at + 1; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 4 -> quote_execution_record.last_shares[quote_execution_at] = wire[at]; at = at + 1; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 8 -> quote_execution_record.last_px[quote_execution_at] = wire[at]; at = at + 1; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 4 -> quote_execution_record.leaves_qty[quote_execution_at] = wire[at]; at = at + 1; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_record.side = wire[at]; at = at + 1;
  quote_execution_record.base_liquidity_indicator = wire[at]; at = at + 1;
  quote_execution_record.sub_liquidity_indicator = wire[at]; at = at + 1;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 2 -> quote_execution_record.fee_code[quote_execution_at] = wire[at]; at = at + 1; quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Execution is what was written, byte for byte */
inline equal_quote_execution(quote_execution_read, quote_execution_written) {
  quote_execution_at = 0;
  do
  :: quote_execution_at < 8 -> assert(quote_execution_read.transaction_time[quote_execution_at] == quote_execution_written.transaction_time[quote_execution_at]); quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 16 -> assert(quote_execution_read.quote_update_id[quote_execution_at] == quote_execution_written.quote_update_id[quote_execution_at]); quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 8 -> assert(quote_execution_read.order_id[quote_execution_at] == quote_execution_written.order_id[quote_execution_at]); quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 8 -> assert(quote_execution_read.exec_id[quote_execution_at] == quote_execution_written.exec_id[quote_execution_at]); quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 6 -> assert(quote_execution_read.quote_symbol[quote_execution_at] == quote_execution_written.quote_symbol[quote_execution_at]); quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 4 -> assert(quote_execution_read.clearing_firm[quote_execution_at] == quote_execution_written.clearing_firm[quote_execution_at]); quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 4 -> assert(quote_execution_read.last_shares[quote_execution_at] == quote_execution_written.last_shares[quote_execution_at]); quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 8 -> assert(quote_execution_read.last_px[quote_execution_at] == quote_execution_written.last_px[quote_execution_at]); quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  quote_execution_at = 0;
  do
  :: quote_execution_at < 4 -> assert(quote_execution_read.leaves_qty[quote_execution_at] == quote_execution_written.leaves_qty[quote_execution_at]); quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  assert(quote_execution_read.side == quote_execution_written.side);
  assert(quote_execution_read.base_liquidity_indicator == quote_execution_written.base_liquidity_indicator);
  assert(quote_execution_read.sub_liquidity_indicator == quote_execution_written.sub_liquidity_indicator);
  quote_execution_at = 0;
  do
  :: quote_execution_at < 2 -> assert(quote_execution_read.fee_code[quote_execution_at] == quote_execution_written.fee_code[quote_execution_at]); quote_execution_at = quote_execution_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Cancelled: 40 bytes ----------------------------------------------- */

/* A Quote Cancelled message will be sent to indicate an unsolicited cancellation of a quote entered with a Quote Update message */
typedef QuoteCancelled {
  byte transaction_time[8];
  byte quote_update_id[16];
  byte order_id[8];
  byte quote_symbol[6];
  byte side;
  byte cancel_reason
};

int quote_cancelled_at;

/* every byte of Quote Cancelled set to one value */
inline fill_quote_cancelled(quote_cancelled_record, quote_cancelled_value) {
  quote_cancelled_at = 0;
  do
  :: quote_cancelled_at < 8 -> quote_cancelled_record.transaction_time[quote_cancelled_at] = quote_cancelled_value; quote_cancelled_at = quote_cancelled_at + 1
  :: else -> break
  od;
  quote_cancelled_at = 0;
  do
  :: quote_cancelled_at < 16 -> quote_cancelled_record.quote_update_id[quote_cancelled_at] = quote_cancelled_value; quote_cancelled_at = quote_cancelled_at + 1
  :: else -> break
  od;
  quote_cancelled_at = 0;
  do
  :: quote_cancelled_at < 8 -> quote_cancelled_record.order_id[quote_cancelled_at] = quote_cancelled_value; quote_cancelled_at = quote_cancelled_at + 1
  :: else -> break
  od;
  quote_cancelled_at = 0;
  do
  :: quote_cancelled_at < 6 -> quote_cancelled_record.quote_symbol[quote_cancelled_at] = quote_cancelled_value; quote_cancelled_at = quote_cancelled_at + 1
  :: else -> break
  od;
  quote_cancelled_record.side = quote_cancelled_value;
  quote_cancelled_record.cancel_reason = quote_cancelled_value;
  skip
}

/* each byte of Quote Cancelled set to where it lies, so a field read out of place says so */
inline ramp_quote_cancelled(quote_cancelled_record, quote_cancelled_base) {
  quote_cancelled_at = 0;
  do
  :: quote_cancelled_at < 8 -> quote_cancelled_record.transaction_time[quote_cancelled_at] = (quote_cancelled_base + 0 + quote_cancelled_at + 1) % 256; quote_cancelled_at = quote_cancelled_at + 1
  :: else -> break
  od;
  quote_cancelled_at = 0;
  do
  :: quote_cancelled_at < 16 -> quote_cancelled_record.quote_update_id[quote_cancelled_at] = (quote_cancelled_base + 8 + quote_cancelled_at + 1) % 256; quote_cancelled_at = quote_cancelled_at + 1
  :: else -> break
  od;
  quote_cancelled_at = 0;
  do
  :: quote_cancelled_at < 8 -> quote_cancelled_record.order_id[quote_cancelled_at] = (quote_cancelled_base + 24 + quote_cancelled_at + 1) % 256; quote_cancelled_at = quote_cancelled_at + 1
  :: else -> break
  od;
  quote_cancelled_at = 0;
  do
  :: quote_cancelled_at < 6 -> quote_cancelled_record.quote_symbol[quote_cancelled_at] = (quote_cancelled_base + 32 + quote_cancelled_at + 1) % 256; quote_cancelled_at = quote_cancelled_at + 1
  :: else -> break
  od;
  quote_cancelled_record.side = (quote_cancelled_base + 38 + 1) % 256;
  quote_cancelled_record.cancel_reason = (quote_cancelled_base + 39 + 1) % 256;
  skip
}

/* Quote Cancelled to the wire, 40 bytes from where the cursor stands */
inline encode_quote_cancelled(quote_cancelled_record) {
  quote_cancelled_at = 0;
  do
  :: quote_cancelled_at < 8 -> wire[at] = quote_cancelled_record.transaction_time[quote_cancelled_at]; at = at + 1; quote_cancelled_at = quote_cancelled_at + 1
  :: else -> break
  od;
  quote_cancelled_at = 0;
  do
  :: quote_cancelled_at < 16 -> wire[at] = quote_cancelled_record.quote_update_id[quote_cancelled_at]; at = at + 1; quote_cancelled_at = quote_cancelled_at + 1
  :: else -> break
  od;
  quote_cancelled_at = 0;
  do
  :: quote_cancelled_at < 8 -> wire[at] = quote_cancelled_record.order_id[quote_cancelled_at]; at = at + 1; quote_cancelled_at = quote_cancelled_at + 1
  :: else -> break
  od;
  quote_cancelled_at = 0;
  do
  :: quote_cancelled_at < 6 -> wire[at] = quote_cancelled_record.quote_symbol[quote_cancelled_at]; at = at + 1; quote_cancelled_at = quote_cancelled_at + 1
  :: else -> break
  od;
  wire[at] = quote_cancelled_record.side; at = at + 1;
  wire[at] = quote_cancelled_record.cancel_reason; at = at + 1;
  skip
}

/* Quote Cancelled off the wire, 40 bytes from where the cursor stands */
inline decode_quote_cancelled(quote_cancelled_record) {
  quote_cancelled_at = 0;
  do
  :: quote_cancelled_at < 8 -> quote_cancelled_record.transaction_time[quote_cancelled_at] = wire[at]; at = at + 1; quote_cancelled_at = quote_cancelled_at + 1
  :: else -> break
  od;
  quote_cancelled_at = 0;
  do
  :: quote_cancelled_at < 16 -> quote_cancelled_record.quote_update_id[quote_cancelled_at] = wire[at]; at = at + 1; quote_cancelled_at = quote_cancelled_at + 1
  :: else -> break
  od;
  quote_cancelled_at = 0;
  do
  :: quote_cancelled_at < 8 -> quote_cancelled_record.order_id[quote_cancelled_at] = wire[at]; at = at + 1; quote_cancelled_at = quote_cancelled_at + 1
  :: else -> break
  od;
  quote_cancelled_at = 0;
  do
  :: quote_cancelled_at < 6 -> quote_cancelled_record.quote_symbol[quote_cancelled_at] = wire[at]; at = at + 1; quote_cancelled_at = quote_cancelled_at + 1
  :: else -> break
  od;
  quote_cancelled_record.side = wire[at]; at = at + 1;
  quote_cancelled_record.cancel_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Quote Cancelled is what was written, byte for byte */
inline equal_quote_cancelled(quote_cancelled_read, quote_cancelled_written) {
  quote_cancelled_at = 0;
  do
  :: quote_cancelled_at < 8 -> assert(quote_cancelled_read.transaction_time[quote_cancelled_at] == quote_cancelled_written.transaction_time[quote_cancelled_at]); quote_cancelled_at = quote_cancelled_at + 1
  :: else -> break
  od;
  quote_cancelled_at = 0;
  do
  :: quote_cancelled_at < 16 -> assert(quote_cancelled_read.quote_update_id[quote_cancelled_at] == quote_cancelled_written.quote_update_id[quote_cancelled_at]); quote_cancelled_at = quote_cancelled_at + 1
  :: else -> break
  od;
  quote_cancelled_at = 0;
  do
  :: quote_cancelled_at < 8 -> assert(quote_cancelled_read.order_id[quote_cancelled_at] == quote_cancelled_written.order_id[quote_cancelled_at]); quote_cancelled_at = quote_cancelled_at + 1
  :: else -> break
  od;
  quote_cancelled_at = 0;
  do
  :: quote_cancelled_at < 6 -> assert(quote_cancelled_read.quote_symbol[quote_cancelled_at] == quote_cancelled_written.quote_symbol[quote_cancelled_at]); quote_cancelled_at = quote_cancelled_at + 1
  :: else -> break
  od;
  assert(quote_cancelled_read.side == quote_cancelled_written.side);
  assert(quote_cancelled_read.cancel_reason == quote_cancelled_written.cancel_reason);
  skip
}

/* ---- Tas Quote Restatement: 54 bytes ----------------------------------------- */

/* A TAS Quote Restatement is sent post-settlement time for each TAS quote execution during the associated business day to communicate the updated Price and Symbol associated with the cleared execution */
typedef TasQuoteRestatement {
  byte transaction_time[8];
  byte quote_update_id[16];
  byte exec_id[8];
  byte quote_symbol[6];
  byte clearing_symbol[8];
  byte clearing_price[8]
};

int tas_quote_restatement_at;

/* every byte of Tas Quote Restatement set to one value */
inline fill_tas_quote_restatement(tas_quote_restatement_record, tas_quote_restatement_value) {
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 8 -> tas_quote_restatement_record.transaction_time[tas_quote_restatement_at] = tas_quote_restatement_value; tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 16 -> tas_quote_restatement_record.quote_update_id[tas_quote_restatement_at] = tas_quote_restatement_value; tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 8 -> tas_quote_restatement_record.exec_id[tas_quote_restatement_at] = tas_quote_restatement_value; tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 6 -> tas_quote_restatement_record.quote_symbol[tas_quote_restatement_at] = tas_quote_restatement_value; tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 8 -> tas_quote_restatement_record.clearing_symbol[tas_quote_restatement_at] = tas_quote_restatement_value; tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 8 -> tas_quote_restatement_record.clearing_price[tas_quote_restatement_at] = tas_quote_restatement_value; tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Tas Quote Restatement set to where it lies, so a field read out of place says so */
inline ramp_tas_quote_restatement(tas_quote_restatement_record, tas_quote_restatement_base) {
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 8 -> tas_quote_restatement_record.transaction_time[tas_quote_restatement_at] = (tas_quote_restatement_base + 0 + tas_quote_restatement_at + 1) % 256; tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 16 -> tas_quote_restatement_record.quote_update_id[tas_quote_restatement_at] = (tas_quote_restatement_base + 8 + tas_quote_restatement_at + 1) % 256; tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 8 -> tas_quote_restatement_record.exec_id[tas_quote_restatement_at] = (tas_quote_restatement_base + 24 + tas_quote_restatement_at + 1) % 256; tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 6 -> tas_quote_restatement_record.quote_symbol[tas_quote_restatement_at] = (tas_quote_restatement_base + 32 + tas_quote_restatement_at + 1) % 256; tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 8 -> tas_quote_restatement_record.clearing_symbol[tas_quote_restatement_at] = (tas_quote_restatement_base + 38 + tas_quote_restatement_at + 1) % 256; tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 8 -> tas_quote_restatement_record.clearing_price[tas_quote_restatement_at] = (tas_quote_restatement_base + 46 + tas_quote_restatement_at + 1) % 256; tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  skip
}

/* Tas Quote Restatement to the wire, 54 bytes from where the cursor stands */
inline encode_tas_quote_restatement(tas_quote_restatement_record) {
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 8 -> wire[at] = tas_quote_restatement_record.transaction_time[tas_quote_restatement_at]; at = at + 1; tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 16 -> wire[at] = tas_quote_restatement_record.quote_update_id[tas_quote_restatement_at]; at = at + 1; tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 8 -> wire[at] = tas_quote_restatement_record.exec_id[tas_quote_restatement_at]; at = at + 1; tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 6 -> wire[at] = tas_quote_restatement_record.quote_symbol[tas_quote_restatement_at]; at = at + 1; tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 8 -> wire[at] = tas_quote_restatement_record.clearing_symbol[tas_quote_restatement_at]; at = at + 1; tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 8 -> wire[at] = tas_quote_restatement_record.clearing_price[tas_quote_restatement_at]; at = at + 1; tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  skip
}

/* Tas Quote Restatement off the wire, 54 bytes from where the cursor stands */
inline decode_tas_quote_restatement(tas_quote_restatement_record) {
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 8 -> tas_quote_restatement_record.transaction_time[tas_quote_restatement_at] = wire[at]; at = at + 1; tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 16 -> tas_quote_restatement_record.quote_update_id[tas_quote_restatement_at] = wire[at]; at = at + 1; tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 8 -> tas_quote_restatement_record.exec_id[tas_quote_restatement_at] = wire[at]; at = at + 1; tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 6 -> tas_quote_restatement_record.quote_symbol[tas_quote_restatement_at] = wire[at]; at = at + 1; tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 8 -> tas_quote_restatement_record.clearing_symbol[tas_quote_restatement_at] = wire[at]; at = at + 1; tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 8 -> tas_quote_restatement_record.clearing_price[tas_quote_restatement_at] = wire[at]; at = at + 1; tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Tas Quote Restatement is what was written, byte for byte */
inline equal_tas_quote_restatement(tas_quote_restatement_read, tas_quote_restatement_written) {
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 8 -> assert(tas_quote_restatement_read.transaction_time[tas_quote_restatement_at] == tas_quote_restatement_written.transaction_time[tas_quote_restatement_at]); tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 16 -> assert(tas_quote_restatement_read.quote_update_id[tas_quote_restatement_at] == tas_quote_restatement_written.quote_update_id[tas_quote_restatement_at]); tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 8 -> assert(tas_quote_restatement_read.exec_id[tas_quote_restatement_at] == tas_quote_restatement_written.exec_id[tas_quote_restatement_at]); tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 6 -> assert(tas_quote_restatement_read.quote_symbol[tas_quote_restatement_at] == tas_quote_restatement_written.quote_symbol[tas_quote_restatement_at]); tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 8 -> assert(tas_quote_restatement_read.clearing_symbol[tas_quote_restatement_at] == tas_quote_restatement_written.clearing_symbol[tas_quote_restatement_at]); tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  tas_quote_restatement_at = 0;
  do
  :: tas_quote_restatement_at < 8 -> assert(tas_quote_restatement_read.clearing_price[tas_quote_restatement_at] == tas_quote_restatement_written.clearing_price[tas_quote_restatement_at]); tas_quote_restatement_at = tas_quote_restatement_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reset Risk Acknowledgement: 25 bytes ------------------------------------ */

/* Response to a Reset Risk request */
typedef ResetRiskAcknowledgement {
  byte risk_status_id[16];
  byte risk_reset_result;
  byte request_received_time[8]
};

int reset_risk_acknowledgement_at;

/* every byte of Reset Risk Acknowledgement set to one value */
inline fill_reset_risk_acknowledgement(reset_risk_acknowledgement_record, reset_risk_acknowledgement_value) {
  reset_risk_acknowledgement_at = 0;
  do
  :: reset_risk_acknowledgement_at < 16 -> reset_risk_acknowledgement_record.risk_status_id[reset_risk_acknowledgement_at] = reset_risk_acknowledgement_value; reset_risk_acknowledgement_at = reset_risk_acknowledgement_at + 1
  :: else -> break
  od;
  reset_risk_acknowledgement_record.risk_reset_result = reset_risk_acknowledgement_value;
  reset_risk_acknowledgement_at = 0;
  do
  :: reset_risk_acknowledgement_at < 8 -> reset_risk_acknowledgement_record.request_received_time[reset_risk_acknowledgement_at] = reset_risk_acknowledgement_value; reset_risk_acknowledgement_at = reset_risk_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reset Risk Acknowledgement set to where it lies, so a field read out of place says so */
inline ramp_reset_risk_acknowledgement(reset_risk_acknowledgement_record, reset_risk_acknowledgement_base) {
  reset_risk_acknowledgement_at = 0;
  do
  :: reset_risk_acknowledgement_at < 16 -> reset_risk_acknowledgement_record.risk_status_id[reset_risk_acknowledgement_at] = (reset_risk_acknowledgement_base + 0 + reset_risk_acknowledgement_at + 1) % 256; reset_risk_acknowledgement_at = reset_risk_acknowledgement_at + 1
  :: else -> break
  od;
  reset_risk_acknowledgement_record.risk_reset_result = (reset_risk_acknowledgement_base + 16 + 1) % 256;
  reset_risk_acknowledgement_at = 0;
  do
  :: reset_risk_acknowledgement_at < 8 -> reset_risk_acknowledgement_record.request_received_time[reset_risk_acknowledgement_at] = (reset_risk_acknowledgement_base + 17 + reset_risk_acknowledgement_at + 1) % 256; reset_risk_acknowledgement_at = reset_risk_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Reset Risk Acknowledgement to the wire, 25 bytes from where the cursor stands */
inline encode_reset_risk_acknowledgement(reset_risk_acknowledgement_record) {
  reset_risk_acknowledgement_at = 0;
  do
  :: reset_risk_acknowledgement_at < 16 -> wire[at] = reset_risk_acknowledgement_record.risk_status_id[reset_risk_acknowledgement_at]; at = at + 1; reset_risk_acknowledgement_at = reset_risk_acknowledgement_at + 1
  :: else -> break
  od;
  wire[at] = reset_risk_acknowledgement_record.risk_reset_result; at = at + 1;
  reset_risk_acknowledgement_at = 0;
  do
  :: reset_risk_acknowledgement_at < 8 -> wire[at] = reset_risk_acknowledgement_record.request_received_time[reset_risk_acknowledgement_at]; at = at + 1; reset_risk_acknowledgement_at = reset_risk_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Reset Risk Acknowledgement off the wire, 25 bytes from where the cursor stands */
inline decode_reset_risk_acknowledgement(reset_risk_acknowledgement_record) {
  reset_risk_acknowledgement_at = 0;
  do
  :: reset_risk_acknowledgement_at < 16 -> reset_risk_acknowledgement_record.risk_status_id[reset_risk_acknowledgement_at] = wire[at]; at = at + 1; reset_risk_acknowledgement_at = reset_risk_acknowledgement_at + 1
  :: else -> break
  od;
  reset_risk_acknowledgement_record.risk_reset_result = wire[at]; at = at + 1;
  reset_risk_acknowledgement_at = 0;
  do
  :: reset_risk_acknowledgement_at < 8 -> reset_risk_acknowledgement_record.request_received_time[reset_risk_acknowledgement_at] = wire[at]; at = at + 1; reset_risk_acknowledgement_at = reset_risk_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reset Risk Acknowledgement is what was written, byte for byte */
inline equal_reset_risk_acknowledgement(reset_risk_acknowledgement_read, reset_risk_acknowledgement_written) {
  reset_risk_acknowledgement_at = 0;
  do
  :: reset_risk_acknowledgement_at < 16 -> assert(reset_risk_acknowledgement_read.risk_status_id[reset_risk_acknowledgement_at] == reset_risk_acknowledgement_written.risk_status_id[reset_risk_acknowledgement_at]); reset_risk_acknowledgement_at = reset_risk_acknowledgement_at + 1
  :: else -> break
  od;
  assert(reset_risk_acknowledgement_read.risk_reset_result == reset_risk_acknowledgement_written.risk_reset_result);
  reset_risk_acknowledgement_at = 0;
  do
  :: reset_risk_acknowledgement_at < 8 -> assert(reset_risk_acknowledgement_read.request_received_time[reset_risk_acknowledgement_at] == reset_risk_acknowledgement_written.request_received_time[reset_risk_acknowledgement_at]); reset_risk_acknowledgement_at = reset_risk_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* ---- New Complex Instrument Rejected Option: 93 bytes ------------------------ */

/* The New Complex Instrument Rejected indicates that a requested complex strategy has been rejected */
typedef NewComplexInstrumentRejectedOption {
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte clearing_firm[4];
  byte complex_instrument_reject_reason;
  byte text[60]
};

int new_complex_instrument_rejected_option_at;

/* every byte of New Complex Instrument Rejected Option set to one value */
inline fill_new_complex_instrument_rejected_option(new_complex_instrument_rejected_option_record, new_complex_instrument_rejected_option_value) {
  new_complex_instrument_rejected_option_at = 0;
  do
  :: new_complex_instrument_rejected_option_at < 8 -> new_complex_instrument_rejected_option_record.transaction_time[new_complex_instrument_rejected_option_at] = new_complex_instrument_rejected_option_value; new_complex_instrument_rejected_option_at = new_complex_instrument_rejected_option_at + 1
  :: else -> break
  od;
  new_complex_instrument_rejected_option_at = 0;
  do
  :: new_complex_instrument_rejected_option_at < 20 -> new_complex_instrument_rejected_option_record.cl_ord_id[new_complex_instrument_rejected_option_at] = new_complex_instrument_rejected_option_value; new_complex_instrument_rejected_option_at = new_complex_instrument_rejected_option_at + 1
  :: else -> break
  od;
  new_complex_instrument_rejected_option_at = 0;
  do
  :: new_complex_instrument_rejected_option_at < 4 -> new_complex_instrument_rejected_option_record.clearing_firm[new_complex_instrument_rejected_option_at] = new_complex_instrument_rejected_option_value; new_complex_instrument_rejected_option_at = new_complex_instrument_rejected_option_at + 1
  :: else -> break
  od;
  new_complex_instrument_rejected_option_record.complex_instrument_reject_reason = new_complex_instrument_rejected_option_value;
  new_complex_instrument_rejected_option_at = 0;
  do
  :: new_complex_instrument_rejected_option_at < 60 -> new_complex_instrument_rejected_option_record.text[new_complex_instrument_rejected_option_at] = new_complex_instrument_rejected_option_value; new_complex_instrument_rejected_option_at = new_complex_instrument_rejected_option_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of New Complex Instrument Rejected Option set to where it lies, so a field read out of place says so */
inline ramp_new_complex_instrument_rejected_option(new_complex_instrument_rejected_option_record, new_complex_instrument_rejected_option_base) {
  new_complex_instrument_rejected_option_at = 0;
  do
  :: new_complex_instrument_rejected_option_at < 8 -> new_complex_instrument_rejected_option_record.transaction_time[new_complex_instrument_rejected_option_at] = (new_complex_instrument_rejected_option_base + 0 + new_complex_instrument_rejected_option_at + 1) % 256; new_complex_instrument_rejected_option_at = new_complex_instrument_rejected_option_at + 1
  :: else -> break
  od;
  new_complex_instrument_rejected_option_at = 0;
  do
  :: new_complex_instrument_rejected_option_at < 20 -> new_complex_instrument_rejected_option_record.cl_ord_id[new_complex_instrument_rejected_option_at] = (new_complex_instrument_rejected_option_base + 8 + new_complex_instrument_rejected_option_at + 1) % 256; new_complex_instrument_rejected_option_at = new_complex_instrument_rejected_option_at + 1
  :: else -> break
  od;
  new_complex_instrument_rejected_option_at = 0;
  do
  :: new_complex_instrument_rejected_option_at < 4 -> new_complex_instrument_rejected_option_record.clearing_firm[new_complex_instrument_rejected_option_at] = (new_complex_instrument_rejected_option_base + 28 + new_complex_instrument_rejected_option_at + 1) % 256; new_complex_instrument_rejected_option_at = new_complex_instrument_rejected_option_at + 1
  :: else -> break
  od;
  new_complex_instrument_rejected_option_record.complex_instrument_reject_reason = (new_complex_instrument_rejected_option_base + 32 + 1) % 256;
  new_complex_instrument_rejected_option_at = 0;
  do
  :: new_complex_instrument_rejected_option_at < 60 -> new_complex_instrument_rejected_option_record.text[new_complex_instrument_rejected_option_at] = (new_complex_instrument_rejected_option_base + 33 + new_complex_instrument_rejected_option_at + 1) % 256; new_complex_instrument_rejected_option_at = new_complex_instrument_rejected_option_at + 1
  :: else -> break
  od;
  skip
}

/* New Complex Instrument Rejected Option to the wire, 93 bytes from where the cursor stands */
inline encode_new_complex_instrument_rejected_option(new_complex_instrument_rejected_option_record) {
  new_complex_instrument_rejected_option_at = 0;
  do
  :: new_complex_instrument_rejected_option_at < 8 -> wire[at] = new_complex_instrument_rejected_option_record.transaction_time[new_complex_instrument_rejected_option_at]; at = at + 1; new_complex_instrument_rejected_option_at = new_complex_instrument_rejected_option_at + 1
  :: else -> break
  od;
  new_complex_instrument_rejected_option_at = 0;
  do
  :: new_complex_instrument_rejected_option_at < 20 -> wire[at] = new_complex_instrument_rejected_option_record.cl_ord_id[new_complex_instrument_rejected_option_at]; at = at + 1; new_complex_instrument_rejected_option_at = new_complex_instrument_rejected_option_at + 1
  :: else -> break
  od;
  new_complex_instrument_rejected_option_at = 0;
  do
  :: new_complex_instrument_rejected_option_at < 4 -> wire[at] = new_complex_instrument_rejected_option_record.clearing_firm[new_complex_instrument_rejected_option_at]; at = at + 1; new_complex_instrument_rejected_option_at = new_complex_instrument_rejected_option_at + 1
  :: else -> break
  od;
  wire[at] = new_complex_instrument_rejected_option_record.complex_instrument_reject_reason; at = at + 1;
  new_complex_instrument_rejected_option_at = 0;
  do
  :: new_complex_instrument_rejected_option_at < 60 -> wire[at] = new_complex_instrument_rejected_option_record.text[new_complex_instrument_rejected_option_at]; at = at + 1; new_complex_instrument_rejected_option_at = new_complex_instrument_rejected_option_at + 1
  :: else -> break
  od;
  skip
}

/* New Complex Instrument Rejected Option off the wire, 93 bytes from where the cursor stands */
inline decode_new_complex_instrument_rejected_option(new_complex_instrument_rejected_option_record) {
  new_complex_instrument_rejected_option_at = 0;
  do
  :: new_complex_instrument_rejected_option_at < 8 -> new_complex_instrument_rejected_option_record.transaction_time[new_complex_instrument_rejected_option_at] = wire[at]; at = at + 1; new_complex_instrument_rejected_option_at = new_complex_instrument_rejected_option_at + 1
  :: else -> break
  od;
  new_complex_instrument_rejected_option_at = 0;
  do
  :: new_complex_instrument_rejected_option_at < 20 -> new_complex_instrument_rejected_option_record.cl_ord_id[new_complex_instrument_rejected_option_at] = wire[at]; at = at + 1; new_complex_instrument_rejected_option_at = new_complex_instrument_rejected_option_at + 1
  :: else -> break
  od;
  new_complex_instrument_rejected_option_at = 0;
  do
  :: new_complex_instrument_rejected_option_at < 4 -> new_complex_instrument_rejected_option_record.clearing_firm[new_complex_instrument_rejected_option_at] = wire[at]; at = at + 1; new_complex_instrument_rejected_option_at = new_complex_instrument_rejected_option_at + 1
  :: else -> break
  od;
  new_complex_instrument_rejected_option_record.complex_instrument_reject_reason = wire[at]; at = at + 1;
  new_complex_instrument_rejected_option_at = 0;
  do
  :: new_complex_instrument_rejected_option_at < 60 -> new_complex_instrument_rejected_option_record.text[new_complex_instrument_rejected_option_at] = wire[at]; at = at + 1; new_complex_instrument_rejected_option_at = new_complex_instrument_rejected_option_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of New Complex Instrument Rejected Option is what was written, byte for byte */
inline equal_new_complex_instrument_rejected_option(new_complex_instrument_rejected_option_read, new_complex_instrument_rejected_option_written) {
  new_complex_instrument_rejected_option_at = 0;
  do
  :: new_complex_instrument_rejected_option_at < 8 -> assert(new_complex_instrument_rejected_option_read.transaction_time[new_complex_instrument_rejected_option_at] == new_complex_instrument_rejected_option_written.transaction_time[new_complex_instrument_rejected_option_at]); new_complex_instrument_rejected_option_at = new_complex_instrument_rejected_option_at + 1
  :: else -> break
  od;
  new_complex_instrument_rejected_option_at = 0;
  do
  :: new_complex_instrument_rejected_option_at < 20 -> assert(new_complex_instrument_rejected_option_read.cl_ord_id[new_complex_instrument_rejected_option_at] == new_complex_instrument_rejected_option_written.cl_ord_id[new_complex_instrument_rejected_option_at]); new_complex_instrument_rejected_option_at = new_complex_instrument_rejected_option_at + 1
  :: else -> break
  od;
  new_complex_instrument_rejected_option_at = 0;
  do
  :: new_complex_instrument_rejected_option_at < 4 -> assert(new_complex_instrument_rejected_option_read.clearing_firm[new_complex_instrument_rejected_option_at] == new_complex_instrument_rejected_option_written.clearing_firm[new_complex_instrument_rejected_option_at]); new_complex_instrument_rejected_option_at = new_complex_instrument_rejected_option_at + 1
  :: else -> break
  od;
  assert(new_complex_instrument_rejected_option_read.complex_instrument_reject_reason == new_complex_instrument_rejected_option_written.complex_instrument_reject_reason);
  new_complex_instrument_rejected_option_at = 0;
  do
  :: new_complex_instrument_rejected_option_at < 60 -> assert(new_complex_instrument_rejected_option_read.text[new_complex_instrument_rejected_option_at] == new_complex_instrument_rejected_option_written.text[new_complex_instrument_rejected_option_at]); new_complex_instrument_rejected_option_at = new_complex_instrument_rejected_option_at + 1
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

/* Prevent Match: encoded, read back, and compared */
proctype check_prevent_match() {
  PreventMatch prevent_match_sent;
  PreventMatch prevent_match_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_prevent_match(prevent_match_sent, 0)
  :: pattern == 1 -> fill_prevent_match(prevent_match_sent, 32)
  :: pattern == 2 -> fill_prevent_match(prevent_match_sent, 255)
  :: else -> ramp_prevent_match(prevent_match_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_prevent_match(prevent_match_sent);
    assert(at == 3);
    at = 0;
    decode_prevent_match(prevent_match_got);
    assert(at == 3);
    equal_prevent_match(prevent_match_got, prevent_match_sent)
  }
}

/* Order Acknowledgement: encoded, read back, and compared */
proctype check_order_acknowledgement() {
  OrderAcknowledgement order_acknowledgement_sent;
  OrderAcknowledgement order_acknowledgement_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_acknowledgement(order_acknowledgement_sent, 0)
  :: pattern == 1 -> fill_order_acknowledgement(order_acknowledgement_sent, 32)
  :: pattern == 2 -> fill_order_acknowledgement(order_acknowledgement_sent, 255)
  :: else -> ramp_order_acknowledgement(order_acknowledgement_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_acknowledgement(order_acknowledgement_sent);
    assert(at == 161);
    at = 0;
    decode_order_acknowledgement(order_acknowledgement_got);
    assert(at == 161);
    equal_order_acknowledgement(order_acknowledgement_got, order_acknowledgement_sent)
  }
}

/* Order Rejected: encoded, read back, and compared */
proctype check_order_rejected() {
  OrderRejected order_rejected_sent;
  OrderRejected order_rejected_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_rejected(order_rejected_sent, 0)
  :: pattern == 1 -> fill_order_rejected(order_rejected_sent, 32)
  :: pattern == 2 -> fill_order_rejected(order_rejected_sent, 255)
  :: else -> ramp_order_rejected(order_rejected_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_rejected(order_rejected_sent);
    assert(at == 93);
    at = 0;
    decode_order_rejected(order_rejected_got);
    assert(at == 93);
    equal_order_rejected(order_rejected_got, order_rejected_sent)
  }
}

/* Order Modified: encoded, read back, and compared */
proctype check_order_modified() {
  OrderModified order_modified_sent;
  OrderModified order_modified_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_modified(order_modified_sent, 0)
  :: pattern == 1 -> fill_order_modified(order_modified_sent, 32)
  :: pattern == 2 -> fill_order_modified(order_modified_sent, 255)
  :: else -> ramp_order_modified(order_modified_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_modified(order_modified_sent);
    assert(at == 101);
    at = 0;
    decode_order_modified(order_modified_got);
    assert(at == 101);
    equal_order_modified(order_modified_got, order_modified_sent)
  }
}

/* Modify Rejected: encoded, read back, and compared */
proctype check_modify_rejected() {
  ModifyRejected modify_rejected_sent;
  ModifyRejected modify_rejected_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_rejected(modify_rejected_sent, 0)
  :: pattern == 1 -> fill_modify_rejected(modify_rejected_sent, 32)
  :: pattern == 2 -> fill_modify_rejected(modify_rejected_sent, 255)
  :: else -> ramp_modify_rejected(modify_rejected_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_rejected(modify_rejected_sent);
    assert(at == 113);
    at = 0;
    decode_modify_rejected(modify_rejected_got);
    assert(at == 113);
    equal_modify_rejected(modify_rejected_got, modify_rejected_sent)
  }
}

/* Order Execution: encoded, read back, and compared */
proctype check_order_execution() {
  OrderExecution order_execution_sent;
  OrderExecution order_execution_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_execution(order_execution_sent, 0)
  :: pattern == 1 -> fill_order_execution(order_execution_sent, 32)
  :: pattern == 2 -> fill_order_execution(order_execution_sent, 255)
  :: else -> ramp_order_execution(order_execution_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_execution(order_execution_sent);
    assert(at == 91);
    at = 0;
    decode_order_execution(order_execution_got);
    assert(at == 91);
    equal_order_execution(order_execution_got, order_execution_sent)
  }
}

/* Order Execution Option: encoded, read back, and compared */
proctype check_order_execution_option() {
  OrderExecutionOption order_execution_option_sent;
  OrderExecutionOption order_execution_option_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_execution_option(order_execution_option_sent, 0)
  :: pattern == 1 -> fill_order_execution_option(order_execution_option_sent, 32)
  :: pattern == 2 -> fill_order_execution_option(order_execution_option_sent, 255)
  :: else -> ramp_order_execution_option(order_execution_option_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_execution_option(order_execution_option_sent);
    assert(at == 103);
    at = 0;
    decode_order_execution_option(order_execution_option_got);
    assert(at == 103);
    equal_order_execution_option(order_execution_option_got, order_execution_option_sent)
  }
}

/* Order Cancelled: encoded, read back, and compared */
proctype check_order_cancelled() {
  OrderCancelled order_cancelled_sent;
  OrderCancelled order_cancelled_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancelled(order_cancelled_sent, 0)
  :: pattern == 1 -> fill_order_cancelled(order_cancelled_sent, 32)
  :: pattern == 2 -> fill_order_cancelled(order_cancelled_sent, 255)
  :: else -> ramp_order_cancelled(order_cancelled_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancelled(order_cancelled_sent);
    assert(at == 41);
    at = 0;
    decode_order_cancelled(order_cancelled_got);
    assert(at == 41);
    equal_order_cancelled(order_cancelled_got, order_cancelled_sent)
  }
}

/* Cancel Rejected: encoded, read back, and compared */
proctype check_cancel_rejected() {
  CancelRejected cancel_rejected_sent;
  CancelRejected cancel_rejected_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_rejected(cancel_rejected_sent, 0)
  :: pattern == 1 -> fill_cancel_rejected(cancel_rejected_sent, 32)
  :: pattern == 2 -> fill_cancel_rejected(cancel_rejected_sent, 255)
  :: else -> ramp_cancel_rejected(cancel_rejected_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_rejected(cancel_rejected_sent);
    assert(at == 93);
    at = 0;
    decode_cancel_rejected(cancel_rejected_got);
    assert(at == 93);
    equal_cancel_rejected(cancel_rejected_got, cancel_rejected_sent)
  }
}

/* Mass Cancel Acknowledgement: encoded, read back, and compared */
proctype check_mass_cancel_acknowledgement() {
  MassCancelAcknowledgement mass_cancel_acknowledgement_sent;
  MassCancelAcknowledgement mass_cancel_acknowledgement_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_cancel_acknowledgement(mass_cancel_acknowledgement_sent, 0)
  :: pattern == 1 -> fill_mass_cancel_acknowledgement(mass_cancel_acknowledgement_sent, 32)
  :: pattern == 2 -> fill_mass_cancel_acknowledgement(mass_cancel_acknowledgement_sent, 255)
  :: else -> ramp_mass_cancel_acknowledgement(mass_cancel_acknowledgement_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_cancel_acknowledgement(mass_cancel_acknowledgement_sent);
    assert(at == 40);
    at = 0;
    decode_mass_cancel_acknowledgement(mass_cancel_acknowledgement_got);
    assert(at == 40);
    equal_mass_cancel_acknowledgement(mass_cancel_acknowledgement_got, mass_cancel_acknowledgement_sent)
  }
}

/* Mass Cancel Rejected: encoded, read back, and compared */
proctype check_mass_cancel_rejected() {
  MassCancelRejected mass_cancel_rejected_sent;
  MassCancelRejected mass_cancel_rejected_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_cancel_rejected(mass_cancel_rejected_sent, 0)
  :: pattern == 1 -> fill_mass_cancel_rejected(mass_cancel_rejected_sent, 32)
  :: pattern == 2 -> fill_mass_cancel_rejected(mass_cancel_rejected_sent, 255)
  :: else -> ramp_mass_cancel_rejected(mass_cancel_rejected_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_cancel_rejected(mass_cancel_rejected_sent);
    assert(at == 89);
    at = 0;
    decode_mass_cancel_rejected(mass_cancel_rejected_got);
    assert(at == 89);
    equal_mass_cancel_rejected(mass_cancel_rejected_got, mass_cancel_rejected_sent)
  }
}

/* Purge Acknowledgement: encoded, read back, and compared */
proctype check_purge_acknowledgement() {
  PurgeAcknowledgement purge_acknowledgement_sent;
  PurgeAcknowledgement purge_acknowledgement_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_purge_acknowledgement(purge_acknowledgement_sent, 0)
  :: pattern == 1 -> fill_purge_acknowledgement(purge_acknowledgement_sent, 32)
  :: pattern == 2 -> fill_purge_acknowledgement(purge_acknowledgement_sent, 255)
  :: else -> ramp_purge_acknowledgement(purge_acknowledgement_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_purge_acknowledgement(purge_acknowledgement_sent);
    assert(at == 40);
    at = 0;
    decode_purge_acknowledgement(purge_acknowledgement_got);
    assert(at == 40);
    equal_purge_acknowledgement(purge_acknowledgement_got, purge_acknowledgement_sent)
  }
}

/* Purge Rejected: encoded, read back, and compared */
proctype check_purge_rejected() {
  PurgeRejected purge_rejected_sent;
  PurgeRejected purge_rejected_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_purge_rejected(purge_rejected_sent, 0)
  :: pattern == 1 -> fill_purge_rejected(purge_rejected_sent, 32)
  :: pattern == 2 -> fill_purge_rejected(purge_rejected_sent, 255)
  :: else -> ramp_purge_rejected(purge_rejected_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_purge_rejected(purge_rejected_sent);
    assert(at == 89);
    at = 0;
    decode_purge_rejected(purge_rejected_got);
    assert(at == 89);
    equal_purge_rejected(purge_rejected_got, purge_rejected_sent)
  }
}

/* Trade Cancel Correct: encoded, read back, and compared */
proctype check_trade_cancel_correct() {
  TradeCancelCorrect trade_cancel_correct_sent;
  TradeCancelCorrect trade_cancel_correct_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancel_correct(trade_cancel_correct_sent, 0)
  :: pattern == 1 -> fill_trade_cancel_correct(trade_cancel_correct_sent, 32)
  :: pattern == 2 -> fill_trade_cancel_correct(trade_cancel_correct_sent, 255)
  :: else -> ramp_trade_cancel_correct(trade_cancel_correct_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancel_correct(trade_cancel_correct_sent);
    assert(at == 92);
    at = 0;
    decode_trade_cancel_correct(trade_cancel_correct_got);
    assert(at == 92);
    equal_trade_cancel_correct(trade_cancel_correct_got, trade_cancel_correct_sent)
  }
}

/* Trade Cancel Correct Option: encoded, read back, and compared */
proctype check_trade_cancel_correct_option() {
  TradeCancelCorrectOption trade_cancel_correct_option_sent;
  TradeCancelCorrectOption trade_cancel_correct_option_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancel_correct_option(trade_cancel_correct_option_sent, 0)
  :: pattern == 1 -> fill_trade_cancel_correct_option(trade_cancel_correct_option_sent, 32)
  :: pattern == 2 -> fill_trade_cancel_correct_option(trade_cancel_correct_option_sent, 255)
  :: else -> ramp_trade_cancel_correct_option(trade_cancel_correct_option_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancel_correct_option(trade_cancel_correct_option_sent);
    assert(at == 104);
    at = 0;
    decode_trade_cancel_correct_option(trade_cancel_correct_option_got);
    assert(at == 104);
    equal_trade_cancel_correct_option(trade_cancel_correct_option_got, trade_cancel_correct_option_sent)
  }
}

/* Tas Restatement: encoded, read back, and compared */
proctype check_tas_restatement() {
  TasRestatement tas_restatement_sent;
  TasRestatement tas_restatement_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_tas_restatement(tas_restatement_sent, 0)
  :: pattern == 1 -> fill_tas_restatement(tas_restatement_sent, 32)
  :: pattern == 2 -> fill_tas_restatement(tas_restatement_sent, 255)
  :: else -> ramp_tas_restatement(tas_restatement_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_tas_restatement(tas_restatement_sent);
    assert(at == 104);
    at = 0;
    decode_tas_restatement(tas_restatement_got);
    assert(at == 104);
    equal_tas_restatement(tas_restatement_got, tas_restatement_sent)
  }
}

/* Quote Update Rejected: encoded, read back, and compared */
proctype check_quote_update_rejected() {
  QuoteUpdateRejected quote_update_rejected_sent;
  QuoteUpdateRejected quote_update_rejected_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_update_rejected(quote_update_rejected_sent, 0)
  :: pattern == 1 -> fill_quote_update_rejected(quote_update_rejected_sent, 32)
  :: pattern == 2 -> fill_quote_update_rejected(quote_update_rejected_sent, 255)
  :: else -> ramp_quote_update_rejected(quote_update_rejected_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_update_rejected(quote_update_rejected_sent);
    assert(at == 25);
    at = 0;
    decode_quote_update_rejected(quote_update_rejected_got);
    assert(at == 25);
    equal_quote_update_rejected(quote_update_rejected_got, quote_update_rejected_sent)
  }
}

/* Quote Restated: encoded, read back, and compared */
proctype check_quote_restated() {
  QuoteRestated quote_restated_sent;
  QuoteRestated quote_restated_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_restated(quote_restated_sent, 0)
  :: pattern == 1 -> fill_quote_restated(quote_restated_sent, 32)
  :: pattern == 2 -> fill_quote_restated(quote_restated_sent, 255)
  :: else -> ramp_quote_restated(quote_restated_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_restated(quote_restated_sent);
    assert(at == 52);
    at = 0;
    decode_quote_restated(quote_restated_got);
    assert(at == 52);
    equal_quote_restated(quote_restated_got, quote_restated_sent)
  }
}

/* Quote Execution: encoded, read back, and compared */
proctype check_quote_execution() {
  QuoteExecution quote_execution_sent;
  QuoteExecution quote_execution_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_execution(quote_execution_sent, 0)
  :: pattern == 1 -> fill_quote_execution(quote_execution_sent, 32)
  :: pattern == 2 -> fill_quote_execution(quote_execution_sent, 255)
  :: else -> ramp_quote_execution(quote_execution_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_execution(quote_execution_sent);
    assert(at == 71);
    at = 0;
    decode_quote_execution(quote_execution_got);
    assert(at == 71);
    equal_quote_execution(quote_execution_got, quote_execution_sent)
  }
}

/* Quote Cancelled: encoded, read back, and compared */
proctype check_quote_cancelled() {
  QuoteCancelled quote_cancelled_sent;
  QuoteCancelled quote_cancelled_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_cancelled(quote_cancelled_sent, 0)
  :: pattern == 1 -> fill_quote_cancelled(quote_cancelled_sent, 32)
  :: pattern == 2 -> fill_quote_cancelled(quote_cancelled_sent, 255)
  :: else -> ramp_quote_cancelled(quote_cancelled_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_cancelled(quote_cancelled_sent);
    assert(at == 40);
    at = 0;
    decode_quote_cancelled(quote_cancelled_got);
    assert(at == 40);
    equal_quote_cancelled(quote_cancelled_got, quote_cancelled_sent)
  }
}

/* Tas Quote Restatement: encoded, read back, and compared */
proctype check_tas_quote_restatement() {
  TasQuoteRestatement tas_quote_restatement_sent;
  TasQuoteRestatement tas_quote_restatement_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_tas_quote_restatement(tas_quote_restatement_sent, 0)
  :: pattern == 1 -> fill_tas_quote_restatement(tas_quote_restatement_sent, 32)
  :: pattern == 2 -> fill_tas_quote_restatement(tas_quote_restatement_sent, 255)
  :: else -> ramp_tas_quote_restatement(tas_quote_restatement_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_tas_quote_restatement(tas_quote_restatement_sent);
    assert(at == 54);
    at = 0;
    decode_tas_quote_restatement(tas_quote_restatement_got);
    assert(at == 54);
    equal_tas_quote_restatement(tas_quote_restatement_got, tas_quote_restatement_sent)
  }
}

/* Reset Risk Acknowledgement: encoded, read back, and compared */
proctype check_reset_risk_acknowledgement() {
  ResetRiskAcknowledgement reset_risk_acknowledgement_sent;
  ResetRiskAcknowledgement reset_risk_acknowledgement_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reset_risk_acknowledgement(reset_risk_acknowledgement_sent, 0)
  :: pattern == 1 -> fill_reset_risk_acknowledgement(reset_risk_acknowledgement_sent, 32)
  :: pattern == 2 -> fill_reset_risk_acknowledgement(reset_risk_acknowledgement_sent, 255)
  :: else -> ramp_reset_risk_acknowledgement(reset_risk_acknowledgement_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reset_risk_acknowledgement(reset_risk_acknowledgement_sent);
    assert(at == 25);
    at = 0;
    decode_reset_risk_acknowledgement(reset_risk_acknowledgement_got);
    assert(at == 25);
    equal_reset_risk_acknowledgement(reset_risk_acknowledgement_got, reset_risk_acknowledgement_sent)
  }
}

/* New Complex Instrument Rejected Option: encoded, read back, and compared */
proctype check_new_complex_instrument_rejected_option() {
  NewComplexInstrumentRejectedOption new_complex_instrument_rejected_option_sent;
  NewComplexInstrumentRejectedOption new_complex_instrument_rejected_option_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_complex_instrument_rejected_option(new_complex_instrument_rejected_option_sent, 0)
  :: pattern == 1 -> fill_new_complex_instrument_rejected_option(new_complex_instrument_rejected_option_sent, 32)
  :: pattern == 2 -> fill_new_complex_instrument_rejected_option(new_complex_instrument_rejected_option_sent, 255)
  :: else -> ramp_new_complex_instrument_rejected_option(new_complex_instrument_rejected_option_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_complex_instrument_rejected_option(new_complex_instrument_rejected_option_sent);
    assert(at == 93);
    at = 0;
    decode_new_complex_instrument_rejected_option(new_complex_instrument_rejected_option_got);
    assert(at == 93);
    equal_new_complex_instrument_rejected_option(new_complex_instrument_rejected_option_got, new_complex_instrument_rejected_option_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_exchange_message_header()
  :: run check_logout_response_message()
  :: run check_prevent_match()
  :: run check_order_acknowledgement()
  :: run check_order_rejected()
  :: run check_order_modified()
  :: run check_modify_rejected()
  :: run check_order_execution()
  :: run check_order_execution_option()
  :: run check_order_cancelled()
  :: run check_cancel_rejected()
  :: run check_mass_cancel_acknowledgement()
  :: run check_mass_cancel_rejected()
  :: run check_purge_acknowledgement()
  :: run check_purge_rejected()
  :: run check_trade_cancel_correct()
  :: run check_trade_cancel_correct_option()
  :: run check_tas_restatement()
  :: run check_quote_update_rejected()
  :: run check_quote_restated()
  :: run check_quote_execution()
  :: run check_quote_cancelled()
  :: run check_tas_quote_restatement()
  :: run check_reset_risk_acknowledgement()
  :: run check_new_complex_instrument_rejected_option()
  fi
}
