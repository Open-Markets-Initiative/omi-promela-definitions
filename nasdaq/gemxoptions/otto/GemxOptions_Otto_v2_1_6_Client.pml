/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Ouch to Trade Options
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

/* ---- New Order Long Form Message: 96 bytes ----------------------------------- */

/* Long form of the New Order request provides full flexibility of configuring order attributes: */
typedef NewOrderLongFormMessage {
  byte firm_id[4];
  byte instrument_id[4];
  byte cl_ord_id[16];
  byte cmta[4];
  byte clearing_account[4];
  byte occ_account[4];
  byte cust_acct[10];
  byte preferred_party[3];
  byte alo_inst;
  byte iso;
  byte side;
  byte order_type;
  byte price[8];
  byte quantity[4];
  byte min_qty[4];
  byte tif;
  byte capacity;
  byte auction_type;
  byte auction_id[4];
  byte reserved_1;
  byte disclosure_mask;
  byte price_protection;
  byte display_qty[2];
  byte display_when;
  byte display_method;
  byte display_low_qty[2];
  byte display_high_qty[2];
  byte position_effect_mask[2];
  byte stock_leg_short_sale;
  byte stock_leg_mpid[4];
  byte stock_capacity;
  byte second_reserved_1
};

int new_order_long_form_message_at;

/* every byte of New Order Long Form Message set to one value */
inline fill_new_order_long_form_message(new_order_long_form_message_record, new_order_long_form_message_value) {
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.firm_id[new_order_long_form_message_at] = new_order_long_form_message_value; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.instrument_id[new_order_long_form_message_at] = new_order_long_form_message_value; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 16 -> new_order_long_form_message_record.cl_ord_id[new_order_long_form_message_at] = new_order_long_form_message_value; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.cmta[new_order_long_form_message_at] = new_order_long_form_message_value; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.clearing_account[new_order_long_form_message_at] = new_order_long_form_message_value; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.occ_account[new_order_long_form_message_at] = new_order_long_form_message_value; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 10 -> new_order_long_form_message_record.cust_acct[new_order_long_form_message_at] = new_order_long_form_message_value; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 3 -> new_order_long_form_message_record.preferred_party[new_order_long_form_message_at] = new_order_long_form_message_value; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_record.alo_inst = new_order_long_form_message_value;
  new_order_long_form_message_record.iso = new_order_long_form_message_value;
  new_order_long_form_message_record.side = new_order_long_form_message_value;
  new_order_long_form_message_record.order_type = new_order_long_form_message_value;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 8 -> new_order_long_form_message_record.price[new_order_long_form_message_at] = new_order_long_form_message_value; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.quantity[new_order_long_form_message_at] = new_order_long_form_message_value; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.min_qty[new_order_long_form_message_at] = new_order_long_form_message_value; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_record.tif = new_order_long_form_message_value;
  new_order_long_form_message_record.capacity = new_order_long_form_message_value;
  new_order_long_form_message_record.auction_type = new_order_long_form_message_value;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.auction_id[new_order_long_form_message_at] = new_order_long_form_message_value; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_record.reserved_1 = new_order_long_form_message_value;
  new_order_long_form_message_record.disclosure_mask = new_order_long_form_message_value;
  new_order_long_form_message_record.price_protection = new_order_long_form_message_value;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 2 -> new_order_long_form_message_record.display_qty[new_order_long_form_message_at] = new_order_long_form_message_value; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_record.display_when = new_order_long_form_message_value;
  new_order_long_form_message_record.display_method = new_order_long_form_message_value;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 2 -> new_order_long_form_message_record.display_low_qty[new_order_long_form_message_at] = new_order_long_form_message_value; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 2 -> new_order_long_form_message_record.display_high_qty[new_order_long_form_message_at] = new_order_long_form_message_value; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 2 -> new_order_long_form_message_record.position_effect_mask[new_order_long_form_message_at] = new_order_long_form_message_value; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_record.stock_leg_short_sale = new_order_long_form_message_value;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.stock_leg_mpid[new_order_long_form_message_at] = new_order_long_form_message_value; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_record.stock_capacity = new_order_long_form_message_value;
  new_order_long_form_message_record.second_reserved_1 = new_order_long_form_message_value;
  skip
}

/* each byte of New Order Long Form Message set to where it lies, so a field read out of place says so */
inline ramp_new_order_long_form_message(new_order_long_form_message_record, new_order_long_form_message_base) {
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.firm_id[new_order_long_form_message_at] = (new_order_long_form_message_base + 0 + new_order_long_form_message_at + 1) % 256; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.instrument_id[new_order_long_form_message_at] = (new_order_long_form_message_base + 4 + new_order_long_form_message_at + 1) % 256; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 16 -> new_order_long_form_message_record.cl_ord_id[new_order_long_form_message_at] = (new_order_long_form_message_base + 8 + new_order_long_form_message_at + 1) % 256; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.cmta[new_order_long_form_message_at] = (new_order_long_form_message_base + 24 + new_order_long_form_message_at + 1) % 256; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.clearing_account[new_order_long_form_message_at] = (new_order_long_form_message_base + 28 + new_order_long_form_message_at + 1) % 256; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.occ_account[new_order_long_form_message_at] = (new_order_long_form_message_base + 32 + new_order_long_form_message_at + 1) % 256; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 10 -> new_order_long_form_message_record.cust_acct[new_order_long_form_message_at] = (new_order_long_form_message_base + 36 + new_order_long_form_message_at + 1) % 256; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 3 -> new_order_long_form_message_record.preferred_party[new_order_long_form_message_at] = (new_order_long_form_message_base + 46 + new_order_long_form_message_at + 1) % 256; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_record.alo_inst = (new_order_long_form_message_base + 49 + 1) % 256;
  new_order_long_form_message_record.iso = (new_order_long_form_message_base + 50 + 1) % 256;
  new_order_long_form_message_record.side = (new_order_long_form_message_base + 51 + 1) % 256;
  new_order_long_form_message_record.order_type = (new_order_long_form_message_base + 52 + 1) % 256;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 8 -> new_order_long_form_message_record.price[new_order_long_form_message_at] = (new_order_long_form_message_base + 53 + new_order_long_form_message_at + 1) % 256; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.quantity[new_order_long_form_message_at] = (new_order_long_form_message_base + 61 + new_order_long_form_message_at + 1) % 256; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.min_qty[new_order_long_form_message_at] = (new_order_long_form_message_base + 65 + new_order_long_form_message_at + 1) % 256; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_record.tif = (new_order_long_form_message_base + 69 + 1) % 256;
  new_order_long_form_message_record.capacity = (new_order_long_form_message_base + 70 + 1) % 256;
  new_order_long_form_message_record.auction_type = (new_order_long_form_message_base + 71 + 1) % 256;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.auction_id[new_order_long_form_message_at] = (new_order_long_form_message_base + 72 + new_order_long_form_message_at + 1) % 256; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_record.reserved_1 = (new_order_long_form_message_base + 76 + 1) % 256;
  new_order_long_form_message_record.disclosure_mask = (new_order_long_form_message_base + 77 + 1) % 256;
  new_order_long_form_message_record.price_protection = (new_order_long_form_message_base + 78 + 1) % 256;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 2 -> new_order_long_form_message_record.display_qty[new_order_long_form_message_at] = (new_order_long_form_message_base + 79 + new_order_long_form_message_at + 1) % 256; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_record.display_when = (new_order_long_form_message_base + 81 + 1) % 256;
  new_order_long_form_message_record.display_method = (new_order_long_form_message_base + 82 + 1) % 256;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 2 -> new_order_long_form_message_record.display_low_qty[new_order_long_form_message_at] = (new_order_long_form_message_base + 83 + new_order_long_form_message_at + 1) % 256; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 2 -> new_order_long_form_message_record.display_high_qty[new_order_long_form_message_at] = (new_order_long_form_message_base + 85 + new_order_long_form_message_at + 1) % 256; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 2 -> new_order_long_form_message_record.position_effect_mask[new_order_long_form_message_at] = (new_order_long_form_message_base + 87 + new_order_long_form_message_at + 1) % 256; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_record.stock_leg_short_sale = (new_order_long_form_message_base + 89 + 1) % 256;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.stock_leg_mpid[new_order_long_form_message_at] = (new_order_long_form_message_base + 90 + new_order_long_form_message_at + 1) % 256; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_record.stock_capacity = (new_order_long_form_message_base + 94 + 1) % 256;
  new_order_long_form_message_record.second_reserved_1 = (new_order_long_form_message_base + 95 + 1) % 256;
  skip
}

/* New Order Long Form Message to the wire, 96 bytes from where the cursor stands */
inline encode_new_order_long_form_message(new_order_long_form_message_record) {
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> wire[at] = new_order_long_form_message_record.firm_id[new_order_long_form_message_at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> wire[at] = new_order_long_form_message_record.instrument_id[new_order_long_form_message_at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 16 -> wire[at] = new_order_long_form_message_record.cl_ord_id[new_order_long_form_message_at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> wire[at] = new_order_long_form_message_record.cmta[new_order_long_form_message_at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> wire[at] = new_order_long_form_message_record.clearing_account[new_order_long_form_message_at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> wire[at] = new_order_long_form_message_record.occ_account[new_order_long_form_message_at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 10 -> wire[at] = new_order_long_form_message_record.cust_acct[new_order_long_form_message_at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 3 -> wire[at] = new_order_long_form_message_record.preferred_party[new_order_long_form_message_at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_long_form_message_record.alo_inst; at = at + 1;
  wire[at] = new_order_long_form_message_record.iso; at = at + 1;
  wire[at] = new_order_long_form_message_record.side; at = at + 1;
  wire[at] = new_order_long_form_message_record.order_type; at = at + 1;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 8 -> wire[at] = new_order_long_form_message_record.price[new_order_long_form_message_at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> wire[at] = new_order_long_form_message_record.quantity[new_order_long_form_message_at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> wire[at] = new_order_long_form_message_record.min_qty[new_order_long_form_message_at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_long_form_message_record.tif; at = at + 1;
  wire[at] = new_order_long_form_message_record.capacity; at = at + 1;
  wire[at] = new_order_long_form_message_record.auction_type; at = at + 1;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> wire[at] = new_order_long_form_message_record.auction_id[new_order_long_form_message_at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_long_form_message_record.reserved_1; at = at + 1;
  wire[at] = new_order_long_form_message_record.disclosure_mask; at = at + 1;
  wire[at] = new_order_long_form_message_record.price_protection; at = at + 1;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 2 -> wire[at] = new_order_long_form_message_record.display_qty[new_order_long_form_message_at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_long_form_message_record.display_when; at = at + 1;
  wire[at] = new_order_long_form_message_record.display_method; at = at + 1;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 2 -> wire[at] = new_order_long_form_message_record.display_low_qty[new_order_long_form_message_at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 2 -> wire[at] = new_order_long_form_message_record.display_high_qty[new_order_long_form_message_at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 2 -> wire[at] = new_order_long_form_message_record.position_effect_mask[new_order_long_form_message_at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_long_form_message_record.stock_leg_short_sale; at = at + 1;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> wire[at] = new_order_long_form_message_record.stock_leg_mpid[new_order_long_form_message_at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_long_form_message_record.stock_capacity; at = at + 1;
  wire[at] = new_order_long_form_message_record.second_reserved_1; at = at + 1;
  skip
}

/* New Order Long Form Message off the wire, 96 bytes from where the cursor stands */
inline decode_new_order_long_form_message(new_order_long_form_message_record) {
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.firm_id[new_order_long_form_message_at] = wire[at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.instrument_id[new_order_long_form_message_at] = wire[at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 16 -> new_order_long_form_message_record.cl_ord_id[new_order_long_form_message_at] = wire[at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.cmta[new_order_long_form_message_at] = wire[at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.clearing_account[new_order_long_form_message_at] = wire[at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.occ_account[new_order_long_form_message_at] = wire[at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 10 -> new_order_long_form_message_record.cust_acct[new_order_long_form_message_at] = wire[at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 3 -> new_order_long_form_message_record.preferred_party[new_order_long_form_message_at] = wire[at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_record.alo_inst = wire[at]; at = at + 1;
  new_order_long_form_message_record.iso = wire[at]; at = at + 1;
  new_order_long_form_message_record.side = wire[at]; at = at + 1;
  new_order_long_form_message_record.order_type = wire[at]; at = at + 1;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 8 -> new_order_long_form_message_record.price[new_order_long_form_message_at] = wire[at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.quantity[new_order_long_form_message_at] = wire[at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.min_qty[new_order_long_form_message_at] = wire[at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_record.tif = wire[at]; at = at + 1;
  new_order_long_form_message_record.capacity = wire[at]; at = at + 1;
  new_order_long_form_message_record.auction_type = wire[at]; at = at + 1;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.auction_id[new_order_long_form_message_at] = wire[at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_record.reserved_1 = wire[at]; at = at + 1;
  new_order_long_form_message_record.disclosure_mask = wire[at]; at = at + 1;
  new_order_long_form_message_record.price_protection = wire[at]; at = at + 1;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 2 -> new_order_long_form_message_record.display_qty[new_order_long_form_message_at] = wire[at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_record.display_when = wire[at]; at = at + 1;
  new_order_long_form_message_record.display_method = wire[at]; at = at + 1;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 2 -> new_order_long_form_message_record.display_low_qty[new_order_long_form_message_at] = wire[at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 2 -> new_order_long_form_message_record.display_high_qty[new_order_long_form_message_at] = wire[at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 2 -> new_order_long_form_message_record.position_effect_mask[new_order_long_form_message_at] = wire[at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_record.stock_leg_short_sale = wire[at]; at = at + 1;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> new_order_long_form_message_record.stock_leg_mpid[new_order_long_form_message_at] = wire[at]; at = at + 1; new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_record.stock_capacity = wire[at]; at = at + 1;
  new_order_long_form_message_record.second_reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of New Order Long Form Message is what was written, byte for byte */
inline equal_new_order_long_form_message(new_order_long_form_message_read, new_order_long_form_message_written) {
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> assert(new_order_long_form_message_read.firm_id[new_order_long_form_message_at] == new_order_long_form_message_written.firm_id[new_order_long_form_message_at]); new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> assert(new_order_long_form_message_read.instrument_id[new_order_long_form_message_at] == new_order_long_form_message_written.instrument_id[new_order_long_form_message_at]); new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 16 -> assert(new_order_long_form_message_read.cl_ord_id[new_order_long_form_message_at] == new_order_long_form_message_written.cl_ord_id[new_order_long_form_message_at]); new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> assert(new_order_long_form_message_read.cmta[new_order_long_form_message_at] == new_order_long_form_message_written.cmta[new_order_long_form_message_at]); new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> assert(new_order_long_form_message_read.clearing_account[new_order_long_form_message_at] == new_order_long_form_message_written.clearing_account[new_order_long_form_message_at]); new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> assert(new_order_long_form_message_read.occ_account[new_order_long_form_message_at] == new_order_long_form_message_written.occ_account[new_order_long_form_message_at]); new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 10 -> assert(new_order_long_form_message_read.cust_acct[new_order_long_form_message_at] == new_order_long_form_message_written.cust_acct[new_order_long_form_message_at]); new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 3 -> assert(new_order_long_form_message_read.preferred_party[new_order_long_form_message_at] == new_order_long_form_message_written.preferred_party[new_order_long_form_message_at]); new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  assert(new_order_long_form_message_read.alo_inst == new_order_long_form_message_written.alo_inst);
  assert(new_order_long_form_message_read.iso == new_order_long_form_message_written.iso);
  assert(new_order_long_form_message_read.side == new_order_long_form_message_written.side);
  assert(new_order_long_form_message_read.order_type == new_order_long_form_message_written.order_type);
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 8 -> assert(new_order_long_form_message_read.price[new_order_long_form_message_at] == new_order_long_form_message_written.price[new_order_long_form_message_at]); new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> assert(new_order_long_form_message_read.quantity[new_order_long_form_message_at] == new_order_long_form_message_written.quantity[new_order_long_form_message_at]); new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> assert(new_order_long_form_message_read.min_qty[new_order_long_form_message_at] == new_order_long_form_message_written.min_qty[new_order_long_form_message_at]); new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  assert(new_order_long_form_message_read.tif == new_order_long_form_message_written.tif);
  assert(new_order_long_form_message_read.capacity == new_order_long_form_message_written.capacity);
  assert(new_order_long_form_message_read.auction_type == new_order_long_form_message_written.auction_type);
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> assert(new_order_long_form_message_read.auction_id[new_order_long_form_message_at] == new_order_long_form_message_written.auction_id[new_order_long_form_message_at]); new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  assert(new_order_long_form_message_read.reserved_1 == new_order_long_form_message_written.reserved_1);
  assert(new_order_long_form_message_read.disclosure_mask == new_order_long_form_message_written.disclosure_mask);
  assert(new_order_long_form_message_read.price_protection == new_order_long_form_message_written.price_protection);
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 2 -> assert(new_order_long_form_message_read.display_qty[new_order_long_form_message_at] == new_order_long_form_message_written.display_qty[new_order_long_form_message_at]); new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  assert(new_order_long_form_message_read.display_when == new_order_long_form_message_written.display_when);
  assert(new_order_long_form_message_read.display_method == new_order_long_form_message_written.display_method);
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 2 -> assert(new_order_long_form_message_read.display_low_qty[new_order_long_form_message_at] == new_order_long_form_message_written.display_low_qty[new_order_long_form_message_at]); new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 2 -> assert(new_order_long_form_message_read.display_high_qty[new_order_long_form_message_at] == new_order_long_form_message_written.display_high_qty[new_order_long_form_message_at]); new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 2 -> assert(new_order_long_form_message_read.position_effect_mask[new_order_long_form_message_at] == new_order_long_form_message_written.position_effect_mask[new_order_long_form_message_at]); new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  assert(new_order_long_form_message_read.stock_leg_short_sale == new_order_long_form_message_written.stock_leg_short_sale);
  new_order_long_form_message_at = 0;
  do
  :: new_order_long_form_message_at < 4 -> assert(new_order_long_form_message_read.stock_leg_mpid[new_order_long_form_message_at] == new_order_long_form_message_written.stock_leg_mpid[new_order_long_form_message_at]); new_order_long_form_message_at = new_order_long_form_message_at + 1
  :: else -> break
  od;
  assert(new_order_long_form_message_read.stock_capacity == new_order_long_form_message_written.stock_capacity);
  assert(new_order_long_form_message_read.second_reserved_1 == new_order_long_form_message_written.second_reserved_1);
  skip
}

/* ---- New Order Short Form Message: 49 bytes ---------------------------------- */

/* Short format of the New Order request is a compact message (less than 50 bytes) with limited flexibility: */
typedef NewOrderShortFormMessage {
  byte firm_id[4];
  byte instrument_id[4];
  byte cl_ord_id[16];
  byte alo_inst;
  byte iso;
  byte side;
  byte order_type;
  byte price[8];
  byte quantity_short[2];
  byte tif;
  byte capacity;
  byte auction_type;
  byte auction_id[4];
  byte price_protection;
  byte position_effect_mask[2];
  byte stock_capacity
};

int new_order_short_form_message_at;

/* every byte of New Order Short Form Message set to one value */
inline fill_new_order_short_form_message(new_order_short_form_message_record, new_order_short_form_message_value) {
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 4 -> new_order_short_form_message_record.firm_id[new_order_short_form_message_at] = new_order_short_form_message_value; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 4 -> new_order_short_form_message_record.instrument_id[new_order_short_form_message_at] = new_order_short_form_message_value; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 16 -> new_order_short_form_message_record.cl_ord_id[new_order_short_form_message_at] = new_order_short_form_message_value; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_record.alo_inst = new_order_short_form_message_value;
  new_order_short_form_message_record.iso = new_order_short_form_message_value;
  new_order_short_form_message_record.side = new_order_short_form_message_value;
  new_order_short_form_message_record.order_type = new_order_short_form_message_value;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 8 -> new_order_short_form_message_record.price[new_order_short_form_message_at] = new_order_short_form_message_value; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 2 -> new_order_short_form_message_record.quantity_short[new_order_short_form_message_at] = new_order_short_form_message_value; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_record.tif = new_order_short_form_message_value;
  new_order_short_form_message_record.capacity = new_order_short_form_message_value;
  new_order_short_form_message_record.auction_type = new_order_short_form_message_value;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 4 -> new_order_short_form_message_record.auction_id[new_order_short_form_message_at] = new_order_short_form_message_value; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_record.price_protection = new_order_short_form_message_value;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 2 -> new_order_short_form_message_record.position_effect_mask[new_order_short_form_message_at] = new_order_short_form_message_value; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_record.stock_capacity = new_order_short_form_message_value;
  skip
}

/* each byte of New Order Short Form Message set to where it lies, so a field read out of place says so */
inline ramp_new_order_short_form_message(new_order_short_form_message_record, new_order_short_form_message_base) {
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 4 -> new_order_short_form_message_record.firm_id[new_order_short_form_message_at] = (new_order_short_form_message_base + 0 + new_order_short_form_message_at + 1) % 256; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 4 -> new_order_short_form_message_record.instrument_id[new_order_short_form_message_at] = (new_order_short_form_message_base + 4 + new_order_short_form_message_at + 1) % 256; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 16 -> new_order_short_form_message_record.cl_ord_id[new_order_short_form_message_at] = (new_order_short_form_message_base + 8 + new_order_short_form_message_at + 1) % 256; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_record.alo_inst = (new_order_short_form_message_base + 24 + 1) % 256;
  new_order_short_form_message_record.iso = (new_order_short_form_message_base + 25 + 1) % 256;
  new_order_short_form_message_record.side = (new_order_short_form_message_base + 26 + 1) % 256;
  new_order_short_form_message_record.order_type = (new_order_short_form_message_base + 27 + 1) % 256;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 8 -> new_order_short_form_message_record.price[new_order_short_form_message_at] = (new_order_short_form_message_base + 28 + new_order_short_form_message_at + 1) % 256; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 2 -> new_order_short_form_message_record.quantity_short[new_order_short_form_message_at] = (new_order_short_form_message_base + 36 + new_order_short_form_message_at + 1) % 256; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_record.tif = (new_order_short_form_message_base + 38 + 1) % 256;
  new_order_short_form_message_record.capacity = (new_order_short_form_message_base + 39 + 1) % 256;
  new_order_short_form_message_record.auction_type = (new_order_short_form_message_base + 40 + 1) % 256;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 4 -> new_order_short_form_message_record.auction_id[new_order_short_form_message_at] = (new_order_short_form_message_base + 41 + new_order_short_form_message_at + 1) % 256; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_record.price_protection = (new_order_short_form_message_base + 45 + 1) % 256;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 2 -> new_order_short_form_message_record.position_effect_mask[new_order_short_form_message_at] = (new_order_short_form_message_base + 46 + new_order_short_form_message_at + 1) % 256; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_record.stock_capacity = (new_order_short_form_message_base + 48 + 1) % 256;
  skip
}

/* New Order Short Form Message to the wire, 49 bytes from where the cursor stands */
inline encode_new_order_short_form_message(new_order_short_form_message_record) {
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 4 -> wire[at] = new_order_short_form_message_record.firm_id[new_order_short_form_message_at]; at = at + 1; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 4 -> wire[at] = new_order_short_form_message_record.instrument_id[new_order_short_form_message_at]; at = at + 1; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 16 -> wire[at] = new_order_short_form_message_record.cl_ord_id[new_order_short_form_message_at]; at = at + 1; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_short_form_message_record.alo_inst; at = at + 1;
  wire[at] = new_order_short_form_message_record.iso; at = at + 1;
  wire[at] = new_order_short_form_message_record.side; at = at + 1;
  wire[at] = new_order_short_form_message_record.order_type; at = at + 1;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 8 -> wire[at] = new_order_short_form_message_record.price[new_order_short_form_message_at]; at = at + 1; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 2 -> wire[at] = new_order_short_form_message_record.quantity_short[new_order_short_form_message_at]; at = at + 1; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_short_form_message_record.tif; at = at + 1;
  wire[at] = new_order_short_form_message_record.capacity; at = at + 1;
  wire[at] = new_order_short_form_message_record.auction_type; at = at + 1;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 4 -> wire[at] = new_order_short_form_message_record.auction_id[new_order_short_form_message_at]; at = at + 1; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_short_form_message_record.price_protection; at = at + 1;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 2 -> wire[at] = new_order_short_form_message_record.position_effect_mask[new_order_short_form_message_at]; at = at + 1; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_short_form_message_record.stock_capacity; at = at + 1;
  skip
}

/* New Order Short Form Message off the wire, 49 bytes from where the cursor stands */
inline decode_new_order_short_form_message(new_order_short_form_message_record) {
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 4 -> new_order_short_form_message_record.firm_id[new_order_short_form_message_at] = wire[at]; at = at + 1; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 4 -> new_order_short_form_message_record.instrument_id[new_order_short_form_message_at] = wire[at]; at = at + 1; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 16 -> new_order_short_form_message_record.cl_ord_id[new_order_short_form_message_at] = wire[at]; at = at + 1; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_record.alo_inst = wire[at]; at = at + 1;
  new_order_short_form_message_record.iso = wire[at]; at = at + 1;
  new_order_short_form_message_record.side = wire[at]; at = at + 1;
  new_order_short_form_message_record.order_type = wire[at]; at = at + 1;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 8 -> new_order_short_form_message_record.price[new_order_short_form_message_at] = wire[at]; at = at + 1; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 2 -> new_order_short_form_message_record.quantity_short[new_order_short_form_message_at] = wire[at]; at = at + 1; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_record.tif = wire[at]; at = at + 1;
  new_order_short_form_message_record.capacity = wire[at]; at = at + 1;
  new_order_short_form_message_record.auction_type = wire[at]; at = at + 1;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 4 -> new_order_short_form_message_record.auction_id[new_order_short_form_message_at] = wire[at]; at = at + 1; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_record.price_protection = wire[at]; at = at + 1;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 2 -> new_order_short_form_message_record.position_effect_mask[new_order_short_form_message_at] = wire[at]; at = at + 1; new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_record.stock_capacity = wire[at]; at = at + 1;
  skip
}

/* what was read of New Order Short Form Message is what was written, byte for byte */
inline equal_new_order_short_form_message(new_order_short_form_message_read, new_order_short_form_message_written) {
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 4 -> assert(new_order_short_form_message_read.firm_id[new_order_short_form_message_at] == new_order_short_form_message_written.firm_id[new_order_short_form_message_at]); new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 4 -> assert(new_order_short_form_message_read.instrument_id[new_order_short_form_message_at] == new_order_short_form_message_written.instrument_id[new_order_short_form_message_at]); new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 16 -> assert(new_order_short_form_message_read.cl_ord_id[new_order_short_form_message_at] == new_order_short_form_message_written.cl_ord_id[new_order_short_form_message_at]); new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  assert(new_order_short_form_message_read.alo_inst == new_order_short_form_message_written.alo_inst);
  assert(new_order_short_form_message_read.iso == new_order_short_form_message_written.iso);
  assert(new_order_short_form_message_read.side == new_order_short_form_message_written.side);
  assert(new_order_short_form_message_read.order_type == new_order_short_form_message_written.order_type);
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 8 -> assert(new_order_short_form_message_read.price[new_order_short_form_message_at] == new_order_short_form_message_written.price[new_order_short_form_message_at]); new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 2 -> assert(new_order_short_form_message_read.quantity_short[new_order_short_form_message_at] == new_order_short_form_message_written.quantity_short[new_order_short_form_message_at]); new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  assert(new_order_short_form_message_read.tif == new_order_short_form_message_written.tif);
  assert(new_order_short_form_message_read.capacity == new_order_short_form_message_written.capacity);
  assert(new_order_short_form_message_read.auction_type == new_order_short_form_message_written.auction_type);
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 4 -> assert(new_order_short_form_message_read.auction_id[new_order_short_form_message_at] == new_order_short_form_message_written.auction_id[new_order_short_form_message_at]); new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  assert(new_order_short_form_message_read.price_protection == new_order_short_form_message_written.price_protection);
  new_order_short_form_message_at = 0;
  do
  :: new_order_short_form_message_at < 2 -> assert(new_order_short_form_message_read.position_effect_mask[new_order_short_form_message_at] == new_order_short_form_message_written.position_effect_mask[new_order_short_form_message_at]); new_order_short_form_message_at = new_order_short_form_message_at + 1
  :: else -> break
  od;
  assert(new_order_short_form_message_read.stock_capacity == new_order_short_form_message_written.stock_capacity);
  skip
}

/* ---- Replace Order Message: 37 bytes ----------------------------------------- */

/* Replace Order message is used to modify an existing order for both simple and complex instruments. */
typedef ReplaceOrderMessage {
  byte firm_id[4];
  byte orig_cl_ord_id[16];
  byte quantity[4];
  byte order_type;
  byte tif;
  byte cust_acct[10];
  byte price_protection
};

int replace_order_message_at;

/* every byte of Replace Order Message set to one value */
inline fill_replace_order_message(replace_order_message_record, replace_order_message_value) {
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.firm_id[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 16 -> replace_order_message_record.orig_cl_ord_id[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.quantity[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_record.order_type = replace_order_message_value;
  replace_order_message_record.tif = replace_order_message_value;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 10 -> replace_order_message_record.cust_acct[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_record.price_protection = replace_order_message_value;
  skip
}

/* each byte of Replace Order Message set to where it lies, so a field read out of place says so */
inline ramp_replace_order_message(replace_order_message_record, replace_order_message_base) {
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.firm_id[replace_order_message_at] = (replace_order_message_base + 0 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 16 -> replace_order_message_record.orig_cl_ord_id[replace_order_message_at] = (replace_order_message_base + 4 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.quantity[replace_order_message_at] = (replace_order_message_base + 20 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_record.order_type = (replace_order_message_base + 24 + 1) % 256;
  replace_order_message_record.tif = (replace_order_message_base + 25 + 1) % 256;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 10 -> replace_order_message_record.cust_acct[replace_order_message_at] = (replace_order_message_base + 26 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_record.price_protection = (replace_order_message_base + 36 + 1) % 256;
  skip
}

/* Replace Order Message to the wire, 37 bytes from where the cursor stands */
inline encode_replace_order_message(replace_order_message_record) {
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> wire[at] = replace_order_message_record.firm_id[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 16 -> wire[at] = replace_order_message_record.orig_cl_ord_id[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> wire[at] = replace_order_message_record.quantity[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  wire[at] = replace_order_message_record.order_type; at = at + 1;
  wire[at] = replace_order_message_record.tif; at = at + 1;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 10 -> wire[at] = replace_order_message_record.cust_acct[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  wire[at] = replace_order_message_record.price_protection; at = at + 1;
  skip
}

/* Replace Order Message off the wire, 37 bytes from where the cursor stands */
inline decode_replace_order_message(replace_order_message_record) {
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.firm_id[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 16 -> replace_order_message_record.orig_cl_ord_id[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.quantity[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_record.order_type = wire[at]; at = at + 1;
  replace_order_message_record.tif = wire[at]; at = at + 1;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 10 -> replace_order_message_record.cust_acct[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_record.price_protection = wire[at]; at = at + 1;
  skip
}

/* what was read of Replace Order Message is what was written, byte for byte */
inline equal_replace_order_message(replace_order_message_read, replace_order_message_written) {
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> assert(replace_order_message_read.firm_id[replace_order_message_at] == replace_order_message_written.firm_id[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 16 -> assert(replace_order_message_read.orig_cl_ord_id[replace_order_message_at] == replace_order_message_written.orig_cl_ord_id[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> assert(replace_order_message_read.quantity[replace_order_message_at] == replace_order_message_written.quantity[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  assert(replace_order_message_read.order_type == replace_order_message_written.order_type);
  assert(replace_order_message_read.tif == replace_order_message_written.tif);
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 10 -> assert(replace_order_message_read.cust_acct[replace_order_message_at] == replace_order_message_written.cust_acct[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  assert(replace_order_message_read.price_protection == replace_order_message_written.price_protection);
  skip
}

/* ---- Cancel Order Message: 20 bytes ------------------------------------------ */

/* The order to be deleted is identified by the ClOrdId field. If the order cannot be deleted, or cannot be found, the request is rejected. */
typedef CancelOrderMessage {
  byte firm_id[4];
  byte cl_ord_id[16]
};

int cancel_order_message_at;

/* every byte of Cancel Order Message set to one value */
inline fill_cancel_order_message(cancel_order_message_record, cancel_order_message_value) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> cancel_order_message_record.firm_id[cancel_order_message_at] = cancel_order_message_value; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 16 -> cancel_order_message_record.cl_ord_id[cancel_order_message_at] = cancel_order_message_value; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Order Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_order_message(cancel_order_message_record, cancel_order_message_base) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> cancel_order_message_record.firm_id[cancel_order_message_at] = (cancel_order_message_base + 0 + cancel_order_message_at + 1) % 256; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 16 -> cancel_order_message_record.cl_ord_id[cancel_order_message_at] = (cancel_order_message_base + 4 + cancel_order_message_at + 1) % 256; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Message to the wire, 20 bytes from where the cursor stands */
inline encode_cancel_order_message(cancel_order_message_record) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> wire[at] = cancel_order_message_record.firm_id[cancel_order_message_at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 16 -> wire[at] = cancel_order_message_record.cl_ord_id[cancel_order_message_at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Message off the wire, 20 bytes from where the cursor stands */
inline decode_cancel_order_message(cancel_order_message_record) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> cancel_order_message_record.firm_id[cancel_order_message_at] = wire[at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 16 -> cancel_order_message_record.cl_ord_id[cancel_order_message_at] = wire[at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Order Message is what was written, byte for byte */
inline equal_cancel_order_message(cancel_order_message_read, cancel_order_message_written) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> assert(cancel_order_message_read.firm_id[cancel_order_message_at] == cancel_order_message_written.firm_id[cancel_order_message_at]); cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 16 -> assert(cancel_order_message_read.cl_ord_id[cancel_order_message_at] == cancel_order_message_written.cl_ord_id[cancel_order_message_at]); cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mass Cancel Message: 41 bytes ------------------------------------------- */

/* This message is used to mass-delete multiple open orders based on the specified Scope. - If message contains invalid fields request is rejected. */
typedef MassCancelMessage {
  byte firm_id[4];
  byte cl_request_id[16];
  byte instrument_type;
  byte scope;
  byte product_id[2];
  byte instrument_id[4];
  byte underlying_symbol[13]
};

int mass_cancel_message_at;

/* every byte of Mass Cancel Message set to one value */
inline fill_mass_cancel_message(mass_cancel_message_record, mass_cancel_message_value) {
  mass_cancel_message_at = 0;
  do
  :: mass_cancel_message_at < 4 -> mass_cancel_message_record.firm_id[mass_cancel_message_at] = mass_cancel_message_value; mass_cancel_message_at = mass_cancel_message_at + 1
  :: else -> break
  od;
  mass_cancel_message_at = 0;
  do
  :: mass_cancel_message_at < 16 -> mass_cancel_message_record.cl_request_id[mass_cancel_message_at] = mass_cancel_message_value; mass_cancel_message_at = mass_cancel_message_at + 1
  :: else -> break
  od;
  mass_cancel_message_record.instrument_type = mass_cancel_message_value;
  mass_cancel_message_record.scope = mass_cancel_message_value;
  mass_cancel_message_at = 0;
  do
  :: mass_cancel_message_at < 2 -> mass_cancel_message_record.product_id[mass_cancel_message_at] = mass_cancel_message_value; mass_cancel_message_at = mass_cancel_message_at + 1
  :: else -> break
  od;
  mass_cancel_message_at = 0;
  do
  :: mass_cancel_message_at < 4 -> mass_cancel_message_record.instrument_id[mass_cancel_message_at] = mass_cancel_message_value; mass_cancel_message_at = mass_cancel_message_at + 1
  :: else -> break
  od;
  mass_cancel_message_at = 0;
  do
  :: mass_cancel_message_at < 13 -> mass_cancel_message_record.underlying_symbol[mass_cancel_message_at] = mass_cancel_message_value; mass_cancel_message_at = mass_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mass Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_mass_cancel_message(mass_cancel_message_record, mass_cancel_message_base) {
  mass_cancel_message_at = 0;
  do
  :: mass_cancel_message_at < 4 -> mass_cancel_message_record.firm_id[mass_cancel_message_at] = (mass_cancel_message_base + 0 + mass_cancel_message_at + 1) % 256; mass_cancel_message_at = mass_cancel_message_at + 1
  :: else -> break
  od;
  mass_cancel_message_at = 0;
  do
  :: mass_cancel_message_at < 16 -> mass_cancel_message_record.cl_request_id[mass_cancel_message_at] = (mass_cancel_message_base + 4 + mass_cancel_message_at + 1) % 256; mass_cancel_message_at = mass_cancel_message_at + 1
  :: else -> break
  od;
  mass_cancel_message_record.instrument_type = (mass_cancel_message_base + 20 + 1) % 256;
  mass_cancel_message_record.scope = (mass_cancel_message_base + 21 + 1) % 256;
  mass_cancel_message_at = 0;
  do
  :: mass_cancel_message_at < 2 -> mass_cancel_message_record.product_id[mass_cancel_message_at] = (mass_cancel_message_base + 22 + mass_cancel_message_at + 1) % 256; mass_cancel_message_at = mass_cancel_message_at + 1
  :: else -> break
  od;
  mass_cancel_message_at = 0;
  do
  :: mass_cancel_message_at < 4 -> mass_cancel_message_record.instrument_id[mass_cancel_message_at] = (mass_cancel_message_base + 24 + mass_cancel_message_at + 1) % 256; mass_cancel_message_at = mass_cancel_message_at + 1
  :: else -> break
  od;
  mass_cancel_message_at = 0;
  do
  :: mass_cancel_message_at < 13 -> mass_cancel_message_record.underlying_symbol[mass_cancel_message_at] = (mass_cancel_message_base + 28 + mass_cancel_message_at + 1) % 256; mass_cancel_message_at = mass_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Message to the wire, 41 bytes from where the cursor stands */
inline encode_mass_cancel_message(mass_cancel_message_record) {
  mass_cancel_message_at = 0;
  do
  :: mass_cancel_message_at < 4 -> wire[at] = mass_cancel_message_record.firm_id[mass_cancel_message_at]; at = at + 1; mass_cancel_message_at = mass_cancel_message_at + 1
  :: else -> break
  od;
  mass_cancel_message_at = 0;
  do
  :: mass_cancel_message_at < 16 -> wire[at] = mass_cancel_message_record.cl_request_id[mass_cancel_message_at]; at = at + 1; mass_cancel_message_at = mass_cancel_message_at + 1
  :: else -> break
  od;
  wire[at] = mass_cancel_message_record.instrument_type; at = at + 1;
  wire[at] = mass_cancel_message_record.scope; at = at + 1;
  mass_cancel_message_at = 0;
  do
  :: mass_cancel_message_at < 2 -> wire[at] = mass_cancel_message_record.product_id[mass_cancel_message_at]; at = at + 1; mass_cancel_message_at = mass_cancel_message_at + 1
  :: else -> break
  od;
  mass_cancel_message_at = 0;
  do
  :: mass_cancel_message_at < 4 -> wire[at] = mass_cancel_message_record.instrument_id[mass_cancel_message_at]; at = at + 1; mass_cancel_message_at = mass_cancel_message_at + 1
  :: else -> break
  od;
  mass_cancel_message_at = 0;
  do
  :: mass_cancel_message_at < 13 -> wire[at] = mass_cancel_message_record.underlying_symbol[mass_cancel_message_at]; at = at + 1; mass_cancel_message_at = mass_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Message off the wire, 41 bytes from where the cursor stands */
inline decode_mass_cancel_message(mass_cancel_message_record) {
  mass_cancel_message_at = 0;
  do
  :: mass_cancel_message_at < 4 -> mass_cancel_message_record.firm_id[mass_cancel_message_at] = wire[at]; at = at + 1; mass_cancel_message_at = mass_cancel_message_at + 1
  :: else -> break
  od;
  mass_cancel_message_at = 0;
  do
  :: mass_cancel_message_at < 16 -> mass_cancel_message_record.cl_request_id[mass_cancel_message_at] = wire[at]; at = at + 1; mass_cancel_message_at = mass_cancel_message_at + 1
  :: else -> break
  od;
  mass_cancel_message_record.instrument_type = wire[at]; at = at + 1;
  mass_cancel_message_record.scope = wire[at]; at = at + 1;
  mass_cancel_message_at = 0;
  do
  :: mass_cancel_message_at < 2 -> mass_cancel_message_record.product_id[mass_cancel_message_at] = wire[at]; at = at + 1; mass_cancel_message_at = mass_cancel_message_at + 1
  :: else -> break
  od;
  mass_cancel_message_at = 0;
  do
  :: mass_cancel_message_at < 4 -> mass_cancel_message_record.instrument_id[mass_cancel_message_at] = wire[at]; at = at + 1; mass_cancel_message_at = mass_cancel_message_at + 1
  :: else -> break
  od;
  mass_cancel_message_at = 0;
  do
  :: mass_cancel_message_at < 13 -> mass_cancel_message_record.underlying_symbol[mass_cancel_message_at] = wire[at]; at = at + 1; mass_cancel_message_at = mass_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mass Cancel Message is what was written, byte for byte */
inline equal_mass_cancel_message(mass_cancel_message_read, mass_cancel_message_written) {
  mass_cancel_message_at = 0;
  do
  :: mass_cancel_message_at < 4 -> assert(mass_cancel_message_read.firm_id[mass_cancel_message_at] == mass_cancel_message_written.firm_id[mass_cancel_message_at]); mass_cancel_message_at = mass_cancel_message_at + 1
  :: else -> break
  od;
  mass_cancel_message_at = 0;
  do
  :: mass_cancel_message_at < 16 -> assert(mass_cancel_message_read.cl_request_id[mass_cancel_message_at] == mass_cancel_message_written.cl_request_id[mass_cancel_message_at]); mass_cancel_message_at = mass_cancel_message_at + 1
  :: else -> break
  od;
  assert(mass_cancel_message_read.instrument_type == mass_cancel_message_written.instrument_type);
  assert(mass_cancel_message_read.scope == mass_cancel_message_written.scope);
  mass_cancel_message_at = 0;
  do
  :: mass_cancel_message_at < 2 -> assert(mass_cancel_message_read.product_id[mass_cancel_message_at] == mass_cancel_message_written.product_id[mass_cancel_message_at]); mass_cancel_message_at = mass_cancel_message_at + 1
  :: else -> break
  od;
  mass_cancel_message_at = 0;
  do
  :: mass_cancel_message_at < 4 -> assert(mass_cancel_message_read.instrument_id[mass_cancel_message_at] == mass_cancel_message_written.instrument_id[mass_cancel_message_at]); mass_cancel_message_at = mass_cancel_message_at + 1
  :: else -> break
  od;
  mass_cancel_message_at = 0;
  do
  :: mass_cancel_message_at < 13 -> assert(mass_cancel_message_read.underlying_symbol[mass_cancel_message_at] == mass_cancel_message_written.underlying_symbol[mass_cancel_message_at]); mass_cancel_message_at = mass_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- New Cross Order Message: 142 bytes -------------------------------------- */

/* Cross Order message allows specifying two opposite sides to trade against each other. The primary side of the order is exposed in an auction if CrossType is set to A (Auction). */
typedef NewCrossOrderMessage {
  byte firm_id[4];
  byte instrument_id[4];
  byte cross_type;
  byte auction_type;
  byte auction_alloc_pct;
  byte side;
  byte iso;
  byte price_protection;
  byte effective_time[8];
  byte disclosure_mask;
  byte primary_cl_ord_id[16];
  byte primary_cmta[4];
  byte primary_clearing_account[4];
  byte primary_occ_account[4];
  byte primary_cust_acct[10];
  byte primary_price[8];
  byte primary_quantity[4];
  byte primary_capacity;
  byte primary_position_effect_mask[2];
  byte primary_stock_leg_short_sale;
  byte primary_stock_leg_mpid[4];
  byte primary_stock_capacity;
  byte contra_cl_ord_id[16];
  byte contra_cmta[4];
  byte contra_clearing_account[4];
  byte contra_occ_account[4];
  byte contra_cust_acct[10];
  byte contra_order_type;
  byte contra_price[8];
  byte contra_quantity[4];
  byte contra_capacity;
  byte contra_position_effect_mask[2];
  byte contra_stock_leg_short_sale;
  byte contra_stock_leg_mpid[4];
  byte contra_stock_capacity
};

int new_cross_order_message_at;

/* every byte of New Cross Order Message set to one value */
inline fill_new_cross_order_message(new_cross_order_message_record, new_cross_order_message_value) {
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.firm_id[new_cross_order_message_at] = new_cross_order_message_value; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.instrument_id[new_cross_order_message_at] = new_cross_order_message_value; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.cross_type = new_cross_order_message_value;
  new_cross_order_message_record.auction_type = new_cross_order_message_value;
  new_cross_order_message_record.auction_alloc_pct = new_cross_order_message_value;
  new_cross_order_message_record.side = new_cross_order_message_value;
  new_cross_order_message_record.iso = new_cross_order_message_value;
  new_cross_order_message_record.price_protection = new_cross_order_message_value;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 8 -> new_cross_order_message_record.effective_time[new_cross_order_message_at] = new_cross_order_message_value; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.disclosure_mask = new_cross_order_message_value;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 16 -> new_cross_order_message_record.primary_cl_ord_id[new_cross_order_message_at] = new_cross_order_message_value; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.primary_cmta[new_cross_order_message_at] = new_cross_order_message_value; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.primary_clearing_account[new_cross_order_message_at] = new_cross_order_message_value; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.primary_occ_account[new_cross_order_message_at] = new_cross_order_message_value; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 10 -> new_cross_order_message_record.primary_cust_acct[new_cross_order_message_at] = new_cross_order_message_value; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 8 -> new_cross_order_message_record.primary_price[new_cross_order_message_at] = new_cross_order_message_value; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.primary_quantity[new_cross_order_message_at] = new_cross_order_message_value; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.primary_capacity = new_cross_order_message_value;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 2 -> new_cross_order_message_record.primary_position_effect_mask[new_cross_order_message_at] = new_cross_order_message_value; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.primary_stock_leg_short_sale = new_cross_order_message_value;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.primary_stock_leg_mpid[new_cross_order_message_at] = new_cross_order_message_value; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.primary_stock_capacity = new_cross_order_message_value;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 16 -> new_cross_order_message_record.contra_cl_ord_id[new_cross_order_message_at] = new_cross_order_message_value; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.contra_cmta[new_cross_order_message_at] = new_cross_order_message_value; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.contra_clearing_account[new_cross_order_message_at] = new_cross_order_message_value; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.contra_occ_account[new_cross_order_message_at] = new_cross_order_message_value; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 10 -> new_cross_order_message_record.contra_cust_acct[new_cross_order_message_at] = new_cross_order_message_value; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.contra_order_type = new_cross_order_message_value;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 8 -> new_cross_order_message_record.contra_price[new_cross_order_message_at] = new_cross_order_message_value; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.contra_quantity[new_cross_order_message_at] = new_cross_order_message_value; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.contra_capacity = new_cross_order_message_value;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 2 -> new_cross_order_message_record.contra_position_effect_mask[new_cross_order_message_at] = new_cross_order_message_value; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.contra_stock_leg_short_sale = new_cross_order_message_value;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.contra_stock_leg_mpid[new_cross_order_message_at] = new_cross_order_message_value; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.contra_stock_capacity = new_cross_order_message_value;
  skip
}

/* each byte of New Cross Order Message set to where it lies, so a field read out of place says so */
inline ramp_new_cross_order_message(new_cross_order_message_record, new_cross_order_message_base) {
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.firm_id[new_cross_order_message_at] = (new_cross_order_message_base + 0 + new_cross_order_message_at + 1) % 256; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.instrument_id[new_cross_order_message_at] = (new_cross_order_message_base + 4 + new_cross_order_message_at + 1) % 256; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.cross_type = (new_cross_order_message_base + 8 + 1) % 256;
  new_cross_order_message_record.auction_type = (new_cross_order_message_base + 9 + 1) % 256;
  new_cross_order_message_record.auction_alloc_pct = (new_cross_order_message_base + 10 + 1) % 256;
  new_cross_order_message_record.side = (new_cross_order_message_base + 11 + 1) % 256;
  new_cross_order_message_record.iso = (new_cross_order_message_base + 12 + 1) % 256;
  new_cross_order_message_record.price_protection = (new_cross_order_message_base + 13 + 1) % 256;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 8 -> new_cross_order_message_record.effective_time[new_cross_order_message_at] = (new_cross_order_message_base + 14 + new_cross_order_message_at + 1) % 256; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.disclosure_mask = (new_cross_order_message_base + 22 + 1) % 256;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 16 -> new_cross_order_message_record.primary_cl_ord_id[new_cross_order_message_at] = (new_cross_order_message_base + 23 + new_cross_order_message_at + 1) % 256; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.primary_cmta[new_cross_order_message_at] = (new_cross_order_message_base + 39 + new_cross_order_message_at + 1) % 256; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.primary_clearing_account[new_cross_order_message_at] = (new_cross_order_message_base + 43 + new_cross_order_message_at + 1) % 256; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.primary_occ_account[new_cross_order_message_at] = (new_cross_order_message_base + 47 + new_cross_order_message_at + 1) % 256; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 10 -> new_cross_order_message_record.primary_cust_acct[new_cross_order_message_at] = (new_cross_order_message_base + 51 + new_cross_order_message_at + 1) % 256; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 8 -> new_cross_order_message_record.primary_price[new_cross_order_message_at] = (new_cross_order_message_base + 61 + new_cross_order_message_at + 1) % 256; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.primary_quantity[new_cross_order_message_at] = (new_cross_order_message_base + 69 + new_cross_order_message_at + 1) % 256; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.primary_capacity = (new_cross_order_message_base + 73 + 1) % 256;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 2 -> new_cross_order_message_record.primary_position_effect_mask[new_cross_order_message_at] = (new_cross_order_message_base + 74 + new_cross_order_message_at + 1) % 256; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.primary_stock_leg_short_sale = (new_cross_order_message_base + 76 + 1) % 256;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.primary_stock_leg_mpid[new_cross_order_message_at] = (new_cross_order_message_base + 77 + new_cross_order_message_at + 1) % 256; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.primary_stock_capacity = (new_cross_order_message_base + 81 + 1) % 256;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 16 -> new_cross_order_message_record.contra_cl_ord_id[new_cross_order_message_at] = (new_cross_order_message_base + 82 + new_cross_order_message_at + 1) % 256; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.contra_cmta[new_cross_order_message_at] = (new_cross_order_message_base + 98 + new_cross_order_message_at + 1) % 256; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.contra_clearing_account[new_cross_order_message_at] = (new_cross_order_message_base + 102 + new_cross_order_message_at + 1) % 256; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.contra_occ_account[new_cross_order_message_at] = (new_cross_order_message_base + 106 + new_cross_order_message_at + 1) % 256; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 10 -> new_cross_order_message_record.contra_cust_acct[new_cross_order_message_at] = (new_cross_order_message_base + 110 + new_cross_order_message_at + 1) % 256; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.contra_order_type = (new_cross_order_message_base + 120 + 1) % 256;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 8 -> new_cross_order_message_record.contra_price[new_cross_order_message_at] = (new_cross_order_message_base + 121 + new_cross_order_message_at + 1) % 256; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.contra_quantity[new_cross_order_message_at] = (new_cross_order_message_base + 129 + new_cross_order_message_at + 1) % 256; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.contra_capacity = (new_cross_order_message_base + 133 + 1) % 256;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 2 -> new_cross_order_message_record.contra_position_effect_mask[new_cross_order_message_at] = (new_cross_order_message_base + 134 + new_cross_order_message_at + 1) % 256; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.contra_stock_leg_short_sale = (new_cross_order_message_base + 136 + 1) % 256;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.contra_stock_leg_mpid[new_cross_order_message_at] = (new_cross_order_message_base + 137 + new_cross_order_message_at + 1) % 256; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.contra_stock_capacity = (new_cross_order_message_base + 141 + 1) % 256;
  skip
}

/* New Cross Order Message to the wire, 142 bytes from where the cursor stands */
inline encode_new_cross_order_message(new_cross_order_message_record) {
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> wire[at] = new_cross_order_message_record.firm_id[new_cross_order_message_at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> wire[at] = new_cross_order_message_record.instrument_id[new_cross_order_message_at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  wire[at] = new_cross_order_message_record.cross_type; at = at + 1;
  wire[at] = new_cross_order_message_record.auction_type; at = at + 1;
  wire[at] = new_cross_order_message_record.auction_alloc_pct; at = at + 1;
  wire[at] = new_cross_order_message_record.side; at = at + 1;
  wire[at] = new_cross_order_message_record.iso; at = at + 1;
  wire[at] = new_cross_order_message_record.price_protection; at = at + 1;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 8 -> wire[at] = new_cross_order_message_record.effective_time[new_cross_order_message_at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  wire[at] = new_cross_order_message_record.disclosure_mask; at = at + 1;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 16 -> wire[at] = new_cross_order_message_record.primary_cl_ord_id[new_cross_order_message_at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> wire[at] = new_cross_order_message_record.primary_cmta[new_cross_order_message_at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> wire[at] = new_cross_order_message_record.primary_clearing_account[new_cross_order_message_at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> wire[at] = new_cross_order_message_record.primary_occ_account[new_cross_order_message_at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 10 -> wire[at] = new_cross_order_message_record.primary_cust_acct[new_cross_order_message_at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 8 -> wire[at] = new_cross_order_message_record.primary_price[new_cross_order_message_at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> wire[at] = new_cross_order_message_record.primary_quantity[new_cross_order_message_at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  wire[at] = new_cross_order_message_record.primary_capacity; at = at + 1;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 2 -> wire[at] = new_cross_order_message_record.primary_position_effect_mask[new_cross_order_message_at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  wire[at] = new_cross_order_message_record.primary_stock_leg_short_sale; at = at + 1;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> wire[at] = new_cross_order_message_record.primary_stock_leg_mpid[new_cross_order_message_at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  wire[at] = new_cross_order_message_record.primary_stock_capacity; at = at + 1;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 16 -> wire[at] = new_cross_order_message_record.contra_cl_ord_id[new_cross_order_message_at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> wire[at] = new_cross_order_message_record.contra_cmta[new_cross_order_message_at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> wire[at] = new_cross_order_message_record.contra_clearing_account[new_cross_order_message_at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> wire[at] = new_cross_order_message_record.contra_occ_account[new_cross_order_message_at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 10 -> wire[at] = new_cross_order_message_record.contra_cust_acct[new_cross_order_message_at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  wire[at] = new_cross_order_message_record.contra_order_type; at = at + 1;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 8 -> wire[at] = new_cross_order_message_record.contra_price[new_cross_order_message_at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> wire[at] = new_cross_order_message_record.contra_quantity[new_cross_order_message_at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  wire[at] = new_cross_order_message_record.contra_capacity; at = at + 1;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 2 -> wire[at] = new_cross_order_message_record.contra_position_effect_mask[new_cross_order_message_at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  wire[at] = new_cross_order_message_record.contra_stock_leg_short_sale; at = at + 1;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> wire[at] = new_cross_order_message_record.contra_stock_leg_mpid[new_cross_order_message_at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  wire[at] = new_cross_order_message_record.contra_stock_capacity; at = at + 1;
  skip
}

/* New Cross Order Message off the wire, 142 bytes from where the cursor stands */
inline decode_new_cross_order_message(new_cross_order_message_record) {
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.firm_id[new_cross_order_message_at] = wire[at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.instrument_id[new_cross_order_message_at] = wire[at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.cross_type = wire[at]; at = at + 1;
  new_cross_order_message_record.auction_type = wire[at]; at = at + 1;
  new_cross_order_message_record.auction_alloc_pct = wire[at]; at = at + 1;
  new_cross_order_message_record.side = wire[at]; at = at + 1;
  new_cross_order_message_record.iso = wire[at]; at = at + 1;
  new_cross_order_message_record.price_protection = wire[at]; at = at + 1;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 8 -> new_cross_order_message_record.effective_time[new_cross_order_message_at] = wire[at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.disclosure_mask = wire[at]; at = at + 1;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 16 -> new_cross_order_message_record.primary_cl_ord_id[new_cross_order_message_at] = wire[at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.primary_cmta[new_cross_order_message_at] = wire[at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.primary_clearing_account[new_cross_order_message_at] = wire[at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.primary_occ_account[new_cross_order_message_at] = wire[at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 10 -> new_cross_order_message_record.primary_cust_acct[new_cross_order_message_at] = wire[at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 8 -> new_cross_order_message_record.primary_price[new_cross_order_message_at] = wire[at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.primary_quantity[new_cross_order_message_at] = wire[at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.primary_capacity = wire[at]; at = at + 1;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 2 -> new_cross_order_message_record.primary_position_effect_mask[new_cross_order_message_at] = wire[at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.primary_stock_leg_short_sale = wire[at]; at = at + 1;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.primary_stock_leg_mpid[new_cross_order_message_at] = wire[at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.primary_stock_capacity = wire[at]; at = at + 1;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 16 -> new_cross_order_message_record.contra_cl_ord_id[new_cross_order_message_at] = wire[at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.contra_cmta[new_cross_order_message_at] = wire[at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.contra_clearing_account[new_cross_order_message_at] = wire[at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.contra_occ_account[new_cross_order_message_at] = wire[at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 10 -> new_cross_order_message_record.contra_cust_acct[new_cross_order_message_at] = wire[at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.contra_order_type = wire[at]; at = at + 1;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 8 -> new_cross_order_message_record.contra_price[new_cross_order_message_at] = wire[at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.contra_quantity[new_cross_order_message_at] = wire[at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.contra_capacity = wire[at]; at = at + 1;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 2 -> new_cross_order_message_record.contra_position_effect_mask[new_cross_order_message_at] = wire[at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.contra_stock_leg_short_sale = wire[at]; at = at + 1;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> new_cross_order_message_record.contra_stock_leg_mpid[new_cross_order_message_at] = wire[at]; at = at + 1; new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_record.contra_stock_capacity = wire[at]; at = at + 1;
  skip
}

/* what was read of New Cross Order Message is what was written, byte for byte */
inline equal_new_cross_order_message(new_cross_order_message_read, new_cross_order_message_written) {
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> assert(new_cross_order_message_read.firm_id[new_cross_order_message_at] == new_cross_order_message_written.firm_id[new_cross_order_message_at]); new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> assert(new_cross_order_message_read.instrument_id[new_cross_order_message_at] == new_cross_order_message_written.instrument_id[new_cross_order_message_at]); new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  assert(new_cross_order_message_read.cross_type == new_cross_order_message_written.cross_type);
  assert(new_cross_order_message_read.auction_type == new_cross_order_message_written.auction_type);
  assert(new_cross_order_message_read.auction_alloc_pct == new_cross_order_message_written.auction_alloc_pct);
  assert(new_cross_order_message_read.side == new_cross_order_message_written.side);
  assert(new_cross_order_message_read.iso == new_cross_order_message_written.iso);
  assert(new_cross_order_message_read.price_protection == new_cross_order_message_written.price_protection);
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 8 -> assert(new_cross_order_message_read.effective_time[new_cross_order_message_at] == new_cross_order_message_written.effective_time[new_cross_order_message_at]); new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  assert(new_cross_order_message_read.disclosure_mask == new_cross_order_message_written.disclosure_mask);
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 16 -> assert(new_cross_order_message_read.primary_cl_ord_id[new_cross_order_message_at] == new_cross_order_message_written.primary_cl_ord_id[new_cross_order_message_at]); new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> assert(new_cross_order_message_read.primary_cmta[new_cross_order_message_at] == new_cross_order_message_written.primary_cmta[new_cross_order_message_at]); new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> assert(new_cross_order_message_read.primary_clearing_account[new_cross_order_message_at] == new_cross_order_message_written.primary_clearing_account[new_cross_order_message_at]); new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> assert(new_cross_order_message_read.primary_occ_account[new_cross_order_message_at] == new_cross_order_message_written.primary_occ_account[new_cross_order_message_at]); new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 10 -> assert(new_cross_order_message_read.primary_cust_acct[new_cross_order_message_at] == new_cross_order_message_written.primary_cust_acct[new_cross_order_message_at]); new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 8 -> assert(new_cross_order_message_read.primary_price[new_cross_order_message_at] == new_cross_order_message_written.primary_price[new_cross_order_message_at]); new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> assert(new_cross_order_message_read.primary_quantity[new_cross_order_message_at] == new_cross_order_message_written.primary_quantity[new_cross_order_message_at]); new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  assert(new_cross_order_message_read.primary_capacity == new_cross_order_message_written.primary_capacity);
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 2 -> assert(new_cross_order_message_read.primary_position_effect_mask[new_cross_order_message_at] == new_cross_order_message_written.primary_position_effect_mask[new_cross_order_message_at]); new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  assert(new_cross_order_message_read.primary_stock_leg_short_sale == new_cross_order_message_written.primary_stock_leg_short_sale);
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> assert(new_cross_order_message_read.primary_stock_leg_mpid[new_cross_order_message_at] == new_cross_order_message_written.primary_stock_leg_mpid[new_cross_order_message_at]); new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  assert(new_cross_order_message_read.primary_stock_capacity == new_cross_order_message_written.primary_stock_capacity);
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 16 -> assert(new_cross_order_message_read.contra_cl_ord_id[new_cross_order_message_at] == new_cross_order_message_written.contra_cl_ord_id[new_cross_order_message_at]); new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> assert(new_cross_order_message_read.contra_cmta[new_cross_order_message_at] == new_cross_order_message_written.contra_cmta[new_cross_order_message_at]); new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> assert(new_cross_order_message_read.contra_clearing_account[new_cross_order_message_at] == new_cross_order_message_written.contra_clearing_account[new_cross_order_message_at]); new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> assert(new_cross_order_message_read.contra_occ_account[new_cross_order_message_at] == new_cross_order_message_written.contra_occ_account[new_cross_order_message_at]); new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 10 -> assert(new_cross_order_message_read.contra_cust_acct[new_cross_order_message_at] == new_cross_order_message_written.contra_cust_acct[new_cross_order_message_at]); new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  assert(new_cross_order_message_read.contra_order_type == new_cross_order_message_written.contra_order_type);
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 8 -> assert(new_cross_order_message_read.contra_price[new_cross_order_message_at] == new_cross_order_message_written.contra_price[new_cross_order_message_at]); new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> assert(new_cross_order_message_read.contra_quantity[new_cross_order_message_at] == new_cross_order_message_written.contra_quantity[new_cross_order_message_at]); new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  assert(new_cross_order_message_read.contra_capacity == new_cross_order_message_written.contra_capacity);
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 2 -> assert(new_cross_order_message_read.contra_position_effect_mask[new_cross_order_message_at] == new_cross_order_message_written.contra_position_effect_mask[new_cross_order_message_at]); new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  assert(new_cross_order_message_read.contra_stock_leg_short_sale == new_cross_order_message_written.contra_stock_leg_short_sale);
  new_cross_order_message_at = 0;
  do
  :: new_cross_order_message_at < 4 -> assert(new_cross_order_message_read.contra_stock_leg_mpid[new_cross_order_message_at] == new_cross_order_message_written.contra_stock_leg_mpid[new_cross_order_message_at]); new_cross_order_message_at = new_cross_order_message_at + 1
  :: else -> break
  od;
  assert(new_cross_order_message_read.contra_stock_capacity == new_cross_order_message_written.contra_stock_capacity);
  skip
}

/* ---- Member Kill Switch Request Message: 25 bytes ---------------------------- */

/* The Member Kill Switch Request is used to block ability to enter new orders, alter existing orders, delete orders, and create complex instruments on MRX. */
typedef MemberKillSwitchRequestMessage {
  byte firm_id[4];
  byte cl_request_id[16];
  byte target_firm_id[4];
  byte kill_action
};

int member_kill_switch_request_message_at;

/* every byte of Member Kill Switch Request Message set to one value */
inline fill_member_kill_switch_request_message(member_kill_switch_request_message_record, member_kill_switch_request_message_value) {
  member_kill_switch_request_message_at = 0;
  do
  :: member_kill_switch_request_message_at < 4 -> member_kill_switch_request_message_record.firm_id[member_kill_switch_request_message_at] = member_kill_switch_request_message_value; member_kill_switch_request_message_at = member_kill_switch_request_message_at + 1
  :: else -> break
  od;
  member_kill_switch_request_message_at = 0;
  do
  :: member_kill_switch_request_message_at < 16 -> member_kill_switch_request_message_record.cl_request_id[member_kill_switch_request_message_at] = member_kill_switch_request_message_value; member_kill_switch_request_message_at = member_kill_switch_request_message_at + 1
  :: else -> break
  od;
  member_kill_switch_request_message_at = 0;
  do
  :: member_kill_switch_request_message_at < 4 -> member_kill_switch_request_message_record.target_firm_id[member_kill_switch_request_message_at] = member_kill_switch_request_message_value; member_kill_switch_request_message_at = member_kill_switch_request_message_at + 1
  :: else -> break
  od;
  member_kill_switch_request_message_record.kill_action = member_kill_switch_request_message_value;
  skip
}

/* each byte of Member Kill Switch Request Message set to where it lies, so a field read out of place says so */
inline ramp_member_kill_switch_request_message(member_kill_switch_request_message_record, member_kill_switch_request_message_base) {
  member_kill_switch_request_message_at = 0;
  do
  :: member_kill_switch_request_message_at < 4 -> member_kill_switch_request_message_record.firm_id[member_kill_switch_request_message_at] = (member_kill_switch_request_message_base + 0 + member_kill_switch_request_message_at + 1) % 256; member_kill_switch_request_message_at = member_kill_switch_request_message_at + 1
  :: else -> break
  od;
  member_kill_switch_request_message_at = 0;
  do
  :: member_kill_switch_request_message_at < 16 -> member_kill_switch_request_message_record.cl_request_id[member_kill_switch_request_message_at] = (member_kill_switch_request_message_base + 4 + member_kill_switch_request_message_at + 1) % 256; member_kill_switch_request_message_at = member_kill_switch_request_message_at + 1
  :: else -> break
  od;
  member_kill_switch_request_message_at = 0;
  do
  :: member_kill_switch_request_message_at < 4 -> member_kill_switch_request_message_record.target_firm_id[member_kill_switch_request_message_at] = (member_kill_switch_request_message_base + 20 + member_kill_switch_request_message_at + 1) % 256; member_kill_switch_request_message_at = member_kill_switch_request_message_at + 1
  :: else -> break
  od;
  member_kill_switch_request_message_record.kill_action = (member_kill_switch_request_message_base + 24 + 1) % 256;
  skip
}

/* Member Kill Switch Request Message to the wire, 25 bytes from where the cursor stands */
inline encode_member_kill_switch_request_message(member_kill_switch_request_message_record) {
  member_kill_switch_request_message_at = 0;
  do
  :: member_kill_switch_request_message_at < 4 -> wire[at] = member_kill_switch_request_message_record.firm_id[member_kill_switch_request_message_at]; at = at + 1; member_kill_switch_request_message_at = member_kill_switch_request_message_at + 1
  :: else -> break
  od;
  member_kill_switch_request_message_at = 0;
  do
  :: member_kill_switch_request_message_at < 16 -> wire[at] = member_kill_switch_request_message_record.cl_request_id[member_kill_switch_request_message_at]; at = at + 1; member_kill_switch_request_message_at = member_kill_switch_request_message_at + 1
  :: else -> break
  od;
  member_kill_switch_request_message_at = 0;
  do
  :: member_kill_switch_request_message_at < 4 -> wire[at] = member_kill_switch_request_message_record.target_firm_id[member_kill_switch_request_message_at]; at = at + 1; member_kill_switch_request_message_at = member_kill_switch_request_message_at + 1
  :: else -> break
  od;
  wire[at] = member_kill_switch_request_message_record.kill_action; at = at + 1;
  skip
}

/* Member Kill Switch Request Message off the wire, 25 bytes from where the cursor stands */
inline decode_member_kill_switch_request_message(member_kill_switch_request_message_record) {
  member_kill_switch_request_message_at = 0;
  do
  :: member_kill_switch_request_message_at < 4 -> member_kill_switch_request_message_record.firm_id[member_kill_switch_request_message_at] = wire[at]; at = at + 1; member_kill_switch_request_message_at = member_kill_switch_request_message_at + 1
  :: else -> break
  od;
  member_kill_switch_request_message_at = 0;
  do
  :: member_kill_switch_request_message_at < 16 -> member_kill_switch_request_message_record.cl_request_id[member_kill_switch_request_message_at] = wire[at]; at = at + 1; member_kill_switch_request_message_at = member_kill_switch_request_message_at + 1
  :: else -> break
  od;
  member_kill_switch_request_message_at = 0;
  do
  :: member_kill_switch_request_message_at < 4 -> member_kill_switch_request_message_record.target_firm_id[member_kill_switch_request_message_at] = wire[at]; at = at + 1; member_kill_switch_request_message_at = member_kill_switch_request_message_at + 1
  :: else -> break
  od;
  member_kill_switch_request_message_record.kill_action = wire[at]; at = at + 1;
  skip
}

/* what was read of Member Kill Switch Request Message is what was written, byte for byte */
inline equal_member_kill_switch_request_message(member_kill_switch_request_message_read, member_kill_switch_request_message_written) {
  member_kill_switch_request_message_at = 0;
  do
  :: member_kill_switch_request_message_at < 4 -> assert(member_kill_switch_request_message_read.firm_id[member_kill_switch_request_message_at] == member_kill_switch_request_message_written.firm_id[member_kill_switch_request_message_at]); member_kill_switch_request_message_at = member_kill_switch_request_message_at + 1
  :: else -> break
  od;
  member_kill_switch_request_message_at = 0;
  do
  :: member_kill_switch_request_message_at < 16 -> assert(member_kill_switch_request_message_read.cl_request_id[member_kill_switch_request_message_at] == member_kill_switch_request_message_written.cl_request_id[member_kill_switch_request_message_at]); member_kill_switch_request_message_at = member_kill_switch_request_message_at + 1
  :: else -> break
  od;
  member_kill_switch_request_message_at = 0;
  do
  :: member_kill_switch_request_message_at < 4 -> assert(member_kill_switch_request_message_read.target_firm_id[member_kill_switch_request_message_at] == member_kill_switch_request_message_written.target_firm_id[member_kill_switch_request_message_at]); member_kill_switch_request_message_at = member_kill_switch_request_message_at + 1
  :: else -> break
  od;
  assert(member_kill_switch_request_message_read.kill_action == member_kill_switch_request_message_written.kill_action);
  skip
}

/* ---- Subscription Request Message: 36 bytes ---------------------------------- */

/* OTTO protocol specifies a number of notification message types that can be sent to the client optionally. */
typedef SubscriptionRequestMessage {
  byte firm_id[4];
  byte cl_request_id[16];
  byte subscription[16]
};

int subscription_request_message_at;

/* every byte of Subscription Request Message set to one value */
inline fill_subscription_request_message(subscription_request_message_record, subscription_request_message_value) {
  subscription_request_message_at = 0;
  do
  :: subscription_request_message_at < 4 -> subscription_request_message_record.firm_id[subscription_request_message_at] = subscription_request_message_value; subscription_request_message_at = subscription_request_message_at + 1
  :: else -> break
  od;
  subscription_request_message_at = 0;
  do
  :: subscription_request_message_at < 16 -> subscription_request_message_record.cl_request_id[subscription_request_message_at] = subscription_request_message_value; subscription_request_message_at = subscription_request_message_at + 1
  :: else -> break
  od;
  subscription_request_message_at = 0;
  do
  :: subscription_request_message_at < 16 -> subscription_request_message_record.subscription[subscription_request_message_at] = subscription_request_message_value; subscription_request_message_at = subscription_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Subscription Request Message set to where it lies, so a field read out of place says so */
inline ramp_subscription_request_message(subscription_request_message_record, subscription_request_message_base) {
  subscription_request_message_at = 0;
  do
  :: subscription_request_message_at < 4 -> subscription_request_message_record.firm_id[subscription_request_message_at] = (subscription_request_message_base + 0 + subscription_request_message_at + 1) % 256; subscription_request_message_at = subscription_request_message_at + 1
  :: else -> break
  od;
  subscription_request_message_at = 0;
  do
  :: subscription_request_message_at < 16 -> subscription_request_message_record.cl_request_id[subscription_request_message_at] = (subscription_request_message_base + 4 + subscription_request_message_at + 1) % 256; subscription_request_message_at = subscription_request_message_at + 1
  :: else -> break
  od;
  subscription_request_message_at = 0;
  do
  :: subscription_request_message_at < 16 -> subscription_request_message_record.subscription[subscription_request_message_at] = (subscription_request_message_base + 20 + subscription_request_message_at + 1) % 256; subscription_request_message_at = subscription_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Subscription Request Message to the wire, 36 bytes from where the cursor stands */
inline encode_subscription_request_message(subscription_request_message_record) {
  subscription_request_message_at = 0;
  do
  :: subscription_request_message_at < 4 -> wire[at] = subscription_request_message_record.firm_id[subscription_request_message_at]; at = at + 1; subscription_request_message_at = subscription_request_message_at + 1
  :: else -> break
  od;
  subscription_request_message_at = 0;
  do
  :: subscription_request_message_at < 16 -> wire[at] = subscription_request_message_record.cl_request_id[subscription_request_message_at]; at = at + 1; subscription_request_message_at = subscription_request_message_at + 1
  :: else -> break
  od;
  subscription_request_message_at = 0;
  do
  :: subscription_request_message_at < 16 -> wire[at] = subscription_request_message_record.subscription[subscription_request_message_at]; at = at + 1; subscription_request_message_at = subscription_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Subscription Request Message off the wire, 36 bytes from where the cursor stands */
inline decode_subscription_request_message(subscription_request_message_record) {
  subscription_request_message_at = 0;
  do
  :: subscription_request_message_at < 4 -> subscription_request_message_record.firm_id[subscription_request_message_at] = wire[at]; at = at + 1; subscription_request_message_at = subscription_request_message_at + 1
  :: else -> break
  od;
  subscription_request_message_at = 0;
  do
  :: subscription_request_message_at < 16 -> subscription_request_message_record.cl_request_id[subscription_request_message_at] = wire[at]; at = at + 1; subscription_request_message_at = subscription_request_message_at + 1
  :: else -> break
  od;
  subscription_request_message_at = 0;
  do
  :: subscription_request_message_at < 16 -> subscription_request_message_record.subscription[subscription_request_message_at] = wire[at]; at = at + 1; subscription_request_message_at = subscription_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Subscription Request Message is what was written, byte for byte */
inline equal_subscription_request_message(subscription_request_message_read, subscription_request_message_written) {
  subscription_request_message_at = 0;
  do
  :: subscription_request_message_at < 4 -> assert(subscription_request_message_read.firm_id[subscription_request_message_at] == subscription_request_message_written.firm_id[subscription_request_message_at]); subscription_request_message_at = subscription_request_message_at + 1
  :: else -> break
  od;
  subscription_request_message_at = 0;
  do
  :: subscription_request_message_at < 16 -> assert(subscription_request_message_read.cl_request_id[subscription_request_message_at] == subscription_request_message_written.cl_request_id[subscription_request_message_at]); subscription_request_message_at = subscription_request_message_at + 1
  :: else -> break
  od;
  subscription_request_message_at = 0;
  do
  :: subscription_request_message_at < 16 -> assert(subscription_request_message_read.subscription[subscription_request_message_at] == subscription_request_message_written.subscription[subscription_request_message_at]); subscription_request_message_at = subscription_request_message_at + 1
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

/* New Order Long Form Message: encoded, read back, and compared */
proctype check_new_order_long_form_message() {
  NewOrderLongFormMessage new_order_long_form_message_sent;
  NewOrderLongFormMessage new_order_long_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_order_long_form_message(new_order_long_form_message_sent, 0)
  :: pattern == 1 -> fill_new_order_long_form_message(new_order_long_form_message_sent, 32)
  :: pattern == 2 -> fill_new_order_long_form_message(new_order_long_form_message_sent, 255)
  :: else -> ramp_new_order_long_form_message(new_order_long_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_order_long_form_message(new_order_long_form_message_sent);
    assert(at == 96);
    at = 0;
    decode_new_order_long_form_message(new_order_long_form_message_got);
    assert(at == 96);
    equal_new_order_long_form_message(new_order_long_form_message_got, new_order_long_form_message_sent)
  }
}

/* New Order Short Form Message: encoded, read back, and compared */
proctype check_new_order_short_form_message() {
  NewOrderShortFormMessage new_order_short_form_message_sent;
  NewOrderShortFormMessage new_order_short_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_order_short_form_message(new_order_short_form_message_sent, 0)
  :: pattern == 1 -> fill_new_order_short_form_message(new_order_short_form_message_sent, 32)
  :: pattern == 2 -> fill_new_order_short_form_message(new_order_short_form_message_sent, 255)
  :: else -> ramp_new_order_short_form_message(new_order_short_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_order_short_form_message(new_order_short_form_message_sent);
    assert(at == 49);
    at = 0;
    decode_new_order_short_form_message(new_order_short_form_message_got);
    assert(at == 49);
    equal_new_order_short_form_message(new_order_short_form_message_got, new_order_short_form_message_sent)
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
    assert(at == 37);
    at = 0;
    decode_replace_order_message(replace_order_message_got);
    assert(at == 37);
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
    assert(at == 20);
    at = 0;
    decode_cancel_order_message(cancel_order_message_got);
    assert(at == 20);
    equal_cancel_order_message(cancel_order_message_got, cancel_order_message_sent)
  }
}

/* Mass Cancel Message: encoded, read back, and compared */
proctype check_mass_cancel_message() {
  MassCancelMessage mass_cancel_message_sent;
  MassCancelMessage mass_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_cancel_message(mass_cancel_message_sent, 0)
  :: pattern == 1 -> fill_mass_cancel_message(mass_cancel_message_sent, 32)
  :: pattern == 2 -> fill_mass_cancel_message(mass_cancel_message_sent, 255)
  :: else -> ramp_mass_cancel_message(mass_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_cancel_message(mass_cancel_message_sent);
    assert(at == 41);
    at = 0;
    decode_mass_cancel_message(mass_cancel_message_got);
    assert(at == 41);
    equal_mass_cancel_message(mass_cancel_message_got, mass_cancel_message_sent)
  }
}

/* New Cross Order Message: encoded, read back, and compared */
proctype check_new_cross_order_message() {
  NewCrossOrderMessage new_cross_order_message_sent;
  NewCrossOrderMessage new_cross_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_cross_order_message(new_cross_order_message_sent, 0)
  :: pattern == 1 -> fill_new_cross_order_message(new_cross_order_message_sent, 32)
  :: pattern == 2 -> fill_new_cross_order_message(new_cross_order_message_sent, 255)
  :: else -> ramp_new_cross_order_message(new_cross_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_cross_order_message(new_cross_order_message_sent);
    assert(at == 142);
    at = 0;
    decode_new_cross_order_message(new_cross_order_message_got);
    assert(at == 142);
    equal_new_cross_order_message(new_cross_order_message_got, new_cross_order_message_sent)
  }
}

/* Member Kill Switch Request Message: encoded, read back, and compared */
proctype check_member_kill_switch_request_message() {
  MemberKillSwitchRequestMessage member_kill_switch_request_message_sent;
  MemberKillSwitchRequestMessage member_kill_switch_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_member_kill_switch_request_message(member_kill_switch_request_message_sent, 0)
  :: pattern == 1 -> fill_member_kill_switch_request_message(member_kill_switch_request_message_sent, 32)
  :: pattern == 2 -> fill_member_kill_switch_request_message(member_kill_switch_request_message_sent, 255)
  :: else -> ramp_member_kill_switch_request_message(member_kill_switch_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_member_kill_switch_request_message(member_kill_switch_request_message_sent);
    assert(at == 25);
    at = 0;
    decode_member_kill_switch_request_message(member_kill_switch_request_message_got);
    assert(at == 25);
    equal_member_kill_switch_request_message(member_kill_switch_request_message_got, member_kill_switch_request_message_sent)
  }
}

/* Subscription Request Message: encoded, read back, and compared */
proctype check_subscription_request_message() {
  SubscriptionRequestMessage subscription_request_message_sent;
  SubscriptionRequestMessage subscription_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_subscription_request_message(subscription_request_message_sent, 0)
  :: pattern == 1 -> fill_subscription_request_message(subscription_request_message_sent, 32)
  :: pattern == 2 -> fill_subscription_request_message(subscription_request_message_sent, 255)
  :: else -> ramp_subscription_request_message(subscription_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_subscription_request_message(subscription_request_message_sent);
    assert(at == 36);
    at = 0;
    decode_subscription_request_message(subscription_request_message_got);
    assert(at == 36);
    equal_subscription_request_message(subscription_request_message_got, subscription_request_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_client_packet_header()
  :: run check_login_request_packet()
  :: run check_new_order_long_form_message()
  :: run check_new_order_short_form_message()
  :: run check_replace_order_message()
  :: run check_cancel_order_message()
  :: run check_mass_cancel_message()
  :: run check_new_cross_order_message()
  :: run check_member_kill_switch_request_message()
  :: run check_subscription_request_message()
  fi
}
