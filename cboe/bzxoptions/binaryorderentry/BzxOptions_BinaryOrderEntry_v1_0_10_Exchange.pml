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
#define WIRE 240

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

/* ---- Order Acknowledgement Message: 93 bytes --------------------------------- */

/* OrderAcknowledgementMessage */
typedef OrderAcknowledgementMessage {
  byte in_flight[2];
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte order_id[8];
  byte side;
  byte price[8];
  byte symbol[8];
  byte clearing_firm[4];
  byte leaves_qty[4];
  byte display_price[8];
  byte working_price[8];
  byte base_liquidity_indicator;
  byte sub_liquidity_indicator;
  byte routing_firm_id[4];
  byte request_received_time[8]
};

int order_acknowledgement_message_at;

/* every byte of Order Acknowledgement Message set to one value */
inline fill_order_acknowledgement_message(order_acknowledgement_message_record, order_acknowledgement_message_value) {
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 2 -> order_acknowledgement_message_record.in_flight[order_acknowledgement_message_at] = order_acknowledgement_message_value; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
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
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.symbol[order_acknowledgement_message_at] = order_acknowledgement_message_value; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.clearing_firm[order_acknowledgement_message_at] = order_acknowledgement_message_value; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.leaves_qty[order_acknowledgement_message_at] = order_acknowledgement_message_value; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.display_price[order_acknowledgement_message_at] = order_acknowledgement_message_value; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.working_price[order_acknowledgement_message_at] = order_acknowledgement_message_value; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.base_liquidity_indicator = order_acknowledgement_message_value;
  order_acknowledgement_message_record.sub_liquidity_indicator = order_acknowledgement_message_value;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.routing_firm_id[order_acknowledgement_message_at] = order_acknowledgement_message_value; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
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
  :: order_acknowledgement_message_at < 2 -> order_acknowledgement_message_record.in_flight[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 0 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.transaction_time[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 2 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 20 -> order_acknowledgement_message_record.cl_ord_id[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 10 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.order_id[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 30 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.side = (order_acknowledgement_message_base + 38 + 1) % 256;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.price[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 39 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.symbol[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 47 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.clearing_firm[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 55 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.leaves_qty[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 59 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.display_price[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 63 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.working_price[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 71 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.base_liquidity_indicator = (order_acknowledgement_message_base + 79 + 1) % 256;
  order_acknowledgement_message_record.sub_liquidity_indicator = (order_acknowledgement_message_base + 80 + 1) % 256;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.routing_firm_id[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 81 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.request_received_time[order_acknowledgement_message_at] = (order_acknowledgement_message_base + 85 + order_acknowledgement_message_at + 1) % 256; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Acknowledgement Message to the wire, 93 bytes from where the cursor stands */
inline encode_order_acknowledgement_message(order_acknowledgement_message_record) {
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 2 -> wire[at] = order_acknowledgement_message_record.in_flight[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
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
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> wire[at] = order_acknowledgement_message_record.symbol[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> wire[at] = order_acknowledgement_message_record.clearing_firm[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> wire[at] = order_acknowledgement_message_record.leaves_qty[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> wire[at] = order_acknowledgement_message_record.display_price[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> wire[at] = order_acknowledgement_message_record.working_price[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_message_record.base_liquidity_indicator; at = at + 1;
  wire[at] = order_acknowledgement_message_record.sub_liquidity_indicator; at = at + 1;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> wire[at] = order_acknowledgement_message_record.routing_firm_id[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> wire[at] = order_acknowledgement_message_record.request_received_time[order_acknowledgement_message_at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Acknowledgement Message off the wire, 93 bytes from where the cursor stands */
inline decode_order_acknowledgement_message(order_acknowledgement_message_record) {
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 2 -> order_acknowledgement_message_record.in_flight[order_acknowledgement_message_at] = wire[at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
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
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.symbol[order_acknowledgement_message_at] = wire[at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.clearing_firm[order_acknowledgement_message_at] = wire[at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.leaves_qty[order_acknowledgement_message_at] = wire[at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.display_price[order_acknowledgement_message_at] = wire[at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> order_acknowledgement_message_record.working_price[order_acknowledgement_message_at] = wire[at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_record.base_liquidity_indicator = wire[at]; at = at + 1;
  order_acknowledgement_message_record.sub_liquidity_indicator = wire[at]; at = at + 1;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> order_acknowledgement_message_record.routing_firm_id[order_acknowledgement_message_at] = wire[at]; at = at + 1; order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
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
  :: order_acknowledgement_message_at < 2 -> assert(order_acknowledgement_message_read.in_flight[order_acknowledgement_message_at] == order_acknowledgement_message_written.in_flight[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
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
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> assert(order_acknowledgement_message_read.symbol[order_acknowledgement_message_at] == order_acknowledgement_message_written.symbol[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> assert(order_acknowledgement_message_read.clearing_firm[order_acknowledgement_message_at] == order_acknowledgement_message_written.clearing_firm[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> assert(order_acknowledgement_message_read.leaves_qty[order_acknowledgement_message_at] == order_acknowledgement_message_written.leaves_qty[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> assert(order_acknowledgement_message_read.display_price[order_acknowledgement_message_at] == order_acknowledgement_message_written.display_price[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> assert(order_acknowledgement_message_read.working_price[order_acknowledgement_message_at] == order_acknowledgement_message_written.working_price[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_message_read.base_liquidity_indicator == order_acknowledgement_message_written.base_liquidity_indicator);
  assert(order_acknowledgement_message_read.sub_liquidity_indicator == order_acknowledgement_message_written.sub_liquidity_indicator);
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 4 -> assert(order_acknowledgement_message_read.routing_firm_id[order_acknowledgement_message_at] == order_acknowledgement_message_written.routing_firm_id[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  order_acknowledgement_message_at = 0;
  do
  :: order_acknowledgement_message_at < 8 -> assert(order_acknowledgement_message_read.request_received_time[order_acknowledgement_message_at] == order_acknowledgement_message_written.request_received_time[order_acknowledgement_message_at]); order_acknowledgement_message_at = order_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Rejected Message: 99 bytes ---------------------------------------- */

/* Order Rejected messages are sent in response to a New Order message which must be rejected */
typedef OrderRejectedMessage {
  byte in_flight[2];
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte clearing_firm[4];
  byte routing_firm_id[4];
  byte order_reject_reason;
  byte text[60]
};

int order_rejected_message_at;

/* every byte of Order Rejected Message set to one value */
inline fill_order_rejected_message(order_rejected_message_record, order_rejected_message_value) {
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 2 -> order_rejected_message_record.in_flight[order_rejected_message_at] = order_rejected_message_value; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
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
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 4 -> order_rejected_message_record.routing_firm_id[order_rejected_message_at] = order_rejected_message_value; order_rejected_message_at = order_rejected_message_at + 1
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
  :: order_rejected_message_at < 2 -> order_rejected_message_record.in_flight[order_rejected_message_at] = (order_rejected_message_base + 0 + order_rejected_message_at + 1) % 256; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 8 -> order_rejected_message_record.transaction_time[order_rejected_message_at] = (order_rejected_message_base + 2 + order_rejected_message_at + 1) % 256; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 20 -> order_rejected_message_record.cl_ord_id[order_rejected_message_at] = (order_rejected_message_base + 10 + order_rejected_message_at + 1) % 256; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 4 -> order_rejected_message_record.clearing_firm[order_rejected_message_at] = (order_rejected_message_base + 30 + order_rejected_message_at + 1) % 256; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 4 -> order_rejected_message_record.routing_firm_id[order_rejected_message_at] = (order_rejected_message_base + 34 + order_rejected_message_at + 1) % 256; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_record.order_reject_reason = (order_rejected_message_base + 38 + 1) % 256;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 60 -> order_rejected_message_record.text[order_rejected_message_at] = (order_rejected_message_base + 39 + order_rejected_message_at + 1) % 256; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Rejected Message to the wire, 99 bytes from where the cursor stands */
inline encode_order_rejected_message(order_rejected_message_record) {
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 2 -> wire[at] = order_rejected_message_record.in_flight[order_rejected_message_at]; at = at + 1; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
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
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 4 -> wire[at] = order_rejected_message_record.routing_firm_id[order_rejected_message_at]; at = at + 1; order_rejected_message_at = order_rejected_message_at + 1
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

/* Order Rejected Message off the wire, 99 bytes from where the cursor stands */
inline decode_order_rejected_message(order_rejected_message_record) {
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 2 -> order_rejected_message_record.in_flight[order_rejected_message_at] = wire[at]; at = at + 1; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
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
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 4 -> order_rejected_message_record.routing_firm_id[order_rejected_message_at] = wire[at]; at = at + 1; order_rejected_message_at = order_rejected_message_at + 1
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
  :: order_rejected_message_at < 2 -> assert(order_rejected_message_read.in_flight[order_rejected_message_at] == order_rejected_message_written.in_flight[order_rejected_message_at]); order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
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
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 4 -> assert(order_rejected_message_read.routing_firm_id[order_rejected_message_at] == order_rejected_message_written.routing_firm_id[order_rejected_message_at]); order_rejected_message_at = order_rejected_message_at + 1
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

/* ---- Quote Update Rejected Message: 27 bytes --------------------------------- */

/* Quote Update Rejected messages are sent in response to a Quote Update message when the entire quote block is rejected by the order handler */
typedef QuoteUpdateRejectedMessage {
  byte in_flight[2];
  byte transaction_time[8];
  byte quote_update_id[16];
  byte quote_reject_reason
};

int quote_update_rejected_message_at;

/* every byte of Quote Update Rejected Message set to one value */
inline fill_quote_update_rejected_message(quote_update_rejected_message_record, quote_update_rejected_message_value) {
  quote_update_rejected_message_at = 0;
  do
  :: quote_update_rejected_message_at < 2 -> quote_update_rejected_message_record.in_flight[quote_update_rejected_message_at] = quote_update_rejected_message_value; quote_update_rejected_message_at = quote_update_rejected_message_at + 1
  :: else -> break
  od;
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
  :: quote_update_rejected_message_at < 2 -> quote_update_rejected_message_record.in_flight[quote_update_rejected_message_at] = (quote_update_rejected_message_base + 0 + quote_update_rejected_message_at + 1) % 256; quote_update_rejected_message_at = quote_update_rejected_message_at + 1
  :: else -> break
  od;
  quote_update_rejected_message_at = 0;
  do
  :: quote_update_rejected_message_at < 8 -> quote_update_rejected_message_record.transaction_time[quote_update_rejected_message_at] = (quote_update_rejected_message_base + 2 + quote_update_rejected_message_at + 1) % 256; quote_update_rejected_message_at = quote_update_rejected_message_at + 1
  :: else -> break
  od;
  quote_update_rejected_message_at = 0;
  do
  :: quote_update_rejected_message_at < 16 -> quote_update_rejected_message_record.quote_update_id[quote_update_rejected_message_at] = (quote_update_rejected_message_base + 10 + quote_update_rejected_message_at + 1) % 256; quote_update_rejected_message_at = quote_update_rejected_message_at + 1
  :: else -> break
  od;
  quote_update_rejected_message_record.quote_reject_reason = (quote_update_rejected_message_base + 26 + 1) % 256;
  skip
}

/* Quote Update Rejected Message to the wire, 27 bytes from where the cursor stands */
inline encode_quote_update_rejected_message(quote_update_rejected_message_record) {
  quote_update_rejected_message_at = 0;
  do
  :: quote_update_rejected_message_at < 2 -> wire[at] = quote_update_rejected_message_record.in_flight[quote_update_rejected_message_at]; at = at + 1; quote_update_rejected_message_at = quote_update_rejected_message_at + 1
  :: else -> break
  od;
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

/* Quote Update Rejected Message off the wire, 27 bytes from where the cursor stands */
inline decode_quote_update_rejected_message(quote_update_rejected_message_record) {
  quote_update_rejected_message_at = 0;
  do
  :: quote_update_rejected_message_at < 2 -> quote_update_rejected_message_record.in_flight[quote_update_rejected_message_at] = wire[at]; at = at + 1; quote_update_rejected_message_at = quote_update_rejected_message_at + 1
  :: else -> break
  od;
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
  :: quote_update_rejected_message_at < 2 -> assert(quote_update_rejected_message_read.in_flight[quote_update_rejected_message_at] == quote_update_rejected_message_written.in_flight[quote_update_rejected_message_at]); quote_update_rejected_message_at = quote_update_rejected_message_at + 1
  :: else -> break
  od;
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

/* ---- Order Modified Message: 136 bytes --------------------------------------- */

/* Order Modified messages are sent in response to a Modify Request message to indicate that the order has been successfully modified */
typedef OrderModifiedMessage {
  byte in_flight[2];
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte orig_cl_ord_id[20];
  byte order_id[8];
  byte clearing_firm[4];
  byte routing_firm_id[4];
  byte symbol[8];
  byte order_qty[4];
  byte price[8];
  byte ord_type;
  byte max_floor[4];
  byte stop_px[8];
  byte leaves_qty[4];
  byte display_price[8];
  byte working_price[8];
  byte base_liquidity_indicator;
  byte secondary_order_id[8];
  byte request_received_time[8]
};

int order_modified_message_at;

/* every byte of Order Modified Message set to one value */
inline fill_order_modified_message(order_modified_message_record, order_modified_message_value) {
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 2 -> order_modified_message_record.in_flight[order_modified_message_at] = order_modified_message_value; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
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
  :: order_modified_message_at < 4 -> order_modified_message_record.routing_firm_id[order_modified_message_at] = order_modified_message_value; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.symbol[order_modified_message_at] = order_modified_message_value; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> order_modified_message_record.order_qty[order_modified_message_at] = order_modified_message_value; order_modified_message_at = order_modified_message_at + 1
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
  :: order_modified_message_at < 4 -> order_modified_message_record.max_floor[order_modified_message_at] = order_modified_message_value; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.stop_px[order_modified_message_at] = order_modified_message_value; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> order_modified_message_record.leaves_qty[order_modified_message_at] = order_modified_message_value; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.display_price[order_modified_message_at] = order_modified_message_value; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.working_price[order_modified_message_at] = order_modified_message_value; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_record.base_liquidity_indicator = order_modified_message_value;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.secondary_order_id[order_modified_message_at] = order_modified_message_value; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
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
  :: order_modified_message_at < 2 -> order_modified_message_record.in_flight[order_modified_message_at] = (order_modified_message_base + 0 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.transaction_time[order_modified_message_at] = (order_modified_message_base + 2 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 20 -> order_modified_message_record.cl_ord_id[order_modified_message_at] = (order_modified_message_base + 10 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 20 -> order_modified_message_record.orig_cl_ord_id[order_modified_message_at] = (order_modified_message_base + 30 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.order_id[order_modified_message_at] = (order_modified_message_base + 50 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> order_modified_message_record.clearing_firm[order_modified_message_at] = (order_modified_message_base + 58 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> order_modified_message_record.routing_firm_id[order_modified_message_at] = (order_modified_message_base + 62 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.symbol[order_modified_message_at] = (order_modified_message_base + 66 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> order_modified_message_record.order_qty[order_modified_message_at] = (order_modified_message_base + 74 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.price[order_modified_message_at] = (order_modified_message_base + 78 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_record.ord_type = (order_modified_message_base + 86 + 1) % 256;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> order_modified_message_record.max_floor[order_modified_message_at] = (order_modified_message_base + 87 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.stop_px[order_modified_message_at] = (order_modified_message_base + 91 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> order_modified_message_record.leaves_qty[order_modified_message_at] = (order_modified_message_base + 99 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.display_price[order_modified_message_at] = (order_modified_message_base + 103 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.working_price[order_modified_message_at] = (order_modified_message_base + 111 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_record.base_liquidity_indicator = (order_modified_message_base + 119 + 1) % 256;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.secondary_order_id[order_modified_message_at] = (order_modified_message_base + 120 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.request_received_time[order_modified_message_at] = (order_modified_message_base + 128 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modified Message to the wire, 136 bytes from where the cursor stands */
inline encode_order_modified_message(order_modified_message_record) {
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 2 -> wire[at] = order_modified_message_record.in_flight[order_modified_message_at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
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
  :: order_modified_message_at < 4 -> wire[at] = order_modified_message_record.routing_firm_id[order_modified_message_at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> wire[at] = order_modified_message_record.symbol[order_modified_message_at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> wire[at] = order_modified_message_record.order_qty[order_modified_message_at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
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
  :: order_modified_message_at < 4 -> wire[at] = order_modified_message_record.max_floor[order_modified_message_at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> wire[at] = order_modified_message_record.stop_px[order_modified_message_at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> wire[at] = order_modified_message_record.leaves_qty[order_modified_message_at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> wire[at] = order_modified_message_record.display_price[order_modified_message_at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> wire[at] = order_modified_message_record.working_price[order_modified_message_at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  wire[at] = order_modified_message_record.base_liquidity_indicator; at = at + 1;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> wire[at] = order_modified_message_record.secondary_order_id[order_modified_message_at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> wire[at] = order_modified_message_record.request_received_time[order_modified_message_at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modified Message off the wire, 136 bytes from where the cursor stands */
inline decode_order_modified_message(order_modified_message_record) {
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 2 -> order_modified_message_record.in_flight[order_modified_message_at] = wire[at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
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
  :: order_modified_message_at < 4 -> order_modified_message_record.routing_firm_id[order_modified_message_at] = wire[at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.symbol[order_modified_message_at] = wire[at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> order_modified_message_record.order_qty[order_modified_message_at] = wire[at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
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
  :: order_modified_message_at < 4 -> order_modified_message_record.max_floor[order_modified_message_at] = wire[at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.stop_px[order_modified_message_at] = wire[at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> order_modified_message_record.leaves_qty[order_modified_message_at] = wire[at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.display_price[order_modified_message_at] = wire[at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.working_price[order_modified_message_at] = wire[at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_record.base_liquidity_indicator = wire[at]; at = at + 1;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.secondary_order_id[order_modified_message_at] = wire[at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
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
  :: order_modified_message_at < 2 -> assert(order_modified_message_read.in_flight[order_modified_message_at] == order_modified_message_written.in_flight[order_modified_message_at]); order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
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
  :: order_modified_message_at < 4 -> assert(order_modified_message_read.routing_firm_id[order_modified_message_at] == order_modified_message_written.routing_firm_id[order_modified_message_at]); order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> assert(order_modified_message_read.symbol[order_modified_message_at] == order_modified_message_written.symbol[order_modified_message_at]); order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> assert(order_modified_message_read.order_qty[order_modified_message_at] == order_modified_message_written.order_qty[order_modified_message_at]); order_modified_message_at = order_modified_message_at + 1
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
  :: order_modified_message_at < 4 -> assert(order_modified_message_read.max_floor[order_modified_message_at] == order_modified_message_written.max_floor[order_modified_message_at]); order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> assert(order_modified_message_read.stop_px[order_modified_message_at] == order_modified_message_written.stop_px[order_modified_message_at]); order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> assert(order_modified_message_read.leaves_qty[order_modified_message_at] == order_modified_message_written.leaves_qty[order_modified_message_at]); order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> assert(order_modified_message_read.display_price[order_modified_message_at] == order_modified_message_written.display_price[order_modified_message_at]); order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> assert(order_modified_message_read.working_price[order_modified_message_at] == order_modified_message_written.working_price[order_modified_message_at]); order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  assert(order_modified_message_read.base_liquidity_indicator == order_modified_message_written.base_liquidity_indicator);
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> assert(order_modified_message_read.secondary_order_id[order_modified_message_at] == order_modified_message_written.secondary_order_id[order_modified_message_at]); order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> assert(order_modified_message_read.request_received_time[order_modified_message_at] == order_modified_message_written.request_received_time[order_modified_message_at]); order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Restated Message: 108 bytes --------------------------------------- */

/* Order Restated messages are sent to inform the Member that an order has been asynchronously modified */
typedef OrderRestatedMessage {
  byte in_flight[2];
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte order_id[8];
  byte clearing_firm[4];
  byte routing_firm_id[4];
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
  byte last_px[8]
};

int order_restated_message_at;

/* every byte of Order Restated Message set to one value */
inline fill_order_restated_message(order_restated_message_record, order_restated_message_value) {
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 2 -> order_restated_message_record.in_flight[order_restated_message_at] = order_restated_message_value; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> order_restated_message_record.transaction_time[order_restated_message_at] = order_restated_message_value; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 20 -> order_restated_message_record.cl_ord_id[order_restated_message_at] = order_restated_message_value; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> order_restated_message_record.order_id[order_restated_message_at] = order_restated_message_value; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 4 -> order_restated_message_record.clearing_firm[order_restated_message_at] = order_restated_message_value; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 4 -> order_restated_message_record.routing_firm_id[order_restated_message_at] = order_restated_message_value; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> order_restated_message_record.symbol[order_restated_message_at] = order_restated_message_value; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_record.order_restatement_reason = order_restated_message_value;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 4 -> order_restated_message_record.order_qty[order_restated_message_at] = order_restated_message_value; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> order_restated_message_record.price[order_restated_message_at] = order_restated_message_value; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 4 -> order_restated_message_record.leaves_qty[order_restated_message_at] = order_restated_message_value; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> order_restated_message_record.display_price[order_restated_message_at] = order_restated_message_value; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> order_restated_message_record.working_price[order_restated_message_at] = order_restated_message_value; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_record.base_liquidity_indicator = order_restated_message_value;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> order_restated_message_record.secondary_order_id[order_restated_message_at] = order_restated_message_value; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 4 -> order_restated_message_record.last_shares[order_restated_message_at] = order_restated_message_value; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> order_restated_message_record.last_px[order_restated_message_at] = order_restated_message_value; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Restated Message set to where it lies, so a field read out of place says so */
inline ramp_order_restated_message(order_restated_message_record, order_restated_message_base) {
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 2 -> order_restated_message_record.in_flight[order_restated_message_at] = (order_restated_message_base + 0 + order_restated_message_at + 1) % 256; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> order_restated_message_record.transaction_time[order_restated_message_at] = (order_restated_message_base + 2 + order_restated_message_at + 1) % 256; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 20 -> order_restated_message_record.cl_ord_id[order_restated_message_at] = (order_restated_message_base + 10 + order_restated_message_at + 1) % 256; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> order_restated_message_record.order_id[order_restated_message_at] = (order_restated_message_base + 30 + order_restated_message_at + 1) % 256; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 4 -> order_restated_message_record.clearing_firm[order_restated_message_at] = (order_restated_message_base + 38 + order_restated_message_at + 1) % 256; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 4 -> order_restated_message_record.routing_firm_id[order_restated_message_at] = (order_restated_message_base + 42 + order_restated_message_at + 1) % 256; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> order_restated_message_record.symbol[order_restated_message_at] = (order_restated_message_base + 46 + order_restated_message_at + 1) % 256; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_record.order_restatement_reason = (order_restated_message_base + 54 + 1) % 256;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 4 -> order_restated_message_record.order_qty[order_restated_message_at] = (order_restated_message_base + 55 + order_restated_message_at + 1) % 256; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> order_restated_message_record.price[order_restated_message_at] = (order_restated_message_base + 59 + order_restated_message_at + 1) % 256; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 4 -> order_restated_message_record.leaves_qty[order_restated_message_at] = (order_restated_message_base + 67 + order_restated_message_at + 1) % 256; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> order_restated_message_record.display_price[order_restated_message_at] = (order_restated_message_base + 71 + order_restated_message_at + 1) % 256; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> order_restated_message_record.working_price[order_restated_message_at] = (order_restated_message_base + 79 + order_restated_message_at + 1) % 256; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_record.base_liquidity_indicator = (order_restated_message_base + 87 + 1) % 256;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> order_restated_message_record.secondary_order_id[order_restated_message_at] = (order_restated_message_base + 88 + order_restated_message_at + 1) % 256; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 4 -> order_restated_message_record.last_shares[order_restated_message_at] = (order_restated_message_base + 96 + order_restated_message_at + 1) % 256; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> order_restated_message_record.last_px[order_restated_message_at] = (order_restated_message_base + 100 + order_restated_message_at + 1) % 256; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Restated Message to the wire, 108 bytes from where the cursor stands */
inline encode_order_restated_message(order_restated_message_record) {
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 2 -> wire[at] = order_restated_message_record.in_flight[order_restated_message_at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> wire[at] = order_restated_message_record.transaction_time[order_restated_message_at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 20 -> wire[at] = order_restated_message_record.cl_ord_id[order_restated_message_at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> wire[at] = order_restated_message_record.order_id[order_restated_message_at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 4 -> wire[at] = order_restated_message_record.clearing_firm[order_restated_message_at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 4 -> wire[at] = order_restated_message_record.routing_firm_id[order_restated_message_at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> wire[at] = order_restated_message_record.symbol[order_restated_message_at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  wire[at] = order_restated_message_record.order_restatement_reason; at = at + 1;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 4 -> wire[at] = order_restated_message_record.order_qty[order_restated_message_at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> wire[at] = order_restated_message_record.price[order_restated_message_at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 4 -> wire[at] = order_restated_message_record.leaves_qty[order_restated_message_at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> wire[at] = order_restated_message_record.display_price[order_restated_message_at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> wire[at] = order_restated_message_record.working_price[order_restated_message_at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  wire[at] = order_restated_message_record.base_liquidity_indicator; at = at + 1;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> wire[at] = order_restated_message_record.secondary_order_id[order_restated_message_at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 4 -> wire[at] = order_restated_message_record.last_shares[order_restated_message_at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> wire[at] = order_restated_message_record.last_px[order_restated_message_at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Restated Message off the wire, 108 bytes from where the cursor stands */
inline decode_order_restated_message(order_restated_message_record) {
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 2 -> order_restated_message_record.in_flight[order_restated_message_at] = wire[at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> order_restated_message_record.transaction_time[order_restated_message_at] = wire[at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 20 -> order_restated_message_record.cl_ord_id[order_restated_message_at] = wire[at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> order_restated_message_record.order_id[order_restated_message_at] = wire[at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 4 -> order_restated_message_record.clearing_firm[order_restated_message_at] = wire[at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 4 -> order_restated_message_record.routing_firm_id[order_restated_message_at] = wire[at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> order_restated_message_record.symbol[order_restated_message_at] = wire[at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_record.order_restatement_reason = wire[at]; at = at + 1;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 4 -> order_restated_message_record.order_qty[order_restated_message_at] = wire[at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> order_restated_message_record.price[order_restated_message_at] = wire[at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 4 -> order_restated_message_record.leaves_qty[order_restated_message_at] = wire[at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> order_restated_message_record.display_price[order_restated_message_at] = wire[at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> order_restated_message_record.working_price[order_restated_message_at] = wire[at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_record.base_liquidity_indicator = wire[at]; at = at + 1;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> order_restated_message_record.secondary_order_id[order_restated_message_at] = wire[at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 4 -> order_restated_message_record.last_shares[order_restated_message_at] = wire[at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> order_restated_message_record.last_px[order_restated_message_at] = wire[at]; at = at + 1; order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Restated Message is what was written, byte for byte */
inline equal_order_restated_message(order_restated_message_read, order_restated_message_written) {
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 2 -> assert(order_restated_message_read.in_flight[order_restated_message_at] == order_restated_message_written.in_flight[order_restated_message_at]); order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> assert(order_restated_message_read.transaction_time[order_restated_message_at] == order_restated_message_written.transaction_time[order_restated_message_at]); order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 20 -> assert(order_restated_message_read.cl_ord_id[order_restated_message_at] == order_restated_message_written.cl_ord_id[order_restated_message_at]); order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> assert(order_restated_message_read.order_id[order_restated_message_at] == order_restated_message_written.order_id[order_restated_message_at]); order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 4 -> assert(order_restated_message_read.clearing_firm[order_restated_message_at] == order_restated_message_written.clearing_firm[order_restated_message_at]); order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 4 -> assert(order_restated_message_read.routing_firm_id[order_restated_message_at] == order_restated_message_written.routing_firm_id[order_restated_message_at]); order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> assert(order_restated_message_read.symbol[order_restated_message_at] == order_restated_message_written.symbol[order_restated_message_at]); order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  assert(order_restated_message_read.order_restatement_reason == order_restated_message_written.order_restatement_reason);
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 4 -> assert(order_restated_message_read.order_qty[order_restated_message_at] == order_restated_message_written.order_qty[order_restated_message_at]); order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> assert(order_restated_message_read.price[order_restated_message_at] == order_restated_message_written.price[order_restated_message_at]); order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 4 -> assert(order_restated_message_read.leaves_qty[order_restated_message_at] == order_restated_message_written.leaves_qty[order_restated_message_at]); order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> assert(order_restated_message_read.display_price[order_restated_message_at] == order_restated_message_written.display_price[order_restated_message_at]); order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> assert(order_restated_message_read.working_price[order_restated_message_at] == order_restated_message_written.working_price[order_restated_message_at]); order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  assert(order_restated_message_read.base_liquidity_indicator == order_restated_message_written.base_liquidity_indicator);
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> assert(order_restated_message_read.secondary_order_id[order_restated_message_at] == order_restated_message_written.secondary_order_id[order_restated_message_at]); order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 4 -> assert(order_restated_message_read.last_shares[order_restated_message_at] == order_restated_message_written.last_shares[order_restated_message_at]); order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  order_restated_message_at = 0;
  do
  :: order_restated_message_at < 8 -> assert(order_restated_message_read.last_px[order_restated_message_at] == order_restated_message_written.last_px[order_restated_message_at]); order_restated_message_at = order_restated_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Restated Message: 54 bytes ---------------------------------------- */

/* Quote Restated messages are sent to inform the Member that an order has been asynchronously modified for some reason by the Exchange */
typedef QuoteRestatedMessage {
  byte in_flight[2];
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
  :: quote_restated_message_at < 2 -> quote_restated_message_record.in_flight[quote_restated_message_at] = quote_restated_message_value; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
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
  :: quote_restated_message_at < 2 -> quote_restated_message_record.in_flight[quote_restated_message_at] = (quote_restated_message_base + 0 + quote_restated_message_at + 1) % 256; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> quote_restated_message_record.transaction_time[quote_restated_message_at] = (quote_restated_message_base + 2 + quote_restated_message_at + 1) % 256; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 16 -> quote_restated_message_record.quote_update_id[quote_restated_message_at] = (quote_restated_message_base + 10 + quote_restated_message_at + 1) % 256; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> quote_restated_message_record.order_id[quote_restated_message_at] = (quote_restated_message_base + 26 + quote_restated_message_at + 1) % 256; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 4 -> quote_restated_message_record.leaves_qty[quote_restated_message_at] = (quote_restated_message_base + 34 + quote_restated_message_at + 1) % 256; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> quote_restated_message_record.working_price[quote_restated_message_at] = (quote_restated_message_base + 38 + quote_restated_message_at + 1) % 256; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 6 -> quote_restated_message_record.quote_symbol[quote_restated_message_at] = (quote_restated_message_base + 46 + quote_restated_message_at + 1) % 256; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_record.side = (quote_restated_message_base + 52 + 1) % 256;
  quote_restated_message_record.restatement_reason = (quote_restated_message_base + 53 + 1) % 256;
  skip
}

/* Quote Restated Message to the wire, 54 bytes from where the cursor stands */
inline encode_quote_restated_message(quote_restated_message_record) {
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 2 -> wire[at] = quote_restated_message_record.in_flight[quote_restated_message_at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
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

/* Quote Restated Message off the wire, 54 bytes from where the cursor stands */
inline decode_quote_restated_message(quote_restated_message_record) {
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 2 -> quote_restated_message_record.in_flight[quote_restated_message_at] = wire[at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
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
  :: quote_restated_message_at < 2 -> assert(quote_restated_message_read.in_flight[quote_restated_message_at] == quote_restated_message_written.in_flight[quote_restated_message_at]); quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
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

/* ---- Modify Rejected Message: 119 bytes -------------------------------------- */

/* User Modify Rejected messages are sent in response to a Modify Order message for an order which cannot be modified */
typedef ModifyRejectedMessage {
  byte in_flight[2];
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte clearing_firm[4];
  byte routing_firm_id[4];
  byte orig_cl_ord_id[20];
  byte modify_reject_reason;
  byte text[60]
};

int modify_rejected_message_at;

/* every byte of Modify Rejected Message set to one value */
inline fill_modify_rejected_message(modify_rejected_message_record, modify_rejected_message_value) {
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 2 -> modify_rejected_message_record.in_flight[modify_rejected_message_at] = modify_rejected_message_value; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
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
  :: modify_rejected_message_at < 4 -> modify_rejected_message_record.clearing_firm[modify_rejected_message_at] = modify_rejected_message_value; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 4 -> modify_rejected_message_record.routing_firm_id[modify_rejected_message_at] = modify_rejected_message_value; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 20 -> modify_rejected_message_record.orig_cl_ord_id[modify_rejected_message_at] = modify_rejected_message_value; modify_rejected_message_at = modify_rejected_message_at + 1
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
  :: modify_rejected_message_at < 2 -> modify_rejected_message_record.in_flight[modify_rejected_message_at] = (modify_rejected_message_base + 0 + modify_rejected_message_at + 1) % 256; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 8 -> modify_rejected_message_record.transaction_time[modify_rejected_message_at] = (modify_rejected_message_base + 2 + modify_rejected_message_at + 1) % 256; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 20 -> modify_rejected_message_record.cl_ord_id[modify_rejected_message_at] = (modify_rejected_message_base + 10 + modify_rejected_message_at + 1) % 256; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 4 -> modify_rejected_message_record.clearing_firm[modify_rejected_message_at] = (modify_rejected_message_base + 30 + modify_rejected_message_at + 1) % 256; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 4 -> modify_rejected_message_record.routing_firm_id[modify_rejected_message_at] = (modify_rejected_message_base + 34 + modify_rejected_message_at + 1) % 256; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 20 -> modify_rejected_message_record.orig_cl_ord_id[modify_rejected_message_at] = (modify_rejected_message_base + 38 + modify_rejected_message_at + 1) % 256; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_record.modify_reject_reason = (modify_rejected_message_base + 58 + 1) % 256;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 60 -> modify_rejected_message_record.text[modify_rejected_message_at] = (modify_rejected_message_base + 59 + modify_rejected_message_at + 1) % 256; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Rejected Message to the wire, 119 bytes from where the cursor stands */
inline encode_modify_rejected_message(modify_rejected_message_record) {
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 2 -> wire[at] = modify_rejected_message_record.in_flight[modify_rejected_message_at]; at = at + 1; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
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
  :: modify_rejected_message_at < 4 -> wire[at] = modify_rejected_message_record.clearing_firm[modify_rejected_message_at]; at = at + 1; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 4 -> wire[at] = modify_rejected_message_record.routing_firm_id[modify_rejected_message_at]; at = at + 1; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 20 -> wire[at] = modify_rejected_message_record.orig_cl_ord_id[modify_rejected_message_at]; at = at + 1; modify_rejected_message_at = modify_rejected_message_at + 1
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

/* Modify Rejected Message off the wire, 119 bytes from where the cursor stands */
inline decode_modify_rejected_message(modify_rejected_message_record) {
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 2 -> modify_rejected_message_record.in_flight[modify_rejected_message_at] = wire[at]; at = at + 1; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
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
  :: modify_rejected_message_at < 4 -> modify_rejected_message_record.clearing_firm[modify_rejected_message_at] = wire[at]; at = at + 1; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 4 -> modify_rejected_message_record.routing_firm_id[modify_rejected_message_at] = wire[at]; at = at + 1; modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 20 -> modify_rejected_message_record.orig_cl_ord_id[modify_rejected_message_at] = wire[at]; at = at + 1; modify_rejected_message_at = modify_rejected_message_at + 1
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
  :: modify_rejected_message_at < 2 -> assert(modify_rejected_message_read.in_flight[modify_rejected_message_at] == modify_rejected_message_written.in_flight[modify_rejected_message_at]); modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
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
  :: modify_rejected_message_at < 4 -> assert(modify_rejected_message_read.clearing_firm[modify_rejected_message_at] == modify_rejected_message_written.clearing_firm[modify_rejected_message_at]); modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 4 -> assert(modify_rejected_message_read.routing_firm_id[modify_rejected_message_at] == modify_rejected_message_written.routing_firm_id[modify_rejected_message_at]); modify_rejected_message_at = modify_rejected_message_at + 1
  :: else -> break
  od;
  modify_rejected_message_at = 0;
  do
  :: modify_rejected_message_at < 20 -> assert(modify_rejected_message_read.orig_cl_ord_id[modify_rejected_message_at] == modify_rejected_message_written.orig_cl_ord_id[modify_rejected_message_at]); modify_rejected_message_at = modify_rejected_message_at + 1
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

/* ---- Order Cancelled Message: 56 bytes --------------------------------------- */

/* This message indicates an order has been cancelled */
typedef OrderCancelledMessage {
  byte in_flight[2];
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte cancel_reason;
  byte cancel_sub_reason;
  byte clearing_firm[4];
  byte routing_firm_id[4];
  byte symbol[8];
  byte request_received_time[8]
};

int order_cancelled_message_at;

/* every byte of Order Cancelled Message set to one value */
inline fill_order_cancelled_message(order_cancelled_message_record, order_cancelled_message_value) {
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 2 -> order_cancelled_message_record.in_flight[order_cancelled_message_at] = order_cancelled_message_value; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
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
  order_cancelled_message_record.cancel_reason = order_cancelled_message_value;
  order_cancelled_message_record.cancel_sub_reason = order_cancelled_message_value;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 4 -> order_cancelled_message_record.clearing_firm[order_cancelled_message_at] = order_cancelled_message_value; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 4 -> order_cancelled_message_record.routing_firm_id[order_cancelled_message_at] = order_cancelled_message_value; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> order_cancelled_message_record.symbol[order_cancelled_message_at] = order_cancelled_message_value; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
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
  :: order_cancelled_message_at < 2 -> order_cancelled_message_record.in_flight[order_cancelled_message_at] = (order_cancelled_message_base + 0 + order_cancelled_message_at + 1) % 256; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> order_cancelled_message_record.transaction_time[order_cancelled_message_at] = (order_cancelled_message_base + 2 + order_cancelled_message_at + 1) % 256; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 20 -> order_cancelled_message_record.cl_ord_id[order_cancelled_message_at] = (order_cancelled_message_base + 10 + order_cancelled_message_at + 1) % 256; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_record.cancel_reason = (order_cancelled_message_base + 30 + 1) % 256;
  order_cancelled_message_record.cancel_sub_reason = (order_cancelled_message_base + 31 + 1) % 256;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 4 -> order_cancelled_message_record.clearing_firm[order_cancelled_message_at] = (order_cancelled_message_base + 32 + order_cancelled_message_at + 1) % 256; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 4 -> order_cancelled_message_record.routing_firm_id[order_cancelled_message_at] = (order_cancelled_message_base + 36 + order_cancelled_message_at + 1) % 256; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> order_cancelled_message_record.symbol[order_cancelled_message_at] = (order_cancelled_message_base + 40 + order_cancelled_message_at + 1) % 256; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> order_cancelled_message_record.request_received_time[order_cancelled_message_at] = (order_cancelled_message_base + 48 + order_cancelled_message_at + 1) % 256; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancelled Message to the wire, 56 bytes from where the cursor stands */
inline encode_order_cancelled_message(order_cancelled_message_record) {
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 2 -> wire[at] = order_cancelled_message_record.in_flight[order_cancelled_message_at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
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
  wire[at] = order_cancelled_message_record.cancel_reason; at = at + 1;
  wire[at] = order_cancelled_message_record.cancel_sub_reason; at = at + 1;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 4 -> wire[at] = order_cancelled_message_record.clearing_firm[order_cancelled_message_at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 4 -> wire[at] = order_cancelled_message_record.routing_firm_id[order_cancelled_message_at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> wire[at] = order_cancelled_message_record.symbol[order_cancelled_message_at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> wire[at] = order_cancelled_message_record.request_received_time[order_cancelled_message_at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancelled Message off the wire, 56 bytes from where the cursor stands */
inline decode_order_cancelled_message(order_cancelled_message_record) {
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 2 -> order_cancelled_message_record.in_flight[order_cancelled_message_at] = wire[at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
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
  order_cancelled_message_record.cancel_reason = wire[at]; at = at + 1;
  order_cancelled_message_record.cancel_sub_reason = wire[at]; at = at + 1;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 4 -> order_cancelled_message_record.clearing_firm[order_cancelled_message_at] = wire[at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 4 -> order_cancelled_message_record.routing_firm_id[order_cancelled_message_at] = wire[at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> order_cancelled_message_record.symbol[order_cancelled_message_at] = wire[at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
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
  :: order_cancelled_message_at < 2 -> assert(order_cancelled_message_read.in_flight[order_cancelled_message_at] == order_cancelled_message_written.in_flight[order_cancelled_message_at]); order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
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
  assert(order_cancelled_message_read.cancel_reason == order_cancelled_message_written.cancel_reason);
  assert(order_cancelled_message_read.cancel_sub_reason == order_cancelled_message_written.cancel_sub_reason);
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 4 -> assert(order_cancelled_message_read.clearing_firm[order_cancelled_message_at] == order_cancelled_message_written.clearing_firm[order_cancelled_message_at]); order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 4 -> assert(order_cancelled_message_read.routing_firm_id[order_cancelled_message_at] == order_cancelled_message_written.routing_firm_id[order_cancelled_message_at]); order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> assert(order_cancelled_message_read.symbol[order_cancelled_message_at] == order_cancelled_message_written.symbol[order_cancelled_message_at]); order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> assert(order_cancelled_message_read.request_received_time[order_cancelled_message_at] == order_cancelled_message_written.request_received_time[order_cancelled_message_at]); order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Cancelled Message: 43 bytes --------------------------------------- */

/* A Quote Cancelled message will be sent to indicate an unsolicited cancellation of a quote entered with a Quote Update message */
typedef QuoteCancelledMessage {
  byte in_flight[2];
  byte transaction_time[8];
  byte quote_update_id[16];
  byte order_id[8];
  byte quote_symbol[6];
  byte side;
  byte cancel_reason;
  byte cancel_sub_reason
};

int quote_cancelled_message_at;

/* every byte of Quote Cancelled Message set to one value */
inline fill_quote_cancelled_message(quote_cancelled_message_record, quote_cancelled_message_value) {
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 2 -> quote_cancelled_message_record.in_flight[quote_cancelled_message_at] = quote_cancelled_message_value; quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
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
  quote_cancelled_message_record.cancel_sub_reason = quote_cancelled_message_value;
  skip
}

/* each byte of Quote Cancelled Message set to where it lies, so a field read out of place says so */
inline ramp_quote_cancelled_message(quote_cancelled_message_record, quote_cancelled_message_base) {
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 2 -> quote_cancelled_message_record.in_flight[quote_cancelled_message_at] = (quote_cancelled_message_base + 0 + quote_cancelled_message_at + 1) % 256; quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 8 -> quote_cancelled_message_record.transaction_time[quote_cancelled_message_at] = (quote_cancelled_message_base + 2 + quote_cancelled_message_at + 1) % 256; quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 16 -> quote_cancelled_message_record.quote_update_id[quote_cancelled_message_at] = (quote_cancelled_message_base + 10 + quote_cancelled_message_at + 1) % 256; quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 8 -> quote_cancelled_message_record.order_id[quote_cancelled_message_at] = (quote_cancelled_message_base + 26 + quote_cancelled_message_at + 1) % 256; quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 6 -> quote_cancelled_message_record.quote_symbol[quote_cancelled_message_at] = (quote_cancelled_message_base + 34 + quote_cancelled_message_at + 1) % 256; quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
  quote_cancelled_message_record.side = (quote_cancelled_message_base + 40 + 1) % 256;
  quote_cancelled_message_record.cancel_reason = (quote_cancelled_message_base + 41 + 1) % 256;
  quote_cancelled_message_record.cancel_sub_reason = (quote_cancelled_message_base + 42 + 1) % 256;
  skip
}

/* Quote Cancelled Message to the wire, 43 bytes from where the cursor stands */
inline encode_quote_cancelled_message(quote_cancelled_message_record) {
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 2 -> wire[at] = quote_cancelled_message_record.in_flight[quote_cancelled_message_at]; at = at + 1; quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
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
  wire[at] = quote_cancelled_message_record.cancel_sub_reason; at = at + 1;
  skip
}

/* Quote Cancelled Message off the wire, 43 bytes from where the cursor stands */
inline decode_quote_cancelled_message(quote_cancelled_message_record) {
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 2 -> quote_cancelled_message_record.in_flight[quote_cancelled_message_at] = wire[at]; at = at + 1; quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
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
  quote_cancelled_message_record.cancel_sub_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Quote Cancelled Message is what was written, byte for byte */
inline equal_quote_cancelled_message(quote_cancelled_message_read, quote_cancelled_message_written) {
  quote_cancelled_message_at = 0;
  do
  :: quote_cancelled_message_at < 2 -> assert(quote_cancelled_message_read.in_flight[quote_cancelled_message_at] == quote_cancelled_message_written.in_flight[quote_cancelled_message_at]); quote_cancelled_message_at = quote_cancelled_message_at + 1
  :: else -> break
  od;
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
  assert(quote_cancelled_message_read.cancel_sub_reason == quote_cancelled_message_written.cancel_sub_reason);
  skip
}

/* ---- Cancel Rejected Message: 99 bytes --------------------------------------- */

/* A Cancel Rejected message is sent in response to a Cancel Order message to indicate that the cancellation cannot occur */
typedef CancelRejectedMessage {
  byte in_flight[2];
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte clearing_firm[4];
  byte routing_firm_id[4];
  byte cancel_reject_reason;
  byte text[60]
};

int cancel_rejected_message_at;

/* every byte of Cancel Rejected Message set to one value */
inline fill_cancel_rejected_message(cancel_rejected_message_record, cancel_rejected_message_value) {
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 2 -> cancel_rejected_message_record.in_flight[cancel_rejected_message_at] = cancel_rejected_message_value; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
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
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 4 -> cancel_rejected_message_record.routing_firm_id[cancel_rejected_message_at] = cancel_rejected_message_value; cancel_rejected_message_at = cancel_rejected_message_at + 1
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
  :: cancel_rejected_message_at < 2 -> cancel_rejected_message_record.in_flight[cancel_rejected_message_at] = (cancel_rejected_message_base + 0 + cancel_rejected_message_at + 1) % 256; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 8 -> cancel_rejected_message_record.transaction_time[cancel_rejected_message_at] = (cancel_rejected_message_base + 2 + cancel_rejected_message_at + 1) % 256; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 20 -> cancel_rejected_message_record.cl_ord_id[cancel_rejected_message_at] = (cancel_rejected_message_base + 10 + cancel_rejected_message_at + 1) % 256; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 4 -> cancel_rejected_message_record.clearing_firm[cancel_rejected_message_at] = (cancel_rejected_message_base + 30 + cancel_rejected_message_at + 1) % 256; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 4 -> cancel_rejected_message_record.routing_firm_id[cancel_rejected_message_at] = (cancel_rejected_message_base + 34 + cancel_rejected_message_at + 1) % 256; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_record.cancel_reject_reason = (cancel_rejected_message_base + 38 + 1) % 256;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 60 -> cancel_rejected_message_record.text[cancel_rejected_message_at] = (cancel_rejected_message_base + 39 + cancel_rejected_message_at + 1) % 256; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Rejected Message to the wire, 99 bytes from where the cursor stands */
inline encode_cancel_rejected_message(cancel_rejected_message_record) {
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 2 -> wire[at] = cancel_rejected_message_record.in_flight[cancel_rejected_message_at]; at = at + 1; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
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
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 4 -> wire[at] = cancel_rejected_message_record.routing_firm_id[cancel_rejected_message_at]; at = at + 1; cancel_rejected_message_at = cancel_rejected_message_at + 1
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

/* Cancel Rejected Message off the wire, 99 bytes from where the cursor stands */
inline decode_cancel_rejected_message(cancel_rejected_message_record) {
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 2 -> cancel_rejected_message_record.in_flight[cancel_rejected_message_at] = wire[at]; at = at + 1; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
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
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 4 -> cancel_rejected_message_record.routing_firm_id[cancel_rejected_message_at] = wire[at]; at = at + 1; cancel_rejected_message_at = cancel_rejected_message_at + 1
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
  :: cancel_rejected_message_at < 2 -> assert(cancel_rejected_message_read.in_flight[cancel_rejected_message_at] == cancel_rejected_message_written.in_flight[cancel_rejected_message_at]); cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
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
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 4 -> assert(cancel_rejected_message_read.routing_firm_id[cancel_rejected_message_at] == cancel_rejected_message_written.routing_firm_id[cancel_rejected_message_at]); cancel_rejected_message_at = cancel_rejected_message_at + 1
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

/* ---- Order Execution Message: 116 bytes -------------------------------------- */

/* An Order Execution message is sent for each fill on an order */
typedef OrderExecutionMessage {
  byte in_flight[2];
  byte transaction_time[8];
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
  byte contra_trader[4];
  byte clearing_firm[4];
  byte contra_capacity;
  byte fee_code[2];
  byte marketing_fee_code[2];
  byte routing_firm_id[4];
  byte cross_exclusion_indicator;
  byte trade_date[4];
  byte multileg_reporting_type;
  byte secondary_exec_id[8];
  byte price_type;
  byte trade_through_alert_type;
  byte sender_location_id;
  byte floor_trader_acronym[3];
  byte floor_trade_time[8];
  byte ex_destination;
  byte equity_ex_destination
};

int order_execution_message_at;

/* every byte of Order Execution Message set to one value */
inline fill_order_execution_message(order_execution_message_record, order_execution_message_value) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 2 -> order_execution_message_record.in_flight[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
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
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.contra_broker[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.side = order_execution_message_value;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.symbol[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.contra_trader[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.clearing_firm[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.contra_capacity = order_execution_message_value;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 2 -> order_execution_message_record.fee_code[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 2 -> order_execution_message_record.marketing_fee_code[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.routing_firm_id[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.cross_exclusion_indicator = order_execution_message_value;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.trade_date[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.multileg_reporting_type = order_execution_message_value;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.secondary_exec_id[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.price_type = order_execution_message_value;
  order_execution_message_record.trade_through_alert_type = order_execution_message_value;
  order_execution_message_record.sender_location_id = order_execution_message_value;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 3 -> order_execution_message_record.floor_trader_acronym[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.floor_trade_time[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.ex_destination = order_execution_message_value;
  order_execution_message_record.equity_ex_destination = order_execution_message_value;
  skip
}

/* each byte of Order Execution Message set to where it lies, so a field read out of place says so */
inline ramp_order_execution_message(order_execution_message_record, order_execution_message_base) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 2 -> order_execution_message_record.in_flight[order_execution_message_at] = (order_execution_message_base + 0 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.transaction_time[order_execution_message_at] = (order_execution_message_base + 2 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 20 -> order_execution_message_record.cl_ord_id[order_execution_message_at] = (order_execution_message_base + 10 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.exec_id[order_execution_message_at] = (order_execution_message_base + 30 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.last_shares[order_execution_message_at] = (order_execution_message_base + 38 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.last_px[order_execution_message_at] = (order_execution_message_base + 42 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.leaves_qty[order_execution_message_at] = (order_execution_message_base + 50 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.base_liquidity_indicator = (order_execution_message_base + 54 + 1) % 256;
  order_execution_message_record.sub_liquidity_indicator = (order_execution_message_base + 55 + 1) % 256;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.contra_broker[order_execution_message_at] = (order_execution_message_base + 56 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.side = (order_execution_message_base + 60 + 1) % 256;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.symbol[order_execution_message_at] = (order_execution_message_base + 61 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.contra_trader[order_execution_message_at] = (order_execution_message_base + 69 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.clearing_firm[order_execution_message_at] = (order_execution_message_base + 73 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.contra_capacity = (order_execution_message_base + 77 + 1) % 256;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 2 -> order_execution_message_record.fee_code[order_execution_message_at] = (order_execution_message_base + 78 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 2 -> order_execution_message_record.marketing_fee_code[order_execution_message_at] = (order_execution_message_base + 80 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.routing_firm_id[order_execution_message_at] = (order_execution_message_base + 82 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.cross_exclusion_indicator = (order_execution_message_base + 86 + 1) % 256;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.trade_date[order_execution_message_at] = (order_execution_message_base + 87 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.multileg_reporting_type = (order_execution_message_base + 91 + 1) % 256;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.secondary_exec_id[order_execution_message_at] = (order_execution_message_base + 92 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.price_type = (order_execution_message_base + 100 + 1) % 256;
  order_execution_message_record.trade_through_alert_type = (order_execution_message_base + 101 + 1) % 256;
  order_execution_message_record.sender_location_id = (order_execution_message_base + 102 + 1) % 256;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 3 -> order_execution_message_record.floor_trader_acronym[order_execution_message_at] = (order_execution_message_base + 103 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.floor_trade_time[order_execution_message_at] = (order_execution_message_base + 106 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.ex_destination = (order_execution_message_base + 114 + 1) % 256;
  order_execution_message_record.equity_ex_destination = (order_execution_message_base + 115 + 1) % 256;
  skip
}

/* Order Execution Message to the wire, 116 bytes from where the cursor stands */
inline encode_order_execution_message(order_execution_message_record) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 2 -> wire[at] = order_execution_message_record.in_flight[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
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
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> wire[at] = order_execution_message_record.contra_broker[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_message_record.side; at = at + 1;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> wire[at] = order_execution_message_record.symbol[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> wire[at] = order_execution_message_record.contra_trader[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> wire[at] = order_execution_message_record.clearing_firm[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_message_record.contra_capacity; at = at + 1;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 2 -> wire[at] = order_execution_message_record.fee_code[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 2 -> wire[at] = order_execution_message_record.marketing_fee_code[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> wire[at] = order_execution_message_record.routing_firm_id[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_message_record.cross_exclusion_indicator; at = at + 1;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> wire[at] = order_execution_message_record.trade_date[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_message_record.multileg_reporting_type; at = at + 1;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> wire[at] = order_execution_message_record.secondary_exec_id[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_message_record.price_type; at = at + 1;
  wire[at] = order_execution_message_record.trade_through_alert_type; at = at + 1;
  wire[at] = order_execution_message_record.sender_location_id; at = at + 1;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 3 -> wire[at] = order_execution_message_record.floor_trader_acronym[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> wire[at] = order_execution_message_record.floor_trade_time[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_message_record.ex_destination; at = at + 1;
  wire[at] = order_execution_message_record.equity_ex_destination; at = at + 1;
  skip
}

/* Order Execution Message off the wire, 116 bytes from where the cursor stands */
inline decode_order_execution_message(order_execution_message_record) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 2 -> order_execution_message_record.in_flight[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
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
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.contra_broker[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.side = wire[at]; at = at + 1;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.symbol[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.contra_trader[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.clearing_firm[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.contra_capacity = wire[at]; at = at + 1;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 2 -> order_execution_message_record.fee_code[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 2 -> order_execution_message_record.marketing_fee_code[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.routing_firm_id[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.cross_exclusion_indicator = wire[at]; at = at + 1;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.trade_date[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.multileg_reporting_type = wire[at]; at = at + 1;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.secondary_exec_id[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.price_type = wire[at]; at = at + 1;
  order_execution_message_record.trade_through_alert_type = wire[at]; at = at + 1;
  order_execution_message_record.sender_location_id = wire[at]; at = at + 1;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 3 -> order_execution_message_record.floor_trader_acronym[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.floor_trade_time[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.ex_destination = wire[at]; at = at + 1;
  order_execution_message_record.equity_ex_destination = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Execution Message is what was written, byte for byte */
inline equal_order_execution_message(order_execution_message_read, order_execution_message_written) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 2 -> assert(order_execution_message_read.in_flight[order_execution_message_at] == order_execution_message_written.in_flight[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
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
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> assert(order_execution_message_read.contra_broker[order_execution_message_at] == order_execution_message_written.contra_broker[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  assert(order_execution_message_read.side == order_execution_message_written.side);
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> assert(order_execution_message_read.symbol[order_execution_message_at] == order_execution_message_written.symbol[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> assert(order_execution_message_read.contra_trader[order_execution_message_at] == order_execution_message_written.contra_trader[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> assert(order_execution_message_read.clearing_firm[order_execution_message_at] == order_execution_message_written.clearing_firm[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  assert(order_execution_message_read.contra_capacity == order_execution_message_written.contra_capacity);
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 2 -> assert(order_execution_message_read.fee_code[order_execution_message_at] == order_execution_message_written.fee_code[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 2 -> assert(order_execution_message_read.marketing_fee_code[order_execution_message_at] == order_execution_message_written.marketing_fee_code[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> assert(order_execution_message_read.routing_firm_id[order_execution_message_at] == order_execution_message_written.routing_firm_id[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  assert(order_execution_message_read.cross_exclusion_indicator == order_execution_message_written.cross_exclusion_indicator);
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> assert(order_execution_message_read.trade_date[order_execution_message_at] == order_execution_message_written.trade_date[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  assert(order_execution_message_read.multileg_reporting_type == order_execution_message_written.multileg_reporting_type);
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> assert(order_execution_message_read.secondary_exec_id[order_execution_message_at] == order_execution_message_written.secondary_exec_id[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  assert(order_execution_message_read.price_type == order_execution_message_written.price_type);
  assert(order_execution_message_read.trade_through_alert_type == order_execution_message_written.trade_through_alert_type);
  assert(order_execution_message_read.sender_location_id == order_execution_message_written.sender_location_id);
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 3 -> assert(order_execution_message_read.floor_trader_acronym[order_execution_message_at] == order_execution_message_written.floor_trader_acronym[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> assert(order_execution_message_read.floor_trade_time[order_execution_message_at] == order_execution_message_written.floor_trade_time[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  assert(order_execution_message_read.ex_destination == order_execution_message_written.ex_destination);
  assert(order_execution_message_read.equity_ex_destination == order_execution_message_written.equity_ex_destination);
  skip
}

/* ---- Quote Execution Message: 84 bytes --------------------------------------- */

/* A Quote Execution message is used to indicate an execution has occurred on a resting quote */
typedef QuoteExecutionMessage {
  byte in_flight[2];
  byte transaction_time[8];
  byte quote_update_id[16];
  byte order_id[8];
  byte exec_id[8];
  byte quote_symbol[6];
  byte clearing_firm[4];
  byte last_shares[4];
  byte last_px[8];
  byte leaves_qty[4];
  byte contra_trader[4];
  byte contra_capacity;
  byte side;
  byte base_liquidity_indicator;
  byte sub_liquidity_indicator;
  byte fee_code[2];
  byte marketing_fee_code[2];
  byte trade_date[4]
};

int quote_execution_message_at;

/* every byte of Quote Execution Message set to one value */
inline fill_quote_execution_message(quote_execution_message_record, quote_execution_message_value) {
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 2 -> quote_execution_message_record.in_flight[quote_execution_message_at] = quote_execution_message_value; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
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
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> quote_execution_message_record.contra_trader[quote_execution_message_at] = quote_execution_message_value; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_record.contra_capacity = quote_execution_message_value;
  quote_execution_message_record.side = quote_execution_message_value;
  quote_execution_message_record.base_liquidity_indicator = quote_execution_message_value;
  quote_execution_message_record.sub_liquidity_indicator = quote_execution_message_value;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 2 -> quote_execution_message_record.fee_code[quote_execution_message_at] = quote_execution_message_value; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 2 -> quote_execution_message_record.marketing_fee_code[quote_execution_message_at] = quote_execution_message_value; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> quote_execution_message_record.trade_date[quote_execution_message_at] = quote_execution_message_value; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Execution Message set to where it lies, so a field read out of place says so */
inline ramp_quote_execution_message(quote_execution_message_record, quote_execution_message_base) {
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 2 -> quote_execution_message_record.in_flight[quote_execution_message_at] = (quote_execution_message_base + 0 + quote_execution_message_at + 1) % 256; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 8 -> quote_execution_message_record.transaction_time[quote_execution_message_at] = (quote_execution_message_base + 2 + quote_execution_message_at + 1) % 256; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 16 -> quote_execution_message_record.quote_update_id[quote_execution_message_at] = (quote_execution_message_base + 10 + quote_execution_message_at + 1) % 256; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 8 -> quote_execution_message_record.order_id[quote_execution_message_at] = (quote_execution_message_base + 26 + quote_execution_message_at + 1) % 256; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 8 -> quote_execution_message_record.exec_id[quote_execution_message_at] = (quote_execution_message_base + 34 + quote_execution_message_at + 1) % 256; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 6 -> quote_execution_message_record.quote_symbol[quote_execution_message_at] = (quote_execution_message_base + 42 + quote_execution_message_at + 1) % 256; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> quote_execution_message_record.clearing_firm[quote_execution_message_at] = (quote_execution_message_base + 48 + quote_execution_message_at + 1) % 256; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> quote_execution_message_record.last_shares[quote_execution_message_at] = (quote_execution_message_base + 52 + quote_execution_message_at + 1) % 256; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 8 -> quote_execution_message_record.last_px[quote_execution_message_at] = (quote_execution_message_base + 56 + quote_execution_message_at + 1) % 256; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> quote_execution_message_record.leaves_qty[quote_execution_message_at] = (quote_execution_message_base + 64 + quote_execution_message_at + 1) % 256; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> quote_execution_message_record.contra_trader[quote_execution_message_at] = (quote_execution_message_base + 68 + quote_execution_message_at + 1) % 256; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_record.contra_capacity = (quote_execution_message_base + 72 + 1) % 256;
  quote_execution_message_record.side = (quote_execution_message_base + 73 + 1) % 256;
  quote_execution_message_record.base_liquidity_indicator = (quote_execution_message_base + 74 + 1) % 256;
  quote_execution_message_record.sub_liquidity_indicator = (quote_execution_message_base + 75 + 1) % 256;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 2 -> quote_execution_message_record.fee_code[quote_execution_message_at] = (quote_execution_message_base + 76 + quote_execution_message_at + 1) % 256; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 2 -> quote_execution_message_record.marketing_fee_code[quote_execution_message_at] = (quote_execution_message_base + 78 + quote_execution_message_at + 1) % 256; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> quote_execution_message_record.trade_date[quote_execution_message_at] = (quote_execution_message_base + 80 + quote_execution_message_at + 1) % 256; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Execution Message to the wire, 84 bytes from where the cursor stands */
inline encode_quote_execution_message(quote_execution_message_record) {
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 2 -> wire[at] = quote_execution_message_record.in_flight[quote_execution_message_at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
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
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> wire[at] = quote_execution_message_record.contra_trader[quote_execution_message_at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_execution_message_record.contra_capacity; at = at + 1;
  wire[at] = quote_execution_message_record.side; at = at + 1;
  wire[at] = quote_execution_message_record.base_liquidity_indicator; at = at + 1;
  wire[at] = quote_execution_message_record.sub_liquidity_indicator; at = at + 1;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 2 -> wire[at] = quote_execution_message_record.fee_code[quote_execution_message_at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 2 -> wire[at] = quote_execution_message_record.marketing_fee_code[quote_execution_message_at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> wire[at] = quote_execution_message_record.trade_date[quote_execution_message_at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Execution Message off the wire, 84 bytes from where the cursor stands */
inline decode_quote_execution_message(quote_execution_message_record) {
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 2 -> quote_execution_message_record.in_flight[quote_execution_message_at] = wire[at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
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
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> quote_execution_message_record.contra_trader[quote_execution_message_at] = wire[at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_record.contra_capacity = wire[at]; at = at + 1;
  quote_execution_message_record.side = wire[at]; at = at + 1;
  quote_execution_message_record.base_liquidity_indicator = wire[at]; at = at + 1;
  quote_execution_message_record.sub_liquidity_indicator = wire[at]; at = at + 1;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 2 -> quote_execution_message_record.fee_code[quote_execution_message_at] = wire[at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 2 -> quote_execution_message_record.marketing_fee_code[quote_execution_message_at] = wire[at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> quote_execution_message_record.trade_date[quote_execution_message_at] = wire[at]; at = at + 1; quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Execution Message is what was written, byte for byte */
inline equal_quote_execution_message(quote_execution_message_read, quote_execution_message_written) {
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 2 -> assert(quote_execution_message_read.in_flight[quote_execution_message_at] == quote_execution_message_written.in_flight[quote_execution_message_at]); quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
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
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> assert(quote_execution_message_read.contra_trader[quote_execution_message_at] == quote_execution_message_written.contra_trader[quote_execution_message_at]); quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  assert(quote_execution_message_read.contra_capacity == quote_execution_message_written.contra_capacity);
  assert(quote_execution_message_read.side == quote_execution_message_written.side);
  assert(quote_execution_message_read.base_liquidity_indicator == quote_execution_message_written.base_liquidity_indicator);
  assert(quote_execution_message_read.sub_liquidity_indicator == quote_execution_message_written.sub_liquidity_indicator);
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 2 -> assert(quote_execution_message_read.fee_code[quote_execution_message_at] == quote_execution_message_written.fee_code[quote_execution_message_at]); quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 2 -> assert(quote_execution_message_read.marketing_fee_code[quote_execution_message_at] == quote_execution_message_written.marketing_fee_code[quote_execution_message_at]); quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  quote_execution_message_at = 0;
  do
  :: quote_execution_message_at < 4 -> assert(quote_execution_message_read.trade_date[quote_execution_message_at] == quote_execution_message_written.trade_date[quote_execution_message_at]); quote_execution_message_at = quote_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Cancel Correct Message: 122 bytes --------------------------------- */

/* Used to relay a trade which has been cancelled (busted) or corrected */
typedef TradeCancelCorrectMessage {
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
  byte corrected_size[4];
  byte orig_time[8];
  byte symbol[8];
  byte maturity_date[4];
  byte strike_price[8];
  byte put_or_call;
  byte capacity;
  byte open_close;
  byte marketing_fee_code[2];
  byte target_party_id[4];
  byte cmta_number[4]
};

int trade_cancel_correct_message_at;

/* every byte of Trade Cancel Correct Message set to one value */
inline fill_trade_cancel_correct_message(trade_cancel_correct_message_record, trade_cancel_correct_message_value) {
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 2 -> trade_cancel_correct_message_record.in_flight[trade_cancel_correct_message_at] = trade_cancel_correct_message_value; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> trade_cancel_correct_message_record.transaction_time[trade_cancel_correct_message_at] = trade_cancel_correct_message_value; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 20 -> trade_cancel_correct_message_record.cl_ord_id[trade_cancel_correct_message_at] = trade_cancel_correct_message_value; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> trade_cancel_correct_message_record.order_id[trade_cancel_correct_message_at] = trade_cancel_correct_message_value; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> trade_cancel_correct_message_record.exec_ref_id[trade_cancel_correct_message_at] = trade_cancel_correct_message_value; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_record.side = trade_cancel_correct_message_value;
  trade_cancel_correct_message_record.base_liquidity_indicator = trade_cancel_correct_message_value;
  trade_cancel_correct_message_record.sub_liquidity_indicator = trade_cancel_correct_message_value;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> trade_cancel_correct_message_record.clearing_firm[trade_cancel_correct_message_at] = trade_cancel_correct_message_value; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> trade_cancel_correct_message_record.clearing_account[trade_cancel_correct_message_at] = trade_cancel_correct_message_value; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> trade_cancel_correct_message_record.last_shares[trade_cancel_correct_message_at] = trade_cancel_correct_message_value; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> trade_cancel_correct_message_record.last_px[trade_cancel_correct_message_at] = trade_cancel_correct_message_value; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> trade_cancel_correct_message_record.corrected_price[trade_cancel_correct_message_at] = trade_cancel_correct_message_value; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> trade_cancel_correct_message_record.corrected_size[trade_cancel_correct_message_at] = trade_cancel_correct_message_value; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> trade_cancel_correct_message_record.orig_time[trade_cancel_correct_message_at] = trade_cancel_correct_message_value; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> trade_cancel_correct_message_record.symbol[trade_cancel_correct_message_at] = trade_cancel_correct_message_value; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> trade_cancel_correct_message_record.maturity_date[trade_cancel_correct_message_at] = trade_cancel_correct_message_value; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> trade_cancel_correct_message_record.strike_price[trade_cancel_correct_message_at] = trade_cancel_correct_message_value; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_record.put_or_call = trade_cancel_correct_message_value;
  trade_cancel_correct_message_record.capacity = trade_cancel_correct_message_value;
  trade_cancel_correct_message_record.open_close = trade_cancel_correct_message_value;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 2 -> trade_cancel_correct_message_record.marketing_fee_code[trade_cancel_correct_message_at] = trade_cancel_correct_message_value; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> trade_cancel_correct_message_record.target_party_id[trade_cancel_correct_message_at] = trade_cancel_correct_message_value; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> trade_cancel_correct_message_record.cmta_number[trade_cancel_correct_message_at] = trade_cancel_correct_message_value; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Cancel Correct Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancel_correct_message(trade_cancel_correct_message_record, trade_cancel_correct_message_base) {
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 2 -> trade_cancel_correct_message_record.in_flight[trade_cancel_correct_message_at] = (trade_cancel_correct_message_base + 0 + trade_cancel_correct_message_at + 1) % 256; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> trade_cancel_correct_message_record.transaction_time[trade_cancel_correct_message_at] = (trade_cancel_correct_message_base + 2 + trade_cancel_correct_message_at + 1) % 256; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 20 -> trade_cancel_correct_message_record.cl_ord_id[trade_cancel_correct_message_at] = (trade_cancel_correct_message_base + 10 + trade_cancel_correct_message_at + 1) % 256; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> trade_cancel_correct_message_record.order_id[trade_cancel_correct_message_at] = (trade_cancel_correct_message_base + 30 + trade_cancel_correct_message_at + 1) % 256; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> trade_cancel_correct_message_record.exec_ref_id[trade_cancel_correct_message_at] = (trade_cancel_correct_message_base + 38 + trade_cancel_correct_message_at + 1) % 256; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_record.side = (trade_cancel_correct_message_base + 46 + 1) % 256;
  trade_cancel_correct_message_record.base_liquidity_indicator = (trade_cancel_correct_message_base + 47 + 1) % 256;
  trade_cancel_correct_message_record.sub_liquidity_indicator = (trade_cancel_correct_message_base + 48 + 1) % 256;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> trade_cancel_correct_message_record.clearing_firm[trade_cancel_correct_message_at] = (trade_cancel_correct_message_base + 49 + trade_cancel_correct_message_at + 1) % 256; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> trade_cancel_correct_message_record.clearing_account[trade_cancel_correct_message_at] = (trade_cancel_correct_message_base + 53 + trade_cancel_correct_message_at + 1) % 256; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> trade_cancel_correct_message_record.last_shares[trade_cancel_correct_message_at] = (trade_cancel_correct_message_base + 57 + trade_cancel_correct_message_at + 1) % 256; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> trade_cancel_correct_message_record.last_px[trade_cancel_correct_message_at] = (trade_cancel_correct_message_base + 61 + trade_cancel_correct_message_at + 1) % 256; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> trade_cancel_correct_message_record.corrected_price[trade_cancel_correct_message_at] = (trade_cancel_correct_message_base + 69 + trade_cancel_correct_message_at + 1) % 256; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> trade_cancel_correct_message_record.corrected_size[trade_cancel_correct_message_at] = (trade_cancel_correct_message_base + 77 + trade_cancel_correct_message_at + 1) % 256; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> trade_cancel_correct_message_record.orig_time[trade_cancel_correct_message_at] = (trade_cancel_correct_message_base + 81 + trade_cancel_correct_message_at + 1) % 256; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> trade_cancel_correct_message_record.symbol[trade_cancel_correct_message_at] = (trade_cancel_correct_message_base + 89 + trade_cancel_correct_message_at + 1) % 256; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> trade_cancel_correct_message_record.maturity_date[trade_cancel_correct_message_at] = (trade_cancel_correct_message_base + 97 + trade_cancel_correct_message_at + 1) % 256; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> trade_cancel_correct_message_record.strike_price[trade_cancel_correct_message_at] = (trade_cancel_correct_message_base + 101 + trade_cancel_correct_message_at + 1) % 256; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_record.put_or_call = (trade_cancel_correct_message_base + 109 + 1) % 256;
  trade_cancel_correct_message_record.capacity = (trade_cancel_correct_message_base + 110 + 1) % 256;
  trade_cancel_correct_message_record.open_close = (trade_cancel_correct_message_base + 111 + 1) % 256;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 2 -> trade_cancel_correct_message_record.marketing_fee_code[trade_cancel_correct_message_at] = (trade_cancel_correct_message_base + 112 + trade_cancel_correct_message_at + 1) % 256; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> trade_cancel_correct_message_record.target_party_id[trade_cancel_correct_message_at] = (trade_cancel_correct_message_base + 114 + trade_cancel_correct_message_at + 1) % 256; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> trade_cancel_correct_message_record.cmta_number[trade_cancel_correct_message_at] = (trade_cancel_correct_message_base + 118 + trade_cancel_correct_message_at + 1) % 256; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel Correct Message to the wire, 122 bytes from where the cursor stands */
inline encode_trade_cancel_correct_message(trade_cancel_correct_message_record) {
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 2 -> wire[at] = trade_cancel_correct_message_record.in_flight[trade_cancel_correct_message_at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> wire[at] = trade_cancel_correct_message_record.transaction_time[trade_cancel_correct_message_at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 20 -> wire[at] = trade_cancel_correct_message_record.cl_ord_id[trade_cancel_correct_message_at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> wire[at] = trade_cancel_correct_message_record.order_id[trade_cancel_correct_message_at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> wire[at] = trade_cancel_correct_message_record.exec_ref_id[trade_cancel_correct_message_at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_correct_message_record.side; at = at + 1;
  wire[at] = trade_cancel_correct_message_record.base_liquidity_indicator; at = at + 1;
  wire[at] = trade_cancel_correct_message_record.sub_liquidity_indicator; at = at + 1;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> wire[at] = trade_cancel_correct_message_record.clearing_firm[trade_cancel_correct_message_at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> wire[at] = trade_cancel_correct_message_record.clearing_account[trade_cancel_correct_message_at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> wire[at] = trade_cancel_correct_message_record.last_shares[trade_cancel_correct_message_at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> wire[at] = trade_cancel_correct_message_record.last_px[trade_cancel_correct_message_at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> wire[at] = trade_cancel_correct_message_record.corrected_price[trade_cancel_correct_message_at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> wire[at] = trade_cancel_correct_message_record.corrected_size[trade_cancel_correct_message_at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> wire[at] = trade_cancel_correct_message_record.orig_time[trade_cancel_correct_message_at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> wire[at] = trade_cancel_correct_message_record.symbol[trade_cancel_correct_message_at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> wire[at] = trade_cancel_correct_message_record.maturity_date[trade_cancel_correct_message_at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> wire[at] = trade_cancel_correct_message_record.strike_price[trade_cancel_correct_message_at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_correct_message_record.put_or_call; at = at + 1;
  wire[at] = trade_cancel_correct_message_record.capacity; at = at + 1;
  wire[at] = trade_cancel_correct_message_record.open_close; at = at + 1;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 2 -> wire[at] = trade_cancel_correct_message_record.marketing_fee_code[trade_cancel_correct_message_at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> wire[at] = trade_cancel_correct_message_record.target_party_id[trade_cancel_correct_message_at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> wire[at] = trade_cancel_correct_message_record.cmta_number[trade_cancel_correct_message_at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel Correct Message off the wire, 122 bytes from where the cursor stands */
inline decode_trade_cancel_correct_message(trade_cancel_correct_message_record) {
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 2 -> trade_cancel_correct_message_record.in_flight[trade_cancel_correct_message_at] = wire[at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> trade_cancel_correct_message_record.transaction_time[trade_cancel_correct_message_at] = wire[at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 20 -> trade_cancel_correct_message_record.cl_ord_id[trade_cancel_correct_message_at] = wire[at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> trade_cancel_correct_message_record.order_id[trade_cancel_correct_message_at] = wire[at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> trade_cancel_correct_message_record.exec_ref_id[trade_cancel_correct_message_at] = wire[at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_record.side = wire[at]; at = at + 1;
  trade_cancel_correct_message_record.base_liquidity_indicator = wire[at]; at = at + 1;
  trade_cancel_correct_message_record.sub_liquidity_indicator = wire[at]; at = at + 1;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> trade_cancel_correct_message_record.clearing_firm[trade_cancel_correct_message_at] = wire[at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> trade_cancel_correct_message_record.clearing_account[trade_cancel_correct_message_at] = wire[at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> trade_cancel_correct_message_record.last_shares[trade_cancel_correct_message_at] = wire[at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> trade_cancel_correct_message_record.last_px[trade_cancel_correct_message_at] = wire[at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> trade_cancel_correct_message_record.corrected_price[trade_cancel_correct_message_at] = wire[at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> trade_cancel_correct_message_record.corrected_size[trade_cancel_correct_message_at] = wire[at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> trade_cancel_correct_message_record.orig_time[trade_cancel_correct_message_at] = wire[at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> trade_cancel_correct_message_record.symbol[trade_cancel_correct_message_at] = wire[at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> trade_cancel_correct_message_record.maturity_date[trade_cancel_correct_message_at] = wire[at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> trade_cancel_correct_message_record.strike_price[trade_cancel_correct_message_at] = wire[at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_record.put_or_call = wire[at]; at = at + 1;
  trade_cancel_correct_message_record.capacity = wire[at]; at = at + 1;
  trade_cancel_correct_message_record.open_close = wire[at]; at = at + 1;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 2 -> trade_cancel_correct_message_record.marketing_fee_code[trade_cancel_correct_message_at] = wire[at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> trade_cancel_correct_message_record.target_party_id[trade_cancel_correct_message_at] = wire[at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> trade_cancel_correct_message_record.cmta_number[trade_cancel_correct_message_at] = wire[at]; at = at + 1; trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Cancel Correct Message is what was written, byte for byte */
inline equal_trade_cancel_correct_message(trade_cancel_correct_message_read, trade_cancel_correct_message_written) {
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 2 -> assert(trade_cancel_correct_message_read.in_flight[trade_cancel_correct_message_at] == trade_cancel_correct_message_written.in_flight[trade_cancel_correct_message_at]); trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> assert(trade_cancel_correct_message_read.transaction_time[trade_cancel_correct_message_at] == trade_cancel_correct_message_written.transaction_time[trade_cancel_correct_message_at]); trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 20 -> assert(trade_cancel_correct_message_read.cl_ord_id[trade_cancel_correct_message_at] == trade_cancel_correct_message_written.cl_ord_id[trade_cancel_correct_message_at]); trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> assert(trade_cancel_correct_message_read.order_id[trade_cancel_correct_message_at] == trade_cancel_correct_message_written.order_id[trade_cancel_correct_message_at]); trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> assert(trade_cancel_correct_message_read.exec_ref_id[trade_cancel_correct_message_at] == trade_cancel_correct_message_written.exec_ref_id[trade_cancel_correct_message_at]); trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_correct_message_read.side == trade_cancel_correct_message_written.side);
  assert(trade_cancel_correct_message_read.base_liquidity_indicator == trade_cancel_correct_message_written.base_liquidity_indicator);
  assert(trade_cancel_correct_message_read.sub_liquidity_indicator == trade_cancel_correct_message_written.sub_liquidity_indicator);
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> assert(trade_cancel_correct_message_read.clearing_firm[trade_cancel_correct_message_at] == trade_cancel_correct_message_written.clearing_firm[trade_cancel_correct_message_at]); trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> assert(trade_cancel_correct_message_read.clearing_account[trade_cancel_correct_message_at] == trade_cancel_correct_message_written.clearing_account[trade_cancel_correct_message_at]); trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> assert(trade_cancel_correct_message_read.last_shares[trade_cancel_correct_message_at] == trade_cancel_correct_message_written.last_shares[trade_cancel_correct_message_at]); trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> assert(trade_cancel_correct_message_read.last_px[trade_cancel_correct_message_at] == trade_cancel_correct_message_written.last_px[trade_cancel_correct_message_at]); trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> assert(trade_cancel_correct_message_read.corrected_price[trade_cancel_correct_message_at] == trade_cancel_correct_message_written.corrected_price[trade_cancel_correct_message_at]); trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> assert(trade_cancel_correct_message_read.corrected_size[trade_cancel_correct_message_at] == trade_cancel_correct_message_written.corrected_size[trade_cancel_correct_message_at]); trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> assert(trade_cancel_correct_message_read.orig_time[trade_cancel_correct_message_at] == trade_cancel_correct_message_written.orig_time[trade_cancel_correct_message_at]); trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> assert(trade_cancel_correct_message_read.symbol[trade_cancel_correct_message_at] == trade_cancel_correct_message_written.symbol[trade_cancel_correct_message_at]); trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> assert(trade_cancel_correct_message_read.maturity_date[trade_cancel_correct_message_at] == trade_cancel_correct_message_written.maturity_date[trade_cancel_correct_message_at]); trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 8 -> assert(trade_cancel_correct_message_read.strike_price[trade_cancel_correct_message_at] == trade_cancel_correct_message_written.strike_price[trade_cancel_correct_message_at]); trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_correct_message_read.put_or_call == trade_cancel_correct_message_written.put_or_call);
  assert(trade_cancel_correct_message_read.capacity == trade_cancel_correct_message_written.capacity);
  assert(trade_cancel_correct_message_read.open_close == trade_cancel_correct_message_written.open_close);
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 2 -> assert(trade_cancel_correct_message_read.marketing_fee_code[trade_cancel_correct_message_at] == trade_cancel_correct_message_written.marketing_fee_code[trade_cancel_correct_message_at]); trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> assert(trade_cancel_correct_message_read.target_party_id[trade_cancel_correct_message_at] == trade_cancel_correct_message_written.target_party_id[trade_cancel_correct_message_at]); trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  trade_cancel_correct_message_at = 0;
  do
  :: trade_cancel_correct_message_at < 4 -> assert(trade_cancel_correct_message_read.cmta_number[trade_cancel_correct_message_at] == trade_cancel_correct_message_written.cmta_number[trade_cancel_correct_message_at]); trade_cancel_correct_message_at = trade_cancel_correct_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Purge Rejected Message: 91 bytes ---------------------------------------- */

/* A Purge Rejected message is sent in response to a Purge Orders message to indicate that the mass cancellation cannot occur */
typedef PurgeRejectedMessage {
  byte in_flight[2];
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
  :: purge_rejected_message_at < 2 -> purge_rejected_message_record.in_flight[purge_rejected_message_at] = purge_rejected_message_value; purge_rejected_message_at = purge_rejected_message_at + 1
  :: else -> break
  od;
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
  :: purge_rejected_message_at < 2 -> purge_rejected_message_record.in_flight[purge_rejected_message_at] = (purge_rejected_message_base + 0 + purge_rejected_message_at + 1) % 256; purge_rejected_message_at = purge_rejected_message_at + 1
  :: else -> break
  od;
  purge_rejected_message_at = 0;
  do
  :: purge_rejected_message_at < 8 -> purge_rejected_message_record.transaction_time[purge_rejected_message_at] = (purge_rejected_message_base + 2 + purge_rejected_message_at + 1) % 256; purge_rejected_message_at = purge_rejected_message_at + 1
  :: else -> break
  od;
  purge_rejected_message_at = 0;
  do
  :: purge_rejected_message_at < 20 -> purge_rejected_message_record.mass_cancel_id[purge_rejected_message_at] = (purge_rejected_message_base + 10 + purge_rejected_message_at + 1) % 256; purge_rejected_message_at = purge_rejected_message_at + 1
  :: else -> break
  od;
  purge_rejected_message_record.purge_reject_reason = (purge_rejected_message_base + 30 + 1) % 256;
  purge_rejected_message_at = 0;
  do
  :: purge_rejected_message_at < 60 -> purge_rejected_message_record.text[purge_rejected_message_at] = (purge_rejected_message_base + 31 + purge_rejected_message_at + 1) % 256; purge_rejected_message_at = purge_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* Purge Rejected Message to the wire, 91 bytes from where the cursor stands */
inline encode_purge_rejected_message(purge_rejected_message_record) {
  purge_rejected_message_at = 0;
  do
  :: purge_rejected_message_at < 2 -> wire[at] = purge_rejected_message_record.in_flight[purge_rejected_message_at]; at = at + 1; purge_rejected_message_at = purge_rejected_message_at + 1
  :: else -> break
  od;
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

/* Purge Rejected Message off the wire, 91 bytes from where the cursor stands */
inline decode_purge_rejected_message(purge_rejected_message_record) {
  purge_rejected_message_at = 0;
  do
  :: purge_rejected_message_at < 2 -> purge_rejected_message_record.in_flight[purge_rejected_message_at] = wire[at]; at = at + 1; purge_rejected_message_at = purge_rejected_message_at + 1
  :: else -> break
  od;
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
  :: purge_rejected_message_at < 2 -> assert(purge_rejected_message_read.in_flight[purge_rejected_message_at] == purge_rejected_message_written.in_flight[purge_rejected_message_at]); purge_rejected_message_at = purge_rejected_message_at + 1
  :: else -> break
  od;
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

/* ---- Reset Risk Acknowledgement Message: 27 bytes ---------------------------- */

/* Response to a Reset Risk message request */
typedef ResetRiskAcknowledgementMessage {
  byte in_flight[2];
  byte risk_status_id[16];
  byte risk_reset_result;
  byte request_received_time[8]
};

int reset_risk_acknowledgement_message_at;

/* every byte of Reset Risk Acknowledgement Message set to one value */
inline fill_reset_risk_acknowledgement_message(reset_risk_acknowledgement_message_record, reset_risk_acknowledgement_message_value) {
  reset_risk_acknowledgement_message_at = 0;
  do
  :: reset_risk_acknowledgement_message_at < 2 -> reset_risk_acknowledgement_message_record.in_flight[reset_risk_acknowledgement_message_at] = reset_risk_acknowledgement_message_value; reset_risk_acknowledgement_message_at = reset_risk_acknowledgement_message_at + 1
  :: else -> break
  od;
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
  :: reset_risk_acknowledgement_message_at < 2 -> reset_risk_acknowledgement_message_record.in_flight[reset_risk_acknowledgement_message_at] = (reset_risk_acknowledgement_message_base + 0 + reset_risk_acknowledgement_message_at + 1) % 256; reset_risk_acknowledgement_message_at = reset_risk_acknowledgement_message_at + 1
  :: else -> break
  od;
  reset_risk_acknowledgement_message_at = 0;
  do
  :: reset_risk_acknowledgement_message_at < 16 -> reset_risk_acknowledgement_message_record.risk_status_id[reset_risk_acknowledgement_message_at] = (reset_risk_acknowledgement_message_base + 2 + reset_risk_acknowledgement_message_at + 1) % 256; reset_risk_acknowledgement_message_at = reset_risk_acknowledgement_message_at + 1
  :: else -> break
  od;
  reset_risk_acknowledgement_message_record.risk_reset_result = (reset_risk_acknowledgement_message_base + 18 + 1) % 256;
  reset_risk_acknowledgement_message_at = 0;
  do
  :: reset_risk_acknowledgement_message_at < 8 -> reset_risk_acknowledgement_message_record.request_received_time[reset_risk_acknowledgement_message_at] = (reset_risk_acknowledgement_message_base + 19 + reset_risk_acknowledgement_message_at + 1) % 256; reset_risk_acknowledgement_message_at = reset_risk_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reset Risk Acknowledgement Message to the wire, 27 bytes from where the cursor stands */
inline encode_reset_risk_acknowledgement_message(reset_risk_acknowledgement_message_record) {
  reset_risk_acknowledgement_message_at = 0;
  do
  :: reset_risk_acknowledgement_message_at < 2 -> wire[at] = reset_risk_acknowledgement_message_record.in_flight[reset_risk_acknowledgement_message_at]; at = at + 1; reset_risk_acknowledgement_message_at = reset_risk_acknowledgement_message_at + 1
  :: else -> break
  od;
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

/* Reset Risk Acknowledgement Message off the wire, 27 bytes from where the cursor stands */
inline decode_reset_risk_acknowledgement_message(reset_risk_acknowledgement_message_record) {
  reset_risk_acknowledgement_message_at = 0;
  do
  :: reset_risk_acknowledgement_message_at < 2 -> reset_risk_acknowledgement_message_record.in_flight[reset_risk_acknowledgement_message_at] = wire[at]; at = at + 1; reset_risk_acknowledgement_message_at = reset_risk_acknowledgement_message_at + 1
  :: else -> break
  od;
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
  :: reset_risk_acknowledgement_message_at < 2 -> assert(reset_risk_acknowledgement_message_read.in_flight[reset_risk_acknowledgement_message_at] == reset_risk_acknowledgement_message_written.in_flight[reset_risk_acknowledgement_message_at]); reset_risk_acknowledgement_message_at = reset_risk_acknowledgement_message_at + 1
  :: else -> break
  od;
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

/* ---- Mass Cancel Acknowledgment Message: 42 bytes ---------------------------- */

/* A Mass Cancel Acknowledgment message is an unsequenced message sent when a Mass Cancel Order message requesting a mass cancellation has completed canceling all individual orders */
typedef MassCancelAcknowledgmentMessage {
  byte in_flight[2];
  byte transaction_time[8];
  byte mass_cancel_id[20];
  byte cancelled_order_count[4];
  byte request_received_time[8]
};

int mass_cancel_acknowledgment_message_at;

/* every byte of Mass Cancel Acknowledgment Message set to one value */
inline fill_mass_cancel_acknowledgment_message(mass_cancel_acknowledgment_message_record, mass_cancel_acknowledgment_message_value) {
  mass_cancel_acknowledgment_message_at = 0;
  do
  :: mass_cancel_acknowledgment_message_at < 2 -> mass_cancel_acknowledgment_message_record.in_flight[mass_cancel_acknowledgment_message_at] = mass_cancel_acknowledgment_message_value; mass_cancel_acknowledgment_message_at = mass_cancel_acknowledgment_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgment_message_at = 0;
  do
  :: mass_cancel_acknowledgment_message_at < 8 -> mass_cancel_acknowledgment_message_record.transaction_time[mass_cancel_acknowledgment_message_at] = mass_cancel_acknowledgment_message_value; mass_cancel_acknowledgment_message_at = mass_cancel_acknowledgment_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgment_message_at = 0;
  do
  :: mass_cancel_acknowledgment_message_at < 20 -> mass_cancel_acknowledgment_message_record.mass_cancel_id[mass_cancel_acknowledgment_message_at] = mass_cancel_acknowledgment_message_value; mass_cancel_acknowledgment_message_at = mass_cancel_acknowledgment_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgment_message_at = 0;
  do
  :: mass_cancel_acknowledgment_message_at < 4 -> mass_cancel_acknowledgment_message_record.cancelled_order_count[mass_cancel_acknowledgment_message_at] = mass_cancel_acknowledgment_message_value; mass_cancel_acknowledgment_message_at = mass_cancel_acknowledgment_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgment_message_at = 0;
  do
  :: mass_cancel_acknowledgment_message_at < 8 -> mass_cancel_acknowledgment_message_record.request_received_time[mass_cancel_acknowledgment_message_at] = mass_cancel_acknowledgment_message_value; mass_cancel_acknowledgment_message_at = mass_cancel_acknowledgment_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mass Cancel Acknowledgment Message set to where it lies, so a field read out of place says so */
inline ramp_mass_cancel_acknowledgment_message(mass_cancel_acknowledgment_message_record, mass_cancel_acknowledgment_message_base) {
  mass_cancel_acknowledgment_message_at = 0;
  do
  :: mass_cancel_acknowledgment_message_at < 2 -> mass_cancel_acknowledgment_message_record.in_flight[mass_cancel_acknowledgment_message_at] = (mass_cancel_acknowledgment_message_base + 0 + mass_cancel_acknowledgment_message_at + 1) % 256; mass_cancel_acknowledgment_message_at = mass_cancel_acknowledgment_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgment_message_at = 0;
  do
  :: mass_cancel_acknowledgment_message_at < 8 -> mass_cancel_acknowledgment_message_record.transaction_time[mass_cancel_acknowledgment_message_at] = (mass_cancel_acknowledgment_message_base + 2 + mass_cancel_acknowledgment_message_at + 1) % 256; mass_cancel_acknowledgment_message_at = mass_cancel_acknowledgment_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgment_message_at = 0;
  do
  :: mass_cancel_acknowledgment_message_at < 20 -> mass_cancel_acknowledgment_message_record.mass_cancel_id[mass_cancel_acknowledgment_message_at] = (mass_cancel_acknowledgment_message_base + 10 + mass_cancel_acknowledgment_message_at + 1) % 256; mass_cancel_acknowledgment_message_at = mass_cancel_acknowledgment_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgment_message_at = 0;
  do
  :: mass_cancel_acknowledgment_message_at < 4 -> mass_cancel_acknowledgment_message_record.cancelled_order_count[mass_cancel_acknowledgment_message_at] = (mass_cancel_acknowledgment_message_base + 30 + mass_cancel_acknowledgment_message_at + 1) % 256; mass_cancel_acknowledgment_message_at = mass_cancel_acknowledgment_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgment_message_at = 0;
  do
  :: mass_cancel_acknowledgment_message_at < 8 -> mass_cancel_acknowledgment_message_record.request_received_time[mass_cancel_acknowledgment_message_at] = (mass_cancel_acknowledgment_message_base + 34 + mass_cancel_acknowledgment_message_at + 1) % 256; mass_cancel_acknowledgment_message_at = mass_cancel_acknowledgment_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Acknowledgment Message to the wire, 42 bytes from where the cursor stands */
inline encode_mass_cancel_acknowledgment_message(mass_cancel_acknowledgment_message_record) {
  mass_cancel_acknowledgment_message_at = 0;
  do
  :: mass_cancel_acknowledgment_message_at < 2 -> wire[at] = mass_cancel_acknowledgment_message_record.in_flight[mass_cancel_acknowledgment_message_at]; at = at + 1; mass_cancel_acknowledgment_message_at = mass_cancel_acknowledgment_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgment_message_at = 0;
  do
  :: mass_cancel_acknowledgment_message_at < 8 -> wire[at] = mass_cancel_acknowledgment_message_record.transaction_time[mass_cancel_acknowledgment_message_at]; at = at + 1; mass_cancel_acknowledgment_message_at = mass_cancel_acknowledgment_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgment_message_at = 0;
  do
  :: mass_cancel_acknowledgment_message_at < 20 -> wire[at] = mass_cancel_acknowledgment_message_record.mass_cancel_id[mass_cancel_acknowledgment_message_at]; at = at + 1; mass_cancel_acknowledgment_message_at = mass_cancel_acknowledgment_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgment_message_at = 0;
  do
  :: mass_cancel_acknowledgment_message_at < 4 -> wire[at] = mass_cancel_acknowledgment_message_record.cancelled_order_count[mass_cancel_acknowledgment_message_at]; at = at + 1; mass_cancel_acknowledgment_message_at = mass_cancel_acknowledgment_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgment_message_at = 0;
  do
  :: mass_cancel_acknowledgment_message_at < 8 -> wire[at] = mass_cancel_acknowledgment_message_record.request_received_time[mass_cancel_acknowledgment_message_at]; at = at + 1; mass_cancel_acknowledgment_message_at = mass_cancel_acknowledgment_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Acknowledgment Message off the wire, 42 bytes from where the cursor stands */
inline decode_mass_cancel_acknowledgment_message(mass_cancel_acknowledgment_message_record) {
  mass_cancel_acknowledgment_message_at = 0;
  do
  :: mass_cancel_acknowledgment_message_at < 2 -> mass_cancel_acknowledgment_message_record.in_flight[mass_cancel_acknowledgment_message_at] = wire[at]; at = at + 1; mass_cancel_acknowledgment_message_at = mass_cancel_acknowledgment_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgment_message_at = 0;
  do
  :: mass_cancel_acknowledgment_message_at < 8 -> mass_cancel_acknowledgment_message_record.transaction_time[mass_cancel_acknowledgment_message_at] = wire[at]; at = at + 1; mass_cancel_acknowledgment_message_at = mass_cancel_acknowledgment_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgment_message_at = 0;
  do
  :: mass_cancel_acknowledgment_message_at < 20 -> mass_cancel_acknowledgment_message_record.mass_cancel_id[mass_cancel_acknowledgment_message_at] = wire[at]; at = at + 1; mass_cancel_acknowledgment_message_at = mass_cancel_acknowledgment_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgment_message_at = 0;
  do
  :: mass_cancel_acknowledgment_message_at < 4 -> mass_cancel_acknowledgment_message_record.cancelled_order_count[mass_cancel_acknowledgment_message_at] = wire[at]; at = at + 1; mass_cancel_acknowledgment_message_at = mass_cancel_acknowledgment_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgment_message_at = 0;
  do
  :: mass_cancel_acknowledgment_message_at < 8 -> mass_cancel_acknowledgment_message_record.request_received_time[mass_cancel_acknowledgment_message_at] = wire[at]; at = at + 1; mass_cancel_acknowledgment_message_at = mass_cancel_acknowledgment_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mass Cancel Acknowledgment Message is what was written, byte for byte */
inline equal_mass_cancel_acknowledgment_message(mass_cancel_acknowledgment_message_read, mass_cancel_acknowledgment_message_written) {
  mass_cancel_acknowledgment_message_at = 0;
  do
  :: mass_cancel_acknowledgment_message_at < 2 -> assert(mass_cancel_acknowledgment_message_read.in_flight[mass_cancel_acknowledgment_message_at] == mass_cancel_acknowledgment_message_written.in_flight[mass_cancel_acknowledgment_message_at]); mass_cancel_acknowledgment_message_at = mass_cancel_acknowledgment_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgment_message_at = 0;
  do
  :: mass_cancel_acknowledgment_message_at < 8 -> assert(mass_cancel_acknowledgment_message_read.transaction_time[mass_cancel_acknowledgment_message_at] == mass_cancel_acknowledgment_message_written.transaction_time[mass_cancel_acknowledgment_message_at]); mass_cancel_acknowledgment_message_at = mass_cancel_acknowledgment_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgment_message_at = 0;
  do
  :: mass_cancel_acknowledgment_message_at < 20 -> assert(mass_cancel_acknowledgment_message_read.mass_cancel_id[mass_cancel_acknowledgment_message_at] == mass_cancel_acknowledgment_message_written.mass_cancel_id[mass_cancel_acknowledgment_message_at]); mass_cancel_acknowledgment_message_at = mass_cancel_acknowledgment_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgment_message_at = 0;
  do
  :: mass_cancel_acknowledgment_message_at < 4 -> assert(mass_cancel_acknowledgment_message_read.cancelled_order_count[mass_cancel_acknowledgment_message_at] == mass_cancel_acknowledgment_message_written.cancelled_order_count[mass_cancel_acknowledgment_message_at]); mass_cancel_acknowledgment_message_at = mass_cancel_acknowledgment_message_at + 1
  :: else -> break
  od;
  mass_cancel_acknowledgment_message_at = 0;
  do
  :: mass_cancel_acknowledgment_message_at < 8 -> assert(mass_cancel_acknowledgment_message_read.request_received_time[mass_cancel_acknowledgment_message_at] == mass_cancel_acknowledgment_message_written.request_received_time[mass_cancel_acknowledgment_message_at]); mass_cancel_acknowledgment_message_at = mass_cancel_acknowledgment_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mass Cancel Rejected Message: 91 bytes ---------------------------------- */

/* A Mass Cancel Rejected message is sent in response to a Mass Cancel message to indicate that the mass cancellation cannot occur */
typedef MassCancelRejectedMessage {
  byte in_flight[2];
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
  :: mass_cancel_rejected_message_at < 2 -> mass_cancel_rejected_message_record.in_flight[mass_cancel_rejected_message_at] = mass_cancel_rejected_message_value; mass_cancel_rejected_message_at = mass_cancel_rejected_message_at + 1
  :: else -> break
  od;
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
  :: mass_cancel_rejected_message_at < 2 -> mass_cancel_rejected_message_record.in_flight[mass_cancel_rejected_message_at] = (mass_cancel_rejected_message_base + 0 + mass_cancel_rejected_message_at + 1) % 256; mass_cancel_rejected_message_at = mass_cancel_rejected_message_at + 1
  :: else -> break
  od;
  mass_cancel_rejected_message_at = 0;
  do
  :: mass_cancel_rejected_message_at < 8 -> mass_cancel_rejected_message_record.transaction_time[mass_cancel_rejected_message_at] = (mass_cancel_rejected_message_base + 2 + mass_cancel_rejected_message_at + 1) % 256; mass_cancel_rejected_message_at = mass_cancel_rejected_message_at + 1
  :: else -> break
  od;
  mass_cancel_rejected_message_at = 0;
  do
  :: mass_cancel_rejected_message_at < 20 -> mass_cancel_rejected_message_record.mass_cancel_id[mass_cancel_rejected_message_at] = (mass_cancel_rejected_message_base + 10 + mass_cancel_rejected_message_at + 1) % 256; mass_cancel_rejected_message_at = mass_cancel_rejected_message_at + 1
  :: else -> break
  od;
  mass_cancel_rejected_message_record.mass_cancel_reject_reason = (mass_cancel_rejected_message_base + 30 + 1) % 256;
  mass_cancel_rejected_message_at = 0;
  do
  :: mass_cancel_rejected_message_at < 60 -> mass_cancel_rejected_message_record.text[mass_cancel_rejected_message_at] = (mass_cancel_rejected_message_base + 31 + mass_cancel_rejected_message_at + 1) % 256; mass_cancel_rejected_message_at = mass_cancel_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Rejected Message to the wire, 91 bytes from where the cursor stands */
inline encode_mass_cancel_rejected_message(mass_cancel_rejected_message_record) {
  mass_cancel_rejected_message_at = 0;
  do
  :: mass_cancel_rejected_message_at < 2 -> wire[at] = mass_cancel_rejected_message_record.in_flight[mass_cancel_rejected_message_at]; at = at + 1; mass_cancel_rejected_message_at = mass_cancel_rejected_message_at + 1
  :: else -> break
  od;
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

/* Mass Cancel Rejected Message off the wire, 91 bytes from where the cursor stands */
inline decode_mass_cancel_rejected_message(mass_cancel_rejected_message_record) {
  mass_cancel_rejected_message_at = 0;
  do
  :: mass_cancel_rejected_message_at < 2 -> mass_cancel_rejected_message_record.in_flight[mass_cancel_rejected_message_at] = wire[at]; at = at + 1; mass_cancel_rejected_message_at = mass_cancel_rejected_message_at + 1
  :: else -> break
  od;
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
  :: mass_cancel_rejected_message_at < 2 -> assert(mass_cancel_rejected_message_read.in_flight[mass_cancel_rejected_message_at] == mass_cancel_rejected_message_written.in_flight[mass_cancel_rejected_message_at]); mass_cancel_rejected_message_at = mass_cancel_rejected_message_at + 1
  :: else -> break
  od;
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

/* ---- Purge Acknowledgement Message: 43 bytes --------------------------------- */

/* A Purge Acknowledgment message is an unsequenced message sent when a Purge Orders message requesting an order purge has completed canceling all individual orders */
typedef PurgeAcknowledgementMessage {
  byte in_flight[2];
  byte transaction_time[8];
  byte mass_cancel_id[20];
  byte cancelled_order_count[4];
  byte source_matching_unit;
  byte request_received_time[8]
};

int purge_acknowledgement_message_at;

/* every byte of Purge Acknowledgement Message set to one value */
inline fill_purge_acknowledgement_message(purge_acknowledgement_message_record, purge_acknowledgement_message_value) {
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 2 -> purge_acknowledgement_message_record.in_flight[purge_acknowledgement_message_at] = purge_acknowledgement_message_value; purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
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
  purge_acknowledgement_message_record.source_matching_unit = purge_acknowledgement_message_value;
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
  :: purge_acknowledgement_message_at < 2 -> purge_acknowledgement_message_record.in_flight[purge_acknowledgement_message_at] = (purge_acknowledgement_message_base + 0 + purge_acknowledgement_message_at + 1) % 256; purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 8 -> purge_acknowledgement_message_record.transaction_time[purge_acknowledgement_message_at] = (purge_acknowledgement_message_base + 2 + purge_acknowledgement_message_at + 1) % 256; purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 20 -> purge_acknowledgement_message_record.mass_cancel_id[purge_acknowledgement_message_at] = (purge_acknowledgement_message_base + 10 + purge_acknowledgement_message_at + 1) % 256; purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 4 -> purge_acknowledgement_message_record.cancelled_order_count[purge_acknowledgement_message_at] = (purge_acknowledgement_message_base + 30 + purge_acknowledgement_message_at + 1) % 256; purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  purge_acknowledgement_message_record.source_matching_unit = (purge_acknowledgement_message_base + 34 + 1) % 256;
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 8 -> purge_acknowledgement_message_record.request_received_time[purge_acknowledgement_message_at] = (purge_acknowledgement_message_base + 35 + purge_acknowledgement_message_at + 1) % 256; purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Purge Acknowledgement Message to the wire, 43 bytes from where the cursor stands */
inline encode_purge_acknowledgement_message(purge_acknowledgement_message_record) {
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 2 -> wire[at] = purge_acknowledgement_message_record.in_flight[purge_acknowledgement_message_at]; at = at + 1; purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
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
  wire[at] = purge_acknowledgement_message_record.source_matching_unit; at = at + 1;
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 8 -> wire[at] = purge_acknowledgement_message_record.request_received_time[purge_acknowledgement_message_at]; at = at + 1; purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Purge Acknowledgement Message off the wire, 43 bytes from where the cursor stands */
inline decode_purge_acknowledgement_message(purge_acknowledgement_message_record) {
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 2 -> purge_acknowledgement_message_record.in_flight[purge_acknowledgement_message_at] = wire[at]; at = at + 1; purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
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
  purge_acknowledgement_message_record.source_matching_unit = wire[at]; at = at + 1;
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
  :: purge_acknowledgement_message_at < 2 -> assert(purge_acknowledgement_message_read.in_flight[purge_acknowledgement_message_at] == purge_acknowledgement_message_written.in_flight[purge_acknowledgement_message_at]); purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
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
  assert(purge_acknowledgement_message_read.source_matching_unit == purge_acknowledgement_message_written.source_matching_unit);
  purge_acknowledgement_message_at = 0;
  do
  :: purge_acknowledgement_message_at < 8 -> assert(purge_acknowledgement_message_read.request_received_time[purge_acknowledgement_message_at] == purge_acknowledgement_message_written.request_received_time[purge_acknowledgement_message_at]); purge_acknowledgement_message_at = purge_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Purge Notification Message: 46 bytes ------------------------------------ */

/* One Purge Notification message is sent for each matching unit that cancelled orders for that order entry port */
typedef PurgeNotificationMessage {
  byte in_flight[2];
  byte transaction_time[8];
  byte mass_cancel_id[20];
  byte cancelled_order_count[4];
  byte source_matching_unit;
  byte clearing_firm[4];
  byte risk_root[6];
  byte mass_cancel_lockout
};

int purge_notification_message_at;

/* every byte of Purge Notification Message set to one value */
inline fill_purge_notification_message(purge_notification_message_record, purge_notification_message_value) {
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 2 -> purge_notification_message_record.in_flight[purge_notification_message_at] = purge_notification_message_value; purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 8 -> purge_notification_message_record.transaction_time[purge_notification_message_at] = purge_notification_message_value; purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 20 -> purge_notification_message_record.mass_cancel_id[purge_notification_message_at] = purge_notification_message_value; purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 4 -> purge_notification_message_record.cancelled_order_count[purge_notification_message_at] = purge_notification_message_value; purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  purge_notification_message_record.source_matching_unit = purge_notification_message_value;
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 4 -> purge_notification_message_record.clearing_firm[purge_notification_message_at] = purge_notification_message_value; purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 6 -> purge_notification_message_record.risk_root[purge_notification_message_at] = purge_notification_message_value; purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  purge_notification_message_record.mass_cancel_lockout = purge_notification_message_value;
  skip
}

/* each byte of Purge Notification Message set to where it lies, so a field read out of place says so */
inline ramp_purge_notification_message(purge_notification_message_record, purge_notification_message_base) {
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 2 -> purge_notification_message_record.in_flight[purge_notification_message_at] = (purge_notification_message_base + 0 + purge_notification_message_at + 1) % 256; purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 8 -> purge_notification_message_record.transaction_time[purge_notification_message_at] = (purge_notification_message_base + 2 + purge_notification_message_at + 1) % 256; purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 20 -> purge_notification_message_record.mass_cancel_id[purge_notification_message_at] = (purge_notification_message_base + 10 + purge_notification_message_at + 1) % 256; purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 4 -> purge_notification_message_record.cancelled_order_count[purge_notification_message_at] = (purge_notification_message_base + 30 + purge_notification_message_at + 1) % 256; purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  purge_notification_message_record.source_matching_unit = (purge_notification_message_base + 34 + 1) % 256;
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 4 -> purge_notification_message_record.clearing_firm[purge_notification_message_at] = (purge_notification_message_base + 35 + purge_notification_message_at + 1) % 256; purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 6 -> purge_notification_message_record.risk_root[purge_notification_message_at] = (purge_notification_message_base + 39 + purge_notification_message_at + 1) % 256; purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  purge_notification_message_record.mass_cancel_lockout = (purge_notification_message_base + 45 + 1) % 256;
  skip
}

/* Purge Notification Message to the wire, 46 bytes from where the cursor stands */
inline encode_purge_notification_message(purge_notification_message_record) {
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 2 -> wire[at] = purge_notification_message_record.in_flight[purge_notification_message_at]; at = at + 1; purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 8 -> wire[at] = purge_notification_message_record.transaction_time[purge_notification_message_at]; at = at + 1; purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 20 -> wire[at] = purge_notification_message_record.mass_cancel_id[purge_notification_message_at]; at = at + 1; purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 4 -> wire[at] = purge_notification_message_record.cancelled_order_count[purge_notification_message_at]; at = at + 1; purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = purge_notification_message_record.source_matching_unit; at = at + 1;
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 4 -> wire[at] = purge_notification_message_record.clearing_firm[purge_notification_message_at]; at = at + 1; purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 6 -> wire[at] = purge_notification_message_record.risk_root[purge_notification_message_at]; at = at + 1; purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = purge_notification_message_record.mass_cancel_lockout; at = at + 1;
  skip
}

/* Purge Notification Message off the wire, 46 bytes from where the cursor stands */
inline decode_purge_notification_message(purge_notification_message_record) {
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 2 -> purge_notification_message_record.in_flight[purge_notification_message_at] = wire[at]; at = at + 1; purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 8 -> purge_notification_message_record.transaction_time[purge_notification_message_at] = wire[at]; at = at + 1; purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 20 -> purge_notification_message_record.mass_cancel_id[purge_notification_message_at] = wire[at]; at = at + 1; purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 4 -> purge_notification_message_record.cancelled_order_count[purge_notification_message_at] = wire[at]; at = at + 1; purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  purge_notification_message_record.source_matching_unit = wire[at]; at = at + 1;
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 4 -> purge_notification_message_record.clearing_firm[purge_notification_message_at] = wire[at]; at = at + 1; purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 6 -> purge_notification_message_record.risk_root[purge_notification_message_at] = wire[at]; at = at + 1; purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  purge_notification_message_record.mass_cancel_lockout = wire[at]; at = at + 1;
  skip
}

/* what was read of Purge Notification Message is what was written, byte for byte */
inline equal_purge_notification_message(purge_notification_message_read, purge_notification_message_written) {
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 2 -> assert(purge_notification_message_read.in_flight[purge_notification_message_at] == purge_notification_message_written.in_flight[purge_notification_message_at]); purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 8 -> assert(purge_notification_message_read.transaction_time[purge_notification_message_at] == purge_notification_message_written.transaction_time[purge_notification_message_at]); purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 20 -> assert(purge_notification_message_read.mass_cancel_id[purge_notification_message_at] == purge_notification_message_written.mass_cancel_id[purge_notification_message_at]); purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 4 -> assert(purge_notification_message_read.cancelled_order_count[purge_notification_message_at] == purge_notification_message_written.cancelled_order_count[purge_notification_message_at]); purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  assert(purge_notification_message_read.source_matching_unit == purge_notification_message_written.source_matching_unit);
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 4 -> assert(purge_notification_message_read.clearing_firm[purge_notification_message_at] == purge_notification_message_written.clearing_firm[purge_notification_message_at]); purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  purge_notification_message_at = 0;
  do
  :: purge_notification_message_at < 6 -> assert(purge_notification_message_read.risk_root[purge_notification_message_at] == purge_notification_message_written.risk_root[purge_notification_message_at]); purge_notification_message_at = purge_notification_message_at + 1
  :: else -> break
  od;
  assert(purge_notification_message_read.mass_cancel_lockout == purge_notification_message_written.mass_cancel_lockout);
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

/* ---- Carried Restatement Message: 240 bytes ---------------------------------- */

/* The Carried Restatement message is used to indicate the restoration of a multi-day GTC or GTD order at the start of a new business day */
typedef CarriedRestatementMessage {
  byte in_flight[2];
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte order_id[8];
  byte side;
  byte price[8];
  byte exec_inst;
  byte ord_type;
  byte time_in_force;
  byte min_qty[4];
  byte symbol[8];
  byte capacity;
  byte account[16];
  byte clearing_firm[4];
  byte clearing_account[4];
  byte display_indicator;
  byte max_floor[4];
  byte order_qty[4];
  PreventMatch prevent_match;
  byte maturity_date[4];
  byte strike_price[8];
  byte put_or_call;
  byte open_close;
  byte leaves_qty[4];
  byte display_price[8];
  byte working_price[8];
  byte expire_time[8];
  byte attributed_quote;
  byte stop_px[8];
  byte routing_inst[4];
  byte rout_strategy[6];
  byte route_delivery_method[3];
  byte ex_destination;
  byte target_party_id[4];
  byte auction_id[8];
  byte cmta_number[4];
  byte routing_firm_id[4];
  byte clearing_optional_data[16];
  byte cum_qty[4];
  byte drill_thru_protection[8];
  byte equity_party_id[4];
  byte client_id_attr[4];
  byte frequent_trader_id[6];
  byte session_eligibility;
  byte combo_order;
  byte compression;
  byte floor_destination[4];
  byte floor_routing_inst;
  byte order_origin[3];
  byte price_type;
  byte strategy_id;
  byte held
};

int carried_restatement_message_at;

/* every byte of Carried Restatement Message set to one value */
inline fill_carried_restatement_message(carried_restatement_message_record, carried_restatement_message_value) {
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 2 -> carried_restatement_message_record.in_flight[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.transaction_time[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 20 -> carried_restatement_message_record.cl_ord_id[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.order_id[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.side = carried_restatement_message_value;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.price[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.exec_inst = carried_restatement_message_value;
  carried_restatement_message_record.ord_type = carried_restatement_message_value;
  carried_restatement_message_record.time_in_force = carried_restatement_message_value;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.min_qty[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.symbol[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.capacity = carried_restatement_message_value;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 16 -> carried_restatement_message_record.account[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.clearing_firm[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.clearing_account[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.display_indicator = carried_restatement_message_value;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.max_floor[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.order_qty[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  fill_prevent_match(carried_restatement_message_record.prevent_match, carried_restatement_message_value);
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.maturity_date[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.strike_price[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.put_or_call = carried_restatement_message_value;
  carried_restatement_message_record.open_close = carried_restatement_message_value;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.leaves_qty[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.display_price[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.working_price[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.expire_time[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.attributed_quote = carried_restatement_message_value;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.stop_px[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.routing_inst[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 6 -> carried_restatement_message_record.rout_strategy[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 3 -> carried_restatement_message_record.route_delivery_method[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.ex_destination = carried_restatement_message_value;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.target_party_id[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.auction_id[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.cmta_number[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.routing_firm_id[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 16 -> carried_restatement_message_record.clearing_optional_data[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.cum_qty[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.drill_thru_protection[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.equity_party_id[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.client_id_attr[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 6 -> carried_restatement_message_record.frequent_trader_id[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.session_eligibility = carried_restatement_message_value;
  carried_restatement_message_record.combo_order = carried_restatement_message_value;
  carried_restatement_message_record.compression = carried_restatement_message_value;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.floor_destination[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.floor_routing_inst = carried_restatement_message_value;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 3 -> carried_restatement_message_record.order_origin[carried_restatement_message_at] = carried_restatement_message_value; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.price_type = carried_restatement_message_value;
  carried_restatement_message_record.strategy_id = carried_restatement_message_value;
  carried_restatement_message_record.held = carried_restatement_message_value;
  skip
}

/* each byte of Carried Restatement Message set to where it lies, so a field read out of place says so */
inline ramp_carried_restatement_message(carried_restatement_message_record, carried_restatement_message_base) {
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 2 -> carried_restatement_message_record.in_flight[carried_restatement_message_at] = (carried_restatement_message_base + 0 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.transaction_time[carried_restatement_message_at] = (carried_restatement_message_base + 2 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 20 -> carried_restatement_message_record.cl_ord_id[carried_restatement_message_at] = (carried_restatement_message_base + 10 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.order_id[carried_restatement_message_at] = (carried_restatement_message_base + 30 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.side = (carried_restatement_message_base + 38 + 1) % 256;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.price[carried_restatement_message_at] = (carried_restatement_message_base + 39 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.exec_inst = (carried_restatement_message_base + 47 + 1) % 256;
  carried_restatement_message_record.ord_type = (carried_restatement_message_base + 48 + 1) % 256;
  carried_restatement_message_record.time_in_force = (carried_restatement_message_base + 49 + 1) % 256;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.min_qty[carried_restatement_message_at] = (carried_restatement_message_base + 50 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.symbol[carried_restatement_message_at] = (carried_restatement_message_base + 54 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.capacity = (carried_restatement_message_base + 62 + 1) % 256;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 16 -> carried_restatement_message_record.account[carried_restatement_message_at] = (carried_restatement_message_base + 63 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.clearing_firm[carried_restatement_message_at] = (carried_restatement_message_base + 79 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.clearing_account[carried_restatement_message_at] = (carried_restatement_message_base + 83 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.display_indicator = (carried_restatement_message_base + 87 + 1) % 256;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.max_floor[carried_restatement_message_at] = (carried_restatement_message_base + 88 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.order_qty[carried_restatement_message_at] = (carried_restatement_message_base + 92 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  ramp_prevent_match(carried_restatement_message_record.prevent_match, carried_restatement_message_base + 96);
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.maturity_date[carried_restatement_message_at] = (carried_restatement_message_base + 99 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.strike_price[carried_restatement_message_at] = (carried_restatement_message_base + 103 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.put_or_call = (carried_restatement_message_base + 111 + 1) % 256;
  carried_restatement_message_record.open_close = (carried_restatement_message_base + 112 + 1) % 256;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.leaves_qty[carried_restatement_message_at] = (carried_restatement_message_base + 113 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.display_price[carried_restatement_message_at] = (carried_restatement_message_base + 117 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.working_price[carried_restatement_message_at] = (carried_restatement_message_base + 125 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.expire_time[carried_restatement_message_at] = (carried_restatement_message_base + 133 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.attributed_quote = (carried_restatement_message_base + 141 + 1) % 256;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.stop_px[carried_restatement_message_at] = (carried_restatement_message_base + 142 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.routing_inst[carried_restatement_message_at] = (carried_restatement_message_base + 150 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 6 -> carried_restatement_message_record.rout_strategy[carried_restatement_message_at] = (carried_restatement_message_base + 154 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 3 -> carried_restatement_message_record.route_delivery_method[carried_restatement_message_at] = (carried_restatement_message_base + 160 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.ex_destination = (carried_restatement_message_base + 163 + 1) % 256;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.target_party_id[carried_restatement_message_at] = (carried_restatement_message_base + 164 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.auction_id[carried_restatement_message_at] = (carried_restatement_message_base + 168 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.cmta_number[carried_restatement_message_at] = (carried_restatement_message_base + 176 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.routing_firm_id[carried_restatement_message_at] = (carried_restatement_message_base + 180 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 16 -> carried_restatement_message_record.clearing_optional_data[carried_restatement_message_at] = (carried_restatement_message_base + 184 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.cum_qty[carried_restatement_message_at] = (carried_restatement_message_base + 200 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.drill_thru_protection[carried_restatement_message_at] = (carried_restatement_message_base + 204 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.equity_party_id[carried_restatement_message_at] = (carried_restatement_message_base + 212 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.client_id_attr[carried_restatement_message_at] = (carried_restatement_message_base + 216 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 6 -> carried_restatement_message_record.frequent_trader_id[carried_restatement_message_at] = (carried_restatement_message_base + 220 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.session_eligibility = (carried_restatement_message_base + 226 + 1) % 256;
  carried_restatement_message_record.combo_order = (carried_restatement_message_base + 227 + 1) % 256;
  carried_restatement_message_record.compression = (carried_restatement_message_base + 228 + 1) % 256;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.floor_destination[carried_restatement_message_at] = (carried_restatement_message_base + 229 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.floor_routing_inst = (carried_restatement_message_base + 233 + 1) % 256;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 3 -> carried_restatement_message_record.order_origin[carried_restatement_message_at] = (carried_restatement_message_base + 234 + carried_restatement_message_at + 1) % 256; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.price_type = (carried_restatement_message_base + 237 + 1) % 256;
  carried_restatement_message_record.strategy_id = (carried_restatement_message_base + 238 + 1) % 256;
  carried_restatement_message_record.held = (carried_restatement_message_base + 239 + 1) % 256;
  skip
}

/* Carried Restatement Message to the wire, 240 bytes from where the cursor stands */
inline encode_carried_restatement_message(carried_restatement_message_record) {
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 2 -> wire[at] = carried_restatement_message_record.in_flight[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> wire[at] = carried_restatement_message_record.transaction_time[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 20 -> wire[at] = carried_restatement_message_record.cl_ord_id[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> wire[at] = carried_restatement_message_record.order_id[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_message_record.side; at = at + 1;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> wire[at] = carried_restatement_message_record.price[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_message_record.exec_inst; at = at + 1;
  wire[at] = carried_restatement_message_record.ord_type; at = at + 1;
  wire[at] = carried_restatement_message_record.time_in_force; at = at + 1;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> wire[at] = carried_restatement_message_record.min_qty[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> wire[at] = carried_restatement_message_record.symbol[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_message_record.capacity; at = at + 1;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 16 -> wire[at] = carried_restatement_message_record.account[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> wire[at] = carried_restatement_message_record.clearing_firm[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> wire[at] = carried_restatement_message_record.clearing_account[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_message_record.display_indicator; at = at + 1;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> wire[at] = carried_restatement_message_record.max_floor[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> wire[at] = carried_restatement_message_record.order_qty[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  encode_prevent_match(carried_restatement_message_record.prevent_match);
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> wire[at] = carried_restatement_message_record.maturity_date[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> wire[at] = carried_restatement_message_record.strike_price[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_message_record.put_or_call; at = at + 1;
  wire[at] = carried_restatement_message_record.open_close; at = at + 1;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> wire[at] = carried_restatement_message_record.leaves_qty[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> wire[at] = carried_restatement_message_record.display_price[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> wire[at] = carried_restatement_message_record.working_price[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> wire[at] = carried_restatement_message_record.expire_time[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_message_record.attributed_quote; at = at + 1;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> wire[at] = carried_restatement_message_record.stop_px[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> wire[at] = carried_restatement_message_record.routing_inst[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 6 -> wire[at] = carried_restatement_message_record.rout_strategy[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 3 -> wire[at] = carried_restatement_message_record.route_delivery_method[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_message_record.ex_destination; at = at + 1;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> wire[at] = carried_restatement_message_record.target_party_id[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> wire[at] = carried_restatement_message_record.auction_id[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> wire[at] = carried_restatement_message_record.cmta_number[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> wire[at] = carried_restatement_message_record.routing_firm_id[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 16 -> wire[at] = carried_restatement_message_record.clearing_optional_data[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> wire[at] = carried_restatement_message_record.cum_qty[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> wire[at] = carried_restatement_message_record.drill_thru_protection[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> wire[at] = carried_restatement_message_record.equity_party_id[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> wire[at] = carried_restatement_message_record.client_id_attr[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 6 -> wire[at] = carried_restatement_message_record.frequent_trader_id[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_message_record.session_eligibility; at = at + 1;
  wire[at] = carried_restatement_message_record.combo_order; at = at + 1;
  wire[at] = carried_restatement_message_record.compression; at = at + 1;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> wire[at] = carried_restatement_message_record.floor_destination[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_message_record.floor_routing_inst; at = at + 1;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 3 -> wire[at] = carried_restatement_message_record.order_origin[carried_restatement_message_at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  wire[at] = carried_restatement_message_record.price_type; at = at + 1;
  wire[at] = carried_restatement_message_record.strategy_id; at = at + 1;
  wire[at] = carried_restatement_message_record.held; at = at + 1;
  skip
}

/* Carried Restatement Message off the wire, 240 bytes from where the cursor stands */
inline decode_carried_restatement_message(carried_restatement_message_record) {
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 2 -> carried_restatement_message_record.in_flight[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.transaction_time[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 20 -> carried_restatement_message_record.cl_ord_id[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.order_id[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.side = wire[at]; at = at + 1;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.price[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.exec_inst = wire[at]; at = at + 1;
  carried_restatement_message_record.ord_type = wire[at]; at = at + 1;
  carried_restatement_message_record.time_in_force = wire[at]; at = at + 1;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.min_qty[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.symbol[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.capacity = wire[at]; at = at + 1;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 16 -> carried_restatement_message_record.account[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.clearing_firm[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.clearing_account[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.display_indicator = wire[at]; at = at + 1;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.max_floor[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.order_qty[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  decode_prevent_match(carried_restatement_message_record.prevent_match);
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.maturity_date[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.strike_price[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.put_or_call = wire[at]; at = at + 1;
  carried_restatement_message_record.open_close = wire[at]; at = at + 1;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.leaves_qty[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.display_price[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.working_price[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.expire_time[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.attributed_quote = wire[at]; at = at + 1;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.stop_px[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.routing_inst[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 6 -> carried_restatement_message_record.rout_strategy[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 3 -> carried_restatement_message_record.route_delivery_method[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.ex_destination = wire[at]; at = at + 1;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.target_party_id[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.auction_id[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.cmta_number[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.routing_firm_id[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 16 -> carried_restatement_message_record.clearing_optional_data[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.cum_qty[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> carried_restatement_message_record.drill_thru_protection[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.equity_party_id[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.client_id_attr[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 6 -> carried_restatement_message_record.frequent_trader_id[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.session_eligibility = wire[at]; at = at + 1;
  carried_restatement_message_record.combo_order = wire[at]; at = at + 1;
  carried_restatement_message_record.compression = wire[at]; at = at + 1;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> carried_restatement_message_record.floor_destination[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.floor_routing_inst = wire[at]; at = at + 1;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 3 -> carried_restatement_message_record.order_origin[carried_restatement_message_at] = wire[at]; at = at + 1; carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_record.price_type = wire[at]; at = at + 1;
  carried_restatement_message_record.strategy_id = wire[at]; at = at + 1;
  carried_restatement_message_record.held = wire[at]; at = at + 1;
  skip
}

/* what was read of Carried Restatement Message is what was written, byte for byte */
inline equal_carried_restatement_message(carried_restatement_message_read, carried_restatement_message_written) {
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 2 -> assert(carried_restatement_message_read.in_flight[carried_restatement_message_at] == carried_restatement_message_written.in_flight[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> assert(carried_restatement_message_read.transaction_time[carried_restatement_message_at] == carried_restatement_message_written.transaction_time[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 20 -> assert(carried_restatement_message_read.cl_ord_id[carried_restatement_message_at] == carried_restatement_message_written.cl_ord_id[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> assert(carried_restatement_message_read.order_id[carried_restatement_message_at] == carried_restatement_message_written.order_id[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  assert(carried_restatement_message_read.side == carried_restatement_message_written.side);
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> assert(carried_restatement_message_read.price[carried_restatement_message_at] == carried_restatement_message_written.price[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  assert(carried_restatement_message_read.exec_inst == carried_restatement_message_written.exec_inst);
  assert(carried_restatement_message_read.ord_type == carried_restatement_message_written.ord_type);
  assert(carried_restatement_message_read.time_in_force == carried_restatement_message_written.time_in_force);
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> assert(carried_restatement_message_read.min_qty[carried_restatement_message_at] == carried_restatement_message_written.min_qty[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> assert(carried_restatement_message_read.symbol[carried_restatement_message_at] == carried_restatement_message_written.symbol[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  assert(carried_restatement_message_read.capacity == carried_restatement_message_written.capacity);
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 16 -> assert(carried_restatement_message_read.account[carried_restatement_message_at] == carried_restatement_message_written.account[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> assert(carried_restatement_message_read.clearing_firm[carried_restatement_message_at] == carried_restatement_message_written.clearing_firm[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> assert(carried_restatement_message_read.clearing_account[carried_restatement_message_at] == carried_restatement_message_written.clearing_account[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  assert(carried_restatement_message_read.display_indicator == carried_restatement_message_written.display_indicator);
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> assert(carried_restatement_message_read.max_floor[carried_restatement_message_at] == carried_restatement_message_written.max_floor[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> assert(carried_restatement_message_read.order_qty[carried_restatement_message_at] == carried_restatement_message_written.order_qty[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  equal_prevent_match(carried_restatement_message_read.prevent_match, carried_restatement_message_written.prevent_match);
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> assert(carried_restatement_message_read.maturity_date[carried_restatement_message_at] == carried_restatement_message_written.maturity_date[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> assert(carried_restatement_message_read.strike_price[carried_restatement_message_at] == carried_restatement_message_written.strike_price[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  assert(carried_restatement_message_read.put_or_call == carried_restatement_message_written.put_or_call);
  assert(carried_restatement_message_read.open_close == carried_restatement_message_written.open_close);
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> assert(carried_restatement_message_read.leaves_qty[carried_restatement_message_at] == carried_restatement_message_written.leaves_qty[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> assert(carried_restatement_message_read.display_price[carried_restatement_message_at] == carried_restatement_message_written.display_price[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> assert(carried_restatement_message_read.working_price[carried_restatement_message_at] == carried_restatement_message_written.working_price[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> assert(carried_restatement_message_read.expire_time[carried_restatement_message_at] == carried_restatement_message_written.expire_time[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  assert(carried_restatement_message_read.attributed_quote == carried_restatement_message_written.attributed_quote);
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> assert(carried_restatement_message_read.stop_px[carried_restatement_message_at] == carried_restatement_message_written.stop_px[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> assert(carried_restatement_message_read.routing_inst[carried_restatement_message_at] == carried_restatement_message_written.routing_inst[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 6 -> assert(carried_restatement_message_read.rout_strategy[carried_restatement_message_at] == carried_restatement_message_written.rout_strategy[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 3 -> assert(carried_restatement_message_read.route_delivery_method[carried_restatement_message_at] == carried_restatement_message_written.route_delivery_method[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  assert(carried_restatement_message_read.ex_destination == carried_restatement_message_written.ex_destination);
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> assert(carried_restatement_message_read.target_party_id[carried_restatement_message_at] == carried_restatement_message_written.target_party_id[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> assert(carried_restatement_message_read.auction_id[carried_restatement_message_at] == carried_restatement_message_written.auction_id[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> assert(carried_restatement_message_read.cmta_number[carried_restatement_message_at] == carried_restatement_message_written.cmta_number[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> assert(carried_restatement_message_read.routing_firm_id[carried_restatement_message_at] == carried_restatement_message_written.routing_firm_id[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 16 -> assert(carried_restatement_message_read.clearing_optional_data[carried_restatement_message_at] == carried_restatement_message_written.clearing_optional_data[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> assert(carried_restatement_message_read.cum_qty[carried_restatement_message_at] == carried_restatement_message_written.cum_qty[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 8 -> assert(carried_restatement_message_read.drill_thru_protection[carried_restatement_message_at] == carried_restatement_message_written.drill_thru_protection[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> assert(carried_restatement_message_read.equity_party_id[carried_restatement_message_at] == carried_restatement_message_written.equity_party_id[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> assert(carried_restatement_message_read.client_id_attr[carried_restatement_message_at] == carried_restatement_message_written.client_id_attr[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 6 -> assert(carried_restatement_message_read.frequent_trader_id[carried_restatement_message_at] == carried_restatement_message_written.frequent_trader_id[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  assert(carried_restatement_message_read.session_eligibility == carried_restatement_message_written.session_eligibility);
  assert(carried_restatement_message_read.combo_order == carried_restatement_message_written.combo_order);
  assert(carried_restatement_message_read.compression == carried_restatement_message_written.compression);
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 4 -> assert(carried_restatement_message_read.floor_destination[carried_restatement_message_at] == carried_restatement_message_written.floor_destination[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  assert(carried_restatement_message_read.floor_routing_inst == carried_restatement_message_written.floor_routing_inst);
  carried_restatement_message_at = 0;
  do
  :: carried_restatement_message_at < 3 -> assert(carried_restatement_message_read.order_origin[carried_restatement_message_at] == carried_restatement_message_written.order_origin[carried_restatement_message_at]); carried_restatement_message_at = carried_restatement_message_at + 1
  :: else -> break
  od;
  assert(carried_restatement_message_read.price_type == carried_restatement_message_written.price_type);
  assert(carried_restatement_message_read.strategy_id == carried_restatement_message_written.strategy_id);
  assert(carried_restatement_message_read.held == carried_restatement_message_written.held);
  skip
}

/* ---- Done For Day Message: 46 bytes ------------------------------------------ */

/* The Done For Day messages represent orders persisted during the current day session to carry over to the next session */
typedef DoneForDayMessage {
  byte in_flight[2];
  byte transaction_time[8];
  byte cl_ord_id[20];
  byte clearing_firm[4];
  byte routing_firm_id[4];
  byte symbol[8]
};

int done_for_day_message_at;

/* every byte of Done For Day Message set to one value */
inline fill_done_for_day_message(done_for_day_message_record, done_for_day_message_value) {
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 2 -> done_for_day_message_record.in_flight[done_for_day_message_at] = done_for_day_message_value; done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 8 -> done_for_day_message_record.transaction_time[done_for_day_message_at] = done_for_day_message_value; done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 20 -> done_for_day_message_record.cl_ord_id[done_for_day_message_at] = done_for_day_message_value; done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 4 -> done_for_day_message_record.clearing_firm[done_for_day_message_at] = done_for_day_message_value; done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 4 -> done_for_day_message_record.routing_firm_id[done_for_day_message_at] = done_for_day_message_value; done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 8 -> done_for_day_message_record.symbol[done_for_day_message_at] = done_for_day_message_value; done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Done For Day Message set to where it lies, so a field read out of place says so */
inline ramp_done_for_day_message(done_for_day_message_record, done_for_day_message_base) {
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 2 -> done_for_day_message_record.in_flight[done_for_day_message_at] = (done_for_day_message_base + 0 + done_for_day_message_at + 1) % 256; done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 8 -> done_for_day_message_record.transaction_time[done_for_day_message_at] = (done_for_day_message_base + 2 + done_for_day_message_at + 1) % 256; done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 20 -> done_for_day_message_record.cl_ord_id[done_for_day_message_at] = (done_for_day_message_base + 10 + done_for_day_message_at + 1) % 256; done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 4 -> done_for_day_message_record.clearing_firm[done_for_day_message_at] = (done_for_day_message_base + 30 + done_for_day_message_at + 1) % 256; done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 4 -> done_for_day_message_record.routing_firm_id[done_for_day_message_at] = (done_for_day_message_base + 34 + done_for_day_message_at + 1) % 256; done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 8 -> done_for_day_message_record.symbol[done_for_day_message_at] = (done_for_day_message_base + 38 + done_for_day_message_at + 1) % 256; done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* Done For Day Message to the wire, 46 bytes from where the cursor stands */
inline encode_done_for_day_message(done_for_day_message_record) {
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 2 -> wire[at] = done_for_day_message_record.in_flight[done_for_day_message_at]; at = at + 1; done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 8 -> wire[at] = done_for_day_message_record.transaction_time[done_for_day_message_at]; at = at + 1; done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 20 -> wire[at] = done_for_day_message_record.cl_ord_id[done_for_day_message_at]; at = at + 1; done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 4 -> wire[at] = done_for_day_message_record.clearing_firm[done_for_day_message_at]; at = at + 1; done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 4 -> wire[at] = done_for_day_message_record.routing_firm_id[done_for_day_message_at]; at = at + 1; done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 8 -> wire[at] = done_for_day_message_record.symbol[done_for_day_message_at]; at = at + 1; done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* Done For Day Message off the wire, 46 bytes from where the cursor stands */
inline decode_done_for_day_message(done_for_day_message_record) {
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 2 -> done_for_day_message_record.in_flight[done_for_day_message_at] = wire[at]; at = at + 1; done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 8 -> done_for_day_message_record.transaction_time[done_for_day_message_at] = wire[at]; at = at + 1; done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 20 -> done_for_day_message_record.cl_ord_id[done_for_day_message_at] = wire[at]; at = at + 1; done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 4 -> done_for_day_message_record.clearing_firm[done_for_day_message_at] = wire[at]; at = at + 1; done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 4 -> done_for_day_message_record.routing_firm_id[done_for_day_message_at] = wire[at]; at = at + 1; done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 8 -> done_for_day_message_record.symbol[done_for_day_message_at] = wire[at]; at = at + 1; done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Done For Day Message is what was written, byte for byte */
inline equal_done_for_day_message(done_for_day_message_read, done_for_day_message_written) {
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 2 -> assert(done_for_day_message_read.in_flight[done_for_day_message_at] == done_for_day_message_written.in_flight[done_for_day_message_at]); done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 8 -> assert(done_for_day_message_read.transaction_time[done_for_day_message_at] == done_for_day_message_written.transaction_time[done_for_day_message_at]); done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 20 -> assert(done_for_day_message_read.cl_ord_id[done_for_day_message_at] == done_for_day_message_written.cl_ord_id[done_for_day_message_at]); done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 4 -> assert(done_for_day_message_read.clearing_firm[done_for_day_message_at] == done_for_day_message_written.clearing_firm[done_for_day_message_at]); done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 4 -> assert(done_for_day_message_read.routing_firm_id[done_for_day_message_at] == done_for_day_message_written.routing_firm_id[done_for_day_message_at]); done_for_day_message_at = done_for_day_message_at + 1
  :: else -> break
  od;
  done_for_day_message_at = 0;
  do
  :: done_for_day_message_at < 8 -> assert(done_for_day_message_read.symbol[done_for_day_message_at] == done_for_day_message_written.symbol[done_for_day_message_at]); done_for_day_message_at = done_for_day_message_at + 1
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
    assert(at == 93);
    at = 0;
    decode_order_acknowledgement_message(order_acknowledgement_message_got);
    assert(at == 93);
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
    assert(at == 99);
    at = 0;
    decode_order_rejected_message(order_rejected_message_got);
    assert(at == 99);
    equal_order_rejected_message(order_rejected_message_got, order_rejected_message_sent)
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
    assert(at == 27);
    at = 0;
    decode_quote_update_rejected_message(quote_update_rejected_message_got);
    assert(at == 27);
    equal_quote_update_rejected_message(quote_update_rejected_message_got, quote_update_rejected_message_sent)
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
    assert(at == 136);
    at = 0;
    decode_order_modified_message(order_modified_message_got);
    assert(at == 136);
    equal_order_modified_message(order_modified_message_got, order_modified_message_sent)
  }
}

/* Order Restated Message: encoded, read back, and compared */
proctype check_order_restated_message() {
  OrderRestatedMessage order_restated_message_sent;
  OrderRestatedMessage order_restated_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_restated_message(order_restated_message_sent, 0)
  :: pattern == 1 -> fill_order_restated_message(order_restated_message_sent, 32)
  :: pattern == 2 -> fill_order_restated_message(order_restated_message_sent, 255)
  :: else -> ramp_order_restated_message(order_restated_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_restated_message(order_restated_message_sent);
    assert(at == 108);
    at = 0;
    decode_order_restated_message(order_restated_message_got);
    assert(at == 108);
    equal_order_restated_message(order_restated_message_got, order_restated_message_sent)
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
    assert(at == 54);
    at = 0;
    decode_quote_restated_message(quote_restated_message_got);
    assert(at == 54);
    equal_quote_restated_message(quote_restated_message_got, quote_restated_message_sent)
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
    assert(at == 119);
    at = 0;
    decode_modify_rejected_message(modify_rejected_message_got);
    assert(at == 119);
    equal_modify_rejected_message(modify_rejected_message_got, modify_rejected_message_sent)
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
    assert(at == 56);
    at = 0;
    decode_order_cancelled_message(order_cancelled_message_got);
    assert(at == 56);
    equal_order_cancelled_message(order_cancelled_message_got, order_cancelled_message_sent)
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
    assert(at == 43);
    at = 0;
    decode_quote_cancelled_message(quote_cancelled_message_got);
    assert(at == 43);
    equal_quote_cancelled_message(quote_cancelled_message_got, quote_cancelled_message_sent)
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
    assert(at == 99);
    at = 0;
    decode_cancel_rejected_message(cancel_rejected_message_got);
    assert(at == 99);
    equal_cancel_rejected_message(cancel_rejected_message_got, cancel_rejected_message_sent)
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
    assert(at == 116);
    at = 0;
    decode_order_execution_message(order_execution_message_got);
    assert(at == 116);
    equal_order_execution_message(order_execution_message_got, order_execution_message_sent)
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
    assert(at == 84);
    at = 0;
    decode_quote_execution_message(quote_execution_message_got);
    assert(at == 84);
    equal_quote_execution_message(quote_execution_message_got, quote_execution_message_sent)
  }
}

/* Trade Cancel Correct Message: encoded, read back, and compared */
proctype check_trade_cancel_correct_message() {
  TradeCancelCorrectMessage trade_cancel_correct_message_sent;
  TradeCancelCorrectMessage trade_cancel_correct_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancel_correct_message(trade_cancel_correct_message_sent, 0)
  :: pattern == 1 -> fill_trade_cancel_correct_message(trade_cancel_correct_message_sent, 32)
  :: pattern == 2 -> fill_trade_cancel_correct_message(trade_cancel_correct_message_sent, 255)
  :: else -> ramp_trade_cancel_correct_message(trade_cancel_correct_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancel_correct_message(trade_cancel_correct_message_sent);
    assert(at == 122);
    at = 0;
    decode_trade_cancel_correct_message(trade_cancel_correct_message_got);
    assert(at == 122);
    equal_trade_cancel_correct_message(trade_cancel_correct_message_got, trade_cancel_correct_message_sent)
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
    assert(at == 91);
    at = 0;
    decode_purge_rejected_message(purge_rejected_message_got);
    assert(at == 91);
    equal_purge_rejected_message(purge_rejected_message_got, purge_rejected_message_sent)
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
    assert(at == 27);
    at = 0;
    decode_reset_risk_acknowledgement_message(reset_risk_acknowledgement_message_got);
    assert(at == 27);
    equal_reset_risk_acknowledgement_message(reset_risk_acknowledgement_message_got, reset_risk_acknowledgement_message_sent)
  }
}

/* Mass Cancel Acknowledgment Message: encoded, read back, and compared */
proctype check_mass_cancel_acknowledgment_message() {
  MassCancelAcknowledgmentMessage mass_cancel_acknowledgment_message_sent;
  MassCancelAcknowledgmentMessage mass_cancel_acknowledgment_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_cancel_acknowledgment_message(mass_cancel_acknowledgment_message_sent, 0)
  :: pattern == 1 -> fill_mass_cancel_acknowledgment_message(mass_cancel_acknowledgment_message_sent, 32)
  :: pattern == 2 -> fill_mass_cancel_acknowledgment_message(mass_cancel_acknowledgment_message_sent, 255)
  :: else -> ramp_mass_cancel_acknowledgment_message(mass_cancel_acknowledgment_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_cancel_acknowledgment_message(mass_cancel_acknowledgment_message_sent);
    assert(at == 42);
    at = 0;
    decode_mass_cancel_acknowledgment_message(mass_cancel_acknowledgment_message_got);
    assert(at == 42);
    equal_mass_cancel_acknowledgment_message(mass_cancel_acknowledgment_message_got, mass_cancel_acknowledgment_message_sent)
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
    assert(at == 91);
    at = 0;
    decode_mass_cancel_rejected_message(mass_cancel_rejected_message_got);
    assert(at == 91);
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
    assert(at == 43);
    at = 0;
    decode_purge_acknowledgement_message(purge_acknowledgement_message_got);
    assert(at == 43);
    equal_purge_acknowledgement_message(purge_acknowledgement_message_got, purge_acknowledgement_message_sent)
  }
}

/* Purge Notification Message: encoded, read back, and compared */
proctype check_purge_notification_message() {
  PurgeNotificationMessage purge_notification_message_sent;
  PurgeNotificationMessage purge_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_purge_notification_message(purge_notification_message_sent, 0)
  :: pattern == 1 -> fill_purge_notification_message(purge_notification_message_sent, 32)
  :: pattern == 2 -> fill_purge_notification_message(purge_notification_message_sent, 255)
  :: else -> ramp_purge_notification_message(purge_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_purge_notification_message(purge_notification_message_sent);
    assert(at == 46);
    at = 0;
    decode_purge_notification_message(purge_notification_message_got);
    assert(at == 46);
    equal_purge_notification_message(purge_notification_message_got, purge_notification_message_sent)
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

/* Carried Restatement Message: encoded, read back, and compared */
proctype check_carried_restatement_message() {
  CarriedRestatementMessage carried_restatement_message_sent;
  CarriedRestatementMessage carried_restatement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_carried_restatement_message(carried_restatement_message_sent, 0)
  :: pattern == 1 -> fill_carried_restatement_message(carried_restatement_message_sent, 32)
  :: pattern == 2 -> fill_carried_restatement_message(carried_restatement_message_sent, 255)
  :: else -> ramp_carried_restatement_message(carried_restatement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_carried_restatement_message(carried_restatement_message_sent);
    assert(at == 240);
    at = 0;
    decode_carried_restatement_message(carried_restatement_message_got);
    assert(at == 240);
    equal_carried_restatement_message(carried_restatement_message_got, carried_restatement_message_sent)
  }
}

/* Done For Day Message: encoded, read back, and compared */
proctype check_done_for_day_message() {
  DoneForDayMessage done_for_day_message_sent;
  DoneForDayMessage done_for_day_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_done_for_day_message(done_for_day_message_sent, 0)
  :: pattern == 1 -> fill_done_for_day_message(done_for_day_message_sent, 32)
  :: pattern == 2 -> fill_done_for_day_message(done_for_day_message_sent, 255)
  :: else -> ramp_done_for_day_message(done_for_day_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_done_for_day_message(done_for_day_message_sent);
    assert(at == 46);
    at = 0;
    decode_done_for_day_message(done_for_day_message_got);
    assert(at == 46);
    equal_done_for_day_message(done_for_day_message_got, done_for_day_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_exchange_message_header()
  :: run check_logout_response_message()
  :: run check_order_acknowledgement_message()
  :: run check_order_rejected_message()
  :: run check_quote_update_rejected_message()
  :: run check_order_modified_message()
  :: run check_order_restated_message()
  :: run check_quote_restated_message()
  :: run check_modify_rejected_message()
  :: run check_order_cancelled_message()
  :: run check_quote_cancelled_message()
  :: run check_cancel_rejected_message()
  :: run check_order_execution_message()
  :: run check_quote_execution_message()
  :: run check_trade_cancel_correct_message()
  :: run check_purge_rejected_message()
  :: run check_reset_risk_acknowledgement_message()
  :: run check_mass_cancel_acknowledgment_message()
  :: run check_mass_cancel_rejected_message()
  :: run check_purge_acknowledgement_message()
  :: run check_purge_notification_message()
  :: run check_prevent_match()
  :: run check_carried_restatement_message()
  :: run check_done_for_day_message()
  fi
}
