/*
 * Japannext Securities 
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
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 64

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

/* ---- System Event Message: 9 bytes ------------------------------------------- */

/* A System Event Message signals a Japannext PTS system-wide event */
typedef SystemEventMessage {
  byte timestamp[8];
  byte system_event
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.system_event = system_event_message_value;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.system_event = (system_event_message_base + 8 + 1) % 256;
  skip
}

/* System Event Message to the wire, 9 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> wire[at] = system_event_message_record.timestamp[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.system_event; at = at + 1;
  skip
}

/* System Event Message off the wire, 9 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.system_event = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> assert(system_event_message_read.timestamp[system_event_message_at] == system_event_message_written.timestamp[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.system_event == system_event_message_written.system_event);
  skip
}

/* ---- Order Accepted Message: 64 bytes ---------------------------------------- */

/* An Order Accepted Message acknowledges the receipt and acceptance of a valid Enter Order Message */
typedef OrderAcceptedMessage {
  byte timestamp[8];
  byte order_token[4];
  byte client_reference[10];
  byte buy_sell_indicator;
  byte quantity[4];
  byte orderbook_id[4];
  byte group[4];
  byte price[4];
  byte time_in_force[4];
  byte firm_id[4];
  byte display;
  byte capacity;
  byte order_number[8];
  byte minimum_quantity[4];
  byte order_state;
  byte order_classification;
  byte cash_margin_type
};

int order_accepted_message_at;

/* every byte of Order Accepted Message set to one value */
inline fill_order_accepted_message(order_accepted_message_record, order_accepted_message_value) {
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> order_accepted_message_record.timestamp[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.order_token[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 10 -> order_accepted_message_record.client_reference[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.buy_sell_indicator = order_accepted_message_value;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.quantity[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.orderbook_id[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.group[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.price[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.time_in_force[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.firm_id[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.display = order_accepted_message_value;
  order_accepted_message_record.capacity = order_accepted_message_value;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> order_accepted_message_record.order_number[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.minimum_quantity[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.order_state = order_accepted_message_value;
  order_accepted_message_record.order_classification = order_accepted_message_value;
  order_accepted_message_record.cash_margin_type = order_accepted_message_value;
  skip
}

/* each byte of Order Accepted Message set to where it lies, so a field read out of place says so */
inline ramp_order_accepted_message(order_accepted_message_record, order_accepted_message_base) {
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> order_accepted_message_record.timestamp[order_accepted_message_at] = (order_accepted_message_base + 0 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.order_token[order_accepted_message_at] = (order_accepted_message_base + 8 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 10 -> order_accepted_message_record.client_reference[order_accepted_message_at] = (order_accepted_message_base + 12 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.buy_sell_indicator = (order_accepted_message_base + 22 + 1) % 256;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.quantity[order_accepted_message_at] = (order_accepted_message_base + 23 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.orderbook_id[order_accepted_message_at] = (order_accepted_message_base + 27 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.group[order_accepted_message_at] = (order_accepted_message_base + 31 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.price[order_accepted_message_at] = (order_accepted_message_base + 35 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.time_in_force[order_accepted_message_at] = (order_accepted_message_base + 39 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.firm_id[order_accepted_message_at] = (order_accepted_message_base + 43 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.display = (order_accepted_message_base + 47 + 1) % 256;
  order_accepted_message_record.capacity = (order_accepted_message_base + 48 + 1) % 256;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> order_accepted_message_record.order_number[order_accepted_message_at] = (order_accepted_message_base + 49 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.minimum_quantity[order_accepted_message_at] = (order_accepted_message_base + 57 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.order_state = (order_accepted_message_base + 61 + 1) % 256;
  order_accepted_message_record.order_classification = (order_accepted_message_base + 62 + 1) % 256;
  order_accepted_message_record.cash_margin_type = (order_accepted_message_base + 63 + 1) % 256;
  skip
}

/* Order Accepted Message to the wire, 64 bytes from where the cursor stands */
inline encode_order_accepted_message(order_accepted_message_record) {
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> wire[at] = order_accepted_message_record.timestamp[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> wire[at] = order_accepted_message_record.order_token[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 10 -> wire[at] = order_accepted_message_record.client_reference[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = order_accepted_message_record.buy_sell_indicator; at = at + 1;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> wire[at] = order_accepted_message_record.quantity[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> wire[at] = order_accepted_message_record.orderbook_id[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> wire[at] = order_accepted_message_record.group[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> wire[at] = order_accepted_message_record.price[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> wire[at] = order_accepted_message_record.time_in_force[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> wire[at] = order_accepted_message_record.firm_id[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = order_accepted_message_record.display; at = at + 1;
  wire[at] = order_accepted_message_record.capacity; at = at + 1;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> wire[at] = order_accepted_message_record.order_number[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> wire[at] = order_accepted_message_record.minimum_quantity[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = order_accepted_message_record.order_state; at = at + 1;
  wire[at] = order_accepted_message_record.order_classification; at = at + 1;
  wire[at] = order_accepted_message_record.cash_margin_type; at = at + 1;
  skip
}

/* Order Accepted Message off the wire, 64 bytes from where the cursor stands */
inline decode_order_accepted_message(order_accepted_message_record) {
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> order_accepted_message_record.timestamp[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.order_token[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 10 -> order_accepted_message_record.client_reference[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.buy_sell_indicator = wire[at]; at = at + 1;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.quantity[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.orderbook_id[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.group[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.price[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.time_in_force[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.firm_id[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.display = wire[at]; at = at + 1;
  order_accepted_message_record.capacity = wire[at]; at = at + 1;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> order_accepted_message_record.order_number[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.minimum_quantity[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.order_state = wire[at]; at = at + 1;
  order_accepted_message_record.order_classification = wire[at]; at = at + 1;
  order_accepted_message_record.cash_margin_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Accepted Message is what was written, byte for byte */
inline equal_order_accepted_message(order_accepted_message_read, order_accepted_message_written) {
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> assert(order_accepted_message_read.timestamp[order_accepted_message_at] == order_accepted_message_written.timestamp[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> assert(order_accepted_message_read.order_token[order_accepted_message_at] == order_accepted_message_written.order_token[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 10 -> assert(order_accepted_message_read.client_reference[order_accepted_message_at] == order_accepted_message_written.client_reference[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  assert(order_accepted_message_read.buy_sell_indicator == order_accepted_message_written.buy_sell_indicator);
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> assert(order_accepted_message_read.quantity[order_accepted_message_at] == order_accepted_message_written.quantity[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> assert(order_accepted_message_read.orderbook_id[order_accepted_message_at] == order_accepted_message_written.orderbook_id[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> assert(order_accepted_message_read.group[order_accepted_message_at] == order_accepted_message_written.group[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> assert(order_accepted_message_read.price[order_accepted_message_at] == order_accepted_message_written.price[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> assert(order_accepted_message_read.time_in_force[order_accepted_message_at] == order_accepted_message_written.time_in_force[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> assert(order_accepted_message_read.firm_id[order_accepted_message_at] == order_accepted_message_written.firm_id[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  assert(order_accepted_message_read.display == order_accepted_message_written.display);
  assert(order_accepted_message_read.capacity == order_accepted_message_written.capacity);
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> assert(order_accepted_message_read.order_number[order_accepted_message_at] == order_accepted_message_written.order_number[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> assert(order_accepted_message_read.minimum_quantity[order_accepted_message_at] == order_accepted_message_written.minimum_quantity[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  assert(order_accepted_message_read.order_state == order_accepted_message_written.order_state);
  assert(order_accepted_message_read.order_classification == order_accepted_message_written.order_classification);
  assert(order_accepted_message_read.cash_margin_type == order_accepted_message_written.cash_margin_type);
  skip
}

/* ---- Order Replaced Message: 51 bytes ---------------------------------------- */

/* An Order Replaced Message acknowledges the receipt and acceptance of a valid Replace Order Message */
typedef OrderReplacedMessage {
  byte timestamp[8];
  byte replacement_order_token[4];
  byte buy_sell_indicator;
  byte quantity[4];
  byte orderbook_id[4];
  byte group[4];
  byte price[4];
  byte time_in_force[4];
  byte display;
  byte order_number[8];
  byte minimum_quantity[4];
  byte order_state;
  byte previous_order_token[4]
};

int order_replaced_message_at;

/* every byte of Order Replaced Message set to one value */
inline fill_order_replaced_message(order_replaced_message_record, order_replaced_message_value) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.timestamp[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.replacement_order_token[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.buy_sell_indicator = order_replaced_message_value;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.quantity[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.orderbook_id[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.group[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.price[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.time_in_force[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.display = order_replaced_message_value;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.order_number[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.minimum_quantity[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.order_state = order_replaced_message_value;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.previous_order_token[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Replaced Message set to where it lies, so a field read out of place says so */
inline ramp_order_replaced_message(order_replaced_message_record, order_replaced_message_base) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.timestamp[order_replaced_message_at] = (order_replaced_message_base + 0 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.replacement_order_token[order_replaced_message_at] = (order_replaced_message_base + 8 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.buy_sell_indicator = (order_replaced_message_base + 12 + 1) % 256;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.quantity[order_replaced_message_at] = (order_replaced_message_base + 13 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.orderbook_id[order_replaced_message_at] = (order_replaced_message_base + 17 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.group[order_replaced_message_at] = (order_replaced_message_base + 21 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.price[order_replaced_message_at] = (order_replaced_message_base + 25 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.time_in_force[order_replaced_message_at] = (order_replaced_message_base + 29 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.display = (order_replaced_message_base + 33 + 1) % 256;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.order_number[order_replaced_message_at] = (order_replaced_message_base + 34 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.minimum_quantity[order_replaced_message_at] = (order_replaced_message_base + 42 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.order_state = (order_replaced_message_base + 46 + 1) % 256;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.previous_order_token[order_replaced_message_at] = (order_replaced_message_base + 47 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replaced Message to the wire, 51 bytes from where the cursor stands */
inline encode_order_replaced_message(order_replaced_message_record) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> wire[at] = order_replaced_message_record.timestamp[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.replacement_order_token[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = order_replaced_message_record.buy_sell_indicator; at = at + 1;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.quantity[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.orderbook_id[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.group[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.price[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.time_in_force[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = order_replaced_message_record.display; at = at + 1;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> wire[at] = order_replaced_message_record.order_number[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.minimum_quantity[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = order_replaced_message_record.order_state; at = at + 1;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.previous_order_token[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replaced Message off the wire, 51 bytes from where the cursor stands */
inline decode_order_replaced_message(order_replaced_message_record) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.timestamp[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.replacement_order_token[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.buy_sell_indicator = wire[at]; at = at + 1;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.quantity[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.orderbook_id[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.group[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.price[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.time_in_force[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.display = wire[at]; at = at + 1;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.order_number[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.minimum_quantity[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.order_state = wire[at]; at = at + 1;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.previous_order_token[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Replaced Message is what was written, byte for byte */
inline equal_order_replaced_message(order_replaced_message_read, order_replaced_message_written) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> assert(order_replaced_message_read.timestamp[order_replaced_message_at] == order_replaced_message_written.timestamp[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.replacement_order_token[order_replaced_message_at] == order_replaced_message_written.replacement_order_token[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  assert(order_replaced_message_read.buy_sell_indicator == order_replaced_message_written.buy_sell_indicator);
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.quantity[order_replaced_message_at] == order_replaced_message_written.quantity[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.orderbook_id[order_replaced_message_at] == order_replaced_message_written.orderbook_id[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.group[order_replaced_message_at] == order_replaced_message_written.group[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.price[order_replaced_message_at] == order_replaced_message_written.price[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.time_in_force[order_replaced_message_at] == order_replaced_message_written.time_in_force[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  assert(order_replaced_message_read.display == order_replaced_message_written.display);
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> assert(order_replaced_message_read.order_number[order_replaced_message_at] == order_replaced_message_written.order_number[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.minimum_quantity[order_replaced_message_at] == order_replaced_message_written.minimum_quantity[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  assert(order_replaced_message_read.order_state == order_replaced_message_written.order_state);
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.previous_order_token[order_replaced_message_at] == order_replaced_message_written.previous_order_token[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Canceled Message: 17 bytes ---------------------------------------- */

/* An Order Canceled Message denotes that an order has been canceled */
typedef OrderCanceledMessage {
  byte timestamp[8];
  byte order_token[4];
  byte decrement_quantity[4];
  byte order_canceled_reason
};

int order_canceled_message_at;

/* every byte of Order Canceled Message set to one value */
inline fill_order_canceled_message(order_canceled_message_record, order_canceled_message_value) {
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.timestamp[order_canceled_message_at] = order_canceled_message_value; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> order_canceled_message_record.order_token[order_canceled_message_at] = order_canceled_message_value; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> order_canceled_message_record.decrement_quantity[order_canceled_message_at] = order_canceled_message_value; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_record.order_canceled_reason = order_canceled_message_value;
  skip
}

/* each byte of Order Canceled Message set to where it lies, so a field read out of place says so */
inline ramp_order_canceled_message(order_canceled_message_record, order_canceled_message_base) {
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.timestamp[order_canceled_message_at] = (order_canceled_message_base + 0 + order_canceled_message_at + 1) % 256; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> order_canceled_message_record.order_token[order_canceled_message_at] = (order_canceled_message_base + 8 + order_canceled_message_at + 1) % 256; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> order_canceled_message_record.decrement_quantity[order_canceled_message_at] = (order_canceled_message_base + 12 + order_canceled_message_at + 1) % 256; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_record.order_canceled_reason = (order_canceled_message_base + 16 + 1) % 256;
  skip
}

/* Order Canceled Message to the wire, 17 bytes from where the cursor stands */
inline encode_order_canceled_message(order_canceled_message_record) {
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> wire[at] = order_canceled_message_record.timestamp[order_canceled_message_at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> wire[at] = order_canceled_message_record.order_token[order_canceled_message_at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> wire[at] = order_canceled_message_record.decrement_quantity[order_canceled_message_at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  wire[at] = order_canceled_message_record.order_canceled_reason; at = at + 1;
  skip
}

/* Order Canceled Message off the wire, 17 bytes from where the cursor stands */
inline decode_order_canceled_message(order_canceled_message_record) {
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.timestamp[order_canceled_message_at] = wire[at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> order_canceled_message_record.order_token[order_canceled_message_at] = wire[at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> order_canceled_message_record.decrement_quantity[order_canceled_message_at] = wire[at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_record.order_canceled_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Canceled Message is what was written, byte for byte */
inline equal_order_canceled_message(order_canceled_message_read, order_canceled_message_written) {
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> assert(order_canceled_message_read.timestamp[order_canceled_message_at] == order_canceled_message_written.timestamp[order_canceled_message_at]); order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> assert(order_canceled_message_read.order_token[order_canceled_message_at] == order_canceled_message_written.order_token[order_canceled_message_at]); order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> assert(order_canceled_message_read.decrement_quantity[order_canceled_message_at] == order_canceled_message_written.decrement_quantity[order_canceled_message_at]); order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  assert(order_canceled_message_read.order_canceled_reason == order_canceled_message_written.order_canceled_reason);
  skip
}

/* ---- Order Aiq Canceled Message: 26 bytes ------------------------------------ */

/* An Order AIQ Canceled Message denotes that an order has been canceled by Japannext PTS to prevent a self-trade */
typedef OrderAiqCanceledMessage {
  byte timestamp[8];
  byte order_token[4];
  byte decrement_quantity[4];
  byte order_canceled_reason;
  byte quantity_prevented_from_trading[4];
  byte execution_price[4];
  byte liquidity_indicator
};

int order_aiq_canceled_message_at;

/* every byte of Order Aiq Canceled Message set to one value */
inline fill_order_aiq_canceled_message(order_aiq_canceled_message_record, order_aiq_canceled_message_value) {
  order_aiq_canceled_message_at = 0;
  do
  :: order_aiq_canceled_message_at < 8 -> order_aiq_canceled_message_record.timestamp[order_aiq_canceled_message_at] = order_aiq_canceled_message_value; order_aiq_canceled_message_at = order_aiq_canceled_message_at + 1
  :: else -> break
  od;
  order_aiq_canceled_message_at = 0;
  do
  :: order_aiq_canceled_message_at < 4 -> order_aiq_canceled_message_record.order_token[order_aiq_canceled_message_at] = order_aiq_canceled_message_value; order_aiq_canceled_message_at = order_aiq_canceled_message_at + 1
  :: else -> break
  od;
  order_aiq_canceled_message_at = 0;
  do
  :: order_aiq_canceled_message_at < 4 -> order_aiq_canceled_message_record.decrement_quantity[order_aiq_canceled_message_at] = order_aiq_canceled_message_value; order_aiq_canceled_message_at = order_aiq_canceled_message_at + 1
  :: else -> break
  od;
  order_aiq_canceled_message_record.order_canceled_reason = order_aiq_canceled_message_value;
  order_aiq_canceled_message_at = 0;
  do
  :: order_aiq_canceled_message_at < 4 -> order_aiq_canceled_message_record.quantity_prevented_from_trading[order_aiq_canceled_message_at] = order_aiq_canceled_message_value; order_aiq_canceled_message_at = order_aiq_canceled_message_at + 1
  :: else -> break
  od;
  order_aiq_canceled_message_at = 0;
  do
  :: order_aiq_canceled_message_at < 4 -> order_aiq_canceled_message_record.execution_price[order_aiq_canceled_message_at] = order_aiq_canceled_message_value; order_aiq_canceled_message_at = order_aiq_canceled_message_at + 1
  :: else -> break
  od;
  order_aiq_canceled_message_record.liquidity_indicator = order_aiq_canceled_message_value;
  skip
}

/* each byte of Order Aiq Canceled Message set to where it lies, so a field read out of place says so */
inline ramp_order_aiq_canceled_message(order_aiq_canceled_message_record, order_aiq_canceled_message_base) {
  order_aiq_canceled_message_at = 0;
  do
  :: order_aiq_canceled_message_at < 8 -> order_aiq_canceled_message_record.timestamp[order_aiq_canceled_message_at] = (order_aiq_canceled_message_base + 0 + order_aiq_canceled_message_at + 1) % 256; order_aiq_canceled_message_at = order_aiq_canceled_message_at + 1
  :: else -> break
  od;
  order_aiq_canceled_message_at = 0;
  do
  :: order_aiq_canceled_message_at < 4 -> order_aiq_canceled_message_record.order_token[order_aiq_canceled_message_at] = (order_aiq_canceled_message_base + 8 + order_aiq_canceled_message_at + 1) % 256; order_aiq_canceled_message_at = order_aiq_canceled_message_at + 1
  :: else -> break
  od;
  order_aiq_canceled_message_at = 0;
  do
  :: order_aiq_canceled_message_at < 4 -> order_aiq_canceled_message_record.decrement_quantity[order_aiq_canceled_message_at] = (order_aiq_canceled_message_base + 12 + order_aiq_canceled_message_at + 1) % 256; order_aiq_canceled_message_at = order_aiq_canceled_message_at + 1
  :: else -> break
  od;
  order_aiq_canceled_message_record.order_canceled_reason = (order_aiq_canceled_message_base + 16 + 1) % 256;
  order_aiq_canceled_message_at = 0;
  do
  :: order_aiq_canceled_message_at < 4 -> order_aiq_canceled_message_record.quantity_prevented_from_trading[order_aiq_canceled_message_at] = (order_aiq_canceled_message_base + 17 + order_aiq_canceled_message_at + 1) % 256; order_aiq_canceled_message_at = order_aiq_canceled_message_at + 1
  :: else -> break
  od;
  order_aiq_canceled_message_at = 0;
  do
  :: order_aiq_canceled_message_at < 4 -> order_aiq_canceled_message_record.execution_price[order_aiq_canceled_message_at] = (order_aiq_canceled_message_base + 21 + order_aiq_canceled_message_at + 1) % 256; order_aiq_canceled_message_at = order_aiq_canceled_message_at + 1
  :: else -> break
  od;
  order_aiq_canceled_message_record.liquidity_indicator = (order_aiq_canceled_message_base + 25 + 1) % 256;
  skip
}

/* Order Aiq Canceled Message to the wire, 26 bytes from where the cursor stands */
inline encode_order_aiq_canceled_message(order_aiq_canceled_message_record) {
  order_aiq_canceled_message_at = 0;
  do
  :: order_aiq_canceled_message_at < 8 -> wire[at] = order_aiq_canceled_message_record.timestamp[order_aiq_canceled_message_at]; at = at + 1; order_aiq_canceled_message_at = order_aiq_canceled_message_at + 1
  :: else -> break
  od;
  order_aiq_canceled_message_at = 0;
  do
  :: order_aiq_canceled_message_at < 4 -> wire[at] = order_aiq_canceled_message_record.order_token[order_aiq_canceled_message_at]; at = at + 1; order_aiq_canceled_message_at = order_aiq_canceled_message_at + 1
  :: else -> break
  od;
  order_aiq_canceled_message_at = 0;
  do
  :: order_aiq_canceled_message_at < 4 -> wire[at] = order_aiq_canceled_message_record.decrement_quantity[order_aiq_canceled_message_at]; at = at + 1; order_aiq_canceled_message_at = order_aiq_canceled_message_at + 1
  :: else -> break
  od;
  wire[at] = order_aiq_canceled_message_record.order_canceled_reason; at = at + 1;
  order_aiq_canceled_message_at = 0;
  do
  :: order_aiq_canceled_message_at < 4 -> wire[at] = order_aiq_canceled_message_record.quantity_prevented_from_trading[order_aiq_canceled_message_at]; at = at + 1; order_aiq_canceled_message_at = order_aiq_canceled_message_at + 1
  :: else -> break
  od;
  order_aiq_canceled_message_at = 0;
  do
  :: order_aiq_canceled_message_at < 4 -> wire[at] = order_aiq_canceled_message_record.execution_price[order_aiq_canceled_message_at]; at = at + 1; order_aiq_canceled_message_at = order_aiq_canceled_message_at + 1
  :: else -> break
  od;
  wire[at] = order_aiq_canceled_message_record.liquidity_indicator; at = at + 1;
  skip
}

/* Order Aiq Canceled Message off the wire, 26 bytes from where the cursor stands */
inline decode_order_aiq_canceled_message(order_aiq_canceled_message_record) {
  order_aiq_canceled_message_at = 0;
  do
  :: order_aiq_canceled_message_at < 8 -> order_aiq_canceled_message_record.timestamp[order_aiq_canceled_message_at] = wire[at]; at = at + 1; order_aiq_canceled_message_at = order_aiq_canceled_message_at + 1
  :: else -> break
  od;
  order_aiq_canceled_message_at = 0;
  do
  :: order_aiq_canceled_message_at < 4 -> order_aiq_canceled_message_record.order_token[order_aiq_canceled_message_at] = wire[at]; at = at + 1; order_aiq_canceled_message_at = order_aiq_canceled_message_at + 1
  :: else -> break
  od;
  order_aiq_canceled_message_at = 0;
  do
  :: order_aiq_canceled_message_at < 4 -> order_aiq_canceled_message_record.decrement_quantity[order_aiq_canceled_message_at] = wire[at]; at = at + 1; order_aiq_canceled_message_at = order_aiq_canceled_message_at + 1
  :: else -> break
  od;
  order_aiq_canceled_message_record.order_canceled_reason = wire[at]; at = at + 1;
  order_aiq_canceled_message_at = 0;
  do
  :: order_aiq_canceled_message_at < 4 -> order_aiq_canceled_message_record.quantity_prevented_from_trading[order_aiq_canceled_message_at] = wire[at]; at = at + 1; order_aiq_canceled_message_at = order_aiq_canceled_message_at + 1
  :: else -> break
  od;
  order_aiq_canceled_message_at = 0;
  do
  :: order_aiq_canceled_message_at < 4 -> order_aiq_canceled_message_record.execution_price[order_aiq_canceled_message_at] = wire[at]; at = at + 1; order_aiq_canceled_message_at = order_aiq_canceled_message_at + 1
  :: else -> break
  od;
  order_aiq_canceled_message_record.liquidity_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Aiq Canceled Message is what was written, byte for byte */
inline equal_order_aiq_canceled_message(order_aiq_canceled_message_read, order_aiq_canceled_message_written) {
  order_aiq_canceled_message_at = 0;
  do
  :: order_aiq_canceled_message_at < 8 -> assert(order_aiq_canceled_message_read.timestamp[order_aiq_canceled_message_at] == order_aiq_canceled_message_written.timestamp[order_aiq_canceled_message_at]); order_aiq_canceled_message_at = order_aiq_canceled_message_at + 1
  :: else -> break
  od;
  order_aiq_canceled_message_at = 0;
  do
  :: order_aiq_canceled_message_at < 4 -> assert(order_aiq_canceled_message_read.order_token[order_aiq_canceled_message_at] == order_aiq_canceled_message_written.order_token[order_aiq_canceled_message_at]); order_aiq_canceled_message_at = order_aiq_canceled_message_at + 1
  :: else -> break
  od;
  order_aiq_canceled_message_at = 0;
  do
  :: order_aiq_canceled_message_at < 4 -> assert(order_aiq_canceled_message_read.decrement_quantity[order_aiq_canceled_message_at] == order_aiq_canceled_message_written.decrement_quantity[order_aiq_canceled_message_at]); order_aiq_canceled_message_at = order_aiq_canceled_message_at + 1
  :: else -> break
  od;
  assert(order_aiq_canceled_message_read.order_canceled_reason == order_aiq_canceled_message_written.order_canceled_reason);
  order_aiq_canceled_message_at = 0;
  do
  :: order_aiq_canceled_message_at < 4 -> assert(order_aiq_canceled_message_read.quantity_prevented_from_trading[order_aiq_canceled_message_at] == order_aiq_canceled_message_written.quantity_prevented_from_trading[order_aiq_canceled_message_at]); order_aiq_canceled_message_at = order_aiq_canceled_message_at + 1
  :: else -> break
  od;
  order_aiq_canceled_message_at = 0;
  do
  :: order_aiq_canceled_message_at < 4 -> assert(order_aiq_canceled_message_read.execution_price[order_aiq_canceled_message_at] == order_aiq_canceled_message_written.execution_price[order_aiq_canceled_message_at]); order_aiq_canceled_message_at = order_aiq_canceled_message_at + 1
  :: else -> break
  od;
  assert(order_aiq_canceled_message_read.liquidity_indicator == order_aiq_canceled_message_written.liquidity_indicator);
  skip
}

/* ---- Order Executed Message: 29 bytes ---------------------------------------- */

/* An Order Executed Message denotes that all or part of an order has been executed */
typedef OrderExecutedMessage {
  byte timestamp[8];
  byte order_token[4];
  byte executed_quantity[4];
  byte execution_price[4];
  byte liquidity_indicator;
  byte match_number[8]
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
  :: order_executed_message_at < 4 -> order_executed_message_record.order_token[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.execution_price[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.liquidity_indicator = order_executed_message_value;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.match_number[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
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
  :: order_executed_message_at < 4 -> order_executed_message_record.order_token[order_executed_message_at] = (order_executed_message_base + 8 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = (order_executed_message_base + 12 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.execution_price[order_executed_message_at] = (order_executed_message_base + 16 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.liquidity_indicator = (order_executed_message_base + 20 + 1) % 256;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.match_number[order_executed_message_at] = (order_executed_message_base + 21 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message to the wire, 29 bytes from where the cursor stands */
inline encode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.timestamp[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.order_token[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.executed_quantity[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.execution_price[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_message_record.liquidity_indicator; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.match_number[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message off the wire, 29 bytes from where the cursor stands */
inline decode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.timestamp[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.order_token[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.execution_price[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.liquidity_indicator = wire[at]; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.match_number[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
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
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.order_token[order_executed_message_at] == order_executed_message_written.order_token[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.executed_quantity[order_executed_message_at] == order_executed_message_written.executed_quantity[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.execution_price[order_executed_message_at] == order_executed_message_written.execution_price[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  assert(order_executed_message_read.liquidity_indicator == order_executed_message_written.liquidity_indicator);
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.match_number[order_executed_message_at] == order_executed_message_written.match_number[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Rejected Message: 13 bytes ---------------------------------------- */

/* An Order Rejected Message may be sent in response to an Enter Order Message if the order cannot be accepted */
typedef OrderRejectedMessage {
  byte timestamp[8];
  byte order_token[4];
  byte order_rejected_reason
};

int order_rejected_message_at;

/* every byte of Order Rejected Message set to one value */
inline fill_order_rejected_message(order_rejected_message_record, order_rejected_message_value) {
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 8 -> order_rejected_message_record.timestamp[order_rejected_message_at] = order_rejected_message_value; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 4 -> order_rejected_message_record.order_token[order_rejected_message_at] = order_rejected_message_value; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_record.order_rejected_reason = order_rejected_message_value;
  skip
}

/* each byte of Order Rejected Message set to where it lies, so a field read out of place says so */
inline ramp_order_rejected_message(order_rejected_message_record, order_rejected_message_base) {
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 8 -> order_rejected_message_record.timestamp[order_rejected_message_at] = (order_rejected_message_base + 0 + order_rejected_message_at + 1) % 256; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 4 -> order_rejected_message_record.order_token[order_rejected_message_at] = (order_rejected_message_base + 8 + order_rejected_message_at + 1) % 256; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_record.order_rejected_reason = (order_rejected_message_base + 12 + 1) % 256;
  skip
}

/* Order Rejected Message to the wire, 13 bytes from where the cursor stands */
inline encode_order_rejected_message(order_rejected_message_record) {
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 8 -> wire[at] = order_rejected_message_record.timestamp[order_rejected_message_at]; at = at + 1; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 4 -> wire[at] = order_rejected_message_record.order_token[order_rejected_message_at]; at = at + 1; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  wire[at] = order_rejected_message_record.order_rejected_reason; at = at + 1;
  skip
}

/* Order Rejected Message off the wire, 13 bytes from where the cursor stands */
inline decode_order_rejected_message(order_rejected_message_record) {
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 8 -> order_rejected_message_record.timestamp[order_rejected_message_at] = wire[at]; at = at + 1; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 4 -> order_rejected_message_record.order_token[order_rejected_message_at] = wire[at]; at = at + 1; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_record.order_rejected_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Rejected Message is what was written, byte for byte */
inline equal_order_rejected_message(order_rejected_message_read, order_rejected_message_written) {
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 8 -> assert(order_rejected_message_read.timestamp[order_rejected_message_at] == order_rejected_message_written.timestamp[order_rejected_message_at]); order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 4 -> assert(order_rejected_message_read.order_token[order_rejected_message_at] == order_rejected_message_written.order_token[order_rejected_message_at]); order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  assert(order_rejected_message_read.order_rejected_reason == order_rejected_message_written.order_rejected_reason);
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
    assert(at == 9);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 9);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Order Accepted Message: encoded, read back, and compared */
proctype check_order_accepted_message() {
  OrderAcceptedMessage order_accepted_message_sent;
  OrderAcceptedMessage order_accepted_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_accepted_message(order_accepted_message_sent, 0)
  :: pattern == 1 -> fill_order_accepted_message(order_accepted_message_sent, 32)
  :: pattern == 2 -> fill_order_accepted_message(order_accepted_message_sent, 255)
  :: else -> ramp_order_accepted_message(order_accepted_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_accepted_message(order_accepted_message_sent);
    assert(at == 64);
    at = 0;
    decode_order_accepted_message(order_accepted_message_got);
    assert(at == 64);
    equal_order_accepted_message(order_accepted_message_got, order_accepted_message_sent)
  }
}

/* Order Replaced Message: encoded, read back, and compared */
proctype check_order_replaced_message() {
  OrderReplacedMessage order_replaced_message_sent;
  OrderReplacedMessage order_replaced_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_replaced_message(order_replaced_message_sent, 0)
  :: pattern == 1 -> fill_order_replaced_message(order_replaced_message_sent, 32)
  :: pattern == 2 -> fill_order_replaced_message(order_replaced_message_sent, 255)
  :: else -> ramp_order_replaced_message(order_replaced_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_replaced_message(order_replaced_message_sent);
    assert(at == 51);
    at = 0;
    decode_order_replaced_message(order_replaced_message_got);
    assert(at == 51);
    equal_order_replaced_message(order_replaced_message_got, order_replaced_message_sent)
  }
}

/* Order Canceled Message: encoded, read back, and compared */
proctype check_order_canceled_message() {
  OrderCanceledMessage order_canceled_message_sent;
  OrderCanceledMessage order_canceled_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_canceled_message(order_canceled_message_sent, 0)
  :: pattern == 1 -> fill_order_canceled_message(order_canceled_message_sent, 32)
  :: pattern == 2 -> fill_order_canceled_message(order_canceled_message_sent, 255)
  :: else -> ramp_order_canceled_message(order_canceled_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_canceled_message(order_canceled_message_sent);
    assert(at == 17);
    at = 0;
    decode_order_canceled_message(order_canceled_message_got);
    assert(at == 17);
    equal_order_canceled_message(order_canceled_message_got, order_canceled_message_sent)
  }
}

/* Order Aiq Canceled Message: encoded, read back, and compared */
proctype check_order_aiq_canceled_message() {
  OrderAiqCanceledMessage order_aiq_canceled_message_sent;
  OrderAiqCanceledMessage order_aiq_canceled_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_aiq_canceled_message(order_aiq_canceled_message_sent, 0)
  :: pattern == 1 -> fill_order_aiq_canceled_message(order_aiq_canceled_message_sent, 32)
  :: pattern == 2 -> fill_order_aiq_canceled_message(order_aiq_canceled_message_sent, 255)
  :: else -> ramp_order_aiq_canceled_message(order_aiq_canceled_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_aiq_canceled_message(order_aiq_canceled_message_sent);
    assert(at == 26);
    at = 0;
    decode_order_aiq_canceled_message(order_aiq_canceled_message_got);
    assert(at == 26);
    equal_order_aiq_canceled_message(order_aiq_canceled_message_got, order_aiq_canceled_message_sent)
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
    assert(at == 29);
    at = 0;
    decode_order_executed_message(order_executed_message_got);
    assert(at == 29);
    equal_order_executed_message(order_executed_message_got, order_executed_message_sent)
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
    assert(at == 13);
    at = 0;
    decode_order_rejected_message(order_rejected_message_got);
    assert(at == 13);
    equal_order_rejected_message(order_rejected_message_got, order_rejected_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_server_packet_header()
  :: run check_login_accepted_packet()
  :: run check_login_rejected_packet()
  :: run check_system_event_message()
  :: run check_order_accepted_message()
  :: run check_order_replaced_message()
  :: run check_order_canceled_message()
  :: run check_order_aiq_canceled_message()
  :: run check_order_executed_message()
  :: run check_order_rejected_message()
  fi
}
