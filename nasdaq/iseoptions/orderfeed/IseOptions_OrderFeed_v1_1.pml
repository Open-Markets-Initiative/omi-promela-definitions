/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Ise Order Feed Market Data
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
 *   - the dispatch that chooses a message by its type
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 49

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 20 bytes ------------------------------------------------- */

/* Itch Mold Udp 64 Packet Header */
typedef PacketHeader {
  byte session[10];
  byte sequence_number[8];
  byte message_count[2]
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> packet_header_record.session[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sequence_number[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.message_count[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> packet_header_record.session[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sequence_number[packet_header_at] = (packet_header_base + 10 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.message_count[packet_header_at] = (packet_header_base + 18 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 20 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> wire[at] = packet_header_record.session[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> wire[at] = packet_header_record.sequence_number[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.message_count[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 20 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> packet_header_record.session[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sequence_number[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.message_count[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> assert(packet_header_read.session[packet_header_at] == packet_header_written.session[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> assert(packet_header_read.sequence_number[packet_header_at] == packet_header_written.sequence_number[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.message_count[packet_header_at] == packet_header_written.message_count[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 3 bytes ------------------------------------------------- */

/* Mold Udp 64 Message Header */
typedef MessageHeader {
  byte message_length[2];
  byte message_type
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = (message_header_base + 2 + 1) % 256;
  skip
}

/* Message Header to the wire, 3 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 3 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_length[message_header_at] == message_header_written.message_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- System Event Message: 13 bytes ------------------------------------------ */

/* The system event message type is used to signal a market or data feed handler event. */
typedef SystemEventMessage {
  byte timestamp[6];
  byte event_code;
  byte current_year[2];
  byte current_month;
  byte current_day;
  byte version;
  byte sub_version
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 6 -> system_event_message_record.timestamp[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = system_event_message_value;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.current_year[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.current_month = system_event_message_value;
  system_event_message_record.current_day = system_event_message_value;
  system_event_message_record.version = system_event_message_value;
  system_event_message_record.sub_version = system_event_message_value;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 6 -> system_event_message_record.timestamp[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 6 + 1) % 256;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.current_year[system_event_message_at] = (system_event_message_base + 7 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.current_month = (system_event_message_base + 9 + 1) % 256;
  system_event_message_record.current_day = (system_event_message_base + 10 + 1) % 256;
  system_event_message_record.version = (system_event_message_base + 11 + 1) % 256;
  system_event_message_record.sub_version = (system_event_message_base + 12 + 1) % 256;
  skip
}

/* System Event Message to the wire, 13 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 6 -> wire[at] = system_event_message_record.timestamp[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> wire[at] = system_event_message_record.current_year[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.current_month; at = at + 1;
  wire[at] = system_event_message_record.current_day; at = at + 1;
  wire[at] = system_event_message_record.version; at = at + 1;
  wire[at] = system_event_message_record.sub_version; at = at + 1;
  skip
}

/* System Event Message off the wire, 13 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 6 -> system_event_message_record.timestamp[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = wire[at]; at = at + 1;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.current_year[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.current_month = wire[at]; at = at + 1;
  system_event_message_record.current_day = wire[at]; at = at + 1;
  system_event_message_record.version = wire[at]; at = at + 1;
  system_event_message_record.sub_version = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 6 -> assert(system_event_message_read.timestamp[system_event_message_at] == system_event_message_written.timestamp[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> assert(system_event_message_read.current_year[system_event_message_at] == system_event_message_written.current_year[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.current_month == system_event_message_written.current_month);
  assert(system_event_message_read.current_day == system_event_message_written.current_day);
  assert(system_event_message_read.version == system_event_message_written.version);
  assert(system_event_message_read.sub_version == system_event_message_written.sub_version);
  skip
}

/* ---- Option Directory Message: 49 bytes -------------------------------------- */

/* At the start of each trading day, the options system disseminates directory messages for all symbols eligible for trading in the options system. */
typedef OptionDirectoryMessage {
  byte timestamp[6];
  byte option_id[4];
  byte security_symbol[6];
  byte expiration_year;
  byte expiration_month;
  byte expiration_day;
  byte strike_price[8];
  byte option_type;
  byte source;
  byte underlying_symbol[13];
  byte trading_type;
  byte contract_size[2];
  byte option_closing_type;
  byte tradable;
  byte mpv;
  byte closing_only
};

int option_directory_message_at;

/* every byte of Option Directory Message set to one value */
inline fill_option_directory_message(option_directory_message_record, option_directory_message_value) {
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 6 -> option_directory_message_record.timestamp[option_directory_message_at] = option_directory_message_value; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 4 -> option_directory_message_record.option_id[option_directory_message_at] = option_directory_message_value; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 6 -> option_directory_message_record.security_symbol[option_directory_message_at] = option_directory_message_value; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_record.expiration_year = option_directory_message_value;
  option_directory_message_record.expiration_month = option_directory_message_value;
  option_directory_message_record.expiration_day = option_directory_message_value;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 8 -> option_directory_message_record.strike_price[option_directory_message_at] = option_directory_message_value; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_record.option_type = option_directory_message_value;
  option_directory_message_record.source = option_directory_message_value;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 13 -> option_directory_message_record.underlying_symbol[option_directory_message_at] = option_directory_message_value; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_record.trading_type = option_directory_message_value;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 2 -> option_directory_message_record.contract_size[option_directory_message_at] = option_directory_message_value; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_record.option_closing_type = option_directory_message_value;
  option_directory_message_record.tradable = option_directory_message_value;
  option_directory_message_record.mpv = option_directory_message_value;
  option_directory_message_record.closing_only = option_directory_message_value;
  skip
}

/* each byte of Option Directory Message set to where it lies, so a field read out of place says so */
inline ramp_option_directory_message(option_directory_message_record, option_directory_message_base) {
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 6 -> option_directory_message_record.timestamp[option_directory_message_at] = (option_directory_message_base + 0 + option_directory_message_at + 1) % 256; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 4 -> option_directory_message_record.option_id[option_directory_message_at] = (option_directory_message_base + 6 + option_directory_message_at + 1) % 256; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 6 -> option_directory_message_record.security_symbol[option_directory_message_at] = (option_directory_message_base + 10 + option_directory_message_at + 1) % 256; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_record.expiration_year = (option_directory_message_base + 16 + 1) % 256;
  option_directory_message_record.expiration_month = (option_directory_message_base + 17 + 1) % 256;
  option_directory_message_record.expiration_day = (option_directory_message_base + 18 + 1) % 256;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 8 -> option_directory_message_record.strike_price[option_directory_message_at] = (option_directory_message_base + 19 + option_directory_message_at + 1) % 256; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_record.option_type = (option_directory_message_base + 27 + 1) % 256;
  option_directory_message_record.source = (option_directory_message_base + 28 + 1) % 256;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 13 -> option_directory_message_record.underlying_symbol[option_directory_message_at] = (option_directory_message_base + 29 + option_directory_message_at + 1) % 256; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_record.trading_type = (option_directory_message_base + 42 + 1) % 256;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 2 -> option_directory_message_record.contract_size[option_directory_message_at] = (option_directory_message_base + 43 + option_directory_message_at + 1) % 256; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_record.option_closing_type = (option_directory_message_base + 45 + 1) % 256;
  option_directory_message_record.tradable = (option_directory_message_base + 46 + 1) % 256;
  option_directory_message_record.mpv = (option_directory_message_base + 47 + 1) % 256;
  option_directory_message_record.closing_only = (option_directory_message_base + 48 + 1) % 256;
  skip
}

/* Option Directory Message to the wire, 49 bytes from where the cursor stands */
inline encode_option_directory_message(option_directory_message_record) {
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 6 -> wire[at] = option_directory_message_record.timestamp[option_directory_message_at]; at = at + 1; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 4 -> wire[at] = option_directory_message_record.option_id[option_directory_message_at]; at = at + 1; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 6 -> wire[at] = option_directory_message_record.security_symbol[option_directory_message_at]; at = at + 1; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = option_directory_message_record.expiration_year; at = at + 1;
  wire[at] = option_directory_message_record.expiration_month; at = at + 1;
  wire[at] = option_directory_message_record.expiration_day; at = at + 1;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 8 -> wire[at] = option_directory_message_record.strike_price[option_directory_message_at]; at = at + 1; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = option_directory_message_record.option_type; at = at + 1;
  wire[at] = option_directory_message_record.source; at = at + 1;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 13 -> wire[at] = option_directory_message_record.underlying_symbol[option_directory_message_at]; at = at + 1; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = option_directory_message_record.trading_type; at = at + 1;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 2 -> wire[at] = option_directory_message_record.contract_size[option_directory_message_at]; at = at + 1; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = option_directory_message_record.option_closing_type; at = at + 1;
  wire[at] = option_directory_message_record.tradable; at = at + 1;
  wire[at] = option_directory_message_record.mpv; at = at + 1;
  wire[at] = option_directory_message_record.closing_only; at = at + 1;
  skip
}

/* Option Directory Message off the wire, 49 bytes from where the cursor stands */
inline decode_option_directory_message(option_directory_message_record) {
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 6 -> option_directory_message_record.timestamp[option_directory_message_at] = wire[at]; at = at + 1; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 4 -> option_directory_message_record.option_id[option_directory_message_at] = wire[at]; at = at + 1; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 6 -> option_directory_message_record.security_symbol[option_directory_message_at] = wire[at]; at = at + 1; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_record.expiration_year = wire[at]; at = at + 1;
  option_directory_message_record.expiration_month = wire[at]; at = at + 1;
  option_directory_message_record.expiration_day = wire[at]; at = at + 1;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 8 -> option_directory_message_record.strike_price[option_directory_message_at] = wire[at]; at = at + 1; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_record.option_type = wire[at]; at = at + 1;
  option_directory_message_record.source = wire[at]; at = at + 1;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 13 -> option_directory_message_record.underlying_symbol[option_directory_message_at] = wire[at]; at = at + 1; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_record.trading_type = wire[at]; at = at + 1;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 2 -> option_directory_message_record.contract_size[option_directory_message_at] = wire[at]; at = at + 1; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_record.option_closing_type = wire[at]; at = at + 1;
  option_directory_message_record.tradable = wire[at]; at = at + 1;
  option_directory_message_record.mpv = wire[at]; at = at + 1;
  option_directory_message_record.closing_only = wire[at]; at = at + 1;
  skip
}

/* what was read of Option Directory Message is what was written, byte for byte */
inline equal_option_directory_message(option_directory_message_read, option_directory_message_written) {
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 6 -> assert(option_directory_message_read.timestamp[option_directory_message_at] == option_directory_message_written.timestamp[option_directory_message_at]); option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 4 -> assert(option_directory_message_read.option_id[option_directory_message_at] == option_directory_message_written.option_id[option_directory_message_at]); option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 6 -> assert(option_directory_message_read.security_symbol[option_directory_message_at] == option_directory_message_written.security_symbol[option_directory_message_at]); option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  assert(option_directory_message_read.expiration_year == option_directory_message_written.expiration_year);
  assert(option_directory_message_read.expiration_month == option_directory_message_written.expiration_month);
  assert(option_directory_message_read.expiration_day == option_directory_message_written.expiration_day);
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 8 -> assert(option_directory_message_read.strike_price[option_directory_message_at] == option_directory_message_written.strike_price[option_directory_message_at]); option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  assert(option_directory_message_read.option_type == option_directory_message_written.option_type);
  assert(option_directory_message_read.source == option_directory_message_written.source);
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 13 -> assert(option_directory_message_read.underlying_symbol[option_directory_message_at] == option_directory_message_written.underlying_symbol[option_directory_message_at]); option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  assert(option_directory_message_read.trading_type == option_directory_message_written.trading_type);
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 2 -> assert(option_directory_message_read.contract_size[option_directory_message_at] == option_directory_message_written.contract_size[option_directory_message_at]); option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  assert(option_directory_message_read.option_closing_type == option_directory_message_written.option_closing_type);
  assert(option_directory_message_read.tradable == option_directory_message_written.tradable);
  assert(option_directory_message_read.mpv == option_directory_message_written.mpv);
  assert(option_directory_message_read.closing_only == option_directory_message_written.closing_only);
  skip
}

/* ---- Trading Action Message: 11 bytes ---------------------------------------- */

/* The options system uses this administrative message to indicate the current trading status of an index or equity option within the options market. */
typedef TradingActionMessage {
  byte timestamp[6];
  byte option_id[4];
  byte current_trading_state
};

int trading_action_message_at;

/* every byte of Trading Action Message set to one value */
inline fill_trading_action_message(trading_action_message_record, trading_action_message_value) {
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
  :: trading_action_message_at < 6 -> trading_action_message_record.timestamp[trading_action_message_at] = (trading_action_message_base + 0 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> trading_action_message_record.option_id[trading_action_message_at] = (trading_action_message_base + 6 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_record.current_trading_state = (trading_action_message_base + 10 + 1) % 256;
  skip
}

/* Trading Action Message to the wire, 11 bytes from where the cursor stands */
inline encode_trading_action_message(trading_action_message_record) {
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

/* Trading Action Message off the wire, 11 bytes from where the cursor stands */
inline decode_trading_action_message(trading_action_message_record) {
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

/* ---- Security Open Closed Message: 11 bytes ---------------------------------- */

/* The options system uses this administrative message to indicate when an option has completed the opening process and is now available for auto execution or when the option has closed and is no longer available for auto execution. */
typedef SecurityOpenClosedMessage {
  byte timestamp[6];
  byte option_id[4];
  byte open_state
};

int security_open_closed_message_at;

/* every byte of Security Open Closed Message set to one value */
inline fill_security_open_closed_message(security_open_closed_message_record, security_open_closed_message_value) {
  security_open_closed_message_at = 0;
  do
  :: security_open_closed_message_at < 6 -> security_open_closed_message_record.timestamp[security_open_closed_message_at] = security_open_closed_message_value; security_open_closed_message_at = security_open_closed_message_at + 1
  :: else -> break
  od;
  security_open_closed_message_at = 0;
  do
  :: security_open_closed_message_at < 4 -> security_open_closed_message_record.option_id[security_open_closed_message_at] = security_open_closed_message_value; security_open_closed_message_at = security_open_closed_message_at + 1
  :: else -> break
  od;
  security_open_closed_message_record.open_state = security_open_closed_message_value;
  skip
}

/* each byte of Security Open Closed Message set to where it lies, so a field read out of place says so */
inline ramp_security_open_closed_message(security_open_closed_message_record, security_open_closed_message_base) {
  security_open_closed_message_at = 0;
  do
  :: security_open_closed_message_at < 6 -> security_open_closed_message_record.timestamp[security_open_closed_message_at] = (security_open_closed_message_base + 0 + security_open_closed_message_at + 1) % 256; security_open_closed_message_at = security_open_closed_message_at + 1
  :: else -> break
  od;
  security_open_closed_message_at = 0;
  do
  :: security_open_closed_message_at < 4 -> security_open_closed_message_record.option_id[security_open_closed_message_at] = (security_open_closed_message_base + 6 + security_open_closed_message_at + 1) % 256; security_open_closed_message_at = security_open_closed_message_at + 1
  :: else -> break
  od;
  security_open_closed_message_record.open_state = (security_open_closed_message_base + 10 + 1) % 256;
  skip
}

/* Security Open Closed Message to the wire, 11 bytes from where the cursor stands */
inline encode_security_open_closed_message(security_open_closed_message_record) {
  security_open_closed_message_at = 0;
  do
  :: security_open_closed_message_at < 6 -> wire[at] = security_open_closed_message_record.timestamp[security_open_closed_message_at]; at = at + 1; security_open_closed_message_at = security_open_closed_message_at + 1
  :: else -> break
  od;
  security_open_closed_message_at = 0;
  do
  :: security_open_closed_message_at < 4 -> wire[at] = security_open_closed_message_record.option_id[security_open_closed_message_at]; at = at + 1; security_open_closed_message_at = security_open_closed_message_at + 1
  :: else -> break
  od;
  wire[at] = security_open_closed_message_record.open_state; at = at + 1;
  skip
}

/* Security Open Closed Message off the wire, 11 bytes from where the cursor stands */
inline decode_security_open_closed_message(security_open_closed_message_record) {
  security_open_closed_message_at = 0;
  do
  :: security_open_closed_message_at < 6 -> security_open_closed_message_record.timestamp[security_open_closed_message_at] = wire[at]; at = at + 1; security_open_closed_message_at = security_open_closed_message_at + 1
  :: else -> break
  od;
  security_open_closed_message_at = 0;
  do
  :: security_open_closed_message_at < 4 -> security_open_closed_message_record.option_id[security_open_closed_message_at] = wire[at]; at = at + 1; security_open_closed_message_at = security_open_closed_message_at + 1
  :: else -> break
  od;
  security_open_closed_message_record.open_state = wire[at]; at = at + 1;
  skip
}

/* what was read of Security Open Closed Message is what was written, byte for byte */
inline equal_security_open_closed_message(security_open_closed_message_read, security_open_closed_message_written) {
  security_open_closed_message_at = 0;
  do
  :: security_open_closed_message_at < 6 -> assert(security_open_closed_message_read.timestamp[security_open_closed_message_at] == security_open_closed_message_written.timestamp[security_open_closed_message_at]); security_open_closed_message_at = security_open_closed_message_at + 1
  :: else -> break
  od;
  security_open_closed_message_at = 0;
  do
  :: security_open_closed_message_at < 4 -> assert(security_open_closed_message_read.option_id[security_open_closed_message_at] == security_open_closed_message_written.option_id[security_open_closed_message_at]); security_open_closed_message_at = security_open_closed_message_at + 1
  :: else -> break
  od;
  assert(security_open_closed_message_read.open_state == security_open_closed_message_written.open_state);
  skip
}

/* ---- Opening Imbalance Message: 23 bytes ------------------------------------- */

/* Nasdaq disseminates Opening Imbalance information at regular intervals in the time leading up to the Nasdaq Opening Auction events. */
typedef OpeningImbalanceMessage {
  byte timestamp[6];
  byte option_id[4];
  byte paired_contracts[4];
  byte imbalance_direction;
  byte imbalance_price[4];
  byte imbalance_volume[4]
};

int opening_imbalance_message_at;

/* every byte of Opening Imbalance Message set to one value */
inline fill_opening_imbalance_message(opening_imbalance_message_record, opening_imbalance_message_value) {
  opening_imbalance_message_at = 0;
  do
  :: opening_imbalance_message_at < 6 -> opening_imbalance_message_record.timestamp[opening_imbalance_message_at] = opening_imbalance_message_value; opening_imbalance_message_at = opening_imbalance_message_at + 1
  :: else -> break
  od;
  opening_imbalance_message_at = 0;
  do
  :: opening_imbalance_message_at < 4 -> opening_imbalance_message_record.option_id[opening_imbalance_message_at] = opening_imbalance_message_value; opening_imbalance_message_at = opening_imbalance_message_at + 1
  :: else -> break
  od;
  opening_imbalance_message_at = 0;
  do
  :: opening_imbalance_message_at < 4 -> opening_imbalance_message_record.paired_contracts[opening_imbalance_message_at] = opening_imbalance_message_value; opening_imbalance_message_at = opening_imbalance_message_at + 1
  :: else -> break
  od;
  opening_imbalance_message_record.imbalance_direction = opening_imbalance_message_value;
  opening_imbalance_message_at = 0;
  do
  :: opening_imbalance_message_at < 4 -> opening_imbalance_message_record.imbalance_price[opening_imbalance_message_at] = opening_imbalance_message_value; opening_imbalance_message_at = opening_imbalance_message_at + 1
  :: else -> break
  od;
  opening_imbalance_message_at = 0;
  do
  :: opening_imbalance_message_at < 4 -> opening_imbalance_message_record.imbalance_volume[opening_imbalance_message_at] = opening_imbalance_message_value; opening_imbalance_message_at = opening_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Opening Imbalance Message set to where it lies, so a field read out of place says so */
inline ramp_opening_imbalance_message(opening_imbalance_message_record, opening_imbalance_message_base) {
  opening_imbalance_message_at = 0;
  do
  :: opening_imbalance_message_at < 6 -> opening_imbalance_message_record.timestamp[opening_imbalance_message_at] = (opening_imbalance_message_base + 0 + opening_imbalance_message_at + 1) % 256; opening_imbalance_message_at = opening_imbalance_message_at + 1
  :: else -> break
  od;
  opening_imbalance_message_at = 0;
  do
  :: opening_imbalance_message_at < 4 -> opening_imbalance_message_record.option_id[opening_imbalance_message_at] = (opening_imbalance_message_base + 6 + opening_imbalance_message_at + 1) % 256; opening_imbalance_message_at = opening_imbalance_message_at + 1
  :: else -> break
  od;
  opening_imbalance_message_at = 0;
  do
  :: opening_imbalance_message_at < 4 -> opening_imbalance_message_record.paired_contracts[opening_imbalance_message_at] = (opening_imbalance_message_base + 10 + opening_imbalance_message_at + 1) % 256; opening_imbalance_message_at = opening_imbalance_message_at + 1
  :: else -> break
  od;
  opening_imbalance_message_record.imbalance_direction = (opening_imbalance_message_base + 14 + 1) % 256;
  opening_imbalance_message_at = 0;
  do
  :: opening_imbalance_message_at < 4 -> opening_imbalance_message_record.imbalance_price[opening_imbalance_message_at] = (opening_imbalance_message_base + 15 + opening_imbalance_message_at + 1) % 256; opening_imbalance_message_at = opening_imbalance_message_at + 1
  :: else -> break
  od;
  opening_imbalance_message_at = 0;
  do
  :: opening_imbalance_message_at < 4 -> opening_imbalance_message_record.imbalance_volume[opening_imbalance_message_at] = (opening_imbalance_message_base + 19 + opening_imbalance_message_at + 1) % 256; opening_imbalance_message_at = opening_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* Opening Imbalance Message to the wire, 23 bytes from where the cursor stands */
inline encode_opening_imbalance_message(opening_imbalance_message_record) {
  opening_imbalance_message_at = 0;
  do
  :: opening_imbalance_message_at < 6 -> wire[at] = opening_imbalance_message_record.timestamp[opening_imbalance_message_at]; at = at + 1; opening_imbalance_message_at = opening_imbalance_message_at + 1
  :: else -> break
  od;
  opening_imbalance_message_at = 0;
  do
  :: opening_imbalance_message_at < 4 -> wire[at] = opening_imbalance_message_record.option_id[opening_imbalance_message_at]; at = at + 1; opening_imbalance_message_at = opening_imbalance_message_at + 1
  :: else -> break
  od;
  opening_imbalance_message_at = 0;
  do
  :: opening_imbalance_message_at < 4 -> wire[at] = opening_imbalance_message_record.paired_contracts[opening_imbalance_message_at]; at = at + 1; opening_imbalance_message_at = opening_imbalance_message_at + 1
  :: else -> break
  od;
  wire[at] = opening_imbalance_message_record.imbalance_direction; at = at + 1;
  opening_imbalance_message_at = 0;
  do
  :: opening_imbalance_message_at < 4 -> wire[at] = opening_imbalance_message_record.imbalance_price[opening_imbalance_message_at]; at = at + 1; opening_imbalance_message_at = opening_imbalance_message_at + 1
  :: else -> break
  od;
  opening_imbalance_message_at = 0;
  do
  :: opening_imbalance_message_at < 4 -> wire[at] = opening_imbalance_message_record.imbalance_volume[opening_imbalance_message_at]; at = at + 1; opening_imbalance_message_at = opening_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* Opening Imbalance Message off the wire, 23 bytes from where the cursor stands */
inline decode_opening_imbalance_message(opening_imbalance_message_record) {
  opening_imbalance_message_at = 0;
  do
  :: opening_imbalance_message_at < 6 -> opening_imbalance_message_record.timestamp[opening_imbalance_message_at] = wire[at]; at = at + 1; opening_imbalance_message_at = opening_imbalance_message_at + 1
  :: else -> break
  od;
  opening_imbalance_message_at = 0;
  do
  :: opening_imbalance_message_at < 4 -> opening_imbalance_message_record.option_id[opening_imbalance_message_at] = wire[at]; at = at + 1; opening_imbalance_message_at = opening_imbalance_message_at + 1
  :: else -> break
  od;
  opening_imbalance_message_at = 0;
  do
  :: opening_imbalance_message_at < 4 -> opening_imbalance_message_record.paired_contracts[opening_imbalance_message_at] = wire[at]; at = at + 1; opening_imbalance_message_at = opening_imbalance_message_at + 1
  :: else -> break
  od;
  opening_imbalance_message_record.imbalance_direction = wire[at]; at = at + 1;
  opening_imbalance_message_at = 0;
  do
  :: opening_imbalance_message_at < 4 -> opening_imbalance_message_record.imbalance_price[opening_imbalance_message_at] = wire[at]; at = at + 1; opening_imbalance_message_at = opening_imbalance_message_at + 1
  :: else -> break
  od;
  opening_imbalance_message_at = 0;
  do
  :: opening_imbalance_message_at < 4 -> opening_imbalance_message_record.imbalance_volume[opening_imbalance_message_at] = wire[at]; at = at + 1; opening_imbalance_message_at = opening_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Opening Imbalance Message is what was written, byte for byte */
inline equal_opening_imbalance_message(opening_imbalance_message_read, opening_imbalance_message_written) {
  opening_imbalance_message_at = 0;
  do
  :: opening_imbalance_message_at < 6 -> assert(opening_imbalance_message_read.timestamp[opening_imbalance_message_at] == opening_imbalance_message_written.timestamp[opening_imbalance_message_at]); opening_imbalance_message_at = opening_imbalance_message_at + 1
  :: else -> break
  od;
  opening_imbalance_message_at = 0;
  do
  :: opening_imbalance_message_at < 4 -> assert(opening_imbalance_message_read.option_id[opening_imbalance_message_at] == opening_imbalance_message_written.option_id[opening_imbalance_message_at]); opening_imbalance_message_at = opening_imbalance_message_at + 1
  :: else -> break
  od;
  opening_imbalance_message_at = 0;
  do
  :: opening_imbalance_message_at < 4 -> assert(opening_imbalance_message_read.paired_contracts[opening_imbalance_message_at] == opening_imbalance_message_written.paired_contracts[opening_imbalance_message_at]); opening_imbalance_message_at = opening_imbalance_message_at + 1
  :: else -> break
  od;
  assert(opening_imbalance_message_read.imbalance_direction == opening_imbalance_message_written.imbalance_direction);
  opening_imbalance_message_at = 0;
  do
  :: opening_imbalance_message_at < 4 -> assert(opening_imbalance_message_read.imbalance_price[opening_imbalance_message_at] == opening_imbalance_message_written.imbalance_price[opening_imbalance_message_at]); opening_imbalance_message_at = opening_imbalance_message_at + 1
  :: else -> break
  od;
  opening_imbalance_message_at = 0;
  do
  :: opening_imbalance_message_at < 4 -> assert(opening_imbalance_message_read.imbalance_volume[opening_imbalance_message_at] == opening_imbalance_message_written.imbalance_volume[opening_imbalance_message_at]); opening_imbalance_message_at = opening_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order On Book Message: 40 bytes ----------------------------------------- */

/* An Order on Book message is generated for all the following situations whenever an order free from any display restrictions is reported by the matching engine. */
typedef OrderOnBookMessage {
  byte timestamp[6];
  byte option_id[4];
  byte order_type;
  byte side;
  byte price[4];
  byte size[4];
  byte exec_flag;
  byte order_capacity;
  byte owner_id[6];
  byte giveup[6];
  byte cmta[6]
};

int order_on_book_message_at;

/* every byte of Order On Book Message set to one value */
inline fill_order_on_book_message(order_on_book_message_record, order_on_book_message_value) {
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 6 -> order_on_book_message_record.timestamp[order_on_book_message_at] = order_on_book_message_value; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 4 -> order_on_book_message_record.option_id[order_on_book_message_at] = order_on_book_message_value; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  order_on_book_message_record.order_type = order_on_book_message_value;
  order_on_book_message_record.side = order_on_book_message_value;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 4 -> order_on_book_message_record.price[order_on_book_message_at] = order_on_book_message_value; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 4 -> order_on_book_message_record.size[order_on_book_message_at] = order_on_book_message_value; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  order_on_book_message_record.exec_flag = order_on_book_message_value;
  order_on_book_message_record.order_capacity = order_on_book_message_value;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 6 -> order_on_book_message_record.owner_id[order_on_book_message_at] = order_on_book_message_value; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 6 -> order_on_book_message_record.giveup[order_on_book_message_at] = order_on_book_message_value; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 6 -> order_on_book_message_record.cmta[order_on_book_message_at] = order_on_book_message_value; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order On Book Message set to where it lies, so a field read out of place says so */
inline ramp_order_on_book_message(order_on_book_message_record, order_on_book_message_base) {
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 6 -> order_on_book_message_record.timestamp[order_on_book_message_at] = (order_on_book_message_base + 0 + order_on_book_message_at + 1) % 256; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 4 -> order_on_book_message_record.option_id[order_on_book_message_at] = (order_on_book_message_base + 6 + order_on_book_message_at + 1) % 256; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  order_on_book_message_record.order_type = (order_on_book_message_base + 10 + 1) % 256;
  order_on_book_message_record.side = (order_on_book_message_base + 11 + 1) % 256;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 4 -> order_on_book_message_record.price[order_on_book_message_at] = (order_on_book_message_base + 12 + order_on_book_message_at + 1) % 256; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 4 -> order_on_book_message_record.size[order_on_book_message_at] = (order_on_book_message_base + 16 + order_on_book_message_at + 1) % 256; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  order_on_book_message_record.exec_flag = (order_on_book_message_base + 20 + 1) % 256;
  order_on_book_message_record.order_capacity = (order_on_book_message_base + 21 + 1) % 256;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 6 -> order_on_book_message_record.owner_id[order_on_book_message_at] = (order_on_book_message_base + 22 + order_on_book_message_at + 1) % 256; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 6 -> order_on_book_message_record.giveup[order_on_book_message_at] = (order_on_book_message_base + 28 + order_on_book_message_at + 1) % 256; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 6 -> order_on_book_message_record.cmta[order_on_book_message_at] = (order_on_book_message_base + 34 + order_on_book_message_at + 1) % 256; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order On Book Message to the wire, 40 bytes from where the cursor stands */
inline encode_order_on_book_message(order_on_book_message_record) {
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 6 -> wire[at] = order_on_book_message_record.timestamp[order_on_book_message_at]; at = at + 1; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 4 -> wire[at] = order_on_book_message_record.option_id[order_on_book_message_at]; at = at + 1; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  wire[at] = order_on_book_message_record.order_type; at = at + 1;
  wire[at] = order_on_book_message_record.side; at = at + 1;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 4 -> wire[at] = order_on_book_message_record.price[order_on_book_message_at]; at = at + 1; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 4 -> wire[at] = order_on_book_message_record.size[order_on_book_message_at]; at = at + 1; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  wire[at] = order_on_book_message_record.exec_flag; at = at + 1;
  wire[at] = order_on_book_message_record.order_capacity; at = at + 1;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 6 -> wire[at] = order_on_book_message_record.owner_id[order_on_book_message_at]; at = at + 1; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 6 -> wire[at] = order_on_book_message_record.giveup[order_on_book_message_at]; at = at + 1; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 6 -> wire[at] = order_on_book_message_record.cmta[order_on_book_message_at]; at = at + 1; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order On Book Message off the wire, 40 bytes from where the cursor stands */
inline decode_order_on_book_message(order_on_book_message_record) {
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 6 -> order_on_book_message_record.timestamp[order_on_book_message_at] = wire[at]; at = at + 1; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 4 -> order_on_book_message_record.option_id[order_on_book_message_at] = wire[at]; at = at + 1; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  order_on_book_message_record.order_type = wire[at]; at = at + 1;
  order_on_book_message_record.side = wire[at]; at = at + 1;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 4 -> order_on_book_message_record.price[order_on_book_message_at] = wire[at]; at = at + 1; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 4 -> order_on_book_message_record.size[order_on_book_message_at] = wire[at]; at = at + 1; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  order_on_book_message_record.exec_flag = wire[at]; at = at + 1;
  order_on_book_message_record.order_capacity = wire[at]; at = at + 1;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 6 -> order_on_book_message_record.owner_id[order_on_book_message_at] = wire[at]; at = at + 1; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 6 -> order_on_book_message_record.giveup[order_on_book_message_at] = wire[at]; at = at + 1; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 6 -> order_on_book_message_record.cmta[order_on_book_message_at] = wire[at]; at = at + 1; order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order On Book Message is what was written, byte for byte */
inline equal_order_on_book_message(order_on_book_message_read, order_on_book_message_written) {
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 6 -> assert(order_on_book_message_read.timestamp[order_on_book_message_at] == order_on_book_message_written.timestamp[order_on_book_message_at]); order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 4 -> assert(order_on_book_message_read.option_id[order_on_book_message_at] == order_on_book_message_written.option_id[order_on_book_message_at]); order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  assert(order_on_book_message_read.order_type == order_on_book_message_written.order_type);
  assert(order_on_book_message_read.side == order_on_book_message_written.side);
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 4 -> assert(order_on_book_message_read.price[order_on_book_message_at] == order_on_book_message_written.price[order_on_book_message_at]); order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 4 -> assert(order_on_book_message_read.size[order_on_book_message_at] == order_on_book_message_written.size[order_on_book_message_at]); order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  assert(order_on_book_message_read.exec_flag == order_on_book_message_written.exec_flag);
  assert(order_on_book_message_read.order_capacity == order_on_book_message_written.order_capacity);
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 6 -> assert(order_on_book_message_read.owner_id[order_on_book_message_at] == order_on_book_message_written.owner_id[order_on_book_message_at]); order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 6 -> assert(order_on_book_message_read.giveup[order_on_book_message_at] == order_on_book_message_written.giveup[order_on_book_message_at]); order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  order_on_book_message_at = 0;
  do
  :: order_on_book_message_at < 6 -> assert(order_on_book_message_read.cmta[order_on_book_message_at] == order_on_book_message_written.cmta[order_on_book_message_at]); order_on_book_message_at = order_on_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Packet Header: encoded, read back, and compared */
proctype check_packet_header() {
  PacketHeader packet_header_sent;
  PacketHeader packet_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_packet_header(packet_header_sent, 0)
  :: pattern == 1 -> fill_packet_header(packet_header_sent, 32)
  :: pattern == 2 -> fill_packet_header(packet_header_sent, 255)
  :: else -> ramp_packet_header(packet_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_packet_header(packet_header_sent);
    assert(at == 20);
    at = 0;
    decode_packet_header(packet_header_got);
    assert(at == 20);
    equal_packet_header(packet_header_got, packet_header_sent)
  }
}

/* Message Header: encoded, read back, and compared */
proctype check_message_header() {
  MessageHeader message_header_sent;
  MessageHeader message_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_message_header(message_header_sent, 0)
  :: pattern == 1 -> fill_message_header(message_header_sent, 32)
  :: pattern == 2 -> fill_message_header(message_header_sent, 255)
  :: else -> ramp_message_header(message_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_message_header(message_header_sent);
    assert(at == 3);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 3);
    equal_message_header(message_header_got, message_header_sent)
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
    assert(at == 13);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 13);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Option Directory Message: encoded, read back, and compared */
proctype check_option_directory_message() {
  OptionDirectoryMessage option_directory_message_sent;
  OptionDirectoryMessage option_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_option_directory_message(option_directory_message_sent, 0)
  :: pattern == 1 -> fill_option_directory_message(option_directory_message_sent, 32)
  :: pattern == 2 -> fill_option_directory_message(option_directory_message_sent, 255)
  :: else -> ramp_option_directory_message(option_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_option_directory_message(option_directory_message_sent);
    assert(at == 49);
    at = 0;
    decode_option_directory_message(option_directory_message_got);
    assert(at == 49);
    equal_option_directory_message(option_directory_message_got, option_directory_message_sent)
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
    assert(at == 11);
    at = 0;
    decode_trading_action_message(trading_action_message_got);
    assert(at == 11);
    equal_trading_action_message(trading_action_message_got, trading_action_message_sent)
  }
}

/* Security Open Closed Message: encoded, read back, and compared */
proctype check_security_open_closed_message() {
  SecurityOpenClosedMessage security_open_closed_message_sent;
  SecurityOpenClosedMessage security_open_closed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_security_open_closed_message(security_open_closed_message_sent, 0)
  :: pattern == 1 -> fill_security_open_closed_message(security_open_closed_message_sent, 32)
  :: pattern == 2 -> fill_security_open_closed_message(security_open_closed_message_sent, 255)
  :: else -> ramp_security_open_closed_message(security_open_closed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_security_open_closed_message(security_open_closed_message_sent);
    assert(at == 11);
    at = 0;
    decode_security_open_closed_message(security_open_closed_message_got);
    assert(at == 11);
    equal_security_open_closed_message(security_open_closed_message_got, security_open_closed_message_sent)
  }
}

/* Opening Imbalance Message: encoded, read back, and compared */
proctype check_opening_imbalance_message() {
  OpeningImbalanceMessage opening_imbalance_message_sent;
  OpeningImbalanceMessage opening_imbalance_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_opening_imbalance_message(opening_imbalance_message_sent, 0)
  :: pattern == 1 -> fill_opening_imbalance_message(opening_imbalance_message_sent, 32)
  :: pattern == 2 -> fill_opening_imbalance_message(opening_imbalance_message_sent, 255)
  :: else -> ramp_opening_imbalance_message(opening_imbalance_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_opening_imbalance_message(opening_imbalance_message_sent);
    assert(at == 23);
    at = 0;
    decode_opening_imbalance_message(opening_imbalance_message_got);
    assert(at == 23);
    equal_opening_imbalance_message(opening_imbalance_message_got, opening_imbalance_message_sent)
  }
}

/* Order On Book Message: encoded, read back, and compared */
proctype check_order_on_book_message() {
  OrderOnBookMessage order_on_book_message_sent;
  OrderOnBookMessage order_on_book_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_on_book_message(order_on_book_message_sent, 0)
  :: pattern == 1 -> fill_order_on_book_message(order_on_book_message_sent, 32)
  :: pattern == 2 -> fill_order_on_book_message(order_on_book_message_sent, 255)
  :: else -> ramp_order_on_book_message(order_on_book_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_on_book_message(order_on_book_message_sent);
    assert(at == 40);
    at = 0;
    decode_order_on_book_message(order_on_book_message_got);
    assert(at == 40);
    equal_order_on_book_message(order_on_book_message_got, order_on_book_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_system_event_message()
  :: run check_option_directory_message()
  :: run check_trading_action_message()
  :: run check_security_open_closed_message()
  :: run check_opening_imbalance_message()
  :: run check_order_on_book_message()
  fi
}
