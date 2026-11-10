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
#define WIRE 128

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

/* Provides data on the seconds when each message is disseminated. */
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

/* ---- Series Information Basic Message: 128 bytes ----------------------------- */

/* Provides detailed data about the series that can be traded on a given business day. */
typedef SeriesInformationBasicMessage {
  byte nanoseconds[4];
  byte order_book_id[4];
  byte symbol[32];
  byte long_name[32];
  byte reserved_12[12];
  byte financial_product;
  byte trading_currency[3];
  byte number_of_decimals_in_price[2];
  byte number_of_decimals_in_nominal_value[2];
  byte odd_lot_size[4];
  byte round_lot_size[4];
  byte block_lot_size[4];
  byte nominal_value[8];
  byte number_of_legs;
  byte underlying_order_book_id[4];
  byte strike_price[4];
  byte expiration_date[4];
  byte number_of_decimals_in_strike_price[2];
  byte put_or_call
};

int series_information_basic_message_at;

/* every byte of Series Information Basic Message set to one value */
inline fill_series_information_basic_message(series_information_basic_message_record, series_information_basic_message_value) {
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> series_information_basic_message_record.nanoseconds[series_information_basic_message_at] = series_information_basic_message_value; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> series_information_basic_message_record.order_book_id[series_information_basic_message_at] = series_information_basic_message_value; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 32 -> series_information_basic_message_record.symbol[series_information_basic_message_at] = series_information_basic_message_value; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 32 -> series_information_basic_message_record.long_name[series_information_basic_message_at] = series_information_basic_message_value; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 12 -> series_information_basic_message_record.reserved_12[series_information_basic_message_at] = series_information_basic_message_value; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_record.financial_product = series_information_basic_message_value;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 3 -> series_information_basic_message_record.trading_currency[series_information_basic_message_at] = series_information_basic_message_value; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 2 -> series_information_basic_message_record.number_of_decimals_in_price[series_information_basic_message_at] = series_information_basic_message_value; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 2 -> series_information_basic_message_record.number_of_decimals_in_nominal_value[series_information_basic_message_at] = series_information_basic_message_value; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> series_information_basic_message_record.odd_lot_size[series_information_basic_message_at] = series_information_basic_message_value; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> series_information_basic_message_record.round_lot_size[series_information_basic_message_at] = series_information_basic_message_value; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> series_information_basic_message_record.block_lot_size[series_information_basic_message_at] = series_information_basic_message_value; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 8 -> series_information_basic_message_record.nominal_value[series_information_basic_message_at] = series_information_basic_message_value; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_record.number_of_legs = series_information_basic_message_value;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> series_information_basic_message_record.underlying_order_book_id[series_information_basic_message_at] = series_information_basic_message_value; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> series_information_basic_message_record.strike_price[series_information_basic_message_at] = series_information_basic_message_value; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> series_information_basic_message_record.expiration_date[series_information_basic_message_at] = series_information_basic_message_value; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 2 -> series_information_basic_message_record.number_of_decimals_in_strike_price[series_information_basic_message_at] = series_information_basic_message_value; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_record.put_or_call = series_information_basic_message_value;
  skip
}

/* each byte of Series Information Basic Message set to where it lies, so a field read out of place says so */
inline ramp_series_information_basic_message(series_information_basic_message_record, series_information_basic_message_base) {
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> series_information_basic_message_record.nanoseconds[series_information_basic_message_at] = (series_information_basic_message_base + 0 + series_information_basic_message_at + 1) % 256; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> series_information_basic_message_record.order_book_id[series_information_basic_message_at] = (series_information_basic_message_base + 4 + series_information_basic_message_at + 1) % 256; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 32 -> series_information_basic_message_record.symbol[series_information_basic_message_at] = (series_information_basic_message_base + 8 + series_information_basic_message_at + 1) % 256; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 32 -> series_information_basic_message_record.long_name[series_information_basic_message_at] = (series_information_basic_message_base + 40 + series_information_basic_message_at + 1) % 256; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 12 -> series_information_basic_message_record.reserved_12[series_information_basic_message_at] = (series_information_basic_message_base + 72 + series_information_basic_message_at + 1) % 256; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_record.financial_product = (series_information_basic_message_base + 84 + 1) % 256;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 3 -> series_information_basic_message_record.trading_currency[series_information_basic_message_at] = (series_information_basic_message_base + 85 + series_information_basic_message_at + 1) % 256; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 2 -> series_information_basic_message_record.number_of_decimals_in_price[series_information_basic_message_at] = (series_information_basic_message_base + 88 + series_information_basic_message_at + 1) % 256; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 2 -> series_information_basic_message_record.number_of_decimals_in_nominal_value[series_information_basic_message_at] = (series_information_basic_message_base + 90 + series_information_basic_message_at + 1) % 256; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> series_information_basic_message_record.odd_lot_size[series_information_basic_message_at] = (series_information_basic_message_base + 92 + series_information_basic_message_at + 1) % 256; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> series_information_basic_message_record.round_lot_size[series_information_basic_message_at] = (series_information_basic_message_base + 96 + series_information_basic_message_at + 1) % 256; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> series_information_basic_message_record.block_lot_size[series_information_basic_message_at] = (series_information_basic_message_base + 100 + series_information_basic_message_at + 1) % 256; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 8 -> series_information_basic_message_record.nominal_value[series_information_basic_message_at] = (series_information_basic_message_base + 104 + series_information_basic_message_at + 1) % 256; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_record.number_of_legs = (series_information_basic_message_base + 112 + 1) % 256;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> series_information_basic_message_record.underlying_order_book_id[series_information_basic_message_at] = (series_information_basic_message_base + 113 + series_information_basic_message_at + 1) % 256; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> series_information_basic_message_record.strike_price[series_information_basic_message_at] = (series_information_basic_message_base + 117 + series_information_basic_message_at + 1) % 256; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> series_information_basic_message_record.expiration_date[series_information_basic_message_at] = (series_information_basic_message_base + 121 + series_information_basic_message_at + 1) % 256; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 2 -> series_information_basic_message_record.number_of_decimals_in_strike_price[series_information_basic_message_at] = (series_information_basic_message_base + 125 + series_information_basic_message_at + 1) % 256; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_record.put_or_call = (series_information_basic_message_base + 127 + 1) % 256;
  skip
}

/* Series Information Basic Message to the wire, 128 bytes from where the cursor stands */
inline encode_series_information_basic_message(series_information_basic_message_record) {
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> wire[at] = series_information_basic_message_record.nanoseconds[series_information_basic_message_at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> wire[at] = series_information_basic_message_record.order_book_id[series_information_basic_message_at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 32 -> wire[at] = series_information_basic_message_record.symbol[series_information_basic_message_at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 32 -> wire[at] = series_information_basic_message_record.long_name[series_information_basic_message_at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 12 -> wire[at] = series_information_basic_message_record.reserved_12[series_information_basic_message_at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  wire[at] = series_information_basic_message_record.financial_product; at = at + 1;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 3 -> wire[at] = series_information_basic_message_record.trading_currency[series_information_basic_message_at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 2 -> wire[at] = series_information_basic_message_record.number_of_decimals_in_price[series_information_basic_message_at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 2 -> wire[at] = series_information_basic_message_record.number_of_decimals_in_nominal_value[series_information_basic_message_at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> wire[at] = series_information_basic_message_record.odd_lot_size[series_information_basic_message_at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> wire[at] = series_information_basic_message_record.round_lot_size[series_information_basic_message_at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> wire[at] = series_information_basic_message_record.block_lot_size[series_information_basic_message_at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 8 -> wire[at] = series_information_basic_message_record.nominal_value[series_information_basic_message_at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  wire[at] = series_information_basic_message_record.number_of_legs; at = at + 1;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> wire[at] = series_information_basic_message_record.underlying_order_book_id[series_information_basic_message_at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> wire[at] = series_information_basic_message_record.strike_price[series_information_basic_message_at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> wire[at] = series_information_basic_message_record.expiration_date[series_information_basic_message_at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 2 -> wire[at] = series_information_basic_message_record.number_of_decimals_in_strike_price[series_information_basic_message_at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  wire[at] = series_information_basic_message_record.put_or_call; at = at + 1;
  skip
}

/* Series Information Basic Message off the wire, 128 bytes from where the cursor stands */
inline decode_series_information_basic_message(series_information_basic_message_record) {
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> series_information_basic_message_record.nanoseconds[series_information_basic_message_at] = wire[at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> series_information_basic_message_record.order_book_id[series_information_basic_message_at] = wire[at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 32 -> series_information_basic_message_record.symbol[series_information_basic_message_at] = wire[at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 32 -> series_information_basic_message_record.long_name[series_information_basic_message_at] = wire[at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 12 -> series_information_basic_message_record.reserved_12[series_information_basic_message_at] = wire[at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_record.financial_product = wire[at]; at = at + 1;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 3 -> series_information_basic_message_record.trading_currency[series_information_basic_message_at] = wire[at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 2 -> series_information_basic_message_record.number_of_decimals_in_price[series_information_basic_message_at] = wire[at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 2 -> series_information_basic_message_record.number_of_decimals_in_nominal_value[series_information_basic_message_at] = wire[at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> series_information_basic_message_record.odd_lot_size[series_information_basic_message_at] = wire[at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> series_information_basic_message_record.round_lot_size[series_information_basic_message_at] = wire[at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> series_information_basic_message_record.block_lot_size[series_information_basic_message_at] = wire[at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 8 -> series_information_basic_message_record.nominal_value[series_information_basic_message_at] = wire[at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_record.number_of_legs = wire[at]; at = at + 1;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> series_information_basic_message_record.underlying_order_book_id[series_information_basic_message_at] = wire[at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> series_information_basic_message_record.strike_price[series_information_basic_message_at] = wire[at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> series_information_basic_message_record.expiration_date[series_information_basic_message_at] = wire[at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 2 -> series_information_basic_message_record.number_of_decimals_in_strike_price[series_information_basic_message_at] = wire[at]; at = at + 1; series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_record.put_or_call = wire[at]; at = at + 1;
  skip
}

/* what was read of Series Information Basic Message is what was written, byte for byte */
inline equal_series_information_basic_message(series_information_basic_message_read, series_information_basic_message_written) {
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> assert(series_information_basic_message_read.nanoseconds[series_information_basic_message_at] == series_information_basic_message_written.nanoseconds[series_information_basic_message_at]); series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> assert(series_information_basic_message_read.order_book_id[series_information_basic_message_at] == series_information_basic_message_written.order_book_id[series_information_basic_message_at]); series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 32 -> assert(series_information_basic_message_read.symbol[series_information_basic_message_at] == series_information_basic_message_written.symbol[series_information_basic_message_at]); series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 32 -> assert(series_information_basic_message_read.long_name[series_information_basic_message_at] == series_information_basic_message_written.long_name[series_information_basic_message_at]); series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 12 -> assert(series_information_basic_message_read.reserved_12[series_information_basic_message_at] == series_information_basic_message_written.reserved_12[series_information_basic_message_at]); series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  assert(series_information_basic_message_read.financial_product == series_information_basic_message_written.financial_product);
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 3 -> assert(series_information_basic_message_read.trading_currency[series_information_basic_message_at] == series_information_basic_message_written.trading_currency[series_information_basic_message_at]); series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 2 -> assert(series_information_basic_message_read.number_of_decimals_in_price[series_information_basic_message_at] == series_information_basic_message_written.number_of_decimals_in_price[series_information_basic_message_at]); series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 2 -> assert(series_information_basic_message_read.number_of_decimals_in_nominal_value[series_information_basic_message_at] == series_information_basic_message_written.number_of_decimals_in_nominal_value[series_information_basic_message_at]); series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> assert(series_information_basic_message_read.odd_lot_size[series_information_basic_message_at] == series_information_basic_message_written.odd_lot_size[series_information_basic_message_at]); series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> assert(series_information_basic_message_read.round_lot_size[series_information_basic_message_at] == series_information_basic_message_written.round_lot_size[series_information_basic_message_at]); series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> assert(series_information_basic_message_read.block_lot_size[series_information_basic_message_at] == series_information_basic_message_written.block_lot_size[series_information_basic_message_at]); series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 8 -> assert(series_information_basic_message_read.nominal_value[series_information_basic_message_at] == series_information_basic_message_written.nominal_value[series_information_basic_message_at]); series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  assert(series_information_basic_message_read.number_of_legs == series_information_basic_message_written.number_of_legs);
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> assert(series_information_basic_message_read.underlying_order_book_id[series_information_basic_message_at] == series_information_basic_message_written.underlying_order_book_id[series_information_basic_message_at]); series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> assert(series_information_basic_message_read.strike_price[series_information_basic_message_at] == series_information_basic_message_written.strike_price[series_information_basic_message_at]); series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 4 -> assert(series_information_basic_message_read.expiration_date[series_information_basic_message_at] == series_information_basic_message_written.expiration_date[series_information_basic_message_at]); series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  series_information_basic_message_at = 0;
  do
  :: series_information_basic_message_at < 2 -> assert(series_information_basic_message_read.number_of_decimals_in_strike_price[series_information_basic_message_at] == series_information_basic_message_written.number_of_decimals_in_strike_price[series_information_basic_message_at]); series_information_basic_message_at = series_information_basic_message_at + 1
  :: else -> break
  od;
  assert(series_information_basic_message_read.put_or_call == series_information_basic_message_written.put_or_call);
  skip
}

/* ---- Series Information Basic Combination Message: 17 bytes ------------------ */

/* Provides detailed data about the legs of combination trading instruments that can be traded on a given trading day. */
typedef SeriesInformationBasicCombinationMessage {
  byte nanoseconds[4];
  byte combination_order_book_id[4];
  byte leg_order_book_id[4];
  byte leg_side;
  byte leg_ratio[4]
};

int series_information_basic_combination_message_at;

/* every byte of Series Information Basic Combination Message set to one value */
inline fill_series_information_basic_combination_message(series_information_basic_combination_message_record, series_information_basic_combination_message_value) {
  series_information_basic_combination_message_at = 0;
  do
  :: series_information_basic_combination_message_at < 4 -> series_information_basic_combination_message_record.nanoseconds[series_information_basic_combination_message_at] = series_information_basic_combination_message_value; series_information_basic_combination_message_at = series_information_basic_combination_message_at + 1
  :: else -> break
  od;
  series_information_basic_combination_message_at = 0;
  do
  :: series_information_basic_combination_message_at < 4 -> series_information_basic_combination_message_record.combination_order_book_id[series_information_basic_combination_message_at] = series_information_basic_combination_message_value; series_information_basic_combination_message_at = series_information_basic_combination_message_at + 1
  :: else -> break
  od;
  series_information_basic_combination_message_at = 0;
  do
  :: series_information_basic_combination_message_at < 4 -> series_information_basic_combination_message_record.leg_order_book_id[series_information_basic_combination_message_at] = series_information_basic_combination_message_value; series_information_basic_combination_message_at = series_information_basic_combination_message_at + 1
  :: else -> break
  od;
  series_information_basic_combination_message_record.leg_side = series_information_basic_combination_message_value;
  series_information_basic_combination_message_at = 0;
  do
  :: series_information_basic_combination_message_at < 4 -> series_information_basic_combination_message_record.leg_ratio[series_information_basic_combination_message_at] = series_information_basic_combination_message_value; series_information_basic_combination_message_at = series_information_basic_combination_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Series Information Basic Combination Message set to where it lies, so a field read out of place says so */
inline ramp_series_information_basic_combination_message(series_information_basic_combination_message_record, series_information_basic_combination_message_base) {
  series_information_basic_combination_message_at = 0;
  do
  :: series_information_basic_combination_message_at < 4 -> series_information_basic_combination_message_record.nanoseconds[series_information_basic_combination_message_at] = (series_information_basic_combination_message_base + 0 + series_information_basic_combination_message_at + 1) % 256; series_information_basic_combination_message_at = series_information_basic_combination_message_at + 1
  :: else -> break
  od;
  series_information_basic_combination_message_at = 0;
  do
  :: series_information_basic_combination_message_at < 4 -> series_information_basic_combination_message_record.combination_order_book_id[series_information_basic_combination_message_at] = (series_information_basic_combination_message_base + 4 + series_information_basic_combination_message_at + 1) % 256; series_information_basic_combination_message_at = series_information_basic_combination_message_at + 1
  :: else -> break
  od;
  series_information_basic_combination_message_at = 0;
  do
  :: series_information_basic_combination_message_at < 4 -> series_information_basic_combination_message_record.leg_order_book_id[series_information_basic_combination_message_at] = (series_information_basic_combination_message_base + 8 + series_information_basic_combination_message_at + 1) % 256; series_information_basic_combination_message_at = series_information_basic_combination_message_at + 1
  :: else -> break
  od;
  series_information_basic_combination_message_record.leg_side = (series_information_basic_combination_message_base + 12 + 1) % 256;
  series_information_basic_combination_message_at = 0;
  do
  :: series_information_basic_combination_message_at < 4 -> series_information_basic_combination_message_record.leg_ratio[series_information_basic_combination_message_at] = (series_information_basic_combination_message_base + 13 + series_information_basic_combination_message_at + 1) % 256; series_information_basic_combination_message_at = series_information_basic_combination_message_at + 1
  :: else -> break
  od;
  skip
}

/* Series Information Basic Combination Message to the wire, 17 bytes from where the cursor stands */
inline encode_series_information_basic_combination_message(series_information_basic_combination_message_record) {
  series_information_basic_combination_message_at = 0;
  do
  :: series_information_basic_combination_message_at < 4 -> wire[at] = series_information_basic_combination_message_record.nanoseconds[series_information_basic_combination_message_at]; at = at + 1; series_information_basic_combination_message_at = series_information_basic_combination_message_at + 1
  :: else -> break
  od;
  series_information_basic_combination_message_at = 0;
  do
  :: series_information_basic_combination_message_at < 4 -> wire[at] = series_information_basic_combination_message_record.combination_order_book_id[series_information_basic_combination_message_at]; at = at + 1; series_information_basic_combination_message_at = series_information_basic_combination_message_at + 1
  :: else -> break
  od;
  series_information_basic_combination_message_at = 0;
  do
  :: series_information_basic_combination_message_at < 4 -> wire[at] = series_information_basic_combination_message_record.leg_order_book_id[series_information_basic_combination_message_at]; at = at + 1; series_information_basic_combination_message_at = series_information_basic_combination_message_at + 1
  :: else -> break
  od;
  wire[at] = series_information_basic_combination_message_record.leg_side; at = at + 1;
  series_information_basic_combination_message_at = 0;
  do
  :: series_information_basic_combination_message_at < 4 -> wire[at] = series_information_basic_combination_message_record.leg_ratio[series_information_basic_combination_message_at]; at = at + 1; series_information_basic_combination_message_at = series_information_basic_combination_message_at + 1
  :: else -> break
  od;
  skip
}

/* Series Information Basic Combination Message off the wire, 17 bytes from where the cursor stands */
inline decode_series_information_basic_combination_message(series_information_basic_combination_message_record) {
  series_information_basic_combination_message_at = 0;
  do
  :: series_information_basic_combination_message_at < 4 -> series_information_basic_combination_message_record.nanoseconds[series_information_basic_combination_message_at] = wire[at]; at = at + 1; series_information_basic_combination_message_at = series_information_basic_combination_message_at + 1
  :: else -> break
  od;
  series_information_basic_combination_message_at = 0;
  do
  :: series_information_basic_combination_message_at < 4 -> series_information_basic_combination_message_record.combination_order_book_id[series_information_basic_combination_message_at] = wire[at]; at = at + 1; series_information_basic_combination_message_at = series_information_basic_combination_message_at + 1
  :: else -> break
  od;
  series_information_basic_combination_message_at = 0;
  do
  :: series_information_basic_combination_message_at < 4 -> series_information_basic_combination_message_record.leg_order_book_id[series_information_basic_combination_message_at] = wire[at]; at = at + 1; series_information_basic_combination_message_at = series_information_basic_combination_message_at + 1
  :: else -> break
  od;
  series_information_basic_combination_message_record.leg_side = wire[at]; at = at + 1;
  series_information_basic_combination_message_at = 0;
  do
  :: series_information_basic_combination_message_at < 4 -> series_information_basic_combination_message_record.leg_ratio[series_information_basic_combination_message_at] = wire[at]; at = at + 1; series_information_basic_combination_message_at = series_information_basic_combination_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Series Information Basic Combination Message is what was written, byte for byte */
inline equal_series_information_basic_combination_message(series_information_basic_combination_message_read, series_information_basic_combination_message_written) {
  series_information_basic_combination_message_at = 0;
  do
  :: series_information_basic_combination_message_at < 4 -> assert(series_information_basic_combination_message_read.nanoseconds[series_information_basic_combination_message_at] == series_information_basic_combination_message_written.nanoseconds[series_information_basic_combination_message_at]); series_information_basic_combination_message_at = series_information_basic_combination_message_at + 1
  :: else -> break
  od;
  series_information_basic_combination_message_at = 0;
  do
  :: series_information_basic_combination_message_at < 4 -> assert(series_information_basic_combination_message_read.combination_order_book_id[series_information_basic_combination_message_at] == series_information_basic_combination_message_written.combination_order_book_id[series_information_basic_combination_message_at]); series_information_basic_combination_message_at = series_information_basic_combination_message_at + 1
  :: else -> break
  od;
  series_information_basic_combination_message_at = 0;
  do
  :: series_information_basic_combination_message_at < 4 -> assert(series_information_basic_combination_message_read.leg_order_book_id[series_information_basic_combination_message_at] == series_information_basic_combination_message_written.leg_order_book_id[series_information_basic_combination_message_at]); series_information_basic_combination_message_at = series_information_basic_combination_message_at + 1
  :: else -> break
  od;
  assert(series_information_basic_combination_message_read.leg_side == series_information_basic_combination_message_written.leg_side);
  series_information_basic_combination_message_at = 0;
  do
  :: series_information_basic_combination_message_at < 4 -> assert(series_information_basic_combination_message_read.leg_ratio[series_information_basic_combination_message_at] == series_information_basic_combination_message_written.leg_ratio[series_information_basic_combination_message_at]); series_information_basic_combination_message_at = series_information_basic_combination_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Tick Size Data Message: 24 bytes ---------------------------------------- */

/* Provides the tick size of a trading instrument. */
typedef TickSizeDataMessage {
  byte nanoseconds[4];
  byte order_book_id[4];
  byte tick_size[8];
  byte price_from[4];
  byte price_to[4]
};

int tick_size_data_message_at;

/* every byte of Tick Size Data Message set to one value */
inline fill_tick_size_data_message(tick_size_data_message_record, tick_size_data_message_value) {
  tick_size_data_message_at = 0;
  do
  :: tick_size_data_message_at < 4 -> tick_size_data_message_record.nanoseconds[tick_size_data_message_at] = tick_size_data_message_value; tick_size_data_message_at = tick_size_data_message_at + 1
  :: else -> break
  od;
  tick_size_data_message_at = 0;
  do
  :: tick_size_data_message_at < 4 -> tick_size_data_message_record.order_book_id[tick_size_data_message_at] = tick_size_data_message_value; tick_size_data_message_at = tick_size_data_message_at + 1
  :: else -> break
  od;
  tick_size_data_message_at = 0;
  do
  :: tick_size_data_message_at < 8 -> tick_size_data_message_record.tick_size[tick_size_data_message_at] = tick_size_data_message_value; tick_size_data_message_at = tick_size_data_message_at + 1
  :: else -> break
  od;
  tick_size_data_message_at = 0;
  do
  :: tick_size_data_message_at < 4 -> tick_size_data_message_record.price_from[tick_size_data_message_at] = tick_size_data_message_value; tick_size_data_message_at = tick_size_data_message_at + 1
  :: else -> break
  od;
  tick_size_data_message_at = 0;
  do
  :: tick_size_data_message_at < 4 -> tick_size_data_message_record.price_to[tick_size_data_message_at] = tick_size_data_message_value; tick_size_data_message_at = tick_size_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Tick Size Data Message set to where it lies, so a field read out of place says so */
inline ramp_tick_size_data_message(tick_size_data_message_record, tick_size_data_message_base) {
  tick_size_data_message_at = 0;
  do
  :: tick_size_data_message_at < 4 -> tick_size_data_message_record.nanoseconds[tick_size_data_message_at] = (tick_size_data_message_base + 0 + tick_size_data_message_at + 1) % 256; tick_size_data_message_at = tick_size_data_message_at + 1
  :: else -> break
  od;
  tick_size_data_message_at = 0;
  do
  :: tick_size_data_message_at < 4 -> tick_size_data_message_record.order_book_id[tick_size_data_message_at] = (tick_size_data_message_base + 4 + tick_size_data_message_at + 1) % 256; tick_size_data_message_at = tick_size_data_message_at + 1
  :: else -> break
  od;
  tick_size_data_message_at = 0;
  do
  :: tick_size_data_message_at < 8 -> tick_size_data_message_record.tick_size[tick_size_data_message_at] = (tick_size_data_message_base + 8 + tick_size_data_message_at + 1) % 256; tick_size_data_message_at = tick_size_data_message_at + 1
  :: else -> break
  od;
  tick_size_data_message_at = 0;
  do
  :: tick_size_data_message_at < 4 -> tick_size_data_message_record.price_from[tick_size_data_message_at] = (tick_size_data_message_base + 16 + tick_size_data_message_at + 1) % 256; tick_size_data_message_at = tick_size_data_message_at + 1
  :: else -> break
  od;
  tick_size_data_message_at = 0;
  do
  :: tick_size_data_message_at < 4 -> tick_size_data_message_record.price_to[tick_size_data_message_at] = (tick_size_data_message_base + 20 + tick_size_data_message_at + 1) % 256; tick_size_data_message_at = tick_size_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* Tick Size Data Message to the wire, 24 bytes from where the cursor stands */
inline encode_tick_size_data_message(tick_size_data_message_record) {
  tick_size_data_message_at = 0;
  do
  :: tick_size_data_message_at < 4 -> wire[at] = tick_size_data_message_record.nanoseconds[tick_size_data_message_at]; at = at + 1; tick_size_data_message_at = tick_size_data_message_at + 1
  :: else -> break
  od;
  tick_size_data_message_at = 0;
  do
  :: tick_size_data_message_at < 4 -> wire[at] = tick_size_data_message_record.order_book_id[tick_size_data_message_at]; at = at + 1; tick_size_data_message_at = tick_size_data_message_at + 1
  :: else -> break
  od;
  tick_size_data_message_at = 0;
  do
  :: tick_size_data_message_at < 8 -> wire[at] = tick_size_data_message_record.tick_size[tick_size_data_message_at]; at = at + 1; tick_size_data_message_at = tick_size_data_message_at + 1
  :: else -> break
  od;
  tick_size_data_message_at = 0;
  do
  :: tick_size_data_message_at < 4 -> wire[at] = tick_size_data_message_record.price_from[tick_size_data_message_at]; at = at + 1; tick_size_data_message_at = tick_size_data_message_at + 1
  :: else -> break
  od;
  tick_size_data_message_at = 0;
  do
  :: tick_size_data_message_at < 4 -> wire[at] = tick_size_data_message_record.price_to[tick_size_data_message_at]; at = at + 1; tick_size_data_message_at = tick_size_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* Tick Size Data Message off the wire, 24 bytes from where the cursor stands */
inline decode_tick_size_data_message(tick_size_data_message_record) {
  tick_size_data_message_at = 0;
  do
  :: tick_size_data_message_at < 4 -> tick_size_data_message_record.nanoseconds[tick_size_data_message_at] = wire[at]; at = at + 1; tick_size_data_message_at = tick_size_data_message_at + 1
  :: else -> break
  od;
  tick_size_data_message_at = 0;
  do
  :: tick_size_data_message_at < 4 -> tick_size_data_message_record.order_book_id[tick_size_data_message_at] = wire[at]; at = at + 1; tick_size_data_message_at = tick_size_data_message_at + 1
  :: else -> break
  od;
  tick_size_data_message_at = 0;
  do
  :: tick_size_data_message_at < 8 -> tick_size_data_message_record.tick_size[tick_size_data_message_at] = wire[at]; at = at + 1; tick_size_data_message_at = tick_size_data_message_at + 1
  :: else -> break
  od;
  tick_size_data_message_at = 0;
  do
  :: tick_size_data_message_at < 4 -> tick_size_data_message_record.price_from[tick_size_data_message_at] = wire[at]; at = at + 1; tick_size_data_message_at = tick_size_data_message_at + 1
  :: else -> break
  od;
  tick_size_data_message_at = 0;
  do
  :: tick_size_data_message_at < 4 -> tick_size_data_message_record.price_to[tick_size_data_message_at] = wire[at]; at = at + 1; tick_size_data_message_at = tick_size_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Tick Size Data Message is what was written, byte for byte */
inline equal_tick_size_data_message(tick_size_data_message_read, tick_size_data_message_written) {
  tick_size_data_message_at = 0;
  do
  :: tick_size_data_message_at < 4 -> assert(tick_size_data_message_read.nanoseconds[tick_size_data_message_at] == tick_size_data_message_written.nanoseconds[tick_size_data_message_at]); tick_size_data_message_at = tick_size_data_message_at + 1
  :: else -> break
  od;
  tick_size_data_message_at = 0;
  do
  :: tick_size_data_message_at < 4 -> assert(tick_size_data_message_read.order_book_id[tick_size_data_message_at] == tick_size_data_message_written.order_book_id[tick_size_data_message_at]); tick_size_data_message_at = tick_size_data_message_at + 1
  :: else -> break
  od;
  tick_size_data_message_at = 0;
  do
  :: tick_size_data_message_at < 8 -> assert(tick_size_data_message_read.tick_size[tick_size_data_message_at] == tick_size_data_message_written.tick_size[tick_size_data_message_at]); tick_size_data_message_at = tick_size_data_message_at + 1
  :: else -> break
  od;
  tick_size_data_message_at = 0;
  do
  :: tick_size_data_message_at < 4 -> assert(tick_size_data_message_read.price_from[tick_size_data_message_at] == tick_size_data_message_written.price_from[tick_size_data_message_at]); tick_size_data_message_at = tick_size_data_message_at + 1
  :: else -> break
  od;
  tick_size_data_message_at = 0;
  do
  :: tick_size_data_message_at < 4 -> assert(tick_size_data_message_read.price_to[tick_size_data_message_at] == tick_size_data_message_written.price_to[tick_size_data_message_at]); tick_size_data_message_at = tick_size_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System Event Data Message: 5 bytes -------------------------------------- */

/* Provides system event update data. */
typedef SystemEventDataMessage {
  byte nanoseconds[4];
  byte event_code
};

int system_event_data_message_at;

/* every byte of System Event Data Message set to one value */
inline fill_system_event_data_message(system_event_data_message_record, system_event_data_message_value) {
  system_event_data_message_at = 0;
  do
  :: system_event_data_message_at < 4 -> system_event_data_message_record.nanoseconds[system_event_data_message_at] = system_event_data_message_value; system_event_data_message_at = system_event_data_message_at + 1
  :: else -> break
  od;
  system_event_data_message_record.event_code = system_event_data_message_value;
  skip
}

/* each byte of System Event Data Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_data_message(system_event_data_message_record, system_event_data_message_base) {
  system_event_data_message_at = 0;
  do
  :: system_event_data_message_at < 4 -> system_event_data_message_record.nanoseconds[system_event_data_message_at] = (system_event_data_message_base + 0 + system_event_data_message_at + 1) % 256; system_event_data_message_at = system_event_data_message_at + 1
  :: else -> break
  od;
  system_event_data_message_record.event_code = (system_event_data_message_base + 4 + 1) % 256;
  skip
}

/* System Event Data Message to the wire, 5 bytes from where the cursor stands */
inline encode_system_event_data_message(system_event_data_message_record) {
  system_event_data_message_at = 0;
  do
  :: system_event_data_message_at < 4 -> wire[at] = system_event_data_message_record.nanoseconds[system_event_data_message_at]; at = at + 1; system_event_data_message_at = system_event_data_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_data_message_record.event_code; at = at + 1;
  skip
}

/* System Event Data Message off the wire, 5 bytes from where the cursor stands */
inline decode_system_event_data_message(system_event_data_message_record) {
  system_event_data_message_at = 0;
  do
  :: system_event_data_message_at < 4 -> system_event_data_message_record.nanoseconds[system_event_data_message_at] = wire[at]; at = at + 1; system_event_data_message_at = system_event_data_message_at + 1
  :: else -> break
  od;
  system_event_data_message_record.event_code = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Data Message is what was written, byte for byte */
inline equal_system_event_data_message(system_event_data_message_read, system_event_data_message_written) {
  system_event_data_message_at = 0;
  do
  :: system_event_data_message_at < 4 -> assert(system_event_data_message_read.nanoseconds[system_event_data_message_at] == system_event_data_message_written.nanoseconds[system_event_data_message_at]); system_event_data_message_at = system_event_data_message_at + 1
  :: else -> break
  od;
  assert(system_event_data_message_read.event_code == system_event_data_message_written.event_code);
  skip
}

/* ---- Trading Status Data Message: 28 bytes ----------------------------------- */

/* Provides the trading status data of a trading instrument. */
typedef TradingStatusDataMessage {
  byte nanoseconds[4];
  byte order_book_id[4];
  byte state_name[20]
};

int trading_status_data_message_at;

/* every byte of Trading Status Data Message set to one value */
inline fill_trading_status_data_message(trading_status_data_message_record, trading_status_data_message_value) {
  trading_status_data_message_at = 0;
  do
  :: trading_status_data_message_at < 4 -> trading_status_data_message_record.nanoseconds[trading_status_data_message_at] = trading_status_data_message_value; trading_status_data_message_at = trading_status_data_message_at + 1
  :: else -> break
  od;
  trading_status_data_message_at = 0;
  do
  :: trading_status_data_message_at < 4 -> trading_status_data_message_record.order_book_id[trading_status_data_message_at] = trading_status_data_message_value; trading_status_data_message_at = trading_status_data_message_at + 1
  :: else -> break
  od;
  trading_status_data_message_at = 0;
  do
  :: trading_status_data_message_at < 20 -> trading_status_data_message_record.state_name[trading_status_data_message_at] = trading_status_data_message_value; trading_status_data_message_at = trading_status_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Status Data Message set to where it lies, so a field read out of place says so */
inline ramp_trading_status_data_message(trading_status_data_message_record, trading_status_data_message_base) {
  trading_status_data_message_at = 0;
  do
  :: trading_status_data_message_at < 4 -> trading_status_data_message_record.nanoseconds[trading_status_data_message_at] = (trading_status_data_message_base + 0 + trading_status_data_message_at + 1) % 256; trading_status_data_message_at = trading_status_data_message_at + 1
  :: else -> break
  od;
  trading_status_data_message_at = 0;
  do
  :: trading_status_data_message_at < 4 -> trading_status_data_message_record.order_book_id[trading_status_data_message_at] = (trading_status_data_message_base + 4 + trading_status_data_message_at + 1) % 256; trading_status_data_message_at = trading_status_data_message_at + 1
  :: else -> break
  od;
  trading_status_data_message_at = 0;
  do
  :: trading_status_data_message_at < 20 -> trading_status_data_message_record.state_name[trading_status_data_message_at] = (trading_status_data_message_base + 8 + trading_status_data_message_at + 1) % 256; trading_status_data_message_at = trading_status_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Status Data Message to the wire, 28 bytes from where the cursor stands */
inline encode_trading_status_data_message(trading_status_data_message_record) {
  trading_status_data_message_at = 0;
  do
  :: trading_status_data_message_at < 4 -> wire[at] = trading_status_data_message_record.nanoseconds[trading_status_data_message_at]; at = at + 1; trading_status_data_message_at = trading_status_data_message_at + 1
  :: else -> break
  od;
  trading_status_data_message_at = 0;
  do
  :: trading_status_data_message_at < 4 -> wire[at] = trading_status_data_message_record.order_book_id[trading_status_data_message_at]; at = at + 1; trading_status_data_message_at = trading_status_data_message_at + 1
  :: else -> break
  od;
  trading_status_data_message_at = 0;
  do
  :: trading_status_data_message_at < 20 -> wire[at] = trading_status_data_message_record.state_name[trading_status_data_message_at]; at = at + 1; trading_status_data_message_at = trading_status_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Status Data Message off the wire, 28 bytes from where the cursor stands */
inline decode_trading_status_data_message(trading_status_data_message_record) {
  trading_status_data_message_at = 0;
  do
  :: trading_status_data_message_at < 4 -> trading_status_data_message_record.nanoseconds[trading_status_data_message_at] = wire[at]; at = at + 1; trading_status_data_message_at = trading_status_data_message_at + 1
  :: else -> break
  od;
  trading_status_data_message_at = 0;
  do
  :: trading_status_data_message_at < 4 -> trading_status_data_message_record.order_book_id[trading_status_data_message_at] = wire[at]; at = at + 1; trading_status_data_message_at = trading_status_data_message_at + 1
  :: else -> break
  od;
  trading_status_data_message_at = 0;
  do
  :: trading_status_data_message_at < 20 -> trading_status_data_message_record.state_name[trading_status_data_message_at] = wire[at]; at = at + 1; trading_status_data_message_at = trading_status_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Status Data Message is what was written, byte for byte */
inline equal_trading_status_data_message(trading_status_data_message_read, trading_status_data_message_written) {
  trading_status_data_message_at = 0;
  do
  :: trading_status_data_message_at < 4 -> assert(trading_status_data_message_read.nanoseconds[trading_status_data_message_at] == trading_status_data_message_written.nanoseconds[trading_status_data_message_at]); trading_status_data_message_at = trading_status_data_message_at + 1
  :: else -> break
  od;
  trading_status_data_message_at = 0;
  do
  :: trading_status_data_message_at < 4 -> assert(trading_status_data_message_read.order_book_id[trading_status_data_message_at] == trading_status_data_message_written.order_book_id[trading_status_data_message_at]); trading_status_data_message_at = trading_status_data_message_at + 1
  :: else -> break
  od;
  trading_status_data_message_at = 0;
  do
  :: trading_status_data_message_at < 20 -> assert(trading_status_data_message_read.state_name[trading_status_data_message_at] == trading_status_data_message_written.state_name[trading_status_data_message_at]); trading_status_data_message_at = trading_status_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- New Order Message: 36 bytes --------------------------------------------- */

/* Provides quote data related to a new order. */
typedef NewOrderMessage {
  byte nanoseconds[4];
  byte order_id[8];
  byte order_book_id[4];
  byte side;
  byte order_book_position[4];
  byte quantity[8];
  byte price[4];
  byte order_attributes[2];
  byte lot_type
};

int new_order_message_at;

/* every byte of New Order Message set to one value */
inline fill_new_order_message(new_order_message_record, new_order_message_value) {
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.nanoseconds[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.order_id[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.order_book_id[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.side = new_order_message_value;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.order_book_position[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.quantity[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.price[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 2 -> new_order_message_record.order_attributes[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.lot_type = new_order_message_value;
  skip
}

/* each byte of New Order Message set to where it lies, so a field read out of place says so */
inline ramp_new_order_message(new_order_message_record, new_order_message_base) {
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.nanoseconds[new_order_message_at] = (new_order_message_base + 0 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.order_id[new_order_message_at] = (new_order_message_base + 4 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.order_book_id[new_order_message_at] = (new_order_message_base + 12 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.side = (new_order_message_base + 16 + 1) % 256;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.order_book_position[new_order_message_at] = (new_order_message_base + 17 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.quantity[new_order_message_at] = (new_order_message_base + 21 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.price[new_order_message_at] = (new_order_message_base + 29 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 2 -> new_order_message_record.order_attributes[new_order_message_at] = (new_order_message_base + 33 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.lot_type = (new_order_message_base + 35 + 1) % 256;
  skip
}

/* New Order Message to the wire, 36 bytes from where the cursor stands */
inline encode_new_order_message(new_order_message_record) {
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> wire[at] = new_order_message_record.nanoseconds[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> wire[at] = new_order_message_record.order_id[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> wire[at] = new_order_message_record.order_book_id[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_message_record.side; at = at + 1;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> wire[at] = new_order_message_record.order_book_position[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> wire[at] = new_order_message_record.quantity[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> wire[at] = new_order_message_record.price[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 2 -> wire[at] = new_order_message_record.order_attributes[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_message_record.lot_type; at = at + 1;
  skip
}

/* New Order Message off the wire, 36 bytes from where the cursor stands */
inline decode_new_order_message(new_order_message_record) {
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.nanoseconds[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.order_id[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.order_book_id[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.side = wire[at]; at = at + 1;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.order_book_position[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.quantity[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.price[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 2 -> new_order_message_record.order_attributes[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.lot_type = wire[at]; at = at + 1;
  skip
}

/* what was read of New Order Message is what was written, byte for byte */
inline equal_new_order_message(new_order_message_read, new_order_message_written) {
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> assert(new_order_message_read.nanoseconds[new_order_message_at] == new_order_message_written.nanoseconds[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> assert(new_order_message_read.order_id[new_order_message_at] == new_order_message_written.order_id[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> assert(new_order_message_read.order_book_id[new_order_message_at] == new_order_message_written.order_book_id[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  assert(new_order_message_read.side == new_order_message_written.side);
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> assert(new_order_message_read.order_book_position[new_order_message_at] == new_order_message_written.order_book_position[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> assert(new_order_message_read.quantity[new_order_message_at] == new_order_message_written.quantity[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> assert(new_order_message_read.price[new_order_message_at] == new_order_message_written.price[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 2 -> assert(new_order_message_read.order_attributes[new_order_message_at] == new_order_message_written.order_attributes[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  assert(new_order_message_read.lot_type == new_order_message_written.lot_type);
  skip
}

/* ---- Execution Notice Message: 51 bytes -------------------------------------- */

/* Provides an execution notice. The Order ID of the order which is already in the order book is set. */
typedef ExecutionNoticeMessage {
  byte nanoseconds[4];
  byte order_id[8];
  byte order_book_id[4];
  byte side;
  byte executed_quantity[8];
  byte match_id[8];
  byte combo_group_id[4];
  byte reserved_7_a[7];
  byte reserved_7_b[7]
};

int execution_notice_message_at;

/* every byte of Execution Notice Message set to one value */
inline fill_execution_notice_message(execution_notice_message_record, execution_notice_message_value) {
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 4 -> execution_notice_message_record.nanoseconds[execution_notice_message_at] = execution_notice_message_value; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 8 -> execution_notice_message_record.order_id[execution_notice_message_at] = execution_notice_message_value; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 4 -> execution_notice_message_record.order_book_id[execution_notice_message_at] = execution_notice_message_value; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_record.side = execution_notice_message_value;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 8 -> execution_notice_message_record.executed_quantity[execution_notice_message_at] = execution_notice_message_value; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 8 -> execution_notice_message_record.match_id[execution_notice_message_at] = execution_notice_message_value; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 4 -> execution_notice_message_record.combo_group_id[execution_notice_message_at] = execution_notice_message_value; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 7 -> execution_notice_message_record.reserved_7_a[execution_notice_message_at] = execution_notice_message_value; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 7 -> execution_notice_message_record.reserved_7_b[execution_notice_message_at] = execution_notice_message_value; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Execution Notice Message set to where it lies, so a field read out of place says so */
inline ramp_execution_notice_message(execution_notice_message_record, execution_notice_message_base) {
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 4 -> execution_notice_message_record.nanoseconds[execution_notice_message_at] = (execution_notice_message_base + 0 + execution_notice_message_at + 1) % 256; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 8 -> execution_notice_message_record.order_id[execution_notice_message_at] = (execution_notice_message_base + 4 + execution_notice_message_at + 1) % 256; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 4 -> execution_notice_message_record.order_book_id[execution_notice_message_at] = (execution_notice_message_base + 12 + execution_notice_message_at + 1) % 256; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_record.side = (execution_notice_message_base + 16 + 1) % 256;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 8 -> execution_notice_message_record.executed_quantity[execution_notice_message_at] = (execution_notice_message_base + 17 + execution_notice_message_at + 1) % 256; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 8 -> execution_notice_message_record.match_id[execution_notice_message_at] = (execution_notice_message_base + 25 + execution_notice_message_at + 1) % 256; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 4 -> execution_notice_message_record.combo_group_id[execution_notice_message_at] = (execution_notice_message_base + 33 + execution_notice_message_at + 1) % 256; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 7 -> execution_notice_message_record.reserved_7_a[execution_notice_message_at] = (execution_notice_message_base + 37 + execution_notice_message_at + 1) % 256; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 7 -> execution_notice_message_record.reserved_7_b[execution_notice_message_at] = (execution_notice_message_base + 44 + execution_notice_message_at + 1) % 256; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Notice Message to the wire, 51 bytes from where the cursor stands */
inline encode_execution_notice_message(execution_notice_message_record) {
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 4 -> wire[at] = execution_notice_message_record.nanoseconds[execution_notice_message_at]; at = at + 1; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 8 -> wire[at] = execution_notice_message_record.order_id[execution_notice_message_at]; at = at + 1; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 4 -> wire[at] = execution_notice_message_record.order_book_id[execution_notice_message_at]; at = at + 1; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_notice_message_record.side; at = at + 1;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 8 -> wire[at] = execution_notice_message_record.executed_quantity[execution_notice_message_at]; at = at + 1; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 8 -> wire[at] = execution_notice_message_record.match_id[execution_notice_message_at]; at = at + 1; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 4 -> wire[at] = execution_notice_message_record.combo_group_id[execution_notice_message_at]; at = at + 1; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 7 -> wire[at] = execution_notice_message_record.reserved_7_a[execution_notice_message_at]; at = at + 1; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 7 -> wire[at] = execution_notice_message_record.reserved_7_b[execution_notice_message_at]; at = at + 1; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Notice Message off the wire, 51 bytes from where the cursor stands */
inline decode_execution_notice_message(execution_notice_message_record) {
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 4 -> execution_notice_message_record.nanoseconds[execution_notice_message_at] = wire[at]; at = at + 1; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 8 -> execution_notice_message_record.order_id[execution_notice_message_at] = wire[at]; at = at + 1; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 4 -> execution_notice_message_record.order_book_id[execution_notice_message_at] = wire[at]; at = at + 1; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_record.side = wire[at]; at = at + 1;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 8 -> execution_notice_message_record.executed_quantity[execution_notice_message_at] = wire[at]; at = at + 1; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 8 -> execution_notice_message_record.match_id[execution_notice_message_at] = wire[at]; at = at + 1; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 4 -> execution_notice_message_record.combo_group_id[execution_notice_message_at] = wire[at]; at = at + 1; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 7 -> execution_notice_message_record.reserved_7_a[execution_notice_message_at] = wire[at]; at = at + 1; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 7 -> execution_notice_message_record.reserved_7_b[execution_notice_message_at] = wire[at]; at = at + 1; execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Execution Notice Message is what was written, byte for byte */
inline equal_execution_notice_message(execution_notice_message_read, execution_notice_message_written) {
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 4 -> assert(execution_notice_message_read.nanoseconds[execution_notice_message_at] == execution_notice_message_written.nanoseconds[execution_notice_message_at]); execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 8 -> assert(execution_notice_message_read.order_id[execution_notice_message_at] == execution_notice_message_written.order_id[execution_notice_message_at]); execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 4 -> assert(execution_notice_message_read.order_book_id[execution_notice_message_at] == execution_notice_message_written.order_book_id[execution_notice_message_at]); execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  assert(execution_notice_message_read.side == execution_notice_message_written.side);
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 8 -> assert(execution_notice_message_read.executed_quantity[execution_notice_message_at] == execution_notice_message_written.executed_quantity[execution_notice_message_at]); execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 8 -> assert(execution_notice_message_read.match_id[execution_notice_message_at] == execution_notice_message_written.match_id[execution_notice_message_at]); execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 4 -> assert(execution_notice_message_read.combo_group_id[execution_notice_message_at] == execution_notice_message_written.combo_group_id[execution_notice_message_at]); execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 7 -> assert(execution_notice_message_read.reserved_7_a[execution_notice_message_at] == execution_notice_message_written.reserved_7_a[execution_notice_message_at]); execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  execution_notice_message_at = 0;
  do
  :: execution_notice_message_at < 7 -> assert(execution_notice_message_read.reserved_7_b[execution_notice_message_at] == execution_notice_message_written.reserved_7_b[execution_notice_message_at]); execution_notice_message_at = execution_notice_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Execution Notice With Trade Information Message: 57 bytes --------------- */

/* Provides an execution notice with trade information. */
typedef ExecutionNoticeWithTradeInformationMessage {
  byte nanoseconds[4];
  byte order_id[8];
  byte order_book_id[4];
  byte side;
  byte executed_quantity[8];
  byte match_id[8];
  byte combo_group_id[4];
  byte reserved_7_a[7];
  byte reserved_7_b[7];
  byte trade_price[4];
  byte occurred_at_cross;
  byte printable
};

int execution_notice_with_trade_information_message_at;

/* every byte of Execution Notice With Trade Information Message set to one value */
inline fill_execution_notice_with_trade_information_message(execution_notice_with_trade_information_message_record, execution_notice_with_trade_information_message_value) {
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 4 -> execution_notice_with_trade_information_message_record.nanoseconds[execution_notice_with_trade_information_message_at] = execution_notice_with_trade_information_message_value; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 8 -> execution_notice_with_trade_information_message_record.order_id[execution_notice_with_trade_information_message_at] = execution_notice_with_trade_information_message_value; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 4 -> execution_notice_with_trade_information_message_record.order_book_id[execution_notice_with_trade_information_message_at] = execution_notice_with_trade_information_message_value; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_record.side = execution_notice_with_trade_information_message_value;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 8 -> execution_notice_with_trade_information_message_record.executed_quantity[execution_notice_with_trade_information_message_at] = execution_notice_with_trade_information_message_value; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 8 -> execution_notice_with_trade_information_message_record.match_id[execution_notice_with_trade_information_message_at] = execution_notice_with_trade_information_message_value; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 4 -> execution_notice_with_trade_information_message_record.combo_group_id[execution_notice_with_trade_information_message_at] = execution_notice_with_trade_information_message_value; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 7 -> execution_notice_with_trade_information_message_record.reserved_7_a[execution_notice_with_trade_information_message_at] = execution_notice_with_trade_information_message_value; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 7 -> execution_notice_with_trade_information_message_record.reserved_7_b[execution_notice_with_trade_information_message_at] = execution_notice_with_trade_information_message_value; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 4 -> execution_notice_with_trade_information_message_record.trade_price[execution_notice_with_trade_information_message_at] = execution_notice_with_trade_information_message_value; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_record.occurred_at_cross = execution_notice_with_trade_information_message_value;
  execution_notice_with_trade_information_message_record.printable = execution_notice_with_trade_information_message_value;
  skip
}

/* each byte of Execution Notice With Trade Information Message set to where it lies, so a field read out of place says so */
inline ramp_execution_notice_with_trade_information_message(execution_notice_with_trade_information_message_record, execution_notice_with_trade_information_message_base) {
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 4 -> execution_notice_with_trade_information_message_record.nanoseconds[execution_notice_with_trade_information_message_at] = (execution_notice_with_trade_information_message_base + 0 + execution_notice_with_trade_information_message_at + 1) % 256; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 8 -> execution_notice_with_trade_information_message_record.order_id[execution_notice_with_trade_information_message_at] = (execution_notice_with_trade_information_message_base + 4 + execution_notice_with_trade_information_message_at + 1) % 256; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 4 -> execution_notice_with_trade_information_message_record.order_book_id[execution_notice_with_trade_information_message_at] = (execution_notice_with_trade_information_message_base + 12 + execution_notice_with_trade_information_message_at + 1) % 256; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_record.side = (execution_notice_with_trade_information_message_base + 16 + 1) % 256;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 8 -> execution_notice_with_trade_information_message_record.executed_quantity[execution_notice_with_trade_information_message_at] = (execution_notice_with_trade_information_message_base + 17 + execution_notice_with_trade_information_message_at + 1) % 256; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 8 -> execution_notice_with_trade_information_message_record.match_id[execution_notice_with_trade_information_message_at] = (execution_notice_with_trade_information_message_base + 25 + execution_notice_with_trade_information_message_at + 1) % 256; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 4 -> execution_notice_with_trade_information_message_record.combo_group_id[execution_notice_with_trade_information_message_at] = (execution_notice_with_trade_information_message_base + 33 + execution_notice_with_trade_information_message_at + 1) % 256; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 7 -> execution_notice_with_trade_information_message_record.reserved_7_a[execution_notice_with_trade_information_message_at] = (execution_notice_with_trade_information_message_base + 37 + execution_notice_with_trade_information_message_at + 1) % 256; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 7 -> execution_notice_with_trade_information_message_record.reserved_7_b[execution_notice_with_trade_information_message_at] = (execution_notice_with_trade_information_message_base + 44 + execution_notice_with_trade_information_message_at + 1) % 256; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 4 -> execution_notice_with_trade_information_message_record.trade_price[execution_notice_with_trade_information_message_at] = (execution_notice_with_trade_information_message_base + 51 + execution_notice_with_trade_information_message_at + 1) % 256; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_record.occurred_at_cross = (execution_notice_with_trade_information_message_base + 55 + 1) % 256;
  execution_notice_with_trade_information_message_record.printable = (execution_notice_with_trade_information_message_base + 56 + 1) % 256;
  skip
}

/* Execution Notice With Trade Information Message to the wire, 57 bytes from where the cursor stands */
inline encode_execution_notice_with_trade_information_message(execution_notice_with_trade_information_message_record) {
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 4 -> wire[at] = execution_notice_with_trade_information_message_record.nanoseconds[execution_notice_with_trade_information_message_at]; at = at + 1; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 8 -> wire[at] = execution_notice_with_trade_information_message_record.order_id[execution_notice_with_trade_information_message_at]; at = at + 1; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 4 -> wire[at] = execution_notice_with_trade_information_message_record.order_book_id[execution_notice_with_trade_information_message_at]; at = at + 1; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_notice_with_trade_information_message_record.side; at = at + 1;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 8 -> wire[at] = execution_notice_with_trade_information_message_record.executed_quantity[execution_notice_with_trade_information_message_at]; at = at + 1; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 8 -> wire[at] = execution_notice_with_trade_information_message_record.match_id[execution_notice_with_trade_information_message_at]; at = at + 1; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 4 -> wire[at] = execution_notice_with_trade_information_message_record.combo_group_id[execution_notice_with_trade_information_message_at]; at = at + 1; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 7 -> wire[at] = execution_notice_with_trade_information_message_record.reserved_7_a[execution_notice_with_trade_information_message_at]; at = at + 1; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 7 -> wire[at] = execution_notice_with_trade_information_message_record.reserved_7_b[execution_notice_with_trade_information_message_at]; at = at + 1; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 4 -> wire[at] = execution_notice_with_trade_information_message_record.trade_price[execution_notice_with_trade_information_message_at]; at = at + 1; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_notice_with_trade_information_message_record.occurred_at_cross; at = at + 1;
  wire[at] = execution_notice_with_trade_information_message_record.printable; at = at + 1;
  skip
}

/* Execution Notice With Trade Information Message off the wire, 57 bytes from where the cursor stands */
inline decode_execution_notice_with_trade_information_message(execution_notice_with_trade_information_message_record) {
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 4 -> execution_notice_with_trade_information_message_record.nanoseconds[execution_notice_with_trade_information_message_at] = wire[at]; at = at + 1; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 8 -> execution_notice_with_trade_information_message_record.order_id[execution_notice_with_trade_information_message_at] = wire[at]; at = at + 1; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 4 -> execution_notice_with_trade_information_message_record.order_book_id[execution_notice_with_trade_information_message_at] = wire[at]; at = at + 1; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_record.side = wire[at]; at = at + 1;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 8 -> execution_notice_with_trade_information_message_record.executed_quantity[execution_notice_with_trade_information_message_at] = wire[at]; at = at + 1; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 8 -> execution_notice_with_trade_information_message_record.match_id[execution_notice_with_trade_information_message_at] = wire[at]; at = at + 1; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 4 -> execution_notice_with_trade_information_message_record.combo_group_id[execution_notice_with_trade_information_message_at] = wire[at]; at = at + 1; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 7 -> execution_notice_with_trade_information_message_record.reserved_7_a[execution_notice_with_trade_information_message_at] = wire[at]; at = at + 1; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 7 -> execution_notice_with_trade_information_message_record.reserved_7_b[execution_notice_with_trade_information_message_at] = wire[at]; at = at + 1; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 4 -> execution_notice_with_trade_information_message_record.trade_price[execution_notice_with_trade_information_message_at] = wire[at]; at = at + 1; execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_record.occurred_at_cross = wire[at]; at = at + 1;
  execution_notice_with_trade_information_message_record.printable = wire[at]; at = at + 1;
  skip
}

/* what was read of Execution Notice With Trade Information Message is what was written, byte for byte */
inline equal_execution_notice_with_trade_information_message(execution_notice_with_trade_information_message_read, execution_notice_with_trade_information_message_written) {
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 4 -> assert(execution_notice_with_trade_information_message_read.nanoseconds[execution_notice_with_trade_information_message_at] == execution_notice_with_trade_information_message_written.nanoseconds[execution_notice_with_trade_information_message_at]); execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 8 -> assert(execution_notice_with_trade_information_message_read.order_id[execution_notice_with_trade_information_message_at] == execution_notice_with_trade_information_message_written.order_id[execution_notice_with_trade_information_message_at]); execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 4 -> assert(execution_notice_with_trade_information_message_read.order_book_id[execution_notice_with_trade_information_message_at] == execution_notice_with_trade_information_message_written.order_book_id[execution_notice_with_trade_information_message_at]); execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  assert(execution_notice_with_trade_information_message_read.side == execution_notice_with_trade_information_message_written.side);
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 8 -> assert(execution_notice_with_trade_information_message_read.executed_quantity[execution_notice_with_trade_information_message_at] == execution_notice_with_trade_information_message_written.executed_quantity[execution_notice_with_trade_information_message_at]); execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 8 -> assert(execution_notice_with_trade_information_message_read.match_id[execution_notice_with_trade_information_message_at] == execution_notice_with_trade_information_message_written.match_id[execution_notice_with_trade_information_message_at]); execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 4 -> assert(execution_notice_with_trade_information_message_read.combo_group_id[execution_notice_with_trade_information_message_at] == execution_notice_with_trade_information_message_written.combo_group_id[execution_notice_with_trade_information_message_at]); execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 7 -> assert(execution_notice_with_trade_information_message_read.reserved_7_a[execution_notice_with_trade_information_message_at] == execution_notice_with_trade_information_message_written.reserved_7_a[execution_notice_with_trade_information_message_at]); execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 7 -> assert(execution_notice_with_trade_information_message_read.reserved_7_b[execution_notice_with_trade_information_message_at] == execution_notice_with_trade_information_message_written.reserved_7_b[execution_notice_with_trade_information_message_at]); execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  execution_notice_with_trade_information_message_at = 0;
  do
  :: execution_notice_with_trade_information_message_at < 4 -> assert(execution_notice_with_trade_information_message_read.trade_price[execution_notice_with_trade_information_message_at] == execution_notice_with_trade_information_message_written.trade_price[execution_notice_with_trade_information_message_at]); execution_notice_with_trade_information_message_at = execution_notice_with_trade_information_message_at + 1
  :: else -> break
  od;
  assert(execution_notice_with_trade_information_message_read.occurred_at_cross == execution_notice_with_trade_information_message_written.occurred_at_cross);
  assert(execution_notice_with_trade_information_message_read.printable == execution_notice_with_trade_information_message_written.printable);
  skip
}

/* ---- Deleted Order Message: 17 bytes ----------------------------------------- */

/* Provided when an order is deleted and does not exist in the order book. */
typedef DeletedOrderMessage {
  byte nanoseconds[4];
  byte order_id[8];
  byte order_book_id[4];
  byte side
};

int deleted_order_message_at;

/* every byte of Deleted Order Message set to one value */
inline fill_deleted_order_message(deleted_order_message_record, deleted_order_message_value) {
  deleted_order_message_at = 0;
  do
  :: deleted_order_message_at < 4 -> deleted_order_message_record.nanoseconds[deleted_order_message_at] = deleted_order_message_value; deleted_order_message_at = deleted_order_message_at + 1
  :: else -> break
  od;
  deleted_order_message_at = 0;
  do
  :: deleted_order_message_at < 8 -> deleted_order_message_record.order_id[deleted_order_message_at] = deleted_order_message_value; deleted_order_message_at = deleted_order_message_at + 1
  :: else -> break
  od;
  deleted_order_message_at = 0;
  do
  :: deleted_order_message_at < 4 -> deleted_order_message_record.order_book_id[deleted_order_message_at] = deleted_order_message_value; deleted_order_message_at = deleted_order_message_at + 1
  :: else -> break
  od;
  deleted_order_message_record.side = deleted_order_message_value;
  skip
}

/* each byte of Deleted Order Message set to where it lies, so a field read out of place says so */
inline ramp_deleted_order_message(deleted_order_message_record, deleted_order_message_base) {
  deleted_order_message_at = 0;
  do
  :: deleted_order_message_at < 4 -> deleted_order_message_record.nanoseconds[deleted_order_message_at] = (deleted_order_message_base + 0 + deleted_order_message_at + 1) % 256; deleted_order_message_at = deleted_order_message_at + 1
  :: else -> break
  od;
  deleted_order_message_at = 0;
  do
  :: deleted_order_message_at < 8 -> deleted_order_message_record.order_id[deleted_order_message_at] = (deleted_order_message_base + 4 + deleted_order_message_at + 1) % 256; deleted_order_message_at = deleted_order_message_at + 1
  :: else -> break
  od;
  deleted_order_message_at = 0;
  do
  :: deleted_order_message_at < 4 -> deleted_order_message_record.order_book_id[deleted_order_message_at] = (deleted_order_message_base + 12 + deleted_order_message_at + 1) % 256; deleted_order_message_at = deleted_order_message_at + 1
  :: else -> break
  od;
  deleted_order_message_record.side = (deleted_order_message_base + 16 + 1) % 256;
  skip
}

/* Deleted Order Message to the wire, 17 bytes from where the cursor stands */
inline encode_deleted_order_message(deleted_order_message_record) {
  deleted_order_message_at = 0;
  do
  :: deleted_order_message_at < 4 -> wire[at] = deleted_order_message_record.nanoseconds[deleted_order_message_at]; at = at + 1; deleted_order_message_at = deleted_order_message_at + 1
  :: else -> break
  od;
  deleted_order_message_at = 0;
  do
  :: deleted_order_message_at < 8 -> wire[at] = deleted_order_message_record.order_id[deleted_order_message_at]; at = at + 1; deleted_order_message_at = deleted_order_message_at + 1
  :: else -> break
  od;
  deleted_order_message_at = 0;
  do
  :: deleted_order_message_at < 4 -> wire[at] = deleted_order_message_record.order_book_id[deleted_order_message_at]; at = at + 1; deleted_order_message_at = deleted_order_message_at + 1
  :: else -> break
  od;
  wire[at] = deleted_order_message_record.side; at = at + 1;
  skip
}

/* Deleted Order Message off the wire, 17 bytes from where the cursor stands */
inline decode_deleted_order_message(deleted_order_message_record) {
  deleted_order_message_at = 0;
  do
  :: deleted_order_message_at < 4 -> deleted_order_message_record.nanoseconds[deleted_order_message_at] = wire[at]; at = at + 1; deleted_order_message_at = deleted_order_message_at + 1
  :: else -> break
  od;
  deleted_order_message_at = 0;
  do
  :: deleted_order_message_at < 8 -> deleted_order_message_record.order_id[deleted_order_message_at] = wire[at]; at = at + 1; deleted_order_message_at = deleted_order_message_at + 1
  :: else -> break
  od;
  deleted_order_message_at = 0;
  do
  :: deleted_order_message_at < 4 -> deleted_order_message_record.order_book_id[deleted_order_message_at] = wire[at]; at = at + 1; deleted_order_message_at = deleted_order_message_at + 1
  :: else -> break
  od;
  deleted_order_message_record.side = wire[at]; at = at + 1;
  skip
}

/* what was read of Deleted Order Message is what was written, byte for byte */
inline equal_deleted_order_message(deleted_order_message_read, deleted_order_message_written) {
  deleted_order_message_at = 0;
  do
  :: deleted_order_message_at < 4 -> assert(deleted_order_message_read.nanoseconds[deleted_order_message_at] == deleted_order_message_written.nanoseconds[deleted_order_message_at]); deleted_order_message_at = deleted_order_message_at + 1
  :: else -> break
  od;
  deleted_order_message_at = 0;
  do
  :: deleted_order_message_at < 8 -> assert(deleted_order_message_read.order_id[deleted_order_message_at] == deleted_order_message_written.order_id[deleted_order_message_at]); deleted_order_message_at = deleted_order_message_at + 1
  :: else -> break
  od;
  deleted_order_message_at = 0;
  do
  :: deleted_order_message_at < 4 -> assert(deleted_order_message_read.order_book_id[deleted_order_message_at] == deleted_order_message_written.order_book_id[deleted_order_message_at]); deleted_order_message_at = deleted_order_message_at + 1
  :: else -> break
  od;
  assert(deleted_order_message_read.side == deleted_order_message_written.side);
  skip
}

/* ---- Ep Message: 52 bytes ---------------------------------------------------- */

/* Provides the equilibrium price for the order reception hours. */
typedef EpMessage {
  byte nanoseconds[4];
  byte order_book_id[4];
  byte available_bid_quantity_at_equilibrium_price[8];
  byte available_ask_quantity_at_equilibrium_price[8];
  byte equilibrium_price[4];
  byte reserved_4_a[4];
  byte reserved_4_b[4];
  byte reserved_8_a[8];
  byte reserved_8_b[8]
};

int ep_message_at;

/* every byte of Ep Message set to one value */
inline fill_ep_message(ep_message_record, ep_message_value) {
  ep_message_at = 0;
  do
  :: ep_message_at < 4 -> ep_message_record.nanoseconds[ep_message_at] = ep_message_value; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 4 -> ep_message_record.order_book_id[ep_message_at] = ep_message_value; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 8 -> ep_message_record.available_bid_quantity_at_equilibrium_price[ep_message_at] = ep_message_value; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 8 -> ep_message_record.available_ask_quantity_at_equilibrium_price[ep_message_at] = ep_message_value; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 4 -> ep_message_record.equilibrium_price[ep_message_at] = ep_message_value; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 4 -> ep_message_record.reserved_4_a[ep_message_at] = ep_message_value; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 4 -> ep_message_record.reserved_4_b[ep_message_at] = ep_message_value; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 8 -> ep_message_record.reserved_8_a[ep_message_at] = ep_message_value; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 8 -> ep_message_record.reserved_8_b[ep_message_at] = ep_message_value; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ep Message set to where it lies, so a field read out of place says so */
inline ramp_ep_message(ep_message_record, ep_message_base) {
  ep_message_at = 0;
  do
  :: ep_message_at < 4 -> ep_message_record.nanoseconds[ep_message_at] = (ep_message_base + 0 + ep_message_at + 1) % 256; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 4 -> ep_message_record.order_book_id[ep_message_at] = (ep_message_base + 4 + ep_message_at + 1) % 256; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 8 -> ep_message_record.available_bid_quantity_at_equilibrium_price[ep_message_at] = (ep_message_base + 8 + ep_message_at + 1) % 256; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 8 -> ep_message_record.available_ask_quantity_at_equilibrium_price[ep_message_at] = (ep_message_base + 16 + ep_message_at + 1) % 256; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 4 -> ep_message_record.equilibrium_price[ep_message_at] = (ep_message_base + 24 + ep_message_at + 1) % 256; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 4 -> ep_message_record.reserved_4_a[ep_message_at] = (ep_message_base + 28 + ep_message_at + 1) % 256; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 4 -> ep_message_record.reserved_4_b[ep_message_at] = (ep_message_base + 32 + ep_message_at + 1) % 256; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 8 -> ep_message_record.reserved_8_a[ep_message_at] = (ep_message_base + 36 + ep_message_at + 1) % 256; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 8 -> ep_message_record.reserved_8_b[ep_message_at] = (ep_message_base + 44 + ep_message_at + 1) % 256; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ep Message to the wire, 52 bytes from where the cursor stands */
inline encode_ep_message(ep_message_record) {
  ep_message_at = 0;
  do
  :: ep_message_at < 4 -> wire[at] = ep_message_record.nanoseconds[ep_message_at]; at = at + 1; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 4 -> wire[at] = ep_message_record.order_book_id[ep_message_at]; at = at + 1; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 8 -> wire[at] = ep_message_record.available_bid_quantity_at_equilibrium_price[ep_message_at]; at = at + 1; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 8 -> wire[at] = ep_message_record.available_ask_quantity_at_equilibrium_price[ep_message_at]; at = at + 1; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 4 -> wire[at] = ep_message_record.equilibrium_price[ep_message_at]; at = at + 1; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 4 -> wire[at] = ep_message_record.reserved_4_a[ep_message_at]; at = at + 1; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 4 -> wire[at] = ep_message_record.reserved_4_b[ep_message_at]; at = at + 1; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 8 -> wire[at] = ep_message_record.reserved_8_a[ep_message_at]; at = at + 1; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 8 -> wire[at] = ep_message_record.reserved_8_b[ep_message_at]; at = at + 1; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ep Message off the wire, 52 bytes from where the cursor stands */
inline decode_ep_message(ep_message_record) {
  ep_message_at = 0;
  do
  :: ep_message_at < 4 -> ep_message_record.nanoseconds[ep_message_at] = wire[at]; at = at + 1; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 4 -> ep_message_record.order_book_id[ep_message_at] = wire[at]; at = at + 1; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 8 -> ep_message_record.available_bid_quantity_at_equilibrium_price[ep_message_at] = wire[at]; at = at + 1; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 8 -> ep_message_record.available_ask_quantity_at_equilibrium_price[ep_message_at] = wire[at]; at = at + 1; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 4 -> ep_message_record.equilibrium_price[ep_message_at] = wire[at]; at = at + 1; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 4 -> ep_message_record.reserved_4_a[ep_message_at] = wire[at]; at = at + 1; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 4 -> ep_message_record.reserved_4_b[ep_message_at] = wire[at]; at = at + 1; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 8 -> ep_message_record.reserved_8_a[ep_message_at] = wire[at]; at = at + 1; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 8 -> ep_message_record.reserved_8_b[ep_message_at] = wire[at]; at = at + 1; ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ep Message is what was written, byte for byte */
inline equal_ep_message(ep_message_read, ep_message_written) {
  ep_message_at = 0;
  do
  :: ep_message_at < 4 -> assert(ep_message_read.nanoseconds[ep_message_at] == ep_message_written.nanoseconds[ep_message_at]); ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 4 -> assert(ep_message_read.order_book_id[ep_message_at] == ep_message_written.order_book_id[ep_message_at]); ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 8 -> assert(ep_message_read.available_bid_quantity_at_equilibrium_price[ep_message_at] == ep_message_written.available_bid_quantity_at_equilibrium_price[ep_message_at]); ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 8 -> assert(ep_message_read.available_ask_quantity_at_equilibrium_price[ep_message_at] == ep_message_written.available_ask_quantity_at_equilibrium_price[ep_message_at]); ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 4 -> assert(ep_message_read.equilibrium_price[ep_message_at] == ep_message_written.equilibrium_price[ep_message_at]); ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 4 -> assert(ep_message_read.reserved_4_a[ep_message_at] == ep_message_written.reserved_4_a[ep_message_at]); ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 4 -> assert(ep_message_read.reserved_4_b[ep_message_at] == ep_message_written.reserved_4_b[ep_message_at]); ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 8 -> assert(ep_message_read.reserved_8_a[ep_message_at] == ep_message_written.reserved_8_a[ep_message_at]); ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  ep_message_at = 0;
  do
  :: ep_message_at < 8 -> assert(ep_message_read.reserved_8_b[ep_message_at] == ep_message_written.reserved_8_b[ep_message_at]); ep_message_at = ep_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Snapshot Completion Message: 20 bytes ----------------------------------- */

/* Sent after completing the transmission of snapshot data. */
typedef SnapshotCompletionMessage {
  byte sequence[20]
};

int snapshot_completion_message_at;

/* every byte of Snapshot Completion Message set to one value */
inline fill_snapshot_completion_message(snapshot_completion_message_record, snapshot_completion_message_value) {
  snapshot_completion_message_at = 0;
  do
  :: snapshot_completion_message_at < 20 -> snapshot_completion_message_record.sequence[snapshot_completion_message_at] = snapshot_completion_message_value; snapshot_completion_message_at = snapshot_completion_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Snapshot Completion Message set to where it lies, so a field read out of place says so */
inline ramp_snapshot_completion_message(snapshot_completion_message_record, snapshot_completion_message_base) {
  snapshot_completion_message_at = 0;
  do
  :: snapshot_completion_message_at < 20 -> snapshot_completion_message_record.sequence[snapshot_completion_message_at] = (snapshot_completion_message_base + 0 + snapshot_completion_message_at + 1) % 256; snapshot_completion_message_at = snapshot_completion_message_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Completion Message to the wire, 20 bytes from where the cursor stands */
inline encode_snapshot_completion_message(snapshot_completion_message_record) {
  snapshot_completion_message_at = 0;
  do
  :: snapshot_completion_message_at < 20 -> wire[at] = snapshot_completion_message_record.sequence[snapshot_completion_message_at]; at = at + 1; snapshot_completion_message_at = snapshot_completion_message_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Completion Message off the wire, 20 bytes from where the cursor stands */
inline decode_snapshot_completion_message(snapshot_completion_message_record) {
  snapshot_completion_message_at = 0;
  do
  :: snapshot_completion_message_at < 20 -> snapshot_completion_message_record.sequence[snapshot_completion_message_at] = wire[at]; at = at + 1; snapshot_completion_message_at = snapshot_completion_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Snapshot Completion Message is what was written, byte for byte */
inline equal_snapshot_completion_message(snapshot_completion_message_read, snapshot_completion_message_written) {
  snapshot_completion_message_at = 0;
  do
  :: snapshot_completion_message_at < 20 -> assert(snapshot_completion_message_read.sequence[snapshot_completion_message_at] == snapshot_completion_message_written.sequence[snapshot_completion_message_at]); snapshot_completion_message_at = snapshot_completion_message_at + 1
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

/* Series Information Basic Message: encoded, read back, and compared */
proctype check_series_information_basic_message() {
  SeriesInformationBasicMessage series_information_basic_message_sent;
  SeriesInformationBasicMessage series_information_basic_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_series_information_basic_message(series_information_basic_message_sent, 0)
  :: pattern == 1 -> fill_series_information_basic_message(series_information_basic_message_sent, 32)
  :: pattern == 2 -> fill_series_information_basic_message(series_information_basic_message_sent, 255)
  :: else -> ramp_series_information_basic_message(series_information_basic_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_series_information_basic_message(series_information_basic_message_sent);
    assert(at == 128);
    at = 0;
    decode_series_information_basic_message(series_information_basic_message_got);
    assert(at == 128);
    equal_series_information_basic_message(series_information_basic_message_got, series_information_basic_message_sent)
  }
}

/* Series Information Basic Combination Message: encoded, read back, and compared */
proctype check_series_information_basic_combination_message() {
  SeriesInformationBasicCombinationMessage series_information_basic_combination_message_sent;
  SeriesInformationBasicCombinationMessage series_information_basic_combination_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_series_information_basic_combination_message(series_information_basic_combination_message_sent, 0)
  :: pattern == 1 -> fill_series_information_basic_combination_message(series_information_basic_combination_message_sent, 32)
  :: pattern == 2 -> fill_series_information_basic_combination_message(series_information_basic_combination_message_sent, 255)
  :: else -> ramp_series_information_basic_combination_message(series_information_basic_combination_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_series_information_basic_combination_message(series_information_basic_combination_message_sent);
    assert(at == 17);
    at = 0;
    decode_series_information_basic_combination_message(series_information_basic_combination_message_got);
    assert(at == 17);
    equal_series_information_basic_combination_message(series_information_basic_combination_message_got, series_information_basic_combination_message_sent)
  }
}

/* Tick Size Data Message: encoded, read back, and compared */
proctype check_tick_size_data_message() {
  TickSizeDataMessage tick_size_data_message_sent;
  TickSizeDataMessage tick_size_data_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_tick_size_data_message(tick_size_data_message_sent, 0)
  :: pattern == 1 -> fill_tick_size_data_message(tick_size_data_message_sent, 32)
  :: pattern == 2 -> fill_tick_size_data_message(tick_size_data_message_sent, 255)
  :: else -> ramp_tick_size_data_message(tick_size_data_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_tick_size_data_message(tick_size_data_message_sent);
    assert(at == 24);
    at = 0;
    decode_tick_size_data_message(tick_size_data_message_got);
    assert(at == 24);
    equal_tick_size_data_message(tick_size_data_message_got, tick_size_data_message_sent)
  }
}

/* System Event Data Message: encoded, read back, and compared */
proctype check_system_event_data_message() {
  SystemEventDataMessage system_event_data_message_sent;
  SystemEventDataMessage system_event_data_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_system_event_data_message(system_event_data_message_sent, 0)
  :: pattern == 1 -> fill_system_event_data_message(system_event_data_message_sent, 32)
  :: pattern == 2 -> fill_system_event_data_message(system_event_data_message_sent, 255)
  :: else -> ramp_system_event_data_message(system_event_data_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_system_event_data_message(system_event_data_message_sent);
    assert(at == 5);
    at = 0;
    decode_system_event_data_message(system_event_data_message_got);
    assert(at == 5);
    equal_system_event_data_message(system_event_data_message_got, system_event_data_message_sent)
  }
}

/* Trading Status Data Message: encoded, read back, and compared */
proctype check_trading_status_data_message() {
  TradingStatusDataMessage trading_status_data_message_sent;
  TradingStatusDataMessage trading_status_data_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_status_data_message(trading_status_data_message_sent, 0)
  :: pattern == 1 -> fill_trading_status_data_message(trading_status_data_message_sent, 32)
  :: pattern == 2 -> fill_trading_status_data_message(trading_status_data_message_sent, 255)
  :: else -> ramp_trading_status_data_message(trading_status_data_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_status_data_message(trading_status_data_message_sent);
    assert(at == 28);
    at = 0;
    decode_trading_status_data_message(trading_status_data_message_got);
    assert(at == 28);
    equal_trading_status_data_message(trading_status_data_message_got, trading_status_data_message_sent)
  }
}

/* New Order Message: encoded, read back, and compared */
proctype check_new_order_message() {
  NewOrderMessage new_order_message_sent;
  NewOrderMessage new_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_order_message(new_order_message_sent, 0)
  :: pattern == 1 -> fill_new_order_message(new_order_message_sent, 32)
  :: pattern == 2 -> fill_new_order_message(new_order_message_sent, 255)
  :: else -> ramp_new_order_message(new_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_order_message(new_order_message_sent);
    assert(at == 36);
    at = 0;
    decode_new_order_message(new_order_message_got);
    assert(at == 36);
    equal_new_order_message(new_order_message_got, new_order_message_sent)
  }
}

/* Execution Notice Message: encoded, read back, and compared */
proctype check_execution_notice_message() {
  ExecutionNoticeMessage execution_notice_message_sent;
  ExecutionNoticeMessage execution_notice_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_notice_message(execution_notice_message_sent, 0)
  :: pattern == 1 -> fill_execution_notice_message(execution_notice_message_sent, 32)
  :: pattern == 2 -> fill_execution_notice_message(execution_notice_message_sent, 255)
  :: else -> ramp_execution_notice_message(execution_notice_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_notice_message(execution_notice_message_sent);
    assert(at == 51);
    at = 0;
    decode_execution_notice_message(execution_notice_message_got);
    assert(at == 51);
    equal_execution_notice_message(execution_notice_message_got, execution_notice_message_sent)
  }
}

/* Execution Notice With Trade Information Message: encoded, read back, and compared */
proctype check_execution_notice_with_trade_information_message() {
  ExecutionNoticeWithTradeInformationMessage execution_notice_with_trade_information_message_sent;
  ExecutionNoticeWithTradeInformationMessage execution_notice_with_trade_information_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_notice_with_trade_information_message(execution_notice_with_trade_information_message_sent, 0)
  :: pattern == 1 -> fill_execution_notice_with_trade_information_message(execution_notice_with_trade_information_message_sent, 32)
  :: pattern == 2 -> fill_execution_notice_with_trade_information_message(execution_notice_with_trade_information_message_sent, 255)
  :: else -> ramp_execution_notice_with_trade_information_message(execution_notice_with_trade_information_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_notice_with_trade_information_message(execution_notice_with_trade_information_message_sent);
    assert(at == 57);
    at = 0;
    decode_execution_notice_with_trade_information_message(execution_notice_with_trade_information_message_got);
    assert(at == 57);
    equal_execution_notice_with_trade_information_message(execution_notice_with_trade_information_message_got, execution_notice_with_trade_information_message_sent)
  }
}

/* Deleted Order Message: encoded, read back, and compared */
proctype check_deleted_order_message() {
  DeletedOrderMessage deleted_order_message_sent;
  DeletedOrderMessage deleted_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_deleted_order_message(deleted_order_message_sent, 0)
  :: pattern == 1 -> fill_deleted_order_message(deleted_order_message_sent, 32)
  :: pattern == 2 -> fill_deleted_order_message(deleted_order_message_sent, 255)
  :: else -> ramp_deleted_order_message(deleted_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_deleted_order_message(deleted_order_message_sent);
    assert(at == 17);
    at = 0;
    decode_deleted_order_message(deleted_order_message_got);
    assert(at == 17);
    equal_deleted_order_message(deleted_order_message_got, deleted_order_message_sent)
  }
}

/* Ep Message: encoded, read back, and compared */
proctype check_ep_message() {
  EpMessage ep_message_sent;
  EpMessage ep_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ep_message(ep_message_sent, 0)
  :: pattern == 1 -> fill_ep_message(ep_message_sent, 32)
  :: pattern == 2 -> fill_ep_message(ep_message_sent, 255)
  :: else -> ramp_ep_message(ep_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ep_message(ep_message_sent);
    assert(at == 52);
    at = 0;
    decode_ep_message(ep_message_got);
    assert(at == 52);
    equal_ep_message(ep_message_got, ep_message_sent)
  }
}

/* Snapshot Completion Message: encoded, read back, and compared */
proctype check_snapshot_completion_message() {
  SnapshotCompletionMessage snapshot_completion_message_sent;
  SnapshotCompletionMessage snapshot_completion_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_snapshot_completion_message(snapshot_completion_message_sent, 0)
  :: pattern == 1 -> fill_snapshot_completion_message(snapshot_completion_message_sent, 32)
  :: pattern == 2 -> fill_snapshot_completion_message(snapshot_completion_message_sent, 255)
  :: else -> ramp_snapshot_completion_message(snapshot_completion_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_snapshot_completion_message(snapshot_completion_message_sent);
    assert(at == 20);
    at = 0;
    decode_snapshot_completion_message(snapshot_completion_message_got);
    assert(at == 20);
    equal_snapshot_completion_message(snapshot_completion_message_got, snapshot_completion_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_server_packet_header()
  :: run check_login_accepted_packet()
  :: run check_login_rejected_packet()
  :: run check_seconds_message()
  :: run check_series_information_basic_message()
  :: run check_series_information_basic_combination_message()
  :: run check_tick_size_data_message()
  :: run check_system_event_data_message()
  :: run check_trading_status_data_message()
  :: run check_new_order_message()
  :: run check_execution_notice_message()
  :: run check_execution_notice_with_trade_information_message()
  :: run check_deleted_order_message()
  :: run check_ep_message()
  :: run check_snapshot_completion_message()
  fi
}
