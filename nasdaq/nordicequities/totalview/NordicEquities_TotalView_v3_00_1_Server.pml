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
 *   - a run filling what frames it
 *   - a length prefix framing what follows
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 35

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Server Packet Header: 3 bytes ------------------------------------------- */

/* Packet header of a packet sent by the server */
typedef ServerPacketHeader {
  byte packet_length[2];
  byte server_packet_type
};

int server_packet_header_at;

/* every byte of Server Packet Header set to one value */
inline fill_server_packet_header(server_packet_header_record, server_packet_header_value) {
  server_packet_header_at = 0;
  do
  :: server_packet_header_at < 2 -> server_packet_header_record.packet_length[server_packet_header_at] = server_packet_header_value; server_packet_header_at = server_packet_header_at + 1
  :: else -> break
  od;
  server_packet_header_record.server_packet_type = server_packet_header_value;
  skip
}

/* each byte of Server Packet Header set to where it lies, so a field read out of place says so */
inline ramp_server_packet_header(server_packet_header_record, server_packet_header_base) {
  server_packet_header_at = 0;
  do
  :: server_packet_header_at < 2 -> server_packet_header_record.packet_length[server_packet_header_at] = (server_packet_header_base + 0 + server_packet_header_at + 1) % 256; server_packet_header_at = server_packet_header_at + 1
  :: else -> break
  od;
  server_packet_header_record.server_packet_type = (server_packet_header_base + 2 + 1) % 256;
  skip
}

/* Server Packet Header to the wire, 3 bytes from where the cursor stands */
inline encode_server_packet_header(server_packet_header_record) {
  server_packet_header_at = 0;
  do
  :: server_packet_header_at < 2 -> wire[at] = server_packet_header_record.packet_length[server_packet_header_at]; at = at + 1; server_packet_header_at = server_packet_header_at + 1
  :: else -> break
  od;
  wire[at] = server_packet_header_record.server_packet_type; at = at + 1;
  skip
}

/* Server Packet Header off the wire, 3 bytes from where the cursor stands */
inline decode_server_packet_header(server_packet_header_record) {
  server_packet_header_at = 0;
  do
  :: server_packet_header_at < 2 -> server_packet_header_record.packet_length[server_packet_header_at] = wire[at]; at = at + 1; server_packet_header_at = server_packet_header_at + 1
  :: else -> break
  od;
  server_packet_header_record.server_packet_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Server Packet Header is what was written, byte for byte */
inline equal_server_packet_header(server_packet_header_read, server_packet_header_written) {
  server_packet_header_at = 0;
  do
  :: server_packet_header_at < 2 -> assert(server_packet_header_read.packet_length[server_packet_header_at] == server_packet_header_written.packet_length[server_packet_header_at]); server_packet_header_at = server_packet_header_at + 1
  :: else -> break
  od;
  assert(server_packet_header_read.server_packet_type == server_packet_header_written.server_packet_type);
  skip
}

/* ---- Login Accepted Packet: 30 bytes ----------------------------------------- */

/* The SoupBinTCP server sends a Login Accepted Packet in response to receiving a valid Login Request from the client */
typedef LoginAcceptedPacket {
  byte accepted_session[10];
  byte accepted_sequence_number[20]
};

int login_accepted_packet_at;

/* every byte of Login Accepted Packet set to one value */
inline fill_login_accepted_packet(login_accepted_packet_record, login_accepted_packet_value) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.accepted_session[login_accepted_packet_at] = login_accepted_packet_value; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 20 -> login_accepted_packet_record.accepted_sequence_number[login_accepted_packet_at] = login_accepted_packet_value; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Accepted Packet set to where it lies, so a field read out of place says so */
inline ramp_login_accepted_packet(login_accepted_packet_record, login_accepted_packet_base) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.accepted_session[login_accepted_packet_at] = (login_accepted_packet_base + 0 + login_accepted_packet_at + 1) % 256; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 20 -> login_accepted_packet_record.accepted_sequence_number[login_accepted_packet_at] = (login_accepted_packet_base + 10 + login_accepted_packet_at + 1) % 256; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Login Accepted Packet to the wire, 30 bytes from where the cursor stands */
inline encode_login_accepted_packet(login_accepted_packet_record) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> wire[at] = login_accepted_packet_record.accepted_session[login_accepted_packet_at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 20 -> wire[at] = login_accepted_packet_record.accepted_sequence_number[login_accepted_packet_at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Login Accepted Packet off the wire, 30 bytes from where the cursor stands */
inline decode_login_accepted_packet(login_accepted_packet_record) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.accepted_session[login_accepted_packet_at] = wire[at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 20 -> login_accepted_packet_record.accepted_sequence_number[login_accepted_packet_at] = wire[at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Accepted Packet is what was written, byte for byte */
inline equal_login_accepted_packet(login_accepted_packet_read, login_accepted_packet_written) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> assert(login_accepted_packet_read.accepted_session[login_accepted_packet_at] == login_accepted_packet_written.accepted_session[login_accepted_packet_at]); login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 20 -> assert(login_accepted_packet_read.accepted_sequence_number[login_accepted_packet_at] == login_accepted_packet_written.accepted_sequence_number[login_accepted_packet_at]); login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Rejected Packet: 1 bytes ------------------------------------------ */

/* The SoupBinTCP server sends this packet in response to an invalid Login Request Packet from the client */
typedef LoginRejectedPacket {
  byte reject_reason_code
};

/* every byte of Login Rejected Packet set to one value */
inline fill_login_rejected_packet(login_rejected_packet_record, login_rejected_packet_value) {
  login_rejected_packet_record.reject_reason_code = login_rejected_packet_value;
  skip
}

/* each byte of Login Rejected Packet set to where it lies, so a field read out of place says so */
inline ramp_login_rejected_packet(login_rejected_packet_record, login_rejected_packet_base) {
  login_rejected_packet_record.reject_reason_code = (login_rejected_packet_base + 0 + 1) % 256;
  skip
}

/* Login Rejected Packet to the wire, 1 bytes from where the cursor stands */
inline encode_login_rejected_packet(login_rejected_packet_record) {
  wire[at] = login_rejected_packet_record.reject_reason_code; at = at + 1;
  skip
}

/* Login Rejected Packet off the wire, 1 bytes from where the cursor stands */
inline decode_login_rejected_packet(login_rejected_packet_record) {
  login_rejected_packet_record.reject_reason_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Login Rejected Packet is what was written, byte for byte */
inline equal_login_rejected_packet(login_rejected_packet_read, login_rejected_packet_written) {
  assert(login_rejected_packet_read.reject_reason_code == login_rejected_packet_written.reject_reason_code);
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

/* ---- End Of Snapshot Message: 20 bytes --------------------------------------- */

/* Denotes the TotalView Itch sequence number to begin real time processing from */
typedef EndOfSnapshotMessage {
  byte sequence_number[20]
};

int end_of_snapshot_message_at;

/* every byte of End Of Snapshot Message set to one value */
inline fill_end_of_snapshot_message(end_of_snapshot_message_record, end_of_snapshot_message_value) {
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 20 -> end_of_snapshot_message_record.sequence_number[end_of_snapshot_message_at] = end_of_snapshot_message_value; end_of_snapshot_message_at = end_of_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Snapshot Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_snapshot_message(end_of_snapshot_message_record, end_of_snapshot_message_base) {
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 20 -> end_of_snapshot_message_record.sequence_number[end_of_snapshot_message_at] = (end_of_snapshot_message_base + 0 + end_of_snapshot_message_at + 1) % 256; end_of_snapshot_message_at = end_of_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Snapshot Message to the wire, 20 bytes from where the cursor stands */
inline encode_end_of_snapshot_message(end_of_snapshot_message_record) {
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 20 -> wire[at] = end_of_snapshot_message_record.sequence_number[end_of_snapshot_message_at]; at = at + 1; end_of_snapshot_message_at = end_of_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Snapshot Message off the wire, 20 bytes from where the cursor stands */
inline decode_end_of_snapshot_message(end_of_snapshot_message_record) {
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 20 -> end_of_snapshot_message_record.sequence_number[end_of_snapshot_message_at] = wire[at]; at = at + 1; end_of_snapshot_message_at = end_of_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Snapshot Message is what was written, byte for byte */
inline equal_end_of_snapshot_message(end_of_snapshot_message_read, end_of_snapshot_message_written) {
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 20 -> assert(end_of_snapshot_message_read.sequence_number[end_of_snapshot_message_at] == end_of_snapshot_message_written.sequence_number[end_of_snapshot_message_at]); end_of_snapshot_message_at = end_of_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Server Packet Header: encoded, read back, and compared */
proctype check_server_packet_header() {
  ServerPacketHeader server_packet_header_sent;
  ServerPacketHeader server_packet_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_server_packet_header(server_packet_header_sent, 0)
  :: pattern == 1 -> fill_server_packet_header(server_packet_header_sent, 32)
  :: pattern == 2 -> fill_server_packet_header(server_packet_header_sent, 255)
  :: else -> ramp_server_packet_header(server_packet_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_server_packet_header(server_packet_header_sent);
    assert(at == 3);
    at = 0;
    decode_server_packet_header(server_packet_header_got);
    assert(at == 3);
    equal_server_packet_header(server_packet_header_got, server_packet_header_sent)
  }
}

/* Login Accepted Packet: encoded, read back, and compared */
proctype check_login_accepted_packet() {
  LoginAcceptedPacket login_accepted_packet_sent;
  LoginAcceptedPacket login_accepted_packet_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_accepted_packet(login_accepted_packet_sent, 0)
  :: pattern == 1 -> fill_login_accepted_packet(login_accepted_packet_sent, 32)
  :: pattern == 2 -> fill_login_accepted_packet(login_accepted_packet_sent, 255)
  :: else -> ramp_login_accepted_packet(login_accepted_packet_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_accepted_packet(login_accepted_packet_sent);
    assert(at == 30);
    at = 0;
    decode_login_accepted_packet(login_accepted_packet_got);
    assert(at == 30);
    equal_login_accepted_packet(login_accepted_packet_got, login_accepted_packet_sent)
  }
}

/* Login Rejected Packet: encoded, read back, and compared */
proctype check_login_rejected_packet() {
  LoginRejectedPacket login_rejected_packet_sent;
  LoginRejectedPacket login_rejected_packet_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_rejected_packet(login_rejected_packet_sent, 0)
  :: pattern == 1 -> fill_login_rejected_packet(login_rejected_packet_sent, 32)
  :: pattern == 2 -> fill_login_rejected_packet(login_rejected_packet_sent, 255)
  :: else -> ramp_login_rejected_packet(login_rejected_packet_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_rejected_packet(login_rejected_packet_sent);
    assert(at == 1);
    at = 0;
    decode_login_rejected_packet(login_rejected_packet_got);
    assert(at == 1);
    equal_login_rejected_packet(login_rejected_packet_got, login_rejected_packet_sent)
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

/* End Of Snapshot Message: encoded, read back, and compared */
proctype check_end_of_snapshot_message() {
  EndOfSnapshotMessage end_of_snapshot_message_sent;
  EndOfSnapshotMessage end_of_snapshot_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_snapshot_message(end_of_snapshot_message_sent, 0)
  :: pattern == 1 -> fill_end_of_snapshot_message(end_of_snapshot_message_sent, 32)
  :: pattern == 2 -> fill_end_of_snapshot_message(end_of_snapshot_message_sent, 255)
  :: else -> ramp_end_of_snapshot_message(end_of_snapshot_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_snapshot_message(end_of_snapshot_message_sent);
    assert(at == 20);
    at = 0;
    decode_end_of_snapshot_message(end_of_snapshot_message_got);
    assert(at == 20);
    equal_end_of_snapshot_message(end_of_snapshot_message_got, end_of_snapshot_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_server_packet_header()
  :: run check_login_accepted_packet()
  :: run check_login_rejected_packet()
  :: run check_system_event_message()
  :: run check_order_book_trading_action_message()
  :: run check_add_order_message()
  :: run check_add_order_mpid_attribution_message()
  :: run check_end_of_snapshot_message()
  fi
}
