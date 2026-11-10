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
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 158

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

/* ---- Enter Order Message: 156 bytes ------------------------------------------ */

/* The Enter Order message is used to enter a new order into the market. The response to a successful Enter Order message is an Order Accepted message. If the order is rejected, the Order Rejected message will be returned. */
typedef EnterOrderMessage {
  byte order_token[14];
  byte order_book_id[4];
  byte side;
  byte quantity[8];
  byte price[4];
  byte time_in_force;
  byte open_close;
  byte client_account[10];
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

int enter_order_message_at;

/* every byte of Enter Order Message set to one value */
inline fill_enter_order_message(enter_order_message_record, enter_order_message_value) {
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 14 -> enter_order_message_record.order_token[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.order_book_id[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.side = enter_order_message_value;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> enter_order_message_record.quantity[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.price[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.time_in_force = enter_order_message_value;
  enter_order_message_record.open_close = enter_order_message_value;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> enter_order_message_record.client_account[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 15 -> enter_order_message_record.customer_info[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 32 -> enter_order_message_record.exchange_info[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.clearing_participant = enter_order_message_value;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.crossing_key[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.capacity_of_participant = enter_order_message_value;
  enter_order_message_record.directed_wholesale = enter_order_message_value;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.execution_venue[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> enter_order_message_record.intermediary_id[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 20 -> enter_order_message_record.order_origin[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> enter_order_message_record.filler[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.ouch_order_type = enter_order_message_value;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> enter_order_message_record.short_sell_quantity[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> enter_order_message_record.minimum_acceptable_quantity[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Enter Order Message set to where it lies, so a field read out of place says so */
inline ramp_enter_order_message(enter_order_message_record, enter_order_message_base) {
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 14 -> enter_order_message_record.order_token[enter_order_message_at] = (enter_order_message_base + 0 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.order_book_id[enter_order_message_at] = (enter_order_message_base + 14 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.side = (enter_order_message_base + 18 + 1) % 256;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> enter_order_message_record.quantity[enter_order_message_at] = (enter_order_message_base + 19 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.price[enter_order_message_at] = (enter_order_message_base + 27 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.time_in_force = (enter_order_message_base + 31 + 1) % 256;
  enter_order_message_record.open_close = (enter_order_message_base + 32 + 1) % 256;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> enter_order_message_record.client_account[enter_order_message_at] = (enter_order_message_base + 33 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 15 -> enter_order_message_record.customer_info[enter_order_message_at] = (enter_order_message_base + 43 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 32 -> enter_order_message_record.exchange_info[enter_order_message_at] = (enter_order_message_base + 58 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.clearing_participant = (enter_order_message_base + 90 + 1) % 256;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.crossing_key[enter_order_message_at] = (enter_order_message_base + 91 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.capacity_of_participant = (enter_order_message_base + 95 + 1) % 256;
  enter_order_message_record.directed_wholesale = (enter_order_message_base + 96 + 1) % 256;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.execution_venue[enter_order_message_at] = (enter_order_message_base + 97 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> enter_order_message_record.intermediary_id[enter_order_message_at] = (enter_order_message_base + 101 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 20 -> enter_order_message_record.order_origin[enter_order_message_at] = (enter_order_message_base + 111 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> enter_order_message_record.filler[enter_order_message_at] = (enter_order_message_base + 131 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.ouch_order_type = (enter_order_message_base + 139 + 1) % 256;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> enter_order_message_record.short_sell_quantity[enter_order_message_at] = (enter_order_message_base + 140 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> enter_order_message_record.minimum_acceptable_quantity[enter_order_message_at] = (enter_order_message_base + 148 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Enter Order Message to the wire, 156 bytes from where the cursor stands */
inline encode_enter_order_message(enter_order_message_record) {
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 14 -> wire[at] = enter_order_message_record.order_token[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> wire[at] = enter_order_message_record.order_book_id[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  wire[at] = enter_order_message_record.side; at = at + 1;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> wire[at] = enter_order_message_record.quantity[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> wire[at] = enter_order_message_record.price[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  wire[at] = enter_order_message_record.time_in_force; at = at + 1;
  wire[at] = enter_order_message_record.open_close; at = at + 1;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> wire[at] = enter_order_message_record.client_account[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 15 -> wire[at] = enter_order_message_record.customer_info[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 32 -> wire[at] = enter_order_message_record.exchange_info[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  wire[at] = enter_order_message_record.clearing_participant; at = at + 1;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> wire[at] = enter_order_message_record.crossing_key[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  wire[at] = enter_order_message_record.capacity_of_participant; at = at + 1;
  wire[at] = enter_order_message_record.directed_wholesale; at = at + 1;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> wire[at] = enter_order_message_record.execution_venue[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> wire[at] = enter_order_message_record.intermediary_id[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 20 -> wire[at] = enter_order_message_record.order_origin[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> wire[at] = enter_order_message_record.filler[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  wire[at] = enter_order_message_record.ouch_order_type; at = at + 1;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> wire[at] = enter_order_message_record.short_sell_quantity[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> wire[at] = enter_order_message_record.minimum_acceptable_quantity[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Enter Order Message off the wire, 156 bytes from where the cursor stands */
inline decode_enter_order_message(enter_order_message_record) {
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 14 -> enter_order_message_record.order_token[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.order_book_id[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.side = wire[at]; at = at + 1;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> enter_order_message_record.quantity[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.price[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.time_in_force = wire[at]; at = at + 1;
  enter_order_message_record.open_close = wire[at]; at = at + 1;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> enter_order_message_record.client_account[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 15 -> enter_order_message_record.customer_info[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 32 -> enter_order_message_record.exchange_info[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.clearing_participant = wire[at]; at = at + 1;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.crossing_key[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.capacity_of_participant = wire[at]; at = at + 1;
  enter_order_message_record.directed_wholesale = wire[at]; at = at + 1;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.execution_venue[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> enter_order_message_record.intermediary_id[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 20 -> enter_order_message_record.order_origin[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> enter_order_message_record.filler[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.ouch_order_type = wire[at]; at = at + 1;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> enter_order_message_record.short_sell_quantity[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> enter_order_message_record.minimum_acceptable_quantity[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Enter Order Message is what was written, byte for byte */
inline equal_enter_order_message(enter_order_message_read, enter_order_message_written) {
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 14 -> assert(enter_order_message_read.order_token[enter_order_message_at] == enter_order_message_written.order_token[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> assert(enter_order_message_read.order_book_id[enter_order_message_at] == enter_order_message_written.order_book_id[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  assert(enter_order_message_read.side == enter_order_message_written.side);
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> assert(enter_order_message_read.quantity[enter_order_message_at] == enter_order_message_written.quantity[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> assert(enter_order_message_read.price[enter_order_message_at] == enter_order_message_written.price[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  assert(enter_order_message_read.time_in_force == enter_order_message_written.time_in_force);
  assert(enter_order_message_read.open_close == enter_order_message_written.open_close);
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> assert(enter_order_message_read.client_account[enter_order_message_at] == enter_order_message_written.client_account[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 15 -> assert(enter_order_message_read.customer_info[enter_order_message_at] == enter_order_message_written.customer_info[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 32 -> assert(enter_order_message_read.exchange_info[enter_order_message_at] == enter_order_message_written.exchange_info[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  assert(enter_order_message_read.clearing_participant == enter_order_message_written.clearing_participant);
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> assert(enter_order_message_read.crossing_key[enter_order_message_at] == enter_order_message_written.crossing_key[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  assert(enter_order_message_read.capacity_of_participant == enter_order_message_written.capacity_of_participant);
  assert(enter_order_message_read.directed_wholesale == enter_order_message_written.directed_wholesale);
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> assert(enter_order_message_read.execution_venue[enter_order_message_at] == enter_order_message_written.execution_venue[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> assert(enter_order_message_read.intermediary_id[enter_order_message_at] == enter_order_message_written.intermediary_id[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 20 -> assert(enter_order_message_read.order_origin[enter_order_message_at] == enter_order_message_written.order_origin[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> assert(enter_order_message_read.filler[enter_order_message_at] == enter_order_message_written.filler[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  assert(enter_order_message_read.ouch_order_type == enter_order_message_written.ouch_order_type);
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> assert(enter_order_message_read.short_sell_quantity[enter_order_message_at] == enter_order_message_written.short_sell_quantity[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> assert(enter_order_message_read.minimum_acceptable_quantity[enter_order_message_at] == enter_order_message_written.minimum_acceptable_quantity[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Replace Order Message: 158 bytes ---------------------------------------- */

/* The Replace Order message is used to amend an existing order that was entered with ASX Trade OUCH. The response to a successful Replace Order message is an Order Replaced message. If the amendment is rejected, the Order Rejected message will be returned. */
typedef ReplaceOrderMessage {
  byte existing_order_token[14];
  byte replacement_order_token[14];
  byte quantity[8];
  byte price[4];
  byte open_close;
  byte client_account[10];
  byte customer_info[15];
  byte exchange_info[32];
  byte capacity_of_participant;
  byte directed_wholesale;
  byte execution_venue[4];
  byte intermediary_id[10];
  byte order_origin[20];
  byte filler[8];
  byte short_sell_quantity[8];
  byte minimum_acceptable_quantity[8]
};

int replace_order_message_at;

/* every byte of Replace Order Message set to one value */
inline fill_replace_order_message(replace_order_message_record, replace_order_message_value) {
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 14 -> replace_order_message_record.existing_order_token[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 14 -> replace_order_message_record.replacement_order_token[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.quantity[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.price[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_record.open_close = replace_order_message_value;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 10 -> replace_order_message_record.client_account[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 15 -> replace_order_message_record.customer_info[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 32 -> replace_order_message_record.exchange_info[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_record.capacity_of_participant = replace_order_message_value;
  replace_order_message_record.directed_wholesale = replace_order_message_value;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.execution_venue[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 10 -> replace_order_message_record.intermediary_id[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 20 -> replace_order_message_record.order_origin[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.filler[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.short_sell_quantity[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.minimum_acceptable_quantity[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Replace Order Message set to where it lies, so a field read out of place says so */
inline ramp_replace_order_message(replace_order_message_record, replace_order_message_base) {
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 14 -> replace_order_message_record.existing_order_token[replace_order_message_at] = (replace_order_message_base + 0 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 14 -> replace_order_message_record.replacement_order_token[replace_order_message_at] = (replace_order_message_base + 14 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.quantity[replace_order_message_at] = (replace_order_message_base + 28 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.price[replace_order_message_at] = (replace_order_message_base + 36 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_record.open_close = (replace_order_message_base + 40 + 1) % 256;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 10 -> replace_order_message_record.client_account[replace_order_message_at] = (replace_order_message_base + 41 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 15 -> replace_order_message_record.customer_info[replace_order_message_at] = (replace_order_message_base + 51 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 32 -> replace_order_message_record.exchange_info[replace_order_message_at] = (replace_order_message_base + 66 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_record.capacity_of_participant = (replace_order_message_base + 98 + 1) % 256;
  replace_order_message_record.directed_wholesale = (replace_order_message_base + 99 + 1) % 256;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.execution_venue[replace_order_message_at] = (replace_order_message_base + 100 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 10 -> replace_order_message_record.intermediary_id[replace_order_message_at] = (replace_order_message_base + 104 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 20 -> replace_order_message_record.order_origin[replace_order_message_at] = (replace_order_message_base + 114 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.filler[replace_order_message_at] = (replace_order_message_base + 134 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.short_sell_quantity[replace_order_message_at] = (replace_order_message_base + 142 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.minimum_acceptable_quantity[replace_order_message_at] = (replace_order_message_base + 150 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replace Order Message to the wire, 158 bytes from where the cursor stands */
inline encode_replace_order_message(replace_order_message_record) {
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 14 -> wire[at] = replace_order_message_record.existing_order_token[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 14 -> wire[at] = replace_order_message_record.replacement_order_token[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> wire[at] = replace_order_message_record.quantity[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> wire[at] = replace_order_message_record.price[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  wire[at] = replace_order_message_record.open_close; at = at + 1;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 10 -> wire[at] = replace_order_message_record.client_account[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 15 -> wire[at] = replace_order_message_record.customer_info[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 32 -> wire[at] = replace_order_message_record.exchange_info[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  wire[at] = replace_order_message_record.capacity_of_participant; at = at + 1;
  wire[at] = replace_order_message_record.directed_wholesale; at = at + 1;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> wire[at] = replace_order_message_record.execution_venue[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 10 -> wire[at] = replace_order_message_record.intermediary_id[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 20 -> wire[at] = replace_order_message_record.order_origin[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> wire[at] = replace_order_message_record.filler[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> wire[at] = replace_order_message_record.short_sell_quantity[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> wire[at] = replace_order_message_record.minimum_acceptable_quantity[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replace Order Message off the wire, 158 bytes from where the cursor stands */
inline decode_replace_order_message(replace_order_message_record) {
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 14 -> replace_order_message_record.existing_order_token[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 14 -> replace_order_message_record.replacement_order_token[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.quantity[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.price[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_record.open_close = wire[at]; at = at + 1;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 10 -> replace_order_message_record.client_account[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 15 -> replace_order_message_record.customer_info[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 32 -> replace_order_message_record.exchange_info[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_record.capacity_of_participant = wire[at]; at = at + 1;
  replace_order_message_record.directed_wholesale = wire[at]; at = at + 1;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.execution_venue[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 10 -> replace_order_message_record.intermediary_id[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 20 -> replace_order_message_record.order_origin[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.filler[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.short_sell_quantity[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.minimum_acceptable_quantity[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Replace Order Message is what was written, byte for byte */
inline equal_replace_order_message(replace_order_message_read, replace_order_message_written) {
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 14 -> assert(replace_order_message_read.existing_order_token[replace_order_message_at] == replace_order_message_written.existing_order_token[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 14 -> assert(replace_order_message_read.replacement_order_token[replace_order_message_at] == replace_order_message_written.replacement_order_token[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> assert(replace_order_message_read.quantity[replace_order_message_at] == replace_order_message_written.quantity[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> assert(replace_order_message_read.price[replace_order_message_at] == replace_order_message_written.price[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  assert(replace_order_message_read.open_close == replace_order_message_written.open_close);
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 10 -> assert(replace_order_message_read.client_account[replace_order_message_at] == replace_order_message_written.client_account[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 15 -> assert(replace_order_message_read.customer_info[replace_order_message_at] == replace_order_message_written.customer_info[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 32 -> assert(replace_order_message_read.exchange_info[replace_order_message_at] == replace_order_message_written.exchange_info[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  assert(replace_order_message_read.capacity_of_participant == replace_order_message_written.capacity_of_participant);
  assert(replace_order_message_read.directed_wholesale == replace_order_message_written.directed_wholesale);
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> assert(replace_order_message_read.execution_venue[replace_order_message_at] == replace_order_message_written.execution_venue[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 10 -> assert(replace_order_message_read.intermediary_id[replace_order_message_at] == replace_order_message_written.intermediary_id[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 20 -> assert(replace_order_message_read.order_origin[replace_order_message_at] == replace_order_message_written.order_origin[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> assert(replace_order_message_read.filler[replace_order_message_at] == replace_order_message_written.filler[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> assert(replace_order_message_read.short_sell_quantity[replace_order_message_at] == replace_order_message_written.short_sell_quantity[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> assert(replace_order_message_read.minimum_acceptable_quantity[replace_order_message_at] == replace_order_message_written.minimum_acceptable_quantity[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel Order Message: 14 bytes ------------------------------------------ */

/* The Cancel Order message is used to cancel an existing order that was entered with ASX Trade OUCH, using the order token to identify the order being cancelled. The response to a successful Cancel Order message is an Order Cancelled message. If the cancellation is rejected, the Order Rejected message will be returned. */
typedef CancelOrderMessage {
  byte order_token[14]
};

int cancel_order_message_at;

/* every byte of Cancel Order Message set to one value */
inline fill_cancel_order_message(cancel_order_message_record, cancel_order_message_value) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 14 -> cancel_order_message_record.order_token[cancel_order_message_at] = cancel_order_message_value; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Order Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_order_message(cancel_order_message_record, cancel_order_message_base) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 14 -> cancel_order_message_record.order_token[cancel_order_message_at] = (cancel_order_message_base + 0 + cancel_order_message_at + 1) % 256; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Message to the wire, 14 bytes from where the cursor stands */
inline encode_cancel_order_message(cancel_order_message_record) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 14 -> wire[at] = cancel_order_message_record.order_token[cancel_order_message_at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Message off the wire, 14 bytes from where the cursor stands */
inline decode_cancel_order_message(cancel_order_message_record) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 14 -> cancel_order_message_record.order_token[cancel_order_message_at] = wire[at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Order Message is what was written, byte for byte */
inline equal_cancel_order_message(cancel_order_message_read, cancel_order_message_written) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 14 -> assert(cancel_order_message_read.order_token[cancel_order_message_at] == cancel_order_message_written.order_token[cancel_order_message_at]); cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel By Order Id Message: 13 bytes ------------------------------------ */

/* The Cancel By Order ID message is used to cancel an existing own customer order that was entered with ASX Trade OUCH or another protocol (for example the OMNet API), using the order ID to identify the order being cancelled. The response to a successful Cancel By Order ID message is an Order Cancelled message. If the cancellation is rejected, the Order Rejected message will be returned. */
typedef CancelByOrderIdMessage {
  byte order_book_id[4];
  byte side;
  byte order_id[8]
};

int cancel_by_order_id_message_at;

/* every byte of Cancel By Order Id Message set to one value */
inline fill_cancel_by_order_id_message(cancel_by_order_id_message_record, cancel_by_order_id_message_value) {
  cancel_by_order_id_message_at = 0;
  do
  :: cancel_by_order_id_message_at < 4 -> cancel_by_order_id_message_record.order_book_id[cancel_by_order_id_message_at] = cancel_by_order_id_message_value; cancel_by_order_id_message_at = cancel_by_order_id_message_at + 1
  :: else -> break
  od;
  cancel_by_order_id_message_record.side = cancel_by_order_id_message_value;
  cancel_by_order_id_message_at = 0;
  do
  :: cancel_by_order_id_message_at < 8 -> cancel_by_order_id_message_record.order_id[cancel_by_order_id_message_at] = cancel_by_order_id_message_value; cancel_by_order_id_message_at = cancel_by_order_id_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel By Order Id Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_by_order_id_message(cancel_by_order_id_message_record, cancel_by_order_id_message_base) {
  cancel_by_order_id_message_at = 0;
  do
  :: cancel_by_order_id_message_at < 4 -> cancel_by_order_id_message_record.order_book_id[cancel_by_order_id_message_at] = (cancel_by_order_id_message_base + 0 + cancel_by_order_id_message_at + 1) % 256; cancel_by_order_id_message_at = cancel_by_order_id_message_at + 1
  :: else -> break
  od;
  cancel_by_order_id_message_record.side = (cancel_by_order_id_message_base + 4 + 1) % 256;
  cancel_by_order_id_message_at = 0;
  do
  :: cancel_by_order_id_message_at < 8 -> cancel_by_order_id_message_record.order_id[cancel_by_order_id_message_at] = (cancel_by_order_id_message_base + 5 + cancel_by_order_id_message_at + 1) % 256; cancel_by_order_id_message_at = cancel_by_order_id_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel By Order Id Message to the wire, 13 bytes from where the cursor stands */
inline encode_cancel_by_order_id_message(cancel_by_order_id_message_record) {
  cancel_by_order_id_message_at = 0;
  do
  :: cancel_by_order_id_message_at < 4 -> wire[at] = cancel_by_order_id_message_record.order_book_id[cancel_by_order_id_message_at]; at = at + 1; cancel_by_order_id_message_at = cancel_by_order_id_message_at + 1
  :: else -> break
  od;
  wire[at] = cancel_by_order_id_message_record.side; at = at + 1;
  cancel_by_order_id_message_at = 0;
  do
  :: cancel_by_order_id_message_at < 8 -> wire[at] = cancel_by_order_id_message_record.order_id[cancel_by_order_id_message_at]; at = at + 1; cancel_by_order_id_message_at = cancel_by_order_id_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel By Order Id Message off the wire, 13 bytes from where the cursor stands */
inline decode_cancel_by_order_id_message(cancel_by_order_id_message_record) {
  cancel_by_order_id_message_at = 0;
  do
  :: cancel_by_order_id_message_at < 4 -> cancel_by_order_id_message_record.order_book_id[cancel_by_order_id_message_at] = wire[at]; at = at + 1; cancel_by_order_id_message_at = cancel_by_order_id_message_at + 1
  :: else -> break
  od;
  cancel_by_order_id_message_record.side = wire[at]; at = at + 1;
  cancel_by_order_id_message_at = 0;
  do
  :: cancel_by_order_id_message_at < 8 -> cancel_by_order_id_message_record.order_id[cancel_by_order_id_message_at] = wire[at]; at = at + 1; cancel_by_order_id_message_at = cancel_by_order_id_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel By Order Id Message is what was written, byte for byte */
inline equal_cancel_by_order_id_message(cancel_by_order_id_message_read, cancel_by_order_id_message_written) {
  cancel_by_order_id_message_at = 0;
  do
  :: cancel_by_order_id_message_at < 4 -> assert(cancel_by_order_id_message_read.order_book_id[cancel_by_order_id_message_at] == cancel_by_order_id_message_written.order_book_id[cancel_by_order_id_message_at]); cancel_by_order_id_message_at = cancel_by_order_id_message_at + 1
  :: else -> break
  od;
  assert(cancel_by_order_id_message_read.side == cancel_by_order_id_message_written.side);
  cancel_by_order_id_message_at = 0;
  do
  :: cancel_by_order_id_message_at < 8 -> assert(cancel_by_order_id_message_read.order_id[cancel_by_order_id_message_at] == cancel_by_order_id_message_written.order_id[cancel_by_order_id_message_at]); cancel_by_order_id_message_at = cancel_by_order_id_message_at + 1
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

/* Enter Order Message: encoded, read back, and compared */
proctype check_enter_order_message() {
  EnterOrderMessage enter_order_message_sent;
  EnterOrderMessage enter_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_enter_order_message(enter_order_message_sent, 0)
  :: pattern == 1 -> fill_enter_order_message(enter_order_message_sent, 32)
  :: pattern == 2 -> fill_enter_order_message(enter_order_message_sent, 255)
  :: else -> ramp_enter_order_message(enter_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_enter_order_message(enter_order_message_sent);
    assert(at == 156);
    at = 0;
    decode_enter_order_message(enter_order_message_got);
    assert(at == 156);
    equal_enter_order_message(enter_order_message_got, enter_order_message_sent)
  }
}

/* Replace Order Message: encoded, read back, and compared */
proctype check_replace_order_message() {
  ReplaceOrderMessage replace_order_message_sent;
  ReplaceOrderMessage replace_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_replace_order_message(replace_order_message_sent, 0)
  :: pattern == 1 -> fill_replace_order_message(replace_order_message_sent, 32)
  :: pattern == 2 -> fill_replace_order_message(replace_order_message_sent, 255)
  :: else -> ramp_replace_order_message(replace_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_replace_order_message(replace_order_message_sent);
    assert(at == 158);
    at = 0;
    decode_replace_order_message(replace_order_message_got);
    assert(at == 158);
    equal_replace_order_message(replace_order_message_got, replace_order_message_sent)
  }
}

/* Cancel Order Message: encoded, read back, and compared */
proctype check_cancel_order_message() {
  CancelOrderMessage cancel_order_message_sent;
  CancelOrderMessage cancel_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_order_message(cancel_order_message_sent, 0)
  :: pattern == 1 -> fill_cancel_order_message(cancel_order_message_sent, 32)
  :: pattern == 2 -> fill_cancel_order_message(cancel_order_message_sent, 255)
  :: else -> ramp_cancel_order_message(cancel_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_order_message(cancel_order_message_sent);
    assert(at == 14);
    at = 0;
    decode_cancel_order_message(cancel_order_message_got);
    assert(at == 14);
    equal_cancel_order_message(cancel_order_message_got, cancel_order_message_sent)
  }
}

/* Cancel By Order Id Message: encoded, read back, and compared */
proctype check_cancel_by_order_id_message() {
  CancelByOrderIdMessage cancel_by_order_id_message_sent;
  CancelByOrderIdMessage cancel_by_order_id_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_by_order_id_message(cancel_by_order_id_message_sent, 0)
  :: pattern == 1 -> fill_cancel_by_order_id_message(cancel_by_order_id_message_sent, 32)
  :: pattern == 2 -> fill_cancel_by_order_id_message(cancel_by_order_id_message_sent, 255)
  :: else -> ramp_cancel_by_order_id_message(cancel_by_order_id_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_by_order_id_message(cancel_by_order_id_message_sent);
    assert(at == 13);
    at = 0;
    decode_cancel_by_order_id_message(cancel_by_order_id_message_got);
    assert(at == 13);
    equal_cancel_by_order_id_message(cancel_by_order_id_message_got, cancel_by_order_id_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_client_packet_header()
  :: run check_login_request_packet()
  :: run check_enter_order_message()
  :: run check_replace_order_message()
  :: run check_cancel_order_message()
  :: run check_cancel_by_order_id_message()
  fi
}
