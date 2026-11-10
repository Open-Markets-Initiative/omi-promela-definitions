/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Depth Of Market
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
#define WIRE 86

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

/* ---- System Event Message: 11 bytes ------------------------------------------ */

/* The system event message type is used to signal a market or data feed handler event. */
typedef SystemEventMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte event_code
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.tracking_number[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = system_event_message_value;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.tracking_number[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = (system_event_message_base + 2 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 10 + 1) % 256;
  skip
}

/* System Event Message to the wire, 11 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> wire[at] = system_event_message_record.tracking_number[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> wire[at] = system_event_message_record.timestamp[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  skip
}

/* System Event Message off the wire, 11 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.tracking_number[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> assert(system_event_message_read.tracking_number[system_event_message_at] == system_event_message_written.tracking_number[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> assert(system_event_message_read.timestamp[system_event_message_at] == system_event_message_written.timestamp[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  skip
}

/* ---- Derivative Directory Message: 86 bytes ---------------------------------- */

/* Derivative Directory Message for active options symbols. */
typedef DerivativeDirectoryMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte security_symbol[6];
  byte expiration_year;
  byte expiration_month;
  byte expiration_date;
  byte explicit_strike_price[4];
  byte option_type;
  byte underlying_symbol[13];
  byte closing_type;
  byte tradable;
  byte mpv;
  byte isin[12];
  byte tick_size_table_id[2];
  byte price_notation;
  byte volume_notation;
  byte financial_product[2];
  byte market_segment_id;
  byte trading_currency[3];
  byte mic[4];
  byte instrument_long_name[16]
};

int derivative_directory_message_at;

/* every byte of Derivative Directory Message set to one value */
inline fill_derivative_directory_message(derivative_directory_message_record, derivative_directory_message_value) {
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 2 -> derivative_directory_message_record.tracking_number[derivative_directory_message_at] = derivative_directory_message_value; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 8 -> derivative_directory_message_record.timestamp[derivative_directory_message_at] = derivative_directory_message_value; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 4 -> derivative_directory_message_record.instrument_id[derivative_directory_message_at] = derivative_directory_message_value; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 6 -> derivative_directory_message_record.security_symbol[derivative_directory_message_at] = derivative_directory_message_value; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_record.expiration_year = derivative_directory_message_value;
  derivative_directory_message_record.expiration_month = derivative_directory_message_value;
  derivative_directory_message_record.expiration_date = derivative_directory_message_value;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 4 -> derivative_directory_message_record.explicit_strike_price[derivative_directory_message_at] = derivative_directory_message_value; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_record.option_type = derivative_directory_message_value;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 13 -> derivative_directory_message_record.underlying_symbol[derivative_directory_message_at] = derivative_directory_message_value; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_record.closing_type = derivative_directory_message_value;
  derivative_directory_message_record.tradable = derivative_directory_message_value;
  derivative_directory_message_record.mpv = derivative_directory_message_value;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 12 -> derivative_directory_message_record.isin[derivative_directory_message_at] = derivative_directory_message_value; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 2 -> derivative_directory_message_record.tick_size_table_id[derivative_directory_message_at] = derivative_directory_message_value; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_record.price_notation = derivative_directory_message_value;
  derivative_directory_message_record.volume_notation = derivative_directory_message_value;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 2 -> derivative_directory_message_record.financial_product[derivative_directory_message_at] = derivative_directory_message_value; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_record.market_segment_id = derivative_directory_message_value;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 3 -> derivative_directory_message_record.trading_currency[derivative_directory_message_at] = derivative_directory_message_value; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 4 -> derivative_directory_message_record.mic[derivative_directory_message_at] = derivative_directory_message_value; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 16 -> derivative_directory_message_record.instrument_long_name[derivative_directory_message_at] = derivative_directory_message_value; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Derivative Directory Message set to where it lies, so a field read out of place says so */
inline ramp_derivative_directory_message(derivative_directory_message_record, derivative_directory_message_base) {
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 2 -> derivative_directory_message_record.tracking_number[derivative_directory_message_at] = (derivative_directory_message_base + 0 + derivative_directory_message_at + 1) % 256; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 8 -> derivative_directory_message_record.timestamp[derivative_directory_message_at] = (derivative_directory_message_base + 2 + derivative_directory_message_at + 1) % 256; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 4 -> derivative_directory_message_record.instrument_id[derivative_directory_message_at] = (derivative_directory_message_base + 10 + derivative_directory_message_at + 1) % 256; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 6 -> derivative_directory_message_record.security_symbol[derivative_directory_message_at] = (derivative_directory_message_base + 14 + derivative_directory_message_at + 1) % 256; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_record.expiration_year = (derivative_directory_message_base + 20 + 1) % 256;
  derivative_directory_message_record.expiration_month = (derivative_directory_message_base + 21 + 1) % 256;
  derivative_directory_message_record.expiration_date = (derivative_directory_message_base + 22 + 1) % 256;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 4 -> derivative_directory_message_record.explicit_strike_price[derivative_directory_message_at] = (derivative_directory_message_base + 23 + derivative_directory_message_at + 1) % 256; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_record.option_type = (derivative_directory_message_base + 27 + 1) % 256;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 13 -> derivative_directory_message_record.underlying_symbol[derivative_directory_message_at] = (derivative_directory_message_base + 28 + derivative_directory_message_at + 1) % 256; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_record.closing_type = (derivative_directory_message_base + 41 + 1) % 256;
  derivative_directory_message_record.tradable = (derivative_directory_message_base + 42 + 1) % 256;
  derivative_directory_message_record.mpv = (derivative_directory_message_base + 43 + 1) % 256;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 12 -> derivative_directory_message_record.isin[derivative_directory_message_at] = (derivative_directory_message_base + 44 + derivative_directory_message_at + 1) % 256; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 2 -> derivative_directory_message_record.tick_size_table_id[derivative_directory_message_at] = (derivative_directory_message_base + 56 + derivative_directory_message_at + 1) % 256; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_record.price_notation = (derivative_directory_message_base + 58 + 1) % 256;
  derivative_directory_message_record.volume_notation = (derivative_directory_message_base + 59 + 1) % 256;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 2 -> derivative_directory_message_record.financial_product[derivative_directory_message_at] = (derivative_directory_message_base + 60 + derivative_directory_message_at + 1) % 256; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_record.market_segment_id = (derivative_directory_message_base + 62 + 1) % 256;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 3 -> derivative_directory_message_record.trading_currency[derivative_directory_message_at] = (derivative_directory_message_base + 63 + derivative_directory_message_at + 1) % 256; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 4 -> derivative_directory_message_record.mic[derivative_directory_message_at] = (derivative_directory_message_base + 66 + derivative_directory_message_at + 1) % 256; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 16 -> derivative_directory_message_record.instrument_long_name[derivative_directory_message_at] = (derivative_directory_message_base + 70 + derivative_directory_message_at + 1) % 256; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Derivative Directory Message to the wire, 86 bytes from where the cursor stands */
inline encode_derivative_directory_message(derivative_directory_message_record) {
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 2 -> wire[at] = derivative_directory_message_record.tracking_number[derivative_directory_message_at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 8 -> wire[at] = derivative_directory_message_record.timestamp[derivative_directory_message_at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 4 -> wire[at] = derivative_directory_message_record.instrument_id[derivative_directory_message_at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 6 -> wire[at] = derivative_directory_message_record.security_symbol[derivative_directory_message_at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = derivative_directory_message_record.expiration_year; at = at + 1;
  wire[at] = derivative_directory_message_record.expiration_month; at = at + 1;
  wire[at] = derivative_directory_message_record.expiration_date; at = at + 1;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 4 -> wire[at] = derivative_directory_message_record.explicit_strike_price[derivative_directory_message_at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = derivative_directory_message_record.option_type; at = at + 1;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 13 -> wire[at] = derivative_directory_message_record.underlying_symbol[derivative_directory_message_at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = derivative_directory_message_record.closing_type; at = at + 1;
  wire[at] = derivative_directory_message_record.tradable; at = at + 1;
  wire[at] = derivative_directory_message_record.mpv; at = at + 1;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 12 -> wire[at] = derivative_directory_message_record.isin[derivative_directory_message_at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 2 -> wire[at] = derivative_directory_message_record.tick_size_table_id[derivative_directory_message_at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = derivative_directory_message_record.price_notation; at = at + 1;
  wire[at] = derivative_directory_message_record.volume_notation; at = at + 1;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 2 -> wire[at] = derivative_directory_message_record.financial_product[derivative_directory_message_at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = derivative_directory_message_record.market_segment_id; at = at + 1;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 3 -> wire[at] = derivative_directory_message_record.trading_currency[derivative_directory_message_at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 4 -> wire[at] = derivative_directory_message_record.mic[derivative_directory_message_at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 16 -> wire[at] = derivative_directory_message_record.instrument_long_name[derivative_directory_message_at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Derivative Directory Message off the wire, 86 bytes from where the cursor stands */
inline decode_derivative_directory_message(derivative_directory_message_record) {
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 2 -> derivative_directory_message_record.tracking_number[derivative_directory_message_at] = wire[at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 8 -> derivative_directory_message_record.timestamp[derivative_directory_message_at] = wire[at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 4 -> derivative_directory_message_record.instrument_id[derivative_directory_message_at] = wire[at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 6 -> derivative_directory_message_record.security_symbol[derivative_directory_message_at] = wire[at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_record.expiration_year = wire[at]; at = at + 1;
  derivative_directory_message_record.expiration_month = wire[at]; at = at + 1;
  derivative_directory_message_record.expiration_date = wire[at]; at = at + 1;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 4 -> derivative_directory_message_record.explicit_strike_price[derivative_directory_message_at] = wire[at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_record.option_type = wire[at]; at = at + 1;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 13 -> derivative_directory_message_record.underlying_symbol[derivative_directory_message_at] = wire[at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_record.closing_type = wire[at]; at = at + 1;
  derivative_directory_message_record.tradable = wire[at]; at = at + 1;
  derivative_directory_message_record.mpv = wire[at]; at = at + 1;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 12 -> derivative_directory_message_record.isin[derivative_directory_message_at] = wire[at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 2 -> derivative_directory_message_record.tick_size_table_id[derivative_directory_message_at] = wire[at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_record.price_notation = wire[at]; at = at + 1;
  derivative_directory_message_record.volume_notation = wire[at]; at = at + 1;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 2 -> derivative_directory_message_record.financial_product[derivative_directory_message_at] = wire[at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_record.market_segment_id = wire[at]; at = at + 1;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 3 -> derivative_directory_message_record.trading_currency[derivative_directory_message_at] = wire[at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 4 -> derivative_directory_message_record.mic[derivative_directory_message_at] = wire[at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 16 -> derivative_directory_message_record.instrument_long_name[derivative_directory_message_at] = wire[at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Derivative Directory Message is what was written, byte for byte */
inline equal_derivative_directory_message(derivative_directory_message_read, derivative_directory_message_written) {
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 2 -> assert(derivative_directory_message_read.tracking_number[derivative_directory_message_at] == derivative_directory_message_written.tracking_number[derivative_directory_message_at]); derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 8 -> assert(derivative_directory_message_read.timestamp[derivative_directory_message_at] == derivative_directory_message_written.timestamp[derivative_directory_message_at]); derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 4 -> assert(derivative_directory_message_read.instrument_id[derivative_directory_message_at] == derivative_directory_message_written.instrument_id[derivative_directory_message_at]); derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 6 -> assert(derivative_directory_message_read.security_symbol[derivative_directory_message_at] == derivative_directory_message_written.security_symbol[derivative_directory_message_at]); derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  assert(derivative_directory_message_read.expiration_year == derivative_directory_message_written.expiration_year);
  assert(derivative_directory_message_read.expiration_month == derivative_directory_message_written.expiration_month);
  assert(derivative_directory_message_read.expiration_date == derivative_directory_message_written.expiration_date);
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 4 -> assert(derivative_directory_message_read.explicit_strike_price[derivative_directory_message_at] == derivative_directory_message_written.explicit_strike_price[derivative_directory_message_at]); derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  assert(derivative_directory_message_read.option_type == derivative_directory_message_written.option_type);
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 13 -> assert(derivative_directory_message_read.underlying_symbol[derivative_directory_message_at] == derivative_directory_message_written.underlying_symbol[derivative_directory_message_at]); derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  assert(derivative_directory_message_read.closing_type == derivative_directory_message_written.closing_type);
  assert(derivative_directory_message_read.tradable == derivative_directory_message_written.tradable);
  assert(derivative_directory_message_read.mpv == derivative_directory_message_written.mpv);
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 12 -> assert(derivative_directory_message_read.isin[derivative_directory_message_at] == derivative_directory_message_written.isin[derivative_directory_message_at]); derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 2 -> assert(derivative_directory_message_read.tick_size_table_id[derivative_directory_message_at] == derivative_directory_message_written.tick_size_table_id[derivative_directory_message_at]); derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  assert(derivative_directory_message_read.price_notation == derivative_directory_message_written.price_notation);
  assert(derivative_directory_message_read.volume_notation == derivative_directory_message_written.volume_notation);
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 2 -> assert(derivative_directory_message_read.financial_product[derivative_directory_message_at] == derivative_directory_message_written.financial_product[derivative_directory_message_at]); derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  assert(derivative_directory_message_read.market_segment_id == derivative_directory_message_written.market_segment_id);
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 3 -> assert(derivative_directory_message_read.trading_currency[derivative_directory_message_at] == derivative_directory_message_written.trading_currency[derivative_directory_message_at]); derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 4 -> assert(derivative_directory_message_read.mic[derivative_directory_message_at] == derivative_directory_message_written.mic[derivative_directory_message_at]); derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 16 -> assert(derivative_directory_message_read.instrument_long_name[derivative_directory_message_at] == derivative_directory_message_written.instrument_long_name[derivative_directory_message_at]); derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Action Message: 15 bytes ---------------------------------------- */

/* The options system uses this administrative message to indicate the current trading status of an index or equity option within the options market. */
typedef TradingActionMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte current_trading_state
};

int trading_action_message_at;

/* every byte of Trading Action Message set to one value */
inline fill_trading_action_message(trading_action_message_record, trading_action_message_value) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 2 -> trading_action_message_record.tracking_number[trading_action_message_at] = trading_action_message_value; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.timestamp[trading_action_message_at] = trading_action_message_value; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> trading_action_message_record.instrument_id[trading_action_message_at] = trading_action_message_value; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_record.current_trading_state = trading_action_message_value;
  skip
}

/* each byte of Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_trading_action_message(trading_action_message_record, trading_action_message_base) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 2 -> trading_action_message_record.tracking_number[trading_action_message_at] = (trading_action_message_base + 0 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.timestamp[trading_action_message_at] = (trading_action_message_base + 2 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> trading_action_message_record.instrument_id[trading_action_message_at] = (trading_action_message_base + 10 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_record.current_trading_state = (trading_action_message_base + 14 + 1) % 256;
  skip
}

/* Trading Action Message to the wire, 15 bytes from where the cursor stands */
inline encode_trading_action_message(trading_action_message_record) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 2 -> wire[at] = trading_action_message_record.tracking_number[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> wire[at] = trading_action_message_record.timestamp[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> wire[at] = trading_action_message_record.instrument_id[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_action_message_record.current_trading_state; at = at + 1;
  skip
}

/* Trading Action Message off the wire, 15 bytes from where the cursor stands */
inline decode_trading_action_message(trading_action_message_record) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 2 -> trading_action_message_record.tracking_number[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.timestamp[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> trading_action_message_record.instrument_id[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_record.current_trading_state = wire[at]; at = at + 1;
  skip
}

/* what was read of Trading Action Message is what was written, byte for byte */
inline equal_trading_action_message(trading_action_message_read, trading_action_message_written) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 2 -> assert(trading_action_message_read.tracking_number[trading_action_message_at] == trading_action_message_written.tracking_number[trading_action_message_at]); trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> assert(trading_action_message_read.timestamp[trading_action_message_at] == trading_action_message_written.timestamp[trading_action_message_at]); trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> assert(trading_action_message_read.instrument_id[trading_action_message_at] == trading_action_message_written.instrument_id[trading_action_message_at]); trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  assert(trading_action_message_read.current_trading_state == trading_action_message_written.current_trading_state);
  skip
}

/* ---- Add Order Short Form Message: 30 bytes ---------------------------------- */

/* An Add Order Message indicates that a new order has been accepted and was added to the displayable book. */
typedef AddOrderShortFormMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte order_reference_number[8];
  byte market_side;
  byte order_capacity;
  byte price_short[2];
  byte volume_short[2];
  byte rank[2]
};

int add_order_short_form_message_at;

/* every byte of Add Order Short Form Message set to one value */
inline fill_add_order_short_form_message(add_order_short_form_message_record, add_order_short_form_message_value) {
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> add_order_short_form_message_record.tracking_number[add_order_short_form_message_at] = add_order_short_form_message_value; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 8 -> add_order_short_form_message_record.timestamp[add_order_short_form_message_at] = add_order_short_form_message_value; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 4 -> add_order_short_form_message_record.instrument_id[add_order_short_form_message_at] = add_order_short_form_message_value; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 8 -> add_order_short_form_message_record.order_reference_number[add_order_short_form_message_at] = add_order_short_form_message_value; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_record.market_side = add_order_short_form_message_value;
  add_order_short_form_message_record.order_capacity = add_order_short_form_message_value;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> add_order_short_form_message_record.price_short[add_order_short_form_message_at] = add_order_short_form_message_value; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> add_order_short_form_message_record.volume_short[add_order_short_form_message_at] = add_order_short_form_message_value; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> add_order_short_form_message_record.rank[add_order_short_form_message_at] = add_order_short_form_message_value; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Short Form Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_short_form_message(add_order_short_form_message_record, add_order_short_form_message_base) {
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> add_order_short_form_message_record.tracking_number[add_order_short_form_message_at] = (add_order_short_form_message_base + 0 + add_order_short_form_message_at + 1) % 256; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 8 -> add_order_short_form_message_record.timestamp[add_order_short_form_message_at] = (add_order_short_form_message_base + 2 + add_order_short_form_message_at + 1) % 256; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 4 -> add_order_short_form_message_record.instrument_id[add_order_short_form_message_at] = (add_order_short_form_message_base + 10 + add_order_short_form_message_at + 1) % 256; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 8 -> add_order_short_form_message_record.order_reference_number[add_order_short_form_message_at] = (add_order_short_form_message_base + 14 + add_order_short_form_message_at + 1) % 256; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_record.market_side = (add_order_short_form_message_base + 22 + 1) % 256;
  add_order_short_form_message_record.order_capacity = (add_order_short_form_message_base + 23 + 1) % 256;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> add_order_short_form_message_record.price_short[add_order_short_form_message_at] = (add_order_short_form_message_base + 24 + add_order_short_form_message_at + 1) % 256; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> add_order_short_form_message_record.volume_short[add_order_short_form_message_at] = (add_order_short_form_message_base + 26 + add_order_short_form_message_at + 1) % 256; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> add_order_short_form_message_record.rank[add_order_short_form_message_at] = (add_order_short_form_message_base + 28 + add_order_short_form_message_at + 1) % 256; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Short Form Message to the wire, 30 bytes from where the cursor stands */
inline encode_add_order_short_form_message(add_order_short_form_message_record) {
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> wire[at] = add_order_short_form_message_record.tracking_number[add_order_short_form_message_at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 8 -> wire[at] = add_order_short_form_message_record.timestamp[add_order_short_form_message_at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 4 -> wire[at] = add_order_short_form_message_record.instrument_id[add_order_short_form_message_at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 8 -> wire[at] = add_order_short_form_message_record.order_reference_number[add_order_short_form_message_at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_short_form_message_record.market_side; at = at + 1;
  wire[at] = add_order_short_form_message_record.order_capacity; at = at + 1;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> wire[at] = add_order_short_form_message_record.price_short[add_order_short_form_message_at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> wire[at] = add_order_short_form_message_record.volume_short[add_order_short_form_message_at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> wire[at] = add_order_short_form_message_record.rank[add_order_short_form_message_at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Short Form Message off the wire, 30 bytes from where the cursor stands */
inline decode_add_order_short_form_message(add_order_short_form_message_record) {
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> add_order_short_form_message_record.tracking_number[add_order_short_form_message_at] = wire[at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 8 -> add_order_short_form_message_record.timestamp[add_order_short_form_message_at] = wire[at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 4 -> add_order_short_form_message_record.instrument_id[add_order_short_form_message_at] = wire[at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 8 -> add_order_short_form_message_record.order_reference_number[add_order_short_form_message_at] = wire[at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_record.market_side = wire[at]; at = at + 1;
  add_order_short_form_message_record.order_capacity = wire[at]; at = at + 1;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> add_order_short_form_message_record.price_short[add_order_short_form_message_at] = wire[at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> add_order_short_form_message_record.volume_short[add_order_short_form_message_at] = wire[at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> add_order_short_form_message_record.rank[add_order_short_form_message_at] = wire[at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Short Form Message is what was written, byte for byte */
inline equal_add_order_short_form_message(add_order_short_form_message_read, add_order_short_form_message_written) {
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> assert(add_order_short_form_message_read.tracking_number[add_order_short_form_message_at] == add_order_short_form_message_written.tracking_number[add_order_short_form_message_at]); add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 8 -> assert(add_order_short_form_message_read.timestamp[add_order_short_form_message_at] == add_order_short_form_message_written.timestamp[add_order_short_form_message_at]); add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 4 -> assert(add_order_short_form_message_read.instrument_id[add_order_short_form_message_at] == add_order_short_form_message_written.instrument_id[add_order_short_form_message_at]); add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 8 -> assert(add_order_short_form_message_read.order_reference_number[add_order_short_form_message_at] == add_order_short_form_message_written.order_reference_number[add_order_short_form_message_at]); add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  assert(add_order_short_form_message_read.market_side == add_order_short_form_message_written.market_side);
  assert(add_order_short_form_message_read.order_capacity == add_order_short_form_message_written.order_capacity);
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> assert(add_order_short_form_message_read.price_short[add_order_short_form_message_at] == add_order_short_form_message_written.price_short[add_order_short_form_message_at]); add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> assert(add_order_short_form_message_read.volume_short[add_order_short_form_message_at] == add_order_short_form_message_written.volume_short[add_order_short_form_message_at]); add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> assert(add_order_short_form_message_read.rank[add_order_short_form_message_at] == add_order_short_form_message_written.rank[add_order_short_form_message_at]); add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order Long Form Message: 34 bytes ----------------------------------- */

/* An Add Order Message indicates that a new order has been accepted and was added to the displayable book. */
typedef AddOrderLongFormMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte order_reference_number[8];
  byte market_side;
  byte order_capacity;
  byte price_long[4];
  byte volume_long[4];
  byte rank[2]
};

int add_order_long_form_message_at;

/* every byte of Add Order Long Form Message set to one value */
inline fill_add_order_long_form_message(add_order_long_form_message_record, add_order_long_form_message_value) {
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 2 -> add_order_long_form_message_record.tracking_number[add_order_long_form_message_at] = add_order_long_form_message_value; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 8 -> add_order_long_form_message_record.timestamp[add_order_long_form_message_at] = add_order_long_form_message_value; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> add_order_long_form_message_record.instrument_id[add_order_long_form_message_at] = add_order_long_form_message_value; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 8 -> add_order_long_form_message_record.order_reference_number[add_order_long_form_message_at] = add_order_long_form_message_value; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_record.market_side = add_order_long_form_message_value;
  add_order_long_form_message_record.order_capacity = add_order_long_form_message_value;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> add_order_long_form_message_record.price_long[add_order_long_form_message_at] = add_order_long_form_message_value; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> add_order_long_form_message_record.volume_long[add_order_long_form_message_at] = add_order_long_form_message_value; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 2 -> add_order_long_form_message_record.rank[add_order_long_form_message_at] = add_order_long_form_message_value; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Long Form Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_long_form_message(add_order_long_form_message_record, add_order_long_form_message_base) {
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 2 -> add_order_long_form_message_record.tracking_number[add_order_long_form_message_at] = (add_order_long_form_message_base + 0 + add_order_long_form_message_at + 1) % 256; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 8 -> add_order_long_form_message_record.timestamp[add_order_long_form_message_at] = (add_order_long_form_message_base + 2 + add_order_long_form_message_at + 1) % 256; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> add_order_long_form_message_record.instrument_id[add_order_long_form_message_at] = (add_order_long_form_message_base + 10 + add_order_long_form_message_at + 1) % 256; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 8 -> add_order_long_form_message_record.order_reference_number[add_order_long_form_message_at] = (add_order_long_form_message_base + 14 + add_order_long_form_message_at + 1) % 256; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_record.market_side = (add_order_long_form_message_base + 22 + 1) % 256;
  add_order_long_form_message_record.order_capacity = (add_order_long_form_message_base + 23 + 1) % 256;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> add_order_long_form_message_record.price_long[add_order_long_form_message_at] = (add_order_long_form_message_base + 24 + add_order_long_form_message_at + 1) % 256; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> add_order_long_form_message_record.volume_long[add_order_long_form_message_at] = (add_order_long_form_message_base + 28 + add_order_long_form_message_at + 1) % 256; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 2 -> add_order_long_form_message_record.rank[add_order_long_form_message_at] = (add_order_long_form_message_base + 32 + add_order_long_form_message_at + 1) % 256; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Long Form Message to the wire, 34 bytes from where the cursor stands */
inline encode_add_order_long_form_message(add_order_long_form_message_record) {
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 2 -> wire[at] = add_order_long_form_message_record.tracking_number[add_order_long_form_message_at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 8 -> wire[at] = add_order_long_form_message_record.timestamp[add_order_long_form_message_at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> wire[at] = add_order_long_form_message_record.instrument_id[add_order_long_form_message_at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 8 -> wire[at] = add_order_long_form_message_record.order_reference_number[add_order_long_form_message_at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_long_form_message_record.market_side; at = at + 1;
  wire[at] = add_order_long_form_message_record.order_capacity; at = at + 1;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> wire[at] = add_order_long_form_message_record.price_long[add_order_long_form_message_at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> wire[at] = add_order_long_form_message_record.volume_long[add_order_long_form_message_at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 2 -> wire[at] = add_order_long_form_message_record.rank[add_order_long_form_message_at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Long Form Message off the wire, 34 bytes from where the cursor stands */
inline decode_add_order_long_form_message(add_order_long_form_message_record) {
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 2 -> add_order_long_form_message_record.tracking_number[add_order_long_form_message_at] = wire[at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 8 -> add_order_long_form_message_record.timestamp[add_order_long_form_message_at] = wire[at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> add_order_long_form_message_record.instrument_id[add_order_long_form_message_at] = wire[at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 8 -> add_order_long_form_message_record.order_reference_number[add_order_long_form_message_at] = wire[at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_record.market_side = wire[at]; at = at + 1;
  add_order_long_form_message_record.order_capacity = wire[at]; at = at + 1;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> add_order_long_form_message_record.price_long[add_order_long_form_message_at] = wire[at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> add_order_long_form_message_record.volume_long[add_order_long_form_message_at] = wire[at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 2 -> add_order_long_form_message_record.rank[add_order_long_form_message_at] = wire[at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Long Form Message is what was written, byte for byte */
inline equal_add_order_long_form_message(add_order_long_form_message_read, add_order_long_form_message_written) {
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 2 -> assert(add_order_long_form_message_read.tracking_number[add_order_long_form_message_at] == add_order_long_form_message_written.tracking_number[add_order_long_form_message_at]); add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 8 -> assert(add_order_long_form_message_read.timestamp[add_order_long_form_message_at] == add_order_long_form_message_written.timestamp[add_order_long_form_message_at]); add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> assert(add_order_long_form_message_read.instrument_id[add_order_long_form_message_at] == add_order_long_form_message_written.instrument_id[add_order_long_form_message_at]); add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 8 -> assert(add_order_long_form_message_read.order_reference_number[add_order_long_form_message_at] == add_order_long_form_message_written.order_reference_number[add_order_long_form_message_at]); add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  assert(add_order_long_form_message_read.market_side == add_order_long_form_message_written.market_side);
  assert(add_order_long_form_message_read.order_capacity == add_order_long_form_message_written.order_capacity);
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> assert(add_order_long_form_message_read.price_long[add_order_long_form_message_at] == add_order_long_form_message_written.price_long[add_order_long_form_message_at]); add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> assert(add_order_long_form_message_read.volume_long[add_order_long_form_message_at] == add_order_long_form_message_written.volume_long[add_order_long_form_message_at]); add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 2 -> assert(add_order_long_form_message_read.rank[add_order_long_form_message_at] == add_order_long_form_message_written.rank[add_order_long_form_message_at]); add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Quote Short Form Message: 38 bytes ---------------------------------- */

/* An Add Quote Message indicates that a new quote has been accepted and was added to the displayable book. */
typedef AddQuoteShortFormMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte bid_reference_number[8];
  byte ask_reference_number[8];
  byte bid_price_short[2];
  byte bid_size_short[2];
  byte ask_price_short[2];
  byte ask_size_short[2]
};

int add_quote_short_form_message_at;

/* every byte of Add Quote Short Form Message set to one value */
inline fill_add_quote_short_form_message(add_quote_short_form_message_record, add_quote_short_form_message_value) {
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 2 -> add_quote_short_form_message_record.tracking_number[add_quote_short_form_message_at] = add_quote_short_form_message_value; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 8 -> add_quote_short_form_message_record.timestamp[add_quote_short_form_message_at] = add_quote_short_form_message_value; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 4 -> add_quote_short_form_message_record.instrument_id[add_quote_short_form_message_at] = add_quote_short_form_message_value; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 8 -> add_quote_short_form_message_record.bid_reference_number[add_quote_short_form_message_at] = add_quote_short_form_message_value; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 8 -> add_quote_short_form_message_record.ask_reference_number[add_quote_short_form_message_at] = add_quote_short_form_message_value; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 2 -> add_quote_short_form_message_record.bid_price_short[add_quote_short_form_message_at] = add_quote_short_form_message_value; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 2 -> add_quote_short_form_message_record.bid_size_short[add_quote_short_form_message_at] = add_quote_short_form_message_value; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 2 -> add_quote_short_form_message_record.ask_price_short[add_quote_short_form_message_at] = add_quote_short_form_message_value; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 2 -> add_quote_short_form_message_record.ask_size_short[add_quote_short_form_message_at] = add_quote_short_form_message_value; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Quote Short Form Message set to where it lies, so a field read out of place says so */
inline ramp_add_quote_short_form_message(add_quote_short_form_message_record, add_quote_short_form_message_base) {
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 2 -> add_quote_short_form_message_record.tracking_number[add_quote_short_form_message_at] = (add_quote_short_form_message_base + 0 + add_quote_short_form_message_at + 1) % 256; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 8 -> add_quote_short_form_message_record.timestamp[add_quote_short_form_message_at] = (add_quote_short_form_message_base + 2 + add_quote_short_form_message_at + 1) % 256; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 4 -> add_quote_short_form_message_record.instrument_id[add_quote_short_form_message_at] = (add_quote_short_form_message_base + 10 + add_quote_short_form_message_at + 1) % 256; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 8 -> add_quote_short_form_message_record.bid_reference_number[add_quote_short_form_message_at] = (add_quote_short_form_message_base + 14 + add_quote_short_form_message_at + 1) % 256; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 8 -> add_quote_short_form_message_record.ask_reference_number[add_quote_short_form_message_at] = (add_quote_short_form_message_base + 22 + add_quote_short_form_message_at + 1) % 256; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 2 -> add_quote_short_form_message_record.bid_price_short[add_quote_short_form_message_at] = (add_quote_short_form_message_base + 30 + add_quote_short_form_message_at + 1) % 256; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 2 -> add_quote_short_form_message_record.bid_size_short[add_quote_short_form_message_at] = (add_quote_short_form_message_base + 32 + add_quote_short_form_message_at + 1) % 256; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 2 -> add_quote_short_form_message_record.ask_price_short[add_quote_short_form_message_at] = (add_quote_short_form_message_base + 34 + add_quote_short_form_message_at + 1) % 256; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 2 -> add_quote_short_form_message_record.ask_size_short[add_quote_short_form_message_at] = (add_quote_short_form_message_base + 36 + add_quote_short_form_message_at + 1) % 256; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Quote Short Form Message to the wire, 38 bytes from where the cursor stands */
inline encode_add_quote_short_form_message(add_quote_short_form_message_record) {
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 2 -> wire[at] = add_quote_short_form_message_record.tracking_number[add_quote_short_form_message_at]; at = at + 1; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 8 -> wire[at] = add_quote_short_form_message_record.timestamp[add_quote_short_form_message_at]; at = at + 1; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 4 -> wire[at] = add_quote_short_form_message_record.instrument_id[add_quote_short_form_message_at]; at = at + 1; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 8 -> wire[at] = add_quote_short_form_message_record.bid_reference_number[add_quote_short_form_message_at]; at = at + 1; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 8 -> wire[at] = add_quote_short_form_message_record.ask_reference_number[add_quote_short_form_message_at]; at = at + 1; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 2 -> wire[at] = add_quote_short_form_message_record.bid_price_short[add_quote_short_form_message_at]; at = at + 1; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 2 -> wire[at] = add_quote_short_form_message_record.bid_size_short[add_quote_short_form_message_at]; at = at + 1; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 2 -> wire[at] = add_quote_short_form_message_record.ask_price_short[add_quote_short_form_message_at]; at = at + 1; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 2 -> wire[at] = add_quote_short_form_message_record.ask_size_short[add_quote_short_form_message_at]; at = at + 1; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Quote Short Form Message off the wire, 38 bytes from where the cursor stands */
inline decode_add_quote_short_form_message(add_quote_short_form_message_record) {
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 2 -> add_quote_short_form_message_record.tracking_number[add_quote_short_form_message_at] = wire[at]; at = at + 1; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 8 -> add_quote_short_form_message_record.timestamp[add_quote_short_form_message_at] = wire[at]; at = at + 1; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 4 -> add_quote_short_form_message_record.instrument_id[add_quote_short_form_message_at] = wire[at]; at = at + 1; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 8 -> add_quote_short_form_message_record.bid_reference_number[add_quote_short_form_message_at] = wire[at]; at = at + 1; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 8 -> add_quote_short_form_message_record.ask_reference_number[add_quote_short_form_message_at] = wire[at]; at = at + 1; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 2 -> add_quote_short_form_message_record.bid_price_short[add_quote_short_form_message_at] = wire[at]; at = at + 1; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 2 -> add_quote_short_form_message_record.bid_size_short[add_quote_short_form_message_at] = wire[at]; at = at + 1; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 2 -> add_quote_short_form_message_record.ask_price_short[add_quote_short_form_message_at] = wire[at]; at = at + 1; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 2 -> add_quote_short_form_message_record.ask_size_short[add_quote_short_form_message_at] = wire[at]; at = at + 1; add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Quote Short Form Message is what was written, byte for byte */
inline equal_add_quote_short_form_message(add_quote_short_form_message_read, add_quote_short_form_message_written) {
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 2 -> assert(add_quote_short_form_message_read.tracking_number[add_quote_short_form_message_at] == add_quote_short_form_message_written.tracking_number[add_quote_short_form_message_at]); add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 8 -> assert(add_quote_short_form_message_read.timestamp[add_quote_short_form_message_at] == add_quote_short_form_message_written.timestamp[add_quote_short_form_message_at]); add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 4 -> assert(add_quote_short_form_message_read.instrument_id[add_quote_short_form_message_at] == add_quote_short_form_message_written.instrument_id[add_quote_short_form_message_at]); add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 8 -> assert(add_quote_short_form_message_read.bid_reference_number[add_quote_short_form_message_at] == add_quote_short_form_message_written.bid_reference_number[add_quote_short_form_message_at]); add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 8 -> assert(add_quote_short_form_message_read.ask_reference_number[add_quote_short_form_message_at] == add_quote_short_form_message_written.ask_reference_number[add_quote_short_form_message_at]); add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 2 -> assert(add_quote_short_form_message_read.bid_price_short[add_quote_short_form_message_at] == add_quote_short_form_message_written.bid_price_short[add_quote_short_form_message_at]); add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 2 -> assert(add_quote_short_form_message_read.bid_size_short[add_quote_short_form_message_at] == add_quote_short_form_message_written.bid_size_short[add_quote_short_form_message_at]); add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 2 -> assert(add_quote_short_form_message_read.ask_price_short[add_quote_short_form_message_at] == add_quote_short_form_message_written.ask_price_short[add_quote_short_form_message_at]); add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_short_form_message_at = 0;
  do
  :: add_quote_short_form_message_at < 2 -> assert(add_quote_short_form_message_read.ask_size_short[add_quote_short_form_message_at] == add_quote_short_form_message_written.ask_size_short[add_quote_short_form_message_at]); add_quote_short_form_message_at = add_quote_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Quote Long Form Message: 46 bytes ----------------------------------- */

/* An Add Quote Message indicates that a new quote has been accepted and was added to the displayable book. */
typedef AddQuoteLongFormMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte bid_reference_number[8];
  byte ask_reference_number[8];
  byte bid_price_long[4];
  byte bid_size_long[4];
  byte ask_price_long[4];
  byte ask_size_long[4]
};

int add_quote_long_form_message_at;

/* every byte of Add Quote Long Form Message set to one value */
inline fill_add_quote_long_form_message(add_quote_long_form_message_record, add_quote_long_form_message_value) {
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 2 -> add_quote_long_form_message_record.tracking_number[add_quote_long_form_message_at] = add_quote_long_form_message_value; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 8 -> add_quote_long_form_message_record.timestamp[add_quote_long_form_message_at] = add_quote_long_form_message_value; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 4 -> add_quote_long_form_message_record.instrument_id[add_quote_long_form_message_at] = add_quote_long_form_message_value; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 8 -> add_quote_long_form_message_record.bid_reference_number[add_quote_long_form_message_at] = add_quote_long_form_message_value; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 8 -> add_quote_long_form_message_record.ask_reference_number[add_quote_long_form_message_at] = add_quote_long_form_message_value; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 4 -> add_quote_long_form_message_record.bid_price_long[add_quote_long_form_message_at] = add_quote_long_form_message_value; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 4 -> add_quote_long_form_message_record.bid_size_long[add_quote_long_form_message_at] = add_quote_long_form_message_value; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 4 -> add_quote_long_form_message_record.ask_price_long[add_quote_long_form_message_at] = add_quote_long_form_message_value; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 4 -> add_quote_long_form_message_record.ask_size_long[add_quote_long_form_message_at] = add_quote_long_form_message_value; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Quote Long Form Message set to where it lies, so a field read out of place says so */
inline ramp_add_quote_long_form_message(add_quote_long_form_message_record, add_quote_long_form_message_base) {
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 2 -> add_quote_long_form_message_record.tracking_number[add_quote_long_form_message_at] = (add_quote_long_form_message_base + 0 + add_quote_long_form_message_at + 1) % 256; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 8 -> add_quote_long_form_message_record.timestamp[add_quote_long_form_message_at] = (add_quote_long_form_message_base + 2 + add_quote_long_form_message_at + 1) % 256; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 4 -> add_quote_long_form_message_record.instrument_id[add_quote_long_form_message_at] = (add_quote_long_form_message_base + 10 + add_quote_long_form_message_at + 1) % 256; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 8 -> add_quote_long_form_message_record.bid_reference_number[add_quote_long_form_message_at] = (add_quote_long_form_message_base + 14 + add_quote_long_form_message_at + 1) % 256; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 8 -> add_quote_long_form_message_record.ask_reference_number[add_quote_long_form_message_at] = (add_quote_long_form_message_base + 22 + add_quote_long_form_message_at + 1) % 256; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 4 -> add_quote_long_form_message_record.bid_price_long[add_quote_long_form_message_at] = (add_quote_long_form_message_base + 30 + add_quote_long_form_message_at + 1) % 256; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 4 -> add_quote_long_form_message_record.bid_size_long[add_quote_long_form_message_at] = (add_quote_long_form_message_base + 34 + add_quote_long_form_message_at + 1) % 256; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 4 -> add_quote_long_form_message_record.ask_price_long[add_quote_long_form_message_at] = (add_quote_long_form_message_base + 38 + add_quote_long_form_message_at + 1) % 256; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 4 -> add_quote_long_form_message_record.ask_size_long[add_quote_long_form_message_at] = (add_quote_long_form_message_base + 42 + add_quote_long_form_message_at + 1) % 256; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Quote Long Form Message to the wire, 46 bytes from where the cursor stands */
inline encode_add_quote_long_form_message(add_quote_long_form_message_record) {
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 2 -> wire[at] = add_quote_long_form_message_record.tracking_number[add_quote_long_form_message_at]; at = at + 1; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 8 -> wire[at] = add_quote_long_form_message_record.timestamp[add_quote_long_form_message_at]; at = at + 1; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 4 -> wire[at] = add_quote_long_form_message_record.instrument_id[add_quote_long_form_message_at]; at = at + 1; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 8 -> wire[at] = add_quote_long_form_message_record.bid_reference_number[add_quote_long_form_message_at]; at = at + 1; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 8 -> wire[at] = add_quote_long_form_message_record.ask_reference_number[add_quote_long_form_message_at]; at = at + 1; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 4 -> wire[at] = add_quote_long_form_message_record.bid_price_long[add_quote_long_form_message_at]; at = at + 1; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 4 -> wire[at] = add_quote_long_form_message_record.bid_size_long[add_quote_long_form_message_at]; at = at + 1; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 4 -> wire[at] = add_quote_long_form_message_record.ask_price_long[add_quote_long_form_message_at]; at = at + 1; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 4 -> wire[at] = add_quote_long_form_message_record.ask_size_long[add_quote_long_form_message_at]; at = at + 1; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Quote Long Form Message off the wire, 46 bytes from where the cursor stands */
inline decode_add_quote_long_form_message(add_quote_long_form_message_record) {
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 2 -> add_quote_long_form_message_record.tracking_number[add_quote_long_form_message_at] = wire[at]; at = at + 1; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 8 -> add_quote_long_form_message_record.timestamp[add_quote_long_form_message_at] = wire[at]; at = at + 1; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 4 -> add_quote_long_form_message_record.instrument_id[add_quote_long_form_message_at] = wire[at]; at = at + 1; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 8 -> add_quote_long_form_message_record.bid_reference_number[add_quote_long_form_message_at] = wire[at]; at = at + 1; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 8 -> add_quote_long_form_message_record.ask_reference_number[add_quote_long_form_message_at] = wire[at]; at = at + 1; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 4 -> add_quote_long_form_message_record.bid_price_long[add_quote_long_form_message_at] = wire[at]; at = at + 1; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 4 -> add_quote_long_form_message_record.bid_size_long[add_quote_long_form_message_at] = wire[at]; at = at + 1; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 4 -> add_quote_long_form_message_record.ask_price_long[add_quote_long_form_message_at] = wire[at]; at = at + 1; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 4 -> add_quote_long_form_message_record.ask_size_long[add_quote_long_form_message_at] = wire[at]; at = at + 1; add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Quote Long Form Message is what was written, byte for byte */
inline equal_add_quote_long_form_message(add_quote_long_form_message_read, add_quote_long_form_message_written) {
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 2 -> assert(add_quote_long_form_message_read.tracking_number[add_quote_long_form_message_at] == add_quote_long_form_message_written.tracking_number[add_quote_long_form_message_at]); add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 8 -> assert(add_quote_long_form_message_read.timestamp[add_quote_long_form_message_at] == add_quote_long_form_message_written.timestamp[add_quote_long_form_message_at]); add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 4 -> assert(add_quote_long_form_message_read.instrument_id[add_quote_long_form_message_at] == add_quote_long_form_message_written.instrument_id[add_quote_long_form_message_at]); add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 8 -> assert(add_quote_long_form_message_read.bid_reference_number[add_quote_long_form_message_at] == add_quote_long_form_message_written.bid_reference_number[add_quote_long_form_message_at]); add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 8 -> assert(add_quote_long_form_message_read.ask_reference_number[add_quote_long_form_message_at] == add_quote_long_form_message_written.ask_reference_number[add_quote_long_form_message_at]); add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 4 -> assert(add_quote_long_form_message_read.bid_price_long[add_quote_long_form_message_at] == add_quote_long_form_message_written.bid_price_long[add_quote_long_form_message_at]); add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 4 -> assert(add_quote_long_form_message_read.bid_size_long[add_quote_long_form_message_at] == add_quote_long_form_message_written.bid_size_long[add_quote_long_form_message_at]); add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 4 -> assert(add_quote_long_form_message_read.ask_price_long[add_quote_long_form_message_at] == add_quote_long_form_message_written.ask_price_long[add_quote_long_form_message_at]); add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_long_form_message_at = 0;
  do
  :: add_quote_long_form_message_at < 4 -> assert(add_quote_long_form_message_read.ask_size_long[add_quote_long_form_message_at] == add_quote_long_form_message_written.ask_size_long[add_quote_long_form_message_at]); add_quote_long_form_message_at = add_quote_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Snapshot Message: 20 bytes ---------------------------------------------- */

/* The Snapshot message reflects the Depth of Market sequence number at the time the GLIMPSE spin was requested. */
typedef SnapshotMessage {
  byte sequence_number[20]
};

int snapshot_message_at;

/* every byte of Snapshot Message set to one value */
inline fill_snapshot_message(snapshot_message_record, snapshot_message_value) {
  snapshot_message_at = 0;
  do
  :: snapshot_message_at < 20 -> snapshot_message_record.sequence_number[snapshot_message_at] = snapshot_message_value; snapshot_message_at = snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Snapshot Message set to where it lies, so a field read out of place says so */
inline ramp_snapshot_message(snapshot_message_record, snapshot_message_base) {
  snapshot_message_at = 0;
  do
  :: snapshot_message_at < 20 -> snapshot_message_record.sequence_number[snapshot_message_at] = (snapshot_message_base + 0 + snapshot_message_at + 1) % 256; snapshot_message_at = snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Message to the wire, 20 bytes from where the cursor stands */
inline encode_snapshot_message(snapshot_message_record) {
  snapshot_message_at = 0;
  do
  :: snapshot_message_at < 20 -> wire[at] = snapshot_message_record.sequence_number[snapshot_message_at]; at = at + 1; snapshot_message_at = snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Message off the wire, 20 bytes from where the cursor stands */
inline decode_snapshot_message(snapshot_message_record) {
  snapshot_message_at = 0;
  do
  :: snapshot_message_at < 20 -> snapshot_message_record.sequence_number[snapshot_message_at] = wire[at]; at = at + 1; snapshot_message_at = snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Snapshot Message is what was written, byte for byte */
inline equal_snapshot_message(snapshot_message_read, snapshot_message_written) {
  snapshot_message_at = 0;
  do
  :: snapshot_message_at < 20 -> assert(snapshot_message_read.sequence_number[snapshot_message_at] == snapshot_message_written.sequence_number[snapshot_message_at]); snapshot_message_at = snapshot_message_at + 1
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
    assert(at == 11);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 11);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Derivative Directory Message: encoded, read back, and compared */
proctype check_derivative_directory_message() {
  DerivativeDirectoryMessage derivative_directory_message_sent;
  DerivativeDirectoryMessage derivative_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_derivative_directory_message(derivative_directory_message_sent, 0)
  :: pattern == 1 -> fill_derivative_directory_message(derivative_directory_message_sent, 32)
  :: pattern == 2 -> fill_derivative_directory_message(derivative_directory_message_sent, 255)
  :: else -> ramp_derivative_directory_message(derivative_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_derivative_directory_message(derivative_directory_message_sent);
    assert(at == 86);
    at = 0;
    decode_derivative_directory_message(derivative_directory_message_got);
    assert(at == 86);
    equal_derivative_directory_message(derivative_directory_message_got, derivative_directory_message_sent)
  }
}

/* Trading Action Message: encoded, read back, and compared */
proctype check_trading_action_message() {
  TradingActionMessage trading_action_message_sent;
  TradingActionMessage trading_action_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_action_message(trading_action_message_sent, 0)
  :: pattern == 1 -> fill_trading_action_message(trading_action_message_sent, 32)
  :: pattern == 2 -> fill_trading_action_message(trading_action_message_sent, 255)
  :: else -> ramp_trading_action_message(trading_action_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_action_message(trading_action_message_sent);
    assert(at == 15);
    at = 0;
    decode_trading_action_message(trading_action_message_got);
    assert(at == 15);
    equal_trading_action_message(trading_action_message_got, trading_action_message_sent)
  }
}

/* Add Order Short Form Message: encoded, read back, and compared */
proctype check_add_order_short_form_message() {
  AddOrderShortFormMessage add_order_short_form_message_sent;
  AddOrderShortFormMessage add_order_short_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_short_form_message(add_order_short_form_message_sent, 0)
  :: pattern == 1 -> fill_add_order_short_form_message(add_order_short_form_message_sent, 32)
  :: pattern == 2 -> fill_add_order_short_form_message(add_order_short_form_message_sent, 255)
  :: else -> ramp_add_order_short_form_message(add_order_short_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_short_form_message(add_order_short_form_message_sent);
    assert(at == 30);
    at = 0;
    decode_add_order_short_form_message(add_order_short_form_message_got);
    assert(at == 30);
    equal_add_order_short_form_message(add_order_short_form_message_got, add_order_short_form_message_sent)
  }
}

/* Add Order Long Form Message: encoded, read back, and compared */
proctype check_add_order_long_form_message() {
  AddOrderLongFormMessage add_order_long_form_message_sent;
  AddOrderLongFormMessage add_order_long_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_long_form_message(add_order_long_form_message_sent, 0)
  :: pattern == 1 -> fill_add_order_long_form_message(add_order_long_form_message_sent, 32)
  :: pattern == 2 -> fill_add_order_long_form_message(add_order_long_form_message_sent, 255)
  :: else -> ramp_add_order_long_form_message(add_order_long_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_long_form_message(add_order_long_form_message_sent);
    assert(at == 34);
    at = 0;
    decode_add_order_long_form_message(add_order_long_form_message_got);
    assert(at == 34);
    equal_add_order_long_form_message(add_order_long_form_message_got, add_order_long_form_message_sent)
  }
}

/* Add Quote Short Form Message: encoded, read back, and compared */
proctype check_add_quote_short_form_message() {
  AddQuoteShortFormMessage add_quote_short_form_message_sent;
  AddQuoteShortFormMessage add_quote_short_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_quote_short_form_message(add_quote_short_form_message_sent, 0)
  :: pattern == 1 -> fill_add_quote_short_form_message(add_quote_short_form_message_sent, 32)
  :: pattern == 2 -> fill_add_quote_short_form_message(add_quote_short_form_message_sent, 255)
  :: else -> ramp_add_quote_short_form_message(add_quote_short_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_quote_short_form_message(add_quote_short_form_message_sent);
    assert(at == 38);
    at = 0;
    decode_add_quote_short_form_message(add_quote_short_form_message_got);
    assert(at == 38);
    equal_add_quote_short_form_message(add_quote_short_form_message_got, add_quote_short_form_message_sent)
  }
}

/* Add Quote Long Form Message: encoded, read back, and compared */
proctype check_add_quote_long_form_message() {
  AddQuoteLongFormMessage add_quote_long_form_message_sent;
  AddQuoteLongFormMessage add_quote_long_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_quote_long_form_message(add_quote_long_form_message_sent, 0)
  :: pattern == 1 -> fill_add_quote_long_form_message(add_quote_long_form_message_sent, 32)
  :: pattern == 2 -> fill_add_quote_long_form_message(add_quote_long_form_message_sent, 255)
  :: else -> ramp_add_quote_long_form_message(add_quote_long_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_quote_long_form_message(add_quote_long_form_message_sent);
    assert(at == 46);
    at = 0;
    decode_add_quote_long_form_message(add_quote_long_form_message_got);
    assert(at == 46);
    equal_add_quote_long_form_message(add_quote_long_form_message_got, add_quote_long_form_message_sent)
  }
}

/* Snapshot Message: encoded, read back, and compared */
proctype check_snapshot_message() {
  SnapshotMessage snapshot_message_sent;
  SnapshotMessage snapshot_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_snapshot_message(snapshot_message_sent, 0)
  :: pattern == 1 -> fill_snapshot_message(snapshot_message_sent, 32)
  :: pattern == 2 -> fill_snapshot_message(snapshot_message_sent, 255)
  :: else -> ramp_snapshot_message(snapshot_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_snapshot_message(snapshot_message_sent);
    assert(at == 20);
    at = 0;
    decode_snapshot_message(snapshot_message_got);
    assert(at == 20);
    equal_snapshot_message(snapshot_message_got, snapshot_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_server_packet_header()
  :: run check_login_accepted_packet()
  :: run check_login_rejected_packet()
  :: run check_system_event_message()
  :: run check_derivative_directory_message()
  :: run check_trading_action_message()
  :: run check_add_order_short_form_message()
  :: run check_add_order_long_form_message()
  :: run check_add_quote_short_form_message()
  :: run check_add_quote_long_form_message()
  :: run check_snapshot_message()
  fi
}
