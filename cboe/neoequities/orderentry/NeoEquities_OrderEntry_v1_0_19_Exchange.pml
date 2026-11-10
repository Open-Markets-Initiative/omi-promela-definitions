/*
 * Chicago Board Options Exchange Order Entry
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
#define WIRE 262

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

/* ---- Order Acknowledgement Ca Equities V 1: 130 bytes ------------------------ */

/* Order Acknowledgement sent in response to a New Order message */
typedef OrderAcknowledgementCaEquitiesV1 {
  byte transaction_time[8];
  byte account[16];
  byte cl_ord_id[20];
  byte broker_id[2];
  byte order_id[8];
  byte exec_inst;
  byte order_qty[4];
  byte ord_type;
  byte price[8];
  byte stop_px[8];
  byte working_price[8];
  byte side;
  byte short_marking_exempt;
  byte symbol[14];
  byte time_in_force;
  byte max_floor[4];
  byte expire_time[8];
  byte ex_destination;
  byte no_trade_feat;
  byte no_trade_key[6];
  byte base_liquidity_indicator;
  byte true_min_qty[4];
  byte expire_date[4]
};

int order_acknowledgement_ca_equities_v1_at;

/* every byte of Order Acknowledgement Ca Equities V 1 set to one value */
inline fill_order_acknowledgement_ca_equities_v1(order_acknowledgement_ca_equities_v1_record, order_acknowledgement_ca_equities_v1_value) {
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> order_acknowledgement_ca_equities_v1_record.transaction_time[order_acknowledgement_ca_equities_v1_at] = order_acknowledgement_ca_equities_v1_value; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 16 -> order_acknowledgement_ca_equities_v1_record.account[order_acknowledgement_ca_equities_v1_at] = order_acknowledgement_ca_equities_v1_value; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 20 -> order_acknowledgement_ca_equities_v1_record.cl_ord_id[order_acknowledgement_ca_equities_v1_at] = order_acknowledgement_ca_equities_v1_value; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 2 -> order_acknowledgement_ca_equities_v1_record.broker_id[order_acknowledgement_ca_equities_v1_at] = order_acknowledgement_ca_equities_v1_value; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> order_acknowledgement_ca_equities_v1_record.order_id[order_acknowledgement_ca_equities_v1_at] = order_acknowledgement_ca_equities_v1_value; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_record.exec_inst = order_acknowledgement_ca_equities_v1_value;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 4 -> order_acknowledgement_ca_equities_v1_record.order_qty[order_acknowledgement_ca_equities_v1_at] = order_acknowledgement_ca_equities_v1_value; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_record.ord_type = order_acknowledgement_ca_equities_v1_value;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> order_acknowledgement_ca_equities_v1_record.price[order_acknowledgement_ca_equities_v1_at] = order_acknowledgement_ca_equities_v1_value; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> order_acknowledgement_ca_equities_v1_record.stop_px[order_acknowledgement_ca_equities_v1_at] = order_acknowledgement_ca_equities_v1_value; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> order_acknowledgement_ca_equities_v1_record.working_price[order_acknowledgement_ca_equities_v1_at] = order_acknowledgement_ca_equities_v1_value; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_record.side = order_acknowledgement_ca_equities_v1_value;
  order_acknowledgement_ca_equities_v1_record.short_marking_exempt = order_acknowledgement_ca_equities_v1_value;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 14 -> order_acknowledgement_ca_equities_v1_record.symbol[order_acknowledgement_ca_equities_v1_at] = order_acknowledgement_ca_equities_v1_value; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_record.time_in_force = order_acknowledgement_ca_equities_v1_value;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 4 -> order_acknowledgement_ca_equities_v1_record.max_floor[order_acknowledgement_ca_equities_v1_at] = order_acknowledgement_ca_equities_v1_value; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> order_acknowledgement_ca_equities_v1_record.expire_time[order_acknowledgement_ca_equities_v1_at] = order_acknowledgement_ca_equities_v1_value; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_record.ex_destination = order_acknowledgement_ca_equities_v1_value;
  order_acknowledgement_ca_equities_v1_record.no_trade_feat = order_acknowledgement_ca_equities_v1_value;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 6 -> order_acknowledgement_ca_equities_v1_record.no_trade_key[order_acknowledgement_ca_equities_v1_at] = order_acknowledgement_ca_equities_v1_value; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_record.base_liquidity_indicator = order_acknowledgement_ca_equities_v1_value;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 4 -> order_acknowledgement_ca_equities_v1_record.true_min_qty[order_acknowledgement_ca_equities_v1_at] = order_acknowledgement_ca_equities_v1_value; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 4 -> order_acknowledgement_ca_equities_v1_record.expire_date[order_acknowledgement_ca_equities_v1_at] = order_acknowledgement_ca_equities_v1_value; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Acknowledgement Ca Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_order_acknowledgement_ca_equities_v1(order_acknowledgement_ca_equities_v1_record, order_acknowledgement_ca_equities_v1_base) {
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> order_acknowledgement_ca_equities_v1_record.transaction_time[order_acknowledgement_ca_equities_v1_at] = (order_acknowledgement_ca_equities_v1_base + 0 + order_acknowledgement_ca_equities_v1_at + 1) % 256; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 16 -> order_acknowledgement_ca_equities_v1_record.account[order_acknowledgement_ca_equities_v1_at] = (order_acknowledgement_ca_equities_v1_base + 8 + order_acknowledgement_ca_equities_v1_at + 1) % 256; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 20 -> order_acknowledgement_ca_equities_v1_record.cl_ord_id[order_acknowledgement_ca_equities_v1_at] = (order_acknowledgement_ca_equities_v1_base + 24 + order_acknowledgement_ca_equities_v1_at + 1) % 256; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 2 -> order_acknowledgement_ca_equities_v1_record.broker_id[order_acknowledgement_ca_equities_v1_at] = (order_acknowledgement_ca_equities_v1_base + 44 + order_acknowledgement_ca_equities_v1_at + 1) % 256; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> order_acknowledgement_ca_equities_v1_record.order_id[order_acknowledgement_ca_equities_v1_at] = (order_acknowledgement_ca_equities_v1_base + 46 + order_acknowledgement_ca_equities_v1_at + 1) % 256; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_record.exec_inst = (order_acknowledgement_ca_equities_v1_base + 54 + 1) % 256;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 4 -> order_acknowledgement_ca_equities_v1_record.order_qty[order_acknowledgement_ca_equities_v1_at] = (order_acknowledgement_ca_equities_v1_base + 55 + order_acknowledgement_ca_equities_v1_at + 1) % 256; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_record.ord_type = (order_acknowledgement_ca_equities_v1_base + 59 + 1) % 256;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> order_acknowledgement_ca_equities_v1_record.price[order_acknowledgement_ca_equities_v1_at] = (order_acknowledgement_ca_equities_v1_base + 60 + order_acknowledgement_ca_equities_v1_at + 1) % 256; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> order_acknowledgement_ca_equities_v1_record.stop_px[order_acknowledgement_ca_equities_v1_at] = (order_acknowledgement_ca_equities_v1_base + 68 + order_acknowledgement_ca_equities_v1_at + 1) % 256; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> order_acknowledgement_ca_equities_v1_record.working_price[order_acknowledgement_ca_equities_v1_at] = (order_acknowledgement_ca_equities_v1_base + 76 + order_acknowledgement_ca_equities_v1_at + 1) % 256; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_record.side = (order_acknowledgement_ca_equities_v1_base + 84 + 1) % 256;
  order_acknowledgement_ca_equities_v1_record.short_marking_exempt = (order_acknowledgement_ca_equities_v1_base + 85 + 1) % 256;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 14 -> order_acknowledgement_ca_equities_v1_record.symbol[order_acknowledgement_ca_equities_v1_at] = (order_acknowledgement_ca_equities_v1_base + 86 + order_acknowledgement_ca_equities_v1_at + 1) % 256; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_record.time_in_force = (order_acknowledgement_ca_equities_v1_base + 100 + 1) % 256;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 4 -> order_acknowledgement_ca_equities_v1_record.max_floor[order_acknowledgement_ca_equities_v1_at] = (order_acknowledgement_ca_equities_v1_base + 101 + order_acknowledgement_ca_equities_v1_at + 1) % 256; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> order_acknowledgement_ca_equities_v1_record.expire_time[order_acknowledgement_ca_equities_v1_at] = (order_acknowledgement_ca_equities_v1_base + 105 + order_acknowledgement_ca_equities_v1_at + 1) % 256; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_record.ex_destination = (order_acknowledgement_ca_equities_v1_base + 113 + 1) % 256;
  order_acknowledgement_ca_equities_v1_record.no_trade_feat = (order_acknowledgement_ca_equities_v1_base + 114 + 1) % 256;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 6 -> order_acknowledgement_ca_equities_v1_record.no_trade_key[order_acknowledgement_ca_equities_v1_at] = (order_acknowledgement_ca_equities_v1_base + 115 + order_acknowledgement_ca_equities_v1_at + 1) % 256; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_record.base_liquidity_indicator = (order_acknowledgement_ca_equities_v1_base + 121 + 1) % 256;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 4 -> order_acknowledgement_ca_equities_v1_record.true_min_qty[order_acknowledgement_ca_equities_v1_at] = (order_acknowledgement_ca_equities_v1_base + 122 + order_acknowledgement_ca_equities_v1_at + 1) % 256; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 4 -> order_acknowledgement_ca_equities_v1_record.expire_date[order_acknowledgement_ca_equities_v1_at] = (order_acknowledgement_ca_equities_v1_base + 126 + order_acknowledgement_ca_equities_v1_at + 1) % 256; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Order Acknowledgement Ca Equities V 1 to the wire, 130 bytes from where the cursor stands */
inline encode_order_acknowledgement_ca_equities_v1(order_acknowledgement_ca_equities_v1_record) {
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> wire[at] = order_acknowledgement_ca_equities_v1_record.transaction_time[order_acknowledgement_ca_equities_v1_at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 16 -> wire[at] = order_acknowledgement_ca_equities_v1_record.account[order_acknowledgement_ca_equities_v1_at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 20 -> wire[at] = order_acknowledgement_ca_equities_v1_record.cl_ord_id[order_acknowledgement_ca_equities_v1_at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 2 -> wire[at] = order_acknowledgement_ca_equities_v1_record.broker_id[order_acknowledgement_ca_equities_v1_at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> wire[at] = order_acknowledgement_ca_equities_v1_record.order_id[order_acknowledgement_ca_equities_v1_at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_ca_equities_v1_record.exec_inst; at = at + 1;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 4 -> wire[at] = order_acknowledgement_ca_equities_v1_record.order_qty[order_acknowledgement_ca_equities_v1_at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_ca_equities_v1_record.ord_type; at = at + 1;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> wire[at] = order_acknowledgement_ca_equities_v1_record.price[order_acknowledgement_ca_equities_v1_at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> wire[at] = order_acknowledgement_ca_equities_v1_record.stop_px[order_acknowledgement_ca_equities_v1_at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> wire[at] = order_acknowledgement_ca_equities_v1_record.working_price[order_acknowledgement_ca_equities_v1_at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_ca_equities_v1_record.side; at = at + 1;
  wire[at] = order_acknowledgement_ca_equities_v1_record.short_marking_exempt; at = at + 1;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 14 -> wire[at] = order_acknowledgement_ca_equities_v1_record.symbol[order_acknowledgement_ca_equities_v1_at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_ca_equities_v1_record.time_in_force; at = at + 1;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 4 -> wire[at] = order_acknowledgement_ca_equities_v1_record.max_floor[order_acknowledgement_ca_equities_v1_at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> wire[at] = order_acknowledgement_ca_equities_v1_record.expire_time[order_acknowledgement_ca_equities_v1_at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_ca_equities_v1_record.ex_destination; at = at + 1;
  wire[at] = order_acknowledgement_ca_equities_v1_record.no_trade_feat; at = at + 1;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 6 -> wire[at] = order_acknowledgement_ca_equities_v1_record.no_trade_key[order_acknowledgement_ca_equities_v1_at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_ca_equities_v1_record.base_liquidity_indicator; at = at + 1;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 4 -> wire[at] = order_acknowledgement_ca_equities_v1_record.true_min_qty[order_acknowledgement_ca_equities_v1_at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 4 -> wire[at] = order_acknowledgement_ca_equities_v1_record.expire_date[order_acknowledgement_ca_equities_v1_at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Order Acknowledgement Ca Equities V 1 off the wire, 130 bytes from where the cursor stands */
inline decode_order_acknowledgement_ca_equities_v1(order_acknowledgement_ca_equities_v1_record) {
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> order_acknowledgement_ca_equities_v1_record.transaction_time[order_acknowledgement_ca_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 16 -> order_acknowledgement_ca_equities_v1_record.account[order_acknowledgement_ca_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 20 -> order_acknowledgement_ca_equities_v1_record.cl_ord_id[order_acknowledgement_ca_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 2 -> order_acknowledgement_ca_equities_v1_record.broker_id[order_acknowledgement_ca_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> order_acknowledgement_ca_equities_v1_record.order_id[order_acknowledgement_ca_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_record.exec_inst = wire[at]; at = at + 1;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 4 -> order_acknowledgement_ca_equities_v1_record.order_qty[order_acknowledgement_ca_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_record.ord_type = wire[at]; at = at + 1;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> order_acknowledgement_ca_equities_v1_record.price[order_acknowledgement_ca_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> order_acknowledgement_ca_equities_v1_record.stop_px[order_acknowledgement_ca_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> order_acknowledgement_ca_equities_v1_record.working_price[order_acknowledgement_ca_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_record.side = wire[at]; at = at + 1;
  order_acknowledgement_ca_equities_v1_record.short_marking_exempt = wire[at]; at = at + 1;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 14 -> order_acknowledgement_ca_equities_v1_record.symbol[order_acknowledgement_ca_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_record.time_in_force = wire[at]; at = at + 1;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 4 -> order_acknowledgement_ca_equities_v1_record.max_floor[order_acknowledgement_ca_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> order_acknowledgement_ca_equities_v1_record.expire_time[order_acknowledgement_ca_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_record.ex_destination = wire[at]; at = at + 1;
  order_acknowledgement_ca_equities_v1_record.no_trade_feat = wire[at]; at = at + 1;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 6 -> order_acknowledgement_ca_equities_v1_record.no_trade_key[order_acknowledgement_ca_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_record.base_liquidity_indicator = wire[at]; at = at + 1;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 4 -> order_acknowledgement_ca_equities_v1_record.true_min_qty[order_acknowledgement_ca_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 4 -> order_acknowledgement_ca_equities_v1_record.expire_date[order_acknowledgement_ca_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Acknowledgement Ca Equities V 1 is what was written, byte for byte */
inline equal_order_acknowledgement_ca_equities_v1(order_acknowledgement_ca_equities_v1_read, order_acknowledgement_ca_equities_v1_written) {
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> assert(order_acknowledgement_ca_equities_v1_read.transaction_time[order_acknowledgement_ca_equities_v1_at] == order_acknowledgement_ca_equities_v1_written.transaction_time[order_acknowledgement_ca_equities_v1_at]); order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 16 -> assert(order_acknowledgement_ca_equities_v1_read.account[order_acknowledgement_ca_equities_v1_at] == order_acknowledgement_ca_equities_v1_written.account[order_acknowledgement_ca_equities_v1_at]); order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 20 -> assert(order_acknowledgement_ca_equities_v1_read.cl_ord_id[order_acknowledgement_ca_equities_v1_at] == order_acknowledgement_ca_equities_v1_written.cl_ord_id[order_acknowledgement_ca_equities_v1_at]); order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 2 -> assert(order_acknowledgement_ca_equities_v1_read.broker_id[order_acknowledgement_ca_equities_v1_at] == order_acknowledgement_ca_equities_v1_written.broker_id[order_acknowledgement_ca_equities_v1_at]); order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> assert(order_acknowledgement_ca_equities_v1_read.order_id[order_acknowledgement_ca_equities_v1_at] == order_acknowledgement_ca_equities_v1_written.order_id[order_acknowledgement_ca_equities_v1_at]); order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_ca_equities_v1_read.exec_inst == order_acknowledgement_ca_equities_v1_written.exec_inst);
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 4 -> assert(order_acknowledgement_ca_equities_v1_read.order_qty[order_acknowledgement_ca_equities_v1_at] == order_acknowledgement_ca_equities_v1_written.order_qty[order_acknowledgement_ca_equities_v1_at]); order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_ca_equities_v1_read.ord_type == order_acknowledgement_ca_equities_v1_written.ord_type);
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> assert(order_acknowledgement_ca_equities_v1_read.price[order_acknowledgement_ca_equities_v1_at] == order_acknowledgement_ca_equities_v1_written.price[order_acknowledgement_ca_equities_v1_at]); order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> assert(order_acknowledgement_ca_equities_v1_read.stop_px[order_acknowledgement_ca_equities_v1_at] == order_acknowledgement_ca_equities_v1_written.stop_px[order_acknowledgement_ca_equities_v1_at]); order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> assert(order_acknowledgement_ca_equities_v1_read.working_price[order_acknowledgement_ca_equities_v1_at] == order_acknowledgement_ca_equities_v1_written.working_price[order_acknowledgement_ca_equities_v1_at]); order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_ca_equities_v1_read.side == order_acknowledgement_ca_equities_v1_written.side);
  assert(order_acknowledgement_ca_equities_v1_read.short_marking_exempt == order_acknowledgement_ca_equities_v1_written.short_marking_exempt);
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 14 -> assert(order_acknowledgement_ca_equities_v1_read.symbol[order_acknowledgement_ca_equities_v1_at] == order_acknowledgement_ca_equities_v1_written.symbol[order_acknowledgement_ca_equities_v1_at]); order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_ca_equities_v1_read.time_in_force == order_acknowledgement_ca_equities_v1_written.time_in_force);
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 4 -> assert(order_acknowledgement_ca_equities_v1_read.max_floor[order_acknowledgement_ca_equities_v1_at] == order_acknowledgement_ca_equities_v1_written.max_floor[order_acknowledgement_ca_equities_v1_at]); order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 8 -> assert(order_acknowledgement_ca_equities_v1_read.expire_time[order_acknowledgement_ca_equities_v1_at] == order_acknowledgement_ca_equities_v1_written.expire_time[order_acknowledgement_ca_equities_v1_at]); order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_ca_equities_v1_read.ex_destination == order_acknowledgement_ca_equities_v1_written.ex_destination);
  assert(order_acknowledgement_ca_equities_v1_read.no_trade_feat == order_acknowledgement_ca_equities_v1_written.no_trade_feat);
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 6 -> assert(order_acknowledgement_ca_equities_v1_read.no_trade_key[order_acknowledgement_ca_equities_v1_at] == order_acknowledgement_ca_equities_v1_written.no_trade_key[order_acknowledgement_ca_equities_v1_at]); order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_ca_equities_v1_read.base_liquidity_indicator == order_acknowledgement_ca_equities_v1_written.base_liquidity_indicator);
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 4 -> assert(order_acknowledgement_ca_equities_v1_read.true_min_qty[order_acknowledgement_ca_equities_v1_at] == order_acknowledgement_ca_equities_v1_written.true_min_qty[order_acknowledgement_ca_equities_v1_at]); order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_ca_equities_v1_at = 0;
  do
  :: order_acknowledgement_ca_equities_v1_at < 4 -> assert(order_acknowledgement_ca_equities_v1_read.expire_date[order_acknowledgement_ca_equities_v1_at] == order_acknowledgement_ca_equities_v1_written.expire_date[order_acknowledgement_ca_equities_v1_at]); order_acknowledgement_ca_equities_v1_at = order_acknowledgement_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Rejected Ca Equities V 1: 91 bytes -------------------------------- */

/* Order Rejected message sent in response to a New Order or New Order Cross that must be rejected */
typedef OrderRejectedCaEquitiesV1 {
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte broker_id[2];
  byte order_reject_reason;
  byte text[60]
};

int order_rejected_ca_equities_v1_at;

/* every byte of Order Rejected Ca Equities V 1 set to one value */
inline fill_order_rejected_ca_equities_v1(order_rejected_ca_equities_v1_record, order_rejected_ca_equities_v1_value) {
  order_rejected_ca_equities_v1_at = 0;
  do
  :: order_rejected_ca_equities_v1_at < 8 -> order_rejected_ca_equities_v1_record.transaction_time[order_rejected_ca_equities_v1_at] = order_rejected_ca_equities_v1_value; order_rejected_ca_equities_v1_at = order_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_ca_equities_v1_at = 0;
  do
  :: order_rejected_ca_equities_v1_at < 20 -> order_rejected_ca_equities_v1_record.cl_ord_id[order_rejected_ca_equities_v1_at] = order_rejected_ca_equities_v1_value; order_rejected_ca_equities_v1_at = order_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_ca_equities_v1_at = 0;
  do
  :: order_rejected_ca_equities_v1_at < 2 -> order_rejected_ca_equities_v1_record.broker_id[order_rejected_ca_equities_v1_at] = order_rejected_ca_equities_v1_value; order_rejected_ca_equities_v1_at = order_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_ca_equities_v1_record.order_reject_reason = order_rejected_ca_equities_v1_value;
  order_rejected_ca_equities_v1_at = 0;
  do
  :: order_rejected_ca_equities_v1_at < 60 -> order_rejected_ca_equities_v1_record.text[order_rejected_ca_equities_v1_at] = order_rejected_ca_equities_v1_value; order_rejected_ca_equities_v1_at = order_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Rejected Ca Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_order_rejected_ca_equities_v1(order_rejected_ca_equities_v1_record, order_rejected_ca_equities_v1_base) {
  order_rejected_ca_equities_v1_at = 0;
  do
  :: order_rejected_ca_equities_v1_at < 8 -> order_rejected_ca_equities_v1_record.transaction_time[order_rejected_ca_equities_v1_at] = (order_rejected_ca_equities_v1_base + 0 + order_rejected_ca_equities_v1_at + 1) % 256; order_rejected_ca_equities_v1_at = order_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_ca_equities_v1_at = 0;
  do
  :: order_rejected_ca_equities_v1_at < 20 -> order_rejected_ca_equities_v1_record.cl_ord_id[order_rejected_ca_equities_v1_at] = (order_rejected_ca_equities_v1_base + 8 + order_rejected_ca_equities_v1_at + 1) % 256; order_rejected_ca_equities_v1_at = order_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_ca_equities_v1_at = 0;
  do
  :: order_rejected_ca_equities_v1_at < 2 -> order_rejected_ca_equities_v1_record.broker_id[order_rejected_ca_equities_v1_at] = (order_rejected_ca_equities_v1_base + 28 + order_rejected_ca_equities_v1_at + 1) % 256; order_rejected_ca_equities_v1_at = order_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_ca_equities_v1_record.order_reject_reason = (order_rejected_ca_equities_v1_base + 30 + 1) % 256;
  order_rejected_ca_equities_v1_at = 0;
  do
  :: order_rejected_ca_equities_v1_at < 60 -> order_rejected_ca_equities_v1_record.text[order_rejected_ca_equities_v1_at] = (order_rejected_ca_equities_v1_base + 31 + order_rejected_ca_equities_v1_at + 1) % 256; order_rejected_ca_equities_v1_at = order_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Order Rejected Ca Equities V 1 to the wire, 91 bytes from where the cursor stands */
inline encode_order_rejected_ca_equities_v1(order_rejected_ca_equities_v1_record) {
  order_rejected_ca_equities_v1_at = 0;
  do
  :: order_rejected_ca_equities_v1_at < 8 -> wire[at] = order_rejected_ca_equities_v1_record.transaction_time[order_rejected_ca_equities_v1_at]; at = at + 1; order_rejected_ca_equities_v1_at = order_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_ca_equities_v1_at = 0;
  do
  :: order_rejected_ca_equities_v1_at < 20 -> wire[at] = order_rejected_ca_equities_v1_record.cl_ord_id[order_rejected_ca_equities_v1_at]; at = at + 1; order_rejected_ca_equities_v1_at = order_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_ca_equities_v1_at = 0;
  do
  :: order_rejected_ca_equities_v1_at < 2 -> wire[at] = order_rejected_ca_equities_v1_record.broker_id[order_rejected_ca_equities_v1_at]; at = at + 1; order_rejected_ca_equities_v1_at = order_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_rejected_ca_equities_v1_record.order_reject_reason; at = at + 1;
  order_rejected_ca_equities_v1_at = 0;
  do
  :: order_rejected_ca_equities_v1_at < 60 -> wire[at] = order_rejected_ca_equities_v1_record.text[order_rejected_ca_equities_v1_at]; at = at + 1; order_rejected_ca_equities_v1_at = order_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Order Rejected Ca Equities V 1 off the wire, 91 bytes from where the cursor stands */
inline decode_order_rejected_ca_equities_v1(order_rejected_ca_equities_v1_record) {
  order_rejected_ca_equities_v1_at = 0;
  do
  :: order_rejected_ca_equities_v1_at < 8 -> order_rejected_ca_equities_v1_record.transaction_time[order_rejected_ca_equities_v1_at] = wire[at]; at = at + 1; order_rejected_ca_equities_v1_at = order_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_ca_equities_v1_at = 0;
  do
  :: order_rejected_ca_equities_v1_at < 20 -> order_rejected_ca_equities_v1_record.cl_ord_id[order_rejected_ca_equities_v1_at] = wire[at]; at = at + 1; order_rejected_ca_equities_v1_at = order_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_ca_equities_v1_at = 0;
  do
  :: order_rejected_ca_equities_v1_at < 2 -> order_rejected_ca_equities_v1_record.broker_id[order_rejected_ca_equities_v1_at] = wire[at]; at = at + 1; order_rejected_ca_equities_v1_at = order_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_ca_equities_v1_record.order_reject_reason = wire[at]; at = at + 1;
  order_rejected_ca_equities_v1_at = 0;
  do
  :: order_rejected_ca_equities_v1_at < 60 -> order_rejected_ca_equities_v1_record.text[order_rejected_ca_equities_v1_at] = wire[at]; at = at + 1; order_rejected_ca_equities_v1_at = order_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Rejected Ca Equities V 1 is what was written, byte for byte */
inline equal_order_rejected_ca_equities_v1(order_rejected_ca_equities_v1_read, order_rejected_ca_equities_v1_written) {
  order_rejected_ca_equities_v1_at = 0;
  do
  :: order_rejected_ca_equities_v1_at < 8 -> assert(order_rejected_ca_equities_v1_read.transaction_time[order_rejected_ca_equities_v1_at] == order_rejected_ca_equities_v1_written.transaction_time[order_rejected_ca_equities_v1_at]); order_rejected_ca_equities_v1_at = order_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_ca_equities_v1_at = 0;
  do
  :: order_rejected_ca_equities_v1_at < 20 -> assert(order_rejected_ca_equities_v1_read.cl_ord_id[order_rejected_ca_equities_v1_at] == order_rejected_ca_equities_v1_written.cl_ord_id[order_rejected_ca_equities_v1_at]); order_rejected_ca_equities_v1_at = order_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_ca_equities_v1_at = 0;
  do
  :: order_rejected_ca_equities_v1_at < 2 -> assert(order_rejected_ca_equities_v1_read.broker_id[order_rejected_ca_equities_v1_at] == order_rejected_ca_equities_v1_written.broker_id[order_rejected_ca_equities_v1_at]); order_rejected_ca_equities_v1_at = order_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_rejected_ca_equities_v1_read.order_reject_reason == order_rejected_ca_equities_v1_written.order_reject_reason);
  order_rejected_ca_equities_v1_at = 0;
  do
  :: order_rejected_ca_equities_v1_at < 60 -> assert(order_rejected_ca_equities_v1_read.text[order_rejected_ca_equities_v1_at] == order_rejected_ca_equities_v1_written.text[order_rejected_ca_equities_v1_at]); order_rejected_ca_equities_v1_at = order_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Modified Ca Equities V 1: 242 bytes ------------------------------- */

/* Order Modified message sent in response to a Modify Order indicating successful modification */
typedef OrderModifiedCaEquitiesV1 {
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte broker_id[2];
  byte order_id[8];
  byte account[16];
  byte time_in_force;
  byte max_floor[4];
  byte expire_date[4];
  byte lei_order_origin;
  byte lei_routing_arrangement_indicator;
  byte umir_account_type;
  byte lei_customer_account[20];
  byte lei_algorithm_id[20];
  byte customer_lei[52];
  byte broker_lei[20];
  byte order_qty[4];
  byte orig_cl_ord_id[20];
  byte leaves_qty[4];
  byte price[8];
  byte stop_px[8];
  byte true_min_qty[4];
  byte secondary_order_id[8];
  byte expire_time[8]
};

int order_modified_ca_equities_v1_at;

/* every byte of Order Modified Ca Equities V 1 set to one value */
inline fill_order_modified_ca_equities_v1(order_modified_ca_equities_v1_record, order_modified_ca_equities_v1_value) {
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> order_modified_ca_equities_v1_record.transaction_time[order_modified_ca_equities_v1_at] = order_modified_ca_equities_v1_value; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 20 -> order_modified_ca_equities_v1_record.cl_ord_id[order_modified_ca_equities_v1_at] = order_modified_ca_equities_v1_value; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 2 -> order_modified_ca_equities_v1_record.broker_id[order_modified_ca_equities_v1_at] = order_modified_ca_equities_v1_value; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> order_modified_ca_equities_v1_record.order_id[order_modified_ca_equities_v1_at] = order_modified_ca_equities_v1_value; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 16 -> order_modified_ca_equities_v1_record.account[order_modified_ca_equities_v1_at] = order_modified_ca_equities_v1_value; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_record.time_in_force = order_modified_ca_equities_v1_value;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 4 -> order_modified_ca_equities_v1_record.max_floor[order_modified_ca_equities_v1_at] = order_modified_ca_equities_v1_value; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 4 -> order_modified_ca_equities_v1_record.expire_date[order_modified_ca_equities_v1_at] = order_modified_ca_equities_v1_value; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_record.lei_order_origin = order_modified_ca_equities_v1_value;
  order_modified_ca_equities_v1_record.lei_routing_arrangement_indicator = order_modified_ca_equities_v1_value;
  order_modified_ca_equities_v1_record.umir_account_type = order_modified_ca_equities_v1_value;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 20 -> order_modified_ca_equities_v1_record.lei_customer_account[order_modified_ca_equities_v1_at] = order_modified_ca_equities_v1_value; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 20 -> order_modified_ca_equities_v1_record.lei_algorithm_id[order_modified_ca_equities_v1_at] = order_modified_ca_equities_v1_value; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 52 -> order_modified_ca_equities_v1_record.customer_lei[order_modified_ca_equities_v1_at] = order_modified_ca_equities_v1_value; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 20 -> order_modified_ca_equities_v1_record.broker_lei[order_modified_ca_equities_v1_at] = order_modified_ca_equities_v1_value; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 4 -> order_modified_ca_equities_v1_record.order_qty[order_modified_ca_equities_v1_at] = order_modified_ca_equities_v1_value; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 20 -> order_modified_ca_equities_v1_record.orig_cl_ord_id[order_modified_ca_equities_v1_at] = order_modified_ca_equities_v1_value; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 4 -> order_modified_ca_equities_v1_record.leaves_qty[order_modified_ca_equities_v1_at] = order_modified_ca_equities_v1_value; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> order_modified_ca_equities_v1_record.price[order_modified_ca_equities_v1_at] = order_modified_ca_equities_v1_value; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> order_modified_ca_equities_v1_record.stop_px[order_modified_ca_equities_v1_at] = order_modified_ca_equities_v1_value; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 4 -> order_modified_ca_equities_v1_record.true_min_qty[order_modified_ca_equities_v1_at] = order_modified_ca_equities_v1_value; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> order_modified_ca_equities_v1_record.secondary_order_id[order_modified_ca_equities_v1_at] = order_modified_ca_equities_v1_value; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> order_modified_ca_equities_v1_record.expire_time[order_modified_ca_equities_v1_at] = order_modified_ca_equities_v1_value; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Modified Ca Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_order_modified_ca_equities_v1(order_modified_ca_equities_v1_record, order_modified_ca_equities_v1_base) {
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> order_modified_ca_equities_v1_record.transaction_time[order_modified_ca_equities_v1_at] = (order_modified_ca_equities_v1_base + 0 + order_modified_ca_equities_v1_at + 1) % 256; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 20 -> order_modified_ca_equities_v1_record.cl_ord_id[order_modified_ca_equities_v1_at] = (order_modified_ca_equities_v1_base + 8 + order_modified_ca_equities_v1_at + 1) % 256; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 2 -> order_modified_ca_equities_v1_record.broker_id[order_modified_ca_equities_v1_at] = (order_modified_ca_equities_v1_base + 28 + order_modified_ca_equities_v1_at + 1) % 256; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> order_modified_ca_equities_v1_record.order_id[order_modified_ca_equities_v1_at] = (order_modified_ca_equities_v1_base + 30 + order_modified_ca_equities_v1_at + 1) % 256; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 16 -> order_modified_ca_equities_v1_record.account[order_modified_ca_equities_v1_at] = (order_modified_ca_equities_v1_base + 38 + order_modified_ca_equities_v1_at + 1) % 256; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_record.time_in_force = (order_modified_ca_equities_v1_base + 54 + 1) % 256;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 4 -> order_modified_ca_equities_v1_record.max_floor[order_modified_ca_equities_v1_at] = (order_modified_ca_equities_v1_base + 55 + order_modified_ca_equities_v1_at + 1) % 256; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 4 -> order_modified_ca_equities_v1_record.expire_date[order_modified_ca_equities_v1_at] = (order_modified_ca_equities_v1_base + 59 + order_modified_ca_equities_v1_at + 1) % 256; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_record.lei_order_origin = (order_modified_ca_equities_v1_base + 63 + 1) % 256;
  order_modified_ca_equities_v1_record.lei_routing_arrangement_indicator = (order_modified_ca_equities_v1_base + 64 + 1) % 256;
  order_modified_ca_equities_v1_record.umir_account_type = (order_modified_ca_equities_v1_base + 65 + 1) % 256;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 20 -> order_modified_ca_equities_v1_record.lei_customer_account[order_modified_ca_equities_v1_at] = (order_modified_ca_equities_v1_base + 66 + order_modified_ca_equities_v1_at + 1) % 256; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 20 -> order_modified_ca_equities_v1_record.lei_algorithm_id[order_modified_ca_equities_v1_at] = (order_modified_ca_equities_v1_base + 86 + order_modified_ca_equities_v1_at + 1) % 256; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 52 -> order_modified_ca_equities_v1_record.customer_lei[order_modified_ca_equities_v1_at] = (order_modified_ca_equities_v1_base + 106 + order_modified_ca_equities_v1_at + 1) % 256; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 20 -> order_modified_ca_equities_v1_record.broker_lei[order_modified_ca_equities_v1_at] = (order_modified_ca_equities_v1_base + 158 + order_modified_ca_equities_v1_at + 1) % 256; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 4 -> order_modified_ca_equities_v1_record.order_qty[order_modified_ca_equities_v1_at] = (order_modified_ca_equities_v1_base + 178 + order_modified_ca_equities_v1_at + 1) % 256; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 20 -> order_modified_ca_equities_v1_record.orig_cl_ord_id[order_modified_ca_equities_v1_at] = (order_modified_ca_equities_v1_base + 182 + order_modified_ca_equities_v1_at + 1) % 256; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 4 -> order_modified_ca_equities_v1_record.leaves_qty[order_modified_ca_equities_v1_at] = (order_modified_ca_equities_v1_base + 202 + order_modified_ca_equities_v1_at + 1) % 256; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> order_modified_ca_equities_v1_record.price[order_modified_ca_equities_v1_at] = (order_modified_ca_equities_v1_base + 206 + order_modified_ca_equities_v1_at + 1) % 256; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> order_modified_ca_equities_v1_record.stop_px[order_modified_ca_equities_v1_at] = (order_modified_ca_equities_v1_base + 214 + order_modified_ca_equities_v1_at + 1) % 256; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 4 -> order_modified_ca_equities_v1_record.true_min_qty[order_modified_ca_equities_v1_at] = (order_modified_ca_equities_v1_base + 222 + order_modified_ca_equities_v1_at + 1) % 256; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> order_modified_ca_equities_v1_record.secondary_order_id[order_modified_ca_equities_v1_at] = (order_modified_ca_equities_v1_base + 226 + order_modified_ca_equities_v1_at + 1) % 256; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> order_modified_ca_equities_v1_record.expire_time[order_modified_ca_equities_v1_at] = (order_modified_ca_equities_v1_base + 234 + order_modified_ca_equities_v1_at + 1) % 256; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modified Ca Equities V 1 to the wire, 242 bytes from where the cursor stands */
inline encode_order_modified_ca_equities_v1(order_modified_ca_equities_v1_record) {
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> wire[at] = order_modified_ca_equities_v1_record.transaction_time[order_modified_ca_equities_v1_at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 20 -> wire[at] = order_modified_ca_equities_v1_record.cl_ord_id[order_modified_ca_equities_v1_at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 2 -> wire[at] = order_modified_ca_equities_v1_record.broker_id[order_modified_ca_equities_v1_at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> wire[at] = order_modified_ca_equities_v1_record.order_id[order_modified_ca_equities_v1_at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 16 -> wire[at] = order_modified_ca_equities_v1_record.account[order_modified_ca_equities_v1_at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_modified_ca_equities_v1_record.time_in_force; at = at + 1;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 4 -> wire[at] = order_modified_ca_equities_v1_record.max_floor[order_modified_ca_equities_v1_at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 4 -> wire[at] = order_modified_ca_equities_v1_record.expire_date[order_modified_ca_equities_v1_at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_modified_ca_equities_v1_record.lei_order_origin; at = at + 1;
  wire[at] = order_modified_ca_equities_v1_record.lei_routing_arrangement_indicator; at = at + 1;
  wire[at] = order_modified_ca_equities_v1_record.umir_account_type; at = at + 1;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 20 -> wire[at] = order_modified_ca_equities_v1_record.lei_customer_account[order_modified_ca_equities_v1_at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 20 -> wire[at] = order_modified_ca_equities_v1_record.lei_algorithm_id[order_modified_ca_equities_v1_at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 52 -> wire[at] = order_modified_ca_equities_v1_record.customer_lei[order_modified_ca_equities_v1_at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 20 -> wire[at] = order_modified_ca_equities_v1_record.broker_lei[order_modified_ca_equities_v1_at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 4 -> wire[at] = order_modified_ca_equities_v1_record.order_qty[order_modified_ca_equities_v1_at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 20 -> wire[at] = order_modified_ca_equities_v1_record.orig_cl_ord_id[order_modified_ca_equities_v1_at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 4 -> wire[at] = order_modified_ca_equities_v1_record.leaves_qty[order_modified_ca_equities_v1_at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> wire[at] = order_modified_ca_equities_v1_record.price[order_modified_ca_equities_v1_at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> wire[at] = order_modified_ca_equities_v1_record.stop_px[order_modified_ca_equities_v1_at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 4 -> wire[at] = order_modified_ca_equities_v1_record.true_min_qty[order_modified_ca_equities_v1_at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> wire[at] = order_modified_ca_equities_v1_record.secondary_order_id[order_modified_ca_equities_v1_at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> wire[at] = order_modified_ca_equities_v1_record.expire_time[order_modified_ca_equities_v1_at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modified Ca Equities V 1 off the wire, 242 bytes from where the cursor stands */
inline decode_order_modified_ca_equities_v1(order_modified_ca_equities_v1_record) {
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> order_modified_ca_equities_v1_record.transaction_time[order_modified_ca_equities_v1_at] = wire[at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 20 -> order_modified_ca_equities_v1_record.cl_ord_id[order_modified_ca_equities_v1_at] = wire[at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 2 -> order_modified_ca_equities_v1_record.broker_id[order_modified_ca_equities_v1_at] = wire[at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> order_modified_ca_equities_v1_record.order_id[order_modified_ca_equities_v1_at] = wire[at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 16 -> order_modified_ca_equities_v1_record.account[order_modified_ca_equities_v1_at] = wire[at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_record.time_in_force = wire[at]; at = at + 1;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 4 -> order_modified_ca_equities_v1_record.max_floor[order_modified_ca_equities_v1_at] = wire[at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 4 -> order_modified_ca_equities_v1_record.expire_date[order_modified_ca_equities_v1_at] = wire[at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_record.lei_order_origin = wire[at]; at = at + 1;
  order_modified_ca_equities_v1_record.lei_routing_arrangement_indicator = wire[at]; at = at + 1;
  order_modified_ca_equities_v1_record.umir_account_type = wire[at]; at = at + 1;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 20 -> order_modified_ca_equities_v1_record.lei_customer_account[order_modified_ca_equities_v1_at] = wire[at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 20 -> order_modified_ca_equities_v1_record.lei_algorithm_id[order_modified_ca_equities_v1_at] = wire[at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 52 -> order_modified_ca_equities_v1_record.customer_lei[order_modified_ca_equities_v1_at] = wire[at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 20 -> order_modified_ca_equities_v1_record.broker_lei[order_modified_ca_equities_v1_at] = wire[at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 4 -> order_modified_ca_equities_v1_record.order_qty[order_modified_ca_equities_v1_at] = wire[at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 20 -> order_modified_ca_equities_v1_record.orig_cl_ord_id[order_modified_ca_equities_v1_at] = wire[at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 4 -> order_modified_ca_equities_v1_record.leaves_qty[order_modified_ca_equities_v1_at] = wire[at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> order_modified_ca_equities_v1_record.price[order_modified_ca_equities_v1_at] = wire[at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> order_modified_ca_equities_v1_record.stop_px[order_modified_ca_equities_v1_at] = wire[at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 4 -> order_modified_ca_equities_v1_record.true_min_qty[order_modified_ca_equities_v1_at] = wire[at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> order_modified_ca_equities_v1_record.secondary_order_id[order_modified_ca_equities_v1_at] = wire[at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> order_modified_ca_equities_v1_record.expire_time[order_modified_ca_equities_v1_at] = wire[at]; at = at + 1; order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Modified Ca Equities V 1 is what was written, byte for byte */
inline equal_order_modified_ca_equities_v1(order_modified_ca_equities_v1_read, order_modified_ca_equities_v1_written) {
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> assert(order_modified_ca_equities_v1_read.transaction_time[order_modified_ca_equities_v1_at] == order_modified_ca_equities_v1_written.transaction_time[order_modified_ca_equities_v1_at]); order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 20 -> assert(order_modified_ca_equities_v1_read.cl_ord_id[order_modified_ca_equities_v1_at] == order_modified_ca_equities_v1_written.cl_ord_id[order_modified_ca_equities_v1_at]); order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 2 -> assert(order_modified_ca_equities_v1_read.broker_id[order_modified_ca_equities_v1_at] == order_modified_ca_equities_v1_written.broker_id[order_modified_ca_equities_v1_at]); order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> assert(order_modified_ca_equities_v1_read.order_id[order_modified_ca_equities_v1_at] == order_modified_ca_equities_v1_written.order_id[order_modified_ca_equities_v1_at]); order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 16 -> assert(order_modified_ca_equities_v1_read.account[order_modified_ca_equities_v1_at] == order_modified_ca_equities_v1_written.account[order_modified_ca_equities_v1_at]); order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_modified_ca_equities_v1_read.time_in_force == order_modified_ca_equities_v1_written.time_in_force);
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 4 -> assert(order_modified_ca_equities_v1_read.max_floor[order_modified_ca_equities_v1_at] == order_modified_ca_equities_v1_written.max_floor[order_modified_ca_equities_v1_at]); order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 4 -> assert(order_modified_ca_equities_v1_read.expire_date[order_modified_ca_equities_v1_at] == order_modified_ca_equities_v1_written.expire_date[order_modified_ca_equities_v1_at]); order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_modified_ca_equities_v1_read.lei_order_origin == order_modified_ca_equities_v1_written.lei_order_origin);
  assert(order_modified_ca_equities_v1_read.lei_routing_arrangement_indicator == order_modified_ca_equities_v1_written.lei_routing_arrangement_indicator);
  assert(order_modified_ca_equities_v1_read.umir_account_type == order_modified_ca_equities_v1_written.umir_account_type);
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 20 -> assert(order_modified_ca_equities_v1_read.lei_customer_account[order_modified_ca_equities_v1_at] == order_modified_ca_equities_v1_written.lei_customer_account[order_modified_ca_equities_v1_at]); order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 20 -> assert(order_modified_ca_equities_v1_read.lei_algorithm_id[order_modified_ca_equities_v1_at] == order_modified_ca_equities_v1_written.lei_algorithm_id[order_modified_ca_equities_v1_at]); order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 52 -> assert(order_modified_ca_equities_v1_read.customer_lei[order_modified_ca_equities_v1_at] == order_modified_ca_equities_v1_written.customer_lei[order_modified_ca_equities_v1_at]); order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 20 -> assert(order_modified_ca_equities_v1_read.broker_lei[order_modified_ca_equities_v1_at] == order_modified_ca_equities_v1_written.broker_lei[order_modified_ca_equities_v1_at]); order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 4 -> assert(order_modified_ca_equities_v1_read.order_qty[order_modified_ca_equities_v1_at] == order_modified_ca_equities_v1_written.order_qty[order_modified_ca_equities_v1_at]); order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 20 -> assert(order_modified_ca_equities_v1_read.orig_cl_ord_id[order_modified_ca_equities_v1_at] == order_modified_ca_equities_v1_written.orig_cl_ord_id[order_modified_ca_equities_v1_at]); order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 4 -> assert(order_modified_ca_equities_v1_read.leaves_qty[order_modified_ca_equities_v1_at] == order_modified_ca_equities_v1_written.leaves_qty[order_modified_ca_equities_v1_at]); order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> assert(order_modified_ca_equities_v1_read.price[order_modified_ca_equities_v1_at] == order_modified_ca_equities_v1_written.price[order_modified_ca_equities_v1_at]); order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> assert(order_modified_ca_equities_v1_read.stop_px[order_modified_ca_equities_v1_at] == order_modified_ca_equities_v1_written.stop_px[order_modified_ca_equities_v1_at]); order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 4 -> assert(order_modified_ca_equities_v1_read.true_min_qty[order_modified_ca_equities_v1_at] == order_modified_ca_equities_v1_written.true_min_qty[order_modified_ca_equities_v1_at]); order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> assert(order_modified_ca_equities_v1_read.secondary_order_id[order_modified_ca_equities_v1_at] == order_modified_ca_equities_v1_written.secondary_order_id[order_modified_ca_equities_v1_at]); order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_ca_equities_v1_at = 0;
  do
  :: order_modified_ca_equities_v1_at < 8 -> assert(order_modified_ca_equities_v1_read.expire_time[order_modified_ca_equities_v1_at] == order_modified_ca_equities_v1_written.expire_time[order_modified_ca_equities_v1_at]); order_modified_ca_equities_v1_at = order_modified_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Rejected Ca Equities V 1: 111 bytes ------------------------------ */

/* Modify Rejected message sent in response to a Modify Order that cannot be modified */
typedef ModifyRejectedCaEquitiesV1 {
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte broker_id[2];
  byte orig_cl_ord_id[20];
  byte text[60];
  byte modify_reject_reason
};

int modify_rejected_ca_equities_v1_at;

/* every byte of Modify Rejected Ca Equities V 1 set to one value */
inline fill_modify_rejected_ca_equities_v1(modify_rejected_ca_equities_v1_record, modify_rejected_ca_equities_v1_value) {
  modify_rejected_ca_equities_v1_at = 0;
  do
  :: modify_rejected_ca_equities_v1_at < 8 -> modify_rejected_ca_equities_v1_record.transaction_time[modify_rejected_ca_equities_v1_at] = modify_rejected_ca_equities_v1_value; modify_rejected_ca_equities_v1_at = modify_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_ca_equities_v1_at = 0;
  do
  :: modify_rejected_ca_equities_v1_at < 20 -> modify_rejected_ca_equities_v1_record.cl_ord_id[modify_rejected_ca_equities_v1_at] = modify_rejected_ca_equities_v1_value; modify_rejected_ca_equities_v1_at = modify_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_ca_equities_v1_at = 0;
  do
  :: modify_rejected_ca_equities_v1_at < 2 -> modify_rejected_ca_equities_v1_record.broker_id[modify_rejected_ca_equities_v1_at] = modify_rejected_ca_equities_v1_value; modify_rejected_ca_equities_v1_at = modify_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_ca_equities_v1_at = 0;
  do
  :: modify_rejected_ca_equities_v1_at < 20 -> modify_rejected_ca_equities_v1_record.orig_cl_ord_id[modify_rejected_ca_equities_v1_at] = modify_rejected_ca_equities_v1_value; modify_rejected_ca_equities_v1_at = modify_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_ca_equities_v1_at = 0;
  do
  :: modify_rejected_ca_equities_v1_at < 60 -> modify_rejected_ca_equities_v1_record.text[modify_rejected_ca_equities_v1_at] = modify_rejected_ca_equities_v1_value; modify_rejected_ca_equities_v1_at = modify_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_ca_equities_v1_record.modify_reject_reason = modify_rejected_ca_equities_v1_value;
  skip
}

/* each byte of Modify Rejected Ca Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_modify_rejected_ca_equities_v1(modify_rejected_ca_equities_v1_record, modify_rejected_ca_equities_v1_base) {
  modify_rejected_ca_equities_v1_at = 0;
  do
  :: modify_rejected_ca_equities_v1_at < 8 -> modify_rejected_ca_equities_v1_record.transaction_time[modify_rejected_ca_equities_v1_at] = (modify_rejected_ca_equities_v1_base + 0 + modify_rejected_ca_equities_v1_at + 1) % 256; modify_rejected_ca_equities_v1_at = modify_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_ca_equities_v1_at = 0;
  do
  :: modify_rejected_ca_equities_v1_at < 20 -> modify_rejected_ca_equities_v1_record.cl_ord_id[modify_rejected_ca_equities_v1_at] = (modify_rejected_ca_equities_v1_base + 8 + modify_rejected_ca_equities_v1_at + 1) % 256; modify_rejected_ca_equities_v1_at = modify_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_ca_equities_v1_at = 0;
  do
  :: modify_rejected_ca_equities_v1_at < 2 -> modify_rejected_ca_equities_v1_record.broker_id[modify_rejected_ca_equities_v1_at] = (modify_rejected_ca_equities_v1_base + 28 + modify_rejected_ca_equities_v1_at + 1) % 256; modify_rejected_ca_equities_v1_at = modify_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_ca_equities_v1_at = 0;
  do
  :: modify_rejected_ca_equities_v1_at < 20 -> modify_rejected_ca_equities_v1_record.orig_cl_ord_id[modify_rejected_ca_equities_v1_at] = (modify_rejected_ca_equities_v1_base + 30 + modify_rejected_ca_equities_v1_at + 1) % 256; modify_rejected_ca_equities_v1_at = modify_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_ca_equities_v1_at = 0;
  do
  :: modify_rejected_ca_equities_v1_at < 60 -> modify_rejected_ca_equities_v1_record.text[modify_rejected_ca_equities_v1_at] = (modify_rejected_ca_equities_v1_base + 50 + modify_rejected_ca_equities_v1_at + 1) % 256; modify_rejected_ca_equities_v1_at = modify_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_ca_equities_v1_record.modify_reject_reason = (modify_rejected_ca_equities_v1_base + 110 + 1) % 256;
  skip
}

/* Modify Rejected Ca Equities V 1 to the wire, 111 bytes from where the cursor stands */
inline encode_modify_rejected_ca_equities_v1(modify_rejected_ca_equities_v1_record) {
  modify_rejected_ca_equities_v1_at = 0;
  do
  :: modify_rejected_ca_equities_v1_at < 8 -> wire[at] = modify_rejected_ca_equities_v1_record.transaction_time[modify_rejected_ca_equities_v1_at]; at = at + 1; modify_rejected_ca_equities_v1_at = modify_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_ca_equities_v1_at = 0;
  do
  :: modify_rejected_ca_equities_v1_at < 20 -> wire[at] = modify_rejected_ca_equities_v1_record.cl_ord_id[modify_rejected_ca_equities_v1_at]; at = at + 1; modify_rejected_ca_equities_v1_at = modify_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_ca_equities_v1_at = 0;
  do
  :: modify_rejected_ca_equities_v1_at < 2 -> wire[at] = modify_rejected_ca_equities_v1_record.broker_id[modify_rejected_ca_equities_v1_at]; at = at + 1; modify_rejected_ca_equities_v1_at = modify_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_ca_equities_v1_at = 0;
  do
  :: modify_rejected_ca_equities_v1_at < 20 -> wire[at] = modify_rejected_ca_equities_v1_record.orig_cl_ord_id[modify_rejected_ca_equities_v1_at]; at = at + 1; modify_rejected_ca_equities_v1_at = modify_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_ca_equities_v1_at = 0;
  do
  :: modify_rejected_ca_equities_v1_at < 60 -> wire[at] = modify_rejected_ca_equities_v1_record.text[modify_rejected_ca_equities_v1_at]; at = at + 1; modify_rejected_ca_equities_v1_at = modify_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = modify_rejected_ca_equities_v1_record.modify_reject_reason; at = at + 1;
  skip
}

/* Modify Rejected Ca Equities V 1 off the wire, 111 bytes from where the cursor stands */
inline decode_modify_rejected_ca_equities_v1(modify_rejected_ca_equities_v1_record) {
  modify_rejected_ca_equities_v1_at = 0;
  do
  :: modify_rejected_ca_equities_v1_at < 8 -> modify_rejected_ca_equities_v1_record.transaction_time[modify_rejected_ca_equities_v1_at] = wire[at]; at = at + 1; modify_rejected_ca_equities_v1_at = modify_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_ca_equities_v1_at = 0;
  do
  :: modify_rejected_ca_equities_v1_at < 20 -> modify_rejected_ca_equities_v1_record.cl_ord_id[modify_rejected_ca_equities_v1_at] = wire[at]; at = at + 1; modify_rejected_ca_equities_v1_at = modify_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_ca_equities_v1_at = 0;
  do
  :: modify_rejected_ca_equities_v1_at < 2 -> modify_rejected_ca_equities_v1_record.broker_id[modify_rejected_ca_equities_v1_at] = wire[at]; at = at + 1; modify_rejected_ca_equities_v1_at = modify_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_ca_equities_v1_at = 0;
  do
  :: modify_rejected_ca_equities_v1_at < 20 -> modify_rejected_ca_equities_v1_record.orig_cl_ord_id[modify_rejected_ca_equities_v1_at] = wire[at]; at = at + 1; modify_rejected_ca_equities_v1_at = modify_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_ca_equities_v1_at = 0;
  do
  :: modify_rejected_ca_equities_v1_at < 60 -> modify_rejected_ca_equities_v1_record.text[modify_rejected_ca_equities_v1_at] = wire[at]; at = at + 1; modify_rejected_ca_equities_v1_at = modify_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_ca_equities_v1_record.modify_reject_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Modify Rejected Ca Equities V 1 is what was written, byte for byte */
inline equal_modify_rejected_ca_equities_v1(modify_rejected_ca_equities_v1_read, modify_rejected_ca_equities_v1_written) {
  modify_rejected_ca_equities_v1_at = 0;
  do
  :: modify_rejected_ca_equities_v1_at < 8 -> assert(modify_rejected_ca_equities_v1_read.transaction_time[modify_rejected_ca_equities_v1_at] == modify_rejected_ca_equities_v1_written.transaction_time[modify_rejected_ca_equities_v1_at]); modify_rejected_ca_equities_v1_at = modify_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_ca_equities_v1_at = 0;
  do
  :: modify_rejected_ca_equities_v1_at < 20 -> assert(modify_rejected_ca_equities_v1_read.cl_ord_id[modify_rejected_ca_equities_v1_at] == modify_rejected_ca_equities_v1_written.cl_ord_id[modify_rejected_ca_equities_v1_at]); modify_rejected_ca_equities_v1_at = modify_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_ca_equities_v1_at = 0;
  do
  :: modify_rejected_ca_equities_v1_at < 2 -> assert(modify_rejected_ca_equities_v1_read.broker_id[modify_rejected_ca_equities_v1_at] == modify_rejected_ca_equities_v1_written.broker_id[modify_rejected_ca_equities_v1_at]); modify_rejected_ca_equities_v1_at = modify_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_ca_equities_v1_at = 0;
  do
  :: modify_rejected_ca_equities_v1_at < 20 -> assert(modify_rejected_ca_equities_v1_read.orig_cl_ord_id[modify_rejected_ca_equities_v1_at] == modify_rejected_ca_equities_v1_written.orig_cl_ord_id[modify_rejected_ca_equities_v1_at]); modify_rejected_ca_equities_v1_at = modify_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_ca_equities_v1_at = 0;
  do
  :: modify_rejected_ca_equities_v1_at < 60 -> assert(modify_rejected_ca_equities_v1_read.text[modify_rejected_ca_equities_v1_at] == modify_rejected_ca_equities_v1_written.text[modify_rejected_ca_equities_v1_at]); modify_rejected_ca_equities_v1_at = modify_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(modify_rejected_ca_equities_v1_read.modify_reject_reason == modify_rejected_ca_equities_v1_written.modify_reject_reason);
  skip
}

/* ---- Order Restated Ca Equities V 1: 80 bytes -------------------------------- */

/* Order Restated message sent when iceberg order reloads or when self-trade protection reduces an order */
typedef OrderRestatedCaEquitiesV1 {
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte broker_id[2];
  byte order_id[8];
  byte order_qty[4];
  byte leaves_qty[4];
  byte secondary_order_id[8];
  byte last_px[8];
  byte last_shares[4];
  byte base_liquidity_indicator;
  byte price[8];
  byte true_min_qty[4];
  byte restatement_reason
};

int order_restated_ca_equities_v1_at;

/* every byte of Order Restated Ca Equities V 1 set to one value */
inline fill_order_restated_ca_equities_v1(order_restated_ca_equities_v1_record, order_restated_ca_equities_v1_value) {
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 8 -> order_restated_ca_equities_v1_record.transaction_time[order_restated_ca_equities_v1_at] = order_restated_ca_equities_v1_value; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 20 -> order_restated_ca_equities_v1_record.cl_ord_id[order_restated_ca_equities_v1_at] = order_restated_ca_equities_v1_value; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 2 -> order_restated_ca_equities_v1_record.broker_id[order_restated_ca_equities_v1_at] = order_restated_ca_equities_v1_value; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 8 -> order_restated_ca_equities_v1_record.order_id[order_restated_ca_equities_v1_at] = order_restated_ca_equities_v1_value; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 4 -> order_restated_ca_equities_v1_record.order_qty[order_restated_ca_equities_v1_at] = order_restated_ca_equities_v1_value; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 4 -> order_restated_ca_equities_v1_record.leaves_qty[order_restated_ca_equities_v1_at] = order_restated_ca_equities_v1_value; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 8 -> order_restated_ca_equities_v1_record.secondary_order_id[order_restated_ca_equities_v1_at] = order_restated_ca_equities_v1_value; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 8 -> order_restated_ca_equities_v1_record.last_px[order_restated_ca_equities_v1_at] = order_restated_ca_equities_v1_value; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 4 -> order_restated_ca_equities_v1_record.last_shares[order_restated_ca_equities_v1_at] = order_restated_ca_equities_v1_value; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_record.base_liquidity_indicator = order_restated_ca_equities_v1_value;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 8 -> order_restated_ca_equities_v1_record.price[order_restated_ca_equities_v1_at] = order_restated_ca_equities_v1_value; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 4 -> order_restated_ca_equities_v1_record.true_min_qty[order_restated_ca_equities_v1_at] = order_restated_ca_equities_v1_value; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_record.restatement_reason = order_restated_ca_equities_v1_value;
  skip
}

/* each byte of Order Restated Ca Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_order_restated_ca_equities_v1(order_restated_ca_equities_v1_record, order_restated_ca_equities_v1_base) {
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 8 -> order_restated_ca_equities_v1_record.transaction_time[order_restated_ca_equities_v1_at] = (order_restated_ca_equities_v1_base + 0 + order_restated_ca_equities_v1_at + 1) % 256; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 20 -> order_restated_ca_equities_v1_record.cl_ord_id[order_restated_ca_equities_v1_at] = (order_restated_ca_equities_v1_base + 8 + order_restated_ca_equities_v1_at + 1) % 256; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 2 -> order_restated_ca_equities_v1_record.broker_id[order_restated_ca_equities_v1_at] = (order_restated_ca_equities_v1_base + 28 + order_restated_ca_equities_v1_at + 1) % 256; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 8 -> order_restated_ca_equities_v1_record.order_id[order_restated_ca_equities_v1_at] = (order_restated_ca_equities_v1_base + 30 + order_restated_ca_equities_v1_at + 1) % 256; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 4 -> order_restated_ca_equities_v1_record.order_qty[order_restated_ca_equities_v1_at] = (order_restated_ca_equities_v1_base + 38 + order_restated_ca_equities_v1_at + 1) % 256; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 4 -> order_restated_ca_equities_v1_record.leaves_qty[order_restated_ca_equities_v1_at] = (order_restated_ca_equities_v1_base + 42 + order_restated_ca_equities_v1_at + 1) % 256; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 8 -> order_restated_ca_equities_v1_record.secondary_order_id[order_restated_ca_equities_v1_at] = (order_restated_ca_equities_v1_base + 46 + order_restated_ca_equities_v1_at + 1) % 256; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 8 -> order_restated_ca_equities_v1_record.last_px[order_restated_ca_equities_v1_at] = (order_restated_ca_equities_v1_base + 54 + order_restated_ca_equities_v1_at + 1) % 256; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 4 -> order_restated_ca_equities_v1_record.last_shares[order_restated_ca_equities_v1_at] = (order_restated_ca_equities_v1_base + 62 + order_restated_ca_equities_v1_at + 1) % 256; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_record.base_liquidity_indicator = (order_restated_ca_equities_v1_base + 66 + 1) % 256;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 8 -> order_restated_ca_equities_v1_record.price[order_restated_ca_equities_v1_at] = (order_restated_ca_equities_v1_base + 67 + order_restated_ca_equities_v1_at + 1) % 256; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 4 -> order_restated_ca_equities_v1_record.true_min_qty[order_restated_ca_equities_v1_at] = (order_restated_ca_equities_v1_base + 75 + order_restated_ca_equities_v1_at + 1) % 256; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_record.restatement_reason = (order_restated_ca_equities_v1_base + 79 + 1) % 256;
  skip
}

/* Order Restated Ca Equities V 1 to the wire, 80 bytes from where the cursor stands */
inline encode_order_restated_ca_equities_v1(order_restated_ca_equities_v1_record) {
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 8 -> wire[at] = order_restated_ca_equities_v1_record.transaction_time[order_restated_ca_equities_v1_at]; at = at + 1; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 20 -> wire[at] = order_restated_ca_equities_v1_record.cl_ord_id[order_restated_ca_equities_v1_at]; at = at + 1; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 2 -> wire[at] = order_restated_ca_equities_v1_record.broker_id[order_restated_ca_equities_v1_at]; at = at + 1; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 8 -> wire[at] = order_restated_ca_equities_v1_record.order_id[order_restated_ca_equities_v1_at]; at = at + 1; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 4 -> wire[at] = order_restated_ca_equities_v1_record.order_qty[order_restated_ca_equities_v1_at]; at = at + 1; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 4 -> wire[at] = order_restated_ca_equities_v1_record.leaves_qty[order_restated_ca_equities_v1_at]; at = at + 1; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 8 -> wire[at] = order_restated_ca_equities_v1_record.secondary_order_id[order_restated_ca_equities_v1_at]; at = at + 1; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 8 -> wire[at] = order_restated_ca_equities_v1_record.last_px[order_restated_ca_equities_v1_at]; at = at + 1; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 4 -> wire[at] = order_restated_ca_equities_v1_record.last_shares[order_restated_ca_equities_v1_at]; at = at + 1; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_restated_ca_equities_v1_record.base_liquidity_indicator; at = at + 1;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 8 -> wire[at] = order_restated_ca_equities_v1_record.price[order_restated_ca_equities_v1_at]; at = at + 1; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 4 -> wire[at] = order_restated_ca_equities_v1_record.true_min_qty[order_restated_ca_equities_v1_at]; at = at + 1; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_restated_ca_equities_v1_record.restatement_reason; at = at + 1;
  skip
}

/* Order Restated Ca Equities V 1 off the wire, 80 bytes from where the cursor stands */
inline decode_order_restated_ca_equities_v1(order_restated_ca_equities_v1_record) {
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 8 -> order_restated_ca_equities_v1_record.transaction_time[order_restated_ca_equities_v1_at] = wire[at]; at = at + 1; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 20 -> order_restated_ca_equities_v1_record.cl_ord_id[order_restated_ca_equities_v1_at] = wire[at]; at = at + 1; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 2 -> order_restated_ca_equities_v1_record.broker_id[order_restated_ca_equities_v1_at] = wire[at]; at = at + 1; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 8 -> order_restated_ca_equities_v1_record.order_id[order_restated_ca_equities_v1_at] = wire[at]; at = at + 1; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 4 -> order_restated_ca_equities_v1_record.order_qty[order_restated_ca_equities_v1_at] = wire[at]; at = at + 1; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 4 -> order_restated_ca_equities_v1_record.leaves_qty[order_restated_ca_equities_v1_at] = wire[at]; at = at + 1; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 8 -> order_restated_ca_equities_v1_record.secondary_order_id[order_restated_ca_equities_v1_at] = wire[at]; at = at + 1; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 8 -> order_restated_ca_equities_v1_record.last_px[order_restated_ca_equities_v1_at] = wire[at]; at = at + 1; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 4 -> order_restated_ca_equities_v1_record.last_shares[order_restated_ca_equities_v1_at] = wire[at]; at = at + 1; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_record.base_liquidity_indicator = wire[at]; at = at + 1;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 8 -> order_restated_ca_equities_v1_record.price[order_restated_ca_equities_v1_at] = wire[at]; at = at + 1; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 4 -> order_restated_ca_equities_v1_record.true_min_qty[order_restated_ca_equities_v1_at] = wire[at]; at = at + 1; order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_record.restatement_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Restated Ca Equities V 1 is what was written, byte for byte */
inline equal_order_restated_ca_equities_v1(order_restated_ca_equities_v1_read, order_restated_ca_equities_v1_written) {
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 8 -> assert(order_restated_ca_equities_v1_read.transaction_time[order_restated_ca_equities_v1_at] == order_restated_ca_equities_v1_written.transaction_time[order_restated_ca_equities_v1_at]); order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 20 -> assert(order_restated_ca_equities_v1_read.cl_ord_id[order_restated_ca_equities_v1_at] == order_restated_ca_equities_v1_written.cl_ord_id[order_restated_ca_equities_v1_at]); order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 2 -> assert(order_restated_ca_equities_v1_read.broker_id[order_restated_ca_equities_v1_at] == order_restated_ca_equities_v1_written.broker_id[order_restated_ca_equities_v1_at]); order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 8 -> assert(order_restated_ca_equities_v1_read.order_id[order_restated_ca_equities_v1_at] == order_restated_ca_equities_v1_written.order_id[order_restated_ca_equities_v1_at]); order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 4 -> assert(order_restated_ca_equities_v1_read.order_qty[order_restated_ca_equities_v1_at] == order_restated_ca_equities_v1_written.order_qty[order_restated_ca_equities_v1_at]); order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 4 -> assert(order_restated_ca_equities_v1_read.leaves_qty[order_restated_ca_equities_v1_at] == order_restated_ca_equities_v1_written.leaves_qty[order_restated_ca_equities_v1_at]); order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 8 -> assert(order_restated_ca_equities_v1_read.secondary_order_id[order_restated_ca_equities_v1_at] == order_restated_ca_equities_v1_written.secondary_order_id[order_restated_ca_equities_v1_at]); order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 8 -> assert(order_restated_ca_equities_v1_read.last_px[order_restated_ca_equities_v1_at] == order_restated_ca_equities_v1_written.last_px[order_restated_ca_equities_v1_at]); order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 4 -> assert(order_restated_ca_equities_v1_read.last_shares[order_restated_ca_equities_v1_at] == order_restated_ca_equities_v1_written.last_shares[order_restated_ca_equities_v1_at]); order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_restated_ca_equities_v1_read.base_liquidity_indicator == order_restated_ca_equities_v1_written.base_liquidity_indicator);
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 8 -> assert(order_restated_ca_equities_v1_read.price[order_restated_ca_equities_v1_at] == order_restated_ca_equities_v1_written.price[order_restated_ca_equities_v1_at]); order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_ca_equities_v1_at = 0;
  do
  :: order_restated_ca_equities_v1_at < 4 -> assert(order_restated_ca_equities_v1_read.true_min_qty[order_restated_ca_equities_v1_at] == order_restated_ca_equities_v1_written.true_min_qty[order_restated_ca_equities_v1_at]); order_restated_ca_equities_v1_at = order_restated_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_restated_ca_equities_v1_read.restatement_reason == order_restated_ca_equities_v1_written.restatement_reason);
  skip
}

/* ---- Order Execution Ca Equities V 1: 99 bytes ------------------------------- */

/* Order Execution message sent for each fill on an order */
typedef OrderExecutionCaEquitiesV1 {
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte exec_id[8];
  byte last_px[8];
  byte last_shares[4];
  byte order_id[8];
  byte side;
  byte symbol[14];
  byte trade_date[4];
  byte leaves_qty[4];
  byte contra_broker[2];
  byte base_liquidity_indicator;
  byte broker_id[2];
  byte principal_trade;
  byte wash_trade;
  byte no_trade_feat;
  byte no_trade_key[6];
  byte short_marking_exempt;
  byte matching_priority;
  byte is_self_trade;
  byte fee_code[2];
  byte ex_destination
};

int order_execution_ca_equities_v1_at;

/* every byte of Order Execution Ca Equities V 1 set to one value */
inline fill_order_execution_ca_equities_v1(order_execution_ca_equities_v1_record, order_execution_ca_equities_v1_value) {
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 8 -> order_execution_ca_equities_v1_record.transaction_time[order_execution_ca_equities_v1_at] = order_execution_ca_equities_v1_value; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 20 -> order_execution_ca_equities_v1_record.cl_ord_id[order_execution_ca_equities_v1_at] = order_execution_ca_equities_v1_value; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 8 -> order_execution_ca_equities_v1_record.exec_id[order_execution_ca_equities_v1_at] = order_execution_ca_equities_v1_value; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 8 -> order_execution_ca_equities_v1_record.last_px[order_execution_ca_equities_v1_at] = order_execution_ca_equities_v1_value; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 4 -> order_execution_ca_equities_v1_record.last_shares[order_execution_ca_equities_v1_at] = order_execution_ca_equities_v1_value; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 8 -> order_execution_ca_equities_v1_record.order_id[order_execution_ca_equities_v1_at] = order_execution_ca_equities_v1_value; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_record.side = order_execution_ca_equities_v1_value;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 14 -> order_execution_ca_equities_v1_record.symbol[order_execution_ca_equities_v1_at] = order_execution_ca_equities_v1_value; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 4 -> order_execution_ca_equities_v1_record.trade_date[order_execution_ca_equities_v1_at] = order_execution_ca_equities_v1_value; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 4 -> order_execution_ca_equities_v1_record.leaves_qty[order_execution_ca_equities_v1_at] = order_execution_ca_equities_v1_value; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 2 -> order_execution_ca_equities_v1_record.contra_broker[order_execution_ca_equities_v1_at] = order_execution_ca_equities_v1_value; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_record.base_liquidity_indicator = order_execution_ca_equities_v1_value;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 2 -> order_execution_ca_equities_v1_record.broker_id[order_execution_ca_equities_v1_at] = order_execution_ca_equities_v1_value; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_record.principal_trade = order_execution_ca_equities_v1_value;
  order_execution_ca_equities_v1_record.wash_trade = order_execution_ca_equities_v1_value;
  order_execution_ca_equities_v1_record.no_trade_feat = order_execution_ca_equities_v1_value;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 6 -> order_execution_ca_equities_v1_record.no_trade_key[order_execution_ca_equities_v1_at] = order_execution_ca_equities_v1_value; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_record.short_marking_exempt = order_execution_ca_equities_v1_value;
  order_execution_ca_equities_v1_record.matching_priority = order_execution_ca_equities_v1_value;
  order_execution_ca_equities_v1_record.is_self_trade = order_execution_ca_equities_v1_value;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 2 -> order_execution_ca_equities_v1_record.fee_code[order_execution_ca_equities_v1_at] = order_execution_ca_equities_v1_value; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_record.ex_destination = order_execution_ca_equities_v1_value;
  skip
}

/* each byte of Order Execution Ca Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_order_execution_ca_equities_v1(order_execution_ca_equities_v1_record, order_execution_ca_equities_v1_base) {
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 8 -> order_execution_ca_equities_v1_record.transaction_time[order_execution_ca_equities_v1_at] = (order_execution_ca_equities_v1_base + 0 + order_execution_ca_equities_v1_at + 1) % 256; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 20 -> order_execution_ca_equities_v1_record.cl_ord_id[order_execution_ca_equities_v1_at] = (order_execution_ca_equities_v1_base + 8 + order_execution_ca_equities_v1_at + 1) % 256; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 8 -> order_execution_ca_equities_v1_record.exec_id[order_execution_ca_equities_v1_at] = (order_execution_ca_equities_v1_base + 28 + order_execution_ca_equities_v1_at + 1) % 256; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 8 -> order_execution_ca_equities_v1_record.last_px[order_execution_ca_equities_v1_at] = (order_execution_ca_equities_v1_base + 36 + order_execution_ca_equities_v1_at + 1) % 256; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 4 -> order_execution_ca_equities_v1_record.last_shares[order_execution_ca_equities_v1_at] = (order_execution_ca_equities_v1_base + 44 + order_execution_ca_equities_v1_at + 1) % 256; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 8 -> order_execution_ca_equities_v1_record.order_id[order_execution_ca_equities_v1_at] = (order_execution_ca_equities_v1_base + 48 + order_execution_ca_equities_v1_at + 1) % 256; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_record.side = (order_execution_ca_equities_v1_base + 56 + 1) % 256;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 14 -> order_execution_ca_equities_v1_record.symbol[order_execution_ca_equities_v1_at] = (order_execution_ca_equities_v1_base + 57 + order_execution_ca_equities_v1_at + 1) % 256; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 4 -> order_execution_ca_equities_v1_record.trade_date[order_execution_ca_equities_v1_at] = (order_execution_ca_equities_v1_base + 71 + order_execution_ca_equities_v1_at + 1) % 256; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 4 -> order_execution_ca_equities_v1_record.leaves_qty[order_execution_ca_equities_v1_at] = (order_execution_ca_equities_v1_base + 75 + order_execution_ca_equities_v1_at + 1) % 256; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 2 -> order_execution_ca_equities_v1_record.contra_broker[order_execution_ca_equities_v1_at] = (order_execution_ca_equities_v1_base + 79 + order_execution_ca_equities_v1_at + 1) % 256; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_record.base_liquidity_indicator = (order_execution_ca_equities_v1_base + 81 + 1) % 256;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 2 -> order_execution_ca_equities_v1_record.broker_id[order_execution_ca_equities_v1_at] = (order_execution_ca_equities_v1_base + 82 + order_execution_ca_equities_v1_at + 1) % 256; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_record.principal_trade = (order_execution_ca_equities_v1_base + 84 + 1) % 256;
  order_execution_ca_equities_v1_record.wash_trade = (order_execution_ca_equities_v1_base + 85 + 1) % 256;
  order_execution_ca_equities_v1_record.no_trade_feat = (order_execution_ca_equities_v1_base + 86 + 1) % 256;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 6 -> order_execution_ca_equities_v1_record.no_trade_key[order_execution_ca_equities_v1_at] = (order_execution_ca_equities_v1_base + 87 + order_execution_ca_equities_v1_at + 1) % 256; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_record.short_marking_exempt = (order_execution_ca_equities_v1_base + 93 + 1) % 256;
  order_execution_ca_equities_v1_record.matching_priority = (order_execution_ca_equities_v1_base + 94 + 1) % 256;
  order_execution_ca_equities_v1_record.is_self_trade = (order_execution_ca_equities_v1_base + 95 + 1) % 256;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 2 -> order_execution_ca_equities_v1_record.fee_code[order_execution_ca_equities_v1_at] = (order_execution_ca_equities_v1_base + 96 + order_execution_ca_equities_v1_at + 1) % 256; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_record.ex_destination = (order_execution_ca_equities_v1_base + 98 + 1) % 256;
  skip
}

/* Order Execution Ca Equities V 1 to the wire, 99 bytes from where the cursor stands */
inline encode_order_execution_ca_equities_v1(order_execution_ca_equities_v1_record) {
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 8 -> wire[at] = order_execution_ca_equities_v1_record.transaction_time[order_execution_ca_equities_v1_at]; at = at + 1; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 20 -> wire[at] = order_execution_ca_equities_v1_record.cl_ord_id[order_execution_ca_equities_v1_at]; at = at + 1; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 8 -> wire[at] = order_execution_ca_equities_v1_record.exec_id[order_execution_ca_equities_v1_at]; at = at + 1; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 8 -> wire[at] = order_execution_ca_equities_v1_record.last_px[order_execution_ca_equities_v1_at]; at = at + 1; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 4 -> wire[at] = order_execution_ca_equities_v1_record.last_shares[order_execution_ca_equities_v1_at]; at = at + 1; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 8 -> wire[at] = order_execution_ca_equities_v1_record.order_id[order_execution_ca_equities_v1_at]; at = at + 1; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_ca_equities_v1_record.side; at = at + 1;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 14 -> wire[at] = order_execution_ca_equities_v1_record.symbol[order_execution_ca_equities_v1_at]; at = at + 1; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 4 -> wire[at] = order_execution_ca_equities_v1_record.trade_date[order_execution_ca_equities_v1_at]; at = at + 1; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 4 -> wire[at] = order_execution_ca_equities_v1_record.leaves_qty[order_execution_ca_equities_v1_at]; at = at + 1; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 2 -> wire[at] = order_execution_ca_equities_v1_record.contra_broker[order_execution_ca_equities_v1_at]; at = at + 1; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_ca_equities_v1_record.base_liquidity_indicator; at = at + 1;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 2 -> wire[at] = order_execution_ca_equities_v1_record.broker_id[order_execution_ca_equities_v1_at]; at = at + 1; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_ca_equities_v1_record.principal_trade; at = at + 1;
  wire[at] = order_execution_ca_equities_v1_record.wash_trade; at = at + 1;
  wire[at] = order_execution_ca_equities_v1_record.no_trade_feat; at = at + 1;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 6 -> wire[at] = order_execution_ca_equities_v1_record.no_trade_key[order_execution_ca_equities_v1_at]; at = at + 1; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_ca_equities_v1_record.short_marking_exempt; at = at + 1;
  wire[at] = order_execution_ca_equities_v1_record.matching_priority; at = at + 1;
  wire[at] = order_execution_ca_equities_v1_record.is_self_trade; at = at + 1;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 2 -> wire[at] = order_execution_ca_equities_v1_record.fee_code[order_execution_ca_equities_v1_at]; at = at + 1; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_ca_equities_v1_record.ex_destination; at = at + 1;
  skip
}

/* Order Execution Ca Equities V 1 off the wire, 99 bytes from where the cursor stands */
inline decode_order_execution_ca_equities_v1(order_execution_ca_equities_v1_record) {
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 8 -> order_execution_ca_equities_v1_record.transaction_time[order_execution_ca_equities_v1_at] = wire[at]; at = at + 1; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 20 -> order_execution_ca_equities_v1_record.cl_ord_id[order_execution_ca_equities_v1_at] = wire[at]; at = at + 1; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 8 -> order_execution_ca_equities_v1_record.exec_id[order_execution_ca_equities_v1_at] = wire[at]; at = at + 1; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 8 -> order_execution_ca_equities_v1_record.last_px[order_execution_ca_equities_v1_at] = wire[at]; at = at + 1; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 4 -> order_execution_ca_equities_v1_record.last_shares[order_execution_ca_equities_v1_at] = wire[at]; at = at + 1; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 8 -> order_execution_ca_equities_v1_record.order_id[order_execution_ca_equities_v1_at] = wire[at]; at = at + 1; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_record.side = wire[at]; at = at + 1;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 14 -> order_execution_ca_equities_v1_record.symbol[order_execution_ca_equities_v1_at] = wire[at]; at = at + 1; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 4 -> order_execution_ca_equities_v1_record.trade_date[order_execution_ca_equities_v1_at] = wire[at]; at = at + 1; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 4 -> order_execution_ca_equities_v1_record.leaves_qty[order_execution_ca_equities_v1_at] = wire[at]; at = at + 1; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 2 -> order_execution_ca_equities_v1_record.contra_broker[order_execution_ca_equities_v1_at] = wire[at]; at = at + 1; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_record.base_liquidity_indicator = wire[at]; at = at + 1;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 2 -> order_execution_ca_equities_v1_record.broker_id[order_execution_ca_equities_v1_at] = wire[at]; at = at + 1; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_record.principal_trade = wire[at]; at = at + 1;
  order_execution_ca_equities_v1_record.wash_trade = wire[at]; at = at + 1;
  order_execution_ca_equities_v1_record.no_trade_feat = wire[at]; at = at + 1;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 6 -> order_execution_ca_equities_v1_record.no_trade_key[order_execution_ca_equities_v1_at] = wire[at]; at = at + 1; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_record.short_marking_exempt = wire[at]; at = at + 1;
  order_execution_ca_equities_v1_record.matching_priority = wire[at]; at = at + 1;
  order_execution_ca_equities_v1_record.is_self_trade = wire[at]; at = at + 1;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 2 -> order_execution_ca_equities_v1_record.fee_code[order_execution_ca_equities_v1_at] = wire[at]; at = at + 1; order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_record.ex_destination = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Execution Ca Equities V 1 is what was written, byte for byte */
inline equal_order_execution_ca_equities_v1(order_execution_ca_equities_v1_read, order_execution_ca_equities_v1_written) {
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 8 -> assert(order_execution_ca_equities_v1_read.transaction_time[order_execution_ca_equities_v1_at] == order_execution_ca_equities_v1_written.transaction_time[order_execution_ca_equities_v1_at]); order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 20 -> assert(order_execution_ca_equities_v1_read.cl_ord_id[order_execution_ca_equities_v1_at] == order_execution_ca_equities_v1_written.cl_ord_id[order_execution_ca_equities_v1_at]); order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 8 -> assert(order_execution_ca_equities_v1_read.exec_id[order_execution_ca_equities_v1_at] == order_execution_ca_equities_v1_written.exec_id[order_execution_ca_equities_v1_at]); order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 8 -> assert(order_execution_ca_equities_v1_read.last_px[order_execution_ca_equities_v1_at] == order_execution_ca_equities_v1_written.last_px[order_execution_ca_equities_v1_at]); order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 4 -> assert(order_execution_ca_equities_v1_read.last_shares[order_execution_ca_equities_v1_at] == order_execution_ca_equities_v1_written.last_shares[order_execution_ca_equities_v1_at]); order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 8 -> assert(order_execution_ca_equities_v1_read.order_id[order_execution_ca_equities_v1_at] == order_execution_ca_equities_v1_written.order_id[order_execution_ca_equities_v1_at]); order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_execution_ca_equities_v1_read.side == order_execution_ca_equities_v1_written.side);
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 14 -> assert(order_execution_ca_equities_v1_read.symbol[order_execution_ca_equities_v1_at] == order_execution_ca_equities_v1_written.symbol[order_execution_ca_equities_v1_at]); order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 4 -> assert(order_execution_ca_equities_v1_read.trade_date[order_execution_ca_equities_v1_at] == order_execution_ca_equities_v1_written.trade_date[order_execution_ca_equities_v1_at]); order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 4 -> assert(order_execution_ca_equities_v1_read.leaves_qty[order_execution_ca_equities_v1_at] == order_execution_ca_equities_v1_written.leaves_qty[order_execution_ca_equities_v1_at]); order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 2 -> assert(order_execution_ca_equities_v1_read.contra_broker[order_execution_ca_equities_v1_at] == order_execution_ca_equities_v1_written.contra_broker[order_execution_ca_equities_v1_at]); order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_execution_ca_equities_v1_read.base_liquidity_indicator == order_execution_ca_equities_v1_written.base_liquidity_indicator);
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 2 -> assert(order_execution_ca_equities_v1_read.broker_id[order_execution_ca_equities_v1_at] == order_execution_ca_equities_v1_written.broker_id[order_execution_ca_equities_v1_at]); order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_execution_ca_equities_v1_read.principal_trade == order_execution_ca_equities_v1_written.principal_trade);
  assert(order_execution_ca_equities_v1_read.wash_trade == order_execution_ca_equities_v1_written.wash_trade);
  assert(order_execution_ca_equities_v1_read.no_trade_feat == order_execution_ca_equities_v1_written.no_trade_feat);
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 6 -> assert(order_execution_ca_equities_v1_read.no_trade_key[order_execution_ca_equities_v1_at] == order_execution_ca_equities_v1_written.no_trade_key[order_execution_ca_equities_v1_at]); order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_execution_ca_equities_v1_read.short_marking_exempt == order_execution_ca_equities_v1_written.short_marking_exempt);
  assert(order_execution_ca_equities_v1_read.matching_priority == order_execution_ca_equities_v1_written.matching_priority);
  assert(order_execution_ca_equities_v1_read.is_self_trade == order_execution_ca_equities_v1_written.is_self_trade);
  order_execution_ca_equities_v1_at = 0;
  do
  :: order_execution_ca_equities_v1_at < 2 -> assert(order_execution_ca_equities_v1_read.fee_code[order_execution_ca_equities_v1_at] == order_execution_ca_equities_v1_written.fee_code[order_execution_ca_equities_v1_at]); order_execution_ca_equities_v1_at = order_execution_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_execution_ca_equities_v1_read.ex_destination == order_execution_ca_equities_v1_written.ex_destination);
  skip
}

/* ---- Order Cancelled Ca Equities V 1: 31 bytes ------------------------------- */

/* Order Cancelled message */
typedef OrderCancelledCaEquitiesV1 {
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte broker_id[2];
  byte cancel_reason
};

int order_cancelled_ca_equities_v1_at;

/* every byte of Order Cancelled Ca Equities V 1 set to one value */
inline fill_order_cancelled_ca_equities_v1(order_cancelled_ca_equities_v1_record, order_cancelled_ca_equities_v1_value) {
  order_cancelled_ca_equities_v1_at = 0;
  do
  :: order_cancelled_ca_equities_v1_at < 8 -> order_cancelled_ca_equities_v1_record.transaction_time[order_cancelled_ca_equities_v1_at] = order_cancelled_ca_equities_v1_value; order_cancelled_ca_equities_v1_at = order_cancelled_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_ca_equities_v1_at = 0;
  do
  :: order_cancelled_ca_equities_v1_at < 20 -> order_cancelled_ca_equities_v1_record.cl_ord_id[order_cancelled_ca_equities_v1_at] = order_cancelled_ca_equities_v1_value; order_cancelled_ca_equities_v1_at = order_cancelled_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_ca_equities_v1_at = 0;
  do
  :: order_cancelled_ca_equities_v1_at < 2 -> order_cancelled_ca_equities_v1_record.broker_id[order_cancelled_ca_equities_v1_at] = order_cancelled_ca_equities_v1_value; order_cancelled_ca_equities_v1_at = order_cancelled_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_ca_equities_v1_record.cancel_reason = order_cancelled_ca_equities_v1_value;
  skip
}

/* each byte of Order Cancelled Ca Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_order_cancelled_ca_equities_v1(order_cancelled_ca_equities_v1_record, order_cancelled_ca_equities_v1_base) {
  order_cancelled_ca_equities_v1_at = 0;
  do
  :: order_cancelled_ca_equities_v1_at < 8 -> order_cancelled_ca_equities_v1_record.transaction_time[order_cancelled_ca_equities_v1_at] = (order_cancelled_ca_equities_v1_base + 0 + order_cancelled_ca_equities_v1_at + 1) % 256; order_cancelled_ca_equities_v1_at = order_cancelled_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_ca_equities_v1_at = 0;
  do
  :: order_cancelled_ca_equities_v1_at < 20 -> order_cancelled_ca_equities_v1_record.cl_ord_id[order_cancelled_ca_equities_v1_at] = (order_cancelled_ca_equities_v1_base + 8 + order_cancelled_ca_equities_v1_at + 1) % 256; order_cancelled_ca_equities_v1_at = order_cancelled_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_ca_equities_v1_at = 0;
  do
  :: order_cancelled_ca_equities_v1_at < 2 -> order_cancelled_ca_equities_v1_record.broker_id[order_cancelled_ca_equities_v1_at] = (order_cancelled_ca_equities_v1_base + 28 + order_cancelled_ca_equities_v1_at + 1) % 256; order_cancelled_ca_equities_v1_at = order_cancelled_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_ca_equities_v1_record.cancel_reason = (order_cancelled_ca_equities_v1_base + 30 + 1) % 256;
  skip
}

/* Order Cancelled Ca Equities V 1 to the wire, 31 bytes from where the cursor stands */
inline encode_order_cancelled_ca_equities_v1(order_cancelled_ca_equities_v1_record) {
  order_cancelled_ca_equities_v1_at = 0;
  do
  :: order_cancelled_ca_equities_v1_at < 8 -> wire[at] = order_cancelled_ca_equities_v1_record.transaction_time[order_cancelled_ca_equities_v1_at]; at = at + 1; order_cancelled_ca_equities_v1_at = order_cancelled_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_ca_equities_v1_at = 0;
  do
  :: order_cancelled_ca_equities_v1_at < 20 -> wire[at] = order_cancelled_ca_equities_v1_record.cl_ord_id[order_cancelled_ca_equities_v1_at]; at = at + 1; order_cancelled_ca_equities_v1_at = order_cancelled_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_ca_equities_v1_at = 0;
  do
  :: order_cancelled_ca_equities_v1_at < 2 -> wire[at] = order_cancelled_ca_equities_v1_record.broker_id[order_cancelled_ca_equities_v1_at]; at = at + 1; order_cancelled_ca_equities_v1_at = order_cancelled_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_cancelled_ca_equities_v1_record.cancel_reason; at = at + 1;
  skip
}

/* Order Cancelled Ca Equities V 1 off the wire, 31 bytes from where the cursor stands */
inline decode_order_cancelled_ca_equities_v1(order_cancelled_ca_equities_v1_record) {
  order_cancelled_ca_equities_v1_at = 0;
  do
  :: order_cancelled_ca_equities_v1_at < 8 -> order_cancelled_ca_equities_v1_record.transaction_time[order_cancelled_ca_equities_v1_at] = wire[at]; at = at + 1; order_cancelled_ca_equities_v1_at = order_cancelled_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_ca_equities_v1_at = 0;
  do
  :: order_cancelled_ca_equities_v1_at < 20 -> order_cancelled_ca_equities_v1_record.cl_ord_id[order_cancelled_ca_equities_v1_at] = wire[at]; at = at + 1; order_cancelled_ca_equities_v1_at = order_cancelled_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_ca_equities_v1_at = 0;
  do
  :: order_cancelled_ca_equities_v1_at < 2 -> order_cancelled_ca_equities_v1_record.broker_id[order_cancelled_ca_equities_v1_at] = wire[at]; at = at + 1; order_cancelled_ca_equities_v1_at = order_cancelled_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_ca_equities_v1_record.cancel_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Cancelled Ca Equities V 1 is what was written, byte for byte */
inline equal_order_cancelled_ca_equities_v1(order_cancelled_ca_equities_v1_read, order_cancelled_ca_equities_v1_written) {
  order_cancelled_ca_equities_v1_at = 0;
  do
  :: order_cancelled_ca_equities_v1_at < 8 -> assert(order_cancelled_ca_equities_v1_read.transaction_time[order_cancelled_ca_equities_v1_at] == order_cancelled_ca_equities_v1_written.transaction_time[order_cancelled_ca_equities_v1_at]); order_cancelled_ca_equities_v1_at = order_cancelled_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_ca_equities_v1_at = 0;
  do
  :: order_cancelled_ca_equities_v1_at < 20 -> assert(order_cancelled_ca_equities_v1_read.cl_ord_id[order_cancelled_ca_equities_v1_at] == order_cancelled_ca_equities_v1_written.cl_ord_id[order_cancelled_ca_equities_v1_at]); order_cancelled_ca_equities_v1_at = order_cancelled_ca_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_ca_equities_v1_at = 0;
  do
  :: order_cancelled_ca_equities_v1_at < 2 -> assert(order_cancelled_ca_equities_v1_read.broker_id[order_cancelled_ca_equities_v1_at] == order_cancelled_ca_equities_v1_written.broker_id[order_cancelled_ca_equities_v1_at]); order_cancelled_ca_equities_v1_at = order_cancelled_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_cancelled_ca_equities_v1_read.cancel_reason == order_cancelled_ca_equities_v1_written.cancel_reason);
  skip
}

/* ---- Cancel Rejected Ca Equities V 1: 91 bytes ------------------------------- */

/* Cancel Rejected message sent when a Cancel Order cancellation cannot occur */
typedef CancelRejectedCaEquitiesV1 {
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte broker_id[2];
  byte text[60];
  byte cancel_reject_reason
};

int cancel_rejected_ca_equities_v1_at;

/* every byte of Cancel Rejected Ca Equities V 1 set to one value */
inline fill_cancel_rejected_ca_equities_v1(cancel_rejected_ca_equities_v1_record, cancel_rejected_ca_equities_v1_value) {
  cancel_rejected_ca_equities_v1_at = 0;
  do
  :: cancel_rejected_ca_equities_v1_at < 8 -> cancel_rejected_ca_equities_v1_record.transaction_time[cancel_rejected_ca_equities_v1_at] = cancel_rejected_ca_equities_v1_value; cancel_rejected_ca_equities_v1_at = cancel_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_ca_equities_v1_at = 0;
  do
  :: cancel_rejected_ca_equities_v1_at < 20 -> cancel_rejected_ca_equities_v1_record.cl_ord_id[cancel_rejected_ca_equities_v1_at] = cancel_rejected_ca_equities_v1_value; cancel_rejected_ca_equities_v1_at = cancel_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_ca_equities_v1_at = 0;
  do
  :: cancel_rejected_ca_equities_v1_at < 2 -> cancel_rejected_ca_equities_v1_record.broker_id[cancel_rejected_ca_equities_v1_at] = cancel_rejected_ca_equities_v1_value; cancel_rejected_ca_equities_v1_at = cancel_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_ca_equities_v1_at = 0;
  do
  :: cancel_rejected_ca_equities_v1_at < 60 -> cancel_rejected_ca_equities_v1_record.text[cancel_rejected_ca_equities_v1_at] = cancel_rejected_ca_equities_v1_value; cancel_rejected_ca_equities_v1_at = cancel_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_ca_equities_v1_record.cancel_reject_reason = cancel_rejected_ca_equities_v1_value;
  skip
}

/* each byte of Cancel Rejected Ca Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_cancel_rejected_ca_equities_v1(cancel_rejected_ca_equities_v1_record, cancel_rejected_ca_equities_v1_base) {
  cancel_rejected_ca_equities_v1_at = 0;
  do
  :: cancel_rejected_ca_equities_v1_at < 8 -> cancel_rejected_ca_equities_v1_record.transaction_time[cancel_rejected_ca_equities_v1_at] = (cancel_rejected_ca_equities_v1_base + 0 + cancel_rejected_ca_equities_v1_at + 1) % 256; cancel_rejected_ca_equities_v1_at = cancel_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_ca_equities_v1_at = 0;
  do
  :: cancel_rejected_ca_equities_v1_at < 20 -> cancel_rejected_ca_equities_v1_record.cl_ord_id[cancel_rejected_ca_equities_v1_at] = (cancel_rejected_ca_equities_v1_base + 8 + cancel_rejected_ca_equities_v1_at + 1) % 256; cancel_rejected_ca_equities_v1_at = cancel_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_ca_equities_v1_at = 0;
  do
  :: cancel_rejected_ca_equities_v1_at < 2 -> cancel_rejected_ca_equities_v1_record.broker_id[cancel_rejected_ca_equities_v1_at] = (cancel_rejected_ca_equities_v1_base + 28 + cancel_rejected_ca_equities_v1_at + 1) % 256; cancel_rejected_ca_equities_v1_at = cancel_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_ca_equities_v1_at = 0;
  do
  :: cancel_rejected_ca_equities_v1_at < 60 -> cancel_rejected_ca_equities_v1_record.text[cancel_rejected_ca_equities_v1_at] = (cancel_rejected_ca_equities_v1_base + 30 + cancel_rejected_ca_equities_v1_at + 1) % 256; cancel_rejected_ca_equities_v1_at = cancel_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_ca_equities_v1_record.cancel_reject_reason = (cancel_rejected_ca_equities_v1_base + 90 + 1) % 256;
  skip
}

/* Cancel Rejected Ca Equities V 1 to the wire, 91 bytes from where the cursor stands */
inline encode_cancel_rejected_ca_equities_v1(cancel_rejected_ca_equities_v1_record) {
  cancel_rejected_ca_equities_v1_at = 0;
  do
  :: cancel_rejected_ca_equities_v1_at < 8 -> wire[at] = cancel_rejected_ca_equities_v1_record.transaction_time[cancel_rejected_ca_equities_v1_at]; at = at + 1; cancel_rejected_ca_equities_v1_at = cancel_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_ca_equities_v1_at = 0;
  do
  :: cancel_rejected_ca_equities_v1_at < 20 -> wire[at] = cancel_rejected_ca_equities_v1_record.cl_ord_id[cancel_rejected_ca_equities_v1_at]; at = at + 1; cancel_rejected_ca_equities_v1_at = cancel_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_ca_equities_v1_at = 0;
  do
  :: cancel_rejected_ca_equities_v1_at < 2 -> wire[at] = cancel_rejected_ca_equities_v1_record.broker_id[cancel_rejected_ca_equities_v1_at]; at = at + 1; cancel_rejected_ca_equities_v1_at = cancel_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_ca_equities_v1_at = 0;
  do
  :: cancel_rejected_ca_equities_v1_at < 60 -> wire[at] = cancel_rejected_ca_equities_v1_record.text[cancel_rejected_ca_equities_v1_at]; at = at + 1; cancel_rejected_ca_equities_v1_at = cancel_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = cancel_rejected_ca_equities_v1_record.cancel_reject_reason; at = at + 1;
  skip
}

/* Cancel Rejected Ca Equities V 1 off the wire, 91 bytes from where the cursor stands */
inline decode_cancel_rejected_ca_equities_v1(cancel_rejected_ca_equities_v1_record) {
  cancel_rejected_ca_equities_v1_at = 0;
  do
  :: cancel_rejected_ca_equities_v1_at < 8 -> cancel_rejected_ca_equities_v1_record.transaction_time[cancel_rejected_ca_equities_v1_at] = wire[at]; at = at + 1; cancel_rejected_ca_equities_v1_at = cancel_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_ca_equities_v1_at = 0;
  do
  :: cancel_rejected_ca_equities_v1_at < 20 -> cancel_rejected_ca_equities_v1_record.cl_ord_id[cancel_rejected_ca_equities_v1_at] = wire[at]; at = at + 1; cancel_rejected_ca_equities_v1_at = cancel_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_ca_equities_v1_at = 0;
  do
  :: cancel_rejected_ca_equities_v1_at < 2 -> cancel_rejected_ca_equities_v1_record.broker_id[cancel_rejected_ca_equities_v1_at] = wire[at]; at = at + 1; cancel_rejected_ca_equities_v1_at = cancel_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_ca_equities_v1_at = 0;
  do
  :: cancel_rejected_ca_equities_v1_at < 60 -> cancel_rejected_ca_equities_v1_record.text[cancel_rejected_ca_equities_v1_at] = wire[at]; at = at + 1; cancel_rejected_ca_equities_v1_at = cancel_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_ca_equities_v1_record.cancel_reject_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Cancel Rejected Ca Equities V 1 is what was written, byte for byte */
inline equal_cancel_rejected_ca_equities_v1(cancel_rejected_ca_equities_v1_read, cancel_rejected_ca_equities_v1_written) {
  cancel_rejected_ca_equities_v1_at = 0;
  do
  :: cancel_rejected_ca_equities_v1_at < 8 -> assert(cancel_rejected_ca_equities_v1_read.transaction_time[cancel_rejected_ca_equities_v1_at] == cancel_rejected_ca_equities_v1_written.transaction_time[cancel_rejected_ca_equities_v1_at]); cancel_rejected_ca_equities_v1_at = cancel_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_ca_equities_v1_at = 0;
  do
  :: cancel_rejected_ca_equities_v1_at < 20 -> assert(cancel_rejected_ca_equities_v1_read.cl_ord_id[cancel_rejected_ca_equities_v1_at] == cancel_rejected_ca_equities_v1_written.cl_ord_id[cancel_rejected_ca_equities_v1_at]); cancel_rejected_ca_equities_v1_at = cancel_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_ca_equities_v1_at = 0;
  do
  :: cancel_rejected_ca_equities_v1_at < 2 -> assert(cancel_rejected_ca_equities_v1_read.broker_id[cancel_rejected_ca_equities_v1_at] == cancel_rejected_ca_equities_v1_written.broker_id[cancel_rejected_ca_equities_v1_at]); cancel_rejected_ca_equities_v1_at = cancel_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_ca_equities_v1_at = 0;
  do
  :: cancel_rejected_ca_equities_v1_at < 60 -> assert(cancel_rejected_ca_equities_v1_read.text[cancel_rejected_ca_equities_v1_at] == cancel_rejected_ca_equities_v1_written.text[cancel_rejected_ca_equities_v1_at]); cancel_rejected_ca_equities_v1_at = cancel_rejected_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(cancel_rejected_ca_equities_v1_read.cancel_reject_reason == cancel_rejected_ca_equities_v1_written.cancel_reject_reason);
  skip
}

/* ---- Carried Restatement Ca Equities V 1: 262 bytes -------------------------- */

/* Carried Restatement message used to indicate restoration of a multi-day GTC or GTD order at the start of a new business day */
typedef CarriedRestatementCaEquitiesV1 {
  byte transaction_time[8];
  byte order_id[8];
  byte account[16];
  byte cl_ord_id[20];
  byte broker_id[2];
  byte exec_inst;
  byte handling_inst;
  byte order_qty[4];
  byte cum_qty[4];
  byte leaves_qty[4];
  byte ord_type;
  byte price[8];
  byte stop_px[8];
  byte side;
  byte symbol[14];
  byte time_in_force;
  byte settlement_type;
  byte fut_settl_date[4];
  byte ex_destination;
  byte max_floor[4];
  byte expire_date[4];
  byte lei_order_origin;
  byte lei_routing_arrangement_indicator;
  byte umir_account_type;
  byte umir_user_id[12];
  byte basket_trade[4];
  byte program_trade;
  byte jitney[2];
  byte anonymous;
  byte umir_regulation_id;
  byte non_resident;
  byte bypass;
  byte ncib;
  byte short_marking_exempt;
  byte lei_customer_account[20];
  byte lei_algorithm_id[20];
  byte customer_lei[52];
  byte broker_lei[20];
  byte routing_inst;
  byte display_indicator;
  byte matching_state_participation;
  byte true_min_qty[4]
};

int carried_restatement_ca_equities_v1_at;

/* every byte of Carried Restatement Ca Equities V 1 set to one value */
inline fill_carried_restatement_ca_equities_v1(carried_restatement_ca_equities_v1_record, carried_restatement_ca_equities_v1_value) {
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 8 -> carried_restatement_ca_equities_v1_record.transaction_time[carried_restatement_ca_equities_v1_at] = carried_restatement_ca_equities_v1_value; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 8 -> carried_restatement_ca_equities_v1_record.order_id[carried_restatement_ca_equities_v1_at] = carried_restatement_ca_equities_v1_value; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 16 -> carried_restatement_ca_equities_v1_record.account[carried_restatement_ca_equities_v1_at] = carried_restatement_ca_equities_v1_value; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 20 -> carried_restatement_ca_equities_v1_record.cl_ord_id[carried_restatement_ca_equities_v1_at] = carried_restatement_ca_equities_v1_value; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 2 -> carried_restatement_ca_equities_v1_record.broker_id[carried_restatement_ca_equities_v1_at] = carried_restatement_ca_equities_v1_value; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.exec_inst = carried_restatement_ca_equities_v1_value;
  carried_restatement_ca_equities_v1_record.handling_inst = carried_restatement_ca_equities_v1_value;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> carried_restatement_ca_equities_v1_record.order_qty[carried_restatement_ca_equities_v1_at] = carried_restatement_ca_equities_v1_value; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> carried_restatement_ca_equities_v1_record.cum_qty[carried_restatement_ca_equities_v1_at] = carried_restatement_ca_equities_v1_value; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> carried_restatement_ca_equities_v1_record.leaves_qty[carried_restatement_ca_equities_v1_at] = carried_restatement_ca_equities_v1_value; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.ord_type = carried_restatement_ca_equities_v1_value;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 8 -> carried_restatement_ca_equities_v1_record.price[carried_restatement_ca_equities_v1_at] = carried_restatement_ca_equities_v1_value; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 8 -> carried_restatement_ca_equities_v1_record.stop_px[carried_restatement_ca_equities_v1_at] = carried_restatement_ca_equities_v1_value; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.side = carried_restatement_ca_equities_v1_value;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 14 -> carried_restatement_ca_equities_v1_record.symbol[carried_restatement_ca_equities_v1_at] = carried_restatement_ca_equities_v1_value; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.time_in_force = carried_restatement_ca_equities_v1_value;
  carried_restatement_ca_equities_v1_record.settlement_type = carried_restatement_ca_equities_v1_value;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> carried_restatement_ca_equities_v1_record.fut_settl_date[carried_restatement_ca_equities_v1_at] = carried_restatement_ca_equities_v1_value; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.ex_destination = carried_restatement_ca_equities_v1_value;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> carried_restatement_ca_equities_v1_record.max_floor[carried_restatement_ca_equities_v1_at] = carried_restatement_ca_equities_v1_value; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> carried_restatement_ca_equities_v1_record.expire_date[carried_restatement_ca_equities_v1_at] = carried_restatement_ca_equities_v1_value; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.lei_order_origin = carried_restatement_ca_equities_v1_value;
  carried_restatement_ca_equities_v1_record.lei_routing_arrangement_indicator = carried_restatement_ca_equities_v1_value;
  carried_restatement_ca_equities_v1_record.umir_account_type = carried_restatement_ca_equities_v1_value;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 12 -> carried_restatement_ca_equities_v1_record.umir_user_id[carried_restatement_ca_equities_v1_at] = carried_restatement_ca_equities_v1_value; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> carried_restatement_ca_equities_v1_record.basket_trade[carried_restatement_ca_equities_v1_at] = carried_restatement_ca_equities_v1_value; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.program_trade = carried_restatement_ca_equities_v1_value;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 2 -> carried_restatement_ca_equities_v1_record.jitney[carried_restatement_ca_equities_v1_at] = carried_restatement_ca_equities_v1_value; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.anonymous = carried_restatement_ca_equities_v1_value;
  carried_restatement_ca_equities_v1_record.umir_regulation_id = carried_restatement_ca_equities_v1_value;
  carried_restatement_ca_equities_v1_record.non_resident = carried_restatement_ca_equities_v1_value;
  carried_restatement_ca_equities_v1_record.bypass = carried_restatement_ca_equities_v1_value;
  carried_restatement_ca_equities_v1_record.ncib = carried_restatement_ca_equities_v1_value;
  carried_restatement_ca_equities_v1_record.short_marking_exempt = carried_restatement_ca_equities_v1_value;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 20 -> carried_restatement_ca_equities_v1_record.lei_customer_account[carried_restatement_ca_equities_v1_at] = carried_restatement_ca_equities_v1_value; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 20 -> carried_restatement_ca_equities_v1_record.lei_algorithm_id[carried_restatement_ca_equities_v1_at] = carried_restatement_ca_equities_v1_value; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 52 -> carried_restatement_ca_equities_v1_record.customer_lei[carried_restatement_ca_equities_v1_at] = carried_restatement_ca_equities_v1_value; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 20 -> carried_restatement_ca_equities_v1_record.broker_lei[carried_restatement_ca_equities_v1_at] = carried_restatement_ca_equities_v1_value; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.routing_inst = carried_restatement_ca_equities_v1_value;
  carried_restatement_ca_equities_v1_record.display_indicator = carried_restatement_ca_equities_v1_value;
  carried_restatement_ca_equities_v1_record.matching_state_participation = carried_restatement_ca_equities_v1_value;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> carried_restatement_ca_equities_v1_record.true_min_qty[carried_restatement_ca_equities_v1_at] = carried_restatement_ca_equities_v1_value; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Carried Restatement Ca Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_carried_restatement_ca_equities_v1(carried_restatement_ca_equities_v1_record, carried_restatement_ca_equities_v1_base) {
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 8 -> carried_restatement_ca_equities_v1_record.transaction_time[carried_restatement_ca_equities_v1_at] = (carried_restatement_ca_equities_v1_base + 0 + carried_restatement_ca_equities_v1_at + 1) % 256; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 8 -> carried_restatement_ca_equities_v1_record.order_id[carried_restatement_ca_equities_v1_at] = (carried_restatement_ca_equities_v1_base + 8 + carried_restatement_ca_equities_v1_at + 1) % 256; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 16 -> carried_restatement_ca_equities_v1_record.account[carried_restatement_ca_equities_v1_at] = (carried_restatement_ca_equities_v1_base + 16 + carried_restatement_ca_equities_v1_at + 1) % 256; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 20 -> carried_restatement_ca_equities_v1_record.cl_ord_id[carried_restatement_ca_equities_v1_at] = (carried_restatement_ca_equities_v1_base + 32 + carried_restatement_ca_equities_v1_at + 1) % 256; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 2 -> carried_restatement_ca_equities_v1_record.broker_id[carried_restatement_ca_equities_v1_at] = (carried_restatement_ca_equities_v1_base + 52 + carried_restatement_ca_equities_v1_at + 1) % 256; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.exec_inst = (carried_restatement_ca_equities_v1_base + 54 + 1) % 256;
  carried_restatement_ca_equities_v1_record.handling_inst = (carried_restatement_ca_equities_v1_base + 55 + 1) % 256;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> carried_restatement_ca_equities_v1_record.order_qty[carried_restatement_ca_equities_v1_at] = (carried_restatement_ca_equities_v1_base + 56 + carried_restatement_ca_equities_v1_at + 1) % 256; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> carried_restatement_ca_equities_v1_record.cum_qty[carried_restatement_ca_equities_v1_at] = (carried_restatement_ca_equities_v1_base + 60 + carried_restatement_ca_equities_v1_at + 1) % 256; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> carried_restatement_ca_equities_v1_record.leaves_qty[carried_restatement_ca_equities_v1_at] = (carried_restatement_ca_equities_v1_base + 64 + carried_restatement_ca_equities_v1_at + 1) % 256; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.ord_type = (carried_restatement_ca_equities_v1_base + 68 + 1) % 256;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 8 -> carried_restatement_ca_equities_v1_record.price[carried_restatement_ca_equities_v1_at] = (carried_restatement_ca_equities_v1_base + 69 + carried_restatement_ca_equities_v1_at + 1) % 256; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 8 -> carried_restatement_ca_equities_v1_record.stop_px[carried_restatement_ca_equities_v1_at] = (carried_restatement_ca_equities_v1_base + 77 + carried_restatement_ca_equities_v1_at + 1) % 256; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.side = (carried_restatement_ca_equities_v1_base + 85 + 1) % 256;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 14 -> carried_restatement_ca_equities_v1_record.symbol[carried_restatement_ca_equities_v1_at] = (carried_restatement_ca_equities_v1_base + 86 + carried_restatement_ca_equities_v1_at + 1) % 256; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.time_in_force = (carried_restatement_ca_equities_v1_base + 100 + 1) % 256;
  carried_restatement_ca_equities_v1_record.settlement_type = (carried_restatement_ca_equities_v1_base + 101 + 1) % 256;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> carried_restatement_ca_equities_v1_record.fut_settl_date[carried_restatement_ca_equities_v1_at] = (carried_restatement_ca_equities_v1_base + 102 + carried_restatement_ca_equities_v1_at + 1) % 256; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.ex_destination = (carried_restatement_ca_equities_v1_base + 106 + 1) % 256;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> carried_restatement_ca_equities_v1_record.max_floor[carried_restatement_ca_equities_v1_at] = (carried_restatement_ca_equities_v1_base + 107 + carried_restatement_ca_equities_v1_at + 1) % 256; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> carried_restatement_ca_equities_v1_record.expire_date[carried_restatement_ca_equities_v1_at] = (carried_restatement_ca_equities_v1_base + 111 + carried_restatement_ca_equities_v1_at + 1) % 256; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.lei_order_origin = (carried_restatement_ca_equities_v1_base + 115 + 1) % 256;
  carried_restatement_ca_equities_v1_record.lei_routing_arrangement_indicator = (carried_restatement_ca_equities_v1_base + 116 + 1) % 256;
  carried_restatement_ca_equities_v1_record.umir_account_type = (carried_restatement_ca_equities_v1_base + 117 + 1) % 256;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 12 -> carried_restatement_ca_equities_v1_record.umir_user_id[carried_restatement_ca_equities_v1_at] = (carried_restatement_ca_equities_v1_base + 118 + carried_restatement_ca_equities_v1_at + 1) % 256; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> carried_restatement_ca_equities_v1_record.basket_trade[carried_restatement_ca_equities_v1_at] = (carried_restatement_ca_equities_v1_base + 130 + carried_restatement_ca_equities_v1_at + 1) % 256; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.program_trade = (carried_restatement_ca_equities_v1_base + 134 + 1) % 256;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 2 -> carried_restatement_ca_equities_v1_record.jitney[carried_restatement_ca_equities_v1_at] = (carried_restatement_ca_equities_v1_base + 135 + carried_restatement_ca_equities_v1_at + 1) % 256; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.anonymous = (carried_restatement_ca_equities_v1_base + 137 + 1) % 256;
  carried_restatement_ca_equities_v1_record.umir_regulation_id = (carried_restatement_ca_equities_v1_base + 138 + 1) % 256;
  carried_restatement_ca_equities_v1_record.non_resident = (carried_restatement_ca_equities_v1_base + 139 + 1) % 256;
  carried_restatement_ca_equities_v1_record.bypass = (carried_restatement_ca_equities_v1_base + 140 + 1) % 256;
  carried_restatement_ca_equities_v1_record.ncib = (carried_restatement_ca_equities_v1_base + 141 + 1) % 256;
  carried_restatement_ca_equities_v1_record.short_marking_exempt = (carried_restatement_ca_equities_v1_base + 142 + 1) % 256;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 20 -> carried_restatement_ca_equities_v1_record.lei_customer_account[carried_restatement_ca_equities_v1_at] = (carried_restatement_ca_equities_v1_base + 143 + carried_restatement_ca_equities_v1_at + 1) % 256; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 20 -> carried_restatement_ca_equities_v1_record.lei_algorithm_id[carried_restatement_ca_equities_v1_at] = (carried_restatement_ca_equities_v1_base + 163 + carried_restatement_ca_equities_v1_at + 1) % 256; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 52 -> carried_restatement_ca_equities_v1_record.customer_lei[carried_restatement_ca_equities_v1_at] = (carried_restatement_ca_equities_v1_base + 183 + carried_restatement_ca_equities_v1_at + 1) % 256; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 20 -> carried_restatement_ca_equities_v1_record.broker_lei[carried_restatement_ca_equities_v1_at] = (carried_restatement_ca_equities_v1_base + 235 + carried_restatement_ca_equities_v1_at + 1) % 256; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.routing_inst = (carried_restatement_ca_equities_v1_base + 255 + 1) % 256;
  carried_restatement_ca_equities_v1_record.display_indicator = (carried_restatement_ca_equities_v1_base + 256 + 1) % 256;
  carried_restatement_ca_equities_v1_record.matching_state_participation = (carried_restatement_ca_equities_v1_base + 257 + 1) % 256;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> carried_restatement_ca_equities_v1_record.true_min_qty[carried_restatement_ca_equities_v1_at] = (carried_restatement_ca_equities_v1_base + 258 + carried_restatement_ca_equities_v1_at + 1) % 256; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Carried Restatement Ca Equities V 1 to the wire, 262 bytes from where the cursor stands */
inline encode_carried_restatement_ca_equities_v1(carried_restatement_ca_equities_v1_record) {
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 8 -> wire[at] = carried_restatement_ca_equities_v1_record.transaction_time[carried_restatement_ca_equities_v1_at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 8 -> wire[at] = carried_restatement_ca_equities_v1_record.order_id[carried_restatement_ca_equities_v1_at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 16 -> wire[at] = carried_restatement_ca_equities_v1_record.account[carried_restatement_ca_equities_v1_at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 20 -> wire[at] = carried_restatement_ca_equities_v1_record.cl_ord_id[carried_restatement_ca_equities_v1_at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 2 -> wire[at] = carried_restatement_ca_equities_v1_record.broker_id[carried_restatement_ca_equities_v1_at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_ca_equities_v1_record.exec_inst; at = at + 1;
  wire[at] = carried_restatement_ca_equities_v1_record.handling_inst; at = at + 1;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> wire[at] = carried_restatement_ca_equities_v1_record.order_qty[carried_restatement_ca_equities_v1_at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> wire[at] = carried_restatement_ca_equities_v1_record.cum_qty[carried_restatement_ca_equities_v1_at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> wire[at] = carried_restatement_ca_equities_v1_record.leaves_qty[carried_restatement_ca_equities_v1_at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_ca_equities_v1_record.ord_type; at = at + 1;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 8 -> wire[at] = carried_restatement_ca_equities_v1_record.price[carried_restatement_ca_equities_v1_at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 8 -> wire[at] = carried_restatement_ca_equities_v1_record.stop_px[carried_restatement_ca_equities_v1_at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_ca_equities_v1_record.side; at = at + 1;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 14 -> wire[at] = carried_restatement_ca_equities_v1_record.symbol[carried_restatement_ca_equities_v1_at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_ca_equities_v1_record.time_in_force; at = at + 1;
  wire[at] = carried_restatement_ca_equities_v1_record.settlement_type; at = at + 1;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> wire[at] = carried_restatement_ca_equities_v1_record.fut_settl_date[carried_restatement_ca_equities_v1_at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_ca_equities_v1_record.ex_destination; at = at + 1;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> wire[at] = carried_restatement_ca_equities_v1_record.max_floor[carried_restatement_ca_equities_v1_at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> wire[at] = carried_restatement_ca_equities_v1_record.expire_date[carried_restatement_ca_equities_v1_at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_ca_equities_v1_record.lei_order_origin; at = at + 1;
  wire[at] = carried_restatement_ca_equities_v1_record.lei_routing_arrangement_indicator; at = at + 1;
  wire[at] = carried_restatement_ca_equities_v1_record.umir_account_type; at = at + 1;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 12 -> wire[at] = carried_restatement_ca_equities_v1_record.umir_user_id[carried_restatement_ca_equities_v1_at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> wire[at] = carried_restatement_ca_equities_v1_record.basket_trade[carried_restatement_ca_equities_v1_at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_ca_equities_v1_record.program_trade; at = at + 1;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 2 -> wire[at] = carried_restatement_ca_equities_v1_record.jitney[carried_restatement_ca_equities_v1_at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_ca_equities_v1_record.anonymous; at = at + 1;
  wire[at] = carried_restatement_ca_equities_v1_record.umir_regulation_id; at = at + 1;
  wire[at] = carried_restatement_ca_equities_v1_record.non_resident; at = at + 1;
  wire[at] = carried_restatement_ca_equities_v1_record.bypass; at = at + 1;
  wire[at] = carried_restatement_ca_equities_v1_record.ncib; at = at + 1;
  wire[at] = carried_restatement_ca_equities_v1_record.short_marking_exempt; at = at + 1;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 20 -> wire[at] = carried_restatement_ca_equities_v1_record.lei_customer_account[carried_restatement_ca_equities_v1_at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 20 -> wire[at] = carried_restatement_ca_equities_v1_record.lei_algorithm_id[carried_restatement_ca_equities_v1_at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 52 -> wire[at] = carried_restatement_ca_equities_v1_record.customer_lei[carried_restatement_ca_equities_v1_at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 20 -> wire[at] = carried_restatement_ca_equities_v1_record.broker_lei[carried_restatement_ca_equities_v1_at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_ca_equities_v1_record.routing_inst; at = at + 1;
  wire[at] = carried_restatement_ca_equities_v1_record.display_indicator; at = at + 1;
  wire[at] = carried_restatement_ca_equities_v1_record.matching_state_participation; at = at + 1;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> wire[at] = carried_restatement_ca_equities_v1_record.true_min_qty[carried_restatement_ca_equities_v1_at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Carried Restatement Ca Equities V 1 off the wire, 262 bytes from where the cursor stands */
inline decode_carried_restatement_ca_equities_v1(carried_restatement_ca_equities_v1_record) {
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 8 -> carried_restatement_ca_equities_v1_record.transaction_time[carried_restatement_ca_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 8 -> carried_restatement_ca_equities_v1_record.order_id[carried_restatement_ca_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 16 -> carried_restatement_ca_equities_v1_record.account[carried_restatement_ca_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 20 -> carried_restatement_ca_equities_v1_record.cl_ord_id[carried_restatement_ca_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 2 -> carried_restatement_ca_equities_v1_record.broker_id[carried_restatement_ca_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.exec_inst = wire[at]; at = at + 1;
  carried_restatement_ca_equities_v1_record.handling_inst = wire[at]; at = at + 1;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> carried_restatement_ca_equities_v1_record.order_qty[carried_restatement_ca_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> carried_restatement_ca_equities_v1_record.cum_qty[carried_restatement_ca_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> carried_restatement_ca_equities_v1_record.leaves_qty[carried_restatement_ca_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.ord_type = wire[at]; at = at + 1;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 8 -> carried_restatement_ca_equities_v1_record.price[carried_restatement_ca_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 8 -> carried_restatement_ca_equities_v1_record.stop_px[carried_restatement_ca_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.side = wire[at]; at = at + 1;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 14 -> carried_restatement_ca_equities_v1_record.symbol[carried_restatement_ca_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.time_in_force = wire[at]; at = at + 1;
  carried_restatement_ca_equities_v1_record.settlement_type = wire[at]; at = at + 1;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> carried_restatement_ca_equities_v1_record.fut_settl_date[carried_restatement_ca_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.ex_destination = wire[at]; at = at + 1;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> carried_restatement_ca_equities_v1_record.max_floor[carried_restatement_ca_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> carried_restatement_ca_equities_v1_record.expire_date[carried_restatement_ca_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.lei_order_origin = wire[at]; at = at + 1;
  carried_restatement_ca_equities_v1_record.lei_routing_arrangement_indicator = wire[at]; at = at + 1;
  carried_restatement_ca_equities_v1_record.umir_account_type = wire[at]; at = at + 1;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 12 -> carried_restatement_ca_equities_v1_record.umir_user_id[carried_restatement_ca_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> carried_restatement_ca_equities_v1_record.basket_trade[carried_restatement_ca_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.program_trade = wire[at]; at = at + 1;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 2 -> carried_restatement_ca_equities_v1_record.jitney[carried_restatement_ca_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.anonymous = wire[at]; at = at + 1;
  carried_restatement_ca_equities_v1_record.umir_regulation_id = wire[at]; at = at + 1;
  carried_restatement_ca_equities_v1_record.non_resident = wire[at]; at = at + 1;
  carried_restatement_ca_equities_v1_record.bypass = wire[at]; at = at + 1;
  carried_restatement_ca_equities_v1_record.ncib = wire[at]; at = at + 1;
  carried_restatement_ca_equities_v1_record.short_marking_exempt = wire[at]; at = at + 1;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 20 -> carried_restatement_ca_equities_v1_record.lei_customer_account[carried_restatement_ca_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 20 -> carried_restatement_ca_equities_v1_record.lei_algorithm_id[carried_restatement_ca_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 52 -> carried_restatement_ca_equities_v1_record.customer_lei[carried_restatement_ca_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 20 -> carried_restatement_ca_equities_v1_record.broker_lei[carried_restatement_ca_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_record.routing_inst = wire[at]; at = at + 1;
  carried_restatement_ca_equities_v1_record.display_indicator = wire[at]; at = at + 1;
  carried_restatement_ca_equities_v1_record.matching_state_participation = wire[at]; at = at + 1;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> carried_restatement_ca_equities_v1_record.true_min_qty[carried_restatement_ca_equities_v1_at] = wire[at]; at = at + 1; carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Carried Restatement Ca Equities V 1 is what was written, byte for byte */
inline equal_carried_restatement_ca_equities_v1(carried_restatement_ca_equities_v1_read, carried_restatement_ca_equities_v1_written) {
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 8 -> assert(carried_restatement_ca_equities_v1_read.transaction_time[carried_restatement_ca_equities_v1_at] == carried_restatement_ca_equities_v1_written.transaction_time[carried_restatement_ca_equities_v1_at]); carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 8 -> assert(carried_restatement_ca_equities_v1_read.order_id[carried_restatement_ca_equities_v1_at] == carried_restatement_ca_equities_v1_written.order_id[carried_restatement_ca_equities_v1_at]); carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 16 -> assert(carried_restatement_ca_equities_v1_read.account[carried_restatement_ca_equities_v1_at] == carried_restatement_ca_equities_v1_written.account[carried_restatement_ca_equities_v1_at]); carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 20 -> assert(carried_restatement_ca_equities_v1_read.cl_ord_id[carried_restatement_ca_equities_v1_at] == carried_restatement_ca_equities_v1_written.cl_ord_id[carried_restatement_ca_equities_v1_at]); carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 2 -> assert(carried_restatement_ca_equities_v1_read.broker_id[carried_restatement_ca_equities_v1_at] == carried_restatement_ca_equities_v1_written.broker_id[carried_restatement_ca_equities_v1_at]); carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(carried_restatement_ca_equities_v1_read.exec_inst == carried_restatement_ca_equities_v1_written.exec_inst);
  assert(carried_restatement_ca_equities_v1_read.handling_inst == carried_restatement_ca_equities_v1_written.handling_inst);
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> assert(carried_restatement_ca_equities_v1_read.order_qty[carried_restatement_ca_equities_v1_at] == carried_restatement_ca_equities_v1_written.order_qty[carried_restatement_ca_equities_v1_at]); carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> assert(carried_restatement_ca_equities_v1_read.cum_qty[carried_restatement_ca_equities_v1_at] == carried_restatement_ca_equities_v1_written.cum_qty[carried_restatement_ca_equities_v1_at]); carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> assert(carried_restatement_ca_equities_v1_read.leaves_qty[carried_restatement_ca_equities_v1_at] == carried_restatement_ca_equities_v1_written.leaves_qty[carried_restatement_ca_equities_v1_at]); carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(carried_restatement_ca_equities_v1_read.ord_type == carried_restatement_ca_equities_v1_written.ord_type);
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 8 -> assert(carried_restatement_ca_equities_v1_read.price[carried_restatement_ca_equities_v1_at] == carried_restatement_ca_equities_v1_written.price[carried_restatement_ca_equities_v1_at]); carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 8 -> assert(carried_restatement_ca_equities_v1_read.stop_px[carried_restatement_ca_equities_v1_at] == carried_restatement_ca_equities_v1_written.stop_px[carried_restatement_ca_equities_v1_at]); carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(carried_restatement_ca_equities_v1_read.side == carried_restatement_ca_equities_v1_written.side);
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 14 -> assert(carried_restatement_ca_equities_v1_read.symbol[carried_restatement_ca_equities_v1_at] == carried_restatement_ca_equities_v1_written.symbol[carried_restatement_ca_equities_v1_at]); carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(carried_restatement_ca_equities_v1_read.time_in_force == carried_restatement_ca_equities_v1_written.time_in_force);
  assert(carried_restatement_ca_equities_v1_read.settlement_type == carried_restatement_ca_equities_v1_written.settlement_type);
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> assert(carried_restatement_ca_equities_v1_read.fut_settl_date[carried_restatement_ca_equities_v1_at] == carried_restatement_ca_equities_v1_written.fut_settl_date[carried_restatement_ca_equities_v1_at]); carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(carried_restatement_ca_equities_v1_read.ex_destination == carried_restatement_ca_equities_v1_written.ex_destination);
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> assert(carried_restatement_ca_equities_v1_read.max_floor[carried_restatement_ca_equities_v1_at] == carried_restatement_ca_equities_v1_written.max_floor[carried_restatement_ca_equities_v1_at]); carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> assert(carried_restatement_ca_equities_v1_read.expire_date[carried_restatement_ca_equities_v1_at] == carried_restatement_ca_equities_v1_written.expire_date[carried_restatement_ca_equities_v1_at]); carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(carried_restatement_ca_equities_v1_read.lei_order_origin == carried_restatement_ca_equities_v1_written.lei_order_origin);
  assert(carried_restatement_ca_equities_v1_read.lei_routing_arrangement_indicator == carried_restatement_ca_equities_v1_written.lei_routing_arrangement_indicator);
  assert(carried_restatement_ca_equities_v1_read.umir_account_type == carried_restatement_ca_equities_v1_written.umir_account_type);
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 12 -> assert(carried_restatement_ca_equities_v1_read.umir_user_id[carried_restatement_ca_equities_v1_at] == carried_restatement_ca_equities_v1_written.umir_user_id[carried_restatement_ca_equities_v1_at]); carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> assert(carried_restatement_ca_equities_v1_read.basket_trade[carried_restatement_ca_equities_v1_at] == carried_restatement_ca_equities_v1_written.basket_trade[carried_restatement_ca_equities_v1_at]); carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(carried_restatement_ca_equities_v1_read.program_trade == carried_restatement_ca_equities_v1_written.program_trade);
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 2 -> assert(carried_restatement_ca_equities_v1_read.jitney[carried_restatement_ca_equities_v1_at] == carried_restatement_ca_equities_v1_written.jitney[carried_restatement_ca_equities_v1_at]); carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(carried_restatement_ca_equities_v1_read.anonymous == carried_restatement_ca_equities_v1_written.anonymous);
  assert(carried_restatement_ca_equities_v1_read.umir_regulation_id == carried_restatement_ca_equities_v1_written.umir_regulation_id);
  assert(carried_restatement_ca_equities_v1_read.non_resident == carried_restatement_ca_equities_v1_written.non_resident);
  assert(carried_restatement_ca_equities_v1_read.bypass == carried_restatement_ca_equities_v1_written.bypass);
  assert(carried_restatement_ca_equities_v1_read.ncib == carried_restatement_ca_equities_v1_written.ncib);
  assert(carried_restatement_ca_equities_v1_read.short_marking_exempt == carried_restatement_ca_equities_v1_written.short_marking_exempt);
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 20 -> assert(carried_restatement_ca_equities_v1_read.lei_customer_account[carried_restatement_ca_equities_v1_at] == carried_restatement_ca_equities_v1_written.lei_customer_account[carried_restatement_ca_equities_v1_at]); carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 20 -> assert(carried_restatement_ca_equities_v1_read.lei_algorithm_id[carried_restatement_ca_equities_v1_at] == carried_restatement_ca_equities_v1_written.lei_algorithm_id[carried_restatement_ca_equities_v1_at]); carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 52 -> assert(carried_restatement_ca_equities_v1_read.customer_lei[carried_restatement_ca_equities_v1_at] == carried_restatement_ca_equities_v1_written.customer_lei[carried_restatement_ca_equities_v1_at]); carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 20 -> assert(carried_restatement_ca_equities_v1_read.broker_lei[carried_restatement_ca_equities_v1_at] == carried_restatement_ca_equities_v1_written.broker_lei[carried_restatement_ca_equities_v1_at]); carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(carried_restatement_ca_equities_v1_read.routing_inst == carried_restatement_ca_equities_v1_written.routing_inst);
  assert(carried_restatement_ca_equities_v1_read.display_indicator == carried_restatement_ca_equities_v1_written.display_indicator);
  assert(carried_restatement_ca_equities_v1_read.matching_state_participation == carried_restatement_ca_equities_v1_written.matching_state_participation);
  carried_restatement_ca_equities_v1_at = 0;
  do
  :: carried_restatement_ca_equities_v1_at < 4 -> assert(carried_restatement_ca_equities_v1_read.true_min_qty[carried_restatement_ca_equities_v1_at] == carried_restatement_ca_equities_v1_written.true_min_qty[carried_restatement_ca_equities_v1_at]); carried_restatement_ca_equities_v1_at = carried_restatement_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Done For Day Ca Equities V 1: 38 bytes ---------------------------------- */

/* Done For Day message representing orders persisted during the current day session to carry over to the next session */
typedef DoneForDayCaEquitiesV1 {
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte broker_id[2];
  byte symbol_8[8]
};

int done_for_day_ca_equities_v1_at;

/* every byte of Done For Day Ca Equities V 1 set to one value */
inline fill_done_for_day_ca_equities_v1(done_for_day_ca_equities_v1_record, done_for_day_ca_equities_v1_value) {
  done_for_day_ca_equities_v1_at = 0;
  do
  :: done_for_day_ca_equities_v1_at < 8 -> done_for_day_ca_equities_v1_record.transaction_time[done_for_day_ca_equities_v1_at] = done_for_day_ca_equities_v1_value; done_for_day_ca_equities_v1_at = done_for_day_ca_equities_v1_at + 1
  :: else -> break
  od;
  done_for_day_ca_equities_v1_at = 0;
  do
  :: done_for_day_ca_equities_v1_at < 20 -> done_for_day_ca_equities_v1_record.cl_ord_id[done_for_day_ca_equities_v1_at] = done_for_day_ca_equities_v1_value; done_for_day_ca_equities_v1_at = done_for_day_ca_equities_v1_at + 1
  :: else -> break
  od;
  done_for_day_ca_equities_v1_at = 0;
  do
  :: done_for_day_ca_equities_v1_at < 2 -> done_for_day_ca_equities_v1_record.broker_id[done_for_day_ca_equities_v1_at] = done_for_day_ca_equities_v1_value; done_for_day_ca_equities_v1_at = done_for_day_ca_equities_v1_at + 1
  :: else -> break
  od;
  done_for_day_ca_equities_v1_at = 0;
  do
  :: done_for_day_ca_equities_v1_at < 8 -> done_for_day_ca_equities_v1_record.symbol_8[done_for_day_ca_equities_v1_at] = done_for_day_ca_equities_v1_value; done_for_day_ca_equities_v1_at = done_for_day_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Done For Day Ca Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_done_for_day_ca_equities_v1(done_for_day_ca_equities_v1_record, done_for_day_ca_equities_v1_base) {
  done_for_day_ca_equities_v1_at = 0;
  do
  :: done_for_day_ca_equities_v1_at < 8 -> done_for_day_ca_equities_v1_record.transaction_time[done_for_day_ca_equities_v1_at] = (done_for_day_ca_equities_v1_base + 0 + done_for_day_ca_equities_v1_at + 1) % 256; done_for_day_ca_equities_v1_at = done_for_day_ca_equities_v1_at + 1
  :: else -> break
  od;
  done_for_day_ca_equities_v1_at = 0;
  do
  :: done_for_day_ca_equities_v1_at < 20 -> done_for_day_ca_equities_v1_record.cl_ord_id[done_for_day_ca_equities_v1_at] = (done_for_day_ca_equities_v1_base + 8 + done_for_day_ca_equities_v1_at + 1) % 256; done_for_day_ca_equities_v1_at = done_for_day_ca_equities_v1_at + 1
  :: else -> break
  od;
  done_for_day_ca_equities_v1_at = 0;
  do
  :: done_for_day_ca_equities_v1_at < 2 -> done_for_day_ca_equities_v1_record.broker_id[done_for_day_ca_equities_v1_at] = (done_for_day_ca_equities_v1_base + 28 + done_for_day_ca_equities_v1_at + 1) % 256; done_for_day_ca_equities_v1_at = done_for_day_ca_equities_v1_at + 1
  :: else -> break
  od;
  done_for_day_ca_equities_v1_at = 0;
  do
  :: done_for_day_ca_equities_v1_at < 8 -> done_for_day_ca_equities_v1_record.symbol_8[done_for_day_ca_equities_v1_at] = (done_for_day_ca_equities_v1_base + 30 + done_for_day_ca_equities_v1_at + 1) % 256; done_for_day_ca_equities_v1_at = done_for_day_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Done For Day Ca Equities V 1 to the wire, 38 bytes from where the cursor stands */
inline encode_done_for_day_ca_equities_v1(done_for_day_ca_equities_v1_record) {
  done_for_day_ca_equities_v1_at = 0;
  do
  :: done_for_day_ca_equities_v1_at < 8 -> wire[at] = done_for_day_ca_equities_v1_record.transaction_time[done_for_day_ca_equities_v1_at]; at = at + 1; done_for_day_ca_equities_v1_at = done_for_day_ca_equities_v1_at + 1
  :: else -> break
  od;
  done_for_day_ca_equities_v1_at = 0;
  do
  :: done_for_day_ca_equities_v1_at < 20 -> wire[at] = done_for_day_ca_equities_v1_record.cl_ord_id[done_for_day_ca_equities_v1_at]; at = at + 1; done_for_day_ca_equities_v1_at = done_for_day_ca_equities_v1_at + 1
  :: else -> break
  od;
  done_for_day_ca_equities_v1_at = 0;
  do
  :: done_for_day_ca_equities_v1_at < 2 -> wire[at] = done_for_day_ca_equities_v1_record.broker_id[done_for_day_ca_equities_v1_at]; at = at + 1; done_for_day_ca_equities_v1_at = done_for_day_ca_equities_v1_at + 1
  :: else -> break
  od;
  done_for_day_ca_equities_v1_at = 0;
  do
  :: done_for_day_ca_equities_v1_at < 8 -> wire[at] = done_for_day_ca_equities_v1_record.symbol_8[done_for_day_ca_equities_v1_at]; at = at + 1; done_for_day_ca_equities_v1_at = done_for_day_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Done For Day Ca Equities V 1 off the wire, 38 bytes from where the cursor stands */
inline decode_done_for_day_ca_equities_v1(done_for_day_ca_equities_v1_record) {
  done_for_day_ca_equities_v1_at = 0;
  do
  :: done_for_day_ca_equities_v1_at < 8 -> done_for_day_ca_equities_v1_record.transaction_time[done_for_day_ca_equities_v1_at] = wire[at]; at = at + 1; done_for_day_ca_equities_v1_at = done_for_day_ca_equities_v1_at + 1
  :: else -> break
  od;
  done_for_day_ca_equities_v1_at = 0;
  do
  :: done_for_day_ca_equities_v1_at < 20 -> done_for_day_ca_equities_v1_record.cl_ord_id[done_for_day_ca_equities_v1_at] = wire[at]; at = at + 1; done_for_day_ca_equities_v1_at = done_for_day_ca_equities_v1_at + 1
  :: else -> break
  od;
  done_for_day_ca_equities_v1_at = 0;
  do
  :: done_for_day_ca_equities_v1_at < 2 -> done_for_day_ca_equities_v1_record.broker_id[done_for_day_ca_equities_v1_at] = wire[at]; at = at + 1; done_for_day_ca_equities_v1_at = done_for_day_ca_equities_v1_at + 1
  :: else -> break
  od;
  done_for_day_ca_equities_v1_at = 0;
  do
  :: done_for_day_ca_equities_v1_at < 8 -> done_for_day_ca_equities_v1_record.symbol_8[done_for_day_ca_equities_v1_at] = wire[at]; at = at + 1; done_for_day_ca_equities_v1_at = done_for_day_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Done For Day Ca Equities V 1 is what was written, byte for byte */
inline equal_done_for_day_ca_equities_v1(done_for_day_ca_equities_v1_read, done_for_day_ca_equities_v1_written) {
  done_for_day_ca_equities_v1_at = 0;
  do
  :: done_for_day_ca_equities_v1_at < 8 -> assert(done_for_day_ca_equities_v1_read.transaction_time[done_for_day_ca_equities_v1_at] == done_for_day_ca_equities_v1_written.transaction_time[done_for_day_ca_equities_v1_at]); done_for_day_ca_equities_v1_at = done_for_day_ca_equities_v1_at + 1
  :: else -> break
  od;
  done_for_day_ca_equities_v1_at = 0;
  do
  :: done_for_day_ca_equities_v1_at < 20 -> assert(done_for_day_ca_equities_v1_read.cl_ord_id[done_for_day_ca_equities_v1_at] == done_for_day_ca_equities_v1_written.cl_ord_id[done_for_day_ca_equities_v1_at]); done_for_day_ca_equities_v1_at = done_for_day_ca_equities_v1_at + 1
  :: else -> break
  od;
  done_for_day_ca_equities_v1_at = 0;
  do
  :: done_for_day_ca_equities_v1_at < 2 -> assert(done_for_day_ca_equities_v1_read.broker_id[done_for_day_ca_equities_v1_at] == done_for_day_ca_equities_v1_written.broker_id[done_for_day_ca_equities_v1_at]); done_for_day_ca_equities_v1_at = done_for_day_ca_equities_v1_at + 1
  :: else -> break
  od;
  done_for_day_ca_equities_v1_at = 0;
  do
  :: done_for_day_ca_equities_v1_at < 8 -> assert(done_for_day_ca_equities_v1_read.symbol_8[done_for_day_ca_equities_v1_at] == done_for_day_ca_equities_v1_written.symbol_8[done_for_day_ca_equities_v1_at]); done_for_day_ca_equities_v1_at = done_for_day_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Cancel Correct Ca Equities V 1: 119 bytes ------------------------- */

/* Trade Cancel or Correct notification that a trade has been busted or corrected */
typedef TradeCancelCorrectCaEquitiesV1 {
  byte transaction_time[8];
  byte account[16];
  byte cl_ord_id[20];
  byte exec_id[8];
  byte exec_ref_id[8];
  byte last_px[8];
  byte last_shares[4];
  byte side;
  byte symbol[14];
  byte base_liquidity_indicator;
  byte corrected_size[4];
  byte umir_user_id[12];
  byte corrected_price[8];
  byte fee_code[2];
  byte settlement_type;
  byte fut_settl_date[4]
};

int trade_cancel_correct_ca_equities_v1_at;

/* every byte of Trade Cancel Correct Ca Equities V 1 set to one value */
inline fill_trade_cancel_correct_ca_equities_v1(trade_cancel_correct_ca_equities_v1_record, trade_cancel_correct_ca_equities_v1_value) {
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 8 -> trade_cancel_correct_ca_equities_v1_record.transaction_time[trade_cancel_correct_ca_equities_v1_at] = trade_cancel_correct_ca_equities_v1_value; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 16 -> trade_cancel_correct_ca_equities_v1_record.account[trade_cancel_correct_ca_equities_v1_at] = trade_cancel_correct_ca_equities_v1_value; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 20 -> trade_cancel_correct_ca_equities_v1_record.cl_ord_id[trade_cancel_correct_ca_equities_v1_at] = trade_cancel_correct_ca_equities_v1_value; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 8 -> trade_cancel_correct_ca_equities_v1_record.exec_id[trade_cancel_correct_ca_equities_v1_at] = trade_cancel_correct_ca_equities_v1_value; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 8 -> trade_cancel_correct_ca_equities_v1_record.exec_ref_id[trade_cancel_correct_ca_equities_v1_at] = trade_cancel_correct_ca_equities_v1_value; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 8 -> trade_cancel_correct_ca_equities_v1_record.last_px[trade_cancel_correct_ca_equities_v1_at] = trade_cancel_correct_ca_equities_v1_value; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 4 -> trade_cancel_correct_ca_equities_v1_record.last_shares[trade_cancel_correct_ca_equities_v1_at] = trade_cancel_correct_ca_equities_v1_value; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_record.side = trade_cancel_correct_ca_equities_v1_value;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 14 -> trade_cancel_correct_ca_equities_v1_record.symbol[trade_cancel_correct_ca_equities_v1_at] = trade_cancel_correct_ca_equities_v1_value; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_record.base_liquidity_indicator = trade_cancel_correct_ca_equities_v1_value;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 4 -> trade_cancel_correct_ca_equities_v1_record.corrected_size[trade_cancel_correct_ca_equities_v1_at] = trade_cancel_correct_ca_equities_v1_value; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 12 -> trade_cancel_correct_ca_equities_v1_record.umir_user_id[trade_cancel_correct_ca_equities_v1_at] = trade_cancel_correct_ca_equities_v1_value; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 8 -> trade_cancel_correct_ca_equities_v1_record.corrected_price[trade_cancel_correct_ca_equities_v1_at] = trade_cancel_correct_ca_equities_v1_value; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 2 -> trade_cancel_correct_ca_equities_v1_record.fee_code[trade_cancel_correct_ca_equities_v1_at] = trade_cancel_correct_ca_equities_v1_value; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_record.settlement_type = trade_cancel_correct_ca_equities_v1_value;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 4 -> trade_cancel_correct_ca_equities_v1_record.fut_settl_date[trade_cancel_correct_ca_equities_v1_at] = trade_cancel_correct_ca_equities_v1_value; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Cancel Correct Ca Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_trade_cancel_correct_ca_equities_v1(trade_cancel_correct_ca_equities_v1_record, trade_cancel_correct_ca_equities_v1_base) {
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 8 -> trade_cancel_correct_ca_equities_v1_record.transaction_time[trade_cancel_correct_ca_equities_v1_at] = (trade_cancel_correct_ca_equities_v1_base + 0 + trade_cancel_correct_ca_equities_v1_at + 1) % 256; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 16 -> trade_cancel_correct_ca_equities_v1_record.account[trade_cancel_correct_ca_equities_v1_at] = (trade_cancel_correct_ca_equities_v1_base + 8 + trade_cancel_correct_ca_equities_v1_at + 1) % 256; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 20 -> trade_cancel_correct_ca_equities_v1_record.cl_ord_id[trade_cancel_correct_ca_equities_v1_at] = (trade_cancel_correct_ca_equities_v1_base + 24 + trade_cancel_correct_ca_equities_v1_at + 1) % 256; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 8 -> trade_cancel_correct_ca_equities_v1_record.exec_id[trade_cancel_correct_ca_equities_v1_at] = (trade_cancel_correct_ca_equities_v1_base + 44 + trade_cancel_correct_ca_equities_v1_at + 1) % 256; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 8 -> trade_cancel_correct_ca_equities_v1_record.exec_ref_id[trade_cancel_correct_ca_equities_v1_at] = (trade_cancel_correct_ca_equities_v1_base + 52 + trade_cancel_correct_ca_equities_v1_at + 1) % 256; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 8 -> trade_cancel_correct_ca_equities_v1_record.last_px[trade_cancel_correct_ca_equities_v1_at] = (trade_cancel_correct_ca_equities_v1_base + 60 + trade_cancel_correct_ca_equities_v1_at + 1) % 256; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 4 -> trade_cancel_correct_ca_equities_v1_record.last_shares[trade_cancel_correct_ca_equities_v1_at] = (trade_cancel_correct_ca_equities_v1_base + 68 + trade_cancel_correct_ca_equities_v1_at + 1) % 256; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_record.side = (trade_cancel_correct_ca_equities_v1_base + 72 + 1) % 256;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 14 -> trade_cancel_correct_ca_equities_v1_record.symbol[trade_cancel_correct_ca_equities_v1_at] = (trade_cancel_correct_ca_equities_v1_base + 73 + trade_cancel_correct_ca_equities_v1_at + 1) % 256; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_record.base_liquidity_indicator = (trade_cancel_correct_ca_equities_v1_base + 87 + 1) % 256;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 4 -> trade_cancel_correct_ca_equities_v1_record.corrected_size[trade_cancel_correct_ca_equities_v1_at] = (trade_cancel_correct_ca_equities_v1_base + 88 + trade_cancel_correct_ca_equities_v1_at + 1) % 256; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 12 -> trade_cancel_correct_ca_equities_v1_record.umir_user_id[trade_cancel_correct_ca_equities_v1_at] = (trade_cancel_correct_ca_equities_v1_base + 92 + trade_cancel_correct_ca_equities_v1_at + 1) % 256; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 8 -> trade_cancel_correct_ca_equities_v1_record.corrected_price[trade_cancel_correct_ca_equities_v1_at] = (trade_cancel_correct_ca_equities_v1_base + 104 + trade_cancel_correct_ca_equities_v1_at + 1) % 256; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 2 -> trade_cancel_correct_ca_equities_v1_record.fee_code[trade_cancel_correct_ca_equities_v1_at] = (trade_cancel_correct_ca_equities_v1_base + 112 + trade_cancel_correct_ca_equities_v1_at + 1) % 256; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_record.settlement_type = (trade_cancel_correct_ca_equities_v1_base + 114 + 1) % 256;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 4 -> trade_cancel_correct_ca_equities_v1_record.fut_settl_date[trade_cancel_correct_ca_equities_v1_at] = (trade_cancel_correct_ca_equities_v1_base + 115 + trade_cancel_correct_ca_equities_v1_at + 1) % 256; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel Correct Ca Equities V 1 to the wire, 119 bytes from where the cursor stands */
inline encode_trade_cancel_correct_ca_equities_v1(trade_cancel_correct_ca_equities_v1_record) {
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 8 -> wire[at] = trade_cancel_correct_ca_equities_v1_record.transaction_time[trade_cancel_correct_ca_equities_v1_at]; at = at + 1; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 16 -> wire[at] = trade_cancel_correct_ca_equities_v1_record.account[trade_cancel_correct_ca_equities_v1_at]; at = at + 1; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 20 -> wire[at] = trade_cancel_correct_ca_equities_v1_record.cl_ord_id[trade_cancel_correct_ca_equities_v1_at]; at = at + 1; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 8 -> wire[at] = trade_cancel_correct_ca_equities_v1_record.exec_id[trade_cancel_correct_ca_equities_v1_at]; at = at + 1; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 8 -> wire[at] = trade_cancel_correct_ca_equities_v1_record.exec_ref_id[trade_cancel_correct_ca_equities_v1_at]; at = at + 1; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 8 -> wire[at] = trade_cancel_correct_ca_equities_v1_record.last_px[trade_cancel_correct_ca_equities_v1_at]; at = at + 1; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 4 -> wire[at] = trade_cancel_correct_ca_equities_v1_record.last_shares[trade_cancel_correct_ca_equities_v1_at]; at = at + 1; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_correct_ca_equities_v1_record.side; at = at + 1;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 14 -> wire[at] = trade_cancel_correct_ca_equities_v1_record.symbol[trade_cancel_correct_ca_equities_v1_at]; at = at + 1; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_correct_ca_equities_v1_record.base_liquidity_indicator; at = at + 1;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 4 -> wire[at] = trade_cancel_correct_ca_equities_v1_record.corrected_size[trade_cancel_correct_ca_equities_v1_at]; at = at + 1; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 12 -> wire[at] = trade_cancel_correct_ca_equities_v1_record.umir_user_id[trade_cancel_correct_ca_equities_v1_at]; at = at + 1; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 8 -> wire[at] = trade_cancel_correct_ca_equities_v1_record.corrected_price[trade_cancel_correct_ca_equities_v1_at]; at = at + 1; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 2 -> wire[at] = trade_cancel_correct_ca_equities_v1_record.fee_code[trade_cancel_correct_ca_equities_v1_at]; at = at + 1; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_correct_ca_equities_v1_record.settlement_type; at = at + 1;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 4 -> wire[at] = trade_cancel_correct_ca_equities_v1_record.fut_settl_date[trade_cancel_correct_ca_equities_v1_at]; at = at + 1; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel Correct Ca Equities V 1 off the wire, 119 bytes from where the cursor stands */
inline decode_trade_cancel_correct_ca_equities_v1(trade_cancel_correct_ca_equities_v1_record) {
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 8 -> trade_cancel_correct_ca_equities_v1_record.transaction_time[trade_cancel_correct_ca_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 16 -> trade_cancel_correct_ca_equities_v1_record.account[trade_cancel_correct_ca_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 20 -> trade_cancel_correct_ca_equities_v1_record.cl_ord_id[trade_cancel_correct_ca_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 8 -> trade_cancel_correct_ca_equities_v1_record.exec_id[trade_cancel_correct_ca_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 8 -> trade_cancel_correct_ca_equities_v1_record.exec_ref_id[trade_cancel_correct_ca_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 8 -> trade_cancel_correct_ca_equities_v1_record.last_px[trade_cancel_correct_ca_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 4 -> trade_cancel_correct_ca_equities_v1_record.last_shares[trade_cancel_correct_ca_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_record.side = wire[at]; at = at + 1;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 14 -> trade_cancel_correct_ca_equities_v1_record.symbol[trade_cancel_correct_ca_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_record.base_liquidity_indicator = wire[at]; at = at + 1;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 4 -> trade_cancel_correct_ca_equities_v1_record.corrected_size[trade_cancel_correct_ca_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 12 -> trade_cancel_correct_ca_equities_v1_record.umir_user_id[trade_cancel_correct_ca_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 8 -> trade_cancel_correct_ca_equities_v1_record.corrected_price[trade_cancel_correct_ca_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 2 -> trade_cancel_correct_ca_equities_v1_record.fee_code[trade_cancel_correct_ca_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_record.settlement_type = wire[at]; at = at + 1;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 4 -> trade_cancel_correct_ca_equities_v1_record.fut_settl_date[trade_cancel_correct_ca_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Cancel Correct Ca Equities V 1 is what was written, byte for byte */
inline equal_trade_cancel_correct_ca_equities_v1(trade_cancel_correct_ca_equities_v1_read, trade_cancel_correct_ca_equities_v1_written) {
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 8 -> assert(trade_cancel_correct_ca_equities_v1_read.transaction_time[trade_cancel_correct_ca_equities_v1_at] == trade_cancel_correct_ca_equities_v1_written.transaction_time[trade_cancel_correct_ca_equities_v1_at]); trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 16 -> assert(trade_cancel_correct_ca_equities_v1_read.account[trade_cancel_correct_ca_equities_v1_at] == trade_cancel_correct_ca_equities_v1_written.account[trade_cancel_correct_ca_equities_v1_at]); trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 20 -> assert(trade_cancel_correct_ca_equities_v1_read.cl_ord_id[trade_cancel_correct_ca_equities_v1_at] == trade_cancel_correct_ca_equities_v1_written.cl_ord_id[trade_cancel_correct_ca_equities_v1_at]); trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 8 -> assert(trade_cancel_correct_ca_equities_v1_read.exec_id[trade_cancel_correct_ca_equities_v1_at] == trade_cancel_correct_ca_equities_v1_written.exec_id[trade_cancel_correct_ca_equities_v1_at]); trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 8 -> assert(trade_cancel_correct_ca_equities_v1_read.exec_ref_id[trade_cancel_correct_ca_equities_v1_at] == trade_cancel_correct_ca_equities_v1_written.exec_ref_id[trade_cancel_correct_ca_equities_v1_at]); trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 8 -> assert(trade_cancel_correct_ca_equities_v1_read.last_px[trade_cancel_correct_ca_equities_v1_at] == trade_cancel_correct_ca_equities_v1_written.last_px[trade_cancel_correct_ca_equities_v1_at]); trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 4 -> assert(trade_cancel_correct_ca_equities_v1_read.last_shares[trade_cancel_correct_ca_equities_v1_at] == trade_cancel_correct_ca_equities_v1_written.last_shares[trade_cancel_correct_ca_equities_v1_at]); trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(trade_cancel_correct_ca_equities_v1_read.side == trade_cancel_correct_ca_equities_v1_written.side);
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 14 -> assert(trade_cancel_correct_ca_equities_v1_read.symbol[trade_cancel_correct_ca_equities_v1_at] == trade_cancel_correct_ca_equities_v1_written.symbol[trade_cancel_correct_ca_equities_v1_at]); trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(trade_cancel_correct_ca_equities_v1_read.base_liquidity_indicator == trade_cancel_correct_ca_equities_v1_written.base_liquidity_indicator);
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 4 -> assert(trade_cancel_correct_ca_equities_v1_read.corrected_size[trade_cancel_correct_ca_equities_v1_at] == trade_cancel_correct_ca_equities_v1_written.corrected_size[trade_cancel_correct_ca_equities_v1_at]); trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 12 -> assert(trade_cancel_correct_ca_equities_v1_read.umir_user_id[trade_cancel_correct_ca_equities_v1_at] == trade_cancel_correct_ca_equities_v1_written.umir_user_id[trade_cancel_correct_ca_equities_v1_at]); trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 8 -> assert(trade_cancel_correct_ca_equities_v1_read.corrected_price[trade_cancel_correct_ca_equities_v1_at] == trade_cancel_correct_ca_equities_v1_written.corrected_price[trade_cancel_correct_ca_equities_v1_at]); trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 2 -> assert(trade_cancel_correct_ca_equities_v1_read.fee_code[trade_cancel_correct_ca_equities_v1_at] == trade_cancel_correct_ca_equities_v1_written.fee_code[trade_cancel_correct_ca_equities_v1_at]); trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(trade_cancel_correct_ca_equities_v1_read.settlement_type == trade_cancel_correct_ca_equities_v1_written.settlement_type);
  trade_cancel_correct_ca_equities_v1_at = 0;
  do
  :: trade_cancel_correct_ca_equities_v1_at < 4 -> assert(trade_cancel_correct_ca_equities_v1_read.fut_settl_date[trade_cancel_correct_ca_equities_v1_at] == trade_cancel_correct_ca_equities_v1_written.fut_settl_date[trade_cancel_correct_ca_equities_v1_at]); trade_cancel_correct_ca_equities_v1_at = trade_cancel_correct_ca_equities_v1_at + 1
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

/* Order Acknowledgement Ca Equities V 1: encoded, read back, and compared */
proctype check_order_acknowledgement_ca_equities_v1() {
  OrderAcknowledgementCaEquitiesV1 order_acknowledgement_ca_equities_v1_sent;
  OrderAcknowledgementCaEquitiesV1 order_acknowledgement_ca_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_acknowledgement_ca_equities_v1(order_acknowledgement_ca_equities_v1_sent, 0)
  :: pattern == 1 -> fill_order_acknowledgement_ca_equities_v1(order_acknowledgement_ca_equities_v1_sent, 32)
  :: pattern == 2 -> fill_order_acknowledgement_ca_equities_v1(order_acknowledgement_ca_equities_v1_sent, 255)
  :: else -> ramp_order_acknowledgement_ca_equities_v1(order_acknowledgement_ca_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_acknowledgement_ca_equities_v1(order_acknowledgement_ca_equities_v1_sent);
    assert(at == 130);
    at = 0;
    decode_order_acknowledgement_ca_equities_v1(order_acknowledgement_ca_equities_v1_got);
    assert(at == 130);
    equal_order_acknowledgement_ca_equities_v1(order_acknowledgement_ca_equities_v1_got, order_acknowledgement_ca_equities_v1_sent)
  }
}

/* Order Rejected Ca Equities V 1: encoded, read back, and compared */
proctype check_order_rejected_ca_equities_v1() {
  OrderRejectedCaEquitiesV1 order_rejected_ca_equities_v1_sent;
  OrderRejectedCaEquitiesV1 order_rejected_ca_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_rejected_ca_equities_v1(order_rejected_ca_equities_v1_sent, 0)
  :: pattern == 1 -> fill_order_rejected_ca_equities_v1(order_rejected_ca_equities_v1_sent, 32)
  :: pattern == 2 -> fill_order_rejected_ca_equities_v1(order_rejected_ca_equities_v1_sent, 255)
  :: else -> ramp_order_rejected_ca_equities_v1(order_rejected_ca_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_rejected_ca_equities_v1(order_rejected_ca_equities_v1_sent);
    assert(at == 91);
    at = 0;
    decode_order_rejected_ca_equities_v1(order_rejected_ca_equities_v1_got);
    assert(at == 91);
    equal_order_rejected_ca_equities_v1(order_rejected_ca_equities_v1_got, order_rejected_ca_equities_v1_sent)
  }
}

/* Order Modified Ca Equities V 1: encoded, read back, and compared */
proctype check_order_modified_ca_equities_v1() {
  OrderModifiedCaEquitiesV1 order_modified_ca_equities_v1_sent;
  OrderModifiedCaEquitiesV1 order_modified_ca_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_modified_ca_equities_v1(order_modified_ca_equities_v1_sent, 0)
  :: pattern == 1 -> fill_order_modified_ca_equities_v1(order_modified_ca_equities_v1_sent, 32)
  :: pattern == 2 -> fill_order_modified_ca_equities_v1(order_modified_ca_equities_v1_sent, 255)
  :: else -> ramp_order_modified_ca_equities_v1(order_modified_ca_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_modified_ca_equities_v1(order_modified_ca_equities_v1_sent);
    assert(at == 242);
    at = 0;
    decode_order_modified_ca_equities_v1(order_modified_ca_equities_v1_got);
    assert(at == 242);
    equal_order_modified_ca_equities_v1(order_modified_ca_equities_v1_got, order_modified_ca_equities_v1_sent)
  }
}

/* Modify Rejected Ca Equities V 1: encoded, read back, and compared */
proctype check_modify_rejected_ca_equities_v1() {
  ModifyRejectedCaEquitiesV1 modify_rejected_ca_equities_v1_sent;
  ModifyRejectedCaEquitiesV1 modify_rejected_ca_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_rejected_ca_equities_v1(modify_rejected_ca_equities_v1_sent, 0)
  :: pattern == 1 -> fill_modify_rejected_ca_equities_v1(modify_rejected_ca_equities_v1_sent, 32)
  :: pattern == 2 -> fill_modify_rejected_ca_equities_v1(modify_rejected_ca_equities_v1_sent, 255)
  :: else -> ramp_modify_rejected_ca_equities_v1(modify_rejected_ca_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_rejected_ca_equities_v1(modify_rejected_ca_equities_v1_sent);
    assert(at == 111);
    at = 0;
    decode_modify_rejected_ca_equities_v1(modify_rejected_ca_equities_v1_got);
    assert(at == 111);
    equal_modify_rejected_ca_equities_v1(modify_rejected_ca_equities_v1_got, modify_rejected_ca_equities_v1_sent)
  }
}

/* Order Restated Ca Equities V 1: encoded, read back, and compared */
proctype check_order_restated_ca_equities_v1() {
  OrderRestatedCaEquitiesV1 order_restated_ca_equities_v1_sent;
  OrderRestatedCaEquitiesV1 order_restated_ca_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_restated_ca_equities_v1(order_restated_ca_equities_v1_sent, 0)
  :: pattern == 1 -> fill_order_restated_ca_equities_v1(order_restated_ca_equities_v1_sent, 32)
  :: pattern == 2 -> fill_order_restated_ca_equities_v1(order_restated_ca_equities_v1_sent, 255)
  :: else -> ramp_order_restated_ca_equities_v1(order_restated_ca_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_restated_ca_equities_v1(order_restated_ca_equities_v1_sent);
    assert(at == 80);
    at = 0;
    decode_order_restated_ca_equities_v1(order_restated_ca_equities_v1_got);
    assert(at == 80);
    equal_order_restated_ca_equities_v1(order_restated_ca_equities_v1_got, order_restated_ca_equities_v1_sent)
  }
}

/* Order Execution Ca Equities V 1: encoded, read back, and compared */
proctype check_order_execution_ca_equities_v1() {
  OrderExecutionCaEquitiesV1 order_execution_ca_equities_v1_sent;
  OrderExecutionCaEquitiesV1 order_execution_ca_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_execution_ca_equities_v1(order_execution_ca_equities_v1_sent, 0)
  :: pattern == 1 -> fill_order_execution_ca_equities_v1(order_execution_ca_equities_v1_sent, 32)
  :: pattern == 2 -> fill_order_execution_ca_equities_v1(order_execution_ca_equities_v1_sent, 255)
  :: else -> ramp_order_execution_ca_equities_v1(order_execution_ca_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_execution_ca_equities_v1(order_execution_ca_equities_v1_sent);
    assert(at == 99);
    at = 0;
    decode_order_execution_ca_equities_v1(order_execution_ca_equities_v1_got);
    assert(at == 99);
    equal_order_execution_ca_equities_v1(order_execution_ca_equities_v1_got, order_execution_ca_equities_v1_sent)
  }
}

/* Order Cancelled Ca Equities V 1: encoded, read back, and compared */
proctype check_order_cancelled_ca_equities_v1() {
  OrderCancelledCaEquitiesV1 order_cancelled_ca_equities_v1_sent;
  OrderCancelledCaEquitiesV1 order_cancelled_ca_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancelled_ca_equities_v1(order_cancelled_ca_equities_v1_sent, 0)
  :: pattern == 1 -> fill_order_cancelled_ca_equities_v1(order_cancelled_ca_equities_v1_sent, 32)
  :: pattern == 2 -> fill_order_cancelled_ca_equities_v1(order_cancelled_ca_equities_v1_sent, 255)
  :: else -> ramp_order_cancelled_ca_equities_v1(order_cancelled_ca_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancelled_ca_equities_v1(order_cancelled_ca_equities_v1_sent);
    assert(at == 31);
    at = 0;
    decode_order_cancelled_ca_equities_v1(order_cancelled_ca_equities_v1_got);
    assert(at == 31);
    equal_order_cancelled_ca_equities_v1(order_cancelled_ca_equities_v1_got, order_cancelled_ca_equities_v1_sent)
  }
}

/* Cancel Rejected Ca Equities V 1: encoded, read back, and compared */
proctype check_cancel_rejected_ca_equities_v1() {
  CancelRejectedCaEquitiesV1 cancel_rejected_ca_equities_v1_sent;
  CancelRejectedCaEquitiesV1 cancel_rejected_ca_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_rejected_ca_equities_v1(cancel_rejected_ca_equities_v1_sent, 0)
  :: pattern == 1 -> fill_cancel_rejected_ca_equities_v1(cancel_rejected_ca_equities_v1_sent, 32)
  :: pattern == 2 -> fill_cancel_rejected_ca_equities_v1(cancel_rejected_ca_equities_v1_sent, 255)
  :: else -> ramp_cancel_rejected_ca_equities_v1(cancel_rejected_ca_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_rejected_ca_equities_v1(cancel_rejected_ca_equities_v1_sent);
    assert(at == 91);
    at = 0;
    decode_cancel_rejected_ca_equities_v1(cancel_rejected_ca_equities_v1_got);
    assert(at == 91);
    equal_cancel_rejected_ca_equities_v1(cancel_rejected_ca_equities_v1_got, cancel_rejected_ca_equities_v1_sent)
  }
}

/* Carried Restatement Ca Equities V 1: encoded, read back, and compared */
proctype check_carried_restatement_ca_equities_v1() {
  CarriedRestatementCaEquitiesV1 carried_restatement_ca_equities_v1_sent;
  CarriedRestatementCaEquitiesV1 carried_restatement_ca_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_carried_restatement_ca_equities_v1(carried_restatement_ca_equities_v1_sent, 0)
  :: pattern == 1 -> fill_carried_restatement_ca_equities_v1(carried_restatement_ca_equities_v1_sent, 32)
  :: pattern == 2 -> fill_carried_restatement_ca_equities_v1(carried_restatement_ca_equities_v1_sent, 255)
  :: else -> ramp_carried_restatement_ca_equities_v1(carried_restatement_ca_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_carried_restatement_ca_equities_v1(carried_restatement_ca_equities_v1_sent);
    assert(at == 262);
    at = 0;
    decode_carried_restatement_ca_equities_v1(carried_restatement_ca_equities_v1_got);
    assert(at == 262);
    equal_carried_restatement_ca_equities_v1(carried_restatement_ca_equities_v1_got, carried_restatement_ca_equities_v1_sent)
  }
}

/* Done For Day Ca Equities V 1: encoded, read back, and compared */
proctype check_done_for_day_ca_equities_v1() {
  DoneForDayCaEquitiesV1 done_for_day_ca_equities_v1_sent;
  DoneForDayCaEquitiesV1 done_for_day_ca_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_done_for_day_ca_equities_v1(done_for_day_ca_equities_v1_sent, 0)
  :: pattern == 1 -> fill_done_for_day_ca_equities_v1(done_for_day_ca_equities_v1_sent, 32)
  :: pattern == 2 -> fill_done_for_day_ca_equities_v1(done_for_day_ca_equities_v1_sent, 255)
  :: else -> ramp_done_for_day_ca_equities_v1(done_for_day_ca_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_done_for_day_ca_equities_v1(done_for_day_ca_equities_v1_sent);
    assert(at == 38);
    at = 0;
    decode_done_for_day_ca_equities_v1(done_for_day_ca_equities_v1_got);
    assert(at == 38);
    equal_done_for_day_ca_equities_v1(done_for_day_ca_equities_v1_got, done_for_day_ca_equities_v1_sent)
  }
}

/* Trade Cancel Correct Ca Equities V 1: encoded, read back, and compared */
proctype check_trade_cancel_correct_ca_equities_v1() {
  TradeCancelCorrectCaEquitiesV1 trade_cancel_correct_ca_equities_v1_sent;
  TradeCancelCorrectCaEquitiesV1 trade_cancel_correct_ca_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancel_correct_ca_equities_v1(trade_cancel_correct_ca_equities_v1_sent, 0)
  :: pattern == 1 -> fill_trade_cancel_correct_ca_equities_v1(trade_cancel_correct_ca_equities_v1_sent, 32)
  :: pattern == 2 -> fill_trade_cancel_correct_ca_equities_v1(trade_cancel_correct_ca_equities_v1_sent, 255)
  :: else -> ramp_trade_cancel_correct_ca_equities_v1(trade_cancel_correct_ca_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancel_correct_ca_equities_v1(trade_cancel_correct_ca_equities_v1_sent);
    assert(at == 119);
    at = 0;
    decode_trade_cancel_correct_ca_equities_v1(trade_cancel_correct_ca_equities_v1_got);
    assert(at == 119);
    equal_trade_cancel_correct_ca_equities_v1(trade_cancel_correct_ca_equities_v1_got, trade_cancel_correct_ca_equities_v1_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_exchange_message_header()
  :: run check_logout_response_message()
  :: run check_order_acknowledgement_ca_equities_v1()
  :: run check_order_rejected_ca_equities_v1()
  :: run check_order_modified_ca_equities_v1()
  :: run check_modify_rejected_ca_equities_v1()
  :: run check_order_restated_ca_equities_v1()
  :: run check_order_execution_ca_equities_v1()
  :: run check_order_cancelled_ca_equities_v1()
  :: run check_cancel_rejected_ca_equities_v1()
  :: run check_carried_restatement_ca_equities_v1()
  :: run check_done_for_day_ca_equities_v1()
  :: run check_trade_cancel_correct_ca_equities_v1()
  fi
}
