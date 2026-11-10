/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Orders
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
#define WIRE 48

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

/* ---- Enter Order Message: 48 bytes ------------------------------------------- */

typedef EnterOrderMessage {
  byte order_token[14];
  byte buy_sell_indicator;
  byte shares[4];
  byte stock[8];
  byte price[4];
  byte time_in_force[4];
  byte firm[4];
  byte display;
  byte capacity;
  byte intermarket_sweep_eligibility;
  byte minimum_quantity[4];
  byte cross_type;
  byte customer_type
};

int enter_order_message_at;

/* every byte of Enter Order Message set to one value */
inline fill_enter_order_message(enter_order_message_record, enter_order_message_value) {
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 14 -> enter_order_message_record.order_token[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.buy_sell_indicator = enter_order_message_value;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.shares[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> enter_order_message_record.stock[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.price[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.time_in_force[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.firm[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.display = enter_order_message_value;
  enter_order_message_record.capacity = enter_order_message_value;
  enter_order_message_record.intermarket_sweep_eligibility = enter_order_message_value;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.minimum_quantity[enter_order_message_at] = enter_order_message_value; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.cross_type = enter_order_message_value;
  enter_order_message_record.customer_type = enter_order_message_value;
  skip
}

/* each byte of Enter Order Message set to where it lies, so a field read out of place says so */
inline ramp_enter_order_message(enter_order_message_record, enter_order_message_base) {
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 14 -> enter_order_message_record.order_token[enter_order_message_at] = (enter_order_message_base + 0 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.buy_sell_indicator = (enter_order_message_base + 14 + 1) % 256;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.shares[enter_order_message_at] = (enter_order_message_base + 15 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> enter_order_message_record.stock[enter_order_message_at] = (enter_order_message_base + 19 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.price[enter_order_message_at] = (enter_order_message_base + 27 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.time_in_force[enter_order_message_at] = (enter_order_message_base + 31 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.firm[enter_order_message_at] = (enter_order_message_base + 35 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.display = (enter_order_message_base + 39 + 1) % 256;
  enter_order_message_record.capacity = (enter_order_message_base + 40 + 1) % 256;
  enter_order_message_record.intermarket_sweep_eligibility = (enter_order_message_base + 41 + 1) % 256;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.minimum_quantity[enter_order_message_at] = (enter_order_message_base + 42 + enter_order_message_at + 1) % 256; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.cross_type = (enter_order_message_base + 46 + 1) % 256;
  enter_order_message_record.customer_type = (enter_order_message_base + 47 + 1) % 256;
  skip
}

/* Enter Order Message to the wire, 48 bytes from where the cursor stands */
inline encode_enter_order_message(enter_order_message_record) {
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 14 -> wire[at] = enter_order_message_record.order_token[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  wire[at] = enter_order_message_record.buy_sell_indicator; at = at + 1;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> wire[at] = enter_order_message_record.shares[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> wire[at] = enter_order_message_record.stock[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> wire[at] = enter_order_message_record.price[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> wire[at] = enter_order_message_record.time_in_force[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> wire[at] = enter_order_message_record.firm[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  wire[at] = enter_order_message_record.display; at = at + 1;
  wire[at] = enter_order_message_record.capacity; at = at + 1;
  wire[at] = enter_order_message_record.intermarket_sweep_eligibility; at = at + 1;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> wire[at] = enter_order_message_record.minimum_quantity[enter_order_message_at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  wire[at] = enter_order_message_record.cross_type; at = at + 1;
  wire[at] = enter_order_message_record.customer_type; at = at + 1;
  skip
}

/* Enter Order Message off the wire, 48 bytes from where the cursor stands */
inline decode_enter_order_message(enter_order_message_record) {
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 14 -> enter_order_message_record.order_token[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.buy_sell_indicator = wire[at]; at = at + 1;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.shares[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> enter_order_message_record.stock[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.price[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.time_in_force[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.firm[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.display = wire[at]; at = at + 1;
  enter_order_message_record.capacity = wire[at]; at = at + 1;
  enter_order_message_record.intermarket_sweep_eligibility = wire[at]; at = at + 1;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> enter_order_message_record.minimum_quantity[enter_order_message_at] = wire[at]; at = at + 1; enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_record.cross_type = wire[at]; at = at + 1;
  enter_order_message_record.customer_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Enter Order Message is what was written, byte for byte */
inline equal_enter_order_message(enter_order_message_read, enter_order_message_written) {
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 14 -> assert(enter_order_message_read.order_token[enter_order_message_at] == enter_order_message_written.order_token[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  assert(enter_order_message_read.buy_sell_indicator == enter_order_message_written.buy_sell_indicator);
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> assert(enter_order_message_read.shares[enter_order_message_at] == enter_order_message_written.shares[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 8 -> assert(enter_order_message_read.stock[enter_order_message_at] == enter_order_message_written.stock[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> assert(enter_order_message_read.price[enter_order_message_at] == enter_order_message_written.price[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> assert(enter_order_message_read.time_in_force[enter_order_message_at] == enter_order_message_written.time_in_force[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> assert(enter_order_message_read.firm[enter_order_message_at] == enter_order_message_written.firm[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  assert(enter_order_message_read.display == enter_order_message_written.display);
  assert(enter_order_message_read.capacity == enter_order_message_written.capacity);
  assert(enter_order_message_read.intermarket_sweep_eligibility == enter_order_message_written.intermarket_sweep_eligibility);
  enter_order_message_at = 0;
  do
  :: enter_order_message_at < 4 -> assert(enter_order_message_read.minimum_quantity[enter_order_message_at] == enter_order_message_written.minimum_quantity[enter_order_message_at]); enter_order_message_at = enter_order_message_at + 1
  :: else -> break
  od;
  assert(enter_order_message_read.cross_type == enter_order_message_written.cross_type);
  assert(enter_order_message_read.customer_type == enter_order_message_written.customer_type);
  skip
}

/* ---- Replace Order Message: 46 bytes ----------------------------------------- */

typedef ReplaceOrderMessage {
  byte existing_order_token[14];
  byte replacement_order_token[14];
  byte shares[4];
  byte price[4];
  byte time_in_force[4];
  byte display;
  byte intermarket_sweep_eligibility;
  byte minimum_quantity[4]
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
  :: replace_order_message_at < 4 -> replace_order_message_record.shares[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.price[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.time_in_force[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_record.display = replace_order_message_value;
  replace_order_message_record.intermarket_sweep_eligibility = replace_order_message_value;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.minimum_quantity[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
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
  :: replace_order_message_at < 4 -> replace_order_message_record.shares[replace_order_message_at] = (replace_order_message_base + 28 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.price[replace_order_message_at] = (replace_order_message_base + 32 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.time_in_force[replace_order_message_at] = (replace_order_message_base + 36 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_record.display = (replace_order_message_base + 40 + 1) % 256;
  replace_order_message_record.intermarket_sweep_eligibility = (replace_order_message_base + 41 + 1) % 256;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.minimum_quantity[replace_order_message_at] = (replace_order_message_base + 42 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replace Order Message to the wire, 46 bytes from where the cursor stands */
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
  :: replace_order_message_at < 4 -> wire[at] = replace_order_message_record.shares[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> wire[at] = replace_order_message_record.price[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> wire[at] = replace_order_message_record.time_in_force[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  wire[at] = replace_order_message_record.display; at = at + 1;
  wire[at] = replace_order_message_record.intermarket_sweep_eligibility; at = at + 1;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> wire[at] = replace_order_message_record.minimum_quantity[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replace Order Message off the wire, 46 bytes from where the cursor stands */
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
  :: replace_order_message_at < 4 -> replace_order_message_record.shares[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.price[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.time_in_force[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_record.display = wire[at]; at = at + 1;
  replace_order_message_record.intermarket_sweep_eligibility = wire[at]; at = at + 1;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.minimum_quantity[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
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
  :: replace_order_message_at < 4 -> assert(replace_order_message_read.shares[replace_order_message_at] == replace_order_message_written.shares[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> assert(replace_order_message_read.price[replace_order_message_at] == replace_order_message_written.price[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> assert(replace_order_message_read.time_in_force[replace_order_message_at] == replace_order_message_written.time_in_force[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  assert(replace_order_message_read.display == replace_order_message_written.display);
  assert(replace_order_message_read.intermarket_sweep_eligibility == replace_order_message_written.intermarket_sweep_eligibility);
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> assert(replace_order_message_read.minimum_quantity[replace_order_message_at] == replace_order_message_written.minimum_quantity[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel Order Message: 18 bytes ------------------------------------------ */

typedef CancelOrderMessage {
  byte order_token[14];
  byte shares[4]
};

int cancel_order_message_at;

/* every byte of Cancel Order Message set to one value */
inline fill_cancel_order_message(cancel_order_message_record, cancel_order_message_value) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 14 -> cancel_order_message_record.order_token[cancel_order_message_at] = cancel_order_message_value; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> cancel_order_message_record.shares[cancel_order_message_at] = cancel_order_message_value; cancel_order_message_at = cancel_order_message_at + 1
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
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> cancel_order_message_record.shares[cancel_order_message_at] = (cancel_order_message_base + 14 + cancel_order_message_at + 1) % 256; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Message to the wire, 18 bytes from where the cursor stands */
inline encode_cancel_order_message(cancel_order_message_record) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 14 -> wire[at] = cancel_order_message_record.order_token[cancel_order_message_at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> wire[at] = cancel_order_message_record.shares[cancel_order_message_at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Message off the wire, 18 bytes from where the cursor stands */
inline decode_cancel_order_message(cancel_order_message_record) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 14 -> cancel_order_message_record.order_token[cancel_order_message_at] = wire[at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> cancel_order_message_record.shares[cancel_order_message_at] = wire[at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
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
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> assert(cancel_order_message_read.shares[cancel_order_message_at] == cancel_order_message_written.shares[cancel_order_message_at]); cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Order Message: 19 bytes ------------------------------------------ */

typedef ModifyOrderMessage {
  byte order_token[14];
  byte buy_sell_indicator;
  byte shares[4]
};

int modify_order_message_at;

/* every byte of Modify Order Message set to one value */
inline fill_modify_order_message(modify_order_message_record, modify_order_message_value) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 14 -> modify_order_message_record.order_token[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.buy_sell_indicator = modify_order_message_value;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.shares[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Modify Order Message set to where it lies, so a field read out of place says so */
inline ramp_modify_order_message(modify_order_message_record, modify_order_message_base) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 14 -> modify_order_message_record.order_token[modify_order_message_at] = (modify_order_message_base + 0 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.buy_sell_indicator = (modify_order_message_base + 14 + 1) % 256;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.shares[modify_order_message_at] = (modify_order_message_base + 15 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order Message to the wire, 19 bytes from where the cursor stands */
inline encode_modify_order_message(modify_order_message_record) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 14 -> wire[at] = modify_order_message_record.order_token[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_message_record.buy_sell_indicator; at = at + 1;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.shares[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order Message off the wire, 19 bytes from where the cursor stands */
inline decode_modify_order_message(modify_order_message_record) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 14 -> modify_order_message_record.order_token[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.buy_sell_indicator = wire[at]; at = at + 1;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.shares[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Modify Order Message is what was written, byte for byte */
inline equal_modify_order_message(modify_order_message_read, modify_order_message_written) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 14 -> assert(modify_order_message_read.order_token[modify_order_message_at] == modify_order_message_written.order_token[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  assert(modify_order_message_read.buy_sell_indicator == modify_order_message_written.buy_sell_indicator);
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.shares[modify_order_message_at] == modify_order_message_written.shares[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
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
    assert(at == 48);
    at = 0;
    decode_enter_order_message(enter_order_message_got);
    assert(at == 48);
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
    assert(at == 46);
    at = 0;
    decode_replace_order_message(replace_order_message_got);
    assert(at == 46);
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
    assert(at == 18);
    at = 0;
    decode_cancel_order_message(cancel_order_message_got);
    assert(at == 18);
    equal_cancel_order_message(cancel_order_message_got, cancel_order_message_sent)
  }
}

/* Modify Order Message: encoded, read back, and compared */
proctype check_modify_order_message() {
  ModifyOrderMessage modify_order_message_sent;
  ModifyOrderMessage modify_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_order_message(modify_order_message_sent, 0)
  :: pattern == 1 -> fill_modify_order_message(modify_order_message_sent, 32)
  :: pattern == 2 -> fill_modify_order_message(modify_order_message_sent, 255)
  :: else -> ramp_modify_order_message(modify_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_order_message(modify_order_message_sent);
    assert(at == 19);
    at = 0;
    decode_modify_order_message(modify_order_message_got);
    assert(at == 19);
    equal_modify_order_message(modify_order_message_got, modify_order_message_sent)
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
  :: run check_modify_order_message()
  fi
}
