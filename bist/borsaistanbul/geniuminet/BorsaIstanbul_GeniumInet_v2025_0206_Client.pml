/*
 * Borsa İstanbul A.Ş. Genium Inet
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
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 121

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Client Packet Header: 3 bytes ------------------------------------------- */

/* Packet header of a packet sent by the client */
typedef ClientPacketHeader {
  byte packet_length[2];
  byte client_packet_type
};

int client_packet_header_at;

/* every byte of Client Packet Header set to one value */
inline fill_client_packet_header(client_packet_header_record, client_packet_header_value) {
  client_packet_header_at = 0;
  do
  :: client_packet_header_at < 2 -> client_packet_header_record.packet_length[client_packet_header_at] = client_packet_header_value; client_packet_header_at = client_packet_header_at + 1
  :: else -> break
  od;
  client_packet_header_record.client_packet_type = client_packet_header_value;
  skip
}

/* each byte of Client Packet Header set to where it lies, so a field read out of place says so */
inline ramp_client_packet_header(client_packet_header_record, client_packet_header_base) {
  client_packet_header_at = 0;
  do
  :: client_packet_header_at < 2 -> client_packet_header_record.packet_length[client_packet_header_at] = (client_packet_header_base + 0 + client_packet_header_at + 1) % 256; client_packet_header_at = client_packet_header_at + 1
  :: else -> break
  od;
  client_packet_header_record.client_packet_type = (client_packet_header_base + 2 + 1) % 256;
  skip
}

/* Client Packet Header to the wire, 3 bytes from where the cursor stands */
inline encode_client_packet_header(client_packet_header_record) {
  client_packet_header_at = 0;
  do
  :: client_packet_header_at < 2 -> wire[at] = client_packet_header_record.packet_length[client_packet_header_at]; at = at + 1; client_packet_header_at = client_packet_header_at + 1
  :: else -> break
  od;
  wire[at] = client_packet_header_record.client_packet_type; at = at + 1;
  skip
}

/* Client Packet Header off the wire, 3 bytes from where the cursor stands */
inline decode_client_packet_header(client_packet_header_record) {
  client_packet_header_at = 0;
  do
  :: client_packet_header_at < 2 -> client_packet_header_record.packet_length[client_packet_header_at] = wire[at]; at = at + 1; client_packet_header_at = client_packet_header_at + 1
  :: else -> break
  od;
  client_packet_header_record.client_packet_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Client Packet Header is what was written, byte for byte */
inline equal_client_packet_header(client_packet_header_read, client_packet_header_written) {
  client_packet_header_at = 0;
  do
  :: client_packet_header_at < 2 -> assert(client_packet_header_read.packet_length[client_packet_header_at] == client_packet_header_written.packet_length[client_packet_header_at]); client_packet_header_at = client_packet_header_at + 1
  :: else -> break
  od;
  assert(client_packet_header_read.client_packet_type == client_packet_header_written.client_packet_type);
  skip
}

/* ---- Login Request Packet: 46 bytes ------------------------------------------ */

/* The SoupBinTCP client must send a Login Request Packet immediately upon establishing a new TCP/IP socket connection to the server */
typedef LoginRequestPacket {
  byte username[6];
  byte password[10];
  byte requested_session[10];
  byte requested_sequence_number[20]
};

int login_request_packet_at;

/* every byte of Login Request Packet set to one value */
inline fill_login_request_packet(login_request_packet_record, login_request_packet_value) {
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 6 -> login_request_packet_record.username[login_request_packet_at] = login_request_packet_value; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.password[login_request_packet_at] = login_request_packet_value; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.requested_session[login_request_packet_at] = login_request_packet_value; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 20 -> login_request_packet_record.requested_sequence_number[login_request_packet_at] = login_request_packet_value; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Request Packet set to where it lies, so a field read out of place says so */
inline ramp_login_request_packet(login_request_packet_record, login_request_packet_base) {
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 6 -> login_request_packet_record.username[login_request_packet_at] = (login_request_packet_base + 0 + login_request_packet_at + 1) % 256; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.password[login_request_packet_at] = (login_request_packet_base + 6 + login_request_packet_at + 1) % 256; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.requested_session[login_request_packet_at] = (login_request_packet_base + 16 + login_request_packet_at + 1) % 256; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 20 -> login_request_packet_record.requested_sequence_number[login_request_packet_at] = (login_request_packet_base + 26 + login_request_packet_at + 1) % 256; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request Packet to the wire, 46 bytes from where the cursor stands */
inline encode_login_request_packet(login_request_packet_record) {
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 6 -> wire[at] = login_request_packet_record.username[login_request_packet_at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> wire[at] = login_request_packet_record.password[login_request_packet_at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> wire[at] = login_request_packet_record.requested_session[login_request_packet_at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 20 -> wire[at] = login_request_packet_record.requested_sequence_number[login_request_packet_at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request Packet off the wire, 46 bytes from where the cursor stands */
inline decode_login_request_packet(login_request_packet_record) {
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 6 -> login_request_packet_record.username[login_request_packet_at] = wire[at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.password[login_request_packet_at] = wire[at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.requested_session[login_request_packet_at] = wire[at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 20 -> login_request_packet_record.requested_sequence_number[login_request_packet_at] = wire[at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Request Packet is what was written, byte for byte */
inline equal_login_request_packet(login_request_packet_read, login_request_packet_written) {
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 6 -> assert(login_request_packet_read.username[login_request_packet_at] == login_request_packet_written.username[login_request_packet_at]); login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> assert(login_request_packet_read.password[login_request_packet_at] == login_request_packet_written.password[login_request_packet_at]); login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> assert(login_request_packet_read.requested_session[login_request_packet_at] == login_request_packet_written.requested_session[login_request_packet_at]); login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 20 -> assert(login_request_packet_read.requested_sequence_number[login_request_packet_at] == login_request_packet_written.requested_sequence_number[login_request_packet_at]); login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Enter Order: 113 bytes -------------------------------------------------- */

/* Enters a new order into the system. The response to a successful Enter Order is an Order Accepted message. If the order is rejected, the Order Rejected message will be returned. */
typedef EnterOrder {
  byte order_token[14];
  byte order_book_id[4];
  byte side;
  byte quantity[8];
  byte price[4];
  byte time_in_force;
  byte open_close;
  byte client_account[16];
  byte customer_info[15];
  byte exchange_info_alpha_32[32];
  byte display_quantity[8];
  byte client_category;
  byte off_hours;
  byte smp_level;
  byte smp_method;
  byte smp_id[3];
  byte reserved_numeric_unsigned_2[2]
};

int enter_order_at;

/* every byte of Enter Order set to one value */
inline fill_enter_order(enter_order_record, enter_order_value) {
  enter_order_at = 0;
  do
  :: enter_order_at < 14 -> enter_order_record.order_token[enter_order_at] = enter_order_value; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 4 -> enter_order_record.order_book_id[enter_order_at] = enter_order_value; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_record.side = enter_order_value;
  enter_order_at = 0;
  do
  :: enter_order_at < 8 -> enter_order_record.quantity[enter_order_at] = enter_order_value; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 4 -> enter_order_record.price[enter_order_at] = enter_order_value; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_record.time_in_force = enter_order_value;
  enter_order_record.open_close = enter_order_value;
  enter_order_at = 0;
  do
  :: enter_order_at < 16 -> enter_order_record.client_account[enter_order_at] = enter_order_value; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 15 -> enter_order_record.customer_info[enter_order_at] = enter_order_value; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 32 -> enter_order_record.exchange_info_alpha_32[enter_order_at] = enter_order_value; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 8 -> enter_order_record.display_quantity[enter_order_at] = enter_order_value; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_record.client_category = enter_order_value;
  enter_order_record.off_hours = enter_order_value;
  enter_order_record.smp_level = enter_order_value;
  enter_order_record.smp_method = enter_order_value;
  enter_order_at = 0;
  do
  :: enter_order_at < 3 -> enter_order_record.smp_id[enter_order_at] = enter_order_value; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 2 -> enter_order_record.reserved_numeric_unsigned_2[enter_order_at] = enter_order_value; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Enter Order set to where it lies, so a field read out of place says so */
inline ramp_enter_order(enter_order_record, enter_order_base) {
  enter_order_at = 0;
  do
  :: enter_order_at < 14 -> enter_order_record.order_token[enter_order_at] = (enter_order_base + 0 + enter_order_at + 1) % 256; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 4 -> enter_order_record.order_book_id[enter_order_at] = (enter_order_base + 14 + enter_order_at + 1) % 256; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_record.side = (enter_order_base + 18 + 1) % 256;
  enter_order_at = 0;
  do
  :: enter_order_at < 8 -> enter_order_record.quantity[enter_order_at] = (enter_order_base + 19 + enter_order_at + 1) % 256; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 4 -> enter_order_record.price[enter_order_at] = (enter_order_base + 27 + enter_order_at + 1) % 256; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_record.time_in_force = (enter_order_base + 31 + 1) % 256;
  enter_order_record.open_close = (enter_order_base + 32 + 1) % 256;
  enter_order_at = 0;
  do
  :: enter_order_at < 16 -> enter_order_record.client_account[enter_order_at] = (enter_order_base + 33 + enter_order_at + 1) % 256; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 15 -> enter_order_record.customer_info[enter_order_at] = (enter_order_base + 49 + enter_order_at + 1) % 256; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 32 -> enter_order_record.exchange_info_alpha_32[enter_order_at] = (enter_order_base + 64 + enter_order_at + 1) % 256; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 8 -> enter_order_record.display_quantity[enter_order_at] = (enter_order_base + 96 + enter_order_at + 1) % 256; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_record.client_category = (enter_order_base + 104 + 1) % 256;
  enter_order_record.off_hours = (enter_order_base + 105 + 1) % 256;
  enter_order_record.smp_level = (enter_order_base + 106 + 1) % 256;
  enter_order_record.smp_method = (enter_order_base + 107 + 1) % 256;
  enter_order_at = 0;
  do
  :: enter_order_at < 3 -> enter_order_record.smp_id[enter_order_at] = (enter_order_base + 108 + enter_order_at + 1) % 256; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 2 -> enter_order_record.reserved_numeric_unsigned_2[enter_order_at] = (enter_order_base + 111 + enter_order_at + 1) % 256; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  skip
}

/* Enter Order to the wire, 113 bytes from where the cursor stands */
inline encode_enter_order(enter_order_record) {
  enter_order_at = 0;
  do
  :: enter_order_at < 14 -> wire[at] = enter_order_record.order_token[enter_order_at]; at = at + 1; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 4 -> wire[at] = enter_order_record.order_book_id[enter_order_at]; at = at + 1; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  wire[at] = enter_order_record.side; at = at + 1;
  enter_order_at = 0;
  do
  :: enter_order_at < 8 -> wire[at] = enter_order_record.quantity[enter_order_at]; at = at + 1; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 4 -> wire[at] = enter_order_record.price[enter_order_at]; at = at + 1; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  wire[at] = enter_order_record.time_in_force; at = at + 1;
  wire[at] = enter_order_record.open_close; at = at + 1;
  enter_order_at = 0;
  do
  :: enter_order_at < 16 -> wire[at] = enter_order_record.client_account[enter_order_at]; at = at + 1; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 15 -> wire[at] = enter_order_record.customer_info[enter_order_at]; at = at + 1; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 32 -> wire[at] = enter_order_record.exchange_info_alpha_32[enter_order_at]; at = at + 1; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 8 -> wire[at] = enter_order_record.display_quantity[enter_order_at]; at = at + 1; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  wire[at] = enter_order_record.client_category; at = at + 1;
  wire[at] = enter_order_record.off_hours; at = at + 1;
  wire[at] = enter_order_record.smp_level; at = at + 1;
  wire[at] = enter_order_record.smp_method; at = at + 1;
  enter_order_at = 0;
  do
  :: enter_order_at < 3 -> wire[at] = enter_order_record.smp_id[enter_order_at]; at = at + 1; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 2 -> wire[at] = enter_order_record.reserved_numeric_unsigned_2[enter_order_at]; at = at + 1; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  skip
}

/* Enter Order off the wire, 113 bytes from where the cursor stands */
inline decode_enter_order(enter_order_record) {
  enter_order_at = 0;
  do
  :: enter_order_at < 14 -> enter_order_record.order_token[enter_order_at] = wire[at]; at = at + 1; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 4 -> enter_order_record.order_book_id[enter_order_at] = wire[at]; at = at + 1; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_record.side = wire[at]; at = at + 1;
  enter_order_at = 0;
  do
  :: enter_order_at < 8 -> enter_order_record.quantity[enter_order_at] = wire[at]; at = at + 1; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 4 -> enter_order_record.price[enter_order_at] = wire[at]; at = at + 1; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_record.time_in_force = wire[at]; at = at + 1;
  enter_order_record.open_close = wire[at]; at = at + 1;
  enter_order_at = 0;
  do
  :: enter_order_at < 16 -> enter_order_record.client_account[enter_order_at] = wire[at]; at = at + 1; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 15 -> enter_order_record.customer_info[enter_order_at] = wire[at]; at = at + 1; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 32 -> enter_order_record.exchange_info_alpha_32[enter_order_at] = wire[at]; at = at + 1; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 8 -> enter_order_record.display_quantity[enter_order_at] = wire[at]; at = at + 1; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_record.client_category = wire[at]; at = at + 1;
  enter_order_record.off_hours = wire[at]; at = at + 1;
  enter_order_record.smp_level = wire[at]; at = at + 1;
  enter_order_record.smp_method = wire[at]; at = at + 1;
  enter_order_at = 0;
  do
  :: enter_order_at < 3 -> enter_order_record.smp_id[enter_order_at] = wire[at]; at = at + 1; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 2 -> enter_order_record.reserved_numeric_unsigned_2[enter_order_at] = wire[at]; at = at + 1; enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Enter Order is what was written, byte for byte */
inline equal_enter_order(enter_order_read, enter_order_written) {
  enter_order_at = 0;
  do
  :: enter_order_at < 14 -> assert(enter_order_read.order_token[enter_order_at] == enter_order_written.order_token[enter_order_at]); enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 4 -> assert(enter_order_read.order_book_id[enter_order_at] == enter_order_written.order_book_id[enter_order_at]); enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  assert(enter_order_read.side == enter_order_written.side);
  enter_order_at = 0;
  do
  :: enter_order_at < 8 -> assert(enter_order_read.quantity[enter_order_at] == enter_order_written.quantity[enter_order_at]); enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 4 -> assert(enter_order_read.price[enter_order_at] == enter_order_written.price[enter_order_at]); enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  assert(enter_order_read.time_in_force == enter_order_written.time_in_force);
  assert(enter_order_read.open_close == enter_order_written.open_close);
  enter_order_at = 0;
  do
  :: enter_order_at < 16 -> assert(enter_order_read.client_account[enter_order_at] == enter_order_written.client_account[enter_order_at]); enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 15 -> assert(enter_order_read.customer_info[enter_order_at] == enter_order_written.customer_info[enter_order_at]); enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 32 -> assert(enter_order_read.exchange_info_alpha_32[enter_order_at] == enter_order_written.exchange_info_alpha_32[enter_order_at]); enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 8 -> assert(enter_order_read.display_quantity[enter_order_at] == enter_order_written.display_quantity[enter_order_at]); enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  assert(enter_order_read.client_category == enter_order_written.client_category);
  assert(enter_order_read.off_hours == enter_order_written.off_hours);
  assert(enter_order_read.smp_level == enter_order_written.smp_level);
  assert(enter_order_read.smp_method == enter_order_written.smp_method);
  enter_order_at = 0;
  do
  :: enter_order_at < 3 -> assert(enter_order_read.smp_id[enter_order_at] == enter_order_written.smp_id[enter_order_at]); enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  enter_order_at = 0;
  do
  :: enter_order_at < 2 -> assert(enter_order_read.reserved_numeric_unsigned_2[enter_order_at] == enter_order_written.reserved_numeric_unsigned_2[enter_order_at]); enter_order_at = enter_order_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Replace Order: 121 bytes ------------------------------------------------ */

/* Modifies an existing order entered via OUCH. The response is an Order Replaced message if the modification was successful, or an Order Rejected message if the replace failed. */
typedef ReplaceOrder {
  byte existing_order_token[14];
  byte replacement_order_token[14];
  byte quantity[8];
  byte price[4];
  byte replace_open_close;
  byte client_account[16];
  byte customer_info[15];
  byte exchange_info_alpha_32[32];
  byte display_quantity[8];
  byte client_category;
  byte reserved_numeric_unsigned_8[8]
};

int replace_order_at;

/* every byte of Replace Order set to one value */
inline fill_replace_order(replace_order_record, replace_order_value) {
  replace_order_at = 0;
  do
  :: replace_order_at < 14 -> replace_order_record.existing_order_token[replace_order_at] = replace_order_value; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 14 -> replace_order_record.replacement_order_token[replace_order_at] = replace_order_value; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 8 -> replace_order_record.quantity[replace_order_at] = replace_order_value; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 4 -> replace_order_record.price[replace_order_at] = replace_order_value; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_record.replace_open_close = replace_order_value;
  replace_order_at = 0;
  do
  :: replace_order_at < 16 -> replace_order_record.client_account[replace_order_at] = replace_order_value; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 15 -> replace_order_record.customer_info[replace_order_at] = replace_order_value; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 32 -> replace_order_record.exchange_info_alpha_32[replace_order_at] = replace_order_value; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 8 -> replace_order_record.display_quantity[replace_order_at] = replace_order_value; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_record.client_category = replace_order_value;
  replace_order_at = 0;
  do
  :: replace_order_at < 8 -> replace_order_record.reserved_numeric_unsigned_8[replace_order_at] = replace_order_value; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Replace Order set to where it lies, so a field read out of place says so */
inline ramp_replace_order(replace_order_record, replace_order_base) {
  replace_order_at = 0;
  do
  :: replace_order_at < 14 -> replace_order_record.existing_order_token[replace_order_at] = (replace_order_base + 0 + replace_order_at + 1) % 256; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 14 -> replace_order_record.replacement_order_token[replace_order_at] = (replace_order_base + 14 + replace_order_at + 1) % 256; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 8 -> replace_order_record.quantity[replace_order_at] = (replace_order_base + 28 + replace_order_at + 1) % 256; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 4 -> replace_order_record.price[replace_order_at] = (replace_order_base + 36 + replace_order_at + 1) % 256; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_record.replace_open_close = (replace_order_base + 40 + 1) % 256;
  replace_order_at = 0;
  do
  :: replace_order_at < 16 -> replace_order_record.client_account[replace_order_at] = (replace_order_base + 41 + replace_order_at + 1) % 256; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 15 -> replace_order_record.customer_info[replace_order_at] = (replace_order_base + 57 + replace_order_at + 1) % 256; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 32 -> replace_order_record.exchange_info_alpha_32[replace_order_at] = (replace_order_base + 72 + replace_order_at + 1) % 256; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 8 -> replace_order_record.display_quantity[replace_order_at] = (replace_order_base + 104 + replace_order_at + 1) % 256; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_record.client_category = (replace_order_base + 112 + 1) % 256;
  replace_order_at = 0;
  do
  :: replace_order_at < 8 -> replace_order_record.reserved_numeric_unsigned_8[replace_order_at] = (replace_order_base + 113 + replace_order_at + 1) % 256; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  skip
}

/* Replace Order to the wire, 121 bytes from where the cursor stands */
inline encode_replace_order(replace_order_record) {
  replace_order_at = 0;
  do
  :: replace_order_at < 14 -> wire[at] = replace_order_record.existing_order_token[replace_order_at]; at = at + 1; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 14 -> wire[at] = replace_order_record.replacement_order_token[replace_order_at]; at = at + 1; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 8 -> wire[at] = replace_order_record.quantity[replace_order_at]; at = at + 1; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 4 -> wire[at] = replace_order_record.price[replace_order_at]; at = at + 1; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  wire[at] = replace_order_record.replace_open_close; at = at + 1;
  replace_order_at = 0;
  do
  :: replace_order_at < 16 -> wire[at] = replace_order_record.client_account[replace_order_at]; at = at + 1; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 15 -> wire[at] = replace_order_record.customer_info[replace_order_at]; at = at + 1; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 32 -> wire[at] = replace_order_record.exchange_info_alpha_32[replace_order_at]; at = at + 1; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 8 -> wire[at] = replace_order_record.display_quantity[replace_order_at]; at = at + 1; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  wire[at] = replace_order_record.client_category; at = at + 1;
  replace_order_at = 0;
  do
  :: replace_order_at < 8 -> wire[at] = replace_order_record.reserved_numeric_unsigned_8[replace_order_at]; at = at + 1; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  skip
}

/* Replace Order off the wire, 121 bytes from where the cursor stands */
inline decode_replace_order(replace_order_record) {
  replace_order_at = 0;
  do
  :: replace_order_at < 14 -> replace_order_record.existing_order_token[replace_order_at] = wire[at]; at = at + 1; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 14 -> replace_order_record.replacement_order_token[replace_order_at] = wire[at]; at = at + 1; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 8 -> replace_order_record.quantity[replace_order_at] = wire[at]; at = at + 1; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 4 -> replace_order_record.price[replace_order_at] = wire[at]; at = at + 1; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_record.replace_open_close = wire[at]; at = at + 1;
  replace_order_at = 0;
  do
  :: replace_order_at < 16 -> replace_order_record.client_account[replace_order_at] = wire[at]; at = at + 1; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 15 -> replace_order_record.customer_info[replace_order_at] = wire[at]; at = at + 1; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 32 -> replace_order_record.exchange_info_alpha_32[replace_order_at] = wire[at]; at = at + 1; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 8 -> replace_order_record.display_quantity[replace_order_at] = wire[at]; at = at + 1; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_record.client_category = wire[at]; at = at + 1;
  replace_order_at = 0;
  do
  :: replace_order_at < 8 -> replace_order_record.reserved_numeric_unsigned_8[replace_order_at] = wire[at]; at = at + 1; replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Replace Order is what was written, byte for byte */
inline equal_replace_order(replace_order_read, replace_order_written) {
  replace_order_at = 0;
  do
  :: replace_order_at < 14 -> assert(replace_order_read.existing_order_token[replace_order_at] == replace_order_written.existing_order_token[replace_order_at]); replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 14 -> assert(replace_order_read.replacement_order_token[replace_order_at] == replace_order_written.replacement_order_token[replace_order_at]); replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 8 -> assert(replace_order_read.quantity[replace_order_at] == replace_order_written.quantity[replace_order_at]); replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 4 -> assert(replace_order_read.price[replace_order_at] == replace_order_written.price[replace_order_at]); replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  assert(replace_order_read.replace_open_close == replace_order_written.replace_open_close);
  replace_order_at = 0;
  do
  :: replace_order_at < 16 -> assert(replace_order_read.client_account[replace_order_at] == replace_order_written.client_account[replace_order_at]); replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 15 -> assert(replace_order_read.customer_info[replace_order_at] == replace_order_written.customer_info[replace_order_at]); replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 32 -> assert(replace_order_read.exchange_info_alpha_32[replace_order_at] == replace_order_written.exchange_info_alpha_32[replace_order_at]); replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  replace_order_at = 0;
  do
  :: replace_order_at < 8 -> assert(replace_order_read.display_quantity[replace_order_at] == replace_order_written.display_quantity[replace_order_at]); replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  assert(replace_order_read.client_category == replace_order_written.client_category);
  replace_order_at = 0;
  do
  :: replace_order_at < 8 -> assert(replace_order_read.reserved_numeric_unsigned_8[replace_order_at] == replace_order_written.reserved_numeric_unsigned_8[replace_order_at]); replace_order_at = replace_order_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel Order: 14 bytes -------------------------------------------------- */

/* Cancels an existing order entered via OUCH. Partial cancels are not supported; use Replace Order to modify an existing order. The response to a successful Cancel Order is an Order Canceled message. Failed Cancel Order messages are rejected with the Order Rejected message. */
typedef CancelOrder {
  byte order_token[14]
};

int cancel_order_at;

/* every byte of Cancel Order set to one value */
inline fill_cancel_order(cancel_order_record, cancel_order_value) {
  cancel_order_at = 0;
  do
  :: cancel_order_at < 14 -> cancel_order_record.order_token[cancel_order_at] = cancel_order_value; cancel_order_at = cancel_order_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Order set to where it lies, so a field read out of place says so */
inline ramp_cancel_order(cancel_order_record, cancel_order_base) {
  cancel_order_at = 0;
  do
  :: cancel_order_at < 14 -> cancel_order_record.order_token[cancel_order_at] = (cancel_order_base + 0 + cancel_order_at + 1) % 256; cancel_order_at = cancel_order_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order to the wire, 14 bytes from where the cursor stands */
inline encode_cancel_order(cancel_order_record) {
  cancel_order_at = 0;
  do
  :: cancel_order_at < 14 -> wire[at] = cancel_order_record.order_token[cancel_order_at]; at = at + 1; cancel_order_at = cancel_order_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order off the wire, 14 bytes from where the cursor stands */
inline decode_cancel_order(cancel_order_record) {
  cancel_order_at = 0;
  do
  :: cancel_order_at < 14 -> cancel_order_record.order_token[cancel_order_at] = wire[at]; at = at + 1; cancel_order_at = cancel_order_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Order is what was written, byte for byte */
inline equal_cancel_order(cancel_order_read, cancel_order_written) {
  cancel_order_at = 0;
  do
  :: cancel_order_at < 14 -> assert(cancel_order_read.order_token[cancel_order_at] == cancel_order_written.order_token[cancel_order_at]); cancel_order_at = cancel_order_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel By Order Id: 13 bytes -------------------------------------------- */

/* Cancels any order in the book, regardless of which session it was inserted over, using the system-generated Order ID. The response to a successful Cancel by Order Id is an Order Canceled message. Failed requests are rejected with the Order Rejected message. */
typedef CancelByOrderId {
  byte order_book_id[4];
  byte side;
  byte order_id[8]
};

int cancel_by_order_id_at;

/* every byte of Cancel By Order Id set to one value */
inline fill_cancel_by_order_id(cancel_by_order_id_record, cancel_by_order_id_value) {
  cancel_by_order_id_at = 0;
  do
  :: cancel_by_order_id_at < 4 -> cancel_by_order_id_record.order_book_id[cancel_by_order_id_at] = cancel_by_order_id_value; cancel_by_order_id_at = cancel_by_order_id_at + 1
  :: else -> break
  od;
  cancel_by_order_id_record.side = cancel_by_order_id_value;
  cancel_by_order_id_at = 0;
  do
  :: cancel_by_order_id_at < 8 -> cancel_by_order_id_record.order_id[cancel_by_order_id_at] = cancel_by_order_id_value; cancel_by_order_id_at = cancel_by_order_id_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel By Order Id set to where it lies, so a field read out of place says so */
inline ramp_cancel_by_order_id(cancel_by_order_id_record, cancel_by_order_id_base) {
  cancel_by_order_id_at = 0;
  do
  :: cancel_by_order_id_at < 4 -> cancel_by_order_id_record.order_book_id[cancel_by_order_id_at] = (cancel_by_order_id_base + 0 + cancel_by_order_id_at + 1) % 256; cancel_by_order_id_at = cancel_by_order_id_at + 1
  :: else -> break
  od;
  cancel_by_order_id_record.side = (cancel_by_order_id_base + 4 + 1) % 256;
  cancel_by_order_id_at = 0;
  do
  :: cancel_by_order_id_at < 8 -> cancel_by_order_id_record.order_id[cancel_by_order_id_at] = (cancel_by_order_id_base + 5 + cancel_by_order_id_at + 1) % 256; cancel_by_order_id_at = cancel_by_order_id_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel By Order Id to the wire, 13 bytes from where the cursor stands */
inline encode_cancel_by_order_id(cancel_by_order_id_record) {
  cancel_by_order_id_at = 0;
  do
  :: cancel_by_order_id_at < 4 -> wire[at] = cancel_by_order_id_record.order_book_id[cancel_by_order_id_at]; at = at + 1; cancel_by_order_id_at = cancel_by_order_id_at + 1
  :: else -> break
  od;
  wire[at] = cancel_by_order_id_record.side; at = at + 1;
  cancel_by_order_id_at = 0;
  do
  :: cancel_by_order_id_at < 8 -> wire[at] = cancel_by_order_id_record.order_id[cancel_by_order_id_at]; at = at + 1; cancel_by_order_id_at = cancel_by_order_id_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel By Order Id off the wire, 13 bytes from where the cursor stands */
inline decode_cancel_by_order_id(cancel_by_order_id_record) {
  cancel_by_order_id_at = 0;
  do
  :: cancel_by_order_id_at < 4 -> cancel_by_order_id_record.order_book_id[cancel_by_order_id_at] = wire[at]; at = at + 1; cancel_by_order_id_at = cancel_by_order_id_at + 1
  :: else -> break
  od;
  cancel_by_order_id_record.side = wire[at]; at = at + 1;
  cancel_by_order_id_at = 0;
  do
  :: cancel_by_order_id_at < 8 -> cancel_by_order_id_record.order_id[cancel_by_order_id_at] = wire[at]; at = at + 1; cancel_by_order_id_at = cancel_by_order_id_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel By Order Id is what was written, byte for byte */
inline equal_cancel_by_order_id(cancel_by_order_id_read, cancel_by_order_id_written) {
  cancel_by_order_id_at = 0;
  do
  :: cancel_by_order_id_at < 4 -> assert(cancel_by_order_id_read.order_book_id[cancel_by_order_id_at] == cancel_by_order_id_written.order_book_id[cancel_by_order_id_at]); cancel_by_order_id_at = cancel_by_order_id_at + 1
  :: else -> break
  od;
  assert(cancel_by_order_id_read.side == cancel_by_order_id_written.side);
  cancel_by_order_id_at = 0;
  do
  :: cancel_by_order_id_at < 8 -> assert(cancel_by_order_id_read.order_id[cancel_by_order_id_at] == cancel_by_order_id_written.order_id[cancel_by_order_id_at]); cancel_by_order_id_at = cancel_by_order_id_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Client Packet Header: encoded, read back, and compared */
proctype check_client_packet_header() {
  ClientPacketHeader client_packet_header_sent;
  ClientPacketHeader client_packet_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_client_packet_header(client_packet_header_sent, 0)
  :: pattern == 1 -> fill_client_packet_header(client_packet_header_sent, 32)
  :: pattern == 2 -> fill_client_packet_header(client_packet_header_sent, 255)
  :: else -> ramp_client_packet_header(client_packet_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_client_packet_header(client_packet_header_sent);
    assert(at == 3);
    at = 0;
    decode_client_packet_header(client_packet_header_got);
    assert(at == 3);
    equal_client_packet_header(client_packet_header_got, client_packet_header_sent)
  }
}

/* Login Request Packet: encoded, read back, and compared */
proctype check_login_request_packet() {
  LoginRequestPacket login_request_packet_sent;
  LoginRequestPacket login_request_packet_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_request_packet(login_request_packet_sent, 0)
  :: pattern == 1 -> fill_login_request_packet(login_request_packet_sent, 32)
  :: pattern == 2 -> fill_login_request_packet(login_request_packet_sent, 255)
  :: else -> ramp_login_request_packet(login_request_packet_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_request_packet(login_request_packet_sent);
    assert(at == 46);
    at = 0;
    decode_login_request_packet(login_request_packet_got);
    assert(at == 46);
    equal_login_request_packet(login_request_packet_got, login_request_packet_sent)
  }
}

/* Enter Order: encoded, read back, and compared */
proctype check_enter_order() {
  EnterOrder enter_order_sent;
  EnterOrder enter_order_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_enter_order(enter_order_sent, 0)
  :: pattern == 1 -> fill_enter_order(enter_order_sent, 32)
  :: pattern == 2 -> fill_enter_order(enter_order_sent, 255)
  :: else -> ramp_enter_order(enter_order_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_enter_order(enter_order_sent);
    assert(at == 113);
    at = 0;
    decode_enter_order(enter_order_got);
    assert(at == 113);
    equal_enter_order(enter_order_got, enter_order_sent)
  }
}

/* Replace Order: encoded, read back, and compared */
proctype check_replace_order() {
  ReplaceOrder replace_order_sent;
  ReplaceOrder replace_order_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_replace_order(replace_order_sent, 0)
  :: pattern == 1 -> fill_replace_order(replace_order_sent, 32)
  :: pattern == 2 -> fill_replace_order(replace_order_sent, 255)
  :: else -> ramp_replace_order(replace_order_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_replace_order(replace_order_sent);
    assert(at == 121);
    at = 0;
    decode_replace_order(replace_order_got);
    assert(at == 121);
    equal_replace_order(replace_order_got, replace_order_sent)
  }
}

/* Cancel Order: encoded, read back, and compared */
proctype check_cancel_order() {
  CancelOrder cancel_order_sent;
  CancelOrder cancel_order_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_order(cancel_order_sent, 0)
  :: pattern == 1 -> fill_cancel_order(cancel_order_sent, 32)
  :: pattern == 2 -> fill_cancel_order(cancel_order_sent, 255)
  :: else -> ramp_cancel_order(cancel_order_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_order(cancel_order_sent);
    assert(at == 14);
    at = 0;
    decode_cancel_order(cancel_order_got);
    assert(at == 14);
    equal_cancel_order(cancel_order_got, cancel_order_sent)
  }
}

/* Cancel By Order Id: encoded, read back, and compared */
proctype check_cancel_by_order_id() {
  CancelByOrderId cancel_by_order_id_sent;
  CancelByOrderId cancel_by_order_id_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_by_order_id(cancel_by_order_id_sent, 0)
  :: pattern == 1 -> fill_cancel_by_order_id(cancel_by_order_id_sent, 32)
  :: pattern == 2 -> fill_cancel_by_order_id(cancel_by_order_id_sent, 255)
  :: else -> ramp_cancel_by_order_id(cancel_by_order_id_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_by_order_id(cancel_by_order_id_sent);
    assert(at == 13);
    at = 0;
    decode_cancel_by_order_id(cancel_by_order_id_got);
    assert(at == 13);
    equal_cancel_by_order_id(cancel_by_order_id_got, cancel_by_order_id_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_client_packet_header()
  :: run check_login_request_packet()
  :: run check_enter_order()
  :: run check_replace_order()
  :: run check_cancel_order()
  :: run check_cancel_by_order_id()
  fi
}
