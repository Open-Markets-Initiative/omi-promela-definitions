/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Top Of Market
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
#define WIRE 62

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

/* ---- Derivative Directory Message: 62 bytes ---------------------------------- */

/* At the start of each trading day, Nasdaq disseminates options symbol directory messages for all active options symbols in the system. */
typedef DerivativeDirectoryMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte security_symbol[8];
  byte expiration_year;
  byte expiration_month;
  byte expiration_day;
  byte explicit_strike_price[4];
  byte option_type;
  byte underlying_symbol[13];
  byte closing_type;
  byte tradable;
  byte mpv;
  byte reserved_16[16]
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
  :: derivative_directory_message_at < 8 -> derivative_directory_message_record.security_symbol[derivative_directory_message_at] = derivative_directory_message_value; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_record.expiration_year = derivative_directory_message_value;
  derivative_directory_message_record.expiration_month = derivative_directory_message_value;
  derivative_directory_message_record.expiration_day = derivative_directory_message_value;
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
  :: derivative_directory_message_at < 16 -> derivative_directory_message_record.reserved_16[derivative_directory_message_at] = derivative_directory_message_value; derivative_directory_message_at = derivative_directory_message_at + 1
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
  :: derivative_directory_message_at < 8 -> derivative_directory_message_record.security_symbol[derivative_directory_message_at] = (derivative_directory_message_base + 14 + derivative_directory_message_at + 1) % 256; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_record.expiration_year = (derivative_directory_message_base + 22 + 1) % 256;
  derivative_directory_message_record.expiration_month = (derivative_directory_message_base + 23 + 1) % 256;
  derivative_directory_message_record.expiration_day = (derivative_directory_message_base + 24 + 1) % 256;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 4 -> derivative_directory_message_record.explicit_strike_price[derivative_directory_message_at] = (derivative_directory_message_base + 25 + derivative_directory_message_at + 1) % 256; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_record.option_type = (derivative_directory_message_base + 29 + 1) % 256;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 13 -> derivative_directory_message_record.underlying_symbol[derivative_directory_message_at] = (derivative_directory_message_base + 30 + derivative_directory_message_at + 1) % 256; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_record.closing_type = (derivative_directory_message_base + 43 + 1) % 256;
  derivative_directory_message_record.tradable = (derivative_directory_message_base + 44 + 1) % 256;
  derivative_directory_message_record.mpv = (derivative_directory_message_base + 45 + 1) % 256;
  derivative_directory_message_at = 0;
  do
  :: derivative_directory_message_at < 16 -> derivative_directory_message_record.reserved_16[derivative_directory_message_at] = (derivative_directory_message_base + 46 + derivative_directory_message_at + 1) % 256; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Derivative Directory Message to the wire, 62 bytes from where the cursor stands */
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
  :: derivative_directory_message_at < 8 -> wire[at] = derivative_directory_message_record.security_symbol[derivative_directory_message_at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = derivative_directory_message_record.expiration_year; at = at + 1;
  wire[at] = derivative_directory_message_record.expiration_month; at = at + 1;
  wire[at] = derivative_directory_message_record.expiration_day; at = at + 1;
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
  :: derivative_directory_message_at < 16 -> wire[at] = derivative_directory_message_record.reserved_16[derivative_directory_message_at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Derivative Directory Message off the wire, 62 bytes from where the cursor stands */
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
  :: derivative_directory_message_at < 8 -> derivative_directory_message_record.security_symbol[derivative_directory_message_at] = wire[at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  derivative_directory_message_record.expiration_year = wire[at]; at = at + 1;
  derivative_directory_message_record.expiration_month = wire[at]; at = at + 1;
  derivative_directory_message_record.expiration_day = wire[at]; at = at + 1;
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
  :: derivative_directory_message_at < 16 -> derivative_directory_message_record.reserved_16[derivative_directory_message_at] = wire[at]; at = at + 1; derivative_directory_message_at = derivative_directory_message_at + 1
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
  :: derivative_directory_message_at < 8 -> assert(derivative_directory_message_read.security_symbol[derivative_directory_message_at] == derivative_directory_message_written.security_symbol[derivative_directory_message_at]); derivative_directory_message_at = derivative_directory_message_at + 1
  :: else -> break
  od;
  assert(derivative_directory_message_read.expiration_year == derivative_directory_message_written.expiration_year);
  assert(derivative_directory_message_read.expiration_month == derivative_directory_message_written.expiration_month);
  assert(derivative_directory_message_read.expiration_day == derivative_directory_message_written.expiration_day);
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
  :: derivative_directory_message_at < 16 -> assert(derivative_directory_message_read.reserved_16[derivative_directory_message_at] == derivative_directory_message_written.reserved_16[derivative_directory_message_at]); derivative_directory_message_at = derivative_directory_message_at + 1
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

/* ---- Best Bid And Ask Update Short Form Message: 35 bytes -------------------- */

/* The options system will continuously calculate its best bid and offer position for active options contracts on the options market during the trading day. */
typedef BestBidAndAskUpdateShortFormMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte quote_condition;
  byte bid_market_order_size_short[2];
  byte bid_price_short[2];
  byte bid_size_short[2];
  byte bid_cust_size_short[2];
  byte bid_pro_cust_size_short[2];
  byte ask_market_order_size_short[2];
  byte ask_price_short[2];
  byte ask_size_short[2];
  byte ask_cust_size_short[2];
  byte ask_pro_cust_size_short[2]
};

int best_bid_and_ask_update_short_form_message_at;

/* every byte of Best Bid And Ask Update Short Form Message set to one value */
inline fill_best_bid_and_ask_update_short_form_message(best_bid_and_ask_update_short_form_message_record, best_bid_and_ask_update_short_form_message_value) {
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.tracking_number[best_bid_and_ask_update_short_form_message_at] = best_bid_and_ask_update_short_form_message_value; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 8 -> best_bid_and_ask_update_short_form_message_record.timestamp[best_bid_and_ask_update_short_form_message_at] = best_bid_and_ask_update_short_form_message_value; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 4 -> best_bid_and_ask_update_short_form_message_record.instrument_id[best_bid_and_ask_update_short_form_message_at] = best_bid_and_ask_update_short_form_message_value; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_record.quote_condition = best_bid_and_ask_update_short_form_message_value;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.bid_market_order_size_short[best_bid_and_ask_update_short_form_message_at] = best_bid_and_ask_update_short_form_message_value; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.bid_price_short[best_bid_and_ask_update_short_form_message_at] = best_bid_and_ask_update_short_form_message_value; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.bid_size_short[best_bid_and_ask_update_short_form_message_at] = best_bid_and_ask_update_short_form_message_value; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.bid_cust_size_short[best_bid_and_ask_update_short_form_message_at] = best_bid_and_ask_update_short_form_message_value; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.bid_pro_cust_size_short[best_bid_and_ask_update_short_form_message_at] = best_bid_and_ask_update_short_form_message_value; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.ask_market_order_size_short[best_bid_and_ask_update_short_form_message_at] = best_bid_and_ask_update_short_form_message_value; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.ask_price_short[best_bid_and_ask_update_short_form_message_at] = best_bid_and_ask_update_short_form_message_value; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.ask_size_short[best_bid_and_ask_update_short_form_message_at] = best_bid_and_ask_update_short_form_message_value; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.ask_cust_size_short[best_bid_and_ask_update_short_form_message_at] = best_bid_and_ask_update_short_form_message_value; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.ask_pro_cust_size_short[best_bid_and_ask_update_short_form_message_at] = best_bid_and_ask_update_short_form_message_value; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Best Bid And Ask Update Short Form Message set to where it lies, so a field read out of place says so */
inline ramp_best_bid_and_ask_update_short_form_message(best_bid_and_ask_update_short_form_message_record, best_bid_and_ask_update_short_form_message_base) {
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.tracking_number[best_bid_and_ask_update_short_form_message_at] = (best_bid_and_ask_update_short_form_message_base + 0 + best_bid_and_ask_update_short_form_message_at + 1) % 256; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 8 -> best_bid_and_ask_update_short_form_message_record.timestamp[best_bid_and_ask_update_short_form_message_at] = (best_bid_and_ask_update_short_form_message_base + 2 + best_bid_and_ask_update_short_form_message_at + 1) % 256; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 4 -> best_bid_and_ask_update_short_form_message_record.instrument_id[best_bid_and_ask_update_short_form_message_at] = (best_bid_and_ask_update_short_form_message_base + 10 + best_bid_and_ask_update_short_form_message_at + 1) % 256; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_record.quote_condition = (best_bid_and_ask_update_short_form_message_base + 14 + 1) % 256;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.bid_market_order_size_short[best_bid_and_ask_update_short_form_message_at] = (best_bid_and_ask_update_short_form_message_base + 15 + best_bid_and_ask_update_short_form_message_at + 1) % 256; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.bid_price_short[best_bid_and_ask_update_short_form_message_at] = (best_bid_and_ask_update_short_form_message_base + 17 + best_bid_and_ask_update_short_form_message_at + 1) % 256; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.bid_size_short[best_bid_and_ask_update_short_form_message_at] = (best_bid_and_ask_update_short_form_message_base + 19 + best_bid_and_ask_update_short_form_message_at + 1) % 256; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.bid_cust_size_short[best_bid_and_ask_update_short_form_message_at] = (best_bid_and_ask_update_short_form_message_base + 21 + best_bid_and_ask_update_short_form_message_at + 1) % 256; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.bid_pro_cust_size_short[best_bid_and_ask_update_short_form_message_at] = (best_bid_and_ask_update_short_form_message_base + 23 + best_bid_and_ask_update_short_form_message_at + 1) % 256; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.ask_market_order_size_short[best_bid_and_ask_update_short_form_message_at] = (best_bid_and_ask_update_short_form_message_base + 25 + best_bid_and_ask_update_short_form_message_at + 1) % 256; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.ask_price_short[best_bid_and_ask_update_short_form_message_at] = (best_bid_and_ask_update_short_form_message_base + 27 + best_bid_and_ask_update_short_form_message_at + 1) % 256; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.ask_size_short[best_bid_and_ask_update_short_form_message_at] = (best_bid_and_ask_update_short_form_message_base + 29 + best_bid_and_ask_update_short_form_message_at + 1) % 256; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.ask_cust_size_short[best_bid_and_ask_update_short_form_message_at] = (best_bid_and_ask_update_short_form_message_base + 31 + best_bid_and_ask_update_short_form_message_at + 1) % 256; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.ask_pro_cust_size_short[best_bid_and_ask_update_short_form_message_at] = (best_bid_and_ask_update_short_form_message_base + 33 + best_bid_and_ask_update_short_form_message_at + 1) % 256; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Bid And Ask Update Short Form Message to the wire, 35 bytes from where the cursor stands */
inline encode_best_bid_and_ask_update_short_form_message(best_bid_and_ask_update_short_form_message_record) {
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> wire[at] = best_bid_and_ask_update_short_form_message_record.tracking_number[best_bid_and_ask_update_short_form_message_at]; at = at + 1; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 8 -> wire[at] = best_bid_and_ask_update_short_form_message_record.timestamp[best_bid_and_ask_update_short_form_message_at]; at = at + 1; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 4 -> wire[at] = best_bid_and_ask_update_short_form_message_record.instrument_id[best_bid_and_ask_update_short_form_message_at]; at = at + 1; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  wire[at] = best_bid_and_ask_update_short_form_message_record.quote_condition; at = at + 1;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> wire[at] = best_bid_and_ask_update_short_form_message_record.bid_market_order_size_short[best_bid_and_ask_update_short_form_message_at]; at = at + 1; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> wire[at] = best_bid_and_ask_update_short_form_message_record.bid_price_short[best_bid_and_ask_update_short_form_message_at]; at = at + 1; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> wire[at] = best_bid_and_ask_update_short_form_message_record.bid_size_short[best_bid_and_ask_update_short_form_message_at]; at = at + 1; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> wire[at] = best_bid_and_ask_update_short_form_message_record.bid_cust_size_short[best_bid_and_ask_update_short_form_message_at]; at = at + 1; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> wire[at] = best_bid_and_ask_update_short_form_message_record.bid_pro_cust_size_short[best_bid_and_ask_update_short_form_message_at]; at = at + 1; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> wire[at] = best_bid_and_ask_update_short_form_message_record.ask_market_order_size_short[best_bid_and_ask_update_short_form_message_at]; at = at + 1; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> wire[at] = best_bid_and_ask_update_short_form_message_record.ask_price_short[best_bid_and_ask_update_short_form_message_at]; at = at + 1; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> wire[at] = best_bid_and_ask_update_short_form_message_record.ask_size_short[best_bid_and_ask_update_short_form_message_at]; at = at + 1; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> wire[at] = best_bid_and_ask_update_short_form_message_record.ask_cust_size_short[best_bid_and_ask_update_short_form_message_at]; at = at + 1; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> wire[at] = best_bid_and_ask_update_short_form_message_record.ask_pro_cust_size_short[best_bid_and_ask_update_short_form_message_at]; at = at + 1; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Bid And Ask Update Short Form Message off the wire, 35 bytes from where the cursor stands */
inline decode_best_bid_and_ask_update_short_form_message(best_bid_and_ask_update_short_form_message_record) {
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.tracking_number[best_bid_and_ask_update_short_form_message_at] = wire[at]; at = at + 1; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 8 -> best_bid_and_ask_update_short_form_message_record.timestamp[best_bid_and_ask_update_short_form_message_at] = wire[at]; at = at + 1; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 4 -> best_bid_and_ask_update_short_form_message_record.instrument_id[best_bid_and_ask_update_short_form_message_at] = wire[at]; at = at + 1; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_record.quote_condition = wire[at]; at = at + 1;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.bid_market_order_size_short[best_bid_and_ask_update_short_form_message_at] = wire[at]; at = at + 1; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.bid_price_short[best_bid_and_ask_update_short_form_message_at] = wire[at]; at = at + 1; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.bid_size_short[best_bid_and_ask_update_short_form_message_at] = wire[at]; at = at + 1; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.bid_cust_size_short[best_bid_and_ask_update_short_form_message_at] = wire[at]; at = at + 1; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.bid_pro_cust_size_short[best_bid_and_ask_update_short_form_message_at] = wire[at]; at = at + 1; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.ask_market_order_size_short[best_bid_and_ask_update_short_form_message_at] = wire[at]; at = at + 1; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.ask_price_short[best_bid_and_ask_update_short_form_message_at] = wire[at]; at = at + 1; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.ask_size_short[best_bid_and_ask_update_short_form_message_at] = wire[at]; at = at + 1; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.ask_cust_size_short[best_bid_and_ask_update_short_form_message_at] = wire[at]; at = at + 1; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> best_bid_and_ask_update_short_form_message_record.ask_pro_cust_size_short[best_bid_and_ask_update_short_form_message_at] = wire[at]; at = at + 1; best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Best Bid And Ask Update Short Form Message is what was written, byte for byte */
inline equal_best_bid_and_ask_update_short_form_message(best_bid_and_ask_update_short_form_message_read, best_bid_and_ask_update_short_form_message_written) {
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> assert(best_bid_and_ask_update_short_form_message_read.tracking_number[best_bid_and_ask_update_short_form_message_at] == best_bid_and_ask_update_short_form_message_written.tracking_number[best_bid_and_ask_update_short_form_message_at]); best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 8 -> assert(best_bid_and_ask_update_short_form_message_read.timestamp[best_bid_and_ask_update_short_form_message_at] == best_bid_and_ask_update_short_form_message_written.timestamp[best_bid_and_ask_update_short_form_message_at]); best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 4 -> assert(best_bid_and_ask_update_short_form_message_read.instrument_id[best_bid_and_ask_update_short_form_message_at] == best_bid_and_ask_update_short_form_message_written.instrument_id[best_bid_and_ask_update_short_form_message_at]); best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  assert(best_bid_and_ask_update_short_form_message_read.quote_condition == best_bid_and_ask_update_short_form_message_written.quote_condition);
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> assert(best_bid_and_ask_update_short_form_message_read.bid_market_order_size_short[best_bid_and_ask_update_short_form_message_at] == best_bid_and_ask_update_short_form_message_written.bid_market_order_size_short[best_bid_and_ask_update_short_form_message_at]); best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> assert(best_bid_and_ask_update_short_form_message_read.bid_price_short[best_bid_and_ask_update_short_form_message_at] == best_bid_and_ask_update_short_form_message_written.bid_price_short[best_bid_and_ask_update_short_form_message_at]); best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> assert(best_bid_and_ask_update_short_form_message_read.bid_size_short[best_bid_and_ask_update_short_form_message_at] == best_bid_and_ask_update_short_form_message_written.bid_size_short[best_bid_and_ask_update_short_form_message_at]); best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> assert(best_bid_and_ask_update_short_form_message_read.bid_cust_size_short[best_bid_and_ask_update_short_form_message_at] == best_bid_and_ask_update_short_form_message_written.bid_cust_size_short[best_bid_and_ask_update_short_form_message_at]); best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> assert(best_bid_and_ask_update_short_form_message_read.bid_pro_cust_size_short[best_bid_and_ask_update_short_form_message_at] == best_bid_and_ask_update_short_form_message_written.bid_pro_cust_size_short[best_bid_and_ask_update_short_form_message_at]); best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> assert(best_bid_and_ask_update_short_form_message_read.ask_market_order_size_short[best_bid_and_ask_update_short_form_message_at] == best_bid_and_ask_update_short_form_message_written.ask_market_order_size_short[best_bid_and_ask_update_short_form_message_at]); best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> assert(best_bid_and_ask_update_short_form_message_read.ask_price_short[best_bid_and_ask_update_short_form_message_at] == best_bid_and_ask_update_short_form_message_written.ask_price_short[best_bid_and_ask_update_short_form_message_at]); best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> assert(best_bid_and_ask_update_short_form_message_read.ask_size_short[best_bid_and_ask_update_short_form_message_at] == best_bid_and_ask_update_short_form_message_written.ask_size_short[best_bid_and_ask_update_short_form_message_at]); best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> assert(best_bid_and_ask_update_short_form_message_read.ask_cust_size_short[best_bid_and_ask_update_short_form_message_at] == best_bid_and_ask_update_short_form_message_written.ask_cust_size_short[best_bid_and_ask_update_short_form_message_at]); best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_short_form_message_at = 0;
  do
  :: best_bid_and_ask_update_short_form_message_at < 2 -> assert(best_bid_and_ask_update_short_form_message_read.ask_pro_cust_size_short[best_bid_and_ask_update_short_form_message_at] == best_bid_and_ask_update_short_form_message_written.ask_pro_cust_size_short[best_bid_and_ask_update_short_form_message_at]); best_bid_and_ask_update_short_form_message_at = best_bid_and_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Best Bid And Ask Update Long Form Message: 55 bytes --------------------- */

/* This message is the same as the Best Bid AND Ask Update Message - Short Form described above except that Prices and Sizes are 4 byte Integers, the price having 4 implied decimal places. */
typedef BestBidAndAskUpdateLongFormMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte quote_condition;
  byte bid_market_order_size_long[4];
  byte bid_price_long[4];
  byte bid_size_long[4];
  byte bid_cust_size_long[4];
  byte bid_pro_cust_size_long[4];
  byte ask_market_order_size_long[4];
  byte ask_price_long[4];
  byte ask_size_long[4];
  byte ask_cust_size_long[4];
  byte ask_pro_cust_size_long[4]
};

int best_bid_and_ask_update_long_form_message_at;

/* every byte of Best Bid And Ask Update Long Form Message set to one value */
inline fill_best_bid_and_ask_update_long_form_message(best_bid_and_ask_update_long_form_message_record, best_bid_and_ask_update_long_form_message_value) {
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 2 -> best_bid_and_ask_update_long_form_message_record.tracking_number[best_bid_and_ask_update_long_form_message_at] = best_bid_and_ask_update_long_form_message_value; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 8 -> best_bid_and_ask_update_long_form_message_record.timestamp[best_bid_and_ask_update_long_form_message_at] = best_bid_and_ask_update_long_form_message_value; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.instrument_id[best_bid_and_ask_update_long_form_message_at] = best_bid_and_ask_update_long_form_message_value; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_record.quote_condition = best_bid_and_ask_update_long_form_message_value;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.bid_market_order_size_long[best_bid_and_ask_update_long_form_message_at] = best_bid_and_ask_update_long_form_message_value; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.bid_price_long[best_bid_and_ask_update_long_form_message_at] = best_bid_and_ask_update_long_form_message_value; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.bid_size_long[best_bid_and_ask_update_long_form_message_at] = best_bid_and_ask_update_long_form_message_value; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.bid_cust_size_long[best_bid_and_ask_update_long_form_message_at] = best_bid_and_ask_update_long_form_message_value; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.bid_pro_cust_size_long[best_bid_and_ask_update_long_form_message_at] = best_bid_and_ask_update_long_form_message_value; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.ask_market_order_size_long[best_bid_and_ask_update_long_form_message_at] = best_bid_and_ask_update_long_form_message_value; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.ask_price_long[best_bid_and_ask_update_long_form_message_at] = best_bid_and_ask_update_long_form_message_value; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.ask_size_long[best_bid_and_ask_update_long_form_message_at] = best_bid_and_ask_update_long_form_message_value; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.ask_cust_size_long[best_bid_and_ask_update_long_form_message_at] = best_bid_and_ask_update_long_form_message_value; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.ask_pro_cust_size_long[best_bid_and_ask_update_long_form_message_at] = best_bid_and_ask_update_long_form_message_value; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Best Bid And Ask Update Long Form Message set to where it lies, so a field read out of place says so */
inline ramp_best_bid_and_ask_update_long_form_message(best_bid_and_ask_update_long_form_message_record, best_bid_and_ask_update_long_form_message_base) {
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 2 -> best_bid_and_ask_update_long_form_message_record.tracking_number[best_bid_and_ask_update_long_form_message_at] = (best_bid_and_ask_update_long_form_message_base + 0 + best_bid_and_ask_update_long_form_message_at + 1) % 256; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 8 -> best_bid_and_ask_update_long_form_message_record.timestamp[best_bid_and_ask_update_long_form_message_at] = (best_bid_and_ask_update_long_form_message_base + 2 + best_bid_and_ask_update_long_form_message_at + 1) % 256; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.instrument_id[best_bid_and_ask_update_long_form_message_at] = (best_bid_and_ask_update_long_form_message_base + 10 + best_bid_and_ask_update_long_form_message_at + 1) % 256; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_record.quote_condition = (best_bid_and_ask_update_long_form_message_base + 14 + 1) % 256;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.bid_market_order_size_long[best_bid_and_ask_update_long_form_message_at] = (best_bid_and_ask_update_long_form_message_base + 15 + best_bid_and_ask_update_long_form_message_at + 1) % 256; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.bid_price_long[best_bid_and_ask_update_long_form_message_at] = (best_bid_and_ask_update_long_form_message_base + 19 + best_bid_and_ask_update_long_form_message_at + 1) % 256; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.bid_size_long[best_bid_and_ask_update_long_form_message_at] = (best_bid_and_ask_update_long_form_message_base + 23 + best_bid_and_ask_update_long_form_message_at + 1) % 256; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.bid_cust_size_long[best_bid_and_ask_update_long_form_message_at] = (best_bid_and_ask_update_long_form_message_base + 27 + best_bid_and_ask_update_long_form_message_at + 1) % 256; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.bid_pro_cust_size_long[best_bid_and_ask_update_long_form_message_at] = (best_bid_and_ask_update_long_form_message_base + 31 + best_bid_and_ask_update_long_form_message_at + 1) % 256; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.ask_market_order_size_long[best_bid_and_ask_update_long_form_message_at] = (best_bid_and_ask_update_long_form_message_base + 35 + best_bid_and_ask_update_long_form_message_at + 1) % 256; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.ask_price_long[best_bid_and_ask_update_long_form_message_at] = (best_bid_and_ask_update_long_form_message_base + 39 + best_bid_and_ask_update_long_form_message_at + 1) % 256; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.ask_size_long[best_bid_and_ask_update_long_form_message_at] = (best_bid_and_ask_update_long_form_message_base + 43 + best_bid_and_ask_update_long_form_message_at + 1) % 256; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.ask_cust_size_long[best_bid_and_ask_update_long_form_message_at] = (best_bid_and_ask_update_long_form_message_base + 47 + best_bid_and_ask_update_long_form_message_at + 1) % 256; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.ask_pro_cust_size_long[best_bid_and_ask_update_long_form_message_at] = (best_bid_and_ask_update_long_form_message_base + 51 + best_bid_and_ask_update_long_form_message_at + 1) % 256; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Bid And Ask Update Long Form Message to the wire, 55 bytes from where the cursor stands */
inline encode_best_bid_and_ask_update_long_form_message(best_bid_and_ask_update_long_form_message_record) {
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 2 -> wire[at] = best_bid_and_ask_update_long_form_message_record.tracking_number[best_bid_and_ask_update_long_form_message_at]; at = at + 1; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 8 -> wire[at] = best_bid_and_ask_update_long_form_message_record.timestamp[best_bid_and_ask_update_long_form_message_at]; at = at + 1; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> wire[at] = best_bid_and_ask_update_long_form_message_record.instrument_id[best_bid_and_ask_update_long_form_message_at]; at = at + 1; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  wire[at] = best_bid_and_ask_update_long_form_message_record.quote_condition; at = at + 1;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> wire[at] = best_bid_and_ask_update_long_form_message_record.bid_market_order_size_long[best_bid_and_ask_update_long_form_message_at]; at = at + 1; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> wire[at] = best_bid_and_ask_update_long_form_message_record.bid_price_long[best_bid_and_ask_update_long_form_message_at]; at = at + 1; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> wire[at] = best_bid_and_ask_update_long_form_message_record.bid_size_long[best_bid_and_ask_update_long_form_message_at]; at = at + 1; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> wire[at] = best_bid_and_ask_update_long_form_message_record.bid_cust_size_long[best_bid_and_ask_update_long_form_message_at]; at = at + 1; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> wire[at] = best_bid_and_ask_update_long_form_message_record.bid_pro_cust_size_long[best_bid_and_ask_update_long_form_message_at]; at = at + 1; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> wire[at] = best_bid_and_ask_update_long_form_message_record.ask_market_order_size_long[best_bid_and_ask_update_long_form_message_at]; at = at + 1; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> wire[at] = best_bid_and_ask_update_long_form_message_record.ask_price_long[best_bid_and_ask_update_long_form_message_at]; at = at + 1; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> wire[at] = best_bid_and_ask_update_long_form_message_record.ask_size_long[best_bid_and_ask_update_long_form_message_at]; at = at + 1; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> wire[at] = best_bid_and_ask_update_long_form_message_record.ask_cust_size_long[best_bid_and_ask_update_long_form_message_at]; at = at + 1; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> wire[at] = best_bid_and_ask_update_long_form_message_record.ask_pro_cust_size_long[best_bid_and_ask_update_long_form_message_at]; at = at + 1; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Bid And Ask Update Long Form Message off the wire, 55 bytes from where the cursor stands */
inline decode_best_bid_and_ask_update_long_form_message(best_bid_and_ask_update_long_form_message_record) {
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 2 -> best_bid_and_ask_update_long_form_message_record.tracking_number[best_bid_and_ask_update_long_form_message_at] = wire[at]; at = at + 1; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 8 -> best_bid_and_ask_update_long_form_message_record.timestamp[best_bid_and_ask_update_long_form_message_at] = wire[at]; at = at + 1; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.instrument_id[best_bid_and_ask_update_long_form_message_at] = wire[at]; at = at + 1; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_record.quote_condition = wire[at]; at = at + 1;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.bid_market_order_size_long[best_bid_and_ask_update_long_form_message_at] = wire[at]; at = at + 1; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.bid_price_long[best_bid_and_ask_update_long_form_message_at] = wire[at]; at = at + 1; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.bid_size_long[best_bid_and_ask_update_long_form_message_at] = wire[at]; at = at + 1; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.bid_cust_size_long[best_bid_and_ask_update_long_form_message_at] = wire[at]; at = at + 1; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.bid_pro_cust_size_long[best_bid_and_ask_update_long_form_message_at] = wire[at]; at = at + 1; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.ask_market_order_size_long[best_bid_and_ask_update_long_form_message_at] = wire[at]; at = at + 1; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.ask_price_long[best_bid_and_ask_update_long_form_message_at] = wire[at]; at = at + 1; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.ask_size_long[best_bid_and_ask_update_long_form_message_at] = wire[at]; at = at + 1; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.ask_cust_size_long[best_bid_and_ask_update_long_form_message_at] = wire[at]; at = at + 1; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> best_bid_and_ask_update_long_form_message_record.ask_pro_cust_size_long[best_bid_and_ask_update_long_form_message_at] = wire[at]; at = at + 1; best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Best Bid And Ask Update Long Form Message is what was written, byte for byte */
inline equal_best_bid_and_ask_update_long_form_message(best_bid_and_ask_update_long_form_message_read, best_bid_and_ask_update_long_form_message_written) {
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 2 -> assert(best_bid_and_ask_update_long_form_message_read.tracking_number[best_bid_and_ask_update_long_form_message_at] == best_bid_and_ask_update_long_form_message_written.tracking_number[best_bid_and_ask_update_long_form_message_at]); best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 8 -> assert(best_bid_and_ask_update_long_form_message_read.timestamp[best_bid_and_ask_update_long_form_message_at] == best_bid_and_ask_update_long_form_message_written.timestamp[best_bid_and_ask_update_long_form_message_at]); best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> assert(best_bid_and_ask_update_long_form_message_read.instrument_id[best_bid_and_ask_update_long_form_message_at] == best_bid_and_ask_update_long_form_message_written.instrument_id[best_bid_and_ask_update_long_form_message_at]); best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  assert(best_bid_and_ask_update_long_form_message_read.quote_condition == best_bid_and_ask_update_long_form_message_written.quote_condition);
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> assert(best_bid_and_ask_update_long_form_message_read.bid_market_order_size_long[best_bid_and_ask_update_long_form_message_at] == best_bid_and_ask_update_long_form_message_written.bid_market_order_size_long[best_bid_and_ask_update_long_form_message_at]); best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> assert(best_bid_and_ask_update_long_form_message_read.bid_price_long[best_bid_and_ask_update_long_form_message_at] == best_bid_and_ask_update_long_form_message_written.bid_price_long[best_bid_and_ask_update_long_form_message_at]); best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> assert(best_bid_and_ask_update_long_form_message_read.bid_size_long[best_bid_and_ask_update_long_form_message_at] == best_bid_and_ask_update_long_form_message_written.bid_size_long[best_bid_and_ask_update_long_form_message_at]); best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> assert(best_bid_and_ask_update_long_form_message_read.bid_cust_size_long[best_bid_and_ask_update_long_form_message_at] == best_bid_and_ask_update_long_form_message_written.bid_cust_size_long[best_bid_and_ask_update_long_form_message_at]); best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> assert(best_bid_and_ask_update_long_form_message_read.bid_pro_cust_size_long[best_bid_and_ask_update_long_form_message_at] == best_bid_and_ask_update_long_form_message_written.bid_pro_cust_size_long[best_bid_and_ask_update_long_form_message_at]); best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> assert(best_bid_and_ask_update_long_form_message_read.ask_market_order_size_long[best_bid_and_ask_update_long_form_message_at] == best_bid_and_ask_update_long_form_message_written.ask_market_order_size_long[best_bid_and_ask_update_long_form_message_at]); best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> assert(best_bid_and_ask_update_long_form_message_read.ask_price_long[best_bid_and_ask_update_long_form_message_at] == best_bid_and_ask_update_long_form_message_written.ask_price_long[best_bid_and_ask_update_long_form_message_at]); best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> assert(best_bid_and_ask_update_long_form_message_read.ask_size_long[best_bid_and_ask_update_long_form_message_at] == best_bid_and_ask_update_long_form_message_written.ask_size_long[best_bid_and_ask_update_long_form_message_at]); best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> assert(best_bid_and_ask_update_long_form_message_read.ask_cust_size_long[best_bid_and_ask_update_long_form_message_at] == best_bid_and_ask_update_long_form_message_written.ask_cust_size_long[best_bid_and_ask_update_long_form_message_at]); best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_and_ask_update_long_form_message_at = 0;
  do
  :: best_bid_and_ask_update_long_form_message_at < 4 -> assert(best_bid_and_ask_update_long_form_message_read.ask_pro_cust_size_long[best_bid_and_ask_update_long_form_message_at] == best_bid_and_ask_update_long_form_message_written.ask_pro_cust_size_long[best_bid_and_ask_update_long_form_message_at]); best_bid_and_ask_update_long_form_message_at = best_bid_and_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Best Bid Update Short Form Message: 25 bytes ---------------------------- */

/* The options system will continuously calculate its best bid and offer position for active options contracts on the options market during the trading day. Whenever the best bid or ask position changes on one side but not the other side, the options system will send its best bid or ask update via this data feed for the affected security. */
typedef BestBidUpdateShortFormMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte quote_condition;
  byte market_order_size_short[2];
  byte price_short[2];
  byte size_short[2];
  byte cust_size_short[2];
  byte pro_cust_size_short[2]
};

int best_bid_update_short_form_message_at;

/* every byte of Best Bid Update Short Form Message set to one value */
inline fill_best_bid_update_short_form_message(best_bid_update_short_form_message_record, best_bid_update_short_form_message_value) {
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> best_bid_update_short_form_message_record.tracking_number[best_bid_update_short_form_message_at] = best_bid_update_short_form_message_value; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 8 -> best_bid_update_short_form_message_record.timestamp[best_bid_update_short_form_message_at] = best_bid_update_short_form_message_value; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 4 -> best_bid_update_short_form_message_record.instrument_id[best_bid_update_short_form_message_at] = best_bid_update_short_form_message_value; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_record.quote_condition = best_bid_update_short_form_message_value;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> best_bid_update_short_form_message_record.market_order_size_short[best_bid_update_short_form_message_at] = best_bid_update_short_form_message_value; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> best_bid_update_short_form_message_record.price_short[best_bid_update_short_form_message_at] = best_bid_update_short_form_message_value; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> best_bid_update_short_form_message_record.size_short[best_bid_update_short_form_message_at] = best_bid_update_short_form_message_value; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> best_bid_update_short_form_message_record.cust_size_short[best_bid_update_short_form_message_at] = best_bid_update_short_form_message_value; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> best_bid_update_short_form_message_record.pro_cust_size_short[best_bid_update_short_form_message_at] = best_bid_update_short_form_message_value; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Best Bid Update Short Form Message set to where it lies, so a field read out of place says so */
inline ramp_best_bid_update_short_form_message(best_bid_update_short_form_message_record, best_bid_update_short_form_message_base) {
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> best_bid_update_short_form_message_record.tracking_number[best_bid_update_short_form_message_at] = (best_bid_update_short_form_message_base + 0 + best_bid_update_short_form_message_at + 1) % 256; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 8 -> best_bid_update_short_form_message_record.timestamp[best_bid_update_short_form_message_at] = (best_bid_update_short_form_message_base + 2 + best_bid_update_short_form_message_at + 1) % 256; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 4 -> best_bid_update_short_form_message_record.instrument_id[best_bid_update_short_form_message_at] = (best_bid_update_short_form_message_base + 10 + best_bid_update_short_form_message_at + 1) % 256; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_record.quote_condition = (best_bid_update_short_form_message_base + 14 + 1) % 256;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> best_bid_update_short_form_message_record.market_order_size_short[best_bid_update_short_form_message_at] = (best_bid_update_short_form_message_base + 15 + best_bid_update_short_form_message_at + 1) % 256; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> best_bid_update_short_form_message_record.price_short[best_bid_update_short_form_message_at] = (best_bid_update_short_form_message_base + 17 + best_bid_update_short_form_message_at + 1) % 256; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> best_bid_update_short_form_message_record.size_short[best_bid_update_short_form_message_at] = (best_bid_update_short_form_message_base + 19 + best_bid_update_short_form_message_at + 1) % 256; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> best_bid_update_short_form_message_record.cust_size_short[best_bid_update_short_form_message_at] = (best_bid_update_short_form_message_base + 21 + best_bid_update_short_form_message_at + 1) % 256; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> best_bid_update_short_form_message_record.pro_cust_size_short[best_bid_update_short_form_message_at] = (best_bid_update_short_form_message_base + 23 + best_bid_update_short_form_message_at + 1) % 256; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Bid Update Short Form Message to the wire, 25 bytes from where the cursor stands */
inline encode_best_bid_update_short_form_message(best_bid_update_short_form_message_record) {
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> wire[at] = best_bid_update_short_form_message_record.tracking_number[best_bid_update_short_form_message_at]; at = at + 1; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 8 -> wire[at] = best_bid_update_short_form_message_record.timestamp[best_bid_update_short_form_message_at]; at = at + 1; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 4 -> wire[at] = best_bid_update_short_form_message_record.instrument_id[best_bid_update_short_form_message_at]; at = at + 1; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  wire[at] = best_bid_update_short_form_message_record.quote_condition; at = at + 1;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> wire[at] = best_bid_update_short_form_message_record.market_order_size_short[best_bid_update_short_form_message_at]; at = at + 1; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> wire[at] = best_bid_update_short_form_message_record.price_short[best_bid_update_short_form_message_at]; at = at + 1; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> wire[at] = best_bid_update_short_form_message_record.size_short[best_bid_update_short_form_message_at]; at = at + 1; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> wire[at] = best_bid_update_short_form_message_record.cust_size_short[best_bid_update_short_form_message_at]; at = at + 1; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> wire[at] = best_bid_update_short_form_message_record.pro_cust_size_short[best_bid_update_short_form_message_at]; at = at + 1; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Bid Update Short Form Message off the wire, 25 bytes from where the cursor stands */
inline decode_best_bid_update_short_form_message(best_bid_update_short_form_message_record) {
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> best_bid_update_short_form_message_record.tracking_number[best_bid_update_short_form_message_at] = wire[at]; at = at + 1; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 8 -> best_bid_update_short_form_message_record.timestamp[best_bid_update_short_form_message_at] = wire[at]; at = at + 1; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 4 -> best_bid_update_short_form_message_record.instrument_id[best_bid_update_short_form_message_at] = wire[at]; at = at + 1; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_record.quote_condition = wire[at]; at = at + 1;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> best_bid_update_short_form_message_record.market_order_size_short[best_bid_update_short_form_message_at] = wire[at]; at = at + 1; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> best_bid_update_short_form_message_record.price_short[best_bid_update_short_form_message_at] = wire[at]; at = at + 1; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> best_bid_update_short_form_message_record.size_short[best_bid_update_short_form_message_at] = wire[at]; at = at + 1; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> best_bid_update_short_form_message_record.cust_size_short[best_bid_update_short_form_message_at] = wire[at]; at = at + 1; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> best_bid_update_short_form_message_record.pro_cust_size_short[best_bid_update_short_form_message_at] = wire[at]; at = at + 1; best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Best Bid Update Short Form Message is what was written, byte for byte */
inline equal_best_bid_update_short_form_message(best_bid_update_short_form_message_read, best_bid_update_short_form_message_written) {
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> assert(best_bid_update_short_form_message_read.tracking_number[best_bid_update_short_form_message_at] == best_bid_update_short_form_message_written.tracking_number[best_bid_update_short_form_message_at]); best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 8 -> assert(best_bid_update_short_form_message_read.timestamp[best_bid_update_short_form_message_at] == best_bid_update_short_form_message_written.timestamp[best_bid_update_short_form_message_at]); best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 4 -> assert(best_bid_update_short_form_message_read.instrument_id[best_bid_update_short_form_message_at] == best_bid_update_short_form_message_written.instrument_id[best_bid_update_short_form_message_at]); best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  assert(best_bid_update_short_form_message_read.quote_condition == best_bid_update_short_form_message_written.quote_condition);
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> assert(best_bid_update_short_form_message_read.market_order_size_short[best_bid_update_short_form_message_at] == best_bid_update_short_form_message_written.market_order_size_short[best_bid_update_short_form_message_at]); best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> assert(best_bid_update_short_form_message_read.price_short[best_bid_update_short_form_message_at] == best_bid_update_short_form_message_written.price_short[best_bid_update_short_form_message_at]); best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> assert(best_bid_update_short_form_message_read.size_short[best_bid_update_short_form_message_at] == best_bid_update_short_form_message_written.size_short[best_bid_update_short_form_message_at]); best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> assert(best_bid_update_short_form_message_read.cust_size_short[best_bid_update_short_form_message_at] == best_bid_update_short_form_message_written.cust_size_short[best_bid_update_short_form_message_at]); best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_short_form_message_at = 0;
  do
  :: best_bid_update_short_form_message_at < 2 -> assert(best_bid_update_short_form_message_read.pro_cust_size_short[best_bid_update_short_form_message_at] == best_bid_update_short_form_message_written.pro_cust_size_short[best_bid_update_short_form_message_at]); best_bid_update_short_form_message_at = best_bid_update_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Best Ask Update Short Form Message: 25 bytes ---------------------------- */

/* The options system will continuously calculate its best bid and offer position for active options contracts on the options market during the trading day. Whenever the best bid or ask position changes on one side but not the other side, the options system will send its best bid or ask update via this data feed for the affected security. */
typedef BestAskUpdateShortFormMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte quote_condition;
  byte market_order_size_short[2];
  byte price_short[2];
  byte size_short[2];
  byte cust_size_short[2];
  byte pro_cust_size_short[2]
};

int best_ask_update_short_form_message_at;

/* every byte of Best Ask Update Short Form Message set to one value */
inline fill_best_ask_update_short_form_message(best_ask_update_short_form_message_record, best_ask_update_short_form_message_value) {
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> best_ask_update_short_form_message_record.tracking_number[best_ask_update_short_form_message_at] = best_ask_update_short_form_message_value; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 8 -> best_ask_update_short_form_message_record.timestamp[best_ask_update_short_form_message_at] = best_ask_update_short_form_message_value; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 4 -> best_ask_update_short_form_message_record.instrument_id[best_ask_update_short_form_message_at] = best_ask_update_short_form_message_value; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_record.quote_condition = best_ask_update_short_form_message_value;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> best_ask_update_short_form_message_record.market_order_size_short[best_ask_update_short_form_message_at] = best_ask_update_short_form_message_value; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> best_ask_update_short_form_message_record.price_short[best_ask_update_short_form_message_at] = best_ask_update_short_form_message_value; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> best_ask_update_short_form_message_record.size_short[best_ask_update_short_form_message_at] = best_ask_update_short_form_message_value; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> best_ask_update_short_form_message_record.cust_size_short[best_ask_update_short_form_message_at] = best_ask_update_short_form_message_value; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> best_ask_update_short_form_message_record.pro_cust_size_short[best_ask_update_short_form_message_at] = best_ask_update_short_form_message_value; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Best Ask Update Short Form Message set to where it lies, so a field read out of place says so */
inline ramp_best_ask_update_short_form_message(best_ask_update_short_form_message_record, best_ask_update_short_form_message_base) {
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> best_ask_update_short_form_message_record.tracking_number[best_ask_update_short_form_message_at] = (best_ask_update_short_form_message_base + 0 + best_ask_update_short_form_message_at + 1) % 256; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 8 -> best_ask_update_short_form_message_record.timestamp[best_ask_update_short_form_message_at] = (best_ask_update_short_form_message_base + 2 + best_ask_update_short_form_message_at + 1) % 256; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 4 -> best_ask_update_short_form_message_record.instrument_id[best_ask_update_short_form_message_at] = (best_ask_update_short_form_message_base + 10 + best_ask_update_short_form_message_at + 1) % 256; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_record.quote_condition = (best_ask_update_short_form_message_base + 14 + 1) % 256;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> best_ask_update_short_form_message_record.market_order_size_short[best_ask_update_short_form_message_at] = (best_ask_update_short_form_message_base + 15 + best_ask_update_short_form_message_at + 1) % 256; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> best_ask_update_short_form_message_record.price_short[best_ask_update_short_form_message_at] = (best_ask_update_short_form_message_base + 17 + best_ask_update_short_form_message_at + 1) % 256; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> best_ask_update_short_form_message_record.size_short[best_ask_update_short_form_message_at] = (best_ask_update_short_form_message_base + 19 + best_ask_update_short_form_message_at + 1) % 256; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> best_ask_update_short_form_message_record.cust_size_short[best_ask_update_short_form_message_at] = (best_ask_update_short_form_message_base + 21 + best_ask_update_short_form_message_at + 1) % 256; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> best_ask_update_short_form_message_record.pro_cust_size_short[best_ask_update_short_form_message_at] = (best_ask_update_short_form_message_base + 23 + best_ask_update_short_form_message_at + 1) % 256; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Ask Update Short Form Message to the wire, 25 bytes from where the cursor stands */
inline encode_best_ask_update_short_form_message(best_ask_update_short_form_message_record) {
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> wire[at] = best_ask_update_short_form_message_record.tracking_number[best_ask_update_short_form_message_at]; at = at + 1; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 8 -> wire[at] = best_ask_update_short_form_message_record.timestamp[best_ask_update_short_form_message_at]; at = at + 1; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 4 -> wire[at] = best_ask_update_short_form_message_record.instrument_id[best_ask_update_short_form_message_at]; at = at + 1; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  wire[at] = best_ask_update_short_form_message_record.quote_condition; at = at + 1;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> wire[at] = best_ask_update_short_form_message_record.market_order_size_short[best_ask_update_short_form_message_at]; at = at + 1; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> wire[at] = best_ask_update_short_form_message_record.price_short[best_ask_update_short_form_message_at]; at = at + 1; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> wire[at] = best_ask_update_short_form_message_record.size_short[best_ask_update_short_form_message_at]; at = at + 1; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> wire[at] = best_ask_update_short_form_message_record.cust_size_short[best_ask_update_short_form_message_at]; at = at + 1; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> wire[at] = best_ask_update_short_form_message_record.pro_cust_size_short[best_ask_update_short_form_message_at]; at = at + 1; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Ask Update Short Form Message off the wire, 25 bytes from where the cursor stands */
inline decode_best_ask_update_short_form_message(best_ask_update_short_form_message_record) {
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> best_ask_update_short_form_message_record.tracking_number[best_ask_update_short_form_message_at] = wire[at]; at = at + 1; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 8 -> best_ask_update_short_form_message_record.timestamp[best_ask_update_short_form_message_at] = wire[at]; at = at + 1; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 4 -> best_ask_update_short_form_message_record.instrument_id[best_ask_update_short_form_message_at] = wire[at]; at = at + 1; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_record.quote_condition = wire[at]; at = at + 1;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> best_ask_update_short_form_message_record.market_order_size_short[best_ask_update_short_form_message_at] = wire[at]; at = at + 1; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> best_ask_update_short_form_message_record.price_short[best_ask_update_short_form_message_at] = wire[at]; at = at + 1; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> best_ask_update_short_form_message_record.size_short[best_ask_update_short_form_message_at] = wire[at]; at = at + 1; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> best_ask_update_short_form_message_record.cust_size_short[best_ask_update_short_form_message_at] = wire[at]; at = at + 1; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> best_ask_update_short_form_message_record.pro_cust_size_short[best_ask_update_short_form_message_at] = wire[at]; at = at + 1; best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Best Ask Update Short Form Message is what was written, byte for byte */
inline equal_best_ask_update_short_form_message(best_ask_update_short_form_message_read, best_ask_update_short_form_message_written) {
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> assert(best_ask_update_short_form_message_read.tracking_number[best_ask_update_short_form_message_at] == best_ask_update_short_form_message_written.tracking_number[best_ask_update_short_form_message_at]); best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 8 -> assert(best_ask_update_short_form_message_read.timestamp[best_ask_update_short_form_message_at] == best_ask_update_short_form_message_written.timestamp[best_ask_update_short_form_message_at]); best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 4 -> assert(best_ask_update_short_form_message_read.instrument_id[best_ask_update_short_form_message_at] == best_ask_update_short_form_message_written.instrument_id[best_ask_update_short_form_message_at]); best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  assert(best_ask_update_short_form_message_read.quote_condition == best_ask_update_short_form_message_written.quote_condition);
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> assert(best_ask_update_short_form_message_read.market_order_size_short[best_ask_update_short_form_message_at] == best_ask_update_short_form_message_written.market_order_size_short[best_ask_update_short_form_message_at]); best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> assert(best_ask_update_short_form_message_read.price_short[best_ask_update_short_form_message_at] == best_ask_update_short_form_message_written.price_short[best_ask_update_short_form_message_at]); best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> assert(best_ask_update_short_form_message_read.size_short[best_ask_update_short_form_message_at] == best_ask_update_short_form_message_written.size_short[best_ask_update_short_form_message_at]); best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> assert(best_ask_update_short_form_message_read.cust_size_short[best_ask_update_short_form_message_at] == best_ask_update_short_form_message_written.cust_size_short[best_ask_update_short_form_message_at]); best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_short_form_message_at = 0;
  do
  :: best_ask_update_short_form_message_at < 2 -> assert(best_ask_update_short_form_message_read.pro_cust_size_short[best_ask_update_short_form_message_at] == best_ask_update_short_form_message_written.pro_cust_size_short[best_ask_update_short_form_message_at]); best_ask_update_short_form_message_at = best_ask_update_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Best Bid Update Long Form Message: 35 bytes ----------------------------- */

/* This message is the same as the Best Bid OR Ask Update Message - Short Form described above except that Prices and Sizes are 4 byte Integers, the price having 4 implied decimal places. */
typedef BestBidUpdateLongFormMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte quote_condition;
  byte market_order_size_long[4];
  byte price_long[4];
  byte size_long[4];
  byte cust_size_long[4];
  byte pro_cust_size_long[4]
};

int best_bid_update_long_form_message_at;

/* every byte of Best Bid Update Long Form Message set to one value */
inline fill_best_bid_update_long_form_message(best_bid_update_long_form_message_record, best_bid_update_long_form_message_value) {
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 2 -> best_bid_update_long_form_message_record.tracking_number[best_bid_update_long_form_message_at] = best_bid_update_long_form_message_value; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 8 -> best_bid_update_long_form_message_record.timestamp[best_bid_update_long_form_message_at] = best_bid_update_long_form_message_value; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> best_bid_update_long_form_message_record.instrument_id[best_bid_update_long_form_message_at] = best_bid_update_long_form_message_value; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_record.quote_condition = best_bid_update_long_form_message_value;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> best_bid_update_long_form_message_record.market_order_size_long[best_bid_update_long_form_message_at] = best_bid_update_long_form_message_value; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> best_bid_update_long_form_message_record.price_long[best_bid_update_long_form_message_at] = best_bid_update_long_form_message_value; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> best_bid_update_long_form_message_record.size_long[best_bid_update_long_form_message_at] = best_bid_update_long_form_message_value; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> best_bid_update_long_form_message_record.cust_size_long[best_bid_update_long_form_message_at] = best_bid_update_long_form_message_value; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> best_bid_update_long_form_message_record.pro_cust_size_long[best_bid_update_long_form_message_at] = best_bid_update_long_form_message_value; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Best Bid Update Long Form Message set to where it lies, so a field read out of place says so */
inline ramp_best_bid_update_long_form_message(best_bid_update_long_form_message_record, best_bid_update_long_form_message_base) {
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 2 -> best_bid_update_long_form_message_record.tracking_number[best_bid_update_long_form_message_at] = (best_bid_update_long_form_message_base + 0 + best_bid_update_long_form_message_at + 1) % 256; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 8 -> best_bid_update_long_form_message_record.timestamp[best_bid_update_long_form_message_at] = (best_bid_update_long_form_message_base + 2 + best_bid_update_long_form_message_at + 1) % 256; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> best_bid_update_long_form_message_record.instrument_id[best_bid_update_long_form_message_at] = (best_bid_update_long_form_message_base + 10 + best_bid_update_long_form_message_at + 1) % 256; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_record.quote_condition = (best_bid_update_long_form_message_base + 14 + 1) % 256;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> best_bid_update_long_form_message_record.market_order_size_long[best_bid_update_long_form_message_at] = (best_bid_update_long_form_message_base + 15 + best_bid_update_long_form_message_at + 1) % 256; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> best_bid_update_long_form_message_record.price_long[best_bid_update_long_form_message_at] = (best_bid_update_long_form_message_base + 19 + best_bid_update_long_form_message_at + 1) % 256; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> best_bid_update_long_form_message_record.size_long[best_bid_update_long_form_message_at] = (best_bid_update_long_form_message_base + 23 + best_bid_update_long_form_message_at + 1) % 256; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> best_bid_update_long_form_message_record.cust_size_long[best_bid_update_long_form_message_at] = (best_bid_update_long_form_message_base + 27 + best_bid_update_long_form_message_at + 1) % 256; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> best_bid_update_long_form_message_record.pro_cust_size_long[best_bid_update_long_form_message_at] = (best_bid_update_long_form_message_base + 31 + best_bid_update_long_form_message_at + 1) % 256; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Bid Update Long Form Message to the wire, 35 bytes from where the cursor stands */
inline encode_best_bid_update_long_form_message(best_bid_update_long_form_message_record) {
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 2 -> wire[at] = best_bid_update_long_form_message_record.tracking_number[best_bid_update_long_form_message_at]; at = at + 1; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 8 -> wire[at] = best_bid_update_long_form_message_record.timestamp[best_bid_update_long_form_message_at]; at = at + 1; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> wire[at] = best_bid_update_long_form_message_record.instrument_id[best_bid_update_long_form_message_at]; at = at + 1; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  wire[at] = best_bid_update_long_form_message_record.quote_condition; at = at + 1;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> wire[at] = best_bid_update_long_form_message_record.market_order_size_long[best_bid_update_long_form_message_at]; at = at + 1; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> wire[at] = best_bid_update_long_form_message_record.price_long[best_bid_update_long_form_message_at]; at = at + 1; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> wire[at] = best_bid_update_long_form_message_record.size_long[best_bid_update_long_form_message_at]; at = at + 1; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> wire[at] = best_bid_update_long_form_message_record.cust_size_long[best_bid_update_long_form_message_at]; at = at + 1; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> wire[at] = best_bid_update_long_form_message_record.pro_cust_size_long[best_bid_update_long_form_message_at]; at = at + 1; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Bid Update Long Form Message off the wire, 35 bytes from where the cursor stands */
inline decode_best_bid_update_long_form_message(best_bid_update_long_form_message_record) {
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 2 -> best_bid_update_long_form_message_record.tracking_number[best_bid_update_long_form_message_at] = wire[at]; at = at + 1; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 8 -> best_bid_update_long_form_message_record.timestamp[best_bid_update_long_form_message_at] = wire[at]; at = at + 1; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> best_bid_update_long_form_message_record.instrument_id[best_bid_update_long_form_message_at] = wire[at]; at = at + 1; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_record.quote_condition = wire[at]; at = at + 1;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> best_bid_update_long_form_message_record.market_order_size_long[best_bid_update_long_form_message_at] = wire[at]; at = at + 1; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> best_bid_update_long_form_message_record.price_long[best_bid_update_long_form_message_at] = wire[at]; at = at + 1; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> best_bid_update_long_form_message_record.size_long[best_bid_update_long_form_message_at] = wire[at]; at = at + 1; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> best_bid_update_long_form_message_record.cust_size_long[best_bid_update_long_form_message_at] = wire[at]; at = at + 1; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> best_bid_update_long_form_message_record.pro_cust_size_long[best_bid_update_long_form_message_at] = wire[at]; at = at + 1; best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Best Bid Update Long Form Message is what was written, byte for byte */
inline equal_best_bid_update_long_form_message(best_bid_update_long_form_message_read, best_bid_update_long_form_message_written) {
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 2 -> assert(best_bid_update_long_form_message_read.tracking_number[best_bid_update_long_form_message_at] == best_bid_update_long_form_message_written.tracking_number[best_bid_update_long_form_message_at]); best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 8 -> assert(best_bid_update_long_form_message_read.timestamp[best_bid_update_long_form_message_at] == best_bid_update_long_form_message_written.timestamp[best_bid_update_long_form_message_at]); best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> assert(best_bid_update_long_form_message_read.instrument_id[best_bid_update_long_form_message_at] == best_bid_update_long_form_message_written.instrument_id[best_bid_update_long_form_message_at]); best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  assert(best_bid_update_long_form_message_read.quote_condition == best_bid_update_long_form_message_written.quote_condition);
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> assert(best_bid_update_long_form_message_read.market_order_size_long[best_bid_update_long_form_message_at] == best_bid_update_long_form_message_written.market_order_size_long[best_bid_update_long_form_message_at]); best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> assert(best_bid_update_long_form_message_read.price_long[best_bid_update_long_form_message_at] == best_bid_update_long_form_message_written.price_long[best_bid_update_long_form_message_at]); best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> assert(best_bid_update_long_form_message_read.size_long[best_bid_update_long_form_message_at] == best_bid_update_long_form_message_written.size_long[best_bid_update_long_form_message_at]); best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> assert(best_bid_update_long_form_message_read.cust_size_long[best_bid_update_long_form_message_at] == best_bid_update_long_form_message_written.cust_size_long[best_bid_update_long_form_message_at]); best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  best_bid_update_long_form_message_at = 0;
  do
  :: best_bid_update_long_form_message_at < 4 -> assert(best_bid_update_long_form_message_read.pro_cust_size_long[best_bid_update_long_form_message_at] == best_bid_update_long_form_message_written.pro_cust_size_long[best_bid_update_long_form_message_at]); best_bid_update_long_form_message_at = best_bid_update_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Best Ask Update Long Form Message: 35 bytes ----------------------------- */

/* This message is the same as the Best Bid OR Ask Update Message - Short Form described above except that Prices and Sizes are 4 byte Integers, the price having 4 implied decimal places. */
typedef BestAskUpdateLongFormMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte quote_condition;
  byte market_order_size_long[4];
  byte price_long[4];
  byte size_long[4];
  byte cust_size_long[4];
  byte pro_cust_size_long[4]
};

int best_ask_update_long_form_message_at;

/* every byte of Best Ask Update Long Form Message set to one value */
inline fill_best_ask_update_long_form_message(best_ask_update_long_form_message_record, best_ask_update_long_form_message_value) {
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 2 -> best_ask_update_long_form_message_record.tracking_number[best_ask_update_long_form_message_at] = best_ask_update_long_form_message_value; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 8 -> best_ask_update_long_form_message_record.timestamp[best_ask_update_long_form_message_at] = best_ask_update_long_form_message_value; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> best_ask_update_long_form_message_record.instrument_id[best_ask_update_long_form_message_at] = best_ask_update_long_form_message_value; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_record.quote_condition = best_ask_update_long_form_message_value;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> best_ask_update_long_form_message_record.market_order_size_long[best_ask_update_long_form_message_at] = best_ask_update_long_form_message_value; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> best_ask_update_long_form_message_record.price_long[best_ask_update_long_form_message_at] = best_ask_update_long_form_message_value; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> best_ask_update_long_form_message_record.size_long[best_ask_update_long_form_message_at] = best_ask_update_long_form_message_value; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> best_ask_update_long_form_message_record.cust_size_long[best_ask_update_long_form_message_at] = best_ask_update_long_form_message_value; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> best_ask_update_long_form_message_record.pro_cust_size_long[best_ask_update_long_form_message_at] = best_ask_update_long_form_message_value; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Best Ask Update Long Form Message set to where it lies, so a field read out of place says so */
inline ramp_best_ask_update_long_form_message(best_ask_update_long_form_message_record, best_ask_update_long_form_message_base) {
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 2 -> best_ask_update_long_form_message_record.tracking_number[best_ask_update_long_form_message_at] = (best_ask_update_long_form_message_base + 0 + best_ask_update_long_form_message_at + 1) % 256; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 8 -> best_ask_update_long_form_message_record.timestamp[best_ask_update_long_form_message_at] = (best_ask_update_long_form_message_base + 2 + best_ask_update_long_form_message_at + 1) % 256; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> best_ask_update_long_form_message_record.instrument_id[best_ask_update_long_form_message_at] = (best_ask_update_long_form_message_base + 10 + best_ask_update_long_form_message_at + 1) % 256; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_record.quote_condition = (best_ask_update_long_form_message_base + 14 + 1) % 256;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> best_ask_update_long_form_message_record.market_order_size_long[best_ask_update_long_form_message_at] = (best_ask_update_long_form_message_base + 15 + best_ask_update_long_form_message_at + 1) % 256; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> best_ask_update_long_form_message_record.price_long[best_ask_update_long_form_message_at] = (best_ask_update_long_form_message_base + 19 + best_ask_update_long_form_message_at + 1) % 256; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> best_ask_update_long_form_message_record.size_long[best_ask_update_long_form_message_at] = (best_ask_update_long_form_message_base + 23 + best_ask_update_long_form_message_at + 1) % 256; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> best_ask_update_long_form_message_record.cust_size_long[best_ask_update_long_form_message_at] = (best_ask_update_long_form_message_base + 27 + best_ask_update_long_form_message_at + 1) % 256; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> best_ask_update_long_form_message_record.pro_cust_size_long[best_ask_update_long_form_message_at] = (best_ask_update_long_form_message_base + 31 + best_ask_update_long_form_message_at + 1) % 256; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Ask Update Long Form Message to the wire, 35 bytes from where the cursor stands */
inline encode_best_ask_update_long_form_message(best_ask_update_long_form_message_record) {
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 2 -> wire[at] = best_ask_update_long_form_message_record.tracking_number[best_ask_update_long_form_message_at]; at = at + 1; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 8 -> wire[at] = best_ask_update_long_form_message_record.timestamp[best_ask_update_long_form_message_at]; at = at + 1; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> wire[at] = best_ask_update_long_form_message_record.instrument_id[best_ask_update_long_form_message_at]; at = at + 1; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  wire[at] = best_ask_update_long_form_message_record.quote_condition; at = at + 1;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> wire[at] = best_ask_update_long_form_message_record.market_order_size_long[best_ask_update_long_form_message_at]; at = at + 1; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> wire[at] = best_ask_update_long_form_message_record.price_long[best_ask_update_long_form_message_at]; at = at + 1; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> wire[at] = best_ask_update_long_form_message_record.size_long[best_ask_update_long_form_message_at]; at = at + 1; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> wire[at] = best_ask_update_long_form_message_record.cust_size_long[best_ask_update_long_form_message_at]; at = at + 1; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> wire[at] = best_ask_update_long_form_message_record.pro_cust_size_long[best_ask_update_long_form_message_at]; at = at + 1; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Ask Update Long Form Message off the wire, 35 bytes from where the cursor stands */
inline decode_best_ask_update_long_form_message(best_ask_update_long_form_message_record) {
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 2 -> best_ask_update_long_form_message_record.tracking_number[best_ask_update_long_form_message_at] = wire[at]; at = at + 1; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 8 -> best_ask_update_long_form_message_record.timestamp[best_ask_update_long_form_message_at] = wire[at]; at = at + 1; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> best_ask_update_long_form_message_record.instrument_id[best_ask_update_long_form_message_at] = wire[at]; at = at + 1; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_record.quote_condition = wire[at]; at = at + 1;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> best_ask_update_long_form_message_record.market_order_size_long[best_ask_update_long_form_message_at] = wire[at]; at = at + 1; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> best_ask_update_long_form_message_record.price_long[best_ask_update_long_form_message_at] = wire[at]; at = at + 1; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> best_ask_update_long_form_message_record.size_long[best_ask_update_long_form_message_at] = wire[at]; at = at + 1; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> best_ask_update_long_form_message_record.cust_size_long[best_ask_update_long_form_message_at] = wire[at]; at = at + 1; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> best_ask_update_long_form_message_record.pro_cust_size_long[best_ask_update_long_form_message_at] = wire[at]; at = at + 1; best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Best Ask Update Long Form Message is what was written, byte for byte */
inline equal_best_ask_update_long_form_message(best_ask_update_long_form_message_read, best_ask_update_long_form_message_written) {
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 2 -> assert(best_ask_update_long_form_message_read.tracking_number[best_ask_update_long_form_message_at] == best_ask_update_long_form_message_written.tracking_number[best_ask_update_long_form_message_at]); best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 8 -> assert(best_ask_update_long_form_message_read.timestamp[best_ask_update_long_form_message_at] == best_ask_update_long_form_message_written.timestamp[best_ask_update_long_form_message_at]); best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> assert(best_ask_update_long_form_message_read.instrument_id[best_ask_update_long_form_message_at] == best_ask_update_long_form_message_written.instrument_id[best_ask_update_long_form_message_at]); best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  assert(best_ask_update_long_form_message_read.quote_condition == best_ask_update_long_form_message_written.quote_condition);
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> assert(best_ask_update_long_form_message_read.market_order_size_long[best_ask_update_long_form_message_at] == best_ask_update_long_form_message_written.market_order_size_long[best_ask_update_long_form_message_at]); best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> assert(best_ask_update_long_form_message_read.price_long[best_ask_update_long_form_message_at] == best_ask_update_long_form_message_written.price_long[best_ask_update_long_form_message_at]); best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> assert(best_ask_update_long_form_message_read.size_long[best_ask_update_long_form_message_at] == best_ask_update_long_form_message_written.size_long[best_ask_update_long_form_message_at]); best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> assert(best_ask_update_long_form_message_read.cust_size_long[best_ask_update_long_form_message_at] == best_ask_update_long_form_message_written.cust_size_long[best_ask_update_long_form_message_at]); best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  best_ask_update_long_form_message_at = 0;
  do
  :: best_ask_update_long_form_message_at < 4 -> assert(best_ask_update_long_form_message_read.pro_cust_size_long[best_ask_update_long_form_message_at] == best_ask_update_long_form_message_written.pro_cust_size_long[best_ask_update_long_form_message_at]); best_ask_update_long_form_message_at = best_ask_update_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Replay Sequence Message: 20 bytes -------------------------------- */

/* The End of replay Sequence message reflects the sequence number at the time replay of existing messages is complete. */
typedef EndOfReplaySequenceMessage {
  byte end_of_replay_sequence_number[20]
};

int end_of_replay_sequence_message_at;

/* every byte of End Of Replay Sequence Message set to one value */
inline fill_end_of_replay_sequence_message(end_of_replay_sequence_message_record, end_of_replay_sequence_message_value) {
  end_of_replay_sequence_message_at = 0;
  do
  :: end_of_replay_sequence_message_at < 20 -> end_of_replay_sequence_message_record.end_of_replay_sequence_number[end_of_replay_sequence_message_at] = end_of_replay_sequence_message_value; end_of_replay_sequence_message_at = end_of_replay_sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Replay Sequence Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_replay_sequence_message(end_of_replay_sequence_message_record, end_of_replay_sequence_message_base) {
  end_of_replay_sequence_message_at = 0;
  do
  :: end_of_replay_sequence_message_at < 20 -> end_of_replay_sequence_message_record.end_of_replay_sequence_number[end_of_replay_sequence_message_at] = (end_of_replay_sequence_message_base + 0 + end_of_replay_sequence_message_at + 1) % 256; end_of_replay_sequence_message_at = end_of_replay_sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Replay Sequence Message to the wire, 20 bytes from where the cursor stands */
inline encode_end_of_replay_sequence_message(end_of_replay_sequence_message_record) {
  end_of_replay_sequence_message_at = 0;
  do
  :: end_of_replay_sequence_message_at < 20 -> wire[at] = end_of_replay_sequence_message_record.end_of_replay_sequence_number[end_of_replay_sequence_message_at]; at = at + 1; end_of_replay_sequence_message_at = end_of_replay_sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Replay Sequence Message off the wire, 20 bytes from where the cursor stands */
inline decode_end_of_replay_sequence_message(end_of_replay_sequence_message_record) {
  end_of_replay_sequence_message_at = 0;
  do
  :: end_of_replay_sequence_message_at < 20 -> end_of_replay_sequence_message_record.end_of_replay_sequence_number[end_of_replay_sequence_message_at] = wire[at]; at = at + 1; end_of_replay_sequence_message_at = end_of_replay_sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Replay Sequence Message is what was written, byte for byte */
inline equal_end_of_replay_sequence_message(end_of_replay_sequence_message_read, end_of_replay_sequence_message_written) {
  end_of_replay_sequence_message_at = 0;
  do
  :: end_of_replay_sequence_message_at < 20 -> assert(end_of_replay_sequence_message_read.end_of_replay_sequence_number[end_of_replay_sequence_message_at] == end_of_replay_sequence_message_written.end_of_replay_sequence_number[end_of_replay_sequence_message_at]); end_of_replay_sequence_message_at = end_of_replay_sequence_message_at + 1
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
    assert(at == 62);
    at = 0;
    decode_derivative_directory_message(derivative_directory_message_got);
    assert(at == 62);
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

/* Best Bid And Ask Update Short Form Message: encoded, read back, and compared */
proctype check_best_bid_and_ask_update_short_form_message() {
  BestBidAndAskUpdateShortFormMessage best_bid_and_ask_update_short_form_message_sent;
  BestBidAndAskUpdateShortFormMessage best_bid_and_ask_update_short_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_best_bid_and_ask_update_short_form_message(best_bid_and_ask_update_short_form_message_sent, 0)
  :: pattern == 1 -> fill_best_bid_and_ask_update_short_form_message(best_bid_and_ask_update_short_form_message_sent, 32)
  :: pattern == 2 -> fill_best_bid_and_ask_update_short_form_message(best_bid_and_ask_update_short_form_message_sent, 255)
  :: else -> ramp_best_bid_and_ask_update_short_form_message(best_bid_and_ask_update_short_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_best_bid_and_ask_update_short_form_message(best_bid_and_ask_update_short_form_message_sent);
    assert(at == 35);
    at = 0;
    decode_best_bid_and_ask_update_short_form_message(best_bid_and_ask_update_short_form_message_got);
    assert(at == 35);
    equal_best_bid_and_ask_update_short_form_message(best_bid_and_ask_update_short_form_message_got, best_bid_and_ask_update_short_form_message_sent)
  }
}

/* Best Bid And Ask Update Long Form Message: encoded, read back, and compared */
proctype check_best_bid_and_ask_update_long_form_message() {
  BestBidAndAskUpdateLongFormMessage best_bid_and_ask_update_long_form_message_sent;
  BestBidAndAskUpdateLongFormMessage best_bid_and_ask_update_long_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_best_bid_and_ask_update_long_form_message(best_bid_and_ask_update_long_form_message_sent, 0)
  :: pattern == 1 -> fill_best_bid_and_ask_update_long_form_message(best_bid_and_ask_update_long_form_message_sent, 32)
  :: pattern == 2 -> fill_best_bid_and_ask_update_long_form_message(best_bid_and_ask_update_long_form_message_sent, 255)
  :: else -> ramp_best_bid_and_ask_update_long_form_message(best_bid_and_ask_update_long_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_best_bid_and_ask_update_long_form_message(best_bid_and_ask_update_long_form_message_sent);
    assert(at == 55);
    at = 0;
    decode_best_bid_and_ask_update_long_form_message(best_bid_and_ask_update_long_form_message_got);
    assert(at == 55);
    equal_best_bid_and_ask_update_long_form_message(best_bid_and_ask_update_long_form_message_got, best_bid_and_ask_update_long_form_message_sent)
  }
}

/* Best Bid Update Short Form Message: encoded, read back, and compared */
proctype check_best_bid_update_short_form_message() {
  BestBidUpdateShortFormMessage best_bid_update_short_form_message_sent;
  BestBidUpdateShortFormMessage best_bid_update_short_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_best_bid_update_short_form_message(best_bid_update_short_form_message_sent, 0)
  :: pattern == 1 -> fill_best_bid_update_short_form_message(best_bid_update_short_form_message_sent, 32)
  :: pattern == 2 -> fill_best_bid_update_short_form_message(best_bid_update_short_form_message_sent, 255)
  :: else -> ramp_best_bid_update_short_form_message(best_bid_update_short_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_best_bid_update_short_form_message(best_bid_update_short_form_message_sent);
    assert(at == 25);
    at = 0;
    decode_best_bid_update_short_form_message(best_bid_update_short_form_message_got);
    assert(at == 25);
    equal_best_bid_update_short_form_message(best_bid_update_short_form_message_got, best_bid_update_short_form_message_sent)
  }
}

/* Best Ask Update Short Form Message: encoded, read back, and compared */
proctype check_best_ask_update_short_form_message() {
  BestAskUpdateShortFormMessage best_ask_update_short_form_message_sent;
  BestAskUpdateShortFormMessage best_ask_update_short_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_best_ask_update_short_form_message(best_ask_update_short_form_message_sent, 0)
  :: pattern == 1 -> fill_best_ask_update_short_form_message(best_ask_update_short_form_message_sent, 32)
  :: pattern == 2 -> fill_best_ask_update_short_form_message(best_ask_update_short_form_message_sent, 255)
  :: else -> ramp_best_ask_update_short_form_message(best_ask_update_short_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_best_ask_update_short_form_message(best_ask_update_short_form_message_sent);
    assert(at == 25);
    at = 0;
    decode_best_ask_update_short_form_message(best_ask_update_short_form_message_got);
    assert(at == 25);
    equal_best_ask_update_short_form_message(best_ask_update_short_form_message_got, best_ask_update_short_form_message_sent)
  }
}

/* Best Bid Update Long Form Message: encoded, read back, and compared */
proctype check_best_bid_update_long_form_message() {
  BestBidUpdateLongFormMessage best_bid_update_long_form_message_sent;
  BestBidUpdateLongFormMessage best_bid_update_long_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_best_bid_update_long_form_message(best_bid_update_long_form_message_sent, 0)
  :: pattern == 1 -> fill_best_bid_update_long_form_message(best_bid_update_long_form_message_sent, 32)
  :: pattern == 2 -> fill_best_bid_update_long_form_message(best_bid_update_long_form_message_sent, 255)
  :: else -> ramp_best_bid_update_long_form_message(best_bid_update_long_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_best_bid_update_long_form_message(best_bid_update_long_form_message_sent);
    assert(at == 35);
    at = 0;
    decode_best_bid_update_long_form_message(best_bid_update_long_form_message_got);
    assert(at == 35);
    equal_best_bid_update_long_form_message(best_bid_update_long_form_message_got, best_bid_update_long_form_message_sent)
  }
}

/* Best Ask Update Long Form Message: encoded, read back, and compared */
proctype check_best_ask_update_long_form_message() {
  BestAskUpdateLongFormMessage best_ask_update_long_form_message_sent;
  BestAskUpdateLongFormMessage best_ask_update_long_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_best_ask_update_long_form_message(best_ask_update_long_form_message_sent, 0)
  :: pattern == 1 -> fill_best_ask_update_long_form_message(best_ask_update_long_form_message_sent, 32)
  :: pattern == 2 -> fill_best_ask_update_long_form_message(best_ask_update_long_form_message_sent, 255)
  :: else -> ramp_best_ask_update_long_form_message(best_ask_update_long_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_best_ask_update_long_form_message(best_ask_update_long_form_message_sent);
    assert(at == 35);
    at = 0;
    decode_best_ask_update_long_form_message(best_ask_update_long_form_message_got);
    assert(at == 35);
    equal_best_ask_update_long_form_message(best_ask_update_long_form_message_got, best_ask_update_long_form_message_sent)
  }
}

/* End Of Replay Sequence Message: encoded, read back, and compared */
proctype check_end_of_replay_sequence_message() {
  EndOfReplaySequenceMessage end_of_replay_sequence_message_sent;
  EndOfReplaySequenceMessage end_of_replay_sequence_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_replay_sequence_message(end_of_replay_sequence_message_sent, 0)
  :: pattern == 1 -> fill_end_of_replay_sequence_message(end_of_replay_sequence_message_sent, 32)
  :: pattern == 2 -> fill_end_of_replay_sequence_message(end_of_replay_sequence_message_sent, 255)
  :: else -> ramp_end_of_replay_sequence_message(end_of_replay_sequence_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_replay_sequence_message(end_of_replay_sequence_message_sent);
    assert(at == 20);
    at = 0;
    decode_end_of_replay_sequence_message(end_of_replay_sequence_message_got);
    assert(at == 20);
    equal_end_of_replay_sequence_message(end_of_replay_sequence_message_got, end_of_replay_sequence_message_sent)
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
  :: run check_best_bid_and_ask_update_short_form_message()
  :: run check_best_bid_and_ask_update_long_form_message()
  :: run check_best_bid_update_short_form_message()
  :: run check_best_ask_update_short_form_message()
  :: run check_best_bid_update_long_form_message()
  :: run check_best_ask_update_long_form_message()
  :: run check_end_of_replay_sequence_message()
  fi
}
