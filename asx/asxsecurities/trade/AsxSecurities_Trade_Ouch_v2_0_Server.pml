/*
 * Australian Securities Exchange Asx Trade
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
#define WIRE 187

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

/* ---- Order Accepted Message: 173 bytes --------------------------------------- */

/* The Order Accepted message acknowledges the receipt and acceptance of a valid Enter Order message. The data fields from the Enter Order message are echoed back in the Order Accepted message, but some of the accepted values may differ from the entered values for some fields, depending on the state of the order. If the order for example traded immediately at entry, the Order Accepted message will show the state of the order after the trade. */
typedef OrderAcceptedMessage {
  byte timestamp_nanoseconds[8];
  byte order_token[14];
  byte order_book_id[4];
  byte side;
  byte order_id[8];
  byte quantity[8];
  byte price[4];
  byte time_in_force;
  byte open_close;
  byte client_account[10];
  byte order_state;
  byte customer_info[15];
  byte exchange_info[32];
  byte clearing_participant;
  byte crossing_key[4];
  byte capacity_of_participant;
  byte directed_wholesale;
  byte execution_venue[4];
  byte intermediary_id[10];
  byte order_origin[20];
  byte filler[8];
  byte ouch_order_type;
  byte short_sell_quantity[8];
  byte minimum_acceptable_quantity[8]
};

int order_accepted_message_at;

/* every byte of Order Accepted Message set to one value */
inline fill_order_accepted_message(order_accepted_message_record, order_accepted_message_value) {
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> order_accepted_message_record.timestamp_nanoseconds[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 14 -> order_accepted_message_record.order_token[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.order_book_id[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.side = order_accepted_message_value;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> order_accepted_message_record.order_id[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> order_accepted_message_record.quantity[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.price[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.time_in_force = order_accepted_message_value;
  order_accepted_message_record.open_close = order_accepted_message_value;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 10 -> order_accepted_message_record.client_account[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.order_state = order_accepted_message_value;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 15 -> order_accepted_message_record.customer_info[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 32 -> order_accepted_message_record.exchange_info[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.clearing_participant = order_accepted_message_value;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.crossing_key[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.capacity_of_participant = order_accepted_message_value;
  order_accepted_message_record.directed_wholesale = order_accepted_message_value;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.execution_venue[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 10 -> order_accepted_message_record.intermediary_id[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 20 -> order_accepted_message_record.order_origin[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> order_accepted_message_record.filler[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.ouch_order_type = order_accepted_message_value;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> order_accepted_message_record.short_sell_quantity[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> order_accepted_message_record.minimum_acceptable_quantity[order_accepted_message_at] = order_accepted_message_value; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Accepted Message set to where it lies, so a field read out of place says so */
inline ramp_order_accepted_message(order_accepted_message_record, order_accepted_message_base) {
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> order_accepted_message_record.timestamp_nanoseconds[order_accepted_message_at] = (order_accepted_message_base + 0 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 14 -> order_accepted_message_record.order_token[order_accepted_message_at] = (order_accepted_message_base + 8 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.order_book_id[order_accepted_message_at] = (order_accepted_message_base + 22 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.side = (order_accepted_message_base + 26 + 1) % 256;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> order_accepted_message_record.order_id[order_accepted_message_at] = (order_accepted_message_base + 27 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> order_accepted_message_record.quantity[order_accepted_message_at] = (order_accepted_message_base + 35 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.price[order_accepted_message_at] = (order_accepted_message_base + 43 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.time_in_force = (order_accepted_message_base + 47 + 1) % 256;
  order_accepted_message_record.open_close = (order_accepted_message_base + 48 + 1) % 256;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 10 -> order_accepted_message_record.client_account[order_accepted_message_at] = (order_accepted_message_base + 49 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.order_state = (order_accepted_message_base + 59 + 1) % 256;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 15 -> order_accepted_message_record.customer_info[order_accepted_message_at] = (order_accepted_message_base + 60 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 32 -> order_accepted_message_record.exchange_info[order_accepted_message_at] = (order_accepted_message_base + 75 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.clearing_participant = (order_accepted_message_base + 107 + 1) % 256;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.crossing_key[order_accepted_message_at] = (order_accepted_message_base + 108 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.capacity_of_participant = (order_accepted_message_base + 112 + 1) % 256;
  order_accepted_message_record.directed_wholesale = (order_accepted_message_base + 113 + 1) % 256;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.execution_venue[order_accepted_message_at] = (order_accepted_message_base + 114 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 10 -> order_accepted_message_record.intermediary_id[order_accepted_message_at] = (order_accepted_message_base + 118 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 20 -> order_accepted_message_record.order_origin[order_accepted_message_at] = (order_accepted_message_base + 128 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> order_accepted_message_record.filler[order_accepted_message_at] = (order_accepted_message_base + 148 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.ouch_order_type = (order_accepted_message_base + 156 + 1) % 256;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> order_accepted_message_record.short_sell_quantity[order_accepted_message_at] = (order_accepted_message_base + 157 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> order_accepted_message_record.minimum_acceptable_quantity[order_accepted_message_at] = (order_accepted_message_base + 165 + order_accepted_message_at + 1) % 256; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Accepted Message to the wire, 173 bytes from where the cursor stands */
inline encode_order_accepted_message(order_accepted_message_record) {
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> wire[at] = order_accepted_message_record.timestamp_nanoseconds[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 14 -> wire[at] = order_accepted_message_record.order_token[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> wire[at] = order_accepted_message_record.order_book_id[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = order_accepted_message_record.side; at = at + 1;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> wire[at] = order_accepted_message_record.order_id[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> wire[at] = order_accepted_message_record.quantity[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> wire[at] = order_accepted_message_record.price[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = order_accepted_message_record.time_in_force; at = at + 1;
  wire[at] = order_accepted_message_record.open_close; at = at + 1;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 10 -> wire[at] = order_accepted_message_record.client_account[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = order_accepted_message_record.order_state; at = at + 1;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 15 -> wire[at] = order_accepted_message_record.customer_info[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 32 -> wire[at] = order_accepted_message_record.exchange_info[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = order_accepted_message_record.clearing_participant; at = at + 1;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> wire[at] = order_accepted_message_record.crossing_key[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = order_accepted_message_record.capacity_of_participant; at = at + 1;
  wire[at] = order_accepted_message_record.directed_wholesale; at = at + 1;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> wire[at] = order_accepted_message_record.execution_venue[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 10 -> wire[at] = order_accepted_message_record.intermediary_id[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 20 -> wire[at] = order_accepted_message_record.order_origin[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> wire[at] = order_accepted_message_record.filler[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = order_accepted_message_record.ouch_order_type; at = at + 1;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> wire[at] = order_accepted_message_record.short_sell_quantity[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> wire[at] = order_accepted_message_record.minimum_acceptable_quantity[order_accepted_message_at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Accepted Message off the wire, 173 bytes from where the cursor stands */
inline decode_order_accepted_message(order_accepted_message_record) {
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> order_accepted_message_record.timestamp_nanoseconds[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 14 -> order_accepted_message_record.order_token[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.order_book_id[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.side = wire[at]; at = at + 1;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> order_accepted_message_record.order_id[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> order_accepted_message_record.quantity[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.price[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.time_in_force = wire[at]; at = at + 1;
  order_accepted_message_record.open_close = wire[at]; at = at + 1;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 10 -> order_accepted_message_record.client_account[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.order_state = wire[at]; at = at + 1;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 15 -> order_accepted_message_record.customer_info[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 32 -> order_accepted_message_record.exchange_info[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.clearing_participant = wire[at]; at = at + 1;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.crossing_key[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.capacity_of_participant = wire[at]; at = at + 1;
  order_accepted_message_record.directed_wholesale = wire[at]; at = at + 1;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> order_accepted_message_record.execution_venue[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 10 -> order_accepted_message_record.intermediary_id[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 20 -> order_accepted_message_record.order_origin[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> order_accepted_message_record.filler[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_record.ouch_order_type = wire[at]; at = at + 1;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> order_accepted_message_record.short_sell_quantity[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> order_accepted_message_record.minimum_acceptable_quantity[order_accepted_message_at] = wire[at]; at = at + 1; order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Accepted Message is what was written, byte for byte */
inline equal_order_accepted_message(order_accepted_message_read, order_accepted_message_written) {
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> assert(order_accepted_message_read.timestamp_nanoseconds[order_accepted_message_at] == order_accepted_message_written.timestamp_nanoseconds[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 14 -> assert(order_accepted_message_read.order_token[order_accepted_message_at] == order_accepted_message_written.order_token[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> assert(order_accepted_message_read.order_book_id[order_accepted_message_at] == order_accepted_message_written.order_book_id[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  assert(order_accepted_message_read.side == order_accepted_message_written.side);
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> assert(order_accepted_message_read.order_id[order_accepted_message_at] == order_accepted_message_written.order_id[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> assert(order_accepted_message_read.quantity[order_accepted_message_at] == order_accepted_message_written.quantity[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> assert(order_accepted_message_read.price[order_accepted_message_at] == order_accepted_message_written.price[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  assert(order_accepted_message_read.time_in_force == order_accepted_message_written.time_in_force);
  assert(order_accepted_message_read.open_close == order_accepted_message_written.open_close);
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 10 -> assert(order_accepted_message_read.client_account[order_accepted_message_at] == order_accepted_message_written.client_account[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  assert(order_accepted_message_read.order_state == order_accepted_message_written.order_state);
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 15 -> assert(order_accepted_message_read.customer_info[order_accepted_message_at] == order_accepted_message_written.customer_info[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 32 -> assert(order_accepted_message_read.exchange_info[order_accepted_message_at] == order_accepted_message_written.exchange_info[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  assert(order_accepted_message_read.clearing_participant == order_accepted_message_written.clearing_participant);
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> assert(order_accepted_message_read.crossing_key[order_accepted_message_at] == order_accepted_message_written.crossing_key[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  assert(order_accepted_message_read.capacity_of_participant == order_accepted_message_written.capacity_of_participant);
  assert(order_accepted_message_read.directed_wholesale == order_accepted_message_written.directed_wholesale);
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 4 -> assert(order_accepted_message_read.execution_venue[order_accepted_message_at] == order_accepted_message_written.execution_venue[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 10 -> assert(order_accepted_message_read.intermediary_id[order_accepted_message_at] == order_accepted_message_written.intermediary_id[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 20 -> assert(order_accepted_message_read.order_origin[order_accepted_message_at] == order_accepted_message_written.order_origin[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> assert(order_accepted_message_read.filler[order_accepted_message_at] == order_accepted_message_written.filler[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  assert(order_accepted_message_read.ouch_order_type == order_accepted_message_written.ouch_order_type);
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> assert(order_accepted_message_read.short_sell_quantity[order_accepted_message_at] == order_accepted_message_written.short_sell_quantity[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  order_accepted_message_at = 0;
  do
  :: order_accepted_message_at < 8 -> assert(order_accepted_message_read.minimum_acceptable_quantity[order_accepted_message_at] == order_accepted_message_written.minimum_acceptable_quantity[order_accepted_message_at]); order_accepted_message_at = order_accepted_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Rejected Message: 26 bytes ---------------------------------------- */

/* This message is returned when an Enter Order, Replace Order, Cancel Order or Cancel By Order ID message is rejected */
typedef OrderRejectedMessage {
  byte timestamp_nanoseconds[8];
  byte order_token[14];
  byte reject_code[4]
};

int order_rejected_message_at;

/* every byte of Order Rejected Message set to one value */
inline fill_order_rejected_message(order_rejected_message_record, order_rejected_message_value) {
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 8 -> order_rejected_message_record.timestamp_nanoseconds[order_rejected_message_at] = order_rejected_message_value; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 14 -> order_rejected_message_record.order_token[order_rejected_message_at] = order_rejected_message_value; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 4 -> order_rejected_message_record.reject_code[order_rejected_message_at] = order_rejected_message_value; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Rejected Message set to where it lies, so a field read out of place says so */
inline ramp_order_rejected_message(order_rejected_message_record, order_rejected_message_base) {
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 8 -> order_rejected_message_record.timestamp_nanoseconds[order_rejected_message_at] = (order_rejected_message_base + 0 + order_rejected_message_at + 1) % 256; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 14 -> order_rejected_message_record.order_token[order_rejected_message_at] = (order_rejected_message_base + 8 + order_rejected_message_at + 1) % 256; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 4 -> order_rejected_message_record.reject_code[order_rejected_message_at] = (order_rejected_message_base + 22 + order_rejected_message_at + 1) % 256; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Rejected Message to the wire, 26 bytes from where the cursor stands */
inline encode_order_rejected_message(order_rejected_message_record) {
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 8 -> wire[at] = order_rejected_message_record.timestamp_nanoseconds[order_rejected_message_at]; at = at + 1; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 14 -> wire[at] = order_rejected_message_record.order_token[order_rejected_message_at]; at = at + 1; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 4 -> wire[at] = order_rejected_message_record.reject_code[order_rejected_message_at]; at = at + 1; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Rejected Message off the wire, 26 bytes from where the cursor stands */
inline decode_order_rejected_message(order_rejected_message_record) {
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 8 -> order_rejected_message_record.timestamp_nanoseconds[order_rejected_message_at] = wire[at]; at = at + 1; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 14 -> order_rejected_message_record.order_token[order_rejected_message_at] = wire[at]; at = at + 1; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 4 -> order_rejected_message_record.reject_code[order_rejected_message_at] = wire[at]; at = at + 1; order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Rejected Message is what was written, byte for byte */
inline equal_order_rejected_message(order_rejected_message_read, order_rejected_message_written) {
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 8 -> assert(order_rejected_message_read.timestamp_nanoseconds[order_rejected_message_at] == order_rejected_message_written.timestamp_nanoseconds[order_rejected_message_at]); order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 14 -> assert(order_rejected_message_read.order_token[order_rejected_message_at] == order_rejected_message_written.order_token[order_rejected_message_at]); order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  order_rejected_message_at = 0;
  do
  :: order_rejected_message_at < 4 -> assert(order_rejected_message_read.reject_code[order_rejected_message_at] == order_rejected_message_written.reject_code[order_rejected_message_at]); order_rejected_message_at = order_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Replaced Message: 187 bytes --------------------------------------- */

/* The Order Replaced message acknowledges the receipt and acceptance of a valid Replace Order message. */
typedef OrderReplacedMessage {
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
  byte client_account[10];
  byte order_state;
  byte customer_info[15];
  byte exchange_info[32];
  byte clearing_participant;
  byte crossing_key[4];
  byte capacity_of_participant;
  byte directed_wholesale;
  byte execution_venue[4];
  byte intermediary_id[10];
  byte order_origin[20];
  byte filler[8];
  byte ouch_order_type;
  byte short_sell_quantity[8];
  byte minimum_acceptable_quantity[8]
};

int order_replaced_message_at;

/* every byte of Order Replaced Message set to one value */
inline fill_order_replaced_message(order_replaced_message_record, order_replaced_message_value) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.timestamp_nanoseconds[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 14 -> order_replaced_message_record.replacement_order_token[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 14 -> order_replaced_message_record.previous_order_token[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.order_book_id[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.side = order_replaced_message_value;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.order_id[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.quantity[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.price[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.time_in_force = order_replaced_message_value;
  order_replaced_message_record.open_close = order_replaced_message_value;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 10 -> order_replaced_message_record.client_account[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.order_state = order_replaced_message_value;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 15 -> order_replaced_message_record.customer_info[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 32 -> order_replaced_message_record.exchange_info[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.clearing_participant = order_replaced_message_value;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.crossing_key[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.capacity_of_participant = order_replaced_message_value;
  order_replaced_message_record.directed_wholesale = order_replaced_message_value;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.execution_venue[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 10 -> order_replaced_message_record.intermediary_id[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 20 -> order_replaced_message_record.order_origin[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.filler[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.ouch_order_type = order_replaced_message_value;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.short_sell_quantity[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.minimum_acceptable_quantity[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Replaced Message set to where it lies, so a field read out of place says so */
inline ramp_order_replaced_message(order_replaced_message_record, order_replaced_message_base) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.timestamp_nanoseconds[order_replaced_message_at] = (order_replaced_message_base + 0 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 14 -> order_replaced_message_record.replacement_order_token[order_replaced_message_at] = (order_replaced_message_base + 8 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 14 -> order_replaced_message_record.previous_order_token[order_replaced_message_at] = (order_replaced_message_base + 22 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.order_book_id[order_replaced_message_at] = (order_replaced_message_base + 36 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.side = (order_replaced_message_base + 40 + 1) % 256;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.order_id[order_replaced_message_at] = (order_replaced_message_base + 41 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.quantity[order_replaced_message_at] = (order_replaced_message_base + 49 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.price[order_replaced_message_at] = (order_replaced_message_base + 57 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.time_in_force = (order_replaced_message_base + 61 + 1) % 256;
  order_replaced_message_record.open_close = (order_replaced_message_base + 62 + 1) % 256;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 10 -> order_replaced_message_record.client_account[order_replaced_message_at] = (order_replaced_message_base + 63 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.order_state = (order_replaced_message_base + 73 + 1) % 256;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 15 -> order_replaced_message_record.customer_info[order_replaced_message_at] = (order_replaced_message_base + 74 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 32 -> order_replaced_message_record.exchange_info[order_replaced_message_at] = (order_replaced_message_base + 89 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.clearing_participant = (order_replaced_message_base + 121 + 1) % 256;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.crossing_key[order_replaced_message_at] = (order_replaced_message_base + 122 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.capacity_of_participant = (order_replaced_message_base + 126 + 1) % 256;
  order_replaced_message_record.directed_wholesale = (order_replaced_message_base + 127 + 1) % 256;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.execution_venue[order_replaced_message_at] = (order_replaced_message_base + 128 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 10 -> order_replaced_message_record.intermediary_id[order_replaced_message_at] = (order_replaced_message_base + 132 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 20 -> order_replaced_message_record.order_origin[order_replaced_message_at] = (order_replaced_message_base + 142 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.filler[order_replaced_message_at] = (order_replaced_message_base + 162 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.ouch_order_type = (order_replaced_message_base + 170 + 1) % 256;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.short_sell_quantity[order_replaced_message_at] = (order_replaced_message_base + 171 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.minimum_acceptable_quantity[order_replaced_message_at] = (order_replaced_message_base + 179 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replaced Message to the wire, 187 bytes from where the cursor stands */
inline encode_order_replaced_message(order_replaced_message_record) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> wire[at] = order_replaced_message_record.timestamp_nanoseconds[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 14 -> wire[at] = order_replaced_message_record.replacement_order_token[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 14 -> wire[at] = order_replaced_message_record.previous_order_token[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.order_book_id[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = order_replaced_message_record.side; at = at + 1;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> wire[at] = order_replaced_message_record.order_id[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> wire[at] = order_replaced_message_record.quantity[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.price[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = order_replaced_message_record.time_in_force; at = at + 1;
  wire[at] = order_replaced_message_record.open_close; at = at + 1;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 10 -> wire[at] = order_replaced_message_record.client_account[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = order_replaced_message_record.order_state; at = at + 1;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 15 -> wire[at] = order_replaced_message_record.customer_info[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 32 -> wire[at] = order_replaced_message_record.exchange_info[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = order_replaced_message_record.clearing_participant; at = at + 1;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.crossing_key[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = order_replaced_message_record.capacity_of_participant; at = at + 1;
  wire[at] = order_replaced_message_record.directed_wholesale; at = at + 1;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.execution_venue[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 10 -> wire[at] = order_replaced_message_record.intermediary_id[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 20 -> wire[at] = order_replaced_message_record.order_origin[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> wire[at] = order_replaced_message_record.filler[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = order_replaced_message_record.ouch_order_type; at = at + 1;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> wire[at] = order_replaced_message_record.short_sell_quantity[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> wire[at] = order_replaced_message_record.minimum_acceptable_quantity[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replaced Message off the wire, 187 bytes from where the cursor stands */
inline decode_order_replaced_message(order_replaced_message_record) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.timestamp_nanoseconds[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 14 -> order_replaced_message_record.replacement_order_token[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 14 -> order_replaced_message_record.previous_order_token[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.order_book_id[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.side = wire[at]; at = at + 1;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.order_id[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.quantity[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.price[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.time_in_force = wire[at]; at = at + 1;
  order_replaced_message_record.open_close = wire[at]; at = at + 1;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 10 -> order_replaced_message_record.client_account[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.order_state = wire[at]; at = at + 1;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 15 -> order_replaced_message_record.customer_info[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 32 -> order_replaced_message_record.exchange_info[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.clearing_participant = wire[at]; at = at + 1;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.crossing_key[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.capacity_of_participant = wire[at]; at = at + 1;
  order_replaced_message_record.directed_wholesale = wire[at]; at = at + 1;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.execution_venue[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 10 -> order_replaced_message_record.intermediary_id[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 20 -> order_replaced_message_record.order_origin[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.filler[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.ouch_order_type = wire[at]; at = at + 1;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.short_sell_quantity[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.minimum_acceptable_quantity[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Replaced Message is what was written, byte for byte */
inline equal_order_replaced_message(order_replaced_message_read, order_replaced_message_written) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> assert(order_replaced_message_read.timestamp_nanoseconds[order_replaced_message_at] == order_replaced_message_written.timestamp_nanoseconds[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 14 -> assert(order_replaced_message_read.replacement_order_token[order_replaced_message_at] == order_replaced_message_written.replacement_order_token[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 14 -> assert(order_replaced_message_read.previous_order_token[order_replaced_message_at] == order_replaced_message_written.previous_order_token[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.order_book_id[order_replaced_message_at] == order_replaced_message_written.order_book_id[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  assert(order_replaced_message_read.side == order_replaced_message_written.side);
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> assert(order_replaced_message_read.order_id[order_replaced_message_at] == order_replaced_message_written.order_id[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> assert(order_replaced_message_read.quantity[order_replaced_message_at] == order_replaced_message_written.quantity[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.price[order_replaced_message_at] == order_replaced_message_written.price[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  assert(order_replaced_message_read.time_in_force == order_replaced_message_written.time_in_force);
  assert(order_replaced_message_read.open_close == order_replaced_message_written.open_close);
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 10 -> assert(order_replaced_message_read.client_account[order_replaced_message_at] == order_replaced_message_written.client_account[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  assert(order_replaced_message_read.order_state == order_replaced_message_written.order_state);
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 15 -> assert(order_replaced_message_read.customer_info[order_replaced_message_at] == order_replaced_message_written.customer_info[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 32 -> assert(order_replaced_message_read.exchange_info[order_replaced_message_at] == order_replaced_message_written.exchange_info[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  assert(order_replaced_message_read.clearing_participant == order_replaced_message_written.clearing_participant);
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.crossing_key[order_replaced_message_at] == order_replaced_message_written.crossing_key[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  assert(order_replaced_message_read.capacity_of_participant == order_replaced_message_written.capacity_of_participant);
  assert(order_replaced_message_read.directed_wholesale == order_replaced_message_written.directed_wholesale);
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.execution_venue[order_replaced_message_at] == order_replaced_message_written.execution_venue[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 10 -> assert(order_replaced_message_read.intermediary_id[order_replaced_message_at] == order_replaced_message_written.intermediary_id[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 20 -> assert(order_replaced_message_read.order_origin[order_replaced_message_at] == order_replaced_message_written.order_origin[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> assert(order_replaced_message_read.filler[order_replaced_message_at] == order_replaced_message_written.filler[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  assert(order_replaced_message_read.ouch_order_type == order_replaced_message_written.ouch_order_type);
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> assert(order_replaced_message_read.short_sell_quantity[order_replaced_message_at] == order_replaced_message_written.short_sell_quantity[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> assert(order_replaced_message_read.minimum_acceptable_quantity[order_replaced_message_at] == order_replaced_message_written.minimum_acceptable_quantity[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancelled Message: 36 bytes --------------------------------------- */

/* The Order Cancelled message informs the ASX Trade OUCH user that an order has been cancelled. This could be to acknowledge a Cancel Order or Cancel By Order Id message, or it could be as a result of system cancellation of an order. */
typedef OrderCancelledMessage {
  byte timestamp_nanoseconds[8];
  byte order_token[14];
  byte order_book_id[4];
  byte side;
  byte order_id[8];
  byte reason
};

int order_cancelled_message_at;

/* every byte of Order Cancelled Message set to one value */
inline fill_order_cancelled_message(order_cancelled_message_record, order_cancelled_message_value) {
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> order_cancelled_message_record.timestamp_nanoseconds[order_cancelled_message_at] = order_cancelled_message_value; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 14 -> order_cancelled_message_record.order_token[order_cancelled_message_at] = order_cancelled_message_value; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 4 -> order_cancelled_message_record.order_book_id[order_cancelled_message_at] = order_cancelled_message_value; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_record.side = order_cancelled_message_value;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> order_cancelled_message_record.order_id[order_cancelled_message_at] = order_cancelled_message_value; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_record.reason = order_cancelled_message_value;
  skip
}

/* each byte of Order Cancelled Message set to where it lies, so a field read out of place says so */
inline ramp_order_cancelled_message(order_cancelled_message_record, order_cancelled_message_base) {
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> order_cancelled_message_record.timestamp_nanoseconds[order_cancelled_message_at] = (order_cancelled_message_base + 0 + order_cancelled_message_at + 1) % 256; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 14 -> order_cancelled_message_record.order_token[order_cancelled_message_at] = (order_cancelled_message_base + 8 + order_cancelled_message_at + 1) % 256; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 4 -> order_cancelled_message_record.order_book_id[order_cancelled_message_at] = (order_cancelled_message_base + 22 + order_cancelled_message_at + 1) % 256; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_record.side = (order_cancelled_message_base + 26 + 1) % 256;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> order_cancelled_message_record.order_id[order_cancelled_message_at] = (order_cancelled_message_base + 27 + order_cancelled_message_at + 1) % 256; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_record.reason = (order_cancelled_message_base + 35 + 1) % 256;
  skip
}

/* Order Cancelled Message to the wire, 36 bytes from where the cursor stands */
inline encode_order_cancelled_message(order_cancelled_message_record) {
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> wire[at] = order_cancelled_message_record.timestamp_nanoseconds[order_cancelled_message_at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 14 -> wire[at] = order_cancelled_message_record.order_token[order_cancelled_message_at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 4 -> wire[at] = order_cancelled_message_record.order_book_id[order_cancelled_message_at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  wire[at] = order_cancelled_message_record.side; at = at + 1;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> wire[at] = order_cancelled_message_record.order_id[order_cancelled_message_at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  wire[at] = order_cancelled_message_record.reason; at = at + 1;
  skip
}

/* Order Cancelled Message off the wire, 36 bytes from where the cursor stands */
inline decode_order_cancelled_message(order_cancelled_message_record) {
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> order_cancelled_message_record.timestamp_nanoseconds[order_cancelled_message_at] = wire[at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 14 -> order_cancelled_message_record.order_token[order_cancelled_message_at] = wire[at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 4 -> order_cancelled_message_record.order_book_id[order_cancelled_message_at] = wire[at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_record.side = wire[at]; at = at + 1;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> order_cancelled_message_record.order_id[order_cancelled_message_at] = wire[at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_record.reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Cancelled Message is what was written, byte for byte */
inline equal_order_cancelled_message(order_cancelled_message_read, order_cancelled_message_written) {
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> assert(order_cancelled_message_read.timestamp_nanoseconds[order_cancelled_message_at] == order_cancelled_message_written.timestamp_nanoseconds[order_cancelled_message_at]); order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 14 -> assert(order_cancelled_message_read.order_token[order_cancelled_message_at] == order_cancelled_message_written.order_token[order_cancelled_message_at]); order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 4 -> assert(order_cancelled_message_read.order_book_id[order_cancelled_message_at] == order_cancelled_message_written.order_book_id[order_cancelled_message_at]); order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  assert(order_cancelled_message_read.side == order_cancelled_message_written.side);
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> assert(order_cancelled_message_read.order_id[order_cancelled_message_at] == order_cancelled_message_written.order_id[order_cancelled_message_at]); order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  assert(order_cancelled_message_read.reason == order_cancelled_message_written.reason);
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
    assert(at == 173);
    at = 0;
    decode_order_accepted_message(order_accepted_message_got);
    assert(at == 173);
    equal_order_accepted_message(order_accepted_message_got, order_accepted_message_sent)
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
    assert(at == 26);
    at = 0;
    decode_order_rejected_message(order_rejected_message_got);
    assert(at == 26);
    equal_order_rejected_message(order_rejected_message_got, order_rejected_message_sent)
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
    assert(at == 187);
    at = 0;
    decode_order_replaced_message(order_replaced_message_got);
    assert(at == 187);
    equal_order_replaced_message(order_replaced_message_got, order_replaced_message_sent)
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
    assert(at == 36);
    at = 0;
    decode_order_cancelled_message(order_cancelled_message_got);
    assert(at == 36);
    equal_order_cancelled_message(order_cancelled_message_got, order_cancelled_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_server_packet_header()
  :: run check_login_accepted_packet()
  :: run check_login_rejected_packet()
  :: run check_order_accepted_message()
  :: run check_order_rejected_message()
  :: run check_order_replaced_message()
  :: run check_order_cancelled_message()
  fi
}
