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
#define WIRE 169

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

/* System Event message informs of a market or a session-level event. */
typedef SystemEventMessage {
  byte timestamp[8];
  byte event_code;
  byte version;
  byte sub_version
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = system_event_message_value;
  system_event_message_record.version = system_event_message_value;
  system_event_message_record.sub_version = system_event_message_value;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 8 + 1) % 256;
  system_event_message_record.version = (system_event_message_base + 9 + 1) % 256;
  system_event_message_record.sub_version = (system_event_message_base + 10 + 1) % 256;
  skip
}

/* System Event Message to the wire, 11 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> wire[at] = system_event_message_record.timestamp[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  wire[at] = system_event_message_record.version; at = at + 1;
  wire[at] = system_event_message_record.sub_version; at = at + 1;
  skip
}

/* System Event Message off the wire, 11 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = wire[at]; at = at + 1;
  system_event_message_record.version = wire[at]; at = at + 1;
  system_event_message_record.sub_version = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> assert(system_event_message_read.timestamp[system_event_message_at] == system_event_message_written.timestamp[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  assert(system_event_message_read.version == system_event_message_written.version);
  assert(system_event_message_read.sub_version == system_event_message_written.sub_version);
  skip
}

/* ---- Simple Instrument Directory Message: 69 bytes --------------------------- */

/* At the start of each trading day and during intra-day market state changes, the system disseminates directory messages for all symbols trading on the system. */
typedef SimpleInstrumentDirectoryMessage {
  byte timestamp[8];
  byte product_id[2];
  byte product_name[13];
  byte instrument_id[4];
  byte expir_year;
  byte expir_mon;
  byte expir_day;
  byte strike_price[8];
  byte option_type;
  byte closing_type;
  byte tradable;
  byte closing_only;
  byte contract_size[2];
  byte mpv;
  byte security_symbol[8];
  byte reserved_16[16]
};

int simple_instrument_directory_message_at;

/* every byte of Simple Instrument Directory Message set to one value */
inline fill_simple_instrument_directory_message(simple_instrument_directory_message_record, simple_instrument_directory_message_value) {
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 8 -> simple_instrument_directory_message_record.timestamp[simple_instrument_directory_message_at] = simple_instrument_directory_message_value; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 2 -> simple_instrument_directory_message_record.product_id[simple_instrument_directory_message_at] = simple_instrument_directory_message_value; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 13 -> simple_instrument_directory_message_record.product_name[simple_instrument_directory_message_at] = simple_instrument_directory_message_value; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 4 -> simple_instrument_directory_message_record.instrument_id[simple_instrument_directory_message_at] = simple_instrument_directory_message_value; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_record.expir_year = simple_instrument_directory_message_value;
  simple_instrument_directory_message_record.expir_mon = simple_instrument_directory_message_value;
  simple_instrument_directory_message_record.expir_day = simple_instrument_directory_message_value;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 8 -> simple_instrument_directory_message_record.strike_price[simple_instrument_directory_message_at] = simple_instrument_directory_message_value; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_record.option_type = simple_instrument_directory_message_value;
  simple_instrument_directory_message_record.closing_type = simple_instrument_directory_message_value;
  simple_instrument_directory_message_record.tradable = simple_instrument_directory_message_value;
  simple_instrument_directory_message_record.closing_only = simple_instrument_directory_message_value;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 2 -> simple_instrument_directory_message_record.contract_size[simple_instrument_directory_message_at] = simple_instrument_directory_message_value; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_record.mpv = simple_instrument_directory_message_value;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 8 -> simple_instrument_directory_message_record.security_symbol[simple_instrument_directory_message_at] = simple_instrument_directory_message_value; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 16 -> simple_instrument_directory_message_record.reserved_16[simple_instrument_directory_message_at] = simple_instrument_directory_message_value; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Simple Instrument Directory Message set to where it lies, so a field read out of place says so */
inline ramp_simple_instrument_directory_message(simple_instrument_directory_message_record, simple_instrument_directory_message_base) {
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 8 -> simple_instrument_directory_message_record.timestamp[simple_instrument_directory_message_at] = (simple_instrument_directory_message_base + 0 + simple_instrument_directory_message_at + 1) % 256; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 2 -> simple_instrument_directory_message_record.product_id[simple_instrument_directory_message_at] = (simple_instrument_directory_message_base + 8 + simple_instrument_directory_message_at + 1) % 256; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 13 -> simple_instrument_directory_message_record.product_name[simple_instrument_directory_message_at] = (simple_instrument_directory_message_base + 10 + simple_instrument_directory_message_at + 1) % 256; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 4 -> simple_instrument_directory_message_record.instrument_id[simple_instrument_directory_message_at] = (simple_instrument_directory_message_base + 23 + simple_instrument_directory_message_at + 1) % 256; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_record.expir_year = (simple_instrument_directory_message_base + 27 + 1) % 256;
  simple_instrument_directory_message_record.expir_mon = (simple_instrument_directory_message_base + 28 + 1) % 256;
  simple_instrument_directory_message_record.expir_day = (simple_instrument_directory_message_base + 29 + 1) % 256;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 8 -> simple_instrument_directory_message_record.strike_price[simple_instrument_directory_message_at] = (simple_instrument_directory_message_base + 30 + simple_instrument_directory_message_at + 1) % 256; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_record.option_type = (simple_instrument_directory_message_base + 38 + 1) % 256;
  simple_instrument_directory_message_record.closing_type = (simple_instrument_directory_message_base + 39 + 1) % 256;
  simple_instrument_directory_message_record.tradable = (simple_instrument_directory_message_base + 40 + 1) % 256;
  simple_instrument_directory_message_record.closing_only = (simple_instrument_directory_message_base + 41 + 1) % 256;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 2 -> simple_instrument_directory_message_record.contract_size[simple_instrument_directory_message_at] = (simple_instrument_directory_message_base + 42 + simple_instrument_directory_message_at + 1) % 256; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_record.mpv = (simple_instrument_directory_message_base + 44 + 1) % 256;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 8 -> simple_instrument_directory_message_record.security_symbol[simple_instrument_directory_message_at] = (simple_instrument_directory_message_base + 45 + simple_instrument_directory_message_at + 1) % 256; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 16 -> simple_instrument_directory_message_record.reserved_16[simple_instrument_directory_message_at] = (simple_instrument_directory_message_base + 53 + simple_instrument_directory_message_at + 1) % 256; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Instrument Directory Message to the wire, 69 bytes from where the cursor stands */
inline encode_simple_instrument_directory_message(simple_instrument_directory_message_record) {
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 8 -> wire[at] = simple_instrument_directory_message_record.timestamp[simple_instrument_directory_message_at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 2 -> wire[at] = simple_instrument_directory_message_record.product_id[simple_instrument_directory_message_at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 13 -> wire[at] = simple_instrument_directory_message_record.product_name[simple_instrument_directory_message_at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 4 -> wire[at] = simple_instrument_directory_message_record.instrument_id[simple_instrument_directory_message_at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_instrument_directory_message_record.expir_year; at = at + 1;
  wire[at] = simple_instrument_directory_message_record.expir_mon; at = at + 1;
  wire[at] = simple_instrument_directory_message_record.expir_day; at = at + 1;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 8 -> wire[at] = simple_instrument_directory_message_record.strike_price[simple_instrument_directory_message_at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_instrument_directory_message_record.option_type; at = at + 1;
  wire[at] = simple_instrument_directory_message_record.closing_type; at = at + 1;
  wire[at] = simple_instrument_directory_message_record.tradable; at = at + 1;
  wire[at] = simple_instrument_directory_message_record.closing_only; at = at + 1;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 2 -> wire[at] = simple_instrument_directory_message_record.contract_size[simple_instrument_directory_message_at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_instrument_directory_message_record.mpv; at = at + 1;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 8 -> wire[at] = simple_instrument_directory_message_record.security_symbol[simple_instrument_directory_message_at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 16 -> wire[at] = simple_instrument_directory_message_record.reserved_16[simple_instrument_directory_message_at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Instrument Directory Message off the wire, 69 bytes from where the cursor stands */
inline decode_simple_instrument_directory_message(simple_instrument_directory_message_record) {
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 8 -> simple_instrument_directory_message_record.timestamp[simple_instrument_directory_message_at] = wire[at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 2 -> simple_instrument_directory_message_record.product_id[simple_instrument_directory_message_at] = wire[at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 13 -> simple_instrument_directory_message_record.product_name[simple_instrument_directory_message_at] = wire[at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 4 -> simple_instrument_directory_message_record.instrument_id[simple_instrument_directory_message_at] = wire[at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_record.expir_year = wire[at]; at = at + 1;
  simple_instrument_directory_message_record.expir_mon = wire[at]; at = at + 1;
  simple_instrument_directory_message_record.expir_day = wire[at]; at = at + 1;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 8 -> simple_instrument_directory_message_record.strike_price[simple_instrument_directory_message_at] = wire[at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_record.option_type = wire[at]; at = at + 1;
  simple_instrument_directory_message_record.closing_type = wire[at]; at = at + 1;
  simple_instrument_directory_message_record.tradable = wire[at]; at = at + 1;
  simple_instrument_directory_message_record.closing_only = wire[at]; at = at + 1;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 2 -> simple_instrument_directory_message_record.contract_size[simple_instrument_directory_message_at] = wire[at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_record.mpv = wire[at]; at = at + 1;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 8 -> simple_instrument_directory_message_record.security_symbol[simple_instrument_directory_message_at] = wire[at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 16 -> simple_instrument_directory_message_record.reserved_16[simple_instrument_directory_message_at] = wire[at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Simple Instrument Directory Message is what was written, byte for byte */
inline equal_simple_instrument_directory_message(simple_instrument_directory_message_read, simple_instrument_directory_message_written) {
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 8 -> assert(simple_instrument_directory_message_read.timestamp[simple_instrument_directory_message_at] == simple_instrument_directory_message_written.timestamp[simple_instrument_directory_message_at]); simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 2 -> assert(simple_instrument_directory_message_read.product_id[simple_instrument_directory_message_at] == simple_instrument_directory_message_written.product_id[simple_instrument_directory_message_at]); simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 13 -> assert(simple_instrument_directory_message_read.product_name[simple_instrument_directory_message_at] == simple_instrument_directory_message_written.product_name[simple_instrument_directory_message_at]); simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 4 -> assert(simple_instrument_directory_message_read.instrument_id[simple_instrument_directory_message_at] == simple_instrument_directory_message_written.instrument_id[simple_instrument_directory_message_at]); simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  assert(simple_instrument_directory_message_read.expir_year == simple_instrument_directory_message_written.expir_year);
  assert(simple_instrument_directory_message_read.expir_mon == simple_instrument_directory_message_written.expir_mon);
  assert(simple_instrument_directory_message_read.expir_day == simple_instrument_directory_message_written.expir_day);
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 8 -> assert(simple_instrument_directory_message_read.strike_price[simple_instrument_directory_message_at] == simple_instrument_directory_message_written.strike_price[simple_instrument_directory_message_at]); simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  assert(simple_instrument_directory_message_read.option_type == simple_instrument_directory_message_written.option_type);
  assert(simple_instrument_directory_message_read.closing_type == simple_instrument_directory_message_written.closing_type);
  assert(simple_instrument_directory_message_read.tradable == simple_instrument_directory_message_written.tradable);
  assert(simple_instrument_directory_message_read.closing_only == simple_instrument_directory_message_written.closing_only);
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 2 -> assert(simple_instrument_directory_message_read.contract_size[simple_instrument_directory_message_at] == simple_instrument_directory_message_written.contract_size[simple_instrument_directory_message_at]); simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  assert(simple_instrument_directory_message_read.mpv == simple_instrument_directory_message_written.mpv);
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 8 -> assert(simple_instrument_directory_message_read.security_symbol[simple_instrument_directory_message_at] == simple_instrument_directory_message_written.security_symbol[simple_instrument_directory_message_at]); simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 16 -> assert(simple_instrument_directory_message_read.reserved_16[simple_instrument_directory_message_at] == simple_instrument_directory_message_written.reserved_16[simple_instrument_directory_message_at]); simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Trading Action Message: 15 bytes ----------------------------- */

/* This message notifies of changes to the trading status of an instrument. */
typedef InstrumentTradingActionMessage {
  byte timestamp[8];
  byte product_id[2];
  byte instrument_id[4];
  byte trading_state
};

int instrument_trading_action_message_at;

/* every byte of Instrument Trading Action Message set to one value */
inline fill_instrument_trading_action_message(instrument_trading_action_message_record, instrument_trading_action_message_value) {
  instrument_trading_action_message_at = 0;
  do
  :: instrument_trading_action_message_at < 8 -> instrument_trading_action_message_record.timestamp[instrument_trading_action_message_at] = instrument_trading_action_message_value; instrument_trading_action_message_at = instrument_trading_action_message_at + 1
  :: else -> break
  od;
  instrument_trading_action_message_at = 0;
  do
  :: instrument_trading_action_message_at < 2 -> instrument_trading_action_message_record.product_id[instrument_trading_action_message_at] = instrument_trading_action_message_value; instrument_trading_action_message_at = instrument_trading_action_message_at + 1
  :: else -> break
  od;
  instrument_trading_action_message_at = 0;
  do
  :: instrument_trading_action_message_at < 4 -> instrument_trading_action_message_record.instrument_id[instrument_trading_action_message_at] = instrument_trading_action_message_value; instrument_trading_action_message_at = instrument_trading_action_message_at + 1
  :: else -> break
  od;
  instrument_trading_action_message_record.trading_state = instrument_trading_action_message_value;
  skip
}

/* each byte of Instrument Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_trading_action_message(instrument_trading_action_message_record, instrument_trading_action_message_base) {
  instrument_trading_action_message_at = 0;
  do
  :: instrument_trading_action_message_at < 8 -> instrument_trading_action_message_record.timestamp[instrument_trading_action_message_at] = (instrument_trading_action_message_base + 0 + instrument_trading_action_message_at + 1) % 256; instrument_trading_action_message_at = instrument_trading_action_message_at + 1
  :: else -> break
  od;
  instrument_trading_action_message_at = 0;
  do
  :: instrument_trading_action_message_at < 2 -> instrument_trading_action_message_record.product_id[instrument_trading_action_message_at] = (instrument_trading_action_message_base + 8 + instrument_trading_action_message_at + 1) % 256; instrument_trading_action_message_at = instrument_trading_action_message_at + 1
  :: else -> break
  od;
  instrument_trading_action_message_at = 0;
  do
  :: instrument_trading_action_message_at < 4 -> instrument_trading_action_message_record.instrument_id[instrument_trading_action_message_at] = (instrument_trading_action_message_base + 10 + instrument_trading_action_message_at + 1) % 256; instrument_trading_action_message_at = instrument_trading_action_message_at + 1
  :: else -> break
  od;
  instrument_trading_action_message_record.trading_state = (instrument_trading_action_message_base + 14 + 1) % 256;
  skip
}

/* Instrument Trading Action Message to the wire, 15 bytes from where the cursor stands */
inline encode_instrument_trading_action_message(instrument_trading_action_message_record) {
  instrument_trading_action_message_at = 0;
  do
  :: instrument_trading_action_message_at < 8 -> wire[at] = instrument_trading_action_message_record.timestamp[instrument_trading_action_message_at]; at = at + 1; instrument_trading_action_message_at = instrument_trading_action_message_at + 1
  :: else -> break
  od;
  instrument_trading_action_message_at = 0;
  do
  :: instrument_trading_action_message_at < 2 -> wire[at] = instrument_trading_action_message_record.product_id[instrument_trading_action_message_at]; at = at + 1; instrument_trading_action_message_at = instrument_trading_action_message_at + 1
  :: else -> break
  od;
  instrument_trading_action_message_at = 0;
  do
  :: instrument_trading_action_message_at < 4 -> wire[at] = instrument_trading_action_message_record.instrument_id[instrument_trading_action_message_at]; at = at + 1; instrument_trading_action_message_at = instrument_trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = instrument_trading_action_message_record.trading_state; at = at + 1;
  skip
}

/* Instrument Trading Action Message off the wire, 15 bytes from where the cursor stands */
inline decode_instrument_trading_action_message(instrument_trading_action_message_record) {
  instrument_trading_action_message_at = 0;
  do
  :: instrument_trading_action_message_at < 8 -> instrument_trading_action_message_record.timestamp[instrument_trading_action_message_at] = wire[at]; at = at + 1; instrument_trading_action_message_at = instrument_trading_action_message_at + 1
  :: else -> break
  od;
  instrument_trading_action_message_at = 0;
  do
  :: instrument_trading_action_message_at < 2 -> instrument_trading_action_message_record.product_id[instrument_trading_action_message_at] = wire[at]; at = at + 1; instrument_trading_action_message_at = instrument_trading_action_message_at + 1
  :: else -> break
  od;
  instrument_trading_action_message_at = 0;
  do
  :: instrument_trading_action_message_at < 4 -> instrument_trading_action_message_record.instrument_id[instrument_trading_action_message_at] = wire[at]; at = at + 1; instrument_trading_action_message_at = instrument_trading_action_message_at + 1
  :: else -> break
  od;
  instrument_trading_action_message_record.trading_state = wire[at]; at = at + 1;
  skip
}

/* what was read of Instrument Trading Action Message is what was written, byte for byte */
inline equal_instrument_trading_action_message(instrument_trading_action_message_read, instrument_trading_action_message_written) {
  instrument_trading_action_message_at = 0;
  do
  :: instrument_trading_action_message_at < 8 -> assert(instrument_trading_action_message_read.timestamp[instrument_trading_action_message_at] == instrument_trading_action_message_written.timestamp[instrument_trading_action_message_at]); instrument_trading_action_message_at = instrument_trading_action_message_at + 1
  :: else -> break
  od;
  instrument_trading_action_message_at = 0;
  do
  :: instrument_trading_action_message_at < 2 -> assert(instrument_trading_action_message_read.product_id[instrument_trading_action_message_at] == instrument_trading_action_message_written.product_id[instrument_trading_action_message_at]); instrument_trading_action_message_at = instrument_trading_action_message_at + 1
  :: else -> break
  od;
  instrument_trading_action_message_at = 0;
  do
  :: instrument_trading_action_message_at < 4 -> assert(instrument_trading_action_message_read.instrument_id[instrument_trading_action_message_at] == instrument_trading_action_message_written.instrument_id[instrument_trading_action_message_at]); instrument_trading_action_message_at = instrument_trading_action_message_at + 1
  :: else -> break
  od;
  assert(instrument_trading_action_message_read.trading_state == instrument_trading_action_message_written.trading_state);
  skip
}

/* ---- Order Accepted Short Form Message: 65 bytes ----------------------------- */

/* This message is used to acknowledge a valid order submitted via New Order (Short Form). */
typedef OrderAcceptedShortFormMessage {
  byte timestamp[8];
  byte firm_id[4];
  byte instrument_id[4];
  byte order_id[8];
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

int order_accepted_short_form_message_at;

/* every byte of Order Accepted Short Form Message set to one value */
inline fill_order_accepted_short_form_message(order_accepted_short_form_message_record, order_accepted_short_form_message_value) {
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 8 -> order_accepted_short_form_message_record.timestamp[order_accepted_short_form_message_at] = order_accepted_short_form_message_value; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 4 -> order_accepted_short_form_message_record.firm_id[order_accepted_short_form_message_at] = order_accepted_short_form_message_value; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 4 -> order_accepted_short_form_message_record.instrument_id[order_accepted_short_form_message_at] = order_accepted_short_form_message_value; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 8 -> order_accepted_short_form_message_record.order_id[order_accepted_short_form_message_at] = order_accepted_short_form_message_value; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 16 -> order_accepted_short_form_message_record.cl_ord_id[order_accepted_short_form_message_at] = order_accepted_short_form_message_value; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_record.alo_inst = order_accepted_short_form_message_value;
  order_accepted_short_form_message_record.iso = order_accepted_short_form_message_value;
  order_accepted_short_form_message_record.side = order_accepted_short_form_message_value;
  order_accepted_short_form_message_record.order_type = order_accepted_short_form_message_value;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 8 -> order_accepted_short_form_message_record.price[order_accepted_short_form_message_at] = order_accepted_short_form_message_value; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 2 -> order_accepted_short_form_message_record.quantity_short[order_accepted_short_form_message_at] = order_accepted_short_form_message_value; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_record.tif = order_accepted_short_form_message_value;
  order_accepted_short_form_message_record.capacity = order_accepted_short_form_message_value;
  order_accepted_short_form_message_record.auction_type = order_accepted_short_form_message_value;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 4 -> order_accepted_short_form_message_record.auction_id[order_accepted_short_form_message_at] = order_accepted_short_form_message_value; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_record.price_protection = order_accepted_short_form_message_value;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 2 -> order_accepted_short_form_message_record.position_effect_mask[order_accepted_short_form_message_at] = order_accepted_short_form_message_value; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_record.stock_capacity = order_accepted_short_form_message_value;
  skip
}

/* each byte of Order Accepted Short Form Message set to where it lies, so a field read out of place says so */
inline ramp_order_accepted_short_form_message(order_accepted_short_form_message_record, order_accepted_short_form_message_base) {
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 8 -> order_accepted_short_form_message_record.timestamp[order_accepted_short_form_message_at] = (order_accepted_short_form_message_base + 0 + order_accepted_short_form_message_at + 1) % 256; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 4 -> order_accepted_short_form_message_record.firm_id[order_accepted_short_form_message_at] = (order_accepted_short_form_message_base + 8 + order_accepted_short_form_message_at + 1) % 256; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 4 -> order_accepted_short_form_message_record.instrument_id[order_accepted_short_form_message_at] = (order_accepted_short_form_message_base + 12 + order_accepted_short_form_message_at + 1) % 256; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 8 -> order_accepted_short_form_message_record.order_id[order_accepted_short_form_message_at] = (order_accepted_short_form_message_base + 16 + order_accepted_short_form_message_at + 1) % 256; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 16 -> order_accepted_short_form_message_record.cl_ord_id[order_accepted_short_form_message_at] = (order_accepted_short_form_message_base + 24 + order_accepted_short_form_message_at + 1) % 256; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_record.alo_inst = (order_accepted_short_form_message_base + 40 + 1) % 256;
  order_accepted_short_form_message_record.iso = (order_accepted_short_form_message_base + 41 + 1) % 256;
  order_accepted_short_form_message_record.side = (order_accepted_short_form_message_base + 42 + 1) % 256;
  order_accepted_short_form_message_record.order_type = (order_accepted_short_form_message_base + 43 + 1) % 256;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 8 -> order_accepted_short_form_message_record.price[order_accepted_short_form_message_at] = (order_accepted_short_form_message_base + 44 + order_accepted_short_form_message_at + 1) % 256; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 2 -> order_accepted_short_form_message_record.quantity_short[order_accepted_short_form_message_at] = (order_accepted_short_form_message_base + 52 + order_accepted_short_form_message_at + 1) % 256; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_record.tif = (order_accepted_short_form_message_base + 54 + 1) % 256;
  order_accepted_short_form_message_record.capacity = (order_accepted_short_form_message_base + 55 + 1) % 256;
  order_accepted_short_form_message_record.auction_type = (order_accepted_short_form_message_base + 56 + 1) % 256;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 4 -> order_accepted_short_form_message_record.auction_id[order_accepted_short_form_message_at] = (order_accepted_short_form_message_base + 57 + order_accepted_short_form_message_at + 1) % 256; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_record.price_protection = (order_accepted_short_form_message_base + 61 + 1) % 256;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 2 -> order_accepted_short_form_message_record.position_effect_mask[order_accepted_short_form_message_at] = (order_accepted_short_form_message_base + 62 + order_accepted_short_form_message_at + 1) % 256; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_record.stock_capacity = (order_accepted_short_form_message_base + 64 + 1) % 256;
  skip
}

/* Order Accepted Short Form Message to the wire, 65 bytes from where the cursor stands */
inline encode_order_accepted_short_form_message(order_accepted_short_form_message_record) {
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 8 -> wire[at] = order_accepted_short_form_message_record.timestamp[order_accepted_short_form_message_at]; at = at + 1; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 4 -> wire[at] = order_accepted_short_form_message_record.firm_id[order_accepted_short_form_message_at]; at = at + 1; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 4 -> wire[at] = order_accepted_short_form_message_record.instrument_id[order_accepted_short_form_message_at]; at = at + 1; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 8 -> wire[at] = order_accepted_short_form_message_record.order_id[order_accepted_short_form_message_at]; at = at + 1; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 16 -> wire[at] = order_accepted_short_form_message_record.cl_ord_id[order_accepted_short_form_message_at]; at = at + 1; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  wire[at] = order_accepted_short_form_message_record.alo_inst; at = at + 1;
  wire[at] = order_accepted_short_form_message_record.iso; at = at + 1;
  wire[at] = order_accepted_short_form_message_record.side; at = at + 1;
  wire[at] = order_accepted_short_form_message_record.order_type; at = at + 1;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 8 -> wire[at] = order_accepted_short_form_message_record.price[order_accepted_short_form_message_at]; at = at + 1; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 2 -> wire[at] = order_accepted_short_form_message_record.quantity_short[order_accepted_short_form_message_at]; at = at + 1; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  wire[at] = order_accepted_short_form_message_record.tif; at = at + 1;
  wire[at] = order_accepted_short_form_message_record.capacity; at = at + 1;
  wire[at] = order_accepted_short_form_message_record.auction_type; at = at + 1;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 4 -> wire[at] = order_accepted_short_form_message_record.auction_id[order_accepted_short_form_message_at]; at = at + 1; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  wire[at] = order_accepted_short_form_message_record.price_protection; at = at + 1;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 2 -> wire[at] = order_accepted_short_form_message_record.position_effect_mask[order_accepted_short_form_message_at]; at = at + 1; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  wire[at] = order_accepted_short_form_message_record.stock_capacity; at = at + 1;
  skip
}

/* Order Accepted Short Form Message off the wire, 65 bytes from where the cursor stands */
inline decode_order_accepted_short_form_message(order_accepted_short_form_message_record) {
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 8 -> order_accepted_short_form_message_record.timestamp[order_accepted_short_form_message_at] = wire[at]; at = at + 1; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 4 -> order_accepted_short_form_message_record.firm_id[order_accepted_short_form_message_at] = wire[at]; at = at + 1; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 4 -> order_accepted_short_form_message_record.instrument_id[order_accepted_short_form_message_at] = wire[at]; at = at + 1; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 8 -> order_accepted_short_form_message_record.order_id[order_accepted_short_form_message_at] = wire[at]; at = at + 1; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 16 -> order_accepted_short_form_message_record.cl_ord_id[order_accepted_short_form_message_at] = wire[at]; at = at + 1; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_record.alo_inst = wire[at]; at = at + 1;
  order_accepted_short_form_message_record.iso = wire[at]; at = at + 1;
  order_accepted_short_form_message_record.side = wire[at]; at = at + 1;
  order_accepted_short_form_message_record.order_type = wire[at]; at = at + 1;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 8 -> order_accepted_short_form_message_record.price[order_accepted_short_form_message_at] = wire[at]; at = at + 1; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 2 -> order_accepted_short_form_message_record.quantity_short[order_accepted_short_form_message_at] = wire[at]; at = at + 1; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_record.tif = wire[at]; at = at + 1;
  order_accepted_short_form_message_record.capacity = wire[at]; at = at + 1;
  order_accepted_short_form_message_record.auction_type = wire[at]; at = at + 1;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 4 -> order_accepted_short_form_message_record.auction_id[order_accepted_short_form_message_at] = wire[at]; at = at + 1; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_record.price_protection = wire[at]; at = at + 1;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 2 -> order_accepted_short_form_message_record.position_effect_mask[order_accepted_short_form_message_at] = wire[at]; at = at + 1; order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_record.stock_capacity = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Accepted Short Form Message is what was written, byte for byte */
inline equal_order_accepted_short_form_message(order_accepted_short_form_message_read, order_accepted_short_form_message_written) {
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 8 -> assert(order_accepted_short_form_message_read.timestamp[order_accepted_short_form_message_at] == order_accepted_short_form_message_written.timestamp[order_accepted_short_form_message_at]); order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 4 -> assert(order_accepted_short_form_message_read.firm_id[order_accepted_short_form_message_at] == order_accepted_short_form_message_written.firm_id[order_accepted_short_form_message_at]); order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 4 -> assert(order_accepted_short_form_message_read.instrument_id[order_accepted_short_form_message_at] == order_accepted_short_form_message_written.instrument_id[order_accepted_short_form_message_at]); order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 8 -> assert(order_accepted_short_form_message_read.order_id[order_accepted_short_form_message_at] == order_accepted_short_form_message_written.order_id[order_accepted_short_form_message_at]); order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 16 -> assert(order_accepted_short_form_message_read.cl_ord_id[order_accepted_short_form_message_at] == order_accepted_short_form_message_written.cl_ord_id[order_accepted_short_form_message_at]); order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  assert(order_accepted_short_form_message_read.alo_inst == order_accepted_short_form_message_written.alo_inst);
  assert(order_accepted_short_form_message_read.iso == order_accepted_short_form_message_written.iso);
  assert(order_accepted_short_form_message_read.side == order_accepted_short_form_message_written.side);
  assert(order_accepted_short_form_message_read.order_type == order_accepted_short_form_message_written.order_type);
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 8 -> assert(order_accepted_short_form_message_read.price[order_accepted_short_form_message_at] == order_accepted_short_form_message_written.price[order_accepted_short_form_message_at]); order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 2 -> assert(order_accepted_short_form_message_read.quantity_short[order_accepted_short_form_message_at] == order_accepted_short_form_message_written.quantity_short[order_accepted_short_form_message_at]); order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  assert(order_accepted_short_form_message_read.tif == order_accepted_short_form_message_written.tif);
  assert(order_accepted_short_form_message_read.capacity == order_accepted_short_form_message_written.capacity);
  assert(order_accepted_short_form_message_read.auction_type == order_accepted_short_form_message_written.auction_type);
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 4 -> assert(order_accepted_short_form_message_read.auction_id[order_accepted_short_form_message_at] == order_accepted_short_form_message_written.auction_id[order_accepted_short_form_message_at]); order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  assert(order_accepted_short_form_message_read.price_protection == order_accepted_short_form_message_written.price_protection);
  order_accepted_short_form_message_at = 0;
  do
  :: order_accepted_short_form_message_at < 2 -> assert(order_accepted_short_form_message_read.position_effect_mask[order_accepted_short_form_message_at] == order_accepted_short_form_message_written.position_effect_mask[order_accepted_short_form_message_at]); order_accepted_short_form_message_at = order_accepted_short_form_message_at + 1
  :: else -> break
  od;
  assert(order_accepted_short_form_message_read.stock_capacity == order_accepted_short_form_message_written.stock_capacity);
  skip
}

/* ---- Order Replaced Message: 100 bytes --------------------------------------- */

/* Acknowledges a Replace Order request. */
typedef OrderReplacedMessage {
  byte timestamp[8];
  byte firm_id[4];
  byte instrument_id[4];
  byte orig_order_id[8];
  byte order_id[8];
  byte orig_cl_ord_id[16];
  byte cl_ord_id[16];
  byte alo_inst;
  byte iso;
  byte side;
  byte order_type;
  byte price[8];
  byte quantity[4];
  byte tif;
  byte cust_acct[10];
  byte capacity;
  byte auction_type;
  byte auction_id[4];
  byte position_effect_mask[2];
  byte price_protection
};

int order_replaced_message_at;

/* every byte of Order Replaced Message set to one value */
inline fill_order_replaced_message(order_replaced_message_record, order_replaced_message_value) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.timestamp[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.firm_id[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.instrument_id[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.orig_order_id[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.order_id[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 16 -> order_replaced_message_record.orig_cl_ord_id[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 16 -> order_replaced_message_record.cl_ord_id[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.alo_inst = order_replaced_message_value;
  order_replaced_message_record.iso = order_replaced_message_value;
  order_replaced_message_record.side = order_replaced_message_value;
  order_replaced_message_record.order_type = order_replaced_message_value;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.price[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.quantity[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.tif = order_replaced_message_value;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 10 -> order_replaced_message_record.cust_acct[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.capacity = order_replaced_message_value;
  order_replaced_message_record.auction_type = order_replaced_message_value;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.auction_id[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 2 -> order_replaced_message_record.position_effect_mask[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.price_protection = order_replaced_message_value;
  skip
}

/* each byte of Order Replaced Message set to where it lies, so a field read out of place says so */
inline ramp_order_replaced_message(order_replaced_message_record, order_replaced_message_base) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.timestamp[order_replaced_message_at] = (order_replaced_message_base + 0 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.firm_id[order_replaced_message_at] = (order_replaced_message_base + 8 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.instrument_id[order_replaced_message_at] = (order_replaced_message_base + 12 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.orig_order_id[order_replaced_message_at] = (order_replaced_message_base + 16 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.order_id[order_replaced_message_at] = (order_replaced_message_base + 24 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 16 -> order_replaced_message_record.orig_cl_ord_id[order_replaced_message_at] = (order_replaced_message_base + 32 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 16 -> order_replaced_message_record.cl_ord_id[order_replaced_message_at] = (order_replaced_message_base + 48 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.alo_inst = (order_replaced_message_base + 64 + 1) % 256;
  order_replaced_message_record.iso = (order_replaced_message_base + 65 + 1) % 256;
  order_replaced_message_record.side = (order_replaced_message_base + 66 + 1) % 256;
  order_replaced_message_record.order_type = (order_replaced_message_base + 67 + 1) % 256;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.price[order_replaced_message_at] = (order_replaced_message_base + 68 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.quantity[order_replaced_message_at] = (order_replaced_message_base + 76 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.tif = (order_replaced_message_base + 80 + 1) % 256;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 10 -> order_replaced_message_record.cust_acct[order_replaced_message_at] = (order_replaced_message_base + 81 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.capacity = (order_replaced_message_base + 91 + 1) % 256;
  order_replaced_message_record.auction_type = (order_replaced_message_base + 92 + 1) % 256;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.auction_id[order_replaced_message_at] = (order_replaced_message_base + 93 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 2 -> order_replaced_message_record.position_effect_mask[order_replaced_message_at] = (order_replaced_message_base + 97 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.price_protection = (order_replaced_message_base + 99 + 1) % 256;
  skip
}

/* Order Replaced Message to the wire, 100 bytes from where the cursor stands */
inline encode_order_replaced_message(order_replaced_message_record) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> wire[at] = order_replaced_message_record.timestamp[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.firm_id[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.instrument_id[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> wire[at] = order_replaced_message_record.orig_order_id[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> wire[at] = order_replaced_message_record.order_id[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 16 -> wire[at] = order_replaced_message_record.orig_cl_ord_id[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 16 -> wire[at] = order_replaced_message_record.cl_ord_id[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = order_replaced_message_record.alo_inst; at = at + 1;
  wire[at] = order_replaced_message_record.iso; at = at + 1;
  wire[at] = order_replaced_message_record.side; at = at + 1;
  wire[at] = order_replaced_message_record.order_type; at = at + 1;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> wire[at] = order_replaced_message_record.price[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.quantity[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = order_replaced_message_record.tif; at = at + 1;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 10 -> wire[at] = order_replaced_message_record.cust_acct[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = order_replaced_message_record.capacity; at = at + 1;
  wire[at] = order_replaced_message_record.auction_type; at = at + 1;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.auction_id[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 2 -> wire[at] = order_replaced_message_record.position_effect_mask[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = order_replaced_message_record.price_protection; at = at + 1;
  skip
}

/* Order Replaced Message off the wire, 100 bytes from where the cursor stands */
inline decode_order_replaced_message(order_replaced_message_record) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.timestamp[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.firm_id[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.instrument_id[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.orig_order_id[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.order_id[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 16 -> order_replaced_message_record.orig_cl_ord_id[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 16 -> order_replaced_message_record.cl_ord_id[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.alo_inst = wire[at]; at = at + 1;
  order_replaced_message_record.iso = wire[at]; at = at + 1;
  order_replaced_message_record.side = wire[at]; at = at + 1;
  order_replaced_message_record.order_type = wire[at]; at = at + 1;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.price[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.quantity[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.tif = wire[at]; at = at + 1;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 10 -> order_replaced_message_record.cust_acct[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.capacity = wire[at]; at = at + 1;
  order_replaced_message_record.auction_type = wire[at]; at = at + 1;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.auction_id[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 2 -> order_replaced_message_record.position_effect_mask[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.price_protection = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Replaced Message is what was written, byte for byte */
inline equal_order_replaced_message(order_replaced_message_read, order_replaced_message_written) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> assert(order_replaced_message_read.timestamp[order_replaced_message_at] == order_replaced_message_written.timestamp[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.firm_id[order_replaced_message_at] == order_replaced_message_written.firm_id[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.instrument_id[order_replaced_message_at] == order_replaced_message_written.instrument_id[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> assert(order_replaced_message_read.orig_order_id[order_replaced_message_at] == order_replaced_message_written.orig_order_id[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> assert(order_replaced_message_read.order_id[order_replaced_message_at] == order_replaced_message_written.order_id[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 16 -> assert(order_replaced_message_read.orig_cl_ord_id[order_replaced_message_at] == order_replaced_message_written.orig_cl_ord_id[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 16 -> assert(order_replaced_message_read.cl_ord_id[order_replaced_message_at] == order_replaced_message_written.cl_ord_id[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  assert(order_replaced_message_read.alo_inst == order_replaced_message_written.alo_inst);
  assert(order_replaced_message_read.iso == order_replaced_message_written.iso);
  assert(order_replaced_message_read.side == order_replaced_message_written.side);
  assert(order_replaced_message_read.order_type == order_replaced_message_written.order_type);
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> assert(order_replaced_message_read.price[order_replaced_message_at] == order_replaced_message_written.price[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.quantity[order_replaced_message_at] == order_replaced_message_written.quantity[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  assert(order_replaced_message_read.tif == order_replaced_message_written.tif);
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 10 -> assert(order_replaced_message_read.cust_acct[order_replaced_message_at] == order_replaced_message_written.cust_acct[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  assert(order_replaced_message_read.capacity == order_replaced_message_written.capacity);
  assert(order_replaced_message_read.auction_type == order_replaced_message_written.auction_type);
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.auction_id[order_replaced_message_at] == order_replaced_message_written.auction_id[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 2 -> assert(order_replaced_message_read.position_effect_mask[order_replaced_message_at] == order_replaced_message_written.position_effect_mask[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  assert(order_replaced_message_read.price_protection == order_replaced_message_written.price_protection);
  skip
}

/* ---- Order Canceled Message: 41 bytes ---------------------------------------- */

/* An Order Canceled Message informs you that an order has been fully canceled. This could be acknowledging a Cancel Order Message, or it could be the result of the order being canceled automatically by the system. */
typedef OrderCanceledMessage {
  byte timestamp[8];
  byte firm_id[4];
  byte instrument_id[4];
  byte order_id[8];
  byte cl_ord_id[16];
  byte cancel_reason
};

int order_canceled_message_at;

/* every byte of Order Canceled Message set to one value */
inline fill_order_canceled_message(order_canceled_message_record, order_canceled_message_value) {
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.timestamp[order_canceled_message_at] = order_canceled_message_value; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> order_canceled_message_record.firm_id[order_canceled_message_at] = order_canceled_message_value; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> order_canceled_message_record.instrument_id[order_canceled_message_at] = order_canceled_message_value; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.order_id[order_canceled_message_at] = order_canceled_message_value; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 16 -> order_canceled_message_record.cl_ord_id[order_canceled_message_at] = order_canceled_message_value; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_record.cancel_reason = order_canceled_message_value;
  skip
}

/* each byte of Order Canceled Message set to where it lies, so a field read out of place says so */
inline ramp_order_canceled_message(order_canceled_message_record, order_canceled_message_base) {
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.timestamp[order_canceled_message_at] = (order_canceled_message_base + 0 + order_canceled_message_at + 1) % 256; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> order_canceled_message_record.firm_id[order_canceled_message_at] = (order_canceled_message_base + 8 + order_canceled_message_at + 1) % 256; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> order_canceled_message_record.instrument_id[order_canceled_message_at] = (order_canceled_message_base + 12 + order_canceled_message_at + 1) % 256; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.order_id[order_canceled_message_at] = (order_canceled_message_base + 16 + order_canceled_message_at + 1) % 256; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 16 -> order_canceled_message_record.cl_ord_id[order_canceled_message_at] = (order_canceled_message_base + 24 + order_canceled_message_at + 1) % 256; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_record.cancel_reason = (order_canceled_message_base + 40 + 1) % 256;
  skip
}

/* Order Canceled Message to the wire, 41 bytes from where the cursor stands */
inline encode_order_canceled_message(order_canceled_message_record) {
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> wire[at] = order_canceled_message_record.timestamp[order_canceled_message_at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> wire[at] = order_canceled_message_record.firm_id[order_canceled_message_at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> wire[at] = order_canceled_message_record.instrument_id[order_canceled_message_at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> wire[at] = order_canceled_message_record.order_id[order_canceled_message_at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 16 -> wire[at] = order_canceled_message_record.cl_ord_id[order_canceled_message_at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  wire[at] = order_canceled_message_record.cancel_reason; at = at + 1;
  skip
}

/* Order Canceled Message off the wire, 41 bytes from where the cursor stands */
inline decode_order_canceled_message(order_canceled_message_record) {
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.timestamp[order_canceled_message_at] = wire[at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> order_canceled_message_record.firm_id[order_canceled_message_at] = wire[at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> order_canceled_message_record.instrument_id[order_canceled_message_at] = wire[at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.order_id[order_canceled_message_at] = wire[at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 16 -> order_canceled_message_record.cl_ord_id[order_canceled_message_at] = wire[at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_record.cancel_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Canceled Message is what was written, byte for byte */
inline equal_order_canceled_message(order_canceled_message_read, order_canceled_message_written) {
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> assert(order_canceled_message_read.timestamp[order_canceled_message_at] == order_canceled_message_written.timestamp[order_canceled_message_at]); order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> assert(order_canceled_message_read.firm_id[order_canceled_message_at] == order_canceled_message_written.firm_id[order_canceled_message_at]); order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> assert(order_canceled_message_read.instrument_id[order_canceled_message_at] == order_canceled_message_written.instrument_id[order_canceled_message_at]); order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> assert(order_canceled_message_read.order_id[order_canceled_message_at] == order_canceled_message_written.order_id[order_canceled_message_at]); order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 16 -> assert(order_canceled_message_read.cl_ord_id[order_canceled_message_at] == order_canceled_message_written.cl_ord_id[order_canceled_message_at]); order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  assert(order_canceled_message_read.cancel_reason == order_canceled_message_written.cancel_reason);
  skip
}

/* ---- Order Executed Message: 72 bytes ---------------------------------------- */

/* Order Executed message reports an execution of an order for a simple instrument, a complex instrument, or an option or stock leg of a complex order. */
typedef OrderExecutedMessage {
  byte timestamp[8];
  byte firm_id[4];
  byte product_id[2];
  byte ord_exec_type;
  byte instrument_id[4];
  byte leg_instrument_id[4];
  byte leg_id;
  byte auction_type;
  byte order_id[8];
  byte cl_ord_id[16];
  byte cross_id[4];
  byte match_id[4];
  byte side;
  byte stock_leg_short_sale;
  byte price[8];
  byte quantity[4];
  byte liquidity_ind
};

int order_executed_message_at;

/* every byte of Order Executed Message set to one value */
inline fill_order_executed_message(order_executed_message_record, order_executed_message_value) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.timestamp[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.firm_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> order_executed_message_record.product_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.ord_exec_type = order_executed_message_value;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.instrument_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.leg_instrument_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.leg_id = order_executed_message_value;
  order_executed_message_record.auction_type = order_executed_message_value;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 16 -> order_executed_message_record.cl_ord_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.cross_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.match_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.side = order_executed_message_value;
  order_executed_message_record.stock_leg_short_sale = order_executed_message_value;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.price[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.quantity[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.liquidity_ind = order_executed_message_value;
  skip
}

/* each byte of Order Executed Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_message(order_executed_message_record, order_executed_message_base) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.timestamp[order_executed_message_at] = (order_executed_message_base + 0 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.firm_id[order_executed_message_at] = (order_executed_message_base + 8 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> order_executed_message_record.product_id[order_executed_message_at] = (order_executed_message_base + 12 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.ord_exec_type = (order_executed_message_base + 14 + 1) % 256;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.instrument_id[order_executed_message_at] = (order_executed_message_base + 15 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.leg_instrument_id[order_executed_message_at] = (order_executed_message_base + 19 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.leg_id = (order_executed_message_base + 23 + 1) % 256;
  order_executed_message_record.auction_type = (order_executed_message_base + 24 + 1) % 256;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = (order_executed_message_base + 25 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 16 -> order_executed_message_record.cl_ord_id[order_executed_message_at] = (order_executed_message_base + 33 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.cross_id[order_executed_message_at] = (order_executed_message_base + 49 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.match_id[order_executed_message_at] = (order_executed_message_base + 53 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.side = (order_executed_message_base + 57 + 1) % 256;
  order_executed_message_record.stock_leg_short_sale = (order_executed_message_base + 58 + 1) % 256;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.price[order_executed_message_at] = (order_executed_message_base + 59 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.quantity[order_executed_message_at] = (order_executed_message_base + 67 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.liquidity_ind = (order_executed_message_base + 71 + 1) % 256;
  skip
}

/* Order Executed Message to the wire, 72 bytes from where the cursor stands */
inline encode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.timestamp[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.firm_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> wire[at] = order_executed_message_record.product_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_message_record.ord_exec_type; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.instrument_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.leg_instrument_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_message_record.leg_id; at = at + 1;
  wire[at] = order_executed_message_record.auction_type; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.order_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 16 -> wire[at] = order_executed_message_record.cl_ord_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.cross_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.match_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_message_record.side; at = at + 1;
  wire[at] = order_executed_message_record.stock_leg_short_sale; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.price[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.quantity[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_message_record.liquidity_ind; at = at + 1;
  skip
}

/* Order Executed Message off the wire, 72 bytes from where the cursor stands */
inline decode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.timestamp[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.firm_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> order_executed_message_record.product_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.ord_exec_type = wire[at]; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.instrument_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.leg_instrument_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.leg_id = wire[at]; at = at + 1;
  order_executed_message_record.auction_type = wire[at]; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 16 -> order_executed_message_record.cl_ord_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.cross_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.match_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.side = wire[at]; at = at + 1;
  order_executed_message_record.stock_leg_short_sale = wire[at]; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.price[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.quantity[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.liquidity_ind = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Executed Message is what was written, byte for byte */
inline equal_order_executed_message(order_executed_message_read, order_executed_message_written) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.timestamp[order_executed_message_at] == order_executed_message_written.timestamp[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.firm_id[order_executed_message_at] == order_executed_message_written.firm_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> assert(order_executed_message_read.product_id[order_executed_message_at] == order_executed_message_written.product_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  assert(order_executed_message_read.ord_exec_type == order_executed_message_written.ord_exec_type);
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.instrument_id[order_executed_message_at] == order_executed_message_written.instrument_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.leg_instrument_id[order_executed_message_at] == order_executed_message_written.leg_instrument_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  assert(order_executed_message_read.leg_id == order_executed_message_written.leg_id);
  assert(order_executed_message_read.auction_type == order_executed_message_written.auction_type);
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.order_id[order_executed_message_at] == order_executed_message_written.order_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 16 -> assert(order_executed_message_read.cl_ord_id[order_executed_message_at] == order_executed_message_written.cl_ord_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.cross_id[order_executed_message_at] == order_executed_message_written.cross_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.match_id[order_executed_message_at] == order_executed_message_written.match_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  assert(order_executed_message_read.side == order_executed_message_written.side);
  assert(order_executed_message_read.stock_leg_short_sale == order_executed_message_written.stock_leg_short_sale);
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.price[order_executed_message_at] == order_executed_message_written.price[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.quantity[order_executed_message_at] == order_executed_message_written.quantity[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  assert(order_executed_message_read.liquidity_ind == order_executed_message_written.liquidity_ind);
  skip
}

/* ---- Trade Details Message: 107 bytes ---------------------------------------- */

/* A Trade Details message contains additional details, specifically clearing information. This message is sent out with a nominal delay after Order Executed message. Trade Busts and Adjustments are made against individual MatchIds; Modify Trade results are reported with TransType B for the original trade and C for the new trades. */
typedef TradeDetailsMessage {
  byte timestamp[8];
  byte firm_id[4];
  byte product_id[2];
  byte ord_exec_type;
  byte instrument_id[4];
  byte leg_instrument_id[4];
  byte leg_id;
  byte trans_type;
  byte event_source;
  byte auction_type;
  byte order_id[8];
  byte cl_ord_id[16];
  byte cross_id[4];
  byte match_id[4];
  byte ref_match_id[4];
  byte side;
  byte stock_leg_short_sale;
  byte price[8];
  byte quantity[4];
  byte liquidity_ind;
  byte cmta[4];
  byte clearing_account[4];
  byte occ_account[4];
  byte cust_acct[10];
  byte stock_venue;
  byte stock_leg_mpid[4];
  byte capacity;
  byte open_close
};

int trade_details_message_at;

/* every byte of Trade Details Message set to one value */
inline fill_trade_details_message(trade_details_message_record, trade_details_message_value) {
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 8 -> trade_details_message_record.timestamp[trade_details_message_at] = trade_details_message_value; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.firm_id[trade_details_message_at] = trade_details_message_value; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 2 -> trade_details_message_record.product_id[trade_details_message_at] = trade_details_message_value; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_record.ord_exec_type = trade_details_message_value;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.instrument_id[trade_details_message_at] = trade_details_message_value; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.leg_instrument_id[trade_details_message_at] = trade_details_message_value; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_record.leg_id = trade_details_message_value;
  trade_details_message_record.trans_type = trade_details_message_value;
  trade_details_message_record.event_source = trade_details_message_value;
  trade_details_message_record.auction_type = trade_details_message_value;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 8 -> trade_details_message_record.order_id[trade_details_message_at] = trade_details_message_value; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 16 -> trade_details_message_record.cl_ord_id[trade_details_message_at] = trade_details_message_value; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.cross_id[trade_details_message_at] = trade_details_message_value; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.match_id[trade_details_message_at] = trade_details_message_value; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.ref_match_id[trade_details_message_at] = trade_details_message_value; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_record.side = trade_details_message_value;
  trade_details_message_record.stock_leg_short_sale = trade_details_message_value;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 8 -> trade_details_message_record.price[trade_details_message_at] = trade_details_message_value; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.quantity[trade_details_message_at] = trade_details_message_value; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_record.liquidity_ind = trade_details_message_value;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.cmta[trade_details_message_at] = trade_details_message_value; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.clearing_account[trade_details_message_at] = trade_details_message_value; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.occ_account[trade_details_message_at] = trade_details_message_value; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 10 -> trade_details_message_record.cust_acct[trade_details_message_at] = trade_details_message_value; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_record.stock_venue = trade_details_message_value;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.stock_leg_mpid[trade_details_message_at] = trade_details_message_value; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_record.capacity = trade_details_message_value;
  trade_details_message_record.open_close = trade_details_message_value;
  skip
}

/* each byte of Trade Details Message set to where it lies, so a field read out of place says so */
inline ramp_trade_details_message(trade_details_message_record, trade_details_message_base) {
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 8 -> trade_details_message_record.timestamp[trade_details_message_at] = (trade_details_message_base + 0 + trade_details_message_at + 1) % 256; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.firm_id[trade_details_message_at] = (trade_details_message_base + 8 + trade_details_message_at + 1) % 256; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 2 -> trade_details_message_record.product_id[trade_details_message_at] = (trade_details_message_base + 12 + trade_details_message_at + 1) % 256; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_record.ord_exec_type = (trade_details_message_base + 14 + 1) % 256;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.instrument_id[trade_details_message_at] = (trade_details_message_base + 15 + trade_details_message_at + 1) % 256; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.leg_instrument_id[trade_details_message_at] = (trade_details_message_base + 19 + trade_details_message_at + 1) % 256; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_record.leg_id = (trade_details_message_base + 23 + 1) % 256;
  trade_details_message_record.trans_type = (trade_details_message_base + 24 + 1) % 256;
  trade_details_message_record.event_source = (trade_details_message_base + 25 + 1) % 256;
  trade_details_message_record.auction_type = (trade_details_message_base + 26 + 1) % 256;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 8 -> trade_details_message_record.order_id[trade_details_message_at] = (trade_details_message_base + 27 + trade_details_message_at + 1) % 256; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 16 -> trade_details_message_record.cl_ord_id[trade_details_message_at] = (trade_details_message_base + 35 + trade_details_message_at + 1) % 256; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.cross_id[trade_details_message_at] = (trade_details_message_base + 51 + trade_details_message_at + 1) % 256; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.match_id[trade_details_message_at] = (trade_details_message_base + 55 + trade_details_message_at + 1) % 256; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.ref_match_id[trade_details_message_at] = (trade_details_message_base + 59 + trade_details_message_at + 1) % 256; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_record.side = (trade_details_message_base + 63 + 1) % 256;
  trade_details_message_record.stock_leg_short_sale = (trade_details_message_base + 64 + 1) % 256;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 8 -> trade_details_message_record.price[trade_details_message_at] = (trade_details_message_base + 65 + trade_details_message_at + 1) % 256; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.quantity[trade_details_message_at] = (trade_details_message_base + 73 + trade_details_message_at + 1) % 256; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_record.liquidity_ind = (trade_details_message_base + 77 + 1) % 256;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.cmta[trade_details_message_at] = (trade_details_message_base + 78 + trade_details_message_at + 1) % 256; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.clearing_account[trade_details_message_at] = (trade_details_message_base + 82 + trade_details_message_at + 1) % 256; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.occ_account[trade_details_message_at] = (trade_details_message_base + 86 + trade_details_message_at + 1) % 256; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 10 -> trade_details_message_record.cust_acct[trade_details_message_at] = (trade_details_message_base + 90 + trade_details_message_at + 1) % 256; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_record.stock_venue = (trade_details_message_base + 100 + 1) % 256;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.stock_leg_mpid[trade_details_message_at] = (trade_details_message_base + 101 + trade_details_message_at + 1) % 256; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_record.capacity = (trade_details_message_base + 105 + 1) % 256;
  trade_details_message_record.open_close = (trade_details_message_base + 106 + 1) % 256;
  skip
}

/* Trade Details Message to the wire, 107 bytes from where the cursor stands */
inline encode_trade_details_message(trade_details_message_record) {
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 8 -> wire[at] = trade_details_message_record.timestamp[trade_details_message_at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> wire[at] = trade_details_message_record.firm_id[trade_details_message_at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 2 -> wire[at] = trade_details_message_record.product_id[trade_details_message_at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_details_message_record.ord_exec_type; at = at + 1;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> wire[at] = trade_details_message_record.instrument_id[trade_details_message_at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> wire[at] = trade_details_message_record.leg_instrument_id[trade_details_message_at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_details_message_record.leg_id; at = at + 1;
  wire[at] = trade_details_message_record.trans_type; at = at + 1;
  wire[at] = trade_details_message_record.event_source; at = at + 1;
  wire[at] = trade_details_message_record.auction_type; at = at + 1;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 8 -> wire[at] = trade_details_message_record.order_id[trade_details_message_at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 16 -> wire[at] = trade_details_message_record.cl_ord_id[trade_details_message_at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> wire[at] = trade_details_message_record.cross_id[trade_details_message_at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> wire[at] = trade_details_message_record.match_id[trade_details_message_at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> wire[at] = trade_details_message_record.ref_match_id[trade_details_message_at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_details_message_record.side; at = at + 1;
  wire[at] = trade_details_message_record.stock_leg_short_sale; at = at + 1;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 8 -> wire[at] = trade_details_message_record.price[trade_details_message_at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> wire[at] = trade_details_message_record.quantity[trade_details_message_at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_details_message_record.liquidity_ind; at = at + 1;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> wire[at] = trade_details_message_record.cmta[trade_details_message_at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> wire[at] = trade_details_message_record.clearing_account[trade_details_message_at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> wire[at] = trade_details_message_record.occ_account[trade_details_message_at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 10 -> wire[at] = trade_details_message_record.cust_acct[trade_details_message_at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_details_message_record.stock_venue; at = at + 1;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> wire[at] = trade_details_message_record.stock_leg_mpid[trade_details_message_at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_details_message_record.capacity; at = at + 1;
  wire[at] = trade_details_message_record.open_close; at = at + 1;
  skip
}

/* Trade Details Message off the wire, 107 bytes from where the cursor stands */
inline decode_trade_details_message(trade_details_message_record) {
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 8 -> trade_details_message_record.timestamp[trade_details_message_at] = wire[at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.firm_id[trade_details_message_at] = wire[at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 2 -> trade_details_message_record.product_id[trade_details_message_at] = wire[at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_record.ord_exec_type = wire[at]; at = at + 1;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.instrument_id[trade_details_message_at] = wire[at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.leg_instrument_id[trade_details_message_at] = wire[at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_record.leg_id = wire[at]; at = at + 1;
  trade_details_message_record.trans_type = wire[at]; at = at + 1;
  trade_details_message_record.event_source = wire[at]; at = at + 1;
  trade_details_message_record.auction_type = wire[at]; at = at + 1;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 8 -> trade_details_message_record.order_id[trade_details_message_at] = wire[at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 16 -> trade_details_message_record.cl_ord_id[trade_details_message_at] = wire[at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.cross_id[trade_details_message_at] = wire[at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.match_id[trade_details_message_at] = wire[at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.ref_match_id[trade_details_message_at] = wire[at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_record.side = wire[at]; at = at + 1;
  trade_details_message_record.stock_leg_short_sale = wire[at]; at = at + 1;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 8 -> trade_details_message_record.price[trade_details_message_at] = wire[at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.quantity[trade_details_message_at] = wire[at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_record.liquidity_ind = wire[at]; at = at + 1;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.cmta[trade_details_message_at] = wire[at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.clearing_account[trade_details_message_at] = wire[at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.occ_account[trade_details_message_at] = wire[at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 10 -> trade_details_message_record.cust_acct[trade_details_message_at] = wire[at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_record.stock_venue = wire[at]; at = at + 1;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> trade_details_message_record.stock_leg_mpid[trade_details_message_at] = wire[at]; at = at + 1; trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_record.capacity = wire[at]; at = at + 1;
  trade_details_message_record.open_close = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Details Message is what was written, byte for byte */
inline equal_trade_details_message(trade_details_message_read, trade_details_message_written) {
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 8 -> assert(trade_details_message_read.timestamp[trade_details_message_at] == trade_details_message_written.timestamp[trade_details_message_at]); trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> assert(trade_details_message_read.firm_id[trade_details_message_at] == trade_details_message_written.firm_id[trade_details_message_at]); trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 2 -> assert(trade_details_message_read.product_id[trade_details_message_at] == trade_details_message_written.product_id[trade_details_message_at]); trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  assert(trade_details_message_read.ord_exec_type == trade_details_message_written.ord_exec_type);
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> assert(trade_details_message_read.instrument_id[trade_details_message_at] == trade_details_message_written.instrument_id[trade_details_message_at]); trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> assert(trade_details_message_read.leg_instrument_id[trade_details_message_at] == trade_details_message_written.leg_instrument_id[trade_details_message_at]); trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  assert(trade_details_message_read.leg_id == trade_details_message_written.leg_id);
  assert(trade_details_message_read.trans_type == trade_details_message_written.trans_type);
  assert(trade_details_message_read.event_source == trade_details_message_written.event_source);
  assert(trade_details_message_read.auction_type == trade_details_message_written.auction_type);
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 8 -> assert(trade_details_message_read.order_id[trade_details_message_at] == trade_details_message_written.order_id[trade_details_message_at]); trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 16 -> assert(trade_details_message_read.cl_ord_id[trade_details_message_at] == trade_details_message_written.cl_ord_id[trade_details_message_at]); trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> assert(trade_details_message_read.cross_id[trade_details_message_at] == trade_details_message_written.cross_id[trade_details_message_at]); trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> assert(trade_details_message_read.match_id[trade_details_message_at] == trade_details_message_written.match_id[trade_details_message_at]); trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> assert(trade_details_message_read.ref_match_id[trade_details_message_at] == trade_details_message_written.ref_match_id[trade_details_message_at]); trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  assert(trade_details_message_read.side == trade_details_message_written.side);
  assert(trade_details_message_read.stock_leg_short_sale == trade_details_message_written.stock_leg_short_sale);
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 8 -> assert(trade_details_message_read.price[trade_details_message_at] == trade_details_message_written.price[trade_details_message_at]); trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> assert(trade_details_message_read.quantity[trade_details_message_at] == trade_details_message_written.quantity[trade_details_message_at]); trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  assert(trade_details_message_read.liquidity_ind == trade_details_message_written.liquidity_ind);
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> assert(trade_details_message_read.cmta[trade_details_message_at] == trade_details_message_written.cmta[trade_details_message_at]); trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> assert(trade_details_message_read.clearing_account[trade_details_message_at] == trade_details_message_written.clearing_account[trade_details_message_at]); trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> assert(trade_details_message_read.occ_account[trade_details_message_at] == trade_details_message_written.occ_account[trade_details_message_at]); trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 10 -> assert(trade_details_message_read.cust_acct[trade_details_message_at] == trade_details_message_written.cust_acct[trade_details_message_at]); trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  assert(trade_details_message_read.stock_venue == trade_details_message_written.stock_venue);
  trade_details_message_at = 0;
  do
  :: trade_details_message_at < 4 -> assert(trade_details_message_read.stock_leg_mpid[trade_details_message_at] == trade_details_message_written.stock_leg_mpid[trade_details_message_at]); trade_details_message_at = trade_details_message_at + 1
  :: else -> break
  od;
  assert(trade_details_message_read.capacity == trade_details_message_written.capacity);
  assert(trade_details_message_read.open_close == trade_details_message_written.open_close);
  skip
}

/* ---- Cross Order Accepted Message: 169 bytes --------------------------------- */

/* Acknowledges a valid New Cross Order. The Primary Side and Contra Side blocks of the document are carried as Primary and Contra prefixed fields. */
typedef CrossOrderAcceptedMessage {
  byte timestamp[8];
  byte firm_id[4];
  byte instrument_id[4];
  byte cross_type;
  byte auction_type;
  byte auction_id[4];
  byte auction_alloc_pct;
  byte side;
  byte iso;
  byte price_protection;
  byte effective_time[8];
  byte disclosure_mask;
  byte primary_order_id[8];
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
  byte contra_order_id[8];
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
  byte reserved_1
};

int cross_order_accepted_message_at;

/* every byte of Cross Order Accepted Message set to one value */
inline fill_cross_order_accepted_message(cross_order_accepted_message_record, cross_order_accepted_message_value) {
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> cross_order_accepted_message_record.timestamp[cross_order_accepted_message_at] = cross_order_accepted_message_value; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.firm_id[cross_order_accepted_message_at] = cross_order_accepted_message_value; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.instrument_id[cross_order_accepted_message_at] = cross_order_accepted_message_value; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.cross_type = cross_order_accepted_message_value;
  cross_order_accepted_message_record.auction_type = cross_order_accepted_message_value;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.auction_id[cross_order_accepted_message_at] = cross_order_accepted_message_value; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.auction_alloc_pct = cross_order_accepted_message_value;
  cross_order_accepted_message_record.side = cross_order_accepted_message_value;
  cross_order_accepted_message_record.iso = cross_order_accepted_message_value;
  cross_order_accepted_message_record.price_protection = cross_order_accepted_message_value;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> cross_order_accepted_message_record.effective_time[cross_order_accepted_message_at] = cross_order_accepted_message_value; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.disclosure_mask = cross_order_accepted_message_value;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> cross_order_accepted_message_record.primary_order_id[cross_order_accepted_message_at] = cross_order_accepted_message_value; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 16 -> cross_order_accepted_message_record.primary_cl_ord_id[cross_order_accepted_message_at] = cross_order_accepted_message_value; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.primary_cmta[cross_order_accepted_message_at] = cross_order_accepted_message_value; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.primary_clearing_account[cross_order_accepted_message_at] = cross_order_accepted_message_value; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.primary_occ_account[cross_order_accepted_message_at] = cross_order_accepted_message_value; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 10 -> cross_order_accepted_message_record.primary_cust_acct[cross_order_accepted_message_at] = cross_order_accepted_message_value; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> cross_order_accepted_message_record.primary_price[cross_order_accepted_message_at] = cross_order_accepted_message_value; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.primary_quantity[cross_order_accepted_message_at] = cross_order_accepted_message_value; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.primary_capacity = cross_order_accepted_message_value;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 2 -> cross_order_accepted_message_record.primary_position_effect_mask[cross_order_accepted_message_at] = cross_order_accepted_message_value; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.primary_stock_leg_short_sale = cross_order_accepted_message_value;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.primary_stock_leg_mpid[cross_order_accepted_message_at] = cross_order_accepted_message_value; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> cross_order_accepted_message_record.contra_order_id[cross_order_accepted_message_at] = cross_order_accepted_message_value; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 16 -> cross_order_accepted_message_record.contra_cl_ord_id[cross_order_accepted_message_at] = cross_order_accepted_message_value; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.contra_cmta[cross_order_accepted_message_at] = cross_order_accepted_message_value; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.contra_clearing_account[cross_order_accepted_message_at] = cross_order_accepted_message_value; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.contra_occ_account[cross_order_accepted_message_at] = cross_order_accepted_message_value; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 10 -> cross_order_accepted_message_record.contra_cust_acct[cross_order_accepted_message_at] = cross_order_accepted_message_value; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.contra_order_type = cross_order_accepted_message_value;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> cross_order_accepted_message_record.contra_price[cross_order_accepted_message_at] = cross_order_accepted_message_value; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.contra_quantity[cross_order_accepted_message_at] = cross_order_accepted_message_value; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.contra_capacity = cross_order_accepted_message_value;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 2 -> cross_order_accepted_message_record.contra_position_effect_mask[cross_order_accepted_message_at] = cross_order_accepted_message_value; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.contra_stock_leg_short_sale = cross_order_accepted_message_value;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.contra_stock_leg_mpid[cross_order_accepted_message_at] = cross_order_accepted_message_value; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.reserved_1 = cross_order_accepted_message_value;
  skip
}

/* each byte of Cross Order Accepted Message set to where it lies, so a field read out of place says so */
inline ramp_cross_order_accepted_message(cross_order_accepted_message_record, cross_order_accepted_message_base) {
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> cross_order_accepted_message_record.timestamp[cross_order_accepted_message_at] = (cross_order_accepted_message_base + 0 + cross_order_accepted_message_at + 1) % 256; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.firm_id[cross_order_accepted_message_at] = (cross_order_accepted_message_base + 8 + cross_order_accepted_message_at + 1) % 256; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.instrument_id[cross_order_accepted_message_at] = (cross_order_accepted_message_base + 12 + cross_order_accepted_message_at + 1) % 256; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.cross_type = (cross_order_accepted_message_base + 16 + 1) % 256;
  cross_order_accepted_message_record.auction_type = (cross_order_accepted_message_base + 17 + 1) % 256;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.auction_id[cross_order_accepted_message_at] = (cross_order_accepted_message_base + 18 + cross_order_accepted_message_at + 1) % 256; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.auction_alloc_pct = (cross_order_accepted_message_base + 22 + 1) % 256;
  cross_order_accepted_message_record.side = (cross_order_accepted_message_base + 23 + 1) % 256;
  cross_order_accepted_message_record.iso = (cross_order_accepted_message_base + 24 + 1) % 256;
  cross_order_accepted_message_record.price_protection = (cross_order_accepted_message_base + 25 + 1) % 256;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> cross_order_accepted_message_record.effective_time[cross_order_accepted_message_at] = (cross_order_accepted_message_base + 26 + cross_order_accepted_message_at + 1) % 256; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.disclosure_mask = (cross_order_accepted_message_base + 34 + 1) % 256;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> cross_order_accepted_message_record.primary_order_id[cross_order_accepted_message_at] = (cross_order_accepted_message_base + 35 + cross_order_accepted_message_at + 1) % 256; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 16 -> cross_order_accepted_message_record.primary_cl_ord_id[cross_order_accepted_message_at] = (cross_order_accepted_message_base + 43 + cross_order_accepted_message_at + 1) % 256; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.primary_cmta[cross_order_accepted_message_at] = (cross_order_accepted_message_base + 59 + cross_order_accepted_message_at + 1) % 256; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.primary_clearing_account[cross_order_accepted_message_at] = (cross_order_accepted_message_base + 63 + cross_order_accepted_message_at + 1) % 256; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.primary_occ_account[cross_order_accepted_message_at] = (cross_order_accepted_message_base + 67 + cross_order_accepted_message_at + 1) % 256; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 10 -> cross_order_accepted_message_record.primary_cust_acct[cross_order_accepted_message_at] = (cross_order_accepted_message_base + 71 + cross_order_accepted_message_at + 1) % 256; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> cross_order_accepted_message_record.primary_price[cross_order_accepted_message_at] = (cross_order_accepted_message_base + 81 + cross_order_accepted_message_at + 1) % 256; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.primary_quantity[cross_order_accepted_message_at] = (cross_order_accepted_message_base + 89 + cross_order_accepted_message_at + 1) % 256; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.primary_capacity = (cross_order_accepted_message_base + 93 + 1) % 256;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 2 -> cross_order_accepted_message_record.primary_position_effect_mask[cross_order_accepted_message_at] = (cross_order_accepted_message_base + 94 + cross_order_accepted_message_at + 1) % 256; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.primary_stock_leg_short_sale = (cross_order_accepted_message_base + 96 + 1) % 256;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.primary_stock_leg_mpid[cross_order_accepted_message_at] = (cross_order_accepted_message_base + 97 + cross_order_accepted_message_at + 1) % 256; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> cross_order_accepted_message_record.contra_order_id[cross_order_accepted_message_at] = (cross_order_accepted_message_base + 101 + cross_order_accepted_message_at + 1) % 256; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 16 -> cross_order_accepted_message_record.contra_cl_ord_id[cross_order_accepted_message_at] = (cross_order_accepted_message_base + 109 + cross_order_accepted_message_at + 1) % 256; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.contra_cmta[cross_order_accepted_message_at] = (cross_order_accepted_message_base + 125 + cross_order_accepted_message_at + 1) % 256; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.contra_clearing_account[cross_order_accepted_message_at] = (cross_order_accepted_message_base + 129 + cross_order_accepted_message_at + 1) % 256; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.contra_occ_account[cross_order_accepted_message_at] = (cross_order_accepted_message_base + 133 + cross_order_accepted_message_at + 1) % 256; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 10 -> cross_order_accepted_message_record.contra_cust_acct[cross_order_accepted_message_at] = (cross_order_accepted_message_base + 137 + cross_order_accepted_message_at + 1) % 256; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.contra_order_type = (cross_order_accepted_message_base + 147 + 1) % 256;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> cross_order_accepted_message_record.contra_price[cross_order_accepted_message_at] = (cross_order_accepted_message_base + 148 + cross_order_accepted_message_at + 1) % 256; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.contra_quantity[cross_order_accepted_message_at] = (cross_order_accepted_message_base + 156 + cross_order_accepted_message_at + 1) % 256; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.contra_capacity = (cross_order_accepted_message_base + 160 + 1) % 256;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 2 -> cross_order_accepted_message_record.contra_position_effect_mask[cross_order_accepted_message_at] = (cross_order_accepted_message_base + 161 + cross_order_accepted_message_at + 1) % 256; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.contra_stock_leg_short_sale = (cross_order_accepted_message_base + 163 + 1) % 256;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.contra_stock_leg_mpid[cross_order_accepted_message_at] = (cross_order_accepted_message_base + 164 + cross_order_accepted_message_at + 1) % 256; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.reserved_1 = (cross_order_accepted_message_base + 168 + 1) % 256;
  skip
}

/* Cross Order Accepted Message to the wire, 169 bytes from where the cursor stands */
inline encode_cross_order_accepted_message(cross_order_accepted_message_record) {
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> wire[at] = cross_order_accepted_message_record.timestamp[cross_order_accepted_message_at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> wire[at] = cross_order_accepted_message_record.firm_id[cross_order_accepted_message_at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> wire[at] = cross_order_accepted_message_record.instrument_id[cross_order_accepted_message_at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = cross_order_accepted_message_record.cross_type; at = at + 1;
  wire[at] = cross_order_accepted_message_record.auction_type; at = at + 1;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> wire[at] = cross_order_accepted_message_record.auction_id[cross_order_accepted_message_at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = cross_order_accepted_message_record.auction_alloc_pct; at = at + 1;
  wire[at] = cross_order_accepted_message_record.side; at = at + 1;
  wire[at] = cross_order_accepted_message_record.iso; at = at + 1;
  wire[at] = cross_order_accepted_message_record.price_protection; at = at + 1;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> wire[at] = cross_order_accepted_message_record.effective_time[cross_order_accepted_message_at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = cross_order_accepted_message_record.disclosure_mask; at = at + 1;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> wire[at] = cross_order_accepted_message_record.primary_order_id[cross_order_accepted_message_at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 16 -> wire[at] = cross_order_accepted_message_record.primary_cl_ord_id[cross_order_accepted_message_at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> wire[at] = cross_order_accepted_message_record.primary_cmta[cross_order_accepted_message_at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> wire[at] = cross_order_accepted_message_record.primary_clearing_account[cross_order_accepted_message_at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> wire[at] = cross_order_accepted_message_record.primary_occ_account[cross_order_accepted_message_at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 10 -> wire[at] = cross_order_accepted_message_record.primary_cust_acct[cross_order_accepted_message_at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> wire[at] = cross_order_accepted_message_record.primary_price[cross_order_accepted_message_at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> wire[at] = cross_order_accepted_message_record.primary_quantity[cross_order_accepted_message_at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = cross_order_accepted_message_record.primary_capacity; at = at + 1;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 2 -> wire[at] = cross_order_accepted_message_record.primary_position_effect_mask[cross_order_accepted_message_at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = cross_order_accepted_message_record.primary_stock_leg_short_sale; at = at + 1;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> wire[at] = cross_order_accepted_message_record.primary_stock_leg_mpid[cross_order_accepted_message_at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> wire[at] = cross_order_accepted_message_record.contra_order_id[cross_order_accepted_message_at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 16 -> wire[at] = cross_order_accepted_message_record.contra_cl_ord_id[cross_order_accepted_message_at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> wire[at] = cross_order_accepted_message_record.contra_cmta[cross_order_accepted_message_at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> wire[at] = cross_order_accepted_message_record.contra_clearing_account[cross_order_accepted_message_at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> wire[at] = cross_order_accepted_message_record.contra_occ_account[cross_order_accepted_message_at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 10 -> wire[at] = cross_order_accepted_message_record.contra_cust_acct[cross_order_accepted_message_at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = cross_order_accepted_message_record.contra_order_type; at = at + 1;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> wire[at] = cross_order_accepted_message_record.contra_price[cross_order_accepted_message_at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> wire[at] = cross_order_accepted_message_record.contra_quantity[cross_order_accepted_message_at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = cross_order_accepted_message_record.contra_capacity; at = at + 1;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 2 -> wire[at] = cross_order_accepted_message_record.contra_position_effect_mask[cross_order_accepted_message_at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = cross_order_accepted_message_record.contra_stock_leg_short_sale; at = at + 1;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> wire[at] = cross_order_accepted_message_record.contra_stock_leg_mpid[cross_order_accepted_message_at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = cross_order_accepted_message_record.reserved_1; at = at + 1;
  skip
}

/* Cross Order Accepted Message off the wire, 169 bytes from where the cursor stands */
inline decode_cross_order_accepted_message(cross_order_accepted_message_record) {
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> cross_order_accepted_message_record.timestamp[cross_order_accepted_message_at] = wire[at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.firm_id[cross_order_accepted_message_at] = wire[at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.instrument_id[cross_order_accepted_message_at] = wire[at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.cross_type = wire[at]; at = at + 1;
  cross_order_accepted_message_record.auction_type = wire[at]; at = at + 1;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.auction_id[cross_order_accepted_message_at] = wire[at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.auction_alloc_pct = wire[at]; at = at + 1;
  cross_order_accepted_message_record.side = wire[at]; at = at + 1;
  cross_order_accepted_message_record.iso = wire[at]; at = at + 1;
  cross_order_accepted_message_record.price_protection = wire[at]; at = at + 1;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> cross_order_accepted_message_record.effective_time[cross_order_accepted_message_at] = wire[at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.disclosure_mask = wire[at]; at = at + 1;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> cross_order_accepted_message_record.primary_order_id[cross_order_accepted_message_at] = wire[at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 16 -> cross_order_accepted_message_record.primary_cl_ord_id[cross_order_accepted_message_at] = wire[at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.primary_cmta[cross_order_accepted_message_at] = wire[at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.primary_clearing_account[cross_order_accepted_message_at] = wire[at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.primary_occ_account[cross_order_accepted_message_at] = wire[at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 10 -> cross_order_accepted_message_record.primary_cust_acct[cross_order_accepted_message_at] = wire[at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> cross_order_accepted_message_record.primary_price[cross_order_accepted_message_at] = wire[at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.primary_quantity[cross_order_accepted_message_at] = wire[at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.primary_capacity = wire[at]; at = at + 1;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 2 -> cross_order_accepted_message_record.primary_position_effect_mask[cross_order_accepted_message_at] = wire[at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.primary_stock_leg_short_sale = wire[at]; at = at + 1;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.primary_stock_leg_mpid[cross_order_accepted_message_at] = wire[at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> cross_order_accepted_message_record.contra_order_id[cross_order_accepted_message_at] = wire[at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 16 -> cross_order_accepted_message_record.contra_cl_ord_id[cross_order_accepted_message_at] = wire[at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.contra_cmta[cross_order_accepted_message_at] = wire[at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.contra_clearing_account[cross_order_accepted_message_at] = wire[at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.contra_occ_account[cross_order_accepted_message_at] = wire[at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 10 -> cross_order_accepted_message_record.contra_cust_acct[cross_order_accepted_message_at] = wire[at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.contra_order_type = wire[at]; at = at + 1;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> cross_order_accepted_message_record.contra_price[cross_order_accepted_message_at] = wire[at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.contra_quantity[cross_order_accepted_message_at] = wire[at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.contra_capacity = wire[at]; at = at + 1;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 2 -> cross_order_accepted_message_record.contra_position_effect_mask[cross_order_accepted_message_at] = wire[at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.contra_stock_leg_short_sale = wire[at]; at = at + 1;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> cross_order_accepted_message_record.contra_stock_leg_mpid[cross_order_accepted_message_at] = wire[at]; at = at + 1; cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Cross Order Accepted Message is what was written, byte for byte */
inline equal_cross_order_accepted_message(cross_order_accepted_message_read, cross_order_accepted_message_written) {
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> assert(cross_order_accepted_message_read.timestamp[cross_order_accepted_message_at] == cross_order_accepted_message_written.timestamp[cross_order_accepted_message_at]); cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> assert(cross_order_accepted_message_read.firm_id[cross_order_accepted_message_at] == cross_order_accepted_message_written.firm_id[cross_order_accepted_message_at]); cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> assert(cross_order_accepted_message_read.instrument_id[cross_order_accepted_message_at] == cross_order_accepted_message_written.instrument_id[cross_order_accepted_message_at]); cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  assert(cross_order_accepted_message_read.cross_type == cross_order_accepted_message_written.cross_type);
  assert(cross_order_accepted_message_read.auction_type == cross_order_accepted_message_written.auction_type);
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> assert(cross_order_accepted_message_read.auction_id[cross_order_accepted_message_at] == cross_order_accepted_message_written.auction_id[cross_order_accepted_message_at]); cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  assert(cross_order_accepted_message_read.auction_alloc_pct == cross_order_accepted_message_written.auction_alloc_pct);
  assert(cross_order_accepted_message_read.side == cross_order_accepted_message_written.side);
  assert(cross_order_accepted_message_read.iso == cross_order_accepted_message_written.iso);
  assert(cross_order_accepted_message_read.price_protection == cross_order_accepted_message_written.price_protection);
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> assert(cross_order_accepted_message_read.effective_time[cross_order_accepted_message_at] == cross_order_accepted_message_written.effective_time[cross_order_accepted_message_at]); cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  assert(cross_order_accepted_message_read.disclosure_mask == cross_order_accepted_message_written.disclosure_mask);
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> assert(cross_order_accepted_message_read.primary_order_id[cross_order_accepted_message_at] == cross_order_accepted_message_written.primary_order_id[cross_order_accepted_message_at]); cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 16 -> assert(cross_order_accepted_message_read.primary_cl_ord_id[cross_order_accepted_message_at] == cross_order_accepted_message_written.primary_cl_ord_id[cross_order_accepted_message_at]); cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> assert(cross_order_accepted_message_read.primary_cmta[cross_order_accepted_message_at] == cross_order_accepted_message_written.primary_cmta[cross_order_accepted_message_at]); cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> assert(cross_order_accepted_message_read.primary_clearing_account[cross_order_accepted_message_at] == cross_order_accepted_message_written.primary_clearing_account[cross_order_accepted_message_at]); cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> assert(cross_order_accepted_message_read.primary_occ_account[cross_order_accepted_message_at] == cross_order_accepted_message_written.primary_occ_account[cross_order_accepted_message_at]); cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 10 -> assert(cross_order_accepted_message_read.primary_cust_acct[cross_order_accepted_message_at] == cross_order_accepted_message_written.primary_cust_acct[cross_order_accepted_message_at]); cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> assert(cross_order_accepted_message_read.primary_price[cross_order_accepted_message_at] == cross_order_accepted_message_written.primary_price[cross_order_accepted_message_at]); cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> assert(cross_order_accepted_message_read.primary_quantity[cross_order_accepted_message_at] == cross_order_accepted_message_written.primary_quantity[cross_order_accepted_message_at]); cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  assert(cross_order_accepted_message_read.primary_capacity == cross_order_accepted_message_written.primary_capacity);
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 2 -> assert(cross_order_accepted_message_read.primary_position_effect_mask[cross_order_accepted_message_at] == cross_order_accepted_message_written.primary_position_effect_mask[cross_order_accepted_message_at]); cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  assert(cross_order_accepted_message_read.primary_stock_leg_short_sale == cross_order_accepted_message_written.primary_stock_leg_short_sale);
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> assert(cross_order_accepted_message_read.primary_stock_leg_mpid[cross_order_accepted_message_at] == cross_order_accepted_message_written.primary_stock_leg_mpid[cross_order_accepted_message_at]); cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> assert(cross_order_accepted_message_read.contra_order_id[cross_order_accepted_message_at] == cross_order_accepted_message_written.contra_order_id[cross_order_accepted_message_at]); cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 16 -> assert(cross_order_accepted_message_read.contra_cl_ord_id[cross_order_accepted_message_at] == cross_order_accepted_message_written.contra_cl_ord_id[cross_order_accepted_message_at]); cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> assert(cross_order_accepted_message_read.contra_cmta[cross_order_accepted_message_at] == cross_order_accepted_message_written.contra_cmta[cross_order_accepted_message_at]); cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> assert(cross_order_accepted_message_read.contra_clearing_account[cross_order_accepted_message_at] == cross_order_accepted_message_written.contra_clearing_account[cross_order_accepted_message_at]); cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> assert(cross_order_accepted_message_read.contra_occ_account[cross_order_accepted_message_at] == cross_order_accepted_message_written.contra_occ_account[cross_order_accepted_message_at]); cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 10 -> assert(cross_order_accepted_message_read.contra_cust_acct[cross_order_accepted_message_at] == cross_order_accepted_message_written.contra_cust_acct[cross_order_accepted_message_at]); cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  assert(cross_order_accepted_message_read.contra_order_type == cross_order_accepted_message_written.contra_order_type);
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 8 -> assert(cross_order_accepted_message_read.contra_price[cross_order_accepted_message_at] == cross_order_accepted_message_written.contra_price[cross_order_accepted_message_at]); cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> assert(cross_order_accepted_message_read.contra_quantity[cross_order_accepted_message_at] == cross_order_accepted_message_written.contra_quantity[cross_order_accepted_message_at]); cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  assert(cross_order_accepted_message_read.contra_capacity == cross_order_accepted_message_written.contra_capacity);
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 2 -> assert(cross_order_accepted_message_read.contra_position_effect_mask[cross_order_accepted_message_at] == cross_order_accepted_message_written.contra_position_effect_mask[cross_order_accepted_message_at]); cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  assert(cross_order_accepted_message_read.contra_stock_leg_short_sale == cross_order_accepted_message_written.contra_stock_leg_short_sale);
  cross_order_accepted_message_at = 0;
  do
  :: cross_order_accepted_message_at < 4 -> assert(cross_order_accepted_message_read.contra_stock_leg_mpid[cross_order_accepted_message_at] == cross_order_accepted_message_written.contra_stock_leg_mpid[cross_order_accepted_message_at]); cross_order_accepted_message_at = cross_order_accepted_message_at + 1
  :: else -> break
  od;
  assert(cross_order_accepted_message_read.reserved_1 == cross_order_accepted_message_written.reserved_1);
  skip
}

/* ---- Member Kill Switch Notification Message: 33 bytes ----------------------- */

/* The Member Kill Switch Notification informs of a Member Kill Switch Request issued by this OTTO account, or a Kill Switch Action (User or System initiated) targeting Firm ID(s) associated with this OTTO account. */
typedef MemberKillSwitchNotificationMessage {
  byte timestamp[8];
  byte firm_id[4];
  byte cl_request_id[16];
  byte target_firm_id[4];
  byte kill_action
};

int member_kill_switch_notification_message_at;

/* every byte of Member Kill Switch Notification Message set to one value */
inline fill_member_kill_switch_notification_message(member_kill_switch_notification_message_record, member_kill_switch_notification_message_value) {
  member_kill_switch_notification_message_at = 0;
  do
  :: member_kill_switch_notification_message_at < 8 -> member_kill_switch_notification_message_record.timestamp[member_kill_switch_notification_message_at] = member_kill_switch_notification_message_value; member_kill_switch_notification_message_at = member_kill_switch_notification_message_at + 1
  :: else -> break
  od;
  member_kill_switch_notification_message_at = 0;
  do
  :: member_kill_switch_notification_message_at < 4 -> member_kill_switch_notification_message_record.firm_id[member_kill_switch_notification_message_at] = member_kill_switch_notification_message_value; member_kill_switch_notification_message_at = member_kill_switch_notification_message_at + 1
  :: else -> break
  od;
  member_kill_switch_notification_message_at = 0;
  do
  :: member_kill_switch_notification_message_at < 16 -> member_kill_switch_notification_message_record.cl_request_id[member_kill_switch_notification_message_at] = member_kill_switch_notification_message_value; member_kill_switch_notification_message_at = member_kill_switch_notification_message_at + 1
  :: else -> break
  od;
  member_kill_switch_notification_message_at = 0;
  do
  :: member_kill_switch_notification_message_at < 4 -> member_kill_switch_notification_message_record.target_firm_id[member_kill_switch_notification_message_at] = member_kill_switch_notification_message_value; member_kill_switch_notification_message_at = member_kill_switch_notification_message_at + 1
  :: else -> break
  od;
  member_kill_switch_notification_message_record.kill_action = member_kill_switch_notification_message_value;
  skip
}

/* each byte of Member Kill Switch Notification Message set to where it lies, so a field read out of place says so */
inline ramp_member_kill_switch_notification_message(member_kill_switch_notification_message_record, member_kill_switch_notification_message_base) {
  member_kill_switch_notification_message_at = 0;
  do
  :: member_kill_switch_notification_message_at < 8 -> member_kill_switch_notification_message_record.timestamp[member_kill_switch_notification_message_at] = (member_kill_switch_notification_message_base + 0 + member_kill_switch_notification_message_at + 1) % 256; member_kill_switch_notification_message_at = member_kill_switch_notification_message_at + 1
  :: else -> break
  od;
  member_kill_switch_notification_message_at = 0;
  do
  :: member_kill_switch_notification_message_at < 4 -> member_kill_switch_notification_message_record.firm_id[member_kill_switch_notification_message_at] = (member_kill_switch_notification_message_base + 8 + member_kill_switch_notification_message_at + 1) % 256; member_kill_switch_notification_message_at = member_kill_switch_notification_message_at + 1
  :: else -> break
  od;
  member_kill_switch_notification_message_at = 0;
  do
  :: member_kill_switch_notification_message_at < 16 -> member_kill_switch_notification_message_record.cl_request_id[member_kill_switch_notification_message_at] = (member_kill_switch_notification_message_base + 12 + member_kill_switch_notification_message_at + 1) % 256; member_kill_switch_notification_message_at = member_kill_switch_notification_message_at + 1
  :: else -> break
  od;
  member_kill_switch_notification_message_at = 0;
  do
  :: member_kill_switch_notification_message_at < 4 -> member_kill_switch_notification_message_record.target_firm_id[member_kill_switch_notification_message_at] = (member_kill_switch_notification_message_base + 28 + member_kill_switch_notification_message_at + 1) % 256; member_kill_switch_notification_message_at = member_kill_switch_notification_message_at + 1
  :: else -> break
  od;
  member_kill_switch_notification_message_record.kill_action = (member_kill_switch_notification_message_base + 32 + 1) % 256;
  skip
}

/* Member Kill Switch Notification Message to the wire, 33 bytes from where the cursor stands */
inline encode_member_kill_switch_notification_message(member_kill_switch_notification_message_record) {
  member_kill_switch_notification_message_at = 0;
  do
  :: member_kill_switch_notification_message_at < 8 -> wire[at] = member_kill_switch_notification_message_record.timestamp[member_kill_switch_notification_message_at]; at = at + 1; member_kill_switch_notification_message_at = member_kill_switch_notification_message_at + 1
  :: else -> break
  od;
  member_kill_switch_notification_message_at = 0;
  do
  :: member_kill_switch_notification_message_at < 4 -> wire[at] = member_kill_switch_notification_message_record.firm_id[member_kill_switch_notification_message_at]; at = at + 1; member_kill_switch_notification_message_at = member_kill_switch_notification_message_at + 1
  :: else -> break
  od;
  member_kill_switch_notification_message_at = 0;
  do
  :: member_kill_switch_notification_message_at < 16 -> wire[at] = member_kill_switch_notification_message_record.cl_request_id[member_kill_switch_notification_message_at]; at = at + 1; member_kill_switch_notification_message_at = member_kill_switch_notification_message_at + 1
  :: else -> break
  od;
  member_kill_switch_notification_message_at = 0;
  do
  :: member_kill_switch_notification_message_at < 4 -> wire[at] = member_kill_switch_notification_message_record.target_firm_id[member_kill_switch_notification_message_at]; at = at + 1; member_kill_switch_notification_message_at = member_kill_switch_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = member_kill_switch_notification_message_record.kill_action; at = at + 1;
  skip
}

/* Member Kill Switch Notification Message off the wire, 33 bytes from where the cursor stands */
inline decode_member_kill_switch_notification_message(member_kill_switch_notification_message_record) {
  member_kill_switch_notification_message_at = 0;
  do
  :: member_kill_switch_notification_message_at < 8 -> member_kill_switch_notification_message_record.timestamp[member_kill_switch_notification_message_at] = wire[at]; at = at + 1; member_kill_switch_notification_message_at = member_kill_switch_notification_message_at + 1
  :: else -> break
  od;
  member_kill_switch_notification_message_at = 0;
  do
  :: member_kill_switch_notification_message_at < 4 -> member_kill_switch_notification_message_record.firm_id[member_kill_switch_notification_message_at] = wire[at]; at = at + 1; member_kill_switch_notification_message_at = member_kill_switch_notification_message_at + 1
  :: else -> break
  od;
  member_kill_switch_notification_message_at = 0;
  do
  :: member_kill_switch_notification_message_at < 16 -> member_kill_switch_notification_message_record.cl_request_id[member_kill_switch_notification_message_at] = wire[at]; at = at + 1; member_kill_switch_notification_message_at = member_kill_switch_notification_message_at + 1
  :: else -> break
  od;
  member_kill_switch_notification_message_at = 0;
  do
  :: member_kill_switch_notification_message_at < 4 -> member_kill_switch_notification_message_record.target_firm_id[member_kill_switch_notification_message_at] = wire[at]; at = at + 1; member_kill_switch_notification_message_at = member_kill_switch_notification_message_at + 1
  :: else -> break
  od;
  member_kill_switch_notification_message_record.kill_action = wire[at]; at = at + 1;
  skip
}

/* what was read of Member Kill Switch Notification Message is what was written, byte for byte */
inline equal_member_kill_switch_notification_message(member_kill_switch_notification_message_read, member_kill_switch_notification_message_written) {
  member_kill_switch_notification_message_at = 0;
  do
  :: member_kill_switch_notification_message_at < 8 -> assert(member_kill_switch_notification_message_read.timestamp[member_kill_switch_notification_message_at] == member_kill_switch_notification_message_written.timestamp[member_kill_switch_notification_message_at]); member_kill_switch_notification_message_at = member_kill_switch_notification_message_at + 1
  :: else -> break
  od;
  member_kill_switch_notification_message_at = 0;
  do
  :: member_kill_switch_notification_message_at < 4 -> assert(member_kill_switch_notification_message_read.firm_id[member_kill_switch_notification_message_at] == member_kill_switch_notification_message_written.firm_id[member_kill_switch_notification_message_at]); member_kill_switch_notification_message_at = member_kill_switch_notification_message_at + 1
  :: else -> break
  od;
  member_kill_switch_notification_message_at = 0;
  do
  :: member_kill_switch_notification_message_at < 16 -> assert(member_kill_switch_notification_message_read.cl_request_id[member_kill_switch_notification_message_at] == member_kill_switch_notification_message_written.cl_request_id[member_kill_switch_notification_message_at]); member_kill_switch_notification_message_at = member_kill_switch_notification_message_at + 1
  :: else -> break
  od;
  member_kill_switch_notification_message_at = 0;
  do
  :: member_kill_switch_notification_message_at < 4 -> assert(member_kill_switch_notification_message_read.target_firm_id[member_kill_switch_notification_message_at] == member_kill_switch_notification_message_written.target_firm_id[member_kill_switch_notification_message_at]); member_kill_switch_notification_message_at = member_kill_switch_notification_message_at + 1
  :: else -> break
  od;
  assert(member_kill_switch_notification_message_read.kill_action == member_kill_switch_notification_message_written.kill_action);
  skip
}

/* ---- Mass Cancel Response Message: 36 bytes ---------------------------------- */

/* Mass Cancel Response is sent out upon completion of processing of a valid Mass Cancel Request. */
typedef MassCancelResponseMessage {
  byte timestamp[8];
  byte firm_id[4];
  byte cl_request_id[16];
  byte num_canceled[4];
  byte num_pending[4]
};

int mass_cancel_response_message_at;

/* every byte of Mass Cancel Response Message set to one value */
inline fill_mass_cancel_response_message(mass_cancel_response_message_record, mass_cancel_response_message_value) {
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 8 -> mass_cancel_response_message_record.timestamp[mass_cancel_response_message_at] = mass_cancel_response_message_value; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 4 -> mass_cancel_response_message_record.firm_id[mass_cancel_response_message_at] = mass_cancel_response_message_value; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 16 -> mass_cancel_response_message_record.cl_request_id[mass_cancel_response_message_at] = mass_cancel_response_message_value; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 4 -> mass_cancel_response_message_record.num_canceled[mass_cancel_response_message_at] = mass_cancel_response_message_value; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 4 -> mass_cancel_response_message_record.num_pending[mass_cancel_response_message_at] = mass_cancel_response_message_value; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mass Cancel Response Message set to where it lies, so a field read out of place says so */
inline ramp_mass_cancel_response_message(mass_cancel_response_message_record, mass_cancel_response_message_base) {
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 8 -> mass_cancel_response_message_record.timestamp[mass_cancel_response_message_at] = (mass_cancel_response_message_base + 0 + mass_cancel_response_message_at + 1) % 256; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 4 -> mass_cancel_response_message_record.firm_id[mass_cancel_response_message_at] = (mass_cancel_response_message_base + 8 + mass_cancel_response_message_at + 1) % 256; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 16 -> mass_cancel_response_message_record.cl_request_id[mass_cancel_response_message_at] = (mass_cancel_response_message_base + 12 + mass_cancel_response_message_at + 1) % 256; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 4 -> mass_cancel_response_message_record.num_canceled[mass_cancel_response_message_at] = (mass_cancel_response_message_base + 28 + mass_cancel_response_message_at + 1) % 256; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 4 -> mass_cancel_response_message_record.num_pending[mass_cancel_response_message_at] = (mass_cancel_response_message_base + 32 + mass_cancel_response_message_at + 1) % 256; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Response Message to the wire, 36 bytes from where the cursor stands */
inline encode_mass_cancel_response_message(mass_cancel_response_message_record) {
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 8 -> wire[at] = mass_cancel_response_message_record.timestamp[mass_cancel_response_message_at]; at = at + 1; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 4 -> wire[at] = mass_cancel_response_message_record.firm_id[mass_cancel_response_message_at]; at = at + 1; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 16 -> wire[at] = mass_cancel_response_message_record.cl_request_id[mass_cancel_response_message_at]; at = at + 1; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 4 -> wire[at] = mass_cancel_response_message_record.num_canceled[mass_cancel_response_message_at]; at = at + 1; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 4 -> wire[at] = mass_cancel_response_message_record.num_pending[mass_cancel_response_message_at]; at = at + 1; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Response Message off the wire, 36 bytes from where the cursor stands */
inline decode_mass_cancel_response_message(mass_cancel_response_message_record) {
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 8 -> mass_cancel_response_message_record.timestamp[mass_cancel_response_message_at] = wire[at]; at = at + 1; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 4 -> mass_cancel_response_message_record.firm_id[mass_cancel_response_message_at] = wire[at]; at = at + 1; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 16 -> mass_cancel_response_message_record.cl_request_id[mass_cancel_response_message_at] = wire[at]; at = at + 1; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 4 -> mass_cancel_response_message_record.num_canceled[mass_cancel_response_message_at] = wire[at]; at = at + 1; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 4 -> mass_cancel_response_message_record.num_pending[mass_cancel_response_message_at] = wire[at]; at = at + 1; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mass Cancel Response Message is what was written, byte for byte */
inline equal_mass_cancel_response_message(mass_cancel_response_message_read, mass_cancel_response_message_written) {
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 8 -> assert(mass_cancel_response_message_read.timestamp[mass_cancel_response_message_at] == mass_cancel_response_message_written.timestamp[mass_cancel_response_message_at]); mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 4 -> assert(mass_cancel_response_message_read.firm_id[mass_cancel_response_message_at] == mass_cancel_response_message_written.firm_id[mass_cancel_response_message_at]); mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 16 -> assert(mass_cancel_response_message_read.cl_request_id[mass_cancel_response_message_at] == mass_cancel_response_message_written.cl_request_id[mass_cancel_response_message_at]); mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 4 -> assert(mass_cancel_response_message_read.num_canceled[mass_cancel_response_message_at] == mass_cancel_response_message_written.num_canceled[mass_cancel_response_message_at]); mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 4 -> assert(mass_cancel_response_message_read.num_pending[mass_cancel_response_message_at] == mass_cancel_response_message_written.num_pending[mass_cancel_response_message_at]); mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Complex Instrument Response Message: 32 bytes ----------------------- */

/* Add Complex Instrument Response indicates successful creation of new Complex Instrument using Add Complex Instrument Request. */
typedef AddComplexInstrumentResponseMessage {
  byte timestamp[8];
  byte firm_id[4];
  byte cl_request_id[16];
  byte instrument_id[4]
};

int add_complex_instrument_response_message_at;

/* every byte of Add Complex Instrument Response Message set to one value */
inline fill_add_complex_instrument_response_message(add_complex_instrument_response_message_record, add_complex_instrument_response_message_value) {
  add_complex_instrument_response_message_at = 0;
  do
  :: add_complex_instrument_response_message_at < 8 -> add_complex_instrument_response_message_record.timestamp[add_complex_instrument_response_message_at] = add_complex_instrument_response_message_value; add_complex_instrument_response_message_at = add_complex_instrument_response_message_at + 1
  :: else -> break
  od;
  add_complex_instrument_response_message_at = 0;
  do
  :: add_complex_instrument_response_message_at < 4 -> add_complex_instrument_response_message_record.firm_id[add_complex_instrument_response_message_at] = add_complex_instrument_response_message_value; add_complex_instrument_response_message_at = add_complex_instrument_response_message_at + 1
  :: else -> break
  od;
  add_complex_instrument_response_message_at = 0;
  do
  :: add_complex_instrument_response_message_at < 16 -> add_complex_instrument_response_message_record.cl_request_id[add_complex_instrument_response_message_at] = add_complex_instrument_response_message_value; add_complex_instrument_response_message_at = add_complex_instrument_response_message_at + 1
  :: else -> break
  od;
  add_complex_instrument_response_message_at = 0;
  do
  :: add_complex_instrument_response_message_at < 4 -> add_complex_instrument_response_message_record.instrument_id[add_complex_instrument_response_message_at] = add_complex_instrument_response_message_value; add_complex_instrument_response_message_at = add_complex_instrument_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Complex Instrument Response Message set to where it lies, so a field read out of place says so */
inline ramp_add_complex_instrument_response_message(add_complex_instrument_response_message_record, add_complex_instrument_response_message_base) {
  add_complex_instrument_response_message_at = 0;
  do
  :: add_complex_instrument_response_message_at < 8 -> add_complex_instrument_response_message_record.timestamp[add_complex_instrument_response_message_at] = (add_complex_instrument_response_message_base + 0 + add_complex_instrument_response_message_at + 1) % 256; add_complex_instrument_response_message_at = add_complex_instrument_response_message_at + 1
  :: else -> break
  od;
  add_complex_instrument_response_message_at = 0;
  do
  :: add_complex_instrument_response_message_at < 4 -> add_complex_instrument_response_message_record.firm_id[add_complex_instrument_response_message_at] = (add_complex_instrument_response_message_base + 8 + add_complex_instrument_response_message_at + 1) % 256; add_complex_instrument_response_message_at = add_complex_instrument_response_message_at + 1
  :: else -> break
  od;
  add_complex_instrument_response_message_at = 0;
  do
  :: add_complex_instrument_response_message_at < 16 -> add_complex_instrument_response_message_record.cl_request_id[add_complex_instrument_response_message_at] = (add_complex_instrument_response_message_base + 12 + add_complex_instrument_response_message_at + 1) % 256; add_complex_instrument_response_message_at = add_complex_instrument_response_message_at + 1
  :: else -> break
  od;
  add_complex_instrument_response_message_at = 0;
  do
  :: add_complex_instrument_response_message_at < 4 -> add_complex_instrument_response_message_record.instrument_id[add_complex_instrument_response_message_at] = (add_complex_instrument_response_message_base + 28 + add_complex_instrument_response_message_at + 1) % 256; add_complex_instrument_response_message_at = add_complex_instrument_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Complex Instrument Response Message to the wire, 32 bytes from where the cursor stands */
inline encode_add_complex_instrument_response_message(add_complex_instrument_response_message_record) {
  add_complex_instrument_response_message_at = 0;
  do
  :: add_complex_instrument_response_message_at < 8 -> wire[at] = add_complex_instrument_response_message_record.timestamp[add_complex_instrument_response_message_at]; at = at + 1; add_complex_instrument_response_message_at = add_complex_instrument_response_message_at + 1
  :: else -> break
  od;
  add_complex_instrument_response_message_at = 0;
  do
  :: add_complex_instrument_response_message_at < 4 -> wire[at] = add_complex_instrument_response_message_record.firm_id[add_complex_instrument_response_message_at]; at = at + 1; add_complex_instrument_response_message_at = add_complex_instrument_response_message_at + 1
  :: else -> break
  od;
  add_complex_instrument_response_message_at = 0;
  do
  :: add_complex_instrument_response_message_at < 16 -> wire[at] = add_complex_instrument_response_message_record.cl_request_id[add_complex_instrument_response_message_at]; at = at + 1; add_complex_instrument_response_message_at = add_complex_instrument_response_message_at + 1
  :: else -> break
  od;
  add_complex_instrument_response_message_at = 0;
  do
  :: add_complex_instrument_response_message_at < 4 -> wire[at] = add_complex_instrument_response_message_record.instrument_id[add_complex_instrument_response_message_at]; at = at + 1; add_complex_instrument_response_message_at = add_complex_instrument_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Complex Instrument Response Message off the wire, 32 bytes from where the cursor stands */
inline decode_add_complex_instrument_response_message(add_complex_instrument_response_message_record) {
  add_complex_instrument_response_message_at = 0;
  do
  :: add_complex_instrument_response_message_at < 8 -> add_complex_instrument_response_message_record.timestamp[add_complex_instrument_response_message_at] = wire[at]; at = at + 1; add_complex_instrument_response_message_at = add_complex_instrument_response_message_at + 1
  :: else -> break
  od;
  add_complex_instrument_response_message_at = 0;
  do
  :: add_complex_instrument_response_message_at < 4 -> add_complex_instrument_response_message_record.firm_id[add_complex_instrument_response_message_at] = wire[at]; at = at + 1; add_complex_instrument_response_message_at = add_complex_instrument_response_message_at + 1
  :: else -> break
  od;
  add_complex_instrument_response_message_at = 0;
  do
  :: add_complex_instrument_response_message_at < 16 -> add_complex_instrument_response_message_record.cl_request_id[add_complex_instrument_response_message_at] = wire[at]; at = at + 1; add_complex_instrument_response_message_at = add_complex_instrument_response_message_at + 1
  :: else -> break
  od;
  add_complex_instrument_response_message_at = 0;
  do
  :: add_complex_instrument_response_message_at < 4 -> add_complex_instrument_response_message_record.instrument_id[add_complex_instrument_response_message_at] = wire[at]; at = at + 1; add_complex_instrument_response_message_at = add_complex_instrument_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Complex Instrument Response Message is what was written, byte for byte */
inline equal_add_complex_instrument_response_message(add_complex_instrument_response_message_read, add_complex_instrument_response_message_written) {
  add_complex_instrument_response_message_at = 0;
  do
  :: add_complex_instrument_response_message_at < 8 -> assert(add_complex_instrument_response_message_read.timestamp[add_complex_instrument_response_message_at] == add_complex_instrument_response_message_written.timestamp[add_complex_instrument_response_message_at]); add_complex_instrument_response_message_at = add_complex_instrument_response_message_at + 1
  :: else -> break
  od;
  add_complex_instrument_response_message_at = 0;
  do
  :: add_complex_instrument_response_message_at < 4 -> assert(add_complex_instrument_response_message_read.firm_id[add_complex_instrument_response_message_at] == add_complex_instrument_response_message_written.firm_id[add_complex_instrument_response_message_at]); add_complex_instrument_response_message_at = add_complex_instrument_response_message_at + 1
  :: else -> break
  od;
  add_complex_instrument_response_message_at = 0;
  do
  :: add_complex_instrument_response_message_at < 16 -> assert(add_complex_instrument_response_message_read.cl_request_id[add_complex_instrument_response_message_at] == add_complex_instrument_response_message_written.cl_request_id[add_complex_instrument_response_message_at]); add_complex_instrument_response_message_at = add_complex_instrument_response_message_at + 1
  :: else -> break
  od;
  add_complex_instrument_response_message_at = 0;
  do
  :: add_complex_instrument_response_message_at < 4 -> assert(add_complex_instrument_response_message_read.instrument_id[add_complex_instrument_response_message_at] == add_complex_instrument_response_message_written.instrument_id[add_complex_instrument_response_message_at]); add_complex_instrument_response_message_at = add_complex_instrument_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Trade Response Message: 56 bytes --------------------------------- */

/* Modify Trade Response is sent when a valid Modify Trade Request is accepted. */
typedef ModifyTradeResponseMessage {
  byte timestamp[8];
  byte firm_id[4];
  byte instrument_id[4];
  byte cl_request_id[16];
  byte cl_ord_id[16];
  byte cross_id[4];
  byte match_id[4]
};

int modify_trade_response_message_at;

/* every byte of Modify Trade Response Message set to one value */
inline fill_modify_trade_response_message(modify_trade_response_message_record, modify_trade_response_message_value) {
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 8 -> modify_trade_response_message_record.timestamp[modify_trade_response_message_at] = modify_trade_response_message_value; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 4 -> modify_trade_response_message_record.firm_id[modify_trade_response_message_at] = modify_trade_response_message_value; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 4 -> modify_trade_response_message_record.instrument_id[modify_trade_response_message_at] = modify_trade_response_message_value; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 16 -> modify_trade_response_message_record.cl_request_id[modify_trade_response_message_at] = modify_trade_response_message_value; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 16 -> modify_trade_response_message_record.cl_ord_id[modify_trade_response_message_at] = modify_trade_response_message_value; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 4 -> modify_trade_response_message_record.cross_id[modify_trade_response_message_at] = modify_trade_response_message_value; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 4 -> modify_trade_response_message_record.match_id[modify_trade_response_message_at] = modify_trade_response_message_value; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Modify Trade Response Message set to where it lies, so a field read out of place says so */
inline ramp_modify_trade_response_message(modify_trade_response_message_record, modify_trade_response_message_base) {
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 8 -> modify_trade_response_message_record.timestamp[modify_trade_response_message_at] = (modify_trade_response_message_base + 0 + modify_trade_response_message_at + 1) % 256; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 4 -> modify_trade_response_message_record.firm_id[modify_trade_response_message_at] = (modify_trade_response_message_base + 8 + modify_trade_response_message_at + 1) % 256; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 4 -> modify_trade_response_message_record.instrument_id[modify_trade_response_message_at] = (modify_trade_response_message_base + 12 + modify_trade_response_message_at + 1) % 256; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 16 -> modify_trade_response_message_record.cl_request_id[modify_trade_response_message_at] = (modify_trade_response_message_base + 16 + modify_trade_response_message_at + 1) % 256; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 16 -> modify_trade_response_message_record.cl_ord_id[modify_trade_response_message_at] = (modify_trade_response_message_base + 32 + modify_trade_response_message_at + 1) % 256; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 4 -> modify_trade_response_message_record.cross_id[modify_trade_response_message_at] = (modify_trade_response_message_base + 48 + modify_trade_response_message_at + 1) % 256; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 4 -> modify_trade_response_message_record.match_id[modify_trade_response_message_at] = (modify_trade_response_message_base + 52 + modify_trade_response_message_at + 1) % 256; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Trade Response Message to the wire, 56 bytes from where the cursor stands */
inline encode_modify_trade_response_message(modify_trade_response_message_record) {
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 8 -> wire[at] = modify_trade_response_message_record.timestamp[modify_trade_response_message_at]; at = at + 1; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 4 -> wire[at] = modify_trade_response_message_record.firm_id[modify_trade_response_message_at]; at = at + 1; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 4 -> wire[at] = modify_trade_response_message_record.instrument_id[modify_trade_response_message_at]; at = at + 1; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 16 -> wire[at] = modify_trade_response_message_record.cl_request_id[modify_trade_response_message_at]; at = at + 1; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 16 -> wire[at] = modify_trade_response_message_record.cl_ord_id[modify_trade_response_message_at]; at = at + 1; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 4 -> wire[at] = modify_trade_response_message_record.cross_id[modify_trade_response_message_at]; at = at + 1; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 4 -> wire[at] = modify_trade_response_message_record.match_id[modify_trade_response_message_at]; at = at + 1; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Trade Response Message off the wire, 56 bytes from where the cursor stands */
inline decode_modify_trade_response_message(modify_trade_response_message_record) {
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 8 -> modify_trade_response_message_record.timestamp[modify_trade_response_message_at] = wire[at]; at = at + 1; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 4 -> modify_trade_response_message_record.firm_id[modify_trade_response_message_at] = wire[at]; at = at + 1; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 4 -> modify_trade_response_message_record.instrument_id[modify_trade_response_message_at] = wire[at]; at = at + 1; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 16 -> modify_trade_response_message_record.cl_request_id[modify_trade_response_message_at] = wire[at]; at = at + 1; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 16 -> modify_trade_response_message_record.cl_ord_id[modify_trade_response_message_at] = wire[at]; at = at + 1; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 4 -> modify_trade_response_message_record.cross_id[modify_trade_response_message_at] = wire[at]; at = at + 1; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 4 -> modify_trade_response_message_record.match_id[modify_trade_response_message_at] = wire[at]; at = at + 1; modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Modify Trade Response Message is what was written, byte for byte */
inline equal_modify_trade_response_message(modify_trade_response_message_read, modify_trade_response_message_written) {
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 8 -> assert(modify_trade_response_message_read.timestamp[modify_trade_response_message_at] == modify_trade_response_message_written.timestamp[modify_trade_response_message_at]); modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 4 -> assert(modify_trade_response_message_read.firm_id[modify_trade_response_message_at] == modify_trade_response_message_written.firm_id[modify_trade_response_message_at]); modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 4 -> assert(modify_trade_response_message_read.instrument_id[modify_trade_response_message_at] == modify_trade_response_message_written.instrument_id[modify_trade_response_message_at]); modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 16 -> assert(modify_trade_response_message_read.cl_request_id[modify_trade_response_message_at] == modify_trade_response_message_written.cl_request_id[modify_trade_response_message_at]); modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 16 -> assert(modify_trade_response_message_read.cl_ord_id[modify_trade_response_message_at] == modify_trade_response_message_written.cl_ord_id[modify_trade_response_message_at]); modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 4 -> assert(modify_trade_response_message_read.cross_id[modify_trade_response_message_at] == modify_trade_response_message_written.cross_id[modify_trade_response_message_at]); modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  modify_trade_response_message_at = 0;
  do
  :: modify_trade_response_message_at < 4 -> assert(modify_trade_response_message_read.match_id[modify_trade_response_message_at] == modify_trade_response_message_written.match_id[modify_trade_response_message_at]); modify_trade_response_message_at = modify_trade_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Subscription Response Message: 28 bytes --------------------------------- */

/* Subscription Response is sent after a valid Subscription Request has been processed. */
typedef SubscriptionResponseMessage {
  byte timestamp[8];
  byte firm_id[4];
  byte cl_request_id[16]
};

int subscription_response_message_at;

/* every byte of Subscription Response Message set to one value */
inline fill_subscription_response_message(subscription_response_message_record, subscription_response_message_value) {
  subscription_response_message_at = 0;
  do
  :: subscription_response_message_at < 8 -> subscription_response_message_record.timestamp[subscription_response_message_at] = subscription_response_message_value; subscription_response_message_at = subscription_response_message_at + 1
  :: else -> break
  od;
  subscription_response_message_at = 0;
  do
  :: subscription_response_message_at < 4 -> subscription_response_message_record.firm_id[subscription_response_message_at] = subscription_response_message_value; subscription_response_message_at = subscription_response_message_at + 1
  :: else -> break
  od;
  subscription_response_message_at = 0;
  do
  :: subscription_response_message_at < 16 -> subscription_response_message_record.cl_request_id[subscription_response_message_at] = subscription_response_message_value; subscription_response_message_at = subscription_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Subscription Response Message set to where it lies, so a field read out of place says so */
inline ramp_subscription_response_message(subscription_response_message_record, subscription_response_message_base) {
  subscription_response_message_at = 0;
  do
  :: subscription_response_message_at < 8 -> subscription_response_message_record.timestamp[subscription_response_message_at] = (subscription_response_message_base + 0 + subscription_response_message_at + 1) % 256; subscription_response_message_at = subscription_response_message_at + 1
  :: else -> break
  od;
  subscription_response_message_at = 0;
  do
  :: subscription_response_message_at < 4 -> subscription_response_message_record.firm_id[subscription_response_message_at] = (subscription_response_message_base + 8 + subscription_response_message_at + 1) % 256; subscription_response_message_at = subscription_response_message_at + 1
  :: else -> break
  od;
  subscription_response_message_at = 0;
  do
  :: subscription_response_message_at < 16 -> subscription_response_message_record.cl_request_id[subscription_response_message_at] = (subscription_response_message_base + 12 + subscription_response_message_at + 1) % 256; subscription_response_message_at = subscription_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Subscription Response Message to the wire, 28 bytes from where the cursor stands */
inline encode_subscription_response_message(subscription_response_message_record) {
  subscription_response_message_at = 0;
  do
  :: subscription_response_message_at < 8 -> wire[at] = subscription_response_message_record.timestamp[subscription_response_message_at]; at = at + 1; subscription_response_message_at = subscription_response_message_at + 1
  :: else -> break
  od;
  subscription_response_message_at = 0;
  do
  :: subscription_response_message_at < 4 -> wire[at] = subscription_response_message_record.firm_id[subscription_response_message_at]; at = at + 1; subscription_response_message_at = subscription_response_message_at + 1
  :: else -> break
  od;
  subscription_response_message_at = 0;
  do
  :: subscription_response_message_at < 16 -> wire[at] = subscription_response_message_record.cl_request_id[subscription_response_message_at]; at = at + 1; subscription_response_message_at = subscription_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Subscription Response Message off the wire, 28 bytes from where the cursor stands */
inline decode_subscription_response_message(subscription_response_message_record) {
  subscription_response_message_at = 0;
  do
  :: subscription_response_message_at < 8 -> subscription_response_message_record.timestamp[subscription_response_message_at] = wire[at]; at = at + 1; subscription_response_message_at = subscription_response_message_at + 1
  :: else -> break
  od;
  subscription_response_message_at = 0;
  do
  :: subscription_response_message_at < 4 -> subscription_response_message_record.firm_id[subscription_response_message_at] = wire[at]; at = at + 1; subscription_response_message_at = subscription_response_message_at + 1
  :: else -> break
  od;
  subscription_response_message_at = 0;
  do
  :: subscription_response_message_at < 16 -> subscription_response_message_record.cl_request_id[subscription_response_message_at] = wire[at]; at = at + 1; subscription_response_message_at = subscription_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Subscription Response Message is what was written, byte for byte */
inline equal_subscription_response_message(subscription_response_message_read, subscription_response_message_written) {
  subscription_response_message_at = 0;
  do
  :: subscription_response_message_at < 8 -> assert(subscription_response_message_read.timestamp[subscription_response_message_at] == subscription_response_message_written.timestamp[subscription_response_message_at]); subscription_response_message_at = subscription_response_message_at + 1
  :: else -> break
  od;
  subscription_response_message_at = 0;
  do
  :: subscription_response_message_at < 4 -> assert(subscription_response_message_read.firm_id[subscription_response_message_at] == subscription_response_message_written.firm_id[subscription_response_message_at]); subscription_response_message_at = subscription_response_message_at + 1
  :: else -> break
  od;
  subscription_response_message_at = 0;
  do
  :: subscription_response_message_at < 16 -> assert(subscription_response_message_read.cl_request_id[subscription_response_message_at] == subscription_response_message_written.cl_request_id[subscription_response_message_at]); subscription_response_message_at = subscription_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reject Message: 27 bytes ------------------------------------------------ */

/* Reject is sent in response to a Request that is deemed invalid. Reject message contains error code explaining the reason for rejection. */
typedef RejectMessage {
  byte timestamp[8];
  byte reject_msg_type;
  byte cl_ord_id[16];
  byte reject_code[2]
};

int reject_message_at;

/* every byte of Reject Message set to one value */
inline fill_reject_message(reject_message_record, reject_message_value) {
  reject_message_at = 0;
  do
  :: reject_message_at < 8 -> reject_message_record.timestamp[reject_message_at] = reject_message_value; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_record.reject_msg_type = reject_message_value;
  reject_message_at = 0;
  do
  :: reject_message_at < 16 -> reject_message_record.cl_ord_id[reject_message_at] = reject_message_value; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 2 -> reject_message_record.reject_code[reject_message_at] = reject_message_value; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reject Message set to where it lies, so a field read out of place says so */
inline ramp_reject_message(reject_message_record, reject_message_base) {
  reject_message_at = 0;
  do
  :: reject_message_at < 8 -> reject_message_record.timestamp[reject_message_at] = (reject_message_base + 0 + reject_message_at + 1) % 256; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_record.reject_msg_type = (reject_message_base + 8 + 1) % 256;
  reject_message_at = 0;
  do
  :: reject_message_at < 16 -> reject_message_record.cl_ord_id[reject_message_at] = (reject_message_base + 9 + reject_message_at + 1) % 256; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 2 -> reject_message_record.reject_code[reject_message_at] = (reject_message_base + 25 + reject_message_at + 1) % 256; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reject Message to the wire, 27 bytes from where the cursor stands */
inline encode_reject_message(reject_message_record) {
  reject_message_at = 0;
  do
  :: reject_message_at < 8 -> wire[at] = reject_message_record.timestamp[reject_message_at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  wire[at] = reject_message_record.reject_msg_type; at = at + 1;
  reject_message_at = 0;
  do
  :: reject_message_at < 16 -> wire[at] = reject_message_record.cl_ord_id[reject_message_at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 2 -> wire[at] = reject_message_record.reject_code[reject_message_at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reject Message off the wire, 27 bytes from where the cursor stands */
inline decode_reject_message(reject_message_record) {
  reject_message_at = 0;
  do
  :: reject_message_at < 8 -> reject_message_record.timestamp[reject_message_at] = wire[at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_record.reject_msg_type = wire[at]; at = at + 1;
  reject_message_at = 0;
  do
  :: reject_message_at < 16 -> reject_message_record.cl_ord_id[reject_message_at] = wire[at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 2 -> reject_message_record.reject_code[reject_message_at] = wire[at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reject Message is what was written, byte for byte */
inline equal_reject_message(reject_message_read, reject_message_written) {
  reject_message_at = 0;
  do
  :: reject_message_at < 8 -> assert(reject_message_read.timestamp[reject_message_at] == reject_message_written.timestamp[reject_message_at]); reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  assert(reject_message_read.reject_msg_type == reject_message_written.reject_msg_type);
  reject_message_at = 0;
  do
  :: reject_message_at < 16 -> assert(reject_message_read.cl_ord_id[reject_message_at] == reject_message_written.cl_ord_id[reject_message_at]); reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 2 -> assert(reject_message_read.reject_code[reject_message_at] == reject_message_written.reject_code[reject_message_at]); reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Pending Response Message: 34 bytes -------------------------------------- */

/* A Pending Response is sent by OTTO when a Request cannot be immediately, fully processed or validated, and indicates that the final status of the Request is not yet known (typically, any Request for a pending instrument). It is eventually followed by the Notification associated with the Request or a Reject. */
typedef PendingResponseMessage {
  byte timestamp[8];
  byte firm_id[4];
  byte instrument_id[4];
  byte pending_msg_type;
  byte cl_ord_id[16];
  byte pending_reason
};

int pending_response_message_at;

/* every byte of Pending Response Message set to one value */
inline fill_pending_response_message(pending_response_message_record, pending_response_message_value) {
  pending_response_message_at = 0;
  do
  :: pending_response_message_at < 8 -> pending_response_message_record.timestamp[pending_response_message_at] = pending_response_message_value; pending_response_message_at = pending_response_message_at + 1
  :: else -> break
  od;
  pending_response_message_at = 0;
  do
  :: pending_response_message_at < 4 -> pending_response_message_record.firm_id[pending_response_message_at] = pending_response_message_value; pending_response_message_at = pending_response_message_at + 1
  :: else -> break
  od;
  pending_response_message_at = 0;
  do
  :: pending_response_message_at < 4 -> pending_response_message_record.instrument_id[pending_response_message_at] = pending_response_message_value; pending_response_message_at = pending_response_message_at + 1
  :: else -> break
  od;
  pending_response_message_record.pending_msg_type = pending_response_message_value;
  pending_response_message_at = 0;
  do
  :: pending_response_message_at < 16 -> pending_response_message_record.cl_ord_id[pending_response_message_at] = pending_response_message_value; pending_response_message_at = pending_response_message_at + 1
  :: else -> break
  od;
  pending_response_message_record.pending_reason = pending_response_message_value;
  skip
}

/* each byte of Pending Response Message set to where it lies, so a field read out of place says so */
inline ramp_pending_response_message(pending_response_message_record, pending_response_message_base) {
  pending_response_message_at = 0;
  do
  :: pending_response_message_at < 8 -> pending_response_message_record.timestamp[pending_response_message_at] = (pending_response_message_base + 0 + pending_response_message_at + 1) % 256; pending_response_message_at = pending_response_message_at + 1
  :: else -> break
  od;
  pending_response_message_at = 0;
  do
  :: pending_response_message_at < 4 -> pending_response_message_record.firm_id[pending_response_message_at] = (pending_response_message_base + 8 + pending_response_message_at + 1) % 256; pending_response_message_at = pending_response_message_at + 1
  :: else -> break
  od;
  pending_response_message_at = 0;
  do
  :: pending_response_message_at < 4 -> pending_response_message_record.instrument_id[pending_response_message_at] = (pending_response_message_base + 12 + pending_response_message_at + 1) % 256; pending_response_message_at = pending_response_message_at + 1
  :: else -> break
  od;
  pending_response_message_record.pending_msg_type = (pending_response_message_base + 16 + 1) % 256;
  pending_response_message_at = 0;
  do
  :: pending_response_message_at < 16 -> pending_response_message_record.cl_ord_id[pending_response_message_at] = (pending_response_message_base + 17 + pending_response_message_at + 1) % 256; pending_response_message_at = pending_response_message_at + 1
  :: else -> break
  od;
  pending_response_message_record.pending_reason = (pending_response_message_base + 33 + 1) % 256;
  skip
}

/* Pending Response Message to the wire, 34 bytes from where the cursor stands */
inline encode_pending_response_message(pending_response_message_record) {
  pending_response_message_at = 0;
  do
  :: pending_response_message_at < 8 -> wire[at] = pending_response_message_record.timestamp[pending_response_message_at]; at = at + 1; pending_response_message_at = pending_response_message_at + 1
  :: else -> break
  od;
  pending_response_message_at = 0;
  do
  :: pending_response_message_at < 4 -> wire[at] = pending_response_message_record.firm_id[pending_response_message_at]; at = at + 1; pending_response_message_at = pending_response_message_at + 1
  :: else -> break
  od;
  pending_response_message_at = 0;
  do
  :: pending_response_message_at < 4 -> wire[at] = pending_response_message_record.instrument_id[pending_response_message_at]; at = at + 1; pending_response_message_at = pending_response_message_at + 1
  :: else -> break
  od;
  wire[at] = pending_response_message_record.pending_msg_type; at = at + 1;
  pending_response_message_at = 0;
  do
  :: pending_response_message_at < 16 -> wire[at] = pending_response_message_record.cl_ord_id[pending_response_message_at]; at = at + 1; pending_response_message_at = pending_response_message_at + 1
  :: else -> break
  od;
  wire[at] = pending_response_message_record.pending_reason; at = at + 1;
  skip
}

/* Pending Response Message off the wire, 34 bytes from where the cursor stands */
inline decode_pending_response_message(pending_response_message_record) {
  pending_response_message_at = 0;
  do
  :: pending_response_message_at < 8 -> pending_response_message_record.timestamp[pending_response_message_at] = wire[at]; at = at + 1; pending_response_message_at = pending_response_message_at + 1
  :: else -> break
  od;
  pending_response_message_at = 0;
  do
  :: pending_response_message_at < 4 -> pending_response_message_record.firm_id[pending_response_message_at] = wire[at]; at = at + 1; pending_response_message_at = pending_response_message_at + 1
  :: else -> break
  od;
  pending_response_message_at = 0;
  do
  :: pending_response_message_at < 4 -> pending_response_message_record.instrument_id[pending_response_message_at] = wire[at]; at = at + 1; pending_response_message_at = pending_response_message_at + 1
  :: else -> break
  od;
  pending_response_message_record.pending_msg_type = wire[at]; at = at + 1;
  pending_response_message_at = 0;
  do
  :: pending_response_message_at < 16 -> pending_response_message_record.cl_ord_id[pending_response_message_at] = wire[at]; at = at + 1; pending_response_message_at = pending_response_message_at + 1
  :: else -> break
  od;
  pending_response_message_record.pending_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Pending Response Message is what was written, byte for byte */
inline equal_pending_response_message(pending_response_message_read, pending_response_message_written) {
  pending_response_message_at = 0;
  do
  :: pending_response_message_at < 8 -> assert(pending_response_message_read.timestamp[pending_response_message_at] == pending_response_message_written.timestamp[pending_response_message_at]); pending_response_message_at = pending_response_message_at + 1
  :: else -> break
  od;
  pending_response_message_at = 0;
  do
  :: pending_response_message_at < 4 -> assert(pending_response_message_read.firm_id[pending_response_message_at] == pending_response_message_written.firm_id[pending_response_message_at]); pending_response_message_at = pending_response_message_at + 1
  :: else -> break
  od;
  pending_response_message_at = 0;
  do
  :: pending_response_message_at < 4 -> assert(pending_response_message_read.instrument_id[pending_response_message_at] == pending_response_message_written.instrument_id[pending_response_message_at]); pending_response_message_at = pending_response_message_at + 1
  :: else -> break
  od;
  assert(pending_response_message_read.pending_msg_type == pending_response_message_written.pending_msg_type);
  pending_response_message_at = 0;
  do
  :: pending_response_message_at < 16 -> assert(pending_response_message_read.cl_ord_id[pending_response_message_at] == pending_response_message_written.cl_ord_id[pending_response_message_at]); pending_response_message_at = pending_response_message_at + 1
  :: else -> break
  od;
  assert(pending_response_message_read.pending_reason == pending_response_message_written.pending_reason);
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

/* Simple Instrument Directory Message: encoded, read back, and compared */
proctype check_simple_instrument_directory_message() {
  SimpleInstrumentDirectoryMessage simple_instrument_directory_message_sent;
  SimpleInstrumentDirectoryMessage simple_instrument_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_instrument_directory_message(simple_instrument_directory_message_sent, 0)
  :: pattern == 1 -> fill_simple_instrument_directory_message(simple_instrument_directory_message_sent, 32)
  :: pattern == 2 -> fill_simple_instrument_directory_message(simple_instrument_directory_message_sent, 255)
  :: else -> ramp_simple_instrument_directory_message(simple_instrument_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_instrument_directory_message(simple_instrument_directory_message_sent);
    assert(at == 69);
    at = 0;
    decode_simple_instrument_directory_message(simple_instrument_directory_message_got);
    assert(at == 69);
    equal_simple_instrument_directory_message(simple_instrument_directory_message_got, simple_instrument_directory_message_sent)
  }
}

/* Instrument Trading Action Message: encoded, read back, and compared */
proctype check_instrument_trading_action_message() {
  InstrumentTradingActionMessage instrument_trading_action_message_sent;
  InstrumentTradingActionMessage instrument_trading_action_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_trading_action_message(instrument_trading_action_message_sent, 0)
  :: pattern == 1 -> fill_instrument_trading_action_message(instrument_trading_action_message_sent, 32)
  :: pattern == 2 -> fill_instrument_trading_action_message(instrument_trading_action_message_sent, 255)
  :: else -> ramp_instrument_trading_action_message(instrument_trading_action_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_trading_action_message(instrument_trading_action_message_sent);
    assert(at == 15);
    at = 0;
    decode_instrument_trading_action_message(instrument_trading_action_message_got);
    assert(at == 15);
    equal_instrument_trading_action_message(instrument_trading_action_message_got, instrument_trading_action_message_sent)
  }
}

/* Order Accepted Short Form Message: encoded, read back, and compared */
proctype check_order_accepted_short_form_message() {
  OrderAcceptedShortFormMessage order_accepted_short_form_message_sent;
  OrderAcceptedShortFormMessage order_accepted_short_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_accepted_short_form_message(order_accepted_short_form_message_sent, 0)
  :: pattern == 1 -> fill_order_accepted_short_form_message(order_accepted_short_form_message_sent, 32)
  :: pattern == 2 -> fill_order_accepted_short_form_message(order_accepted_short_form_message_sent, 255)
  :: else -> ramp_order_accepted_short_form_message(order_accepted_short_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_accepted_short_form_message(order_accepted_short_form_message_sent);
    assert(at == 65);
    at = 0;
    decode_order_accepted_short_form_message(order_accepted_short_form_message_got);
    assert(at == 65);
    equal_order_accepted_short_form_message(order_accepted_short_form_message_got, order_accepted_short_form_message_sent)
  }
}

/* Order Replaced Message: encoded, read back, and compared */
proctype check_order_replaced_message() {
  OrderReplacedMessage order_replaced_message_sent;
  OrderReplacedMessage order_replaced_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_replaced_message(order_replaced_message_sent, 0)
  :: pattern == 1 -> fill_order_replaced_message(order_replaced_message_sent, 32)
  :: pattern == 2 -> fill_order_replaced_message(order_replaced_message_sent, 255)
  :: else -> ramp_order_replaced_message(order_replaced_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_replaced_message(order_replaced_message_sent);
    assert(at == 100);
    at = 0;
    decode_order_replaced_message(order_replaced_message_got);
    assert(at == 100);
    equal_order_replaced_message(order_replaced_message_got, order_replaced_message_sent)
  }
}

/* Order Canceled Message: encoded, read back, and compared */
proctype check_order_canceled_message() {
  OrderCanceledMessage order_canceled_message_sent;
  OrderCanceledMessage order_canceled_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_canceled_message(order_canceled_message_sent, 0)
  :: pattern == 1 -> fill_order_canceled_message(order_canceled_message_sent, 32)
  :: pattern == 2 -> fill_order_canceled_message(order_canceled_message_sent, 255)
  :: else -> ramp_order_canceled_message(order_canceled_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_canceled_message(order_canceled_message_sent);
    assert(at == 41);
    at = 0;
    decode_order_canceled_message(order_canceled_message_got);
    assert(at == 41);
    equal_order_canceled_message(order_canceled_message_got, order_canceled_message_sent)
  }
}

/* Order Executed Message: encoded, read back, and compared */
proctype check_order_executed_message() {
  OrderExecutedMessage order_executed_message_sent;
  OrderExecutedMessage order_executed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_executed_message(order_executed_message_sent, 0)
  :: pattern == 1 -> fill_order_executed_message(order_executed_message_sent, 32)
  :: pattern == 2 -> fill_order_executed_message(order_executed_message_sent, 255)
  :: else -> ramp_order_executed_message(order_executed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_executed_message(order_executed_message_sent);
    assert(at == 72);
    at = 0;
    decode_order_executed_message(order_executed_message_got);
    assert(at == 72);
    equal_order_executed_message(order_executed_message_got, order_executed_message_sent)
  }
}

/* Trade Details Message: encoded, read back, and compared */
proctype check_trade_details_message() {
  TradeDetailsMessage trade_details_message_sent;
  TradeDetailsMessage trade_details_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_details_message(trade_details_message_sent, 0)
  :: pattern == 1 -> fill_trade_details_message(trade_details_message_sent, 32)
  :: pattern == 2 -> fill_trade_details_message(trade_details_message_sent, 255)
  :: else -> ramp_trade_details_message(trade_details_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_details_message(trade_details_message_sent);
    assert(at == 107);
    at = 0;
    decode_trade_details_message(trade_details_message_got);
    assert(at == 107);
    equal_trade_details_message(trade_details_message_got, trade_details_message_sent)
  }
}

/* Cross Order Accepted Message: encoded, read back, and compared */
proctype check_cross_order_accepted_message() {
  CrossOrderAcceptedMessage cross_order_accepted_message_sent;
  CrossOrderAcceptedMessage cross_order_accepted_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cross_order_accepted_message(cross_order_accepted_message_sent, 0)
  :: pattern == 1 -> fill_cross_order_accepted_message(cross_order_accepted_message_sent, 32)
  :: pattern == 2 -> fill_cross_order_accepted_message(cross_order_accepted_message_sent, 255)
  :: else -> ramp_cross_order_accepted_message(cross_order_accepted_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cross_order_accepted_message(cross_order_accepted_message_sent);
    assert(at == 169);
    at = 0;
    decode_cross_order_accepted_message(cross_order_accepted_message_got);
    assert(at == 169);
    equal_cross_order_accepted_message(cross_order_accepted_message_got, cross_order_accepted_message_sent)
  }
}

/* Member Kill Switch Notification Message: encoded, read back, and compared */
proctype check_member_kill_switch_notification_message() {
  MemberKillSwitchNotificationMessage member_kill_switch_notification_message_sent;
  MemberKillSwitchNotificationMessage member_kill_switch_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_member_kill_switch_notification_message(member_kill_switch_notification_message_sent, 0)
  :: pattern == 1 -> fill_member_kill_switch_notification_message(member_kill_switch_notification_message_sent, 32)
  :: pattern == 2 -> fill_member_kill_switch_notification_message(member_kill_switch_notification_message_sent, 255)
  :: else -> ramp_member_kill_switch_notification_message(member_kill_switch_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_member_kill_switch_notification_message(member_kill_switch_notification_message_sent);
    assert(at == 33);
    at = 0;
    decode_member_kill_switch_notification_message(member_kill_switch_notification_message_got);
    assert(at == 33);
    equal_member_kill_switch_notification_message(member_kill_switch_notification_message_got, member_kill_switch_notification_message_sent)
  }
}

/* Mass Cancel Response Message: encoded, read back, and compared */
proctype check_mass_cancel_response_message() {
  MassCancelResponseMessage mass_cancel_response_message_sent;
  MassCancelResponseMessage mass_cancel_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_cancel_response_message(mass_cancel_response_message_sent, 0)
  :: pattern == 1 -> fill_mass_cancel_response_message(mass_cancel_response_message_sent, 32)
  :: pattern == 2 -> fill_mass_cancel_response_message(mass_cancel_response_message_sent, 255)
  :: else -> ramp_mass_cancel_response_message(mass_cancel_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_cancel_response_message(mass_cancel_response_message_sent);
    assert(at == 36);
    at = 0;
    decode_mass_cancel_response_message(mass_cancel_response_message_got);
    assert(at == 36);
    equal_mass_cancel_response_message(mass_cancel_response_message_got, mass_cancel_response_message_sent)
  }
}

/* Add Complex Instrument Response Message: encoded, read back, and compared */
proctype check_add_complex_instrument_response_message() {
  AddComplexInstrumentResponseMessage add_complex_instrument_response_message_sent;
  AddComplexInstrumentResponseMessage add_complex_instrument_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_complex_instrument_response_message(add_complex_instrument_response_message_sent, 0)
  :: pattern == 1 -> fill_add_complex_instrument_response_message(add_complex_instrument_response_message_sent, 32)
  :: pattern == 2 -> fill_add_complex_instrument_response_message(add_complex_instrument_response_message_sent, 255)
  :: else -> ramp_add_complex_instrument_response_message(add_complex_instrument_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_complex_instrument_response_message(add_complex_instrument_response_message_sent);
    assert(at == 32);
    at = 0;
    decode_add_complex_instrument_response_message(add_complex_instrument_response_message_got);
    assert(at == 32);
    equal_add_complex_instrument_response_message(add_complex_instrument_response_message_got, add_complex_instrument_response_message_sent)
  }
}

/* Modify Trade Response Message: encoded, read back, and compared */
proctype check_modify_trade_response_message() {
  ModifyTradeResponseMessage modify_trade_response_message_sent;
  ModifyTradeResponseMessage modify_trade_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_trade_response_message(modify_trade_response_message_sent, 0)
  :: pattern == 1 -> fill_modify_trade_response_message(modify_trade_response_message_sent, 32)
  :: pattern == 2 -> fill_modify_trade_response_message(modify_trade_response_message_sent, 255)
  :: else -> ramp_modify_trade_response_message(modify_trade_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_trade_response_message(modify_trade_response_message_sent);
    assert(at == 56);
    at = 0;
    decode_modify_trade_response_message(modify_trade_response_message_got);
    assert(at == 56);
    equal_modify_trade_response_message(modify_trade_response_message_got, modify_trade_response_message_sent)
  }
}

/* Subscription Response Message: encoded, read back, and compared */
proctype check_subscription_response_message() {
  SubscriptionResponseMessage subscription_response_message_sent;
  SubscriptionResponseMessage subscription_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_subscription_response_message(subscription_response_message_sent, 0)
  :: pattern == 1 -> fill_subscription_response_message(subscription_response_message_sent, 32)
  :: pattern == 2 -> fill_subscription_response_message(subscription_response_message_sent, 255)
  :: else -> ramp_subscription_response_message(subscription_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_subscription_response_message(subscription_response_message_sent);
    assert(at == 28);
    at = 0;
    decode_subscription_response_message(subscription_response_message_got);
    assert(at == 28);
    equal_subscription_response_message(subscription_response_message_got, subscription_response_message_sent)
  }
}

/* Reject Message: encoded, read back, and compared */
proctype check_reject_message() {
  RejectMessage reject_message_sent;
  RejectMessage reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reject_message(reject_message_sent, 0)
  :: pattern == 1 -> fill_reject_message(reject_message_sent, 32)
  :: pattern == 2 -> fill_reject_message(reject_message_sent, 255)
  :: else -> ramp_reject_message(reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reject_message(reject_message_sent);
    assert(at == 27);
    at = 0;
    decode_reject_message(reject_message_got);
    assert(at == 27);
    equal_reject_message(reject_message_got, reject_message_sent)
  }
}

/* Pending Response Message: encoded, read back, and compared */
proctype check_pending_response_message() {
  PendingResponseMessage pending_response_message_sent;
  PendingResponseMessage pending_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_pending_response_message(pending_response_message_sent, 0)
  :: pattern == 1 -> fill_pending_response_message(pending_response_message_sent, 32)
  :: pattern == 2 -> fill_pending_response_message(pending_response_message_sent, 255)
  :: else -> ramp_pending_response_message(pending_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_pending_response_message(pending_response_message_sent);
    assert(at == 34);
    at = 0;
    decode_pending_response_message(pending_response_message_got);
    assert(at == 34);
    equal_pending_response_message(pending_response_message_got, pending_response_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_server_packet_header()
  :: run check_login_accepted_packet()
  :: run check_login_rejected_packet()
  :: run check_system_event_message()
  :: run check_simple_instrument_directory_message()
  :: run check_instrument_trading_action_message()
  :: run check_order_accepted_short_form_message()
  :: run check_order_replaced_message()
  :: run check_order_canceled_message()
  :: run check_order_executed_message()
  :: run check_trade_details_message()
  :: run check_cross_order_accepted_message()
  :: run check_member_kill_switch_notification_message()
  :: run check_mass_cancel_response_message()
  :: run check_add_complex_instrument_response_message()
  :: run check_modify_trade_response_message()
  :: run check_subscription_response_message()
  :: run check_reject_message()
  :: run check_pending_response_message()
  fi
}
