/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Nordic Equity TotalView
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
 *   - the dispatch that chooses a message by its type
 *   - a run counted by a field
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 60

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 20 bytes ------------------------------------------------- */

/* Itch Mold Udp 64 Packet Header */
typedef PacketHeader {
  byte session[10];
  byte sequence_number[8];
  byte message_count[2]
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> packet_header_record.session[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sequence_number[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.message_count[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> packet_header_record.session[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sequence_number[packet_header_at] = (packet_header_base + 10 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.message_count[packet_header_at] = (packet_header_base + 18 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 20 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> wire[at] = packet_header_record.session[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> wire[at] = packet_header_record.sequence_number[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.message_count[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 20 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> packet_header_record.session[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sequence_number[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.message_count[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> assert(packet_header_read.session[packet_header_at] == packet_header_written.session[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> assert(packet_header_read.sequence_number[packet_header_at] == packet_header_written.sequence_number[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.message_count[packet_header_at] == packet_header_written.message_count[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 3 bytes ------------------------------------------------- */

/* Mold Udp 64 Message Header */
typedef MessageHeader {
  byte message_length[2];
  byte message_type
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = (message_header_base + 2 + 1) % 256;
  skip
}

/* Message Header to the wire, 3 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 3 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_length[message_header_at] == message_header_written.message_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- System Event Message: 11 bytes ------------------------------------------ */

/* Signals a market or data feed handler event */
typedef SystemEventMessage {
  byte timestamp[8];
  byte tracking_number[2];
  byte event_code
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.tracking_number[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = system_event_message_value;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.tracking_number[system_event_message_at] = (system_event_message_base + 8 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 10 + 1) % 256;
  skip
}

/* System Event Message to the wire, 11 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> wire[at] = system_event_message_record.timestamp[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> wire[at] = system_event_message_record.tracking_number[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  skip
}

/* System Event Message off the wire, 11 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.tracking_number[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> assert(system_event_message_read.timestamp[system_event_message_at] == system_event_message_written.timestamp[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> assert(system_event_message_read.tracking_number[system_event_message_at] == system_event_message_written.tracking_number[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  skip
}

/* ---- Order Book Trading Action Message: 20 bytes ----------------------------- */

/* Indicates the current trading status of a security */
typedef OrderBookTradingActionMessage {
  byte timestamp[8];
  byte tracking_number[2];
  byte order_book[4];
  byte symbol_state;
  byte extension;
  byte reason[4]
};

int order_book_trading_action_message_at;

/* every byte of Order Book Trading Action Message set to one value */
inline fill_order_book_trading_action_message(order_book_trading_action_message_record, order_book_trading_action_message_value) {
  order_book_trading_action_message_at = 0;
  do
  :: order_book_trading_action_message_at < 8 -> order_book_trading_action_message_record.timestamp[order_book_trading_action_message_at] = order_book_trading_action_message_value; order_book_trading_action_message_at = order_book_trading_action_message_at + 1
  :: else -> break
  od;
  order_book_trading_action_message_at = 0;
  do
  :: order_book_trading_action_message_at < 2 -> order_book_trading_action_message_record.tracking_number[order_book_trading_action_message_at] = order_book_trading_action_message_value; order_book_trading_action_message_at = order_book_trading_action_message_at + 1
  :: else -> break
  od;
  order_book_trading_action_message_at = 0;
  do
  :: order_book_trading_action_message_at < 4 -> order_book_trading_action_message_record.order_book[order_book_trading_action_message_at] = order_book_trading_action_message_value; order_book_trading_action_message_at = order_book_trading_action_message_at + 1
  :: else -> break
  od;
  order_book_trading_action_message_record.symbol_state = order_book_trading_action_message_value;
  order_book_trading_action_message_record.extension = order_book_trading_action_message_value;
  order_book_trading_action_message_at = 0;
  do
  :: order_book_trading_action_message_at < 4 -> order_book_trading_action_message_record.reason[order_book_trading_action_message_at] = order_book_trading_action_message_value; order_book_trading_action_message_at = order_book_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Book Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_order_book_trading_action_message(order_book_trading_action_message_record, order_book_trading_action_message_base) {
  order_book_trading_action_message_at = 0;
  do
  :: order_book_trading_action_message_at < 8 -> order_book_trading_action_message_record.timestamp[order_book_trading_action_message_at] = (order_book_trading_action_message_base + 0 + order_book_trading_action_message_at + 1) % 256; order_book_trading_action_message_at = order_book_trading_action_message_at + 1
  :: else -> break
  od;
  order_book_trading_action_message_at = 0;
  do
  :: order_book_trading_action_message_at < 2 -> order_book_trading_action_message_record.tracking_number[order_book_trading_action_message_at] = (order_book_trading_action_message_base + 8 + order_book_trading_action_message_at + 1) % 256; order_book_trading_action_message_at = order_book_trading_action_message_at + 1
  :: else -> break
  od;
  order_book_trading_action_message_at = 0;
  do
  :: order_book_trading_action_message_at < 4 -> order_book_trading_action_message_record.order_book[order_book_trading_action_message_at] = (order_book_trading_action_message_base + 10 + order_book_trading_action_message_at + 1) % 256; order_book_trading_action_message_at = order_book_trading_action_message_at + 1
  :: else -> break
  od;
  order_book_trading_action_message_record.symbol_state = (order_book_trading_action_message_base + 14 + 1) % 256;
  order_book_trading_action_message_record.extension = (order_book_trading_action_message_base + 15 + 1) % 256;
  order_book_trading_action_message_at = 0;
  do
  :: order_book_trading_action_message_at < 4 -> order_book_trading_action_message_record.reason[order_book_trading_action_message_at] = (order_book_trading_action_message_base + 16 + order_book_trading_action_message_at + 1) % 256; order_book_trading_action_message_at = order_book_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Book Trading Action Message to the wire, 20 bytes from where the cursor stands */
inline encode_order_book_trading_action_message(order_book_trading_action_message_record) {
  order_book_trading_action_message_at = 0;
  do
  :: order_book_trading_action_message_at < 8 -> wire[at] = order_book_trading_action_message_record.timestamp[order_book_trading_action_message_at]; at = at + 1; order_book_trading_action_message_at = order_book_trading_action_message_at + 1
  :: else -> break
  od;
  order_book_trading_action_message_at = 0;
  do
  :: order_book_trading_action_message_at < 2 -> wire[at] = order_book_trading_action_message_record.tracking_number[order_book_trading_action_message_at]; at = at + 1; order_book_trading_action_message_at = order_book_trading_action_message_at + 1
  :: else -> break
  od;
  order_book_trading_action_message_at = 0;
  do
  :: order_book_trading_action_message_at < 4 -> wire[at] = order_book_trading_action_message_record.order_book[order_book_trading_action_message_at]; at = at + 1; order_book_trading_action_message_at = order_book_trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = order_book_trading_action_message_record.symbol_state; at = at + 1;
  wire[at] = order_book_trading_action_message_record.extension; at = at + 1;
  order_book_trading_action_message_at = 0;
  do
  :: order_book_trading_action_message_at < 4 -> wire[at] = order_book_trading_action_message_record.reason[order_book_trading_action_message_at]; at = at + 1; order_book_trading_action_message_at = order_book_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Book Trading Action Message off the wire, 20 bytes from where the cursor stands */
inline decode_order_book_trading_action_message(order_book_trading_action_message_record) {
  order_book_trading_action_message_at = 0;
  do
  :: order_book_trading_action_message_at < 8 -> order_book_trading_action_message_record.timestamp[order_book_trading_action_message_at] = wire[at]; at = at + 1; order_book_trading_action_message_at = order_book_trading_action_message_at + 1
  :: else -> break
  od;
  order_book_trading_action_message_at = 0;
  do
  :: order_book_trading_action_message_at < 2 -> order_book_trading_action_message_record.tracking_number[order_book_trading_action_message_at] = wire[at]; at = at + 1; order_book_trading_action_message_at = order_book_trading_action_message_at + 1
  :: else -> break
  od;
  order_book_trading_action_message_at = 0;
  do
  :: order_book_trading_action_message_at < 4 -> order_book_trading_action_message_record.order_book[order_book_trading_action_message_at] = wire[at]; at = at + 1; order_book_trading_action_message_at = order_book_trading_action_message_at + 1
  :: else -> break
  od;
  order_book_trading_action_message_record.symbol_state = wire[at]; at = at + 1;
  order_book_trading_action_message_record.extension = wire[at]; at = at + 1;
  order_book_trading_action_message_at = 0;
  do
  :: order_book_trading_action_message_at < 4 -> order_book_trading_action_message_record.reason[order_book_trading_action_message_at] = wire[at]; at = at + 1; order_book_trading_action_message_at = order_book_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Book Trading Action Message is what was written, byte for byte */
inline equal_order_book_trading_action_message(order_book_trading_action_message_read, order_book_trading_action_message_written) {
  order_book_trading_action_message_at = 0;
  do
  :: order_book_trading_action_message_at < 8 -> assert(order_book_trading_action_message_read.timestamp[order_book_trading_action_message_at] == order_book_trading_action_message_written.timestamp[order_book_trading_action_message_at]); order_book_trading_action_message_at = order_book_trading_action_message_at + 1
  :: else -> break
  od;
  order_book_trading_action_message_at = 0;
  do
  :: order_book_trading_action_message_at < 2 -> assert(order_book_trading_action_message_read.tracking_number[order_book_trading_action_message_at] == order_book_trading_action_message_written.tracking_number[order_book_trading_action_message_at]); order_book_trading_action_message_at = order_book_trading_action_message_at + 1
  :: else -> break
  od;
  order_book_trading_action_message_at = 0;
  do
  :: order_book_trading_action_message_at < 4 -> assert(order_book_trading_action_message_read.order_book[order_book_trading_action_message_at] == order_book_trading_action_message_written.order_book[order_book_trading_action_message_at]); order_book_trading_action_message_at = order_book_trading_action_message_at + 1
  :: else -> break
  od;
  assert(order_book_trading_action_message_read.symbol_state == order_book_trading_action_message_written.symbol_state);
  assert(order_book_trading_action_message_read.extension == order_book_trading_action_message_written.extension);
  order_book_trading_action_message_at = 0;
  do
  :: order_book_trading_action_message_at < 4 -> assert(order_book_trading_action_message_read.reason[order_book_trading_action_message_at] == order_book_trading_action_message_written.reason[order_book_trading_action_message_at]); order_book_trading_action_message_at = order_book_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order Message: 31 bytes --------------------------------------------- */

/* An order added to the book without Mpid attribution */
typedef AddOrderMessage {
  byte timestamp[8];
  byte tracking_number[2];
  byte order_reference_number[8];
  byte buy_sell_indicator;
  byte quantity[4];
  byte order_book[4];
  byte price[4]
};

int add_order_message_at;

/* every byte of Add Order Message set to one value */
inline fill_add_order_message(add_order_message_record, add_order_message_value) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.timestamp[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> add_order_message_record.tracking_number[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_reference_number[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.buy_sell_indicator = add_order_message_value;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.quantity[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.order_book[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_message(add_order_message_record, add_order_message_base) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.timestamp[add_order_message_at] = (add_order_message_base + 0 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> add_order_message_record.tracking_number[add_order_message_at] = (add_order_message_base + 8 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_reference_number[add_order_message_at] = (add_order_message_base + 10 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.buy_sell_indicator = (add_order_message_base + 18 + 1) % 256;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.quantity[add_order_message_at] = (add_order_message_base + 19 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.order_book[add_order_message_at] = (add_order_message_base + 23 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = (add_order_message_base + 27 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message to the wire, 31 bytes from where the cursor stands */
inline encode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> wire[at] = add_order_message_record.timestamp[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> wire[at] = add_order_message_record.tracking_number[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> wire[at] = add_order_message_record.order_reference_number[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_record.buy_sell_indicator; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.quantity[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.order_book[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.price[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message off the wire, 31 bytes from where the cursor stands */
inline decode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.timestamp[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> add_order_message_record.tracking_number[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_reference_number[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.buy_sell_indicator = wire[at]; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.quantity[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.order_book[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Message is what was written, byte for byte */
inline equal_add_order_message(add_order_message_read, add_order_message_written) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> assert(add_order_message_read.timestamp[add_order_message_at] == add_order_message_written.timestamp[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> assert(add_order_message_read.tracking_number[add_order_message_at] == add_order_message_written.tracking_number[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> assert(add_order_message_read.order_reference_number[add_order_message_at] == add_order_message_written.order_reference_number[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  assert(add_order_message_read.buy_sell_indicator == add_order_message_written.buy_sell_indicator);
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.quantity[add_order_message_at] == add_order_message_written.quantity[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.order_book[add_order_message_at] == add_order_message_written.order_book[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.price[add_order_message_at] == add_order_message_written.price[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order Mpid Attribution Message: 35 bytes ---------------------------- */

/* An order added to the book with Mpid attribution */
typedef AddOrderMpidAttributionMessage {
  byte timestamp[8];
  byte tracking_number[2];
  byte order_reference_number[8];
  byte buy_sell_indicator;
  byte quantity[4];
  byte order_book[4];
  byte price[4];
  byte attribution[4]
};

int add_order_mpid_attribution_message_at;

/* every byte of Add Order Mpid Attribution Message set to one value */
inline fill_add_order_mpid_attribution_message(add_order_mpid_attribution_message_record, add_order_mpid_attribution_message_value) {
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 8 -> add_order_mpid_attribution_message_record.timestamp[add_order_mpid_attribution_message_at] = add_order_mpid_attribution_message_value; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 2 -> add_order_mpid_attribution_message_record.tracking_number[add_order_mpid_attribution_message_at] = add_order_mpid_attribution_message_value; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 8 -> add_order_mpid_attribution_message_record.order_reference_number[add_order_mpid_attribution_message_at] = add_order_mpid_attribution_message_value; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_record.buy_sell_indicator = add_order_mpid_attribution_message_value;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> add_order_mpid_attribution_message_record.quantity[add_order_mpid_attribution_message_at] = add_order_mpid_attribution_message_value; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> add_order_mpid_attribution_message_record.order_book[add_order_mpid_attribution_message_at] = add_order_mpid_attribution_message_value; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> add_order_mpid_attribution_message_record.price[add_order_mpid_attribution_message_at] = add_order_mpid_attribution_message_value; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> add_order_mpid_attribution_message_record.attribution[add_order_mpid_attribution_message_at] = add_order_mpid_attribution_message_value; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Mpid Attribution Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_mpid_attribution_message(add_order_mpid_attribution_message_record, add_order_mpid_attribution_message_base) {
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 8 -> add_order_mpid_attribution_message_record.timestamp[add_order_mpid_attribution_message_at] = (add_order_mpid_attribution_message_base + 0 + add_order_mpid_attribution_message_at + 1) % 256; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 2 -> add_order_mpid_attribution_message_record.tracking_number[add_order_mpid_attribution_message_at] = (add_order_mpid_attribution_message_base + 8 + add_order_mpid_attribution_message_at + 1) % 256; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 8 -> add_order_mpid_attribution_message_record.order_reference_number[add_order_mpid_attribution_message_at] = (add_order_mpid_attribution_message_base + 10 + add_order_mpid_attribution_message_at + 1) % 256; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_record.buy_sell_indicator = (add_order_mpid_attribution_message_base + 18 + 1) % 256;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> add_order_mpid_attribution_message_record.quantity[add_order_mpid_attribution_message_at] = (add_order_mpid_attribution_message_base + 19 + add_order_mpid_attribution_message_at + 1) % 256; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> add_order_mpid_attribution_message_record.order_book[add_order_mpid_attribution_message_at] = (add_order_mpid_attribution_message_base + 23 + add_order_mpid_attribution_message_at + 1) % 256; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> add_order_mpid_attribution_message_record.price[add_order_mpid_attribution_message_at] = (add_order_mpid_attribution_message_base + 27 + add_order_mpid_attribution_message_at + 1) % 256; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> add_order_mpid_attribution_message_record.attribution[add_order_mpid_attribution_message_at] = (add_order_mpid_attribution_message_base + 31 + add_order_mpid_attribution_message_at + 1) % 256; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Mpid Attribution Message to the wire, 35 bytes from where the cursor stands */
inline encode_add_order_mpid_attribution_message(add_order_mpid_attribution_message_record) {
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 8 -> wire[at] = add_order_mpid_attribution_message_record.timestamp[add_order_mpid_attribution_message_at]; at = at + 1; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 2 -> wire[at] = add_order_mpid_attribution_message_record.tracking_number[add_order_mpid_attribution_message_at]; at = at + 1; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 8 -> wire[at] = add_order_mpid_attribution_message_record.order_reference_number[add_order_mpid_attribution_message_at]; at = at + 1; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_mpid_attribution_message_record.buy_sell_indicator; at = at + 1;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> wire[at] = add_order_mpid_attribution_message_record.quantity[add_order_mpid_attribution_message_at]; at = at + 1; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> wire[at] = add_order_mpid_attribution_message_record.order_book[add_order_mpid_attribution_message_at]; at = at + 1; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> wire[at] = add_order_mpid_attribution_message_record.price[add_order_mpid_attribution_message_at]; at = at + 1; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> wire[at] = add_order_mpid_attribution_message_record.attribution[add_order_mpid_attribution_message_at]; at = at + 1; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Mpid Attribution Message off the wire, 35 bytes from where the cursor stands */
inline decode_add_order_mpid_attribution_message(add_order_mpid_attribution_message_record) {
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 8 -> add_order_mpid_attribution_message_record.timestamp[add_order_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 2 -> add_order_mpid_attribution_message_record.tracking_number[add_order_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 8 -> add_order_mpid_attribution_message_record.order_reference_number[add_order_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_record.buy_sell_indicator = wire[at]; at = at + 1;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> add_order_mpid_attribution_message_record.quantity[add_order_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> add_order_mpid_attribution_message_record.order_book[add_order_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> add_order_mpid_attribution_message_record.price[add_order_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> add_order_mpid_attribution_message_record.attribution[add_order_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Mpid Attribution Message is what was written, byte for byte */
inline equal_add_order_mpid_attribution_message(add_order_mpid_attribution_message_read, add_order_mpid_attribution_message_written) {
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 8 -> assert(add_order_mpid_attribution_message_read.timestamp[add_order_mpid_attribution_message_at] == add_order_mpid_attribution_message_written.timestamp[add_order_mpid_attribution_message_at]); add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 2 -> assert(add_order_mpid_attribution_message_read.tracking_number[add_order_mpid_attribution_message_at] == add_order_mpid_attribution_message_written.tracking_number[add_order_mpid_attribution_message_at]); add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 8 -> assert(add_order_mpid_attribution_message_read.order_reference_number[add_order_mpid_attribution_message_at] == add_order_mpid_attribution_message_written.order_reference_number[add_order_mpid_attribution_message_at]); add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  assert(add_order_mpid_attribution_message_read.buy_sell_indicator == add_order_mpid_attribution_message_written.buy_sell_indicator);
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> assert(add_order_mpid_attribution_message_read.quantity[add_order_mpid_attribution_message_at] == add_order_mpid_attribution_message_written.quantity[add_order_mpid_attribution_message_at]); add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> assert(add_order_mpid_attribution_message_read.order_book[add_order_mpid_attribution_message_at] == add_order_mpid_attribution_message_written.order_book[add_order_mpid_attribution_message_at]); add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> assert(add_order_mpid_attribution_message_read.price[add_order_mpid_attribution_message_at] == add_order_mpid_attribution_message_written.price[add_order_mpid_attribution_message_at]); add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> assert(add_order_mpid_attribution_message_read.attribution[add_order_mpid_attribution_message_at] == add_order_mpid_attribution_message_written.attribution[add_order_mpid_attribution_message_at]); add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Executed Message: 34 bytes ---------------------------------------- */

/* Sent whenever an order on the book is executed in whole or in part */
typedef OrderExecutedMessage {
  byte timestamp[8];
  byte tracking_number[2];
  byte order_reference_number[8];
  byte executed_quantity[4];
  byte match_number[4];
  byte mpid[4];
  byte mpid_counterparty[4]
};

int order_executed_message_at;

/* every byte of Order Executed Message set to one value */
inline fill_order_executed_message(order_executed_message_record, order_executed_message_value) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.timestamp[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> order_executed_message_record.tracking_number[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_reference_number[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.match_number[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.mpid[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.mpid_counterparty[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Executed Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_message(order_executed_message_record, order_executed_message_base) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.timestamp[order_executed_message_at] = (order_executed_message_base + 0 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> order_executed_message_record.tracking_number[order_executed_message_at] = (order_executed_message_base + 8 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_reference_number[order_executed_message_at] = (order_executed_message_base + 10 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = (order_executed_message_base + 18 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.match_number[order_executed_message_at] = (order_executed_message_base + 22 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.mpid[order_executed_message_at] = (order_executed_message_base + 26 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.mpid_counterparty[order_executed_message_at] = (order_executed_message_base + 30 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message to the wire, 34 bytes from where the cursor stands */
inline encode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.timestamp[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> wire[at] = order_executed_message_record.tracking_number[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.order_reference_number[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.executed_quantity[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.match_number[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.mpid[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.mpid_counterparty[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message off the wire, 34 bytes from where the cursor stands */
inline decode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.timestamp[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> order_executed_message_record.tracking_number[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_reference_number[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.match_number[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.mpid[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.mpid_counterparty[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Executed Message is what was written, byte for byte */
inline equal_order_executed_message(order_executed_message_read, order_executed_message_written) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.timestamp[order_executed_message_at] == order_executed_message_written.timestamp[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> assert(order_executed_message_read.tracking_number[order_executed_message_at] == order_executed_message_written.tracking_number[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.order_reference_number[order_executed_message_at] == order_executed_message_written.order_reference_number[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.executed_quantity[order_executed_message_at] == order_executed_message_written.executed_quantity[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.match_number[order_executed_message_at] == order_executed_message_written.match_number[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.mpid[order_executed_message_at] == order_executed_message_written.mpid[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.mpid_counterparty[order_executed_message_at] == order_executed_message_written.mpid_counterparty[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Executed With Price Message: 39 bytes ----------------------------- */

/* An order executed at a price different to its display price */
typedef OrderExecutedWithPriceMessage {
  byte timestamp[8];
  byte tracking_number[2];
  byte order_reference_number[8];
  byte executed_quantity[4];
  byte match_number[4];
  byte printable;
  byte trade_price[4];
  byte mpid_owner[4];
  byte mpid_counterparty[4]
};

int order_executed_with_price_message_at;

/* every byte of Order Executed With Price Message set to one value */
inline fill_order_executed_with_price_message(order_executed_with_price_message_record, order_executed_with_price_message_value) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.timestamp[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> order_executed_with_price_message_record.tracking_number[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.order_reference_number[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.executed_quantity[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.match_number[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.printable = order_executed_with_price_message_value;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.trade_price[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.mpid_owner[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.mpid_counterparty[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Executed With Price Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_with_price_message(order_executed_with_price_message_record, order_executed_with_price_message_base) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.timestamp[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 0 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> order_executed_with_price_message_record.tracking_number[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 8 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.order_reference_number[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 10 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.executed_quantity[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 18 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.match_number[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 22 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.printable = (order_executed_with_price_message_base + 26 + 1) % 256;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.trade_price[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 27 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.mpid_owner[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 31 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.mpid_counterparty[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 35 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed With Price Message to the wire, 39 bytes from where the cursor stands */
inline encode_order_executed_with_price_message(order_executed_with_price_message_record) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> wire[at] = order_executed_with_price_message_record.timestamp[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> wire[at] = order_executed_with_price_message_record.tracking_number[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> wire[at] = order_executed_with_price_message_record.order_reference_number[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.executed_quantity[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.match_number[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_with_price_message_record.printable; at = at + 1;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.trade_price[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.mpid_owner[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.mpid_counterparty[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed With Price Message off the wire, 39 bytes from where the cursor stands */
inline decode_order_executed_with_price_message(order_executed_with_price_message_record) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.timestamp[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> order_executed_with_price_message_record.tracking_number[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.order_reference_number[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.executed_quantity[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.match_number[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.printable = wire[at]; at = at + 1;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.trade_price[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.mpid_owner[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.mpid_counterparty[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Executed With Price Message is what was written, byte for byte */
inline equal_order_executed_with_price_message(order_executed_with_price_message_read, order_executed_with_price_message_written) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> assert(order_executed_with_price_message_read.timestamp[order_executed_with_price_message_at] == order_executed_with_price_message_written.timestamp[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> assert(order_executed_with_price_message_read.tracking_number[order_executed_with_price_message_at] == order_executed_with_price_message_written.tracking_number[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> assert(order_executed_with_price_message_read.order_reference_number[order_executed_with_price_message_at] == order_executed_with_price_message_written.order_reference_number[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.executed_quantity[order_executed_with_price_message_at] == order_executed_with_price_message_written.executed_quantity[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.match_number[order_executed_with_price_message_at] == order_executed_with_price_message_written.match_number[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  assert(order_executed_with_price_message_read.printable == order_executed_with_price_message_written.printable);
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.trade_price[order_executed_with_price_message_at] == order_executed_with_price_message_written.trade_price[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.mpid_owner[order_executed_with_price_message_at] == order_executed_with_price_message_written.mpid_owner[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.mpid_counterparty[order_executed_with_price_message_at] == order_executed_with_price_message_written.mpid_counterparty[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancel Message: 22 bytes ------------------------------------------ */

/* An order on the book modified by a partial cancellation */
typedef OrderCancelMessage {
  byte timestamp[8];
  byte tracking_number[2];
  byte order_reference_number[8];
  byte canceled_quantity[4]
};

int order_cancel_message_at;

/* every byte of Order Cancel Message set to one value */
inline fill_order_cancel_message(order_cancel_message_record, order_cancel_message_value) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.timestamp[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> order_cancel_message_record.tracking_number[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.order_reference_number[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.canceled_quantity[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_order_cancel_message(order_cancel_message_record, order_cancel_message_base) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.timestamp[order_cancel_message_at] = (order_cancel_message_base + 0 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> order_cancel_message_record.tracking_number[order_cancel_message_at] = (order_cancel_message_base + 8 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.order_reference_number[order_cancel_message_at] = (order_cancel_message_base + 10 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.canceled_quantity[order_cancel_message_at] = (order_cancel_message_base + 18 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Message to the wire, 22 bytes from where the cursor stands */
inline encode_order_cancel_message(order_cancel_message_record) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> wire[at] = order_cancel_message_record.timestamp[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> wire[at] = order_cancel_message_record.tracking_number[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> wire[at] = order_cancel_message_record.order_reference_number[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> wire[at] = order_cancel_message_record.canceled_quantity[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Message off the wire, 22 bytes from where the cursor stands */
inline decode_order_cancel_message(order_cancel_message_record) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.timestamp[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> order_cancel_message_record.tracking_number[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.order_reference_number[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.canceled_quantity[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancel Message is what was written, byte for byte */
inline equal_order_cancel_message(order_cancel_message_read, order_cancel_message_written) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> assert(order_cancel_message_read.timestamp[order_cancel_message_at] == order_cancel_message_written.timestamp[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> assert(order_cancel_message_read.tracking_number[order_cancel_message_at] == order_cancel_message_written.tracking_number[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> assert(order_cancel_message_read.order_reference_number[order_cancel_message_at] == order_cancel_message_written.order_reference_number[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> assert(order_cancel_message_read.canceled_quantity[order_cancel_message_at] == order_cancel_message_written.canceled_quantity[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Delete Message: 18 bytes ------------------------------------------ */

/* An order on the book being cancelled in full */
typedef OrderDeleteMessage {
  byte timestamp[8];
  byte tracking_number[2];
  byte order_reference_number[8]
};

int order_delete_message_at;

/* every byte of Order Delete Message set to one value */
inline fill_order_delete_message(order_delete_message_record, order_delete_message_value) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.timestamp[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 2 -> order_delete_message_record.tracking_number[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.order_reference_number[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Delete Message set to where it lies, so a field read out of place says so */
inline ramp_order_delete_message(order_delete_message_record, order_delete_message_base) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.timestamp[order_delete_message_at] = (order_delete_message_base + 0 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 2 -> order_delete_message_record.tracking_number[order_delete_message_at] = (order_delete_message_base + 8 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.order_reference_number[order_delete_message_at] = (order_delete_message_base + 10 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Delete Message to the wire, 18 bytes from where the cursor stands */
inline encode_order_delete_message(order_delete_message_record) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> wire[at] = order_delete_message_record.timestamp[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 2 -> wire[at] = order_delete_message_record.tracking_number[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> wire[at] = order_delete_message_record.order_reference_number[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Delete Message off the wire, 18 bytes from where the cursor stands */
inline decode_order_delete_message(order_delete_message_record) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.timestamp[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 2 -> order_delete_message_record.tracking_number[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.order_reference_number[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Delete Message is what was written, byte for byte */
inline equal_order_delete_message(order_delete_message_read, order_delete_message_written) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> assert(order_delete_message_read.timestamp[order_delete_message_at] == order_delete_message_written.timestamp[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 2 -> assert(order_delete_message_read.tracking_number[order_delete_message_at] == order_delete_message_written.tracking_number[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> assert(order_delete_message_read.order_reference_number[order_delete_message_at] == order_delete_message_written.order_reference_number[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Book Flush Message: 14 bytes -------------------------------------- */

/* An order book is flushed and all orders removed */
typedef OrderBookFlushMessage {
  byte timestamp[8];
  byte tracking_number[2];
  byte order_book[4]
};

int order_book_flush_message_at;

/* every byte of Order Book Flush Message set to one value */
inline fill_order_book_flush_message(order_book_flush_message_record, order_book_flush_message_value) {
  order_book_flush_message_at = 0;
  do
  :: order_book_flush_message_at < 8 -> order_book_flush_message_record.timestamp[order_book_flush_message_at] = order_book_flush_message_value; order_book_flush_message_at = order_book_flush_message_at + 1
  :: else -> break
  od;
  order_book_flush_message_at = 0;
  do
  :: order_book_flush_message_at < 2 -> order_book_flush_message_record.tracking_number[order_book_flush_message_at] = order_book_flush_message_value; order_book_flush_message_at = order_book_flush_message_at + 1
  :: else -> break
  od;
  order_book_flush_message_at = 0;
  do
  :: order_book_flush_message_at < 4 -> order_book_flush_message_record.order_book[order_book_flush_message_at] = order_book_flush_message_value; order_book_flush_message_at = order_book_flush_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Book Flush Message set to where it lies, so a field read out of place says so */
inline ramp_order_book_flush_message(order_book_flush_message_record, order_book_flush_message_base) {
  order_book_flush_message_at = 0;
  do
  :: order_book_flush_message_at < 8 -> order_book_flush_message_record.timestamp[order_book_flush_message_at] = (order_book_flush_message_base + 0 + order_book_flush_message_at + 1) % 256; order_book_flush_message_at = order_book_flush_message_at + 1
  :: else -> break
  od;
  order_book_flush_message_at = 0;
  do
  :: order_book_flush_message_at < 2 -> order_book_flush_message_record.tracking_number[order_book_flush_message_at] = (order_book_flush_message_base + 8 + order_book_flush_message_at + 1) % 256; order_book_flush_message_at = order_book_flush_message_at + 1
  :: else -> break
  od;
  order_book_flush_message_at = 0;
  do
  :: order_book_flush_message_at < 4 -> order_book_flush_message_record.order_book[order_book_flush_message_at] = (order_book_flush_message_base + 10 + order_book_flush_message_at + 1) % 256; order_book_flush_message_at = order_book_flush_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Book Flush Message to the wire, 14 bytes from where the cursor stands */
inline encode_order_book_flush_message(order_book_flush_message_record) {
  order_book_flush_message_at = 0;
  do
  :: order_book_flush_message_at < 8 -> wire[at] = order_book_flush_message_record.timestamp[order_book_flush_message_at]; at = at + 1; order_book_flush_message_at = order_book_flush_message_at + 1
  :: else -> break
  od;
  order_book_flush_message_at = 0;
  do
  :: order_book_flush_message_at < 2 -> wire[at] = order_book_flush_message_record.tracking_number[order_book_flush_message_at]; at = at + 1; order_book_flush_message_at = order_book_flush_message_at + 1
  :: else -> break
  od;
  order_book_flush_message_at = 0;
  do
  :: order_book_flush_message_at < 4 -> wire[at] = order_book_flush_message_record.order_book[order_book_flush_message_at]; at = at + 1; order_book_flush_message_at = order_book_flush_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Book Flush Message off the wire, 14 bytes from where the cursor stands */
inline decode_order_book_flush_message(order_book_flush_message_record) {
  order_book_flush_message_at = 0;
  do
  :: order_book_flush_message_at < 8 -> order_book_flush_message_record.timestamp[order_book_flush_message_at] = wire[at]; at = at + 1; order_book_flush_message_at = order_book_flush_message_at + 1
  :: else -> break
  od;
  order_book_flush_message_at = 0;
  do
  :: order_book_flush_message_at < 2 -> order_book_flush_message_record.tracking_number[order_book_flush_message_at] = wire[at]; at = at + 1; order_book_flush_message_at = order_book_flush_message_at + 1
  :: else -> break
  od;
  order_book_flush_message_at = 0;
  do
  :: order_book_flush_message_at < 4 -> order_book_flush_message_record.order_book[order_book_flush_message_at] = wire[at]; at = at + 1; order_book_flush_message_at = order_book_flush_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Book Flush Message is what was written, byte for byte */
inline equal_order_book_flush_message(order_book_flush_message_read, order_book_flush_message_written) {
  order_book_flush_message_at = 0;
  do
  :: order_book_flush_message_at < 8 -> assert(order_book_flush_message_read.timestamp[order_book_flush_message_at] == order_book_flush_message_written.timestamp[order_book_flush_message_at]); order_book_flush_message_at = order_book_flush_message_at + 1
  :: else -> break
  od;
  order_book_flush_message_at = 0;
  do
  :: order_book_flush_message_at < 2 -> assert(order_book_flush_message_read.tracking_number[order_book_flush_message_at] == order_book_flush_message_written.tracking_number[order_book_flush_message_at]); order_book_flush_message_at = order_book_flush_message_at + 1
  :: else -> break
  od;
  order_book_flush_message_at = 0;
  do
  :: order_book_flush_message_at < 4 -> assert(order_book_flush_message_read.order_book[order_book_flush_message_at] == order_book_flush_message_written.order_book[order_book_flush_message_at]); order_book_flush_message_at = order_book_flush_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Replace Message: 34 bytes ----------------------------------------- */

/* An order on the book has been cancel replaced */
typedef OrderReplaceMessage {
  byte timestamp[8];
  byte tracking_number[2];
  byte original_order_reference_number[8];
  byte new_order_reference_number[8];
  byte quantity[4];
  byte price[4]
};

int order_replace_message_at;

/* every byte of Order Replace Message set to one value */
inline fill_order_replace_message(order_replace_message_record, order_replace_message_value) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.timestamp[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 2 -> order_replace_message_record.tracking_number[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.original_order_reference_number[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.new_order_reference_number[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.quantity[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.price[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Replace Message set to where it lies, so a field read out of place says so */
inline ramp_order_replace_message(order_replace_message_record, order_replace_message_base) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.timestamp[order_replace_message_at] = (order_replace_message_base + 0 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 2 -> order_replace_message_record.tracking_number[order_replace_message_at] = (order_replace_message_base + 8 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.original_order_reference_number[order_replace_message_at] = (order_replace_message_base + 10 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.new_order_reference_number[order_replace_message_at] = (order_replace_message_base + 18 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.quantity[order_replace_message_at] = (order_replace_message_base + 26 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.price[order_replace_message_at] = (order_replace_message_base + 30 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replace Message to the wire, 34 bytes from where the cursor stands */
inline encode_order_replace_message(order_replace_message_record) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> wire[at] = order_replace_message_record.timestamp[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 2 -> wire[at] = order_replace_message_record.tracking_number[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> wire[at] = order_replace_message_record.original_order_reference_number[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> wire[at] = order_replace_message_record.new_order_reference_number[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> wire[at] = order_replace_message_record.quantity[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> wire[at] = order_replace_message_record.price[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replace Message off the wire, 34 bytes from where the cursor stands */
inline decode_order_replace_message(order_replace_message_record) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.timestamp[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 2 -> order_replace_message_record.tracking_number[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.original_order_reference_number[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.new_order_reference_number[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.quantity[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.price[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Replace Message is what was written, byte for byte */
inline equal_order_replace_message(order_replace_message_read, order_replace_message_written) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> assert(order_replace_message_read.timestamp[order_replace_message_at] == order_replace_message_written.timestamp[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 2 -> assert(order_replace_message_read.tracking_number[order_replace_message_at] == order_replace_message_written.tracking_number[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> assert(order_replace_message_read.original_order_reference_number[order_replace_message_at] == order_replace_message_written.original_order_reference_number[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> assert(order_replace_message_read.new_order_reference_number[order_replace_message_at] == order_replace_message_written.new_order_reference_number[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> assert(order_replace_message_read.quantity[order_replace_message_at] == order_replace_message_written.quantity[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> assert(order_replace_message_read.price[order_replace_message_at] == order_replace_message_written.price[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Message: 43 bytes ------------------------------------------------- */

/* Execution details for a match involving non displayable order types */
typedef TradeMessage {
  byte timestamp[8];
  byte tracking_number[2];
  byte order_reference_number[8];
  byte trade_type;
  byte quantity[4];
  byte order_book[4];
  byte match_number[4];
  byte trade_price[4];
  byte participant_id_buyer[4];
  byte participant_id_seller[4]
};

int trade_message_at;

/* every byte of Trade Message set to one value */
inline fill_trade_message(trade_message_record, trade_message_value) {
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.timestamp[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.tracking_number[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.order_reference_number[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_type = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.quantity[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.order_book[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.match_number[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.trade_price[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.participant_id_buyer[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.participant_id_seller[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Message set to where it lies, so a field read out of place says so */
inline ramp_trade_message(trade_message_record, trade_message_base) {
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.timestamp[trade_message_at] = (trade_message_base + 0 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.tracking_number[trade_message_at] = (trade_message_base + 8 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.order_reference_number[trade_message_at] = (trade_message_base + 10 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_type = (trade_message_base + 18 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.quantity[trade_message_at] = (trade_message_base + 19 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.order_book[trade_message_at] = (trade_message_base + 23 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.match_number[trade_message_at] = (trade_message_base + 27 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.trade_price[trade_message_at] = (trade_message_base + 31 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.participant_id_buyer[trade_message_at] = (trade_message_base + 35 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.participant_id_seller[trade_message_at] = (trade_message_base + 39 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message to the wire, 43 bytes from where the cursor stands */
inline encode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.timestamp[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> wire[at] = trade_message_record.tracking_number[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.order_reference_number[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.trade_type; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.quantity[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.order_book[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.match_number[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.trade_price[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.participant_id_buyer[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.participant_id_seller[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message off the wire, 43 bytes from where the cursor stands */
inline decode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.timestamp[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.tracking_number[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.order_reference_number[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_type = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.quantity[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.order_book[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.match_number[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.trade_price[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.participant_id_buyer[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.participant_id_seller[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Message is what was written, byte for byte */
inline equal_trade_message(trade_message_read, trade_message_written) {
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.timestamp[trade_message_at] == trade_message_written.timestamp[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> assert(trade_message_read.tracking_number[trade_message_at] == trade_message_written.tracking_number[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.order_reference_number[trade_message_at] == trade_message_written.order_reference_number[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.trade_type == trade_message_written.trade_type);
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.quantity[trade_message_at] == trade_message_written.quantity[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.order_book[trade_message_at] == trade_message_written.order_book[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.match_number[trade_message_at] == trade_message_written.match_number[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.trade_price[trade_message_at] == trade_message_written.trade_price[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.participant_id_buyer[trade_message_at] == trade_message_written.participant_id_buyer[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.participant_id_seller[trade_message_at] == trade_message_written.participant_id_seller[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cross Trade Message: 31 bytes ------------------------------------------- */

/* The cross process has completed for a specific security */
typedef CrossTradeMessage {
  byte timestamp[8];
  byte tracking_number[2];
  byte quantity[4];
  byte order_book[4];
  byte cross_price[4];
  byte match_number[4];
  byte cross_type;
  byte number_of_trades[4]
};

int cross_trade_message_at;

/* every byte of Cross Trade Message set to one value */
inline fill_cross_trade_message(cross_trade_message_record, cross_trade_message_value) {
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.timestamp[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> cross_trade_message_record.tracking_number[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.quantity[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.order_book[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.cross_price[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.match_number[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_record.cross_type = cross_trade_message_value;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.number_of_trades[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cross Trade Message set to where it lies, so a field read out of place says so */
inline ramp_cross_trade_message(cross_trade_message_record, cross_trade_message_base) {
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.timestamp[cross_trade_message_at] = (cross_trade_message_base + 0 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> cross_trade_message_record.tracking_number[cross_trade_message_at] = (cross_trade_message_base + 8 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.quantity[cross_trade_message_at] = (cross_trade_message_base + 10 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.order_book[cross_trade_message_at] = (cross_trade_message_base + 14 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.cross_price[cross_trade_message_at] = (cross_trade_message_base + 18 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.match_number[cross_trade_message_at] = (cross_trade_message_base + 22 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_record.cross_type = (cross_trade_message_base + 26 + 1) % 256;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.number_of_trades[cross_trade_message_at] = (cross_trade_message_base + 27 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cross Trade Message to the wire, 31 bytes from where the cursor stands */
inline encode_cross_trade_message(cross_trade_message_record) {
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> wire[at] = cross_trade_message_record.timestamp[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> wire[at] = cross_trade_message_record.tracking_number[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> wire[at] = cross_trade_message_record.quantity[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> wire[at] = cross_trade_message_record.order_book[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> wire[at] = cross_trade_message_record.cross_price[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> wire[at] = cross_trade_message_record.match_number[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = cross_trade_message_record.cross_type; at = at + 1;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> wire[at] = cross_trade_message_record.number_of_trades[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cross Trade Message off the wire, 31 bytes from where the cursor stands */
inline decode_cross_trade_message(cross_trade_message_record) {
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.timestamp[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> cross_trade_message_record.tracking_number[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.quantity[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.order_book[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.cross_price[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.match_number[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_record.cross_type = wire[at]; at = at + 1;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.number_of_trades[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cross Trade Message is what was written, byte for byte */
inline equal_cross_trade_message(cross_trade_message_read, cross_trade_message_written) {
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> assert(cross_trade_message_read.timestamp[cross_trade_message_at] == cross_trade_message_written.timestamp[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> assert(cross_trade_message_read.tracking_number[cross_trade_message_at] == cross_trade_message_written.tracking_number[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> assert(cross_trade_message_read.quantity[cross_trade_message_at] == cross_trade_message_written.quantity[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> assert(cross_trade_message_read.order_book[cross_trade_message_at] == cross_trade_message_written.order_book[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> assert(cross_trade_message_read.cross_price[cross_trade_message_at] == cross_trade_message_written.cross_price[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> assert(cross_trade_message_read.match_number[cross_trade_message_at] == cross_trade_message_written.match_number[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  assert(cross_trade_message_read.cross_type == cross_trade_message_written.cross_type);
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> assert(cross_trade_message_read.number_of_trades[cross_trade_message_at] == cross_trade_message_written.number_of_trades[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Broken Trade Message: 14 bytes ------------------------------------------ */

/* An execution has been broken and cannot be reinstated */
typedef BrokenTradeMessage {
  byte timestamp[8];
  byte tracking_number[2];
  byte match_number[4]
};

int broken_trade_message_at;

/* every byte of Broken Trade Message set to one value */
inline fill_broken_trade_message(broken_trade_message_record, broken_trade_message_value) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.timestamp[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 2 -> broken_trade_message_record.tracking_number[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.match_number[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Broken Trade Message set to where it lies, so a field read out of place says so */
inline ramp_broken_trade_message(broken_trade_message_record, broken_trade_message_base) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.timestamp[broken_trade_message_at] = (broken_trade_message_base + 0 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 2 -> broken_trade_message_record.tracking_number[broken_trade_message_at] = (broken_trade_message_base + 8 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.match_number[broken_trade_message_at] = (broken_trade_message_base + 10 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Broken Trade Message to the wire, 14 bytes from where the cursor stands */
inline encode_broken_trade_message(broken_trade_message_record) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> wire[at] = broken_trade_message_record.timestamp[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 2 -> wire[at] = broken_trade_message_record.tracking_number[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> wire[at] = broken_trade_message_record.match_number[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Broken Trade Message off the wire, 14 bytes from where the cursor stands */
inline decode_broken_trade_message(broken_trade_message_record) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.timestamp[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 2 -> broken_trade_message_record.tracking_number[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.match_number[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Broken Trade Message is what was written, byte for byte */
inline equal_broken_trade_message(broken_trade_message_read, broken_trade_message_written) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> assert(broken_trade_message_read.timestamp[broken_trade_message_at] == broken_trade_message_written.timestamp[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 2 -> assert(broken_trade_message_read.tracking_number[broken_trade_message_at] == broken_trade_message_written.tracking_number[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> assert(broken_trade_message_read.match_number[broken_trade_message_at] == broken_trade_message_written.match_number[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Noii Message: 60 bytes -------------------------------------------------- */

/* Net order imbalance indicator disseminated during a cross auction */
typedef NoiiMessage {
  byte timestamp[8];
  byte tracking_number[2];
  byte paired_quantity[8];
  byte imbalance_quantity[8];
  byte imbalance_direction;
  byte order_book[4];
  byte equilibrium_price[4];
  byte cross_type;
  byte best_bid_price[4];
  byte best_bid_quantity[8];
  byte best_ask_price[4];
  byte best_ask_quantity[8]
};

int noii_message_at;

/* every byte of Noii Message set to one value */
inline fill_noii_message(noii_message_record, noii_message_value) {
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> noii_message_record.timestamp[noii_message_at] = noii_message_value; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 2 -> noii_message_record.tracking_number[noii_message_at] = noii_message_value; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> noii_message_record.paired_quantity[noii_message_at] = noii_message_value; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> noii_message_record.imbalance_quantity[noii_message_at] = noii_message_value; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_record.imbalance_direction = noii_message_value;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.order_book[noii_message_at] = noii_message_value; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.equilibrium_price[noii_message_at] = noii_message_value; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_record.cross_type = noii_message_value;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.best_bid_price[noii_message_at] = noii_message_value; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> noii_message_record.best_bid_quantity[noii_message_at] = noii_message_value; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.best_ask_price[noii_message_at] = noii_message_value; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> noii_message_record.best_ask_quantity[noii_message_at] = noii_message_value; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Noii Message set to where it lies, so a field read out of place says so */
inline ramp_noii_message(noii_message_record, noii_message_base) {
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> noii_message_record.timestamp[noii_message_at] = (noii_message_base + 0 + noii_message_at + 1) % 256; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 2 -> noii_message_record.tracking_number[noii_message_at] = (noii_message_base + 8 + noii_message_at + 1) % 256; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> noii_message_record.paired_quantity[noii_message_at] = (noii_message_base + 10 + noii_message_at + 1) % 256; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> noii_message_record.imbalance_quantity[noii_message_at] = (noii_message_base + 18 + noii_message_at + 1) % 256; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_record.imbalance_direction = (noii_message_base + 26 + 1) % 256;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.order_book[noii_message_at] = (noii_message_base + 27 + noii_message_at + 1) % 256; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.equilibrium_price[noii_message_at] = (noii_message_base + 31 + noii_message_at + 1) % 256; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_record.cross_type = (noii_message_base + 35 + 1) % 256;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.best_bid_price[noii_message_at] = (noii_message_base + 36 + noii_message_at + 1) % 256; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> noii_message_record.best_bid_quantity[noii_message_at] = (noii_message_base + 40 + noii_message_at + 1) % 256; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.best_ask_price[noii_message_at] = (noii_message_base + 48 + noii_message_at + 1) % 256; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> noii_message_record.best_ask_quantity[noii_message_at] = (noii_message_base + 52 + noii_message_at + 1) % 256; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  skip
}

/* Noii Message to the wire, 60 bytes from where the cursor stands */
inline encode_noii_message(noii_message_record) {
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> wire[at] = noii_message_record.timestamp[noii_message_at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 2 -> wire[at] = noii_message_record.tracking_number[noii_message_at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> wire[at] = noii_message_record.paired_quantity[noii_message_at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> wire[at] = noii_message_record.imbalance_quantity[noii_message_at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  wire[at] = noii_message_record.imbalance_direction; at = at + 1;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> wire[at] = noii_message_record.order_book[noii_message_at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> wire[at] = noii_message_record.equilibrium_price[noii_message_at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  wire[at] = noii_message_record.cross_type; at = at + 1;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> wire[at] = noii_message_record.best_bid_price[noii_message_at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> wire[at] = noii_message_record.best_bid_quantity[noii_message_at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> wire[at] = noii_message_record.best_ask_price[noii_message_at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> wire[at] = noii_message_record.best_ask_quantity[noii_message_at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  skip
}

/* Noii Message off the wire, 60 bytes from where the cursor stands */
inline decode_noii_message(noii_message_record) {
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> noii_message_record.timestamp[noii_message_at] = wire[at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 2 -> noii_message_record.tracking_number[noii_message_at] = wire[at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> noii_message_record.paired_quantity[noii_message_at] = wire[at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> noii_message_record.imbalance_quantity[noii_message_at] = wire[at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_record.imbalance_direction = wire[at]; at = at + 1;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.order_book[noii_message_at] = wire[at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.equilibrium_price[noii_message_at] = wire[at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_record.cross_type = wire[at]; at = at + 1;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.best_bid_price[noii_message_at] = wire[at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> noii_message_record.best_bid_quantity[noii_message_at] = wire[at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.best_ask_price[noii_message_at] = wire[at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> noii_message_record.best_ask_quantity[noii_message_at] = wire[at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Noii Message is what was written, byte for byte */
inline equal_noii_message(noii_message_read, noii_message_written) {
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> assert(noii_message_read.timestamp[noii_message_at] == noii_message_written.timestamp[noii_message_at]); noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 2 -> assert(noii_message_read.tracking_number[noii_message_at] == noii_message_written.tracking_number[noii_message_at]); noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> assert(noii_message_read.paired_quantity[noii_message_at] == noii_message_written.paired_quantity[noii_message_at]); noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> assert(noii_message_read.imbalance_quantity[noii_message_at] == noii_message_written.imbalance_quantity[noii_message_at]); noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  assert(noii_message_read.imbalance_direction == noii_message_written.imbalance_direction);
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> assert(noii_message_read.order_book[noii_message_at] == noii_message_written.order_book[noii_message_at]); noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> assert(noii_message_read.equilibrium_price[noii_message_at] == noii_message_written.equilibrium_price[noii_message_at]); noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  assert(noii_message_read.cross_type == noii_message_written.cross_type);
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> assert(noii_message_read.best_bid_price[noii_message_at] == noii_message_written.best_bid_price[noii_message_at]); noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> assert(noii_message_read.best_bid_quantity[noii_message_at] == noii_message_written.best_bid_quantity[noii_message_at]); noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> assert(noii_message_read.best_ask_price[noii_message_at] == noii_message_written.best_ask_price[noii_message_at]); noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 8 -> assert(noii_message_read.best_ask_quantity[noii_message_at] == noii_message_written.best_ask_quantity[noii_message_at]); noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Moii Message: 28 bytes -------------------------------------------------- */

/* Auction on demand order imbalance indicator */
typedef MoiiMessage {
  byte timestamp[8];
  byte tracking_number[2];
  byte paired_quantity[8];
  byte order_book[4];
  byte equilibrium_price[4];
  byte cross_type;
  byte cross_level
};

int moii_message_at;

/* every byte of Moii Message set to one value */
inline fill_moii_message(moii_message_record, moii_message_value) {
  moii_message_at = 0;
  do
  :: moii_message_at < 8 -> moii_message_record.timestamp[moii_message_at] = moii_message_value; moii_message_at = moii_message_at + 1
  :: else -> break
  od;
  moii_message_at = 0;
  do
  :: moii_message_at < 2 -> moii_message_record.tracking_number[moii_message_at] = moii_message_value; moii_message_at = moii_message_at + 1
  :: else -> break
  od;
  moii_message_at = 0;
  do
  :: moii_message_at < 8 -> moii_message_record.paired_quantity[moii_message_at] = moii_message_value; moii_message_at = moii_message_at + 1
  :: else -> break
  od;
  moii_message_at = 0;
  do
  :: moii_message_at < 4 -> moii_message_record.order_book[moii_message_at] = moii_message_value; moii_message_at = moii_message_at + 1
  :: else -> break
  od;
  moii_message_at = 0;
  do
  :: moii_message_at < 4 -> moii_message_record.equilibrium_price[moii_message_at] = moii_message_value; moii_message_at = moii_message_at + 1
  :: else -> break
  od;
  moii_message_record.cross_type = moii_message_value;
  moii_message_record.cross_level = moii_message_value;
  skip
}

/* each byte of Moii Message set to where it lies, so a field read out of place says so */
inline ramp_moii_message(moii_message_record, moii_message_base) {
  moii_message_at = 0;
  do
  :: moii_message_at < 8 -> moii_message_record.timestamp[moii_message_at] = (moii_message_base + 0 + moii_message_at + 1) % 256; moii_message_at = moii_message_at + 1
  :: else -> break
  od;
  moii_message_at = 0;
  do
  :: moii_message_at < 2 -> moii_message_record.tracking_number[moii_message_at] = (moii_message_base + 8 + moii_message_at + 1) % 256; moii_message_at = moii_message_at + 1
  :: else -> break
  od;
  moii_message_at = 0;
  do
  :: moii_message_at < 8 -> moii_message_record.paired_quantity[moii_message_at] = (moii_message_base + 10 + moii_message_at + 1) % 256; moii_message_at = moii_message_at + 1
  :: else -> break
  od;
  moii_message_at = 0;
  do
  :: moii_message_at < 4 -> moii_message_record.order_book[moii_message_at] = (moii_message_base + 18 + moii_message_at + 1) % 256; moii_message_at = moii_message_at + 1
  :: else -> break
  od;
  moii_message_at = 0;
  do
  :: moii_message_at < 4 -> moii_message_record.equilibrium_price[moii_message_at] = (moii_message_base + 22 + moii_message_at + 1) % 256; moii_message_at = moii_message_at + 1
  :: else -> break
  od;
  moii_message_record.cross_type = (moii_message_base + 26 + 1) % 256;
  moii_message_record.cross_level = (moii_message_base + 27 + 1) % 256;
  skip
}

/* Moii Message to the wire, 28 bytes from where the cursor stands */
inline encode_moii_message(moii_message_record) {
  moii_message_at = 0;
  do
  :: moii_message_at < 8 -> wire[at] = moii_message_record.timestamp[moii_message_at]; at = at + 1; moii_message_at = moii_message_at + 1
  :: else -> break
  od;
  moii_message_at = 0;
  do
  :: moii_message_at < 2 -> wire[at] = moii_message_record.tracking_number[moii_message_at]; at = at + 1; moii_message_at = moii_message_at + 1
  :: else -> break
  od;
  moii_message_at = 0;
  do
  :: moii_message_at < 8 -> wire[at] = moii_message_record.paired_quantity[moii_message_at]; at = at + 1; moii_message_at = moii_message_at + 1
  :: else -> break
  od;
  moii_message_at = 0;
  do
  :: moii_message_at < 4 -> wire[at] = moii_message_record.order_book[moii_message_at]; at = at + 1; moii_message_at = moii_message_at + 1
  :: else -> break
  od;
  moii_message_at = 0;
  do
  :: moii_message_at < 4 -> wire[at] = moii_message_record.equilibrium_price[moii_message_at]; at = at + 1; moii_message_at = moii_message_at + 1
  :: else -> break
  od;
  wire[at] = moii_message_record.cross_type; at = at + 1;
  wire[at] = moii_message_record.cross_level; at = at + 1;
  skip
}

/* Moii Message off the wire, 28 bytes from where the cursor stands */
inline decode_moii_message(moii_message_record) {
  moii_message_at = 0;
  do
  :: moii_message_at < 8 -> moii_message_record.timestamp[moii_message_at] = wire[at]; at = at + 1; moii_message_at = moii_message_at + 1
  :: else -> break
  od;
  moii_message_at = 0;
  do
  :: moii_message_at < 2 -> moii_message_record.tracking_number[moii_message_at] = wire[at]; at = at + 1; moii_message_at = moii_message_at + 1
  :: else -> break
  od;
  moii_message_at = 0;
  do
  :: moii_message_at < 8 -> moii_message_record.paired_quantity[moii_message_at] = wire[at]; at = at + 1; moii_message_at = moii_message_at + 1
  :: else -> break
  od;
  moii_message_at = 0;
  do
  :: moii_message_at < 4 -> moii_message_record.order_book[moii_message_at] = wire[at]; at = at + 1; moii_message_at = moii_message_at + 1
  :: else -> break
  od;
  moii_message_at = 0;
  do
  :: moii_message_at < 4 -> moii_message_record.equilibrium_price[moii_message_at] = wire[at]; at = at + 1; moii_message_at = moii_message_at + 1
  :: else -> break
  od;
  moii_message_record.cross_type = wire[at]; at = at + 1;
  moii_message_record.cross_level = wire[at]; at = at + 1;
  skip
}

/* what was read of Moii Message is what was written, byte for byte */
inline equal_moii_message(moii_message_read, moii_message_written) {
  moii_message_at = 0;
  do
  :: moii_message_at < 8 -> assert(moii_message_read.timestamp[moii_message_at] == moii_message_written.timestamp[moii_message_at]); moii_message_at = moii_message_at + 1
  :: else -> break
  od;
  moii_message_at = 0;
  do
  :: moii_message_at < 2 -> assert(moii_message_read.tracking_number[moii_message_at] == moii_message_written.tracking_number[moii_message_at]); moii_message_at = moii_message_at + 1
  :: else -> break
  od;
  moii_message_at = 0;
  do
  :: moii_message_at < 8 -> assert(moii_message_read.paired_quantity[moii_message_at] == moii_message_written.paired_quantity[moii_message_at]); moii_message_at = moii_message_at + 1
  :: else -> break
  od;
  moii_message_at = 0;
  do
  :: moii_message_at < 4 -> assert(moii_message_read.order_book[moii_message_at] == moii_message_written.order_book[moii_message_at]); moii_message_at = moii_message_at + 1
  :: else -> break
  od;
  moii_message_at = 0;
  do
  :: moii_message_at < 4 -> assert(moii_message_read.equilibrium_price[moii_message_at] == moii_message_written.equilibrium_price[moii_message_at]); moii_message_at = moii_message_at + 1
  :: else -> break
  od;
  assert(moii_message_read.cross_type == moii_message_written.cross_type);
  assert(moii_message_read.cross_level == moii_message_written.cross_level);
  skip
}

/* ---- Execution Summary Message: 37 bytes ------------------------------------- */

/* Summary information disseminated before the individual trades */
typedef ExecutionSummaryMessage {
  byte timestamp[8];
  byte tracking_number[2];
  byte order_book[4];
  byte aggressing_side;
  byte quantity[4];
  byte hidden_quantity[4];
  byte stp_cancel_quantity[4];
  byte far_price[4];
  byte add_quantity[4];
  byte number_of_lit_executions[2]
};

int execution_summary_message_at;

/* every byte of Execution Summary Message set to one value */
inline fill_execution_summary_message(execution_summary_message_record, execution_summary_message_value) {
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.timestamp[execution_summary_message_at] = execution_summary_message_value; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 2 -> execution_summary_message_record.tracking_number[execution_summary_message_at] = execution_summary_message_value; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> execution_summary_message_record.order_book[execution_summary_message_at] = execution_summary_message_value; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_record.aggressing_side = execution_summary_message_value;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> execution_summary_message_record.quantity[execution_summary_message_at] = execution_summary_message_value; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> execution_summary_message_record.hidden_quantity[execution_summary_message_at] = execution_summary_message_value; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> execution_summary_message_record.stp_cancel_quantity[execution_summary_message_at] = execution_summary_message_value; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> execution_summary_message_record.far_price[execution_summary_message_at] = execution_summary_message_value; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> execution_summary_message_record.add_quantity[execution_summary_message_at] = execution_summary_message_value; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 2 -> execution_summary_message_record.number_of_lit_executions[execution_summary_message_at] = execution_summary_message_value; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Execution Summary Message set to where it lies, so a field read out of place says so */
inline ramp_execution_summary_message(execution_summary_message_record, execution_summary_message_base) {
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.timestamp[execution_summary_message_at] = (execution_summary_message_base + 0 + execution_summary_message_at + 1) % 256; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 2 -> execution_summary_message_record.tracking_number[execution_summary_message_at] = (execution_summary_message_base + 8 + execution_summary_message_at + 1) % 256; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> execution_summary_message_record.order_book[execution_summary_message_at] = (execution_summary_message_base + 10 + execution_summary_message_at + 1) % 256; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_record.aggressing_side = (execution_summary_message_base + 14 + 1) % 256;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> execution_summary_message_record.quantity[execution_summary_message_at] = (execution_summary_message_base + 15 + execution_summary_message_at + 1) % 256; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> execution_summary_message_record.hidden_quantity[execution_summary_message_at] = (execution_summary_message_base + 19 + execution_summary_message_at + 1) % 256; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> execution_summary_message_record.stp_cancel_quantity[execution_summary_message_at] = (execution_summary_message_base + 23 + execution_summary_message_at + 1) % 256; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> execution_summary_message_record.far_price[execution_summary_message_at] = (execution_summary_message_base + 27 + execution_summary_message_at + 1) % 256; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> execution_summary_message_record.add_quantity[execution_summary_message_at] = (execution_summary_message_base + 31 + execution_summary_message_at + 1) % 256; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 2 -> execution_summary_message_record.number_of_lit_executions[execution_summary_message_at] = (execution_summary_message_base + 35 + execution_summary_message_at + 1) % 256; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Summary Message to the wire, 37 bytes from where the cursor stands */
inline encode_execution_summary_message(execution_summary_message_record) {
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> wire[at] = execution_summary_message_record.timestamp[execution_summary_message_at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 2 -> wire[at] = execution_summary_message_record.tracking_number[execution_summary_message_at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> wire[at] = execution_summary_message_record.order_book[execution_summary_message_at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_summary_message_record.aggressing_side; at = at + 1;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> wire[at] = execution_summary_message_record.quantity[execution_summary_message_at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> wire[at] = execution_summary_message_record.hidden_quantity[execution_summary_message_at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> wire[at] = execution_summary_message_record.stp_cancel_quantity[execution_summary_message_at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> wire[at] = execution_summary_message_record.far_price[execution_summary_message_at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> wire[at] = execution_summary_message_record.add_quantity[execution_summary_message_at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 2 -> wire[at] = execution_summary_message_record.number_of_lit_executions[execution_summary_message_at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Summary Message off the wire, 37 bytes from where the cursor stands */
inline decode_execution_summary_message(execution_summary_message_record) {
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> execution_summary_message_record.timestamp[execution_summary_message_at] = wire[at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 2 -> execution_summary_message_record.tracking_number[execution_summary_message_at] = wire[at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> execution_summary_message_record.order_book[execution_summary_message_at] = wire[at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_record.aggressing_side = wire[at]; at = at + 1;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> execution_summary_message_record.quantity[execution_summary_message_at] = wire[at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> execution_summary_message_record.hidden_quantity[execution_summary_message_at] = wire[at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> execution_summary_message_record.stp_cancel_quantity[execution_summary_message_at] = wire[at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> execution_summary_message_record.far_price[execution_summary_message_at] = wire[at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> execution_summary_message_record.add_quantity[execution_summary_message_at] = wire[at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 2 -> execution_summary_message_record.number_of_lit_executions[execution_summary_message_at] = wire[at]; at = at + 1; execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Execution Summary Message is what was written, byte for byte */
inline equal_execution_summary_message(execution_summary_message_read, execution_summary_message_written) {
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 8 -> assert(execution_summary_message_read.timestamp[execution_summary_message_at] == execution_summary_message_written.timestamp[execution_summary_message_at]); execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 2 -> assert(execution_summary_message_read.tracking_number[execution_summary_message_at] == execution_summary_message_written.tracking_number[execution_summary_message_at]); execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> assert(execution_summary_message_read.order_book[execution_summary_message_at] == execution_summary_message_written.order_book[execution_summary_message_at]); execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  assert(execution_summary_message_read.aggressing_side == execution_summary_message_written.aggressing_side);
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> assert(execution_summary_message_read.quantity[execution_summary_message_at] == execution_summary_message_written.quantity[execution_summary_message_at]); execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> assert(execution_summary_message_read.hidden_quantity[execution_summary_message_at] == execution_summary_message_written.hidden_quantity[execution_summary_message_at]); execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> assert(execution_summary_message_read.stp_cancel_quantity[execution_summary_message_at] == execution_summary_message_written.stp_cancel_quantity[execution_summary_message_at]); execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> assert(execution_summary_message_read.far_price[execution_summary_message_at] == execution_summary_message_written.far_price[execution_summary_message_at]); execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 4 -> assert(execution_summary_message_read.add_quantity[execution_summary_message_at] == execution_summary_message_written.add_quantity[execution_summary_message_at]); execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  execution_summary_message_at = 0;
  do
  :: execution_summary_message_at < 2 -> assert(execution_summary_message_read.number_of_lit_executions[execution_summary_message_at] == execution_summary_message_written.number_of_lit_executions[execution_summary_message_at]); execution_summary_message_at = execution_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Packet Header: encoded, read back, and compared */
proctype check_packet_header() {
  PacketHeader packet_header_sent;
  PacketHeader packet_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_packet_header(packet_header_sent, 0)
  :: pattern == 1 -> fill_packet_header(packet_header_sent, 32)
  :: pattern == 2 -> fill_packet_header(packet_header_sent, 255)
  :: else -> ramp_packet_header(packet_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_packet_header(packet_header_sent);
    assert(at == 20);
    at = 0;
    decode_packet_header(packet_header_got);
    assert(at == 20);
    equal_packet_header(packet_header_got, packet_header_sent)
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
    assert(at == 3);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 3);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* System Event Message: encoded, read back, and compared */
proctype check_system_event_message() {
  SystemEventMessage system_event_message_sent;
  SystemEventMessage system_event_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_system_event_message(system_event_message_sent, 0)
  :: pattern == 1 -> fill_system_event_message(system_event_message_sent, 32)
  :: pattern == 2 -> fill_system_event_message(system_event_message_sent, 255)
  :: else -> ramp_system_event_message(system_event_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_system_event_message(system_event_message_sent);
    assert(at == 11);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 11);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Order Book Trading Action Message: encoded, read back, and compared */
proctype check_order_book_trading_action_message() {
  OrderBookTradingActionMessage order_book_trading_action_message_sent;
  OrderBookTradingActionMessage order_book_trading_action_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_book_trading_action_message(order_book_trading_action_message_sent, 0)
  :: pattern == 1 -> fill_order_book_trading_action_message(order_book_trading_action_message_sent, 32)
  :: pattern == 2 -> fill_order_book_trading_action_message(order_book_trading_action_message_sent, 255)
  :: else -> ramp_order_book_trading_action_message(order_book_trading_action_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_book_trading_action_message(order_book_trading_action_message_sent);
    assert(at == 20);
    at = 0;
    decode_order_book_trading_action_message(order_book_trading_action_message_got);
    assert(at == 20);
    equal_order_book_trading_action_message(order_book_trading_action_message_got, order_book_trading_action_message_sent)
  }
}

/* Add Order Message: encoded, read back, and compared */
proctype check_add_order_message() {
  AddOrderMessage add_order_message_sent;
  AddOrderMessage add_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_message(add_order_message_sent, 0)
  :: pattern == 1 -> fill_add_order_message(add_order_message_sent, 32)
  :: pattern == 2 -> fill_add_order_message(add_order_message_sent, 255)
  :: else -> ramp_add_order_message(add_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_message(add_order_message_sent);
    assert(at == 31);
    at = 0;
    decode_add_order_message(add_order_message_got);
    assert(at == 31);
    equal_add_order_message(add_order_message_got, add_order_message_sent)
  }
}

/* Add Order Mpid Attribution Message: encoded, read back, and compared */
proctype check_add_order_mpid_attribution_message() {
  AddOrderMpidAttributionMessage add_order_mpid_attribution_message_sent;
  AddOrderMpidAttributionMessage add_order_mpid_attribution_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_mpid_attribution_message(add_order_mpid_attribution_message_sent, 0)
  :: pattern == 1 -> fill_add_order_mpid_attribution_message(add_order_mpid_attribution_message_sent, 32)
  :: pattern == 2 -> fill_add_order_mpid_attribution_message(add_order_mpid_attribution_message_sent, 255)
  :: else -> ramp_add_order_mpid_attribution_message(add_order_mpid_attribution_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_mpid_attribution_message(add_order_mpid_attribution_message_sent);
    assert(at == 35);
    at = 0;
    decode_add_order_mpid_attribution_message(add_order_mpid_attribution_message_got);
    assert(at == 35);
    equal_add_order_mpid_attribution_message(add_order_mpid_attribution_message_got, add_order_mpid_attribution_message_sent)
  }
}

/* Order Executed Message: encoded, read back, and compared */
proctype check_order_executed_message() {
  OrderExecutedMessage order_executed_message_sent;
  OrderExecutedMessage order_executed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_executed_message(order_executed_message_sent, 0)
  :: pattern == 1 -> fill_order_executed_message(order_executed_message_sent, 32)
  :: pattern == 2 -> fill_order_executed_message(order_executed_message_sent, 255)
  :: else -> ramp_order_executed_message(order_executed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_executed_message(order_executed_message_sent);
    assert(at == 34);
    at = 0;
    decode_order_executed_message(order_executed_message_got);
    assert(at == 34);
    equal_order_executed_message(order_executed_message_got, order_executed_message_sent)
  }
}

/* Order Executed With Price Message: encoded, read back, and compared */
proctype check_order_executed_with_price_message() {
  OrderExecutedWithPriceMessage order_executed_with_price_message_sent;
  OrderExecutedWithPriceMessage order_executed_with_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_executed_with_price_message(order_executed_with_price_message_sent, 0)
  :: pattern == 1 -> fill_order_executed_with_price_message(order_executed_with_price_message_sent, 32)
  :: pattern == 2 -> fill_order_executed_with_price_message(order_executed_with_price_message_sent, 255)
  :: else -> ramp_order_executed_with_price_message(order_executed_with_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_executed_with_price_message(order_executed_with_price_message_sent);
    assert(at == 39);
    at = 0;
    decode_order_executed_with_price_message(order_executed_with_price_message_got);
    assert(at == 39);
    equal_order_executed_with_price_message(order_executed_with_price_message_got, order_executed_with_price_message_sent)
  }
}

/* Order Cancel Message: encoded, read back, and compared */
proctype check_order_cancel_message() {
  OrderCancelMessage order_cancel_message_sent;
  OrderCancelMessage order_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancel_message(order_cancel_message_sent, 0)
  :: pattern == 1 -> fill_order_cancel_message(order_cancel_message_sent, 32)
  :: pattern == 2 -> fill_order_cancel_message(order_cancel_message_sent, 255)
  :: else -> ramp_order_cancel_message(order_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancel_message(order_cancel_message_sent);
    assert(at == 22);
    at = 0;
    decode_order_cancel_message(order_cancel_message_got);
    assert(at == 22);
    equal_order_cancel_message(order_cancel_message_got, order_cancel_message_sent)
  }
}

/* Order Delete Message: encoded, read back, and compared */
proctype check_order_delete_message() {
  OrderDeleteMessage order_delete_message_sent;
  OrderDeleteMessage order_delete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_delete_message(order_delete_message_sent, 0)
  :: pattern == 1 -> fill_order_delete_message(order_delete_message_sent, 32)
  :: pattern == 2 -> fill_order_delete_message(order_delete_message_sent, 255)
  :: else -> ramp_order_delete_message(order_delete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_delete_message(order_delete_message_sent);
    assert(at == 18);
    at = 0;
    decode_order_delete_message(order_delete_message_got);
    assert(at == 18);
    equal_order_delete_message(order_delete_message_got, order_delete_message_sent)
  }
}

/* Order Book Flush Message: encoded, read back, and compared */
proctype check_order_book_flush_message() {
  OrderBookFlushMessage order_book_flush_message_sent;
  OrderBookFlushMessage order_book_flush_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_book_flush_message(order_book_flush_message_sent, 0)
  :: pattern == 1 -> fill_order_book_flush_message(order_book_flush_message_sent, 32)
  :: pattern == 2 -> fill_order_book_flush_message(order_book_flush_message_sent, 255)
  :: else -> ramp_order_book_flush_message(order_book_flush_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_book_flush_message(order_book_flush_message_sent);
    assert(at == 14);
    at = 0;
    decode_order_book_flush_message(order_book_flush_message_got);
    assert(at == 14);
    equal_order_book_flush_message(order_book_flush_message_got, order_book_flush_message_sent)
  }
}

/* Order Replace Message: encoded, read back, and compared */
proctype check_order_replace_message() {
  OrderReplaceMessage order_replace_message_sent;
  OrderReplaceMessage order_replace_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_replace_message(order_replace_message_sent, 0)
  :: pattern == 1 -> fill_order_replace_message(order_replace_message_sent, 32)
  :: pattern == 2 -> fill_order_replace_message(order_replace_message_sent, 255)
  :: else -> ramp_order_replace_message(order_replace_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_replace_message(order_replace_message_sent);
    assert(at == 34);
    at = 0;
    decode_order_replace_message(order_replace_message_got);
    assert(at == 34);
    equal_order_replace_message(order_replace_message_got, order_replace_message_sent)
  }
}

/* Trade Message: encoded, read back, and compared */
proctype check_trade_message() {
  TradeMessage trade_message_sent;
  TradeMessage trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_message(trade_message_sent, 0)
  :: pattern == 1 -> fill_trade_message(trade_message_sent, 32)
  :: pattern == 2 -> fill_trade_message(trade_message_sent, 255)
  :: else -> ramp_trade_message(trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_message(trade_message_sent);
    assert(at == 43);
    at = 0;
    decode_trade_message(trade_message_got);
    assert(at == 43);
    equal_trade_message(trade_message_got, trade_message_sent)
  }
}

/* Cross Trade Message: encoded, read back, and compared */
proctype check_cross_trade_message() {
  CrossTradeMessage cross_trade_message_sent;
  CrossTradeMessage cross_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cross_trade_message(cross_trade_message_sent, 0)
  :: pattern == 1 -> fill_cross_trade_message(cross_trade_message_sent, 32)
  :: pattern == 2 -> fill_cross_trade_message(cross_trade_message_sent, 255)
  :: else -> ramp_cross_trade_message(cross_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cross_trade_message(cross_trade_message_sent);
    assert(at == 31);
    at = 0;
    decode_cross_trade_message(cross_trade_message_got);
    assert(at == 31);
    equal_cross_trade_message(cross_trade_message_got, cross_trade_message_sent)
  }
}

/* Broken Trade Message: encoded, read back, and compared */
proctype check_broken_trade_message() {
  BrokenTradeMessage broken_trade_message_sent;
  BrokenTradeMessage broken_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_broken_trade_message(broken_trade_message_sent, 0)
  :: pattern == 1 -> fill_broken_trade_message(broken_trade_message_sent, 32)
  :: pattern == 2 -> fill_broken_trade_message(broken_trade_message_sent, 255)
  :: else -> ramp_broken_trade_message(broken_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_broken_trade_message(broken_trade_message_sent);
    assert(at == 14);
    at = 0;
    decode_broken_trade_message(broken_trade_message_got);
    assert(at == 14);
    equal_broken_trade_message(broken_trade_message_got, broken_trade_message_sent)
  }
}

/* Noii Message: encoded, read back, and compared */
proctype check_noii_message() {
  NoiiMessage noii_message_sent;
  NoiiMessage noii_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_noii_message(noii_message_sent, 0)
  :: pattern == 1 -> fill_noii_message(noii_message_sent, 32)
  :: pattern == 2 -> fill_noii_message(noii_message_sent, 255)
  :: else -> ramp_noii_message(noii_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_noii_message(noii_message_sent);
    assert(at == 60);
    at = 0;
    decode_noii_message(noii_message_got);
    assert(at == 60);
    equal_noii_message(noii_message_got, noii_message_sent)
  }
}

/* Moii Message: encoded, read back, and compared */
proctype check_moii_message() {
  MoiiMessage moii_message_sent;
  MoiiMessage moii_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_moii_message(moii_message_sent, 0)
  :: pattern == 1 -> fill_moii_message(moii_message_sent, 32)
  :: pattern == 2 -> fill_moii_message(moii_message_sent, 255)
  :: else -> ramp_moii_message(moii_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_moii_message(moii_message_sent);
    assert(at == 28);
    at = 0;
    decode_moii_message(moii_message_got);
    assert(at == 28);
    equal_moii_message(moii_message_got, moii_message_sent)
  }
}

/* Execution Summary Message: encoded, read back, and compared */
proctype check_execution_summary_message() {
  ExecutionSummaryMessage execution_summary_message_sent;
  ExecutionSummaryMessage execution_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_summary_message(execution_summary_message_sent, 0)
  :: pattern == 1 -> fill_execution_summary_message(execution_summary_message_sent, 32)
  :: pattern == 2 -> fill_execution_summary_message(execution_summary_message_sent, 255)
  :: else -> ramp_execution_summary_message(execution_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_summary_message(execution_summary_message_sent);
    assert(at == 37);
    at = 0;
    decode_execution_summary_message(execution_summary_message_got);
    assert(at == 37);
    equal_execution_summary_message(execution_summary_message_got, execution_summary_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_system_event_message()
  :: run check_order_book_trading_action_message()
  :: run check_add_order_message()
  :: run check_add_order_mpid_attribution_message()
  :: run check_order_executed_message()
  :: run check_order_executed_with_price_message()
  :: run check_order_cancel_message()
  :: run check_order_delete_message()
  :: run check_order_book_flush_message()
  :: run check_order_replace_message()
  :: run check_trade_message()
  :: run check_cross_trade_message()
  :: run check_broken_trade_message()
  :: run check_noii_message()
  :: run check_moii_message()
  :: run check_execution_summary_message()
  fi
}
