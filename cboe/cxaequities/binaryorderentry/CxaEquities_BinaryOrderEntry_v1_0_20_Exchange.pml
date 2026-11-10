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
#define WIRE 192

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

/* ---- Order Acknowledgement Au Equities V 1: 192 bytes ------------------------ */

/* Order Acknowledgement messages are sent in response to a New Order message */
typedef OrderAcknowledgementAuEquitiesV1 {
  byte transaction_time[8];
  byte account[10];
  byte trading_participant_id[2];
  byte cl_ord_id[20];
  byte exec_inst;
  byte order_id[8];
  byte order_qty[4];
  byte ord_type;
  byte price[8];
  byte capacity;
  byte side;
  byte symbol[6];
  byte time_in_force;
  byte min_qty[4];
  byte max_floor[4];
  byte expire_time[8];
  byte clearing_participant_id[4];
  byte clearing_account[10];
  byte undisclosed;
  byte client_cross_ref[15];
  byte short_sell_naked_qty[4];
  byte short_sell_covered_qty[4];
  byte short_sell_long_qty[4];
  byte risk_group_id[2];
  byte no_trade_feat;
  byte no_trade_key[10];
  byte meqse;
  byte origin_of_trans[20];
  byte intermediary_id[10];
  byte directed_wholesale_indicator;
  byte remove_crossing_from_clearing;
  byte broker_preferencing;
  byte working_price[8];
  byte base_liquidity_indicator;
  byte sub_liquidity_indicator;
  byte routing_inst;
  byte display_indicator;
  byte expire_date[4]
};

int order_acknowledgement_au_equities_v1_at;

/* every byte of Order Acknowledgement Au Equities V 1 set to one value */
inline fill_order_acknowledgement_au_equities_v1(order_acknowledgement_au_equities_v1_record, order_acknowledgement_au_equities_v1_value) {
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 8 -> order_acknowledgement_au_equities_v1_record.transaction_time[order_acknowledgement_au_equities_v1_at] = order_acknowledgement_au_equities_v1_value; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 10 -> order_acknowledgement_au_equities_v1_record.account[order_acknowledgement_au_equities_v1_at] = order_acknowledgement_au_equities_v1_value; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 2 -> order_acknowledgement_au_equities_v1_record.trading_participant_id[order_acknowledgement_au_equities_v1_at] = order_acknowledgement_au_equities_v1_value; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 20 -> order_acknowledgement_au_equities_v1_record.cl_ord_id[order_acknowledgement_au_equities_v1_at] = order_acknowledgement_au_equities_v1_value; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.exec_inst = order_acknowledgement_au_equities_v1_value;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 8 -> order_acknowledgement_au_equities_v1_record.order_id[order_acknowledgement_au_equities_v1_at] = order_acknowledgement_au_equities_v1_value; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> order_acknowledgement_au_equities_v1_record.order_qty[order_acknowledgement_au_equities_v1_at] = order_acknowledgement_au_equities_v1_value; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.ord_type = order_acknowledgement_au_equities_v1_value;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 8 -> order_acknowledgement_au_equities_v1_record.price[order_acknowledgement_au_equities_v1_at] = order_acknowledgement_au_equities_v1_value; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.capacity = order_acknowledgement_au_equities_v1_value;
  order_acknowledgement_au_equities_v1_record.side = order_acknowledgement_au_equities_v1_value;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 6 -> order_acknowledgement_au_equities_v1_record.symbol[order_acknowledgement_au_equities_v1_at] = order_acknowledgement_au_equities_v1_value; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.time_in_force = order_acknowledgement_au_equities_v1_value;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> order_acknowledgement_au_equities_v1_record.min_qty[order_acknowledgement_au_equities_v1_at] = order_acknowledgement_au_equities_v1_value; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> order_acknowledgement_au_equities_v1_record.max_floor[order_acknowledgement_au_equities_v1_at] = order_acknowledgement_au_equities_v1_value; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 8 -> order_acknowledgement_au_equities_v1_record.expire_time[order_acknowledgement_au_equities_v1_at] = order_acknowledgement_au_equities_v1_value; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> order_acknowledgement_au_equities_v1_record.clearing_participant_id[order_acknowledgement_au_equities_v1_at] = order_acknowledgement_au_equities_v1_value; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 10 -> order_acknowledgement_au_equities_v1_record.clearing_account[order_acknowledgement_au_equities_v1_at] = order_acknowledgement_au_equities_v1_value; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.undisclosed = order_acknowledgement_au_equities_v1_value;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 15 -> order_acknowledgement_au_equities_v1_record.client_cross_ref[order_acknowledgement_au_equities_v1_at] = order_acknowledgement_au_equities_v1_value; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> order_acknowledgement_au_equities_v1_record.short_sell_naked_qty[order_acknowledgement_au_equities_v1_at] = order_acknowledgement_au_equities_v1_value; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> order_acknowledgement_au_equities_v1_record.short_sell_covered_qty[order_acknowledgement_au_equities_v1_at] = order_acknowledgement_au_equities_v1_value; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> order_acknowledgement_au_equities_v1_record.short_sell_long_qty[order_acknowledgement_au_equities_v1_at] = order_acknowledgement_au_equities_v1_value; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 2 -> order_acknowledgement_au_equities_v1_record.risk_group_id[order_acknowledgement_au_equities_v1_at] = order_acknowledgement_au_equities_v1_value; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.no_trade_feat = order_acknowledgement_au_equities_v1_value;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 10 -> order_acknowledgement_au_equities_v1_record.no_trade_key[order_acknowledgement_au_equities_v1_at] = order_acknowledgement_au_equities_v1_value; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.meqse = order_acknowledgement_au_equities_v1_value;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 20 -> order_acknowledgement_au_equities_v1_record.origin_of_trans[order_acknowledgement_au_equities_v1_at] = order_acknowledgement_au_equities_v1_value; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 10 -> order_acknowledgement_au_equities_v1_record.intermediary_id[order_acknowledgement_au_equities_v1_at] = order_acknowledgement_au_equities_v1_value; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.directed_wholesale_indicator = order_acknowledgement_au_equities_v1_value;
  order_acknowledgement_au_equities_v1_record.remove_crossing_from_clearing = order_acknowledgement_au_equities_v1_value;
  order_acknowledgement_au_equities_v1_record.broker_preferencing = order_acknowledgement_au_equities_v1_value;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 8 -> order_acknowledgement_au_equities_v1_record.working_price[order_acknowledgement_au_equities_v1_at] = order_acknowledgement_au_equities_v1_value; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.base_liquidity_indicator = order_acknowledgement_au_equities_v1_value;
  order_acknowledgement_au_equities_v1_record.sub_liquidity_indicator = order_acknowledgement_au_equities_v1_value;
  order_acknowledgement_au_equities_v1_record.routing_inst = order_acknowledgement_au_equities_v1_value;
  order_acknowledgement_au_equities_v1_record.display_indicator = order_acknowledgement_au_equities_v1_value;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> order_acknowledgement_au_equities_v1_record.expire_date[order_acknowledgement_au_equities_v1_at] = order_acknowledgement_au_equities_v1_value; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Acknowledgement Au Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_order_acknowledgement_au_equities_v1(order_acknowledgement_au_equities_v1_record, order_acknowledgement_au_equities_v1_base) {
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 8 -> order_acknowledgement_au_equities_v1_record.transaction_time[order_acknowledgement_au_equities_v1_at] = (order_acknowledgement_au_equities_v1_base + 0 + order_acknowledgement_au_equities_v1_at + 1) % 256; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 10 -> order_acknowledgement_au_equities_v1_record.account[order_acknowledgement_au_equities_v1_at] = (order_acknowledgement_au_equities_v1_base + 8 + order_acknowledgement_au_equities_v1_at + 1) % 256; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 2 -> order_acknowledgement_au_equities_v1_record.trading_participant_id[order_acknowledgement_au_equities_v1_at] = (order_acknowledgement_au_equities_v1_base + 18 + order_acknowledgement_au_equities_v1_at + 1) % 256; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 20 -> order_acknowledgement_au_equities_v1_record.cl_ord_id[order_acknowledgement_au_equities_v1_at] = (order_acknowledgement_au_equities_v1_base + 20 + order_acknowledgement_au_equities_v1_at + 1) % 256; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.exec_inst = (order_acknowledgement_au_equities_v1_base + 40 + 1) % 256;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 8 -> order_acknowledgement_au_equities_v1_record.order_id[order_acknowledgement_au_equities_v1_at] = (order_acknowledgement_au_equities_v1_base + 41 + order_acknowledgement_au_equities_v1_at + 1) % 256; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> order_acknowledgement_au_equities_v1_record.order_qty[order_acknowledgement_au_equities_v1_at] = (order_acknowledgement_au_equities_v1_base + 49 + order_acknowledgement_au_equities_v1_at + 1) % 256; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.ord_type = (order_acknowledgement_au_equities_v1_base + 53 + 1) % 256;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 8 -> order_acknowledgement_au_equities_v1_record.price[order_acknowledgement_au_equities_v1_at] = (order_acknowledgement_au_equities_v1_base + 54 + order_acknowledgement_au_equities_v1_at + 1) % 256; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.capacity = (order_acknowledgement_au_equities_v1_base + 62 + 1) % 256;
  order_acknowledgement_au_equities_v1_record.side = (order_acknowledgement_au_equities_v1_base + 63 + 1) % 256;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 6 -> order_acknowledgement_au_equities_v1_record.symbol[order_acknowledgement_au_equities_v1_at] = (order_acknowledgement_au_equities_v1_base + 64 + order_acknowledgement_au_equities_v1_at + 1) % 256; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.time_in_force = (order_acknowledgement_au_equities_v1_base + 70 + 1) % 256;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> order_acknowledgement_au_equities_v1_record.min_qty[order_acknowledgement_au_equities_v1_at] = (order_acknowledgement_au_equities_v1_base + 71 + order_acknowledgement_au_equities_v1_at + 1) % 256; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> order_acknowledgement_au_equities_v1_record.max_floor[order_acknowledgement_au_equities_v1_at] = (order_acknowledgement_au_equities_v1_base + 75 + order_acknowledgement_au_equities_v1_at + 1) % 256; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 8 -> order_acknowledgement_au_equities_v1_record.expire_time[order_acknowledgement_au_equities_v1_at] = (order_acknowledgement_au_equities_v1_base + 79 + order_acknowledgement_au_equities_v1_at + 1) % 256; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> order_acknowledgement_au_equities_v1_record.clearing_participant_id[order_acknowledgement_au_equities_v1_at] = (order_acknowledgement_au_equities_v1_base + 87 + order_acknowledgement_au_equities_v1_at + 1) % 256; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 10 -> order_acknowledgement_au_equities_v1_record.clearing_account[order_acknowledgement_au_equities_v1_at] = (order_acknowledgement_au_equities_v1_base + 91 + order_acknowledgement_au_equities_v1_at + 1) % 256; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.undisclosed = (order_acknowledgement_au_equities_v1_base + 101 + 1) % 256;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 15 -> order_acknowledgement_au_equities_v1_record.client_cross_ref[order_acknowledgement_au_equities_v1_at] = (order_acknowledgement_au_equities_v1_base + 102 + order_acknowledgement_au_equities_v1_at + 1) % 256; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> order_acknowledgement_au_equities_v1_record.short_sell_naked_qty[order_acknowledgement_au_equities_v1_at] = (order_acknowledgement_au_equities_v1_base + 117 + order_acknowledgement_au_equities_v1_at + 1) % 256; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> order_acknowledgement_au_equities_v1_record.short_sell_covered_qty[order_acknowledgement_au_equities_v1_at] = (order_acknowledgement_au_equities_v1_base + 121 + order_acknowledgement_au_equities_v1_at + 1) % 256; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> order_acknowledgement_au_equities_v1_record.short_sell_long_qty[order_acknowledgement_au_equities_v1_at] = (order_acknowledgement_au_equities_v1_base + 125 + order_acknowledgement_au_equities_v1_at + 1) % 256; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 2 -> order_acknowledgement_au_equities_v1_record.risk_group_id[order_acknowledgement_au_equities_v1_at] = (order_acknowledgement_au_equities_v1_base + 129 + order_acknowledgement_au_equities_v1_at + 1) % 256; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.no_trade_feat = (order_acknowledgement_au_equities_v1_base + 131 + 1) % 256;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 10 -> order_acknowledgement_au_equities_v1_record.no_trade_key[order_acknowledgement_au_equities_v1_at] = (order_acknowledgement_au_equities_v1_base + 132 + order_acknowledgement_au_equities_v1_at + 1) % 256; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.meqse = (order_acknowledgement_au_equities_v1_base + 142 + 1) % 256;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 20 -> order_acknowledgement_au_equities_v1_record.origin_of_trans[order_acknowledgement_au_equities_v1_at] = (order_acknowledgement_au_equities_v1_base + 143 + order_acknowledgement_au_equities_v1_at + 1) % 256; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 10 -> order_acknowledgement_au_equities_v1_record.intermediary_id[order_acknowledgement_au_equities_v1_at] = (order_acknowledgement_au_equities_v1_base + 163 + order_acknowledgement_au_equities_v1_at + 1) % 256; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.directed_wholesale_indicator = (order_acknowledgement_au_equities_v1_base + 173 + 1) % 256;
  order_acknowledgement_au_equities_v1_record.remove_crossing_from_clearing = (order_acknowledgement_au_equities_v1_base + 174 + 1) % 256;
  order_acknowledgement_au_equities_v1_record.broker_preferencing = (order_acknowledgement_au_equities_v1_base + 175 + 1) % 256;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 8 -> order_acknowledgement_au_equities_v1_record.working_price[order_acknowledgement_au_equities_v1_at] = (order_acknowledgement_au_equities_v1_base + 176 + order_acknowledgement_au_equities_v1_at + 1) % 256; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.base_liquidity_indicator = (order_acknowledgement_au_equities_v1_base + 184 + 1) % 256;
  order_acknowledgement_au_equities_v1_record.sub_liquidity_indicator = (order_acknowledgement_au_equities_v1_base + 185 + 1) % 256;
  order_acknowledgement_au_equities_v1_record.routing_inst = (order_acknowledgement_au_equities_v1_base + 186 + 1) % 256;
  order_acknowledgement_au_equities_v1_record.display_indicator = (order_acknowledgement_au_equities_v1_base + 187 + 1) % 256;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> order_acknowledgement_au_equities_v1_record.expire_date[order_acknowledgement_au_equities_v1_at] = (order_acknowledgement_au_equities_v1_base + 188 + order_acknowledgement_au_equities_v1_at + 1) % 256; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Order Acknowledgement Au Equities V 1 to the wire, 192 bytes from where the cursor stands */
inline encode_order_acknowledgement_au_equities_v1(order_acknowledgement_au_equities_v1_record) {
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 8 -> wire[at] = order_acknowledgement_au_equities_v1_record.transaction_time[order_acknowledgement_au_equities_v1_at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 10 -> wire[at] = order_acknowledgement_au_equities_v1_record.account[order_acknowledgement_au_equities_v1_at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 2 -> wire[at] = order_acknowledgement_au_equities_v1_record.trading_participant_id[order_acknowledgement_au_equities_v1_at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 20 -> wire[at] = order_acknowledgement_au_equities_v1_record.cl_ord_id[order_acknowledgement_au_equities_v1_at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_au_equities_v1_record.exec_inst; at = at + 1;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 8 -> wire[at] = order_acknowledgement_au_equities_v1_record.order_id[order_acknowledgement_au_equities_v1_at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> wire[at] = order_acknowledgement_au_equities_v1_record.order_qty[order_acknowledgement_au_equities_v1_at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_au_equities_v1_record.ord_type; at = at + 1;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 8 -> wire[at] = order_acknowledgement_au_equities_v1_record.price[order_acknowledgement_au_equities_v1_at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_au_equities_v1_record.capacity; at = at + 1;
  wire[at] = order_acknowledgement_au_equities_v1_record.side; at = at + 1;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 6 -> wire[at] = order_acknowledgement_au_equities_v1_record.symbol[order_acknowledgement_au_equities_v1_at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_au_equities_v1_record.time_in_force; at = at + 1;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> wire[at] = order_acknowledgement_au_equities_v1_record.min_qty[order_acknowledgement_au_equities_v1_at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> wire[at] = order_acknowledgement_au_equities_v1_record.max_floor[order_acknowledgement_au_equities_v1_at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 8 -> wire[at] = order_acknowledgement_au_equities_v1_record.expire_time[order_acknowledgement_au_equities_v1_at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> wire[at] = order_acknowledgement_au_equities_v1_record.clearing_participant_id[order_acknowledgement_au_equities_v1_at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 10 -> wire[at] = order_acknowledgement_au_equities_v1_record.clearing_account[order_acknowledgement_au_equities_v1_at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_au_equities_v1_record.undisclosed; at = at + 1;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 15 -> wire[at] = order_acknowledgement_au_equities_v1_record.client_cross_ref[order_acknowledgement_au_equities_v1_at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> wire[at] = order_acknowledgement_au_equities_v1_record.short_sell_naked_qty[order_acknowledgement_au_equities_v1_at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> wire[at] = order_acknowledgement_au_equities_v1_record.short_sell_covered_qty[order_acknowledgement_au_equities_v1_at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> wire[at] = order_acknowledgement_au_equities_v1_record.short_sell_long_qty[order_acknowledgement_au_equities_v1_at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 2 -> wire[at] = order_acknowledgement_au_equities_v1_record.risk_group_id[order_acknowledgement_au_equities_v1_at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_au_equities_v1_record.no_trade_feat; at = at + 1;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 10 -> wire[at] = order_acknowledgement_au_equities_v1_record.no_trade_key[order_acknowledgement_au_equities_v1_at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_au_equities_v1_record.meqse; at = at + 1;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 20 -> wire[at] = order_acknowledgement_au_equities_v1_record.origin_of_trans[order_acknowledgement_au_equities_v1_at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 10 -> wire[at] = order_acknowledgement_au_equities_v1_record.intermediary_id[order_acknowledgement_au_equities_v1_at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_au_equities_v1_record.directed_wholesale_indicator; at = at + 1;
  wire[at] = order_acknowledgement_au_equities_v1_record.remove_crossing_from_clearing; at = at + 1;
  wire[at] = order_acknowledgement_au_equities_v1_record.broker_preferencing; at = at + 1;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 8 -> wire[at] = order_acknowledgement_au_equities_v1_record.working_price[order_acknowledgement_au_equities_v1_at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_au_equities_v1_record.base_liquidity_indicator; at = at + 1;
  wire[at] = order_acknowledgement_au_equities_v1_record.sub_liquidity_indicator; at = at + 1;
  wire[at] = order_acknowledgement_au_equities_v1_record.routing_inst; at = at + 1;
  wire[at] = order_acknowledgement_au_equities_v1_record.display_indicator; at = at + 1;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> wire[at] = order_acknowledgement_au_equities_v1_record.expire_date[order_acknowledgement_au_equities_v1_at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Order Acknowledgement Au Equities V 1 off the wire, 192 bytes from where the cursor stands */
inline decode_order_acknowledgement_au_equities_v1(order_acknowledgement_au_equities_v1_record) {
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 8 -> order_acknowledgement_au_equities_v1_record.transaction_time[order_acknowledgement_au_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 10 -> order_acknowledgement_au_equities_v1_record.account[order_acknowledgement_au_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 2 -> order_acknowledgement_au_equities_v1_record.trading_participant_id[order_acknowledgement_au_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 20 -> order_acknowledgement_au_equities_v1_record.cl_ord_id[order_acknowledgement_au_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.exec_inst = wire[at]; at = at + 1;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 8 -> order_acknowledgement_au_equities_v1_record.order_id[order_acknowledgement_au_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> order_acknowledgement_au_equities_v1_record.order_qty[order_acknowledgement_au_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.ord_type = wire[at]; at = at + 1;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 8 -> order_acknowledgement_au_equities_v1_record.price[order_acknowledgement_au_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.capacity = wire[at]; at = at + 1;
  order_acknowledgement_au_equities_v1_record.side = wire[at]; at = at + 1;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 6 -> order_acknowledgement_au_equities_v1_record.symbol[order_acknowledgement_au_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.time_in_force = wire[at]; at = at + 1;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> order_acknowledgement_au_equities_v1_record.min_qty[order_acknowledgement_au_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> order_acknowledgement_au_equities_v1_record.max_floor[order_acknowledgement_au_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 8 -> order_acknowledgement_au_equities_v1_record.expire_time[order_acknowledgement_au_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> order_acknowledgement_au_equities_v1_record.clearing_participant_id[order_acknowledgement_au_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 10 -> order_acknowledgement_au_equities_v1_record.clearing_account[order_acknowledgement_au_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.undisclosed = wire[at]; at = at + 1;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 15 -> order_acknowledgement_au_equities_v1_record.client_cross_ref[order_acknowledgement_au_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> order_acknowledgement_au_equities_v1_record.short_sell_naked_qty[order_acknowledgement_au_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> order_acknowledgement_au_equities_v1_record.short_sell_covered_qty[order_acknowledgement_au_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> order_acknowledgement_au_equities_v1_record.short_sell_long_qty[order_acknowledgement_au_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 2 -> order_acknowledgement_au_equities_v1_record.risk_group_id[order_acknowledgement_au_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.no_trade_feat = wire[at]; at = at + 1;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 10 -> order_acknowledgement_au_equities_v1_record.no_trade_key[order_acknowledgement_au_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.meqse = wire[at]; at = at + 1;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 20 -> order_acknowledgement_au_equities_v1_record.origin_of_trans[order_acknowledgement_au_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 10 -> order_acknowledgement_au_equities_v1_record.intermediary_id[order_acknowledgement_au_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.directed_wholesale_indicator = wire[at]; at = at + 1;
  order_acknowledgement_au_equities_v1_record.remove_crossing_from_clearing = wire[at]; at = at + 1;
  order_acknowledgement_au_equities_v1_record.broker_preferencing = wire[at]; at = at + 1;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 8 -> order_acknowledgement_au_equities_v1_record.working_price[order_acknowledgement_au_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_record.base_liquidity_indicator = wire[at]; at = at + 1;
  order_acknowledgement_au_equities_v1_record.sub_liquidity_indicator = wire[at]; at = at + 1;
  order_acknowledgement_au_equities_v1_record.routing_inst = wire[at]; at = at + 1;
  order_acknowledgement_au_equities_v1_record.display_indicator = wire[at]; at = at + 1;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> order_acknowledgement_au_equities_v1_record.expire_date[order_acknowledgement_au_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Acknowledgement Au Equities V 1 is what was written, byte for byte */
inline equal_order_acknowledgement_au_equities_v1(order_acknowledgement_au_equities_v1_read, order_acknowledgement_au_equities_v1_written) {
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 8 -> assert(order_acknowledgement_au_equities_v1_read.transaction_time[order_acknowledgement_au_equities_v1_at] == order_acknowledgement_au_equities_v1_written.transaction_time[order_acknowledgement_au_equities_v1_at]); order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 10 -> assert(order_acknowledgement_au_equities_v1_read.account[order_acknowledgement_au_equities_v1_at] == order_acknowledgement_au_equities_v1_written.account[order_acknowledgement_au_equities_v1_at]); order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 2 -> assert(order_acknowledgement_au_equities_v1_read.trading_participant_id[order_acknowledgement_au_equities_v1_at] == order_acknowledgement_au_equities_v1_written.trading_participant_id[order_acknowledgement_au_equities_v1_at]); order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 20 -> assert(order_acknowledgement_au_equities_v1_read.cl_ord_id[order_acknowledgement_au_equities_v1_at] == order_acknowledgement_au_equities_v1_written.cl_ord_id[order_acknowledgement_au_equities_v1_at]); order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_au_equities_v1_read.exec_inst == order_acknowledgement_au_equities_v1_written.exec_inst);
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 8 -> assert(order_acknowledgement_au_equities_v1_read.order_id[order_acknowledgement_au_equities_v1_at] == order_acknowledgement_au_equities_v1_written.order_id[order_acknowledgement_au_equities_v1_at]); order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> assert(order_acknowledgement_au_equities_v1_read.order_qty[order_acknowledgement_au_equities_v1_at] == order_acknowledgement_au_equities_v1_written.order_qty[order_acknowledgement_au_equities_v1_at]); order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_au_equities_v1_read.ord_type == order_acknowledgement_au_equities_v1_written.ord_type);
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 8 -> assert(order_acknowledgement_au_equities_v1_read.price[order_acknowledgement_au_equities_v1_at] == order_acknowledgement_au_equities_v1_written.price[order_acknowledgement_au_equities_v1_at]); order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_au_equities_v1_read.capacity == order_acknowledgement_au_equities_v1_written.capacity);
  assert(order_acknowledgement_au_equities_v1_read.side == order_acknowledgement_au_equities_v1_written.side);
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 6 -> assert(order_acknowledgement_au_equities_v1_read.symbol[order_acknowledgement_au_equities_v1_at] == order_acknowledgement_au_equities_v1_written.symbol[order_acknowledgement_au_equities_v1_at]); order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_au_equities_v1_read.time_in_force == order_acknowledgement_au_equities_v1_written.time_in_force);
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> assert(order_acknowledgement_au_equities_v1_read.min_qty[order_acknowledgement_au_equities_v1_at] == order_acknowledgement_au_equities_v1_written.min_qty[order_acknowledgement_au_equities_v1_at]); order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> assert(order_acknowledgement_au_equities_v1_read.max_floor[order_acknowledgement_au_equities_v1_at] == order_acknowledgement_au_equities_v1_written.max_floor[order_acknowledgement_au_equities_v1_at]); order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 8 -> assert(order_acknowledgement_au_equities_v1_read.expire_time[order_acknowledgement_au_equities_v1_at] == order_acknowledgement_au_equities_v1_written.expire_time[order_acknowledgement_au_equities_v1_at]); order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> assert(order_acknowledgement_au_equities_v1_read.clearing_participant_id[order_acknowledgement_au_equities_v1_at] == order_acknowledgement_au_equities_v1_written.clearing_participant_id[order_acknowledgement_au_equities_v1_at]); order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 10 -> assert(order_acknowledgement_au_equities_v1_read.clearing_account[order_acknowledgement_au_equities_v1_at] == order_acknowledgement_au_equities_v1_written.clearing_account[order_acknowledgement_au_equities_v1_at]); order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_au_equities_v1_read.undisclosed == order_acknowledgement_au_equities_v1_written.undisclosed);
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 15 -> assert(order_acknowledgement_au_equities_v1_read.client_cross_ref[order_acknowledgement_au_equities_v1_at] == order_acknowledgement_au_equities_v1_written.client_cross_ref[order_acknowledgement_au_equities_v1_at]); order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> assert(order_acknowledgement_au_equities_v1_read.short_sell_naked_qty[order_acknowledgement_au_equities_v1_at] == order_acknowledgement_au_equities_v1_written.short_sell_naked_qty[order_acknowledgement_au_equities_v1_at]); order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> assert(order_acknowledgement_au_equities_v1_read.short_sell_covered_qty[order_acknowledgement_au_equities_v1_at] == order_acknowledgement_au_equities_v1_written.short_sell_covered_qty[order_acknowledgement_au_equities_v1_at]); order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> assert(order_acknowledgement_au_equities_v1_read.short_sell_long_qty[order_acknowledgement_au_equities_v1_at] == order_acknowledgement_au_equities_v1_written.short_sell_long_qty[order_acknowledgement_au_equities_v1_at]); order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 2 -> assert(order_acknowledgement_au_equities_v1_read.risk_group_id[order_acknowledgement_au_equities_v1_at] == order_acknowledgement_au_equities_v1_written.risk_group_id[order_acknowledgement_au_equities_v1_at]); order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_au_equities_v1_read.no_trade_feat == order_acknowledgement_au_equities_v1_written.no_trade_feat);
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 10 -> assert(order_acknowledgement_au_equities_v1_read.no_trade_key[order_acknowledgement_au_equities_v1_at] == order_acknowledgement_au_equities_v1_written.no_trade_key[order_acknowledgement_au_equities_v1_at]); order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_au_equities_v1_read.meqse == order_acknowledgement_au_equities_v1_written.meqse);
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 20 -> assert(order_acknowledgement_au_equities_v1_read.origin_of_trans[order_acknowledgement_au_equities_v1_at] == order_acknowledgement_au_equities_v1_written.origin_of_trans[order_acknowledgement_au_equities_v1_at]); order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 10 -> assert(order_acknowledgement_au_equities_v1_read.intermediary_id[order_acknowledgement_au_equities_v1_at] == order_acknowledgement_au_equities_v1_written.intermediary_id[order_acknowledgement_au_equities_v1_at]); order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_au_equities_v1_read.directed_wholesale_indicator == order_acknowledgement_au_equities_v1_written.directed_wholesale_indicator);
  assert(order_acknowledgement_au_equities_v1_read.remove_crossing_from_clearing == order_acknowledgement_au_equities_v1_written.remove_crossing_from_clearing);
  assert(order_acknowledgement_au_equities_v1_read.broker_preferencing == order_acknowledgement_au_equities_v1_written.broker_preferencing);
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 8 -> assert(order_acknowledgement_au_equities_v1_read.working_price[order_acknowledgement_au_equities_v1_at] == order_acknowledgement_au_equities_v1_written.working_price[order_acknowledgement_au_equities_v1_at]); order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_au_equities_v1_read.base_liquidity_indicator == order_acknowledgement_au_equities_v1_written.base_liquidity_indicator);
  assert(order_acknowledgement_au_equities_v1_read.sub_liquidity_indicator == order_acknowledgement_au_equities_v1_written.sub_liquidity_indicator);
  assert(order_acknowledgement_au_equities_v1_read.routing_inst == order_acknowledgement_au_equities_v1_written.routing_inst);
  assert(order_acknowledgement_au_equities_v1_read.display_indicator == order_acknowledgement_au_equities_v1_written.display_indicator);
  order_acknowledgement_au_equities_v1_at = 0;
  do
  :: order_acknowledgement_au_equities_v1_at < 4 -> assert(order_acknowledgement_au_equities_v1_read.expire_date[order_acknowledgement_au_equities_v1_at] == order_acknowledgement_au_equities_v1_written.expire_date[order_acknowledgement_au_equities_v1_at]); order_acknowledgement_au_equities_v1_at = order_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Rejected Au Equities V 1: 91 bytes -------------------------------- */

/* Order Rejected messages are sent in response to a New Order which must be rejected */
typedef OrderRejectedAuEquitiesV1 {
  byte transaction_time[8];
  byte trading_participant_id[2];
  byte cl_ord_id[20];
  byte order_reject_reason;
  byte text[60]
};

int order_rejected_au_equities_v1_at;

/* every byte of Order Rejected Au Equities V 1 set to one value */
inline fill_order_rejected_au_equities_v1(order_rejected_au_equities_v1_record, order_rejected_au_equities_v1_value) {
  order_rejected_au_equities_v1_at = 0;
  do
  :: order_rejected_au_equities_v1_at < 8 -> order_rejected_au_equities_v1_record.transaction_time[order_rejected_au_equities_v1_at] = order_rejected_au_equities_v1_value; order_rejected_au_equities_v1_at = order_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_au_equities_v1_at = 0;
  do
  :: order_rejected_au_equities_v1_at < 2 -> order_rejected_au_equities_v1_record.trading_participant_id[order_rejected_au_equities_v1_at] = order_rejected_au_equities_v1_value; order_rejected_au_equities_v1_at = order_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_au_equities_v1_at = 0;
  do
  :: order_rejected_au_equities_v1_at < 20 -> order_rejected_au_equities_v1_record.cl_ord_id[order_rejected_au_equities_v1_at] = order_rejected_au_equities_v1_value; order_rejected_au_equities_v1_at = order_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_au_equities_v1_record.order_reject_reason = order_rejected_au_equities_v1_value;
  order_rejected_au_equities_v1_at = 0;
  do
  :: order_rejected_au_equities_v1_at < 60 -> order_rejected_au_equities_v1_record.text[order_rejected_au_equities_v1_at] = order_rejected_au_equities_v1_value; order_rejected_au_equities_v1_at = order_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Rejected Au Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_order_rejected_au_equities_v1(order_rejected_au_equities_v1_record, order_rejected_au_equities_v1_base) {
  order_rejected_au_equities_v1_at = 0;
  do
  :: order_rejected_au_equities_v1_at < 8 -> order_rejected_au_equities_v1_record.transaction_time[order_rejected_au_equities_v1_at] = (order_rejected_au_equities_v1_base + 0 + order_rejected_au_equities_v1_at + 1) % 256; order_rejected_au_equities_v1_at = order_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_au_equities_v1_at = 0;
  do
  :: order_rejected_au_equities_v1_at < 2 -> order_rejected_au_equities_v1_record.trading_participant_id[order_rejected_au_equities_v1_at] = (order_rejected_au_equities_v1_base + 8 + order_rejected_au_equities_v1_at + 1) % 256; order_rejected_au_equities_v1_at = order_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_au_equities_v1_at = 0;
  do
  :: order_rejected_au_equities_v1_at < 20 -> order_rejected_au_equities_v1_record.cl_ord_id[order_rejected_au_equities_v1_at] = (order_rejected_au_equities_v1_base + 10 + order_rejected_au_equities_v1_at + 1) % 256; order_rejected_au_equities_v1_at = order_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_au_equities_v1_record.order_reject_reason = (order_rejected_au_equities_v1_base + 30 + 1) % 256;
  order_rejected_au_equities_v1_at = 0;
  do
  :: order_rejected_au_equities_v1_at < 60 -> order_rejected_au_equities_v1_record.text[order_rejected_au_equities_v1_at] = (order_rejected_au_equities_v1_base + 31 + order_rejected_au_equities_v1_at + 1) % 256; order_rejected_au_equities_v1_at = order_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Order Rejected Au Equities V 1 to the wire, 91 bytes from where the cursor stands */
inline encode_order_rejected_au_equities_v1(order_rejected_au_equities_v1_record) {
  order_rejected_au_equities_v1_at = 0;
  do
  :: order_rejected_au_equities_v1_at < 8 -> wire[at] = order_rejected_au_equities_v1_record.transaction_time[order_rejected_au_equities_v1_at]; at = at + 1; order_rejected_au_equities_v1_at = order_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_au_equities_v1_at = 0;
  do
  :: order_rejected_au_equities_v1_at < 2 -> wire[at] = order_rejected_au_equities_v1_record.trading_participant_id[order_rejected_au_equities_v1_at]; at = at + 1; order_rejected_au_equities_v1_at = order_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_au_equities_v1_at = 0;
  do
  :: order_rejected_au_equities_v1_at < 20 -> wire[at] = order_rejected_au_equities_v1_record.cl_ord_id[order_rejected_au_equities_v1_at]; at = at + 1; order_rejected_au_equities_v1_at = order_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_rejected_au_equities_v1_record.order_reject_reason; at = at + 1;
  order_rejected_au_equities_v1_at = 0;
  do
  :: order_rejected_au_equities_v1_at < 60 -> wire[at] = order_rejected_au_equities_v1_record.text[order_rejected_au_equities_v1_at]; at = at + 1; order_rejected_au_equities_v1_at = order_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Order Rejected Au Equities V 1 off the wire, 91 bytes from where the cursor stands */
inline decode_order_rejected_au_equities_v1(order_rejected_au_equities_v1_record) {
  order_rejected_au_equities_v1_at = 0;
  do
  :: order_rejected_au_equities_v1_at < 8 -> order_rejected_au_equities_v1_record.transaction_time[order_rejected_au_equities_v1_at] = wire[at]; at = at + 1; order_rejected_au_equities_v1_at = order_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_au_equities_v1_at = 0;
  do
  :: order_rejected_au_equities_v1_at < 2 -> order_rejected_au_equities_v1_record.trading_participant_id[order_rejected_au_equities_v1_at] = wire[at]; at = at + 1; order_rejected_au_equities_v1_at = order_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_au_equities_v1_at = 0;
  do
  :: order_rejected_au_equities_v1_at < 20 -> order_rejected_au_equities_v1_record.cl_ord_id[order_rejected_au_equities_v1_at] = wire[at]; at = at + 1; order_rejected_au_equities_v1_at = order_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_au_equities_v1_record.order_reject_reason = wire[at]; at = at + 1;
  order_rejected_au_equities_v1_at = 0;
  do
  :: order_rejected_au_equities_v1_at < 60 -> order_rejected_au_equities_v1_record.text[order_rejected_au_equities_v1_at] = wire[at]; at = at + 1; order_rejected_au_equities_v1_at = order_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Rejected Au Equities V 1 is what was written, byte for byte */
inline equal_order_rejected_au_equities_v1(order_rejected_au_equities_v1_read, order_rejected_au_equities_v1_written) {
  order_rejected_au_equities_v1_at = 0;
  do
  :: order_rejected_au_equities_v1_at < 8 -> assert(order_rejected_au_equities_v1_read.transaction_time[order_rejected_au_equities_v1_at] == order_rejected_au_equities_v1_written.transaction_time[order_rejected_au_equities_v1_at]); order_rejected_au_equities_v1_at = order_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_au_equities_v1_at = 0;
  do
  :: order_rejected_au_equities_v1_at < 2 -> assert(order_rejected_au_equities_v1_read.trading_participant_id[order_rejected_au_equities_v1_at] == order_rejected_au_equities_v1_written.trading_participant_id[order_rejected_au_equities_v1_at]); order_rejected_au_equities_v1_at = order_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_au_equities_v1_at = 0;
  do
  :: order_rejected_au_equities_v1_at < 20 -> assert(order_rejected_au_equities_v1_read.cl_ord_id[order_rejected_au_equities_v1_at] == order_rejected_au_equities_v1_written.cl_ord_id[order_rejected_au_equities_v1_at]); order_rejected_au_equities_v1_at = order_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_rejected_au_equities_v1_read.order_reject_reason == order_rejected_au_equities_v1_written.order_reject_reason);
  order_rejected_au_equities_v1_at = 0;
  do
  :: order_rejected_au_equities_v1_at < 60 -> assert(order_rejected_au_equities_v1_read.text[order_rejected_au_equities_v1_at] == order_rejected_au_equities_v1_written.text[order_rejected_au_equities_v1_at]); order_rejected_au_equities_v1_at = order_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Modified Au Equities V 1: 105 bytes ------------------------------- */

/* Order Modified messages are sent in response to a Modify Order to indicate that the order has been successfully modified */
typedef OrderModifiedAuEquitiesV1 {
  byte transaction_time[8];
  byte trading_participant_id[2];
  byte cl_ord_id[20];
  byte exec_inst;
  byte order_qty[4];
  byte orig_cl_ord_id[20];
  byte price[8];
  byte min_qty[4];
  byte max_floor[4];
  byte leaves_qty[4];
  byte secondary_order_id[8];
  byte short_sell_naked_qty[4];
  byte short_sell_covered_qty[4];
  byte short_sell_long_qty[4];
  byte working_price[8];
  byte base_liquidity_indicator;
  byte sub_liquidity_indicator
};

int order_modified_au_equities_v1_at;

/* every byte of Order Modified Au Equities V 1 set to one value */
inline fill_order_modified_au_equities_v1(order_modified_au_equities_v1_record, order_modified_au_equities_v1_value) {
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 8 -> order_modified_au_equities_v1_record.transaction_time[order_modified_au_equities_v1_at] = order_modified_au_equities_v1_value; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 2 -> order_modified_au_equities_v1_record.trading_participant_id[order_modified_au_equities_v1_at] = order_modified_au_equities_v1_value; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 20 -> order_modified_au_equities_v1_record.cl_ord_id[order_modified_au_equities_v1_at] = order_modified_au_equities_v1_value; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_record.exec_inst = order_modified_au_equities_v1_value;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> order_modified_au_equities_v1_record.order_qty[order_modified_au_equities_v1_at] = order_modified_au_equities_v1_value; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 20 -> order_modified_au_equities_v1_record.orig_cl_ord_id[order_modified_au_equities_v1_at] = order_modified_au_equities_v1_value; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 8 -> order_modified_au_equities_v1_record.price[order_modified_au_equities_v1_at] = order_modified_au_equities_v1_value; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> order_modified_au_equities_v1_record.min_qty[order_modified_au_equities_v1_at] = order_modified_au_equities_v1_value; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> order_modified_au_equities_v1_record.max_floor[order_modified_au_equities_v1_at] = order_modified_au_equities_v1_value; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> order_modified_au_equities_v1_record.leaves_qty[order_modified_au_equities_v1_at] = order_modified_au_equities_v1_value; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 8 -> order_modified_au_equities_v1_record.secondary_order_id[order_modified_au_equities_v1_at] = order_modified_au_equities_v1_value; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> order_modified_au_equities_v1_record.short_sell_naked_qty[order_modified_au_equities_v1_at] = order_modified_au_equities_v1_value; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> order_modified_au_equities_v1_record.short_sell_covered_qty[order_modified_au_equities_v1_at] = order_modified_au_equities_v1_value; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> order_modified_au_equities_v1_record.short_sell_long_qty[order_modified_au_equities_v1_at] = order_modified_au_equities_v1_value; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 8 -> order_modified_au_equities_v1_record.working_price[order_modified_au_equities_v1_at] = order_modified_au_equities_v1_value; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_record.base_liquidity_indicator = order_modified_au_equities_v1_value;
  order_modified_au_equities_v1_record.sub_liquidity_indicator = order_modified_au_equities_v1_value;
  skip
}

/* each byte of Order Modified Au Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_order_modified_au_equities_v1(order_modified_au_equities_v1_record, order_modified_au_equities_v1_base) {
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 8 -> order_modified_au_equities_v1_record.transaction_time[order_modified_au_equities_v1_at] = (order_modified_au_equities_v1_base + 0 + order_modified_au_equities_v1_at + 1) % 256; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 2 -> order_modified_au_equities_v1_record.trading_participant_id[order_modified_au_equities_v1_at] = (order_modified_au_equities_v1_base + 8 + order_modified_au_equities_v1_at + 1) % 256; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 20 -> order_modified_au_equities_v1_record.cl_ord_id[order_modified_au_equities_v1_at] = (order_modified_au_equities_v1_base + 10 + order_modified_au_equities_v1_at + 1) % 256; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_record.exec_inst = (order_modified_au_equities_v1_base + 30 + 1) % 256;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> order_modified_au_equities_v1_record.order_qty[order_modified_au_equities_v1_at] = (order_modified_au_equities_v1_base + 31 + order_modified_au_equities_v1_at + 1) % 256; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 20 -> order_modified_au_equities_v1_record.orig_cl_ord_id[order_modified_au_equities_v1_at] = (order_modified_au_equities_v1_base + 35 + order_modified_au_equities_v1_at + 1) % 256; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 8 -> order_modified_au_equities_v1_record.price[order_modified_au_equities_v1_at] = (order_modified_au_equities_v1_base + 55 + order_modified_au_equities_v1_at + 1) % 256; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> order_modified_au_equities_v1_record.min_qty[order_modified_au_equities_v1_at] = (order_modified_au_equities_v1_base + 63 + order_modified_au_equities_v1_at + 1) % 256; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> order_modified_au_equities_v1_record.max_floor[order_modified_au_equities_v1_at] = (order_modified_au_equities_v1_base + 67 + order_modified_au_equities_v1_at + 1) % 256; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> order_modified_au_equities_v1_record.leaves_qty[order_modified_au_equities_v1_at] = (order_modified_au_equities_v1_base + 71 + order_modified_au_equities_v1_at + 1) % 256; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 8 -> order_modified_au_equities_v1_record.secondary_order_id[order_modified_au_equities_v1_at] = (order_modified_au_equities_v1_base + 75 + order_modified_au_equities_v1_at + 1) % 256; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> order_modified_au_equities_v1_record.short_sell_naked_qty[order_modified_au_equities_v1_at] = (order_modified_au_equities_v1_base + 83 + order_modified_au_equities_v1_at + 1) % 256; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> order_modified_au_equities_v1_record.short_sell_covered_qty[order_modified_au_equities_v1_at] = (order_modified_au_equities_v1_base + 87 + order_modified_au_equities_v1_at + 1) % 256; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> order_modified_au_equities_v1_record.short_sell_long_qty[order_modified_au_equities_v1_at] = (order_modified_au_equities_v1_base + 91 + order_modified_au_equities_v1_at + 1) % 256; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 8 -> order_modified_au_equities_v1_record.working_price[order_modified_au_equities_v1_at] = (order_modified_au_equities_v1_base + 95 + order_modified_au_equities_v1_at + 1) % 256; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_record.base_liquidity_indicator = (order_modified_au_equities_v1_base + 103 + 1) % 256;
  order_modified_au_equities_v1_record.sub_liquidity_indicator = (order_modified_au_equities_v1_base + 104 + 1) % 256;
  skip
}

/* Order Modified Au Equities V 1 to the wire, 105 bytes from where the cursor stands */
inline encode_order_modified_au_equities_v1(order_modified_au_equities_v1_record) {
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 8 -> wire[at] = order_modified_au_equities_v1_record.transaction_time[order_modified_au_equities_v1_at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 2 -> wire[at] = order_modified_au_equities_v1_record.trading_participant_id[order_modified_au_equities_v1_at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 20 -> wire[at] = order_modified_au_equities_v1_record.cl_ord_id[order_modified_au_equities_v1_at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_modified_au_equities_v1_record.exec_inst; at = at + 1;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> wire[at] = order_modified_au_equities_v1_record.order_qty[order_modified_au_equities_v1_at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 20 -> wire[at] = order_modified_au_equities_v1_record.orig_cl_ord_id[order_modified_au_equities_v1_at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 8 -> wire[at] = order_modified_au_equities_v1_record.price[order_modified_au_equities_v1_at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> wire[at] = order_modified_au_equities_v1_record.min_qty[order_modified_au_equities_v1_at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> wire[at] = order_modified_au_equities_v1_record.max_floor[order_modified_au_equities_v1_at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> wire[at] = order_modified_au_equities_v1_record.leaves_qty[order_modified_au_equities_v1_at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 8 -> wire[at] = order_modified_au_equities_v1_record.secondary_order_id[order_modified_au_equities_v1_at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> wire[at] = order_modified_au_equities_v1_record.short_sell_naked_qty[order_modified_au_equities_v1_at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> wire[at] = order_modified_au_equities_v1_record.short_sell_covered_qty[order_modified_au_equities_v1_at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> wire[at] = order_modified_au_equities_v1_record.short_sell_long_qty[order_modified_au_equities_v1_at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 8 -> wire[at] = order_modified_au_equities_v1_record.working_price[order_modified_au_equities_v1_at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_modified_au_equities_v1_record.base_liquidity_indicator; at = at + 1;
  wire[at] = order_modified_au_equities_v1_record.sub_liquidity_indicator; at = at + 1;
  skip
}

/* Order Modified Au Equities V 1 off the wire, 105 bytes from where the cursor stands */
inline decode_order_modified_au_equities_v1(order_modified_au_equities_v1_record) {
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 8 -> order_modified_au_equities_v1_record.transaction_time[order_modified_au_equities_v1_at] = wire[at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 2 -> order_modified_au_equities_v1_record.trading_participant_id[order_modified_au_equities_v1_at] = wire[at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 20 -> order_modified_au_equities_v1_record.cl_ord_id[order_modified_au_equities_v1_at] = wire[at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_record.exec_inst = wire[at]; at = at + 1;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> order_modified_au_equities_v1_record.order_qty[order_modified_au_equities_v1_at] = wire[at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 20 -> order_modified_au_equities_v1_record.orig_cl_ord_id[order_modified_au_equities_v1_at] = wire[at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 8 -> order_modified_au_equities_v1_record.price[order_modified_au_equities_v1_at] = wire[at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> order_modified_au_equities_v1_record.min_qty[order_modified_au_equities_v1_at] = wire[at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> order_modified_au_equities_v1_record.max_floor[order_modified_au_equities_v1_at] = wire[at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> order_modified_au_equities_v1_record.leaves_qty[order_modified_au_equities_v1_at] = wire[at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 8 -> order_modified_au_equities_v1_record.secondary_order_id[order_modified_au_equities_v1_at] = wire[at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> order_modified_au_equities_v1_record.short_sell_naked_qty[order_modified_au_equities_v1_at] = wire[at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> order_modified_au_equities_v1_record.short_sell_covered_qty[order_modified_au_equities_v1_at] = wire[at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> order_modified_au_equities_v1_record.short_sell_long_qty[order_modified_au_equities_v1_at] = wire[at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 8 -> order_modified_au_equities_v1_record.working_price[order_modified_au_equities_v1_at] = wire[at]; at = at + 1; order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_record.base_liquidity_indicator = wire[at]; at = at + 1;
  order_modified_au_equities_v1_record.sub_liquidity_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Modified Au Equities V 1 is what was written, byte for byte */
inline equal_order_modified_au_equities_v1(order_modified_au_equities_v1_read, order_modified_au_equities_v1_written) {
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 8 -> assert(order_modified_au_equities_v1_read.transaction_time[order_modified_au_equities_v1_at] == order_modified_au_equities_v1_written.transaction_time[order_modified_au_equities_v1_at]); order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 2 -> assert(order_modified_au_equities_v1_read.trading_participant_id[order_modified_au_equities_v1_at] == order_modified_au_equities_v1_written.trading_participant_id[order_modified_au_equities_v1_at]); order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 20 -> assert(order_modified_au_equities_v1_read.cl_ord_id[order_modified_au_equities_v1_at] == order_modified_au_equities_v1_written.cl_ord_id[order_modified_au_equities_v1_at]); order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_modified_au_equities_v1_read.exec_inst == order_modified_au_equities_v1_written.exec_inst);
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> assert(order_modified_au_equities_v1_read.order_qty[order_modified_au_equities_v1_at] == order_modified_au_equities_v1_written.order_qty[order_modified_au_equities_v1_at]); order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 20 -> assert(order_modified_au_equities_v1_read.orig_cl_ord_id[order_modified_au_equities_v1_at] == order_modified_au_equities_v1_written.orig_cl_ord_id[order_modified_au_equities_v1_at]); order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 8 -> assert(order_modified_au_equities_v1_read.price[order_modified_au_equities_v1_at] == order_modified_au_equities_v1_written.price[order_modified_au_equities_v1_at]); order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> assert(order_modified_au_equities_v1_read.min_qty[order_modified_au_equities_v1_at] == order_modified_au_equities_v1_written.min_qty[order_modified_au_equities_v1_at]); order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> assert(order_modified_au_equities_v1_read.max_floor[order_modified_au_equities_v1_at] == order_modified_au_equities_v1_written.max_floor[order_modified_au_equities_v1_at]); order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> assert(order_modified_au_equities_v1_read.leaves_qty[order_modified_au_equities_v1_at] == order_modified_au_equities_v1_written.leaves_qty[order_modified_au_equities_v1_at]); order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 8 -> assert(order_modified_au_equities_v1_read.secondary_order_id[order_modified_au_equities_v1_at] == order_modified_au_equities_v1_written.secondary_order_id[order_modified_au_equities_v1_at]); order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> assert(order_modified_au_equities_v1_read.short_sell_naked_qty[order_modified_au_equities_v1_at] == order_modified_au_equities_v1_written.short_sell_naked_qty[order_modified_au_equities_v1_at]); order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> assert(order_modified_au_equities_v1_read.short_sell_covered_qty[order_modified_au_equities_v1_at] == order_modified_au_equities_v1_written.short_sell_covered_qty[order_modified_au_equities_v1_at]); order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 4 -> assert(order_modified_au_equities_v1_read.short_sell_long_qty[order_modified_au_equities_v1_at] == order_modified_au_equities_v1_written.short_sell_long_qty[order_modified_au_equities_v1_at]); order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v1_at = 0;
  do
  :: order_modified_au_equities_v1_at < 8 -> assert(order_modified_au_equities_v1_read.working_price[order_modified_au_equities_v1_at] == order_modified_au_equities_v1_written.working_price[order_modified_au_equities_v1_at]); order_modified_au_equities_v1_at = order_modified_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_modified_au_equities_v1_read.base_liquidity_indicator == order_modified_au_equities_v1_written.base_liquidity_indicator);
  assert(order_modified_au_equities_v1_read.sub_liquidity_indicator == order_modified_au_equities_v1_written.sub_liquidity_indicator);
  skip
}

/* ---- Modify Rejected Au Equities V 1: 111 bytes ------------------------------ */

/* Modify Rejected messages are sent in response to a Modify Order for an order which cannot be modified */
typedef ModifyRejectedAuEquitiesV1 {
  byte transaction_time[8];
  byte trading_participant_id[2];
  byte cl_ord_id[20];
  byte orig_cl_ord_id[20];
  byte modify_reject_reason;
  byte text[60]
};

int modify_rejected_au_equities_v1_at;

/* every byte of Modify Rejected Au Equities V 1 set to one value */
inline fill_modify_rejected_au_equities_v1(modify_rejected_au_equities_v1_record, modify_rejected_au_equities_v1_value) {
  modify_rejected_au_equities_v1_at = 0;
  do
  :: modify_rejected_au_equities_v1_at < 8 -> modify_rejected_au_equities_v1_record.transaction_time[modify_rejected_au_equities_v1_at] = modify_rejected_au_equities_v1_value; modify_rejected_au_equities_v1_at = modify_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_au_equities_v1_at = 0;
  do
  :: modify_rejected_au_equities_v1_at < 2 -> modify_rejected_au_equities_v1_record.trading_participant_id[modify_rejected_au_equities_v1_at] = modify_rejected_au_equities_v1_value; modify_rejected_au_equities_v1_at = modify_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_au_equities_v1_at = 0;
  do
  :: modify_rejected_au_equities_v1_at < 20 -> modify_rejected_au_equities_v1_record.cl_ord_id[modify_rejected_au_equities_v1_at] = modify_rejected_au_equities_v1_value; modify_rejected_au_equities_v1_at = modify_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_au_equities_v1_at = 0;
  do
  :: modify_rejected_au_equities_v1_at < 20 -> modify_rejected_au_equities_v1_record.orig_cl_ord_id[modify_rejected_au_equities_v1_at] = modify_rejected_au_equities_v1_value; modify_rejected_au_equities_v1_at = modify_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_au_equities_v1_record.modify_reject_reason = modify_rejected_au_equities_v1_value;
  modify_rejected_au_equities_v1_at = 0;
  do
  :: modify_rejected_au_equities_v1_at < 60 -> modify_rejected_au_equities_v1_record.text[modify_rejected_au_equities_v1_at] = modify_rejected_au_equities_v1_value; modify_rejected_au_equities_v1_at = modify_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Modify Rejected Au Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_modify_rejected_au_equities_v1(modify_rejected_au_equities_v1_record, modify_rejected_au_equities_v1_base) {
  modify_rejected_au_equities_v1_at = 0;
  do
  :: modify_rejected_au_equities_v1_at < 8 -> modify_rejected_au_equities_v1_record.transaction_time[modify_rejected_au_equities_v1_at] = (modify_rejected_au_equities_v1_base + 0 + modify_rejected_au_equities_v1_at + 1) % 256; modify_rejected_au_equities_v1_at = modify_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_au_equities_v1_at = 0;
  do
  :: modify_rejected_au_equities_v1_at < 2 -> modify_rejected_au_equities_v1_record.trading_participant_id[modify_rejected_au_equities_v1_at] = (modify_rejected_au_equities_v1_base + 8 + modify_rejected_au_equities_v1_at + 1) % 256; modify_rejected_au_equities_v1_at = modify_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_au_equities_v1_at = 0;
  do
  :: modify_rejected_au_equities_v1_at < 20 -> modify_rejected_au_equities_v1_record.cl_ord_id[modify_rejected_au_equities_v1_at] = (modify_rejected_au_equities_v1_base + 10 + modify_rejected_au_equities_v1_at + 1) % 256; modify_rejected_au_equities_v1_at = modify_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_au_equities_v1_at = 0;
  do
  :: modify_rejected_au_equities_v1_at < 20 -> modify_rejected_au_equities_v1_record.orig_cl_ord_id[modify_rejected_au_equities_v1_at] = (modify_rejected_au_equities_v1_base + 30 + modify_rejected_au_equities_v1_at + 1) % 256; modify_rejected_au_equities_v1_at = modify_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_au_equities_v1_record.modify_reject_reason = (modify_rejected_au_equities_v1_base + 50 + 1) % 256;
  modify_rejected_au_equities_v1_at = 0;
  do
  :: modify_rejected_au_equities_v1_at < 60 -> modify_rejected_au_equities_v1_record.text[modify_rejected_au_equities_v1_at] = (modify_rejected_au_equities_v1_base + 51 + modify_rejected_au_equities_v1_at + 1) % 256; modify_rejected_au_equities_v1_at = modify_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Rejected Au Equities V 1 to the wire, 111 bytes from where the cursor stands */
inline encode_modify_rejected_au_equities_v1(modify_rejected_au_equities_v1_record) {
  modify_rejected_au_equities_v1_at = 0;
  do
  :: modify_rejected_au_equities_v1_at < 8 -> wire[at] = modify_rejected_au_equities_v1_record.transaction_time[modify_rejected_au_equities_v1_at]; at = at + 1; modify_rejected_au_equities_v1_at = modify_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_au_equities_v1_at = 0;
  do
  :: modify_rejected_au_equities_v1_at < 2 -> wire[at] = modify_rejected_au_equities_v1_record.trading_participant_id[modify_rejected_au_equities_v1_at]; at = at + 1; modify_rejected_au_equities_v1_at = modify_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_au_equities_v1_at = 0;
  do
  :: modify_rejected_au_equities_v1_at < 20 -> wire[at] = modify_rejected_au_equities_v1_record.cl_ord_id[modify_rejected_au_equities_v1_at]; at = at + 1; modify_rejected_au_equities_v1_at = modify_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_au_equities_v1_at = 0;
  do
  :: modify_rejected_au_equities_v1_at < 20 -> wire[at] = modify_rejected_au_equities_v1_record.orig_cl_ord_id[modify_rejected_au_equities_v1_at]; at = at + 1; modify_rejected_au_equities_v1_at = modify_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = modify_rejected_au_equities_v1_record.modify_reject_reason; at = at + 1;
  modify_rejected_au_equities_v1_at = 0;
  do
  :: modify_rejected_au_equities_v1_at < 60 -> wire[at] = modify_rejected_au_equities_v1_record.text[modify_rejected_au_equities_v1_at]; at = at + 1; modify_rejected_au_equities_v1_at = modify_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Rejected Au Equities V 1 off the wire, 111 bytes from where the cursor stands */
inline decode_modify_rejected_au_equities_v1(modify_rejected_au_equities_v1_record) {
  modify_rejected_au_equities_v1_at = 0;
  do
  :: modify_rejected_au_equities_v1_at < 8 -> modify_rejected_au_equities_v1_record.transaction_time[modify_rejected_au_equities_v1_at] = wire[at]; at = at + 1; modify_rejected_au_equities_v1_at = modify_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_au_equities_v1_at = 0;
  do
  :: modify_rejected_au_equities_v1_at < 2 -> modify_rejected_au_equities_v1_record.trading_participant_id[modify_rejected_au_equities_v1_at] = wire[at]; at = at + 1; modify_rejected_au_equities_v1_at = modify_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_au_equities_v1_at = 0;
  do
  :: modify_rejected_au_equities_v1_at < 20 -> modify_rejected_au_equities_v1_record.cl_ord_id[modify_rejected_au_equities_v1_at] = wire[at]; at = at + 1; modify_rejected_au_equities_v1_at = modify_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_au_equities_v1_at = 0;
  do
  :: modify_rejected_au_equities_v1_at < 20 -> modify_rejected_au_equities_v1_record.orig_cl_ord_id[modify_rejected_au_equities_v1_at] = wire[at]; at = at + 1; modify_rejected_au_equities_v1_at = modify_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_au_equities_v1_record.modify_reject_reason = wire[at]; at = at + 1;
  modify_rejected_au_equities_v1_at = 0;
  do
  :: modify_rejected_au_equities_v1_at < 60 -> modify_rejected_au_equities_v1_record.text[modify_rejected_au_equities_v1_at] = wire[at]; at = at + 1; modify_rejected_au_equities_v1_at = modify_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Modify Rejected Au Equities V 1 is what was written, byte for byte */
inline equal_modify_rejected_au_equities_v1(modify_rejected_au_equities_v1_read, modify_rejected_au_equities_v1_written) {
  modify_rejected_au_equities_v1_at = 0;
  do
  :: modify_rejected_au_equities_v1_at < 8 -> assert(modify_rejected_au_equities_v1_read.transaction_time[modify_rejected_au_equities_v1_at] == modify_rejected_au_equities_v1_written.transaction_time[modify_rejected_au_equities_v1_at]); modify_rejected_au_equities_v1_at = modify_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_au_equities_v1_at = 0;
  do
  :: modify_rejected_au_equities_v1_at < 2 -> assert(modify_rejected_au_equities_v1_read.trading_participant_id[modify_rejected_au_equities_v1_at] == modify_rejected_au_equities_v1_written.trading_participant_id[modify_rejected_au_equities_v1_at]); modify_rejected_au_equities_v1_at = modify_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_au_equities_v1_at = 0;
  do
  :: modify_rejected_au_equities_v1_at < 20 -> assert(modify_rejected_au_equities_v1_read.cl_ord_id[modify_rejected_au_equities_v1_at] == modify_rejected_au_equities_v1_written.cl_ord_id[modify_rejected_au_equities_v1_at]); modify_rejected_au_equities_v1_at = modify_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_au_equities_v1_at = 0;
  do
  :: modify_rejected_au_equities_v1_at < 20 -> assert(modify_rejected_au_equities_v1_read.orig_cl_ord_id[modify_rejected_au_equities_v1_at] == modify_rejected_au_equities_v1_written.orig_cl_ord_id[modify_rejected_au_equities_v1_at]); modify_rejected_au_equities_v1_at = modify_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(modify_rejected_au_equities_v1_read.modify_reject_reason == modify_rejected_au_equities_v1_written.modify_reject_reason);
  modify_rejected_au_equities_v1_at = 0;
  do
  :: modify_rejected_au_equities_v1_at < 60 -> assert(modify_rejected_au_equities_v1_read.text[modify_rejected_au_equities_v1_at] == modify_rejected_au_equities_v1_written.text[modify_rejected_au_equities_v1_at]); modify_rejected_au_equities_v1_at = modify_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Restated Au Equities V 1: 76 bytes -------------------------------- */

/* Order restatement for an iceberg reload or a Self-Trade Protection reduction or cancellation */
typedef OrderRestatedAuEquitiesV1 {
  byte transaction_time[8];
  byte trading_participant_id[2];
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

int order_restated_au_equities_v1_at;

/* every byte of Order Restated Au Equities V 1 set to one value */
inline fill_order_restated_au_equities_v1(order_restated_au_equities_v1_record, order_restated_au_equities_v1_value) {
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 8 -> order_restated_au_equities_v1_record.transaction_time[order_restated_au_equities_v1_at] = order_restated_au_equities_v1_value; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 2 -> order_restated_au_equities_v1_record.trading_participant_id[order_restated_au_equities_v1_at] = order_restated_au_equities_v1_value; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 20 -> order_restated_au_equities_v1_record.cl_ord_id[order_restated_au_equities_v1_at] = order_restated_au_equities_v1_value; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 8 -> order_restated_au_equities_v1_record.order_id[order_restated_au_equities_v1_at] = order_restated_au_equities_v1_value; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 4 -> order_restated_au_equities_v1_record.order_qty[order_restated_au_equities_v1_at] = order_restated_au_equities_v1_value; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 8 -> order_restated_au_equities_v1_record.price[order_restated_au_equities_v1_at] = order_restated_au_equities_v1_value; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 4 -> order_restated_au_equities_v1_record.leaves_qty[order_restated_au_equities_v1_at] = order_restated_au_equities_v1_value; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 8 -> order_restated_au_equities_v1_record.secondary_order_id[order_restated_au_equities_v1_at] = order_restated_au_equities_v1_value; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 8 -> order_restated_au_equities_v1_record.last_px[order_restated_au_equities_v1_at] = order_restated_au_equities_v1_value; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 4 -> order_restated_au_equities_v1_record.last_shares[order_restated_au_equities_v1_at] = order_restated_au_equities_v1_value; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_record.base_liquidity_indicator = order_restated_au_equities_v1_value;
  order_restated_au_equities_v1_record.restatement_reason = order_restated_au_equities_v1_value;
  skip
}

/* each byte of Order Restated Au Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_order_restated_au_equities_v1(order_restated_au_equities_v1_record, order_restated_au_equities_v1_base) {
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 8 -> order_restated_au_equities_v1_record.transaction_time[order_restated_au_equities_v1_at] = (order_restated_au_equities_v1_base + 0 + order_restated_au_equities_v1_at + 1) % 256; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 2 -> order_restated_au_equities_v1_record.trading_participant_id[order_restated_au_equities_v1_at] = (order_restated_au_equities_v1_base + 8 + order_restated_au_equities_v1_at + 1) % 256; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 20 -> order_restated_au_equities_v1_record.cl_ord_id[order_restated_au_equities_v1_at] = (order_restated_au_equities_v1_base + 10 + order_restated_au_equities_v1_at + 1) % 256; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 8 -> order_restated_au_equities_v1_record.order_id[order_restated_au_equities_v1_at] = (order_restated_au_equities_v1_base + 30 + order_restated_au_equities_v1_at + 1) % 256; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 4 -> order_restated_au_equities_v1_record.order_qty[order_restated_au_equities_v1_at] = (order_restated_au_equities_v1_base + 38 + order_restated_au_equities_v1_at + 1) % 256; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 8 -> order_restated_au_equities_v1_record.price[order_restated_au_equities_v1_at] = (order_restated_au_equities_v1_base + 42 + order_restated_au_equities_v1_at + 1) % 256; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 4 -> order_restated_au_equities_v1_record.leaves_qty[order_restated_au_equities_v1_at] = (order_restated_au_equities_v1_base + 50 + order_restated_au_equities_v1_at + 1) % 256; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 8 -> order_restated_au_equities_v1_record.secondary_order_id[order_restated_au_equities_v1_at] = (order_restated_au_equities_v1_base + 54 + order_restated_au_equities_v1_at + 1) % 256; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 8 -> order_restated_au_equities_v1_record.last_px[order_restated_au_equities_v1_at] = (order_restated_au_equities_v1_base + 62 + order_restated_au_equities_v1_at + 1) % 256; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 4 -> order_restated_au_equities_v1_record.last_shares[order_restated_au_equities_v1_at] = (order_restated_au_equities_v1_base + 70 + order_restated_au_equities_v1_at + 1) % 256; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_record.base_liquidity_indicator = (order_restated_au_equities_v1_base + 74 + 1) % 256;
  order_restated_au_equities_v1_record.restatement_reason = (order_restated_au_equities_v1_base + 75 + 1) % 256;
  skip
}

/* Order Restated Au Equities V 1 to the wire, 76 bytes from where the cursor stands */
inline encode_order_restated_au_equities_v1(order_restated_au_equities_v1_record) {
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 8 -> wire[at] = order_restated_au_equities_v1_record.transaction_time[order_restated_au_equities_v1_at]; at = at + 1; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 2 -> wire[at] = order_restated_au_equities_v1_record.trading_participant_id[order_restated_au_equities_v1_at]; at = at + 1; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 20 -> wire[at] = order_restated_au_equities_v1_record.cl_ord_id[order_restated_au_equities_v1_at]; at = at + 1; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 8 -> wire[at] = order_restated_au_equities_v1_record.order_id[order_restated_au_equities_v1_at]; at = at + 1; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 4 -> wire[at] = order_restated_au_equities_v1_record.order_qty[order_restated_au_equities_v1_at]; at = at + 1; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 8 -> wire[at] = order_restated_au_equities_v1_record.price[order_restated_au_equities_v1_at]; at = at + 1; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 4 -> wire[at] = order_restated_au_equities_v1_record.leaves_qty[order_restated_au_equities_v1_at]; at = at + 1; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 8 -> wire[at] = order_restated_au_equities_v1_record.secondary_order_id[order_restated_au_equities_v1_at]; at = at + 1; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 8 -> wire[at] = order_restated_au_equities_v1_record.last_px[order_restated_au_equities_v1_at]; at = at + 1; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 4 -> wire[at] = order_restated_au_equities_v1_record.last_shares[order_restated_au_equities_v1_at]; at = at + 1; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_restated_au_equities_v1_record.base_liquidity_indicator; at = at + 1;
  wire[at] = order_restated_au_equities_v1_record.restatement_reason; at = at + 1;
  skip
}

/* Order Restated Au Equities V 1 off the wire, 76 bytes from where the cursor stands */
inline decode_order_restated_au_equities_v1(order_restated_au_equities_v1_record) {
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 8 -> order_restated_au_equities_v1_record.transaction_time[order_restated_au_equities_v1_at] = wire[at]; at = at + 1; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 2 -> order_restated_au_equities_v1_record.trading_participant_id[order_restated_au_equities_v1_at] = wire[at]; at = at + 1; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 20 -> order_restated_au_equities_v1_record.cl_ord_id[order_restated_au_equities_v1_at] = wire[at]; at = at + 1; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 8 -> order_restated_au_equities_v1_record.order_id[order_restated_au_equities_v1_at] = wire[at]; at = at + 1; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 4 -> order_restated_au_equities_v1_record.order_qty[order_restated_au_equities_v1_at] = wire[at]; at = at + 1; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 8 -> order_restated_au_equities_v1_record.price[order_restated_au_equities_v1_at] = wire[at]; at = at + 1; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 4 -> order_restated_au_equities_v1_record.leaves_qty[order_restated_au_equities_v1_at] = wire[at]; at = at + 1; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 8 -> order_restated_au_equities_v1_record.secondary_order_id[order_restated_au_equities_v1_at] = wire[at]; at = at + 1; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 8 -> order_restated_au_equities_v1_record.last_px[order_restated_au_equities_v1_at] = wire[at]; at = at + 1; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 4 -> order_restated_au_equities_v1_record.last_shares[order_restated_au_equities_v1_at] = wire[at]; at = at + 1; order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_record.base_liquidity_indicator = wire[at]; at = at + 1;
  order_restated_au_equities_v1_record.restatement_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Restated Au Equities V 1 is what was written, byte for byte */
inline equal_order_restated_au_equities_v1(order_restated_au_equities_v1_read, order_restated_au_equities_v1_written) {
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 8 -> assert(order_restated_au_equities_v1_read.transaction_time[order_restated_au_equities_v1_at] == order_restated_au_equities_v1_written.transaction_time[order_restated_au_equities_v1_at]); order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 2 -> assert(order_restated_au_equities_v1_read.trading_participant_id[order_restated_au_equities_v1_at] == order_restated_au_equities_v1_written.trading_participant_id[order_restated_au_equities_v1_at]); order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 20 -> assert(order_restated_au_equities_v1_read.cl_ord_id[order_restated_au_equities_v1_at] == order_restated_au_equities_v1_written.cl_ord_id[order_restated_au_equities_v1_at]); order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 8 -> assert(order_restated_au_equities_v1_read.order_id[order_restated_au_equities_v1_at] == order_restated_au_equities_v1_written.order_id[order_restated_au_equities_v1_at]); order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 4 -> assert(order_restated_au_equities_v1_read.order_qty[order_restated_au_equities_v1_at] == order_restated_au_equities_v1_written.order_qty[order_restated_au_equities_v1_at]); order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 8 -> assert(order_restated_au_equities_v1_read.price[order_restated_au_equities_v1_at] == order_restated_au_equities_v1_written.price[order_restated_au_equities_v1_at]); order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 4 -> assert(order_restated_au_equities_v1_read.leaves_qty[order_restated_au_equities_v1_at] == order_restated_au_equities_v1_written.leaves_qty[order_restated_au_equities_v1_at]); order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 8 -> assert(order_restated_au_equities_v1_read.secondary_order_id[order_restated_au_equities_v1_at] == order_restated_au_equities_v1_written.secondary_order_id[order_restated_au_equities_v1_at]); order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 8 -> assert(order_restated_au_equities_v1_read.last_px[order_restated_au_equities_v1_at] == order_restated_au_equities_v1_written.last_px[order_restated_au_equities_v1_at]); order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_au_equities_v1_at = 0;
  do
  :: order_restated_au_equities_v1_at < 4 -> assert(order_restated_au_equities_v1_read.last_shares[order_restated_au_equities_v1_at] == order_restated_au_equities_v1_written.last_shares[order_restated_au_equities_v1_at]); order_restated_au_equities_v1_at = order_restated_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_restated_au_equities_v1_read.base_liquidity_indicator == order_restated_au_equities_v1_written.base_liquidity_indicator);
  assert(order_restated_au_equities_v1_read.restatement_reason == order_restated_au_equities_v1_written.restatement_reason);
  skip
}

/* ---- Order Execution Au Equities V 1: 104 bytes ------------------------------ */

/* An Order Execution is sent for each fill on an order */
typedef OrderExecutionAuEquitiesV1 {
  byte transaction_time[8];
  byte trading_participant_id[2];
  byte cl_ord_id[20];
  byte exec_id[8];
  byte last_capacity;
  byte last_mkt[4];
  byte last_px[8];
  byte last_shares[4];
  byte side;
  byte symbol[6];
  byte leaves_qty[4];
  byte secondary_order_id[8];
  byte clearing_participant_id[4];
  byte price_improvement[8];
  byte transact_id[10];
  byte on_market_cross_type;
  byte trade_report_type;
  byte base_liquidity_indicator;
  byte sub_liquidity_indicator;
  byte contra_participant_id[2];
  byte fee_code[2]
};

int order_execution_au_equities_v1_at;

/* every byte of Order Execution Au Equities V 1 set to one value */
inline fill_order_execution_au_equities_v1(order_execution_au_equities_v1_record, order_execution_au_equities_v1_value) {
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 8 -> order_execution_au_equities_v1_record.transaction_time[order_execution_au_equities_v1_at] = order_execution_au_equities_v1_value; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 2 -> order_execution_au_equities_v1_record.trading_participant_id[order_execution_au_equities_v1_at] = order_execution_au_equities_v1_value; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 20 -> order_execution_au_equities_v1_record.cl_ord_id[order_execution_au_equities_v1_at] = order_execution_au_equities_v1_value; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 8 -> order_execution_au_equities_v1_record.exec_id[order_execution_au_equities_v1_at] = order_execution_au_equities_v1_value; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_record.last_capacity = order_execution_au_equities_v1_value;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 4 -> order_execution_au_equities_v1_record.last_mkt[order_execution_au_equities_v1_at] = order_execution_au_equities_v1_value; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 8 -> order_execution_au_equities_v1_record.last_px[order_execution_au_equities_v1_at] = order_execution_au_equities_v1_value; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 4 -> order_execution_au_equities_v1_record.last_shares[order_execution_au_equities_v1_at] = order_execution_au_equities_v1_value; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_record.side = order_execution_au_equities_v1_value;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 6 -> order_execution_au_equities_v1_record.symbol[order_execution_au_equities_v1_at] = order_execution_au_equities_v1_value; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 4 -> order_execution_au_equities_v1_record.leaves_qty[order_execution_au_equities_v1_at] = order_execution_au_equities_v1_value; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 8 -> order_execution_au_equities_v1_record.secondary_order_id[order_execution_au_equities_v1_at] = order_execution_au_equities_v1_value; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 4 -> order_execution_au_equities_v1_record.clearing_participant_id[order_execution_au_equities_v1_at] = order_execution_au_equities_v1_value; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 8 -> order_execution_au_equities_v1_record.price_improvement[order_execution_au_equities_v1_at] = order_execution_au_equities_v1_value; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 10 -> order_execution_au_equities_v1_record.transact_id[order_execution_au_equities_v1_at] = order_execution_au_equities_v1_value; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_record.on_market_cross_type = order_execution_au_equities_v1_value;
  order_execution_au_equities_v1_record.trade_report_type = order_execution_au_equities_v1_value;
  order_execution_au_equities_v1_record.base_liquidity_indicator = order_execution_au_equities_v1_value;
  order_execution_au_equities_v1_record.sub_liquidity_indicator = order_execution_au_equities_v1_value;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 2 -> order_execution_au_equities_v1_record.contra_participant_id[order_execution_au_equities_v1_at] = order_execution_au_equities_v1_value; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 2 -> order_execution_au_equities_v1_record.fee_code[order_execution_au_equities_v1_at] = order_execution_au_equities_v1_value; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Execution Au Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_order_execution_au_equities_v1(order_execution_au_equities_v1_record, order_execution_au_equities_v1_base) {
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 8 -> order_execution_au_equities_v1_record.transaction_time[order_execution_au_equities_v1_at] = (order_execution_au_equities_v1_base + 0 + order_execution_au_equities_v1_at + 1) % 256; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 2 -> order_execution_au_equities_v1_record.trading_participant_id[order_execution_au_equities_v1_at] = (order_execution_au_equities_v1_base + 8 + order_execution_au_equities_v1_at + 1) % 256; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 20 -> order_execution_au_equities_v1_record.cl_ord_id[order_execution_au_equities_v1_at] = (order_execution_au_equities_v1_base + 10 + order_execution_au_equities_v1_at + 1) % 256; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 8 -> order_execution_au_equities_v1_record.exec_id[order_execution_au_equities_v1_at] = (order_execution_au_equities_v1_base + 30 + order_execution_au_equities_v1_at + 1) % 256; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_record.last_capacity = (order_execution_au_equities_v1_base + 38 + 1) % 256;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 4 -> order_execution_au_equities_v1_record.last_mkt[order_execution_au_equities_v1_at] = (order_execution_au_equities_v1_base + 39 + order_execution_au_equities_v1_at + 1) % 256; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 8 -> order_execution_au_equities_v1_record.last_px[order_execution_au_equities_v1_at] = (order_execution_au_equities_v1_base + 43 + order_execution_au_equities_v1_at + 1) % 256; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 4 -> order_execution_au_equities_v1_record.last_shares[order_execution_au_equities_v1_at] = (order_execution_au_equities_v1_base + 51 + order_execution_au_equities_v1_at + 1) % 256; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_record.side = (order_execution_au_equities_v1_base + 55 + 1) % 256;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 6 -> order_execution_au_equities_v1_record.symbol[order_execution_au_equities_v1_at] = (order_execution_au_equities_v1_base + 56 + order_execution_au_equities_v1_at + 1) % 256; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 4 -> order_execution_au_equities_v1_record.leaves_qty[order_execution_au_equities_v1_at] = (order_execution_au_equities_v1_base + 62 + order_execution_au_equities_v1_at + 1) % 256; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 8 -> order_execution_au_equities_v1_record.secondary_order_id[order_execution_au_equities_v1_at] = (order_execution_au_equities_v1_base + 66 + order_execution_au_equities_v1_at + 1) % 256; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 4 -> order_execution_au_equities_v1_record.clearing_participant_id[order_execution_au_equities_v1_at] = (order_execution_au_equities_v1_base + 74 + order_execution_au_equities_v1_at + 1) % 256; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 8 -> order_execution_au_equities_v1_record.price_improvement[order_execution_au_equities_v1_at] = (order_execution_au_equities_v1_base + 78 + order_execution_au_equities_v1_at + 1) % 256; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 10 -> order_execution_au_equities_v1_record.transact_id[order_execution_au_equities_v1_at] = (order_execution_au_equities_v1_base + 86 + order_execution_au_equities_v1_at + 1) % 256; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_record.on_market_cross_type = (order_execution_au_equities_v1_base + 96 + 1) % 256;
  order_execution_au_equities_v1_record.trade_report_type = (order_execution_au_equities_v1_base + 97 + 1) % 256;
  order_execution_au_equities_v1_record.base_liquidity_indicator = (order_execution_au_equities_v1_base + 98 + 1) % 256;
  order_execution_au_equities_v1_record.sub_liquidity_indicator = (order_execution_au_equities_v1_base + 99 + 1) % 256;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 2 -> order_execution_au_equities_v1_record.contra_participant_id[order_execution_au_equities_v1_at] = (order_execution_au_equities_v1_base + 100 + order_execution_au_equities_v1_at + 1) % 256; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 2 -> order_execution_au_equities_v1_record.fee_code[order_execution_au_equities_v1_at] = (order_execution_au_equities_v1_base + 102 + order_execution_au_equities_v1_at + 1) % 256; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Order Execution Au Equities V 1 to the wire, 104 bytes from where the cursor stands */
inline encode_order_execution_au_equities_v1(order_execution_au_equities_v1_record) {
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 8 -> wire[at] = order_execution_au_equities_v1_record.transaction_time[order_execution_au_equities_v1_at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 2 -> wire[at] = order_execution_au_equities_v1_record.trading_participant_id[order_execution_au_equities_v1_at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 20 -> wire[at] = order_execution_au_equities_v1_record.cl_ord_id[order_execution_au_equities_v1_at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 8 -> wire[at] = order_execution_au_equities_v1_record.exec_id[order_execution_au_equities_v1_at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_au_equities_v1_record.last_capacity; at = at + 1;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 4 -> wire[at] = order_execution_au_equities_v1_record.last_mkt[order_execution_au_equities_v1_at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 8 -> wire[at] = order_execution_au_equities_v1_record.last_px[order_execution_au_equities_v1_at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 4 -> wire[at] = order_execution_au_equities_v1_record.last_shares[order_execution_au_equities_v1_at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_au_equities_v1_record.side; at = at + 1;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 6 -> wire[at] = order_execution_au_equities_v1_record.symbol[order_execution_au_equities_v1_at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 4 -> wire[at] = order_execution_au_equities_v1_record.leaves_qty[order_execution_au_equities_v1_at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 8 -> wire[at] = order_execution_au_equities_v1_record.secondary_order_id[order_execution_au_equities_v1_at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 4 -> wire[at] = order_execution_au_equities_v1_record.clearing_participant_id[order_execution_au_equities_v1_at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 8 -> wire[at] = order_execution_au_equities_v1_record.price_improvement[order_execution_au_equities_v1_at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 10 -> wire[at] = order_execution_au_equities_v1_record.transact_id[order_execution_au_equities_v1_at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_au_equities_v1_record.on_market_cross_type; at = at + 1;
  wire[at] = order_execution_au_equities_v1_record.trade_report_type; at = at + 1;
  wire[at] = order_execution_au_equities_v1_record.base_liquidity_indicator; at = at + 1;
  wire[at] = order_execution_au_equities_v1_record.sub_liquidity_indicator; at = at + 1;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 2 -> wire[at] = order_execution_au_equities_v1_record.contra_participant_id[order_execution_au_equities_v1_at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 2 -> wire[at] = order_execution_au_equities_v1_record.fee_code[order_execution_au_equities_v1_at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Order Execution Au Equities V 1 off the wire, 104 bytes from where the cursor stands */
inline decode_order_execution_au_equities_v1(order_execution_au_equities_v1_record) {
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 8 -> order_execution_au_equities_v1_record.transaction_time[order_execution_au_equities_v1_at] = wire[at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 2 -> order_execution_au_equities_v1_record.trading_participant_id[order_execution_au_equities_v1_at] = wire[at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 20 -> order_execution_au_equities_v1_record.cl_ord_id[order_execution_au_equities_v1_at] = wire[at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 8 -> order_execution_au_equities_v1_record.exec_id[order_execution_au_equities_v1_at] = wire[at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_record.last_capacity = wire[at]; at = at + 1;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 4 -> order_execution_au_equities_v1_record.last_mkt[order_execution_au_equities_v1_at] = wire[at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 8 -> order_execution_au_equities_v1_record.last_px[order_execution_au_equities_v1_at] = wire[at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 4 -> order_execution_au_equities_v1_record.last_shares[order_execution_au_equities_v1_at] = wire[at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_record.side = wire[at]; at = at + 1;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 6 -> order_execution_au_equities_v1_record.symbol[order_execution_au_equities_v1_at] = wire[at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 4 -> order_execution_au_equities_v1_record.leaves_qty[order_execution_au_equities_v1_at] = wire[at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 8 -> order_execution_au_equities_v1_record.secondary_order_id[order_execution_au_equities_v1_at] = wire[at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 4 -> order_execution_au_equities_v1_record.clearing_participant_id[order_execution_au_equities_v1_at] = wire[at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 8 -> order_execution_au_equities_v1_record.price_improvement[order_execution_au_equities_v1_at] = wire[at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 10 -> order_execution_au_equities_v1_record.transact_id[order_execution_au_equities_v1_at] = wire[at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_record.on_market_cross_type = wire[at]; at = at + 1;
  order_execution_au_equities_v1_record.trade_report_type = wire[at]; at = at + 1;
  order_execution_au_equities_v1_record.base_liquidity_indicator = wire[at]; at = at + 1;
  order_execution_au_equities_v1_record.sub_liquidity_indicator = wire[at]; at = at + 1;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 2 -> order_execution_au_equities_v1_record.contra_participant_id[order_execution_au_equities_v1_at] = wire[at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 2 -> order_execution_au_equities_v1_record.fee_code[order_execution_au_equities_v1_at] = wire[at]; at = at + 1; order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Execution Au Equities V 1 is what was written, byte for byte */
inline equal_order_execution_au_equities_v1(order_execution_au_equities_v1_read, order_execution_au_equities_v1_written) {
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 8 -> assert(order_execution_au_equities_v1_read.transaction_time[order_execution_au_equities_v1_at] == order_execution_au_equities_v1_written.transaction_time[order_execution_au_equities_v1_at]); order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 2 -> assert(order_execution_au_equities_v1_read.trading_participant_id[order_execution_au_equities_v1_at] == order_execution_au_equities_v1_written.trading_participant_id[order_execution_au_equities_v1_at]); order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 20 -> assert(order_execution_au_equities_v1_read.cl_ord_id[order_execution_au_equities_v1_at] == order_execution_au_equities_v1_written.cl_ord_id[order_execution_au_equities_v1_at]); order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 8 -> assert(order_execution_au_equities_v1_read.exec_id[order_execution_au_equities_v1_at] == order_execution_au_equities_v1_written.exec_id[order_execution_au_equities_v1_at]); order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_execution_au_equities_v1_read.last_capacity == order_execution_au_equities_v1_written.last_capacity);
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 4 -> assert(order_execution_au_equities_v1_read.last_mkt[order_execution_au_equities_v1_at] == order_execution_au_equities_v1_written.last_mkt[order_execution_au_equities_v1_at]); order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 8 -> assert(order_execution_au_equities_v1_read.last_px[order_execution_au_equities_v1_at] == order_execution_au_equities_v1_written.last_px[order_execution_au_equities_v1_at]); order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 4 -> assert(order_execution_au_equities_v1_read.last_shares[order_execution_au_equities_v1_at] == order_execution_au_equities_v1_written.last_shares[order_execution_au_equities_v1_at]); order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_execution_au_equities_v1_read.side == order_execution_au_equities_v1_written.side);
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 6 -> assert(order_execution_au_equities_v1_read.symbol[order_execution_au_equities_v1_at] == order_execution_au_equities_v1_written.symbol[order_execution_au_equities_v1_at]); order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 4 -> assert(order_execution_au_equities_v1_read.leaves_qty[order_execution_au_equities_v1_at] == order_execution_au_equities_v1_written.leaves_qty[order_execution_au_equities_v1_at]); order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 8 -> assert(order_execution_au_equities_v1_read.secondary_order_id[order_execution_au_equities_v1_at] == order_execution_au_equities_v1_written.secondary_order_id[order_execution_au_equities_v1_at]); order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 4 -> assert(order_execution_au_equities_v1_read.clearing_participant_id[order_execution_au_equities_v1_at] == order_execution_au_equities_v1_written.clearing_participant_id[order_execution_au_equities_v1_at]); order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 8 -> assert(order_execution_au_equities_v1_read.price_improvement[order_execution_au_equities_v1_at] == order_execution_au_equities_v1_written.price_improvement[order_execution_au_equities_v1_at]); order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 10 -> assert(order_execution_au_equities_v1_read.transact_id[order_execution_au_equities_v1_at] == order_execution_au_equities_v1_written.transact_id[order_execution_au_equities_v1_at]); order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_execution_au_equities_v1_read.on_market_cross_type == order_execution_au_equities_v1_written.on_market_cross_type);
  assert(order_execution_au_equities_v1_read.trade_report_type == order_execution_au_equities_v1_written.trade_report_type);
  assert(order_execution_au_equities_v1_read.base_liquidity_indicator == order_execution_au_equities_v1_written.base_liquidity_indicator);
  assert(order_execution_au_equities_v1_read.sub_liquidity_indicator == order_execution_au_equities_v1_written.sub_liquidity_indicator);
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 2 -> assert(order_execution_au_equities_v1_read.contra_participant_id[order_execution_au_equities_v1_at] == order_execution_au_equities_v1_written.contra_participant_id[order_execution_au_equities_v1_at]); order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_au_equities_v1_at = 0;
  do
  :: order_execution_au_equities_v1_at < 2 -> assert(order_execution_au_equities_v1_read.fee_code[order_execution_au_equities_v1_at] == order_execution_au_equities_v1_written.fee_code[order_execution_au_equities_v1_at]); order_execution_au_equities_v1_at = order_execution_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancelled Au Equities V 1: 31 bytes ------------------------------- */

/* Order Cancelled message */
typedef OrderCancelledAuEquitiesV1 {
  byte transaction_time[8];
  byte trading_participant_id[2];
  byte cl_ord_id[20];
  byte cancel_reason
};

int order_cancelled_au_equities_v1_at;

/* every byte of Order Cancelled Au Equities V 1 set to one value */
inline fill_order_cancelled_au_equities_v1(order_cancelled_au_equities_v1_record, order_cancelled_au_equities_v1_value) {
  order_cancelled_au_equities_v1_at = 0;
  do
  :: order_cancelled_au_equities_v1_at < 8 -> order_cancelled_au_equities_v1_record.transaction_time[order_cancelled_au_equities_v1_at] = order_cancelled_au_equities_v1_value; order_cancelled_au_equities_v1_at = order_cancelled_au_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_au_equities_v1_at = 0;
  do
  :: order_cancelled_au_equities_v1_at < 2 -> order_cancelled_au_equities_v1_record.trading_participant_id[order_cancelled_au_equities_v1_at] = order_cancelled_au_equities_v1_value; order_cancelled_au_equities_v1_at = order_cancelled_au_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_au_equities_v1_at = 0;
  do
  :: order_cancelled_au_equities_v1_at < 20 -> order_cancelled_au_equities_v1_record.cl_ord_id[order_cancelled_au_equities_v1_at] = order_cancelled_au_equities_v1_value; order_cancelled_au_equities_v1_at = order_cancelled_au_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_au_equities_v1_record.cancel_reason = order_cancelled_au_equities_v1_value;
  skip
}

/* each byte of Order Cancelled Au Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_order_cancelled_au_equities_v1(order_cancelled_au_equities_v1_record, order_cancelled_au_equities_v1_base) {
  order_cancelled_au_equities_v1_at = 0;
  do
  :: order_cancelled_au_equities_v1_at < 8 -> order_cancelled_au_equities_v1_record.transaction_time[order_cancelled_au_equities_v1_at] = (order_cancelled_au_equities_v1_base + 0 + order_cancelled_au_equities_v1_at + 1) % 256; order_cancelled_au_equities_v1_at = order_cancelled_au_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_au_equities_v1_at = 0;
  do
  :: order_cancelled_au_equities_v1_at < 2 -> order_cancelled_au_equities_v1_record.trading_participant_id[order_cancelled_au_equities_v1_at] = (order_cancelled_au_equities_v1_base + 8 + order_cancelled_au_equities_v1_at + 1) % 256; order_cancelled_au_equities_v1_at = order_cancelled_au_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_au_equities_v1_at = 0;
  do
  :: order_cancelled_au_equities_v1_at < 20 -> order_cancelled_au_equities_v1_record.cl_ord_id[order_cancelled_au_equities_v1_at] = (order_cancelled_au_equities_v1_base + 10 + order_cancelled_au_equities_v1_at + 1) % 256; order_cancelled_au_equities_v1_at = order_cancelled_au_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_au_equities_v1_record.cancel_reason = (order_cancelled_au_equities_v1_base + 30 + 1) % 256;
  skip
}

/* Order Cancelled Au Equities V 1 to the wire, 31 bytes from where the cursor stands */
inline encode_order_cancelled_au_equities_v1(order_cancelled_au_equities_v1_record) {
  order_cancelled_au_equities_v1_at = 0;
  do
  :: order_cancelled_au_equities_v1_at < 8 -> wire[at] = order_cancelled_au_equities_v1_record.transaction_time[order_cancelled_au_equities_v1_at]; at = at + 1; order_cancelled_au_equities_v1_at = order_cancelled_au_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_au_equities_v1_at = 0;
  do
  :: order_cancelled_au_equities_v1_at < 2 -> wire[at] = order_cancelled_au_equities_v1_record.trading_participant_id[order_cancelled_au_equities_v1_at]; at = at + 1; order_cancelled_au_equities_v1_at = order_cancelled_au_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_au_equities_v1_at = 0;
  do
  :: order_cancelled_au_equities_v1_at < 20 -> wire[at] = order_cancelled_au_equities_v1_record.cl_ord_id[order_cancelled_au_equities_v1_at]; at = at + 1; order_cancelled_au_equities_v1_at = order_cancelled_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_cancelled_au_equities_v1_record.cancel_reason; at = at + 1;
  skip
}

/* Order Cancelled Au Equities V 1 off the wire, 31 bytes from where the cursor stands */
inline decode_order_cancelled_au_equities_v1(order_cancelled_au_equities_v1_record) {
  order_cancelled_au_equities_v1_at = 0;
  do
  :: order_cancelled_au_equities_v1_at < 8 -> order_cancelled_au_equities_v1_record.transaction_time[order_cancelled_au_equities_v1_at] = wire[at]; at = at + 1; order_cancelled_au_equities_v1_at = order_cancelled_au_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_au_equities_v1_at = 0;
  do
  :: order_cancelled_au_equities_v1_at < 2 -> order_cancelled_au_equities_v1_record.trading_participant_id[order_cancelled_au_equities_v1_at] = wire[at]; at = at + 1; order_cancelled_au_equities_v1_at = order_cancelled_au_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_au_equities_v1_at = 0;
  do
  :: order_cancelled_au_equities_v1_at < 20 -> order_cancelled_au_equities_v1_record.cl_ord_id[order_cancelled_au_equities_v1_at] = wire[at]; at = at + 1; order_cancelled_au_equities_v1_at = order_cancelled_au_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_au_equities_v1_record.cancel_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Cancelled Au Equities V 1 is what was written, byte for byte */
inline equal_order_cancelled_au_equities_v1(order_cancelled_au_equities_v1_read, order_cancelled_au_equities_v1_written) {
  order_cancelled_au_equities_v1_at = 0;
  do
  :: order_cancelled_au_equities_v1_at < 8 -> assert(order_cancelled_au_equities_v1_read.transaction_time[order_cancelled_au_equities_v1_at] == order_cancelled_au_equities_v1_written.transaction_time[order_cancelled_au_equities_v1_at]); order_cancelled_au_equities_v1_at = order_cancelled_au_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_au_equities_v1_at = 0;
  do
  :: order_cancelled_au_equities_v1_at < 2 -> assert(order_cancelled_au_equities_v1_read.trading_participant_id[order_cancelled_au_equities_v1_at] == order_cancelled_au_equities_v1_written.trading_participant_id[order_cancelled_au_equities_v1_at]); order_cancelled_au_equities_v1_at = order_cancelled_au_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_au_equities_v1_at = 0;
  do
  :: order_cancelled_au_equities_v1_at < 20 -> assert(order_cancelled_au_equities_v1_read.cl_ord_id[order_cancelled_au_equities_v1_at] == order_cancelled_au_equities_v1_written.cl_ord_id[order_cancelled_au_equities_v1_at]); order_cancelled_au_equities_v1_at = order_cancelled_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_cancelled_au_equities_v1_read.cancel_reason == order_cancelled_au_equities_v1_written.cancel_reason);
  skip
}

/* ---- Cancel Rejected Au Equities V 1: 91 bytes ------------------------------- */

/* A Cancel Rejected message is sent in response to a Cancel Order message to indicate that the cancellation cannot occur */
typedef CancelRejectedAuEquitiesV1 {
  byte transaction_time[8];
  byte trading_participant_id[2];
  byte cl_ord_id[20];
  byte cancel_reject_reason;
  byte text[60]
};

int cancel_rejected_au_equities_v1_at;

/* every byte of Cancel Rejected Au Equities V 1 set to one value */
inline fill_cancel_rejected_au_equities_v1(cancel_rejected_au_equities_v1_record, cancel_rejected_au_equities_v1_value) {
  cancel_rejected_au_equities_v1_at = 0;
  do
  :: cancel_rejected_au_equities_v1_at < 8 -> cancel_rejected_au_equities_v1_record.transaction_time[cancel_rejected_au_equities_v1_at] = cancel_rejected_au_equities_v1_value; cancel_rejected_au_equities_v1_at = cancel_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_au_equities_v1_at = 0;
  do
  :: cancel_rejected_au_equities_v1_at < 2 -> cancel_rejected_au_equities_v1_record.trading_participant_id[cancel_rejected_au_equities_v1_at] = cancel_rejected_au_equities_v1_value; cancel_rejected_au_equities_v1_at = cancel_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_au_equities_v1_at = 0;
  do
  :: cancel_rejected_au_equities_v1_at < 20 -> cancel_rejected_au_equities_v1_record.cl_ord_id[cancel_rejected_au_equities_v1_at] = cancel_rejected_au_equities_v1_value; cancel_rejected_au_equities_v1_at = cancel_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_au_equities_v1_record.cancel_reject_reason = cancel_rejected_au_equities_v1_value;
  cancel_rejected_au_equities_v1_at = 0;
  do
  :: cancel_rejected_au_equities_v1_at < 60 -> cancel_rejected_au_equities_v1_record.text[cancel_rejected_au_equities_v1_at] = cancel_rejected_au_equities_v1_value; cancel_rejected_au_equities_v1_at = cancel_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Rejected Au Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_cancel_rejected_au_equities_v1(cancel_rejected_au_equities_v1_record, cancel_rejected_au_equities_v1_base) {
  cancel_rejected_au_equities_v1_at = 0;
  do
  :: cancel_rejected_au_equities_v1_at < 8 -> cancel_rejected_au_equities_v1_record.transaction_time[cancel_rejected_au_equities_v1_at] = (cancel_rejected_au_equities_v1_base + 0 + cancel_rejected_au_equities_v1_at + 1) % 256; cancel_rejected_au_equities_v1_at = cancel_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_au_equities_v1_at = 0;
  do
  :: cancel_rejected_au_equities_v1_at < 2 -> cancel_rejected_au_equities_v1_record.trading_participant_id[cancel_rejected_au_equities_v1_at] = (cancel_rejected_au_equities_v1_base + 8 + cancel_rejected_au_equities_v1_at + 1) % 256; cancel_rejected_au_equities_v1_at = cancel_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_au_equities_v1_at = 0;
  do
  :: cancel_rejected_au_equities_v1_at < 20 -> cancel_rejected_au_equities_v1_record.cl_ord_id[cancel_rejected_au_equities_v1_at] = (cancel_rejected_au_equities_v1_base + 10 + cancel_rejected_au_equities_v1_at + 1) % 256; cancel_rejected_au_equities_v1_at = cancel_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_au_equities_v1_record.cancel_reject_reason = (cancel_rejected_au_equities_v1_base + 30 + 1) % 256;
  cancel_rejected_au_equities_v1_at = 0;
  do
  :: cancel_rejected_au_equities_v1_at < 60 -> cancel_rejected_au_equities_v1_record.text[cancel_rejected_au_equities_v1_at] = (cancel_rejected_au_equities_v1_base + 31 + cancel_rejected_au_equities_v1_at + 1) % 256; cancel_rejected_au_equities_v1_at = cancel_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Rejected Au Equities V 1 to the wire, 91 bytes from where the cursor stands */
inline encode_cancel_rejected_au_equities_v1(cancel_rejected_au_equities_v1_record) {
  cancel_rejected_au_equities_v1_at = 0;
  do
  :: cancel_rejected_au_equities_v1_at < 8 -> wire[at] = cancel_rejected_au_equities_v1_record.transaction_time[cancel_rejected_au_equities_v1_at]; at = at + 1; cancel_rejected_au_equities_v1_at = cancel_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_au_equities_v1_at = 0;
  do
  :: cancel_rejected_au_equities_v1_at < 2 -> wire[at] = cancel_rejected_au_equities_v1_record.trading_participant_id[cancel_rejected_au_equities_v1_at]; at = at + 1; cancel_rejected_au_equities_v1_at = cancel_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_au_equities_v1_at = 0;
  do
  :: cancel_rejected_au_equities_v1_at < 20 -> wire[at] = cancel_rejected_au_equities_v1_record.cl_ord_id[cancel_rejected_au_equities_v1_at]; at = at + 1; cancel_rejected_au_equities_v1_at = cancel_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = cancel_rejected_au_equities_v1_record.cancel_reject_reason; at = at + 1;
  cancel_rejected_au_equities_v1_at = 0;
  do
  :: cancel_rejected_au_equities_v1_at < 60 -> wire[at] = cancel_rejected_au_equities_v1_record.text[cancel_rejected_au_equities_v1_at]; at = at + 1; cancel_rejected_au_equities_v1_at = cancel_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Rejected Au Equities V 1 off the wire, 91 bytes from where the cursor stands */
inline decode_cancel_rejected_au_equities_v1(cancel_rejected_au_equities_v1_record) {
  cancel_rejected_au_equities_v1_at = 0;
  do
  :: cancel_rejected_au_equities_v1_at < 8 -> cancel_rejected_au_equities_v1_record.transaction_time[cancel_rejected_au_equities_v1_at] = wire[at]; at = at + 1; cancel_rejected_au_equities_v1_at = cancel_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_au_equities_v1_at = 0;
  do
  :: cancel_rejected_au_equities_v1_at < 2 -> cancel_rejected_au_equities_v1_record.trading_participant_id[cancel_rejected_au_equities_v1_at] = wire[at]; at = at + 1; cancel_rejected_au_equities_v1_at = cancel_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_au_equities_v1_at = 0;
  do
  :: cancel_rejected_au_equities_v1_at < 20 -> cancel_rejected_au_equities_v1_record.cl_ord_id[cancel_rejected_au_equities_v1_at] = wire[at]; at = at + 1; cancel_rejected_au_equities_v1_at = cancel_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_au_equities_v1_record.cancel_reject_reason = wire[at]; at = at + 1;
  cancel_rejected_au_equities_v1_at = 0;
  do
  :: cancel_rejected_au_equities_v1_at < 60 -> cancel_rejected_au_equities_v1_record.text[cancel_rejected_au_equities_v1_at] = wire[at]; at = at + 1; cancel_rejected_au_equities_v1_at = cancel_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Rejected Au Equities V 1 is what was written, byte for byte */
inline equal_cancel_rejected_au_equities_v1(cancel_rejected_au_equities_v1_read, cancel_rejected_au_equities_v1_written) {
  cancel_rejected_au_equities_v1_at = 0;
  do
  :: cancel_rejected_au_equities_v1_at < 8 -> assert(cancel_rejected_au_equities_v1_read.transaction_time[cancel_rejected_au_equities_v1_at] == cancel_rejected_au_equities_v1_written.transaction_time[cancel_rejected_au_equities_v1_at]); cancel_rejected_au_equities_v1_at = cancel_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_au_equities_v1_at = 0;
  do
  :: cancel_rejected_au_equities_v1_at < 2 -> assert(cancel_rejected_au_equities_v1_read.trading_participant_id[cancel_rejected_au_equities_v1_at] == cancel_rejected_au_equities_v1_written.trading_participant_id[cancel_rejected_au_equities_v1_at]); cancel_rejected_au_equities_v1_at = cancel_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_au_equities_v1_at = 0;
  do
  :: cancel_rejected_au_equities_v1_at < 20 -> assert(cancel_rejected_au_equities_v1_read.cl_ord_id[cancel_rejected_au_equities_v1_at] == cancel_rejected_au_equities_v1_written.cl_ord_id[cancel_rejected_au_equities_v1_at]); cancel_rejected_au_equities_v1_at = cancel_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(cancel_rejected_au_equities_v1_read.cancel_reject_reason == cancel_rejected_au_equities_v1_written.cancel_reject_reason);
  cancel_rejected_au_equities_v1_at = 0;
  do
  :: cancel_rejected_au_equities_v1_at < 60 -> assert(cancel_rejected_au_equities_v1_read.text[cancel_rejected_au_equities_v1_at] == cancel_rejected_au_equities_v1_written.text[cancel_rejected_au_equities_v1_at]); cancel_rejected_au_equities_v1_at = cancel_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Execution Restatement Au Equities V 1: 73 bytes ------------------------- */

/* Order Execution Restated messages will be issued for all (unbroken) fills of MOC orders after the closing price has been determined */
typedef ExecutionRestatementAuEquitiesV1 {
  byte transaction_time[8];
  byte trading_participant_id[2];
  byte cl_ord_id[20];
  byte exec_id[8];
  byte last_px[8];
  byte last_shares[4];
  byte side;
  byte symbol[6];
  byte transact_id[10];
  byte base_liquidity_indicator;
  byte contra_participant_id[2];
  byte fee_code[2];
  byte exec_restatement_reason
};

int execution_restatement_au_equities_v1_at;

/* every byte of Execution Restatement Au Equities V 1 set to one value */
inline fill_execution_restatement_au_equities_v1(execution_restatement_au_equities_v1_record, execution_restatement_au_equities_v1_value) {
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 8 -> execution_restatement_au_equities_v1_record.transaction_time[execution_restatement_au_equities_v1_at] = execution_restatement_au_equities_v1_value; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 2 -> execution_restatement_au_equities_v1_record.trading_participant_id[execution_restatement_au_equities_v1_at] = execution_restatement_au_equities_v1_value; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 20 -> execution_restatement_au_equities_v1_record.cl_ord_id[execution_restatement_au_equities_v1_at] = execution_restatement_au_equities_v1_value; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 8 -> execution_restatement_au_equities_v1_record.exec_id[execution_restatement_au_equities_v1_at] = execution_restatement_au_equities_v1_value; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 8 -> execution_restatement_au_equities_v1_record.last_px[execution_restatement_au_equities_v1_at] = execution_restatement_au_equities_v1_value; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 4 -> execution_restatement_au_equities_v1_record.last_shares[execution_restatement_au_equities_v1_at] = execution_restatement_au_equities_v1_value; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_record.side = execution_restatement_au_equities_v1_value;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 6 -> execution_restatement_au_equities_v1_record.symbol[execution_restatement_au_equities_v1_at] = execution_restatement_au_equities_v1_value; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 10 -> execution_restatement_au_equities_v1_record.transact_id[execution_restatement_au_equities_v1_at] = execution_restatement_au_equities_v1_value; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_record.base_liquidity_indicator = execution_restatement_au_equities_v1_value;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 2 -> execution_restatement_au_equities_v1_record.contra_participant_id[execution_restatement_au_equities_v1_at] = execution_restatement_au_equities_v1_value; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 2 -> execution_restatement_au_equities_v1_record.fee_code[execution_restatement_au_equities_v1_at] = execution_restatement_au_equities_v1_value; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_record.exec_restatement_reason = execution_restatement_au_equities_v1_value;
  skip
}

/* each byte of Execution Restatement Au Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_execution_restatement_au_equities_v1(execution_restatement_au_equities_v1_record, execution_restatement_au_equities_v1_base) {
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 8 -> execution_restatement_au_equities_v1_record.transaction_time[execution_restatement_au_equities_v1_at] = (execution_restatement_au_equities_v1_base + 0 + execution_restatement_au_equities_v1_at + 1) % 256; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 2 -> execution_restatement_au_equities_v1_record.trading_participant_id[execution_restatement_au_equities_v1_at] = (execution_restatement_au_equities_v1_base + 8 + execution_restatement_au_equities_v1_at + 1) % 256; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 20 -> execution_restatement_au_equities_v1_record.cl_ord_id[execution_restatement_au_equities_v1_at] = (execution_restatement_au_equities_v1_base + 10 + execution_restatement_au_equities_v1_at + 1) % 256; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 8 -> execution_restatement_au_equities_v1_record.exec_id[execution_restatement_au_equities_v1_at] = (execution_restatement_au_equities_v1_base + 30 + execution_restatement_au_equities_v1_at + 1) % 256; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 8 -> execution_restatement_au_equities_v1_record.last_px[execution_restatement_au_equities_v1_at] = (execution_restatement_au_equities_v1_base + 38 + execution_restatement_au_equities_v1_at + 1) % 256; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 4 -> execution_restatement_au_equities_v1_record.last_shares[execution_restatement_au_equities_v1_at] = (execution_restatement_au_equities_v1_base + 46 + execution_restatement_au_equities_v1_at + 1) % 256; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_record.side = (execution_restatement_au_equities_v1_base + 50 + 1) % 256;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 6 -> execution_restatement_au_equities_v1_record.symbol[execution_restatement_au_equities_v1_at] = (execution_restatement_au_equities_v1_base + 51 + execution_restatement_au_equities_v1_at + 1) % 256; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 10 -> execution_restatement_au_equities_v1_record.transact_id[execution_restatement_au_equities_v1_at] = (execution_restatement_au_equities_v1_base + 57 + execution_restatement_au_equities_v1_at + 1) % 256; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_record.base_liquidity_indicator = (execution_restatement_au_equities_v1_base + 67 + 1) % 256;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 2 -> execution_restatement_au_equities_v1_record.contra_participant_id[execution_restatement_au_equities_v1_at] = (execution_restatement_au_equities_v1_base + 68 + execution_restatement_au_equities_v1_at + 1) % 256; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 2 -> execution_restatement_au_equities_v1_record.fee_code[execution_restatement_au_equities_v1_at] = (execution_restatement_au_equities_v1_base + 70 + execution_restatement_au_equities_v1_at + 1) % 256; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_record.exec_restatement_reason = (execution_restatement_au_equities_v1_base + 72 + 1) % 256;
  skip
}

/* Execution Restatement Au Equities V 1 to the wire, 73 bytes from where the cursor stands */
inline encode_execution_restatement_au_equities_v1(execution_restatement_au_equities_v1_record) {
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 8 -> wire[at] = execution_restatement_au_equities_v1_record.transaction_time[execution_restatement_au_equities_v1_at]; at = at + 1; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 2 -> wire[at] = execution_restatement_au_equities_v1_record.trading_participant_id[execution_restatement_au_equities_v1_at]; at = at + 1; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 20 -> wire[at] = execution_restatement_au_equities_v1_record.cl_ord_id[execution_restatement_au_equities_v1_at]; at = at + 1; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 8 -> wire[at] = execution_restatement_au_equities_v1_record.exec_id[execution_restatement_au_equities_v1_at]; at = at + 1; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 8 -> wire[at] = execution_restatement_au_equities_v1_record.last_px[execution_restatement_au_equities_v1_at]; at = at + 1; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 4 -> wire[at] = execution_restatement_au_equities_v1_record.last_shares[execution_restatement_au_equities_v1_at]; at = at + 1; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = execution_restatement_au_equities_v1_record.side; at = at + 1;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 6 -> wire[at] = execution_restatement_au_equities_v1_record.symbol[execution_restatement_au_equities_v1_at]; at = at + 1; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 10 -> wire[at] = execution_restatement_au_equities_v1_record.transact_id[execution_restatement_au_equities_v1_at]; at = at + 1; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = execution_restatement_au_equities_v1_record.base_liquidity_indicator; at = at + 1;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 2 -> wire[at] = execution_restatement_au_equities_v1_record.contra_participant_id[execution_restatement_au_equities_v1_at]; at = at + 1; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 2 -> wire[at] = execution_restatement_au_equities_v1_record.fee_code[execution_restatement_au_equities_v1_at]; at = at + 1; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = execution_restatement_au_equities_v1_record.exec_restatement_reason; at = at + 1;
  skip
}

/* Execution Restatement Au Equities V 1 off the wire, 73 bytes from where the cursor stands */
inline decode_execution_restatement_au_equities_v1(execution_restatement_au_equities_v1_record) {
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 8 -> execution_restatement_au_equities_v1_record.transaction_time[execution_restatement_au_equities_v1_at] = wire[at]; at = at + 1; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 2 -> execution_restatement_au_equities_v1_record.trading_participant_id[execution_restatement_au_equities_v1_at] = wire[at]; at = at + 1; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 20 -> execution_restatement_au_equities_v1_record.cl_ord_id[execution_restatement_au_equities_v1_at] = wire[at]; at = at + 1; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 8 -> execution_restatement_au_equities_v1_record.exec_id[execution_restatement_au_equities_v1_at] = wire[at]; at = at + 1; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 8 -> execution_restatement_au_equities_v1_record.last_px[execution_restatement_au_equities_v1_at] = wire[at]; at = at + 1; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 4 -> execution_restatement_au_equities_v1_record.last_shares[execution_restatement_au_equities_v1_at] = wire[at]; at = at + 1; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_record.side = wire[at]; at = at + 1;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 6 -> execution_restatement_au_equities_v1_record.symbol[execution_restatement_au_equities_v1_at] = wire[at]; at = at + 1; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 10 -> execution_restatement_au_equities_v1_record.transact_id[execution_restatement_au_equities_v1_at] = wire[at]; at = at + 1; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_record.base_liquidity_indicator = wire[at]; at = at + 1;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 2 -> execution_restatement_au_equities_v1_record.contra_participant_id[execution_restatement_au_equities_v1_at] = wire[at]; at = at + 1; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 2 -> execution_restatement_au_equities_v1_record.fee_code[execution_restatement_au_equities_v1_at] = wire[at]; at = at + 1; execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_record.exec_restatement_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Execution Restatement Au Equities V 1 is what was written, byte for byte */
inline equal_execution_restatement_au_equities_v1(execution_restatement_au_equities_v1_read, execution_restatement_au_equities_v1_written) {
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 8 -> assert(execution_restatement_au_equities_v1_read.transaction_time[execution_restatement_au_equities_v1_at] == execution_restatement_au_equities_v1_written.transaction_time[execution_restatement_au_equities_v1_at]); execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 2 -> assert(execution_restatement_au_equities_v1_read.trading_participant_id[execution_restatement_au_equities_v1_at] == execution_restatement_au_equities_v1_written.trading_participant_id[execution_restatement_au_equities_v1_at]); execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 20 -> assert(execution_restatement_au_equities_v1_read.cl_ord_id[execution_restatement_au_equities_v1_at] == execution_restatement_au_equities_v1_written.cl_ord_id[execution_restatement_au_equities_v1_at]); execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 8 -> assert(execution_restatement_au_equities_v1_read.exec_id[execution_restatement_au_equities_v1_at] == execution_restatement_au_equities_v1_written.exec_id[execution_restatement_au_equities_v1_at]); execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 8 -> assert(execution_restatement_au_equities_v1_read.last_px[execution_restatement_au_equities_v1_at] == execution_restatement_au_equities_v1_written.last_px[execution_restatement_au_equities_v1_at]); execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 4 -> assert(execution_restatement_au_equities_v1_read.last_shares[execution_restatement_au_equities_v1_at] == execution_restatement_au_equities_v1_written.last_shares[execution_restatement_au_equities_v1_at]); execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(execution_restatement_au_equities_v1_read.side == execution_restatement_au_equities_v1_written.side);
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 6 -> assert(execution_restatement_au_equities_v1_read.symbol[execution_restatement_au_equities_v1_at] == execution_restatement_au_equities_v1_written.symbol[execution_restatement_au_equities_v1_at]); execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 10 -> assert(execution_restatement_au_equities_v1_read.transact_id[execution_restatement_au_equities_v1_at] == execution_restatement_au_equities_v1_written.transact_id[execution_restatement_au_equities_v1_at]); execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(execution_restatement_au_equities_v1_read.base_liquidity_indicator == execution_restatement_au_equities_v1_written.base_liquidity_indicator);
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 2 -> assert(execution_restatement_au_equities_v1_read.contra_participant_id[execution_restatement_au_equities_v1_at] == execution_restatement_au_equities_v1_written.contra_participant_id[execution_restatement_au_equities_v1_at]); execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  execution_restatement_au_equities_v1_at = 0;
  do
  :: execution_restatement_au_equities_v1_at < 2 -> assert(execution_restatement_au_equities_v1_read.fee_code[execution_restatement_au_equities_v1_at] == execution_restatement_au_equities_v1_written.fee_code[execution_restatement_au_equities_v1_at]); execution_restatement_au_equities_v1_at = execution_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(execution_restatement_au_equities_v1_read.exec_restatement_reason == execution_restatement_au_equities_v1_written.exec_restatement_reason);
  skip
}

/* ---- Purge Acknowledgement Au Equities V 1: 32 bytes ------------------------- */

/* A Purge Acknowledgment is an unsequenced message sent when a Purge Orders message requesting an order purge has completed cancelling all individual orders */
typedef PurgeAcknowledgementAuEquitiesV1 {
  byte transaction_time[8];
  byte mass_cancel_id[20];
  byte cancelled_order_count[4]
};

int purge_acknowledgement_au_equities_v1_at;

/* every byte of Purge Acknowledgement Au Equities V 1 set to one value */
inline fill_purge_acknowledgement_au_equities_v1(purge_acknowledgement_au_equities_v1_record, purge_acknowledgement_au_equities_v1_value) {
  purge_acknowledgement_au_equities_v1_at = 0;
  do
  :: purge_acknowledgement_au_equities_v1_at < 8 -> purge_acknowledgement_au_equities_v1_record.transaction_time[purge_acknowledgement_au_equities_v1_at] = purge_acknowledgement_au_equities_v1_value; purge_acknowledgement_au_equities_v1_at = purge_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_au_equities_v1_at = 0;
  do
  :: purge_acknowledgement_au_equities_v1_at < 20 -> purge_acknowledgement_au_equities_v1_record.mass_cancel_id[purge_acknowledgement_au_equities_v1_at] = purge_acknowledgement_au_equities_v1_value; purge_acknowledgement_au_equities_v1_at = purge_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_au_equities_v1_at = 0;
  do
  :: purge_acknowledgement_au_equities_v1_at < 4 -> purge_acknowledgement_au_equities_v1_record.cancelled_order_count[purge_acknowledgement_au_equities_v1_at] = purge_acknowledgement_au_equities_v1_value; purge_acknowledgement_au_equities_v1_at = purge_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Purge Acknowledgement Au Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_purge_acknowledgement_au_equities_v1(purge_acknowledgement_au_equities_v1_record, purge_acknowledgement_au_equities_v1_base) {
  purge_acknowledgement_au_equities_v1_at = 0;
  do
  :: purge_acknowledgement_au_equities_v1_at < 8 -> purge_acknowledgement_au_equities_v1_record.transaction_time[purge_acknowledgement_au_equities_v1_at] = (purge_acknowledgement_au_equities_v1_base + 0 + purge_acknowledgement_au_equities_v1_at + 1) % 256; purge_acknowledgement_au_equities_v1_at = purge_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_au_equities_v1_at = 0;
  do
  :: purge_acknowledgement_au_equities_v1_at < 20 -> purge_acknowledgement_au_equities_v1_record.mass_cancel_id[purge_acknowledgement_au_equities_v1_at] = (purge_acknowledgement_au_equities_v1_base + 8 + purge_acknowledgement_au_equities_v1_at + 1) % 256; purge_acknowledgement_au_equities_v1_at = purge_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_au_equities_v1_at = 0;
  do
  :: purge_acknowledgement_au_equities_v1_at < 4 -> purge_acknowledgement_au_equities_v1_record.cancelled_order_count[purge_acknowledgement_au_equities_v1_at] = (purge_acknowledgement_au_equities_v1_base + 28 + purge_acknowledgement_au_equities_v1_at + 1) % 256; purge_acknowledgement_au_equities_v1_at = purge_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Purge Acknowledgement Au Equities V 1 to the wire, 32 bytes from where the cursor stands */
inline encode_purge_acknowledgement_au_equities_v1(purge_acknowledgement_au_equities_v1_record) {
  purge_acknowledgement_au_equities_v1_at = 0;
  do
  :: purge_acknowledgement_au_equities_v1_at < 8 -> wire[at] = purge_acknowledgement_au_equities_v1_record.transaction_time[purge_acknowledgement_au_equities_v1_at]; at = at + 1; purge_acknowledgement_au_equities_v1_at = purge_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_au_equities_v1_at = 0;
  do
  :: purge_acknowledgement_au_equities_v1_at < 20 -> wire[at] = purge_acknowledgement_au_equities_v1_record.mass_cancel_id[purge_acknowledgement_au_equities_v1_at]; at = at + 1; purge_acknowledgement_au_equities_v1_at = purge_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_au_equities_v1_at = 0;
  do
  :: purge_acknowledgement_au_equities_v1_at < 4 -> wire[at] = purge_acknowledgement_au_equities_v1_record.cancelled_order_count[purge_acknowledgement_au_equities_v1_at]; at = at + 1; purge_acknowledgement_au_equities_v1_at = purge_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Purge Acknowledgement Au Equities V 1 off the wire, 32 bytes from where the cursor stands */
inline decode_purge_acknowledgement_au_equities_v1(purge_acknowledgement_au_equities_v1_record) {
  purge_acknowledgement_au_equities_v1_at = 0;
  do
  :: purge_acknowledgement_au_equities_v1_at < 8 -> purge_acknowledgement_au_equities_v1_record.transaction_time[purge_acknowledgement_au_equities_v1_at] = wire[at]; at = at + 1; purge_acknowledgement_au_equities_v1_at = purge_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_au_equities_v1_at = 0;
  do
  :: purge_acknowledgement_au_equities_v1_at < 20 -> purge_acknowledgement_au_equities_v1_record.mass_cancel_id[purge_acknowledgement_au_equities_v1_at] = wire[at]; at = at + 1; purge_acknowledgement_au_equities_v1_at = purge_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_au_equities_v1_at = 0;
  do
  :: purge_acknowledgement_au_equities_v1_at < 4 -> purge_acknowledgement_au_equities_v1_record.cancelled_order_count[purge_acknowledgement_au_equities_v1_at] = wire[at]; at = at + 1; purge_acknowledgement_au_equities_v1_at = purge_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Purge Acknowledgement Au Equities V 1 is what was written, byte for byte */
inline equal_purge_acknowledgement_au_equities_v1(purge_acknowledgement_au_equities_v1_read, purge_acknowledgement_au_equities_v1_written) {
  purge_acknowledgement_au_equities_v1_at = 0;
  do
  :: purge_acknowledgement_au_equities_v1_at < 8 -> assert(purge_acknowledgement_au_equities_v1_read.transaction_time[purge_acknowledgement_au_equities_v1_at] == purge_acknowledgement_au_equities_v1_written.transaction_time[purge_acknowledgement_au_equities_v1_at]); purge_acknowledgement_au_equities_v1_at = purge_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_au_equities_v1_at = 0;
  do
  :: purge_acknowledgement_au_equities_v1_at < 20 -> assert(purge_acknowledgement_au_equities_v1_read.mass_cancel_id[purge_acknowledgement_au_equities_v1_at] == purge_acknowledgement_au_equities_v1_written.mass_cancel_id[purge_acknowledgement_au_equities_v1_at]); purge_acknowledgement_au_equities_v1_at = purge_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_au_equities_v1_at = 0;
  do
  :: purge_acknowledgement_au_equities_v1_at < 4 -> assert(purge_acknowledgement_au_equities_v1_read.cancelled_order_count[purge_acknowledgement_au_equities_v1_at] == purge_acknowledgement_au_equities_v1_written.cancelled_order_count[purge_acknowledgement_au_equities_v1_at]); purge_acknowledgement_au_equities_v1_at = purge_acknowledgement_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Purge Rejected Au Equities V 1: 89 bytes -------------------------------- */

/* A Purge Rejected message is sent in response to a Purge Orders message to indicate that the mass cancellation cannot occur */
typedef PurgeRejectedAuEquitiesV1 {
  byte transaction_time[8];
  byte mass_cancel_id[20];
  byte purge_reject_reason;
  byte text[60]
};

int purge_rejected_au_equities_v1_at;

/* every byte of Purge Rejected Au Equities V 1 set to one value */
inline fill_purge_rejected_au_equities_v1(purge_rejected_au_equities_v1_record, purge_rejected_au_equities_v1_value) {
  purge_rejected_au_equities_v1_at = 0;
  do
  :: purge_rejected_au_equities_v1_at < 8 -> purge_rejected_au_equities_v1_record.transaction_time[purge_rejected_au_equities_v1_at] = purge_rejected_au_equities_v1_value; purge_rejected_au_equities_v1_at = purge_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_au_equities_v1_at = 0;
  do
  :: purge_rejected_au_equities_v1_at < 20 -> purge_rejected_au_equities_v1_record.mass_cancel_id[purge_rejected_au_equities_v1_at] = purge_rejected_au_equities_v1_value; purge_rejected_au_equities_v1_at = purge_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_au_equities_v1_record.purge_reject_reason = purge_rejected_au_equities_v1_value;
  purge_rejected_au_equities_v1_at = 0;
  do
  :: purge_rejected_au_equities_v1_at < 60 -> purge_rejected_au_equities_v1_record.text[purge_rejected_au_equities_v1_at] = purge_rejected_au_equities_v1_value; purge_rejected_au_equities_v1_at = purge_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Purge Rejected Au Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_purge_rejected_au_equities_v1(purge_rejected_au_equities_v1_record, purge_rejected_au_equities_v1_base) {
  purge_rejected_au_equities_v1_at = 0;
  do
  :: purge_rejected_au_equities_v1_at < 8 -> purge_rejected_au_equities_v1_record.transaction_time[purge_rejected_au_equities_v1_at] = (purge_rejected_au_equities_v1_base + 0 + purge_rejected_au_equities_v1_at + 1) % 256; purge_rejected_au_equities_v1_at = purge_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_au_equities_v1_at = 0;
  do
  :: purge_rejected_au_equities_v1_at < 20 -> purge_rejected_au_equities_v1_record.mass_cancel_id[purge_rejected_au_equities_v1_at] = (purge_rejected_au_equities_v1_base + 8 + purge_rejected_au_equities_v1_at + 1) % 256; purge_rejected_au_equities_v1_at = purge_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_au_equities_v1_record.purge_reject_reason = (purge_rejected_au_equities_v1_base + 28 + 1) % 256;
  purge_rejected_au_equities_v1_at = 0;
  do
  :: purge_rejected_au_equities_v1_at < 60 -> purge_rejected_au_equities_v1_record.text[purge_rejected_au_equities_v1_at] = (purge_rejected_au_equities_v1_base + 29 + purge_rejected_au_equities_v1_at + 1) % 256; purge_rejected_au_equities_v1_at = purge_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Purge Rejected Au Equities V 1 to the wire, 89 bytes from where the cursor stands */
inline encode_purge_rejected_au_equities_v1(purge_rejected_au_equities_v1_record) {
  purge_rejected_au_equities_v1_at = 0;
  do
  :: purge_rejected_au_equities_v1_at < 8 -> wire[at] = purge_rejected_au_equities_v1_record.transaction_time[purge_rejected_au_equities_v1_at]; at = at + 1; purge_rejected_au_equities_v1_at = purge_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_au_equities_v1_at = 0;
  do
  :: purge_rejected_au_equities_v1_at < 20 -> wire[at] = purge_rejected_au_equities_v1_record.mass_cancel_id[purge_rejected_au_equities_v1_at]; at = at + 1; purge_rejected_au_equities_v1_at = purge_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = purge_rejected_au_equities_v1_record.purge_reject_reason; at = at + 1;
  purge_rejected_au_equities_v1_at = 0;
  do
  :: purge_rejected_au_equities_v1_at < 60 -> wire[at] = purge_rejected_au_equities_v1_record.text[purge_rejected_au_equities_v1_at]; at = at + 1; purge_rejected_au_equities_v1_at = purge_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Purge Rejected Au Equities V 1 off the wire, 89 bytes from where the cursor stands */
inline decode_purge_rejected_au_equities_v1(purge_rejected_au_equities_v1_record) {
  purge_rejected_au_equities_v1_at = 0;
  do
  :: purge_rejected_au_equities_v1_at < 8 -> purge_rejected_au_equities_v1_record.transaction_time[purge_rejected_au_equities_v1_at] = wire[at]; at = at + 1; purge_rejected_au_equities_v1_at = purge_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_au_equities_v1_at = 0;
  do
  :: purge_rejected_au_equities_v1_at < 20 -> purge_rejected_au_equities_v1_record.mass_cancel_id[purge_rejected_au_equities_v1_at] = wire[at]; at = at + 1; purge_rejected_au_equities_v1_at = purge_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_au_equities_v1_record.purge_reject_reason = wire[at]; at = at + 1;
  purge_rejected_au_equities_v1_at = 0;
  do
  :: purge_rejected_au_equities_v1_at < 60 -> purge_rejected_au_equities_v1_record.text[purge_rejected_au_equities_v1_at] = wire[at]; at = at + 1; purge_rejected_au_equities_v1_at = purge_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Purge Rejected Au Equities V 1 is what was written, byte for byte */
inline equal_purge_rejected_au_equities_v1(purge_rejected_au_equities_v1_read, purge_rejected_au_equities_v1_written) {
  purge_rejected_au_equities_v1_at = 0;
  do
  :: purge_rejected_au_equities_v1_at < 8 -> assert(purge_rejected_au_equities_v1_read.transaction_time[purge_rejected_au_equities_v1_at] == purge_rejected_au_equities_v1_written.transaction_time[purge_rejected_au_equities_v1_at]); purge_rejected_au_equities_v1_at = purge_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_au_equities_v1_at = 0;
  do
  :: purge_rejected_au_equities_v1_at < 20 -> assert(purge_rejected_au_equities_v1_read.mass_cancel_id[purge_rejected_au_equities_v1_at] == purge_rejected_au_equities_v1_written.mass_cancel_id[purge_rejected_au_equities_v1_at]); purge_rejected_au_equities_v1_at = purge_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(purge_rejected_au_equities_v1_read.purge_reject_reason == purge_rejected_au_equities_v1_written.purge_reject_reason);
  purge_rejected_au_equities_v1_at = 0;
  do
  :: purge_rejected_au_equities_v1_at < 60 -> assert(purge_rejected_au_equities_v1_read.text[purge_rejected_au_equities_v1_at] == purge_rejected_au_equities_v1_written.text[purge_rejected_au_equities_v1_at]); purge_rejected_au_equities_v1_at = purge_rejected_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Cancel Correct Au Equities V 1: 88 bytes -------------------------- */

/* Used to provide notification that a trade has been cancelled (busted) or corrected (price change only) */
typedef TradeCancelCorrectAuEquitiesV1 {
  byte transaction_time[8];
  byte trading_participant_id[2];
  byte cl_ord_id[20];
  byte exec_ref_id[8];
  byte last_px[8];
  byte last_shares[4];
  byte orig_time[8];
  byte side;
  byte symbol[6];
  byte clearing_participant_id[4];
  byte transact_id[10];
  byte corrected_price[8];
  byte base_liquidity_indicator
};

int trade_cancel_correct_au_equities_v1_at;

/* every byte of Trade Cancel Correct Au Equities V 1 set to one value */
inline fill_trade_cancel_correct_au_equities_v1(trade_cancel_correct_au_equities_v1_record, trade_cancel_correct_au_equities_v1_value) {
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 8 -> trade_cancel_correct_au_equities_v1_record.transaction_time[trade_cancel_correct_au_equities_v1_at] = trade_cancel_correct_au_equities_v1_value; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 2 -> trade_cancel_correct_au_equities_v1_record.trading_participant_id[trade_cancel_correct_au_equities_v1_at] = trade_cancel_correct_au_equities_v1_value; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 20 -> trade_cancel_correct_au_equities_v1_record.cl_ord_id[trade_cancel_correct_au_equities_v1_at] = trade_cancel_correct_au_equities_v1_value; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 8 -> trade_cancel_correct_au_equities_v1_record.exec_ref_id[trade_cancel_correct_au_equities_v1_at] = trade_cancel_correct_au_equities_v1_value; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 8 -> trade_cancel_correct_au_equities_v1_record.last_px[trade_cancel_correct_au_equities_v1_at] = trade_cancel_correct_au_equities_v1_value; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 4 -> trade_cancel_correct_au_equities_v1_record.last_shares[trade_cancel_correct_au_equities_v1_at] = trade_cancel_correct_au_equities_v1_value; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 8 -> trade_cancel_correct_au_equities_v1_record.orig_time[trade_cancel_correct_au_equities_v1_at] = trade_cancel_correct_au_equities_v1_value; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_record.side = trade_cancel_correct_au_equities_v1_value;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 6 -> trade_cancel_correct_au_equities_v1_record.symbol[trade_cancel_correct_au_equities_v1_at] = trade_cancel_correct_au_equities_v1_value; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 4 -> trade_cancel_correct_au_equities_v1_record.clearing_participant_id[trade_cancel_correct_au_equities_v1_at] = trade_cancel_correct_au_equities_v1_value; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 10 -> trade_cancel_correct_au_equities_v1_record.transact_id[trade_cancel_correct_au_equities_v1_at] = trade_cancel_correct_au_equities_v1_value; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 8 -> trade_cancel_correct_au_equities_v1_record.corrected_price[trade_cancel_correct_au_equities_v1_at] = trade_cancel_correct_au_equities_v1_value; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_record.base_liquidity_indicator = trade_cancel_correct_au_equities_v1_value;
  skip
}

/* each byte of Trade Cancel Correct Au Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_trade_cancel_correct_au_equities_v1(trade_cancel_correct_au_equities_v1_record, trade_cancel_correct_au_equities_v1_base) {
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 8 -> trade_cancel_correct_au_equities_v1_record.transaction_time[trade_cancel_correct_au_equities_v1_at] = (trade_cancel_correct_au_equities_v1_base + 0 + trade_cancel_correct_au_equities_v1_at + 1) % 256; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 2 -> trade_cancel_correct_au_equities_v1_record.trading_participant_id[trade_cancel_correct_au_equities_v1_at] = (trade_cancel_correct_au_equities_v1_base + 8 + trade_cancel_correct_au_equities_v1_at + 1) % 256; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 20 -> trade_cancel_correct_au_equities_v1_record.cl_ord_id[trade_cancel_correct_au_equities_v1_at] = (trade_cancel_correct_au_equities_v1_base + 10 + trade_cancel_correct_au_equities_v1_at + 1) % 256; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 8 -> trade_cancel_correct_au_equities_v1_record.exec_ref_id[trade_cancel_correct_au_equities_v1_at] = (trade_cancel_correct_au_equities_v1_base + 30 + trade_cancel_correct_au_equities_v1_at + 1) % 256; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 8 -> trade_cancel_correct_au_equities_v1_record.last_px[trade_cancel_correct_au_equities_v1_at] = (trade_cancel_correct_au_equities_v1_base + 38 + trade_cancel_correct_au_equities_v1_at + 1) % 256; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 4 -> trade_cancel_correct_au_equities_v1_record.last_shares[trade_cancel_correct_au_equities_v1_at] = (trade_cancel_correct_au_equities_v1_base + 46 + trade_cancel_correct_au_equities_v1_at + 1) % 256; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 8 -> trade_cancel_correct_au_equities_v1_record.orig_time[trade_cancel_correct_au_equities_v1_at] = (trade_cancel_correct_au_equities_v1_base + 50 + trade_cancel_correct_au_equities_v1_at + 1) % 256; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_record.side = (trade_cancel_correct_au_equities_v1_base + 58 + 1) % 256;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 6 -> trade_cancel_correct_au_equities_v1_record.symbol[trade_cancel_correct_au_equities_v1_at] = (trade_cancel_correct_au_equities_v1_base + 59 + trade_cancel_correct_au_equities_v1_at + 1) % 256; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 4 -> trade_cancel_correct_au_equities_v1_record.clearing_participant_id[trade_cancel_correct_au_equities_v1_at] = (trade_cancel_correct_au_equities_v1_base + 65 + trade_cancel_correct_au_equities_v1_at + 1) % 256; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 10 -> trade_cancel_correct_au_equities_v1_record.transact_id[trade_cancel_correct_au_equities_v1_at] = (trade_cancel_correct_au_equities_v1_base + 69 + trade_cancel_correct_au_equities_v1_at + 1) % 256; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 8 -> trade_cancel_correct_au_equities_v1_record.corrected_price[trade_cancel_correct_au_equities_v1_at] = (trade_cancel_correct_au_equities_v1_base + 79 + trade_cancel_correct_au_equities_v1_at + 1) % 256; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_record.base_liquidity_indicator = (trade_cancel_correct_au_equities_v1_base + 87 + 1) % 256;
  skip
}

/* Trade Cancel Correct Au Equities V 1 to the wire, 88 bytes from where the cursor stands */
inline encode_trade_cancel_correct_au_equities_v1(trade_cancel_correct_au_equities_v1_record) {
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 8 -> wire[at] = trade_cancel_correct_au_equities_v1_record.transaction_time[trade_cancel_correct_au_equities_v1_at]; at = at + 1; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 2 -> wire[at] = trade_cancel_correct_au_equities_v1_record.trading_participant_id[trade_cancel_correct_au_equities_v1_at]; at = at + 1; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 20 -> wire[at] = trade_cancel_correct_au_equities_v1_record.cl_ord_id[trade_cancel_correct_au_equities_v1_at]; at = at + 1; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 8 -> wire[at] = trade_cancel_correct_au_equities_v1_record.exec_ref_id[trade_cancel_correct_au_equities_v1_at]; at = at + 1; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 8 -> wire[at] = trade_cancel_correct_au_equities_v1_record.last_px[trade_cancel_correct_au_equities_v1_at]; at = at + 1; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 4 -> wire[at] = trade_cancel_correct_au_equities_v1_record.last_shares[trade_cancel_correct_au_equities_v1_at]; at = at + 1; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 8 -> wire[at] = trade_cancel_correct_au_equities_v1_record.orig_time[trade_cancel_correct_au_equities_v1_at]; at = at + 1; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_correct_au_equities_v1_record.side; at = at + 1;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 6 -> wire[at] = trade_cancel_correct_au_equities_v1_record.symbol[trade_cancel_correct_au_equities_v1_at]; at = at + 1; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 4 -> wire[at] = trade_cancel_correct_au_equities_v1_record.clearing_participant_id[trade_cancel_correct_au_equities_v1_at]; at = at + 1; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 10 -> wire[at] = trade_cancel_correct_au_equities_v1_record.transact_id[trade_cancel_correct_au_equities_v1_at]; at = at + 1; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 8 -> wire[at] = trade_cancel_correct_au_equities_v1_record.corrected_price[trade_cancel_correct_au_equities_v1_at]; at = at + 1; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_correct_au_equities_v1_record.base_liquidity_indicator; at = at + 1;
  skip
}

/* Trade Cancel Correct Au Equities V 1 off the wire, 88 bytes from where the cursor stands */
inline decode_trade_cancel_correct_au_equities_v1(trade_cancel_correct_au_equities_v1_record) {
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 8 -> trade_cancel_correct_au_equities_v1_record.transaction_time[trade_cancel_correct_au_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 2 -> trade_cancel_correct_au_equities_v1_record.trading_participant_id[trade_cancel_correct_au_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 20 -> trade_cancel_correct_au_equities_v1_record.cl_ord_id[trade_cancel_correct_au_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 8 -> trade_cancel_correct_au_equities_v1_record.exec_ref_id[trade_cancel_correct_au_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 8 -> trade_cancel_correct_au_equities_v1_record.last_px[trade_cancel_correct_au_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 4 -> trade_cancel_correct_au_equities_v1_record.last_shares[trade_cancel_correct_au_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 8 -> trade_cancel_correct_au_equities_v1_record.orig_time[trade_cancel_correct_au_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_record.side = wire[at]; at = at + 1;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 6 -> trade_cancel_correct_au_equities_v1_record.symbol[trade_cancel_correct_au_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 4 -> trade_cancel_correct_au_equities_v1_record.clearing_participant_id[trade_cancel_correct_au_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 10 -> trade_cancel_correct_au_equities_v1_record.transact_id[trade_cancel_correct_au_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 8 -> trade_cancel_correct_au_equities_v1_record.corrected_price[trade_cancel_correct_au_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_record.base_liquidity_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Cancel Correct Au Equities V 1 is what was written, byte for byte */
inline equal_trade_cancel_correct_au_equities_v1(trade_cancel_correct_au_equities_v1_read, trade_cancel_correct_au_equities_v1_written) {
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 8 -> assert(trade_cancel_correct_au_equities_v1_read.transaction_time[trade_cancel_correct_au_equities_v1_at] == trade_cancel_correct_au_equities_v1_written.transaction_time[trade_cancel_correct_au_equities_v1_at]); trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 2 -> assert(trade_cancel_correct_au_equities_v1_read.trading_participant_id[trade_cancel_correct_au_equities_v1_at] == trade_cancel_correct_au_equities_v1_written.trading_participant_id[trade_cancel_correct_au_equities_v1_at]); trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 20 -> assert(trade_cancel_correct_au_equities_v1_read.cl_ord_id[trade_cancel_correct_au_equities_v1_at] == trade_cancel_correct_au_equities_v1_written.cl_ord_id[trade_cancel_correct_au_equities_v1_at]); trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 8 -> assert(trade_cancel_correct_au_equities_v1_read.exec_ref_id[trade_cancel_correct_au_equities_v1_at] == trade_cancel_correct_au_equities_v1_written.exec_ref_id[trade_cancel_correct_au_equities_v1_at]); trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 8 -> assert(trade_cancel_correct_au_equities_v1_read.last_px[trade_cancel_correct_au_equities_v1_at] == trade_cancel_correct_au_equities_v1_written.last_px[trade_cancel_correct_au_equities_v1_at]); trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 4 -> assert(trade_cancel_correct_au_equities_v1_read.last_shares[trade_cancel_correct_au_equities_v1_at] == trade_cancel_correct_au_equities_v1_written.last_shares[trade_cancel_correct_au_equities_v1_at]); trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 8 -> assert(trade_cancel_correct_au_equities_v1_read.orig_time[trade_cancel_correct_au_equities_v1_at] == trade_cancel_correct_au_equities_v1_written.orig_time[trade_cancel_correct_au_equities_v1_at]); trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(trade_cancel_correct_au_equities_v1_read.side == trade_cancel_correct_au_equities_v1_written.side);
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 6 -> assert(trade_cancel_correct_au_equities_v1_read.symbol[trade_cancel_correct_au_equities_v1_at] == trade_cancel_correct_au_equities_v1_written.symbol[trade_cancel_correct_au_equities_v1_at]); trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 4 -> assert(trade_cancel_correct_au_equities_v1_read.clearing_participant_id[trade_cancel_correct_au_equities_v1_at] == trade_cancel_correct_au_equities_v1_written.clearing_participant_id[trade_cancel_correct_au_equities_v1_at]); trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 10 -> assert(trade_cancel_correct_au_equities_v1_read.transact_id[trade_cancel_correct_au_equities_v1_at] == trade_cancel_correct_au_equities_v1_written.transact_id[trade_cancel_correct_au_equities_v1_at]); trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_au_equities_v1_at = 0;
  do
  :: trade_cancel_correct_au_equities_v1_at < 8 -> assert(trade_cancel_correct_au_equities_v1_read.corrected_price[trade_cancel_correct_au_equities_v1_at] == trade_cancel_correct_au_equities_v1_written.corrected_price[trade_cancel_correct_au_equities_v1_at]); trade_cancel_correct_au_equities_v1_at = trade_cancel_correct_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(trade_cancel_correct_au_equities_v1_read.base_liquidity_indicator == trade_cancel_correct_au_equities_v1_written.base_liquidity_indicator);
  skip
}

/* ---- Order Modified Au Equities V 2: 109 bytes ------------------------------- */

/* Order Modified messages are sent in response to a Modify Order, with ExpireDate for multi-day orders */
typedef OrderModifiedAuEquitiesV2 {
  byte transaction_time[8];
  byte trading_participant_id[2];
  byte cl_ord_id[20];
  byte exec_inst;
  byte order_qty[4];
  byte orig_cl_ord_id[20];
  byte price[8];
  byte min_qty[4];
  byte max_floor[4];
  byte leaves_qty[4];
  byte secondary_order_id[8];
  byte short_sell_naked_qty[4];
  byte short_sell_covered_qty[4];
  byte short_sell_long_qty[4];
  byte working_price[8];
  byte base_liquidity_indicator;
  byte sub_liquidity_indicator;
  byte expire_date[4]
};

int order_modified_au_equities_v2_at;

/* every byte of Order Modified Au Equities V 2 set to one value */
inline fill_order_modified_au_equities_v2(order_modified_au_equities_v2_record, order_modified_au_equities_v2_value) {
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 8 -> order_modified_au_equities_v2_record.transaction_time[order_modified_au_equities_v2_at] = order_modified_au_equities_v2_value; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 2 -> order_modified_au_equities_v2_record.trading_participant_id[order_modified_au_equities_v2_at] = order_modified_au_equities_v2_value; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 20 -> order_modified_au_equities_v2_record.cl_ord_id[order_modified_au_equities_v2_at] = order_modified_au_equities_v2_value; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_record.exec_inst = order_modified_au_equities_v2_value;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> order_modified_au_equities_v2_record.order_qty[order_modified_au_equities_v2_at] = order_modified_au_equities_v2_value; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 20 -> order_modified_au_equities_v2_record.orig_cl_ord_id[order_modified_au_equities_v2_at] = order_modified_au_equities_v2_value; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 8 -> order_modified_au_equities_v2_record.price[order_modified_au_equities_v2_at] = order_modified_au_equities_v2_value; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> order_modified_au_equities_v2_record.min_qty[order_modified_au_equities_v2_at] = order_modified_au_equities_v2_value; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> order_modified_au_equities_v2_record.max_floor[order_modified_au_equities_v2_at] = order_modified_au_equities_v2_value; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> order_modified_au_equities_v2_record.leaves_qty[order_modified_au_equities_v2_at] = order_modified_au_equities_v2_value; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 8 -> order_modified_au_equities_v2_record.secondary_order_id[order_modified_au_equities_v2_at] = order_modified_au_equities_v2_value; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> order_modified_au_equities_v2_record.short_sell_naked_qty[order_modified_au_equities_v2_at] = order_modified_au_equities_v2_value; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> order_modified_au_equities_v2_record.short_sell_covered_qty[order_modified_au_equities_v2_at] = order_modified_au_equities_v2_value; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> order_modified_au_equities_v2_record.short_sell_long_qty[order_modified_au_equities_v2_at] = order_modified_au_equities_v2_value; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 8 -> order_modified_au_equities_v2_record.working_price[order_modified_au_equities_v2_at] = order_modified_au_equities_v2_value; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_record.base_liquidity_indicator = order_modified_au_equities_v2_value;
  order_modified_au_equities_v2_record.sub_liquidity_indicator = order_modified_au_equities_v2_value;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> order_modified_au_equities_v2_record.expire_date[order_modified_au_equities_v2_at] = order_modified_au_equities_v2_value; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Modified Au Equities V 2 set to where it lies, so a field read out of place says so */
inline ramp_order_modified_au_equities_v2(order_modified_au_equities_v2_record, order_modified_au_equities_v2_base) {
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 8 -> order_modified_au_equities_v2_record.transaction_time[order_modified_au_equities_v2_at] = (order_modified_au_equities_v2_base + 0 + order_modified_au_equities_v2_at + 1) % 256; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 2 -> order_modified_au_equities_v2_record.trading_participant_id[order_modified_au_equities_v2_at] = (order_modified_au_equities_v2_base + 8 + order_modified_au_equities_v2_at + 1) % 256; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 20 -> order_modified_au_equities_v2_record.cl_ord_id[order_modified_au_equities_v2_at] = (order_modified_au_equities_v2_base + 10 + order_modified_au_equities_v2_at + 1) % 256; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_record.exec_inst = (order_modified_au_equities_v2_base + 30 + 1) % 256;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> order_modified_au_equities_v2_record.order_qty[order_modified_au_equities_v2_at] = (order_modified_au_equities_v2_base + 31 + order_modified_au_equities_v2_at + 1) % 256; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 20 -> order_modified_au_equities_v2_record.orig_cl_ord_id[order_modified_au_equities_v2_at] = (order_modified_au_equities_v2_base + 35 + order_modified_au_equities_v2_at + 1) % 256; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 8 -> order_modified_au_equities_v2_record.price[order_modified_au_equities_v2_at] = (order_modified_au_equities_v2_base + 55 + order_modified_au_equities_v2_at + 1) % 256; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> order_modified_au_equities_v2_record.min_qty[order_modified_au_equities_v2_at] = (order_modified_au_equities_v2_base + 63 + order_modified_au_equities_v2_at + 1) % 256; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> order_modified_au_equities_v2_record.max_floor[order_modified_au_equities_v2_at] = (order_modified_au_equities_v2_base + 67 + order_modified_au_equities_v2_at + 1) % 256; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> order_modified_au_equities_v2_record.leaves_qty[order_modified_au_equities_v2_at] = (order_modified_au_equities_v2_base + 71 + order_modified_au_equities_v2_at + 1) % 256; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 8 -> order_modified_au_equities_v2_record.secondary_order_id[order_modified_au_equities_v2_at] = (order_modified_au_equities_v2_base + 75 + order_modified_au_equities_v2_at + 1) % 256; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> order_modified_au_equities_v2_record.short_sell_naked_qty[order_modified_au_equities_v2_at] = (order_modified_au_equities_v2_base + 83 + order_modified_au_equities_v2_at + 1) % 256; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> order_modified_au_equities_v2_record.short_sell_covered_qty[order_modified_au_equities_v2_at] = (order_modified_au_equities_v2_base + 87 + order_modified_au_equities_v2_at + 1) % 256; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> order_modified_au_equities_v2_record.short_sell_long_qty[order_modified_au_equities_v2_at] = (order_modified_au_equities_v2_base + 91 + order_modified_au_equities_v2_at + 1) % 256; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 8 -> order_modified_au_equities_v2_record.working_price[order_modified_au_equities_v2_at] = (order_modified_au_equities_v2_base + 95 + order_modified_au_equities_v2_at + 1) % 256; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_record.base_liquidity_indicator = (order_modified_au_equities_v2_base + 103 + 1) % 256;
  order_modified_au_equities_v2_record.sub_liquidity_indicator = (order_modified_au_equities_v2_base + 104 + 1) % 256;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> order_modified_au_equities_v2_record.expire_date[order_modified_au_equities_v2_at] = (order_modified_au_equities_v2_base + 105 + order_modified_au_equities_v2_at + 1) % 256; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modified Au Equities V 2 to the wire, 109 bytes from where the cursor stands */
inline encode_order_modified_au_equities_v2(order_modified_au_equities_v2_record) {
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 8 -> wire[at] = order_modified_au_equities_v2_record.transaction_time[order_modified_au_equities_v2_at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 2 -> wire[at] = order_modified_au_equities_v2_record.trading_participant_id[order_modified_au_equities_v2_at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 20 -> wire[at] = order_modified_au_equities_v2_record.cl_ord_id[order_modified_au_equities_v2_at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = order_modified_au_equities_v2_record.exec_inst; at = at + 1;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> wire[at] = order_modified_au_equities_v2_record.order_qty[order_modified_au_equities_v2_at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 20 -> wire[at] = order_modified_au_equities_v2_record.orig_cl_ord_id[order_modified_au_equities_v2_at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 8 -> wire[at] = order_modified_au_equities_v2_record.price[order_modified_au_equities_v2_at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> wire[at] = order_modified_au_equities_v2_record.min_qty[order_modified_au_equities_v2_at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> wire[at] = order_modified_au_equities_v2_record.max_floor[order_modified_au_equities_v2_at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> wire[at] = order_modified_au_equities_v2_record.leaves_qty[order_modified_au_equities_v2_at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 8 -> wire[at] = order_modified_au_equities_v2_record.secondary_order_id[order_modified_au_equities_v2_at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> wire[at] = order_modified_au_equities_v2_record.short_sell_naked_qty[order_modified_au_equities_v2_at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> wire[at] = order_modified_au_equities_v2_record.short_sell_covered_qty[order_modified_au_equities_v2_at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> wire[at] = order_modified_au_equities_v2_record.short_sell_long_qty[order_modified_au_equities_v2_at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 8 -> wire[at] = order_modified_au_equities_v2_record.working_price[order_modified_au_equities_v2_at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = order_modified_au_equities_v2_record.base_liquidity_indicator; at = at + 1;
  wire[at] = order_modified_au_equities_v2_record.sub_liquidity_indicator; at = at + 1;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> wire[at] = order_modified_au_equities_v2_record.expire_date[order_modified_au_equities_v2_at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modified Au Equities V 2 off the wire, 109 bytes from where the cursor stands */
inline decode_order_modified_au_equities_v2(order_modified_au_equities_v2_record) {
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 8 -> order_modified_au_equities_v2_record.transaction_time[order_modified_au_equities_v2_at] = wire[at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 2 -> order_modified_au_equities_v2_record.trading_participant_id[order_modified_au_equities_v2_at] = wire[at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 20 -> order_modified_au_equities_v2_record.cl_ord_id[order_modified_au_equities_v2_at] = wire[at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_record.exec_inst = wire[at]; at = at + 1;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> order_modified_au_equities_v2_record.order_qty[order_modified_au_equities_v2_at] = wire[at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 20 -> order_modified_au_equities_v2_record.orig_cl_ord_id[order_modified_au_equities_v2_at] = wire[at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 8 -> order_modified_au_equities_v2_record.price[order_modified_au_equities_v2_at] = wire[at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> order_modified_au_equities_v2_record.min_qty[order_modified_au_equities_v2_at] = wire[at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> order_modified_au_equities_v2_record.max_floor[order_modified_au_equities_v2_at] = wire[at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> order_modified_au_equities_v2_record.leaves_qty[order_modified_au_equities_v2_at] = wire[at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 8 -> order_modified_au_equities_v2_record.secondary_order_id[order_modified_au_equities_v2_at] = wire[at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> order_modified_au_equities_v2_record.short_sell_naked_qty[order_modified_au_equities_v2_at] = wire[at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> order_modified_au_equities_v2_record.short_sell_covered_qty[order_modified_au_equities_v2_at] = wire[at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> order_modified_au_equities_v2_record.short_sell_long_qty[order_modified_au_equities_v2_at] = wire[at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 8 -> order_modified_au_equities_v2_record.working_price[order_modified_au_equities_v2_at] = wire[at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_record.base_liquidity_indicator = wire[at]; at = at + 1;
  order_modified_au_equities_v2_record.sub_liquidity_indicator = wire[at]; at = at + 1;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> order_modified_au_equities_v2_record.expire_date[order_modified_au_equities_v2_at] = wire[at]; at = at + 1; order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Modified Au Equities V 2 is what was written, byte for byte */
inline equal_order_modified_au_equities_v2(order_modified_au_equities_v2_read, order_modified_au_equities_v2_written) {
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 8 -> assert(order_modified_au_equities_v2_read.transaction_time[order_modified_au_equities_v2_at] == order_modified_au_equities_v2_written.transaction_time[order_modified_au_equities_v2_at]); order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 2 -> assert(order_modified_au_equities_v2_read.trading_participant_id[order_modified_au_equities_v2_at] == order_modified_au_equities_v2_written.trading_participant_id[order_modified_au_equities_v2_at]); order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 20 -> assert(order_modified_au_equities_v2_read.cl_ord_id[order_modified_au_equities_v2_at] == order_modified_au_equities_v2_written.cl_ord_id[order_modified_au_equities_v2_at]); order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  assert(order_modified_au_equities_v2_read.exec_inst == order_modified_au_equities_v2_written.exec_inst);
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> assert(order_modified_au_equities_v2_read.order_qty[order_modified_au_equities_v2_at] == order_modified_au_equities_v2_written.order_qty[order_modified_au_equities_v2_at]); order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 20 -> assert(order_modified_au_equities_v2_read.orig_cl_ord_id[order_modified_au_equities_v2_at] == order_modified_au_equities_v2_written.orig_cl_ord_id[order_modified_au_equities_v2_at]); order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 8 -> assert(order_modified_au_equities_v2_read.price[order_modified_au_equities_v2_at] == order_modified_au_equities_v2_written.price[order_modified_au_equities_v2_at]); order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> assert(order_modified_au_equities_v2_read.min_qty[order_modified_au_equities_v2_at] == order_modified_au_equities_v2_written.min_qty[order_modified_au_equities_v2_at]); order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> assert(order_modified_au_equities_v2_read.max_floor[order_modified_au_equities_v2_at] == order_modified_au_equities_v2_written.max_floor[order_modified_au_equities_v2_at]); order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> assert(order_modified_au_equities_v2_read.leaves_qty[order_modified_au_equities_v2_at] == order_modified_au_equities_v2_written.leaves_qty[order_modified_au_equities_v2_at]); order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 8 -> assert(order_modified_au_equities_v2_read.secondary_order_id[order_modified_au_equities_v2_at] == order_modified_au_equities_v2_written.secondary_order_id[order_modified_au_equities_v2_at]); order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> assert(order_modified_au_equities_v2_read.short_sell_naked_qty[order_modified_au_equities_v2_at] == order_modified_au_equities_v2_written.short_sell_naked_qty[order_modified_au_equities_v2_at]); order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> assert(order_modified_au_equities_v2_read.short_sell_covered_qty[order_modified_au_equities_v2_at] == order_modified_au_equities_v2_written.short_sell_covered_qty[order_modified_au_equities_v2_at]); order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> assert(order_modified_au_equities_v2_read.short_sell_long_qty[order_modified_au_equities_v2_at] == order_modified_au_equities_v2_written.short_sell_long_qty[order_modified_au_equities_v2_at]); order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 8 -> assert(order_modified_au_equities_v2_read.working_price[order_modified_au_equities_v2_at] == order_modified_au_equities_v2_written.working_price[order_modified_au_equities_v2_at]); order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  assert(order_modified_au_equities_v2_read.base_liquidity_indicator == order_modified_au_equities_v2_written.base_liquidity_indicator);
  assert(order_modified_au_equities_v2_read.sub_liquidity_indicator == order_modified_au_equities_v2_written.sub_liquidity_indicator);
  order_modified_au_equities_v2_at = 0;
  do
  :: order_modified_au_equities_v2_at < 4 -> assert(order_modified_au_equities_v2_read.expire_date[order_modified_au_equities_v2_at] == order_modified_au_equities_v2_written.expire_date[order_modified_au_equities_v2_at]); order_modified_au_equities_v2_at = order_modified_au_equities_v2_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Carried Restatement Au Equities V 1: 182 bytes -------------------------- */

/* The Carried Restatement message is used to indicate the restoration of a multi-day GTC or GTD orders at the start of a new business day */
typedef CarriedRestatementAuEquitiesV1 {
  byte transaction_time[8];
  byte account[10];
  byte trading_participant_id[2];
  byte cl_ord_id[20];
  byte exec_inst;
  byte order_id[8];
  byte order_qty[4];
  byte ord_type;
  byte price[8];
  byte capacity;
  byte side;
  byte symbol[6];
  byte time_in_force;
  byte min_qty[4];
  byte max_floor[4];
  byte expire_time[8];
  byte clearing_participant_id[4];
  byte clearing_account[10];
  byte undisclosed;
  byte client_cross_ref[15];
  byte short_sell_naked_qty[4];
  byte short_sell_covered_qty[4];
  byte short_sell_long_qty[4];
  byte risk_group_id[2];
  byte no_trade_feat;
  byte no_trade_key[10];
  byte meqse;
  byte origin_of_trans[20];
  byte intermediary_id[10];
  byte directed_wholesale_indicator;
  byte remove_crossing_from_clearing;
  byte broker_preferencing;
  byte routing_inst;
  byte display_indicator;
  byte expire_date[4]
};

int carried_restatement_au_equities_v1_at;

/* every byte of Carried Restatement Au Equities V 1 set to one value */
inline fill_carried_restatement_au_equities_v1(carried_restatement_au_equities_v1_record, carried_restatement_au_equities_v1_value) {
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 8 -> carried_restatement_au_equities_v1_record.transaction_time[carried_restatement_au_equities_v1_at] = carried_restatement_au_equities_v1_value; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 10 -> carried_restatement_au_equities_v1_record.account[carried_restatement_au_equities_v1_at] = carried_restatement_au_equities_v1_value; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 2 -> carried_restatement_au_equities_v1_record.trading_participant_id[carried_restatement_au_equities_v1_at] = carried_restatement_au_equities_v1_value; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 20 -> carried_restatement_au_equities_v1_record.cl_ord_id[carried_restatement_au_equities_v1_at] = carried_restatement_au_equities_v1_value; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_record.exec_inst = carried_restatement_au_equities_v1_value;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 8 -> carried_restatement_au_equities_v1_record.order_id[carried_restatement_au_equities_v1_at] = carried_restatement_au_equities_v1_value; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> carried_restatement_au_equities_v1_record.order_qty[carried_restatement_au_equities_v1_at] = carried_restatement_au_equities_v1_value; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_record.ord_type = carried_restatement_au_equities_v1_value;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 8 -> carried_restatement_au_equities_v1_record.price[carried_restatement_au_equities_v1_at] = carried_restatement_au_equities_v1_value; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_record.capacity = carried_restatement_au_equities_v1_value;
  carried_restatement_au_equities_v1_record.side = carried_restatement_au_equities_v1_value;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 6 -> carried_restatement_au_equities_v1_record.symbol[carried_restatement_au_equities_v1_at] = carried_restatement_au_equities_v1_value; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_record.time_in_force = carried_restatement_au_equities_v1_value;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> carried_restatement_au_equities_v1_record.min_qty[carried_restatement_au_equities_v1_at] = carried_restatement_au_equities_v1_value; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> carried_restatement_au_equities_v1_record.max_floor[carried_restatement_au_equities_v1_at] = carried_restatement_au_equities_v1_value; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 8 -> carried_restatement_au_equities_v1_record.expire_time[carried_restatement_au_equities_v1_at] = carried_restatement_au_equities_v1_value; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> carried_restatement_au_equities_v1_record.clearing_participant_id[carried_restatement_au_equities_v1_at] = carried_restatement_au_equities_v1_value; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 10 -> carried_restatement_au_equities_v1_record.clearing_account[carried_restatement_au_equities_v1_at] = carried_restatement_au_equities_v1_value; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_record.undisclosed = carried_restatement_au_equities_v1_value;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 15 -> carried_restatement_au_equities_v1_record.client_cross_ref[carried_restatement_au_equities_v1_at] = carried_restatement_au_equities_v1_value; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> carried_restatement_au_equities_v1_record.short_sell_naked_qty[carried_restatement_au_equities_v1_at] = carried_restatement_au_equities_v1_value; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> carried_restatement_au_equities_v1_record.short_sell_covered_qty[carried_restatement_au_equities_v1_at] = carried_restatement_au_equities_v1_value; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> carried_restatement_au_equities_v1_record.short_sell_long_qty[carried_restatement_au_equities_v1_at] = carried_restatement_au_equities_v1_value; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 2 -> carried_restatement_au_equities_v1_record.risk_group_id[carried_restatement_au_equities_v1_at] = carried_restatement_au_equities_v1_value; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_record.no_trade_feat = carried_restatement_au_equities_v1_value;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 10 -> carried_restatement_au_equities_v1_record.no_trade_key[carried_restatement_au_equities_v1_at] = carried_restatement_au_equities_v1_value; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_record.meqse = carried_restatement_au_equities_v1_value;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 20 -> carried_restatement_au_equities_v1_record.origin_of_trans[carried_restatement_au_equities_v1_at] = carried_restatement_au_equities_v1_value; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 10 -> carried_restatement_au_equities_v1_record.intermediary_id[carried_restatement_au_equities_v1_at] = carried_restatement_au_equities_v1_value; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_record.directed_wholesale_indicator = carried_restatement_au_equities_v1_value;
  carried_restatement_au_equities_v1_record.remove_crossing_from_clearing = carried_restatement_au_equities_v1_value;
  carried_restatement_au_equities_v1_record.broker_preferencing = carried_restatement_au_equities_v1_value;
  carried_restatement_au_equities_v1_record.routing_inst = carried_restatement_au_equities_v1_value;
  carried_restatement_au_equities_v1_record.display_indicator = carried_restatement_au_equities_v1_value;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> carried_restatement_au_equities_v1_record.expire_date[carried_restatement_au_equities_v1_at] = carried_restatement_au_equities_v1_value; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Carried Restatement Au Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_carried_restatement_au_equities_v1(carried_restatement_au_equities_v1_record, carried_restatement_au_equities_v1_base) {
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 8 -> carried_restatement_au_equities_v1_record.transaction_time[carried_restatement_au_equities_v1_at] = (carried_restatement_au_equities_v1_base + 0 + carried_restatement_au_equities_v1_at + 1) % 256; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 10 -> carried_restatement_au_equities_v1_record.account[carried_restatement_au_equities_v1_at] = (carried_restatement_au_equities_v1_base + 8 + carried_restatement_au_equities_v1_at + 1) % 256; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 2 -> carried_restatement_au_equities_v1_record.trading_participant_id[carried_restatement_au_equities_v1_at] = (carried_restatement_au_equities_v1_base + 18 + carried_restatement_au_equities_v1_at + 1) % 256; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 20 -> carried_restatement_au_equities_v1_record.cl_ord_id[carried_restatement_au_equities_v1_at] = (carried_restatement_au_equities_v1_base + 20 + carried_restatement_au_equities_v1_at + 1) % 256; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_record.exec_inst = (carried_restatement_au_equities_v1_base + 40 + 1) % 256;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 8 -> carried_restatement_au_equities_v1_record.order_id[carried_restatement_au_equities_v1_at] = (carried_restatement_au_equities_v1_base + 41 + carried_restatement_au_equities_v1_at + 1) % 256; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> carried_restatement_au_equities_v1_record.order_qty[carried_restatement_au_equities_v1_at] = (carried_restatement_au_equities_v1_base + 49 + carried_restatement_au_equities_v1_at + 1) % 256; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_record.ord_type = (carried_restatement_au_equities_v1_base + 53 + 1) % 256;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 8 -> carried_restatement_au_equities_v1_record.price[carried_restatement_au_equities_v1_at] = (carried_restatement_au_equities_v1_base + 54 + carried_restatement_au_equities_v1_at + 1) % 256; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_record.capacity = (carried_restatement_au_equities_v1_base + 62 + 1) % 256;
  carried_restatement_au_equities_v1_record.side = (carried_restatement_au_equities_v1_base + 63 + 1) % 256;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 6 -> carried_restatement_au_equities_v1_record.symbol[carried_restatement_au_equities_v1_at] = (carried_restatement_au_equities_v1_base + 64 + carried_restatement_au_equities_v1_at + 1) % 256; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_record.time_in_force = (carried_restatement_au_equities_v1_base + 70 + 1) % 256;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> carried_restatement_au_equities_v1_record.min_qty[carried_restatement_au_equities_v1_at] = (carried_restatement_au_equities_v1_base + 71 + carried_restatement_au_equities_v1_at + 1) % 256; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> carried_restatement_au_equities_v1_record.max_floor[carried_restatement_au_equities_v1_at] = (carried_restatement_au_equities_v1_base + 75 + carried_restatement_au_equities_v1_at + 1) % 256; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 8 -> carried_restatement_au_equities_v1_record.expire_time[carried_restatement_au_equities_v1_at] = (carried_restatement_au_equities_v1_base + 79 + carried_restatement_au_equities_v1_at + 1) % 256; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> carried_restatement_au_equities_v1_record.clearing_participant_id[carried_restatement_au_equities_v1_at] = (carried_restatement_au_equities_v1_base + 87 + carried_restatement_au_equities_v1_at + 1) % 256; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 10 -> carried_restatement_au_equities_v1_record.clearing_account[carried_restatement_au_equities_v1_at] = (carried_restatement_au_equities_v1_base + 91 + carried_restatement_au_equities_v1_at + 1) % 256; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_record.undisclosed = (carried_restatement_au_equities_v1_base + 101 + 1) % 256;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 15 -> carried_restatement_au_equities_v1_record.client_cross_ref[carried_restatement_au_equities_v1_at] = (carried_restatement_au_equities_v1_base + 102 + carried_restatement_au_equities_v1_at + 1) % 256; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> carried_restatement_au_equities_v1_record.short_sell_naked_qty[carried_restatement_au_equities_v1_at] = (carried_restatement_au_equities_v1_base + 117 + carried_restatement_au_equities_v1_at + 1) % 256; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> carried_restatement_au_equities_v1_record.short_sell_covered_qty[carried_restatement_au_equities_v1_at] = (carried_restatement_au_equities_v1_base + 121 + carried_restatement_au_equities_v1_at + 1) % 256; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> carried_restatement_au_equities_v1_record.short_sell_long_qty[carried_restatement_au_equities_v1_at] = (carried_restatement_au_equities_v1_base + 125 + carried_restatement_au_equities_v1_at + 1) % 256; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 2 -> carried_restatement_au_equities_v1_record.risk_group_id[carried_restatement_au_equities_v1_at] = (carried_restatement_au_equities_v1_base + 129 + carried_restatement_au_equities_v1_at + 1) % 256; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_record.no_trade_feat = (carried_restatement_au_equities_v1_base + 131 + 1) % 256;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 10 -> carried_restatement_au_equities_v1_record.no_trade_key[carried_restatement_au_equities_v1_at] = (carried_restatement_au_equities_v1_base + 132 + carried_restatement_au_equities_v1_at + 1) % 256; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_record.meqse = (carried_restatement_au_equities_v1_base + 142 + 1) % 256;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 20 -> carried_restatement_au_equities_v1_record.origin_of_trans[carried_restatement_au_equities_v1_at] = (carried_restatement_au_equities_v1_base + 143 + carried_restatement_au_equities_v1_at + 1) % 256; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 10 -> carried_restatement_au_equities_v1_record.intermediary_id[carried_restatement_au_equities_v1_at] = (carried_restatement_au_equities_v1_base + 163 + carried_restatement_au_equities_v1_at + 1) % 256; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_record.directed_wholesale_indicator = (carried_restatement_au_equities_v1_base + 173 + 1) % 256;
  carried_restatement_au_equities_v1_record.remove_crossing_from_clearing = (carried_restatement_au_equities_v1_base + 174 + 1) % 256;
  carried_restatement_au_equities_v1_record.broker_preferencing = (carried_restatement_au_equities_v1_base + 175 + 1) % 256;
  carried_restatement_au_equities_v1_record.routing_inst = (carried_restatement_au_equities_v1_base + 176 + 1) % 256;
  carried_restatement_au_equities_v1_record.display_indicator = (carried_restatement_au_equities_v1_base + 177 + 1) % 256;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> carried_restatement_au_equities_v1_record.expire_date[carried_restatement_au_equities_v1_at] = (carried_restatement_au_equities_v1_base + 178 + carried_restatement_au_equities_v1_at + 1) % 256; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Carried Restatement Au Equities V 1 to the wire, 182 bytes from where the cursor stands */
inline encode_carried_restatement_au_equities_v1(carried_restatement_au_equities_v1_record) {
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 8 -> wire[at] = carried_restatement_au_equities_v1_record.transaction_time[carried_restatement_au_equities_v1_at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 10 -> wire[at] = carried_restatement_au_equities_v1_record.account[carried_restatement_au_equities_v1_at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 2 -> wire[at] = carried_restatement_au_equities_v1_record.trading_participant_id[carried_restatement_au_equities_v1_at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 20 -> wire[at] = carried_restatement_au_equities_v1_record.cl_ord_id[carried_restatement_au_equities_v1_at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_au_equities_v1_record.exec_inst; at = at + 1;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 8 -> wire[at] = carried_restatement_au_equities_v1_record.order_id[carried_restatement_au_equities_v1_at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> wire[at] = carried_restatement_au_equities_v1_record.order_qty[carried_restatement_au_equities_v1_at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_au_equities_v1_record.ord_type; at = at + 1;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 8 -> wire[at] = carried_restatement_au_equities_v1_record.price[carried_restatement_au_equities_v1_at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_au_equities_v1_record.capacity; at = at + 1;
  wire[at] = carried_restatement_au_equities_v1_record.side; at = at + 1;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 6 -> wire[at] = carried_restatement_au_equities_v1_record.symbol[carried_restatement_au_equities_v1_at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_au_equities_v1_record.time_in_force; at = at + 1;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> wire[at] = carried_restatement_au_equities_v1_record.min_qty[carried_restatement_au_equities_v1_at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> wire[at] = carried_restatement_au_equities_v1_record.max_floor[carried_restatement_au_equities_v1_at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 8 -> wire[at] = carried_restatement_au_equities_v1_record.expire_time[carried_restatement_au_equities_v1_at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> wire[at] = carried_restatement_au_equities_v1_record.clearing_participant_id[carried_restatement_au_equities_v1_at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 10 -> wire[at] = carried_restatement_au_equities_v1_record.clearing_account[carried_restatement_au_equities_v1_at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_au_equities_v1_record.undisclosed; at = at + 1;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 15 -> wire[at] = carried_restatement_au_equities_v1_record.client_cross_ref[carried_restatement_au_equities_v1_at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> wire[at] = carried_restatement_au_equities_v1_record.short_sell_naked_qty[carried_restatement_au_equities_v1_at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> wire[at] = carried_restatement_au_equities_v1_record.short_sell_covered_qty[carried_restatement_au_equities_v1_at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> wire[at] = carried_restatement_au_equities_v1_record.short_sell_long_qty[carried_restatement_au_equities_v1_at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 2 -> wire[at] = carried_restatement_au_equities_v1_record.risk_group_id[carried_restatement_au_equities_v1_at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_au_equities_v1_record.no_trade_feat; at = at + 1;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 10 -> wire[at] = carried_restatement_au_equities_v1_record.no_trade_key[carried_restatement_au_equities_v1_at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_au_equities_v1_record.meqse; at = at + 1;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 20 -> wire[at] = carried_restatement_au_equities_v1_record.origin_of_trans[carried_restatement_au_equities_v1_at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 10 -> wire[at] = carried_restatement_au_equities_v1_record.intermediary_id[carried_restatement_au_equities_v1_at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_au_equities_v1_record.directed_wholesale_indicator; at = at + 1;
  wire[at] = carried_restatement_au_equities_v1_record.remove_crossing_from_clearing; at = at + 1;
  wire[at] = carried_restatement_au_equities_v1_record.broker_preferencing; at = at + 1;
  wire[at] = carried_restatement_au_equities_v1_record.routing_inst; at = at + 1;
  wire[at] = carried_restatement_au_equities_v1_record.display_indicator; at = at + 1;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> wire[at] = carried_restatement_au_equities_v1_record.expire_date[carried_restatement_au_equities_v1_at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Carried Restatement Au Equities V 1 off the wire, 182 bytes from where the cursor stands */
inline decode_carried_restatement_au_equities_v1(carried_restatement_au_equities_v1_record) {
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 8 -> carried_restatement_au_equities_v1_record.transaction_time[carried_restatement_au_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 10 -> carried_restatement_au_equities_v1_record.account[carried_restatement_au_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 2 -> carried_restatement_au_equities_v1_record.trading_participant_id[carried_restatement_au_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 20 -> carried_restatement_au_equities_v1_record.cl_ord_id[carried_restatement_au_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_record.exec_inst = wire[at]; at = at + 1;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 8 -> carried_restatement_au_equities_v1_record.order_id[carried_restatement_au_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> carried_restatement_au_equities_v1_record.order_qty[carried_restatement_au_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_record.ord_type = wire[at]; at = at + 1;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 8 -> carried_restatement_au_equities_v1_record.price[carried_restatement_au_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_record.capacity = wire[at]; at = at + 1;
  carried_restatement_au_equities_v1_record.side = wire[at]; at = at + 1;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 6 -> carried_restatement_au_equities_v1_record.symbol[carried_restatement_au_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_record.time_in_force = wire[at]; at = at + 1;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> carried_restatement_au_equities_v1_record.min_qty[carried_restatement_au_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> carried_restatement_au_equities_v1_record.max_floor[carried_restatement_au_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 8 -> carried_restatement_au_equities_v1_record.expire_time[carried_restatement_au_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> carried_restatement_au_equities_v1_record.clearing_participant_id[carried_restatement_au_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 10 -> carried_restatement_au_equities_v1_record.clearing_account[carried_restatement_au_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_record.undisclosed = wire[at]; at = at + 1;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 15 -> carried_restatement_au_equities_v1_record.client_cross_ref[carried_restatement_au_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> carried_restatement_au_equities_v1_record.short_sell_naked_qty[carried_restatement_au_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> carried_restatement_au_equities_v1_record.short_sell_covered_qty[carried_restatement_au_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> carried_restatement_au_equities_v1_record.short_sell_long_qty[carried_restatement_au_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 2 -> carried_restatement_au_equities_v1_record.risk_group_id[carried_restatement_au_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_record.no_trade_feat = wire[at]; at = at + 1;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 10 -> carried_restatement_au_equities_v1_record.no_trade_key[carried_restatement_au_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_record.meqse = wire[at]; at = at + 1;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 20 -> carried_restatement_au_equities_v1_record.origin_of_trans[carried_restatement_au_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 10 -> carried_restatement_au_equities_v1_record.intermediary_id[carried_restatement_au_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_record.directed_wholesale_indicator = wire[at]; at = at + 1;
  carried_restatement_au_equities_v1_record.remove_crossing_from_clearing = wire[at]; at = at + 1;
  carried_restatement_au_equities_v1_record.broker_preferencing = wire[at]; at = at + 1;
  carried_restatement_au_equities_v1_record.routing_inst = wire[at]; at = at + 1;
  carried_restatement_au_equities_v1_record.display_indicator = wire[at]; at = at + 1;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> carried_restatement_au_equities_v1_record.expire_date[carried_restatement_au_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Carried Restatement Au Equities V 1 is what was written, byte for byte */
inline equal_carried_restatement_au_equities_v1(carried_restatement_au_equities_v1_read, carried_restatement_au_equities_v1_written) {
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 8 -> assert(carried_restatement_au_equities_v1_read.transaction_time[carried_restatement_au_equities_v1_at] == carried_restatement_au_equities_v1_written.transaction_time[carried_restatement_au_equities_v1_at]); carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 10 -> assert(carried_restatement_au_equities_v1_read.account[carried_restatement_au_equities_v1_at] == carried_restatement_au_equities_v1_written.account[carried_restatement_au_equities_v1_at]); carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 2 -> assert(carried_restatement_au_equities_v1_read.trading_participant_id[carried_restatement_au_equities_v1_at] == carried_restatement_au_equities_v1_written.trading_participant_id[carried_restatement_au_equities_v1_at]); carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 20 -> assert(carried_restatement_au_equities_v1_read.cl_ord_id[carried_restatement_au_equities_v1_at] == carried_restatement_au_equities_v1_written.cl_ord_id[carried_restatement_au_equities_v1_at]); carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(carried_restatement_au_equities_v1_read.exec_inst == carried_restatement_au_equities_v1_written.exec_inst);
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 8 -> assert(carried_restatement_au_equities_v1_read.order_id[carried_restatement_au_equities_v1_at] == carried_restatement_au_equities_v1_written.order_id[carried_restatement_au_equities_v1_at]); carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> assert(carried_restatement_au_equities_v1_read.order_qty[carried_restatement_au_equities_v1_at] == carried_restatement_au_equities_v1_written.order_qty[carried_restatement_au_equities_v1_at]); carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(carried_restatement_au_equities_v1_read.ord_type == carried_restatement_au_equities_v1_written.ord_type);
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 8 -> assert(carried_restatement_au_equities_v1_read.price[carried_restatement_au_equities_v1_at] == carried_restatement_au_equities_v1_written.price[carried_restatement_au_equities_v1_at]); carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(carried_restatement_au_equities_v1_read.capacity == carried_restatement_au_equities_v1_written.capacity);
  assert(carried_restatement_au_equities_v1_read.side == carried_restatement_au_equities_v1_written.side);
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 6 -> assert(carried_restatement_au_equities_v1_read.symbol[carried_restatement_au_equities_v1_at] == carried_restatement_au_equities_v1_written.symbol[carried_restatement_au_equities_v1_at]); carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(carried_restatement_au_equities_v1_read.time_in_force == carried_restatement_au_equities_v1_written.time_in_force);
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> assert(carried_restatement_au_equities_v1_read.min_qty[carried_restatement_au_equities_v1_at] == carried_restatement_au_equities_v1_written.min_qty[carried_restatement_au_equities_v1_at]); carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> assert(carried_restatement_au_equities_v1_read.max_floor[carried_restatement_au_equities_v1_at] == carried_restatement_au_equities_v1_written.max_floor[carried_restatement_au_equities_v1_at]); carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 8 -> assert(carried_restatement_au_equities_v1_read.expire_time[carried_restatement_au_equities_v1_at] == carried_restatement_au_equities_v1_written.expire_time[carried_restatement_au_equities_v1_at]); carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> assert(carried_restatement_au_equities_v1_read.clearing_participant_id[carried_restatement_au_equities_v1_at] == carried_restatement_au_equities_v1_written.clearing_participant_id[carried_restatement_au_equities_v1_at]); carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 10 -> assert(carried_restatement_au_equities_v1_read.clearing_account[carried_restatement_au_equities_v1_at] == carried_restatement_au_equities_v1_written.clearing_account[carried_restatement_au_equities_v1_at]); carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(carried_restatement_au_equities_v1_read.undisclosed == carried_restatement_au_equities_v1_written.undisclosed);
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 15 -> assert(carried_restatement_au_equities_v1_read.client_cross_ref[carried_restatement_au_equities_v1_at] == carried_restatement_au_equities_v1_written.client_cross_ref[carried_restatement_au_equities_v1_at]); carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> assert(carried_restatement_au_equities_v1_read.short_sell_naked_qty[carried_restatement_au_equities_v1_at] == carried_restatement_au_equities_v1_written.short_sell_naked_qty[carried_restatement_au_equities_v1_at]); carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> assert(carried_restatement_au_equities_v1_read.short_sell_covered_qty[carried_restatement_au_equities_v1_at] == carried_restatement_au_equities_v1_written.short_sell_covered_qty[carried_restatement_au_equities_v1_at]); carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> assert(carried_restatement_au_equities_v1_read.short_sell_long_qty[carried_restatement_au_equities_v1_at] == carried_restatement_au_equities_v1_written.short_sell_long_qty[carried_restatement_au_equities_v1_at]); carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 2 -> assert(carried_restatement_au_equities_v1_read.risk_group_id[carried_restatement_au_equities_v1_at] == carried_restatement_au_equities_v1_written.risk_group_id[carried_restatement_au_equities_v1_at]); carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(carried_restatement_au_equities_v1_read.no_trade_feat == carried_restatement_au_equities_v1_written.no_trade_feat);
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 10 -> assert(carried_restatement_au_equities_v1_read.no_trade_key[carried_restatement_au_equities_v1_at] == carried_restatement_au_equities_v1_written.no_trade_key[carried_restatement_au_equities_v1_at]); carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(carried_restatement_au_equities_v1_read.meqse == carried_restatement_au_equities_v1_written.meqse);
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 20 -> assert(carried_restatement_au_equities_v1_read.origin_of_trans[carried_restatement_au_equities_v1_at] == carried_restatement_au_equities_v1_written.origin_of_trans[carried_restatement_au_equities_v1_at]); carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 10 -> assert(carried_restatement_au_equities_v1_read.intermediary_id[carried_restatement_au_equities_v1_at] == carried_restatement_au_equities_v1_written.intermediary_id[carried_restatement_au_equities_v1_at]); carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(carried_restatement_au_equities_v1_read.directed_wholesale_indicator == carried_restatement_au_equities_v1_written.directed_wholesale_indicator);
  assert(carried_restatement_au_equities_v1_read.remove_crossing_from_clearing == carried_restatement_au_equities_v1_written.remove_crossing_from_clearing);
  assert(carried_restatement_au_equities_v1_read.broker_preferencing == carried_restatement_au_equities_v1_written.broker_preferencing);
  assert(carried_restatement_au_equities_v1_read.routing_inst == carried_restatement_au_equities_v1_written.routing_inst);
  assert(carried_restatement_au_equities_v1_read.display_indicator == carried_restatement_au_equities_v1_written.display_indicator);
  carried_restatement_au_equities_v1_at = 0;
  do
  :: carried_restatement_au_equities_v1_at < 4 -> assert(carried_restatement_au_equities_v1_read.expire_date[carried_restatement_au_equities_v1_at] == carried_restatement_au_equities_v1_written.expire_date[carried_restatement_au_equities_v1_at]); carried_restatement_au_equities_v1_at = carried_restatement_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Done For Day Au Equities V 1: 34 bytes ---------------------------------- */

/* Done For Day messages represent orders persisted during the current day session to carry over to the next session */
typedef DoneForDayAuEquitiesV1 {
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte symbol[6]
};

int done_for_day_au_equities_v1_at;

/* every byte of Done For Day Au Equities V 1 set to one value */
inline fill_done_for_day_au_equities_v1(done_for_day_au_equities_v1_record, done_for_day_au_equities_v1_value) {
  done_for_day_au_equities_v1_at = 0;
  do
  :: done_for_day_au_equities_v1_at < 8 -> done_for_day_au_equities_v1_record.transaction_time[done_for_day_au_equities_v1_at] = done_for_day_au_equities_v1_value; done_for_day_au_equities_v1_at = done_for_day_au_equities_v1_at + 1
  :: else -> break
  od;
  done_for_day_au_equities_v1_at = 0;
  do
  :: done_for_day_au_equities_v1_at < 20 -> done_for_day_au_equities_v1_record.cl_ord_id[done_for_day_au_equities_v1_at] = done_for_day_au_equities_v1_value; done_for_day_au_equities_v1_at = done_for_day_au_equities_v1_at + 1
  :: else -> break
  od;
  done_for_day_au_equities_v1_at = 0;
  do
  :: done_for_day_au_equities_v1_at < 6 -> done_for_day_au_equities_v1_record.symbol[done_for_day_au_equities_v1_at] = done_for_day_au_equities_v1_value; done_for_day_au_equities_v1_at = done_for_day_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Done For Day Au Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_done_for_day_au_equities_v1(done_for_day_au_equities_v1_record, done_for_day_au_equities_v1_base) {
  done_for_day_au_equities_v1_at = 0;
  do
  :: done_for_day_au_equities_v1_at < 8 -> done_for_day_au_equities_v1_record.transaction_time[done_for_day_au_equities_v1_at] = (done_for_day_au_equities_v1_base + 0 + done_for_day_au_equities_v1_at + 1) % 256; done_for_day_au_equities_v1_at = done_for_day_au_equities_v1_at + 1
  :: else -> break
  od;
  done_for_day_au_equities_v1_at = 0;
  do
  :: done_for_day_au_equities_v1_at < 20 -> done_for_day_au_equities_v1_record.cl_ord_id[done_for_day_au_equities_v1_at] = (done_for_day_au_equities_v1_base + 8 + done_for_day_au_equities_v1_at + 1) % 256; done_for_day_au_equities_v1_at = done_for_day_au_equities_v1_at + 1
  :: else -> break
  od;
  done_for_day_au_equities_v1_at = 0;
  do
  :: done_for_day_au_equities_v1_at < 6 -> done_for_day_au_equities_v1_record.symbol[done_for_day_au_equities_v1_at] = (done_for_day_au_equities_v1_base + 28 + done_for_day_au_equities_v1_at + 1) % 256; done_for_day_au_equities_v1_at = done_for_day_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Done For Day Au Equities V 1 to the wire, 34 bytes from where the cursor stands */
inline encode_done_for_day_au_equities_v1(done_for_day_au_equities_v1_record) {
  done_for_day_au_equities_v1_at = 0;
  do
  :: done_for_day_au_equities_v1_at < 8 -> wire[at] = done_for_day_au_equities_v1_record.transaction_time[done_for_day_au_equities_v1_at]; at = at + 1; done_for_day_au_equities_v1_at = done_for_day_au_equities_v1_at + 1
  :: else -> break
  od;
  done_for_day_au_equities_v1_at = 0;
  do
  :: done_for_day_au_equities_v1_at < 20 -> wire[at] = done_for_day_au_equities_v1_record.cl_ord_id[done_for_day_au_equities_v1_at]; at = at + 1; done_for_day_au_equities_v1_at = done_for_day_au_equities_v1_at + 1
  :: else -> break
  od;
  done_for_day_au_equities_v1_at = 0;
  do
  :: done_for_day_au_equities_v1_at < 6 -> wire[at] = done_for_day_au_equities_v1_record.symbol[done_for_day_au_equities_v1_at]; at = at + 1; done_for_day_au_equities_v1_at = done_for_day_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Done For Day Au Equities V 1 off the wire, 34 bytes from where the cursor stands */
inline decode_done_for_day_au_equities_v1(done_for_day_au_equities_v1_record) {
  done_for_day_au_equities_v1_at = 0;
  do
  :: done_for_day_au_equities_v1_at < 8 -> done_for_day_au_equities_v1_record.transaction_time[done_for_day_au_equities_v1_at] = wire[at]; at = at + 1; done_for_day_au_equities_v1_at = done_for_day_au_equities_v1_at + 1
  :: else -> break
  od;
  done_for_day_au_equities_v1_at = 0;
  do
  :: done_for_day_au_equities_v1_at < 20 -> done_for_day_au_equities_v1_record.cl_ord_id[done_for_day_au_equities_v1_at] = wire[at]; at = at + 1; done_for_day_au_equities_v1_at = done_for_day_au_equities_v1_at + 1
  :: else -> break
  od;
  done_for_day_au_equities_v1_at = 0;
  do
  :: done_for_day_au_equities_v1_at < 6 -> done_for_day_au_equities_v1_record.symbol[done_for_day_au_equities_v1_at] = wire[at]; at = at + 1; done_for_day_au_equities_v1_at = done_for_day_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Done For Day Au Equities V 1 is what was written, byte for byte */
inline equal_done_for_day_au_equities_v1(done_for_day_au_equities_v1_read, done_for_day_au_equities_v1_written) {
  done_for_day_au_equities_v1_at = 0;
  do
  :: done_for_day_au_equities_v1_at < 8 -> assert(done_for_day_au_equities_v1_read.transaction_time[done_for_day_au_equities_v1_at] == done_for_day_au_equities_v1_written.transaction_time[done_for_day_au_equities_v1_at]); done_for_day_au_equities_v1_at = done_for_day_au_equities_v1_at + 1
  :: else -> break
  od;
  done_for_day_au_equities_v1_at = 0;
  do
  :: done_for_day_au_equities_v1_at < 20 -> assert(done_for_day_au_equities_v1_read.cl_ord_id[done_for_day_au_equities_v1_at] == done_for_day_au_equities_v1_written.cl_ord_id[done_for_day_au_equities_v1_at]); done_for_day_au_equities_v1_at = done_for_day_au_equities_v1_at + 1
  :: else -> break
  od;
  done_for_day_au_equities_v1_at = 0;
  do
  :: done_for_day_au_equities_v1_at < 6 -> assert(done_for_day_au_equities_v1_read.symbol[done_for_day_au_equities_v1_at] == done_for_day_au_equities_v1_written.symbol[done_for_day_au_equities_v1_at]); done_for_day_au_equities_v1_at = done_for_day_au_equities_v1_at + 1
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

/* Order Acknowledgement Au Equities V 1: encoded, read back, and compared */
proctype check_order_acknowledgement_au_equities_v1() {
  OrderAcknowledgementAuEquitiesV1 order_acknowledgement_au_equities_v1_sent;
  OrderAcknowledgementAuEquitiesV1 order_acknowledgement_au_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_acknowledgement_au_equities_v1(order_acknowledgement_au_equities_v1_sent, 0)
  :: pattern == 1 -> fill_order_acknowledgement_au_equities_v1(order_acknowledgement_au_equities_v1_sent, 32)
  :: pattern == 2 -> fill_order_acknowledgement_au_equities_v1(order_acknowledgement_au_equities_v1_sent, 255)
  :: else -> ramp_order_acknowledgement_au_equities_v1(order_acknowledgement_au_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_acknowledgement_au_equities_v1(order_acknowledgement_au_equities_v1_sent);
    assert(at == 192);
    at = 0;
    decode_order_acknowledgement_au_equities_v1(order_acknowledgement_au_equities_v1_got);
    assert(at == 192);
    equal_order_acknowledgement_au_equities_v1(order_acknowledgement_au_equities_v1_got, order_acknowledgement_au_equities_v1_sent)
  }
}

/* Order Rejected Au Equities V 1: encoded, read back, and compared */
proctype check_order_rejected_au_equities_v1() {
  OrderRejectedAuEquitiesV1 order_rejected_au_equities_v1_sent;
  OrderRejectedAuEquitiesV1 order_rejected_au_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_rejected_au_equities_v1(order_rejected_au_equities_v1_sent, 0)
  :: pattern == 1 -> fill_order_rejected_au_equities_v1(order_rejected_au_equities_v1_sent, 32)
  :: pattern == 2 -> fill_order_rejected_au_equities_v1(order_rejected_au_equities_v1_sent, 255)
  :: else -> ramp_order_rejected_au_equities_v1(order_rejected_au_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_rejected_au_equities_v1(order_rejected_au_equities_v1_sent);
    assert(at == 91);
    at = 0;
    decode_order_rejected_au_equities_v1(order_rejected_au_equities_v1_got);
    assert(at == 91);
    equal_order_rejected_au_equities_v1(order_rejected_au_equities_v1_got, order_rejected_au_equities_v1_sent)
  }
}

/* Order Modified Au Equities V 1: encoded, read back, and compared */
proctype check_order_modified_au_equities_v1() {
  OrderModifiedAuEquitiesV1 order_modified_au_equities_v1_sent;
  OrderModifiedAuEquitiesV1 order_modified_au_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_modified_au_equities_v1(order_modified_au_equities_v1_sent, 0)
  :: pattern == 1 -> fill_order_modified_au_equities_v1(order_modified_au_equities_v1_sent, 32)
  :: pattern == 2 -> fill_order_modified_au_equities_v1(order_modified_au_equities_v1_sent, 255)
  :: else -> ramp_order_modified_au_equities_v1(order_modified_au_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_modified_au_equities_v1(order_modified_au_equities_v1_sent);
    assert(at == 105);
    at = 0;
    decode_order_modified_au_equities_v1(order_modified_au_equities_v1_got);
    assert(at == 105);
    equal_order_modified_au_equities_v1(order_modified_au_equities_v1_got, order_modified_au_equities_v1_sent)
  }
}

/* Modify Rejected Au Equities V 1: encoded, read back, and compared */
proctype check_modify_rejected_au_equities_v1() {
  ModifyRejectedAuEquitiesV1 modify_rejected_au_equities_v1_sent;
  ModifyRejectedAuEquitiesV1 modify_rejected_au_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_rejected_au_equities_v1(modify_rejected_au_equities_v1_sent, 0)
  :: pattern == 1 -> fill_modify_rejected_au_equities_v1(modify_rejected_au_equities_v1_sent, 32)
  :: pattern == 2 -> fill_modify_rejected_au_equities_v1(modify_rejected_au_equities_v1_sent, 255)
  :: else -> ramp_modify_rejected_au_equities_v1(modify_rejected_au_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_rejected_au_equities_v1(modify_rejected_au_equities_v1_sent);
    assert(at == 111);
    at = 0;
    decode_modify_rejected_au_equities_v1(modify_rejected_au_equities_v1_got);
    assert(at == 111);
    equal_modify_rejected_au_equities_v1(modify_rejected_au_equities_v1_got, modify_rejected_au_equities_v1_sent)
  }
}

/* Order Restated Au Equities V 1: encoded, read back, and compared */
proctype check_order_restated_au_equities_v1() {
  OrderRestatedAuEquitiesV1 order_restated_au_equities_v1_sent;
  OrderRestatedAuEquitiesV1 order_restated_au_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_restated_au_equities_v1(order_restated_au_equities_v1_sent, 0)
  :: pattern == 1 -> fill_order_restated_au_equities_v1(order_restated_au_equities_v1_sent, 32)
  :: pattern == 2 -> fill_order_restated_au_equities_v1(order_restated_au_equities_v1_sent, 255)
  :: else -> ramp_order_restated_au_equities_v1(order_restated_au_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_restated_au_equities_v1(order_restated_au_equities_v1_sent);
    assert(at == 76);
    at = 0;
    decode_order_restated_au_equities_v1(order_restated_au_equities_v1_got);
    assert(at == 76);
    equal_order_restated_au_equities_v1(order_restated_au_equities_v1_got, order_restated_au_equities_v1_sent)
  }
}

/* Order Execution Au Equities V 1: encoded, read back, and compared */
proctype check_order_execution_au_equities_v1() {
  OrderExecutionAuEquitiesV1 order_execution_au_equities_v1_sent;
  OrderExecutionAuEquitiesV1 order_execution_au_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_execution_au_equities_v1(order_execution_au_equities_v1_sent, 0)
  :: pattern == 1 -> fill_order_execution_au_equities_v1(order_execution_au_equities_v1_sent, 32)
  :: pattern == 2 -> fill_order_execution_au_equities_v1(order_execution_au_equities_v1_sent, 255)
  :: else -> ramp_order_execution_au_equities_v1(order_execution_au_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_execution_au_equities_v1(order_execution_au_equities_v1_sent);
    assert(at == 104);
    at = 0;
    decode_order_execution_au_equities_v1(order_execution_au_equities_v1_got);
    assert(at == 104);
    equal_order_execution_au_equities_v1(order_execution_au_equities_v1_got, order_execution_au_equities_v1_sent)
  }
}

/* Order Cancelled Au Equities V 1: encoded, read back, and compared */
proctype check_order_cancelled_au_equities_v1() {
  OrderCancelledAuEquitiesV1 order_cancelled_au_equities_v1_sent;
  OrderCancelledAuEquitiesV1 order_cancelled_au_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancelled_au_equities_v1(order_cancelled_au_equities_v1_sent, 0)
  :: pattern == 1 -> fill_order_cancelled_au_equities_v1(order_cancelled_au_equities_v1_sent, 32)
  :: pattern == 2 -> fill_order_cancelled_au_equities_v1(order_cancelled_au_equities_v1_sent, 255)
  :: else -> ramp_order_cancelled_au_equities_v1(order_cancelled_au_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancelled_au_equities_v1(order_cancelled_au_equities_v1_sent);
    assert(at == 31);
    at = 0;
    decode_order_cancelled_au_equities_v1(order_cancelled_au_equities_v1_got);
    assert(at == 31);
    equal_order_cancelled_au_equities_v1(order_cancelled_au_equities_v1_got, order_cancelled_au_equities_v1_sent)
  }
}

/* Cancel Rejected Au Equities V 1: encoded, read back, and compared */
proctype check_cancel_rejected_au_equities_v1() {
  CancelRejectedAuEquitiesV1 cancel_rejected_au_equities_v1_sent;
  CancelRejectedAuEquitiesV1 cancel_rejected_au_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_rejected_au_equities_v1(cancel_rejected_au_equities_v1_sent, 0)
  :: pattern == 1 -> fill_cancel_rejected_au_equities_v1(cancel_rejected_au_equities_v1_sent, 32)
  :: pattern == 2 -> fill_cancel_rejected_au_equities_v1(cancel_rejected_au_equities_v1_sent, 255)
  :: else -> ramp_cancel_rejected_au_equities_v1(cancel_rejected_au_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_rejected_au_equities_v1(cancel_rejected_au_equities_v1_sent);
    assert(at == 91);
    at = 0;
    decode_cancel_rejected_au_equities_v1(cancel_rejected_au_equities_v1_got);
    assert(at == 91);
    equal_cancel_rejected_au_equities_v1(cancel_rejected_au_equities_v1_got, cancel_rejected_au_equities_v1_sent)
  }
}

/* Execution Restatement Au Equities V 1: encoded, read back, and compared */
proctype check_execution_restatement_au_equities_v1() {
  ExecutionRestatementAuEquitiesV1 execution_restatement_au_equities_v1_sent;
  ExecutionRestatementAuEquitiesV1 execution_restatement_au_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_restatement_au_equities_v1(execution_restatement_au_equities_v1_sent, 0)
  :: pattern == 1 -> fill_execution_restatement_au_equities_v1(execution_restatement_au_equities_v1_sent, 32)
  :: pattern == 2 -> fill_execution_restatement_au_equities_v1(execution_restatement_au_equities_v1_sent, 255)
  :: else -> ramp_execution_restatement_au_equities_v1(execution_restatement_au_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_restatement_au_equities_v1(execution_restatement_au_equities_v1_sent);
    assert(at == 73);
    at = 0;
    decode_execution_restatement_au_equities_v1(execution_restatement_au_equities_v1_got);
    assert(at == 73);
    equal_execution_restatement_au_equities_v1(execution_restatement_au_equities_v1_got, execution_restatement_au_equities_v1_sent)
  }
}

/* Purge Acknowledgement Au Equities V 1: encoded, read back, and compared */
proctype check_purge_acknowledgement_au_equities_v1() {
  PurgeAcknowledgementAuEquitiesV1 purge_acknowledgement_au_equities_v1_sent;
  PurgeAcknowledgementAuEquitiesV1 purge_acknowledgement_au_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_purge_acknowledgement_au_equities_v1(purge_acknowledgement_au_equities_v1_sent, 0)
  :: pattern == 1 -> fill_purge_acknowledgement_au_equities_v1(purge_acknowledgement_au_equities_v1_sent, 32)
  :: pattern == 2 -> fill_purge_acknowledgement_au_equities_v1(purge_acknowledgement_au_equities_v1_sent, 255)
  :: else -> ramp_purge_acknowledgement_au_equities_v1(purge_acknowledgement_au_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_purge_acknowledgement_au_equities_v1(purge_acknowledgement_au_equities_v1_sent);
    assert(at == 32);
    at = 0;
    decode_purge_acknowledgement_au_equities_v1(purge_acknowledgement_au_equities_v1_got);
    assert(at == 32);
    equal_purge_acknowledgement_au_equities_v1(purge_acknowledgement_au_equities_v1_got, purge_acknowledgement_au_equities_v1_sent)
  }
}

/* Purge Rejected Au Equities V 1: encoded, read back, and compared */
proctype check_purge_rejected_au_equities_v1() {
  PurgeRejectedAuEquitiesV1 purge_rejected_au_equities_v1_sent;
  PurgeRejectedAuEquitiesV1 purge_rejected_au_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_purge_rejected_au_equities_v1(purge_rejected_au_equities_v1_sent, 0)
  :: pattern == 1 -> fill_purge_rejected_au_equities_v1(purge_rejected_au_equities_v1_sent, 32)
  :: pattern == 2 -> fill_purge_rejected_au_equities_v1(purge_rejected_au_equities_v1_sent, 255)
  :: else -> ramp_purge_rejected_au_equities_v1(purge_rejected_au_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_purge_rejected_au_equities_v1(purge_rejected_au_equities_v1_sent);
    assert(at == 89);
    at = 0;
    decode_purge_rejected_au_equities_v1(purge_rejected_au_equities_v1_got);
    assert(at == 89);
    equal_purge_rejected_au_equities_v1(purge_rejected_au_equities_v1_got, purge_rejected_au_equities_v1_sent)
  }
}

/* Trade Cancel Correct Au Equities V 1: encoded, read back, and compared */
proctype check_trade_cancel_correct_au_equities_v1() {
  TradeCancelCorrectAuEquitiesV1 trade_cancel_correct_au_equities_v1_sent;
  TradeCancelCorrectAuEquitiesV1 trade_cancel_correct_au_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancel_correct_au_equities_v1(trade_cancel_correct_au_equities_v1_sent, 0)
  :: pattern == 1 -> fill_trade_cancel_correct_au_equities_v1(trade_cancel_correct_au_equities_v1_sent, 32)
  :: pattern == 2 -> fill_trade_cancel_correct_au_equities_v1(trade_cancel_correct_au_equities_v1_sent, 255)
  :: else -> ramp_trade_cancel_correct_au_equities_v1(trade_cancel_correct_au_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancel_correct_au_equities_v1(trade_cancel_correct_au_equities_v1_sent);
    assert(at == 88);
    at = 0;
    decode_trade_cancel_correct_au_equities_v1(trade_cancel_correct_au_equities_v1_got);
    assert(at == 88);
    equal_trade_cancel_correct_au_equities_v1(trade_cancel_correct_au_equities_v1_got, trade_cancel_correct_au_equities_v1_sent)
  }
}

/* Order Modified Au Equities V 2: encoded, read back, and compared */
proctype check_order_modified_au_equities_v2() {
  OrderModifiedAuEquitiesV2 order_modified_au_equities_v2_sent;
  OrderModifiedAuEquitiesV2 order_modified_au_equities_v2_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_modified_au_equities_v2(order_modified_au_equities_v2_sent, 0)
  :: pattern == 1 -> fill_order_modified_au_equities_v2(order_modified_au_equities_v2_sent, 32)
  :: pattern == 2 -> fill_order_modified_au_equities_v2(order_modified_au_equities_v2_sent, 255)
  :: else -> ramp_order_modified_au_equities_v2(order_modified_au_equities_v2_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_modified_au_equities_v2(order_modified_au_equities_v2_sent);
    assert(at == 109);
    at = 0;
    decode_order_modified_au_equities_v2(order_modified_au_equities_v2_got);
    assert(at == 109);
    equal_order_modified_au_equities_v2(order_modified_au_equities_v2_got, order_modified_au_equities_v2_sent)
  }
}

/* Carried Restatement Au Equities V 1: encoded, read back, and compared */
proctype check_carried_restatement_au_equities_v1() {
  CarriedRestatementAuEquitiesV1 carried_restatement_au_equities_v1_sent;
  CarriedRestatementAuEquitiesV1 carried_restatement_au_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_carried_restatement_au_equities_v1(carried_restatement_au_equities_v1_sent, 0)
  :: pattern == 1 -> fill_carried_restatement_au_equities_v1(carried_restatement_au_equities_v1_sent, 32)
  :: pattern == 2 -> fill_carried_restatement_au_equities_v1(carried_restatement_au_equities_v1_sent, 255)
  :: else -> ramp_carried_restatement_au_equities_v1(carried_restatement_au_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_carried_restatement_au_equities_v1(carried_restatement_au_equities_v1_sent);
    assert(at == 182);
    at = 0;
    decode_carried_restatement_au_equities_v1(carried_restatement_au_equities_v1_got);
    assert(at == 182);
    equal_carried_restatement_au_equities_v1(carried_restatement_au_equities_v1_got, carried_restatement_au_equities_v1_sent)
  }
}

/* Done For Day Au Equities V 1: encoded, read back, and compared */
proctype check_done_for_day_au_equities_v1() {
  DoneForDayAuEquitiesV1 done_for_day_au_equities_v1_sent;
  DoneForDayAuEquitiesV1 done_for_day_au_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_done_for_day_au_equities_v1(done_for_day_au_equities_v1_sent, 0)
  :: pattern == 1 -> fill_done_for_day_au_equities_v1(done_for_day_au_equities_v1_sent, 32)
  :: pattern == 2 -> fill_done_for_day_au_equities_v1(done_for_day_au_equities_v1_sent, 255)
  :: else -> ramp_done_for_day_au_equities_v1(done_for_day_au_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_done_for_day_au_equities_v1(done_for_day_au_equities_v1_sent);
    assert(at == 34);
    at = 0;
    decode_done_for_day_au_equities_v1(done_for_day_au_equities_v1_got);
    assert(at == 34);
    equal_done_for_day_au_equities_v1(done_for_day_au_equities_v1_got, done_for_day_au_equities_v1_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_exchange_message_header()
  :: run check_logout_response_message()
  :: run check_order_acknowledgement_au_equities_v1()
  :: run check_order_rejected_au_equities_v1()
  :: run check_order_modified_au_equities_v1()
  :: run check_modify_rejected_au_equities_v1()
  :: run check_order_restated_au_equities_v1()
  :: run check_order_execution_au_equities_v1()
  :: run check_order_cancelled_au_equities_v1()
  :: run check_cancel_rejected_au_equities_v1()
  :: run check_execution_restatement_au_equities_v1()
  :: run check_purge_acknowledgement_au_equities_v1()
  :: run check_purge_rejected_au_equities_v1()
  :: run check_trade_cancel_correct_au_equities_v1()
  :: run check_order_modified_au_equities_v2()
  :: run check_carried_restatement_au_equities_v1()
  :: run check_done_for_day_au_equities_v1()
  fi
}
