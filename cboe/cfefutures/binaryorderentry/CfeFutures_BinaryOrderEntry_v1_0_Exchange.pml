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

/* ---- Order Acknowledgement Message: 161 bytes -------------------------------- */

/* Order Acknowledgement messages are sent in response to a new order message */
typedef OrderAcknowledgementMessage {
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

int order_acknowledgement_message_at;

/* every byte of Order Acknowledgement Message set to one value */
inline fill_order_acknowledgement_message(order_acknowledgement_message_record, order_acknowledgement_message_value) {
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.transaction_time[order_acknowledgement_message_at] = order_acknowledgement_message_value; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 20 -> order_acknowledgement_message_record.cl_ord_id[order_acknowledgement_message_at] = order_acknowledgement_message_value; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.order_id[order_acknowledgement_message_at] = order_acknowledgement_message_value; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.side = order_acknowledgement_message_value;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.price[order_acknowledgement_message_at] = order_acknowledgement_message_value; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.ord_type = order_acknowledgement_message_value;
  order_acknowledgement_message_record.time_in_force = order_acknowledgement_message_value;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.min_qty[order_acknowledgement_message_at] = order_acknowledgement_message_value; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.symbol[order_acknowledgement_message_at] = order_acknowledgement_message_value; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.capacity = order_acknowledgement_message_value;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 16 -> order_acknowledgement_message_record.account[order_acknowledgement_message_at] = order_acknowledgement_message_value; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.clearing_firm[order_acknowledgement_message_at] = order_acknowledgement_message_value; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.clearing_account[order_acknowledgement_message_at] = order_acknowledgement_message_value; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.order_qty[order_acknowledgement_message_at] = order_acknowledgement_message_value; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  fill_prevent_match(order_acknowledgement_message_record.prevent_match, order_acknowledgement_message_value);
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.maturity_date[order_acknowledgement_message_at] = order_acknowledgement_message_value; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.open_close = order_acknowledgement_message_value;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.leaves_qty[order_acknowledgement_message_at] = order_acknowledgement_message_value; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.base_liquidity_indicator = order_acknowledgement_message_value;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.expire_time[order_acknowledgement_message_at] = order_acknowledgement_message_value; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.sub_liquidity_indicator = order_acknowledgement_message_value;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.stop_px[order_acknowledgement_message_at] = order_acknowledgement_message_value; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.cmta_number[order_acknowledgement_message_at] = order_acknowledgement_message_value; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.cti_code = order_acknowledgement_message_value;
  order_acknowledgement_message_record.manual_order_indicator = order_acknowledgement_message_value;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 18 -> order_acknowledgement_message_record.oeo_id[order_acknowledgement_message_at] = order_acknowledgement_message_value; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.cum_qty[order_acknowledgement_message_at] = order_acknowledgement_message_value; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 6 -> order_acknowledgement_message_record.frequent_trader_id[order_acknowledgement_message_at] = order_acknowledgement_message_value; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.cust_order_handling_inst = order_acknowledgement_message_value;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.request_received_time[order_acknowledgement_message_at] = order_acknowledgement_message_value; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Acknowledgement Message set to where it lies, so a field read out of place says so */
inline ramp_order_acknowledgement_message(order_acknowledgement_message_record, order_acknowledgement_message_base) {
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.transaction_time[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 0 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 20 -> order_acknowledgement_message_record.cl_ord_id[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 8 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.order_id[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 28 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.side = (order_acknowledgement_message_base + 36 + 1) % 256;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.price[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 37 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.ord_type = (order_acknowledgement_message_base + 45 + 1) % 256;
  order_acknowledgement_message_record.time_in_force = (order_acknowledgement_message_base + 46 + 1) % 256;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.min_qty[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 47 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.symbol[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 51 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.capacity = (order_acknowledgement_message_base + 59 + 1) % 256;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 16 -> order_acknowledgement_message_record.account[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 60 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.clearing_firm[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 76 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.clearing_account[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 80 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.order_qty[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 84 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  ramp_prevent_match(order_acknowledgement_message_record.prevent_match, order_acknowledgement_message_base + 88);
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.maturity_date[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 91 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.open_close = (order_acknowledgement_message_base + 95 + 1) % 256;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.leaves_qty[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 96 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.base_liquidity_indicator = (order_acknowledgement_message_base + 100 + 1) % 256;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.expire_time[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 101 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.sub_liquidity_indicator = (order_acknowledgement_message_base + 109 + 1) % 256;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.stop_px[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 110 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.cmta_number[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 118 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.cti_code = (order_acknowledgement_message_base + 122 + 1) % 256;
  order_acknowledgement_message_record.manual_order_indicator = (order_acknowledgement_message_base + 123 + 1) % 256;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 18 -> order_acknowledgement_message_record.oeo_id[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 124 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.cum_qty[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 142 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 6 -> order_acknowledgement_message_record.frequent_trader_id[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 146 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.cust_order_handling_inst = (order_acknowledgement_message_base + 152 + 1) % 256;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.request_received_time[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 153 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Acknowledgement Message to the wire, 161 bytes from where the cursor stands */
inline encode_order_acknowledgement_message(order_acknowledgement_message_record) {
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> wire[at] = order_acknowledgement_message_record.transaction_time[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 20 -> wire[at] = order_acknowledgement_message_record.cl_ord_id[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> wire[at] = order_acknowledgement_message_record.order_id[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_message_record.side; at = at + 1;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> wire[at] = order_acknowledgement_message_record.price[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_message_record.ord_type; at = at + 1;
  wire[at] = order_acknowledgement_message_record.time_in_force; at = at + 1;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> wire[at] = order_acknowledgement_message_record.min_qty[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> wire[at] = order_acknowledgement_message_record.symbol[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_message_record.capacity; at = at + 1;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 16 -> wire[at] = order_acknowledgement_message_record.account[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> wire[at] = order_acknowledgement_message_record.clearing_firm[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> wire[at] = order_acknowledgement_message_record.clearing_account[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> wire[at] = order_acknowledgement_message_record.order_qty[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  encode_prevent_match(order_acknowledgement_message_record.prevent_match);
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> wire[at] = order_acknowledgement_message_record.maturity_date[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_message_record.open_close; at = at + 1;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> wire[at] = order_acknowledgement_message_record.leaves_qty[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_message_record.base_liquidity_indicator; at = at + 1;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> wire[at] = order_acknowledgement_message_record.expire_time[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_message_record.sub_liquidity_indicator; at = at + 1;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> wire[at] = order_acknowledgement_message_record.stop_px[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> wire[at] = order_acknowledgement_message_record.cmta_number[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_message_record.cti_code; at = at + 1;
  wire[at] = order_acknowledgement_message_record.manual_order_indicator; at = at + 1;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 18 -> wire[at] = order_acknowledgement_message_record.oeo_id[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> wire[at] = order_acknowledgement_message_record.cum_qty[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 6 -> wire[at] = order_acknowledgement_message_record.frequent_trader_id[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_message_record.cust_order_handling_inst; at = at + 1;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> wire[at] = order_acknowledgement_message_record.request_received_time[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Acknowledgement Message off the wire, 161 bytes from where the cursor stands */
inline decode_order_acknowledgement_message(order_acknowledgement_message_record) {
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.transaction_time[order_acknowledgement_message_at] = wire[at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 20 -> order_acknowledgement_message_record.cl_ord_id[order_acknowledgement_message_at] = wire[at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.order_id[order_acknowledgement_message_at] = wire[at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.side = wire[at]; at = at + 1;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.price[order_acknowledgement_message_at] = wire[at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.ord_type = wire[at]; at = at + 1;
  order_acknowledgement_message_record.time_in_force = wire[at]; at = at + 1;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.min_qty[order_acknowledgement_message_at] = wire[at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.symbol[order_acknowledgement_message_at] = wire[at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.capacity = wire[at]; at = at + 1;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 16 -> order_acknowledgement_message_record.account[order_acknowledgement_message_at] = wire[at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.clearing_firm[order_acknowledgement_message_at] = wire[at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.clearing_account[order_acknowledgement_message_at] = wire[at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.order_qty[order_acknowledgement_message_at] = wire[at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  decode_prevent_match(order_acknowledgement_message_record.prevent_match);
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.maturity_date[order_acknowledgement_message_at] = wire[at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.open_close = wire[at]; at = at + 1;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.leaves_qty[order_acknowledgement_message_at] = wire[at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.base_liquidity_indicator = wire[at]; at = at + 1;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.expire_time[order_acknowledgement_message_at] = wire[at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.sub_liquidity_indicator = wire[at]; at = at + 1;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.stop_px[order_acknowledgement_message_at] = wire[at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.cmta_number[order_acknowledgement_message_at] = wire[at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.cti_code = wire[at]; at = at + 1;
  order_acknowledgement_message_record.manual_order_indicator = wire[at]; at = at + 1;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 18 -> order_acknowledgement_message_record.oeo_id[order_acknowledgement_message_at] = wire[at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.cum_qty[order_acknowledgement_message_at] = wire[at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 6 -> order_acknowledgement_message_record.frequent_trader_id[order_acknowledgement_message_at] = wire[at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.cust_order_handling_inst = wire[at]; at = at + 1;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.request_received_time[order_acknowledgement_message_at] = wire[at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Acknowledgement Message is what was written, byte for byte */
inline equal_order_acknowledgement_message(order_acknowledgement_message_read, order_acknowledgement_message_written) {
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> assert(order_acknowledgement_message_read.transaction_time[order_acknowledgement_message_at] == order_acknowledgement_message_written.transaction_time[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 20 -> assert(order_acknowledgement_message_read.cl_ord_id[order_acknowledgement_message_at] == order_acknowledgement_message_written.cl_ord_id[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> assert(order_acknowledgement_message_read.order_id[order_acknowledgement_message_at] == order_acknowledgement_message_written.order_id[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_message_read.side == order_acknowledgement_message_written.side);
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> assert(order_acknowledgement_message_read.price[order_acknowledgement_message_at] == order_acknowledgement_message_written.price[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_message_read.ord_type == order_acknowledgement_message_written.ord_type);
  assert(order_acknowledgement_message_read.time_in_force == order_acknowledgement_message_written.time_in_force);
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> assert(order_acknowledgement_message_read.min_qty[order_acknowledgement_message_at] == order_acknowledgement_message_written.min_qty[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> assert(order_acknowledgement_message_read.symbol[order_acknowledgement_message_at] == order_acknowledgement_message_written.symbol[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_message_read.capacity == order_acknowledgement_message_written.capacity);
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 16 -> assert(order_acknowledgement_message_read.account[order_acknowledgement_message_at] == order_acknowledgement_message_written.account[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> assert(order_acknowledgement_message_read.clearing_firm[order_acknowledgement_message_at] == order_acknowledgement_message_written.clearing_firm[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> assert(order_acknowledgement_message_read.clearing_account[order_acknowledgement_message_at] == order_acknowledgement_message_written.clearing_account[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> assert(order_acknowledgement_message_read.order_qty[order_acknowledgement_message_at] == order_acknowledgement_message_written.order_qty[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  equal_prevent_match(order_acknowledgement_message_read.prevent_match, order_acknowledgement_message_written.prevent_match);
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> assert(order_acknowledgement_message_read.maturity_date[order_acknowledgement_message_at] == order_acknowledgement_message_written.maturity_date[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_message_read.open_close == order_acknowledgement_message_written.open_close);
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> assert(order_acknowledgement_message_read.leaves_qty[order_acknowledgement_message_at] == order_acknowledgement_message_written.leaves_qty[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_message_read.base_liquidity_indicator == order_acknowledgement_message_written.base_liquidity_indicator);
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> assert(order_acknowledgement_message_read.expire_time[order_acknowledgement_message_at] == order_acknowledgement_message_written.expire_time[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_message_read.sub_liquidity_indicator == order_acknowledgement_message_written.sub_liquidity_indicator);
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> assert(order_acknowledgement_message_read.stop_px[order_acknowledgement_message_at] == order_acknowledgement_message_written.stop_px[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> assert(order_acknowledgement_message_read.cmta_number[order_acknowledgement_message_at] == order_acknowledgement_message_written.cmta_number[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_message_read.cti_code == order_acknowledgement_message_written.cti_code);
  assert(order_acknowledgement_message_read.manual_order_indicator == order_acknowledgement_message_written.manual_order_indicator);
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 18 -> assert(order_acknowledgement_message_read.oeo_id[order_acknowledgement_message_at] == order_acknowledgement_message_written.oeo_id[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> assert(order_acknowledgement_message_read.cum_qty[order_acknowledgement_message_at] == order_acknowledgement_message_written.cum_qty[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 6 -> assert(order_acknowledgement_message_read.frequent_trader_id[order_acknowledgement_message_at] == order_acknowledgement_message_written.frequent_trader_id[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_message_read.cust_order_handling_inst == order_acknowledgement_message_written.cust_order_handling_inst);
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> assert(order_acknowledgement_message_read.request_received_time[order_acknowledgement_message_at] == order_acknowledgement_message_written.request_received_time[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Rejected Message: 93 bytes ---------------------------------------- */

/* Order Rejected messages are sent in response to a New Order which must be rejected */
typedef OrderRejectedMessage {
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte clearing_firm[4];
  byte order_reject_reason;
  byte text[60]
};

int order_rejected_message_at;

/* every byte of Order Rejected Message set to one value */
inline fill_order_rejected_message(order_rejected_message_record, order_rejected_message_value) {
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 8 -> order_rejected_message_record.transaction_time[order_rejected_message_at] = order_rejected_message_value; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 20 -> order_rejected_message_record.cl_ord_id[order_rejected_message_at] = order_rejected_message_value; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 4 -> order_rejected_message_record.clearing_firm[order_rejected_message_at] = order_rejected_message_value; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_record.order_reject_reason = order_rejected_message_value;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 60 -> order_rejected_message_record.text[order_rejected_message_at] = order_rejected_message_value; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Rejected Message set to where it lies, so a field read out of place says so */
inline ramp_order_rejected_message(order_rejected_message_record, order_rejected_message_base) {
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 8 -> order_rejected_message_record.transaction_time[order_rejected_message_at] = (order_rejected_message_base + 0 + order_rejected_message_at + 1) % 256; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 20 -> order_rejected_message_record.cl_ord_id[order_rejected_message_at] = (order_rejected_message_base + 8 + order_rejected_message_at + 1) % 256; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 4 -> order_rejected_message_record.clearing_firm[order_rejected_message_at] = (order_rejected_message_base + 28 + order_rejected_message_at + 1) % 256; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_record.order_reject_reason = (order_rejected_message_base + 32 + 1) % 256;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 60 -> order_rejected_message_record.text[order_rejected_message_at] = (order_rejected_message_base + 33 + order_rejected_message_at + 1) % 256; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Rejected Message to the wire, 93 bytes from where the cursor stands */
inline encode_order_rejected_message(order_rejected_message_record) {
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 8 -> wire[at] = order_rejected_message_record.transaction_time[order_rejected_message_at]; at = at + 1; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 20 -> wire[at] = order_rejected_message_record.cl_ord_id[order_rejected_message_at]; at = at + 1; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 4 -> wire[at] = order_rejected_message_record.clearing_firm[order_rejected_message_at]; at = at + 1; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  wire[at] = order_rejected_message_record.order_reject_reason; at = at + 1;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 60 -> wire[at] = order_rejected_message_record.text[order_rejected_message_at]; at = at + 1; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Rejected Message off the wire, 93 bytes from where the cursor stands */
inline decode_order_rejected_message(order_rejected_message_record) {
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 8 -> order_rejected_message_record.transaction_time[order_rejected_message_at] = wire[at]; at = at + 1; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 20 -> order_rejected_message_record.cl_ord_id[order_rejected_message_at] = wire[at]; at = at + 1; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 4 -> order_rejected_message_record.clearing_firm[order_rejected_message_at] = wire[at]; at = at + 1; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_record.order_reject_reason = wire[at]; at = at + 1;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 60 -> order_rejected_message_record.text[order_rejected_message_at] = wire[at]; at = at + 1; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Rejected Message is what was written, byte for byte */
inline equal_order_rejected_message(order_rejected_message_read, order_rejected_message_written) {
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 8 -> assert(order_rejected_message_read.transaction_time[order_rejected_message_at] == order_rejected_message_written.transaction_time[order_rejected_message_at]); order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 20 -> assert(order_rejected_message_read.cl_ord_id[order_rejected_message_at] == order_rejected_message_written.cl_ord_id[order_rejected_message_at]); order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 4 -> assert(order_rejected_message_read.clearing_firm[order_rejected_message_at] == order_rejected_message_written.clearing_firm[order_rejected_message_at]); order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  assert(order_rejected_message_read.order_reject_reason == order_rejected_message_written.order_reject_reason);
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 60 -> assert(order_rejected_message_read.text[order_rejected_message_at] == order_rejected_message_written.text[order_rejected_message_at]); order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Modified Message: 101 bytes --------------------------------------- */

/* Order Modified messages are sent in response to a Modify Order to indicate that the orderhas been successfully modified */
typedef OrderModifiedMessage {
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

int order_modified_message_at;

/* every byte of Order Modified Message set to one value */
inline fill_order_modified_message(order_modified_message_record, order_modified_message_value) {
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.transaction_time[order_modified_message_at] = order_modified_message_value; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 20 -> order_modified_message_record.cl_ord_id[order_modified_message_at] = order_modified_message_value; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 20 -> order_modified_message_record.orig_cl_ord_id[order_modified_message_at] = order_modified_message_value; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.order_id[order_modified_message_at] = order_modified_message_value; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> order_modified_message_record.clearing_firm[order_modified_message_at] = order_modified_message_value; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.price[order_modified_message_at] = order_modified_message_value; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_record.ord_type = order_modified_message_value;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> order_modified_message_record.order_qty[order_modified_message_at] = order_modified_message_value; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> order_modified_message_record.leaves_qty[order_modified_message_at] = order_modified_message_value; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_record.base_liquidity_indicator = order_modified_message_value;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.stop_px[order_modified_message_at] = order_modified_message_value; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 6 -> order_modified_message_record.frequent_trader_id[order_modified_message_at] = order_modified_message_value; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_record.cust_order_handling_inst = order_modified_message_value;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.request_received_time[order_modified_message_at] = order_modified_message_value; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Modified Message set to where it lies, so a field read out of place says so */
inline ramp_order_modified_message(order_modified_message_record, order_modified_message_base) {
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.transaction_time[order_modified_message_at] = (order_modified_message_base + 0 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 20 -> order_modified_message_record.cl_ord_id[order_modified_message_at] = (order_modified_message_base + 8 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 20 -> order_modified_message_record.orig_cl_ord_id[order_modified_message_at] = (order_modified_message_base + 28 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.order_id[order_modified_message_at] = (order_modified_message_base + 48 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> order_modified_message_record.clearing_firm[order_modified_message_at] = (order_modified_message_base + 56 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.price[order_modified_message_at] = (order_modified_message_base + 60 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_record.ord_type = (order_modified_message_base + 68 + 1) % 256;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> order_modified_message_record.order_qty[order_modified_message_at] = (order_modified_message_base + 69 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> order_modified_message_record.leaves_qty[order_modified_message_at] = (order_modified_message_base + 73 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_record.base_liquidity_indicator = (order_modified_message_base + 77 + 1) % 256;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.stop_px[order_modified_message_at] = (order_modified_message_base + 78 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 6 -> order_modified_message_record.frequent_trader_id[order_modified_message_at] = (order_modified_message_base + 86 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_record.cust_order_handling_inst = (order_modified_message_base + 92 + 1) % 256;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.request_received_time[order_modified_message_at] = (order_modified_message_base + 93 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modified Message to the wire, 101 bytes from where the cursor stands */
inline encode_order_modified_message(order_modified_message_record) {
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> wire[at] = order_modified_message_record.transaction_time[order_modified_message_at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 20 -> wire[at] = order_modified_message_record.cl_ord_id[order_modified_message_at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 20 -> wire[at] = order_modified_message_record.orig_cl_ord_id[order_modified_message_at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> wire[at] = order_modified_message_record.order_id[order_modified_message_at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> wire[at] = order_modified_message_record.clearing_firm[order_modified_message_at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> wire[at] = order_modified_message_record.price[order_modified_message_at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  wire[at] = order_modified_message_record.ord_type; at = at + 1;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> wire[at] = order_modified_message_record.order_qty[order_modified_message_at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> wire[at] = order_modified_message_record.leaves_qty[order_modified_message_at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  wire[at] = order_modified_message_record.base_liquidity_indicator; at = at + 1;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> wire[at] = order_modified_message_record.stop_px[order_modified_message_at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 6 -> wire[at] = order_modified_message_record.frequent_trader_id[order_modified_message_at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  wire[at] = order_modified_message_record.cust_order_handling_inst; at = at + 1;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> wire[at] = order_modified_message_record.request_received_time[order_modified_message_at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modified Message off the wire, 101 bytes from where the cursor stands */
inline decode_order_modified_message(order_modified_message_record) {
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.transaction_time[order_modified_message_at] = wire[at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 20 -> order_modified_message_record.cl_ord_id[order_modified_message_at] = wire[at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 20 -> order_modified_message_record.orig_cl_ord_id[order_modified_message_at] = wire[at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.order_id[order_modified_message_at] = wire[at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> order_modified_message_record.clearing_firm[order_modified_message_at] = wire[at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.price[order_modified_message_at] = wire[at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_record.ord_type = wire[at]; at = at + 1;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> order_modified_message_record.order_qty[order_modified_message_at] = wire[at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> order_modified_message_record.leaves_qty[order_modified_message_at] = wire[at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_record.base_liquidity_indicator = wire[at]; at = at + 1;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.stop_px[order_modified_message_at] = wire[at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 6 -> order_modified_message_record.frequent_trader_id[order_modified_message_at] = wire[at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_record.cust_order_handling_inst = wire[at]; at = at + 1;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.request_received_time[order_modified_message_at] = wire[at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Modified Message is what was written, byte for byte */
inline equal_order_modified_message(order_modified_message_read, order_modified_message_written) {
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> assert(order_modified_message_read.transaction_time[order_modified_message_at] == order_modified_message_written.transaction_time[order_modified_message_at]); order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 20 -> assert(order_modified_message_read.cl_ord_id[order_modified_message_at] == order_modified_message_written.cl_ord_id[order_modified_message_at]); order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 20 -> assert(order_modified_message_read.orig_cl_ord_id[order_modified_message_at] == order_modified_message_written.orig_cl_ord_id[order_modified_message_at]); order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> assert(order_modified_message_read.order_id[order_modified_message_at] == order_modified_message_written.order_id[order_modified_message_at]); order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> assert(order_modified_message_read.clearing_firm[order_modified_message_at] == order_modified_message_written.clearing_firm[order_modified_message_at]); order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> assert(order_modified_message_read.price[order_modified_message_at] == order_modified_message_written.price[order_modified_message_at]); order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  assert(order_modified_message_read.ord_type == order_modified_message_written.ord_type);
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> assert(order_modified_message_read.order_qty[order_modified_message_at] == order_modified_message_written.order_qty[order_modified_message_at]); order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> assert(order_modified_message_read.leaves_qty[order_modified_message_at] == order_modified_message_written.leaves_qty[order_modified_message_at]); order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  assert(order_modified_message_read.base_liquidity_indicator == order_modified_message_written.base_liquidity_indicator);
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> assert(order_modified_message_read.stop_px[order_modified_message_at] == order_modified_message_written.stop_px[order_modified_message_at]); order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 6 -> assert(order_modified_message_read.frequent_trader_id[order_modified_message_at] == order_modified_message_written.frequent_trader_id[order_modified_message_at]); order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  assert(order_modified_message_read.cust_order_handling_inst == order_modified_message_written.cust_order_handling_inst);
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> assert(order_modified_message_read.request_received_time[order_modified_message_at] == order_modified_message_written.request_received_time[order_modified_message_at]); order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Rejected Message: 113 bytes -------------------------------------- */

/* Modify Rejected messages are sent in response to a Modify Order for an order which cannot be modified */
typedef ModifyRejectedMessage {
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte orig_cl_ord_id[20];
  byte clearing_firm[4];
  byte modify_reject_reason;
  byte text[60]
};

int modify_rejected_message_at;

/* every byte of Modify Rejected Message set to one value */
inline fill_modify_rejected_message(modify_rejected_message_record, modify_rejected_message_value) {
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 8 -> modify_rejected_message_record.transaction_time[modify_rejected_message_at] = modify_rejected_message_value; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 20 -> modify_rejected_message_record.cl_ord_id[modify_rejected_message_at] = modify_rejected_message_value; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 20 -> modify_rejected_message_record.orig_cl_ord_id[modify_rejected_message_at] = modify_rejected_message_value; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 4 -> modify_rejected_message_record.clearing_firm[modify_rejected_message_at] = modify_rejected_message_value; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_record.modify_reject_reason = modify_rejected_message_value;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 60 -> modify_rejected_message_record.text[modify_rejected_message_at] = modify_rejected_message_value; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Modify Rejected Message set to where it lies, so a field read out of place says so */
inline ramp_modify_rejected_message(modify_rejected_message_record, modify_rejected_message_base) {
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 8 -> modify_rejected_message_record.transaction_time[modify_rejected_message_at] = (modify_rejected_message_base + 0 + modify_rejected_message_at + 1) % 256; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 20 -> modify_rejected_message_record.cl_ord_id[modify_rejected_message_at] = (modify_rejected_message_base + 8 + modify_rejected_message_at + 1) % 256; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 20 -> modify_rejected_message_record.orig_cl_ord_id[modify_rejected_message_at] = (modify_rejected_message_base + 28 + modify_rejected_message_at + 1) % 256; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 4 -> modify_rejected_message_record.clearing_firm[modify_rejected_message_at] = (modify_rejected_message_base + 48 + modify_rejected_message_at + 1) % 256; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_record.modify_reject_reason = (modify_rejected_message_base + 52 + 1) % 256;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 60 -> modify_rejected_message_record.text[modify_rejected_message_at] = (modify_rejected_message_base + 53 + modify_rejected_message_at + 1) % 256; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Rejected Message to the wire, 113 bytes from where the cursor stands */
inline encode_modify_rejected_message(modify_rejected_message_record) {
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 8 -> wire[at] = modify_rejected_message_record.transaction_time[modify_rejected_message_at]; at = at + 1; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 20 -> wire[at] = modify_rejected_message_record.cl_ord_id[modify_rejected_message_at]; at = at + 1; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 20 -> wire[at] = modify_rejected_message_record.orig_cl_ord_id[modify_rejected_message_at]; at = at + 1; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 4 -> wire[at] = modify_rejected_message_record.clearing_firm[modify_rejected_message_at]; at = at + 1; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  wire[at] = modify_rejected_message_record.modify_reject_reason; at = at + 1;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 60 -> wire[at] = modify_rejected_message_record.text[modify_rejected_message_at]; at = at + 1; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Rejected Message off the wire, 113 bytes from where the cursor stands */
inline decode_modify_rejected_message(modify_rejected_message_record) {
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 8 -> modify_rejected_message_record.transaction_time[modify_rejected_message_at] = wire[at]; at = at + 1; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 20 -> modify_rejected_message_record.cl_ord_id[modify_rejected_message_at] = wire[at]; at = at + 1; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 20 -> modify_rejected_message_record.orig_cl_ord_id[modify_rejected_message_at] = wire[at]; at = at + 1; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 4 -> modify_rejected_message_record.clearing_firm[modify_rejected_message_at] = wire[at]; at = at + 1; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_record.modify_reject_reason = wire[at]; at = at + 1;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 60 -> modify_rejected_message_record.text[modify_rejected_message_at] = wire[at]; at = at + 1; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Modify Rejected Message is what was written, byte for byte */
inline equal_modify_rejected_message(modify_rejected_message_read, modify_rejected_message_written) {
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 8 -> assert(modify_rejected_message_read.transaction_time[modify_rejected_message_at] == modify_rejected_message_written.transaction_time[modify_rejected_message_at]); modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 20 -> assert(modify_rejected_message_read.cl_ord_id[modify_rejected_message_at] == modify_rejected_message_written.cl_ord_id[modify_rejected_message_at]); modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 20 -> assert(modify_rejected_message_read.orig_cl_ord_id[modify_rejected_message_at] == modify_rejected_message_written.orig_cl_ord_id[modify_rejected_message_at]); modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 4 -> assert(modify_rejected_message_read.clearing_firm[modify_rejected_message_at] == modify_rejected_message_written.clearing_firm[modify_rejected_message_at]); modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  assert(modify_rejected_message_read.modify_reject_reason == modify_rejected_message_written.modify_reject_reason);
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 60 -> assert(modify_rejected_message_read.text[modify_rejected_message_at] == modify_rejected_message_written.text[modify_rejected_message_at]); modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Execution Message: 91 bytes --------------------------------------- */

/* An Order Execution is sent for each fill on an order */
typedef OrderExecutionMessage {
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

int order_execution_message_at;

/* every byte of Order Execution Message set to one value */
inline fill_order_execution_message(order_execution_message_record, order_execution_message_value) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.transaction_time[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 20 -> order_execution_message_record.cl_ord_id[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.exec_id[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.last_shares[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.last_px[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.leaves_qty[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.base_liquidity_indicator = order_execution_message_value;
  order_execution_message_record.sub_liquidity_indicator = order_execution_message_value;
  order_execution_message_record.side = order_execution_message_value;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.symbol[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.clearing_firm[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.maturity_date[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 2 -> order_execution_message_record.fee_code[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.trade_date[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.clearing_size[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.pending_status = order_execution_message_value;
  order_execution_message_record.multileg_reporting_type = order_execution_message_value;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.secondary_exec_id[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Execution Message set to where it lies, so a field read out of place says so */
inline ramp_order_execution_message(order_execution_message_record, order_execution_message_base) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.transaction_time[order_execution_message_at] = (order_execution_message_base + 0 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 20 -> order_execution_message_record.cl_ord_id[order_execution_message_at] = (order_execution_message_base + 8 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.exec_id[order_execution_message_at] = (order_execution_message_base + 28 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.last_shares[order_execution_message_at] = (order_execution_message_base + 36 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.last_px[order_execution_message_at] = (order_execution_message_base + 40 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.leaves_qty[order_execution_message_at] = (order_execution_message_base + 48 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.base_liquidity_indicator = (order_execution_message_base + 52 + 1) % 256;
  order_execution_message_record.sub_liquidity_indicator = (order_execution_message_base + 53 + 1) % 256;
  order_execution_message_record.side = (order_execution_message_base + 54 + 1) % 256;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.symbol[order_execution_message_at] = (order_execution_message_base + 55 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.clearing_firm[order_execution_message_at] = (order_execution_message_base + 63 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.maturity_date[order_execution_message_at] = (order_execution_message_base + 67 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 2 -> order_execution_message_record.fee_code[order_execution_message_at] = (order_execution_message_base + 71 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.trade_date[order_execution_message_at] = (order_execution_message_base + 73 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.clearing_size[order_execution_message_at] = (order_execution_message_base + 77 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.pending_status = (order_execution_message_base + 81 + 1) % 256;
  order_execution_message_record.multileg_reporting_type = (order_execution_message_base + 82 + 1) % 256;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.secondary_exec_id[order_execution_message_at] = (order_execution_message_base + 83 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Execution Message to the wire, 91 bytes from where the cursor stands */
inline encode_order_execution_message(order_execution_message_record) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> wire[at] = order_execution_message_record.transaction_time[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 20 -> wire[at] = order_execution_message_record.cl_ord_id[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> wire[at] = order_execution_message_record.exec_id[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> wire[at] = order_execution_message_record.last_shares[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> wire[at] = order_execution_message_record.last_px[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> wire[at] = order_execution_message_record.leaves_qty[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_message_record.base_liquidity_indicator; at = at + 1;
  wire[at] = order_execution_message_record.sub_liquidity_indicator; at = at + 1;
  wire[at] = order_execution_message_record.side; at = at + 1;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> wire[at] = order_execution_message_record.symbol[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> wire[at] = order_execution_message_record.clearing_firm[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> wire[at] = order_execution_message_record.maturity_date[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 2 -> wire[at] = order_execution_message_record.fee_code[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> wire[at] = order_execution_message_record.trade_date[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> wire[at] = order_execution_message_record.clearing_size[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_message_record.pending_status; at = at + 1;
  wire[at] = order_execution_message_record.multileg_reporting_type; at = at + 1;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> wire[at] = order_execution_message_record.secondary_exec_id[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Execution Message off the wire, 91 bytes from where the cursor stands */
inline decode_order_execution_message(order_execution_message_record) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.transaction_time[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 20 -> order_execution_message_record.cl_ord_id[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.exec_id[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.last_shares[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.last_px[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.leaves_qty[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.base_liquidity_indicator = wire[at]; at = at + 1;
  order_execution_message_record.sub_liquidity_indicator = wire[at]; at = at + 1;
  order_execution_message_record.side = wire[at]; at = at + 1;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.symbol[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.clearing_firm[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.maturity_date[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 2 -> order_execution_message_record.fee_code[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.trade_date[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.clearing_size[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.pending_status = wire[at]; at = at + 1;
  order_execution_message_record.multileg_reporting_type = wire[at]; at = at + 1;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.secondary_exec_id[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Execution Message is what was written, byte for byte */
inline equal_order_execution_message(order_execution_message_read, order_execution_message_written) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> assert(order_execution_message_read.transaction_time[order_execution_message_at] == order_execution_message_written.transaction_time[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 20 -> assert(order_execution_message_read.cl_ord_id[order_execution_message_at] == order_execution_message_written.cl_ord_id[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> assert(order_execution_message_read.exec_id[order_execution_message_at] == order_execution_message_written.exec_id[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> assert(order_execution_message_read.last_shares[order_execution_message_at] == order_execution_message_written.last_shares[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> assert(order_execution_message_read.last_px[order_execution_message_at] == order_execution_message_written.last_px[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> assert(order_execution_message_read.leaves_qty[order_execution_message_at] == order_execution_message_written.leaves_qty[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  assert(order_execution_message_read.base_liquidity_indicator == order_execution_message_written.base_liquidity_indicator);
  assert(order_execution_message_read.sub_liquidity_indicator == order_execution_message_written.sub_liquidity_indicator);
  assert(order_execution_message_read.side == order_execution_message_written.side);
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> assert(order_execution_message_read.symbol[order_execution_message_at] == order_execution_message_written.symbol[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> assert(order_execution_message_read.clearing_firm[order_execution_message_at] == order_execution_message_written.clearing_firm[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> assert(order_execution_message_read.maturity_date[order_execution_message_at] == order_execution_message_written.maturity_date[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 2 -> assert(order_execution_message_read.fee_code[order_execution_message_at] == order_execution_message_written.fee_code[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> assert(order_execution_message_read.trade_date[order_execution_message_at] == order_execution_message_written.trade_date[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> assert(order_execution_message_read.clearing_size[order_execution_message_at] == order_execution_message_written.clearing_size[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  assert(order_execution_message_read.pending_status == order_execution_message_written.pending_status);
  assert(order_execution_message_read.multileg_reporting_type == order_execution_message_written.multileg_reporting_type);
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> assert(order_execution_message_read.secondary_exec_id[order_execution_message_at] == order_execution_message_written.secondary_exec_id[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancelled Message: 41 bytes --------------------------------------- */

/* Order Cancelled message */
typedef OrderCancelledMessage {
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte clearing_firm[4];
  byte cancel_reason;
  byte request_received_time[8]
};

int order_cancelled_message_at;

/* every byte of Order Cancelled Message set to one value */
inline fill_order_cancelled_message(order_cancelled_message_record, order_cancelled_message_value) {
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> order_cancelled_message_record.transaction_time[order_cancelled_message_at] = order_cancelled_message_value; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 20 -> order_cancelled_message_record.cl_ord_id[order_cancelled_message_at] = order_cancelled_message_value; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 4 -> order_cancelled_message_record.clearing_firm[order_cancelled_message_at] = order_cancelled_message_value; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_record.cancel_reason = order_cancelled_message_value;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> order_cancelled_message_record.request_received_time[order_cancelled_message_at] = order_cancelled_message_value; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancelled Message set to where it lies, so a field read out of place says so */
inline ramp_order_cancelled_message(order_cancelled_message_record, order_cancelled_message_base) {
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> order_cancelled_message_record.transaction_time[order_cancelled_message_at] = (order_cancelled_message_base + 0 + order_cancelled_message_at + 1) % 256; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 20 -> order_cancelled_message_record.cl_ord_id[order_cancelled_message_at] = (order_cancelled_message_base + 8 + order_cancelled_message_at + 1) % 256; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 4 -> order_cancelled_message_record.clearing_firm[order_cancelled_message_at] = (order_cancelled_message_base + 28 + order_cancelled_message_at + 1) % 256; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_record.cancel_reason = (order_cancelled_message_base + 32 + 1) % 256;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> order_cancelled_message_record.request_received_time[order_cancelled_message_at] = (order_cancelled_message_base + 33 + order_cancelled_message_at + 1) % 256; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancelled Message to the wire, 41 bytes from where the cursor stands */
inline encode_order_cancelled_message(order_cancelled_message_record) {
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> wire[at] = order_cancelled_message_record.transaction_time[order_cancelled_message_at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 20 -> wire[at] = order_cancelled_message_record.cl_ord_id[order_cancelled_message_at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 4 -> wire[at] = order_cancelled_message_record.clearing_firm[order_cancelled_message_at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  wire[at] = order_cancelled_message_record.cancel_reason; at = at + 1;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> wire[at] = order_cancelled_message_record.request_received_time[order_cancelled_message_at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancelled Message off the wire, 41 bytes from where the cursor stands */
inline decode_order_cancelled_message(order_cancelled_message_record) {
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> order_cancelled_message_record.transaction_time[order_cancelled_message_at] = wire[at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 20 -> order_cancelled_message_record.cl_ord_id[order_cancelled_message_at] = wire[at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 4 -> order_cancelled_message_record.clearing_firm[order_cancelled_message_at] = wire[at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_record.cancel_reason = wire[at]; at = at + 1;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> order_cancelled_message_record.request_received_time[order_cancelled_message_at] = wire[at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancelled Message is what was written, byte for byte */
inline equal_order_cancelled_message(order_cancelled_message_read, order_cancelled_message_written) {
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> assert(order_cancelled_message_read.transaction_time[order_cancelled_message_at] == order_cancelled_message_written.transaction_time[order_cancelled_message_at]); order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 20 -> assert(order_cancelled_message_read.cl_ord_id[order_cancelled_message_at] == order_cancelled_message_written.cl_ord_id[order_cancelled_message_at]); order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 4 -> assert(order_cancelled_message_read.clearing_firm[order_cancelled_message_at] == order_cancelled_message_written.clearing_firm[order_cancelled_message_at]); order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  assert(order_cancelled_message_read.cancel_reason == order_cancelled_message_written.cancel_reason);
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> assert(order_cancelled_message_read.request_received_time[order_cancelled_message_at] == order_cancelled_message_written.request_received_time[order_cancelled_message_at]); order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel Rejected Message: 93 bytes --------------------------------------- */

/* A Cancel Rejected message is sent in response to a Cancel Order message to indicate that the cancellation cannot occur */
typedef CancelRejectedMessage {
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte clearing_firm[4];
  byte cancel_reject_reason;
  byte text[60]
};

int cancel_rejected_message_at;

/* every byte of Cancel Rejected Message set to one value */
inline fill_cancel_rejected_message(cancel_rejected_message_record, cancel_rejected_message_value) {
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 8 -> cancel_rejected_message_record.transaction_time[cancel_rejected_message_at] = cancel_rejected_message_value; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 20 -> cancel_rejected_message_record.cl_ord_id[cancel_rejected_message_at] = cancel_rejected_message_value; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 4 -> cancel_rejected_message_record.clearing_firm[cancel_rejected_message_at] = cancel_rejected_message_value; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_record.cancel_reject_reason = cancel_rejected_message_value;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 60 -> cancel_rejected_message_record.text[cancel_rejected_message_at] = cancel_rejected_message_value; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Rejected Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_rejected_message(cancel_rejected_message_record, cancel_rejected_message_base) {
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 8 -> cancel_rejected_message_record.transaction_time[cancel_rejected_message_at] = (cancel_rejected_message_base + 0 + cancel_rejected_message_at + 1) % 256; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 20 -> cancel_rejected_message_record.cl_ord_id[cancel_rejected_message_at] = (cancel_rejected_message_base + 8 + cancel_rejected_message_at + 1) % 256; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 4 -> cancel_rejected_message_record.clearing_firm[cancel_rejected_message_at] = (cancel_rejected_message_base + 28 + cancel_rejected_message_at + 1) % 256; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_record.cancel_reject_reason = (cancel_rejected_message_base + 32 + 1) % 256;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 60 -> cancel_rejected_message_record.text[cancel_rejected_message_at] = (cancel_rejected_message_base + 33 + cancel_rejected_message_at + 1) % 256; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Rejected Message to the wire, 93 bytes from where the cursor stands */
inline encode_cancel_rejected_message(cancel_rejected_message_record) {
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 8 -> wire[at] = cancel_rejected_message_record.transaction_time[cancel_rejected_message_at]; at = at + 1; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 20 -> wire[at] = cancel_rejected_message_record.cl_ord_id[cancel_rejected_message_at]; at = at + 1; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 4 -> wire[at] = cancel_rejected_message_record.clearing_firm[cancel_rejected_message_at]; at = at + 1; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  wire[at] = cancel_rejected_message_record.cancel_reject_reason; at = at + 1;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 60 -> wire[at] = cancel_rejected_message_record.text[cancel_rejected_message_at]; at = at + 1; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Rejected Message off the wire, 93 bytes from where the cursor stands */
inline decode_cancel_rejected_message(cancel_rejected_message_record) {
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 8 -> cancel_rejected_message_record.transaction_time[cancel_rejected_message_at] = wire[at]; at = at + 1; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 20 -> cancel_rejected_message_record.cl_ord_id[cancel_rejected_message_at] = wire[at]; at = at + 1; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 4 -> cancel_rejected_message_record.clearing_firm[cancel_rejected_message_at] = wire[at]; at = at + 1; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_record.cancel_reject_reason = wire[at]; at = at + 1;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 60 -> cancel_rejected_message_record.text[cancel_rejected_message_at] = wire[at]; at = at + 1; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Rejected Message is what was written, byte for byte */
inline equal_cancel_rejected_message(cancel_rejected_message_read, cancel_rejected_message_written) {
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 8 -> assert(cancel_rejected_message_read.transaction_time[cancel_rejected_message_at] == cancel_rejected_message_written.transaction_time[cancel_rejected_message_at]); cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 20 -> assert(cancel_rejected_message_read.cl_ord_id[cancel_rejected_message_at] == cancel_rejected_message_written.cl_ord_id[cancel_rejected_message_at]); cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 4 -> assert(cancel_rejected_message_read.clearing_firm[cancel_rejected_message_at] == cancel_rejected_message_written.clearing_firm[cancel_rejected_message_at]); cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  assert(cancel_rejected_message_read.cancel_reject_reason == cancel_rejected_message_written.cancel_reject_reason);
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 60 -> assert(cancel_rejected_message_read.text[cancel_rejected_message_at] == cancel_rejected_message_written.text[cancel_rejected_message_at]); cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mass Cancel Acknowledgement Message: 40 bytes --------------------------- */

/* A Mass Cancel Acknowledgment is an unsequenced message sent when a Cancel Order or Purge Orders message requesting a mass cancellation has completed cancelling all individual orders */
typedef MassCancelAcknowledgementMessage {
  byte transaction_time[8];
  byte mass_cancel_id[20];
  byte cancelled_order_count[4];
  byte request_received_time[8]
};

int mass_cancel_acknowledgement_message_at;

/* every byte of Mass Cancel Acknowledgement Message set to one value */
inline fill_mass_cancel_acknowledgement_message(mass_cancel_acknowledgement_message_record, mass_cancel_acknowledgement_message_value) {
  mass_cancel_acknowledgement_message_at = 0;
  do
  :: mass_cancel_acknowledgement_message_at < 8 -> mass_cancel_acknowledgement_message_record.transaction_time[mass_cancel_acknowledgement_message_at] = mass_cancel_acknowledgement_message_value; mass_cancel_acknowledgement_message_at = mass_cancel_acknowledgement_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_message_at = 0;
  do
  :: mass_cancel_acknowledgement_message_at < 20 -> mass_cancel_acknowledgement_message_record.mass_cancel_id[mass_cancel_acknowledgement_message_at] = mass_cancel_acknowledgement_message_value; mass_cancel_acknowledgement_message_at = mass_cancel_acknowledgement_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_message_at = 0;
  do
  :: mass_cancel_acknowledgement_message_at < 4 -> mass_cancel_acknowledgement_message_record.cancelled_order_count[mass_cancel_acknowledgement_message_at] = mass_cancel_acknowledgement_message_value; mass_cancel_acknowledgement_message_at = mass_cancel_acknowledgement_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_message_at = 0;
  do
  :: mass_cancel_acknowledgement_message_at < 8 -> mass_cancel_acknowledgement_message_record.request_received_time[mass_cancel_acknowledgement_message_at] = mass_cancel_acknowledgement_message_value; mass_cancel_acknowledgement_message_at = mass_cancel_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mass Cancel Acknowledgement Message set to where it lies, so a field read out of place says so */
inline ramp_mass_cancel_acknowledgement_message(mass_cancel_acknowledgement_message_record, mass_cancel_acknowledgement_message_base) {
  mass_cancel_acknowledgement_message_at = 0;
  do
  :: mass_cancel_acknowledgement_message_at < 8 -> mass_cancel_acknowledgement_message_record.transaction_time[mass_cancel_acknowledgement_message_at] = (mass_cancel_acknowledgement_message_base + 0 + mass_cancel_acknowledgement_message_at + 1) % 256; mass_cancel_acknowledgement_message_at = mass_cancel_acknowledgement_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_message_at = 0;
  do
  :: mass_cancel_acknowledgement_message_at < 20 -> mass_cancel_acknowledgement_message_record.mass_cancel_id[mass_cancel_acknowledgement_message_at] = (mass_cancel_acknowledgement_message_base + 8 + mass_cancel_acknowledgement_message_at + 1) % 256; mass_cancel_acknowledgement_message_at = mass_cancel_acknowledgement_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_message_at = 0;
  do
  :: mass_cancel_acknowledgement_message_at < 4 -> mass_cancel_acknowledgement_message_record.cancelled_order_count[mass_cancel_acknowledgement_message_at] = (mass_cancel_acknowledgement_message_base + 28 + mass_cancel_acknowledgement_message_at + 1) % 256; mass_cancel_acknowledgement_message_at = mass_cancel_acknowledgement_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_message_at = 0;
  do
  :: mass_cancel_acknowledgement_message_at < 8 -> mass_cancel_acknowledgement_message_record.request_received_time[mass_cancel_acknowledgement_message_at] = (mass_cancel_acknowledgement_message_base + 32 + mass_cancel_acknowledgement_message_at + 1) % 256; mass_cancel_acknowledgement_message_at = mass_cancel_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Acknowledgement Message to the wire, 40 bytes from where the cursor stands */
inline encode_mass_cancel_acknowledgement_message(mass_cancel_acknowledgement_message_record) {
  mass_cancel_acknowledgement_message_at = 0;
  do
  :: mass_cancel_acknowledgement_message_at < 8 -> wire[at] = mass_cancel_acknowledgement_message_record.transaction_time[mass_cancel_acknowledgement_message_at]; at = at + 1; mass_cancel_acknowledgement_message_at = mass_cancel_acknowledgement_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_message_at = 0;
  do
  :: mass_cancel_acknowledgement_message_at < 20 -> wire[at] = mass_cancel_acknowledgement_message_record.mass_cancel_id[mass_cancel_acknowledgement_message_at]; at = at + 1; mass_cancel_acknowledgement_message_at = mass_cancel_acknowledgement_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_message_at = 0;
  do
  :: mass_cancel_acknowledgement_message_at < 4 -> wire[at] = mass_cancel_acknowledgement_message_record.cancelled_order_count[mass_cancel_acknowledgement_message_at]; at = at + 1; mass_cancel_acknowledgement_message_at = mass_cancel_acknowledgement_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_message_at = 0;
  do
  :: mass_cancel_acknowledgement_message_at < 8 -> wire[at] = mass_cancel_acknowledgement_message_record.request_received_time[mass_cancel_acknowledgement_message_at]; at = at + 1; mass_cancel_acknowledgement_message_at = mass_cancel_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Acknowledgement Message off the wire, 40 bytes from where the cursor stands */
inline decode_mass_cancel_acknowledgement_message(mass_cancel_acknowledgement_message_record) {
  mass_cancel_acknowledgement_message_at = 0;
  do
  :: mass_cancel_acknowledgement_message_at < 8 -> mass_cancel_acknowledgement_message_record.transaction_time[mass_cancel_acknowledgement_message_at] = wire[at]; at = at + 1; mass_cancel_acknowledgement_message_at = mass_cancel_acknowledgement_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_message_at = 0;
  do
  :: mass_cancel_acknowledgement_message_at < 20 -> mass_cancel_acknowledgement_message_record.mass_cancel_id[mass_cancel_acknowledgement_message_at] = wire[at]; at = at + 1; mass_cancel_acknowledgement_message_at = mass_cancel_acknowledgement_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_message_at = 0;
  do
  :: mass_cancel_acknowledgement_message_at < 4 -> mass_cancel_acknowledgement_message_record.cancelled_order_count[mass_cancel_acknowledgement_message_at] = wire[at]; at = at + 1; mass_cancel_acknowledgement_message_at = mass_cancel_acknowledgement_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_message_at = 0;
  do
  :: mass_cancel_acknowledgement_message_at < 8 -> mass_cancel_acknowledgement_message_record.request_received_time[mass_cancel_acknowledgement_message_at] = wire[at]; at = at + 1; mass_cancel_acknowledgement_message_at = mass_cancel_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mass Cancel Acknowledgement Message is what was written, byte for byte */
inline equal_mass_cancel_acknowledgement_message(mass_cancel_acknowledgement_message_read, mass_cancel_acknowledgement_message_written) {
  mass_cancel_acknowledgement_message_at = 0;
  do
  :: mass_cancel_acknowledgement_message_at < 8 -> assert(mass_cancel_acknowledgement_message_read.transaction_time[mass_cancel_acknowledgement_message_at] == mass_cancel_acknowledgement_message_written.transaction_time[mass_cancel_acknowledgement_message_at]); mass_cancel_acknowledgement_message_at = mass_cancel_acknowledgement_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_message_at = 0;
  do
  :: mass_cancel_acknowledgement_message_at < 20 -> assert(mass_cancel_acknowledgement_message_read.mass_cancel_id[mass_cancel_acknowledgement_message_at] == mass_cancel_acknowledgement_message_written.mass_cancel_id[mass_cancel_acknowledgement_message_at]); mass_cancel_acknowledgement_message_at = mass_cancel_acknowledgement_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_message_at = 0;
  do
  :: mass_cancel_acknowledgement_message_at < 4 -> assert(mass_cancel_acknowledgement_message_read.cancelled_order_count[mass_cancel_acknowledgement_message_at] == mass_cancel_acknowledgement_message_written.cancelled_order_count[mass_cancel_acknowledgement_message_at]); mass_cancel_acknowledgement_message_at = mass_cancel_acknowledgement_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgement_message_at = 0;
  do
  :: mass_cancel_acknowledgement_message_at < 8 -> assert(mass_cancel_acknowledgement_message_read.request_received_time[mass_cancel_acknowledgement_message_at] == mass_cancel_acknowledgement_message_written.request_received_time[mass_cancel_acknowledgement_message_at]); mass_cancel_acknowledgement_message_at = mass_cancel_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mass Cancel Rejected Message: 89 bytes ---------------------------------- */

/* A Mass Cancel Rejected message is sent in response to a Mass Cancel Order message to indicate that the mass cancellation cannot occur */
typedef MassCancelRejectedMessage {
  byte transaction_time[8];
  byte mass_cancel_id[20];
  byte mass_cancel_reject_reason;
  byte text[60]
};

int mass_cancel_rejected_message_at;

/* every byte of Mass Cancel Rejected Message set to one value */
inline fill_mass_cancel_rejected_message(mass_cancel_rejected_message_record, mass_cancel_rejected_message_value) {
  mass_cancel_rejected_message_at = 0;
  do
  :: mass_cancel_rejected_message_at < 8 -> mass_cancel_rejected_message_record.transaction_time[mass_cancel_rejected_message_at] = mass_cancel_rejected_message_value; mass_cancel_rejected_message_at = mass_cancel_rejected_message_at + 1
  :: else -> break
  od;
  mass_cancel_rejected_message_at = 0;
  do
  :: mass_cancel_rejected_message_at < 20 -> mass_cancel_rejected_message_record.mass_cancel_id[mass_cancel_rejected_message_at] = mass_cancel_rejected_message_value; mass_cancel_rejected_message_at = mass_cancel_rejected_message_at + 1
  :: else -> break
  od;
  mass_cancel_rejected_message_record.mass_cancel_reject_reason = mass_cancel_rejected_message_value;
  mass_cancel_rejected_message_at = 0;
  do
  :: mass_cancel_rejected_message_at < 60 -> mass_cancel_rejected_message_record.text[mass_cancel_rejected_message_at] = mass_cancel_rejected_message_value; mass_cancel_rejected_message_at = mass_cancel_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mass Cancel Rejected Message set to where it lies, so a field read out of place says so */
inline ramp_mass_cancel_rejected_message(mass_cancel_rejected_message_record, mass_cancel_rejected_message_base) {
  mass_cancel_rejected_message_at = 0;
  do
  :: mass_cancel_rejected_message_at < 8 -> mass_cancel_rejected_message_record.transaction_time[mass_cancel_rejected_message_at] = (mass_cancel_rejected_message_base + 0 + mass_cancel_rejected_message_at + 1) % 256; mass_cancel_rejected_message_at = mass_cancel_rejected_message_at + 1
  :: else -> break
  od;
  mass_cancel_rejected_message_at = 0;
  do
  :: mass_cancel_rejected_message_at < 20 -> mass_cancel_rejected_message_record.mass_cancel_id[mass_cancel_rejected_message_at] = (mass_cancel_rejected_message_base + 8 + mass_cancel_rejected_message_at + 1) % 256; mass_cancel_rejected_message_at = mass_cancel_rejected_message_at + 1
  :: else -> break
  od;
  mass_cancel_rejected_message_record.mass_cancel_reject_reason = (mass_cancel_rejected_message_base + 28 + 1) % 256;
  mass_cancel_rejected_message_at = 0;
  do
  :: mass_cancel_rejected_message_at < 60 -> mass_cancel_rejected_message_record.text[mass_cancel_rejected_message_at] = (mass_cancel_rejected_message_base + 29 + mass_cancel_rejected_message_at + 1) % 256; mass_cancel_rejected_message_at = mass_cancel_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Rejected Message to the wire, 89 bytes from where the cursor stands */
inline encode_mass_cancel_rejected_message(mass_cancel_rejected_message_record) {
  mass_cancel_rejected_message_at = 0;
  do
  :: mass_cancel_rejected_message_at < 8 -> wire[at] = mass_cancel_rejected_message_record.transaction_time[mass_cancel_rejected_message_at]; at = at + 1; mass_cancel_rejected_message_at = mass_cancel_rejected_message_at + 1
  :: else -> break
  od;
  mass_cancel_rejected_message_at = 0;
  do
  :: mass_cancel_rejected_message_at < 20 -> wire[at] = mass_cancel_rejected_message_record.mass_cancel_id[mass_cancel_rejected_message_at]; at = at + 1; mass_cancel_rejected_message_at = mass_cancel_rejected_message_at + 1
  :: else -> break
  od;
  wire[at] = mass_cancel_rejected_message_record.mass_cancel_reject_reason; at = at + 1;
  mass_cancel_rejected_message_at = 0;
  do
  :: mass_cancel_rejected_message_at < 60 -> wire[at] = mass_cancel_rejected_message_record.text[mass_cancel_rejected_message_at]; at = at + 1; mass_cancel_rejected_message_at = mass_cancel_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Rejected Message off the wire, 89 bytes from where the cursor stands */
inline decode_mass_cancel_rejected_message(mass_cancel_rejected_message_record) {
  mass_cancel_rejected_message_at = 0;
  do
  :: mass_cancel_rejected_message_at < 8 -> mass_cancel_rejected_message_record.transaction_time[mass_cancel_rejected_message_at] = wire[at]; at = at + 1; mass_cancel_rejected_message_at = mass_cancel_rejected_message_at + 1
  :: else -> break
  od;
  mass_cancel_rejected_message_at = 0;
  do
  :: mass_cancel_rejected_message_at < 20 -> mass_cancel_rejected_message_record.mass_cancel_id[mass_cancel_rejected_message_at] = wire[at]; at = at + 1; mass_cancel_rejected_message_at = mass_cancel_rejected_message_at + 1
  :: else -> break
  od;
  mass_cancel_rejected_message_record.mass_cancel_reject_reason = wire[at]; at = at + 1;
  mass_cancel_rejected_message_at = 0;
  do
  :: mass_cancel_rejected_message_at < 60 -> mass_cancel_rejected_message_record.text[mass_cancel_rejected_message_at] = wire[at]; at = at + 1; mass_cancel_rejected_message_at = mass_cancel_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mass Cancel Rejected Message is what was written, byte for byte */
inline equal_mass_cancel_rejected_message(mass_cancel_rejected_message_read, mass_cancel_rejected_message_written) {
  mass_cancel_rejected_message_at = 0;
  do
  :: mass_cancel_rejected_message_at < 8 -> assert(mass_cancel_rejected_message_read.transaction_time[mass_cancel_rejected_message_at] == mass_cancel_rejected_message_written.transaction_time[mass_cancel_rejected_message_at]); mass_cancel_rejected_message_at = mass_cancel_rejected_message_at + 1
  :: else -> break
  od;
  mass_cancel_rejected_message_at = 0;
  do
  :: mass_cancel_rejected_message_at < 20 -> assert(mass_cancel_rejected_message_read.mass_cancel_id[mass_cancel_rejected_message_at] == mass_cancel_rejected_message_written.mass_cancel_id[mass_cancel_rejected_message_at]); mass_cancel_rejected_message_at = mass_cancel_rejected_message_at + 1
  :: else -> break
  od;
  assert(mass_cancel_rejected_message_read.mass_cancel_reject_reason == mass_cancel_rejected_message_written.mass_cancel_reject_reason);
  mass_cancel_rejected_message_at = 0;
  do
  :: mass_cancel_rejected_message_at < 60 -> assert(mass_cancel_rejected_message_read.text[mass_cancel_rejected_message_at] == mass_cancel_rejected_message_written.text[mass_cancel_rejected_message_at]); mass_cancel_rejected_message_at = mass_cancel_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Purge Acknowledgement Message: 40 bytes --------------------------------- */

/* A Purge Acknowledgment is an unsequenced message sent when a Purge Orders message requesting an order purge has completed cancelling all individual orders */
typedef PurgeAcknowledgementMessage {
  byte transaction_time[8];
  byte mass_cancel_id[20];
  byte cancelled_order_count[4];
  byte request_received_time[8]
};

int purge_acknowledgement_message_at;

/* every byte of Purge Acknowledgement Message set to one value */
inline fill_purge_acknowledgement_message(purge_acknowledgement_message_record, purge_acknowledgement_message_value) {
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 8 -> purge_acknowledgement_message_record.transaction_time[purge_acknowledgement_message_at] = purge_acknowledgement_message_value; purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 20 -> purge_acknowledgement_message_record.mass_cancel_id[purge_acknowledgement_message_at] = purge_acknowledgement_message_value; purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 4 -> purge_acknowledgement_message_record.cancelled_order_count[purge_acknowledgement_message_at] = purge_acknowledgement_message_value; purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 8 -> purge_acknowledgement_message_record.request_received_time[purge_acknowledgement_message_at] = purge_acknowledgement_message_value; purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Purge Acknowledgement Message set to where it lies, so a field read out of place says so */
inline ramp_purge_acknowledgement_message(purge_acknowledgement_message_record, purge_acknowledgement_message_base) {
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 8 -> purge_acknowledgement_message_record.transaction_time[purge_acknowledgement_message_at] = (purge_acknowledgement_message_base + 0 + purge_acknowledgement_message_at + 1) % 256; purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 20 -> purge_acknowledgement_message_record.mass_cancel_id[purge_acknowledgement_message_at] = (purge_acknowledgement_message_base + 8 + purge_acknowledgement_message_at + 1) % 256; purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 4 -> purge_acknowledgement_message_record.cancelled_order_count[purge_acknowledgement_message_at] = (purge_acknowledgement_message_base + 28 + purge_acknowledgement_message_at + 1) % 256; purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 8 -> purge_acknowledgement_message_record.request_received_time[purge_acknowledgement_message_at] = (purge_acknowledgement_message_base + 32 + purge_acknowledgement_message_at + 1) % 256; purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Purge Acknowledgement Message to the wire, 40 bytes from where the cursor stands */
inline encode_purge_acknowledgement_message(purge_acknowledgement_message_record) {
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 8 -> wire[at] = purge_acknowledgement_message_record.transaction_time[purge_acknowledgement_message_at]; at = at + 1; purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 20 -> wire[at] = purge_acknowledgement_message_record.mass_cancel_id[purge_acknowledgement_message_at]; at = at + 1; purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 4 -> wire[at] = purge_acknowledgement_message_record.cancelled_order_count[purge_acknowledgement_message_at]; at = at + 1; purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 8 -> wire[at] = purge_acknowledgement_message_record.request_received_time[purge_acknowledgement_message_at]; at = at + 1; purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Purge Acknowledgement Message off the wire, 40 bytes from where the cursor stands */
inline decode_purge_acknowledgement_message(purge_acknowledgement_message_record) {
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 8 -> purge_acknowledgement_message_record.transaction_time[purge_acknowledgement_message_at] = wire[at]; at = at + 1; purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 20 -> purge_acknowledgement_message_record.mass_cancel_id[purge_acknowledgement_message_at] = wire[at]; at = at + 1; purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 4 -> purge_acknowledgement_message_record.cancelled_order_count[purge_acknowledgement_message_at] = wire[at]; at = at + 1; purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 8 -> purge_acknowledgement_message_record.request_received_time[purge_acknowledgement_message_at] = wire[at]; at = at + 1; purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Purge Acknowledgement Message is what was written, byte for byte */
inline equal_purge_acknowledgement_message(purge_acknowledgement_message_read, purge_acknowledgement_message_written) {
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 8 -> assert(purge_acknowledgement_message_read.transaction_time[purge_acknowledgement_message_at] == purge_acknowledgement_message_written.transaction_time[purge_acknowledgement_message_at]); purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 20 -> assert(purge_acknowledgement_message_read.mass_cancel_id[purge_acknowledgement_message_at] == purge_acknowledgement_message_written.mass_cancel_id[purge_acknowledgement_message_at]); purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 4 -> assert(purge_acknowledgement_message_read.cancelled_order_count[purge_acknowledgement_message_at] == purge_acknowledgement_message_written.cancelled_order_count[purge_acknowledgement_message_at]); purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 8 -> assert(purge_acknowledgement_message_read.request_received_time[purge_acknowledgement_message_at] == purge_acknowledgement_message_written.request_received_time[purge_acknowledgement_message_at]); purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Purge Rejected Message: 89 bytes ---------------------------------------- */

/* A Purge Rejected message is sent in response to a Purge Orders message to indicate that the mass cancellation cannot occur */
typedef PurgeRejectedMessage {
  byte transaction_time[8];
  byte mass_cancel_id[20];
  byte purge_reject_reason;
  byte text[60]
};

int purge_rejected_message_at;

/* every byte of Purge Rejected Message set to one value */
inline fill_purge_rejected_message(purge_rejected_message_record, purge_rejected_message_value) {
  purge_rejected_message_at = 0;
  do
  :: purge_rejected_message_at < 8 -> purge_rejected_message_record.transaction_time[purge_rejected_message_at] = purge_rejected_message_value; purge_rejected_message_at = purge_rejected_message_at + 1
  :: else -> break
  od;
  purge_rejected_message_at = 0;
  do
  :: purge_rejected_message_at < 20 -> purge_rejected_message_record.mass_cancel_id[purge_rejected_message_at] = purge_rejected_message_value; purge_rejected_message_at = purge_rejected_message_at + 1
  :: else -> break
  od;
  purge_rejected_message_record.purge_reject_reason = purge_rejected_message_value;
  purge_rejected_message_at = 0;
  do
  :: purge_rejected_message_at < 60 -> purge_rejected_message_record.text[purge_rejected_message_at] = purge_rejected_message_value; purge_rejected_message_at = purge_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Purge Rejected Message set to where it lies, so a field read out of place says so */
inline ramp_purge_rejected_message(purge_rejected_message_record, purge_rejected_message_base) {
  purge_rejected_message_at = 0;
  do
  :: purge_rejected_message_at < 8 -> purge_rejected_message_record.transaction_time[purge_rejected_message_at] = (purge_rejected_message_base + 0 + purge_rejected_message_at + 1) % 256; purge_rejected_message_at = purge_rejected_message_at + 1
  :: else -> break
  od;
  purge_rejected_message_at = 0;
  do
  :: purge_rejected_message_at < 20 -> purge_rejected_message_record.mass_cancel_id[purge_rejected_message_at] = (purge_rejected_message_base + 8 + purge_rejected_message_at + 1) % 256; purge_rejected_message_at = purge_rejected_message_at + 1
  :: else -> break
  od;
  purge_rejected_message_record.purge_reject_reason = (purge_rejected_message_base + 28 + 1) % 256;
  purge_rejected_message_at = 0;
  do
  :: purge_rejected_message_at < 60 -> purge_rejected_message_record.text[purge_rejected_message_at] = (purge_rejected_message_base + 29 + purge_rejected_message_at + 1) % 256; purge_rejected_message_at = purge_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* Purge Rejected Message to the wire, 89 bytes from where the cursor stands */
inline encode_purge_rejected_message(purge_rejected_message_record) {
  purge_rejected_message_at = 0;
  do
  :: purge_rejected_message_at < 8 -> wire[at] = purge_rejected_message_record.transaction_time[purge_rejected_message_at]; at = at + 1; purge_rejected_message_at = purge_rejected_message_at + 1
  :: else -> break
  od;
  purge_rejected_message_at = 0;
  do
  :: purge_rejected_message_at < 20 -> wire[at] = purge_rejected_message_record.mass_cancel_id[purge_rejected_message_at]; at = at + 1; purge_rejected_message_at = purge_rejected_message_at + 1
  :: else -> break
  od;
  wire[at] = purge_rejected_message_record.purge_reject_reason; at = at + 1;
  purge_rejected_message_at = 0;
  do
  :: purge_rejected_message_at < 60 -> wire[at] = purge_rejected_message_record.text[purge_rejected_message_at]; at = at + 1; purge_rejected_message_at = purge_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* Purge Rejected Message off the wire, 89 bytes from where the cursor stands */
inline decode_purge_rejected_message(purge_rejected_message_record) {
  purge_rejected_message_at = 0;
  do
  :: purge_rejected_message_at < 8 -> purge_rejected_message_record.transaction_time[purge_rejected_message_at] = wire[at]; at = at + 1; purge_rejected_message_at = purge_rejected_message_at + 1
  :: else -> break
  od;
  purge_rejected_message_at = 0;
  do
  :: purge_rejected_message_at < 20 -> purge_rejected_message_record.mass_cancel_id[purge_rejected_message_at] = wire[at]; at = at + 1; purge_rejected_message_at = purge_rejected_message_at + 1
  :: else -> break
  od;
  purge_rejected_message_record.purge_reject_reason = wire[at]; at = at + 1;
  purge_rejected_message_at = 0;
  do
  :: purge_rejected_message_at < 60 -> purge_rejected_message_record.text[purge_rejected_message_at] = wire[at]; at = at + 1; purge_rejected_message_at = purge_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Purge Rejected Message is what was written, byte for byte */
inline equal_purge_rejected_message(purge_rejected_message_read, purge_rejected_message_written) {
  purge_rejected_message_at = 0;
  do
  :: purge_rejected_message_at < 8 -> assert(purge_rejected_message_read.transaction_time[purge_rejected_message_at] == purge_rejected_message_written.transaction_time[purge_rejected_message_at]); purge_rejected_message_at = purge_rejected_message_at + 1
  :: else -> break
  od;
  purge_rejected_message_at = 0;
  do
  :: purge_rejected_message_at < 20 -> assert(purge_rejected_message_read.mass_cancel_id[purge_rejected_message_at] == purge_rejected_message_written.mass_cancel_id[purge_rejected_message_at]); purge_rejected_message_at = purge_rejected_message_at + 1
  :: else -> break
  od;
  assert(purge_rejected_message_read.purge_reject_reason == purge_rejected_message_written.purge_reject_reason);
  purge_rejected_message_at = 0;
  do
  :: purge_rejected_message_at < 60 -> assert(purge_rejected_message_read.text[purge_rejected_message_at] == purge_rejected_message_written.text[purge_rejected_message_at]); purge_rejected_message_at = purge_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Cancel Or Correct Message: 92 bytes ------------------------------- */

/* Used to provide notification that a trade has been cancelled or corrected */
typedef TradeCancelOrCorrectMessage {
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

int trade_cancel_or_correct_message_at;

/* every byte of Trade Cancel Or Correct Message set to one value */
inline fill_trade_cancel_or_correct_message(trade_cancel_or_correct_message_record, trade_cancel_or_correct_message_value) {
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> trade_cancel_or_correct_message_record.transaction_time[trade_cancel_or_correct_message_at] = trade_cancel_or_correct_message_value; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 20 -> trade_cancel_or_correct_message_record.cl_ord_id[trade_cancel_or_correct_message_at] = trade_cancel_or_correct_message_value; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> trade_cancel_or_correct_message_record.exec_ref_id[trade_cancel_or_correct_message_at] = trade_cancel_or_correct_message_value; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_record.side = trade_cancel_or_correct_message_value;
  trade_cancel_or_correct_message_record.base_liquidity_indicator = trade_cancel_or_correct_message_value;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 4 -> trade_cancel_or_correct_message_record.clearing_firm[trade_cancel_or_correct_message_at] = trade_cancel_or_correct_message_value; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 4 -> trade_cancel_or_correct_message_record.clearing_account[trade_cancel_or_correct_message_at] = trade_cancel_or_correct_message_value; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 4 -> trade_cancel_or_correct_message_record.last_shares[trade_cancel_or_correct_message_at] = trade_cancel_or_correct_message_value; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> trade_cancel_or_correct_message_record.last_px[trade_cancel_or_correct_message_at] = trade_cancel_or_correct_message_value; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> trade_cancel_or_correct_message_record.corrected_price[trade_cancel_or_correct_message_at] = trade_cancel_or_correct_message_value; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> trade_cancel_or_correct_message_record.orig_time[trade_cancel_or_correct_message_at] = trade_cancel_or_correct_message_value; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> trade_cancel_or_correct_message_record.symbol[trade_cancel_or_correct_message_at] = trade_cancel_or_correct_message_value; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_record.capacity = trade_cancel_or_correct_message_value;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 4 -> trade_cancel_or_correct_message_record.maturity_date[trade_cancel_or_correct_message_at] = trade_cancel_or_correct_message_value; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_record.open_close = trade_cancel_or_correct_message_value;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 4 -> trade_cancel_or_correct_message_record.cmta_number[trade_cancel_or_correct_message_at] = trade_cancel_or_correct_message_value; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Cancel Or Correct Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancel_or_correct_message(trade_cancel_or_correct_message_record, trade_cancel_or_correct_message_base) {
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> trade_cancel_or_correct_message_record.transaction_time[trade_cancel_or_correct_message_at] = (trade_cancel_or_correct_message_base + 0 + trade_cancel_or_correct_message_at + 1) % 256; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 20 -> trade_cancel_or_correct_message_record.cl_ord_id[trade_cancel_or_correct_message_at] = (trade_cancel_or_correct_message_base + 8 + trade_cancel_or_correct_message_at + 1) % 256; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> trade_cancel_or_correct_message_record.exec_ref_id[trade_cancel_or_correct_message_at] = (trade_cancel_or_correct_message_base + 28 + trade_cancel_or_correct_message_at + 1) % 256; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_record.side = (trade_cancel_or_correct_message_base + 36 + 1) % 256;
  trade_cancel_or_correct_message_record.base_liquidity_indicator = (trade_cancel_or_correct_message_base + 37 + 1) % 256;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 4 -> trade_cancel_or_correct_message_record.clearing_firm[trade_cancel_or_correct_message_at] = (trade_cancel_or_correct_message_base + 38 + trade_cancel_or_correct_message_at + 1) % 256; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 4 -> trade_cancel_or_correct_message_record.clearing_account[trade_cancel_or_correct_message_at] = (trade_cancel_or_correct_message_base + 42 + trade_cancel_or_correct_message_at + 1) % 256; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 4 -> trade_cancel_or_correct_message_record.last_shares[trade_cancel_or_correct_message_at] = (trade_cancel_or_correct_message_base + 46 + trade_cancel_or_correct_message_at + 1) % 256; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> trade_cancel_or_correct_message_record.last_px[trade_cancel_or_correct_message_at] = (trade_cancel_or_correct_message_base + 50 + trade_cancel_or_correct_message_at + 1) % 256; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> trade_cancel_or_correct_message_record.corrected_price[trade_cancel_or_correct_message_at] = (trade_cancel_or_correct_message_base + 58 + trade_cancel_or_correct_message_at + 1) % 256; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> trade_cancel_or_correct_message_record.orig_time[trade_cancel_or_correct_message_at] = (trade_cancel_or_correct_message_base + 66 + trade_cancel_or_correct_message_at + 1) % 256; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> trade_cancel_or_correct_message_record.symbol[trade_cancel_or_correct_message_at] = (trade_cancel_or_correct_message_base + 74 + trade_cancel_or_correct_message_at + 1) % 256; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_record.capacity = (trade_cancel_or_correct_message_base + 82 + 1) % 256;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 4 -> trade_cancel_or_correct_message_record.maturity_date[trade_cancel_or_correct_message_at] = (trade_cancel_or_correct_message_base + 83 + trade_cancel_or_correct_message_at + 1) % 256; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_record.open_close = (trade_cancel_or_correct_message_base + 87 + 1) % 256;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 4 -> trade_cancel_or_correct_message_record.cmta_number[trade_cancel_or_correct_message_at] = (trade_cancel_or_correct_message_base + 88 + trade_cancel_or_correct_message_at + 1) % 256; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel Or Correct Message to the wire, 92 bytes from where the cursor stands */
inline encode_trade_cancel_or_correct_message(trade_cancel_or_correct_message_record) {
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> wire[at] = trade_cancel_or_correct_message_record.transaction_time[trade_cancel_or_correct_message_at]; at = at + 1; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 20 -> wire[at] = trade_cancel_or_correct_message_record.cl_ord_id[trade_cancel_or_correct_message_at]; at = at + 1; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> wire[at] = trade_cancel_or_correct_message_record.exec_ref_id[trade_cancel_or_correct_message_at]; at = at + 1; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_or_correct_message_record.side; at = at + 1;
  wire[at] = trade_cancel_or_correct_message_record.base_liquidity_indicator; at = at + 1;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 4 -> wire[at] = trade_cancel_or_correct_message_record.clearing_firm[trade_cancel_or_correct_message_at]; at = at + 1; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 4 -> wire[at] = trade_cancel_or_correct_message_record.clearing_account[trade_cancel_or_correct_message_at]; at = at + 1; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 4 -> wire[at] = trade_cancel_or_correct_message_record.last_shares[trade_cancel_or_correct_message_at]; at = at + 1; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> wire[at] = trade_cancel_or_correct_message_record.last_px[trade_cancel_or_correct_message_at]; at = at + 1; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> wire[at] = trade_cancel_or_correct_message_record.corrected_price[trade_cancel_or_correct_message_at]; at = at + 1; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> wire[at] = trade_cancel_or_correct_message_record.orig_time[trade_cancel_or_correct_message_at]; at = at + 1; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> wire[at] = trade_cancel_or_correct_message_record.symbol[trade_cancel_or_correct_message_at]; at = at + 1; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_or_correct_message_record.capacity; at = at + 1;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 4 -> wire[at] = trade_cancel_or_correct_message_record.maturity_date[trade_cancel_or_correct_message_at]; at = at + 1; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_or_correct_message_record.open_close; at = at + 1;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 4 -> wire[at] = trade_cancel_or_correct_message_record.cmta_number[trade_cancel_or_correct_message_at]; at = at + 1; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel Or Correct Message off the wire, 92 bytes from where the cursor stands */
inline decode_trade_cancel_or_correct_message(trade_cancel_or_correct_message_record) {
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> trade_cancel_or_correct_message_record.transaction_time[trade_cancel_or_correct_message_at] = wire[at]; at = at + 1; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 20 -> trade_cancel_or_correct_message_record.cl_ord_id[trade_cancel_or_correct_message_at] = wire[at]; at = at + 1; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> trade_cancel_or_correct_message_record.exec_ref_id[trade_cancel_or_correct_message_at] = wire[at]; at = at + 1; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_record.side = wire[at]; at = at + 1;
  trade_cancel_or_correct_message_record.base_liquidity_indicator = wire[at]; at = at + 1;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 4 -> trade_cancel_or_correct_message_record.clearing_firm[trade_cancel_or_correct_message_at] = wire[at]; at = at + 1; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 4 -> trade_cancel_or_correct_message_record.clearing_account[trade_cancel_or_correct_message_at] = wire[at]; at = at + 1; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 4 -> trade_cancel_or_correct_message_record.last_shares[trade_cancel_or_correct_message_at] = wire[at]; at = at + 1; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> trade_cancel_or_correct_message_record.last_px[trade_cancel_or_correct_message_at] = wire[at]; at = at + 1; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> trade_cancel_or_correct_message_record.corrected_price[trade_cancel_or_correct_message_at] = wire[at]; at = at + 1; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> trade_cancel_or_correct_message_record.orig_time[trade_cancel_or_correct_message_at] = wire[at]; at = at + 1; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> trade_cancel_or_correct_message_record.symbol[trade_cancel_or_correct_message_at] = wire[at]; at = at + 1; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_record.capacity = wire[at]; at = at + 1;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 4 -> trade_cancel_or_correct_message_record.maturity_date[trade_cancel_or_correct_message_at] = wire[at]; at = at + 1; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_record.open_close = wire[at]; at = at + 1;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 4 -> trade_cancel_or_correct_message_record.cmta_number[trade_cancel_or_correct_message_at] = wire[at]; at = at + 1; trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Cancel Or Correct Message is what was written, byte for byte */
inline equal_trade_cancel_or_correct_message(trade_cancel_or_correct_message_read, trade_cancel_or_correct_message_written) {
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> assert(trade_cancel_or_correct_message_read.transaction_time[trade_cancel_or_correct_message_at] == trade_cancel_or_correct_message_written.transaction_time[trade_cancel_or_correct_message_at]); trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 20 -> assert(trade_cancel_or_correct_message_read.cl_ord_id[trade_cancel_or_correct_message_at] == trade_cancel_or_correct_message_written.cl_ord_id[trade_cancel_or_correct_message_at]); trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> assert(trade_cancel_or_correct_message_read.exec_ref_id[trade_cancel_or_correct_message_at] == trade_cancel_or_correct_message_written.exec_ref_id[trade_cancel_or_correct_message_at]); trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_or_correct_message_read.side == trade_cancel_or_correct_message_written.side);
  assert(trade_cancel_or_correct_message_read.base_liquidity_indicator == trade_cancel_or_correct_message_written.base_liquidity_indicator);
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 4 -> assert(trade_cancel_or_correct_message_read.clearing_firm[trade_cancel_or_correct_message_at] == trade_cancel_or_correct_message_written.clearing_firm[trade_cancel_or_correct_message_at]); trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 4 -> assert(trade_cancel_or_correct_message_read.clearing_account[trade_cancel_or_correct_message_at] == trade_cancel_or_correct_message_written.clearing_account[trade_cancel_or_correct_message_at]); trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 4 -> assert(trade_cancel_or_correct_message_read.last_shares[trade_cancel_or_correct_message_at] == trade_cancel_or_correct_message_written.last_shares[trade_cancel_or_correct_message_at]); trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> assert(trade_cancel_or_correct_message_read.last_px[trade_cancel_or_correct_message_at] == trade_cancel_or_correct_message_written.last_px[trade_cancel_or_correct_message_at]); trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> assert(trade_cancel_or_correct_message_read.corrected_price[trade_cancel_or_correct_message_at] == trade_cancel_or_correct_message_written.corrected_price[trade_cancel_or_correct_message_at]); trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> assert(trade_cancel_or_correct_message_read.orig_time[trade_cancel_or_correct_message_at] == trade_cancel_or_correct_message_written.orig_time[trade_cancel_or_correct_message_at]); trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 8 -> assert(trade_cancel_or_correct_message_read.symbol[trade_cancel_or_correct_message_at] == trade_cancel_or_correct_message_written.symbol[trade_cancel_or_correct_message_at]); trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_or_correct_message_read.capacity == trade_cancel_or_correct_message_written.capacity);
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 4 -> assert(trade_cancel_or_correct_message_read.maturity_date[trade_cancel_or_correct_message_at] == trade_cancel_or_correct_message_written.maturity_date[trade_cancel_or_correct_message_at]); trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_or_correct_message_read.open_close == trade_cancel_or_correct_message_written.open_close);
  trade_cancel_or_correct_message_at = 0;
  do
  :: trade_cancel_or_correct_message_at < 4 -> assert(trade_cancel_or_correct_message_read.cmta_number[trade_cancel_or_correct_message_at] == trade_cancel_or_correct_message_written.cmta_number[trade_cancel_or_correct_message_at]); trade_cancel_or_correct_message_at = trade_cancel_or_correct_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Tas Restatement Message: 104 bytes -------------------------------------- */

/* A Tas Restatement is sent post-settlement time for each TAS execution during the associated business day to communicate the updated Price and Symbol associated with the cleared execution */
typedef TasRestatementMessage {
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

int tas_restatement_message_at;

/* every byte of Tas Restatement Message set to one value */
inline fill_tas_restatement_message(tas_restatement_message_record, tas_restatement_message_value) {
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> tas_restatement_message_record.transaction_time[tas_restatement_message_at] = tas_restatement_message_value; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 20 -> tas_restatement_message_record.cl_ord_id[tas_restatement_message_at] = tas_restatement_message_value; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 4 -> tas_restatement_message_record.clearing_firm[tas_restatement_message_at] = tas_restatement_message_value; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> tas_restatement_message_record.exec_id[tas_restatement_message_at] = tas_restatement_message_value; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_record.side = tas_restatement_message_value;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> tas_restatement_message_record.price[tas_restatement_message_at] = tas_restatement_message_value; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> tas_restatement_message_record.symbol[tas_restatement_message_at] = tas_restatement_message_value; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 4 -> tas_restatement_message_record.maturity_date[tas_restatement_message_at] = tas_restatement_message_value; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 4 -> tas_restatement_message_record.last_shares[tas_restatement_message_at] = tas_restatement_message_value; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> tas_restatement_message_record.last_px[tas_restatement_message_at] = tas_restatement_message_value; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 2 -> tas_restatement_message_record.fee_code[tas_restatement_message_at] = tas_restatement_message_value; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 4 -> tas_restatement_message_record.trade_date[tas_restatement_message_at] = tas_restatement_message_value; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> tas_restatement_message_record.clearing_price[tas_restatement_message_at] = tas_restatement_message_value; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> tas_restatement_message_record.clearing_symbol[tas_restatement_message_at] = tas_restatement_message_value; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_record.multileg_reporting_type = tas_restatement_message_value;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> tas_restatement_message_record.secondary_exec_id[tas_restatement_message_at] = tas_restatement_message_value; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Tas Restatement Message set to where it lies, so a field read out of place says so */
inline ramp_tas_restatement_message(tas_restatement_message_record, tas_restatement_message_base) {
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> tas_restatement_message_record.transaction_time[tas_restatement_message_at] = (tas_restatement_message_base + 0 + tas_restatement_message_at + 1) % 256; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 20 -> tas_restatement_message_record.cl_ord_id[tas_restatement_message_at] = (tas_restatement_message_base + 8 + tas_restatement_message_at + 1) % 256; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 4 -> tas_restatement_message_record.clearing_firm[tas_restatement_message_at] = (tas_restatement_message_base + 28 + tas_restatement_message_at + 1) % 256; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> tas_restatement_message_record.exec_id[tas_restatement_message_at] = (tas_restatement_message_base + 32 + tas_restatement_message_at + 1) % 256; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_record.side = (tas_restatement_message_base + 40 + 1) % 256;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> tas_restatement_message_record.price[tas_restatement_message_at] = (tas_restatement_message_base + 41 + tas_restatement_message_at + 1) % 256; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> tas_restatement_message_record.symbol[tas_restatement_message_at] = (tas_restatement_message_base + 49 + tas_restatement_message_at + 1) % 256; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 4 -> tas_restatement_message_record.maturity_date[tas_restatement_message_at] = (tas_restatement_message_base + 57 + tas_restatement_message_at + 1) % 256; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 4 -> tas_restatement_message_record.last_shares[tas_restatement_message_at] = (tas_restatement_message_base + 61 + tas_restatement_message_at + 1) % 256; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> tas_restatement_message_record.last_px[tas_restatement_message_at] = (tas_restatement_message_base + 65 + tas_restatement_message_at + 1) % 256; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 2 -> tas_restatement_message_record.fee_code[tas_restatement_message_at] = (tas_restatement_message_base + 73 + tas_restatement_message_at + 1) % 256; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 4 -> tas_restatement_message_record.trade_date[tas_restatement_message_at] = (tas_restatement_message_base + 75 + tas_restatement_message_at + 1) % 256; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> tas_restatement_message_record.clearing_price[tas_restatement_message_at] = (tas_restatement_message_base + 79 + tas_restatement_message_at + 1) % 256; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> tas_restatement_message_record.clearing_symbol[tas_restatement_message_at] = (tas_restatement_message_base + 87 + tas_restatement_message_at + 1) % 256; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_record.multileg_reporting_type = (tas_restatement_message_base + 95 + 1) % 256;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> tas_restatement_message_record.secondary_exec_id[tas_restatement_message_at] = (tas_restatement_message_base + 96 + tas_restatement_message_at + 1) % 256; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Tas Restatement Message to the wire, 104 bytes from where the cursor stands */
inline encode_tas_restatement_message(tas_restatement_message_record) {
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> wire[at] = tas_restatement_message_record.transaction_time[tas_restatement_message_at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 20 -> wire[at] = tas_restatement_message_record.cl_ord_id[tas_restatement_message_at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 4 -> wire[at] = tas_restatement_message_record.clearing_firm[tas_restatement_message_at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> wire[at] = tas_restatement_message_record.exec_id[tas_restatement_message_at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  wire[at] = tas_restatement_message_record.side; at = at + 1;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> wire[at] = tas_restatement_message_record.price[tas_restatement_message_at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> wire[at] = tas_restatement_message_record.symbol[tas_restatement_message_at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 4 -> wire[at] = tas_restatement_message_record.maturity_date[tas_restatement_message_at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 4 -> wire[at] = tas_restatement_message_record.last_shares[tas_restatement_message_at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> wire[at] = tas_restatement_message_record.last_px[tas_restatement_message_at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 2 -> wire[at] = tas_restatement_message_record.fee_code[tas_restatement_message_at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 4 -> wire[at] = tas_restatement_message_record.trade_date[tas_restatement_message_at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> wire[at] = tas_restatement_message_record.clearing_price[tas_restatement_message_at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> wire[at] = tas_restatement_message_record.clearing_symbol[tas_restatement_message_at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  wire[at] = tas_restatement_message_record.multileg_reporting_type; at = at + 1;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> wire[at] = tas_restatement_message_record.secondary_exec_id[tas_restatement_message_at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Tas Restatement Message off the wire, 104 bytes from where the cursor stands */
inline decode_tas_restatement_message(tas_restatement_message_record) {
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> tas_restatement_message_record.transaction_time[tas_restatement_message_at] = wire[at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 20 -> tas_restatement_message_record.cl_ord_id[tas_restatement_message_at] = wire[at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 4 -> tas_restatement_message_record.clearing_firm[tas_restatement_message_at] = wire[at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> tas_restatement_message_record.exec_id[tas_restatement_message_at] = wire[at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_record.side = wire[at]; at = at + 1;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> tas_restatement_message_record.price[tas_restatement_message_at] = wire[at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> tas_restatement_message_record.symbol[tas_restatement_message_at] = wire[at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 4 -> tas_restatement_message_record.maturity_date[tas_restatement_message_at] = wire[at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 4 -> tas_restatement_message_record.last_shares[tas_restatement_message_at] = wire[at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> tas_restatement_message_record.last_px[tas_restatement_message_at] = wire[at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 2 -> tas_restatement_message_record.fee_code[tas_restatement_message_at] = wire[at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 4 -> tas_restatement_message_record.trade_date[tas_restatement_message_at] = wire[at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> tas_restatement_message_record.clearing_price[tas_restatement_message_at] = wire[at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> tas_restatement_message_record.clearing_symbol[tas_restatement_message_at] = wire[at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_record.multileg_reporting_type = wire[at]; at = at + 1;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> tas_restatement_message_record.secondary_exec_id[tas_restatement_message_at] = wire[at]; at = at + 1; tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Tas Restatement Message is what was written, byte for byte */
inline equal_tas_restatement_message(tas_restatement_message_read, tas_restatement_message_written) {
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> assert(tas_restatement_message_read.transaction_time[tas_restatement_message_at] == tas_restatement_message_written.transaction_time[tas_restatement_message_at]); tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 20 -> assert(tas_restatement_message_read.cl_ord_id[tas_restatement_message_at] == tas_restatement_message_written.cl_ord_id[tas_restatement_message_at]); tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 4 -> assert(tas_restatement_message_read.clearing_firm[tas_restatement_message_at] == tas_restatement_message_written.clearing_firm[tas_restatement_message_at]); tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> assert(tas_restatement_message_read.exec_id[tas_restatement_message_at] == tas_restatement_message_written.exec_id[tas_restatement_message_at]); tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  assert(tas_restatement_message_read.side == tas_restatement_message_written.side);
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> assert(tas_restatement_message_read.price[tas_restatement_message_at] == tas_restatement_message_written.price[tas_restatement_message_at]); tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> assert(tas_restatement_message_read.symbol[tas_restatement_message_at] == tas_restatement_message_written.symbol[tas_restatement_message_at]); tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 4 -> assert(tas_restatement_message_read.maturity_date[tas_restatement_message_at] == tas_restatement_message_written.maturity_date[tas_restatement_message_at]); tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 4 -> assert(tas_restatement_message_read.last_shares[tas_restatement_message_at] == tas_restatement_message_written.last_shares[tas_restatement_message_at]); tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> assert(tas_restatement_message_read.last_px[tas_restatement_message_at] == tas_restatement_message_written.last_px[tas_restatement_message_at]); tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 2 -> assert(tas_restatement_message_read.fee_code[tas_restatement_message_at] == tas_restatement_message_written.fee_code[tas_restatement_message_at]); tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 4 -> assert(tas_restatement_message_read.trade_date[tas_restatement_message_at] == tas_restatement_message_written.trade_date[tas_restatement_message_at]); tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> assert(tas_restatement_message_read.clearing_price[tas_restatement_message_at] == tas_restatement_message_written.clearing_price[tas_restatement_message_at]); tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> assert(tas_restatement_message_read.clearing_symbol[tas_restatement_message_at] == tas_restatement_message_written.clearing_symbol[tas_restatement_message_at]); tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  assert(tas_restatement_message_read.multileg_reporting_type == tas_restatement_message_written.multileg_reporting_type);
  tas_restatement_message_at = 0;
  do
  :: tas_restatement_message_at < 8 -> assert(tas_restatement_message_read.secondary_exec_id[tas_restatement_message_at] == tas_restatement_message_written.secondary_exec_id[tas_restatement_message_at]); tas_restatement_message_at = tas_restatement_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Variance Restatement Message: 108 bytes --------------------------------- */

/* A Variance Restatement is sent post-settlement time for each VA and VAO execution during the associated business day to communicate updated Price, Size and Symbol associated with the cleared execution */
typedef VarianceRestatementMessage {
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
  byte clearing_size[4];
  byte clearing_symbol[8];
  byte multileg_reporting_type;
  byte secondary_exec_id[8]
};

int variance_restatement_message_at;

/* every byte of Variance Restatement Message set to one value */
inline fill_variance_restatement_message(variance_restatement_message_record, variance_restatement_message_value) {
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> variance_restatement_message_record.transaction_time[variance_restatement_message_at] = variance_restatement_message_value; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 20 -> variance_restatement_message_record.cl_ord_id[variance_restatement_message_at] = variance_restatement_message_value; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 4 -> variance_restatement_message_record.clearing_firm[variance_restatement_message_at] = variance_restatement_message_value; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> variance_restatement_message_record.exec_id[variance_restatement_message_at] = variance_restatement_message_value; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_record.side = variance_restatement_message_value;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> variance_restatement_message_record.price[variance_restatement_message_at] = variance_restatement_message_value; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> variance_restatement_message_record.symbol[variance_restatement_message_at] = variance_restatement_message_value; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 4 -> variance_restatement_message_record.maturity_date[variance_restatement_message_at] = variance_restatement_message_value; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 4 -> variance_restatement_message_record.last_shares[variance_restatement_message_at] = variance_restatement_message_value; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> variance_restatement_message_record.last_px[variance_restatement_message_at] = variance_restatement_message_value; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 2 -> variance_restatement_message_record.fee_code[variance_restatement_message_at] = variance_restatement_message_value; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 4 -> variance_restatement_message_record.trade_date[variance_restatement_message_at] = variance_restatement_message_value; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> variance_restatement_message_record.clearing_price[variance_restatement_message_at] = variance_restatement_message_value; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 4 -> variance_restatement_message_record.clearing_size[variance_restatement_message_at] = variance_restatement_message_value; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> variance_restatement_message_record.clearing_symbol[variance_restatement_message_at] = variance_restatement_message_value; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_record.multileg_reporting_type = variance_restatement_message_value;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> variance_restatement_message_record.secondary_exec_id[variance_restatement_message_at] = variance_restatement_message_value; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Variance Restatement Message set to where it lies, so a field read out of place says so */
inline ramp_variance_restatement_message(variance_restatement_message_record, variance_restatement_message_base) {
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> variance_restatement_message_record.transaction_time[variance_restatement_message_at] = (variance_restatement_message_base + 0 + variance_restatement_message_at + 1) % 256; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 20 -> variance_restatement_message_record.cl_ord_id[variance_restatement_message_at] = (variance_restatement_message_base + 8 + variance_restatement_message_at + 1) % 256; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 4 -> variance_restatement_message_record.clearing_firm[variance_restatement_message_at] = (variance_restatement_message_base + 28 + variance_restatement_message_at + 1) % 256; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> variance_restatement_message_record.exec_id[variance_restatement_message_at] = (variance_restatement_message_base + 32 + variance_restatement_message_at + 1) % 256; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_record.side = (variance_restatement_message_base + 40 + 1) % 256;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> variance_restatement_message_record.price[variance_restatement_message_at] = (variance_restatement_message_base + 41 + variance_restatement_message_at + 1) % 256; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> variance_restatement_message_record.symbol[variance_restatement_message_at] = (variance_restatement_message_base + 49 + variance_restatement_message_at + 1) % 256; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 4 -> variance_restatement_message_record.maturity_date[variance_restatement_message_at] = (variance_restatement_message_base + 57 + variance_restatement_message_at + 1) % 256; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 4 -> variance_restatement_message_record.last_shares[variance_restatement_message_at] = (variance_restatement_message_base + 61 + variance_restatement_message_at + 1) % 256; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> variance_restatement_message_record.last_px[variance_restatement_message_at] = (variance_restatement_message_base + 65 + variance_restatement_message_at + 1) % 256; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 2 -> variance_restatement_message_record.fee_code[variance_restatement_message_at] = (variance_restatement_message_base + 73 + variance_restatement_message_at + 1) % 256; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 4 -> variance_restatement_message_record.trade_date[variance_restatement_message_at] = (variance_restatement_message_base + 75 + variance_restatement_message_at + 1) % 256; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> variance_restatement_message_record.clearing_price[variance_restatement_message_at] = (variance_restatement_message_base + 79 + variance_restatement_message_at + 1) % 256; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 4 -> variance_restatement_message_record.clearing_size[variance_restatement_message_at] = (variance_restatement_message_base + 87 + variance_restatement_message_at + 1) % 256; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> variance_restatement_message_record.clearing_symbol[variance_restatement_message_at] = (variance_restatement_message_base + 91 + variance_restatement_message_at + 1) % 256; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_record.multileg_reporting_type = (variance_restatement_message_base + 99 + 1) % 256;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> variance_restatement_message_record.secondary_exec_id[variance_restatement_message_at] = (variance_restatement_message_base + 100 + variance_restatement_message_at + 1) % 256; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Variance Restatement Message to the wire, 108 bytes from where the cursor stands */
inline encode_variance_restatement_message(variance_restatement_message_record) {
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> wire[at] = variance_restatement_message_record.transaction_time[variance_restatement_message_at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 20 -> wire[at] = variance_restatement_message_record.cl_ord_id[variance_restatement_message_at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 4 -> wire[at] = variance_restatement_message_record.clearing_firm[variance_restatement_message_at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> wire[at] = variance_restatement_message_record.exec_id[variance_restatement_message_at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  wire[at] = variance_restatement_message_record.side; at = at + 1;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> wire[at] = variance_restatement_message_record.price[variance_restatement_message_at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> wire[at] = variance_restatement_message_record.symbol[variance_restatement_message_at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 4 -> wire[at] = variance_restatement_message_record.maturity_date[variance_restatement_message_at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 4 -> wire[at] = variance_restatement_message_record.last_shares[variance_restatement_message_at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> wire[at] = variance_restatement_message_record.last_px[variance_restatement_message_at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 2 -> wire[at] = variance_restatement_message_record.fee_code[variance_restatement_message_at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 4 -> wire[at] = variance_restatement_message_record.trade_date[variance_restatement_message_at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> wire[at] = variance_restatement_message_record.clearing_price[variance_restatement_message_at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 4 -> wire[at] = variance_restatement_message_record.clearing_size[variance_restatement_message_at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> wire[at] = variance_restatement_message_record.clearing_symbol[variance_restatement_message_at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  wire[at] = variance_restatement_message_record.multileg_reporting_type; at = at + 1;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> wire[at] = variance_restatement_message_record.secondary_exec_id[variance_restatement_message_at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Variance Restatement Message off the wire, 108 bytes from where the cursor stands */
inline decode_variance_restatement_message(variance_restatement_message_record) {
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> variance_restatement_message_record.transaction_time[variance_restatement_message_at] = wire[at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 20 -> variance_restatement_message_record.cl_ord_id[variance_restatement_message_at] = wire[at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 4 -> variance_restatement_message_record.clearing_firm[variance_restatement_message_at] = wire[at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> variance_restatement_message_record.exec_id[variance_restatement_message_at] = wire[at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_record.side = wire[at]; at = at + 1;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> variance_restatement_message_record.price[variance_restatement_message_at] = wire[at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> variance_restatement_message_record.symbol[variance_restatement_message_at] = wire[at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 4 -> variance_restatement_message_record.maturity_date[variance_restatement_message_at] = wire[at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 4 -> variance_restatement_message_record.last_shares[variance_restatement_message_at] = wire[at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> variance_restatement_message_record.last_px[variance_restatement_message_at] = wire[at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 2 -> variance_restatement_message_record.fee_code[variance_restatement_message_at] = wire[at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 4 -> variance_restatement_message_record.trade_date[variance_restatement_message_at] = wire[at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> variance_restatement_message_record.clearing_price[variance_restatement_message_at] = wire[at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 4 -> variance_restatement_message_record.clearing_size[variance_restatement_message_at] = wire[at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> variance_restatement_message_record.clearing_symbol[variance_restatement_message_at] = wire[at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_record.multileg_reporting_type = wire[at]; at = at + 1;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> variance_restatement_message_record.secondary_exec_id[variance_restatement_message_at] = wire[at]; at = at + 1; variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Variance Restatement Message is what was written, byte for byte */
inline equal_variance_restatement_message(variance_restatement_message_read, variance_restatement_message_written) {
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> assert(variance_restatement_message_read.transaction_time[variance_restatement_message_at] == variance_restatement_message_written.transaction_time[variance_restatement_message_at]); variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 20 -> assert(variance_restatement_message_read.cl_ord_id[variance_restatement_message_at] == variance_restatement_message_written.cl_ord_id[variance_restatement_message_at]); variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 4 -> assert(variance_restatement_message_read.clearing_firm[variance_restatement_message_at] == variance_restatement_message_written.clearing_firm[variance_restatement_message_at]); variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> assert(variance_restatement_message_read.exec_id[variance_restatement_message_at] == variance_restatement_message_written.exec_id[variance_restatement_message_at]); variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  assert(variance_restatement_message_read.side == variance_restatement_message_written.side);
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> assert(variance_restatement_message_read.price[variance_restatement_message_at] == variance_restatement_message_written.price[variance_restatement_message_at]); variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> assert(variance_restatement_message_read.symbol[variance_restatement_message_at] == variance_restatement_message_written.symbol[variance_restatement_message_at]); variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 4 -> assert(variance_restatement_message_read.maturity_date[variance_restatement_message_at] == variance_restatement_message_written.maturity_date[variance_restatement_message_at]); variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 4 -> assert(variance_restatement_message_read.last_shares[variance_restatement_message_at] == variance_restatement_message_written.last_shares[variance_restatement_message_at]); variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> assert(variance_restatement_message_read.last_px[variance_restatement_message_at] == variance_restatement_message_written.last_px[variance_restatement_message_at]); variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 2 -> assert(variance_restatement_message_read.fee_code[variance_restatement_message_at] == variance_restatement_message_written.fee_code[variance_restatement_message_at]); variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 4 -> assert(variance_restatement_message_read.trade_date[variance_restatement_message_at] == variance_restatement_message_written.trade_date[variance_restatement_message_at]); variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> assert(variance_restatement_message_read.clearing_price[variance_restatement_message_at] == variance_restatement_message_written.clearing_price[variance_restatement_message_at]); variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 4 -> assert(variance_restatement_message_read.clearing_size[variance_restatement_message_at] == variance_restatement_message_written.clearing_size[variance_restatement_message_at]); variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> assert(variance_restatement_message_read.clearing_symbol[variance_restatement_message_at] == variance_restatement_message_written.clearing_symbol[variance_restatement_message_at]); variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  assert(variance_restatement_message_read.multileg_reporting_type == variance_restatement_message_written.multileg_reporting_type);
  variance_restatement_message_at = 0;
  do
  :: variance_restatement_message_at < 8 -> assert(variance_restatement_message_read.secondary_exec_id[variance_restatement_message_at] == variance_restatement_message_written.secondary_exec_id[variance_restatement_message_at]); variance_restatement_message_at = variance_restatement_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Update Rejected Message: 25 bytes --------------------------------- */

/* Quote Update Rejected messages are sent in response to a Quote Update or Quote Update Option message when the entire quote block is rejected by the order handler */
typedef QuoteUpdateRejectedMessage {
  byte transaction_time[8];
  byte quote_update_id[16];
  byte quote_reject_reason
};

int quote_update_rejected_message_at;

/* every byte of Quote Update Rejected Message set to one value */
inline fill_quote_update_rejected_message(quote_update_rejected_message_record, quote_update_rejected_message_value) {
  quote_update_rejected_message_at = 0;
  do
  :: quote_update_rejected_message_at < 8 -> quote_update_rejected_message_record.transaction_time[quote_update_rejected_message_at] = quote_update_rejected_message_value; quote_update_rejected_message_at = quote_update_rejected_message_at + 1
  :: else -> break
  od;
  quote_update_rejected_message_at = 0;
  do
  :: quote_update_rejected_message_at < 16 -> quote_update_rejected_message_record.quote_update_id[quote_update_rejected_message_at] = quote_update_rejected_message_value; quote_update_rejected_message_at = quote_update_rejected_message_at + 1
  :: else -> break
  od;
  quote_update_rejected_message_record.quote_reject_reason = quote_update_rejected_message_value;
  skip
}

/* each byte of Quote Update Rejected Message set to where it lies, so a field read out of place says so */
inline ramp_quote_update_rejected_message(quote_update_rejected_message_record, quote_update_rejected_message_base) {
  quote_update_rejected_message_at = 0;
  do
  :: quote_update_rejected_message_at < 8 -> quote_update_rejected_message_record.transaction_time[quote_update_rejected_message_at] = (quote_update_rejected_message_base + 0 + quote_update_rejected_message_at + 1) % 256; quote_update_rejected_message_at = quote_update_rejected_message_at + 1
  :: else -> break
  od;
  quote_update_rejected_message_at = 0;
  do
  :: quote_update_rejected_message_at < 16 -> quote_update_rejected_message_record.quote_update_id[quote_update_rejected_message_at] = (quote_update_rejected_message_base + 8 + quote_update_rejected_message_at + 1) % 256; quote_update_rejected_message_at = quote_update_rejected_message_at + 1
  :: else -> break
  od;
  quote_update_rejected_message_record.quote_reject_reason = (quote_update_rejected_message_base + 24 + 1) % 256;
  skip
}

/* Quote Update Rejected Message to the wire, 25 bytes from where the cursor stands */
inline encode_quote_update_rejected_message(quote_update_rejected_message_record) {
  quote_update_rejected_message_at = 0;
  do
  :: quote_update_rejected_message_at < 8 -> wire[at] = quote_update_rejected_message_record.transaction_time[quote_update_rejected_message_at]; at = at + 1; quote_update_rejected_message_at = quote_update_rejected_message_at + 1
  :: else -> break
  od;
  quote_update_rejected_message_at = 0;
  do
  :: quote_update_rejected_message_at < 16 -> wire[at] = quote_update_rejected_message_record.quote_update_id[quote_update_rejected_message_at]; at = at + 1; quote_update_rejected_message_at = quote_update_rejected_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_update_rejected_message_record.quote_reject_reason; at = at + 1;
  skip
}

/* Quote Update Rejected Message off the wire, 25 bytes from where the cursor stands */
inline decode_quote_update_rejected_message(quote_update_rejected_message_record) {
  quote_update_rejected_message_at = 0;
  do
  :: quote_update_rejected_message_at < 8 -> quote_update_rejected_message_record.transaction_time[quote_update_rejected_message_at] = wire[at]; at = at + 1; quote_update_rejected_message_at = quote_update_rejected_message_at + 1
  :: else -> break
  od;
  quote_update_rejected_message_at = 0;
  do
  :: quote_update_rejected_message_at < 16 -> quote_update_rejected_message_record.quote_update_id[quote_update_rejected_message_at] = wire[at]; at = at + 1; quote_update_rejected_message_at = quote_update_rejected_message_at + 1
  :: else -> break
  od;
  quote_update_rejected_message_record.quote_reject_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Quote Update Rejected Message is what was written, byte for byte */
inline equal_quote_update_rejected_message(quote_update_rejected_message_read, quote_update_rejected_message_written) {
  quote_update_rejected_message_at = 0;
  do
  :: quote_update_rejected_message_at < 8 -> assert(quote_update_rejected_message_read.transaction_time[quote_update_rejected_message_at] == quote_update_rejected_message_written.transaction_time[quote_update_rejected_message_at]); quote_update_rejected_message_at = quote_update_rejected_message_at + 1
  :: else -> break
  od;
  quote_update_rejected_message_at = 0;
  do
  :: quote_update_rejected_message_at < 16 -> assert(quote_update_rejected_message_read.quote_update_id[quote_update_rejected_message_at] == quote_update_rejected_message_written.quote_update_id[quote_update_rejected_message_at]); quote_update_rejected_message_at = quote_update_rejected_message_at + 1
  :: else -> break
  od;
  assert(quote_update_rejected_message_read.quote_reject_reason == quote_update_rejected_message_written.quote_reject_reason);
  skip
}

/* ---- Quote Restated Message: 52 bytes ---------------------------------------- */

/* Quote Restated messages are sent to inform the TPH that an order has been asynchronously modified for some reason by CFE */
typedef QuoteRestatedMessage {
  byte transaction_time[8];
  byte quote_update_id[16];
  byte order_id[8];
  byte leaves_qty[4];
  byte working_price[8];
  byte quote_symbol[6];
  byte side;
  byte restatement_reason
};

int quote_restated_message_at;

/* every byte of Quote Restated Message set to one value */
inline fill_quote_restated_message(quote_restated_message_record, quote_restated_message_value) {
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> quote_restated_message_record.transaction_time[quote_restated_message_at] = quote_restated_message_value; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 16 -> quote_restated_message_record.quote_update_id[quote_restated_message_at] = quote_restated_message_value; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> quote_restated_message_record.order_id[quote_restated_message_at] = quote_restated_message_value; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 4 -> quote_restated_message_record.leaves_qty[quote_restated_message_at] = quote_restated_message_value; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> quote_restated_message_record.working_price[quote_restated_message_at] = quote_restated_message_value; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 6 -> quote_restated_message_record.quote_symbol[quote_restated_message_at] = quote_restated_message_value; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_record.side = quote_restated_message_value;
  quote_restated_message_record.restatement_reason = quote_restated_message_value;
  skip
}

/* each byte of Quote Restated Message set to where it lies, so a field read out of place says so */
inline ramp_quote_restated_message(quote_restated_message_record, quote_restated_message_base) {
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> quote_restated_message_record.transaction_time[quote_restated_message_at] = (quote_restated_message_base + 0 + quote_restated_message_at + 1) % 256; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 16 -> quote_restated_message_record.quote_update_id[quote_restated_message_at] = (quote_restated_message_base + 8 + quote_restated_message_at + 1) % 256; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> quote_restated_message_record.order_id[quote_restated_message_at] = (quote_restated_message_base + 24 + quote_restated_message_at + 1) % 256; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 4 -> quote_restated_message_record.leaves_qty[quote_restated_message_at] = (quote_restated_message_base + 32 + quote_restated_message_at + 1) % 256; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> quote_restated_message_record.working_price[quote_restated_message_at] = (quote_restated_message_base + 36 + quote_restated_message_at + 1) % 256; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 6 -> quote_restated_message_record.quote_symbol[quote_restated_message_at] = (quote_restated_message_base + 44 + quote_restated_message_at + 1) % 256; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_record.side = (quote_restated_message_base + 50 + 1) % 256;
  quote_restated_message_record.restatement_reason = (quote_restated_message_base + 51 + 1) % 256;
  skip
}

/* Quote Restated Message to the wire, 52 bytes from where the cursor stands */
inline encode_quote_restated_message(quote_restated_message_record) {
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> wire[at] = quote_restated_message_record.transaction_time[quote_restated_message_at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 16 -> wire[at] = quote_restated_message_record.quote_update_id[quote_restated_message_at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> wire[at] = quote_restated_message_record.order_id[quote_restated_message_at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 4 -> wire[at] = quote_restated_message_record.leaves_qty[quote_restated_message_at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> wire[at] = quote_restated_message_record.working_price[quote_restated_message_at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 6 -> wire[at] = quote_restated_message_record.quote_symbol[quote_restated_message_at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_restated_message_record.side; at = at + 1;
  wire[at] = quote_restated_message_record.restatement_reason; at = at + 1;
  skip
}

/* Quote Restated Message off the wire, 52 bytes from where the cursor stands */
inline decode_quote_restated_message(quote_restated_message_record) {
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> quote_restated_message_record.transaction_time[quote_restated_message_at] = wire[at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 16 -> quote_restated_message_record.quote_update_id[quote_restated_message_at] = wire[at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> quote_restated_message_record.order_id[quote_restated_message_at] = wire[at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 4 -> quote_restated_message_record.leaves_qty[quote_restated_message_at] = wire[at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> quote_restated_message_record.working_price[quote_restated_message_at] = wire[at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 6 -> quote_restated_message_record.quote_symbol[quote_restated_message_at] = wire[at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_record.side = wire[at]; at = at + 1;
  quote_restated_message_record.restatement_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Quote Restated Message is what was written, byte for byte */
inline equal_quote_restated_message(quote_restated_message_read, quote_restated_message_written) {
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> assert(quote_restated_message_read.transaction_time[quote_restated_message_at] == quote_restated_message_written.transaction_time[quote_restated_message_at]); quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 16 -> assert(quote_restated_message_read.quote_update_id[quote_restated_message_at] == quote_restated_message_written.quote_update_id[quote_restated_message_at]); quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> assert(quote_restated_message_read.order_id[quote_restated_message_at] == quote_restated_message_written.order_id[quote_restated_message_at]); quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 4 -> assert(quote_restated_message_read.leaves_qty[quote_restated_message_at] == quote_restated_message_written.leaves_qty[quote_restated_message_at]); quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> assert(quote_restated_message_read.working_price[quote_restated_message_at] == quote_restated_message_written.working_price[quote_restated_message_at]); quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 6 -> assert(quote_restated_message_read.quote_symbol[quote_restated_message_at] == quote_restated_message_written.quote_symbol[quote_restated_message_at]); quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  assert(quote_restated_message_read.side == quote_restated_message_written.side);
  assert(quote_restated_message_read.restatement_reason == quote_restated_message_written.restatement_reason);
  skip
}

/* ---- Quote Execution Message: 71 bytes --------------------------------------- */

/* A Quote Execution message is used to indicate an execution has occurred on a resting quote */
typedef QuoteExecutionMessage {
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

int quote_execution_message_at;

/* every byte of Quote Execution Message set to one value */
inline fill_quote_execution_message(quote_execution_message_record, quote_execution_message_value) {
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 8 -> quote_execution_message_record.transaction_time[quote_execution_message_at] = quote_execution_message_value; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 16 -> quote_execution_message_record.quote_update_id[quote_execution_message_at] = quote_execution_message_value; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 8 -> quote_execution_message_record.order_id[quote_execution_message_at] = quote_execution_message_value; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 8 -> quote_execution_message_record.exec_id[quote_execution_message_at] = quote_execution_message_value; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 6 -> quote_execution_message_record.quote_symbol[quote_execution_message_at] = quote_execution_message_value; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> quote_execution_message_record.clearing_firm[quote_execution_message_at] = quote_execution_message_value; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> quote_execution_message_record.last_shares[quote_execution_message_at] = quote_execution_message_value; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 8 -> quote_execution_message_record.last_px[quote_execution_message_at] = quote_execution_message_value; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> quote_execution_message_record.leaves_qty[quote_execution_message_at] = quote_execution_message_value; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_record.side = quote_execution_message_value;
  quote_execution_message_record.base_liquidity_indicator = quote_execution_message_value;
  quote_execution_message_record.sub_liquidity_indicator = quote_execution_message_value;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 2 -> quote_execution_message_record.fee_code[quote_execution_message_at] = quote_execution_message_value; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Execution Message set to where it lies, so a field read out of place says so */
inline ramp_quote_execution_message(quote_execution_message_record, quote_execution_message_base) {
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 8 -> quote_execution_message_record.transaction_time[quote_execution_message_at] = (quote_execution_message_base + 0 + quote_execution_message_at + 1) % 256; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 16 -> quote_execution_message_record.quote_update_id[quote_execution_message_at] = (quote_execution_message_base + 8 + quote_execution_message_at + 1) % 256; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 8 -> quote_execution_message_record.order_id[quote_execution_message_at] = (quote_execution_message_base + 24 + quote_execution_message_at + 1) % 256; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 8 -> quote_execution_message_record.exec_id[quote_execution_message_at] = (quote_execution_message_base + 32 + quote_execution_message_at + 1) % 256; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 6 -> quote_execution_message_record.quote_symbol[quote_execution_message_at] = (quote_execution_message_base + 40 + quote_execution_message_at + 1) % 256; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> quote_execution_message_record.clearing_firm[quote_execution_message_at] = (quote_execution_message_base + 46 + quote_execution_message_at + 1) % 256; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> quote_execution_message_record.last_shares[quote_execution_message_at] = (quote_execution_message_base + 50 + quote_execution_message_at + 1) % 256; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 8 -> quote_execution_message_record.last_px[quote_execution_message_at] = (quote_execution_message_base + 54 + quote_execution_message_at + 1) % 256; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> quote_execution_message_record.leaves_qty[quote_execution_message_at] = (quote_execution_message_base + 62 + quote_execution_message_at + 1) % 256; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_record.side = (quote_execution_message_base + 66 + 1) % 256;
  quote_execution_message_record.base_liquidity_indicator = (quote_execution_message_base + 67 + 1) % 256;
  quote_execution_message_record.sub_liquidity_indicator = (quote_execution_message_base + 68 + 1) % 256;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 2 -> quote_execution_message_record.fee_code[quote_execution_message_at] = (quote_execution_message_base + 69 + quote_execution_message_at + 1) % 256; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Execution Message to the wire, 71 bytes from where the cursor stands */
inline encode_quote_execution_message(quote_execution_message_record) {
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 8 -> wire[at] = quote_execution_message_record.transaction_time[quote_execution_message_at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 16 -> wire[at] = quote_execution_message_record.quote_update_id[quote_execution_message_at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 8 -> wire[at] = quote_execution_message_record.order_id[quote_execution_message_at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 8 -> wire[at] = quote_execution_message_record.exec_id[quote_execution_message_at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 6 -> wire[at] = quote_execution_message_record.quote_symbol[quote_execution_message_at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> wire[at] = quote_execution_message_record.clearing_firm[quote_execution_message_at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> wire[at] = quote_execution_message_record.last_shares[quote_execution_message_at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 8 -> wire[at] = quote_execution_message_record.last_px[quote_execution_message_at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> wire[at] = quote_execution_message_record.leaves_qty[quote_execution_message_at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_execution_message_record.side; at = at + 1;
  wire[at] = quote_execution_message_record.base_liquidity_indicator; at = at + 1;
  wire[at] = quote_execution_message_record.sub_liquidity_indicator; at = at + 1;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 2 -> wire[at] = quote_execution_message_record.fee_code[quote_execution_message_at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Execution Message off the wire, 71 bytes from where the cursor stands */
inline decode_quote_execution_message(quote_execution_message_record) {
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 8 -> quote_execution_message_record.transaction_time[quote_execution_message_at] = wire[at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 16 -> quote_execution_message_record.quote_update_id[quote_execution_message_at] = wire[at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 8 -> quote_execution_message_record.order_id[quote_execution_message_at] = wire[at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 8 -> quote_execution_message_record.exec_id[quote_execution_message_at] = wire[at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 6 -> quote_execution_message_record.quote_symbol[quote_execution_message_at] = wire[at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> quote_execution_message_record.clearing_firm[quote_execution_message_at] = wire[at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> quote_execution_message_record.last_shares[quote_execution_message_at] = wire[at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 8 -> quote_execution_message_record.last_px[quote_execution_message_at] = wire[at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> quote_execution_message_record.leaves_qty[quote_execution_message_at] = wire[at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_record.side = wire[at]; at = at + 1;
  quote_execution_message_record.base_liquidity_indicator = wire[at]; at = at + 1;
  quote_execution_message_record.sub_liquidity_indicator = wire[at]; at = at + 1;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 2 -> quote_execution_message_record.fee_code[quote_execution_message_at] = wire[at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Execution Message is what was written, byte for byte */
inline equal_quote_execution_message(quote_execution_message_read, quote_execution_message_written) {
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 8 -> assert(quote_execution_message_read.transaction_time[quote_execution_message_at] == quote_execution_message_written.transaction_time[quote_execution_message_at]); quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 16 -> assert(quote_execution_message_read.quote_update_id[quote_execution_message_at] == quote_execution_message_written.quote_update_id[quote_execution_message_at]); quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 8 -> assert(quote_execution_message_read.order_id[quote_execution_message_at] == quote_execution_message_written.order_id[quote_execution_message_at]); quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 8 -> assert(quote_execution_message_read.exec_id[quote_execution_message_at] == quote_execution_message_written.exec_id[quote_execution_message_at]); quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 6 -> assert(quote_execution_message_read.quote_symbol[quote_execution_message_at] == quote_execution_message_written.quote_symbol[quote_execution_message_at]); quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> assert(quote_execution_message_read.clearing_firm[quote_execution_message_at] == quote_execution_message_written.clearing_firm[quote_execution_message_at]); quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> assert(quote_execution_message_read.last_shares[quote_execution_message_at] == quote_execution_message_written.last_shares[quote_execution_message_at]); quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 8 -> assert(quote_execution_message_read.last_px[quote_execution_message_at] == quote_execution_message_written.last_px[quote_execution_message_at]); quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> assert(quote_execution_message_read.leaves_qty[quote_execution_message_at] == quote_execution_message_written.leaves_qty[quote_execution_message_at]); quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  assert(quote_execution_message_read.side == quote_execution_message_written.side);
  assert(quote_execution_message_read.base_liquidity_indicator == quote_execution_message_written.base_liquidity_indicator);
  assert(quote_execution_message_read.sub_liquidity_indicator == quote_execution_message_written.sub_liquidity_indicator);
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 2 -> assert(quote_execution_message_read.fee_code[quote_execution_message_at] == quote_execution_message_written.fee_code[quote_execution_message_at]); quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Cancelled Message: 40 bytes --------------------------------------- */

/* A Quote Cancelled message will be sent to indicate an unsolicited cancellation of a quote entered with a Quote Update message */
typedef QuoteCancelledMessage {
  byte transaction_time[8];
  byte quote_update_id[16];
  byte order_id[8];
  byte quote_symbol[6];
  byte side;
  byte cancel_reason
};

int quote_cancelled_message_at;

/* every byte of Quote Cancelled Message set to one value */
inline fill_quote_cancelled_message(quote_cancelled_message_record, quote_cancelled_message_value) {
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 8 -> quote_cancelled_message_record.transaction_time[quote_cancelled_message_at] = quote_cancelled_message_value; quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 16 -> quote_cancelled_message_record.quote_update_id[quote_cancelled_message_at] = quote_cancelled_message_value; quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 8 -> quote_cancelled_message_record.order_id[quote_cancelled_message_at] = quote_cancelled_message_value; quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 6 -> quote_cancelled_message_record.quote_symbol[quote_cancelled_message_at] = quote_cancelled_message_value; quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
  quote_cancelled_message_record.side = quote_cancelled_message_value;
  quote_cancelled_message_record.cancel_reason = quote_cancelled_message_value;
  skip
}

/* each byte of Quote Cancelled Message set to where it lies, so a field read out of place says so */
inline ramp_quote_cancelled_message(quote_cancelled_message_record, quote_cancelled_message_base) {
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 8 -> quote_cancelled_message_record.transaction_time[quote_cancelled_message_at] = (quote_cancelled_message_base + 0 + quote_cancelled_message_at + 1) % 256; quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 16 -> quote_cancelled_message_record.quote_update_id[quote_cancelled_message_at] = (quote_cancelled_message_base + 8 + quote_cancelled_message_at + 1) % 256; quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 8 -> quote_cancelled_message_record.order_id[quote_cancelled_message_at] = (quote_cancelled_message_base + 24 + quote_cancelled_message_at + 1) % 256; quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 6 -> quote_cancelled_message_record.quote_symbol[quote_cancelled_message_at] = (quote_cancelled_message_base + 32 + quote_cancelled_message_at + 1) % 256; quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
  quote_cancelled_message_record.side = (quote_cancelled_message_base + 38 + 1) % 256;
  quote_cancelled_message_record.cancel_reason = (quote_cancelled_message_base + 39 + 1) % 256;
  skip
}

/* Quote Cancelled Message to the wire, 40 bytes from where the cursor stands */
inline encode_quote_cancelled_message(quote_cancelled_message_record) {
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 8 -> wire[at] = quote_cancelled_message_record.transaction_time[quote_cancelled_message_at]; at = at + 1; quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 16 -> wire[at] = quote_cancelled_message_record.quote_update_id[quote_cancelled_message_at]; at = at + 1; quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 8 -> wire[at] = quote_cancelled_message_record.order_id[quote_cancelled_message_at]; at = at + 1; quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 6 -> wire[at] = quote_cancelled_message_record.quote_symbol[quote_cancelled_message_at]; at = at + 1; quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_cancelled_message_record.side; at = at + 1;
  wire[at] = quote_cancelled_message_record.cancel_reason; at = at + 1;
  skip
}

/* Quote Cancelled Message off the wire, 40 bytes from where the cursor stands */
inline decode_quote_cancelled_message(quote_cancelled_message_record) {
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 8 -> quote_cancelled_message_record.transaction_time[quote_cancelled_message_at] = wire[at]; at = at + 1; quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 16 -> quote_cancelled_message_record.quote_update_id[quote_cancelled_message_at] = wire[at]; at = at + 1; quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 8 -> quote_cancelled_message_record.order_id[quote_cancelled_message_at] = wire[at]; at = at + 1; quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 6 -> quote_cancelled_message_record.quote_symbol[quote_cancelled_message_at] = wire[at]; at = at + 1; quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
  quote_cancelled_message_record.side = wire[at]; at = at + 1;
  quote_cancelled_message_record.cancel_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Quote Cancelled Message is what was written, byte for byte */
inline equal_quote_cancelled_message(quote_cancelled_message_read, quote_cancelled_message_written) {
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 8 -> assert(quote_cancelled_message_read.transaction_time[quote_cancelled_message_at] == quote_cancelled_message_written.transaction_time[quote_cancelled_message_at]); quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 16 -> assert(quote_cancelled_message_read.quote_update_id[quote_cancelled_message_at] == quote_cancelled_message_written.quote_update_id[quote_cancelled_message_at]); quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 8 -> assert(quote_cancelled_message_read.order_id[quote_cancelled_message_at] == quote_cancelled_message_written.order_id[quote_cancelled_message_at]); quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 6 -> assert(quote_cancelled_message_read.quote_symbol[quote_cancelled_message_at] == quote_cancelled_message_written.quote_symbol[quote_cancelled_message_at]); quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
  assert(quote_cancelled_message_read.side == quote_cancelled_message_written.side);
  assert(quote_cancelled_message_read.cancel_reason == quote_cancelled_message_written.cancel_reason);
  skip
}

/* ---- Tas Quote Restatement Message: 54 bytes --------------------------------- */

/* A TAS Quote Restatement is sent post-settlement time for each TAS quote execution during the associated business day to communicate the updated Price and Symbol associated with the cleared execution */
typedef TasQuoteRestatementMessage {
  byte transaction_time[8];
  byte quote_update_id[16];
  byte exec_id[8];
  byte quote_symbol[6];
  byte clearing_symbol[8];
  byte clearing_price[8]
};

int tas_quote_restatement_message_at;

/* every byte of Tas Quote Restatement Message set to one value */
inline fill_tas_quote_restatement_message(tas_quote_restatement_message_record, tas_quote_restatement_message_value) {
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 8 -> tas_quote_restatement_message_record.transaction_time[tas_quote_restatement_message_at] = tas_quote_restatement_message_value; tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 16 -> tas_quote_restatement_message_record.quote_update_id[tas_quote_restatement_message_at] = tas_quote_restatement_message_value; tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 8 -> tas_quote_restatement_message_record.exec_id[tas_quote_restatement_message_at] = tas_quote_restatement_message_value; tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 6 -> tas_quote_restatement_message_record.quote_symbol[tas_quote_restatement_message_at] = tas_quote_restatement_message_value; tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 8 -> tas_quote_restatement_message_record.clearing_symbol[tas_quote_restatement_message_at] = tas_quote_restatement_message_value; tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 8 -> tas_quote_restatement_message_record.clearing_price[tas_quote_restatement_message_at] = tas_quote_restatement_message_value; tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Tas Quote Restatement Message set to where it lies, so a field read out of place says so */
inline ramp_tas_quote_restatement_message(tas_quote_restatement_message_record, tas_quote_restatement_message_base) {
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 8 -> tas_quote_restatement_message_record.transaction_time[tas_quote_restatement_message_at] = (tas_quote_restatement_message_base + 0 + tas_quote_restatement_message_at + 1) % 256; tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 16 -> tas_quote_restatement_message_record.quote_update_id[tas_quote_restatement_message_at] = (tas_quote_restatement_message_base + 8 + tas_quote_restatement_message_at + 1) % 256; tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 8 -> tas_quote_restatement_message_record.exec_id[tas_quote_restatement_message_at] = (tas_quote_restatement_message_base + 24 + tas_quote_restatement_message_at + 1) % 256; tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 6 -> tas_quote_restatement_message_record.quote_symbol[tas_quote_restatement_message_at] = (tas_quote_restatement_message_base + 32 + tas_quote_restatement_message_at + 1) % 256; tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 8 -> tas_quote_restatement_message_record.clearing_symbol[tas_quote_restatement_message_at] = (tas_quote_restatement_message_base + 38 + tas_quote_restatement_message_at + 1) % 256; tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 8 -> tas_quote_restatement_message_record.clearing_price[tas_quote_restatement_message_at] = (tas_quote_restatement_message_base + 46 + tas_quote_restatement_message_at + 1) % 256; tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Tas Quote Restatement Message to the wire, 54 bytes from where the cursor stands */
inline encode_tas_quote_restatement_message(tas_quote_restatement_message_record) {
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 8 -> wire[at] = tas_quote_restatement_message_record.transaction_time[tas_quote_restatement_message_at]; at = at + 1; tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 16 -> wire[at] = tas_quote_restatement_message_record.quote_update_id[tas_quote_restatement_message_at]; at = at + 1; tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 8 -> wire[at] = tas_quote_restatement_message_record.exec_id[tas_quote_restatement_message_at]; at = at + 1; tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 6 -> wire[at] = tas_quote_restatement_message_record.quote_symbol[tas_quote_restatement_message_at]; at = at + 1; tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 8 -> wire[at] = tas_quote_restatement_message_record.clearing_symbol[tas_quote_restatement_message_at]; at = at + 1; tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 8 -> wire[at] = tas_quote_restatement_message_record.clearing_price[tas_quote_restatement_message_at]; at = at + 1; tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Tas Quote Restatement Message off the wire, 54 bytes from where the cursor stands */
inline decode_tas_quote_restatement_message(tas_quote_restatement_message_record) {
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 8 -> tas_quote_restatement_message_record.transaction_time[tas_quote_restatement_message_at] = wire[at]; at = at + 1; tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 16 -> tas_quote_restatement_message_record.quote_update_id[tas_quote_restatement_message_at] = wire[at]; at = at + 1; tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 8 -> tas_quote_restatement_message_record.exec_id[tas_quote_restatement_message_at] = wire[at]; at = at + 1; tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 6 -> tas_quote_restatement_message_record.quote_symbol[tas_quote_restatement_message_at] = wire[at]; at = at + 1; tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 8 -> tas_quote_restatement_message_record.clearing_symbol[tas_quote_restatement_message_at] = wire[at]; at = at + 1; tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 8 -> tas_quote_restatement_message_record.clearing_price[tas_quote_restatement_message_at] = wire[at]; at = at + 1; tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Tas Quote Restatement Message is what was written, byte for byte */
inline equal_tas_quote_restatement_message(tas_quote_restatement_message_read, tas_quote_restatement_message_written) {
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 8 -> assert(tas_quote_restatement_message_read.transaction_time[tas_quote_restatement_message_at] == tas_quote_restatement_message_written.transaction_time[tas_quote_restatement_message_at]); tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 16 -> assert(tas_quote_restatement_message_read.quote_update_id[tas_quote_restatement_message_at] == tas_quote_restatement_message_written.quote_update_id[tas_quote_restatement_message_at]); tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 8 -> assert(tas_quote_restatement_message_read.exec_id[tas_quote_restatement_message_at] == tas_quote_restatement_message_written.exec_id[tas_quote_restatement_message_at]); tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 6 -> assert(tas_quote_restatement_message_read.quote_symbol[tas_quote_restatement_message_at] == tas_quote_restatement_message_written.quote_symbol[tas_quote_restatement_message_at]); tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 8 -> assert(tas_quote_restatement_message_read.clearing_symbol[tas_quote_restatement_message_at] == tas_quote_restatement_message_written.clearing_symbol[tas_quote_restatement_message_at]); tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  tas_quote_restatement_message_at = 0;
  do
  :: tas_quote_restatement_message_at < 8 -> assert(tas_quote_restatement_message_read.clearing_price[tas_quote_restatement_message_at] == tas_quote_restatement_message_written.clearing_price[tas_quote_restatement_message_at]); tas_quote_restatement_message_at = tas_quote_restatement_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Variance Quote Restatement Message: 58 bytes ---------------------------- */

/* A Variance Quote Restatement is sent post-settlement time for each VA and VAO execution during the associated business day to communicate updated Price, Size, and Symbol values associated with the cleared execution */
typedef VarianceQuoteRestatementMessage {
  byte transaction_time[8];
  byte quote_update_id[16];
  byte exec_id[8];
  byte quote_symbol[6];
  byte clearing_symbol[8];
  byte clearing_price[8];
  byte clearing_size[4]
};

int variance_quote_restatement_message_at;

/* every byte of Variance Quote Restatement Message set to one value */
inline fill_variance_quote_restatement_message(variance_quote_restatement_message_record, variance_quote_restatement_message_value) {
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 8 -> variance_quote_restatement_message_record.transaction_time[variance_quote_restatement_message_at] = variance_quote_restatement_message_value; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 16 -> variance_quote_restatement_message_record.quote_update_id[variance_quote_restatement_message_at] = variance_quote_restatement_message_value; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 8 -> variance_quote_restatement_message_record.exec_id[variance_quote_restatement_message_at] = variance_quote_restatement_message_value; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 6 -> variance_quote_restatement_message_record.quote_symbol[variance_quote_restatement_message_at] = variance_quote_restatement_message_value; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 8 -> variance_quote_restatement_message_record.clearing_symbol[variance_quote_restatement_message_at] = variance_quote_restatement_message_value; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 8 -> variance_quote_restatement_message_record.clearing_price[variance_quote_restatement_message_at] = variance_quote_restatement_message_value; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 4 -> variance_quote_restatement_message_record.clearing_size[variance_quote_restatement_message_at] = variance_quote_restatement_message_value; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Variance Quote Restatement Message set to where it lies, so a field read out of place says so */
inline ramp_variance_quote_restatement_message(variance_quote_restatement_message_record, variance_quote_restatement_message_base) {
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 8 -> variance_quote_restatement_message_record.transaction_time[variance_quote_restatement_message_at] = (variance_quote_restatement_message_base + 0 + variance_quote_restatement_message_at + 1) % 256; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 16 -> variance_quote_restatement_message_record.quote_update_id[variance_quote_restatement_message_at] = (variance_quote_restatement_message_base + 8 + variance_quote_restatement_message_at + 1) % 256; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 8 -> variance_quote_restatement_message_record.exec_id[variance_quote_restatement_message_at] = (variance_quote_restatement_message_base + 24 + variance_quote_restatement_message_at + 1) % 256; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 6 -> variance_quote_restatement_message_record.quote_symbol[variance_quote_restatement_message_at] = (variance_quote_restatement_message_base + 32 + variance_quote_restatement_message_at + 1) % 256; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 8 -> variance_quote_restatement_message_record.clearing_symbol[variance_quote_restatement_message_at] = (variance_quote_restatement_message_base + 38 + variance_quote_restatement_message_at + 1) % 256; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 8 -> variance_quote_restatement_message_record.clearing_price[variance_quote_restatement_message_at] = (variance_quote_restatement_message_base + 46 + variance_quote_restatement_message_at + 1) % 256; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 4 -> variance_quote_restatement_message_record.clearing_size[variance_quote_restatement_message_at] = (variance_quote_restatement_message_base + 54 + variance_quote_restatement_message_at + 1) % 256; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Variance Quote Restatement Message to the wire, 58 bytes from where the cursor stands */
inline encode_variance_quote_restatement_message(variance_quote_restatement_message_record) {
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 8 -> wire[at] = variance_quote_restatement_message_record.transaction_time[variance_quote_restatement_message_at]; at = at + 1; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 16 -> wire[at] = variance_quote_restatement_message_record.quote_update_id[variance_quote_restatement_message_at]; at = at + 1; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 8 -> wire[at] = variance_quote_restatement_message_record.exec_id[variance_quote_restatement_message_at]; at = at + 1; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 6 -> wire[at] = variance_quote_restatement_message_record.quote_symbol[variance_quote_restatement_message_at]; at = at + 1; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 8 -> wire[at] = variance_quote_restatement_message_record.clearing_symbol[variance_quote_restatement_message_at]; at = at + 1; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 8 -> wire[at] = variance_quote_restatement_message_record.clearing_price[variance_quote_restatement_message_at]; at = at + 1; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 4 -> wire[at] = variance_quote_restatement_message_record.clearing_size[variance_quote_restatement_message_at]; at = at + 1; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Variance Quote Restatement Message off the wire, 58 bytes from where the cursor stands */
inline decode_variance_quote_restatement_message(variance_quote_restatement_message_record) {
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 8 -> variance_quote_restatement_message_record.transaction_time[variance_quote_restatement_message_at] = wire[at]; at = at + 1; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 16 -> variance_quote_restatement_message_record.quote_update_id[variance_quote_restatement_message_at] = wire[at]; at = at + 1; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 8 -> variance_quote_restatement_message_record.exec_id[variance_quote_restatement_message_at] = wire[at]; at = at + 1; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 6 -> variance_quote_restatement_message_record.quote_symbol[variance_quote_restatement_message_at] = wire[at]; at = at + 1; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 8 -> variance_quote_restatement_message_record.clearing_symbol[variance_quote_restatement_message_at] = wire[at]; at = at + 1; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 8 -> variance_quote_restatement_message_record.clearing_price[variance_quote_restatement_message_at] = wire[at]; at = at + 1; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 4 -> variance_quote_restatement_message_record.clearing_size[variance_quote_restatement_message_at] = wire[at]; at = at + 1; variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Variance Quote Restatement Message is what was written, byte for byte */
inline equal_variance_quote_restatement_message(variance_quote_restatement_message_read, variance_quote_restatement_message_written) {
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 8 -> assert(variance_quote_restatement_message_read.transaction_time[variance_quote_restatement_message_at] == variance_quote_restatement_message_written.transaction_time[variance_quote_restatement_message_at]); variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 16 -> assert(variance_quote_restatement_message_read.quote_update_id[variance_quote_restatement_message_at] == variance_quote_restatement_message_written.quote_update_id[variance_quote_restatement_message_at]); variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 8 -> assert(variance_quote_restatement_message_read.exec_id[variance_quote_restatement_message_at] == variance_quote_restatement_message_written.exec_id[variance_quote_restatement_message_at]); variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 6 -> assert(variance_quote_restatement_message_read.quote_symbol[variance_quote_restatement_message_at] == variance_quote_restatement_message_written.quote_symbol[variance_quote_restatement_message_at]); variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 8 -> assert(variance_quote_restatement_message_read.clearing_symbol[variance_quote_restatement_message_at] == variance_quote_restatement_message_written.clearing_symbol[variance_quote_restatement_message_at]); variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 8 -> assert(variance_quote_restatement_message_read.clearing_price[variance_quote_restatement_message_at] == variance_quote_restatement_message_written.clearing_price[variance_quote_restatement_message_at]); variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  variance_quote_restatement_message_at = 0;
  do
  :: variance_quote_restatement_message_at < 4 -> assert(variance_quote_restatement_message_read.clearing_size[variance_quote_restatement_message_at] == variance_quote_restatement_message_written.clearing_size[variance_quote_restatement_message_at]); variance_quote_restatement_message_at = variance_quote_restatement_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reset Risk Acknowledgement Message: 25 bytes ---------------------------- */

/* Response to a Reset Risk request */
typedef ResetRiskAcknowledgementMessage {
  byte risk_status_id[16];
  byte risk_reset_result;
  byte request_received_time[8]
};

int reset_risk_acknowledgement_message_at;

/* every byte of Reset Risk Acknowledgement Message set to one value */
inline fill_reset_risk_acknowledgement_message(reset_risk_acknowledgement_message_record, reset_risk_acknowledgement_message_value) {
  reset_risk_acknowledgement_message_at = 0;
  do
  :: reset_risk_acknowledgement_message_at < 16 -> reset_risk_acknowledgement_message_record.risk_status_id[reset_risk_acknowledgement_message_at] = reset_risk_acknowledgement_message_value; reset_risk_acknowledgement_message_at = reset_risk_acknowledgement_message_at + 1
  :: else -> break
  od;
  reset_risk_acknowledgement_message_record.risk_reset_result = reset_risk_acknowledgement_message_value;
  reset_risk_acknowledgement_message_at = 0;
  do
  :: reset_risk_acknowledgement_message_at < 8 -> reset_risk_acknowledgement_message_record.request_received_time[reset_risk_acknowledgement_message_at] = reset_risk_acknowledgement_message_value; reset_risk_acknowledgement_message_at = reset_risk_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reset Risk Acknowledgement Message set to where it lies, so a field read out of place says so */
inline ramp_reset_risk_acknowledgement_message(reset_risk_acknowledgement_message_record, reset_risk_acknowledgement_message_base) {
  reset_risk_acknowledgement_message_at = 0;
  do
  :: reset_risk_acknowledgement_message_at < 16 -> reset_risk_acknowledgement_message_record.risk_status_id[reset_risk_acknowledgement_message_at] = (reset_risk_acknowledgement_message_base + 0 + reset_risk_acknowledgement_message_at + 1) % 256; reset_risk_acknowledgement_message_at = reset_risk_acknowledgement_message_at + 1
  :: else -> break
  od;
  reset_risk_acknowledgement_message_record.risk_reset_result = (reset_risk_acknowledgement_message_base + 16 + 1) % 256;
  reset_risk_acknowledgement_message_at = 0;
  do
  :: reset_risk_acknowledgement_message_at < 8 -> reset_risk_acknowledgement_message_record.request_received_time[reset_risk_acknowledgement_message_at] = (reset_risk_acknowledgement_message_base + 17 + reset_risk_acknowledgement_message_at + 1) % 256; reset_risk_acknowledgement_message_at = reset_risk_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reset Risk Acknowledgement Message to the wire, 25 bytes from where the cursor stands */
inline encode_reset_risk_acknowledgement_message(reset_risk_acknowledgement_message_record) {
  reset_risk_acknowledgement_message_at = 0;
  do
  :: reset_risk_acknowledgement_message_at < 16 -> wire[at] = reset_risk_acknowledgement_message_record.risk_status_id[reset_risk_acknowledgement_message_at]; at = at + 1; reset_risk_acknowledgement_message_at = reset_risk_acknowledgement_message_at + 1
  :: else -> break
  od;
  wire[at] = reset_risk_acknowledgement_message_record.risk_reset_result; at = at + 1;
  reset_risk_acknowledgement_message_at = 0;
  do
  :: reset_risk_acknowledgement_message_at < 8 -> wire[at] = reset_risk_acknowledgement_message_record.request_received_time[reset_risk_acknowledgement_message_at]; at = at + 1; reset_risk_acknowledgement_message_at = reset_risk_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reset Risk Acknowledgement Message off the wire, 25 bytes from where the cursor stands */
inline decode_reset_risk_acknowledgement_message(reset_risk_acknowledgement_message_record) {
  reset_risk_acknowledgement_message_at = 0;
  do
  :: reset_risk_acknowledgement_message_at < 16 -> reset_risk_acknowledgement_message_record.risk_status_id[reset_risk_acknowledgement_message_at] = wire[at]; at = at + 1; reset_risk_acknowledgement_message_at = reset_risk_acknowledgement_message_at + 1
  :: else -> break
  od;
  reset_risk_acknowledgement_message_record.risk_reset_result = wire[at]; at = at + 1;
  reset_risk_acknowledgement_message_at = 0;
  do
  :: reset_risk_acknowledgement_message_at < 8 -> reset_risk_acknowledgement_message_record.request_received_time[reset_risk_acknowledgement_message_at] = wire[at]; at = at + 1; reset_risk_acknowledgement_message_at = reset_risk_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reset Risk Acknowledgement Message is what was written, byte for byte */
inline equal_reset_risk_acknowledgement_message(reset_risk_acknowledgement_message_read, reset_risk_acknowledgement_message_written) {
  reset_risk_acknowledgement_message_at = 0;
  do
  :: reset_risk_acknowledgement_message_at < 16 -> assert(reset_risk_acknowledgement_message_read.risk_status_id[reset_risk_acknowledgement_message_at] == reset_risk_acknowledgement_message_written.risk_status_id[reset_risk_acknowledgement_message_at]); reset_risk_acknowledgement_message_at = reset_risk_acknowledgement_message_at + 1
  :: else -> break
  od;
  assert(reset_risk_acknowledgement_message_read.risk_reset_result == reset_risk_acknowledgement_message_written.risk_reset_result);
  reset_risk_acknowledgement_message_at = 0;
  do
  :: reset_risk_acknowledgement_message_at < 8 -> assert(reset_risk_acknowledgement_message_read.request_received_time[reset_risk_acknowledgement_message_at] == reset_risk_acknowledgement_message_written.request_received_time[reset_risk_acknowledgement_message_at]); reset_risk_acknowledgement_message_at = reset_risk_acknowledgement_message_at + 1
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

/* Order Acknowledgement Message: encoded, read back, and compared */
proctype check_order_acknowledgement_message() {
  OrderAcknowledgementMessage order_acknowledgement_message_sent;
  OrderAcknowledgementMessage order_acknowledgement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_acknowledgement_message(order_acknowledgement_message_sent, 0)
  :: pattern == 1 -> fill_order_acknowledgement_message(order_acknowledgement_message_sent, 32)
  :: pattern == 2 -> fill_order_acknowledgement_message(order_acknowledgement_message_sent, 255)
  :: else -> ramp_order_acknowledgement_message(order_acknowledgement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_acknowledgement_message(order_acknowledgement_message_sent);
    assert(at == 161);
    at = 0;
    decode_order_acknowledgement_message(order_acknowledgement_message_got);
    assert(at == 161);
    equal_order_acknowledgement_message(order_acknowledgement_message_got, order_acknowledgement_message_sent)
  }
}

/* Order Rejected Message: encoded, read back, and compared */
proctype check_order_rejected_message() {
  OrderRejectedMessage order_rejected_message_sent;
  OrderRejectedMessage order_rejected_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_rejected_message(order_rejected_message_sent, 0)
  :: pattern == 1 -> fill_order_rejected_message(order_rejected_message_sent, 32)
  :: pattern == 2 -> fill_order_rejected_message(order_rejected_message_sent, 255)
  :: else -> ramp_order_rejected_message(order_rejected_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_rejected_message(order_rejected_message_sent);
    assert(at == 93);
    at = 0;
    decode_order_rejected_message(order_rejected_message_got);
    assert(at == 93);
    equal_order_rejected_message(order_rejected_message_got, order_rejected_message_sent)
  }
}

/* Order Modified Message: encoded, read back, and compared */
proctype check_order_modified_message() {
  OrderModifiedMessage order_modified_message_sent;
  OrderModifiedMessage order_modified_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_modified_message(order_modified_message_sent, 0)
  :: pattern == 1 -> fill_order_modified_message(order_modified_message_sent, 32)
  :: pattern == 2 -> fill_order_modified_message(order_modified_message_sent, 255)
  :: else -> ramp_order_modified_message(order_modified_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_modified_message(order_modified_message_sent);
    assert(at == 101);
    at = 0;
    decode_order_modified_message(order_modified_message_got);
    assert(at == 101);
    equal_order_modified_message(order_modified_message_got, order_modified_message_sent)
  }
}

/* Modify Rejected Message: encoded, read back, and compared */
proctype check_modify_rejected_message() {
  ModifyRejectedMessage modify_rejected_message_sent;
  ModifyRejectedMessage modify_rejected_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_rejected_message(modify_rejected_message_sent, 0)
  :: pattern == 1 -> fill_modify_rejected_message(modify_rejected_message_sent, 32)
  :: pattern == 2 -> fill_modify_rejected_message(modify_rejected_message_sent, 255)
  :: else -> ramp_modify_rejected_message(modify_rejected_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_rejected_message(modify_rejected_message_sent);
    assert(at == 113);
    at = 0;
    decode_modify_rejected_message(modify_rejected_message_got);
    assert(at == 113);
    equal_modify_rejected_message(modify_rejected_message_got, modify_rejected_message_sent)
  }
}

/* Order Execution Message: encoded, read back, and compared */
proctype check_order_execution_message() {
  OrderExecutionMessage order_execution_message_sent;
  OrderExecutionMessage order_execution_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_execution_message(order_execution_message_sent, 0)
  :: pattern == 1 -> fill_order_execution_message(order_execution_message_sent, 32)
  :: pattern == 2 -> fill_order_execution_message(order_execution_message_sent, 255)
  :: else -> ramp_order_execution_message(order_execution_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_execution_message(order_execution_message_sent);
    assert(at == 91);
    at = 0;
    decode_order_execution_message(order_execution_message_got);
    assert(at == 91);
    equal_order_execution_message(order_execution_message_got, order_execution_message_sent)
  }
}

/* Order Cancelled Message: encoded, read back, and compared */
proctype check_order_cancelled_message() {
  OrderCancelledMessage order_cancelled_message_sent;
  OrderCancelledMessage order_cancelled_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancelled_message(order_cancelled_message_sent, 0)
  :: pattern == 1 -> fill_order_cancelled_message(order_cancelled_message_sent, 32)
  :: pattern == 2 -> fill_order_cancelled_message(order_cancelled_message_sent, 255)
  :: else -> ramp_order_cancelled_message(order_cancelled_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancelled_message(order_cancelled_message_sent);
    assert(at == 41);
    at = 0;
    decode_order_cancelled_message(order_cancelled_message_got);
    assert(at == 41);
    equal_order_cancelled_message(order_cancelled_message_got, order_cancelled_message_sent)
  }
}

/* Cancel Rejected Message: encoded, read back, and compared */
proctype check_cancel_rejected_message() {
  CancelRejectedMessage cancel_rejected_message_sent;
  CancelRejectedMessage cancel_rejected_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_rejected_message(cancel_rejected_message_sent, 0)
  :: pattern == 1 -> fill_cancel_rejected_message(cancel_rejected_message_sent, 32)
  :: pattern == 2 -> fill_cancel_rejected_message(cancel_rejected_message_sent, 255)
  :: else -> ramp_cancel_rejected_message(cancel_rejected_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_rejected_message(cancel_rejected_message_sent);
    assert(at == 93);
    at = 0;
    decode_cancel_rejected_message(cancel_rejected_message_got);
    assert(at == 93);
    equal_cancel_rejected_message(cancel_rejected_message_got, cancel_rejected_message_sent)
  }
}

/* Mass Cancel Acknowledgement Message: encoded, read back, and compared */
proctype check_mass_cancel_acknowledgement_message() {
  MassCancelAcknowledgementMessage mass_cancel_acknowledgement_message_sent;
  MassCancelAcknowledgementMessage mass_cancel_acknowledgement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_cancel_acknowledgement_message(mass_cancel_acknowledgement_message_sent, 0)
  :: pattern == 1 -> fill_mass_cancel_acknowledgement_message(mass_cancel_acknowledgement_message_sent, 32)
  :: pattern == 2 -> fill_mass_cancel_acknowledgement_message(mass_cancel_acknowledgement_message_sent, 255)
  :: else -> ramp_mass_cancel_acknowledgement_message(mass_cancel_acknowledgement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_cancel_acknowledgement_message(mass_cancel_acknowledgement_message_sent);
    assert(at == 40);
    at = 0;
    decode_mass_cancel_acknowledgement_message(mass_cancel_acknowledgement_message_got);
    assert(at == 40);
    equal_mass_cancel_acknowledgement_message(mass_cancel_acknowledgement_message_got, mass_cancel_acknowledgement_message_sent)
  }
}

/* Mass Cancel Rejected Message: encoded, read back, and compared */
proctype check_mass_cancel_rejected_message() {
  MassCancelRejectedMessage mass_cancel_rejected_message_sent;
  MassCancelRejectedMessage mass_cancel_rejected_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_cancel_rejected_message(mass_cancel_rejected_message_sent, 0)
  :: pattern == 1 -> fill_mass_cancel_rejected_message(mass_cancel_rejected_message_sent, 32)
  :: pattern == 2 -> fill_mass_cancel_rejected_message(mass_cancel_rejected_message_sent, 255)
  :: else -> ramp_mass_cancel_rejected_message(mass_cancel_rejected_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_cancel_rejected_message(mass_cancel_rejected_message_sent);
    assert(at == 89);
    at = 0;
    decode_mass_cancel_rejected_message(mass_cancel_rejected_message_got);
    assert(at == 89);
    equal_mass_cancel_rejected_message(mass_cancel_rejected_message_got, mass_cancel_rejected_message_sent)
  }
}

/* Purge Acknowledgement Message: encoded, read back, and compared */
proctype check_purge_acknowledgement_message() {
  PurgeAcknowledgementMessage purge_acknowledgement_message_sent;
  PurgeAcknowledgementMessage purge_acknowledgement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_purge_acknowledgement_message(purge_acknowledgement_message_sent, 0)
  :: pattern == 1 -> fill_purge_acknowledgement_message(purge_acknowledgement_message_sent, 32)
  :: pattern == 2 -> fill_purge_acknowledgement_message(purge_acknowledgement_message_sent, 255)
  :: else -> ramp_purge_acknowledgement_message(purge_acknowledgement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_purge_acknowledgement_message(purge_acknowledgement_message_sent);
    assert(at == 40);
    at = 0;
    decode_purge_acknowledgement_message(purge_acknowledgement_message_got);
    assert(at == 40);
    equal_purge_acknowledgement_message(purge_acknowledgement_message_got, purge_acknowledgement_message_sent)
  }
}

/* Purge Rejected Message: encoded, read back, and compared */
proctype check_purge_rejected_message() {
  PurgeRejectedMessage purge_rejected_message_sent;
  PurgeRejectedMessage purge_rejected_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_purge_rejected_message(purge_rejected_message_sent, 0)
  :: pattern == 1 -> fill_purge_rejected_message(purge_rejected_message_sent, 32)
  :: pattern == 2 -> fill_purge_rejected_message(purge_rejected_message_sent, 255)
  :: else -> ramp_purge_rejected_message(purge_rejected_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_purge_rejected_message(purge_rejected_message_sent);
    assert(at == 89);
    at = 0;
    decode_purge_rejected_message(purge_rejected_message_got);
    assert(at == 89);
    equal_purge_rejected_message(purge_rejected_message_got, purge_rejected_message_sent)
  }
}

/* Trade Cancel Or Correct Message: encoded, read back, and compared */
proctype check_trade_cancel_or_correct_message() {
  TradeCancelOrCorrectMessage trade_cancel_or_correct_message_sent;
  TradeCancelOrCorrectMessage trade_cancel_or_correct_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancel_or_correct_message(trade_cancel_or_correct_message_sent, 0)
  :: pattern == 1 -> fill_trade_cancel_or_correct_message(trade_cancel_or_correct_message_sent, 32)
  :: pattern == 2 -> fill_trade_cancel_or_correct_message(trade_cancel_or_correct_message_sent, 255)
  :: else -> ramp_trade_cancel_or_correct_message(trade_cancel_or_correct_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancel_or_correct_message(trade_cancel_or_correct_message_sent);
    assert(at == 92);
    at = 0;
    decode_trade_cancel_or_correct_message(trade_cancel_or_correct_message_got);
    assert(at == 92);
    equal_trade_cancel_or_correct_message(trade_cancel_or_correct_message_got, trade_cancel_or_correct_message_sent)
  }
}

/* Tas Restatement Message: encoded, read back, and compared */
proctype check_tas_restatement_message() {
  TasRestatementMessage tas_restatement_message_sent;
  TasRestatementMessage tas_restatement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_tas_restatement_message(tas_restatement_message_sent, 0)
  :: pattern == 1 -> fill_tas_restatement_message(tas_restatement_message_sent, 32)
  :: pattern == 2 -> fill_tas_restatement_message(tas_restatement_message_sent, 255)
  :: else -> ramp_tas_restatement_message(tas_restatement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_tas_restatement_message(tas_restatement_message_sent);
    assert(at == 104);
    at = 0;
    decode_tas_restatement_message(tas_restatement_message_got);
    assert(at == 104);
    equal_tas_restatement_message(tas_restatement_message_got, tas_restatement_message_sent)
  }
}

/* Variance Restatement Message: encoded, read back, and compared */
proctype check_variance_restatement_message() {
  VarianceRestatementMessage variance_restatement_message_sent;
  VarianceRestatementMessage variance_restatement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_variance_restatement_message(variance_restatement_message_sent, 0)
  :: pattern == 1 -> fill_variance_restatement_message(variance_restatement_message_sent, 32)
  :: pattern == 2 -> fill_variance_restatement_message(variance_restatement_message_sent, 255)
  :: else -> ramp_variance_restatement_message(variance_restatement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_variance_restatement_message(variance_restatement_message_sent);
    assert(at == 108);
    at = 0;
    decode_variance_restatement_message(variance_restatement_message_got);
    assert(at == 108);
    equal_variance_restatement_message(variance_restatement_message_got, variance_restatement_message_sent)
  }
}

/* Quote Update Rejected Message: encoded, read back, and compared */
proctype check_quote_update_rejected_message() {
  QuoteUpdateRejectedMessage quote_update_rejected_message_sent;
  QuoteUpdateRejectedMessage quote_update_rejected_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_update_rejected_message(quote_update_rejected_message_sent, 0)
  :: pattern == 1 -> fill_quote_update_rejected_message(quote_update_rejected_message_sent, 32)
  :: pattern == 2 -> fill_quote_update_rejected_message(quote_update_rejected_message_sent, 255)
  :: else -> ramp_quote_update_rejected_message(quote_update_rejected_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_update_rejected_message(quote_update_rejected_message_sent);
    assert(at == 25);
    at = 0;
    decode_quote_update_rejected_message(quote_update_rejected_message_got);
    assert(at == 25);
    equal_quote_update_rejected_message(quote_update_rejected_message_got, quote_update_rejected_message_sent)
  }
}

/* Quote Restated Message: encoded, read back, and compared */
proctype check_quote_restated_message() {
  QuoteRestatedMessage quote_restated_message_sent;
  QuoteRestatedMessage quote_restated_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_restated_message(quote_restated_message_sent, 0)
  :: pattern == 1 -> fill_quote_restated_message(quote_restated_message_sent, 32)
  :: pattern == 2 -> fill_quote_restated_message(quote_restated_message_sent, 255)
  :: else -> ramp_quote_restated_message(quote_restated_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_restated_message(quote_restated_message_sent);
    assert(at == 52);
    at = 0;
    decode_quote_restated_message(quote_restated_message_got);
    assert(at == 52);
    equal_quote_restated_message(quote_restated_message_got, quote_restated_message_sent)
  }
}

/* Quote Execution Message: encoded, read back, and compared */
proctype check_quote_execution_message() {
  QuoteExecutionMessage quote_execution_message_sent;
  QuoteExecutionMessage quote_execution_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_execution_message(quote_execution_message_sent, 0)
  :: pattern == 1 -> fill_quote_execution_message(quote_execution_message_sent, 32)
  :: pattern == 2 -> fill_quote_execution_message(quote_execution_message_sent, 255)
  :: else -> ramp_quote_execution_message(quote_execution_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_execution_message(quote_execution_message_sent);
    assert(at == 71);
    at = 0;
    decode_quote_execution_message(quote_execution_message_got);
    assert(at == 71);
    equal_quote_execution_message(quote_execution_message_got, quote_execution_message_sent)
  }
}

/* Quote Cancelled Message: encoded, read back, and compared */
proctype check_quote_cancelled_message() {
  QuoteCancelledMessage quote_cancelled_message_sent;
  QuoteCancelledMessage quote_cancelled_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_cancelled_message(quote_cancelled_message_sent, 0)
  :: pattern == 1 -> fill_quote_cancelled_message(quote_cancelled_message_sent, 32)
  :: pattern == 2 -> fill_quote_cancelled_message(quote_cancelled_message_sent, 255)
  :: else -> ramp_quote_cancelled_message(quote_cancelled_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_cancelled_message(quote_cancelled_message_sent);
    assert(at == 40);
    at = 0;
    decode_quote_cancelled_message(quote_cancelled_message_got);
    assert(at == 40);
    equal_quote_cancelled_message(quote_cancelled_message_got, quote_cancelled_message_sent)
  }
}

/* Tas Quote Restatement Message: encoded, read back, and compared */
proctype check_tas_quote_restatement_message() {
  TasQuoteRestatementMessage tas_quote_restatement_message_sent;
  TasQuoteRestatementMessage tas_quote_restatement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_tas_quote_restatement_message(tas_quote_restatement_message_sent, 0)
  :: pattern == 1 -> fill_tas_quote_restatement_message(tas_quote_restatement_message_sent, 32)
  :: pattern == 2 -> fill_tas_quote_restatement_message(tas_quote_restatement_message_sent, 255)
  :: else -> ramp_tas_quote_restatement_message(tas_quote_restatement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_tas_quote_restatement_message(tas_quote_restatement_message_sent);
    assert(at == 54);
    at = 0;
    decode_tas_quote_restatement_message(tas_quote_restatement_message_got);
    assert(at == 54);
    equal_tas_quote_restatement_message(tas_quote_restatement_message_got, tas_quote_restatement_message_sent)
  }
}

/* Variance Quote Restatement Message: encoded, read back, and compared */
proctype check_variance_quote_restatement_message() {
  VarianceQuoteRestatementMessage variance_quote_restatement_message_sent;
  VarianceQuoteRestatementMessage variance_quote_restatement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_variance_quote_restatement_message(variance_quote_restatement_message_sent, 0)
  :: pattern == 1 -> fill_variance_quote_restatement_message(variance_quote_restatement_message_sent, 32)
  :: pattern == 2 -> fill_variance_quote_restatement_message(variance_quote_restatement_message_sent, 255)
  :: else -> ramp_variance_quote_restatement_message(variance_quote_restatement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_variance_quote_restatement_message(variance_quote_restatement_message_sent);
    assert(at == 58);
    at = 0;
    decode_variance_quote_restatement_message(variance_quote_restatement_message_got);
    assert(at == 58);
    equal_variance_quote_restatement_message(variance_quote_restatement_message_got, variance_quote_restatement_message_sent)
  }
}

/* Reset Risk Acknowledgement Message: encoded, read back, and compared */
proctype check_reset_risk_acknowledgement_message() {
  ResetRiskAcknowledgementMessage reset_risk_acknowledgement_message_sent;
  ResetRiskAcknowledgementMessage reset_risk_acknowledgement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reset_risk_acknowledgement_message(reset_risk_acknowledgement_message_sent, 0)
  :: pattern == 1 -> fill_reset_risk_acknowledgement_message(reset_risk_acknowledgement_message_sent, 32)
  :: pattern == 2 -> fill_reset_risk_acknowledgement_message(reset_risk_acknowledgement_message_sent, 255)
  :: else -> ramp_reset_risk_acknowledgement_message(reset_risk_acknowledgement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reset_risk_acknowledgement_message(reset_risk_acknowledgement_message_sent);
    assert(at == 25);
    at = 0;
    decode_reset_risk_acknowledgement_message(reset_risk_acknowledgement_message_got);
    assert(at == 25);
    equal_reset_risk_acknowledgement_message(reset_risk_acknowledgement_message_got, reset_risk_acknowledgement_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_exchange_message_header()
  :: run check_logout_response_message()
  :: run check_prevent_match()
  :: run check_order_acknowledgement_message()
  :: run check_order_rejected_message()
  :: run check_order_modified_message()
  :: run check_modify_rejected_message()
  :: run check_order_execution_message()
  :: run check_order_cancelled_message()
  :: run check_cancel_rejected_message()
  :: run check_mass_cancel_acknowledgement_message()
  :: run check_mass_cancel_rejected_message()
  :: run check_purge_acknowledgement_message()
  :: run check_purge_rejected_message()
  :: run check_trade_cancel_or_correct_message()
  :: run check_tas_restatement_message()
  :: run check_variance_restatement_message()
  :: run check_quote_update_rejected_message()
  :: run check_quote_restated_message()
  :: run check_quote_execution_message()
  :: run check_quote_cancelled_message()
  :: run check_tas_quote_restatement_message()
  :: run check_variance_quote_restatement_message()
  :: run check_reset_risk_acknowledgement_message()
  fi
}
