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
#define WIRE 125

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

/* ---- Order Acknowledgement Us Equities V 1: 82 bytes ------------------------- */

/* Order Acknowledgment messages are sent in response to New Order messages */
typedef OrderAcknowledgementUsEquitiesV1 {
  byte in_flight[2];
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte order_id[8];
  byte side;
  byte price[8];
  byte ord_type;
  byte symbol[8];
  byte clearing_firm[4];
  byte leaves_qty[4];
  byte display_price[8];
  byte working_price[8];
  byte base_liquidity_indicator;
  byte sub_liquidity_indicator
};

int order_acknowledgement_us_equities_v1_at;

/* every byte of Order Acknowledgement Us Equities V 1 set to one value */
inline fill_order_acknowledgement_us_equities_v1(order_acknowledgement_us_equities_v1_record, order_acknowledgement_us_equities_v1_value) {
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 2 -> order_acknowledgement_us_equities_v1_record.in_flight[order_acknowledgement_us_equities_v1_at] = order_acknowledgement_us_equities_v1_value; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> order_acknowledgement_us_equities_v1_record.transaction_time[order_acknowledgement_us_equities_v1_at] = order_acknowledgement_us_equities_v1_value; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 20 -> order_acknowledgement_us_equities_v1_record.cl_ord_id[order_acknowledgement_us_equities_v1_at] = order_acknowledgement_us_equities_v1_value; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> order_acknowledgement_us_equities_v1_record.order_id[order_acknowledgement_us_equities_v1_at] = order_acknowledgement_us_equities_v1_value; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_record.side = order_acknowledgement_us_equities_v1_value;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> order_acknowledgement_us_equities_v1_record.price[order_acknowledgement_us_equities_v1_at] = order_acknowledgement_us_equities_v1_value; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_record.ord_type = order_acknowledgement_us_equities_v1_value;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> order_acknowledgement_us_equities_v1_record.symbol[order_acknowledgement_us_equities_v1_at] = order_acknowledgement_us_equities_v1_value; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 4 -> order_acknowledgement_us_equities_v1_record.clearing_firm[order_acknowledgement_us_equities_v1_at] = order_acknowledgement_us_equities_v1_value; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 4 -> order_acknowledgement_us_equities_v1_record.leaves_qty[order_acknowledgement_us_equities_v1_at] = order_acknowledgement_us_equities_v1_value; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> order_acknowledgement_us_equities_v1_record.display_price[order_acknowledgement_us_equities_v1_at] = order_acknowledgement_us_equities_v1_value; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> order_acknowledgement_us_equities_v1_record.working_price[order_acknowledgement_us_equities_v1_at] = order_acknowledgement_us_equities_v1_value; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_record.base_liquidity_indicator = order_acknowledgement_us_equities_v1_value;
  order_acknowledgement_us_equities_v1_record.sub_liquidity_indicator = order_acknowledgement_us_equities_v1_value;
  skip
}

/* each byte of Order Acknowledgement Us Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_order_acknowledgement_us_equities_v1(order_acknowledgement_us_equities_v1_record, order_acknowledgement_us_equities_v1_base) {
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 2 -> order_acknowledgement_us_equities_v1_record.in_flight[order_acknowledgement_us_equities_v1_at] = (order_acknowledgement_us_equities_v1_base + 0 + order_acknowledgement_us_equities_v1_at + 1) % 256; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> order_acknowledgement_us_equities_v1_record.transaction_time[order_acknowledgement_us_equities_v1_at] = (order_acknowledgement_us_equities_v1_base + 2 + order_acknowledgement_us_equities_v1_at + 1) % 256; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 20 -> order_acknowledgement_us_equities_v1_record.cl_ord_id[order_acknowledgement_us_equities_v1_at] = (order_acknowledgement_us_equities_v1_base + 10 + order_acknowledgement_us_equities_v1_at + 1) % 256; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> order_acknowledgement_us_equities_v1_record.order_id[order_acknowledgement_us_equities_v1_at] = (order_acknowledgement_us_equities_v1_base + 30 + order_acknowledgement_us_equities_v1_at + 1) % 256; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_record.side = (order_acknowledgement_us_equities_v1_base + 38 + 1) % 256;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> order_acknowledgement_us_equities_v1_record.price[order_acknowledgement_us_equities_v1_at] = (order_acknowledgement_us_equities_v1_base + 39 + order_acknowledgement_us_equities_v1_at + 1) % 256; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_record.ord_type = (order_acknowledgement_us_equities_v1_base + 47 + 1) % 256;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> order_acknowledgement_us_equities_v1_record.symbol[order_acknowledgement_us_equities_v1_at] = (order_acknowledgement_us_equities_v1_base + 48 + order_acknowledgement_us_equities_v1_at + 1) % 256; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 4 -> order_acknowledgement_us_equities_v1_record.clearing_firm[order_acknowledgement_us_equities_v1_at] = (order_acknowledgement_us_equities_v1_base + 56 + order_acknowledgement_us_equities_v1_at + 1) % 256; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 4 -> order_acknowledgement_us_equities_v1_record.leaves_qty[order_acknowledgement_us_equities_v1_at] = (order_acknowledgement_us_equities_v1_base + 60 + order_acknowledgement_us_equities_v1_at + 1) % 256; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> order_acknowledgement_us_equities_v1_record.display_price[order_acknowledgement_us_equities_v1_at] = (order_acknowledgement_us_equities_v1_base + 64 + order_acknowledgement_us_equities_v1_at + 1) % 256; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> order_acknowledgement_us_equities_v1_record.working_price[order_acknowledgement_us_equities_v1_at] = (order_acknowledgement_us_equities_v1_base + 72 + order_acknowledgement_us_equities_v1_at + 1) % 256; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_record.base_liquidity_indicator = (order_acknowledgement_us_equities_v1_base + 80 + 1) % 256;
  order_acknowledgement_us_equities_v1_record.sub_liquidity_indicator = (order_acknowledgement_us_equities_v1_base + 81 + 1) % 256;
  skip
}

/* Order Acknowledgement Us Equities V 1 to the wire, 82 bytes from where the cursor stands */
inline encode_order_acknowledgement_us_equities_v1(order_acknowledgement_us_equities_v1_record) {
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 2 -> wire[at] = order_acknowledgement_us_equities_v1_record.in_flight[order_acknowledgement_us_equities_v1_at]; at = at + 1; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> wire[at] = order_acknowledgement_us_equities_v1_record.transaction_time[order_acknowledgement_us_equities_v1_at]; at = at + 1; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 20 -> wire[at] = order_acknowledgement_us_equities_v1_record.cl_ord_id[order_acknowledgement_us_equities_v1_at]; at = at + 1; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> wire[at] = order_acknowledgement_us_equities_v1_record.order_id[order_acknowledgement_us_equities_v1_at]; at = at + 1; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_us_equities_v1_record.side; at = at + 1;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> wire[at] = order_acknowledgement_us_equities_v1_record.price[order_acknowledgement_us_equities_v1_at]; at = at + 1; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_us_equities_v1_record.ord_type; at = at + 1;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> wire[at] = order_acknowledgement_us_equities_v1_record.symbol[order_acknowledgement_us_equities_v1_at]; at = at + 1; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 4 -> wire[at] = order_acknowledgement_us_equities_v1_record.clearing_firm[order_acknowledgement_us_equities_v1_at]; at = at + 1; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 4 -> wire[at] = order_acknowledgement_us_equities_v1_record.leaves_qty[order_acknowledgement_us_equities_v1_at]; at = at + 1; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> wire[at] = order_acknowledgement_us_equities_v1_record.display_price[order_acknowledgement_us_equities_v1_at]; at = at + 1; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> wire[at] = order_acknowledgement_us_equities_v1_record.working_price[order_acknowledgement_us_equities_v1_at]; at = at + 1; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_us_equities_v1_record.base_liquidity_indicator; at = at + 1;
  wire[at] = order_acknowledgement_us_equities_v1_record.sub_liquidity_indicator; at = at + 1;
  skip
}

/* Order Acknowledgement Us Equities V 1 off the wire, 82 bytes from where the cursor stands */
inline decode_order_acknowledgement_us_equities_v1(order_acknowledgement_us_equities_v1_record) {
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 2 -> order_acknowledgement_us_equities_v1_record.in_flight[order_acknowledgement_us_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> order_acknowledgement_us_equities_v1_record.transaction_time[order_acknowledgement_us_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 20 -> order_acknowledgement_us_equities_v1_record.cl_ord_id[order_acknowledgement_us_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> order_acknowledgement_us_equities_v1_record.order_id[order_acknowledgement_us_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_record.side = wire[at]; at = at + 1;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> order_acknowledgement_us_equities_v1_record.price[order_acknowledgement_us_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_record.ord_type = wire[at]; at = at + 1;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> order_acknowledgement_us_equities_v1_record.symbol[order_acknowledgement_us_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 4 -> order_acknowledgement_us_equities_v1_record.clearing_firm[order_acknowledgement_us_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 4 -> order_acknowledgement_us_equities_v1_record.leaves_qty[order_acknowledgement_us_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> order_acknowledgement_us_equities_v1_record.display_price[order_acknowledgement_us_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> order_acknowledgement_us_equities_v1_record.working_price[order_acknowledgement_us_equities_v1_at] = wire[at]; at = at + 1; order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_record.base_liquidity_indicator = wire[at]; at = at + 1;
  order_acknowledgement_us_equities_v1_record.sub_liquidity_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Acknowledgement Us Equities V 1 is what was written, byte for byte */
inline equal_order_acknowledgement_us_equities_v1(order_acknowledgement_us_equities_v1_read, order_acknowledgement_us_equities_v1_written) {
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 2 -> assert(order_acknowledgement_us_equities_v1_read.in_flight[order_acknowledgement_us_equities_v1_at] == order_acknowledgement_us_equities_v1_written.in_flight[order_acknowledgement_us_equities_v1_at]); order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> assert(order_acknowledgement_us_equities_v1_read.transaction_time[order_acknowledgement_us_equities_v1_at] == order_acknowledgement_us_equities_v1_written.transaction_time[order_acknowledgement_us_equities_v1_at]); order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 20 -> assert(order_acknowledgement_us_equities_v1_read.cl_ord_id[order_acknowledgement_us_equities_v1_at] == order_acknowledgement_us_equities_v1_written.cl_ord_id[order_acknowledgement_us_equities_v1_at]); order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> assert(order_acknowledgement_us_equities_v1_read.order_id[order_acknowledgement_us_equities_v1_at] == order_acknowledgement_us_equities_v1_written.order_id[order_acknowledgement_us_equities_v1_at]); order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_us_equities_v1_read.side == order_acknowledgement_us_equities_v1_written.side);
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> assert(order_acknowledgement_us_equities_v1_read.price[order_acknowledgement_us_equities_v1_at] == order_acknowledgement_us_equities_v1_written.price[order_acknowledgement_us_equities_v1_at]); order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_us_equities_v1_read.ord_type == order_acknowledgement_us_equities_v1_written.ord_type);
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> assert(order_acknowledgement_us_equities_v1_read.symbol[order_acknowledgement_us_equities_v1_at] == order_acknowledgement_us_equities_v1_written.symbol[order_acknowledgement_us_equities_v1_at]); order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 4 -> assert(order_acknowledgement_us_equities_v1_read.clearing_firm[order_acknowledgement_us_equities_v1_at] == order_acknowledgement_us_equities_v1_written.clearing_firm[order_acknowledgement_us_equities_v1_at]); order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 4 -> assert(order_acknowledgement_us_equities_v1_read.leaves_qty[order_acknowledgement_us_equities_v1_at] == order_acknowledgement_us_equities_v1_written.leaves_qty[order_acknowledgement_us_equities_v1_at]); order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> assert(order_acknowledgement_us_equities_v1_read.display_price[order_acknowledgement_us_equities_v1_at] == order_acknowledgement_us_equities_v1_written.display_price[order_acknowledgement_us_equities_v1_at]); order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  order_acknowledgement_us_equities_v1_at = 0;
  do
  :: order_acknowledgement_us_equities_v1_at < 8 -> assert(order_acknowledgement_us_equities_v1_read.working_price[order_acknowledgement_us_equities_v1_at] == order_acknowledgement_us_equities_v1_written.working_price[order_acknowledgement_us_equities_v1_at]); order_acknowledgement_us_equities_v1_at = order_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_us_equities_v1_read.base_liquidity_indicator == order_acknowledgement_us_equities_v1_written.base_liquidity_indicator);
  assert(order_acknowledgement_us_equities_v1_read.sub_liquidity_indicator == order_acknowledgement_us_equities_v1_written.sub_liquidity_indicator);
  skip
}

/* ---- Order Rejected Us Equities V 1: 95 bytes -------------------------------- */

/* Order Rejected messages are sent in response to a New Order message which must be rejected */
typedef OrderRejectedUsEquitiesV1 {
  byte in_flight[2];
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte clearing_firm[4];
  byte order_reject_reason;
  byte text[60]
};

int order_rejected_us_equities_v1_at;

/* every byte of Order Rejected Us Equities V 1 set to one value */
inline fill_order_rejected_us_equities_v1(order_rejected_us_equities_v1_record, order_rejected_us_equities_v1_value) {
  order_rejected_us_equities_v1_at = 0;
  do
  :: order_rejected_us_equities_v1_at < 2 -> order_rejected_us_equities_v1_record.in_flight[order_rejected_us_equities_v1_at] = order_rejected_us_equities_v1_value; order_rejected_us_equities_v1_at = order_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_us_equities_v1_at = 0;
  do
  :: order_rejected_us_equities_v1_at < 8 -> order_rejected_us_equities_v1_record.transaction_time[order_rejected_us_equities_v1_at] = order_rejected_us_equities_v1_value; order_rejected_us_equities_v1_at = order_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_us_equities_v1_at = 0;
  do
  :: order_rejected_us_equities_v1_at < 20 -> order_rejected_us_equities_v1_record.cl_ord_id[order_rejected_us_equities_v1_at] = order_rejected_us_equities_v1_value; order_rejected_us_equities_v1_at = order_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_us_equities_v1_at = 0;
  do
  :: order_rejected_us_equities_v1_at < 4 -> order_rejected_us_equities_v1_record.clearing_firm[order_rejected_us_equities_v1_at] = order_rejected_us_equities_v1_value; order_rejected_us_equities_v1_at = order_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_us_equities_v1_record.order_reject_reason = order_rejected_us_equities_v1_value;
  order_rejected_us_equities_v1_at = 0;
  do
  :: order_rejected_us_equities_v1_at < 60 -> order_rejected_us_equities_v1_record.text[order_rejected_us_equities_v1_at] = order_rejected_us_equities_v1_value; order_rejected_us_equities_v1_at = order_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Rejected Us Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_order_rejected_us_equities_v1(order_rejected_us_equities_v1_record, order_rejected_us_equities_v1_base) {
  order_rejected_us_equities_v1_at = 0;
  do
  :: order_rejected_us_equities_v1_at < 2 -> order_rejected_us_equities_v1_record.in_flight[order_rejected_us_equities_v1_at] = (order_rejected_us_equities_v1_base + 0 + order_rejected_us_equities_v1_at + 1) % 256; order_rejected_us_equities_v1_at = order_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_us_equities_v1_at = 0;
  do
  :: order_rejected_us_equities_v1_at < 8 -> order_rejected_us_equities_v1_record.transaction_time[order_rejected_us_equities_v1_at] = (order_rejected_us_equities_v1_base + 2 + order_rejected_us_equities_v1_at + 1) % 256; order_rejected_us_equities_v1_at = order_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_us_equities_v1_at = 0;
  do
  :: order_rejected_us_equities_v1_at < 20 -> order_rejected_us_equities_v1_record.cl_ord_id[order_rejected_us_equities_v1_at] = (order_rejected_us_equities_v1_base + 10 + order_rejected_us_equities_v1_at + 1) % 256; order_rejected_us_equities_v1_at = order_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_us_equities_v1_at = 0;
  do
  :: order_rejected_us_equities_v1_at < 4 -> order_rejected_us_equities_v1_record.clearing_firm[order_rejected_us_equities_v1_at] = (order_rejected_us_equities_v1_base + 30 + order_rejected_us_equities_v1_at + 1) % 256; order_rejected_us_equities_v1_at = order_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_us_equities_v1_record.order_reject_reason = (order_rejected_us_equities_v1_base + 34 + 1) % 256;
  order_rejected_us_equities_v1_at = 0;
  do
  :: order_rejected_us_equities_v1_at < 60 -> order_rejected_us_equities_v1_record.text[order_rejected_us_equities_v1_at] = (order_rejected_us_equities_v1_base + 35 + order_rejected_us_equities_v1_at + 1) % 256; order_rejected_us_equities_v1_at = order_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Order Rejected Us Equities V 1 to the wire, 95 bytes from where the cursor stands */
inline encode_order_rejected_us_equities_v1(order_rejected_us_equities_v1_record) {
  order_rejected_us_equities_v1_at = 0;
  do
  :: order_rejected_us_equities_v1_at < 2 -> wire[at] = order_rejected_us_equities_v1_record.in_flight[order_rejected_us_equities_v1_at]; at = at + 1; order_rejected_us_equities_v1_at = order_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_us_equities_v1_at = 0;
  do
  :: order_rejected_us_equities_v1_at < 8 -> wire[at] = order_rejected_us_equities_v1_record.transaction_time[order_rejected_us_equities_v1_at]; at = at + 1; order_rejected_us_equities_v1_at = order_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_us_equities_v1_at = 0;
  do
  :: order_rejected_us_equities_v1_at < 20 -> wire[at] = order_rejected_us_equities_v1_record.cl_ord_id[order_rejected_us_equities_v1_at]; at = at + 1; order_rejected_us_equities_v1_at = order_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_us_equities_v1_at = 0;
  do
  :: order_rejected_us_equities_v1_at < 4 -> wire[at] = order_rejected_us_equities_v1_record.clearing_firm[order_rejected_us_equities_v1_at]; at = at + 1; order_rejected_us_equities_v1_at = order_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_rejected_us_equities_v1_record.order_reject_reason; at = at + 1;
  order_rejected_us_equities_v1_at = 0;
  do
  :: order_rejected_us_equities_v1_at < 60 -> wire[at] = order_rejected_us_equities_v1_record.text[order_rejected_us_equities_v1_at]; at = at + 1; order_rejected_us_equities_v1_at = order_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Order Rejected Us Equities V 1 off the wire, 95 bytes from where the cursor stands */
inline decode_order_rejected_us_equities_v1(order_rejected_us_equities_v1_record) {
  order_rejected_us_equities_v1_at = 0;
  do
  :: order_rejected_us_equities_v1_at < 2 -> order_rejected_us_equities_v1_record.in_flight[order_rejected_us_equities_v1_at] = wire[at]; at = at + 1; order_rejected_us_equities_v1_at = order_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_us_equities_v1_at = 0;
  do
  :: order_rejected_us_equities_v1_at < 8 -> order_rejected_us_equities_v1_record.transaction_time[order_rejected_us_equities_v1_at] = wire[at]; at = at + 1; order_rejected_us_equities_v1_at = order_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_us_equities_v1_at = 0;
  do
  :: order_rejected_us_equities_v1_at < 20 -> order_rejected_us_equities_v1_record.cl_ord_id[order_rejected_us_equities_v1_at] = wire[at]; at = at + 1; order_rejected_us_equities_v1_at = order_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_us_equities_v1_at = 0;
  do
  :: order_rejected_us_equities_v1_at < 4 -> order_rejected_us_equities_v1_record.clearing_firm[order_rejected_us_equities_v1_at] = wire[at]; at = at + 1; order_rejected_us_equities_v1_at = order_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_us_equities_v1_record.order_reject_reason = wire[at]; at = at + 1;
  order_rejected_us_equities_v1_at = 0;
  do
  :: order_rejected_us_equities_v1_at < 60 -> order_rejected_us_equities_v1_record.text[order_rejected_us_equities_v1_at] = wire[at]; at = at + 1; order_rejected_us_equities_v1_at = order_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Rejected Us Equities V 1 is what was written, byte for byte */
inline equal_order_rejected_us_equities_v1(order_rejected_us_equities_v1_read, order_rejected_us_equities_v1_written) {
  order_rejected_us_equities_v1_at = 0;
  do
  :: order_rejected_us_equities_v1_at < 2 -> assert(order_rejected_us_equities_v1_read.in_flight[order_rejected_us_equities_v1_at] == order_rejected_us_equities_v1_written.in_flight[order_rejected_us_equities_v1_at]); order_rejected_us_equities_v1_at = order_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_us_equities_v1_at = 0;
  do
  :: order_rejected_us_equities_v1_at < 8 -> assert(order_rejected_us_equities_v1_read.transaction_time[order_rejected_us_equities_v1_at] == order_rejected_us_equities_v1_written.transaction_time[order_rejected_us_equities_v1_at]); order_rejected_us_equities_v1_at = order_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_us_equities_v1_at = 0;
  do
  :: order_rejected_us_equities_v1_at < 20 -> assert(order_rejected_us_equities_v1_read.cl_ord_id[order_rejected_us_equities_v1_at] == order_rejected_us_equities_v1_written.cl_ord_id[order_rejected_us_equities_v1_at]); order_rejected_us_equities_v1_at = order_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  order_rejected_us_equities_v1_at = 0;
  do
  :: order_rejected_us_equities_v1_at < 4 -> assert(order_rejected_us_equities_v1_read.clearing_firm[order_rejected_us_equities_v1_at] == order_rejected_us_equities_v1_written.clearing_firm[order_rejected_us_equities_v1_at]); order_rejected_us_equities_v1_at = order_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_rejected_us_equities_v1_read.order_reject_reason == order_rejected_us_equities_v1_written.order_reject_reason);
  order_rejected_us_equities_v1_at = 0;
  do
  :: order_rejected_us_equities_v1_at < 60 -> assert(order_rejected_us_equities_v1_read.text[order_rejected_us_equities_v1_at] == order_rejected_us_equities_v1_written.text[order_rejected_us_equities_v1_at]); order_rejected_us_equities_v1_at = order_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Modified Us Equities V 1: 125 bytes ------------------------------- */

/* Order Modified messages are sent in response to a Modify Request message to indicate that the order has been successfully modified */
typedef OrderModifiedUsEquitiesV1 {
  byte in_flight[2];
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte orig_cl_ord_id[20];
  byte order_id[8];
  byte clearing_firm[4];
  byte symbol[8];
  byte side;
  byte price[8];
  byte ord_type;
  byte max_floor[4];
  byte order_qty[4];
  byte stop_px[8];
  byte leaves_qty[4];
  byte display_price[8];
  byte working_price[8];
  byte base_liquidity_indicator;
  byte secondary_order_id[8]
};

int order_modified_us_equities_v1_at;

/* every byte of Order Modified Us Equities V 1 set to one value */
inline fill_order_modified_us_equities_v1(order_modified_us_equities_v1_record, order_modified_us_equities_v1_value) {
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 2 -> order_modified_us_equities_v1_record.in_flight[order_modified_us_equities_v1_at] = order_modified_us_equities_v1_value; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> order_modified_us_equities_v1_record.transaction_time[order_modified_us_equities_v1_at] = order_modified_us_equities_v1_value; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 20 -> order_modified_us_equities_v1_record.cl_ord_id[order_modified_us_equities_v1_at] = order_modified_us_equities_v1_value; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 20 -> order_modified_us_equities_v1_record.orig_cl_ord_id[order_modified_us_equities_v1_at] = order_modified_us_equities_v1_value; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> order_modified_us_equities_v1_record.order_id[order_modified_us_equities_v1_at] = order_modified_us_equities_v1_value; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 4 -> order_modified_us_equities_v1_record.clearing_firm[order_modified_us_equities_v1_at] = order_modified_us_equities_v1_value; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> order_modified_us_equities_v1_record.symbol[order_modified_us_equities_v1_at] = order_modified_us_equities_v1_value; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_record.side = order_modified_us_equities_v1_value;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> order_modified_us_equities_v1_record.price[order_modified_us_equities_v1_at] = order_modified_us_equities_v1_value; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_record.ord_type = order_modified_us_equities_v1_value;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 4 -> order_modified_us_equities_v1_record.max_floor[order_modified_us_equities_v1_at] = order_modified_us_equities_v1_value; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 4 -> order_modified_us_equities_v1_record.order_qty[order_modified_us_equities_v1_at] = order_modified_us_equities_v1_value; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> order_modified_us_equities_v1_record.stop_px[order_modified_us_equities_v1_at] = order_modified_us_equities_v1_value; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 4 -> order_modified_us_equities_v1_record.leaves_qty[order_modified_us_equities_v1_at] = order_modified_us_equities_v1_value; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> order_modified_us_equities_v1_record.display_price[order_modified_us_equities_v1_at] = order_modified_us_equities_v1_value; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> order_modified_us_equities_v1_record.working_price[order_modified_us_equities_v1_at] = order_modified_us_equities_v1_value; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_record.base_liquidity_indicator = order_modified_us_equities_v1_value;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> order_modified_us_equities_v1_record.secondary_order_id[order_modified_us_equities_v1_at] = order_modified_us_equities_v1_value; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Modified Us Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_order_modified_us_equities_v1(order_modified_us_equities_v1_record, order_modified_us_equities_v1_base) {
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 2 -> order_modified_us_equities_v1_record.in_flight[order_modified_us_equities_v1_at] = (order_modified_us_equities_v1_base + 0 + order_modified_us_equities_v1_at + 1) % 256; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> order_modified_us_equities_v1_record.transaction_time[order_modified_us_equities_v1_at] = (order_modified_us_equities_v1_base + 2 + order_modified_us_equities_v1_at + 1) % 256; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 20 -> order_modified_us_equities_v1_record.cl_ord_id[order_modified_us_equities_v1_at] = (order_modified_us_equities_v1_base + 10 + order_modified_us_equities_v1_at + 1) % 256; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 20 -> order_modified_us_equities_v1_record.orig_cl_ord_id[order_modified_us_equities_v1_at] = (order_modified_us_equities_v1_base + 30 + order_modified_us_equities_v1_at + 1) % 256; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> order_modified_us_equities_v1_record.order_id[order_modified_us_equities_v1_at] = (order_modified_us_equities_v1_base + 50 + order_modified_us_equities_v1_at + 1) % 256; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 4 -> order_modified_us_equities_v1_record.clearing_firm[order_modified_us_equities_v1_at] = (order_modified_us_equities_v1_base + 58 + order_modified_us_equities_v1_at + 1) % 256; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> order_modified_us_equities_v1_record.symbol[order_modified_us_equities_v1_at] = (order_modified_us_equities_v1_base + 62 + order_modified_us_equities_v1_at + 1) % 256; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_record.side = (order_modified_us_equities_v1_base + 70 + 1) % 256;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> order_modified_us_equities_v1_record.price[order_modified_us_equities_v1_at] = (order_modified_us_equities_v1_base + 71 + order_modified_us_equities_v1_at + 1) % 256; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_record.ord_type = (order_modified_us_equities_v1_base + 79 + 1) % 256;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 4 -> order_modified_us_equities_v1_record.max_floor[order_modified_us_equities_v1_at] = (order_modified_us_equities_v1_base + 80 + order_modified_us_equities_v1_at + 1) % 256; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 4 -> order_modified_us_equities_v1_record.order_qty[order_modified_us_equities_v1_at] = (order_modified_us_equities_v1_base + 84 + order_modified_us_equities_v1_at + 1) % 256; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> order_modified_us_equities_v1_record.stop_px[order_modified_us_equities_v1_at] = (order_modified_us_equities_v1_base + 88 + order_modified_us_equities_v1_at + 1) % 256; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 4 -> order_modified_us_equities_v1_record.leaves_qty[order_modified_us_equities_v1_at] = (order_modified_us_equities_v1_base + 96 + order_modified_us_equities_v1_at + 1) % 256; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> order_modified_us_equities_v1_record.display_price[order_modified_us_equities_v1_at] = (order_modified_us_equities_v1_base + 100 + order_modified_us_equities_v1_at + 1) % 256; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> order_modified_us_equities_v1_record.working_price[order_modified_us_equities_v1_at] = (order_modified_us_equities_v1_base + 108 + order_modified_us_equities_v1_at + 1) % 256; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_record.base_liquidity_indicator = (order_modified_us_equities_v1_base + 116 + 1) % 256;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> order_modified_us_equities_v1_record.secondary_order_id[order_modified_us_equities_v1_at] = (order_modified_us_equities_v1_base + 117 + order_modified_us_equities_v1_at + 1) % 256; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modified Us Equities V 1 to the wire, 125 bytes from where the cursor stands */
inline encode_order_modified_us_equities_v1(order_modified_us_equities_v1_record) {
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 2 -> wire[at] = order_modified_us_equities_v1_record.in_flight[order_modified_us_equities_v1_at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> wire[at] = order_modified_us_equities_v1_record.transaction_time[order_modified_us_equities_v1_at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 20 -> wire[at] = order_modified_us_equities_v1_record.cl_ord_id[order_modified_us_equities_v1_at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 20 -> wire[at] = order_modified_us_equities_v1_record.orig_cl_ord_id[order_modified_us_equities_v1_at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> wire[at] = order_modified_us_equities_v1_record.order_id[order_modified_us_equities_v1_at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 4 -> wire[at] = order_modified_us_equities_v1_record.clearing_firm[order_modified_us_equities_v1_at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> wire[at] = order_modified_us_equities_v1_record.symbol[order_modified_us_equities_v1_at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_modified_us_equities_v1_record.side; at = at + 1;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> wire[at] = order_modified_us_equities_v1_record.price[order_modified_us_equities_v1_at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_modified_us_equities_v1_record.ord_type; at = at + 1;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 4 -> wire[at] = order_modified_us_equities_v1_record.max_floor[order_modified_us_equities_v1_at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 4 -> wire[at] = order_modified_us_equities_v1_record.order_qty[order_modified_us_equities_v1_at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> wire[at] = order_modified_us_equities_v1_record.stop_px[order_modified_us_equities_v1_at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 4 -> wire[at] = order_modified_us_equities_v1_record.leaves_qty[order_modified_us_equities_v1_at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> wire[at] = order_modified_us_equities_v1_record.display_price[order_modified_us_equities_v1_at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> wire[at] = order_modified_us_equities_v1_record.working_price[order_modified_us_equities_v1_at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_modified_us_equities_v1_record.base_liquidity_indicator; at = at + 1;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> wire[at] = order_modified_us_equities_v1_record.secondary_order_id[order_modified_us_equities_v1_at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modified Us Equities V 1 off the wire, 125 bytes from where the cursor stands */
inline decode_order_modified_us_equities_v1(order_modified_us_equities_v1_record) {
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 2 -> order_modified_us_equities_v1_record.in_flight[order_modified_us_equities_v1_at] = wire[at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> order_modified_us_equities_v1_record.transaction_time[order_modified_us_equities_v1_at] = wire[at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 20 -> order_modified_us_equities_v1_record.cl_ord_id[order_modified_us_equities_v1_at] = wire[at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 20 -> order_modified_us_equities_v1_record.orig_cl_ord_id[order_modified_us_equities_v1_at] = wire[at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> order_modified_us_equities_v1_record.order_id[order_modified_us_equities_v1_at] = wire[at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 4 -> order_modified_us_equities_v1_record.clearing_firm[order_modified_us_equities_v1_at] = wire[at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> order_modified_us_equities_v1_record.symbol[order_modified_us_equities_v1_at] = wire[at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_record.side = wire[at]; at = at + 1;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> order_modified_us_equities_v1_record.price[order_modified_us_equities_v1_at] = wire[at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_record.ord_type = wire[at]; at = at + 1;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 4 -> order_modified_us_equities_v1_record.max_floor[order_modified_us_equities_v1_at] = wire[at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 4 -> order_modified_us_equities_v1_record.order_qty[order_modified_us_equities_v1_at] = wire[at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> order_modified_us_equities_v1_record.stop_px[order_modified_us_equities_v1_at] = wire[at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 4 -> order_modified_us_equities_v1_record.leaves_qty[order_modified_us_equities_v1_at] = wire[at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> order_modified_us_equities_v1_record.display_price[order_modified_us_equities_v1_at] = wire[at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> order_modified_us_equities_v1_record.working_price[order_modified_us_equities_v1_at] = wire[at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_record.base_liquidity_indicator = wire[at]; at = at + 1;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> order_modified_us_equities_v1_record.secondary_order_id[order_modified_us_equities_v1_at] = wire[at]; at = at + 1; order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Modified Us Equities V 1 is what was written, byte for byte */
inline equal_order_modified_us_equities_v1(order_modified_us_equities_v1_read, order_modified_us_equities_v1_written) {
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 2 -> assert(order_modified_us_equities_v1_read.in_flight[order_modified_us_equities_v1_at] == order_modified_us_equities_v1_written.in_flight[order_modified_us_equities_v1_at]); order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> assert(order_modified_us_equities_v1_read.transaction_time[order_modified_us_equities_v1_at] == order_modified_us_equities_v1_written.transaction_time[order_modified_us_equities_v1_at]); order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 20 -> assert(order_modified_us_equities_v1_read.cl_ord_id[order_modified_us_equities_v1_at] == order_modified_us_equities_v1_written.cl_ord_id[order_modified_us_equities_v1_at]); order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 20 -> assert(order_modified_us_equities_v1_read.orig_cl_ord_id[order_modified_us_equities_v1_at] == order_modified_us_equities_v1_written.orig_cl_ord_id[order_modified_us_equities_v1_at]); order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> assert(order_modified_us_equities_v1_read.order_id[order_modified_us_equities_v1_at] == order_modified_us_equities_v1_written.order_id[order_modified_us_equities_v1_at]); order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 4 -> assert(order_modified_us_equities_v1_read.clearing_firm[order_modified_us_equities_v1_at] == order_modified_us_equities_v1_written.clearing_firm[order_modified_us_equities_v1_at]); order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> assert(order_modified_us_equities_v1_read.symbol[order_modified_us_equities_v1_at] == order_modified_us_equities_v1_written.symbol[order_modified_us_equities_v1_at]); order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_modified_us_equities_v1_read.side == order_modified_us_equities_v1_written.side);
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> assert(order_modified_us_equities_v1_read.price[order_modified_us_equities_v1_at] == order_modified_us_equities_v1_written.price[order_modified_us_equities_v1_at]); order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_modified_us_equities_v1_read.ord_type == order_modified_us_equities_v1_written.ord_type);
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 4 -> assert(order_modified_us_equities_v1_read.max_floor[order_modified_us_equities_v1_at] == order_modified_us_equities_v1_written.max_floor[order_modified_us_equities_v1_at]); order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 4 -> assert(order_modified_us_equities_v1_read.order_qty[order_modified_us_equities_v1_at] == order_modified_us_equities_v1_written.order_qty[order_modified_us_equities_v1_at]); order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> assert(order_modified_us_equities_v1_read.stop_px[order_modified_us_equities_v1_at] == order_modified_us_equities_v1_written.stop_px[order_modified_us_equities_v1_at]); order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 4 -> assert(order_modified_us_equities_v1_read.leaves_qty[order_modified_us_equities_v1_at] == order_modified_us_equities_v1_written.leaves_qty[order_modified_us_equities_v1_at]); order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> assert(order_modified_us_equities_v1_read.display_price[order_modified_us_equities_v1_at] == order_modified_us_equities_v1_written.display_price[order_modified_us_equities_v1_at]); order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> assert(order_modified_us_equities_v1_read.working_price[order_modified_us_equities_v1_at] == order_modified_us_equities_v1_written.working_price[order_modified_us_equities_v1_at]); order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_modified_us_equities_v1_read.base_liquidity_indicator == order_modified_us_equities_v1_written.base_liquidity_indicator);
  order_modified_us_equities_v1_at = 0;
  do
  :: order_modified_us_equities_v1_at < 8 -> assert(order_modified_us_equities_v1_read.secondary_order_id[order_modified_us_equities_v1_at] == order_modified_us_equities_v1_written.secondary_order_id[order_modified_us_equities_v1_at]); order_modified_us_equities_v1_at = order_modified_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Restated Us Equities V 1: 108 bytes ------------------------------- */

/* Order Restated messages are sent to inform the Member that an order has been asynchronously modified for some reason without an explicit Modify Order message request having been sent */
typedef OrderRestatedUsEquitiesV1 {
  byte in_flight[2];
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte order_id[8];
  byte clearing_firm[4];
  byte symbol[8];
  byte order_restatement_reason;
  byte order_qty[4];
  byte price[8];
  byte leaves_qty[4];
  byte display_price[8];
  byte working_price[8];
  byte base_liquidity_indicator;
  byte secondary_order_id[8];
  byte last_shares[4];
  byte last_px[8];
  byte cmc_match_qty[4]
};

int order_restated_us_equities_v1_at;

/* every byte of Order Restated Us Equities V 1 set to one value */
inline fill_order_restated_us_equities_v1(order_restated_us_equities_v1_record, order_restated_us_equities_v1_value) {
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 2 -> order_restated_us_equities_v1_record.in_flight[order_restated_us_equities_v1_at] = order_restated_us_equities_v1_value; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> order_restated_us_equities_v1_record.transaction_time[order_restated_us_equities_v1_at] = order_restated_us_equities_v1_value; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 20 -> order_restated_us_equities_v1_record.cl_ord_id[order_restated_us_equities_v1_at] = order_restated_us_equities_v1_value; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> order_restated_us_equities_v1_record.order_id[order_restated_us_equities_v1_at] = order_restated_us_equities_v1_value; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 4 -> order_restated_us_equities_v1_record.clearing_firm[order_restated_us_equities_v1_at] = order_restated_us_equities_v1_value; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> order_restated_us_equities_v1_record.symbol[order_restated_us_equities_v1_at] = order_restated_us_equities_v1_value; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_record.order_restatement_reason = order_restated_us_equities_v1_value;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 4 -> order_restated_us_equities_v1_record.order_qty[order_restated_us_equities_v1_at] = order_restated_us_equities_v1_value; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> order_restated_us_equities_v1_record.price[order_restated_us_equities_v1_at] = order_restated_us_equities_v1_value; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 4 -> order_restated_us_equities_v1_record.leaves_qty[order_restated_us_equities_v1_at] = order_restated_us_equities_v1_value; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> order_restated_us_equities_v1_record.display_price[order_restated_us_equities_v1_at] = order_restated_us_equities_v1_value; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> order_restated_us_equities_v1_record.working_price[order_restated_us_equities_v1_at] = order_restated_us_equities_v1_value; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_record.base_liquidity_indicator = order_restated_us_equities_v1_value;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> order_restated_us_equities_v1_record.secondary_order_id[order_restated_us_equities_v1_at] = order_restated_us_equities_v1_value; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 4 -> order_restated_us_equities_v1_record.last_shares[order_restated_us_equities_v1_at] = order_restated_us_equities_v1_value; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> order_restated_us_equities_v1_record.last_px[order_restated_us_equities_v1_at] = order_restated_us_equities_v1_value; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 4 -> order_restated_us_equities_v1_record.cmc_match_qty[order_restated_us_equities_v1_at] = order_restated_us_equities_v1_value; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Restated Us Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_order_restated_us_equities_v1(order_restated_us_equities_v1_record, order_restated_us_equities_v1_base) {
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 2 -> order_restated_us_equities_v1_record.in_flight[order_restated_us_equities_v1_at] = (order_restated_us_equities_v1_base + 0 + order_restated_us_equities_v1_at + 1) % 256; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> order_restated_us_equities_v1_record.transaction_time[order_restated_us_equities_v1_at] = (order_restated_us_equities_v1_base + 2 + order_restated_us_equities_v1_at + 1) % 256; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 20 -> order_restated_us_equities_v1_record.cl_ord_id[order_restated_us_equities_v1_at] = (order_restated_us_equities_v1_base + 10 + order_restated_us_equities_v1_at + 1) % 256; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> order_restated_us_equities_v1_record.order_id[order_restated_us_equities_v1_at] = (order_restated_us_equities_v1_base + 30 + order_restated_us_equities_v1_at + 1) % 256; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 4 -> order_restated_us_equities_v1_record.clearing_firm[order_restated_us_equities_v1_at] = (order_restated_us_equities_v1_base + 38 + order_restated_us_equities_v1_at + 1) % 256; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> order_restated_us_equities_v1_record.symbol[order_restated_us_equities_v1_at] = (order_restated_us_equities_v1_base + 42 + order_restated_us_equities_v1_at + 1) % 256; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_record.order_restatement_reason = (order_restated_us_equities_v1_base + 50 + 1) % 256;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 4 -> order_restated_us_equities_v1_record.order_qty[order_restated_us_equities_v1_at] = (order_restated_us_equities_v1_base + 51 + order_restated_us_equities_v1_at + 1) % 256; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> order_restated_us_equities_v1_record.price[order_restated_us_equities_v1_at] = (order_restated_us_equities_v1_base + 55 + order_restated_us_equities_v1_at + 1) % 256; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 4 -> order_restated_us_equities_v1_record.leaves_qty[order_restated_us_equities_v1_at] = (order_restated_us_equities_v1_base + 63 + order_restated_us_equities_v1_at + 1) % 256; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> order_restated_us_equities_v1_record.display_price[order_restated_us_equities_v1_at] = (order_restated_us_equities_v1_base + 67 + order_restated_us_equities_v1_at + 1) % 256; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> order_restated_us_equities_v1_record.working_price[order_restated_us_equities_v1_at] = (order_restated_us_equities_v1_base + 75 + order_restated_us_equities_v1_at + 1) % 256; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_record.base_liquidity_indicator = (order_restated_us_equities_v1_base + 83 + 1) % 256;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> order_restated_us_equities_v1_record.secondary_order_id[order_restated_us_equities_v1_at] = (order_restated_us_equities_v1_base + 84 + order_restated_us_equities_v1_at + 1) % 256; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 4 -> order_restated_us_equities_v1_record.last_shares[order_restated_us_equities_v1_at] = (order_restated_us_equities_v1_base + 92 + order_restated_us_equities_v1_at + 1) % 256; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> order_restated_us_equities_v1_record.last_px[order_restated_us_equities_v1_at] = (order_restated_us_equities_v1_base + 96 + order_restated_us_equities_v1_at + 1) % 256; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 4 -> order_restated_us_equities_v1_record.cmc_match_qty[order_restated_us_equities_v1_at] = (order_restated_us_equities_v1_base + 104 + order_restated_us_equities_v1_at + 1) % 256; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Order Restated Us Equities V 1 to the wire, 108 bytes from where the cursor stands */
inline encode_order_restated_us_equities_v1(order_restated_us_equities_v1_record) {
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 2 -> wire[at] = order_restated_us_equities_v1_record.in_flight[order_restated_us_equities_v1_at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> wire[at] = order_restated_us_equities_v1_record.transaction_time[order_restated_us_equities_v1_at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 20 -> wire[at] = order_restated_us_equities_v1_record.cl_ord_id[order_restated_us_equities_v1_at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> wire[at] = order_restated_us_equities_v1_record.order_id[order_restated_us_equities_v1_at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 4 -> wire[at] = order_restated_us_equities_v1_record.clearing_firm[order_restated_us_equities_v1_at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> wire[at] = order_restated_us_equities_v1_record.symbol[order_restated_us_equities_v1_at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_restated_us_equities_v1_record.order_restatement_reason; at = at + 1;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 4 -> wire[at] = order_restated_us_equities_v1_record.order_qty[order_restated_us_equities_v1_at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> wire[at] = order_restated_us_equities_v1_record.price[order_restated_us_equities_v1_at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 4 -> wire[at] = order_restated_us_equities_v1_record.leaves_qty[order_restated_us_equities_v1_at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> wire[at] = order_restated_us_equities_v1_record.display_price[order_restated_us_equities_v1_at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> wire[at] = order_restated_us_equities_v1_record.working_price[order_restated_us_equities_v1_at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_restated_us_equities_v1_record.base_liquidity_indicator; at = at + 1;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> wire[at] = order_restated_us_equities_v1_record.secondary_order_id[order_restated_us_equities_v1_at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 4 -> wire[at] = order_restated_us_equities_v1_record.last_shares[order_restated_us_equities_v1_at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> wire[at] = order_restated_us_equities_v1_record.last_px[order_restated_us_equities_v1_at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 4 -> wire[at] = order_restated_us_equities_v1_record.cmc_match_qty[order_restated_us_equities_v1_at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Order Restated Us Equities V 1 off the wire, 108 bytes from where the cursor stands */
inline decode_order_restated_us_equities_v1(order_restated_us_equities_v1_record) {
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 2 -> order_restated_us_equities_v1_record.in_flight[order_restated_us_equities_v1_at] = wire[at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> order_restated_us_equities_v1_record.transaction_time[order_restated_us_equities_v1_at] = wire[at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 20 -> order_restated_us_equities_v1_record.cl_ord_id[order_restated_us_equities_v1_at] = wire[at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> order_restated_us_equities_v1_record.order_id[order_restated_us_equities_v1_at] = wire[at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 4 -> order_restated_us_equities_v1_record.clearing_firm[order_restated_us_equities_v1_at] = wire[at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> order_restated_us_equities_v1_record.symbol[order_restated_us_equities_v1_at] = wire[at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_record.order_restatement_reason = wire[at]; at = at + 1;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 4 -> order_restated_us_equities_v1_record.order_qty[order_restated_us_equities_v1_at] = wire[at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> order_restated_us_equities_v1_record.price[order_restated_us_equities_v1_at] = wire[at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 4 -> order_restated_us_equities_v1_record.leaves_qty[order_restated_us_equities_v1_at] = wire[at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> order_restated_us_equities_v1_record.display_price[order_restated_us_equities_v1_at] = wire[at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> order_restated_us_equities_v1_record.working_price[order_restated_us_equities_v1_at] = wire[at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_record.base_liquidity_indicator = wire[at]; at = at + 1;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> order_restated_us_equities_v1_record.secondary_order_id[order_restated_us_equities_v1_at] = wire[at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 4 -> order_restated_us_equities_v1_record.last_shares[order_restated_us_equities_v1_at] = wire[at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> order_restated_us_equities_v1_record.last_px[order_restated_us_equities_v1_at] = wire[at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 4 -> order_restated_us_equities_v1_record.cmc_match_qty[order_restated_us_equities_v1_at] = wire[at]; at = at + 1; order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Restated Us Equities V 1 is what was written, byte for byte */
inline equal_order_restated_us_equities_v1(order_restated_us_equities_v1_read, order_restated_us_equities_v1_written) {
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 2 -> assert(order_restated_us_equities_v1_read.in_flight[order_restated_us_equities_v1_at] == order_restated_us_equities_v1_written.in_flight[order_restated_us_equities_v1_at]); order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> assert(order_restated_us_equities_v1_read.transaction_time[order_restated_us_equities_v1_at] == order_restated_us_equities_v1_written.transaction_time[order_restated_us_equities_v1_at]); order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 20 -> assert(order_restated_us_equities_v1_read.cl_ord_id[order_restated_us_equities_v1_at] == order_restated_us_equities_v1_written.cl_ord_id[order_restated_us_equities_v1_at]); order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> assert(order_restated_us_equities_v1_read.order_id[order_restated_us_equities_v1_at] == order_restated_us_equities_v1_written.order_id[order_restated_us_equities_v1_at]); order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 4 -> assert(order_restated_us_equities_v1_read.clearing_firm[order_restated_us_equities_v1_at] == order_restated_us_equities_v1_written.clearing_firm[order_restated_us_equities_v1_at]); order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> assert(order_restated_us_equities_v1_read.symbol[order_restated_us_equities_v1_at] == order_restated_us_equities_v1_written.symbol[order_restated_us_equities_v1_at]); order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_restated_us_equities_v1_read.order_restatement_reason == order_restated_us_equities_v1_written.order_restatement_reason);
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 4 -> assert(order_restated_us_equities_v1_read.order_qty[order_restated_us_equities_v1_at] == order_restated_us_equities_v1_written.order_qty[order_restated_us_equities_v1_at]); order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> assert(order_restated_us_equities_v1_read.price[order_restated_us_equities_v1_at] == order_restated_us_equities_v1_written.price[order_restated_us_equities_v1_at]); order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 4 -> assert(order_restated_us_equities_v1_read.leaves_qty[order_restated_us_equities_v1_at] == order_restated_us_equities_v1_written.leaves_qty[order_restated_us_equities_v1_at]); order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> assert(order_restated_us_equities_v1_read.display_price[order_restated_us_equities_v1_at] == order_restated_us_equities_v1_written.display_price[order_restated_us_equities_v1_at]); order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> assert(order_restated_us_equities_v1_read.working_price[order_restated_us_equities_v1_at] == order_restated_us_equities_v1_written.working_price[order_restated_us_equities_v1_at]); order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_restated_us_equities_v1_read.base_liquidity_indicator == order_restated_us_equities_v1_written.base_liquidity_indicator);
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> assert(order_restated_us_equities_v1_read.secondary_order_id[order_restated_us_equities_v1_at] == order_restated_us_equities_v1_written.secondary_order_id[order_restated_us_equities_v1_at]); order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 4 -> assert(order_restated_us_equities_v1_read.last_shares[order_restated_us_equities_v1_at] == order_restated_us_equities_v1_written.last_shares[order_restated_us_equities_v1_at]); order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 8 -> assert(order_restated_us_equities_v1_read.last_px[order_restated_us_equities_v1_at] == order_restated_us_equities_v1_written.last_px[order_restated_us_equities_v1_at]); order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  order_restated_us_equities_v1_at = 0;
  do
  :: order_restated_us_equities_v1_at < 4 -> assert(order_restated_us_equities_v1_read.cmc_match_qty[order_restated_us_equities_v1_at] == order_restated_us_equities_v1_written.cmc_match_qty[order_restated_us_equities_v1_at]); order_restated_us_equities_v1_at = order_restated_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Rejected Us Equities V 1: 115 bytes ------------------------------ */

/* User Modify Rejected messages are sent in response to a Modify Order message for an order which cannot be modified */
typedef ModifyRejectedUsEquitiesV1 {
  byte in_flight[2];
  byte transaction_time[8];
  byte clearing_firm[4];
  byte cl_ord_id[20];
  byte orig_cl_ord_id[20];
  byte modify_reject_reason;
  byte text[60]
};

int modify_rejected_us_equities_v1_at;

/* every byte of Modify Rejected Us Equities V 1 set to one value */
inline fill_modify_rejected_us_equities_v1(modify_rejected_us_equities_v1_record, modify_rejected_us_equities_v1_value) {
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 2 -> modify_rejected_us_equities_v1_record.in_flight[modify_rejected_us_equities_v1_at] = modify_rejected_us_equities_v1_value; modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 8 -> modify_rejected_us_equities_v1_record.transaction_time[modify_rejected_us_equities_v1_at] = modify_rejected_us_equities_v1_value; modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 4 -> modify_rejected_us_equities_v1_record.clearing_firm[modify_rejected_us_equities_v1_at] = modify_rejected_us_equities_v1_value; modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 20 -> modify_rejected_us_equities_v1_record.cl_ord_id[modify_rejected_us_equities_v1_at] = modify_rejected_us_equities_v1_value; modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 20 -> modify_rejected_us_equities_v1_record.orig_cl_ord_id[modify_rejected_us_equities_v1_at] = modify_rejected_us_equities_v1_value; modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_us_equities_v1_record.modify_reject_reason = modify_rejected_us_equities_v1_value;
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 60 -> modify_rejected_us_equities_v1_record.text[modify_rejected_us_equities_v1_at] = modify_rejected_us_equities_v1_value; modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Modify Rejected Us Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_modify_rejected_us_equities_v1(modify_rejected_us_equities_v1_record, modify_rejected_us_equities_v1_base) {
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 2 -> modify_rejected_us_equities_v1_record.in_flight[modify_rejected_us_equities_v1_at] = (modify_rejected_us_equities_v1_base + 0 + modify_rejected_us_equities_v1_at + 1) % 256; modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 8 -> modify_rejected_us_equities_v1_record.transaction_time[modify_rejected_us_equities_v1_at] = (modify_rejected_us_equities_v1_base + 2 + modify_rejected_us_equities_v1_at + 1) % 256; modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 4 -> modify_rejected_us_equities_v1_record.clearing_firm[modify_rejected_us_equities_v1_at] = (modify_rejected_us_equities_v1_base + 10 + modify_rejected_us_equities_v1_at + 1) % 256; modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 20 -> modify_rejected_us_equities_v1_record.cl_ord_id[modify_rejected_us_equities_v1_at] = (modify_rejected_us_equities_v1_base + 14 + modify_rejected_us_equities_v1_at + 1) % 256; modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 20 -> modify_rejected_us_equities_v1_record.orig_cl_ord_id[modify_rejected_us_equities_v1_at] = (modify_rejected_us_equities_v1_base + 34 + modify_rejected_us_equities_v1_at + 1) % 256; modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_us_equities_v1_record.modify_reject_reason = (modify_rejected_us_equities_v1_base + 54 + 1) % 256;
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 60 -> modify_rejected_us_equities_v1_record.text[modify_rejected_us_equities_v1_at] = (modify_rejected_us_equities_v1_base + 55 + modify_rejected_us_equities_v1_at + 1) % 256; modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Rejected Us Equities V 1 to the wire, 115 bytes from where the cursor stands */
inline encode_modify_rejected_us_equities_v1(modify_rejected_us_equities_v1_record) {
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 2 -> wire[at] = modify_rejected_us_equities_v1_record.in_flight[modify_rejected_us_equities_v1_at]; at = at + 1; modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 8 -> wire[at] = modify_rejected_us_equities_v1_record.transaction_time[modify_rejected_us_equities_v1_at]; at = at + 1; modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 4 -> wire[at] = modify_rejected_us_equities_v1_record.clearing_firm[modify_rejected_us_equities_v1_at]; at = at + 1; modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 20 -> wire[at] = modify_rejected_us_equities_v1_record.cl_ord_id[modify_rejected_us_equities_v1_at]; at = at + 1; modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 20 -> wire[at] = modify_rejected_us_equities_v1_record.orig_cl_ord_id[modify_rejected_us_equities_v1_at]; at = at + 1; modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = modify_rejected_us_equities_v1_record.modify_reject_reason; at = at + 1;
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 60 -> wire[at] = modify_rejected_us_equities_v1_record.text[modify_rejected_us_equities_v1_at]; at = at + 1; modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Rejected Us Equities V 1 off the wire, 115 bytes from where the cursor stands */
inline decode_modify_rejected_us_equities_v1(modify_rejected_us_equities_v1_record) {
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 2 -> modify_rejected_us_equities_v1_record.in_flight[modify_rejected_us_equities_v1_at] = wire[at]; at = at + 1; modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 8 -> modify_rejected_us_equities_v1_record.transaction_time[modify_rejected_us_equities_v1_at] = wire[at]; at = at + 1; modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 4 -> modify_rejected_us_equities_v1_record.clearing_firm[modify_rejected_us_equities_v1_at] = wire[at]; at = at + 1; modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 20 -> modify_rejected_us_equities_v1_record.cl_ord_id[modify_rejected_us_equities_v1_at] = wire[at]; at = at + 1; modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 20 -> modify_rejected_us_equities_v1_record.orig_cl_ord_id[modify_rejected_us_equities_v1_at] = wire[at]; at = at + 1; modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_us_equities_v1_record.modify_reject_reason = wire[at]; at = at + 1;
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 60 -> modify_rejected_us_equities_v1_record.text[modify_rejected_us_equities_v1_at] = wire[at]; at = at + 1; modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Modify Rejected Us Equities V 1 is what was written, byte for byte */
inline equal_modify_rejected_us_equities_v1(modify_rejected_us_equities_v1_read, modify_rejected_us_equities_v1_written) {
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 2 -> assert(modify_rejected_us_equities_v1_read.in_flight[modify_rejected_us_equities_v1_at] == modify_rejected_us_equities_v1_written.in_flight[modify_rejected_us_equities_v1_at]); modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 8 -> assert(modify_rejected_us_equities_v1_read.transaction_time[modify_rejected_us_equities_v1_at] == modify_rejected_us_equities_v1_written.transaction_time[modify_rejected_us_equities_v1_at]); modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 4 -> assert(modify_rejected_us_equities_v1_read.clearing_firm[modify_rejected_us_equities_v1_at] == modify_rejected_us_equities_v1_written.clearing_firm[modify_rejected_us_equities_v1_at]); modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 20 -> assert(modify_rejected_us_equities_v1_read.cl_ord_id[modify_rejected_us_equities_v1_at] == modify_rejected_us_equities_v1_written.cl_ord_id[modify_rejected_us_equities_v1_at]); modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 20 -> assert(modify_rejected_us_equities_v1_read.orig_cl_ord_id[modify_rejected_us_equities_v1_at] == modify_rejected_us_equities_v1_written.orig_cl_ord_id[modify_rejected_us_equities_v1_at]); modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(modify_rejected_us_equities_v1_read.modify_reject_reason == modify_rejected_us_equities_v1_written.modify_reject_reason);
  modify_rejected_us_equities_v1_at = 0;
  do
  :: modify_rejected_us_equities_v1_at < 60 -> assert(modify_rejected_us_equities_v1_read.text[modify_rejected_us_equities_v1_at] == modify_rejected_us_equities_v1_written.text[modify_rejected_us_equities_v1_at]); modify_rejected_us_equities_v1_at = modify_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancelled Us Equities V 1: 35 bytes ------------------------------- */

/* This message indicates an order has been cancelled */
typedef OrderCancelledUsEquitiesV1 {
  byte in_flight[2];
  byte transaction_time[8];
  byte clearing_firm[4];
  byte cl_ord_id[20];
  byte cancel_reason
};

int order_cancelled_us_equities_v1_at;

/* every byte of Order Cancelled Us Equities V 1 set to one value */
inline fill_order_cancelled_us_equities_v1(order_cancelled_us_equities_v1_record, order_cancelled_us_equities_v1_value) {
  order_cancelled_us_equities_v1_at = 0;
  do
  :: order_cancelled_us_equities_v1_at < 2 -> order_cancelled_us_equities_v1_record.in_flight[order_cancelled_us_equities_v1_at] = order_cancelled_us_equities_v1_value; order_cancelled_us_equities_v1_at = order_cancelled_us_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_us_equities_v1_at = 0;
  do
  :: order_cancelled_us_equities_v1_at < 8 -> order_cancelled_us_equities_v1_record.transaction_time[order_cancelled_us_equities_v1_at] = order_cancelled_us_equities_v1_value; order_cancelled_us_equities_v1_at = order_cancelled_us_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_us_equities_v1_at = 0;
  do
  :: order_cancelled_us_equities_v1_at < 4 -> order_cancelled_us_equities_v1_record.clearing_firm[order_cancelled_us_equities_v1_at] = order_cancelled_us_equities_v1_value; order_cancelled_us_equities_v1_at = order_cancelled_us_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_us_equities_v1_at = 0;
  do
  :: order_cancelled_us_equities_v1_at < 20 -> order_cancelled_us_equities_v1_record.cl_ord_id[order_cancelled_us_equities_v1_at] = order_cancelled_us_equities_v1_value; order_cancelled_us_equities_v1_at = order_cancelled_us_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_us_equities_v1_record.cancel_reason = order_cancelled_us_equities_v1_value;
  skip
}

/* each byte of Order Cancelled Us Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_order_cancelled_us_equities_v1(order_cancelled_us_equities_v1_record, order_cancelled_us_equities_v1_base) {
  order_cancelled_us_equities_v1_at = 0;
  do
  :: order_cancelled_us_equities_v1_at < 2 -> order_cancelled_us_equities_v1_record.in_flight[order_cancelled_us_equities_v1_at] = (order_cancelled_us_equities_v1_base + 0 + order_cancelled_us_equities_v1_at + 1) % 256; order_cancelled_us_equities_v1_at = order_cancelled_us_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_us_equities_v1_at = 0;
  do
  :: order_cancelled_us_equities_v1_at < 8 -> order_cancelled_us_equities_v1_record.transaction_time[order_cancelled_us_equities_v1_at] = (order_cancelled_us_equities_v1_base + 2 + order_cancelled_us_equities_v1_at + 1) % 256; order_cancelled_us_equities_v1_at = order_cancelled_us_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_us_equities_v1_at = 0;
  do
  :: order_cancelled_us_equities_v1_at < 4 -> order_cancelled_us_equities_v1_record.clearing_firm[order_cancelled_us_equities_v1_at] = (order_cancelled_us_equities_v1_base + 10 + order_cancelled_us_equities_v1_at + 1) % 256; order_cancelled_us_equities_v1_at = order_cancelled_us_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_us_equities_v1_at = 0;
  do
  :: order_cancelled_us_equities_v1_at < 20 -> order_cancelled_us_equities_v1_record.cl_ord_id[order_cancelled_us_equities_v1_at] = (order_cancelled_us_equities_v1_base + 14 + order_cancelled_us_equities_v1_at + 1) % 256; order_cancelled_us_equities_v1_at = order_cancelled_us_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_us_equities_v1_record.cancel_reason = (order_cancelled_us_equities_v1_base + 34 + 1) % 256;
  skip
}

/* Order Cancelled Us Equities V 1 to the wire, 35 bytes from where the cursor stands */
inline encode_order_cancelled_us_equities_v1(order_cancelled_us_equities_v1_record) {
  order_cancelled_us_equities_v1_at = 0;
  do
  :: order_cancelled_us_equities_v1_at < 2 -> wire[at] = order_cancelled_us_equities_v1_record.in_flight[order_cancelled_us_equities_v1_at]; at = at + 1; order_cancelled_us_equities_v1_at = order_cancelled_us_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_us_equities_v1_at = 0;
  do
  :: order_cancelled_us_equities_v1_at < 8 -> wire[at] = order_cancelled_us_equities_v1_record.transaction_time[order_cancelled_us_equities_v1_at]; at = at + 1; order_cancelled_us_equities_v1_at = order_cancelled_us_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_us_equities_v1_at = 0;
  do
  :: order_cancelled_us_equities_v1_at < 4 -> wire[at] = order_cancelled_us_equities_v1_record.clearing_firm[order_cancelled_us_equities_v1_at]; at = at + 1; order_cancelled_us_equities_v1_at = order_cancelled_us_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_us_equities_v1_at = 0;
  do
  :: order_cancelled_us_equities_v1_at < 20 -> wire[at] = order_cancelled_us_equities_v1_record.cl_ord_id[order_cancelled_us_equities_v1_at]; at = at + 1; order_cancelled_us_equities_v1_at = order_cancelled_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_cancelled_us_equities_v1_record.cancel_reason; at = at + 1;
  skip
}

/* Order Cancelled Us Equities V 1 off the wire, 35 bytes from where the cursor stands */
inline decode_order_cancelled_us_equities_v1(order_cancelled_us_equities_v1_record) {
  order_cancelled_us_equities_v1_at = 0;
  do
  :: order_cancelled_us_equities_v1_at < 2 -> order_cancelled_us_equities_v1_record.in_flight[order_cancelled_us_equities_v1_at] = wire[at]; at = at + 1; order_cancelled_us_equities_v1_at = order_cancelled_us_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_us_equities_v1_at = 0;
  do
  :: order_cancelled_us_equities_v1_at < 8 -> order_cancelled_us_equities_v1_record.transaction_time[order_cancelled_us_equities_v1_at] = wire[at]; at = at + 1; order_cancelled_us_equities_v1_at = order_cancelled_us_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_us_equities_v1_at = 0;
  do
  :: order_cancelled_us_equities_v1_at < 4 -> order_cancelled_us_equities_v1_record.clearing_firm[order_cancelled_us_equities_v1_at] = wire[at]; at = at + 1; order_cancelled_us_equities_v1_at = order_cancelled_us_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_us_equities_v1_at = 0;
  do
  :: order_cancelled_us_equities_v1_at < 20 -> order_cancelled_us_equities_v1_record.cl_ord_id[order_cancelled_us_equities_v1_at] = wire[at]; at = at + 1; order_cancelled_us_equities_v1_at = order_cancelled_us_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_us_equities_v1_record.cancel_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Cancelled Us Equities V 1 is what was written, byte for byte */
inline equal_order_cancelled_us_equities_v1(order_cancelled_us_equities_v1_read, order_cancelled_us_equities_v1_written) {
  order_cancelled_us_equities_v1_at = 0;
  do
  :: order_cancelled_us_equities_v1_at < 2 -> assert(order_cancelled_us_equities_v1_read.in_flight[order_cancelled_us_equities_v1_at] == order_cancelled_us_equities_v1_written.in_flight[order_cancelled_us_equities_v1_at]); order_cancelled_us_equities_v1_at = order_cancelled_us_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_us_equities_v1_at = 0;
  do
  :: order_cancelled_us_equities_v1_at < 8 -> assert(order_cancelled_us_equities_v1_read.transaction_time[order_cancelled_us_equities_v1_at] == order_cancelled_us_equities_v1_written.transaction_time[order_cancelled_us_equities_v1_at]); order_cancelled_us_equities_v1_at = order_cancelled_us_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_us_equities_v1_at = 0;
  do
  :: order_cancelled_us_equities_v1_at < 4 -> assert(order_cancelled_us_equities_v1_read.clearing_firm[order_cancelled_us_equities_v1_at] == order_cancelled_us_equities_v1_written.clearing_firm[order_cancelled_us_equities_v1_at]); order_cancelled_us_equities_v1_at = order_cancelled_us_equities_v1_at + 1
  :: else -> break
  od;
  order_cancelled_us_equities_v1_at = 0;
  do
  :: order_cancelled_us_equities_v1_at < 20 -> assert(order_cancelled_us_equities_v1_read.cl_ord_id[order_cancelled_us_equities_v1_at] == order_cancelled_us_equities_v1_written.cl_ord_id[order_cancelled_us_equities_v1_at]); order_cancelled_us_equities_v1_at = order_cancelled_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_cancelled_us_equities_v1_read.cancel_reason == order_cancelled_us_equities_v1_written.cancel_reason);
  skip
}

/* ---- Cancel Rejected Us Equities V 1: 95 bytes ------------------------------- */

/* A Cancel Rejected message is sent in response to a Cancel Order message to indicate that the cancellation cannot occur */
typedef CancelRejectedUsEquitiesV1 {
  byte in_flight[2];
  byte transaction_time[8];
  byte clearing_firm[4];
  byte cl_ord_id[20];
  byte cancel_reject_reason;
  byte text[60]
};

int cancel_rejected_us_equities_v1_at;

/* every byte of Cancel Rejected Us Equities V 1 set to one value */
inline fill_cancel_rejected_us_equities_v1(cancel_rejected_us_equities_v1_record, cancel_rejected_us_equities_v1_value) {
  cancel_rejected_us_equities_v1_at = 0;
  do
  :: cancel_rejected_us_equities_v1_at < 2 -> cancel_rejected_us_equities_v1_record.in_flight[cancel_rejected_us_equities_v1_at] = cancel_rejected_us_equities_v1_value; cancel_rejected_us_equities_v1_at = cancel_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_us_equities_v1_at = 0;
  do
  :: cancel_rejected_us_equities_v1_at < 8 -> cancel_rejected_us_equities_v1_record.transaction_time[cancel_rejected_us_equities_v1_at] = cancel_rejected_us_equities_v1_value; cancel_rejected_us_equities_v1_at = cancel_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_us_equities_v1_at = 0;
  do
  :: cancel_rejected_us_equities_v1_at < 4 -> cancel_rejected_us_equities_v1_record.clearing_firm[cancel_rejected_us_equities_v1_at] = cancel_rejected_us_equities_v1_value; cancel_rejected_us_equities_v1_at = cancel_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_us_equities_v1_at = 0;
  do
  :: cancel_rejected_us_equities_v1_at < 20 -> cancel_rejected_us_equities_v1_record.cl_ord_id[cancel_rejected_us_equities_v1_at] = cancel_rejected_us_equities_v1_value; cancel_rejected_us_equities_v1_at = cancel_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_us_equities_v1_record.cancel_reject_reason = cancel_rejected_us_equities_v1_value;
  cancel_rejected_us_equities_v1_at = 0;
  do
  :: cancel_rejected_us_equities_v1_at < 60 -> cancel_rejected_us_equities_v1_record.text[cancel_rejected_us_equities_v1_at] = cancel_rejected_us_equities_v1_value; cancel_rejected_us_equities_v1_at = cancel_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Rejected Us Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_cancel_rejected_us_equities_v1(cancel_rejected_us_equities_v1_record, cancel_rejected_us_equities_v1_base) {
  cancel_rejected_us_equities_v1_at = 0;
  do
  :: cancel_rejected_us_equities_v1_at < 2 -> cancel_rejected_us_equities_v1_record.in_flight[cancel_rejected_us_equities_v1_at] = (cancel_rejected_us_equities_v1_base + 0 + cancel_rejected_us_equities_v1_at + 1) % 256; cancel_rejected_us_equities_v1_at = cancel_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_us_equities_v1_at = 0;
  do
  :: cancel_rejected_us_equities_v1_at < 8 -> cancel_rejected_us_equities_v1_record.transaction_time[cancel_rejected_us_equities_v1_at] = (cancel_rejected_us_equities_v1_base + 2 + cancel_rejected_us_equities_v1_at + 1) % 256; cancel_rejected_us_equities_v1_at = cancel_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_us_equities_v1_at = 0;
  do
  :: cancel_rejected_us_equities_v1_at < 4 -> cancel_rejected_us_equities_v1_record.clearing_firm[cancel_rejected_us_equities_v1_at] = (cancel_rejected_us_equities_v1_base + 10 + cancel_rejected_us_equities_v1_at + 1) % 256; cancel_rejected_us_equities_v1_at = cancel_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_us_equities_v1_at = 0;
  do
  :: cancel_rejected_us_equities_v1_at < 20 -> cancel_rejected_us_equities_v1_record.cl_ord_id[cancel_rejected_us_equities_v1_at] = (cancel_rejected_us_equities_v1_base + 14 + cancel_rejected_us_equities_v1_at + 1) % 256; cancel_rejected_us_equities_v1_at = cancel_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_us_equities_v1_record.cancel_reject_reason = (cancel_rejected_us_equities_v1_base + 34 + 1) % 256;
  cancel_rejected_us_equities_v1_at = 0;
  do
  :: cancel_rejected_us_equities_v1_at < 60 -> cancel_rejected_us_equities_v1_record.text[cancel_rejected_us_equities_v1_at] = (cancel_rejected_us_equities_v1_base + 35 + cancel_rejected_us_equities_v1_at + 1) % 256; cancel_rejected_us_equities_v1_at = cancel_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Rejected Us Equities V 1 to the wire, 95 bytes from where the cursor stands */
inline encode_cancel_rejected_us_equities_v1(cancel_rejected_us_equities_v1_record) {
  cancel_rejected_us_equities_v1_at = 0;
  do
  :: cancel_rejected_us_equities_v1_at < 2 -> wire[at] = cancel_rejected_us_equities_v1_record.in_flight[cancel_rejected_us_equities_v1_at]; at = at + 1; cancel_rejected_us_equities_v1_at = cancel_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_us_equities_v1_at = 0;
  do
  :: cancel_rejected_us_equities_v1_at < 8 -> wire[at] = cancel_rejected_us_equities_v1_record.transaction_time[cancel_rejected_us_equities_v1_at]; at = at + 1; cancel_rejected_us_equities_v1_at = cancel_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_us_equities_v1_at = 0;
  do
  :: cancel_rejected_us_equities_v1_at < 4 -> wire[at] = cancel_rejected_us_equities_v1_record.clearing_firm[cancel_rejected_us_equities_v1_at]; at = at + 1; cancel_rejected_us_equities_v1_at = cancel_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_us_equities_v1_at = 0;
  do
  :: cancel_rejected_us_equities_v1_at < 20 -> wire[at] = cancel_rejected_us_equities_v1_record.cl_ord_id[cancel_rejected_us_equities_v1_at]; at = at + 1; cancel_rejected_us_equities_v1_at = cancel_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = cancel_rejected_us_equities_v1_record.cancel_reject_reason; at = at + 1;
  cancel_rejected_us_equities_v1_at = 0;
  do
  :: cancel_rejected_us_equities_v1_at < 60 -> wire[at] = cancel_rejected_us_equities_v1_record.text[cancel_rejected_us_equities_v1_at]; at = at + 1; cancel_rejected_us_equities_v1_at = cancel_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Rejected Us Equities V 1 off the wire, 95 bytes from where the cursor stands */
inline decode_cancel_rejected_us_equities_v1(cancel_rejected_us_equities_v1_record) {
  cancel_rejected_us_equities_v1_at = 0;
  do
  :: cancel_rejected_us_equities_v1_at < 2 -> cancel_rejected_us_equities_v1_record.in_flight[cancel_rejected_us_equities_v1_at] = wire[at]; at = at + 1; cancel_rejected_us_equities_v1_at = cancel_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_us_equities_v1_at = 0;
  do
  :: cancel_rejected_us_equities_v1_at < 8 -> cancel_rejected_us_equities_v1_record.transaction_time[cancel_rejected_us_equities_v1_at] = wire[at]; at = at + 1; cancel_rejected_us_equities_v1_at = cancel_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_us_equities_v1_at = 0;
  do
  :: cancel_rejected_us_equities_v1_at < 4 -> cancel_rejected_us_equities_v1_record.clearing_firm[cancel_rejected_us_equities_v1_at] = wire[at]; at = at + 1; cancel_rejected_us_equities_v1_at = cancel_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_us_equities_v1_at = 0;
  do
  :: cancel_rejected_us_equities_v1_at < 20 -> cancel_rejected_us_equities_v1_record.cl_ord_id[cancel_rejected_us_equities_v1_at] = wire[at]; at = at + 1; cancel_rejected_us_equities_v1_at = cancel_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_us_equities_v1_record.cancel_reject_reason = wire[at]; at = at + 1;
  cancel_rejected_us_equities_v1_at = 0;
  do
  :: cancel_rejected_us_equities_v1_at < 60 -> cancel_rejected_us_equities_v1_record.text[cancel_rejected_us_equities_v1_at] = wire[at]; at = at + 1; cancel_rejected_us_equities_v1_at = cancel_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Rejected Us Equities V 1 is what was written, byte for byte */
inline equal_cancel_rejected_us_equities_v1(cancel_rejected_us_equities_v1_read, cancel_rejected_us_equities_v1_written) {
  cancel_rejected_us_equities_v1_at = 0;
  do
  :: cancel_rejected_us_equities_v1_at < 2 -> assert(cancel_rejected_us_equities_v1_read.in_flight[cancel_rejected_us_equities_v1_at] == cancel_rejected_us_equities_v1_written.in_flight[cancel_rejected_us_equities_v1_at]); cancel_rejected_us_equities_v1_at = cancel_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_us_equities_v1_at = 0;
  do
  :: cancel_rejected_us_equities_v1_at < 8 -> assert(cancel_rejected_us_equities_v1_read.transaction_time[cancel_rejected_us_equities_v1_at] == cancel_rejected_us_equities_v1_written.transaction_time[cancel_rejected_us_equities_v1_at]); cancel_rejected_us_equities_v1_at = cancel_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_us_equities_v1_at = 0;
  do
  :: cancel_rejected_us_equities_v1_at < 4 -> assert(cancel_rejected_us_equities_v1_read.clearing_firm[cancel_rejected_us_equities_v1_at] == cancel_rejected_us_equities_v1_written.clearing_firm[cancel_rejected_us_equities_v1_at]); cancel_rejected_us_equities_v1_at = cancel_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  cancel_rejected_us_equities_v1_at = 0;
  do
  :: cancel_rejected_us_equities_v1_at < 20 -> assert(cancel_rejected_us_equities_v1_read.cl_ord_id[cancel_rejected_us_equities_v1_at] == cancel_rejected_us_equities_v1_written.cl_ord_id[cancel_rejected_us_equities_v1_at]); cancel_rejected_us_equities_v1_at = cancel_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(cancel_rejected_us_equities_v1_read.cancel_reject_reason == cancel_rejected_us_equities_v1_written.cancel_reject_reason);
  cancel_rejected_us_equities_v1_at = 0;
  do
  :: cancel_rejected_us_equities_v1_at < 60 -> assert(cancel_rejected_us_equities_v1_read.text[cancel_rejected_us_equities_v1_at] == cancel_rejected_us_equities_v1_written.text[cancel_rejected_us_equities_v1_at]); cancel_rejected_us_equities_v1_at = cancel_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Execution Us Equities V 1: 83 bytes ------------------------------- */

/* An Order Execution message is sent for each fill on an order */
typedef OrderExecutionUsEquitiesV1 {
  byte in_flight[2];
  byte transaction_time[8];
  byte clearing_firm[4];
  byte cl_ord_id[20];
  byte exec_id[8];
  byte last_shares[4];
  byte last_px[8];
  byte leaves_qty[4];
  byte base_liquidity_indicator;
  byte sub_liquidity_indicator;
  byte contra_broker[4];
  byte side;
  byte symbol[8];
  byte fee_code[2];
  byte access_fee[8]
};

int order_execution_us_equities_v1_at;

/* every byte of Order Execution Us Equities V 1 set to one value */
inline fill_order_execution_us_equities_v1(order_execution_us_equities_v1_record, order_execution_us_equities_v1_value) {
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 2 -> order_execution_us_equities_v1_record.in_flight[order_execution_us_equities_v1_at] = order_execution_us_equities_v1_value; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 8 -> order_execution_us_equities_v1_record.transaction_time[order_execution_us_equities_v1_at] = order_execution_us_equities_v1_value; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 4 -> order_execution_us_equities_v1_record.clearing_firm[order_execution_us_equities_v1_at] = order_execution_us_equities_v1_value; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 20 -> order_execution_us_equities_v1_record.cl_ord_id[order_execution_us_equities_v1_at] = order_execution_us_equities_v1_value; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 8 -> order_execution_us_equities_v1_record.exec_id[order_execution_us_equities_v1_at] = order_execution_us_equities_v1_value; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 4 -> order_execution_us_equities_v1_record.last_shares[order_execution_us_equities_v1_at] = order_execution_us_equities_v1_value; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 8 -> order_execution_us_equities_v1_record.last_px[order_execution_us_equities_v1_at] = order_execution_us_equities_v1_value; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 4 -> order_execution_us_equities_v1_record.leaves_qty[order_execution_us_equities_v1_at] = order_execution_us_equities_v1_value; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_record.base_liquidity_indicator = order_execution_us_equities_v1_value;
  order_execution_us_equities_v1_record.sub_liquidity_indicator = order_execution_us_equities_v1_value;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 4 -> order_execution_us_equities_v1_record.contra_broker[order_execution_us_equities_v1_at] = order_execution_us_equities_v1_value; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_record.side = order_execution_us_equities_v1_value;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 8 -> order_execution_us_equities_v1_record.symbol[order_execution_us_equities_v1_at] = order_execution_us_equities_v1_value; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 2 -> order_execution_us_equities_v1_record.fee_code[order_execution_us_equities_v1_at] = order_execution_us_equities_v1_value; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 8 -> order_execution_us_equities_v1_record.access_fee[order_execution_us_equities_v1_at] = order_execution_us_equities_v1_value; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Execution Us Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_order_execution_us_equities_v1(order_execution_us_equities_v1_record, order_execution_us_equities_v1_base) {
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 2 -> order_execution_us_equities_v1_record.in_flight[order_execution_us_equities_v1_at] = (order_execution_us_equities_v1_base + 0 + order_execution_us_equities_v1_at + 1) % 256; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 8 -> order_execution_us_equities_v1_record.transaction_time[order_execution_us_equities_v1_at] = (order_execution_us_equities_v1_base + 2 + order_execution_us_equities_v1_at + 1) % 256; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 4 -> order_execution_us_equities_v1_record.clearing_firm[order_execution_us_equities_v1_at] = (order_execution_us_equities_v1_base + 10 + order_execution_us_equities_v1_at + 1) % 256; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 20 -> order_execution_us_equities_v1_record.cl_ord_id[order_execution_us_equities_v1_at] = (order_execution_us_equities_v1_base + 14 + order_execution_us_equities_v1_at + 1) % 256; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 8 -> order_execution_us_equities_v1_record.exec_id[order_execution_us_equities_v1_at] = (order_execution_us_equities_v1_base + 34 + order_execution_us_equities_v1_at + 1) % 256; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 4 -> order_execution_us_equities_v1_record.last_shares[order_execution_us_equities_v1_at] = (order_execution_us_equities_v1_base + 42 + order_execution_us_equities_v1_at + 1) % 256; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 8 -> order_execution_us_equities_v1_record.last_px[order_execution_us_equities_v1_at] = (order_execution_us_equities_v1_base + 46 + order_execution_us_equities_v1_at + 1) % 256; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 4 -> order_execution_us_equities_v1_record.leaves_qty[order_execution_us_equities_v1_at] = (order_execution_us_equities_v1_base + 54 + order_execution_us_equities_v1_at + 1) % 256; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_record.base_liquidity_indicator = (order_execution_us_equities_v1_base + 58 + 1) % 256;
  order_execution_us_equities_v1_record.sub_liquidity_indicator = (order_execution_us_equities_v1_base + 59 + 1) % 256;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 4 -> order_execution_us_equities_v1_record.contra_broker[order_execution_us_equities_v1_at] = (order_execution_us_equities_v1_base + 60 + order_execution_us_equities_v1_at + 1) % 256; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_record.side = (order_execution_us_equities_v1_base + 64 + 1) % 256;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 8 -> order_execution_us_equities_v1_record.symbol[order_execution_us_equities_v1_at] = (order_execution_us_equities_v1_base + 65 + order_execution_us_equities_v1_at + 1) % 256; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 2 -> order_execution_us_equities_v1_record.fee_code[order_execution_us_equities_v1_at] = (order_execution_us_equities_v1_base + 73 + order_execution_us_equities_v1_at + 1) % 256; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 8 -> order_execution_us_equities_v1_record.access_fee[order_execution_us_equities_v1_at] = (order_execution_us_equities_v1_base + 75 + order_execution_us_equities_v1_at + 1) % 256; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Order Execution Us Equities V 1 to the wire, 83 bytes from where the cursor stands */
inline encode_order_execution_us_equities_v1(order_execution_us_equities_v1_record) {
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 2 -> wire[at] = order_execution_us_equities_v1_record.in_flight[order_execution_us_equities_v1_at]; at = at + 1; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 8 -> wire[at] = order_execution_us_equities_v1_record.transaction_time[order_execution_us_equities_v1_at]; at = at + 1; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 4 -> wire[at] = order_execution_us_equities_v1_record.clearing_firm[order_execution_us_equities_v1_at]; at = at + 1; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 20 -> wire[at] = order_execution_us_equities_v1_record.cl_ord_id[order_execution_us_equities_v1_at]; at = at + 1; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 8 -> wire[at] = order_execution_us_equities_v1_record.exec_id[order_execution_us_equities_v1_at]; at = at + 1; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 4 -> wire[at] = order_execution_us_equities_v1_record.last_shares[order_execution_us_equities_v1_at]; at = at + 1; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 8 -> wire[at] = order_execution_us_equities_v1_record.last_px[order_execution_us_equities_v1_at]; at = at + 1; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 4 -> wire[at] = order_execution_us_equities_v1_record.leaves_qty[order_execution_us_equities_v1_at]; at = at + 1; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_us_equities_v1_record.base_liquidity_indicator; at = at + 1;
  wire[at] = order_execution_us_equities_v1_record.sub_liquidity_indicator; at = at + 1;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 4 -> wire[at] = order_execution_us_equities_v1_record.contra_broker[order_execution_us_equities_v1_at]; at = at + 1; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_us_equities_v1_record.side; at = at + 1;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 8 -> wire[at] = order_execution_us_equities_v1_record.symbol[order_execution_us_equities_v1_at]; at = at + 1; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 2 -> wire[at] = order_execution_us_equities_v1_record.fee_code[order_execution_us_equities_v1_at]; at = at + 1; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 8 -> wire[at] = order_execution_us_equities_v1_record.access_fee[order_execution_us_equities_v1_at]; at = at + 1; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Order Execution Us Equities V 1 off the wire, 83 bytes from where the cursor stands */
inline decode_order_execution_us_equities_v1(order_execution_us_equities_v1_record) {
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 2 -> order_execution_us_equities_v1_record.in_flight[order_execution_us_equities_v1_at] = wire[at]; at = at + 1; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 8 -> order_execution_us_equities_v1_record.transaction_time[order_execution_us_equities_v1_at] = wire[at]; at = at + 1; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 4 -> order_execution_us_equities_v1_record.clearing_firm[order_execution_us_equities_v1_at] = wire[at]; at = at + 1; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 20 -> order_execution_us_equities_v1_record.cl_ord_id[order_execution_us_equities_v1_at] = wire[at]; at = at + 1; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 8 -> order_execution_us_equities_v1_record.exec_id[order_execution_us_equities_v1_at] = wire[at]; at = at + 1; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 4 -> order_execution_us_equities_v1_record.last_shares[order_execution_us_equities_v1_at] = wire[at]; at = at + 1; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 8 -> order_execution_us_equities_v1_record.last_px[order_execution_us_equities_v1_at] = wire[at]; at = at + 1; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 4 -> order_execution_us_equities_v1_record.leaves_qty[order_execution_us_equities_v1_at] = wire[at]; at = at + 1; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_record.base_liquidity_indicator = wire[at]; at = at + 1;
  order_execution_us_equities_v1_record.sub_liquidity_indicator = wire[at]; at = at + 1;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 4 -> order_execution_us_equities_v1_record.contra_broker[order_execution_us_equities_v1_at] = wire[at]; at = at + 1; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_record.side = wire[at]; at = at + 1;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 8 -> order_execution_us_equities_v1_record.symbol[order_execution_us_equities_v1_at] = wire[at]; at = at + 1; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 2 -> order_execution_us_equities_v1_record.fee_code[order_execution_us_equities_v1_at] = wire[at]; at = at + 1; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 8 -> order_execution_us_equities_v1_record.access_fee[order_execution_us_equities_v1_at] = wire[at]; at = at + 1; order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Execution Us Equities V 1 is what was written, byte for byte */
inline equal_order_execution_us_equities_v1(order_execution_us_equities_v1_read, order_execution_us_equities_v1_written) {
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 2 -> assert(order_execution_us_equities_v1_read.in_flight[order_execution_us_equities_v1_at] == order_execution_us_equities_v1_written.in_flight[order_execution_us_equities_v1_at]); order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 8 -> assert(order_execution_us_equities_v1_read.transaction_time[order_execution_us_equities_v1_at] == order_execution_us_equities_v1_written.transaction_time[order_execution_us_equities_v1_at]); order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 4 -> assert(order_execution_us_equities_v1_read.clearing_firm[order_execution_us_equities_v1_at] == order_execution_us_equities_v1_written.clearing_firm[order_execution_us_equities_v1_at]); order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 20 -> assert(order_execution_us_equities_v1_read.cl_ord_id[order_execution_us_equities_v1_at] == order_execution_us_equities_v1_written.cl_ord_id[order_execution_us_equities_v1_at]); order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 8 -> assert(order_execution_us_equities_v1_read.exec_id[order_execution_us_equities_v1_at] == order_execution_us_equities_v1_written.exec_id[order_execution_us_equities_v1_at]); order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 4 -> assert(order_execution_us_equities_v1_read.last_shares[order_execution_us_equities_v1_at] == order_execution_us_equities_v1_written.last_shares[order_execution_us_equities_v1_at]); order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 8 -> assert(order_execution_us_equities_v1_read.last_px[order_execution_us_equities_v1_at] == order_execution_us_equities_v1_written.last_px[order_execution_us_equities_v1_at]); order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 4 -> assert(order_execution_us_equities_v1_read.leaves_qty[order_execution_us_equities_v1_at] == order_execution_us_equities_v1_written.leaves_qty[order_execution_us_equities_v1_at]); order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_execution_us_equities_v1_read.base_liquidity_indicator == order_execution_us_equities_v1_written.base_liquidity_indicator);
  assert(order_execution_us_equities_v1_read.sub_liquidity_indicator == order_execution_us_equities_v1_written.sub_liquidity_indicator);
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 4 -> assert(order_execution_us_equities_v1_read.contra_broker[order_execution_us_equities_v1_at] == order_execution_us_equities_v1_written.contra_broker[order_execution_us_equities_v1_at]); order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(order_execution_us_equities_v1_read.side == order_execution_us_equities_v1_written.side);
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 8 -> assert(order_execution_us_equities_v1_read.symbol[order_execution_us_equities_v1_at] == order_execution_us_equities_v1_written.symbol[order_execution_us_equities_v1_at]); order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 2 -> assert(order_execution_us_equities_v1_read.fee_code[order_execution_us_equities_v1_at] == order_execution_us_equities_v1_written.fee_code[order_execution_us_equities_v1_at]); order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  order_execution_us_equities_v1_at = 0;
  do
  :: order_execution_us_equities_v1_at < 8 -> assert(order_execution_us_equities_v1_read.access_fee[order_execution_us_equities_v1_at] == order_execution_us_equities_v1_written.access_fee[order_execution_us_equities_v1_at]); order_execution_us_equities_v1_at = order_execution_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Cancel Correct Us Equities V 1: 94 bytes -------------------------- */

/* Used to relay a trade which has been cancelled (busted) or corrected (price change only) */
typedef TradeCancelCorrectUsEquitiesV1 {
  byte in_flight[2];
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte order_id[8];
  byte exec_ref_id[8];
  byte side;
  byte base_liquidity_indicator;
  byte sub_liquidity_indicator;
  byte clearing_firm[4];
  byte clearing_account[4];
  byte last_shares[4];
  byte last_px[8];
  byte corrected_price[8];
  byte orig_time[8];
  byte symbol[8];
  byte capacity
};

int trade_cancel_correct_us_equities_v1_at;

/* every byte of Trade Cancel Correct Us Equities V 1 set to one value */
inline fill_trade_cancel_correct_us_equities_v1(trade_cancel_correct_us_equities_v1_record, trade_cancel_correct_us_equities_v1_value) {
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 2 -> trade_cancel_correct_us_equities_v1_record.in_flight[trade_cancel_correct_us_equities_v1_at] = trade_cancel_correct_us_equities_v1_value; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> trade_cancel_correct_us_equities_v1_record.transaction_time[trade_cancel_correct_us_equities_v1_at] = trade_cancel_correct_us_equities_v1_value; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 20 -> trade_cancel_correct_us_equities_v1_record.cl_ord_id[trade_cancel_correct_us_equities_v1_at] = trade_cancel_correct_us_equities_v1_value; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> trade_cancel_correct_us_equities_v1_record.order_id[trade_cancel_correct_us_equities_v1_at] = trade_cancel_correct_us_equities_v1_value; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> trade_cancel_correct_us_equities_v1_record.exec_ref_id[trade_cancel_correct_us_equities_v1_at] = trade_cancel_correct_us_equities_v1_value; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_record.side = trade_cancel_correct_us_equities_v1_value;
  trade_cancel_correct_us_equities_v1_record.base_liquidity_indicator = trade_cancel_correct_us_equities_v1_value;
  trade_cancel_correct_us_equities_v1_record.sub_liquidity_indicator = trade_cancel_correct_us_equities_v1_value;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 4 -> trade_cancel_correct_us_equities_v1_record.clearing_firm[trade_cancel_correct_us_equities_v1_at] = trade_cancel_correct_us_equities_v1_value; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 4 -> trade_cancel_correct_us_equities_v1_record.clearing_account[trade_cancel_correct_us_equities_v1_at] = trade_cancel_correct_us_equities_v1_value; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 4 -> trade_cancel_correct_us_equities_v1_record.last_shares[trade_cancel_correct_us_equities_v1_at] = trade_cancel_correct_us_equities_v1_value; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> trade_cancel_correct_us_equities_v1_record.last_px[trade_cancel_correct_us_equities_v1_at] = trade_cancel_correct_us_equities_v1_value; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> trade_cancel_correct_us_equities_v1_record.corrected_price[trade_cancel_correct_us_equities_v1_at] = trade_cancel_correct_us_equities_v1_value; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> trade_cancel_correct_us_equities_v1_record.orig_time[trade_cancel_correct_us_equities_v1_at] = trade_cancel_correct_us_equities_v1_value; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> trade_cancel_correct_us_equities_v1_record.symbol[trade_cancel_correct_us_equities_v1_at] = trade_cancel_correct_us_equities_v1_value; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_record.capacity = trade_cancel_correct_us_equities_v1_value;
  skip
}

/* each byte of Trade Cancel Correct Us Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_trade_cancel_correct_us_equities_v1(trade_cancel_correct_us_equities_v1_record, trade_cancel_correct_us_equities_v1_base) {
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 2 -> trade_cancel_correct_us_equities_v1_record.in_flight[trade_cancel_correct_us_equities_v1_at] = (trade_cancel_correct_us_equities_v1_base + 0 + trade_cancel_correct_us_equities_v1_at + 1) % 256; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> trade_cancel_correct_us_equities_v1_record.transaction_time[trade_cancel_correct_us_equities_v1_at] = (trade_cancel_correct_us_equities_v1_base + 2 + trade_cancel_correct_us_equities_v1_at + 1) % 256; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 20 -> trade_cancel_correct_us_equities_v1_record.cl_ord_id[trade_cancel_correct_us_equities_v1_at] = (trade_cancel_correct_us_equities_v1_base + 10 + trade_cancel_correct_us_equities_v1_at + 1) % 256; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> trade_cancel_correct_us_equities_v1_record.order_id[trade_cancel_correct_us_equities_v1_at] = (trade_cancel_correct_us_equities_v1_base + 30 + trade_cancel_correct_us_equities_v1_at + 1) % 256; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> trade_cancel_correct_us_equities_v1_record.exec_ref_id[trade_cancel_correct_us_equities_v1_at] = (trade_cancel_correct_us_equities_v1_base + 38 + trade_cancel_correct_us_equities_v1_at + 1) % 256; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_record.side = (trade_cancel_correct_us_equities_v1_base + 46 + 1) % 256;
  trade_cancel_correct_us_equities_v1_record.base_liquidity_indicator = (trade_cancel_correct_us_equities_v1_base + 47 + 1) % 256;
  trade_cancel_correct_us_equities_v1_record.sub_liquidity_indicator = (trade_cancel_correct_us_equities_v1_base + 48 + 1) % 256;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 4 -> trade_cancel_correct_us_equities_v1_record.clearing_firm[trade_cancel_correct_us_equities_v1_at] = (trade_cancel_correct_us_equities_v1_base + 49 + trade_cancel_correct_us_equities_v1_at + 1) % 256; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 4 -> trade_cancel_correct_us_equities_v1_record.clearing_account[trade_cancel_correct_us_equities_v1_at] = (trade_cancel_correct_us_equities_v1_base + 53 + trade_cancel_correct_us_equities_v1_at + 1) % 256; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 4 -> trade_cancel_correct_us_equities_v1_record.last_shares[trade_cancel_correct_us_equities_v1_at] = (trade_cancel_correct_us_equities_v1_base + 57 + trade_cancel_correct_us_equities_v1_at + 1) % 256; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> trade_cancel_correct_us_equities_v1_record.last_px[trade_cancel_correct_us_equities_v1_at] = (trade_cancel_correct_us_equities_v1_base + 61 + trade_cancel_correct_us_equities_v1_at + 1) % 256; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> trade_cancel_correct_us_equities_v1_record.corrected_price[trade_cancel_correct_us_equities_v1_at] = (trade_cancel_correct_us_equities_v1_base + 69 + trade_cancel_correct_us_equities_v1_at + 1) % 256; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> trade_cancel_correct_us_equities_v1_record.orig_time[trade_cancel_correct_us_equities_v1_at] = (trade_cancel_correct_us_equities_v1_base + 77 + trade_cancel_correct_us_equities_v1_at + 1) % 256; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> trade_cancel_correct_us_equities_v1_record.symbol[trade_cancel_correct_us_equities_v1_at] = (trade_cancel_correct_us_equities_v1_base + 85 + trade_cancel_correct_us_equities_v1_at + 1) % 256; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_record.capacity = (trade_cancel_correct_us_equities_v1_base + 93 + 1) % 256;
  skip
}

/* Trade Cancel Correct Us Equities V 1 to the wire, 94 bytes from where the cursor stands */
inline encode_trade_cancel_correct_us_equities_v1(trade_cancel_correct_us_equities_v1_record) {
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 2 -> wire[at] = trade_cancel_correct_us_equities_v1_record.in_flight[trade_cancel_correct_us_equities_v1_at]; at = at + 1; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> wire[at] = trade_cancel_correct_us_equities_v1_record.transaction_time[trade_cancel_correct_us_equities_v1_at]; at = at + 1; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 20 -> wire[at] = trade_cancel_correct_us_equities_v1_record.cl_ord_id[trade_cancel_correct_us_equities_v1_at]; at = at + 1; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> wire[at] = trade_cancel_correct_us_equities_v1_record.order_id[trade_cancel_correct_us_equities_v1_at]; at = at + 1; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> wire[at] = trade_cancel_correct_us_equities_v1_record.exec_ref_id[trade_cancel_correct_us_equities_v1_at]; at = at + 1; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_correct_us_equities_v1_record.side; at = at + 1;
  wire[at] = trade_cancel_correct_us_equities_v1_record.base_liquidity_indicator; at = at + 1;
  wire[at] = trade_cancel_correct_us_equities_v1_record.sub_liquidity_indicator; at = at + 1;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 4 -> wire[at] = trade_cancel_correct_us_equities_v1_record.clearing_firm[trade_cancel_correct_us_equities_v1_at]; at = at + 1; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 4 -> wire[at] = trade_cancel_correct_us_equities_v1_record.clearing_account[trade_cancel_correct_us_equities_v1_at]; at = at + 1; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 4 -> wire[at] = trade_cancel_correct_us_equities_v1_record.last_shares[trade_cancel_correct_us_equities_v1_at]; at = at + 1; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> wire[at] = trade_cancel_correct_us_equities_v1_record.last_px[trade_cancel_correct_us_equities_v1_at]; at = at + 1; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> wire[at] = trade_cancel_correct_us_equities_v1_record.corrected_price[trade_cancel_correct_us_equities_v1_at]; at = at + 1; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> wire[at] = trade_cancel_correct_us_equities_v1_record.orig_time[trade_cancel_correct_us_equities_v1_at]; at = at + 1; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> wire[at] = trade_cancel_correct_us_equities_v1_record.symbol[trade_cancel_correct_us_equities_v1_at]; at = at + 1; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_correct_us_equities_v1_record.capacity; at = at + 1;
  skip
}

/* Trade Cancel Correct Us Equities V 1 off the wire, 94 bytes from where the cursor stands */
inline decode_trade_cancel_correct_us_equities_v1(trade_cancel_correct_us_equities_v1_record) {
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 2 -> trade_cancel_correct_us_equities_v1_record.in_flight[trade_cancel_correct_us_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> trade_cancel_correct_us_equities_v1_record.transaction_time[trade_cancel_correct_us_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 20 -> trade_cancel_correct_us_equities_v1_record.cl_ord_id[trade_cancel_correct_us_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> trade_cancel_correct_us_equities_v1_record.order_id[trade_cancel_correct_us_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> trade_cancel_correct_us_equities_v1_record.exec_ref_id[trade_cancel_correct_us_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_record.side = wire[at]; at = at + 1;
  trade_cancel_correct_us_equities_v1_record.base_liquidity_indicator = wire[at]; at = at + 1;
  trade_cancel_correct_us_equities_v1_record.sub_liquidity_indicator = wire[at]; at = at + 1;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 4 -> trade_cancel_correct_us_equities_v1_record.clearing_firm[trade_cancel_correct_us_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 4 -> trade_cancel_correct_us_equities_v1_record.clearing_account[trade_cancel_correct_us_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 4 -> trade_cancel_correct_us_equities_v1_record.last_shares[trade_cancel_correct_us_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> trade_cancel_correct_us_equities_v1_record.last_px[trade_cancel_correct_us_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> trade_cancel_correct_us_equities_v1_record.corrected_price[trade_cancel_correct_us_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> trade_cancel_correct_us_equities_v1_record.orig_time[trade_cancel_correct_us_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> trade_cancel_correct_us_equities_v1_record.symbol[trade_cancel_correct_us_equities_v1_at] = wire[at]; at = at + 1; trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_record.capacity = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Cancel Correct Us Equities V 1 is what was written, byte for byte */
inline equal_trade_cancel_correct_us_equities_v1(trade_cancel_correct_us_equities_v1_read, trade_cancel_correct_us_equities_v1_written) {
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 2 -> assert(trade_cancel_correct_us_equities_v1_read.in_flight[trade_cancel_correct_us_equities_v1_at] == trade_cancel_correct_us_equities_v1_written.in_flight[trade_cancel_correct_us_equities_v1_at]); trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> assert(trade_cancel_correct_us_equities_v1_read.transaction_time[trade_cancel_correct_us_equities_v1_at] == trade_cancel_correct_us_equities_v1_written.transaction_time[trade_cancel_correct_us_equities_v1_at]); trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 20 -> assert(trade_cancel_correct_us_equities_v1_read.cl_ord_id[trade_cancel_correct_us_equities_v1_at] == trade_cancel_correct_us_equities_v1_written.cl_ord_id[trade_cancel_correct_us_equities_v1_at]); trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> assert(trade_cancel_correct_us_equities_v1_read.order_id[trade_cancel_correct_us_equities_v1_at] == trade_cancel_correct_us_equities_v1_written.order_id[trade_cancel_correct_us_equities_v1_at]); trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> assert(trade_cancel_correct_us_equities_v1_read.exec_ref_id[trade_cancel_correct_us_equities_v1_at] == trade_cancel_correct_us_equities_v1_written.exec_ref_id[trade_cancel_correct_us_equities_v1_at]); trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(trade_cancel_correct_us_equities_v1_read.side == trade_cancel_correct_us_equities_v1_written.side);
  assert(trade_cancel_correct_us_equities_v1_read.base_liquidity_indicator == trade_cancel_correct_us_equities_v1_written.base_liquidity_indicator);
  assert(trade_cancel_correct_us_equities_v1_read.sub_liquidity_indicator == trade_cancel_correct_us_equities_v1_written.sub_liquidity_indicator);
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 4 -> assert(trade_cancel_correct_us_equities_v1_read.clearing_firm[trade_cancel_correct_us_equities_v1_at] == trade_cancel_correct_us_equities_v1_written.clearing_firm[trade_cancel_correct_us_equities_v1_at]); trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 4 -> assert(trade_cancel_correct_us_equities_v1_read.clearing_account[trade_cancel_correct_us_equities_v1_at] == trade_cancel_correct_us_equities_v1_written.clearing_account[trade_cancel_correct_us_equities_v1_at]); trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 4 -> assert(trade_cancel_correct_us_equities_v1_read.last_shares[trade_cancel_correct_us_equities_v1_at] == trade_cancel_correct_us_equities_v1_written.last_shares[trade_cancel_correct_us_equities_v1_at]); trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> assert(trade_cancel_correct_us_equities_v1_read.last_px[trade_cancel_correct_us_equities_v1_at] == trade_cancel_correct_us_equities_v1_written.last_px[trade_cancel_correct_us_equities_v1_at]); trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> assert(trade_cancel_correct_us_equities_v1_read.corrected_price[trade_cancel_correct_us_equities_v1_at] == trade_cancel_correct_us_equities_v1_written.corrected_price[trade_cancel_correct_us_equities_v1_at]); trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> assert(trade_cancel_correct_us_equities_v1_read.orig_time[trade_cancel_correct_us_equities_v1_at] == trade_cancel_correct_us_equities_v1_written.orig_time[trade_cancel_correct_us_equities_v1_at]); trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  trade_cancel_correct_us_equities_v1_at = 0;
  do
  :: trade_cancel_correct_us_equities_v1_at < 8 -> assert(trade_cancel_correct_us_equities_v1_read.symbol[trade_cancel_correct_us_equities_v1_at] == trade_cancel_correct_us_equities_v1_written.symbol[trade_cancel_correct_us_equities_v1_at]); trade_cancel_correct_us_equities_v1_at = trade_cancel_correct_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(trade_cancel_correct_us_equities_v1_read.capacity == trade_cancel_correct_us_equities_v1_written.capacity);
  skip
}

/* ---- Purge Rejected Us Equities V 1: 91 bytes -------------------------------- */

/* A Purge Rejected message is sent in response to a Purge Orders message to indicate that the mass cancellation cannot occur */
typedef PurgeRejectedUsEquitiesV1 {
  byte in_flight[2];
  byte transaction_time[8];
  byte mass_cancel_id[20];
  byte purge_reject_reason;
  byte text[60]
};

int purge_rejected_us_equities_v1_at;

/* every byte of Purge Rejected Us Equities V 1 set to one value */
inline fill_purge_rejected_us_equities_v1(purge_rejected_us_equities_v1_record, purge_rejected_us_equities_v1_value) {
  purge_rejected_us_equities_v1_at = 0;
  do
  :: purge_rejected_us_equities_v1_at < 2 -> purge_rejected_us_equities_v1_record.in_flight[purge_rejected_us_equities_v1_at] = purge_rejected_us_equities_v1_value; purge_rejected_us_equities_v1_at = purge_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_us_equities_v1_at = 0;
  do
  :: purge_rejected_us_equities_v1_at < 8 -> purge_rejected_us_equities_v1_record.transaction_time[purge_rejected_us_equities_v1_at] = purge_rejected_us_equities_v1_value; purge_rejected_us_equities_v1_at = purge_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_us_equities_v1_at = 0;
  do
  :: purge_rejected_us_equities_v1_at < 20 -> purge_rejected_us_equities_v1_record.mass_cancel_id[purge_rejected_us_equities_v1_at] = purge_rejected_us_equities_v1_value; purge_rejected_us_equities_v1_at = purge_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_us_equities_v1_record.purge_reject_reason = purge_rejected_us_equities_v1_value;
  purge_rejected_us_equities_v1_at = 0;
  do
  :: purge_rejected_us_equities_v1_at < 60 -> purge_rejected_us_equities_v1_record.text[purge_rejected_us_equities_v1_at] = purge_rejected_us_equities_v1_value; purge_rejected_us_equities_v1_at = purge_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Purge Rejected Us Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_purge_rejected_us_equities_v1(purge_rejected_us_equities_v1_record, purge_rejected_us_equities_v1_base) {
  purge_rejected_us_equities_v1_at = 0;
  do
  :: purge_rejected_us_equities_v1_at < 2 -> purge_rejected_us_equities_v1_record.in_flight[purge_rejected_us_equities_v1_at] = (purge_rejected_us_equities_v1_base + 0 + purge_rejected_us_equities_v1_at + 1) % 256; purge_rejected_us_equities_v1_at = purge_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_us_equities_v1_at = 0;
  do
  :: purge_rejected_us_equities_v1_at < 8 -> purge_rejected_us_equities_v1_record.transaction_time[purge_rejected_us_equities_v1_at] = (purge_rejected_us_equities_v1_base + 2 + purge_rejected_us_equities_v1_at + 1) % 256; purge_rejected_us_equities_v1_at = purge_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_us_equities_v1_at = 0;
  do
  :: purge_rejected_us_equities_v1_at < 20 -> purge_rejected_us_equities_v1_record.mass_cancel_id[purge_rejected_us_equities_v1_at] = (purge_rejected_us_equities_v1_base + 10 + purge_rejected_us_equities_v1_at + 1) % 256; purge_rejected_us_equities_v1_at = purge_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_us_equities_v1_record.purge_reject_reason = (purge_rejected_us_equities_v1_base + 30 + 1) % 256;
  purge_rejected_us_equities_v1_at = 0;
  do
  :: purge_rejected_us_equities_v1_at < 60 -> purge_rejected_us_equities_v1_record.text[purge_rejected_us_equities_v1_at] = (purge_rejected_us_equities_v1_base + 31 + purge_rejected_us_equities_v1_at + 1) % 256; purge_rejected_us_equities_v1_at = purge_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Purge Rejected Us Equities V 1 to the wire, 91 bytes from where the cursor stands */
inline encode_purge_rejected_us_equities_v1(purge_rejected_us_equities_v1_record) {
  purge_rejected_us_equities_v1_at = 0;
  do
  :: purge_rejected_us_equities_v1_at < 2 -> wire[at] = purge_rejected_us_equities_v1_record.in_flight[purge_rejected_us_equities_v1_at]; at = at + 1; purge_rejected_us_equities_v1_at = purge_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_us_equities_v1_at = 0;
  do
  :: purge_rejected_us_equities_v1_at < 8 -> wire[at] = purge_rejected_us_equities_v1_record.transaction_time[purge_rejected_us_equities_v1_at]; at = at + 1; purge_rejected_us_equities_v1_at = purge_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_us_equities_v1_at = 0;
  do
  :: purge_rejected_us_equities_v1_at < 20 -> wire[at] = purge_rejected_us_equities_v1_record.mass_cancel_id[purge_rejected_us_equities_v1_at]; at = at + 1; purge_rejected_us_equities_v1_at = purge_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = purge_rejected_us_equities_v1_record.purge_reject_reason; at = at + 1;
  purge_rejected_us_equities_v1_at = 0;
  do
  :: purge_rejected_us_equities_v1_at < 60 -> wire[at] = purge_rejected_us_equities_v1_record.text[purge_rejected_us_equities_v1_at]; at = at + 1; purge_rejected_us_equities_v1_at = purge_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Purge Rejected Us Equities V 1 off the wire, 91 bytes from where the cursor stands */
inline decode_purge_rejected_us_equities_v1(purge_rejected_us_equities_v1_record) {
  purge_rejected_us_equities_v1_at = 0;
  do
  :: purge_rejected_us_equities_v1_at < 2 -> purge_rejected_us_equities_v1_record.in_flight[purge_rejected_us_equities_v1_at] = wire[at]; at = at + 1; purge_rejected_us_equities_v1_at = purge_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_us_equities_v1_at = 0;
  do
  :: purge_rejected_us_equities_v1_at < 8 -> purge_rejected_us_equities_v1_record.transaction_time[purge_rejected_us_equities_v1_at] = wire[at]; at = at + 1; purge_rejected_us_equities_v1_at = purge_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_us_equities_v1_at = 0;
  do
  :: purge_rejected_us_equities_v1_at < 20 -> purge_rejected_us_equities_v1_record.mass_cancel_id[purge_rejected_us_equities_v1_at] = wire[at]; at = at + 1; purge_rejected_us_equities_v1_at = purge_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_us_equities_v1_record.purge_reject_reason = wire[at]; at = at + 1;
  purge_rejected_us_equities_v1_at = 0;
  do
  :: purge_rejected_us_equities_v1_at < 60 -> purge_rejected_us_equities_v1_record.text[purge_rejected_us_equities_v1_at] = wire[at]; at = at + 1; purge_rejected_us_equities_v1_at = purge_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Purge Rejected Us Equities V 1 is what was written, byte for byte */
inline equal_purge_rejected_us_equities_v1(purge_rejected_us_equities_v1_read, purge_rejected_us_equities_v1_written) {
  purge_rejected_us_equities_v1_at = 0;
  do
  :: purge_rejected_us_equities_v1_at < 2 -> assert(purge_rejected_us_equities_v1_read.in_flight[purge_rejected_us_equities_v1_at] == purge_rejected_us_equities_v1_written.in_flight[purge_rejected_us_equities_v1_at]); purge_rejected_us_equities_v1_at = purge_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_us_equities_v1_at = 0;
  do
  :: purge_rejected_us_equities_v1_at < 8 -> assert(purge_rejected_us_equities_v1_read.transaction_time[purge_rejected_us_equities_v1_at] == purge_rejected_us_equities_v1_written.transaction_time[purge_rejected_us_equities_v1_at]); purge_rejected_us_equities_v1_at = purge_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_rejected_us_equities_v1_at = 0;
  do
  :: purge_rejected_us_equities_v1_at < 20 -> assert(purge_rejected_us_equities_v1_read.mass_cancel_id[purge_rejected_us_equities_v1_at] == purge_rejected_us_equities_v1_written.mass_cancel_id[purge_rejected_us_equities_v1_at]); purge_rejected_us_equities_v1_at = purge_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(purge_rejected_us_equities_v1_read.purge_reject_reason == purge_rejected_us_equities_v1_written.purge_reject_reason);
  purge_rejected_us_equities_v1_at = 0;
  do
  :: purge_rejected_us_equities_v1_at < 60 -> assert(purge_rejected_us_equities_v1_read.text[purge_rejected_us_equities_v1_at] == purge_rejected_us_equities_v1_written.text[purge_rejected_us_equities_v1_at]); purge_rejected_us_equities_v1_at = purge_rejected_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reset Risk Acknowledgement Us Equities V 1: 19 bytes -------------------- */

/* Response to a Reset Risk message request */
typedef ResetRiskAcknowledgementUsEquitiesV1 {
  byte in_flight[2];
  byte risk_status_id[16];
  byte risk_reset_result
};

int reset_risk_acknowledgement_us_equities_v1_at;

/* every byte of Reset Risk Acknowledgement Us Equities V 1 set to one value */
inline fill_reset_risk_acknowledgement_us_equities_v1(reset_risk_acknowledgement_us_equities_v1_record, reset_risk_acknowledgement_us_equities_v1_value) {
  reset_risk_acknowledgement_us_equities_v1_at = 0;
  do
  :: reset_risk_acknowledgement_us_equities_v1_at < 2 -> reset_risk_acknowledgement_us_equities_v1_record.in_flight[reset_risk_acknowledgement_us_equities_v1_at] = reset_risk_acknowledgement_us_equities_v1_value; reset_risk_acknowledgement_us_equities_v1_at = reset_risk_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  reset_risk_acknowledgement_us_equities_v1_at = 0;
  do
  :: reset_risk_acknowledgement_us_equities_v1_at < 16 -> reset_risk_acknowledgement_us_equities_v1_record.risk_status_id[reset_risk_acknowledgement_us_equities_v1_at] = reset_risk_acknowledgement_us_equities_v1_value; reset_risk_acknowledgement_us_equities_v1_at = reset_risk_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  reset_risk_acknowledgement_us_equities_v1_record.risk_reset_result = reset_risk_acknowledgement_us_equities_v1_value;
  skip
}

/* each byte of Reset Risk Acknowledgement Us Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_reset_risk_acknowledgement_us_equities_v1(reset_risk_acknowledgement_us_equities_v1_record, reset_risk_acknowledgement_us_equities_v1_base) {
  reset_risk_acknowledgement_us_equities_v1_at = 0;
  do
  :: reset_risk_acknowledgement_us_equities_v1_at < 2 -> reset_risk_acknowledgement_us_equities_v1_record.in_flight[reset_risk_acknowledgement_us_equities_v1_at] = (reset_risk_acknowledgement_us_equities_v1_base + 0 + reset_risk_acknowledgement_us_equities_v1_at + 1) % 256; reset_risk_acknowledgement_us_equities_v1_at = reset_risk_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  reset_risk_acknowledgement_us_equities_v1_at = 0;
  do
  :: reset_risk_acknowledgement_us_equities_v1_at < 16 -> reset_risk_acknowledgement_us_equities_v1_record.risk_status_id[reset_risk_acknowledgement_us_equities_v1_at] = (reset_risk_acknowledgement_us_equities_v1_base + 2 + reset_risk_acknowledgement_us_equities_v1_at + 1) % 256; reset_risk_acknowledgement_us_equities_v1_at = reset_risk_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  reset_risk_acknowledgement_us_equities_v1_record.risk_reset_result = (reset_risk_acknowledgement_us_equities_v1_base + 18 + 1) % 256;
  skip
}

/* Reset Risk Acknowledgement Us Equities V 1 to the wire, 19 bytes from where the cursor stands */
inline encode_reset_risk_acknowledgement_us_equities_v1(reset_risk_acknowledgement_us_equities_v1_record) {
  reset_risk_acknowledgement_us_equities_v1_at = 0;
  do
  :: reset_risk_acknowledgement_us_equities_v1_at < 2 -> wire[at] = reset_risk_acknowledgement_us_equities_v1_record.in_flight[reset_risk_acknowledgement_us_equities_v1_at]; at = at + 1; reset_risk_acknowledgement_us_equities_v1_at = reset_risk_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  reset_risk_acknowledgement_us_equities_v1_at = 0;
  do
  :: reset_risk_acknowledgement_us_equities_v1_at < 16 -> wire[at] = reset_risk_acknowledgement_us_equities_v1_record.risk_status_id[reset_risk_acknowledgement_us_equities_v1_at]; at = at + 1; reset_risk_acknowledgement_us_equities_v1_at = reset_risk_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = reset_risk_acknowledgement_us_equities_v1_record.risk_reset_result; at = at + 1;
  skip
}

/* Reset Risk Acknowledgement Us Equities V 1 off the wire, 19 bytes from where the cursor stands */
inline decode_reset_risk_acknowledgement_us_equities_v1(reset_risk_acknowledgement_us_equities_v1_record) {
  reset_risk_acknowledgement_us_equities_v1_at = 0;
  do
  :: reset_risk_acknowledgement_us_equities_v1_at < 2 -> reset_risk_acknowledgement_us_equities_v1_record.in_flight[reset_risk_acknowledgement_us_equities_v1_at] = wire[at]; at = at + 1; reset_risk_acknowledgement_us_equities_v1_at = reset_risk_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  reset_risk_acknowledgement_us_equities_v1_at = 0;
  do
  :: reset_risk_acknowledgement_us_equities_v1_at < 16 -> reset_risk_acknowledgement_us_equities_v1_record.risk_status_id[reset_risk_acknowledgement_us_equities_v1_at] = wire[at]; at = at + 1; reset_risk_acknowledgement_us_equities_v1_at = reset_risk_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  reset_risk_acknowledgement_us_equities_v1_record.risk_reset_result = wire[at]; at = at + 1;
  skip
}

/* what was read of Reset Risk Acknowledgement Us Equities V 1 is what was written, byte for byte */
inline equal_reset_risk_acknowledgement_us_equities_v1(reset_risk_acknowledgement_us_equities_v1_read, reset_risk_acknowledgement_us_equities_v1_written) {
  reset_risk_acknowledgement_us_equities_v1_at = 0;
  do
  :: reset_risk_acknowledgement_us_equities_v1_at < 2 -> assert(reset_risk_acknowledgement_us_equities_v1_read.in_flight[reset_risk_acknowledgement_us_equities_v1_at] == reset_risk_acknowledgement_us_equities_v1_written.in_flight[reset_risk_acknowledgement_us_equities_v1_at]); reset_risk_acknowledgement_us_equities_v1_at = reset_risk_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  reset_risk_acknowledgement_us_equities_v1_at = 0;
  do
  :: reset_risk_acknowledgement_us_equities_v1_at < 16 -> assert(reset_risk_acknowledgement_us_equities_v1_read.risk_status_id[reset_risk_acknowledgement_us_equities_v1_at] == reset_risk_acknowledgement_us_equities_v1_written.risk_status_id[reset_risk_acknowledgement_us_equities_v1_at]); reset_risk_acknowledgement_us_equities_v1_at = reset_risk_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(reset_risk_acknowledgement_us_equities_v1_read.risk_reset_result == reset_risk_acknowledgement_us_equities_v1_written.risk_reset_result);
  skip
}

/* ---- Purge Acknowledgement Us Equities V 1: 34 bytes ------------------------- */

/* A Purge Acknowledgment message is an unsequenced message sent when a Purge Orders message requesting an order purge has completed canceling all individual orders */
typedef PurgeAcknowledgementUsEquitiesV1 {
  byte in_flight[2];
  byte transaction_time[8];
  byte mass_cancel_id[20];
  byte cancelled_order_count[4]
};

int purge_acknowledgement_us_equities_v1_at;

/* every byte of Purge Acknowledgement Us Equities V 1 set to one value */
inline fill_purge_acknowledgement_us_equities_v1(purge_acknowledgement_us_equities_v1_record, purge_acknowledgement_us_equities_v1_value) {
  purge_acknowledgement_us_equities_v1_at = 0;
  do
  :: purge_acknowledgement_us_equities_v1_at < 2 -> purge_acknowledgement_us_equities_v1_record.in_flight[purge_acknowledgement_us_equities_v1_at] = purge_acknowledgement_us_equities_v1_value; purge_acknowledgement_us_equities_v1_at = purge_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_us_equities_v1_at = 0;
  do
  :: purge_acknowledgement_us_equities_v1_at < 8 -> purge_acknowledgement_us_equities_v1_record.transaction_time[purge_acknowledgement_us_equities_v1_at] = purge_acknowledgement_us_equities_v1_value; purge_acknowledgement_us_equities_v1_at = purge_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_us_equities_v1_at = 0;
  do
  :: purge_acknowledgement_us_equities_v1_at < 20 -> purge_acknowledgement_us_equities_v1_record.mass_cancel_id[purge_acknowledgement_us_equities_v1_at] = purge_acknowledgement_us_equities_v1_value; purge_acknowledgement_us_equities_v1_at = purge_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_us_equities_v1_at = 0;
  do
  :: purge_acknowledgement_us_equities_v1_at < 4 -> purge_acknowledgement_us_equities_v1_record.cancelled_order_count[purge_acknowledgement_us_equities_v1_at] = purge_acknowledgement_us_equities_v1_value; purge_acknowledgement_us_equities_v1_at = purge_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Purge Acknowledgement Us Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_purge_acknowledgement_us_equities_v1(purge_acknowledgement_us_equities_v1_record, purge_acknowledgement_us_equities_v1_base) {
  purge_acknowledgement_us_equities_v1_at = 0;
  do
  :: purge_acknowledgement_us_equities_v1_at < 2 -> purge_acknowledgement_us_equities_v1_record.in_flight[purge_acknowledgement_us_equities_v1_at] = (purge_acknowledgement_us_equities_v1_base + 0 + purge_acknowledgement_us_equities_v1_at + 1) % 256; purge_acknowledgement_us_equities_v1_at = purge_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_us_equities_v1_at = 0;
  do
  :: purge_acknowledgement_us_equities_v1_at < 8 -> purge_acknowledgement_us_equities_v1_record.transaction_time[purge_acknowledgement_us_equities_v1_at] = (purge_acknowledgement_us_equities_v1_base + 2 + purge_acknowledgement_us_equities_v1_at + 1) % 256; purge_acknowledgement_us_equities_v1_at = purge_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_us_equities_v1_at = 0;
  do
  :: purge_acknowledgement_us_equities_v1_at < 20 -> purge_acknowledgement_us_equities_v1_record.mass_cancel_id[purge_acknowledgement_us_equities_v1_at] = (purge_acknowledgement_us_equities_v1_base + 10 + purge_acknowledgement_us_equities_v1_at + 1) % 256; purge_acknowledgement_us_equities_v1_at = purge_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_us_equities_v1_at = 0;
  do
  :: purge_acknowledgement_us_equities_v1_at < 4 -> purge_acknowledgement_us_equities_v1_record.cancelled_order_count[purge_acknowledgement_us_equities_v1_at] = (purge_acknowledgement_us_equities_v1_base + 30 + purge_acknowledgement_us_equities_v1_at + 1) % 256; purge_acknowledgement_us_equities_v1_at = purge_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Purge Acknowledgement Us Equities V 1 to the wire, 34 bytes from where the cursor stands */
inline encode_purge_acknowledgement_us_equities_v1(purge_acknowledgement_us_equities_v1_record) {
  purge_acknowledgement_us_equities_v1_at = 0;
  do
  :: purge_acknowledgement_us_equities_v1_at < 2 -> wire[at] = purge_acknowledgement_us_equities_v1_record.in_flight[purge_acknowledgement_us_equities_v1_at]; at = at + 1; purge_acknowledgement_us_equities_v1_at = purge_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_us_equities_v1_at = 0;
  do
  :: purge_acknowledgement_us_equities_v1_at < 8 -> wire[at] = purge_acknowledgement_us_equities_v1_record.transaction_time[purge_acknowledgement_us_equities_v1_at]; at = at + 1; purge_acknowledgement_us_equities_v1_at = purge_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_us_equities_v1_at = 0;
  do
  :: purge_acknowledgement_us_equities_v1_at < 20 -> wire[at] = purge_acknowledgement_us_equities_v1_record.mass_cancel_id[purge_acknowledgement_us_equities_v1_at]; at = at + 1; purge_acknowledgement_us_equities_v1_at = purge_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_us_equities_v1_at = 0;
  do
  :: purge_acknowledgement_us_equities_v1_at < 4 -> wire[at] = purge_acknowledgement_us_equities_v1_record.cancelled_order_count[purge_acknowledgement_us_equities_v1_at]; at = at + 1; purge_acknowledgement_us_equities_v1_at = purge_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Purge Acknowledgement Us Equities V 1 off the wire, 34 bytes from where the cursor stands */
inline decode_purge_acknowledgement_us_equities_v1(purge_acknowledgement_us_equities_v1_record) {
  purge_acknowledgement_us_equities_v1_at = 0;
  do
  :: purge_acknowledgement_us_equities_v1_at < 2 -> purge_acknowledgement_us_equities_v1_record.in_flight[purge_acknowledgement_us_equities_v1_at] = wire[at]; at = at + 1; purge_acknowledgement_us_equities_v1_at = purge_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_us_equities_v1_at = 0;
  do
  :: purge_acknowledgement_us_equities_v1_at < 8 -> purge_acknowledgement_us_equities_v1_record.transaction_time[purge_acknowledgement_us_equities_v1_at] = wire[at]; at = at + 1; purge_acknowledgement_us_equities_v1_at = purge_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_us_equities_v1_at = 0;
  do
  :: purge_acknowledgement_us_equities_v1_at < 20 -> purge_acknowledgement_us_equities_v1_record.mass_cancel_id[purge_acknowledgement_us_equities_v1_at] = wire[at]; at = at + 1; purge_acknowledgement_us_equities_v1_at = purge_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_us_equities_v1_at = 0;
  do
  :: purge_acknowledgement_us_equities_v1_at < 4 -> purge_acknowledgement_us_equities_v1_record.cancelled_order_count[purge_acknowledgement_us_equities_v1_at] = wire[at]; at = at + 1; purge_acknowledgement_us_equities_v1_at = purge_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Purge Acknowledgement Us Equities V 1 is what was written, byte for byte */
inline equal_purge_acknowledgement_us_equities_v1(purge_acknowledgement_us_equities_v1_read, purge_acknowledgement_us_equities_v1_written) {
  purge_acknowledgement_us_equities_v1_at = 0;
  do
  :: purge_acknowledgement_us_equities_v1_at < 2 -> assert(purge_acknowledgement_us_equities_v1_read.in_flight[purge_acknowledgement_us_equities_v1_at] == purge_acknowledgement_us_equities_v1_written.in_flight[purge_acknowledgement_us_equities_v1_at]); purge_acknowledgement_us_equities_v1_at = purge_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_us_equities_v1_at = 0;
  do
  :: purge_acknowledgement_us_equities_v1_at < 8 -> assert(purge_acknowledgement_us_equities_v1_read.transaction_time[purge_acknowledgement_us_equities_v1_at] == purge_acknowledgement_us_equities_v1_written.transaction_time[purge_acknowledgement_us_equities_v1_at]); purge_acknowledgement_us_equities_v1_at = purge_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_us_equities_v1_at = 0;
  do
  :: purge_acknowledgement_us_equities_v1_at < 20 -> assert(purge_acknowledgement_us_equities_v1_read.mass_cancel_id[purge_acknowledgement_us_equities_v1_at] == purge_acknowledgement_us_equities_v1_written.mass_cancel_id[purge_acknowledgement_us_equities_v1_at]); purge_acknowledgement_us_equities_v1_at = purge_acknowledgement_us_equities_v1_at + 1
  :: else -> break
  od;
  purge_acknowledgement_us_equities_v1_at = 0;
  do
  :: purge_acknowledgement_us_equities_v1_at < 4 -> assert(purge_acknowledgement_us_equities_v1_read.cancelled_order_count[purge_acknowledgement_us_equities_v1_at] == purge_acknowledgement_us_equities_v1_written.cancelled_order_count[purge_acknowledgement_us_equities_v1_at]); purge_acknowledgement_us_equities_v1_at = purge_acknowledgement_us_equities_v1_at + 1
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

/* Order Acknowledgement Us Equities V 1: encoded, read back, and compared */
proctype check_order_acknowledgement_us_equities_v1() {
  OrderAcknowledgementUsEquitiesV1 order_acknowledgement_us_equities_v1_sent;
  OrderAcknowledgementUsEquitiesV1 order_acknowledgement_us_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_acknowledgement_us_equities_v1(order_acknowledgement_us_equities_v1_sent, 0)
  :: pattern == 1 -> fill_order_acknowledgement_us_equities_v1(order_acknowledgement_us_equities_v1_sent, 32)
  :: pattern == 2 -> fill_order_acknowledgement_us_equities_v1(order_acknowledgement_us_equities_v1_sent, 255)
  :: else -> ramp_order_acknowledgement_us_equities_v1(order_acknowledgement_us_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_acknowledgement_us_equities_v1(order_acknowledgement_us_equities_v1_sent);
    assert(at == 82);
    at = 0;
    decode_order_acknowledgement_us_equities_v1(order_acknowledgement_us_equities_v1_got);
    assert(at == 82);
    equal_order_acknowledgement_us_equities_v1(order_acknowledgement_us_equities_v1_got, order_acknowledgement_us_equities_v1_sent)
  }
}

/* Order Rejected Us Equities V 1: encoded, read back, and compared */
proctype check_order_rejected_us_equities_v1() {
  OrderRejectedUsEquitiesV1 order_rejected_us_equities_v1_sent;
  OrderRejectedUsEquitiesV1 order_rejected_us_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_rejected_us_equities_v1(order_rejected_us_equities_v1_sent, 0)
  :: pattern == 1 -> fill_order_rejected_us_equities_v1(order_rejected_us_equities_v1_sent, 32)
  :: pattern == 2 -> fill_order_rejected_us_equities_v1(order_rejected_us_equities_v1_sent, 255)
  :: else -> ramp_order_rejected_us_equities_v1(order_rejected_us_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_rejected_us_equities_v1(order_rejected_us_equities_v1_sent);
    assert(at == 95);
    at = 0;
    decode_order_rejected_us_equities_v1(order_rejected_us_equities_v1_got);
    assert(at == 95);
    equal_order_rejected_us_equities_v1(order_rejected_us_equities_v1_got, order_rejected_us_equities_v1_sent)
  }
}

/* Order Modified Us Equities V 1: encoded, read back, and compared */
proctype check_order_modified_us_equities_v1() {
  OrderModifiedUsEquitiesV1 order_modified_us_equities_v1_sent;
  OrderModifiedUsEquitiesV1 order_modified_us_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_modified_us_equities_v1(order_modified_us_equities_v1_sent, 0)
  :: pattern == 1 -> fill_order_modified_us_equities_v1(order_modified_us_equities_v1_sent, 32)
  :: pattern == 2 -> fill_order_modified_us_equities_v1(order_modified_us_equities_v1_sent, 255)
  :: else -> ramp_order_modified_us_equities_v1(order_modified_us_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_modified_us_equities_v1(order_modified_us_equities_v1_sent);
    assert(at == 125);
    at = 0;
    decode_order_modified_us_equities_v1(order_modified_us_equities_v1_got);
    assert(at == 125);
    equal_order_modified_us_equities_v1(order_modified_us_equities_v1_got, order_modified_us_equities_v1_sent)
  }
}

/* Order Restated Us Equities V 1: encoded, read back, and compared */
proctype check_order_restated_us_equities_v1() {
  OrderRestatedUsEquitiesV1 order_restated_us_equities_v1_sent;
  OrderRestatedUsEquitiesV1 order_restated_us_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_restated_us_equities_v1(order_restated_us_equities_v1_sent, 0)
  :: pattern == 1 -> fill_order_restated_us_equities_v1(order_restated_us_equities_v1_sent, 32)
  :: pattern == 2 -> fill_order_restated_us_equities_v1(order_restated_us_equities_v1_sent, 255)
  :: else -> ramp_order_restated_us_equities_v1(order_restated_us_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_restated_us_equities_v1(order_restated_us_equities_v1_sent);
    assert(at == 108);
    at = 0;
    decode_order_restated_us_equities_v1(order_restated_us_equities_v1_got);
    assert(at == 108);
    equal_order_restated_us_equities_v1(order_restated_us_equities_v1_got, order_restated_us_equities_v1_sent)
  }
}

/* Modify Rejected Us Equities V 1: encoded, read back, and compared */
proctype check_modify_rejected_us_equities_v1() {
  ModifyRejectedUsEquitiesV1 modify_rejected_us_equities_v1_sent;
  ModifyRejectedUsEquitiesV1 modify_rejected_us_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_rejected_us_equities_v1(modify_rejected_us_equities_v1_sent, 0)
  :: pattern == 1 -> fill_modify_rejected_us_equities_v1(modify_rejected_us_equities_v1_sent, 32)
  :: pattern == 2 -> fill_modify_rejected_us_equities_v1(modify_rejected_us_equities_v1_sent, 255)
  :: else -> ramp_modify_rejected_us_equities_v1(modify_rejected_us_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_rejected_us_equities_v1(modify_rejected_us_equities_v1_sent);
    assert(at == 115);
    at = 0;
    decode_modify_rejected_us_equities_v1(modify_rejected_us_equities_v1_got);
    assert(at == 115);
    equal_modify_rejected_us_equities_v1(modify_rejected_us_equities_v1_got, modify_rejected_us_equities_v1_sent)
  }
}

/* Order Cancelled Us Equities V 1: encoded, read back, and compared */
proctype check_order_cancelled_us_equities_v1() {
  OrderCancelledUsEquitiesV1 order_cancelled_us_equities_v1_sent;
  OrderCancelledUsEquitiesV1 order_cancelled_us_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancelled_us_equities_v1(order_cancelled_us_equities_v1_sent, 0)
  :: pattern == 1 -> fill_order_cancelled_us_equities_v1(order_cancelled_us_equities_v1_sent, 32)
  :: pattern == 2 -> fill_order_cancelled_us_equities_v1(order_cancelled_us_equities_v1_sent, 255)
  :: else -> ramp_order_cancelled_us_equities_v1(order_cancelled_us_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancelled_us_equities_v1(order_cancelled_us_equities_v1_sent);
    assert(at == 35);
    at = 0;
    decode_order_cancelled_us_equities_v1(order_cancelled_us_equities_v1_got);
    assert(at == 35);
    equal_order_cancelled_us_equities_v1(order_cancelled_us_equities_v1_got, order_cancelled_us_equities_v1_sent)
  }
}

/* Cancel Rejected Us Equities V 1: encoded, read back, and compared */
proctype check_cancel_rejected_us_equities_v1() {
  CancelRejectedUsEquitiesV1 cancel_rejected_us_equities_v1_sent;
  CancelRejectedUsEquitiesV1 cancel_rejected_us_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_rejected_us_equities_v1(cancel_rejected_us_equities_v1_sent, 0)
  :: pattern == 1 -> fill_cancel_rejected_us_equities_v1(cancel_rejected_us_equities_v1_sent, 32)
  :: pattern == 2 -> fill_cancel_rejected_us_equities_v1(cancel_rejected_us_equities_v1_sent, 255)
  :: else -> ramp_cancel_rejected_us_equities_v1(cancel_rejected_us_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_rejected_us_equities_v1(cancel_rejected_us_equities_v1_sent);
    assert(at == 95);
    at = 0;
    decode_cancel_rejected_us_equities_v1(cancel_rejected_us_equities_v1_got);
    assert(at == 95);
    equal_cancel_rejected_us_equities_v1(cancel_rejected_us_equities_v1_got, cancel_rejected_us_equities_v1_sent)
  }
}

/* Order Execution Us Equities V 1: encoded, read back, and compared */
proctype check_order_execution_us_equities_v1() {
  OrderExecutionUsEquitiesV1 order_execution_us_equities_v1_sent;
  OrderExecutionUsEquitiesV1 order_execution_us_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_execution_us_equities_v1(order_execution_us_equities_v1_sent, 0)
  :: pattern == 1 -> fill_order_execution_us_equities_v1(order_execution_us_equities_v1_sent, 32)
  :: pattern == 2 -> fill_order_execution_us_equities_v1(order_execution_us_equities_v1_sent, 255)
  :: else -> ramp_order_execution_us_equities_v1(order_execution_us_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_execution_us_equities_v1(order_execution_us_equities_v1_sent);
    assert(at == 83);
    at = 0;
    decode_order_execution_us_equities_v1(order_execution_us_equities_v1_got);
    assert(at == 83);
    equal_order_execution_us_equities_v1(order_execution_us_equities_v1_got, order_execution_us_equities_v1_sent)
  }
}

/* Trade Cancel Correct Us Equities V 1: encoded, read back, and compared */
proctype check_trade_cancel_correct_us_equities_v1() {
  TradeCancelCorrectUsEquitiesV1 trade_cancel_correct_us_equities_v1_sent;
  TradeCancelCorrectUsEquitiesV1 trade_cancel_correct_us_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancel_correct_us_equities_v1(trade_cancel_correct_us_equities_v1_sent, 0)
  :: pattern == 1 -> fill_trade_cancel_correct_us_equities_v1(trade_cancel_correct_us_equities_v1_sent, 32)
  :: pattern == 2 -> fill_trade_cancel_correct_us_equities_v1(trade_cancel_correct_us_equities_v1_sent, 255)
  :: else -> ramp_trade_cancel_correct_us_equities_v1(trade_cancel_correct_us_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancel_correct_us_equities_v1(trade_cancel_correct_us_equities_v1_sent);
    assert(at == 94);
    at = 0;
    decode_trade_cancel_correct_us_equities_v1(trade_cancel_correct_us_equities_v1_got);
    assert(at == 94);
    equal_trade_cancel_correct_us_equities_v1(trade_cancel_correct_us_equities_v1_got, trade_cancel_correct_us_equities_v1_sent)
  }
}

/* Purge Rejected Us Equities V 1: encoded, read back, and compared */
proctype check_purge_rejected_us_equities_v1() {
  PurgeRejectedUsEquitiesV1 purge_rejected_us_equities_v1_sent;
  PurgeRejectedUsEquitiesV1 purge_rejected_us_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_purge_rejected_us_equities_v1(purge_rejected_us_equities_v1_sent, 0)
  :: pattern == 1 -> fill_purge_rejected_us_equities_v1(purge_rejected_us_equities_v1_sent, 32)
  :: pattern == 2 -> fill_purge_rejected_us_equities_v1(purge_rejected_us_equities_v1_sent, 255)
  :: else -> ramp_purge_rejected_us_equities_v1(purge_rejected_us_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_purge_rejected_us_equities_v1(purge_rejected_us_equities_v1_sent);
    assert(at == 91);
    at = 0;
    decode_purge_rejected_us_equities_v1(purge_rejected_us_equities_v1_got);
    assert(at == 91);
    equal_purge_rejected_us_equities_v1(purge_rejected_us_equities_v1_got, purge_rejected_us_equities_v1_sent)
  }
}

/* Reset Risk Acknowledgement Us Equities V 1: encoded, read back, and compared */
proctype check_reset_risk_acknowledgement_us_equities_v1() {
  ResetRiskAcknowledgementUsEquitiesV1 reset_risk_acknowledgement_us_equities_v1_sent;
  ResetRiskAcknowledgementUsEquitiesV1 reset_risk_acknowledgement_us_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reset_risk_acknowledgement_us_equities_v1(reset_risk_acknowledgement_us_equities_v1_sent, 0)
  :: pattern == 1 -> fill_reset_risk_acknowledgement_us_equities_v1(reset_risk_acknowledgement_us_equities_v1_sent, 32)
  :: pattern == 2 -> fill_reset_risk_acknowledgement_us_equities_v1(reset_risk_acknowledgement_us_equities_v1_sent, 255)
  :: else -> ramp_reset_risk_acknowledgement_us_equities_v1(reset_risk_acknowledgement_us_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reset_risk_acknowledgement_us_equities_v1(reset_risk_acknowledgement_us_equities_v1_sent);
    assert(at == 19);
    at = 0;
    decode_reset_risk_acknowledgement_us_equities_v1(reset_risk_acknowledgement_us_equities_v1_got);
    assert(at == 19);
    equal_reset_risk_acknowledgement_us_equities_v1(reset_risk_acknowledgement_us_equities_v1_got, reset_risk_acknowledgement_us_equities_v1_sent)
  }
}

/* Purge Acknowledgement Us Equities V 1: encoded, read back, and compared */
proctype check_purge_acknowledgement_us_equities_v1() {
  PurgeAcknowledgementUsEquitiesV1 purge_acknowledgement_us_equities_v1_sent;
  PurgeAcknowledgementUsEquitiesV1 purge_acknowledgement_us_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_purge_acknowledgement_us_equities_v1(purge_acknowledgement_us_equities_v1_sent, 0)
  :: pattern == 1 -> fill_purge_acknowledgement_us_equities_v1(purge_acknowledgement_us_equities_v1_sent, 32)
  :: pattern == 2 -> fill_purge_acknowledgement_us_equities_v1(purge_acknowledgement_us_equities_v1_sent, 255)
  :: else -> ramp_purge_acknowledgement_us_equities_v1(purge_acknowledgement_us_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_purge_acknowledgement_us_equities_v1(purge_acknowledgement_us_equities_v1_sent);
    assert(at == 34);
    at = 0;
    decode_purge_acknowledgement_us_equities_v1(purge_acknowledgement_us_equities_v1_got);
    assert(at == 34);
    equal_purge_acknowledgement_us_equities_v1(purge_acknowledgement_us_equities_v1_got, purge_acknowledgement_us_equities_v1_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_exchange_message_header()
  :: run check_logout_response_message()
  :: run check_order_acknowledgement_us_equities_v1()
  :: run check_order_rejected_us_equities_v1()
  :: run check_order_modified_us_equities_v1()
  :: run check_order_restated_us_equities_v1()
  :: run check_modify_rejected_us_equities_v1()
  :: run check_order_cancelled_us_equities_v1()
  :: run check_cancel_rejected_us_equities_v1()
  :: run check_order_execution_us_equities_v1()
  :: run check_trade_cancel_correct_us_equities_v1()
  :: run check_purge_rejected_us_equities_v1()
  :: run check_reset_risk_acknowledgement_us_equities_v1()
  :: run check_purge_acknowledgement_us_equities_v1()
  fi
}
