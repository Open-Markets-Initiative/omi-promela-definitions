/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Itch To Trade Options
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
#define WIRE 56

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

/* ---- System Event Message: 9 bytes ------------------------------------------- */

/* The system event message type is used to signal a market or data feed handler event. */
typedef SystemEventMessage {
  byte tracking_number[2];
  byte timestamp[6];
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
  :: system_event_message_at < 6 -> system_event_message_record.timestamp[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
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
  :: system_event_message_at < 6 -> system_event_message_record.timestamp[system_event_message_at] = (system_event_message_base + 2 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 8 + 1) % 256;
  skip
}

/* System Event Message to the wire, 9 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> wire[at] = system_event_message_record.tracking_number[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 6 -> wire[at] = system_event_message_record.timestamp[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  skip
}

/* System Event Message off the wire, 9 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.tracking_number[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 6 -> system_event_message_record.timestamp[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
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
  :: system_event_message_at < 6 -> assert(system_event_message_read.timestamp[system_event_message_at] == system_event_message_written.timestamp[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  skip
}

/* ---- Options Directory Message: 43 bytes ------------------------------------- */

/* At the start of each trading day, NASDAQ disseminates options symbol directory messages for all active options symbols in the NASDAQ option system. */
typedef OptionsDirectoryMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte option_id[4];
  byte security_symbol[6];
  byte expiration_year;
  byte expiration_month;
  byte expiration_date;
  byte explicit_strike_price[4];
  byte option_type;
  byte source;
  byte underlying_symbol[13];
  byte options_closing_type;
  byte tradable;
  byte mpv
};

int options_directory_message_at;

/* every byte of Options Directory Message set to one value */
inline fill_options_directory_message(options_directory_message_record, options_directory_message_value) {
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 2 -> options_directory_message_record.tracking_number[options_directory_message_at] = options_directory_message_value; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 6 -> options_directory_message_record.timestamp[options_directory_message_at] = options_directory_message_value; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 4 -> options_directory_message_record.option_id[options_directory_message_at] = options_directory_message_value; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 6 -> options_directory_message_record.security_symbol[options_directory_message_at] = options_directory_message_value; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_record.expiration_year = options_directory_message_value;
  options_directory_message_record.expiration_month = options_directory_message_value;
  options_directory_message_record.expiration_date = options_directory_message_value;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 4 -> options_directory_message_record.explicit_strike_price[options_directory_message_at] = options_directory_message_value; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_record.option_type = options_directory_message_value;
  options_directory_message_record.source = options_directory_message_value;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 13 -> options_directory_message_record.underlying_symbol[options_directory_message_at] = options_directory_message_value; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_record.options_closing_type = options_directory_message_value;
  options_directory_message_record.tradable = options_directory_message_value;
  options_directory_message_record.mpv = options_directory_message_value;
  skip
}

/* each byte of Options Directory Message set to where it lies, so a field read out of place says so */
inline ramp_options_directory_message(options_directory_message_record, options_directory_message_base) {
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 2 -> options_directory_message_record.tracking_number[options_directory_message_at] = (options_directory_message_base + 0 + options_directory_message_at + 1) % 256; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 6 -> options_directory_message_record.timestamp[options_directory_message_at] = (options_directory_message_base + 2 + options_directory_message_at + 1) % 256; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 4 -> options_directory_message_record.option_id[options_directory_message_at] = (options_directory_message_base + 8 + options_directory_message_at + 1) % 256; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 6 -> options_directory_message_record.security_symbol[options_directory_message_at] = (options_directory_message_base + 12 + options_directory_message_at + 1) % 256; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_record.expiration_year = (options_directory_message_base + 18 + 1) % 256;
  options_directory_message_record.expiration_month = (options_directory_message_base + 19 + 1) % 256;
  options_directory_message_record.expiration_date = (options_directory_message_base + 20 + 1) % 256;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 4 -> options_directory_message_record.explicit_strike_price[options_directory_message_at] = (options_directory_message_base + 21 + options_directory_message_at + 1) % 256; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_record.option_type = (options_directory_message_base + 25 + 1) % 256;
  options_directory_message_record.source = (options_directory_message_base + 26 + 1) % 256;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 13 -> options_directory_message_record.underlying_symbol[options_directory_message_at] = (options_directory_message_base + 27 + options_directory_message_at + 1) % 256; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_record.options_closing_type = (options_directory_message_base + 40 + 1) % 256;
  options_directory_message_record.tradable = (options_directory_message_base + 41 + 1) % 256;
  options_directory_message_record.mpv = (options_directory_message_base + 42 + 1) % 256;
  skip
}

/* Options Directory Message to the wire, 43 bytes from where the cursor stands */
inline encode_options_directory_message(options_directory_message_record) {
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 2 -> wire[at] = options_directory_message_record.tracking_number[options_directory_message_at]; at = at + 1; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 6 -> wire[at] = options_directory_message_record.timestamp[options_directory_message_at]; at = at + 1; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 4 -> wire[at] = options_directory_message_record.option_id[options_directory_message_at]; at = at + 1; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 6 -> wire[at] = options_directory_message_record.security_symbol[options_directory_message_at]; at = at + 1; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = options_directory_message_record.expiration_year; at = at + 1;
  wire[at] = options_directory_message_record.expiration_month; at = at + 1;
  wire[at] = options_directory_message_record.expiration_date; at = at + 1;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 4 -> wire[at] = options_directory_message_record.explicit_strike_price[options_directory_message_at]; at = at + 1; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = options_directory_message_record.option_type; at = at + 1;
  wire[at] = options_directory_message_record.source; at = at + 1;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 13 -> wire[at] = options_directory_message_record.underlying_symbol[options_directory_message_at]; at = at + 1; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = options_directory_message_record.options_closing_type; at = at + 1;
  wire[at] = options_directory_message_record.tradable; at = at + 1;
  wire[at] = options_directory_message_record.mpv; at = at + 1;
  skip
}

/* Options Directory Message off the wire, 43 bytes from where the cursor stands */
inline decode_options_directory_message(options_directory_message_record) {
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 2 -> options_directory_message_record.tracking_number[options_directory_message_at] = wire[at]; at = at + 1; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 6 -> options_directory_message_record.timestamp[options_directory_message_at] = wire[at]; at = at + 1; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 4 -> options_directory_message_record.option_id[options_directory_message_at] = wire[at]; at = at + 1; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 6 -> options_directory_message_record.security_symbol[options_directory_message_at] = wire[at]; at = at + 1; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_record.expiration_year = wire[at]; at = at + 1;
  options_directory_message_record.expiration_month = wire[at]; at = at + 1;
  options_directory_message_record.expiration_date = wire[at]; at = at + 1;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 4 -> options_directory_message_record.explicit_strike_price[options_directory_message_at] = wire[at]; at = at + 1; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_record.option_type = wire[at]; at = at + 1;
  options_directory_message_record.source = wire[at]; at = at + 1;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 13 -> options_directory_message_record.underlying_symbol[options_directory_message_at] = wire[at]; at = at + 1; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_record.options_closing_type = wire[at]; at = at + 1;
  options_directory_message_record.tradable = wire[at]; at = at + 1;
  options_directory_message_record.mpv = wire[at]; at = at + 1;
  skip
}

/* what was read of Options Directory Message is what was written, byte for byte */
inline equal_options_directory_message(options_directory_message_read, options_directory_message_written) {
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 2 -> assert(options_directory_message_read.tracking_number[options_directory_message_at] == options_directory_message_written.tracking_number[options_directory_message_at]); options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 6 -> assert(options_directory_message_read.timestamp[options_directory_message_at] == options_directory_message_written.timestamp[options_directory_message_at]); options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 4 -> assert(options_directory_message_read.option_id[options_directory_message_at] == options_directory_message_written.option_id[options_directory_message_at]); options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 6 -> assert(options_directory_message_read.security_symbol[options_directory_message_at] == options_directory_message_written.security_symbol[options_directory_message_at]); options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  assert(options_directory_message_read.expiration_year == options_directory_message_written.expiration_year);
  assert(options_directory_message_read.expiration_month == options_directory_message_written.expiration_month);
  assert(options_directory_message_read.expiration_date == options_directory_message_written.expiration_date);
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 4 -> assert(options_directory_message_read.explicit_strike_price[options_directory_message_at] == options_directory_message_written.explicit_strike_price[options_directory_message_at]); options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  assert(options_directory_message_read.option_type == options_directory_message_written.option_type);
  assert(options_directory_message_read.source == options_directory_message_written.source);
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 13 -> assert(options_directory_message_read.underlying_symbol[options_directory_message_at] == options_directory_message_written.underlying_symbol[options_directory_message_at]); options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  assert(options_directory_message_read.options_closing_type == options_directory_message_written.options_closing_type);
  assert(options_directory_message_read.tradable == options_directory_message_written.tradable);
  assert(options_directory_message_read.mpv == options_directory_message_written.mpv);
  skip
}

/* ---- Trading Action Message: 13 bytes ---------------------------------------- */

/* After the start of system hours, NASDAQ will use the Trading Action message to relay changes in trading status for an individual option. Messages will be sent when an option is halted, is released for quotation, released for trading, or temporarily suspended for trading on the buy or sell side. */
typedef TradingActionMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte option_id[4];
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
  :: trading_action_message_at < 6 -> trading_action_message_record.timestamp[trading_action_message_at] = trading_action_message_value; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> trading_action_message_record.option_id[trading_action_message_at] = trading_action_message_value; trading_action_message_at = trading_action_message_at + 1
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
  :: trading_action_message_at < 6 -> trading_action_message_record.timestamp[trading_action_message_at] = (trading_action_message_base + 2 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> trading_action_message_record.option_id[trading_action_message_at] = (trading_action_message_base + 8 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_record.current_trading_state = (trading_action_message_base + 12 + 1) % 256;
  skip
}

/* Trading Action Message to the wire, 13 bytes from where the cursor stands */
inline encode_trading_action_message(trading_action_message_record) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 2 -> wire[at] = trading_action_message_record.tracking_number[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 6 -> wire[at] = trading_action_message_record.timestamp[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> wire[at] = trading_action_message_record.option_id[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_action_message_record.current_trading_state; at = at + 1;
  skip
}

/* Trading Action Message off the wire, 13 bytes from where the cursor stands */
inline decode_trading_action_message(trading_action_message_record) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 2 -> trading_action_message_record.tracking_number[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 6 -> trading_action_message_record.timestamp[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> trading_action_message_record.option_id[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
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
  :: trading_action_message_at < 6 -> assert(trading_action_message_read.timestamp[trading_action_message_at] == trading_action_message_written.timestamp[trading_action_message_at]); trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> assert(trading_action_message_read.option_id[trading_action_message_at] == trading_action_message_written.option_id[trading_action_message_at]); trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  assert(trading_action_message_read.current_trading_state == trading_action_message_written.current_trading_state);
  skip
}

/* ---- Security Open Message: 13 bytes ----------------------------------------- */

/* NASDAQ plans to disseminate the Option Open Message for each option as soon as the opening is completed. Upon receipt of the open state message, firms should be advised that the option denoted in the message is now available for auto execution within the NASDAQ Options Market System. Upon receipt of the closed state message, firms should be advised that the option is no longer eligible for auto-execution within the NASDAQ Options Market System. */
typedef SecurityOpenMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte option_id[4];
  byte open_state
};

int security_open_message_at;

/* every byte of Security Open Message set to one value */
inline fill_security_open_message(security_open_message_record, security_open_message_value) {
  security_open_message_at = 0;
  do
  :: security_open_message_at < 2 -> security_open_message_record.tracking_number[security_open_message_at] = security_open_message_value; security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  security_open_message_at = 0;
  do
  :: security_open_message_at < 6 -> security_open_message_record.timestamp[security_open_message_at] = security_open_message_value; security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  security_open_message_at = 0;
  do
  :: security_open_message_at < 4 -> security_open_message_record.option_id[security_open_message_at] = security_open_message_value; security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  security_open_message_record.open_state = security_open_message_value;
  skip
}

/* each byte of Security Open Message set to where it lies, so a field read out of place says so */
inline ramp_security_open_message(security_open_message_record, security_open_message_base) {
  security_open_message_at = 0;
  do
  :: security_open_message_at < 2 -> security_open_message_record.tracking_number[security_open_message_at] = (security_open_message_base + 0 + security_open_message_at + 1) % 256; security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  security_open_message_at = 0;
  do
  :: security_open_message_at < 6 -> security_open_message_record.timestamp[security_open_message_at] = (security_open_message_base + 2 + security_open_message_at + 1) % 256; security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  security_open_message_at = 0;
  do
  :: security_open_message_at < 4 -> security_open_message_record.option_id[security_open_message_at] = (security_open_message_base + 8 + security_open_message_at + 1) % 256; security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  security_open_message_record.open_state = (security_open_message_base + 12 + 1) % 256;
  skip
}

/* Security Open Message to the wire, 13 bytes from where the cursor stands */
inline encode_security_open_message(security_open_message_record) {
  security_open_message_at = 0;
  do
  :: security_open_message_at < 2 -> wire[at] = security_open_message_record.tracking_number[security_open_message_at]; at = at + 1; security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  security_open_message_at = 0;
  do
  :: security_open_message_at < 6 -> wire[at] = security_open_message_record.timestamp[security_open_message_at]; at = at + 1; security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  security_open_message_at = 0;
  do
  :: security_open_message_at < 4 -> wire[at] = security_open_message_record.option_id[security_open_message_at]; at = at + 1; security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  wire[at] = security_open_message_record.open_state; at = at + 1;
  skip
}

/* Security Open Message off the wire, 13 bytes from where the cursor stands */
inline decode_security_open_message(security_open_message_record) {
  security_open_message_at = 0;
  do
  :: security_open_message_at < 2 -> security_open_message_record.tracking_number[security_open_message_at] = wire[at]; at = at + 1; security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  security_open_message_at = 0;
  do
  :: security_open_message_at < 6 -> security_open_message_record.timestamp[security_open_message_at] = wire[at]; at = at + 1; security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  security_open_message_at = 0;
  do
  :: security_open_message_at < 4 -> security_open_message_record.option_id[security_open_message_at] = wire[at]; at = at + 1; security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  security_open_message_record.open_state = wire[at]; at = at + 1;
  skip
}

/* what was read of Security Open Message is what was written, byte for byte */
inline equal_security_open_message(security_open_message_read, security_open_message_written) {
  security_open_message_at = 0;
  do
  :: security_open_message_at < 2 -> assert(security_open_message_read.tracking_number[security_open_message_at] == security_open_message_written.tracking_number[security_open_message_at]); security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  security_open_message_at = 0;
  do
  :: security_open_message_at < 6 -> assert(security_open_message_read.timestamp[security_open_message_at] == security_open_message_written.timestamp[security_open_message_at]); security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  security_open_message_at = 0;
  do
  :: security_open_message_at < 4 -> assert(security_open_message_read.option_id[security_open_message_at] == security_open_message_written.option_id[security_open_message_at]); security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  assert(security_open_message_read.open_state == security_open_message_written.open_state);
  skip
}

/* ---- Add Order Message Short Message Form: 25 bytes -------------------------- */

/* For bandwidth efficiency reasons, this message can be published in either short or long format. */
typedef AddOrderMessageShortMessageForm {
  byte tracking_number[2];
  byte timestamp[6];
  byte order_reference_number[8];
  byte market_side;
  byte option_id[4];
  byte price_short[2];
  byte volume_short[2]
};

int add_order_message_short_message_form_at;

/* every byte of Add Order Message Short Message Form set to one value */
inline fill_add_order_message_short_message_form(add_order_message_short_message_form_record, add_order_message_short_message_form_value) {
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 2 -> add_order_message_short_message_form_record.tracking_number[add_order_message_short_message_form_at] = add_order_message_short_message_form_value; add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 6 -> add_order_message_short_message_form_record.timestamp[add_order_message_short_message_form_at] = add_order_message_short_message_form_value; add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 8 -> add_order_message_short_message_form_record.order_reference_number[add_order_message_short_message_form_at] = add_order_message_short_message_form_value; add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  add_order_message_short_message_form_record.market_side = add_order_message_short_message_form_value;
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 4 -> add_order_message_short_message_form_record.option_id[add_order_message_short_message_form_at] = add_order_message_short_message_form_value; add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 2 -> add_order_message_short_message_form_record.price_short[add_order_message_short_message_form_at] = add_order_message_short_message_form_value; add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 2 -> add_order_message_short_message_form_record.volume_short[add_order_message_short_message_form_at] = add_order_message_short_message_form_value; add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Message Short Message Form set to where it lies, so a field read out of place says so */
inline ramp_add_order_message_short_message_form(add_order_message_short_message_form_record, add_order_message_short_message_form_base) {
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 2 -> add_order_message_short_message_form_record.tracking_number[add_order_message_short_message_form_at] = (add_order_message_short_message_form_base + 0 + add_order_message_short_message_form_at + 1) % 256; add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 6 -> add_order_message_short_message_form_record.timestamp[add_order_message_short_message_form_at] = (add_order_message_short_message_form_base + 2 + add_order_message_short_message_form_at + 1) % 256; add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 8 -> add_order_message_short_message_form_record.order_reference_number[add_order_message_short_message_form_at] = (add_order_message_short_message_form_base + 8 + add_order_message_short_message_form_at + 1) % 256; add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  add_order_message_short_message_form_record.market_side = (add_order_message_short_message_form_base + 16 + 1) % 256;
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 4 -> add_order_message_short_message_form_record.option_id[add_order_message_short_message_form_at] = (add_order_message_short_message_form_base + 17 + add_order_message_short_message_form_at + 1) % 256; add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 2 -> add_order_message_short_message_form_record.price_short[add_order_message_short_message_form_at] = (add_order_message_short_message_form_base + 21 + add_order_message_short_message_form_at + 1) % 256; add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 2 -> add_order_message_short_message_form_record.volume_short[add_order_message_short_message_form_at] = (add_order_message_short_message_form_base + 23 + add_order_message_short_message_form_at + 1) % 256; add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message Short Message Form to the wire, 25 bytes from where the cursor stands */
inline encode_add_order_message_short_message_form(add_order_message_short_message_form_record) {
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 2 -> wire[at] = add_order_message_short_message_form_record.tracking_number[add_order_message_short_message_form_at]; at = at + 1; add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 6 -> wire[at] = add_order_message_short_message_form_record.timestamp[add_order_message_short_message_form_at]; at = at + 1; add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 8 -> wire[at] = add_order_message_short_message_form_record.order_reference_number[add_order_message_short_message_form_at]; at = at + 1; add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_short_message_form_record.market_side; at = at + 1;
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 4 -> wire[at] = add_order_message_short_message_form_record.option_id[add_order_message_short_message_form_at]; at = at + 1; add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 2 -> wire[at] = add_order_message_short_message_form_record.price_short[add_order_message_short_message_form_at]; at = at + 1; add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 2 -> wire[at] = add_order_message_short_message_form_record.volume_short[add_order_message_short_message_form_at]; at = at + 1; add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message Short Message Form off the wire, 25 bytes from where the cursor stands */
inline decode_add_order_message_short_message_form(add_order_message_short_message_form_record) {
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 2 -> add_order_message_short_message_form_record.tracking_number[add_order_message_short_message_form_at] = wire[at]; at = at + 1; add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 6 -> add_order_message_short_message_form_record.timestamp[add_order_message_short_message_form_at] = wire[at]; at = at + 1; add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 8 -> add_order_message_short_message_form_record.order_reference_number[add_order_message_short_message_form_at] = wire[at]; at = at + 1; add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  add_order_message_short_message_form_record.market_side = wire[at]; at = at + 1;
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 4 -> add_order_message_short_message_form_record.option_id[add_order_message_short_message_form_at] = wire[at]; at = at + 1; add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 2 -> add_order_message_short_message_form_record.price_short[add_order_message_short_message_form_at] = wire[at]; at = at + 1; add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 2 -> add_order_message_short_message_form_record.volume_short[add_order_message_short_message_form_at] = wire[at]; at = at + 1; add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Message Short Message Form is what was written, byte for byte */
inline equal_add_order_message_short_message_form(add_order_message_short_message_form_read, add_order_message_short_message_form_written) {
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 2 -> assert(add_order_message_short_message_form_read.tracking_number[add_order_message_short_message_form_at] == add_order_message_short_message_form_written.tracking_number[add_order_message_short_message_form_at]); add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 6 -> assert(add_order_message_short_message_form_read.timestamp[add_order_message_short_message_form_at] == add_order_message_short_message_form_written.timestamp[add_order_message_short_message_form_at]); add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 8 -> assert(add_order_message_short_message_form_read.order_reference_number[add_order_message_short_message_form_at] == add_order_message_short_message_form_written.order_reference_number[add_order_message_short_message_form_at]); add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  assert(add_order_message_short_message_form_read.market_side == add_order_message_short_message_form_written.market_side);
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 4 -> assert(add_order_message_short_message_form_read.option_id[add_order_message_short_message_form_at] == add_order_message_short_message_form_written.option_id[add_order_message_short_message_form_at]); add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 2 -> assert(add_order_message_short_message_form_read.price_short[add_order_message_short_message_form_at] == add_order_message_short_message_form_written.price_short[add_order_message_short_message_form_at]); add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  add_order_message_short_message_form_at = 0;
  do
  :: add_order_message_short_message_form_at < 2 -> assert(add_order_message_short_message_form_read.volume_short[add_order_message_short_message_form_at] == add_order_message_short_message_form_written.volume_short[add_order_message_short_message_form_at]); add_order_message_short_message_form_at = add_order_message_short_message_form_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order Message Long Form Message: 29 bytes --------------------------- */

/* For bandwidth efficiency reasons, this message can be published in either short or long format. */
typedef AddOrderMessageLongFormMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte order_reference_number[8];
  byte market_side;
  byte option_id[4];
  byte price_long[4];
  byte volume_long[4]
};

int add_order_message_long_form_message_at;

/* every byte of Add Order Message Long Form Message set to one value */
inline fill_add_order_message_long_form_message(add_order_message_long_form_message_record, add_order_message_long_form_message_value) {
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 2 -> add_order_message_long_form_message_record.tracking_number[add_order_message_long_form_message_at] = add_order_message_long_form_message_value; add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 6 -> add_order_message_long_form_message_record.timestamp[add_order_message_long_form_message_at] = add_order_message_long_form_message_value; add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 8 -> add_order_message_long_form_message_record.order_reference_number[add_order_message_long_form_message_at] = add_order_message_long_form_message_value; add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  add_order_message_long_form_message_record.market_side = add_order_message_long_form_message_value;
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 4 -> add_order_message_long_form_message_record.option_id[add_order_message_long_form_message_at] = add_order_message_long_form_message_value; add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 4 -> add_order_message_long_form_message_record.price_long[add_order_message_long_form_message_at] = add_order_message_long_form_message_value; add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 4 -> add_order_message_long_form_message_record.volume_long[add_order_message_long_form_message_at] = add_order_message_long_form_message_value; add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Message Long Form Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_message_long_form_message(add_order_message_long_form_message_record, add_order_message_long_form_message_base) {
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 2 -> add_order_message_long_form_message_record.tracking_number[add_order_message_long_form_message_at] = (add_order_message_long_form_message_base + 0 + add_order_message_long_form_message_at + 1) % 256; add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 6 -> add_order_message_long_form_message_record.timestamp[add_order_message_long_form_message_at] = (add_order_message_long_form_message_base + 2 + add_order_message_long_form_message_at + 1) % 256; add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 8 -> add_order_message_long_form_message_record.order_reference_number[add_order_message_long_form_message_at] = (add_order_message_long_form_message_base + 8 + add_order_message_long_form_message_at + 1) % 256; add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  add_order_message_long_form_message_record.market_side = (add_order_message_long_form_message_base + 16 + 1) % 256;
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 4 -> add_order_message_long_form_message_record.option_id[add_order_message_long_form_message_at] = (add_order_message_long_form_message_base + 17 + add_order_message_long_form_message_at + 1) % 256; add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 4 -> add_order_message_long_form_message_record.price_long[add_order_message_long_form_message_at] = (add_order_message_long_form_message_base + 21 + add_order_message_long_form_message_at + 1) % 256; add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 4 -> add_order_message_long_form_message_record.volume_long[add_order_message_long_form_message_at] = (add_order_message_long_form_message_base + 25 + add_order_message_long_form_message_at + 1) % 256; add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message Long Form Message to the wire, 29 bytes from where the cursor stands */
inline encode_add_order_message_long_form_message(add_order_message_long_form_message_record) {
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 2 -> wire[at] = add_order_message_long_form_message_record.tracking_number[add_order_message_long_form_message_at]; at = at + 1; add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 6 -> wire[at] = add_order_message_long_form_message_record.timestamp[add_order_message_long_form_message_at]; at = at + 1; add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 8 -> wire[at] = add_order_message_long_form_message_record.order_reference_number[add_order_message_long_form_message_at]; at = at + 1; add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_long_form_message_record.market_side; at = at + 1;
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 4 -> wire[at] = add_order_message_long_form_message_record.option_id[add_order_message_long_form_message_at]; at = at + 1; add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 4 -> wire[at] = add_order_message_long_form_message_record.price_long[add_order_message_long_form_message_at]; at = at + 1; add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 4 -> wire[at] = add_order_message_long_form_message_record.volume_long[add_order_message_long_form_message_at]; at = at + 1; add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message Long Form Message off the wire, 29 bytes from where the cursor stands */
inline decode_add_order_message_long_form_message(add_order_message_long_form_message_record) {
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 2 -> add_order_message_long_form_message_record.tracking_number[add_order_message_long_form_message_at] = wire[at]; at = at + 1; add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 6 -> add_order_message_long_form_message_record.timestamp[add_order_message_long_form_message_at] = wire[at]; at = at + 1; add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 8 -> add_order_message_long_form_message_record.order_reference_number[add_order_message_long_form_message_at] = wire[at]; at = at + 1; add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  add_order_message_long_form_message_record.market_side = wire[at]; at = at + 1;
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 4 -> add_order_message_long_form_message_record.option_id[add_order_message_long_form_message_at] = wire[at]; at = at + 1; add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 4 -> add_order_message_long_form_message_record.price_long[add_order_message_long_form_message_at] = wire[at]; at = at + 1; add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 4 -> add_order_message_long_form_message_record.volume_long[add_order_message_long_form_message_at] = wire[at]; at = at + 1; add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Message Long Form Message is what was written, byte for byte */
inline equal_add_order_message_long_form_message(add_order_message_long_form_message_read, add_order_message_long_form_message_written) {
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 2 -> assert(add_order_message_long_form_message_read.tracking_number[add_order_message_long_form_message_at] == add_order_message_long_form_message_written.tracking_number[add_order_message_long_form_message_at]); add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 6 -> assert(add_order_message_long_form_message_read.timestamp[add_order_message_long_form_message_at] == add_order_message_long_form_message_written.timestamp[add_order_message_long_form_message_at]); add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 8 -> assert(add_order_message_long_form_message_read.order_reference_number[add_order_message_long_form_message_at] == add_order_message_long_form_message_written.order_reference_number[add_order_message_long_form_message_at]); add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  assert(add_order_message_long_form_message_read.market_side == add_order_message_long_form_message_written.market_side);
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 4 -> assert(add_order_message_long_form_message_read.option_id[add_order_message_long_form_message_at] == add_order_message_long_form_message_written.option_id[add_order_message_long_form_message_at]); add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 4 -> assert(add_order_message_long_form_message_read.price_long[add_order_message_long_form_message_at] == add_order_message_long_form_message_written.price_long[add_order_message_long_form_message_at]); add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  add_order_message_long_form_message_at = 0;
  do
  :: add_order_message_long_form_message_at < 4 -> assert(add_order_message_long_form_message_read.volume_long[add_order_message_long_form_message_at] == add_order_message_long_form_message_written.volume_long[add_order_message_long_form_message_at]); add_order_message_long_form_message_at = add_order_message_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Quote Message Short Form Message: 36 bytes -------------------------- */

/* For bandwidth efficiency reasons, this message can be published in either short or long format. */
typedef AddQuoteMessageShortFormMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte bid_reference_number[8];
  byte ask_reference_number[8];
  byte option_id[4];
  byte bid_price_short[2];
  byte bid_size_short[2];
  byte ask_price_short[2];
  byte ask_size_short[2]
};

int add_quote_message_short_form_message_at;

/* every byte of Add Quote Message Short Form Message set to one value */
inline fill_add_quote_message_short_form_message(add_quote_message_short_form_message_record, add_quote_message_short_form_message_value) {
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 2 -> add_quote_message_short_form_message_record.tracking_number[add_quote_message_short_form_message_at] = add_quote_message_short_form_message_value; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 6 -> add_quote_message_short_form_message_record.timestamp[add_quote_message_short_form_message_at] = add_quote_message_short_form_message_value; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 8 -> add_quote_message_short_form_message_record.bid_reference_number[add_quote_message_short_form_message_at] = add_quote_message_short_form_message_value; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 8 -> add_quote_message_short_form_message_record.ask_reference_number[add_quote_message_short_form_message_at] = add_quote_message_short_form_message_value; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 4 -> add_quote_message_short_form_message_record.option_id[add_quote_message_short_form_message_at] = add_quote_message_short_form_message_value; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 2 -> add_quote_message_short_form_message_record.bid_price_short[add_quote_message_short_form_message_at] = add_quote_message_short_form_message_value; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 2 -> add_quote_message_short_form_message_record.bid_size_short[add_quote_message_short_form_message_at] = add_quote_message_short_form_message_value; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 2 -> add_quote_message_short_form_message_record.ask_price_short[add_quote_message_short_form_message_at] = add_quote_message_short_form_message_value; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 2 -> add_quote_message_short_form_message_record.ask_size_short[add_quote_message_short_form_message_at] = add_quote_message_short_form_message_value; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Quote Message Short Form Message set to where it lies, so a field read out of place says so */
inline ramp_add_quote_message_short_form_message(add_quote_message_short_form_message_record, add_quote_message_short_form_message_base) {
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 2 -> add_quote_message_short_form_message_record.tracking_number[add_quote_message_short_form_message_at] = (add_quote_message_short_form_message_base + 0 + add_quote_message_short_form_message_at + 1) % 256; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 6 -> add_quote_message_short_form_message_record.timestamp[add_quote_message_short_form_message_at] = (add_quote_message_short_form_message_base + 2 + add_quote_message_short_form_message_at + 1) % 256; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 8 -> add_quote_message_short_form_message_record.bid_reference_number[add_quote_message_short_form_message_at] = (add_quote_message_short_form_message_base + 8 + add_quote_message_short_form_message_at + 1) % 256; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 8 -> add_quote_message_short_form_message_record.ask_reference_number[add_quote_message_short_form_message_at] = (add_quote_message_short_form_message_base + 16 + add_quote_message_short_form_message_at + 1) % 256; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 4 -> add_quote_message_short_form_message_record.option_id[add_quote_message_short_form_message_at] = (add_quote_message_short_form_message_base + 24 + add_quote_message_short_form_message_at + 1) % 256; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 2 -> add_quote_message_short_form_message_record.bid_price_short[add_quote_message_short_form_message_at] = (add_quote_message_short_form_message_base + 28 + add_quote_message_short_form_message_at + 1) % 256; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 2 -> add_quote_message_short_form_message_record.bid_size_short[add_quote_message_short_form_message_at] = (add_quote_message_short_form_message_base + 30 + add_quote_message_short_form_message_at + 1) % 256; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 2 -> add_quote_message_short_form_message_record.ask_price_short[add_quote_message_short_form_message_at] = (add_quote_message_short_form_message_base + 32 + add_quote_message_short_form_message_at + 1) % 256; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 2 -> add_quote_message_short_form_message_record.ask_size_short[add_quote_message_short_form_message_at] = (add_quote_message_short_form_message_base + 34 + add_quote_message_short_form_message_at + 1) % 256; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Quote Message Short Form Message to the wire, 36 bytes from where the cursor stands */
inline encode_add_quote_message_short_form_message(add_quote_message_short_form_message_record) {
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 2 -> wire[at] = add_quote_message_short_form_message_record.tracking_number[add_quote_message_short_form_message_at]; at = at + 1; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 6 -> wire[at] = add_quote_message_short_form_message_record.timestamp[add_quote_message_short_form_message_at]; at = at + 1; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 8 -> wire[at] = add_quote_message_short_form_message_record.bid_reference_number[add_quote_message_short_form_message_at]; at = at + 1; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 8 -> wire[at] = add_quote_message_short_form_message_record.ask_reference_number[add_quote_message_short_form_message_at]; at = at + 1; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 4 -> wire[at] = add_quote_message_short_form_message_record.option_id[add_quote_message_short_form_message_at]; at = at + 1; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 2 -> wire[at] = add_quote_message_short_form_message_record.bid_price_short[add_quote_message_short_form_message_at]; at = at + 1; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 2 -> wire[at] = add_quote_message_short_form_message_record.bid_size_short[add_quote_message_short_form_message_at]; at = at + 1; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 2 -> wire[at] = add_quote_message_short_form_message_record.ask_price_short[add_quote_message_short_form_message_at]; at = at + 1; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 2 -> wire[at] = add_quote_message_short_form_message_record.ask_size_short[add_quote_message_short_form_message_at]; at = at + 1; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Quote Message Short Form Message off the wire, 36 bytes from where the cursor stands */
inline decode_add_quote_message_short_form_message(add_quote_message_short_form_message_record) {
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 2 -> add_quote_message_short_form_message_record.tracking_number[add_quote_message_short_form_message_at] = wire[at]; at = at + 1; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 6 -> add_quote_message_short_form_message_record.timestamp[add_quote_message_short_form_message_at] = wire[at]; at = at + 1; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 8 -> add_quote_message_short_form_message_record.bid_reference_number[add_quote_message_short_form_message_at] = wire[at]; at = at + 1; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 8 -> add_quote_message_short_form_message_record.ask_reference_number[add_quote_message_short_form_message_at] = wire[at]; at = at + 1; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 4 -> add_quote_message_short_form_message_record.option_id[add_quote_message_short_form_message_at] = wire[at]; at = at + 1; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 2 -> add_quote_message_short_form_message_record.bid_price_short[add_quote_message_short_form_message_at] = wire[at]; at = at + 1; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 2 -> add_quote_message_short_form_message_record.bid_size_short[add_quote_message_short_form_message_at] = wire[at]; at = at + 1; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 2 -> add_quote_message_short_form_message_record.ask_price_short[add_quote_message_short_form_message_at] = wire[at]; at = at + 1; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 2 -> add_quote_message_short_form_message_record.ask_size_short[add_quote_message_short_form_message_at] = wire[at]; at = at + 1; add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Quote Message Short Form Message is what was written, byte for byte */
inline equal_add_quote_message_short_form_message(add_quote_message_short_form_message_read, add_quote_message_short_form_message_written) {
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 2 -> assert(add_quote_message_short_form_message_read.tracking_number[add_quote_message_short_form_message_at] == add_quote_message_short_form_message_written.tracking_number[add_quote_message_short_form_message_at]); add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 6 -> assert(add_quote_message_short_form_message_read.timestamp[add_quote_message_short_form_message_at] == add_quote_message_short_form_message_written.timestamp[add_quote_message_short_form_message_at]); add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 8 -> assert(add_quote_message_short_form_message_read.bid_reference_number[add_quote_message_short_form_message_at] == add_quote_message_short_form_message_written.bid_reference_number[add_quote_message_short_form_message_at]); add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 8 -> assert(add_quote_message_short_form_message_read.ask_reference_number[add_quote_message_short_form_message_at] == add_quote_message_short_form_message_written.ask_reference_number[add_quote_message_short_form_message_at]); add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 4 -> assert(add_quote_message_short_form_message_read.option_id[add_quote_message_short_form_message_at] == add_quote_message_short_form_message_written.option_id[add_quote_message_short_form_message_at]); add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 2 -> assert(add_quote_message_short_form_message_read.bid_price_short[add_quote_message_short_form_message_at] == add_quote_message_short_form_message_written.bid_price_short[add_quote_message_short_form_message_at]); add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 2 -> assert(add_quote_message_short_form_message_read.bid_size_short[add_quote_message_short_form_message_at] == add_quote_message_short_form_message_written.bid_size_short[add_quote_message_short_form_message_at]); add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 2 -> assert(add_quote_message_short_form_message_read.ask_price_short[add_quote_message_short_form_message_at] == add_quote_message_short_form_message_written.ask_price_short[add_quote_message_short_form_message_at]); add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_message_at = 0;
  do
  :: add_quote_message_short_form_message_at < 2 -> assert(add_quote_message_short_form_message_read.ask_size_short[add_quote_message_short_form_message_at] == add_quote_message_short_form_message_written.ask_size_short[add_quote_message_short_form_message_at]); add_quote_message_short_form_message_at = add_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Quote Message Long Form Message: 44 bytes --------------------------- */

/* For bandwidth efficiency reasons, this message can be published in either short or long format. */
typedef AddQuoteMessageLongFormMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte bid_reference_number[8];
  byte ask_reference_number[8];
  byte option_id[4];
  byte bid[4];
  byte bid_size_long[4];
  byte ask[4];
  byte ask_size_long[4]
};

int add_quote_message_long_form_message_at;

/* every byte of Add Quote Message Long Form Message set to one value */
inline fill_add_quote_message_long_form_message(add_quote_message_long_form_message_record, add_quote_message_long_form_message_value) {
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 2 -> add_quote_message_long_form_message_record.tracking_number[add_quote_message_long_form_message_at] = add_quote_message_long_form_message_value; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 6 -> add_quote_message_long_form_message_record.timestamp[add_quote_message_long_form_message_at] = add_quote_message_long_form_message_value; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 8 -> add_quote_message_long_form_message_record.bid_reference_number[add_quote_message_long_form_message_at] = add_quote_message_long_form_message_value; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 8 -> add_quote_message_long_form_message_record.ask_reference_number[add_quote_message_long_form_message_at] = add_quote_message_long_form_message_value; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 4 -> add_quote_message_long_form_message_record.option_id[add_quote_message_long_form_message_at] = add_quote_message_long_form_message_value; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 4 -> add_quote_message_long_form_message_record.bid[add_quote_message_long_form_message_at] = add_quote_message_long_form_message_value; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 4 -> add_quote_message_long_form_message_record.bid_size_long[add_quote_message_long_form_message_at] = add_quote_message_long_form_message_value; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 4 -> add_quote_message_long_form_message_record.ask[add_quote_message_long_form_message_at] = add_quote_message_long_form_message_value; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 4 -> add_quote_message_long_form_message_record.ask_size_long[add_quote_message_long_form_message_at] = add_quote_message_long_form_message_value; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Quote Message Long Form Message set to where it lies, so a field read out of place says so */
inline ramp_add_quote_message_long_form_message(add_quote_message_long_form_message_record, add_quote_message_long_form_message_base) {
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 2 -> add_quote_message_long_form_message_record.tracking_number[add_quote_message_long_form_message_at] = (add_quote_message_long_form_message_base + 0 + add_quote_message_long_form_message_at + 1) % 256; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 6 -> add_quote_message_long_form_message_record.timestamp[add_quote_message_long_form_message_at] = (add_quote_message_long_form_message_base + 2 + add_quote_message_long_form_message_at + 1) % 256; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 8 -> add_quote_message_long_form_message_record.bid_reference_number[add_quote_message_long_form_message_at] = (add_quote_message_long_form_message_base + 8 + add_quote_message_long_form_message_at + 1) % 256; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 8 -> add_quote_message_long_form_message_record.ask_reference_number[add_quote_message_long_form_message_at] = (add_quote_message_long_form_message_base + 16 + add_quote_message_long_form_message_at + 1) % 256; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 4 -> add_quote_message_long_form_message_record.option_id[add_quote_message_long_form_message_at] = (add_quote_message_long_form_message_base + 24 + add_quote_message_long_form_message_at + 1) % 256; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 4 -> add_quote_message_long_form_message_record.bid[add_quote_message_long_form_message_at] = (add_quote_message_long_form_message_base + 28 + add_quote_message_long_form_message_at + 1) % 256; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 4 -> add_quote_message_long_form_message_record.bid_size_long[add_quote_message_long_form_message_at] = (add_quote_message_long_form_message_base + 32 + add_quote_message_long_form_message_at + 1) % 256; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 4 -> add_quote_message_long_form_message_record.ask[add_quote_message_long_form_message_at] = (add_quote_message_long_form_message_base + 36 + add_quote_message_long_form_message_at + 1) % 256; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 4 -> add_quote_message_long_form_message_record.ask_size_long[add_quote_message_long_form_message_at] = (add_quote_message_long_form_message_base + 40 + add_quote_message_long_form_message_at + 1) % 256; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Quote Message Long Form Message to the wire, 44 bytes from where the cursor stands */
inline encode_add_quote_message_long_form_message(add_quote_message_long_form_message_record) {
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 2 -> wire[at] = add_quote_message_long_form_message_record.tracking_number[add_quote_message_long_form_message_at]; at = at + 1; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 6 -> wire[at] = add_quote_message_long_form_message_record.timestamp[add_quote_message_long_form_message_at]; at = at + 1; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 8 -> wire[at] = add_quote_message_long_form_message_record.bid_reference_number[add_quote_message_long_form_message_at]; at = at + 1; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 8 -> wire[at] = add_quote_message_long_form_message_record.ask_reference_number[add_quote_message_long_form_message_at]; at = at + 1; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 4 -> wire[at] = add_quote_message_long_form_message_record.option_id[add_quote_message_long_form_message_at]; at = at + 1; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 4 -> wire[at] = add_quote_message_long_form_message_record.bid[add_quote_message_long_form_message_at]; at = at + 1; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 4 -> wire[at] = add_quote_message_long_form_message_record.bid_size_long[add_quote_message_long_form_message_at]; at = at + 1; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 4 -> wire[at] = add_quote_message_long_form_message_record.ask[add_quote_message_long_form_message_at]; at = at + 1; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 4 -> wire[at] = add_quote_message_long_form_message_record.ask_size_long[add_quote_message_long_form_message_at]; at = at + 1; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Quote Message Long Form Message off the wire, 44 bytes from where the cursor stands */
inline decode_add_quote_message_long_form_message(add_quote_message_long_form_message_record) {
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 2 -> add_quote_message_long_form_message_record.tracking_number[add_quote_message_long_form_message_at] = wire[at]; at = at + 1; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 6 -> add_quote_message_long_form_message_record.timestamp[add_quote_message_long_form_message_at] = wire[at]; at = at + 1; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 8 -> add_quote_message_long_form_message_record.bid_reference_number[add_quote_message_long_form_message_at] = wire[at]; at = at + 1; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 8 -> add_quote_message_long_form_message_record.ask_reference_number[add_quote_message_long_form_message_at] = wire[at]; at = at + 1; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 4 -> add_quote_message_long_form_message_record.option_id[add_quote_message_long_form_message_at] = wire[at]; at = at + 1; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 4 -> add_quote_message_long_form_message_record.bid[add_quote_message_long_form_message_at] = wire[at]; at = at + 1; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 4 -> add_quote_message_long_form_message_record.bid_size_long[add_quote_message_long_form_message_at] = wire[at]; at = at + 1; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 4 -> add_quote_message_long_form_message_record.ask[add_quote_message_long_form_message_at] = wire[at]; at = at + 1; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 4 -> add_quote_message_long_form_message_record.ask_size_long[add_quote_message_long_form_message_at] = wire[at]; at = at + 1; add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Quote Message Long Form Message is what was written, byte for byte */
inline equal_add_quote_message_long_form_message(add_quote_message_long_form_message_read, add_quote_message_long_form_message_written) {
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 2 -> assert(add_quote_message_long_form_message_read.tracking_number[add_quote_message_long_form_message_at] == add_quote_message_long_form_message_written.tracking_number[add_quote_message_long_form_message_at]); add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 6 -> assert(add_quote_message_long_form_message_read.timestamp[add_quote_message_long_form_message_at] == add_quote_message_long_form_message_written.timestamp[add_quote_message_long_form_message_at]); add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 8 -> assert(add_quote_message_long_form_message_read.bid_reference_number[add_quote_message_long_form_message_at] == add_quote_message_long_form_message_written.bid_reference_number[add_quote_message_long_form_message_at]); add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 8 -> assert(add_quote_message_long_form_message_read.ask_reference_number[add_quote_message_long_form_message_at] == add_quote_message_long_form_message_written.ask_reference_number[add_quote_message_long_form_message_at]); add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 4 -> assert(add_quote_message_long_form_message_read.option_id[add_quote_message_long_form_message_at] == add_quote_message_long_form_message_written.option_id[add_quote_message_long_form_message_at]); add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 4 -> assert(add_quote_message_long_form_message_read.bid[add_quote_message_long_form_message_at] == add_quote_message_long_form_message_written.bid[add_quote_message_long_form_message_at]); add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 4 -> assert(add_quote_message_long_form_message_read.bid_size_long[add_quote_message_long_form_message_at] == add_quote_message_long_form_message_written.bid_size_long[add_quote_message_long_form_message_at]); add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 4 -> assert(add_quote_message_long_form_message_read.ask[add_quote_message_long_form_message_at] == add_quote_message_long_form_message_written.ask[add_quote_message_long_form_message_at]); add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_message_at = 0;
  do
  :: add_quote_message_long_form_message_at < 4 -> assert(add_quote_message_long_form_message_read.ask_size_long[add_quote_message_long_form_message_at] == add_quote_message_long_form_message_written.ask_size_long[add_quote_message_long_form_message_at]); add_quote_message_long_form_message_at = add_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Executed Message: 28 bytes ---------------------------------- */

/* This message is sent whenever a Side order is executed in whole or in part. It is possible to receive several Single Side Executed Messages for the same Side order if that Side order is executed in several parts. The multiple Single Side Executed Messages on the same order are cumulative. By combining the executions received separately via two types of Single Side Executed Messages and Trade Messages, it is possible to build a complete view of all non-auction executions that happen on NASDAQ. Auction execution information is available in one bulk print via the Auction Trade Message. */
typedef SingleSideExecutedMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte reference_number[8];
  byte executed_contracts[4];
  byte cross_number[4];
  byte match_number[4]
};

int single_side_executed_message_at;

/* every byte of Single Side Executed Message set to one value */
inline fill_single_side_executed_message(single_side_executed_message_record, single_side_executed_message_value) {
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 2 -> single_side_executed_message_record.tracking_number[single_side_executed_message_at] = single_side_executed_message_value; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 6 -> single_side_executed_message_record.timestamp[single_side_executed_message_at] = single_side_executed_message_value; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 8 -> single_side_executed_message_record.reference_number[single_side_executed_message_at] = single_side_executed_message_value; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.executed_contracts[single_side_executed_message_at] = single_side_executed_message_value; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.cross_number[single_side_executed_message_at] = single_side_executed_message_value; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.match_number[single_side_executed_message_at] = single_side_executed_message_value; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Side Executed Message set to where it lies, so a field read out of place says so */
inline ramp_single_side_executed_message(single_side_executed_message_record, single_side_executed_message_base) {
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 2 -> single_side_executed_message_record.tracking_number[single_side_executed_message_at] = (single_side_executed_message_base + 0 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 6 -> single_side_executed_message_record.timestamp[single_side_executed_message_at] = (single_side_executed_message_base + 2 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 8 -> single_side_executed_message_record.reference_number[single_side_executed_message_at] = (single_side_executed_message_base + 8 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.executed_contracts[single_side_executed_message_at] = (single_side_executed_message_base + 16 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.cross_number[single_side_executed_message_at] = (single_side_executed_message_base + 20 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.match_number[single_side_executed_message_at] = (single_side_executed_message_base + 24 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Executed Message to the wire, 28 bytes from where the cursor stands */
inline encode_single_side_executed_message(single_side_executed_message_record) {
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 2 -> wire[at] = single_side_executed_message_record.tracking_number[single_side_executed_message_at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 6 -> wire[at] = single_side_executed_message_record.timestamp[single_side_executed_message_at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 8 -> wire[at] = single_side_executed_message_record.reference_number[single_side_executed_message_at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> wire[at] = single_side_executed_message_record.executed_contracts[single_side_executed_message_at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> wire[at] = single_side_executed_message_record.cross_number[single_side_executed_message_at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> wire[at] = single_side_executed_message_record.match_number[single_side_executed_message_at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Executed Message off the wire, 28 bytes from where the cursor stands */
inline decode_single_side_executed_message(single_side_executed_message_record) {
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 2 -> single_side_executed_message_record.tracking_number[single_side_executed_message_at] = wire[at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 6 -> single_side_executed_message_record.timestamp[single_side_executed_message_at] = wire[at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 8 -> single_side_executed_message_record.reference_number[single_side_executed_message_at] = wire[at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.executed_contracts[single_side_executed_message_at] = wire[at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.cross_number[single_side_executed_message_at] = wire[at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.match_number[single_side_executed_message_at] = wire[at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Side Executed Message is what was written, byte for byte */
inline equal_single_side_executed_message(single_side_executed_message_read, single_side_executed_message_written) {
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 2 -> assert(single_side_executed_message_read.tracking_number[single_side_executed_message_at] == single_side_executed_message_written.tracking_number[single_side_executed_message_at]); single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 6 -> assert(single_side_executed_message_read.timestamp[single_side_executed_message_at] == single_side_executed_message_written.timestamp[single_side_executed_message_at]); single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 8 -> assert(single_side_executed_message_read.reference_number[single_side_executed_message_at] == single_side_executed_message_written.reference_number[single_side_executed_message_at]); single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> assert(single_side_executed_message_read.executed_contracts[single_side_executed_message_at] == single_side_executed_message_written.executed_contracts[single_side_executed_message_at]); single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> assert(single_side_executed_message_read.cross_number[single_side_executed_message_at] == single_side_executed_message_written.cross_number[single_side_executed_message_at]); single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> assert(single_side_executed_message_read.match_number[single_side_executed_message_at] == single_side_executed_message_written.match_number[single_side_executed_message_at]); single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Executed With Price Message: 33 bytes ----------------------- */

/* These executions may be marked as non-printable. If the execution is marked as non-printed, it means that the contracts will be included into a later bulk print (e.g., in the case of auction executions). If a firm is looking to use the ITTO data in time-and-sales displays or volume calculations, NASDAQ recommends that firms ignore messages marked as non-printable to prevent double counting. */
typedef SingleSideExecutedWithPriceMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte reference_number[8];
  byte cross_number[4];
  byte match_number[4];
  byte printable;
  byte price_long[4];
  byte volume_long[4]
};

int single_side_executed_with_price_message_at;

/* every byte of Single Side Executed With Price Message set to one value */
inline fill_single_side_executed_with_price_message(single_side_executed_with_price_message_record, single_side_executed_with_price_message_value) {
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 2 -> single_side_executed_with_price_message_record.tracking_number[single_side_executed_with_price_message_at] = single_side_executed_with_price_message_value; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 6 -> single_side_executed_with_price_message_record.timestamp[single_side_executed_with_price_message_at] = single_side_executed_with_price_message_value; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 8 -> single_side_executed_with_price_message_record.reference_number[single_side_executed_with_price_message_at] = single_side_executed_with_price_message_value; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.cross_number[single_side_executed_with_price_message_at] = single_side_executed_with_price_message_value; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.match_number[single_side_executed_with_price_message_at] = single_side_executed_with_price_message_value; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_record.printable = single_side_executed_with_price_message_value;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.price_long[single_side_executed_with_price_message_at] = single_side_executed_with_price_message_value; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.volume_long[single_side_executed_with_price_message_at] = single_side_executed_with_price_message_value; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Side Executed With Price Message set to where it lies, so a field read out of place says so */
inline ramp_single_side_executed_with_price_message(single_side_executed_with_price_message_record, single_side_executed_with_price_message_base) {
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 2 -> single_side_executed_with_price_message_record.tracking_number[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 0 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 6 -> single_side_executed_with_price_message_record.timestamp[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 2 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 8 -> single_side_executed_with_price_message_record.reference_number[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 8 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.cross_number[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 16 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.match_number[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 20 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_record.printable = (single_side_executed_with_price_message_base + 24 + 1) % 256;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.price_long[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 25 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.volume_long[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 29 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Executed With Price Message to the wire, 33 bytes from where the cursor stands */
inline encode_single_side_executed_with_price_message(single_side_executed_with_price_message_record) {
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 2 -> wire[at] = single_side_executed_with_price_message_record.tracking_number[single_side_executed_with_price_message_at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 6 -> wire[at] = single_side_executed_with_price_message_record.timestamp[single_side_executed_with_price_message_at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 8 -> wire[at] = single_side_executed_with_price_message_record.reference_number[single_side_executed_with_price_message_at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> wire[at] = single_side_executed_with_price_message_record.cross_number[single_side_executed_with_price_message_at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> wire[at] = single_side_executed_with_price_message_record.match_number[single_side_executed_with_price_message_at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  wire[at] = single_side_executed_with_price_message_record.printable; at = at + 1;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> wire[at] = single_side_executed_with_price_message_record.price_long[single_side_executed_with_price_message_at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> wire[at] = single_side_executed_with_price_message_record.volume_long[single_side_executed_with_price_message_at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Executed With Price Message off the wire, 33 bytes from where the cursor stands */
inline decode_single_side_executed_with_price_message(single_side_executed_with_price_message_record) {
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 2 -> single_side_executed_with_price_message_record.tracking_number[single_side_executed_with_price_message_at] = wire[at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 6 -> single_side_executed_with_price_message_record.timestamp[single_side_executed_with_price_message_at] = wire[at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 8 -> single_side_executed_with_price_message_record.reference_number[single_side_executed_with_price_message_at] = wire[at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.cross_number[single_side_executed_with_price_message_at] = wire[at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.match_number[single_side_executed_with_price_message_at] = wire[at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_record.printable = wire[at]; at = at + 1;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.price_long[single_side_executed_with_price_message_at] = wire[at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.volume_long[single_side_executed_with_price_message_at] = wire[at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Side Executed With Price Message is what was written, byte for byte */
inline equal_single_side_executed_with_price_message(single_side_executed_with_price_message_read, single_side_executed_with_price_message_written) {
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 2 -> assert(single_side_executed_with_price_message_read.tracking_number[single_side_executed_with_price_message_at] == single_side_executed_with_price_message_written.tracking_number[single_side_executed_with_price_message_at]); single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 6 -> assert(single_side_executed_with_price_message_read.timestamp[single_side_executed_with_price_message_at] == single_side_executed_with_price_message_written.timestamp[single_side_executed_with_price_message_at]); single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 8 -> assert(single_side_executed_with_price_message_read.reference_number[single_side_executed_with_price_message_at] == single_side_executed_with_price_message_written.reference_number[single_side_executed_with_price_message_at]); single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> assert(single_side_executed_with_price_message_read.cross_number[single_side_executed_with_price_message_at] == single_side_executed_with_price_message_written.cross_number[single_side_executed_with_price_message_at]); single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> assert(single_side_executed_with_price_message_read.match_number[single_side_executed_with_price_message_at] == single_side_executed_with_price_message_written.match_number[single_side_executed_with_price_message_at]); single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  assert(single_side_executed_with_price_message_read.printable == single_side_executed_with_price_message_written.printable);
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> assert(single_side_executed_with_price_message_read.price_long[single_side_executed_with_price_message_at] == single_side_executed_with_price_message_written.price_long[single_side_executed_with_price_message_at]); single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> assert(single_side_executed_with_price_message_read.volume_long[single_side_executed_with_price_message_at] == single_side_executed_with_price_message_written.volume_long[single_side_executed_with_price_message_at]); single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancel Message: 20 bytes ------------------------------------------ */

/* This message is sent whenever an order on the book is modified as a result of a partial cancellation. */
typedef OrderCancelMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte order_reference_number[8];
  byte cancelled_contracts[4]
};

int order_cancel_message_at;

/* every byte of Order Cancel Message set to one value */
inline fill_order_cancel_message(order_cancel_message_record, order_cancel_message_value) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> order_cancel_message_record.tracking_number[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 6 -> order_cancel_message_record.timestamp[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.order_reference_number[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.cancelled_contracts[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_order_cancel_message(order_cancel_message_record, order_cancel_message_base) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> order_cancel_message_record.tracking_number[order_cancel_message_at] = (order_cancel_message_base + 0 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 6 -> order_cancel_message_record.timestamp[order_cancel_message_at] = (order_cancel_message_base + 2 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.order_reference_number[order_cancel_message_at] = (order_cancel_message_base + 8 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.cancelled_contracts[order_cancel_message_at] = (order_cancel_message_base + 16 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Message to the wire, 20 bytes from where the cursor stands */
inline encode_order_cancel_message(order_cancel_message_record) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> wire[at] = order_cancel_message_record.tracking_number[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 6 -> wire[at] = order_cancel_message_record.timestamp[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> wire[at] = order_cancel_message_record.order_reference_number[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> wire[at] = order_cancel_message_record.cancelled_contracts[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Message off the wire, 20 bytes from where the cursor stands */
inline decode_order_cancel_message(order_cancel_message_record) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> order_cancel_message_record.tracking_number[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 6 -> order_cancel_message_record.timestamp[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.order_reference_number[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.cancelled_contracts[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancel Message is what was written, byte for byte */
inline equal_order_cancel_message(order_cancel_message_read, order_cancel_message_written) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> assert(order_cancel_message_read.tracking_number[order_cancel_message_at] == order_cancel_message_written.tracking_number[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 6 -> assert(order_cancel_message_read.timestamp[order_cancel_message_at] == order_cancel_message_written.timestamp[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> assert(order_cancel_message_read.order_reference_number[order_cancel_message_at] == order_cancel_message_written.order_reference_number[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> assert(order_cancel_message_read.cancelled_contracts[order_cancel_message_at] == order_cancel_message_written.cancelled_contracts[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Replace Message Short Form: 28 bytes ------------------------ */

/* This message is sent whenever an order or one side of a quote on the book is replaced. The replacement has a new sequence number and replaces the prior sequence number. */
typedef SingleSideReplaceMessageShortForm {
  byte tracking_number[2];
  byte timestamp[6];
  byte original_reference_number[8];
  byte new_reference_number[8];
  byte price_short[2];
  byte volume_short[2]
};

int single_side_replace_message_short_form_at;

/* every byte of Single Side Replace Message Short Form set to one value */
inline fill_single_side_replace_message_short_form(single_side_replace_message_short_form_record, single_side_replace_message_short_form_value) {
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 2 -> single_side_replace_message_short_form_record.tracking_number[single_side_replace_message_short_form_at] = single_side_replace_message_short_form_value; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 6 -> single_side_replace_message_short_form_record.timestamp[single_side_replace_message_short_form_at] = single_side_replace_message_short_form_value; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 8 -> single_side_replace_message_short_form_record.original_reference_number[single_side_replace_message_short_form_at] = single_side_replace_message_short_form_value; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 8 -> single_side_replace_message_short_form_record.new_reference_number[single_side_replace_message_short_form_at] = single_side_replace_message_short_form_value; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 2 -> single_side_replace_message_short_form_record.price_short[single_side_replace_message_short_form_at] = single_side_replace_message_short_form_value; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 2 -> single_side_replace_message_short_form_record.volume_short[single_side_replace_message_short_form_at] = single_side_replace_message_short_form_value; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Side Replace Message Short Form set to where it lies, so a field read out of place says so */
inline ramp_single_side_replace_message_short_form(single_side_replace_message_short_form_record, single_side_replace_message_short_form_base) {
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 2 -> single_side_replace_message_short_form_record.tracking_number[single_side_replace_message_short_form_at] = (single_side_replace_message_short_form_base + 0 + single_side_replace_message_short_form_at + 1) % 256; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 6 -> single_side_replace_message_short_form_record.timestamp[single_side_replace_message_short_form_at] = (single_side_replace_message_short_form_base + 2 + single_side_replace_message_short_form_at + 1) % 256; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 8 -> single_side_replace_message_short_form_record.original_reference_number[single_side_replace_message_short_form_at] = (single_side_replace_message_short_form_base + 8 + single_side_replace_message_short_form_at + 1) % 256; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 8 -> single_side_replace_message_short_form_record.new_reference_number[single_side_replace_message_short_form_at] = (single_side_replace_message_short_form_base + 16 + single_side_replace_message_short_form_at + 1) % 256; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 2 -> single_side_replace_message_short_form_record.price_short[single_side_replace_message_short_form_at] = (single_side_replace_message_short_form_base + 24 + single_side_replace_message_short_form_at + 1) % 256; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 2 -> single_side_replace_message_short_form_record.volume_short[single_side_replace_message_short_form_at] = (single_side_replace_message_short_form_base + 26 + single_side_replace_message_short_form_at + 1) % 256; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Replace Message Short Form to the wire, 28 bytes from where the cursor stands */
inline encode_single_side_replace_message_short_form(single_side_replace_message_short_form_record) {
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 2 -> wire[at] = single_side_replace_message_short_form_record.tracking_number[single_side_replace_message_short_form_at]; at = at + 1; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 6 -> wire[at] = single_side_replace_message_short_form_record.timestamp[single_side_replace_message_short_form_at]; at = at + 1; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 8 -> wire[at] = single_side_replace_message_short_form_record.original_reference_number[single_side_replace_message_short_form_at]; at = at + 1; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 8 -> wire[at] = single_side_replace_message_short_form_record.new_reference_number[single_side_replace_message_short_form_at]; at = at + 1; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 2 -> wire[at] = single_side_replace_message_short_form_record.price_short[single_side_replace_message_short_form_at]; at = at + 1; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 2 -> wire[at] = single_side_replace_message_short_form_record.volume_short[single_side_replace_message_short_form_at]; at = at + 1; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Replace Message Short Form off the wire, 28 bytes from where the cursor stands */
inline decode_single_side_replace_message_short_form(single_side_replace_message_short_form_record) {
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 2 -> single_side_replace_message_short_form_record.tracking_number[single_side_replace_message_short_form_at] = wire[at]; at = at + 1; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 6 -> single_side_replace_message_short_form_record.timestamp[single_side_replace_message_short_form_at] = wire[at]; at = at + 1; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 8 -> single_side_replace_message_short_form_record.original_reference_number[single_side_replace_message_short_form_at] = wire[at]; at = at + 1; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 8 -> single_side_replace_message_short_form_record.new_reference_number[single_side_replace_message_short_form_at] = wire[at]; at = at + 1; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 2 -> single_side_replace_message_short_form_record.price_short[single_side_replace_message_short_form_at] = wire[at]; at = at + 1; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 2 -> single_side_replace_message_short_form_record.volume_short[single_side_replace_message_short_form_at] = wire[at]; at = at + 1; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Side Replace Message Short Form is what was written, byte for byte */
inline equal_single_side_replace_message_short_form(single_side_replace_message_short_form_read, single_side_replace_message_short_form_written) {
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 2 -> assert(single_side_replace_message_short_form_read.tracking_number[single_side_replace_message_short_form_at] == single_side_replace_message_short_form_written.tracking_number[single_side_replace_message_short_form_at]); single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 6 -> assert(single_side_replace_message_short_form_read.timestamp[single_side_replace_message_short_form_at] == single_side_replace_message_short_form_written.timestamp[single_side_replace_message_short_form_at]); single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 8 -> assert(single_side_replace_message_short_form_read.original_reference_number[single_side_replace_message_short_form_at] == single_side_replace_message_short_form_written.original_reference_number[single_side_replace_message_short_form_at]); single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 8 -> assert(single_side_replace_message_short_form_read.new_reference_number[single_side_replace_message_short_form_at] == single_side_replace_message_short_form_written.new_reference_number[single_side_replace_message_short_form_at]); single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 2 -> assert(single_side_replace_message_short_form_read.price_short[single_side_replace_message_short_form_at] == single_side_replace_message_short_form_written.price_short[single_side_replace_message_short_form_at]); single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 2 -> assert(single_side_replace_message_short_form_read.volume_short[single_side_replace_message_short_form_at] == single_side_replace_message_short_form_written.volume_short[single_side_replace_message_short_form_at]); single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Replace Message Long Form: 32 bytes ------------------------- */

/* This message is sent whenever an order or one side of a quote on the book is replaced. The replacement has a new sequence number and replaces the prior sequence number. */
typedef SingleSideReplaceMessageLongForm {
  byte tracking_number[2];
  byte timestamp[6];
  byte original_reference_number[8];
  byte new_reference_number[8];
  byte price_long[4];
  byte volume_long[4]
};

int single_side_replace_message_long_form_at;

/* every byte of Single Side Replace Message Long Form set to one value */
inline fill_single_side_replace_message_long_form(single_side_replace_message_long_form_record, single_side_replace_message_long_form_value) {
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 2 -> single_side_replace_message_long_form_record.tracking_number[single_side_replace_message_long_form_at] = single_side_replace_message_long_form_value; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 6 -> single_side_replace_message_long_form_record.timestamp[single_side_replace_message_long_form_at] = single_side_replace_message_long_form_value; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 8 -> single_side_replace_message_long_form_record.original_reference_number[single_side_replace_message_long_form_at] = single_side_replace_message_long_form_value; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 8 -> single_side_replace_message_long_form_record.new_reference_number[single_side_replace_message_long_form_at] = single_side_replace_message_long_form_value; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 4 -> single_side_replace_message_long_form_record.price_long[single_side_replace_message_long_form_at] = single_side_replace_message_long_form_value; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 4 -> single_side_replace_message_long_form_record.volume_long[single_side_replace_message_long_form_at] = single_side_replace_message_long_form_value; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Side Replace Message Long Form set to where it lies, so a field read out of place says so */
inline ramp_single_side_replace_message_long_form(single_side_replace_message_long_form_record, single_side_replace_message_long_form_base) {
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 2 -> single_side_replace_message_long_form_record.tracking_number[single_side_replace_message_long_form_at] = (single_side_replace_message_long_form_base + 0 + single_side_replace_message_long_form_at + 1) % 256; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 6 -> single_side_replace_message_long_form_record.timestamp[single_side_replace_message_long_form_at] = (single_side_replace_message_long_form_base + 2 + single_side_replace_message_long_form_at + 1) % 256; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 8 -> single_side_replace_message_long_form_record.original_reference_number[single_side_replace_message_long_form_at] = (single_side_replace_message_long_form_base + 8 + single_side_replace_message_long_form_at + 1) % 256; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 8 -> single_side_replace_message_long_form_record.new_reference_number[single_side_replace_message_long_form_at] = (single_side_replace_message_long_form_base + 16 + single_side_replace_message_long_form_at + 1) % 256; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 4 -> single_side_replace_message_long_form_record.price_long[single_side_replace_message_long_form_at] = (single_side_replace_message_long_form_base + 24 + single_side_replace_message_long_form_at + 1) % 256; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 4 -> single_side_replace_message_long_form_record.volume_long[single_side_replace_message_long_form_at] = (single_side_replace_message_long_form_base + 28 + single_side_replace_message_long_form_at + 1) % 256; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Replace Message Long Form to the wire, 32 bytes from where the cursor stands */
inline encode_single_side_replace_message_long_form(single_side_replace_message_long_form_record) {
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 2 -> wire[at] = single_side_replace_message_long_form_record.tracking_number[single_side_replace_message_long_form_at]; at = at + 1; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 6 -> wire[at] = single_side_replace_message_long_form_record.timestamp[single_side_replace_message_long_form_at]; at = at + 1; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 8 -> wire[at] = single_side_replace_message_long_form_record.original_reference_number[single_side_replace_message_long_form_at]; at = at + 1; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 8 -> wire[at] = single_side_replace_message_long_form_record.new_reference_number[single_side_replace_message_long_form_at]; at = at + 1; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 4 -> wire[at] = single_side_replace_message_long_form_record.price_long[single_side_replace_message_long_form_at]; at = at + 1; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 4 -> wire[at] = single_side_replace_message_long_form_record.volume_long[single_side_replace_message_long_form_at]; at = at + 1; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Replace Message Long Form off the wire, 32 bytes from where the cursor stands */
inline decode_single_side_replace_message_long_form(single_side_replace_message_long_form_record) {
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 2 -> single_side_replace_message_long_form_record.tracking_number[single_side_replace_message_long_form_at] = wire[at]; at = at + 1; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 6 -> single_side_replace_message_long_form_record.timestamp[single_side_replace_message_long_form_at] = wire[at]; at = at + 1; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 8 -> single_side_replace_message_long_form_record.original_reference_number[single_side_replace_message_long_form_at] = wire[at]; at = at + 1; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 8 -> single_side_replace_message_long_form_record.new_reference_number[single_side_replace_message_long_form_at] = wire[at]; at = at + 1; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 4 -> single_side_replace_message_long_form_record.price_long[single_side_replace_message_long_form_at] = wire[at]; at = at + 1; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 4 -> single_side_replace_message_long_form_record.volume_long[single_side_replace_message_long_form_at] = wire[at]; at = at + 1; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Side Replace Message Long Form is what was written, byte for byte */
inline equal_single_side_replace_message_long_form(single_side_replace_message_long_form_read, single_side_replace_message_long_form_written) {
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 2 -> assert(single_side_replace_message_long_form_read.tracking_number[single_side_replace_message_long_form_at] == single_side_replace_message_long_form_written.tracking_number[single_side_replace_message_long_form_at]); single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 6 -> assert(single_side_replace_message_long_form_read.timestamp[single_side_replace_message_long_form_at] == single_side_replace_message_long_form_written.timestamp[single_side_replace_message_long_form_at]); single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 8 -> assert(single_side_replace_message_long_form_read.original_reference_number[single_side_replace_message_long_form_at] == single_side_replace_message_long_form_written.original_reference_number[single_side_replace_message_long_form_at]); single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 8 -> assert(single_side_replace_message_long_form_read.new_reference_number[single_side_replace_message_long_form_at] == single_side_replace_message_long_form_written.new_reference_number[single_side_replace_message_long_form_at]); single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 4 -> assert(single_side_replace_message_long_form_read.price_long[single_side_replace_message_long_form_at] == single_side_replace_message_long_form_written.price_long[single_side_replace_message_long_form_at]); single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 4 -> assert(single_side_replace_message_long_form_read.volume_long[single_side_replace_message_long_form_at] == single_side_replace_message_long_form_written.volume_long[single_side_replace_message_long_form_at]); single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Delete Message: 16 bytes ------------------------------------ */

/* The message is sent when an order or a side of a quote is being cancelled. All remaining contracts are no longer accessible so the side should be removed from the book. */
typedef SingleSideDeleteMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte reference_number[8]
};

int single_side_delete_message_at;

/* every byte of Single Side Delete Message set to one value */
inline fill_single_side_delete_message(single_side_delete_message_record, single_side_delete_message_value) {
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 2 -> single_side_delete_message_record.tracking_number[single_side_delete_message_at] = single_side_delete_message_value; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 6 -> single_side_delete_message_record.timestamp[single_side_delete_message_at] = single_side_delete_message_value; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 8 -> single_side_delete_message_record.reference_number[single_side_delete_message_at] = single_side_delete_message_value; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Side Delete Message set to where it lies, so a field read out of place says so */
inline ramp_single_side_delete_message(single_side_delete_message_record, single_side_delete_message_base) {
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 2 -> single_side_delete_message_record.tracking_number[single_side_delete_message_at] = (single_side_delete_message_base + 0 + single_side_delete_message_at + 1) % 256; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 6 -> single_side_delete_message_record.timestamp[single_side_delete_message_at] = (single_side_delete_message_base + 2 + single_side_delete_message_at + 1) % 256; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 8 -> single_side_delete_message_record.reference_number[single_side_delete_message_at] = (single_side_delete_message_base + 8 + single_side_delete_message_at + 1) % 256; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Delete Message to the wire, 16 bytes from where the cursor stands */
inline encode_single_side_delete_message(single_side_delete_message_record) {
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 2 -> wire[at] = single_side_delete_message_record.tracking_number[single_side_delete_message_at]; at = at + 1; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 6 -> wire[at] = single_side_delete_message_record.timestamp[single_side_delete_message_at]; at = at + 1; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 8 -> wire[at] = single_side_delete_message_record.reference_number[single_side_delete_message_at]; at = at + 1; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Delete Message off the wire, 16 bytes from where the cursor stands */
inline decode_single_side_delete_message(single_side_delete_message_record) {
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 2 -> single_side_delete_message_record.tracking_number[single_side_delete_message_at] = wire[at]; at = at + 1; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 6 -> single_side_delete_message_record.timestamp[single_side_delete_message_at] = wire[at]; at = at + 1; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 8 -> single_side_delete_message_record.reference_number[single_side_delete_message_at] = wire[at]; at = at + 1; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Side Delete Message is what was written, byte for byte */
inline equal_single_side_delete_message(single_side_delete_message_read, single_side_delete_message_written) {
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 2 -> assert(single_side_delete_message_read.tracking_number[single_side_delete_message_at] == single_side_delete_message_written.tracking_number[single_side_delete_message_at]); single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 6 -> assert(single_side_delete_message_read.timestamp[single_side_delete_message_at] == single_side_delete_message_written.timestamp[single_side_delete_message_at]); single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 8 -> assert(single_side_delete_message_read.reference_number[single_side_delete_message_at] == single_side_delete_message_written.reference_number[single_side_delete_message_at]); single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Change Message: 25 bytes ------------------------------------ */

/* This message is sent whenever an order or a side of a quote is being updated for price and (or) contracts. The reference number associated with the order quote is unchanged. */
typedef SingleSideChangeMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte reference_number[8];
  byte change_reason;
  byte price_long[4];
  byte volume_long[4]
};

int single_side_change_message_at;

/* every byte of Single Side Change Message set to one value */
inline fill_single_side_change_message(single_side_change_message_record, single_side_change_message_value) {
  single_side_change_message_at = 0;
  do
  :: single_side_change_message_at < 2 -> single_side_change_message_record.tracking_number[single_side_change_message_at] = single_side_change_message_value; single_side_change_message_at = single_side_change_message_at + 1
  :: else -> break
  od;
  single_side_change_message_at = 0;
  do
  :: single_side_change_message_at < 6 -> single_side_change_message_record.timestamp[single_side_change_message_at] = single_side_change_message_value; single_side_change_message_at = single_side_change_message_at + 1
  :: else -> break
  od;
  single_side_change_message_at = 0;
  do
  :: single_side_change_message_at < 8 -> single_side_change_message_record.reference_number[single_side_change_message_at] = single_side_change_message_value; single_side_change_message_at = single_side_change_message_at + 1
  :: else -> break
  od;
  single_side_change_message_record.change_reason = single_side_change_message_value;
  single_side_change_message_at = 0;
  do
  :: single_side_change_message_at < 4 -> single_side_change_message_record.price_long[single_side_change_message_at] = single_side_change_message_value; single_side_change_message_at = single_side_change_message_at + 1
  :: else -> break
  od;
  single_side_change_message_at = 0;
  do
  :: single_side_change_message_at < 4 -> single_side_change_message_record.volume_long[single_side_change_message_at] = single_side_change_message_value; single_side_change_message_at = single_side_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Side Change Message set to where it lies, so a field read out of place says so */
inline ramp_single_side_change_message(single_side_change_message_record, single_side_change_message_base) {
  single_side_change_message_at = 0;
  do
  :: single_side_change_message_at < 2 -> single_side_change_message_record.tracking_number[single_side_change_message_at] = (single_side_change_message_base + 0 + single_side_change_message_at + 1) % 256; single_side_change_message_at = single_side_change_message_at + 1
  :: else -> break
  od;
  single_side_change_message_at = 0;
  do
  :: single_side_change_message_at < 6 -> single_side_change_message_record.timestamp[single_side_change_message_at] = (single_side_change_message_base + 2 + single_side_change_message_at + 1) % 256; single_side_change_message_at = single_side_change_message_at + 1
  :: else -> break
  od;
  single_side_change_message_at = 0;
  do
  :: single_side_change_message_at < 8 -> single_side_change_message_record.reference_number[single_side_change_message_at] = (single_side_change_message_base + 8 + single_side_change_message_at + 1) % 256; single_side_change_message_at = single_side_change_message_at + 1
  :: else -> break
  od;
  single_side_change_message_record.change_reason = (single_side_change_message_base + 16 + 1) % 256;
  single_side_change_message_at = 0;
  do
  :: single_side_change_message_at < 4 -> single_side_change_message_record.price_long[single_side_change_message_at] = (single_side_change_message_base + 17 + single_side_change_message_at + 1) % 256; single_side_change_message_at = single_side_change_message_at + 1
  :: else -> break
  od;
  single_side_change_message_at = 0;
  do
  :: single_side_change_message_at < 4 -> single_side_change_message_record.volume_long[single_side_change_message_at] = (single_side_change_message_base + 21 + single_side_change_message_at + 1) % 256; single_side_change_message_at = single_side_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Change Message to the wire, 25 bytes from where the cursor stands */
inline encode_single_side_change_message(single_side_change_message_record) {
  single_side_change_message_at = 0;
  do
  :: single_side_change_message_at < 2 -> wire[at] = single_side_change_message_record.tracking_number[single_side_change_message_at]; at = at + 1; single_side_change_message_at = single_side_change_message_at + 1
  :: else -> break
  od;
  single_side_change_message_at = 0;
  do
  :: single_side_change_message_at < 6 -> wire[at] = single_side_change_message_record.timestamp[single_side_change_message_at]; at = at + 1; single_side_change_message_at = single_side_change_message_at + 1
  :: else -> break
  od;
  single_side_change_message_at = 0;
  do
  :: single_side_change_message_at < 8 -> wire[at] = single_side_change_message_record.reference_number[single_side_change_message_at]; at = at + 1; single_side_change_message_at = single_side_change_message_at + 1
  :: else -> break
  od;
  wire[at] = single_side_change_message_record.change_reason; at = at + 1;
  single_side_change_message_at = 0;
  do
  :: single_side_change_message_at < 4 -> wire[at] = single_side_change_message_record.price_long[single_side_change_message_at]; at = at + 1; single_side_change_message_at = single_side_change_message_at + 1
  :: else -> break
  od;
  single_side_change_message_at = 0;
  do
  :: single_side_change_message_at < 4 -> wire[at] = single_side_change_message_record.volume_long[single_side_change_message_at]; at = at + 1; single_side_change_message_at = single_side_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Change Message off the wire, 25 bytes from where the cursor stands */
inline decode_single_side_change_message(single_side_change_message_record) {
  single_side_change_message_at = 0;
  do
  :: single_side_change_message_at < 2 -> single_side_change_message_record.tracking_number[single_side_change_message_at] = wire[at]; at = at + 1; single_side_change_message_at = single_side_change_message_at + 1
  :: else -> break
  od;
  single_side_change_message_at = 0;
  do
  :: single_side_change_message_at < 6 -> single_side_change_message_record.timestamp[single_side_change_message_at] = wire[at]; at = at + 1; single_side_change_message_at = single_side_change_message_at + 1
  :: else -> break
  od;
  single_side_change_message_at = 0;
  do
  :: single_side_change_message_at < 8 -> single_side_change_message_record.reference_number[single_side_change_message_at] = wire[at]; at = at + 1; single_side_change_message_at = single_side_change_message_at + 1
  :: else -> break
  od;
  single_side_change_message_record.change_reason = wire[at]; at = at + 1;
  single_side_change_message_at = 0;
  do
  :: single_side_change_message_at < 4 -> single_side_change_message_record.price_long[single_side_change_message_at] = wire[at]; at = at + 1; single_side_change_message_at = single_side_change_message_at + 1
  :: else -> break
  od;
  single_side_change_message_at = 0;
  do
  :: single_side_change_message_at < 4 -> single_side_change_message_record.volume_long[single_side_change_message_at] = wire[at]; at = at + 1; single_side_change_message_at = single_side_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Side Change Message is what was written, byte for byte */
inline equal_single_side_change_message(single_side_change_message_read, single_side_change_message_written) {
  single_side_change_message_at = 0;
  do
  :: single_side_change_message_at < 2 -> assert(single_side_change_message_read.tracking_number[single_side_change_message_at] == single_side_change_message_written.tracking_number[single_side_change_message_at]); single_side_change_message_at = single_side_change_message_at + 1
  :: else -> break
  od;
  single_side_change_message_at = 0;
  do
  :: single_side_change_message_at < 6 -> assert(single_side_change_message_read.timestamp[single_side_change_message_at] == single_side_change_message_written.timestamp[single_side_change_message_at]); single_side_change_message_at = single_side_change_message_at + 1
  :: else -> break
  od;
  single_side_change_message_at = 0;
  do
  :: single_side_change_message_at < 8 -> assert(single_side_change_message_read.reference_number[single_side_change_message_at] == single_side_change_message_written.reference_number[single_side_change_message_at]); single_side_change_message_at = single_side_change_message_at + 1
  :: else -> break
  od;
  assert(single_side_change_message_read.change_reason == single_side_change_message_written.change_reason);
  single_side_change_message_at = 0;
  do
  :: single_side_change_message_at < 4 -> assert(single_side_change_message_read.price_long[single_side_change_message_at] == single_side_change_message_written.price_long[single_side_change_message_at]); single_side_change_message_at = single_side_change_message_at + 1
  :: else -> break
  od;
  single_side_change_message_at = 0;
  do
  :: single_side_change_message_at < 4 -> assert(single_side_change_message_read.volume_long[single_side_change_message_at] == single_side_change_message_written.volume_long[single_side_change_message_at]); single_side_change_message_at = single_side_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Replace Message Short Form: 48 bytes ------------------------------ */

/* This message is sent whenever a quote on the book is replaced. The replaced quote has new sequence numbers on both sides. These new sequence numbers replace the prior sequence numbers on the quote. */
typedef QuoteReplaceMessageShortForm {
  byte tracking_number[2];
  byte timestamp[6];
  byte original_bid_reference_number[8];
  byte bid_reference_number[8];
  byte original_ask_reference_number[8];
  byte ask_reference_number[8];
  byte bid_price_short[2];
  byte bid_size_short[2];
  byte ask_price_short[2];
  byte ask_size_short[2]
};

int quote_replace_message_short_form_at;

/* every byte of Quote Replace Message Short Form set to one value */
inline fill_quote_replace_message_short_form(quote_replace_message_short_form_record, quote_replace_message_short_form_value) {
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.tracking_number[quote_replace_message_short_form_at] = quote_replace_message_short_form_value; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 6 -> quote_replace_message_short_form_record.timestamp[quote_replace_message_short_form_at] = quote_replace_message_short_form_value; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 8 -> quote_replace_message_short_form_record.original_bid_reference_number[quote_replace_message_short_form_at] = quote_replace_message_short_form_value; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 8 -> quote_replace_message_short_form_record.bid_reference_number[quote_replace_message_short_form_at] = quote_replace_message_short_form_value; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 8 -> quote_replace_message_short_form_record.original_ask_reference_number[quote_replace_message_short_form_at] = quote_replace_message_short_form_value; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 8 -> quote_replace_message_short_form_record.ask_reference_number[quote_replace_message_short_form_at] = quote_replace_message_short_form_value; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.bid_price_short[quote_replace_message_short_form_at] = quote_replace_message_short_form_value; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.bid_size_short[quote_replace_message_short_form_at] = quote_replace_message_short_form_value; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.ask_price_short[quote_replace_message_short_form_at] = quote_replace_message_short_form_value; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.ask_size_short[quote_replace_message_short_form_at] = quote_replace_message_short_form_value; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Replace Message Short Form set to where it lies, so a field read out of place says so */
inline ramp_quote_replace_message_short_form(quote_replace_message_short_form_record, quote_replace_message_short_form_base) {
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.tracking_number[quote_replace_message_short_form_at] = (quote_replace_message_short_form_base + 0 + quote_replace_message_short_form_at + 1) % 256; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 6 -> quote_replace_message_short_form_record.timestamp[quote_replace_message_short_form_at] = (quote_replace_message_short_form_base + 2 + quote_replace_message_short_form_at + 1) % 256; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 8 -> quote_replace_message_short_form_record.original_bid_reference_number[quote_replace_message_short_form_at] = (quote_replace_message_short_form_base + 8 + quote_replace_message_short_form_at + 1) % 256; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 8 -> quote_replace_message_short_form_record.bid_reference_number[quote_replace_message_short_form_at] = (quote_replace_message_short_form_base + 16 + quote_replace_message_short_form_at + 1) % 256; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 8 -> quote_replace_message_short_form_record.original_ask_reference_number[quote_replace_message_short_form_at] = (quote_replace_message_short_form_base + 24 + quote_replace_message_short_form_at + 1) % 256; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 8 -> quote_replace_message_short_form_record.ask_reference_number[quote_replace_message_short_form_at] = (quote_replace_message_short_form_base + 32 + quote_replace_message_short_form_at + 1) % 256; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.bid_price_short[quote_replace_message_short_form_at] = (quote_replace_message_short_form_base + 40 + quote_replace_message_short_form_at + 1) % 256; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.bid_size_short[quote_replace_message_short_form_at] = (quote_replace_message_short_form_base + 42 + quote_replace_message_short_form_at + 1) % 256; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.ask_price_short[quote_replace_message_short_form_at] = (quote_replace_message_short_form_base + 44 + quote_replace_message_short_form_at + 1) % 256; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.ask_size_short[quote_replace_message_short_form_at] = (quote_replace_message_short_form_base + 46 + quote_replace_message_short_form_at + 1) % 256; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Replace Message Short Form to the wire, 48 bytes from where the cursor stands */
inline encode_quote_replace_message_short_form(quote_replace_message_short_form_record) {
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> wire[at] = quote_replace_message_short_form_record.tracking_number[quote_replace_message_short_form_at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 6 -> wire[at] = quote_replace_message_short_form_record.timestamp[quote_replace_message_short_form_at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 8 -> wire[at] = quote_replace_message_short_form_record.original_bid_reference_number[quote_replace_message_short_form_at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 8 -> wire[at] = quote_replace_message_short_form_record.bid_reference_number[quote_replace_message_short_form_at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 8 -> wire[at] = quote_replace_message_short_form_record.original_ask_reference_number[quote_replace_message_short_form_at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 8 -> wire[at] = quote_replace_message_short_form_record.ask_reference_number[quote_replace_message_short_form_at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> wire[at] = quote_replace_message_short_form_record.bid_price_short[quote_replace_message_short_form_at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> wire[at] = quote_replace_message_short_form_record.bid_size_short[quote_replace_message_short_form_at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> wire[at] = quote_replace_message_short_form_record.ask_price_short[quote_replace_message_short_form_at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> wire[at] = quote_replace_message_short_form_record.ask_size_short[quote_replace_message_short_form_at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Replace Message Short Form off the wire, 48 bytes from where the cursor stands */
inline decode_quote_replace_message_short_form(quote_replace_message_short_form_record) {
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.tracking_number[quote_replace_message_short_form_at] = wire[at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 6 -> quote_replace_message_short_form_record.timestamp[quote_replace_message_short_form_at] = wire[at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 8 -> quote_replace_message_short_form_record.original_bid_reference_number[quote_replace_message_short_form_at] = wire[at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 8 -> quote_replace_message_short_form_record.bid_reference_number[quote_replace_message_short_form_at] = wire[at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 8 -> quote_replace_message_short_form_record.original_ask_reference_number[quote_replace_message_short_form_at] = wire[at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 8 -> quote_replace_message_short_form_record.ask_reference_number[quote_replace_message_short_form_at] = wire[at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.bid_price_short[quote_replace_message_short_form_at] = wire[at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.bid_size_short[quote_replace_message_short_form_at] = wire[at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.ask_price_short[quote_replace_message_short_form_at] = wire[at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.ask_size_short[quote_replace_message_short_form_at] = wire[at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Replace Message Short Form is what was written, byte for byte */
inline equal_quote_replace_message_short_form(quote_replace_message_short_form_read, quote_replace_message_short_form_written) {
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> assert(quote_replace_message_short_form_read.tracking_number[quote_replace_message_short_form_at] == quote_replace_message_short_form_written.tracking_number[quote_replace_message_short_form_at]); quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 6 -> assert(quote_replace_message_short_form_read.timestamp[quote_replace_message_short_form_at] == quote_replace_message_short_form_written.timestamp[quote_replace_message_short_form_at]); quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 8 -> assert(quote_replace_message_short_form_read.original_bid_reference_number[quote_replace_message_short_form_at] == quote_replace_message_short_form_written.original_bid_reference_number[quote_replace_message_short_form_at]); quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 8 -> assert(quote_replace_message_short_form_read.bid_reference_number[quote_replace_message_short_form_at] == quote_replace_message_short_form_written.bid_reference_number[quote_replace_message_short_form_at]); quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 8 -> assert(quote_replace_message_short_form_read.original_ask_reference_number[quote_replace_message_short_form_at] == quote_replace_message_short_form_written.original_ask_reference_number[quote_replace_message_short_form_at]); quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 8 -> assert(quote_replace_message_short_form_read.ask_reference_number[quote_replace_message_short_form_at] == quote_replace_message_short_form_written.ask_reference_number[quote_replace_message_short_form_at]); quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> assert(quote_replace_message_short_form_read.bid_price_short[quote_replace_message_short_form_at] == quote_replace_message_short_form_written.bid_price_short[quote_replace_message_short_form_at]); quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> assert(quote_replace_message_short_form_read.bid_size_short[quote_replace_message_short_form_at] == quote_replace_message_short_form_written.bid_size_short[quote_replace_message_short_form_at]); quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> assert(quote_replace_message_short_form_read.ask_price_short[quote_replace_message_short_form_at] == quote_replace_message_short_form_written.ask_price_short[quote_replace_message_short_form_at]); quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> assert(quote_replace_message_short_form_read.ask_size_short[quote_replace_message_short_form_at] == quote_replace_message_short_form_written.ask_size_short[quote_replace_message_short_form_at]); quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Replace Message Long Form: 56 bytes ------------------------------- */

/* This message is sent whenever a quote on the book is replaced. The replaced quote has new sequence numbers on both sides. These new sequence numbers replace the prior sequence numbers on the quote. */
typedef QuoteReplaceMessageLongForm {
  byte tracking_number[2];
  byte timestamp[6];
  byte original_bid_reference_number[8];
  byte bid_reference_number[8];
  byte original_ask_reference_number[8];
  byte ask_reference_number[8];
  byte bid_price_long[4];
  byte bid_size_long[4];
  byte ask_price_long[4];
  byte ask_size_long[4]
};

int quote_replace_message_long_form_at;

/* every byte of Quote Replace Message Long Form set to one value */
inline fill_quote_replace_message_long_form(quote_replace_message_long_form_record, quote_replace_message_long_form_value) {
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 2 -> quote_replace_message_long_form_record.tracking_number[quote_replace_message_long_form_at] = quote_replace_message_long_form_value; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 6 -> quote_replace_message_long_form_record.timestamp[quote_replace_message_long_form_at] = quote_replace_message_long_form_value; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 8 -> quote_replace_message_long_form_record.original_bid_reference_number[quote_replace_message_long_form_at] = quote_replace_message_long_form_value; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 8 -> quote_replace_message_long_form_record.bid_reference_number[quote_replace_message_long_form_at] = quote_replace_message_long_form_value; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 8 -> quote_replace_message_long_form_record.original_ask_reference_number[quote_replace_message_long_form_at] = quote_replace_message_long_form_value; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 8 -> quote_replace_message_long_form_record.ask_reference_number[quote_replace_message_long_form_at] = quote_replace_message_long_form_value; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.bid_price_long[quote_replace_message_long_form_at] = quote_replace_message_long_form_value; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.bid_size_long[quote_replace_message_long_form_at] = quote_replace_message_long_form_value; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.ask_price_long[quote_replace_message_long_form_at] = quote_replace_message_long_form_value; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.ask_size_long[quote_replace_message_long_form_at] = quote_replace_message_long_form_value; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Replace Message Long Form set to where it lies, so a field read out of place says so */
inline ramp_quote_replace_message_long_form(quote_replace_message_long_form_record, quote_replace_message_long_form_base) {
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 2 -> quote_replace_message_long_form_record.tracking_number[quote_replace_message_long_form_at] = (quote_replace_message_long_form_base + 0 + quote_replace_message_long_form_at + 1) % 256; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 6 -> quote_replace_message_long_form_record.timestamp[quote_replace_message_long_form_at] = (quote_replace_message_long_form_base + 2 + quote_replace_message_long_form_at + 1) % 256; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 8 -> quote_replace_message_long_form_record.original_bid_reference_number[quote_replace_message_long_form_at] = (quote_replace_message_long_form_base + 8 + quote_replace_message_long_form_at + 1) % 256; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 8 -> quote_replace_message_long_form_record.bid_reference_number[quote_replace_message_long_form_at] = (quote_replace_message_long_form_base + 16 + quote_replace_message_long_form_at + 1) % 256; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 8 -> quote_replace_message_long_form_record.original_ask_reference_number[quote_replace_message_long_form_at] = (quote_replace_message_long_form_base + 24 + quote_replace_message_long_form_at + 1) % 256; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 8 -> quote_replace_message_long_form_record.ask_reference_number[quote_replace_message_long_form_at] = (quote_replace_message_long_form_base + 32 + quote_replace_message_long_form_at + 1) % 256; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.bid_price_long[quote_replace_message_long_form_at] = (quote_replace_message_long_form_base + 40 + quote_replace_message_long_form_at + 1) % 256; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.bid_size_long[quote_replace_message_long_form_at] = (quote_replace_message_long_form_base + 44 + quote_replace_message_long_form_at + 1) % 256; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.ask_price_long[quote_replace_message_long_form_at] = (quote_replace_message_long_form_base + 48 + quote_replace_message_long_form_at + 1) % 256; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.ask_size_long[quote_replace_message_long_form_at] = (quote_replace_message_long_form_base + 52 + quote_replace_message_long_form_at + 1) % 256; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Replace Message Long Form to the wire, 56 bytes from where the cursor stands */
inline encode_quote_replace_message_long_form(quote_replace_message_long_form_record) {
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 2 -> wire[at] = quote_replace_message_long_form_record.tracking_number[quote_replace_message_long_form_at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 6 -> wire[at] = quote_replace_message_long_form_record.timestamp[quote_replace_message_long_form_at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 8 -> wire[at] = quote_replace_message_long_form_record.original_bid_reference_number[quote_replace_message_long_form_at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 8 -> wire[at] = quote_replace_message_long_form_record.bid_reference_number[quote_replace_message_long_form_at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 8 -> wire[at] = quote_replace_message_long_form_record.original_ask_reference_number[quote_replace_message_long_form_at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 8 -> wire[at] = quote_replace_message_long_form_record.ask_reference_number[quote_replace_message_long_form_at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> wire[at] = quote_replace_message_long_form_record.bid_price_long[quote_replace_message_long_form_at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> wire[at] = quote_replace_message_long_form_record.bid_size_long[quote_replace_message_long_form_at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> wire[at] = quote_replace_message_long_form_record.ask_price_long[quote_replace_message_long_form_at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> wire[at] = quote_replace_message_long_form_record.ask_size_long[quote_replace_message_long_form_at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Replace Message Long Form off the wire, 56 bytes from where the cursor stands */
inline decode_quote_replace_message_long_form(quote_replace_message_long_form_record) {
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 2 -> quote_replace_message_long_form_record.tracking_number[quote_replace_message_long_form_at] = wire[at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 6 -> quote_replace_message_long_form_record.timestamp[quote_replace_message_long_form_at] = wire[at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 8 -> quote_replace_message_long_form_record.original_bid_reference_number[quote_replace_message_long_form_at] = wire[at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 8 -> quote_replace_message_long_form_record.bid_reference_number[quote_replace_message_long_form_at] = wire[at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 8 -> quote_replace_message_long_form_record.original_ask_reference_number[quote_replace_message_long_form_at] = wire[at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 8 -> quote_replace_message_long_form_record.ask_reference_number[quote_replace_message_long_form_at] = wire[at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.bid_price_long[quote_replace_message_long_form_at] = wire[at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.bid_size_long[quote_replace_message_long_form_at] = wire[at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.ask_price_long[quote_replace_message_long_form_at] = wire[at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.ask_size_long[quote_replace_message_long_form_at] = wire[at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Replace Message Long Form is what was written, byte for byte */
inline equal_quote_replace_message_long_form(quote_replace_message_long_form_read, quote_replace_message_long_form_written) {
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 2 -> assert(quote_replace_message_long_form_read.tracking_number[quote_replace_message_long_form_at] == quote_replace_message_long_form_written.tracking_number[quote_replace_message_long_form_at]); quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 6 -> assert(quote_replace_message_long_form_read.timestamp[quote_replace_message_long_form_at] == quote_replace_message_long_form_written.timestamp[quote_replace_message_long_form_at]); quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 8 -> assert(quote_replace_message_long_form_read.original_bid_reference_number[quote_replace_message_long_form_at] == quote_replace_message_long_form_written.original_bid_reference_number[quote_replace_message_long_form_at]); quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 8 -> assert(quote_replace_message_long_form_read.bid_reference_number[quote_replace_message_long_form_at] == quote_replace_message_long_form_written.bid_reference_number[quote_replace_message_long_form_at]); quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 8 -> assert(quote_replace_message_long_form_read.original_ask_reference_number[quote_replace_message_long_form_at] == quote_replace_message_long_form_written.original_ask_reference_number[quote_replace_message_long_form_at]); quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 8 -> assert(quote_replace_message_long_form_read.ask_reference_number[quote_replace_message_long_form_at] == quote_replace_message_long_form_written.ask_reference_number[quote_replace_message_long_form_at]); quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> assert(quote_replace_message_long_form_read.bid_price_long[quote_replace_message_long_form_at] == quote_replace_message_long_form_written.bid_price_long[quote_replace_message_long_form_at]); quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> assert(quote_replace_message_long_form_read.bid_size_long[quote_replace_message_long_form_at] == quote_replace_message_long_form_written.bid_size_long[quote_replace_message_long_form_at]); quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> assert(quote_replace_message_long_form_read.ask_price_long[quote_replace_message_long_form_at] == quote_replace_message_long_form_written.ask_price_long[quote_replace_message_long_form_at]); quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> assert(quote_replace_message_long_form_read.ask_size_long[quote_replace_message_long_form_at] == quote_replace_message_long_form_written.ask_size_long[quote_replace_message_long_form_at]); quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Delete Message: 24 bytes ------------------------------------------ */

/* The message is sent when a single quote is being cancelled. All remaining contracts are no longer accessible so the quote should be removed from the book. */
typedef QuoteDeleteMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte bid_reference_number[8];
  byte ask_reference_number[8]
};

int quote_delete_message_at;

/* every byte of Quote Delete Message set to one value */
inline fill_quote_delete_message(quote_delete_message_record, quote_delete_message_value) {
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 2 -> quote_delete_message_record.tracking_number[quote_delete_message_at] = quote_delete_message_value; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 6 -> quote_delete_message_record.timestamp[quote_delete_message_at] = quote_delete_message_value; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 8 -> quote_delete_message_record.bid_reference_number[quote_delete_message_at] = quote_delete_message_value; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 8 -> quote_delete_message_record.ask_reference_number[quote_delete_message_at] = quote_delete_message_value; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Delete Message set to where it lies, so a field read out of place says so */
inline ramp_quote_delete_message(quote_delete_message_record, quote_delete_message_base) {
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 2 -> quote_delete_message_record.tracking_number[quote_delete_message_at] = (quote_delete_message_base + 0 + quote_delete_message_at + 1) % 256; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 6 -> quote_delete_message_record.timestamp[quote_delete_message_at] = (quote_delete_message_base + 2 + quote_delete_message_at + 1) % 256; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 8 -> quote_delete_message_record.bid_reference_number[quote_delete_message_at] = (quote_delete_message_base + 8 + quote_delete_message_at + 1) % 256; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 8 -> quote_delete_message_record.ask_reference_number[quote_delete_message_at] = (quote_delete_message_base + 16 + quote_delete_message_at + 1) % 256; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Delete Message to the wire, 24 bytes from where the cursor stands */
inline encode_quote_delete_message(quote_delete_message_record) {
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 2 -> wire[at] = quote_delete_message_record.tracking_number[quote_delete_message_at]; at = at + 1; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 6 -> wire[at] = quote_delete_message_record.timestamp[quote_delete_message_at]; at = at + 1; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 8 -> wire[at] = quote_delete_message_record.bid_reference_number[quote_delete_message_at]; at = at + 1; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 8 -> wire[at] = quote_delete_message_record.ask_reference_number[quote_delete_message_at]; at = at + 1; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Delete Message off the wire, 24 bytes from where the cursor stands */
inline decode_quote_delete_message(quote_delete_message_record) {
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 2 -> quote_delete_message_record.tracking_number[quote_delete_message_at] = wire[at]; at = at + 1; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 6 -> quote_delete_message_record.timestamp[quote_delete_message_at] = wire[at]; at = at + 1; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 8 -> quote_delete_message_record.bid_reference_number[quote_delete_message_at] = wire[at]; at = at + 1; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 8 -> quote_delete_message_record.ask_reference_number[quote_delete_message_at] = wire[at]; at = at + 1; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Delete Message is what was written, byte for byte */
inline equal_quote_delete_message(quote_delete_message_read, quote_delete_message_written) {
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 2 -> assert(quote_delete_message_read.tracking_number[quote_delete_message_at] == quote_delete_message_written.tracking_number[quote_delete_message_at]); quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 6 -> assert(quote_delete_message_read.timestamp[quote_delete_message_at] == quote_delete_message_written.timestamp[quote_delete_message_at]); quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 8 -> assert(quote_delete_message_read.bid_reference_number[quote_delete_message_at] == quote_delete_message_written.bid_reference_number[quote_delete_message_at]); quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 8 -> assert(quote_delete_message_read.ask_reference_number[quote_delete_message_at] == quote_delete_message_written.ask_reference_number[quote_delete_message_at]); quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Options Trade Messages Non Auction: 29 bytes ---------------------------- */

/* This Options Trade Message is designed to provide execution details for normal match events involving non-displayable order types. (Note: There is a separate message for NASDAQ Option auction events.) */
typedef OptionsTradeMessagesNonAuction {
  byte tracking_number[2];
  byte timestamp[6];
  byte buy_sell_indicator;
  byte option_id[4];
  byte cross_number[4];
  byte match_number[4];
  byte price_long[4];
  byte volume_long[4]
};

int options_trade_messages_non_auction_at;

/* every byte of Options Trade Messages Non Auction set to one value */
inline fill_options_trade_messages_non_auction(options_trade_messages_non_auction_record, options_trade_messages_non_auction_value) {
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 2 -> options_trade_messages_non_auction_record.tracking_number[options_trade_messages_non_auction_at] = options_trade_messages_non_auction_value; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 6 -> options_trade_messages_non_auction_record.timestamp[options_trade_messages_non_auction_at] = options_trade_messages_non_auction_value; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_record.buy_sell_indicator = options_trade_messages_non_auction_value;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 4 -> options_trade_messages_non_auction_record.option_id[options_trade_messages_non_auction_at] = options_trade_messages_non_auction_value; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 4 -> options_trade_messages_non_auction_record.cross_number[options_trade_messages_non_auction_at] = options_trade_messages_non_auction_value; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 4 -> options_trade_messages_non_auction_record.match_number[options_trade_messages_non_auction_at] = options_trade_messages_non_auction_value; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 4 -> options_trade_messages_non_auction_record.price_long[options_trade_messages_non_auction_at] = options_trade_messages_non_auction_value; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 4 -> options_trade_messages_non_auction_record.volume_long[options_trade_messages_non_auction_at] = options_trade_messages_non_auction_value; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Options Trade Messages Non Auction set to where it lies, so a field read out of place says so */
inline ramp_options_trade_messages_non_auction(options_trade_messages_non_auction_record, options_trade_messages_non_auction_base) {
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 2 -> options_trade_messages_non_auction_record.tracking_number[options_trade_messages_non_auction_at] = (options_trade_messages_non_auction_base + 0 + options_trade_messages_non_auction_at + 1) % 256; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 6 -> options_trade_messages_non_auction_record.timestamp[options_trade_messages_non_auction_at] = (options_trade_messages_non_auction_base + 2 + options_trade_messages_non_auction_at + 1) % 256; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_record.buy_sell_indicator = (options_trade_messages_non_auction_base + 8 + 1) % 256;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 4 -> options_trade_messages_non_auction_record.option_id[options_trade_messages_non_auction_at] = (options_trade_messages_non_auction_base + 9 + options_trade_messages_non_auction_at + 1) % 256; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 4 -> options_trade_messages_non_auction_record.cross_number[options_trade_messages_non_auction_at] = (options_trade_messages_non_auction_base + 13 + options_trade_messages_non_auction_at + 1) % 256; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 4 -> options_trade_messages_non_auction_record.match_number[options_trade_messages_non_auction_at] = (options_trade_messages_non_auction_base + 17 + options_trade_messages_non_auction_at + 1) % 256; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 4 -> options_trade_messages_non_auction_record.price_long[options_trade_messages_non_auction_at] = (options_trade_messages_non_auction_base + 21 + options_trade_messages_non_auction_at + 1) % 256; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 4 -> options_trade_messages_non_auction_record.volume_long[options_trade_messages_non_auction_at] = (options_trade_messages_non_auction_base + 25 + options_trade_messages_non_auction_at + 1) % 256; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  skip
}

/* Options Trade Messages Non Auction to the wire, 29 bytes from where the cursor stands */
inline encode_options_trade_messages_non_auction(options_trade_messages_non_auction_record) {
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 2 -> wire[at] = options_trade_messages_non_auction_record.tracking_number[options_trade_messages_non_auction_at]; at = at + 1; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 6 -> wire[at] = options_trade_messages_non_auction_record.timestamp[options_trade_messages_non_auction_at]; at = at + 1; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  wire[at] = options_trade_messages_non_auction_record.buy_sell_indicator; at = at + 1;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 4 -> wire[at] = options_trade_messages_non_auction_record.option_id[options_trade_messages_non_auction_at]; at = at + 1; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 4 -> wire[at] = options_trade_messages_non_auction_record.cross_number[options_trade_messages_non_auction_at]; at = at + 1; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 4 -> wire[at] = options_trade_messages_non_auction_record.match_number[options_trade_messages_non_auction_at]; at = at + 1; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 4 -> wire[at] = options_trade_messages_non_auction_record.price_long[options_trade_messages_non_auction_at]; at = at + 1; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 4 -> wire[at] = options_trade_messages_non_auction_record.volume_long[options_trade_messages_non_auction_at]; at = at + 1; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  skip
}

/* Options Trade Messages Non Auction off the wire, 29 bytes from where the cursor stands */
inline decode_options_trade_messages_non_auction(options_trade_messages_non_auction_record) {
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 2 -> options_trade_messages_non_auction_record.tracking_number[options_trade_messages_non_auction_at] = wire[at]; at = at + 1; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 6 -> options_trade_messages_non_auction_record.timestamp[options_trade_messages_non_auction_at] = wire[at]; at = at + 1; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_record.buy_sell_indicator = wire[at]; at = at + 1;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 4 -> options_trade_messages_non_auction_record.option_id[options_trade_messages_non_auction_at] = wire[at]; at = at + 1; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 4 -> options_trade_messages_non_auction_record.cross_number[options_trade_messages_non_auction_at] = wire[at]; at = at + 1; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 4 -> options_trade_messages_non_auction_record.match_number[options_trade_messages_non_auction_at] = wire[at]; at = at + 1; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 4 -> options_trade_messages_non_auction_record.price_long[options_trade_messages_non_auction_at] = wire[at]; at = at + 1; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 4 -> options_trade_messages_non_auction_record.volume_long[options_trade_messages_non_auction_at] = wire[at]; at = at + 1; options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Options Trade Messages Non Auction is what was written, byte for byte */
inline equal_options_trade_messages_non_auction(options_trade_messages_non_auction_read, options_trade_messages_non_auction_written) {
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 2 -> assert(options_trade_messages_non_auction_read.tracking_number[options_trade_messages_non_auction_at] == options_trade_messages_non_auction_written.tracking_number[options_trade_messages_non_auction_at]); options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 6 -> assert(options_trade_messages_non_auction_read.timestamp[options_trade_messages_non_auction_at] == options_trade_messages_non_auction_written.timestamp[options_trade_messages_non_auction_at]); options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  assert(options_trade_messages_non_auction_read.buy_sell_indicator == options_trade_messages_non_auction_written.buy_sell_indicator);
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 4 -> assert(options_trade_messages_non_auction_read.option_id[options_trade_messages_non_auction_at] == options_trade_messages_non_auction_written.option_id[options_trade_messages_non_auction_at]); options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 4 -> assert(options_trade_messages_non_auction_read.cross_number[options_trade_messages_non_auction_at] == options_trade_messages_non_auction_written.cross_number[options_trade_messages_non_auction_at]); options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 4 -> assert(options_trade_messages_non_auction_read.match_number[options_trade_messages_non_auction_at] == options_trade_messages_non_auction_written.match_number[options_trade_messages_non_auction_at]); options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 4 -> assert(options_trade_messages_non_auction_read.price_long[options_trade_messages_non_auction_at] == options_trade_messages_non_auction_written.price_long[options_trade_messages_non_auction_at]); options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  options_trade_messages_non_auction_at = 0;
  do
  :: options_trade_messages_non_auction_at < 4 -> assert(options_trade_messages_non_auction_read.volume_long[options_trade_messages_non_auction_at] == options_trade_messages_non_auction_written.volume_long[options_trade_messages_non_auction_at]); options_trade_messages_non_auction_at = options_trade_messages_non_auction_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Options Cross Trade Message: 29 bytes ----------------------------------- */

/* This message will also be used to report all executions within a price improvement (PRISM) auction. */
typedef OptionsCrossTradeMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte option_id[4];
  byte cross_number[4];
  byte match_number[4];
  byte cross_type;
  byte price_long[4];
  byte volume_long[4]
};

int options_cross_trade_message_at;

/* every byte of Options Cross Trade Message set to one value */
inline fill_options_cross_trade_message(options_cross_trade_message_record, options_cross_trade_message_value) {
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 2 -> options_cross_trade_message_record.tracking_number[options_cross_trade_message_at] = options_cross_trade_message_value; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 6 -> options_cross_trade_message_record.timestamp[options_cross_trade_message_at] = options_cross_trade_message_value; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.option_id[options_cross_trade_message_at] = options_cross_trade_message_value; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.cross_number[options_cross_trade_message_at] = options_cross_trade_message_value; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.match_number[options_cross_trade_message_at] = options_cross_trade_message_value; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_record.cross_type = options_cross_trade_message_value;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.price_long[options_cross_trade_message_at] = options_cross_trade_message_value; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.volume_long[options_cross_trade_message_at] = options_cross_trade_message_value; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Options Cross Trade Message set to where it lies, so a field read out of place says so */
inline ramp_options_cross_trade_message(options_cross_trade_message_record, options_cross_trade_message_base) {
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 2 -> options_cross_trade_message_record.tracking_number[options_cross_trade_message_at] = (options_cross_trade_message_base + 0 + options_cross_trade_message_at + 1) % 256; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 6 -> options_cross_trade_message_record.timestamp[options_cross_trade_message_at] = (options_cross_trade_message_base + 2 + options_cross_trade_message_at + 1) % 256; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.option_id[options_cross_trade_message_at] = (options_cross_trade_message_base + 8 + options_cross_trade_message_at + 1) % 256; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.cross_number[options_cross_trade_message_at] = (options_cross_trade_message_base + 12 + options_cross_trade_message_at + 1) % 256; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.match_number[options_cross_trade_message_at] = (options_cross_trade_message_base + 16 + options_cross_trade_message_at + 1) % 256; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_record.cross_type = (options_cross_trade_message_base + 20 + 1) % 256;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.price_long[options_cross_trade_message_at] = (options_cross_trade_message_base + 21 + options_cross_trade_message_at + 1) % 256; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.volume_long[options_cross_trade_message_at] = (options_cross_trade_message_base + 25 + options_cross_trade_message_at + 1) % 256; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Options Cross Trade Message to the wire, 29 bytes from where the cursor stands */
inline encode_options_cross_trade_message(options_cross_trade_message_record) {
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 2 -> wire[at] = options_cross_trade_message_record.tracking_number[options_cross_trade_message_at]; at = at + 1; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 6 -> wire[at] = options_cross_trade_message_record.timestamp[options_cross_trade_message_at]; at = at + 1; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> wire[at] = options_cross_trade_message_record.option_id[options_cross_trade_message_at]; at = at + 1; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> wire[at] = options_cross_trade_message_record.cross_number[options_cross_trade_message_at]; at = at + 1; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> wire[at] = options_cross_trade_message_record.match_number[options_cross_trade_message_at]; at = at + 1; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = options_cross_trade_message_record.cross_type; at = at + 1;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> wire[at] = options_cross_trade_message_record.price_long[options_cross_trade_message_at]; at = at + 1; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> wire[at] = options_cross_trade_message_record.volume_long[options_cross_trade_message_at]; at = at + 1; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Options Cross Trade Message off the wire, 29 bytes from where the cursor stands */
inline decode_options_cross_trade_message(options_cross_trade_message_record) {
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 2 -> options_cross_trade_message_record.tracking_number[options_cross_trade_message_at] = wire[at]; at = at + 1; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 6 -> options_cross_trade_message_record.timestamp[options_cross_trade_message_at] = wire[at]; at = at + 1; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.option_id[options_cross_trade_message_at] = wire[at]; at = at + 1; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.cross_number[options_cross_trade_message_at] = wire[at]; at = at + 1; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.match_number[options_cross_trade_message_at] = wire[at]; at = at + 1; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_record.cross_type = wire[at]; at = at + 1;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.price_long[options_cross_trade_message_at] = wire[at]; at = at + 1; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.volume_long[options_cross_trade_message_at] = wire[at]; at = at + 1; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Options Cross Trade Message is what was written, byte for byte */
inline equal_options_cross_trade_message(options_cross_trade_message_read, options_cross_trade_message_written) {
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 2 -> assert(options_cross_trade_message_read.tracking_number[options_cross_trade_message_at] == options_cross_trade_message_written.tracking_number[options_cross_trade_message_at]); options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 6 -> assert(options_cross_trade_message_read.timestamp[options_cross_trade_message_at] == options_cross_trade_message_written.timestamp[options_cross_trade_message_at]); options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> assert(options_cross_trade_message_read.option_id[options_cross_trade_message_at] == options_cross_trade_message_written.option_id[options_cross_trade_message_at]); options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> assert(options_cross_trade_message_read.cross_number[options_cross_trade_message_at] == options_cross_trade_message_written.cross_number[options_cross_trade_message_at]); options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> assert(options_cross_trade_message_read.match_number[options_cross_trade_message_at] == options_cross_trade_message_written.match_number[options_cross_trade_message_at]); options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  assert(options_cross_trade_message_read.cross_type == options_cross_trade_message_written.cross_type);
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> assert(options_cross_trade_message_read.price_long[options_cross_trade_message_at] == options_cross_trade_message_written.price_long[options_cross_trade_message_at]); options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> assert(options_cross_trade_message_read.volume_long[options_cross_trade_message_at] == options_cross_trade_message_written.volume_long[options_cross_trade_message_at]); options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Broken Trade Order Executed Message: 16 bytes --------------------------- */

/* The Broken Trade Message is sent whenever an execution on NASDAQ is broken. An execution may be broken if it is found to be “clearly erroneous” pursuant to NASDAQ’s Clearly Erroneous Policy. A trade break is final; once a trade is broken, it cannot be reinstated. */
typedef BrokenTradeOrderExecutedMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte cross_number[4];
  byte match_number[4]
};

int broken_trade_order_executed_message_at;

/* every byte of Broken Trade Order Executed Message set to one value */
inline fill_broken_trade_order_executed_message(broken_trade_order_executed_message_record, broken_trade_order_executed_message_value) {
  broken_trade_order_executed_message_at = 0;
  do
  :: broken_trade_order_executed_message_at < 2 -> broken_trade_order_executed_message_record.tracking_number[broken_trade_order_executed_message_at] = broken_trade_order_executed_message_value; broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
  :: else -> break
  od;
  broken_trade_order_executed_message_at = 0;
  do
  :: broken_trade_order_executed_message_at < 6 -> broken_trade_order_executed_message_record.timestamp[broken_trade_order_executed_message_at] = broken_trade_order_executed_message_value; broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
  :: else -> break
  od;
  broken_trade_order_executed_message_at = 0;
  do
  :: broken_trade_order_executed_message_at < 4 -> broken_trade_order_executed_message_record.cross_number[broken_trade_order_executed_message_at] = broken_trade_order_executed_message_value; broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
  :: else -> break
  od;
  broken_trade_order_executed_message_at = 0;
  do
  :: broken_trade_order_executed_message_at < 4 -> broken_trade_order_executed_message_record.match_number[broken_trade_order_executed_message_at] = broken_trade_order_executed_message_value; broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Broken Trade Order Executed Message set to where it lies, so a field read out of place says so */
inline ramp_broken_trade_order_executed_message(broken_trade_order_executed_message_record, broken_trade_order_executed_message_base) {
  broken_trade_order_executed_message_at = 0;
  do
  :: broken_trade_order_executed_message_at < 2 -> broken_trade_order_executed_message_record.tracking_number[broken_trade_order_executed_message_at] = (broken_trade_order_executed_message_base + 0 + broken_trade_order_executed_message_at + 1) % 256; broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
  :: else -> break
  od;
  broken_trade_order_executed_message_at = 0;
  do
  :: broken_trade_order_executed_message_at < 6 -> broken_trade_order_executed_message_record.timestamp[broken_trade_order_executed_message_at] = (broken_trade_order_executed_message_base + 2 + broken_trade_order_executed_message_at + 1) % 256; broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
  :: else -> break
  od;
  broken_trade_order_executed_message_at = 0;
  do
  :: broken_trade_order_executed_message_at < 4 -> broken_trade_order_executed_message_record.cross_number[broken_trade_order_executed_message_at] = (broken_trade_order_executed_message_base + 8 + broken_trade_order_executed_message_at + 1) % 256; broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
  :: else -> break
  od;
  broken_trade_order_executed_message_at = 0;
  do
  :: broken_trade_order_executed_message_at < 4 -> broken_trade_order_executed_message_record.match_number[broken_trade_order_executed_message_at] = (broken_trade_order_executed_message_base + 12 + broken_trade_order_executed_message_at + 1) % 256; broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Broken Trade Order Executed Message to the wire, 16 bytes from where the cursor stands */
inline encode_broken_trade_order_executed_message(broken_trade_order_executed_message_record) {
  broken_trade_order_executed_message_at = 0;
  do
  :: broken_trade_order_executed_message_at < 2 -> wire[at] = broken_trade_order_executed_message_record.tracking_number[broken_trade_order_executed_message_at]; at = at + 1; broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
  :: else -> break
  od;
  broken_trade_order_executed_message_at = 0;
  do
  :: broken_trade_order_executed_message_at < 6 -> wire[at] = broken_trade_order_executed_message_record.timestamp[broken_trade_order_executed_message_at]; at = at + 1; broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
  :: else -> break
  od;
  broken_trade_order_executed_message_at = 0;
  do
  :: broken_trade_order_executed_message_at < 4 -> wire[at] = broken_trade_order_executed_message_record.cross_number[broken_trade_order_executed_message_at]; at = at + 1; broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
  :: else -> break
  od;
  broken_trade_order_executed_message_at = 0;
  do
  :: broken_trade_order_executed_message_at < 4 -> wire[at] = broken_trade_order_executed_message_record.match_number[broken_trade_order_executed_message_at]; at = at + 1; broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Broken Trade Order Executed Message off the wire, 16 bytes from where the cursor stands */
inline decode_broken_trade_order_executed_message(broken_trade_order_executed_message_record) {
  broken_trade_order_executed_message_at = 0;
  do
  :: broken_trade_order_executed_message_at < 2 -> broken_trade_order_executed_message_record.tracking_number[broken_trade_order_executed_message_at] = wire[at]; at = at + 1; broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
  :: else -> break
  od;
  broken_trade_order_executed_message_at = 0;
  do
  :: broken_trade_order_executed_message_at < 6 -> broken_trade_order_executed_message_record.timestamp[broken_trade_order_executed_message_at] = wire[at]; at = at + 1; broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
  :: else -> break
  od;
  broken_trade_order_executed_message_at = 0;
  do
  :: broken_trade_order_executed_message_at < 4 -> broken_trade_order_executed_message_record.cross_number[broken_trade_order_executed_message_at] = wire[at]; at = at + 1; broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
  :: else -> break
  od;
  broken_trade_order_executed_message_at = 0;
  do
  :: broken_trade_order_executed_message_at < 4 -> broken_trade_order_executed_message_record.match_number[broken_trade_order_executed_message_at] = wire[at]; at = at + 1; broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Broken Trade Order Executed Message is what was written, byte for byte */
inline equal_broken_trade_order_executed_message(broken_trade_order_executed_message_read, broken_trade_order_executed_message_written) {
  broken_trade_order_executed_message_at = 0;
  do
  :: broken_trade_order_executed_message_at < 2 -> assert(broken_trade_order_executed_message_read.tracking_number[broken_trade_order_executed_message_at] == broken_trade_order_executed_message_written.tracking_number[broken_trade_order_executed_message_at]); broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
  :: else -> break
  od;
  broken_trade_order_executed_message_at = 0;
  do
  :: broken_trade_order_executed_message_at < 6 -> assert(broken_trade_order_executed_message_read.timestamp[broken_trade_order_executed_message_at] == broken_trade_order_executed_message_written.timestamp[broken_trade_order_executed_message_at]); broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
  :: else -> break
  od;
  broken_trade_order_executed_message_at = 0;
  do
  :: broken_trade_order_executed_message_at < 4 -> assert(broken_trade_order_executed_message_read.cross_number[broken_trade_order_executed_message_at] == broken_trade_order_executed_message_written.cross_number[broken_trade_order_executed_message_at]); broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
  :: else -> break
  od;
  broken_trade_order_executed_message_at = 0;
  do
  :: broken_trade_order_executed_message_at < 4 -> assert(broken_trade_order_executed_message_read.match_number[broken_trade_order_executed_message_at] == broken_trade_order_executed_message_written.match_number[broken_trade_order_executed_message_at]); broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Noii Message: 34 bytes -------------------------------------------------- */

/* For the NASDAQ Opening Auction, NASDAQ will begin the dissemination of NOII messages for a put or a call option five minutes prior to the start of opening process event and two minutes prior to the halt resumption (reopening) process event. */
typedef NoiiMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte auction_id[4];
  byte auction_type;
  byte paired_contracts[4];
  byte imbalance_direction;
  byte option_id[4];
  byte imbalance_price[4];
  byte imbalance_volume[4];
  byte customer_firm_indicator;
  byte reserved_3[3]
};

int noii_message_at;

/* every byte of Noii Message set to one value */
inline fill_noii_message(noii_message_record, noii_message_value) {
  noii_message_at = 0;
  do
  :: noii_message_at < 2 -> noii_message_record.tracking_number[noii_message_at] = noii_message_value; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 6 -> noii_message_record.timestamp[noii_message_at] = noii_message_value; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.auction_id[noii_message_at] = noii_message_value; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_record.auction_type = noii_message_value;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.paired_contracts[noii_message_at] = noii_message_value; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_record.imbalance_direction = noii_message_value;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.option_id[noii_message_at] = noii_message_value; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.imbalance_price[noii_message_at] = noii_message_value; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.imbalance_volume[noii_message_at] = noii_message_value; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_record.customer_firm_indicator = noii_message_value;
  noii_message_at = 0;
  do
  :: noii_message_at < 3 -> noii_message_record.reserved_3[noii_message_at] = noii_message_value; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Noii Message set to where it lies, so a field read out of place says so */
inline ramp_noii_message(noii_message_record, noii_message_base) {
  noii_message_at = 0;
  do
  :: noii_message_at < 2 -> noii_message_record.tracking_number[noii_message_at] = (noii_message_base + 0 + noii_message_at + 1) % 256; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 6 -> noii_message_record.timestamp[noii_message_at] = (noii_message_base + 2 + noii_message_at + 1) % 256; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.auction_id[noii_message_at] = (noii_message_base + 8 + noii_message_at + 1) % 256; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_record.auction_type = (noii_message_base + 12 + 1) % 256;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.paired_contracts[noii_message_at] = (noii_message_base + 13 + noii_message_at + 1) % 256; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_record.imbalance_direction = (noii_message_base + 17 + 1) % 256;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.option_id[noii_message_at] = (noii_message_base + 18 + noii_message_at + 1) % 256; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.imbalance_price[noii_message_at] = (noii_message_base + 22 + noii_message_at + 1) % 256; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.imbalance_volume[noii_message_at] = (noii_message_base + 26 + noii_message_at + 1) % 256; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_record.customer_firm_indicator = (noii_message_base + 30 + 1) % 256;
  noii_message_at = 0;
  do
  :: noii_message_at < 3 -> noii_message_record.reserved_3[noii_message_at] = (noii_message_base + 31 + noii_message_at + 1) % 256; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  skip
}

/* Noii Message to the wire, 34 bytes from where the cursor stands */
inline encode_noii_message(noii_message_record) {
  noii_message_at = 0;
  do
  :: noii_message_at < 2 -> wire[at] = noii_message_record.tracking_number[noii_message_at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 6 -> wire[at] = noii_message_record.timestamp[noii_message_at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> wire[at] = noii_message_record.auction_id[noii_message_at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  wire[at] = noii_message_record.auction_type; at = at + 1;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> wire[at] = noii_message_record.paired_contracts[noii_message_at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  wire[at] = noii_message_record.imbalance_direction; at = at + 1;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> wire[at] = noii_message_record.option_id[noii_message_at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> wire[at] = noii_message_record.imbalance_price[noii_message_at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> wire[at] = noii_message_record.imbalance_volume[noii_message_at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  wire[at] = noii_message_record.customer_firm_indicator; at = at + 1;
  noii_message_at = 0;
  do
  :: noii_message_at < 3 -> wire[at] = noii_message_record.reserved_3[noii_message_at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  skip
}

/* Noii Message off the wire, 34 bytes from where the cursor stands */
inline decode_noii_message(noii_message_record) {
  noii_message_at = 0;
  do
  :: noii_message_at < 2 -> noii_message_record.tracking_number[noii_message_at] = wire[at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 6 -> noii_message_record.timestamp[noii_message_at] = wire[at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.auction_id[noii_message_at] = wire[at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_record.auction_type = wire[at]; at = at + 1;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.paired_contracts[noii_message_at] = wire[at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_record.imbalance_direction = wire[at]; at = at + 1;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.option_id[noii_message_at] = wire[at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.imbalance_price[noii_message_at] = wire[at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> noii_message_record.imbalance_volume[noii_message_at] = wire[at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_record.customer_firm_indicator = wire[at]; at = at + 1;
  noii_message_at = 0;
  do
  :: noii_message_at < 3 -> noii_message_record.reserved_3[noii_message_at] = wire[at]; at = at + 1; noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Noii Message is what was written, byte for byte */
inline equal_noii_message(noii_message_read, noii_message_written) {
  noii_message_at = 0;
  do
  :: noii_message_at < 2 -> assert(noii_message_read.tracking_number[noii_message_at] == noii_message_written.tracking_number[noii_message_at]); noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 6 -> assert(noii_message_read.timestamp[noii_message_at] == noii_message_written.timestamp[noii_message_at]); noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> assert(noii_message_read.auction_id[noii_message_at] == noii_message_written.auction_id[noii_message_at]); noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  assert(noii_message_read.auction_type == noii_message_written.auction_type);
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> assert(noii_message_read.paired_contracts[noii_message_at] == noii_message_written.paired_contracts[noii_message_at]); noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  assert(noii_message_read.imbalance_direction == noii_message_written.imbalance_direction);
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> assert(noii_message_read.option_id[noii_message_at] == noii_message_written.option_id[noii_message_at]); noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> assert(noii_message_read.imbalance_price[noii_message_at] == noii_message_written.imbalance_price[noii_message_at]); noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  noii_message_at = 0;
  do
  :: noii_message_at < 4 -> assert(noii_message_read.imbalance_volume[noii_message_at] == noii_message_written.imbalance_volume[noii_message_at]); noii_message_at = noii_message_at + 1
  :: else -> break
  od;
  assert(noii_message_read.customer_firm_indicator == noii_message_written.customer_firm_indicator);
  noii_message_at = 0;
  do
  :: noii_message_at < 3 -> assert(noii_message_read.reserved_3[noii_message_at] == noii_message_written.reserved_3[noii_message_at]); noii_message_at = noii_message_at + 1
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
    assert(at == 9);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 9);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Options Directory Message: encoded, read back, and compared */
proctype check_options_directory_message() {
  OptionsDirectoryMessage options_directory_message_sent;
  OptionsDirectoryMessage options_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_options_directory_message(options_directory_message_sent, 0)
  :: pattern == 1 -> fill_options_directory_message(options_directory_message_sent, 32)
  :: pattern == 2 -> fill_options_directory_message(options_directory_message_sent, 255)
  :: else -> ramp_options_directory_message(options_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_options_directory_message(options_directory_message_sent);
    assert(at == 43);
    at = 0;
    decode_options_directory_message(options_directory_message_got);
    assert(at == 43);
    equal_options_directory_message(options_directory_message_got, options_directory_message_sent)
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
    assert(at == 13);
    at = 0;
    decode_trading_action_message(trading_action_message_got);
    assert(at == 13);
    equal_trading_action_message(trading_action_message_got, trading_action_message_sent)
  }
}

/* Security Open Message: encoded, read back, and compared */
proctype check_security_open_message() {
  SecurityOpenMessage security_open_message_sent;
  SecurityOpenMessage security_open_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_security_open_message(security_open_message_sent, 0)
  :: pattern == 1 -> fill_security_open_message(security_open_message_sent, 32)
  :: pattern == 2 -> fill_security_open_message(security_open_message_sent, 255)
  :: else -> ramp_security_open_message(security_open_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_security_open_message(security_open_message_sent);
    assert(at == 13);
    at = 0;
    decode_security_open_message(security_open_message_got);
    assert(at == 13);
    equal_security_open_message(security_open_message_got, security_open_message_sent)
  }
}

/* Add Order Message Short Message Form: encoded, read back, and compared */
proctype check_add_order_message_short_message_form() {
  AddOrderMessageShortMessageForm add_order_message_short_message_form_sent;
  AddOrderMessageShortMessageForm add_order_message_short_message_form_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_message_short_message_form(add_order_message_short_message_form_sent, 0)
  :: pattern == 1 -> fill_add_order_message_short_message_form(add_order_message_short_message_form_sent, 32)
  :: pattern == 2 -> fill_add_order_message_short_message_form(add_order_message_short_message_form_sent, 255)
  :: else -> ramp_add_order_message_short_message_form(add_order_message_short_message_form_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_message_short_message_form(add_order_message_short_message_form_sent);
    assert(at == 25);
    at = 0;
    decode_add_order_message_short_message_form(add_order_message_short_message_form_got);
    assert(at == 25);
    equal_add_order_message_short_message_form(add_order_message_short_message_form_got, add_order_message_short_message_form_sent)
  }
}

/* Add Order Message Long Form Message: encoded, read back, and compared */
proctype check_add_order_message_long_form_message() {
  AddOrderMessageLongFormMessage add_order_message_long_form_message_sent;
  AddOrderMessageLongFormMessage add_order_message_long_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_message_long_form_message(add_order_message_long_form_message_sent, 0)
  :: pattern == 1 -> fill_add_order_message_long_form_message(add_order_message_long_form_message_sent, 32)
  :: pattern == 2 -> fill_add_order_message_long_form_message(add_order_message_long_form_message_sent, 255)
  :: else -> ramp_add_order_message_long_form_message(add_order_message_long_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_message_long_form_message(add_order_message_long_form_message_sent);
    assert(at == 29);
    at = 0;
    decode_add_order_message_long_form_message(add_order_message_long_form_message_got);
    assert(at == 29);
    equal_add_order_message_long_form_message(add_order_message_long_form_message_got, add_order_message_long_form_message_sent)
  }
}

/* Add Quote Message Short Form Message: encoded, read back, and compared */
proctype check_add_quote_message_short_form_message() {
  AddQuoteMessageShortFormMessage add_quote_message_short_form_message_sent;
  AddQuoteMessageShortFormMessage add_quote_message_short_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_quote_message_short_form_message(add_quote_message_short_form_message_sent, 0)
  :: pattern == 1 -> fill_add_quote_message_short_form_message(add_quote_message_short_form_message_sent, 32)
  :: pattern == 2 -> fill_add_quote_message_short_form_message(add_quote_message_short_form_message_sent, 255)
  :: else -> ramp_add_quote_message_short_form_message(add_quote_message_short_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_quote_message_short_form_message(add_quote_message_short_form_message_sent);
    assert(at == 36);
    at = 0;
    decode_add_quote_message_short_form_message(add_quote_message_short_form_message_got);
    assert(at == 36);
    equal_add_quote_message_short_form_message(add_quote_message_short_form_message_got, add_quote_message_short_form_message_sent)
  }
}

/* Add Quote Message Long Form Message: encoded, read back, and compared */
proctype check_add_quote_message_long_form_message() {
  AddQuoteMessageLongFormMessage add_quote_message_long_form_message_sent;
  AddQuoteMessageLongFormMessage add_quote_message_long_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_quote_message_long_form_message(add_quote_message_long_form_message_sent, 0)
  :: pattern == 1 -> fill_add_quote_message_long_form_message(add_quote_message_long_form_message_sent, 32)
  :: pattern == 2 -> fill_add_quote_message_long_form_message(add_quote_message_long_form_message_sent, 255)
  :: else -> ramp_add_quote_message_long_form_message(add_quote_message_long_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_quote_message_long_form_message(add_quote_message_long_form_message_sent);
    assert(at == 44);
    at = 0;
    decode_add_quote_message_long_form_message(add_quote_message_long_form_message_got);
    assert(at == 44);
    equal_add_quote_message_long_form_message(add_quote_message_long_form_message_got, add_quote_message_long_form_message_sent)
  }
}

/* Single Side Executed Message: encoded, read back, and compared */
proctype check_single_side_executed_message() {
  SingleSideExecutedMessage single_side_executed_message_sent;
  SingleSideExecutedMessage single_side_executed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_side_executed_message(single_side_executed_message_sent, 0)
  :: pattern == 1 -> fill_single_side_executed_message(single_side_executed_message_sent, 32)
  :: pattern == 2 -> fill_single_side_executed_message(single_side_executed_message_sent, 255)
  :: else -> ramp_single_side_executed_message(single_side_executed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_side_executed_message(single_side_executed_message_sent);
    assert(at == 28);
    at = 0;
    decode_single_side_executed_message(single_side_executed_message_got);
    assert(at == 28);
    equal_single_side_executed_message(single_side_executed_message_got, single_side_executed_message_sent)
  }
}

/* Single Side Executed With Price Message: encoded, read back, and compared */
proctype check_single_side_executed_with_price_message() {
  SingleSideExecutedWithPriceMessage single_side_executed_with_price_message_sent;
  SingleSideExecutedWithPriceMessage single_side_executed_with_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_side_executed_with_price_message(single_side_executed_with_price_message_sent, 0)
  :: pattern == 1 -> fill_single_side_executed_with_price_message(single_side_executed_with_price_message_sent, 32)
  :: pattern == 2 -> fill_single_side_executed_with_price_message(single_side_executed_with_price_message_sent, 255)
  :: else -> ramp_single_side_executed_with_price_message(single_side_executed_with_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_side_executed_with_price_message(single_side_executed_with_price_message_sent);
    assert(at == 33);
    at = 0;
    decode_single_side_executed_with_price_message(single_side_executed_with_price_message_got);
    assert(at == 33);
    equal_single_side_executed_with_price_message(single_side_executed_with_price_message_got, single_side_executed_with_price_message_sent)
  }
}

/* Order Cancel Message: encoded, read back, and compared */
proctype check_order_cancel_message() {
  OrderCancelMessage order_cancel_message_sent;
  OrderCancelMessage order_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancel_message(order_cancel_message_sent, 0)
  :: pattern == 1 -> fill_order_cancel_message(order_cancel_message_sent, 32)
  :: pattern == 2 -> fill_order_cancel_message(order_cancel_message_sent, 255)
  :: else -> ramp_order_cancel_message(order_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancel_message(order_cancel_message_sent);
    assert(at == 20);
    at = 0;
    decode_order_cancel_message(order_cancel_message_got);
    assert(at == 20);
    equal_order_cancel_message(order_cancel_message_got, order_cancel_message_sent)
  }
}

/* Single Side Replace Message Short Form: encoded, read back, and compared */
proctype check_single_side_replace_message_short_form() {
  SingleSideReplaceMessageShortForm single_side_replace_message_short_form_sent;
  SingleSideReplaceMessageShortForm single_side_replace_message_short_form_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_side_replace_message_short_form(single_side_replace_message_short_form_sent, 0)
  :: pattern == 1 -> fill_single_side_replace_message_short_form(single_side_replace_message_short_form_sent, 32)
  :: pattern == 2 -> fill_single_side_replace_message_short_form(single_side_replace_message_short_form_sent, 255)
  :: else -> ramp_single_side_replace_message_short_form(single_side_replace_message_short_form_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_side_replace_message_short_form(single_side_replace_message_short_form_sent);
    assert(at == 28);
    at = 0;
    decode_single_side_replace_message_short_form(single_side_replace_message_short_form_got);
    assert(at == 28);
    equal_single_side_replace_message_short_form(single_side_replace_message_short_form_got, single_side_replace_message_short_form_sent)
  }
}

/* Single Side Replace Message Long Form: encoded, read back, and compared */
proctype check_single_side_replace_message_long_form() {
  SingleSideReplaceMessageLongForm single_side_replace_message_long_form_sent;
  SingleSideReplaceMessageLongForm single_side_replace_message_long_form_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_side_replace_message_long_form(single_side_replace_message_long_form_sent, 0)
  :: pattern == 1 -> fill_single_side_replace_message_long_form(single_side_replace_message_long_form_sent, 32)
  :: pattern == 2 -> fill_single_side_replace_message_long_form(single_side_replace_message_long_form_sent, 255)
  :: else -> ramp_single_side_replace_message_long_form(single_side_replace_message_long_form_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_side_replace_message_long_form(single_side_replace_message_long_form_sent);
    assert(at == 32);
    at = 0;
    decode_single_side_replace_message_long_form(single_side_replace_message_long_form_got);
    assert(at == 32);
    equal_single_side_replace_message_long_form(single_side_replace_message_long_form_got, single_side_replace_message_long_form_sent)
  }
}

/* Single Side Delete Message: encoded, read back, and compared */
proctype check_single_side_delete_message() {
  SingleSideDeleteMessage single_side_delete_message_sent;
  SingleSideDeleteMessage single_side_delete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_side_delete_message(single_side_delete_message_sent, 0)
  :: pattern == 1 -> fill_single_side_delete_message(single_side_delete_message_sent, 32)
  :: pattern == 2 -> fill_single_side_delete_message(single_side_delete_message_sent, 255)
  :: else -> ramp_single_side_delete_message(single_side_delete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_side_delete_message(single_side_delete_message_sent);
    assert(at == 16);
    at = 0;
    decode_single_side_delete_message(single_side_delete_message_got);
    assert(at == 16);
    equal_single_side_delete_message(single_side_delete_message_got, single_side_delete_message_sent)
  }
}

/* Single Side Change Message: encoded, read back, and compared */
proctype check_single_side_change_message() {
  SingleSideChangeMessage single_side_change_message_sent;
  SingleSideChangeMessage single_side_change_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_side_change_message(single_side_change_message_sent, 0)
  :: pattern == 1 -> fill_single_side_change_message(single_side_change_message_sent, 32)
  :: pattern == 2 -> fill_single_side_change_message(single_side_change_message_sent, 255)
  :: else -> ramp_single_side_change_message(single_side_change_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_side_change_message(single_side_change_message_sent);
    assert(at == 25);
    at = 0;
    decode_single_side_change_message(single_side_change_message_got);
    assert(at == 25);
    equal_single_side_change_message(single_side_change_message_got, single_side_change_message_sent)
  }
}

/* Quote Replace Message Short Form: encoded, read back, and compared */
proctype check_quote_replace_message_short_form() {
  QuoteReplaceMessageShortForm quote_replace_message_short_form_sent;
  QuoteReplaceMessageShortForm quote_replace_message_short_form_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_replace_message_short_form(quote_replace_message_short_form_sent, 0)
  :: pattern == 1 -> fill_quote_replace_message_short_form(quote_replace_message_short_form_sent, 32)
  :: pattern == 2 -> fill_quote_replace_message_short_form(quote_replace_message_short_form_sent, 255)
  :: else -> ramp_quote_replace_message_short_form(quote_replace_message_short_form_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_replace_message_short_form(quote_replace_message_short_form_sent);
    assert(at == 48);
    at = 0;
    decode_quote_replace_message_short_form(quote_replace_message_short_form_got);
    assert(at == 48);
    equal_quote_replace_message_short_form(quote_replace_message_short_form_got, quote_replace_message_short_form_sent)
  }
}

/* Quote Replace Message Long Form: encoded, read back, and compared */
proctype check_quote_replace_message_long_form() {
  QuoteReplaceMessageLongForm quote_replace_message_long_form_sent;
  QuoteReplaceMessageLongForm quote_replace_message_long_form_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_replace_message_long_form(quote_replace_message_long_form_sent, 0)
  :: pattern == 1 -> fill_quote_replace_message_long_form(quote_replace_message_long_form_sent, 32)
  :: pattern == 2 -> fill_quote_replace_message_long_form(quote_replace_message_long_form_sent, 255)
  :: else -> ramp_quote_replace_message_long_form(quote_replace_message_long_form_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_replace_message_long_form(quote_replace_message_long_form_sent);
    assert(at == 56);
    at = 0;
    decode_quote_replace_message_long_form(quote_replace_message_long_form_got);
    assert(at == 56);
    equal_quote_replace_message_long_form(quote_replace_message_long_form_got, quote_replace_message_long_form_sent)
  }
}

/* Quote Delete Message: encoded, read back, and compared */
proctype check_quote_delete_message() {
  QuoteDeleteMessage quote_delete_message_sent;
  QuoteDeleteMessage quote_delete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_delete_message(quote_delete_message_sent, 0)
  :: pattern == 1 -> fill_quote_delete_message(quote_delete_message_sent, 32)
  :: pattern == 2 -> fill_quote_delete_message(quote_delete_message_sent, 255)
  :: else -> ramp_quote_delete_message(quote_delete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_delete_message(quote_delete_message_sent);
    assert(at == 24);
    at = 0;
    decode_quote_delete_message(quote_delete_message_got);
    assert(at == 24);
    equal_quote_delete_message(quote_delete_message_got, quote_delete_message_sent)
  }
}

/* Options Trade Messages Non Auction: encoded, read back, and compared */
proctype check_options_trade_messages_non_auction() {
  OptionsTradeMessagesNonAuction options_trade_messages_non_auction_sent;
  OptionsTradeMessagesNonAuction options_trade_messages_non_auction_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_options_trade_messages_non_auction(options_trade_messages_non_auction_sent, 0)
  :: pattern == 1 -> fill_options_trade_messages_non_auction(options_trade_messages_non_auction_sent, 32)
  :: pattern == 2 -> fill_options_trade_messages_non_auction(options_trade_messages_non_auction_sent, 255)
  :: else -> ramp_options_trade_messages_non_auction(options_trade_messages_non_auction_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_options_trade_messages_non_auction(options_trade_messages_non_auction_sent);
    assert(at == 29);
    at = 0;
    decode_options_trade_messages_non_auction(options_trade_messages_non_auction_got);
    assert(at == 29);
    equal_options_trade_messages_non_auction(options_trade_messages_non_auction_got, options_trade_messages_non_auction_sent)
  }
}

/* Options Cross Trade Message: encoded, read back, and compared */
proctype check_options_cross_trade_message() {
  OptionsCrossTradeMessage options_cross_trade_message_sent;
  OptionsCrossTradeMessage options_cross_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_options_cross_trade_message(options_cross_trade_message_sent, 0)
  :: pattern == 1 -> fill_options_cross_trade_message(options_cross_trade_message_sent, 32)
  :: pattern == 2 -> fill_options_cross_trade_message(options_cross_trade_message_sent, 255)
  :: else -> ramp_options_cross_trade_message(options_cross_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_options_cross_trade_message(options_cross_trade_message_sent);
    assert(at == 29);
    at = 0;
    decode_options_cross_trade_message(options_cross_trade_message_got);
    assert(at == 29);
    equal_options_cross_trade_message(options_cross_trade_message_got, options_cross_trade_message_sent)
  }
}

/* Broken Trade Order Executed Message: encoded, read back, and compared */
proctype check_broken_trade_order_executed_message() {
  BrokenTradeOrderExecutedMessage broken_trade_order_executed_message_sent;
  BrokenTradeOrderExecutedMessage broken_trade_order_executed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_broken_trade_order_executed_message(broken_trade_order_executed_message_sent, 0)
  :: pattern == 1 -> fill_broken_trade_order_executed_message(broken_trade_order_executed_message_sent, 32)
  :: pattern == 2 -> fill_broken_trade_order_executed_message(broken_trade_order_executed_message_sent, 255)
  :: else -> ramp_broken_trade_order_executed_message(broken_trade_order_executed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_broken_trade_order_executed_message(broken_trade_order_executed_message_sent);
    assert(at == 16);
    at = 0;
    decode_broken_trade_order_executed_message(broken_trade_order_executed_message_got);
    assert(at == 16);
    equal_broken_trade_order_executed_message(broken_trade_order_executed_message_got, broken_trade_order_executed_message_sent)
  }
}

/* Noii Message: encoded, read back, and compared */
proctype check_noii_message() {
  NoiiMessage noii_message_sent;
  NoiiMessage noii_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_noii_message(noii_message_sent, 0)
  :: pattern == 1 -> fill_noii_message(noii_message_sent, 32)
  :: pattern == 2 -> fill_noii_message(noii_message_sent, 255)
  :: else -> ramp_noii_message(noii_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_noii_message(noii_message_sent);
    assert(at == 34);
    at = 0;
    decode_noii_message(noii_message_got);
    assert(at == 34);
    equal_noii_message(noii_message_got, noii_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_server_packet_header()
  :: run check_login_accepted_packet()
  :: run check_login_rejected_packet()
  :: run check_system_event_message()
  :: run check_options_directory_message()
  :: run check_trading_action_message()
  :: run check_security_open_message()
  :: run check_add_order_message_short_message_form()
  :: run check_add_order_message_long_form_message()
  :: run check_add_quote_message_short_form_message()
  :: run check_add_quote_message_long_form_message()
  :: run check_single_side_executed_message()
  :: run check_single_side_executed_with_price_message()
  :: run check_order_cancel_message()
  :: run check_single_side_replace_message_short_form()
  :: run check_single_side_replace_message_long_form()
  :: run check_single_side_delete_message()
  :: run check_single_side_change_message()
  :: run check_quote_replace_message_short_form()
  :: run check_quote_replace_message_long_form()
  :: run check_quote_delete_message()
  :: run check_options_trade_messages_non_auction()
  :: run check_options_cross_trade_message()
  :: run check_broken_trade_order_executed_message()
  :: run check_noii_message()
  fi
}
