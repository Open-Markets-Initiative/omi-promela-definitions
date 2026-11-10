/*
 * Singapore Exchange Depth Of Book
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
#define WIRE 260

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

/* ---- Seconds Message: 4 bytes ------------------------------------------------ */

/* Sent every second for which at least one Itch message is generated */
typedef SecondsMessage {
  byte second[4]
};

int seconds_message_at;

/* every byte of Seconds Message set to one value */
inline fill_seconds_message(seconds_message_record, seconds_message_value) {
  seconds_message_at = 0;
  do
  :: seconds_message_at < 4 -> seconds_message_record.second[seconds_message_at] = seconds_message_value; seconds_message_at = seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Seconds Message set to where it lies, so a field read out of place says so */
inline ramp_seconds_message(seconds_message_record, seconds_message_base) {
  seconds_message_at = 0;
  do
  :: seconds_message_at < 4 -> seconds_message_record.second[seconds_message_at] = (seconds_message_base + 0 + seconds_message_at + 1) % 256; seconds_message_at = seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* Seconds Message to the wire, 4 bytes from where the cursor stands */
inline encode_seconds_message(seconds_message_record) {
  seconds_message_at = 0;
  do
  :: seconds_message_at < 4 -> wire[at] = seconds_message_record.second[seconds_message_at]; at = at + 1; seconds_message_at = seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* Seconds Message off the wire, 4 bytes from where the cursor stands */
inline decode_seconds_message(seconds_message_record) {
  seconds_message_at = 0;
  do
  :: seconds_message_at < 4 -> seconds_message_record.second[seconds_message_at] = wire[at]; at = at + 1; seconds_message_at = seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Seconds Message is what was written, byte for byte */
inline equal_seconds_message(seconds_message_read, seconds_message_written) {
  seconds_message_at = 0;
  do
  :: seconds_message_at < 4 -> assert(seconds_message_read.second[seconds_message_at] == seconds_message_written.second[seconds_message_at]); seconds_message_at = seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Book Directory Message: 112 bytes --------------------------------- */

/* Disseminated at the start of each trading day for all active instruments */
typedef OrderBookDirectoryMessage {
  byte nanoseconds[4];
  byte order_book_id[4];
  byte symbol[32];
  byte long_name[32];
  byte reserved_12[12];
  byte financial_product;
  byte trading_currency[3];
  byte number_of_decimals_in_price[2];
  byte number_of_decimals_in_nominal_value[2];
  byte reserved_4_a[4];
  byte reserved_4_b[4];
  byte reserved_4_c[4];
  byte nominal_value[8]
};

int order_book_directory_message_at;

/* every byte of Order Book Directory Message set to one value */
inline fill_order_book_directory_message(order_book_directory_message_record, order_book_directory_message_value) {
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.nanoseconds[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.order_book_id[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> order_book_directory_message_record.symbol[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> order_book_directory_message_record.long_name[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 12 -> order_book_directory_message_record.reserved_12[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.financial_product = order_book_directory_message_value;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 3 -> order_book_directory_message_record.trading_currency[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> order_book_directory_message_record.number_of_decimals_in_price[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> order_book_directory_message_record.number_of_decimals_in_nominal_value[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.reserved_4_a[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.reserved_4_b[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.reserved_4_c[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.nominal_value[order_book_directory_message_at] = order_book_directory_message_value; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Book Directory Message set to where it lies, so a field read out of place says so */
inline ramp_order_book_directory_message(order_book_directory_message_record, order_book_directory_message_base) {
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.nanoseconds[order_book_directory_message_at] = (order_book_directory_message_base + 0 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.order_book_id[order_book_directory_message_at] = (order_book_directory_message_base + 4 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> order_book_directory_message_record.symbol[order_book_directory_message_at] = (order_book_directory_message_base + 8 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> order_book_directory_message_record.long_name[order_book_directory_message_at] = (order_book_directory_message_base + 40 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 12 -> order_book_directory_message_record.reserved_12[order_book_directory_message_at] = (order_book_directory_message_base + 72 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.financial_product = (order_book_directory_message_base + 84 + 1) % 256;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 3 -> order_book_directory_message_record.trading_currency[order_book_directory_message_at] = (order_book_directory_message_base + 85 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> order_book_directory_message_record.number_of_decimals_in_price[order_book_directory_message_at] = (order_book_directory_message_base + 88 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> order_book_directory_message_record.number_of_decimals_in_nominal_value[order_book_directory_message_at] = (order_book_directory_message_base + 90 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.reserved_4_a[order_book_directory_message_at] = (order_book_directory_message_base + 92 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.reserved_4_b[order_book_directory_message_at] = (order_book_directory_message_base + 96 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.reserved_4_c[order_book_directory_message_at] = (order_book_directory_message_base + 100 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.nominal_value[order_book_directory_message_at] = (order_book_directory_message_base + 104 + order_book_directory_message_at + 1) % 256; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Book Directory Message to the wire, 112 bytes from where the cursor stands */
inline encode_order_book_directory_message(order_book_directory_message_record) {
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> wire[at] = order_book_directory_message_record.nanoseconds[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> wire[at] = order_book_directory_message_record.order_book_id[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> wire[at] = order_book_directory_message_record.symbol[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> wire[at] = order_book_directory_message_record.long_name[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 12 -> wire[at] = order_book_directory_message_record.reserved_12[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = order_book_directory_message_record.financial_product; at = at + 1;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 3 -> wire[at] = order_book_directory_message_record.trading_currency[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> wire[at] = order_book_directory_message_record.number_of_decimals_in_price[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> wire[at] = order_book_directory_message_record.number_of_decimals_in_nominal_value[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> wire[at] = order_book_directory_message_record.reserved_4_a[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> wire[at] = order_book_directory_message_record.reserved_4_b[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> wire[at] = order_book_directory_message_record.reserved_4_c[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> wire[at] = order_book_directory_message_record.nominal_value[order_book_directory_message_at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Book Directory Message off the wire, 112 bytes from where the cursor stands */
inline decode_order_book_directory_message(order_book_directory_message_record) {
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.nanoseconds[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.order_book_id[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> order_book_directory_message_record.symbol[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> order_book_directory_message_record.long_name[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 12 -> order_book_directory_message_record.reserved_12[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_record.financial_product = wire[at]; at = at + 1;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 3 -> order_book_directory_message_record.trading_currency[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> order_book_directory_message_record.number_of_decimals_in_price[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> order_book_directory_message_record.number_of_decimals_in_nominal_value[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.reserved_4_a[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.reserved_4_b[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> order_book_directory_message_record.reserved_4_c[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> order_book_directory_message_record.nominal_value[order_book_directory_message_at] = wire[at]; at = at + 1; order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Book Directory Message is what was written, byte for byte */
inline equal_order_book_directory_message(order_book_directory_message_read, order_book_directory_message_written) {
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> assert(order_book_directory_message_read.nanoseconds[order_book_directory_message_at] == order_book_directory_message_written.nanoseconds[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> assert(order_book_directory_message_read.order_book_id[order_book_directory_message_at] == order_book_directory_message_written.order_book_id[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> assert(order_book_directory_message_read.symbol[order_book_directory_message_at] == order_book_directory_message_written.symbol[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 32 -> assert(order_book_directory_message_read.long_name[order_book_directory_message_at] == order_book_directory_message_written.long_name[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 12 -> assert(order_book_directory_message_read.reserved_12[order_book_directory_message_at] == order_book_directory_message_written.reserved_12[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  assert(order_book_directory_message_read.financial_product == order_book_directory_message_written.financial_product);
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 3 -> assert(order_book_directory_message_read.trading_currency[order_book_directory_message_at] == order_book_directory_message_written.trading_currency[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> assert(order_book_directory_message_read.number_of_decimals_in_price[order_book_directory_message_at] == order_book_directory_message_written.number_of_decimals_in_price[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 2 -> assert(order_book_directory_message_read.number_of_decimals_in_nominal_value[order_book_directory_message_at] == order_book_directory_message_written.number_of_decimals_in_nominal_value[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> assert(order_book_directory_message_read.reserved_4_a[order_book_directory_message_at] == order_book_directory_message_written.reserved_4_a[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> assert(order_book_directory_message_read.reserved_4_b[order_book_directory_message_at] == order_book_directory_message_written.reserved_4_b[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 4 -> assert(order_book_directory_message_read.reserved_4_c[order_book_directory_message_at] == order_book_directory_message_written.reserved_4_c[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  order_book_directory_message_at = 0;
  do
  :: order_book_directory_message_at < 8 -> assert(order_book_directory_message_read.nominal_value[order_book_directory_message_at] == order_book_directory_message_written.nominal_value[order_book_directory_message_at]); order_book_directory_message_at = order_book_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Combination Order Book Directory Message: 260 bytes --------------------- */

/* Specialized directory message used when Combination Order Books are traded */
typedef CombinationOrderBookDirectoryMessage {
  byte nanoseconds[4];
  byte order_book_id[4];
  byte symbol[32];
  byte long_name[32];
  byte reserved_12[12];
  byte financial_product;
  byte trading_currency[3];
  byte number_of_decimals_in_price[2];
  byte number_of_decimals_in_nominal_value[2];
  byte reserved_4_a[4];
  byte reserved_4_b[4];
  byte reserved_4_c[4];
  byte nominal_value[8];
  byte leg_1_symbol[32];
  byte leg_1_side;
  byte leg_1_ratio[4];
  byte leg_2_symbol[32];
  byte leg_2_side;
  byte leg_2_ratio[4];
  byte leg_3_symbol[32];
  byte leg_3_side;
  byte leg_3_ratio[4];
  byte leg_4_symbol[32];
  byte leg_4_side;
  byte leg_4_ratio[4]
};

int combination_order_book_directory_message_at;

/* every byte of Combination Order Book Directory Message set to one value */
inline fill_combination_order_book_directory_message(combination_order_book_directory_message_record, combination_order_book_directory_message_value) {
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.nanoseconds[combination_order_book_directory_message_at] = combination_order_book_directory_message_value; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.order_book_id[combination_order_book_directory_message_at] = combination_order_book_directory_message_value; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> combination_order_book_directory_message_record.symbol[combination_order_book_directory_message_at] = combination_order_book_directory_message_value; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> combination_order_book_directory_message_record.long_name[combination_order_book_directory_message_at] = combination_order_book_directory_message_value; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 12 -> combination_order_book_directory_message_record.reserved_12[combination_order_book_directory_message_at] = combination_order_book_directory_message_value; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_record.financial_product = combination_order_book_directory_message_value;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 3 -> combination_order_book_directory_message_record.trading_currency[combination_order_book_directory_message_at] = combination_order_book_directory_message_value; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 2 -> combination_order_book_directory_message_record.number_of_decimals_in_price[combination_order_book_directory_message_at] = combination_order_book_directory_message_value; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 2 -> combination_order_book_directory_message_record.number_of_decimals_in_nominal_value[combination_order_book_directory_message_at] = combination_order_book_directory_message_value; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.reserved_4_a[combination_order_book_directory_message_at] = combination_order_book_directory_message_value; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.reserved_4_b[combination_order_book_directory_message_at] = combination_order_book_directory_message_value; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.reserved_4_c[combination_order_book_directory_message_at] = combination_order_book_directory_message_value; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 8 -> combination_order_book_directory_message_record.nominal_value[combination_order_book_directory_message_at] = combination_order_book_directory_message_value; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> combination_order_book_directory_message_record.leg_1_symbol[combination_order_book_directory_message_at] = combination_order_book_directory_message_value; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_record.leg_1_side = combination_order_book_directory_message_value;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.leg_1_ratio[combination_order_book_directory_message_at] = combination_order_book_directory_message_value; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> combination_order_book_directory_message_record.leg_2_symbol[combination_order_book_directory_message_at] = combination_order_book_directory_message_value; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_record.leg_2_side = combination_order_book_directory_message_value;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.leg_2_ratio[combination_order_book_directory_message_at] = combination_order_book_directory_message_value; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> combination_order_book_directory_message_record.leg_3_symbol[combination_order_book_directory_message_at] = combination_order_book_directory_message_value; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_record.leg_3_side = combination_order_book_directory_message_value;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.leg_3_ratio[combination_order_book_directory_message_at] = combination_order_book_directory_message_value; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> combination_order_book_directory_message_record.leg_4_symbol[combination_order_book_directory_message_at] = combination_order_book_directory_message_value; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_record.leg_4_side = combination_order_book_directory_message_value;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.leg_4_ratio[combination_order_book_directory_message_at] = combination_order_book_directory_message_value; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Combination Order Book Directory Message set to where it lies, so a field read out of place says so */
inline ramp_combination_order_book_directory_message(combination_order_book_directory_message_record, combination_order_book_directory_message_base) {
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.nanoseconds[combination_order_book_directory_message_at] = (combination_order_book_directory_message_base + 0 + combination_order_book_directory_message_at + 1) % 256; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.order_book_id[combination_order_book_directory_message_at] = (combination_order_book_directory_message_base + 4 + combination_order_book_directory_message_at + 1) % 256; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> combination_order_book_directory_message_record.symbol[combination_order_book_directory_message_at] = (combination_order_book_directory_message_base + 8 + combination_order_book_directory_message_at + 1) % 256; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> combination_order_book_directory_message_record.long_name[combination_order_book_directory_message_at] = (combination_order_book_directory_message_base + 40 + combination_order_book_directory_message_at + 1) % 256; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 12 -> combination_order_book_directory_message_record.reserved_12[combination_order_book_directory_message_at] = (combination_order_book_directory_message_base + 72 + combination_order_book_directory_message_at + 1) % 256; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_record.financial_product = (combination_order_book_directory_message_base + 84 + 1) % 256;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 3 -> combination_order_book_directory_message_record.trading_currency[combination_order_book_directory_message_at] = (combination_order_book_directory_message_base + 85 + combination_order_book_directory_message_at + 1) % 256; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 2 -> combination_order_book_directory_message_record.number_of_decimals_in_price[combination_order_book_directory_message_at] = (combination_order_book_directory_message_base + 88 + combination_order_book_directory_message_at + 1) % 256; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 2 -> combination_order_book_directory_message_record.number_of_decimals_in_nominal_value[combination_order_book_directory_message_at] = (combination_order_book_directory_message_base + 90 + combination_order_book_directory_message_at + 1) % 256; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.reserved_4_a[combination_order_book_directory_message_at] = (combination_order_book_directory_message_base + 92 + combination_order_book_directory_message_at + 1) % 256; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.reserved_4_b[combination_order_book_directory_message_at] = (combination_order_book_directory_message_base + 96 + combination_order_book_directory_message_at + 1) % 256; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.reserved_4_c[combination_order_book_directory_message_at] = (combination_order_book_directory_message_base + 100 + combination_order_book_directory_message_at + 1) % 256; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 8 -> combination_order_book_directory_message_record.nominal_value[combination_order_book_directory_message_at] = (combination_order_book_directory_message_base + 104 + combination_order_book_directory_message_at + 1) % 256; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> combination_order_book_directory_message_record.leg_1_symbol[combination_order_book_directory_message_at] = (combination_order_book_directory_message_base + 112 + combination_order_book_directory_message_at + 1) % 256; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_record.leg_1_side = (combination_order_book_directory_message_base + 144 + 1) % 256;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.leg_1_ratio[combination_order_book_directory_message_at] = (combination_order_book_directory_message_base + 145 + combination_order_book_directory_message_at + 1) % 256; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> combination_order_book_directory_message_record.leg_2_symbol[combination_order_book_directory_message_at] = (combination_order_book_directory_message_base + 149 + combination_order_book_directory_message_at + 1) % 256; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_record.leg_2_side = (combination_order_book_directory_message_base + 181 + 1) % 256;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.leg_2_ratio[combination_order_book_directory_message_at] = (combination_order_book_directory_message_base + 182 + combination_order_book_directory_message_at + 1) % 256; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> combination_order_book_directory_message_record.leg_3_symbol[combination_order_book_directory_message_at] = (combination_order_book_directory_message_base + 186 + combination_order_book_directory_message_at + 1) % 256; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_record.leg_3_side = (combination_order_book_directory_message_base + 218 + 1) % 256;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.leg_3_ratio[combination_order_book_directory_message_at] = (combination_order_book_directory_message_base + 219 + combination_order_book_directory_message_at + 1) % 256; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> combination_order_book_directory_message_record.leg_4_symbol[combination_order_book_directory_message_at] = (combination_order_book_directory_message_base + 223 + combination_order_book_directory_message_at + 1) % 256; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_record.leg_4_side = (combination_order_book_directory_message_base + 255 + 1) % 256;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.leg_4_ratio[combination_order_book_directory_message_at] = (combination_order_book_directory_message_base + 256 + combination_order_book_directory_message_at + 1) % 256; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Combination Order Book Directory Message to the wire, 260 bytes from where the cursor stands */
inline encode_combination_order_book_directory_message(combination_order_book_directory_message_record) {
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> wire[at] = combination_order_book_directory_message_record.nanoseconds[combination_order_book_directory_message_at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> wire[at] = combination_order_book_directory_message_record.order_book_id[combination_order_book_directory_message_at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> wire[at] = combination_order_book_directory_message_record.symbol[combination_order_book_directory_message_at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> wire[at] = combination_order_book_directory_message_record.long_name[combination_order_book_directory_message_at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 12 -> wire[at] = combination_order_book_directory_message_record.reserved_12[combination_order_book_directory_message_at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = combination_order_book_directory_message_record.financial_product; at = at + 1;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 3 -> wire[at] = combination_order_book_directory_message_record.trading_currency[combination_order_book_directory_message_at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 2 -> wire[at] = combination_order_book_directory_message_record.number_of_decimals_in_price[combination_order_book_directory_message_at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 2 -> wire[at] = combination_order_book_directory_message_record.number_of_decimals_in_nominal_value[combination_order_book_directory_message_at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> wire[at] = combination_order_book_directory_message_record.reserved_4_a[combination_order_book_directory_message_at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> wire[at] = combination_order_book_directory_message_record.reserved_4_b[combination_order_book_directory_message_at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> wire[at] = combination_order_book_directory_message_record.reserved_4_c[combination_order_book_directory_message_at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 8 -> wire[at] = combination_order_book_directory_message_record.nominal_value[combination_order_book_directory_message_at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> wire[at] = combination_order_book_directory_message_record.leg_1_symbol[combination_order_book_directory_message_at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = combination_order_book_directory_message_record.leg_1_side; at = at + 1;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> wire[at] = combination_order_book_directory_message_record.leg_1_ratio[combination_order_book_directory_message_at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> wire[at] = combination_order_book_directory_message_record.leg_2_symbol[combination_order_book_directory_message_at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = combination_order_book_directory_message_record.leg_2_side; at = at + 1;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> wire[at] = combination_order_book_directory_message_record.leg_2_ratio[combination_order_book_directory_message_at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> wire[at] = combination_order_book_directory_message_record.leg_3_symbol[combination_order_book_directory_message_at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = combination_order_book_directory_message_record.leg_3_side; at = at + 1;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> wire[at] = combination_order_book_directory_message_record.leg_3_ratio[combination_order_book_directory_message_at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> wire[at] = combination_order_book_directory_message_record.leg_4_symbol[combination_order_book_directory_message_at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = combination_order_book_directory_message_record.leg_4_side; at = at + 1;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> wire[at] = combination_order_book_directory_message_record.leg_4_ratio[combination_order_book_directory_message_at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Combination Order Book Directory Message off the wire, 260 bytes from where the cursor stands */
inline decode_combination_order_book_directory_message(combination_order_book_directory_message_record) {
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.nanoseconds[combination_order_book_directory_message_at] = wire[at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.order_book_id[combination_order_book_directory_message_at] = wire[at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> combination_order_book_directory_message_record.symbol[combination_order_book_directory_message_at] = wire[at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> combination_order_book_directory_message_record.long_name[combination_order_book_directory_message_at] = wire[at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 12 -> combination_order_book_directory_message_record.reserved_12[combination_order_book_directory_message_at] = wire[at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_record.financial_product = wire[at]; at = at + 1;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 3 -> combination_order_book_directory_message_record.trading_currency[combination_order_book_directory_message_at] = wire[at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 2 -> combination_order_book_directory_message_record.number_of_decimals_in_price[combination_order_book_directory_message_at] = wire[at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 2 -> combination_order_book_directory_message_record.number_of_decimals_in_nominal_value[combination_order_book_directory_message_at] = wire[at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.reserved_4_a[combination_order_book_directory_message_at] = wire[at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.reserved_4_b[combination_order_book_directory_message_at] = wire[at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.reserved_4_c[combination_order_book_directory_message_at] = wire[at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 8 -> combination_order_book_directory_message_record.nominal_value[combination_order_book_directory_message_at] = wire[at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> combination_order_book_directory_message_record.leg_1_symbol[combination_order_book_directory_message_at] = wire[at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_record.leg_1_side = wire[at]; at = at + 1;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.leg_1_ratio[combination_order_book_directory_message_at] = wire[at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> combination_order_book_directory_message_record.leg_2_symbol[combination_order_book_directory_message_at] = wire[at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_record.leg_2_side = wire[at]; at = at + 1;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.leg_2_ratio[combination_order_book_directory_message_at] = wire[at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> combination_order_book_directory_message_record.leg_3_symbol[combination_order_book_directory_message_at] = wire[at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_record.leg_3_side = wire[at]; at = at + 1;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.leg_3_ratio[combination_order_book_directory_message_at] = wire[at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> combination_order_book_directory_message_record.leg_4_symbol[combination_order_book_directory_message_at] = wire[at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_record.leg_4_side = wire[at]; at = at + 1;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> combination_order_book_directory_message_record.leg_4_ratio[combination_order_book_directory_message_at] = wire[at]; at = at + 1; combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Combination Order Book Directory Message is what was written, byte for byte */
inline equal_combination_order_book_directory_message(combination_order_book_directory_message_read, combination_order_book_directory_message_written) {
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> assert(combination_order_book_directory_message_read.nanoseconds[combination_order_book_directory_message_at] == combination_order_book_directory_message_written.nanoseconds[combination_order_book_directory_message_at]); combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> assert(combination_order_book_directory_message_read.order_book_id[combination_order_book_directory_message_at] == combination_order_book_directory_message_written.order_book_id[combination_order_book_directory_message_at]); combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> assert(combination_order_book_directory_message_read.symbol[combination_order_book_directory_message_at] == combination_order_book_directory_message_written.symbol[combination_order_book_directory_message_at]); combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> assert(combination_order_book_directory_message_read.long_name[combination_order_book_directory_message_at] == combination_order_book_directory_message_written.long_name[combination_order_book_directory_message_at]); combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 12 -> assert(combination_order_book_directory_message_read.reserved_12[combination_order_book_directory_message_at] == combination_order_book_directory_message_written.reserved_12[combination_order_book_directory_message_at]); combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  assert(combination_order_book_directory_message_read.financial_product == combination_order_book_directory_message_written.financial_product);
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 3 -> assert(combination_order_book_directory_message_read.trading_currency[combination_order_book_directory_message_at] == combination_order_book_directory_message_written.trading_currency[combination_order_book_directory_message_at]); combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 2 -> assert(combination_order_book_directory_message_read.number_of_decimals_in_price[combination_order_book_directory_message_at] == combination_order_book_directory_message_written.number_of_decimals_in_price[combination_order_book_directory_message_at]); combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 2 -> assert(combination_order_book_directory_message_read.number_of_decimals_in_nominal_value[combination_order_book_directory_message_at] == combination_order_book_directory_message_written.number_of_decimals_in_nominal_value[combination_order_book_directory_message_at]); combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> assert(combination_order_book_directory_message_read.reserved_4_a[combination_order_book_directory_message_at] == combination_order_book_directory_message_written.reserved_4_a[combination_order_book_directory_message_at]); combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> assert(combination_order_book_directory_message_read.reserved_4_b[combination_order_book_directory_message_at] == combination_order_book_directory_message_written.reserved_4_b[combination_order_book_directory_message_at]); combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> assert(combination_order_book_directory_message_read.reserved_4_c[combination_order_book_directory_message_at] == combination_order_book_directory_message_written.reserved_4_c[combination_order_book_directory_message_at]); combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 8 -> assert(combination_order_book_directory_message_read.nominal_value[combination_order_book_directory_message_at] == combination_order_book_directory_message_written.nominal_value[combination_order_book_directory_message_at]); combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> assert(combination_order_book_directory_message_read.leg_1_symbol[combination_order_book_directory_message_at] == combination_order_book_directory_message_written.leg_1_symbol[combination_order_book_directory_message_at]); combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  assert(combination_order_book_directory_message_read.leg_1_side == combination_order_book_directory_message_written.leg_1_side);
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> assert(combination_order_book_directory_message_read.leg_1_ratio[combination_order_book_directory_message_at] == combination_order_book_directory_message_written.leg_1_ratio[combination_order_book_directory_message_at]); combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> assert(combination_order_book_directory_message_read.leg_2_symbol[combination_order_book_directory_message_at] == combination_order_book_directory_message_written.leg_2_symbol[combination_order_book_directory_message_at]); combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  assert(combination_order_book_directory_message_read.leg_2_side == combination_order_book_directory_message_written.leg_2_side);
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> assert(combination_order_book_directory_message_read.leg_2_ratio[combination_order_book_directory_message_at] == combination_order_book_directory_message_written.leg_2_ratio[combination_order_book_directory_message_at]); combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> assert(combination_order_book_directory_message_read.leg_3_symbol[combination_order_book_directory_message_at] == combination_order_book_directory_message_written.leg_3_symbol[combination_order_book_directory_message_at]); combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  assert(combination_order_book_directory_message_read.leg_3_side == combination_order_book_directory_message_written.leg_3_side);
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> assert(combination_order_book_directory_message_read.leg_3_ratio[combination_order_book_directory_message_at] == combination_order_book_directory_message_written.leg_3_ratio[combination_order_book_directory_message_at]); combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 32 -> assert(combination_order_book_directory_message_read.leg_4_symbol[combination_order_book_directory_message_at] == combination_order_book_directory_message_written.leg_4_symbol[combination_order_book_directory_message_at]); combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  assert(combination_order_book_directory_message_read.leg_4_side == combination_order_book_directory_message_written.leg_4_side);
  combination_order_book_directory_message_at = 0;
  do
  :: combination_order_book_directory_message_at < 4 -> assert(combination_order_book_directory_message_read.leg_4_ratio[combination_order_book_directory_message_at] == combination_order_book_directory_message_written.leg_4_ratio[combination_order_book_directory_message_at]); combination_order_book_directory_message_at = combination_order_book_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Tick Size Table Entry Message: 24 bytes --------------------------------- */

/* Contains information on a tick size for a price range */
typedef TickSizeTableEntryMessage {
  byte nanoseconds[4];
  byte order_book_id[4];
  byte tick_size[8];
  byte price_from[4];
  byte price_to[4]
};

int tick_size_table_entry_message_at;

/* every byte of Tick Size Table Entry Message set to one value */
inline fill_tick_size_table_entry_message(tick_size_table_entry_message_record, tick_size_table_entry_message_value) {
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> tick_size_table_entry_message_record.nanoseconds[tick_size_table_entry_message_at] = tick_size_table_entry_message_value; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> tick_size_table_entry_message_record.order_book_id[tick_size_table_entry_message_at] = tick_size_table_entry_message_value; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 8 -> tick_size_table_entry_message_record.tick_size[tick_size_table_entry_message_at] = tick_size_table_entry_message_value; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> tick_size_table_entry_message_record.price_from[tick_size_table_entry_message_at] = tick_size_table_entry_message_value; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> tick_size_table_entry_message_record.price_to[tick_size_table_entry_message_at] = tick_size_table_entry_message_value; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Tick Size Table Entry Message set to where it lies, so a field read out of place says so */
inline ramp_tick_size_table_entry_message(tick_size_table_entry_message_record, tick_size_table_entry_message_base) {
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> tick_size_table_entry_message_record.nanoseconds[tick_size_table_entry_message_at] = (tick_size_table_entry_message_base + 0 + tick_size_table_entry_message_at + 1) % 256; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> tick_size_table_entry_message_record.order_book_id[tick_size_table_entry_message_at] = (tick_size_table_entry_message_base + 4 + tick_size_table_entry_message_at + 1) % 256; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 8 -> tick_size_table_entry_message_record.tick_size[tick_size_table_entry_message_at] = (tick_size_table_entry_message_base + 8 + tick_size_table_entry_message_at + 1) % 256; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> tick_size_table_entry_message_record.price_from[tick_size_table_entry_message_at] = (tick_size_table_entry_message_base + 16 + tick_size_table_entry_message_at + 1) % 256; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> tick_size_table_entry_message_record.price_to[tick_size_table_entry_message_at] = (tick_size_table_entry_message_base + 20 + tick_size_table_entry_message_at + 1) % 256; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  skip
}

/* Tick Size Table Entry Message to the wire, 24 bytes from where the cursor stands */
inline encode_tick_size_table_entry_message(tick_size_table_entry_message_record) {
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> wire[at] = tick_size_table_entry_message_record.nanoseconds[tick_size_table_entry_message_at]; at = at + 1; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> wire[at] = tick_size_table_entry_message_record.order_book_id[tick_size_table_entry_message_at]; at = at + 1; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 8 -> wire[at] = tick_size_table_entry_message_record.tick_size[tick_size_table_entry_message_at]; at = at + 1; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> wire[at] = tick_size_table_entry_message_record.price_from[tick_size_table_entry_message_at]; at = at + 1; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> wire[at] = tick_size_table_entry_message_record.price_to[tick_size_table_entry_message_at]; at = at + 1; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  skip
}

/* Tick Size Table Entry Message off the wire, 24 bytes from where the cursor stands */
inline decode_tick_size_table_entry_message(tick_size_table_entry_message_record) {
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> tick_size_table_entry_message_record.nanoseconds[tick_size_table_entry_message_at] = wire[at]; at = at + 1; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> tick_size_table_entry_message_record.order_book_id[tick_size_table_entry_message_at] = wire[at]; at = at + 1; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 8 -> tick_size_table_entry_message_record.tick_size[tick_size_table_entry_message_at] = wire[at]; at = at + 1; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> tick_size_table_entry_message_record.price_from[tick_size_table_entry_message_at] = wire[at]; at = at + 1; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> tick_size_table_entry_message_record.price_to[tick_size_table_entry_message_at] = wire[at]; at = at + 1; tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Tick Size Table Entry Message is what was written, byte for byte */
inline equal_tick_size_table_entry_message(tick_size_table_entry_message_read, tick_size_table_entry_message_written) {
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> assert(tick_size_table_entry_message_read.nanoseconds[tick_size_table_entry_message_at] == tick_size_table_entry_message_written.nanoseconds[tick_size_table_entry_message_at]); tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> assert(tick_size_table_entry_message_read.order_book_id[tick_size_table_entry_message_at] == tick_size_table_entry_message_written.order_book_id[tick_size_table_entry_message_at]); tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 8 -> assert(tick_size_table_entry_message_read.tick_size[tick_size_table_entry_message_at] == tick_size_table_entry_message_written.tick_size[tick_size_table_entry_message_at]); tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> assert(tick_size_table_entry_message_read.price_from[tick_size_table_entry_message_at] == tick_size_table_entry_message_written.price_from[tick_size_table_entry_message_at]); tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  tick_size_table_entry_message_at = 0;
  do
  :: tick_size_table_entry_message_at < 4 -> assert(tick_size_table_entry_message_read.price_to[tick_size_table_entry_message_at] == tick_size_table_entry_message_written.price_to[tick_size_table_entry_message_at]); tick_size_table_entry_message_at = tick_size_table_entry_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Book State Message: 28 bytes -------------------------------------- */

/* Relays information on state changes */
typedef OrderBookStateMessage {
  byte nanoseconds[4];
  byte order_book_id[4];
  byte state_name[20]
};

int order_book_state_message_at;

/* every byte of Order Book State Message set to one value */
inline fill_order_book_state_message(order_book_state_message_record, order_book_state_message_value) {
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.nanoseconds[order_book_state_message_at] = order_book_state_message_value; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.order_book_id[order_book_state_message_at] = order_book_state_message_value; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 20 -> order_book_state_message_record.state_name[order_book_state_message_at] = order_book_state_message_value; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Book State Message set to where it lies, so a field read out of place says so */
inline ramp_order_book_state_message(order_book_state_message_record, order_book_state_message_base) {
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.nanoseconds[order_book_state_message_at] = (order_book_state_message_base + 0 + order_book_state_message_at + 1) % 256; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.order_book_id[order_book_state_message_at] = (order_book_state_message_base + 4 + order_book_state_message_at + 1) % 256; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 20 -> order_book_state_message_record.state_name[order_book_state_message_at] = (order_book_state_message_base + 8 + order_book_state_message_at + 1) % 256; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Book State Message to the wire, 28 bytes from where the cursor stands */
inline encode_order_book_state_message(order_book_state_message_record) {
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> wire[at] = order_book_state_message_record.nanoseconds[order_book_state_message_at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> wire[at] = order_book_state_message_record.order_book_id[order_book_state_message_at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 20 -> wire[at] = order_book_state_message_record.state_name[order_book_state_message_at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Book State Message off the wire, 28 bytes from where the cursor stands */
inline decode_order_book_state_message(order_book_state_message_record) {
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.nanoseconds[order_book_state_message_at] = wire[at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.order_book_id[order_book_state_message_at] = wire[at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 20 -> order_book_state_message_record.state_name[order_book_state_message_at] = wire[at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Book State Message is what was written, byte for byte */
inline equal_order_book_state_message(order_book_state_message_read, order_book_state_message_written) {
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> assert(order_book_state_message_read.nanoseconds[order_book_state_message_at] == order_book_state_message_written.nanoseconds[order_book_state_message_at]); order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> assert(order_book_state_message_read.order_book_id[order_book_state_message_at] == order_book_state_message_written.order_book_id[order_book_state_message_at]); order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 20 -> assert(order_book_state_message_read.state_name[order_book_state_message_at] == order_book_state_message_written.state_name[order_book_state_message_at]); order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Snapshot Message: 20 bytes --------------------------------------- */

/* Returns the Itch sequence number to be used when connecting to the Itch feed */
typedef EndOfSnapshotMessage {
  byte itch_sequence_number[20]
};

int end_of_snapshot_message_at;

/* every byte of End Of Snapshot Message set to one value */
inline fill_end_of_snapshot_message(end_of_snapshot_message_record, end_of_snapshot_message_value) {
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 20 -> end_of_snapshot_message_record.itch_sequence_number[end_of_snapshot_message_at] = end_of_snapshot_message_value; end_of_snapshot_message_at = end_of_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Snapshot Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_snapshot_message(end_of_snapshot_message_record, end_of_snapshot_message_base) {
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 20 -> end_of_snapshot_message_record.itch_sequence_number[end_of_snapshot_message_at] = (end_of_snapshot_message_base + 0 + end_of_snapshot_message_at + 1) % 256; end_of_snapshot_message_at = end_of_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Snapshot Message to the wire, 20 bytes from where the cursor stands */
inline encode_end_of_snapshot_message(end_of_snapshot_message_record) {
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 20 -> wire[at] = end_of_snapshot_message_record.itch_sequence_number[end_of_snapshot_message_at]; at = at + 1; end_of_snapshot_message_at = end_of_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Snapshot Message off the wire, 20 bytes from where the cursor stands */
inline decode_end_of_snapshot_message(end_of_snapshot_message_record) {
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 20 -> end_of_snapshot_message_record.itch_sequence_number[end_of_snapshot_message_at] = wire[at]; at = at + 1; end_of_snapshot_message_at = end_of_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Snapshot Message is what was written, byte for byte */
inline equal_end_of_snapshot_message(end_of_snapshot_message_read, end_of_snapshot_message_written) {
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 20 -> assert(end_of_snapshot_message_read.itch_sequence_number[end_of_snapshot_message_at] == end_of_snapshot_message_written.itch_sequence_number[end_of_snapshot_message_at]); end_of_snapshot_message_at = end_of_snapshot_message_at + 1
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

/* Seconds Message: encoded, read back, and compared */
proctype check_seconds_message() {
  SecondsMessage seconds_message_sent;
  SecondsMessage seconds_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_seconds_message(seconds_message_sent, 0)
  :: pattern == 1 -> fill_seconds_message(seconds_message_sent, 32)
  :: pattern == 2 -> fill_seconds_message(seconds_message_sent, 255)
  :: else -> ramp_seconds_message(seconds_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_seconds_message(seconds_message_sent);
    assert(at == 4);
    at = 0;
    decode_seconds_message(seconds_message_got);
    assert(at == 4);
    equal_seconds_message(seconds_message_got, seconds_message_sent)
  }
}

/* Order Book Directory Message: encoded, read back, and compared */
proctype check_order_book_directory_message() {
  OrderBookDirectoryMessage order_book_directory_message_sent;
  OrderBookDirectoryMessage order_book_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_book_directory_message(order_book_directory_message_sent, 0)
  :: pattern == 1 -> fill_order_book_directory_message(order_book_directory_message_sent, 32)
  :: pattern == 2 -> fill_order_book_directory_message(order_book_directory_message_sent, 255)
  :: else -> ramp_order_book_directory_message(order_book_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_book_directory_message(order_book_directory_message_sent);
    assert(at == 112);
    at = 0;
    decode_order_book_directory_message(order_book_directory_message_got);
    assert(at == 112);
    equal_order_book_directory_message(order_book_directory_message_got, order_book_directory_message_sent)
  }
}

/* Combination Order Book Directory Message: encoded, read back, and compared */
proctype check_combination_order_book_directory_message() {
  CombinationOrderBookDirectoryMessage combination_order_book_directory_message_sent;
  CombinationOrderBookDirectoryMessage combination_order_book_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_combination_order_book_directory_message(combination_order_book_directory_message_sent, 0)
  :: pattern == 1 -> fill_combination_order_book_directory_message(combination_order_book_directory_message_sent, 32)
  :: pattern == 2 -> fill_combination_order_book_directory_message(combination_order_book_directory_message_sent, 255)
  :: else -> ramp_combination_order_book_directory_message(combination_order_book_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_combination_order_book_directory_message(combination_order_book_directory_message_sent);
    assert(at == 260);
    at = 0;
    decode_combination_order_book_directory_message(combination_order_book_directory_message_got);
    assert(at == 260);
    equal_combination_order_book_directory_message(combination_order_book_directory_message_got, combination_order_book_directory_message_sent)
  }
}

/* Tick Size Table Entry Message: encoded, read back, and compared */
proctype check_tick_size_table_entry_message() {
  TickSizeTableEntryMessage tick_size_table_entry_message_sent;
  TickSizeTableEntryMessage tick_size_table_entry_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_tick_size_table_entry_message(tick_size_table_entry_message_sent, 0)
  :: pattern == 1 -> fill_tick_size_table_entry_message(tick_size_table_entry_message_sent, 32)
  :: pattern == 2 -> fill_tick_size_table_entry_message(tick_size_table_entry_message_sent, 255)
  :: else -> ramp_tick_size_table_entry_message(tick_size_table_entry_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_tick_size_table_entry_message(tick_size_table_entry_message_sent);
    assert(at == 24);
    at = 0;
    decode_tick_size_table_entry_message(tick_size_table_entry_message_got);
    assert(at == 24);
    equal_tick_size_table_entry_message(tick_size_table_entry_message_got, tick_size_table_entry_message_sent)
  }
}

/* Order Book State Message: encoded, read back, and compared */
proctype check_order_book_state_message() {
  OrderBookStateMessage order_book_state_message_sent;
  OrderBookStateMessage order_book_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_book_state_message(order_book_state_message_sent, 0)
  :: pattern == 1 -> fill_order_book_state_message(order_book_state_message_sent, 32)
  :: pattern == 2 -> fill_order_book_state_message(order_book_state_message_sent, 255)
  :: else -> ramp_order_book_state_message(order_book_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_book_state_message(order_book_state_message_sent);
    assert(at == 28);
    at = 0;
    decode_order_book_state_message(order_book_state_message_got);
    assert(at == 28);
    equal_order_book_state_message(order_book_state_message_got, order_book_state_message_sent)
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
  :: run check_seconds_message()
  :: run check_order_book_directory_message()
  :: run check_combination_order_book_directory_message()
  :: run check_tick_size_table_entry_message()
  :: run check_order_book_state_message()
  :: run check_end_of_snapshot_message()
  fi
}
