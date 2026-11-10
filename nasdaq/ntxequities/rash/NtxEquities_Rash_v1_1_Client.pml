/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Rash
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
#define WIRE 142

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

/* ---- Enter Order Message: 138 bytes ------------------------------------------ */

/* The Enter Order Message lets you enter a new order. Each new order must have a Token that is unique to the day and that logical RASH Port account. If you send a valid order, you should receive an Accepted Order Message. */
typedef EnterOrderMessage {
  byte order_token_client_order_id[14];
  byte side;
  byte shares_order_qty[6];
  byte stock_symbol[8];
  byte price[10];
  byte time_in_force[5];
  byte firm_client_id[4];
  byte display;
  byte min_qty[6];
  byte max_floor[6];
  byte peg_type;
  byte peg_difference_sign;
  byte peg_difference[10];
  byte discretion_price[10];
  byte discretion_peg_type;
  byte discretion_peg_difference_sign;
  byte discretion_peg_difference[10];
  byte capacity_rule_80_a_indicator;
  byte random_reserve[6];
  byte route_dest_exec_broker[4];
  byte cust_terminal_id_sender_sub_id[32]
};

int enter_order_message_at;

/* every byte of Enter Order Message set to one value */
inline fill_enter_order_message(enter_order_message_record, enter_order_message_value) {
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 14 -> enter_order_message_record.order_token_client_order_id[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.side = enter_order_message_value;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 6 -> enter_order_message_record.shares_order_qty[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> enter_order_message_record.stock_symbol[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> enter_order_message_record.price[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 5 -> enter_order_message_record.time_in_force[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.firm_client_id[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.display = enter_order_message_value;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 6 -> enter_order_message_record.min_qty[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 6 -> enter_order_message_record.max_floor[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.peg_type = enter_order_message_value;
  enter_order_message_record.peg_difference_sign = enter_order_message_value;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> enter_order_message_record.peg_difference[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> enter_order_message_record.discretion_price[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.discretion_peg_type = enter_order_message_value;
  enter_order_message_record.discretion_peg_difference_sign = enter_order_message_value;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> enter_order_message_record.discretion_peg_difference[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.capacity_rule_80_a_indicator = enter_order_message_value;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 6 -> enter_order_message_record.random_reserve[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.route_dest_exec_broker[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 32 -> enter_order_message_record.cust_terminal_id_sender_sub_id[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Enter Order Message set to where it lies, so a field read out of place says so */
inline ramp_enter_order_message(enter_order_message_record, enter_order_message_base) {
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 14 -> enter_order_message_record.order_token_client_order_id[enter_order_message_at] = (enter_order_message_base + 0 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.side = (enter_order_message_base + 14 + 1) % 256;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 6 -> enter_order_message_record.shares_order_qty[enter_order_message_at] = (enter_order_message_base + 15 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> enter_order_message_record.stock_symbol[enter_order_message_at] = (enter_order_message_base + 21 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> enter_order_message_record.price[enter_order_message_at] = (enter_order_message_base + 29 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 5 -> enter_order_message_record.time_in_force[enter_order_message_at] = (enter_order_message_base + 39 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.firm_client_id[enter_order_message_at] = (enter_order_message_base + 44 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.display = (enter_order_message_base + 48 + 1) % 256;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 6 -> enter_order_message_record.min_qty[enter_order_message_at] = (enter_order_message_base + 49 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 6 -> enter_order_message_record.max_floor[enter_order_message_at] = (enter_order_message_base + 55 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.peg_type = (enter_order_message_base + 61 + 1) % 256;
  enter_order_message_record.peg_difference_sign = (enter_order_message_base + 62 + 1) % 256;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> enter_order_message_record.peg_difference[enter_order_message_at] = (enter_order_message_base + 63 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> enter_order_message_record.discretion_price[enter_order_message_at] = (enter_order_message_base + 73 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.discretion_peg_type = (enter_order_message_base + 83 + 1) % 256;
  enter_order_message_record.discretion_peg_difference_sign = (enter_order_message_base + 84 + 1) % 256;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> enter_order_message_record.discretion_peg_difference[enter_order_message_at] = (enter_order_message_base + 85 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.capacity_rule_80_a_indicator = (enter_order_message_base + 95 + 1) % 256;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 6 -> enter_order_message_record.random_reserve[enter_order_message_at] = (enter_order_message_base + 96 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.route_dest_exec_broker[enter_order_message_at] = (enter_order_message_base + 102 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 32 -> enter_order_message_record.cust_terminal_id_sender_sub_id[enter_order_message_at] = (enter_order_message_base + 106 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Enter Order Message to the wire, 138 bytes from where the cursor stands */
inline encode_enter_order_message(enter_order_message_record) {
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 14 -> wire[at] = enter_order_message_record.order_token_client_order_id[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  wire[at] = enter_order_message_record.side; at = at + 1;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 6 -> wire[at] = enter_order_message_record.shares_order_qty[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> wire[at] = enter_order_message_record.stock_symbol[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> wire[at] = enter_order_message_record.price[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 5 -> wire[at] = enter_order_message_record.time_in_force[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> wire[at] = enter_order_message_record.firm_client_id[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  wire[at] = enter_order_message_record.display; at = at + 1;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 6 -> wire[at] = enter_order_message_record.min_qty[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 6 -> wire[at] = enter_order_message_record.max_floor[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  wire[at] = enter_order_message_record.peg_type; at = at + 1;
  wire[at] = enter_order_message_record.peg_difference_sign; at = at + 1;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> wire[at] = enter_order_message_record.peg_difference[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> wire[at] = enter_order_message_record.discretion_price[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  wire[at] = enter_order_message_record.discretion_peg_type; at = at + 1;
  wire[at] = enter_order_message_record.discretion_peg_difference_sign; at = at + 1;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> wire[at] = enter_order_message_record.discretion_peg_difference[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  wire[at] = enter_order_message_record.capacity_rule_80_a_indicator; at = at + 1;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 6 -> wire[at] = enter_order_message_record.random_reserve[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> wire[at] = enter_order_message_record.route_dest_exec_broker[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 32 -> wire[at] = enter_order_message_record.cust_terminal_id_sender_sub_id[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Enter Order Message off the wire, 138 bytes from where the cursor stands */
inline decode_enter_order_message(enter_order_message_record) {
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 14 -> enter_order_message_record.order_token_client_order_id[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.side = wire[at]; at = at + 1;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 6 -> enter_order_message_record.shares_order_qty[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> enter_order_message_record.stock_symbol[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> enter_order_message_record.price[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 5 -> enter_order_message_record.time_in_force[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.firm_client_id[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.display = wire[at]; at = at + 1;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 6 -> enter_order_message_record.min_qty[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 6 -> enter_order_message_record.max_floor[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.peg_type = wire[at]; at = at + 1;
  enter_order_message_record.peg_difference_sign = wire[at]; at = at + 1;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> enter_order_message_record.peg_difference[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> enter_order_message_record.discretion_price[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.discretion_peg_type = wire[at]; at = at + 1;
  enter_order_message_record.discretion_peg_difference_sign = wire[at]; at = at + 1;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> enter_order_message_record.discretion_peg_difference[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.capacity_rule_80_a_indicator = wire[at]; at = at + 1;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 6 -> enter_order_message_record.random_reserve[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.route_dest_exec_broker[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 32 -> enter_order_message_record.cust_terminal_id_sender_sub_id[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Enter Order Message is what was written, byte for byte */
inline equal_enter_order_message(enter_order_message_read, enter_order_message_written) {
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 14 -> assert(enter_order_message_read.order_token_client_order_id[enter_order_message_at] == enter_order_message_written.order_token_client_order_id[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  assert(enter_order_message_read.side == enter_order_message_written.side);
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 6 -> assert(enter_order_message_read.shares_order_qty[enter_order_message_at] == enter_order_message_written.shares_order_qty[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> assert(enter_order_message_read.stock_symbol[enter_order_message_at] == enter_order_message_written.stock_symbol[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> assert(enter_order_message_read.price[enter_order_message_at] == enter_order_message_written.price[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 5 -> assert(enter_order_message_read.time_in_force[enter_order_message_at] == enter_order_message_written.time_in_force[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> assert(enter_order_message_read.firm_client_id[enter_order_message_at] == enter_order_message_written.firm_client_id[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  assert(enter_order_message_read.display == enter_order_message_written.display);
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 6 -> assert(enter_order_message_read.min_qty[enter_order_message_at] == enter_order_message_written.min_qty[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 6 -> assert(enter_order_message_read.max_floor[enter_order_message_at] == enter_order_message_written.max_floor[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  assert(enter_order_message_read.peg_type == enter_order_message_written.peg_type);
  assert(enter_order_message_read.peg_difference_sign == enter_order_message_written.peg_difference_sign);
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> assert(enter_order_message_read.peg_difference[enter_order_message_at] == enter_order_message_written.peg_difference[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> assert(enter_order_message_read.discretion_price[enter_order_message_at] == enter_order_message_written.discretion_price[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  assert(enter_order_message_read.discretion_peg_type == enter_order_message_written.discretion_peg_type);
  assert(enter_order_message_read.discretion_peg_difference_sign == enter_order_message_written.discretion_peg_difference_sign);
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 10 -> assert(enter_order_message_read.discretion_peg_difference[enter_order_message_at] == enter_order_message_written.discretion_peg_difference[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  assert(enter_order_message_read.capacity_rule_80_a_indicator == enter_order_message_written.capacity_rule_80_a_indicator);
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 6 -> assert(enter_order_message_read.random_reserve[enter_order_message_at] == enter_order_message_written.random_reserve[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> assert(enter_order_message_read.route_dest_exec_broker[enter_order_message_at] == enter_order_message_written.route_dest_exec_broker[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 32 -> assert(enter_order_message_read.cust_terminal_id_sender_sub_id[enter_order_message_at] == enter_order_message_written.cust_terminal_id_sender_sub_id[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Enter Order Message With Cross Functionality: 142 bytes ----------------- */

/* Enters orders in much the same way as the Enter Order Message, with a few additional fields. Notably, the Cross Type Flag allows you to specify that an order begins participation in a cross. */
typedef EnterOrderMessageWithCrossFunctionality {
  byte order_token_client_order_id[14];
  byte side;
  byte shares_order_qty[6];
  byte stock_symbol[8];
  byte price[10];
  byte time_in_force[5];
  byte firm_client_id[4];
  byte display;
  byte min_qty[6];
  byte max_floor[6];
  byte peg_type;
  byte peg_difference_sign;
  byte peg_difference[10];
  byte discretion_price[10];
  byte discretion_peg_type;
  byte discretion_peg_difference_sign;
  byte discretion_peg_difference[10];
  byte capacity_rule_80_a_indicator;
  byte random_reserve[6];
  byte route_dest_exec_broker[4];
  byte cust_terminal_id_sender_sub_id[32];
  byte inter_market_sweep_eligibility;
  byte cross_type;
  byte customer_type;
  byte reactive_trade_now
};

int enter_order_message_with_cross_functionality_at;

/* every byte of Enter Order Message With Cross Functionality set to one value */
inline fill_enter_order_message_with_cross_functionality(enter_order_message_with_cross_functionality_record, enter_order_message_with_cross_functionality_value) {
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 14 -> enter_order_message_with_cross_functionality_record.order_token_client_order_id[enter_order_message_with_cross_functionality_at] = enter_order_message_with_cross_functionality_value; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_record.side = enter_order_message_with_cross_functionality_value;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 6 -> enter_order_message_with_cross_functionality_record.shares_order_qty[enter_order_message_with_cross_functionality_at] = enter_order_message_with_cross_functionality_value; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 8 -> enter_order_message_with_cross_functionality_record.stock_symbol[enter_order_message_with_cross_functionality_at] = enter_order_message_with_cross_functionality_value; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 10 -> enter_order_message_with_cross_functionality_record.price[enter_order_message_with_cross_functionality_at] = enter_order_message_with_cross_functionality_value; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 5 -> enter_order_message_with_cross_functionality_record.time_in_force[enter_order_message_with_cross_functionality_at] = enter_order_message_with_cross_functionality_value; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 4 -> enter_order_message_with_cross_functionality_record.firm_client_id[enter_order_message_with_cross_functionality_at] = enter_order_message_with_cross_functionality_value; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_record.display = enter_order_message_with_cross_functionality_value;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 6 -> enter_order_message_with_cross_functionality_record.min_qty[enter_order_message_with_cross_functionality_at] = enter_order_message_with_cross_functionality_value; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 6 -> enter_order_message_with_cross_functionality_record.max_floor[enter_order_message_with_cross_functionality_at] = enter_order_message_with_cross_functionality_value; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_record.peg_type = enter_order_message_with_cross_functionality_value;
  enter_order_message_with_cross_functionality_record.peg_difference_sign = enter_order_message_with_cross_functionality_value;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 10 -> enter_order_message_with_cross_functionality_record.peg_difference[enter_order_message_with_cross_functionality_at] = enter_order_message_with_cross_functionality_value; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 10 -> enter_order_message_with_cross_functionality_record.discretion_price[enter_order_message_with_cross_functionality_at] = enter_order_message_with_cross_functionality_value; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_record.discretion_peg_type = enter_order_message_with_cross_functionality_value;
  enter_order_message_with_cross_functionality_record.discretion_peg_difference_sign = enter_order_message_with_cross_functionality_value;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 10 -> enter_order_message_with_cross_functionality_record.discretion_peg_difference[enter_order_message_with_cross_functionality_at] = enter_order_message_with_cross_functionality_value; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_record.capacity_rule_80_a_indicator = enter_order_message_with_cross_functionality_value;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 6 -> enter_order_message_with_cross_functionality_record.random_reserve[enter_order_message_with_cross_functionality_at] = enter_order_message_with_cross_functionality_value; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 4 -> enter_order_message_with_cross_functionality_record.route_dest_exec_broker[enter_order_message_with_cross_functionality_at] = enter_order_message_with_cross_functionality_value; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 32 -> enter_order_message_with_cross_functionality_record.cust_terminal_id_sender_sub_id[enter_order_message_with_cross_functionality_at] = enter_order_message_with_cross_functionality_value; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_record.inter_market_sweep_eligibility = enter_order_message_with_cross_functionality_value;
  enter_order_message_with_cross_functionality_record.cross_type = enter_order_message_with_cross_functionality_value;
  enter_order_message_with_cross_functionality_record.customer_type = enter_order_message_with_cross_functionality_value;
  enter_order_message_with_cross_functionality_record.reactive_trade_now = enter_order_message_with_cross_functionality_value;
  skip
}

/* each byte of Enter Order Message With Cross Functionality set to where it lies, so a field read out of place says so */
inline ramp_enter_order_message_with_cross_functionality(enter_order_message_with_cross_functionality_record, enter_order_message_with_cross_functionality_base) {
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 14 -> enter_order_message_with_cross_functionality_record.order_token_client_order_id[enter_order_message_with_cross_functionality_at] = (enter_order_message_with_cross_functionality_base + 0 + enter_order_message_with_cross_functionality_at + 1) % 256; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_record.side = (enter_order_message_with_cross_functionality_base + 14 + 1) % 256;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 6 -> enter_order_message_with_cross_functionality_record.shares_order_qty[enter_order_message_with_cross_functionality_at] = (enter_order_message_with_cross_functionality_base + 15 + enter_order_message_with_cross_functionality_at + 1) % 256; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 8 -> enter_order_message_with_cross_functionality_record.stock_symbol[enter_order_message_with_cross_functionality_at] = (enter_order_message_with_cross_functionality_base + 21 + enter_order_message_with_cross_functionality_at + 1) % 256; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 10 -> enter_order_message_with_cross_functionality_record.price[enter_order_message_with_cross_functionality_at] = (enter_order_message_with_cross_functionality_base + 29 + enter_order_message_with_cross_functionality_at + 1) % 256; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 5 -> enter_order_message_with_cross_functionality_record.time_in_force[enter_order_message_with_cross_functionality_at] = (enter_order_message_with_cross_functionality_base + 39 + enter_order_message_with_cross_functionality_at + 1) % 256; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 4 -> enter_order_message_with_cross_functionality_record.firm_client_id[enter_order_message_with_cross_functionality_at] = (enter_order_message_with_cross_functionality_base + 44 + enter_order_message_with_cross_functionality_at + 1) % 256; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_record.display = (enter_order_message_with_cross_functionality_base + 48 + 1) % 256;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 6 -> enter_order_message_with_cross_functionality_record.min_qty[enter_order_message_with_cross_functionality_at] = (enter_order_message_with_cross_functionality_base + 49 + enter_order_message_with_cross_functionality_at + 1) % 256; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 6 -> enter_order_message_with_cross_functionality_record.max_floor[enter_order_message_with_cross_functionality_at] = (enter_order_message_with_cross_functionality_base + 55 + enter_order_message_with_cross_functionality_at + 1) % 256; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_record.peg_type = (enter_order_message_with_cross_functionality_base + 61 + 1) % 256;
  enter_order_message_with_cross_functionality_record.peg_difference_sign = (enter_order_message_with_cross_functionality_base + 62 + 1) % 256;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 10 -> enter_order_message_with_cross_functionality_record.peg_difference[enter_order_message_with_cross_functionality_at] = (enter_order_message_with_cross_functionality_base + 63 + enter_order_message_with_cross_functionality_at + 1) % 256; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 10 -> enter_order_message_with_cross_functionality_record.discretion_price[enter_order_message_with_cross_functionality_at] = (enter_order_message_with_cross_functionality_base + 73 + enter_order_message_with_cross_functionality_at + 1) % 256; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_record.discretion_peg_type = (enter_order_message_with_cross_functionality_base + 83 + 1) % 256;
  enter_order_message_with_cross_functionality_record.discretion_peg_difference_sign = (enter_order_message_with_cross_functionality_base + 84 + 1) % 256;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 10 -> enter_order_message_with_cross_functionality_record.discretion_peg_difference[enter_order_message_with_cross_functionality_at] = (enter_order_message_with_cross_functionality_base + 85 + enter_order_message_with_cross_functionality_at + 1) % 256; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_record.capacity_rule_80_a_indicator = (enter_order_message_with_cross_functionality_base + 95 + 1) % 256;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 6 -> enter_order_message_with_cross_functionality_record.random_reserve[enter_order_message_with_cross_functionality_at] = (enter_order_message_with_cross_functionality_base + 96 + enter_order_message_with_cross_functionality_at + 1) % 256; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 4 -> enter_order_message_with_cross_functionality_record.route_dest_exec_broker[enter_order_message_with_cross_functionality_at] = (enter_order_message_with_cross_functionality_base + 102 + enter_order_message_with_cross_functionality_at + 1) % 256; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 32 -> enter_order_message_with_cross_functionality_record.cust_terminal_id_sender_sub_id[enter_order_message_with_cross_functionality_at] = (enter_order_message_with_cross_functionality_base + 106 + enter_order_message_with_cross_functionality_at + 1) % 256; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_record.inter_market_sweep_eligibility = (enter_order_message_with_cross_functionality_base + 138 + 1) % 256;
  enter_order_message_with_cross_functionality_record.cross_type = (enter_order_message_with_cross_functionality_base + 139 + 1) % 256;
  enter_order_message_with_cross_functionality_record.customer_type = (enter_order_message_with_cross_functionality_base + 140 + 1) % 256;
  enter_order_message_with_cross_functionality_record.reactive_trade_now = (enter_order_message_with_cross_functionality_base + 141 + 1) % 256;
  skip
}

/* Enter Order Message With Cross Functionality to the wire, 142 bytes from where the cursor stands */
inline encode_enter_order_message_with_cross_functionality(enter_order_message_with_cross_functionality_record) {
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 14 -> wire[at] = enter_order_message_with_cross_functionality_record.order_token_client_order_id[enter_order_message_with_cross_functionality_at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  wire[at] = enter_order_message_with_cross_functionality_record.side; at = at + 1;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 6 -> wire[at] = enter_order_message_with_cross_functionality_record.shares_order_qty[enter_order_message_with_cross_functionality_at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 8 -> wire[at] = enter_order_message_with_cross_functionality_record.stock_symbol[enter_order_message_with_cross_functionality_at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 10 -> wire[at] = enter_order_message_with_cross_functionality_record.price[enter_order_message_with_cross_functionality_at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 5 -> wire[at] = enter_order_message_with_cross_functionality_record.time_in_force[enter_order_message_with_cross_functionality_at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 4 -> wire[at] = enter_order_message_with_cross_functionality_record.firm_client_id[enter_order_message_with_cross_functionality_at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  wire[at] = enter_order_message_with_cross_functionality_record.display; at = at + 1;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 6 -> wire[at] = enter_order_message_with_cross_functionality_record.min_qty[enter_order_message_with_cross_functionality_at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 6 -> wire[at] = enter_order_message_with_cross_functionality_record.max_floor[enter_order_message_with_cross_functionality_at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  wire[at] = enter_order_message_with_cross_functionality_record.peg_type; at = at + 1;
  wire[at] = enter_order_message_with_cross_functionality_record.peg_difference_sign; at = at + 1;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 10 -> wire[at] = enter_order_message_with_cross_functionality_record.peg_difference[enter_order_message_with_cross_functionality_at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 10 -> wire[at] = enter_order_message_with_cross_functionality_record.discretion_price[enter_order_message_with_cross_functionality_at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  wire[at] = enter_order_message_with_cross_functionality_record.discretion_peg_type; at = at + 1;
  wire[at] = enter_order_message_with_cross_functionality_record.discretion_peg_difference_sign; at = at + 1;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 10 -> wire[at] = enter_order_message_with_cross_functionality_record.discretion_peg_difference[enter_order_message_with_cross_functionality_at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  wire[at] = enter_order_message_with_cross_functionality_record.capacity_rule_80_a_indicator; at = at + 1;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 6 -> wire[at] = enter_order_message_with_cross_functionality_record.random_reserve[enter_order_message_with_cross_functionality_at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 4 -> wire[at] = enter_order_message_with_cross_functionality_record.route_dest_exec_broker[enter_order_message_with_cross_functionality_at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 32 -> wire[at] = enter_order_message_with_cross_functionality_record.cust_terminal_id_sender_sub_id[enter_order_message_with_cross_functionality_at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  wire[at] = enter_order_message_with_cross_functionality_record.inter_market_sweep_eligibility; at = at + 1;
  wire[at] = enter_order_message_with_cross_functionality_record.cross_type; at = at + 1;
  wire[at] = enter_order_message_with_cross_functionality_record.customer_type; at = at + 1;
  wire[at] = enter_order_message_with_cross_functionality_record.reactive_trade_now; at = at + 1;
  skip
}

/* Enter Order Message With Cross Functionality off the wire, 142 bytes from where the cursor stands */
inline decode_enter_order_message_with_cross_functionality(enter_order_message_with_cross_functionality_record) {
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 14 -> enter_order_message_with_cross_functionality_record.order_token_client_order_id[enter_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_record.side = wire[at]; at = at + 1;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 6 -> enter_order_message_with_cross_functionality_record.shares_order_qty[enter_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 8 -> enter_order_message_with_cross_functionality_record.stock_symbol[enter_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 10 -> enter_order_message_with_cross_functionality_record.price[enter_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 5 -> enter_order_message_with_cross_functionality_record.time_in_force[enter_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 4 -> enter_order_message_with_cross_functionality_record.firm_client_id[enter_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_record.display = wire[at]; at = at + 1;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 6 -> enter_order_message_with_cross_functionality_record.min_qty[enter_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 6 -> enter_order_message_with_cross_functionality_record.max_floor[enter_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_record.peg_type = wire[at]; at = at + 1;
  enter_order_message_with_cross_functionality_record.peg_difference_sign = wire[at]; at = at + 1;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 10 -> enter_order_message_with_cross_functionality_record.peg_difference[enter_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 10 -> enter_order_message_with_cross_functionality_record.discretion_price[enter_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_record.discretion_peg_type = wire[at]; at = at + 1;
  enter_order_message_with_cross_functionality_record.discretion_peg_difference_sign = wire[at]; at = at + 1;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 10 -> enter_order_message_with_cross_functionality_record.discretion_peg_difference[enter_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_record.capacity_rule_80_a_indicator = wire[at]; at = at + 1;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 6 -> enter_order_message_with_cross_functionality_record.random_reserve[enter_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 4 -> enter_order_message_with_cross_functionality_record.route_dest_exec_broker[enter_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 32 -> enter_order_message_with_cross_functionality_record.cust_terminal_id_sender_sub_id[enter_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_record.inter_market_sweep_eligibility = wire[at]; at = at + 1;
  enter_order_message_with_cross_functionality_record.cross_type = wire[at]; at = at + 1;
  enter_order_message_with_cross_functionality_record.customer_type = wire[at]; at = at + 1;
  enter_order_message_with_cross_functionality_record.reactive_trade_now = wire[at]; at = at + 1;
  skip
}

/* what was read of Enter Order Message With Cross Functionality is what was written, byte for byte */
inline equal_enter_order_message_with_cross_functionality(enter_order_message_with_cross_functionality_read, enter_order_message_with_cross_functionality_written) {
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 14 -> assert(enter_order_message_with_cross_functionality_read.order_token_client_order_id[enter_order_message_with_cross_functionality_at] == enter_order_message_with_cross_functionality_written.order_token_client_order_id[enter_order_message_with_cross_functionality_at]); enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  assert(enter_order_message_with_cross_functionality_read.side == enter_order_message_with_cross_functionality_written.side);
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 6 -> assert(enter_order_message_with_cross_functionality_read.shares_order_qty[enter_order_message_with_cross_functionality_at] == enter_order_message_with_cross_functionality_written.shares_order_qty[enter_order_message_with_cross_functionality_at]); enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 8 -> assert(enter_order_message_with_cross_functionality_read.stock_symbol[enter_order_message_with_cross_functionality_at] == enter_order_message_with_cross_functionality_written.stock_symbol[enter_order_message_with_cross_functionality_at]); enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 10 -> assert(enter_order_message_with_cross_functionality_read.price[enter_order_message_with_cross_functionality_at] == enter_order_message_with_cross_functionality_written.price[enter_order_message_with_cross_functionality_at]); enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 5 -> assert(enter_order_message_with_cross_functionality_read.time_in_force[enter_order_message_with_cross_functionality_at] == enter_order_message_with_cross_functionality_written.time_in_force[enter_order_message_with_cross_functionality_at]); enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 4 -> assert(enter_order_message_with_cross_functionality_read.firm_client_id[enter_order_message_with_cross_functionality_at] == enter_order_message_with_cross_functionality_written.firm_client_id[enter_order_message_with_cross_functionality_at]); enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  assert(enter_order_message_with_cross_functionality_read.display == enter_order_message_with_cross_functionality_written.display);
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 6 -> assert(enter_order_message_with_cross_functionality_read.min_qty[enter_order_message_with_cross_functionality_at] == enter_order_message_with_cross_functionality_written.min_qty[enter_order_message_with_cross_functionality_at]); enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 6 -> assert(enter_order_message_with_cross_functionality_read.max_floor[enter_order_message_with_cross_functionality_at] == enter_order_message_with_cross_functionality_written.max_floor[enter_order_message_with_cross_functionality_at]); enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  assert(enter_order_message_with_cross_functionality_read.peg_type == enter_order_message_with_cross_functionality_written.peg_type);
  assert(enter_order_message_with_cross_functionality_read.peg_difference_sign == enter_order_message_with_cross_functionality_written.peg_difference_sign);
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 10 -> assert(enter_order_message_with_cross_functionality_read.peg_difference[enter_order_message_with_cross_functionality_at] == enter_order_message_with_cross_functionality_written.peg_difference[enter_order_message_with_cross_functionality_at]); enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 10 -> assert(enter_order_message_with_cross_functionality_read.discretion_price[enter_order_message_with_cross_functionality_at] == enter_order_message_with_cross_functionality_written.discretion_price[enter_order_message_with_cross_functionality_at]); enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  assert(enter_order_message_with_cross_functionality_read.discretion_peg_type == enter_order_message_with_cross_functionality_written.discretion_peg_type);
  assert(enter_order_message_with_cross_functionality_read.discretion_peg_difference_sign == enter_order_message_with_cross_functionality_written.discretion_peg_difference_sign);
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 10 -> assert(enter_order_message_with_cross_functionality_read.discretion_peg_difference[enter_order_message_with_cross_functionality_at] == enter_order_message_with_cross_functionality_written.discretion_peg_difference[enter_order_message_with_cross_functionality_at]); enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  assert(enter_order_message_with_cross_functionality_read.capacity_rule_80_a_indicator == enter_order_message_with_cross_functionality_written.capacity_rule_80_a_indicator);
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 6 -> assert(enter_order_message_with_cross_functionality_read.random_reserve[enter_order_message_with_cross_functionality_at] == enter_order_message_with_cross_functionality_written.random_reserve[enter_order_message_with_cross_functionality_at]); enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 4 -> assert(enter_order_message_with_cross_functionality_read.route_dest_exec_broker[enter_order_message_with_cross_functionality_at] == enter_order_message_with_cross_functionality_written.route_dest_exec_broker[enter_order_message_with_cross_functionality_at]); enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  enter_order_message_with_cross_functionality_at = 0;
  do
  :: enter_order_message_with_cross_functionality_at < 32 -> assert(enter_order_message_with_cross_functionality_read.cust_terminal_id_sender_sub_id[enter_order_message_with_cross_functionality_at] == enter_order_message_with_cross_functionality_written.cust_terminal_id_sender_sub_id[enter_order_message_with_cross_functionality_at]); enter_order_message_with_cross_functionality_at = enter_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  assert(enter_order_message_with_cross_functionality_read.inter_market_sweep_eligibility == enter_order_message_with_cross_functionality_written.inter_market_sweep_eligibility);
  assert(enter_order_message_with_cross_functionality_read.cross_type == enter_order_message_with_cross_functionality_written.cross_type);
  assert(enter_order_message_with_cross_functionality_read.customer_type == enter_order_message_with_cross_functionality_written.customer_type);
  assert(enter_order_message_with_cross_functionality_read.reactive_trade_now == enter_order_message_with_cross_functionality_written.reactive_trade_now);
  skip
}

/* ---- Cancel Order Message: 20 bytes ------------------------------------------ */

/* Requests that an order be canceled. A Shares field of zero cancels the entire balance of the order; otherwise Shares is the new intended order size. */
typedef CancelOrderMessage {
  byte order_token_client_order_id[14];
  byte shares[6]
};

int cancel_order_message_at;

/* every byte of Cancel Order Message set to one value */
inline fill_cancel_order_message(cancel_order_message_record, cancel_order_message_value) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 14 -> cancel_order_message_record.order_token_client_order_id[cancel_order_message_at] = cancel_order_message_value; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 6 -> cancel_order_message_record.shares[cancel_order_message_at] = cancel_order_message_value; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Order Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_order_message(cancel_order_message_record, cancel_order_message_base) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 14 -> cancel_order_message_record.order_token_client_order_id[cancel_order_message_at] = (cancel_order_message_base + 0 + cancel_order_message_at + 1) % 256; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 6 -> cancel_order_message_record.shares[cancel_order_message_at] = (cancel_order_message_base + 14 + cancel_order_message_at + 1) % 256; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Message to the wire, 20 bytes from where the cursor stands */
inline encode_cancel_order_message(cancel_order_message_record) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 14 -> wire[at] = cancel_order_message_record.order_token_client_order_id[cancel_order_message_at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 6 -> wire[at] = cancel_order_message_record.shares[cancel_order_message_at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Message off the wire, 20 bytes from where the cursor stands */
inline decode_cancel_order_message(cancel_order_message_record) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 14 -> cancel_order_message_record.order_token_client_order_id[cancel_order_message_at] = wire[at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 6 -> cancel_order_message_record.shares[cancel_order_message_at] = wire[at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Order Message is what was written, byte for byte */
inline equal_cancel_order_message(cancel_order_message_read, cancel_order_message_written) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 14 -> assert(cancel_order_message_read.order_token_client_order_id[cancel_order_message_at] == cancel_order_message_written.order_token_client_order_id[cancel_order_message_at]); cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 6 -> assert(cancel_order_message_read.shares[cancel_order_message_at] == cancel_order_message_written.shares[cancel_order_message_at]); cancel_order_message_at = cancel_order_message_at + 1
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
    assert(at == 138);
    at = 0;
    decode_enter_order_message(enter_order_message_got);
    assert(at == 138);
    equal_enter_order_message(enter_order_message_got, enter_order_message_sent)
  }
}

/* Enter Order Message With Cross Functionality: encoded, read back, and compared */
proctype check_enter_order_message_with_cross_functionality() {
  EnterOrderMessageWithCrossFunctionality enter_order_message_with_cross_functionality_sent;
  EnterOrderMessageWithCrossFunctionality enter_order_message_with_cross_functionality_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_enter_order_message_with_cross_functionality(enter_order_message_with_cross_functionality_sent, 0)
  :: pattern == 1 -> fill_enter_order_message_with_cross_functionality(enter_order_message_with_cross_functionality_sent, 32)
  :: pattern == 2 -> fill_enter_order_message_with_cross_functionality(enter_order_message_with_cross_functionality_sent, 255)
  :: else -> ramp_enter_order_message_with_cross_functionality(enter_order_message_with_cross_functionality_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_enter_order_message_with_cross_functionality(enter_order_message_with_cross_functionality_sent);
    assert(at == 142);
    at = 0;
    decode_enter_order_message_with_cross_functionality(enter_order_message_with_cross_functionality_got);
    assert(at == 142);
    equal_enter_order_message_with_cross_functionality(enter_order_message_with_cross_functionality_got, enter_order_message_with_cross_functionality_sent)
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
    assert(at == 20);
    at = 0;
    decode_cancel_order_message(cancel_order_message_got);
    assert(at == 20);
    equal_cancel_order_message(cancel_order_message_got, cancel_order_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_client_packet_header()
  :: run check_login_request_packet()
  :: run check_enter_order_message()
  :: run check_enter_order_message_with_cross_functionality()
  :: run check_cancel_order_message()
  fi
}
