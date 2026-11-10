/*
 * Japan Exchange Group Genium Inet
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
#define WIRE 127

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

/* ---- Order Accepted: 113 bytes ----------------------------------------------- */

/* Acknowledges the receipt and acceptance of a valid Enter Order Message */
typedef OrderAccepted {
  byte timestamp_nanoseconds[8];
  byte order_token[14];
  byte order_book_id[4];
  byte side;
  byte order_id[8];
  byte quantity[8];
  byte price[4];
  byte time_in_force;
  byte open_close;
  byte client_account[16];
  byte order_state;
  byte customer_info[15];
  byte exchange_info[32]
};

int order_accepted_at;

/* every byte of Order Accepted set to one value */
inline fill_order_accepted(order_accepted_record, order_accepted_value) {
  order_accepted_at = 0;
  do
  :: order_accepted_at < 8 -> order_accepted_record.timestamp_nanoseconds[order_accepted_at] = order_accepted_value; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 14 -> order_accepted_record.order_token[order_accepted_at] = order_accepted_value; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 4 -> order_accepted_record.order_book_id[order_accepted_at] = order_accepted_value; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_record.side = order_accepted_value;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 8 -> order_accepted_record.order_id[order_accepted_at] = order_accepted_value; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 8 -> order_accepted_record.quantity[order_accepted_at] = order_accepted_value; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 4 -> order_accepted_record.price[order_accepted_at] = order_accepted_value; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_record.time_in_force = order_accepted_value;
  order_accepted_record.open_close = order_accepted_value;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 16 -> order_accepted_record.client_account[order_accepted_at] = order_accepted_value; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_record.order_state = order_accepted_value;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 15 -> order_accepted_record.customer_info[order_accepted_at] = order_accepted_value; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 32 -> order_accepted_record.exchange_info[order_accepted_at] = order_accepted_value; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Accepted set to where it lies, so a field read out of place says so */
inline ramp_order_accepted(order_accepted_record, order_accepted_base) {
  order_accepted_at = 0;
  do
  :: order_accepted_at < 8 -> order_accepted_record.timestamp_nanoseconds[order_accepted_at] = (order_accepted_base + 0 + order_accepted_at + 1) % 256; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 14 -> order_accepted_record.order_token[order_accepted_at] = (order_accepted_base + 8 + order_accepted_at + 1) % 256; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 4 -> order_accepted_record.order_book_id[order_accepted_at] = (order_accepted_base + 22 + order_accepted_at + 1) % 256; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_record.side = (order_accepted_base + 26 + 1) % 256;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 8 -> order_accepted_record.order_id[order_accepted_at] = (order_accepted_base + 27 + order_accepted_at + 1) % 256; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 8 -> order_accepted_record.quantity[order_accepted_at] = (order_accepted_base + 35 + order_accepted_at + 1) % 256; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 4 -> order_accepted_record.price[order_accepted_at] = (order_accepted_base + 43 + order_accepted_at + 1) % 256; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_record.time_in_force = (order_accepted_base + 47 + 1) % 256;
  order_accepted_record.open_close = (order_accepted_base + 48 + 1) % 256;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 16 -> order_accepted_record.client_account[order_accepted_at] = (order_accepted_base + 49 + order_accepted_at + 1) % 256; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_record.order_state = (order_accepted_base + 65 + 1) % 256;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 15 -> order_accepted_record.customer_info[order_accepted_at] = (order_accepted_base + 66 + order_accepted_at + 1) % 256; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 32 -> order_accepted_record.exchange_info[order_accepted_at] = (order_accepted_base + 81 + order_accepted_at + 1) % 256; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  skip
}

/* Order Accepted to the wire, 113 bytes from where the cursor stands */
inline encode_order_accepted(order_accepted_record) {
  order_accepted_at = 0;
  do
  :: order_accepted_at < 8 -> wire[at] = order_accepted_record.timestamp_nanoseconds[order_accepted_at]; at = at + 1; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 14 -> wire[at] = order_accepted_record.order_token[order_accepted_at]; at = at + 1; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 4 -> wire[at] = order_accepted_record.order_book_id[order_accepted_at]; at = at + 1; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  wire[at] = order_accepted_record.side; at = at + 1;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 8 -> wire[at] = order_accepted_record.order_id[order_accepted_at]; at = at + 1; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 8 -> wire[at] = order_accepted_record.quantity[order_accepted_at]; at = at + 1; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 4 -> wire[at] = order_accepted_record.price[order_accepted_at]; at = at + 1; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  wire[at] = order_accepted_record.time_in_force; at = at + 1;
  wire[at] = order_accepted_record.open_close; at = at + 1;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 16 -> wire[at] = order_accepted_record.client_account[order_accepted_at]; at = at + 1; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  wire[at] = order_accepted_record.order_state; at = at + 1;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 15 -> wire[at] = order_accepted_record.customer_info[order_accepted_at]; at = at + 1; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 32 -> wire[at] = order_accepted_record.exchange_info[order_accepted_at]; at = at + 1; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  skip
}

/* Order Accepted off the wire, 113 bytes from where the cursor stands */
inline decode_order_accepted(order_accepted_record) {
  order_accepted_at = 0;
  do
  :: order_accepted_at < 8 -> order_accepted_record.timestamp_nanoseconds[order_accepted_at] = wire[at]; at = at + 1; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 14 -> order_accepted_record.order_token[order_accepted_at] = wire[at]; at = at + 1; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 4 -> order_accepted_record.order_book_id[order_accepted_at] = wire[at]; at = at + 1; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_record.side = wire[at]; at = at + 1;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 8 -> order_accepted_record.order_id[order_accepted_at] = wire[at]; at = at + 1; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 8 -> order_accepted_record.quantity[order_accepted_at] = wire[at]; at = at + 1; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 4 -> order_accepted_record.price[order_accepted_at] = wire[at]; at = at + 1; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_record.time_in_force = wire[at]; at = at + 1;
  order_accepted_record.open_close = wire[at]; at = at + 1;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 16 -> order_accepted_record.client_account[order_accepted_at] = wire[at]; at = at + 1; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_record.order_state = wire[at]; at = at + 1;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 15 -> order_accepted_record.customer_info[order_accepted_at] = wire[at]; at = at + 1; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 32 -> order_accepted_record.exchange_info[order_accepted_at] = wire[at]; at = at + 1; order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Accepted is what was written, byte for byte */
inline equal_order_accepted(order_accepted_read, order_accepted_written) {
  order_accepted_at = 0;
  do
  :: order_accepted_at < 8 -> assert(order_accepted_read.timestamp_nanoseconds[order_accepted_at] == order_accepted_written.timestamp_nanoseconds[order_accepted_at]); order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 14 -> assert(order_accepted_read.order_token[order_accepted_at] == order_accepted_written.order_token[order_accepted_at]); order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 4 -> assert(order_accepted_read.order_book_id[order_accepted_at] == order_accepted_written.order_book_id[order_accepted_at]); order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  assert(order_accepted_read.side == order_accepted_written.side);
  order_accepted_at = 0;
  do
  :: order_accepted_at < 8 -> assert(order_accepted_read.order_id[order_accepted_at] == order_accepted_written.order_id[order_accepted_at]); order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 8 -> assert(order_accepted_read.quantity[order_accepted_at] == order_accepted_written.quantity[order_accepted_at]); order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 4 -> assert(order_accepted_read.price[order_accepted_at] == order_accepted_written.price[order_accepted_at]); order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  assert(order_accepted_read.time_in_force == order_accepted_written.time_in_force);
  assert(order_accepted_read.open_close == order_accepted_written.open_close);
  order_accepted_at = 0;
  do
  :: order_accepted_at < 16 -> assert(order_accepted_read.client_account[order_accepted_at] == order_accepted_written.client_account[order_accepted_at]); order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  assert(order_accepted_read.order_state == order_accepted_written.order_state);
  order_accepted_at = 0;
  do
  :: order_accepted_at < 15 -> assert(order_accepted_read.customer_info[order_accepted_at] == order_accepted_written.customer_info[order_accepted_at]); order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  order_accepted_at = 0;
  do
  :: order_accepted_at < 32 -> assert(order_accepted_read.exchange_info[order_accepted_at] == order_accepted_written.exchange_info[order_accepted_at]); order_accepted_at = order_accepted_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mass Cancel Accepted: 26 bytes ------------------------------------------ */

/* System notification indicating acceptance of a mass cancel request. */
typedef MassCancelAccepted {
  byte timestamp_nanoseconds[8];
  byte order_token[14];
  byte status[4]
};

int mass_cancel_accepted_at;

/* every byte of Mass Cancel Accepted set to one value */
inline fill_mass_cancel_accepted(mass_cancel_accepted_record, mass_cancel_accepted_value) {
  mass_cancel_accepted_at = 0;
  do
  :: mass_cancel_accepted_at < 8 -> mass_cancel_accepted_record.timestamp_nanoseconds[mass_cancel_accepted_at] = mass_cancel_accepted_value; mass_cancel_accepted_at = mass_cancel_accepted_at + 1
  :: else -> break
  od;
  mass_cancel_accepted_at = 0;
  do
  :: mass_cancel_accepted_at < 14 -> mass_cancel_accepted_record.order_token[mass_cancel_accepted_at] = mass_cancel_accepted_value; mass_cancel_accepted_at = mass_cancel_accepted_at + 1
  :: else -> break
  od;
  mass_cancel_accepted_at = 0;
  do
  :: mass_cancel_accepted_at < 4 -> mass_cancel_accepted_record.status[mass_cancel_accepted_at] = mass_cancel_accepted_value; mass_cancel_accepted_at = mass_cancel_accepted_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mass Cancel Accepted set to where it lies, so a field read out of place says so */
inline ramp_mass_cancel_accepted(mass_cancel_accepted_record, mass_cancel_accepted_base) {
  mass_cancel_accepted_at = 0;
  do
  :: mass_cancel_accepted_at < 8 -> mass_cancel_accepted_record.timestamp_nanoseconds[mass_cancel_accepted_at] = (mass_cancel_accepted_base + 0 + mass_cancel_accepted_at + 1) % 256; mass_cancel_accepted_at = mass_cancel_accepted_at + 1
  :: else -> break
  od;
  mass_cancel_accepted_at = 0;
  do
  :: mass_cancel_accepted_at < 14 -> mass_cancel_accepted_record.order_token[mass_cancel_accepted_at] = (mass_cancel_accepted_base + 8 + mass_cancel_accepted_at + 1) % 256; mass_cancel_accepted_at = mass_cancel_accepted_at + 1
  :: else -> break
  od;
  mass_cancel_accepted_at = 0;
  do
  :: mass_cancel_accepted_at < 4 -> mass_cancel_accepted_record.status[mass_cancel_accepted_at] = (mass_cancel_accepted_base + 22 + mass_cancel_accepted_at + 1) % 256; mass_cancel_accepted_at = mass_cancel_accepted_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Accepted to the wire, 26 bytes from where the cursor stands */
inline encode_mass_cancel_accepted(mass_cancel_accepted_record) {
  mass_cancel_accepted_at = 0;
  do
  :: mass_cancel_accepted_at < 8 -> wire[at] = mass_cancel_accepted_record.timestamp_nanoseconds[mass_cancel_accepted_at]; at = at + 1; mass_cancel_accepted_at = mass_cancel_accepted_at + 1
  :: else -> break
  od;
  mass_cancel_accepted_at = 0;
  do
  :: mass_cancel_accepted_at < 14 -> wire[at] = mass_cancel_accepted_record.order_token[mass_cancel_accepted_at]; at = at + 1; mass_cancel_accepted_at = mass_cancel_accepted_at + 1
  :: else -> break
  od;
  mass_cancel_accepted_at = 0;
  do
  :: mass_cancel_accepted_at < 4 -> wire[at] = mass_cancel_accepted_record.status[mass_cancel_accepted_at]; at = at + 1; mass_cancel_accepted_at = mass_cancel_accepted_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Accepted off the wire, 26 bytes from where the cursor stands */
inline decode_mass_cancel_accepted(mass_cancel_accepted_record) {
  mass_cancel_accepted_at = 0;
  do
  :: mass_cancel_accepted_at < 8 -> mass_cancel_accepted_record.timestamp_nanoseconds[mass_cancel_accepted_at] = wire[at]; at = at + 1; mass_cancel_accepted_at = mass_cancel_accepted_at + 1
  :: else -> break
  od;
  mass_cancel_accepted_at = 0;
  do
  :: mass_cancel_accepted_at < 14 -> mass_cancel_accepted_record.order_token[mass_cancel_accepted_at] = wire[at]; at = at + 1; mass_cancel_accepted_at = mass_cancel_accepted_at + 1
  :: else -> break
  od;
  mass_cancel_accepted_at = 0;
  do
  :: mass_cancel_accepted_at < 4 -> mass_cancel_accepted_record.status[mass_cancel_accepted_at] = wire[at]; at = at + 1; mass_cancel_accepted_at = mass_cancel_accepted_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mass Cancel Accepted is what was written, byte for byte */
inline equal_mass_cancel_accepted(mass_cancel_accepted_read, mass_cancel_accepted_written) {
  mass_cancel_accepted_at = 0;
  do
  :: mass_cancel_accepted_at < 8 -> assert(mass_cancel_accepted_read.timestamp_nanoseconds[mass_cancel_accepted_at] == mass_cancel_accepted_written.timestamp_nanoseconds[mass_cancel_accepted_at]); mass_cancel_accepted_at = mass_cancel_accepted_at + 1
  :: else -> break
  od;
  mass_cancel_accepted_at = 0;
  do
  :: mass_cancel_accepted_at < 14 -> assert(mass_cancel_accepted_read.order_token[mass_cancel_accepted_at] == mass_cancel_accepted_written.order_token[mass_cancel_accepted_at]); mass_cancel_accepted_at = mass_cancel_accepted_at + 1
  :: else -> break
  od;
  mass_cancel_accepted_at = 0;
  do
  :: mass_cancel_accepted_at < 4 -> assert(mass_cancel_accepted_read.status[mass_cancel_accepted_at] == mass_cancel_accepted_written.status[mass_cancel_accepted_at]); mass_cancel_accepted_at = mass_cancel_accepted_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Rejected: 26 bytes ------------------------------------------------ */

/* System notification indicating that an order has been rejected. */
typedef OrderRejected {
  byte timestamp_nanoseconds[8];
  byte order_token[14];
  byte reject_code[4]
};

int order_rejected_at;

/* every byte of Order Rejected set to one value */
inline fill_order_rejected(order_rejected_record, order_rejected_value) {
  order_rejected_at = 0;
  do
  :: order_rejected_at < 8 -> order_rejected_record.timestamp_nanoseconds[order_rejected_at] = order_rejected_value; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  order_rejected_at = 0;
  do
  :: order_rejected_at < 14 -> order_rejected_record.order_token[order_rejected_at] = order_rejected_value; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  order_rejected_at = 0;
  do
  :: order_rejected_at < 4 -> order_rejected_record.reject_code[order_rejected_at] = order_rejected_value; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Rejected set to where it lies, so a field read out of place says so */
inline ramp_order_rejected(order_rejected_record, order_rejected_base) {
  order_rejected_at = 0;
  do
  :: order_rejected_at < 8 -> order_rejected_record.timestamp_nanoseconds[order_rejected_at] = (order_rejected_base + 0 + order_rejected_at + 1) % 256; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  order_rejected_at = 0;
  do
  :: order_rejected_at < 14 -> order_rejected_record.order_token[order_rejected_at] = (order_rejected_base + 8 + order_rejected_at + 1) % 256; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  order_rejected_at = 0;
  do
  :: order_rejected_at < 4 -> order_rejected_record.reject_code[order_rejected_at] = (order_rejected_base + 22 + order_rejected_at + 1) % 256; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* Order Rejected to the wire, 26 bytes from where the cursor stands */
inline encode_order_rejected(order_rejected_record) {
  order_rejected_at = 0;
  do
  :: order_rejected_at < 8 -> wire[at] = order_rejected_record.timestamp_nanoseconds[order_rejected_at]; at = at + 1; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  order_rejected_at = 0;
  do
  :: order_rejected_at < 14 -> wire[at] = order_rejected_record.order_token[order_rejected_at]; at = at + 1; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  order_rejected_at = 0;
  do
  :: order_rejected_at < 4 -> wire[at] = order_rejected_record.reject_code[order_rejected_at]; at = at + 1; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* Order Rejected off the wire, 26 bytes from where the cursor stands */
inline decode_order_rejected(order_rejected_record) {
  order_rejected_at = 0;
  do
  :: order_rejected_at < 8 -> order_rejected_record.timestamp_nanoseconds[order_rejected_at] = wire[at]; at = at + 1; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  order_rejected_at = 0;
  do
  :: order_rejected_at < 14 -> order_rejected_record.order_token[order_rejected_at] = wire[at]; at = at + 1; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  order_rejected_at = 0;
  do
  :: order_rejected_at < 4 -> order_rejected_record.reject_code[order_rejected_at] = wire[at]; at = at + 1; order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Rejected is what was written, byte for byte */
inline equal_order_rejected(order_rejected_read, order_rejected_written) {
  order_rejected_at = 0;
  do
  :: order_rejected_at < 8 -> assert(order_rejected_read.timestamp_nanoseconds[order_rejected_at] == order_rejected_written.timestamp_nanoseconds[order_rejected_at]); order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  order_rejected_at = 0;
  do
  :: order_rejected_at < 14 -> assert(order_rejected_read.order_token[order_rejected_at] == order_rejected_written.order_token[order_rejected_at]); order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  order_rejected_at = 0;
  do
  :: order_rejected_at < 4 -> assert(order_rejected_read.reject_code[order_rejected_at] == order_rejected_written.reject_code[order_rejected_at]); order_rejected_at = order_rejected_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Replaced: 127 bytes ----------------------------------------------- */

/* System notification indicating that an order has been successfully replaced. */
typedef OrderReplaced {
  byte timestamp_nanoseconds[8];
  byte replacement_order_token[14];
  byte previous_order_token[14];
  byte order_book_id[4];
  byte side;
  byte order_id[8];
  byte quantity[8];
  byte price[4];
  byte time_in_force;
  byte open_close;
  byte client_account[16];
  byte order_state;
  byte customer_info[15];
  byte exchange_info[32]
};

int order_replaced_at;

/* every byte of Order Replaced set to one value */
inline fill_order_replaced(order_replaced_record, order_replaced_value) {
  order_replaced_at = 0;
  do
  :: order_replaced_at < 8 -> order_replaced_record.timestamp_nanoseconds[order_replaced_at] = order_replaced_value; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 14 -> order_replaced_record.replacement_order_token[order_replaced_at] = order_replaced_value; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 14 -> order_replaced_record.previous_order_token[order_replaced_at] = order_replaced_value; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 4 -> order_replaced_record.order_book_id[order_replaced_at] = order_replaced_value; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_record.side = order_replaced_value;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 8 -> order_replaced_record.order_id[order_replaced_at] = order_replaced_value; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 8 -> order_replaced_record.quantity[order_replaced_at] = order_replaced_value; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 4 -> order_replaced_record.price[order_replaced_at] = order_replaced_value; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_record.time_in_force = order_replaced_value;
  order_replaced_record.open_close = order_replaced_value;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 16 -> order_replaced_record.client_account[order_replaced_at] = order_replaced_value; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_record.order_state = order_replaced_value;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 15 -> order_replaced_record.customer_info[order_replaced_at] = order_replaced_value; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 32 -> order_replaced_record.exchange_info[order_replaced_at] = order_replaced_value; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Replaced set to where it lies, so a field read out of place says so */
inline ramp_order_replaced(order_replaced_record, order_replaced_base) {
  order_replaced_at = 0;
  do
  :: order_replaced_at < 8 -> order_replaced_record.timestamp_nanoseconds[order_replaced_at] = (order_replaced_base + 0 + order_replaced_at + 1) % 256; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 14 -> order_replaced_record.replacement_order_token[order_replaced_at] = (order_replaced_base + 8 + order_replaced_at + 1) % 256; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 14 -> order_replaced_record.previous_order_token[order_replaced_at] = (order_replaced_base + 22 + order_replaced_at + 1) % 256; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 4 -> order_replaced_record.order_book_id[order_replaced_at] = (order_replaced_base + 36 + order_replaced_at + 1) % 256; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_record.side = (order_replaced_base + 40 + 1) % 256;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 8 -> order_replaced_record.order_id[order_replaced_at] = (order_replaced_base + 41 + order_replaced_at + 1) % 256; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 8 -> order_replaced_record.quantity[order_replaced_at] = (order_replaced_base + 49 + order_replaced_at + 1) % 256; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 4 -> order_replaced_record.price[order_replaced_at] = (order_replaced_base + 57 + order_replaced_at + 1) % 256; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_record.time_in_force = (order_replaced_base + 61 + 1) % 256;
  order_replaced_record.open_close = (order_replaced_base + 62 + 1) % 256;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 16 -> order_replaced_record.client_account[order_replaced_at] = (order_replaced_base + 63 + order_replaced_at + 1) % 256; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_record.order_state = (order_replaced_base + 79 + 1) % 256;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 15 -> order_replaced_record.customer_info[order_replaced_at] = (order_replaced_base + 80 + order_replaced_at + 1) % 256; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 32 -> order_replaced_record.exchange_info[order_replaced_at] = (order_replaced_base + 95 + order_replaced_at + 1) % 256; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replaced to the wire, 127 bytes from where the cursor stands */
inline encode_order_replaced(order_replaced_record) {
  order_replaced_at = 0;
  do
  :: order_replaced_at < 8 -> wire[at] = order_replaced_record.timestamp_nanoseconds[order_replaced_at]; at = at + 1; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 14 -> wire[at] = order_replaced_record.replacement_order_token[order_replaced_at]; at = at + 1; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 14 -> wire[at] = order_replaced_record.previous_order_token[order_replaced_at]; at = at + 1; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 4 -> wire[at] = order_replaced_record.order_book_id[order_replaced_at]; at = at + 1; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  wire[at] = order_replaced_record.side; at = at + 1;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 8 -> wire[at] = order_replaced_record.order_id[order_replaced_at]; at = at + 1; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 8 -> wire[at] = order_replaced_record.quantity[order_replaced_at]; at = at + 1; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 4 -> wire[at] = order_replaced_record.price[order_replaced_at]; at = at + 1; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  wire[at] = order_replaced_record.time_in_force; at = at + 1;
  wire[at] = order_replaced_record.open_close; at = at + 1;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 16 -> wire[at] = order_replaced_record.client_account[order_replaced_at]; at = at + 1; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  wire[at] = order_replaced_record.order_state; at = at + 1;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 15 -> wire[at] = order_replaced_record.customer_info[order_replaced_at]; at = at + 1; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 32 -> wire[at] = order_replaced_record.exchange_info[order_replaced_at]; at = at + 1; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replaced off the wire, 127 bytes from where the cursor stands */
inline decode_order_replaced(order_replaced_record) {
  order_replaced_at = 0;
  do
  :: order_replaced_at < 8 -> order_replaced_record.timestamp_nanoseconds[order_replaced_at] = wire[at]; at = at + 1; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 14 -> order_replaced_record.replacement_order_token[order_replaced_at] = wire[at]; at = at + 1; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 14 -> order_replaced_record.previous_order_token[order_replaced_at] = wire[at]; at = at + 1; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 4 -> order_replaced_record.order_book_id[order_replaced_at] = wire[at]; at = at + 1; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_record.side = wire[at]; at = at + 1;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 8 -> order_replaced_record.order_id[order_replaced_at] = wire[at]; at = at + 1; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 8 -> order_replaced_record.quantity[order_replaced_at] = wire[at]; at = at + 1; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 4 -> order_replaced_record.price[order_replaced_at] = wire[at]; at = at + 1; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_record.time_in_force = wire[at]; at = at + 1;
  order_replaced_record.open_close = wire[at]; at = at + 1;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 16 -> order_replaced_record.client_account[order_replaced_at] = wire[at]; at = at + 1; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_record.order_state = wire[at]; at = at + 1;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 15 -> order_replaced_record.customer_info[order_replaced_at] = wire[at]; at = at + 1; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 32 -> order_replaced_record.exchange_info[order_replaced_at] = wire[at]; at = at + 1; order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Replaced is what was written, byte for byte */
inline equal_order_replaced(order_replaced_read, order_replaced_written) {
  order_replaced_at = 0;
  do
  :: order_replaced_at < 8 -> assert(order_replaced_read.timestamp_nanoseconds[order_replaced_at] == order_replaced_written.timestamp_nanoseconds[order_replaced_at]); order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 14 -> assert(order_replaced_read.replacement_order_token[order_replaced_at] == order_replaced_written.replacement_order_token[order_replaced_at]); order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 14 -> assert(order_replaced_read.previous_order_token[order_replaced_at] == order_replaced_written.previous_order_token[order_replaced_at]); order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 4 -> assert(order_replaced_read.order_book_id[order_replaced_at] == order_replaced_written.order_book_id[order_replaced_at]); order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  assert(order_replaced_read.side == order_replaced_written.side);
  order_replaced_at = 0;
  do
  :: order_replaced_at < 8 -> assert(order_replaced_read.order_id[order_replaced_at] == order_replaced_written.order_id[order_replaced_at]); order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 8 -> assert(order_replaced_read.quantity[order_replaced_at] == order_replaced_written.quantity[order_replaced_at]); order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 4 -> assert(order_replaced_read.price[order_replaced_at] == order_replaced_written.price[order_replaced_at]); order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  assert(order_replaced_read.time_in_force == order_replaced_written.time_in_force);
  assert(order_replaced_read.open_close == order_replaced_written.open_close);
  order_replaced_at = 0;
  do
  :: order_replaced_at < 16 -> assert(order_replaced_read.client_account[order_replaced_at] == order_replaced_written.client_account[order_replaced_at]); order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  assert(order_replaced_read.order_state == order_replaced_written.order_state);
  order_replaced_at = 0;
  do
  :: order_replaced_at < 15 -> assert(order_replaced_read.customer_info[order_replaced_at] == order_replaced_written.customer_info[order_replaced_at]); order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  order_replaced_at = 0;
  do
  :: order_replaced_at < 32 -> assert(order_replaced_read.exchange_info[order_replaced_at] == order_replaced_written.exchange_info[order_replaced_at]); order_replaced_at = order_replaced_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Canceled: 36 bytes ------------------------------------------------ */

/* System notification indicating that an order has been canceled. */
typedef OrderCanceled {
  byte timestamp_nanoseconds[8];
  byte order_token[14];
  byte order_book_id[4];
  byte side;
  byte order_id[8];
  byte cancel_reason
};

int order_canceled_at;

/* every byte of Order Canceled set to one value */
inline fill_order_canceled(order_canceled_record, order_canceled_value) {
  order_canceled_at = 0;
  do
  :: order_canceled_at < 8 -> order_canceled_record.timestamp_nanoseconds[order_canceled_at] = order_canceled_value; order_canceled_at = order_canceled_at + 1
  :: else -> break
  od;
  order_canceled_at = 0;
  do
  :: order_canceled_at < 14 -> order_canceled_record.order_token[order_canceled_at] = order_canceled_value; order_canceled_at = order_canceled_at + 1
  :: else -> break
  od;
  order_canceled_at = 0;
  do
  :: order_canceled_at < 4 -> order_canceled_record.order_book_id[order_canceled_at] = order_canceled_value; order_canceled_at = order_canceled_at + 1
  :: else -> break
  od;
  order_canceled_record.side = order_canceled_value;
  order_canceled_at = 0;
  do
  :: order_canceled_at < 8 -> order_canceled_record.order_id[order_canceled_at] = order_canceled_value; order_canceled_at = order_canceled_at + 1
  :: else -> break
  od;
  order_canceled_record.cancel_reason = order_canceled_value;
  skip
}

/* each byte of Order Canceled set to where it lies, so a field read out of place says so */
inline ramp_order_canceled(order_canceled_record, order_canceled_base) {
  order_canceled_at = 0;
  do
  :: order_canceled_at < 8 -> order_canceled_record.timestamp_nanoseconds[order_canceled_at] = (order_canceled_base + 0 + order_canceled_at + 1) % 256; order_canceled_at = order_canceled_at + 1
  :: else -> break
  od;
  order_canceled_at = 0;
  do
  :: order_canceled_at < 14 -> order_canceled_record.order_token[order_canceled_at] = (order_canceled_base + 8 + order_canceled_at + 1) % 256; order_canceled_at = order_canceled_at + 1
  :: else -> break
  od;
  order_canceled_at = 0;
  do
  :: order_canceled_at < 4 -> order_canceled_record.order_book_id[order_canceled_at] = (order_canceled_base + 22 + order_canceled_at + 1) % 256; order_canceled_at = order_canceled_at + 1
  :: else -> break
  od;
  order_canceled_record.side = (order_canceled_base + 26 + 1) % 256;
  order_canceled_at = 0;
  do
  :: order_canceled_at < 8 -> order_canceled_record.order_id[order_canceled_at] = (order_canceled_base + 27 + order_canceled_at + 1) % 256; order_canceled_at = order_canceled_at + 1
  :: else -> break
  od;
  order_canceled_record.cancel_reason = (order_canceled_base + 35 + 1) % 256;
  skip
}

/* Order Canceled to the wire, 36 bytes from where the cursor stands */
inline encode_order_canceled(order_canceled_record) {
  order_canceled_at = 0;
  do
  :: order_canceled_at < 8 -> wire[at] = order_canceled_record.timestamp_nanoseconds[order_canceled_at]; at = at + 1; order_canceled_at = order_canceled_at + 1
  :: else -> break
  od;
  order_canceled_at = 0;
  do
  :: order_canceled_at < 14 -> wire[at] = order_canceled_record.order_token[order_canceled_at]; at = at + 1; order_canceled_at = order_canceled_at + 1
  :: else -> break
  od;
  order_canceled_at = 0;
  do
  :: order_canceled_at < 4 -> wire[at] = order_canceled_record.order_book_id[order_canceled_at]; at = at + 1; order_canceled_at = order_canceled_at + 1
  :: else -> break
  od;
  wire[at] = order_canceled_record.side; at = at + 1;
  order_canceled_at = 0;
  do
  :: order_canceled_at < 8 -> wire[at] = order_canceled_record.order_id[order_canceled_at]; at = at + 1; order_canceled_at = order_canceled_at + 1
  :: else -> break
  od;
  wire[at] = order_canceled_record.cancel_reason; at = at + 1;
  skip
}

/* Order Canceled off the wire, 36 bytes from where the cursor stands */
inline decode_order_canceled(order_canceled_record) {
  order_canceled_at = 0;
  do
  :: order_canceled_at < 8 -> order_canceled_record.timestamp_nanoseconds[order_canceled_at] = wire[at]; at = at + 1; order_canceled_at = order_canceled_at + 1
  :: else -> break
  od;
  order_canceled_at = 0;
  do
  :: order_canceled_at < 14 -> order_canceled_record.order_token[order_canceled_at] = wire[at]; at = at + 1; order_canceled_at = order_canceled_at + 1
  :: else -> break
  od;
  order_canceled_at = 0;
  do
  :: order_canceled_at < 4 -> order_canceled_record.order_book_id[order_canceled_at] = wire[at]; at = at + 1; order_canceled_at = order_canceled_at + 1
  :: else -> break
  od;
  order_canceled_record.side = wire[at]; at = at + 1;
  order_canceled_at = 0;
  do
  :: order_canceled_at < 8 -> order_canceled_record.order_id[order_canceled_at] = wire[at]; at = at + 1; order_canceled_at = order_canceled_at + 1
  :: else -> break
  od;
  order_canceled_record.cancel_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Canceled is what was written, byte for byte */
inline equal_order_canceled(order_canceled_read, order_canceled_written) {
  order_canceled_at = 0;
  do
  :: order_canceled_at < 8 -> assert(order_canceled_read.timestamp_nanoseconds[order_canceled_at] == order_canceled_written.timestamp_nanoseconds[order_canceled_at]); order_canceled_at = order_canceled_at + 1
  :: else -> break
  od;
  order_canceled_at = 0;
  do
  :: order_canceled_at < 14 -> assert(order_canceled_read.order_token[order_canceled_at] == order_canceled_written.order_token[order_canceled_at]); order_canceled_at = order_canceled_at + 1
  :: else -> break
  od;
  order_canceled_at = 0;
  do
  :: order_canceled_at < 4 -> assert(order_canceled_read.order_book_id[order_canceled_at] == order_canceled_written.order_book_id[order_canceled_at]); order_canceled_at = order_canceled_at + 1
  :: else -> break
  od;
  assert(order_canceled_read.side == order_canceled_written.side);
  order_canceled_at = 0;
  do
  :: order_canceled_at < 8 -> assert(order_canceled_read.order_id[order_canceled_at] == order_canceled_written.order_id[order_canceled_at]); order_canceled_at = order_canceled_at + 1
  :: else -> break
  od;
  assert(order_canceled_read.cancel_reason == order_canceled_written.cancel_reason);
  skip
}

/* ---- Order Executed: 51 bytes ------------------------------------------------ */

/* System notification indicating that an order (or order leg) has been executed. */
typedef OrderExecuted {
  byte timestamp_nanoseconds[8];
  byte order_token[14];
  byte order_book_id[4];
  byte traded_quantity[8];
  byte trade_price[4];
  byte match_id[8];
  byte combo_group_id[4];
  byte deal_source
};

int order_executed_at;

/* every byte of Order Executed set to one value */
inline fill_order_executed(order_executed_record, order_executed_value) {
  order_executed_at = 0;
  do
  :: order_executed_at < 8 -> order_executed_record.timestamp_nanoseconds[order_executed_at] = order_executed_value; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 14 -> order_executed_record.order_token[order_executed_at] = order_executed_value; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 4 -> order_executed_record.order_book_id[order_executed_at] = order_executed_value; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 8 -> order_executed_record.traded_quantity[order_executed_at] = order_executed_value; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 4 -> order_executed_record.trade_price[order_executed_at] = order_executed_value; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 8 -> order_executed_record.match_id[order_executed_at] = order_executed_value; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 4 -> order_executed_record.combo_group_id[order_executed_at] = order_executed_value; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_record.deal_source = order_executed_value;
  skip
}

/* each byte of Order Executed set to where it lies, so a field read out of place says so */
inline ramp_order_executed(order_executed_record, order_executed_base) {
  order_executed_at = 0;
  do
  :: order_executed_at < 8 -> order_executed_record.timestamp_nanoseconds[order_executed_at] = (order_executed_base + 0 + order_executed_at + 1) % 256; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 14 -> order_executed_record.order_token[order_executed_at] = (order_executed_base + 8 + order_executed_at + 1) % 256; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 4 -> order_executed_record.order_book_id[order_executed_at] = (order_executed_base + 22 + order_executed_at + 1) % 256; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 8 -> order_executed_record.traded_quantity[order_executed_at] = (order_executed_base + 26 + order_executed_at + 1) % 256; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 4 -> order_executed_record.trade_price[order_executed_at] = (order_executed_base + 34 + order_executed_at + 1) % 256; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 8 -> order_executed_record.match_id[order_executed_at] = (order_executed_base + 38 + order_executed_at + 1) % 256; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 4 -> order_executed_record.combo_group_id[order_executed_at] = (order_executed_base + 46 + order_executed_at + 1) % 256; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_record.deal_source = (order_executed_base + 50 + 1) % 256;
  skip
}

/* Order Executed to the wire, 51 bytes from where the cursor stands */
inline encode_order_executed(order_executed_record) {
  order_executed_at = 0;
  do
  :: order_executed_at < 8 -> wire[at] = order_executed_record.timestamp_nanoseconds[order_executed_at]; at = at + 1; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 14 -> wire[at] = order_executed_record.order_token[order_executed_at]; at = at + 1; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 4 -> wire[at] = order_executed_record.order_book_id[order_executed_at]; at = at + 1; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 8 -> wire[at] = order_executed_record.traded_quantity[order_executed_at]; at = at + 1; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 4 -> wire[at] = order_executed_record.trade_price[order_executed_at]; at = at + 1; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 8 -> wire[at] = order_executed_record.match_id[order_executed_at]; at = at + 1; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 4 -> wire[at] = order_executed_record.combo_group_id[order_executed_at]; at = at + 1; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_record.deal_source; at = at + 1;
  skip
}

/* Order Executed off the wire, 51 bytes from where the cursor stands */
inline decode_order_executed(order_executed_record) {
  order_executed_at = 0;
  do
  :: order_executed_at < 8 -> order_executed_record.timestamp_nanoseconds[order_executed_at] = wire[at]; at = at + 1; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 14 -> order_executed_record.order_token[order_executed_at] = wire[at]; at = at + 1; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 4 -> order_executed_record.order_book_id[order_executed_at] = wire[at]; at = at + 1; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 8 -> order_executed_record.traded_quantity[order_executed_at] = wire[at]; at = at + 1; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 4 -> order_executed_record.trade_price[order_executed_at] = wire[at]; at = at + 1; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 8 -> order_executed_record.match_id[order_executed_at] = wire[at]; at = at + 1; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 4 -> order_executed_record.combo_group_id[order_executed_at] = wire[at]; at = at + 1; order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_record.deal_source = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Executed is what was written, byte for byte */
inline equal_order_executed(order_executed_read, order_executed_written) {
  order_executed_at = 0;
  do
  :: order_executed_at < 8 -> assert(order_executed_read.timestamp_nanoseconds[order_executed_at] == order_executed_written.timestamp_nanoseconds[order_executed_at]); order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 14 -> assert(order_executed_read.order_token[order_executed_at] == order_executed_written.order_token[order_executed_at]); order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 4 -> assert(order_executed_read.order_book_id[order_executed_at] == order_executed_written.order_book_id[order_executed_at]); order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 8 -> assert(order_executed_read.traded_quantity[order_executed_at] == order_executed_written.traded_quantity[order_executed_at]); order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 4 -> assert(order_executed_read.trade_price[order_executed_at] == order_executed_written.trade_price[order_executed_at]); order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 8 -> assert(order_executed_read.match_id[order_executed_at] == order_executed_written.match_id[order_executed_at]); order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  order_executed_at = 0;
  do
  :: order_executed_at < 4 -> assert(order_executed_read.combo_group_id[order_executed_at] == order_executed_written.combo_group_id[order_executed_at]); order_executed_at = order_executed_at + 1
  :: else -> break
  od;
  assert(order_executed_read.deal_source == order_executed_written.deal_source);
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

/* Order Accepted: encoded, read back, and compared */
proctype check_order_accepted() {
  OrderAccepted order_accepted_sent;
  OrderAccepted order_accepted_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_accepted(order_accepted_sent, 0)
  :: pattern == 1 -> fill_order_accepted(order_accepted_sent, 32)
  :: pattern == 2 -> fill_order_accepted(order_accepted_sent, 255)
  :: else -> ramp_order_accepted(order_accepted_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_accepted(order_accepted_sent);
    assert(at == 113);
    at = 0;
    decode_order_accepted(order_accepted_got);
    assert(at == 113);
    equal_order_accepted(order_accepted_got, order_accepted_sent)
  }
}

/* Mass Cancel Accepted: encoded, read back, and compared */
proctype check_mass_cancel_accepted() {
  MassCancelAccepted mass_cancel_accepted_sent;
  MassCancelAccepted mass_cancel_accepted_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_cancel_accepted(mass_cancel_accepted_sent, 0)
  :: pattern == 1 -> fill_mass_cancel_accepted(mass_cancel_accepted_sent, 32)
  :: pattern == 2 -> fill_mass_cancel_accepted(mass_cancel_accepted_sent, 255)
  :: else -> ramp_mass_cancel_accepted(mass_cancel_accepted_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_cancel_accepted(mass_cancel_accepted_sent);
    assert(at == 26);
    at = 0;
    decode_mass_cancel_accepted(mass_cancel_accepted_got);
    assert(at == 26);
    equal_mass_cancel_accepted(mass_cancel_accepted_got, mass_cancel_accepted_sent)
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
    assert(at == 26);
    at = 0;
    decode_order_rejected(order_rejected_got);
    assert(at == 26);
    equal_order_rejected(order_rejected_got, order_rejected_sent)
  }
}

/* Order Replaced: encoded, read back, and compared */
proctype check_order_replaced() {
  OrderReplaced order_replaced_sent;
  OrderReplaced order_replaced_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_replaced(order_replaced_sent, 0)
  :: pattern == 1 -> fill_order_replaced(order_replaced_sent, 32)
  :: pattern == 2 -> fill_order_replaced(order_replaced_sent, 255)
  :: else -> ramp_order_replaced(order_replaced_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_replaced(order_replaced_sent);
    assert(at == 127);
    at = 0;
    decode_order_replaced(order_replaced_got);
    assert(at == 127);
    equal_order_replaced(order_replaced_got, order_replaced_sent)
  }
}

/* Order Canceled: encoded, read back, and compared */
proctype check_order_canceled() {
  OrderCanceled order_canceled_sent;
  OrderCanceled order_canceled_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_canceled(order_canceled_sent, 0)
  :: pattern == 1 -> fill_order_canceled(order_canceled_sent, 32)
  :: pattern == 2 -> fill_order_canceled(order_canceled_sent, 255)
  :: else -> ramp_order_canceled(order_canceled_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_canceled(order_canceled_sent);
    assert(at == 36);
    at = 0;
    decode_order_canceled(order_canceled_got);
    assert(at == 36);
    equal_order_canceled(order_canceled_got, order_canceled_sent)
  }
}

/* Order Executed: encoded, read back, and compared */
proctype check_order_executed() {
  OrderExecuted order_executed_sent;
  OrderExecuted order_executed_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_executed(order_executed_sent, 0)
  :: pattern == 1 -> fill_order_executed(order_executed_sent, 32)
  :: pattern == 2 -> fill_order_executed(order_executed_sent, 255)
  :: else -> ramp_order_executed(order_executed_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_executed(order_executed_sent);
    assert(at == 51);
    at = 0;
    decode_order_executed(order_executed_got);
    assert(at == 51);
    equal_order_executed(order_executed_got, order_executed_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_server_packet_header()
  :: run check_login_accepted_packet()
  :: run check_login_rejected_packet()
  :: run check_order_accepted()
  :: run check_mass_cancel_accepted()
  :: run check_order_rejected()
  :: run check_order_replaced()
  :: run check_order_canceled()
  :: run check_order_executed()
  fi
}
