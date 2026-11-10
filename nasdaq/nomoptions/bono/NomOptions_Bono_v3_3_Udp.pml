/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Nom Binary Order Entry
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
#define WIRE 39

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

/* ---- Timestamp Message: 4 bytes ---------------------------------------------- */

/* The system event message type is used to signal a market or data feed handler event. */
typedef TimestampMessage {
  byte second[4]
};

int timestamp_message_at;

/* every byte of Timestamp Message set to one value */
inline fill_timestamp_message(timestamp_message_record, timestamp_message_value) {
  timestamp_message_at = 0;
  do
  :: timestamp_message_at < 4 -> timestamp_message_record.second[timestamp_message_at] = timestamp_message_value; timestamp_message_at = timestamp_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Timestamp Message set to where it lies, so a field read out of place says so */
inline ramp_timestamp_message(timestamp_message_record, timestamp_message_base) {
  timestamp_message_at = 0;
  do
  :: timestamp_message_at < 4 -> timestamp_message_record.second[timestamp_message_at] = (timestamp_message_base + 0 + timestamp_message_at + 1) % 256; timestamp_message_at = timestamp_message_at + 1
  :: else -> break
  od;
  skip
}

/* Timestamp Message to the wire, 4 bytes from where the cursor stands */
inline encode_timestamp_message(timestamp_message_record) {
  timestamp_message_at = 0;
  do
  :: timestamp_message_at < 4 -> wire[at] = timestamp_message_record.second[timestamp_message_at]; at = at + 1; timestamp_message_at = timestamp_message_at + 1
  :: else -> break
  od;
  skip
}

/* Timestamp Message off the wire, 4 bytes from where the cursor stands */
inline decode_timestamp_message(timestamp_message_record) {
  timestamp_message_at = 0;
  do
  :: timestamp_message_at < 4 -> timestamp_message_record.second[timestamp_message_at] = wire[at]; at = at + 1; timestamp_message_at = timestamp_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Timestamp Message is what was written, byte for byte */
inline equal_timestamp_message(timestamp_message_read, timestamp_message_written) {
  timestamp_message_at = 0;
  do
  :: timestamp_message_at < 4 -> assert(timestamp_message_read.second[timestamp_message_at] == timestamp_message_written.second[timestamp_message_at]); timestamp_message_at = timestamp_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System Event Message: 7 bytes ------------------------------------------- */

/* The system event message type is used to signal a market or data feed handler event. */
typedef SystemEventMessage {
  byte nanoseconds[4];
  byte event_code;
  byte version;
  byte sub_version
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.nanoseconds[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
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
  :: system_event_message_at < 4 -> system_event_message_record.nanoseconds[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 4 + 1) % 256;
  system_event_message_record.version = (system_event_message_base + 5 + 1) % 256;
  system_event_message_record.sub_version = (system_event_message_base + 6 + 1) % 256;
  skip
}

/* System Event Message to the wire, 7 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> wire[at] = system_event_message_record.nanoseconds[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  wire[at] = system_event_message_record.version; at = at + 1;
  wire[at] = system_event_message_record.sub_version; at = at + 1;
  skip
}

/* System Event Message off the wire, 7 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.nanoseconds[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
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
  :: system_event_message_at < 4 -> assert(system_event_message_read.nanoseconds[system_event_message_at] == system_event_message_written.nanoseconds[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  assert(system_event_message_read.version == system_event_message_written.version);
  assert(system_event_message_read.sub_version == system_event_message_written.sub_version);
  skip
}

/* ---- Options Directory Message: 39 bytes ------------------------------------- */

/* At the start of each trading day, the options system disseminates directory messages for all symbols eligible for the auction process in the options system. */
typedef OptionsDirectoryMessage {
  byte nanoseconds[4];
  byte option_id[4];
  byte security_symbol[6];
  byte expiration_year;
  byte expiration_month;
  byte expiration_day;
  byte strike_price[4];
  byte option_type;
  byte source;
  byte underlying_symbol[13];
  byte option_closing_type;
  byte tradable;
  byte mpv
};

int options_directory_message_at;

/* every byte of Options Directory Message set to one value */
inline fill_options_directory_message(options_directory_message_record, options_directory_message_value) {
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 4 -> options_directory_message_record.nanoseconds[options_directory_message_at] = options_directory_message_value; options_directory_message_at = options_directory_message_at + 1
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
  options_directory_message_record.expiration_day = options_directory_message_value;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 4 -> options_directory_message_record.strike_price[options_directory_message_at] = options_directory_message_value; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_record.option_type = options_directory_message_value;
  options_directory_message_record.source = options_directory_message_value;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 13 -> options_directory_message_record.underlying_symbol[options_directory_message_at] = options_directory_message_value; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_record.option_closing_type = options_directory_message_value;
  options_directory_message_record.tradable = options_directory_message_value;
  options_directory_message_record.mpv = options_directory_message_value;
  skip
}

/* each byte of Options Directory Message set to where it lies, so a field read out of place says so */
inline ramp_options_directory_message(options_directory_message_record, options_directory_message_base) {
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 4 -> options_directory_message_record.nanoseconds[options_directory_message_at] = (options_directory_message_base + 0 + options_directory_message_at + 1) % 256; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 4 -> options_directory_message_record.option_id[options_directory_message_at] = (options_directory_message_base + 4 + options_directory_message_at + 1) % 256; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 6 -> options_directory_message_record.security_symbol[options_directory_message_at] = (options_directory_message_base + 8 + options_directory_message_at + 1) % 256; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_record.expiration_year = (options_directory_message_base + 14 + 1) % 256;
  options_directory_message_record.expiration_month = (options_directory_message_base + 15 + 1) % 256;
  options_directory_message_record.expiration_day = (options_directory_message_base + 16 + 1) % 256;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 4 -> options_directory_message_record.strike_price[options_directory_message_at] = (options_directory_message_base + 17 + options_directory_message_at + 1) % 256; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_record.option_type = (options_directory_message_base + 21 + 1) % 256;
  options_directory_message_record.source = (options_directory_message_base + 22 + 1) % 256;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 13 -> options_directory_message_record.underlying_symbol[options_directory_message_at] = (options_directory_message_base + 23 + options_directory_message_at + 1) % 256; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_record.option_closing_type = (options_directory_message_base + 36 + 1) % 256;
  options_directory_message_record.tradable = (options_directory_message_base + 37 + 1) % 256;
  options_directory_message_record.mpv = (options_directory_message_base + 38 + 1) % 256;
  skip
}

/* Options Directory Message to the wire, 39 bytes from where the cursor stands */
inline encode_options_directory_message(options_directory_message_record) {
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 4 -> wire[at] = options_directory_message_record.nanoseconds[options_directory_message_at]; at = at + 1; options_directory_message_at = options_directory_message_at + 1
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
  wire[at] = options_directory_message_record.expiration_day; at = at + 1;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 4 -> wire[at] = options_directory_message_record.strike_price[options_directory_message_at]; at = at + 1; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = options_directory_message_record.option_type; at = at + 1;
  wire[at] = options_directory_message_record.source; at = at + 1;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 13 -> wire[at] = options_directory_message_record.underlying_symbol[options_directory_message_at]; at = at + 1; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = options_directory_message_record.option_closing_type; at = at + 1;
  wire[at] = options_directory_message_record.tradable; at = at + 1;
  wire[at] = options_directory_message_record.mpv; at = at + 1;
  skip
}

/* Options Directory Message off the wire, 39 bytes from where the cursor stands */
inline decode_options_directory_message(options_directory_message_record) {
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 4 -> options_directory_message_record.nanoseconds[options_directory_message_at] = wire[at]; at = at + 1; options_directory_message_at = options_directory_message_at + 1
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
  options_directory_message_record.expiration_day = wire[at]; at = at + 1;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 4 -> options_directory_message_record.strike_price[options_directory_message_at] = wire[at]; at = at + 1; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_record.option_type = wire[at]; at = at + 1;
  options_directory_message_record.source = wire[at]; at = at + 1;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 13 -> options_directory_message_record.underlying_symbol[options_directory_message_at] = wire[at]; at = at + 1; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_record.option_closing_type = wire[at]; at = at + 1;
  options_directory_message_record.tradable = wire[at]; at = at + 1;
  options_directory_message_record.mpv = wire[at]; at = at + 1;
  skip
}

/* what was read of Options Directory Message is what was written, byte for byte */
inline equal_options_directory_message(options_directory_message_read, options_directory_message_written) {
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 4 -> assert(options_directory_message_read.nanoseconds[options_directory_message_at] == options_directory_message_written.nanoseconds[options_directory_message_at]); options_directory_message_at = options_directory_message_at + 1
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
  assert(options_directory_message_read.expiration_day == options_directory_message_written.expiration_day);
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 4 -> assert(options_directory_message_read.strike_price[options_directory_message_at] == options_directory_message_written.strike_price[options_directory_message_at]); options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  assert(options_directory_message_read.option_type == options_directory_message_written.option_type);
  assert(options_directory_message_read.source == options_directory_message_written.source);
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 13 -> assert(options_directory_message_read.underlying_symbol[options_directory_message_at] == options_directory_message_written.underlying_symbol[options_directory_message_at]); options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  assert(options_directory_message_read.option_closing_type == options_directory_message_written.option_closing_type);
  assert(options_directory_message_read.tradable == options_directory_message_written.tradable);
  assert(options_directory_message_read.mpv == options_directory_message_written.mpv);
  skip
}

/* ---- Trading Action Message: 9 bytes ----------------------------------------- */

/* The options system uses this administrative message to indicate the current trading status of an index or equity option within the options market. */
typedef TradingActionMessage {
  byte nanoseconds[4];
  byte option_id[4];
  byte current_trading_state
};

int trading_action_message_at;

/* every byte of Trading Action Message set to one value */
inline fill_trading_action_message(trading_action_message_record, trading_action_message_value) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> trading_action_message_record.nanoseconds[trading_action_message_at] = trading_action_message_value; trading_action_message_at = trading_action_message_at + 1
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
  :: trading_action_message_at < 4 -> trading_action_message_record.nanoseconds[trading_action_message_at] = (trading_action_message_base + 0 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> trading_action_message_record.option_id[trading_action_message_at] = (trading_action_message_base + 4 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_record.current_trading_state = (trading_action_message_base + 8 + 1) % 256;
  skip
}

/* Trading Action Message to the wire, 9 bytes from where the cursor stands */
inline encode_trading_action_message(trading_action_message_record) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> wire[at] = trading_action_message_record.nanoseconds[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
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

/* Trading Action Message off the wire, 9 bytes from where the cursor stands */
inline decode_trading_action_message(trading_action_message_record) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> trading_action_message_record.nanoseconds[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
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
  :: trading_action_message_at < 4 -> assert(trading_action_message_read.nanoseconds[trading_action_message_at] == trading_action_message_written.nanoseconds[trading_action_message_at]); trading_action_message_at = trading_action_message_at + 1
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

/* ---- Security Open Closed Message: 9 bytes ----------------------------------- */

/* The options system uses this administrative message to indicate when an option has completed the opening process and is now available for auto execution or when the option has closed and is no longer available for auto execution. */
typedef SecurityOpenClosedMessage {
  byte nanoseconds[4];
  byte option_id[4];
  byte open_state
};

int security_open_closed_message_at;

/* every byte of Security Open Closed Message set to one value */
inline fill_security_open_closed_message(security_open_closed_message_record, security_open_closed_message_value) {
  security_open_closed_message_at = 0;
  do
  :: security_open_closed_message_at < 4 -> security_open_closed_message_record.nanoseconds[security_open_closed_message_at] = security_open_closed_message_value; security_open_closed_message_at = security_open_closed_message_at + 1
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
  :: security_open_closed_message_at < 4 -> security_open_closed_message_record.nanoseconds[security_open_closed_message_at] = (security_open_closed_message_base + 0 + security_open_closed_message_at + 1) % 256; security_open_closed_message_at = security_open_closed_message_at + 1
  :: else -> break
  od;
  security_open_closed_message_at = 0;
  do
  :: security_open_closed_message_at < 4 -> security_open_closed_message_record.option_id[security_open_closed_message_at] = (security_open_closed_message_base + 4 + security_open_closed_message_at + 1) % 256; security_open_closed_message_at = security_open_closed_message_at + 1
  :: else -> break
  od;
  security_open_closed_message_record.open_state = (security_open_closed_message_base + 8 + 1) % 256;
  skip
}

/* Security Open Closed Message to the wire, 9 bytes from where the cursor stands */
inline encode_security_open_closed_message(security_open_closed_message_record) {
  security_open_closed_message_at = 0;
  do
  :: security_open_closed_message_at < 4 -> wire[at] = security_open_closed_message_record.nanoseconds[security_open_closed_message_at]; at = at + 1; security_open_closed_message_at = security_open_closed_message_at + 1
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

/* Security Open Closed Message off the wire, 9 bytes from where the cursor stands */
inline decode_security_open_closed_message(security_open_closed_message_record) {
  security_open_closed_message_at = 0;
  do
  :: security_open_closed_message_at < 4 -> security_open_closed_message_record.nanoseconds[security_open_closed_message_at] = wire[at]; at = at + 1; security_open_closed_message_at = security_open_closed_message_at + 1
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
  :: security_open_closed_message_at < 4 -> assert(security_open_closed_message_read.nanoseconds[security_open_closed_message_at] == security_open_closed_message_written.nanoseconds[security_open_closed_message_at]); security_open_closed_message_at = security_open_closed_message_at + 1
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

/* ---- Short Best Bid And Ask Update Message: 17 bytes ------------------------- */

/* Whenever the best bid and ask position changes on both sides, the options system will send its best bid and ask update via the data feed for the affected security. */
typedef ShortBestBidAndAskUpdateMessage {
  byte nanoseconds[4];
  byte option_id[4];
  byte quote_condition;
  byte bid_price_2[2];
  byte bid_size_2[2];
  byte ask_price_2[2];
  byte ask_size_2[2]
};

int short_best_bid_and_ask_update_message_at;

/* every byte of Short Best Bid And Ask Update Message set to one value */
inline fill_short_best_bid_and_ask_update_message(short_best_bid_and_ask_update_message_record, short_best_bid_and_ask_update_message_value) {
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 4 -> short_best_bid_and_ask_update_message_record.nanoseconds[short_best_bid_and_ask_update_message_at] = short_best_bid_and_ask_update_message_value; short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 4 -> short_best_bid_and_ask_update_message_record.option_id[short_best_bid_and_ask_update_message_at] = short_best_bid_and_ask_update_message_value; short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_and_ask_update_message_record.quote_condition = short_best_bid_and_ask_update_message_value;
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 2 -> short_best_bid_and_ask_update_message_record.bid_price_2[short_best_bid_and_ask_update_message_at] = short_best_bid_and_ask_update_message_value; short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 2 -> short_best_bid_and_ask_update_message_record.bid_size_2[short_best_bid_and_ask_update_message_at] = short_best_bid_and_ask_update_message_value; short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 2 -> short_best_bid_and_ask_update_message_record.ask_price_2[short_best_bid_and_ask_update_message_at] = short_best_bid_and_ask_update_message_value; short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 2 -> short_best_bid_and_ask_update_message_record.ask_size_2[short_best_bid_and_ask_update_message_at] = short_best_bid_and_ask_update_message_value; short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Short Best Bid And Ask Update Message set to where it lies, so a field read out of place says so */
inline ramp_short_best_bid_and_ask_update_message(short_best_bid_and_ask_update_message_record, short_best_bid_and_ask_update_message_base) {
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 4 -> short_best_bid_and_ask_update_message_record.nanoseconds[short_best_bid_and_ask_update_message_at] = (short_best_bid_and_ask_update_message_base + 0 + short_best_bid_and_ask_update_message_at + 1) % 256; short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 4 -> short_best_bid_and_ask_update_message_record.option_id[short_best_bid_and_ask_update_message_at] = (short_best_bid_and_ask_update_message_base + 4 + short_best_bid_and_ask_update_message_at + 1) % 256; short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_and_ask_update_message_record.quote_condition = (short_best_bid_and_ask_update_message_base + 8 + 1) % 256;
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 2 -> short_best_bid_and_ask_update_message_record.bid_price_2[short_best_bid_and_ask_update_message_at] = (short_best_bid_and_ask_update_message_base + 9 + short_best_bid_and_ask_update_message_at + 1) % 256; short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 2 -> short_best_bid_and_ask_update_message_record.bid_size_2[short_best_bid_and_ask_update_message_at] = (short_best_bid_and_ask_update_message_base + 11 + short_best_bid_and_ask_update_message_at + 1) % 256; short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 2 -> short_best_bid_and_ask_update_message_record.ask_price_2[short_best_bid_and_ask_update_message_at] = (short_best_bid_and_ask_update_message_base + 13 + short_best_bid_and_ask_update_message_at + 1) % 256; short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 2 -> short_best_bid_and_ask_update_message_record.ask_size_2[short_best_bid_and_ask_update_message_at] = (short_best_bid_and_ask_update_message_base + 15 + short_best_bid_and_ask_update_message_at + 1) % 256; short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Short Best Bid And Ask Update Message to the wire, 17 bytes from where the cursor stands */
inline encode_short_best_bid_and_ask_update_message(short_best_bid_and_ask_update_message_record) {
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 4 -> wire[at] = short_best_bid_and_ask_update_message_record.nanoseconds[short_best_bid_and_ask_update_message_at]; at = at + 1; short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 4 -> wire[at] = short_best_bid_and_ask_update_message_record.option_id[short_best_bid_and_ask_update_message_at]; at = at + 1; short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  wire[at] = short_best_bid_and_ask_update_message_record.quote_condition; at = at + 1;
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 2 -> wire[at] = short_best_bid_and_ask_update_message_record.bid_price_2[short_best_bid_and_ask_update_message_at]; at = at + 1; short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 2 -> wire[at] = short_best_bid_and_ask_update_message_record.bid_size_2[short_best_bid_and_ask_update_message_at]; at = at + 1; short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 2 -> wire[at] = short_best_bid_and_ask_update_message_record.ask_price_2[short_best_bid_and_ask_update_message_at]; at = at + 1; short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 2 -> wire[at] = short_best_bid_and_ask_update_message_record.ask_size_2[short_best_bid_and_ask_update_message_at]; at = at + 1; short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Short Best Bid And Ask Update Message off the wire, 17 bytes from where the cursor stands */
inline decode_short_best_bid_and_ask_update_message(short_best_bid_and_ask_update_message_record) {
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 4 -> short_best_bid_and_ask_update_message_record.nanoseconds[short_best_bid_and_ask_update_message_at] = wire[at]; at = at + 1; short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 4 -> short_best_bid_and_ask_update_message_record.option_id[short_best_bid_and_ask_update_message_at] = wire[at]; at = at + 1; short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_and_ask_update_message_record.quote_condition = wire[at]; at = at + 1;
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 2 -> short_best_bid_and_ask_update_message_record.bid_price_2[short_best_bid_and_ask_update_message_at] = wire[at]; at = at + 1; short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 2 -> short_best_bid_and_ask_update_message_record.bid_size_2[short_best_bid_and_ask_update_message_at] = wire[at]; at = at + 1; short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 2 -> short_best_bid_and_ask_update_message_record.ask_price_2[short_best_bid_and_ask_update_message_at] = wire[at]; at = at + 1; short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 2 -> short_best_bid_and_ask_update_message_record.ask_size_2[short_best_bid_and_ask_update_message_at] = wire[at]; at = at + 1; short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Short Best Bid And Ask Update Message is what was written, byte for byte */
inline equal_short_best_bid_and_ask_update_message(short_best_bid_and_ask_update_message_read, short_best_bid_and_ask_update_message_written) {
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 4 -> assert(short_best_bid_and_ask_update_message_read.nanoseconds[short_best_bid_and_ask_update_message_at] == short_best_bid_and_ask_update_message_written.nanoseconds[short_best_bid_and_ask_update_message_at]); short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 4 -> assert(short_best_bid_and_ask_update_message_read.option_id[short_best_bid_and_ask_update_message_at] == short_best_bid_and_ask_update_message_written.option_id[short_best_bid_and_ask_update_message_at]); short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  assert(short_best_bid_and_ask_update_message_read.quote_condition == short_best_bid_and_ask_update_message_written.quote_condition);
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 2 -> assert(short_best_bid_and_ask_update_message_read.bid_price_2[short_best_bid_and_ask_update_message_at] == short_best_bid_and_ask_update_message_written.bid_price_2[short_best_bid_and_ask_update_message_at]); short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 2 -> assert(short_best_bid_and_ask_update_message_read.bid_size_2[short_best_bid_and_ask_update_message_at] == short_best_bid_and_ask_update_message_written.bid_size_2[short_best_bid_and_ask_update_message_at]); short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 2 -> assert(short_best_bid_and_ask_update_message_read.ask_price_2[short_best_bid_and_ask_update_message_at] == short_best_bid_and_ask_update_message_written.ask_price_2[short_best_bid_and_ask_update_message_at]); short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_and_ask_update_message_at = 0;
  do
  :: short_best_bid_and_ask_update_message_at < 2 -> assert(short_best_bid_and_ask_update_message_read.ask_size_2[short_best_bid_and_ask_update_message_at] == short_best_bid_and_ask_update_message_written.ask_size_2[short_best_bid_and_ask_update_message_at]); short_best_bid_and_ask_update_message_at = short_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Long Best Bid And Ask Update Message: 25 bytes -------------------------- */

/* This message is the same as the Best Bid AND Ask Update Message – Short Form described above except that Prices and Sizes are 4 byte Integers, the prices having 4 implied decimal places. */
typedef LongBestBidAndAskUpdateMessage {
  byte nanoseconds[4];
  byte option_id[4];
  byte quote_condition;
  byte bid_price_4[4];
  byte bid_size_4[4];
  byte ask_price_4[4];
  byte ask_size_4[4]
};

int long_best_bid_and_ask_update_message_at;

/* every byte of Long Best Bid And Ask Update Message set to one value */
inline fill_long_best_bid_and_ask_update_message(long_best_bid_and_ask_update_message_record, long_best_bid_and_ask_update_message_value) {
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> long_best_bid_and_ask_update_message_record.nanoseconds[long_best_bid_and_ask_update_message_at] = long_best_bid_and_ask_update_message_value; long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> long_best_bid_and_ask_update_message_record.option_id[long_best_bid_and_ask_update_message_at] = long_best_bid_and_ask_update_message_value; long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_and_ask_update_message_record.quote_condition = long_best_bid_and_ask_update_message_value;
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> long_best_bid_and_ask_update_message_record.bid_price_4[long_best_bid_and_ask_update_message_at] = long_best_bid_and_ask_update_message_value; long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> long_best_bid_and_ask_update_message_record.bid_size_4[long_best_bid_and_ask_update_message_at] = long_best_bid_and_ask_update_message_value; long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> long_best_bid_and_ask_update_message_record.ask_price_4[long_best_bid_and_ask_update_message_at] = long_best_bid_and_ask_update_message_value; long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> long_best_bid_and_ask_update_message_record.ask_size_4[long_best_bid_and_ask_update_message_at] = long_best_bid_and_ask_update_message_value; long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Long Best Bid And Ask Update Message set to where it lies, so a field read out of place says so */
inline ramp_long_best_bid_and_ask_update_message(long_best_bid_and_ask_update_message_record, long_best_bid_and_ask_update_message_base) {
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> long_best_bid_and_ask_update_message_record.nanoseconds[long_best_bid_and_ask_update_message_at] = (long_best_bid_and_ask_update_message_base + 0 + long_best_bid_and_ask_update_message_at + 1) % 256; long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> long_best_bid_and_ask_update_message_record.option_id[long_best_bid_and_ask_update_message_at] = (long_best_bid_and_ask_update_message_base + 4 + long_best_bid_and_ask_update_message_at + 1) % 256; long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_and_ask_update_message_record.quote_condition = (long_best_bid_and_ask_update_message_base + 8 + 1) % 256;
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> long_best_bid_and_ask_update_message_record.bid_price_4[long_best_bid_and_ask_update_message_at] = (long_best_bid_and_ask_update_message_base + 9 + long_best_bid_and_ask_update_message_at + 1) % 256; long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> long_best_bid_and_ask_update_message_record.bid_size_4[long_best_bid_and_ask_update_message_at] = (long_best_bid_and_ask_update_message_base + 13 + long_best_bid_and_ask_update_message_at + 1) % 256; long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> long_best_bid_and_ask_update_message_record.ask_price_4[long_best_bid_and_ask_update_message_at] = (long_best_bid_and_ask_update_message_base + 17 + long_best_bid_and_ask_update_message_at + 1) % 256; long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> long_best_bid_and_ask_update_message_record.ask_size_4[long_best_bid_and_ask_update_message_at] = (long_best_bid_and_ask_update_message_base + 21 + long_best_bid_and_ask_update_message_at + 1) % 256; long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Long Best Bid And Ask Update Message to the wire, 25 bytes from where the cursor stands */
inline encode_long_best_bid_and_ask_update_message(long_best_bid_and_ask_update_message_record) {
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> wire[at] = long_best_bid_and_ask_update_message_record.nanoseconds[long_best_bid_and_ask_update_message_at]; at = at + 1; long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> wire[at] = long_best_bid_and_ask_update_message_record.option_id[long_best_bid_and_ask_update_message_at]; at = at + 1; long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  wire[at] = long_best_bid_and_ask_update_message_record.quote_condition; at = at + 1;
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> wire[at] = long_best_bid_and_ask_update_message_record.bid_price_4[long_best_bid_and_ask_update_message_at]; at = at + 1; long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> wire[at] = long_best_bid_and_ask_update_message_record.bid_size_4[long_best_bid_and_ask_update_message_at]; at = at + 1; long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> wire[at] = long_best_bid_and_ask_update_message_record.ask_price_4[long_best_bid_and_ask_update_message_at]; at = at + 1; long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> wire[at] = long_best_bid_and_ask_update_message_record.ask_size_4[long_best_bid_and_ask_update_message_at]; at = at + 1; long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Long Best Bid And Ask Update Message off the wire, 25 bytes from where the cursor stands */
inline decode_long_best_bid_and_ask_update_message(long_best_bid_and_ask_update_message_record) {
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> long_best_bid_and_ask_update_message_record.nanoseconds[long_best_bid_and_ask_update_message_at] = wire[at]; at = at + 1; long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> long_best_bid_and_ask_update_message_record.option_id[long_best_bid_and_ask_update_message_at] = wire[at]; at = at + 1; long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_and_ask_update_message_record.quote_condition = wire[at]; at = at + 1;
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> long_best_bid_and_ask_update_message_record.bid_price_4[long_best_bid_and_ask_update_message_at] = wire[at]; at = at + 1; long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> long_best_bid_and_ask_update_message_record.bid_size_4[long_best_bid_and_ask_update_message_at] = wire[at]; at = at + 1; long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> long_best_bid_and_ask_update_message_record.ask_price_4[long_best_bid_and_ask_update_message_at] = wire[at]; at = at + 1; long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> long_best_bid_and_ask_update_message_record.ask_size_4[long_best_bid_and_ask_update_message_at] = wire[at]; at = at + 1; long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Long Best Bid And Ask Update Message is what was written, byte for byte */
inline equal_long_best_bid_and_ask_update_message(long_best_bid_and_ask_update_message_read, long_best_bid_and_ask_update_message_written) {
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> assert(long_best_bid_and_ask_update_message_read.nanoseconds[long_best_bid_and_ask_update_message_at] == long_best_bid_and_ask_update_message_written.nanoseconds[long_best_bid_and_ask_update_message_at]); long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> assert(long_best_bid_and_ask_update_message_read.option_id[long_best_bid_and_ask_update_message_at] == long_best_bid_and_ask_update_message_written.option_id[long_best_bid_and_ask_update_message_at]); long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  assert(long_best_bid_and_ask_update_message_read.quote_condition == long_best_bid_and_ask_update_message_written.quote_condition);
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> assert(long_best_bid_and_ask_update_message_read.bid_price_4[long_best_bid_and_ask_update_message_at] == long_best_bid_and_ask_update_message_written.bid_price_4[long_best_bid_and_ask_update_message_at]); long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> assert(long_best_bid_and_ask_update_message_read.bid_size_4[long_best_bid_and_ask_update_message_at] == long_best_bid_and_ask_update_message_written.bid_size_4[long_best_bid_and_ask_update_message_at]); long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> assert(long_best_bid_and_ask_update_message_read.ask_price_4[long_best_bid_and_ask_update_message_at] == long_best_bid_and_ask_update_message_written.ask_price_4[long_best_bid_and_ask_update_message_at]); long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_and_ask_update_message_at = 0;
  do
  :: long_best_bid_and_ask_update_message_at < 4 -> assert(long_best_bid_and_ask_update_message_read.ask_size_4[long_best_bid_and_ask_update_message_at] == long_best_bid_and_ask_update_message_written.ask_size_4[long_best_bid_and_ask_update_message_at]); long_best_bid_and_ask_update_message_at = long_best_bid_and_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Short Best Ask Update Message: 13 bytes --------------------------------- */

/* The options system will continuously calculate its best bid and offer position for active options contracts on the options market during the trading day. Whenever the best bid or ask position changes on one side but not the other side, the options system will send its best bid or ask update via this feed for the affected security. */
typedef ShortBestAskUpdateMessage {
  byte nanoseconds[4];
  byte option_id[4];
  byte quote_condition;
  byte price_2[2];
  byte size_2[2]
};

int short_best_ask_update_message_at;

/* every byte of Short Best Ask Update Message set to one value */
inline fill_short_best_ask_update_message(short_best_ask_update_message_record, short_best_ask_update_message_value) {
  short_best_ask_update_message_at = 0;
  do
  :: short_best_ask_update_message_at < 4 -> short_best_ask_update_message_record.nanoseconds[short_best_ask_update_message_at] = short_best_ask_update_message_value; short_best_ask_update_message_at = short_best_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_ask_update_message_at = 0;
  do
  :: short_best_ask_update_message_at < 4 -> short_best_ask_update_message_record.option_id[short_best_ask_update_message_at] = short_best_ask_update_message_value; short_best_ask_update_message_at = short_best_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_ask_update_message_record.quote_condition = short_best_ask_update_message_value;
  short_best_ask_update_message_at = 0;
  do
  :: short_best_ask_update_message_at < 2 -> short_best_ask_update_message_record.price_2[short_best_ask_update_message_at] = short_best_ask_update_message_value; short_best_ask_update_message_at = short_best_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_ask_update_message_at = 0;
  do
  :: short_best_ask_update_message_at < 2 -> short_best_ask_update_message_record.size_2[short_best_ask_update_message_at] = short_best_ask_update_message_value; short_best_ask_update_message_at = short_best_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Short Best Ask Update Message set to where it lies, so a field read out of place says so */
inline ramp_short_best_ask_update_message(short_best_ask_update_message_record, short_best_ask_update_message_base) {
  short_best_ask_update_message_at = 0;
  do
  :: short_best_ask_update_message_at < 4 -> short_best_ask_update_message_record.nanoseconds[short_best_ask_update_message_at] = (short_best_ask_update_message_base + 0 + short_best_ask_update_message_at + 1) % 256; short_best_ask_update_message_at = short_best_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_ask_update_message_at = 0;
  do
  :: short_best_ask_update_message_at < 4 -> short_best_ask_update_message_record.option_id[short_best_ask_update_message_at] = (short_best_ask_update_message_base + 4 + short_best_ask_update_message_at + 1) % 256; short_best_ask_update_message_at = short_best_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_ask_update_message_record.quote_condition = (short_best_ask_update_message_base + 8 + 1) % 256;
  short_best_ask_update_message_at = 0;
  do
  :: short_best_ask_update_message_at < 2 -> short_best_ask_update_message_record.price_2[short_best_ask_update_message_at] = (short_best_ask_update_message_base + 9 + short_best_ask_update_message_at + 1) % 256; short_best_ask_update_message_at = short_best_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_ask_update_message_at = 0;
  do
  :: short_best_ask_update_message_at < 2 -> short_best_ask_update_message_record.size_2[short_best_ask_update_message_at] = (short_best_ask_update_message_base + 11 + short_best_ask_update_message_at + 1) % 256; short_best_ask_update_message_at = short_best_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Short Best Ask Update Message to the wire, 13 bytes from where the cursor stands */
inline encode_short_best_ask_update_message(short_best_ask_update_message_record) {
  short_best_ask_update_message_at = 0;
  do
  :: short_best_ask_update_message_at < 4 -> wire[at] = short_best_ask_update_message_record.nanoseconds[short_best_ask_update_message_at]; at = at + 1; short_best_ask_update_message_at = short_best_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_ask_update_message_at = 0;
  do
  :: short_best_ask_update_message_at < 4 -> wire[at] = short_best_ask_update_message_record.option_id[short_best_ask_update_message_at]; at = at + 1; short_best_ask_update_message_at = short_best_ask_update_message_at + 1
  :: else -> break
  od;
  wire[at] = short_best_ask_update_message_record.quote_condition; at = at + 1;
  short_best_ask_update_message_at = 0;
  do
  :: short_best_ask_update_message_at < 2 -> wire[at] = short_best_ask_update_message_record.price_2[short_best_ask_update_message_at]; at = at + 1; short_best_ask_update_message_at = short_best_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_ask_update_message_at = 0;
  do
  :: short_best_ask_update_message_at < 2 -> wire[at] = short_best_ask_update_message_record.size_2[short_best_ask_update_message_at]; at = at + 1; short_best_ask_update_message_at = short_best_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Short Best Ask Update Message off the wire, 13 bytes from where the cursor stands */
inline decode_short_best_ask_update_message(short_best_ask_update_message_record) {
  short_best_ask_update_message_at = 0;
  do
  :: short_best_ask_update_message_at < 4 -> short_best_ask_update_message_record.nanoseconds[short_best_ask_update_message_at] = wire[at]; at = at + 1; short_best_ask_update_message_at = short_best_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_ask_update_message_at = 0;
  do
  :: short_best_ask_update_message_at < 4 -> short_best_ask_update_message_record.option_id[short_best_ask_update_message_at] = wire[at]; at = at + 1; short_best_ask_update_message_at = short_best_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_ask_update_message_record.quote_condition = wire[at]; at = at + 1;
  short_best_ask_update_message_at = 0;
  do
  :: short_best_ask_update_message_at < 2 -> short_best_ask_update_message_record.price_2[short_best_ask_update_message_at] = wire[at]; at = at + 1; short_best_ask_update_message_at = short_best_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_ask_update_message_at = 0;
  do
  :: short_best_ask_update_message_at < 2 -> short_best_ask_update_message_record.size_2[short_best_ask_update_message_at] = wire[at]; at = at + 1; short_best_ask_update_message_at = short_best_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Short Best Ask Update Message is what was written, byte for byte */
inline equal_short_best_ask_update_message(short_best_ask_update_message_read, short_best_ask_update_message_written) {
  short_best_ask_update_message_at = 0;
  do
  :: short_best_ask_update_message_at < 4 -> assert(short_best_ask_update_message_read.nanoseconds[short_best_ask_update_message_at] == short_best_ask_update_message_written.nanoseconds[short_best_ask_update_message_at]); short_best_ask_update_message_at = short_best_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_ask_update_message_at = 0;
  do
  :: short_best_ask_update_message_at < 4 -> assert(short_best_ask_update_message_read.option_id[short_best_ask_update_message_at] == short_best_ask_update_message_written.option_id[short_best_ask_update_message_at]); short_best_ask_update_message_at = short_best_ask_update_message_at + 1
  :: else -> break
  od;
  assert(short_best_ask_update_message_read.quote_condition == short_best_ask_update_message_written.quote_condition);
  short_best_ask_update_message_at = 0;
  do
  :: short_best_ask_update_message_at < 2 -> assert(short_best_ask_update_message_read.price_2[short_best_ask_update_message_at] == short_best_ask_update_message_written.price_2[short_best_ask_update_message_at]); short_best_ask_update_message_at = short_best_ask_update_message_at + 1
  :: else -> break
  od;
  short_best_ask_update_message_at = 0;
  do
  :: short_best_ask_update_message_at < 2 -> assert(short_best_ask_update_message_read.size_2[short_best_ask_update_message_at] == short_best_ask_update_message_written.size_2[short_best_ask_update_message_at]); short_best_ask_update_message_at = short_best_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Short Best Bid Update Message: 13 bytes --------------------------------- */

/* The options system will continuously calculate its best bid and offer position for active options contracts on the options market during the trading day. Whenever the best bid or ask position changes on one side but not the other side, the options system will send its best bid or ask update via this feed for the affected security. */
typedef ShortBestBidUpdateMessage {
  byte nanoseconds[4];
  byte option_id[4];
  byte quote_condition;
  byte price_2[2];
  byte size_2[2]
};

int short_best_bid_update_message_at;

/* every byte of Short Best Bid Update Message set to one value */
inline fill_short_best_bid_update_message(short_best_bid_update_message_record, short_best_bid_update_message_value) {
  short_best_bid_update_message_at = 0;
  do
  :: short_best_bid_update_message_at < 4 -> short_best_bid_update_message_record.nanoseconds[short_best_bid_update_message_at] = short_best_bid_update_message_value; short_best_bid_update_message_at = short_best_bid_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_update_message_at = 0;
  do
  :: short_best_bid_update_message_at < 4 -> short_best_bid_update_message_record.option_id[short_best_bid_update_message_at] = short_best_bid_update_message_value; short_best_bid_update_message_at = short_best_bid_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_update_message_record.quote_condition = short_best_bid_update_message_value;
  short_best_bid_update_message_at = 0;
  do
  :: short_best_bid_update_message_at < 2 -> short_best_bid_update_message_record.price_2[short_best_bid_update_message_at] = short_best_bid_update_message_value; short_best_bid_update_message_at = short_best_bid_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_update_message_at = 0;
  do
  :: short_best_bid_update_message_at < 2 -> short_best_bid_update_message_record.size_2[short_best_bid_update_message_at] = short_best_bid_update_message_value; short_best_bid_update_message_at = short_best_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Short Best Bid Update Message set to where it lies, so a field read out of place says so */
inline ramp_short_best_bid_update_message(short_best_bid_update_message_record, short_best_bid_update_message_base) {
  short_best_bid_update_message_at = 0;
  do
  :: short_best_bid_update_message_at < 4 -> short_best_bid_update_message_record.nanoseconds[short_best_bid_update_message_at] = (short_best_bid_update_message_base + 0 + short_best_bid_update_message_at + 1) % 256; short_best_bid_update_message_at = short_best_bid_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_update_message_at = 0;
  do
  :: short_best_bid_update_message_at < 4 -> short_best_bid_update_message_record.option_id[short_best_bid_update_message_at] = (short_best_bid_update_message_base + 4 + short_best_bid_update_message_at + 1) % 256; short_best_bid_update_message_at = short_best_bid_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_update_message_record.quote_condition = (short_best_bid_update_message_base + 8 + 1) % 256;
  short_best_bid_update_message_at = 0;
  do
  :: short_best_bid_update_message_at < 2 -> short_best_bid_update_message_record.price_2[short_best_bid_update_message_at] = (short_best_bid_update_message_base + 9 + short_best_bid_update_message_at + 1) % 256; short_best_bid_update_message_at = short_best_bid_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_update_message_at = 0;
  do
  :: short_best_bid_update_message_at < 2 -> short_best_bid_update_message_record.size_2[short_best_bid_update_message_at] = (short_best_bid_update_message_base + 11 + short_best_bid_update_message_at + 1) % 256; short_best_bid_update_message_at = short_best_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Short Best Bid Update Message to the wire, 13 bytes from where the cursor stands */
inline encode_short_best_bid_update_message(short_best_bid_update_message_record) {
  short_best_bid_update_message_at = 0;
  do
  :: short_best_bid_update_message_at < 4 -> wire[at] = short_best_bid_update_message_record.nanoseconds[short_best_bid_update_message_at]; at = at + 1; short_best_bid_update_message_at = short_best_bid_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_update_message_at = 0;
  do
  :: short_best_bid_update_message_at < 4 -> wire[at] = short_best_bid_update_message_record.option_id[short_best_bid_update_message_at]; at = at + 1; short_best_bid_update_message_at = short_best_bid_update_message_at + 1
  :: else -> break
  od;
  wire[at] = short_best_bid_update_message_record.quote_condition; at = at + 1;
  short_best_bid_update_message_at = 0;
  do
  :: short_best_bid_update_message_at < 2 -> wire[at] = short_best_bid_update_message_record.price_2[short_best_bid_update_message_at]; at = at + 1; short_best_bid_update_message_at = short_best_bid_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_update_message_at = 0;
  do
  :: short_best_bid_update_message_at < 2 -> wire[at] = short_best_bid_update_message_record.size_2[short_best_bid_update_message_at]; at = at + 1; short_best_bid_update_message_at = short_best_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Short Best Bid Update Message off the wire, 13 bytes from where the cursor stands */
inline decode_short_best_bid_update_message(short_best_bid_update_message_record) {
  short_best_bid_update_message_at = 0;
  do
  :: short_best_bid_update_message_at < 4 -> short_best_bid_update_message_record.nanoseconds[short_best_bid_update_message_at] = wire[at]; at = at + 1; short_best_bid_update_message_at = short_best_bid_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_update_message_at = 0;
  do
  :: short_best_bid_update_message_at < 4 -> short_best_bid_update_message_record.option_id[short_best_bid_update_message_at] = wire[at]; at = at + 1; short_best_bid_update_message_at = short_best_bid_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_update_message_record.quote_condition = wire[at]; at = at + 1;
  short_best_bid_update_message_at = 0;
  do
  :: short_best_bid_update_message_at < 2 -> short_best_bid_update_message_record.price_2[short_best_bid_update_message_at] = wire[at]; at = at + 1; short_best_bid_update_message_at = short_best_bid_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_update_message_at = 0;
  do
  :: short_best_bid_update_message_at < 2 -> short_best_bid_update_message_record.size_2[short_best_bid_update_message_at] = wire[at]; at = at + 1; short_best_bid_update_message_at = short_best_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Short Best Bid Update Message is what was written, byte for byte */
inline equal_short_best_bid_update_message(short_best_bid_update_message_read, short_best_bid_update_message_written) {
  short_best_bid_update_message_at = 0;
  do
  :: short_best_bid_update_message_at < 4 -> assert(short_best_bid_update_message_read.nanoseconds[short_best_bid_update_message_at] == short_best_bid_update_message_written.nanoseconds[short_best_bid_update_message_at]); short_best_bid_update_message_at = short_best_bid_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_update_message_at = 0;
  do
  :: short_best_bid_update_message_at < 4 -> assert(short_best_bid_update_message_read.option_id[short_best_bid_update_message_at] == short_best_bid_update_message_written.option_id[short_best_bid_update_message_at]); short_best_bid_update_message_at = short_best_bid_update_message_at + 1
  :: else -> break
  od;
  assert(short_best_bid_update_message_read.quote_condition == short_best_bid_update_message_written.quote_condition);
  short_best_bid_update_message_at = 0;
  do
  :: short_best_bid_update_message_at < 2 -> assert(short_best_bid_update_message_read.price_2[short_best_bid_update_message_at] == short_best_bid_update_message_written.price_2[short_best_bid_update_message_at]); short_best_bid_update_message_at = short_best_bid_update_message_at + 1
  :: else -> break
  od;
  short_best_bid_update_message_at = 0;
  do
  :: short_best_bid_update_message_at < 2 -> assert(short_best_bid_update_message_read.size_2[short_best_bid_update_message_at] == short_best_bid_update_message_written.size_2[short_best_bid_update_message_at]); short_best_bid_update_message_at = short_best_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Long Best Ask Update Message: 17 bytes ---------------------------------- */

/* This message is the same as the Best Bid OR Ask Update Message – Short Form described above except that Prices and Sizes are 4 byte Integers, the price having 4 implied decimal places. */
typedef LongBestAskUpdateMessage {
  byte nanoseconds[4];
  byte option_id[4];
  byte quote_condition;
  byte price_4[4];
  byte size_4[4]
};

int long_best_ask_update_message_at;

/* every byte of Long Best Ask Update Message set to one value */
inline fill_long_best_ask_update_message(long_best_ask_update_message_record, long_best_ask_update_message_value) {
  long_best_ask_update_message_at = 0;
  do
  :: long_best_ask_update_message_at < 4 -> long_best_ask_update_message_record.nanoseconds[long_best_ask_update_message_at] = long_best_ask_update_message_value; long_best_ask_update_message_at = long_best_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_ask_update_message_at = 0;
  do
  :: long_best_ask_update_message_at < 4 -> long_best_ask_update_message_record.option_id[long_best_ask_update_message_at] = long_best_ask_update_message_value; long_best_ask_update_message_at = long_best_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_ask_update_message_record.quote_condition = long_best_ask_update_message_value;
  long_best_ask_update_message_at = 0;
  do
  :: long_best_ask_update_message_at < 4 -> long_best_ask_update_message_record.price_4[long_best_ask_update_message_at] = long_best_ask_update_message_value; long_best_ask_update_message_at = long_best_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_ask_update_message_at = 0;
  do
  :: long_best_ask_update_message_at < 4 -> long_best_ask_update_message_record.size_4[long_best_ask_update_message_at] = long_best_ask_update_message_value; long_best_ask_update_message_at = long_best_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Long Best Ask Update Message set to where it lies, so a field read out of place says so */
inline ramp_long_best_ask_update_message(long_best_ask_update_message_record, long_best_ask_update_message_base) {
  long_best_ask_update_message_at = 0;
  do
  :: long_best_ask_update_message_at < 4 -> long_best_ask_update_message_record.nanoseconds[long_best_ask_update_message_at] = (long_best_ask_update_message_base + 0 + long_best_ask_update_message_at + 1) % 256; long_best_ask_update_message_at = long_best_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_ask_update_message_at = 0;
  do
  :: long_best_ask_update_message_at < 4 -> long_best_ask_update_message_record.option_id[long_best_ask_update_message_at] = (long_best_ask_update_message_base + 4 + long_best_ask_update_message_at + 1) % 256; long_best_ask_update_message_at = long_best_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_ask_update_message_record.quote_condition = (long_best_ask_update_message_base + 8 + 1) % 256;
  long_best_ask_update_message_at = 0;
  do
  :: long_best_ask_update_message_at < 4 -> long_best_ask_update_message_record.price_4[long_best_ask_update_message_at] = (long_best_ask_update_message_base + 9 + long_best_ask_update_message_at + 1) % 256; long_best_ask_update_message_at = long_best_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_ask_update_message_at = 0;
  do
  :: long_best_ask_update_message_at < 4 -> long_best_ask_update_message_record.size_4[long_best_ask_update_message_at] = (long_best_ask_update_message_base + 13 + long_best_ask_update_message_at + 1) % 256; long_best_ask_update_message_at = long_best_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Long Best Ask Update Message to the wire, 17 bytes from where the cursor stands */
inline encode_long_best_ask_update_message(long_best_ask_update_message_record) {
  long_best_ask_update_message_at = 0;
  do
  :: long_best_ask_update_message_at < 4 -> wire[at] = long_best_ask_update_message_record.nanoseconds[long_best_ask_update_message_at]; at = at + 1; long_best_ask_update_message_at = long_best_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_ask_update_message_at = 0;
  do
  :: long_best_ask_update_message_at < 4 -> wire[at] = long_best_ask_update_message_record.option_id[long_best_ask_update_message_at]; at = at + 1; long_best_ask_update_message_at = long_best_ask_update_message_at + 1
  :: else -> break
  od;
  wire[at] = long_best_ask_update_message_record.quote_condition; at = at + 1;
  long_best_ask_update_message_at = 0;
  do
  :: long_best_ask_update_message_at < 4 -> wire[at] = long_best_ask_update_message_record.price_4[long_best_ask_update_message_at]; at = at + 1; long_best_ask_update_message_at = long_best_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_ask_update_message_at = 0;
  do
  :: long_best_ask_update_message_at < 4 -> wire[at] = long_best_ask_update_message_record.size_4[long_best_ask_update_message_at]; at = at + 1; long_best_ask_update_message_at = long_best_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Long Best Ask Update Message off the wire, 17 bytes from where the cursor stands */
inline decode_long_best_ask_update_message(long_best_ask_update_message_record) {
  long_best_ask_update_message_at = 0;
  do
  :: long_best_ask_update_message_at < 4 -> long_best_ask_update_message_record.nanoseconds[long_best_ask_update_message_at] = wire[at]; at = at + 1; long_best_ask_update_message_at = long_best_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_ask_update_message_at = 0;
  do
  :: long_best_ask_update_message_at < 4 -> long_best_ask_update_message_record.option_id[long_best_ask_update_message_at] = wire[at]; at = at + 1; long_best_ask_update_message_at = long_best_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_ask_update_message_record.quote_condition = wire[at]; at = at + 1;
  long_best_ask_update_message_at = 0;
  do
  :: long_best_ask_update_message_at < 4 -> long_best_ask_update_message_record.price_4[long_best_ask_update_message_at] = wire[at]; at = at + 1; long_best_ask_update_message_at = long_best_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_ask_update_message_at = 0;
  do
  :: long_best_ask_update_message_at < 4 -> long_best_ask_update_message_record.size_4[long_best_ask_update_message_at] = wire[at]; at = at + 1; long_best_ask_update_message_at = long_best_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Long Best Ask Update Message is what was written, byte for byte */
inline equal_long_best_ask_update_message(long_best_ask_update_message_read, long_best_ask_update_message_written) {
  long_best_ask_update_message_at = 0;
  do
  :: long_best_ask_update_message_at < 4 -> assert(long_best_ask_update_message_read.nanoseconds[long_best_ask_update_message_at] == long_best_ask_update_message_written.nanoseconds[long_best_ask_update_message_at]); long_best_ask_update_message_at = long_best_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_ask_update_message_at = 0;
  do
  :: long_best_ask_update_message_at < 4 -> assert(long_best_ask_update_message_read.option_id[long_best_ask_update_message_at] == long_best_ask_update_message_written.option_id[long_best_ask_update_message_at]); long_best_ask_update_message_at = long_best_ask_update_message_at + 1
  :: else -> break
  od;
  assert(long_best_ask_update_message_read.quote_condition == long_best_ask_update_message_written.quote_condition);
  long_best_ask_update_message_at = 0;
  do
  :: long_best_ask_update_message_at < 4 -> assert(long_best_ask_update_message_read.price_4[long_best_ask_update_message_at] == long_best_ask_update_message_written.price_4[long_best_ask_update_message_at]); long_best_ask_update_message_at = long_best_ask_update_message_at + 1
  :: else -> break
  od;
  long_best_ask_update_message_at = 0;
  do
  :: long_best_ask_update_message_at < 4 -> assert(long_best_ask_update_message_read.size_4[long_best_ask_update_message_at] == long_best_ask_update_message_written.size_4[long_best_ask_update_message_at]); long_best_ask_update_message_at = long_best_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Long Best Bid Update Message: 17 bytes ---------------------------------- */

/* This message is the same as the Best Bid OR Ask Update Message – Short Form described above except that Prices and Sizes are 4 byte Integers, the price having 4 implied decimal places. */
typedef LongBestBidUpdateMessage {
  byte nanoseconds[4];
  byte option_id[4];
  byte quote_condition;
  byte price_4[4];
  byte size_4[4]
};

int long_best_bid_update_message_at;

/* every byte of Long Best Bid Update Message set to one value */
inline fill_long_best_bid_update_message(long_best_bid_update_message_record, long_best_bid_update_message_value) {
  long_best_bid_update_message_at = 0;
  do
  :: long_best_bid_update_message_at < 4 -> long_best_bid_update_message_record.nanoseconds[long_best_bid_update_message_at] = long_best_bid_update_message_value; long_best_bid_update_message_at = long_best_bid_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_update_message_at = 0;
  do
  :: long_best_bid_update_message_at < 4 -> long_best_bid_update_message_record.option_id[long_best_bid_update_message_at] = long_best_bid_update_message_value; long_best_bid_update_message_at = long_best_bid_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_update_message_record.quote_condition = long_best_bid_update_message_value;
  long_best_bid_update_message_at = 0;
  do
  :: long_best_bid_update_message_at < 4 -> long_best_bid_update_message_record.price_4[long_best_bid_update_message_at] = long_best_bid_update_message_value; long_best_bid_update_message_at = long_best_bid_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_update_message_at = 0;
  do
  :: long_best_bid_update_message_at < 4 -> long_best_bid_update_message_record.size_4[long_best_bid_update_message_at] = long_best_bid_update_message_value; long_best_bid_update_message_at = long_best_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Long Best Bid Update Message set to where it lies, so a field read out of place says so */
inline ramp_long_best_bid_update_message(long_best_bid_update_message_record, long_best_bid_update_message_base) {
  long_best_bid_update_message_at = 0;
  do
  :: long_best_bid_update_message_at < 4 -> long_best_bid_update_message_record.nanoseconds[long_best_bid_update_message_at] = (long_best_bid_update_message_base + 0 + long_best_bid_update_message_at + 1) % 256; long_best_bid_update_message_at = long_best_bid_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_update_message_at = 0;
  do
  :: long_best_bid_update_message_at < 4 -> long_best_bid_update_message_record.option_id[long_best_bid_update_message_at] = (long_best_bid_update_message_base + 4 + long_best_bid_update_message_at + 1) % 256; long_best_bid_update_message_at = long_best_bid_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_update_message_record.quote_condition = (long_best_bid_update_message_base + 8 + 1) % 256;
  long_best_bid_update_message_at = 0;
  do
  :: long_best_bid_update_message_at < 4 -> long_best_bid_update_message_record.price_4[long_best_bid_update_message_at] = (long_best_bid_update_message_base + 9 + long_best_bid_update_message_at + 1) % 256; long_best_bid_update_message_at = long_best_bid_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_update_message_at = 0;
  do
  :: long_best_bid_update_message_at < 4 -> long_best_bid_update_message_record.size_4[long_best_bid_update_message_at] = (long_best_bid_update_message_base + 13 + long_best_bid_update_message_at + 1) % 256; long_best_bid_update_message_at = long_best_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Long Best Bid Update Message to the wire, 17 bytes from where the cursor stands */
inline encode_long_best_bid_update_message(long_best_bid_update_message_record) {
  long_best_bid_update_message_at = 0;
  do
  :: long_best_bid_update_message_at < 4 -> wire[at] = long_best_bid_update_message_record.nanoseconds[long_best_bid_update_message_at]; at = at + 1; long_best_bid_update_message_at = long_best_bid_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_update_message_at = 0;
  do
  :: long_best_bid_update_message_at < 4 -> wire[at] = long_best_bid_update_message_record.option_id[long_best_bid_update_message_at]; at = at + 1; long_best_bid_update_message_at = long_best_bid_update_message_at + 1
  :: else -> break
  od;
  wire[at] = long_best_bid_update_message_record.quote_condition; at = at + 1;
  long_best_bid_update_message_at = 0;
  do
  :: long_best_bid_update_message_at < 4 -> wire[at] = long_best_bid_update_message_record.price_4[long_best_bid_update_message_at]; at = at + 1; long_best_bid_update_message_at = long_best_bid_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_update_message_at = 0;
  do
  :: long_best_bid_update_message_at < 4 -> wire[at] = long_best_bid_update_message_record.size_4[long_best_bid_update_message_at]; at = at + 1; long_best_bid_update_message_at = long_best_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Long Best Bid Update Message off the wire, 17 bytes from where the cursor stands */
inline decode_long_best_bid_update_message(long_best_bid_update_message_record) {
  long_best_bid_update_message_at = 0;
  do
  :: long_best_bid_update_message_at < 4 -> long_best_bid_update_message_record.nanoseconds[long_best_bid_update_message_at] = wire[at]; at = at + 1; long_best_bid_update_message_at = long_best_bid_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_update_message_at = 0;
  do
  :: long_best_bid_update_message_at < 4 -> long_best_bid_update_message_record.option_id[long_best_bid_update_message_at] = wire[at]; at = at + 1; long_best_bid_update_message_at = long_best_bid_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_update_message_record.quote_condition = wire[at]; at = at + 1;
  long_best_bid_update_message_at = 0;
  do
  :: long_best_bid_update_message_at < 4 -> long_best_bid_update_message_record.price_4[long_best_bid_update_message_at] = wire[at]; at = at + 1; long_best_bid_update_message_at = long_best_bid_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_update_message_at = 0;
  do
  :: long_best_bid_update_message_at < 4 -> long_best_bid_update_message_record.size_4[long_best_bid_update_message_at] = wire[at]; at = at + 1; long_best_bid_update_message_at = long_best_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Long Best Bid Update Message is what was written, byte for byte */
inline equal_long_best_bid_update_message(long_best_bid_update_message_read, long_best_bid_update_message_written) {
  long_best_bid_update_message_at = 0;
  do
  :: long_best_bid_update_message_at < 4 -> assert(long_best_bid_update_message_read.nanoseconds[long_best_bid_update_message_at] == long_best_bid_update_message_written.nanoseconds[long_best_bid_update_message_at]); long_best_bid_update_message_at = long_best_bid_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_update_message_at = 0;
  do
  :: long_best_bid_update_message_at < 4 -> assert(long_best_bid_update_message_read.option_id[long_best_bid_update_message_at] == long_best_bid_update_message_written.option_id[long_best_bid_update_message_at]); long_best_bid_update_message_at = long_best_bid_update_message_at + 1
  :: else -> break
  od;
  assert(long_best_bid_update_message_read.quote_condition == long_best_bid_update_message_written.quote_condition);
  long_best_bid_update_message_at = 0;
  do
  :: long_best_bid_update_message_at < 4 -> assert(long_best_bid_update_message_read.price_4[long_best_bid_update_message_at] == long_best_bid_update_message_written.price_4[long_best_bid_update_message_at]); long_best_bid_update_message_at = long_best_bid_update_message_at + 1
  :: else -> break
  od;
  long_best_bid_update_message_at = 0;
  do
  :: long_best_bid_update_message_at < 4 -> assert(long_best_bid_update_message_read.size_4[long_best_bid_update_message_at] == long_best_bid_update_message_written.size_4[long_best_bid_update_message_at]); long_best_bid_update_message_at = long_best_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Report Message: 21 bytes ------------------------------------------ */

/* The Trade Report message will be used to relay execution system transactions that are reported during the current business day. The options system only reports one-side of a trade execution on the feed and other data feed products. */
typedef TradeReportMessage {
  byte nanoseconds[4];
  byte option_id[4];
  byte cross_id[4];
  byte trade_condition;
  byte price_4[4];
  byte volume[4]
};

int trade_report_message_at;

/* every byte of Trade Report Message set to one value */
inline fill_trade_report_message(trade_report_message_record, trade_report_message_value) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.nanoseconds[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.option_id[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.cross_id[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.trade_condition = trade_report_message_value;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.price_4[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.volume[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Report Message set to where it lies, so a field read out of place says so */
inline ramp_trade_report_message(trade_report_message_record, trade_report_message_base) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.nanoseconds[trade_report_message_at] = (trade_report_message_base + 0 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.option_id[trade_report_message_at] = (trade_report_message_base + 4 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.cross_id[trade_report_message_at] = (trade_report_message_base + 8 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.trade_condition = (trade_report_message_base + 12 + 1) % 256;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.price_4[trade_report_message_at] = (trade_report_message_base + 13 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.volume[trade_report_message_at] = (trade_report_message_base + 17 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Report Message to the wire, 21 bytes from where the cursor stands */
inline encode_trade_report_message(trade_report_message_record) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> wire[at] = trade_report_message_record.nanoseconds[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> wire[at] = trade_report_message_record.option_id[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> wire[at] = trade_report_message_record.cross_id[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_report_message_record.trade_condition; at = at + 1;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> wire[at] = trade_report_message_record.price_4[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> wire[at] = trade_report_message_record.volume[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Report Message off the wire, 21 bytes from where the cursor stands */
inline decode_trade_report_message(trade_report_message_record) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.nanoseconds[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.option_id[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.cross_id[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.trade_condition = wire[at]; at = at + 1;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.price_4[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.volume[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Report Message is what was written, byte for byte */
inline equal_trade_report_message(trade_report_message_read, trade_report_message_written) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> assert(trade_report_message_read.nanoseconds[trade_report_message_at] == trade_report_message_written.nanoseconds[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> assert(trade_report_message_read.option_id[trade_report_message_at] == trade_report_message_written.option_id[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> assert(trade_report_message_read.cross_id[trade_report_message_at] == trade_report_message_written.cross_id[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  assert(trade_report_message_read.trade_condition == trade_report_message_written.trade_condition);
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> assert(trade_report_message_read.price_4[trade_report_message_at] == trade_report_message_written.price_4[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> assert(trade_report_message_read.volume[trade_report_message_at] == trade_report_message_written.volume[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Broken Trade Report Message: 20 bytes ----------------------------------- */

/* The following message is used in the event that an options trade transaction is broken on the same business day that it is reported. */
typedef BrokenTradeReportMessage {
  byte nanoseconds[4];
  byte option_id[4];
  byte original_cross_id[4];
  byte original_price[4];
  byte original_volume[4]
};

int broken_trade_report_message_at;

/* every byte of Broken Trade Report Message set to one value */
inline fill_broken_trade_report_message(broken_trade_report_message_record, broken_trade_report_message_value) {
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> broken_trade_report_message_record.nanoseconds[broken_trade_report_message_at] = broken_trade_report_message_value; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> broken_trade_report_message_record.option_id[broken_trade_report_message_at] = broken_trade_report_message_value; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> broken_trade_report_message_record.original_cross_id[broken_trade_report_message_at] = broken_trade_report_message_value; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> broken_trade_report_message_record.original_price[broken_trade_report_message_at] = broken_trade_report_message_value; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> broken_trade_report_message_record.original_volume[broken_trade_report_message_at] = broken_trade_report_message_value; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Broken Trade Report Message set to where it lies, so a field read out of place says so */
inline ramp_broken_trade_report_message(broken_trade_report_message_record, broken_trade_report_message_base) {
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> broken_trade_report_message_record.nanoseconds[broken_trade_report_message_at] = (broken_trade_report_message_base + 0 + broken_trade_report_message_at + 1) % 256; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> broken_trade_report_message_record.option_id[broken_trade_report_message_at] = (broken_trade_report_message_base + 4 + broken_trade_report_message_at + 1) % 256; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> broken_trade_report_message_record.original_cross_id[broken_trade_report_message_at] = (broken_trade_report_message_base + 8 + broken_trade_report_message_at + 1) % 256; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> broken_trade_report_message_record.original_price[broken_trade_report_message_at] = (broken_trade_report_message_base + 12 + broken_trade_report_message_at + 1) % 256; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> broken_trade_report_message_record.original_volume[broken_trade_report_message_at] = (broken_trade_report_message_base + 16 + broken_trade_report_message_at + 1) % 256; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Broken Trade Report Message to the wire, 20 bytes from where the cursor stands */
inline encode_broken_trade_report_message(broken_trade_report_message_record) {
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> wire[at] = broken_trade_report_message_record.nanoseconds[broken_trade_report_message_at]; at = at + 1; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> wire[at] = broken_trade_report_message_record.option_id[broken_trade_report_message_at]; at = at + 1; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> wire[at] = broken_trade_report_message_record.original_cross_id[broken_trade_report_message_at]; at = at + 1; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> wire[at] = broken_trade_report_message_record.original_price[broken_trade_report_message_at]; at = at + 1; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> wire[at] = broken_trade_report_message_record.original_volume[broken_trade_report_message_at]; at = at + 1; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Broken Trade Report Message off the wire, 20 bytes from where the cursor stands */
inline decode_broken_trade_report_message(broken_trade_report_message_record) {
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> broken_trade_report_message_record.nanoseconds[broken_trade_report_message_at] = wire[at]; at = at + 1; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> broken_trade_report_message_record.option_id[broken_trade_report_message_at] = wire[at]; at = at + 1; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> broken_trade_report_message_record.original_cross_id[broken_trade_report_message_at] = wire[at]; at = at + 1; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> broken_trade_report_message_record.original_price[broken_trade_report_message_at] = wire[at]; at = at + 1; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> broken_trade_report_message_record.original_volume[broken_trade_report_message_at] = wire[at]; at = at + 1; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Broken Trade Report Message is what was written, byte for byte */
inline equal_broken_trade_report_message(broken_trade_report_message_read, broken_trade_report_message_written) {
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> assert(broken_trade_report_message_read.nanoseconds[broken_trade_report_message_at] == broken_trade_report_message_written.nanoseconds[broken_trade_report_message_at]); broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> assert(broken_trade_report_message_read.option_id[broken_trade_report_message_at] == broken_trade_report_message_written.option_id[broken_trade_report_message_at]); broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> assert(broken_trade_report_message_read.original_cross_id[broken_trade_report_message_at] == broken_trade_report_message_written.original_cross_id[broken_trade_report_message_at]); broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> assert(broken_trade_report_message_read.original_price[broken_trade_report_message_at] == broken_trade_report_message_written.original_price[broken_trade_report_message_at]); broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> assert(broken_trade_report_message_read.original_volume[broken_trade_report_message_at] == broken_trade_report_message_written.original_volume[broken_trade_report_message_at]); broken_trade_report_message_at = broken_trade_report_message_at + 1
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

/* Timestamp Message: encoded, read back, and compared */
proctype check_timestamp_message() {
  TimestampMessage timestamp_message_sent;
  TimestampMessage timestamp_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_timestamp_message(timestamp_message_sent, 0)
  :: pattern == 1 -> fill_timestamp_message(timestamp_message_sent, 32)
  :: pattern == 2 -> fill_timestamp_message(timestamp_message_sent, 255)
  :: else -> ramp_timestamp_message(timestamp_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_timestamp_message(timestamp_message_sent);
    assert(at == 4);
    at = 0;
    decode_timestamp_message(timestamp_message_got);
    assert(at == 4);
    equal_timestamp_message(timestamp_message_got, timestamp_message_sent)
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
    assert(at == 7);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 7);
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
    assert(at == 39);
    at = 0;
    decode_options_directory_message(options_directory_message_got);
    assert(at == 39);
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
    assert(at == 9);
    at = 0;
    decode_trading_action_message(trading_action_message_got);
    assert(at == 9);
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
    assert(at == 9);
    at = 0;
    decode_security_open_closed_message(security_open_closed_message_got);
    assert(at == 9);
    equal_security_open_closed_message(security_open_closed_message_got, security_open_closed_message_sent)
  }
}

/* Short Best Bid And Ask Update Message: encoded, read back, and compared */
proctype check_short_best_bid_and_ask_update_message() {
  ShortBestBidAndAskUpdateMessage short_best_bid_and_ask_update_message_sent;
  ShortBestBidAndAskUpdateMessage short_best_bid_and_ask_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_short_best_bid_and_ask_update_message(short_best_bid_and_ask_update_message_sent, 0)
  :: pattern == 1 -> fill_short_best_bid_and_ask_update_message(short_best_bid_and_ask_update_message_sent, 32)
  :: pattern == 2 -> fill_short_best_bid_and_ask_update_message(short_best_bid_and_ask_update_message_sent, 255)
  :: else -> ramp_short_best_bid_and_ask_update_message(short_best_bid_and_ask_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_short_best_bid_and_ask_update_message(short_best_bid_and_ask_update_message_sent);
    assert(at == 17);
    at = 0;
    decode_short_best_bid_and_ask_update_message(short_best_bid_and_ask_update_message_got);
    assert(at == 17);
    equal_short_best_bid_and_ask_update_message(short_best_bid_and_ask_update_message_got, short_best_bid_and_ask_update_message_sent)
  }
}

/* Long Best Bid And Ask Update Message: encoded, read back, and compared */
proctype check_long_best_bid_and_ask_update_message() {
  LongBestBidAndAskUpdateMessage long_best_bid_and_ask_update_message_sent;
  LongBestBidAndAskUpdateMessage long_best_bid_and_ask_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_long_best_bid_and_ask_update_message(long_best_bid_and_ask_update_message_sent, 0)
  :: pattern == 1 -> fill_long_best_bid_and_ask_update_message(long_best_bid_and_ask_update_message_sent, 32)
  :: pattern == 2 -> fill_long_best_bid_and_ask_update_message(long_best_bid_and_ask_update_message_sent, 255)
  :: else -> ramp_long_best_bid_and_ask_update_message(long_best_bid_and_ask_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_long_best_bid_and_ask_update_message(long_best_bid_and_ask_update_message_sent);
    assert(at == 25);
    at = 0;
    decode_long_best_bid_and_ask_update_message(long_best_bid_and_ask_update_message_got);
    assert(at == 25);
    equal_long_best_bid_and_ask_update_message(long_best_bid_and_ask_update_message_got, long_best_bid_and_ask_update_message_sent)
  }
}

/* Short Best Ask Update Message: encoded, read back, and compared */
proctype check_short_best_ask_update_message() {
  ShortBestAskUpdateMessage short_best_ask_update_message_sent;
  ShortBestAskUpdateMessage short_best_ask_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_short_best_ask_update_message(short_best_ask_update_message_sent, 0)
  :: pattern == 1 -> fill_short_best_ask_update_message(short_best_ask_update_message_sent, 32)
  :: pattern == 2 -> fill_short_best_ask_update_message(short_best_ask_update_message_sent, 255)
  :: else -> ramp_short_best_ask_update_message(short_best_ask_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_short_best_ask_update_message(short_best_ask_update_message_sent);
    assert(at == 13);
    at = 0;
    decode_short_best_ask_update_message(short_best_ask_update_message_got);
    assert(at == 13);
    equal_short_best_ask_update_message(short_best_ask_update_message_got, short_best_ask_update_message_sent)
  }
}

/* Short Best Bid Update Message: encoded, read back, and compared */
proctype check_short_best_bid_update_message() {
  ShortBestBidUpdateMessage short_best_bid_update_message_sent;
  ShortBestBidUpdateMessage short_best_bid_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_short_best_bid_update_message(short_best_bid_update_message_sent, 0)
  :: pattern == 1 -> fill_short_best_bid_update_message(short_best_bid_update_message_sent, 32)
  :: pattern == 2 -> fill_short_best_bid_update_message(short_best_bid_update_message_sent, 255)
  :: else -> ramp_short_best_bid_update_message(short_best_bid_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_short_best_bid_update_message(short_best_bid_update_message_sent);
    assert(at == 13);
    at = 0;
    decode_short_best_bid_update_message(short_best_bid_update_message_got);
    assert(at == 13);
    equal_short_best_bid_update_message(short_best_bid_update_message_got, short_best_bid_update_message_sent)
  }
}

/* Long Best Ask Update Message: encoded, read back, and compared */
proctype check_long_best_ask_update_message() {
  LongBestAskUpdateMessage long_best_ask_update_message_sent;
  LongBestAskUpdateMessage long_best_ask_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_long_best_ask_update_message(long_best_ask_update_message_sent, 0)
  :: pattern == 1 -> fill_long_best_ask_update_message(long_best_ask_update_message_sent, 32)
  :: pattern == 2 -> fill_long_best_ask_update_message(long_best_ask_update_message_sent, 255)
  :: else -> ramp_long_best_ask_update_message(long_best_ask_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_long_best_ask_update_message(long_best_ask_update_message_sent);
    assert(at == 17);
    at = 0;
    decode_long_best_ask_update_message(long_best_ask_update_message_got);
    assert(at == 17);
    equal_long_best_ask_update_message(long_best_ask_update_message_got, long_best_ask_update_message_sent)
  }
}

/* Long Best Bid Update Message: encoded, read back, and compared */
proctype check_long_best_bid_update_message() {
  LongBestBidUpdateMessage long_best_bid_update_message_sent;
  LongBestBidUpdateMessage long_best_bid_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_long_best_bid_update_message(long_best_bid_update_message_sent, 0)
  :: pattern == 1 -> fill_long_best_bid_update_message(long_best_bid_update_message_sent, 32)
  :: pattern == 2 -> fill_long_best_bid_update_message(long_best_bid_update_message_sent, 255)
  :: else -> ramp_long_best_bid_update_message(long_best_bid_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_long_best_bid_update_message(long_best_bid_update_message_sent);
    assert(at == 17);
    at = 0;
    decode_long_best_bid_update_message(long_best_bid_update_message_got);
    assert(at == 17);
    equal_long_best_bid_update_message(long_best_bid_update_message_got, long_best_bid_update_message_sent)
  }
}

/* Trade Report Message: encoded, read back, and compared */
proctype check_trade_report_message() {
  TradeReportMessage trade_report_message_sent;
  TradeReportMessage trade_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_report_message(trade_report_message_sent, 0)
  :: pattern == 1 -> fill_trade_report_message(trade_report_message_sent, 32)
  :: pattern == 2 -> fill_trade_report_message(trade_report_message_sent, 255)
  :: else -> ramp_trade_report_message(trade_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_report_message(trade_report_message_sent);
    assert(at == 21);
    at = 0;
    decode_trade_report_message(trade_report_message_got);
    assert(at == 21);
    equal_trade_report_message(trade_report_message_got, trade_report_message_sent)
  }
}

/* Broken Trade Report Message: encoded, read back, and compared */
proctype check_broken_trade_report_message() {
  BrokenTradeReportMessage broken_trade_report_message_sent;
  BrokenTradeReportMessage broken_trade_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_broken_trade_report_message(broken_trade_report_message_sent, 0)
  :: pattern == 1 -> fill_broken_trade_report_message(broken_trade_report_message_sent, 32)
  :: pattern == 2 -> fill_broken_trade_report_message(broken_trade_report_message_sent, 255)
  :: else -> ramp_broken_trade_report_message(broken_trade_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_broken_trade_report_message(broken_trade_report_message_sent);
    assert(at == 20);
    at = 0;
    decode_broken_trade_report_message(broken_trade_report_message_got);
    assert(at == 20);
    equal_broken_trade_report_message(broken_trade_report_message_got, broken_trade_report_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_timestamp_message()
  :: run check_system_event_message()
  :: run check_options_directory_message()
  :: run check_trading_action_message()
  :: run check_security_open_closed_message()
  :: run check_short_best_bid_and_ask_update_message()
  :: run check_long_best_bid_and_ask_update_message()
  :: run check_short_best_ask_update_message()
  :: run check_short_best_bid_update_message()
  :: run check_long_best_ask_update_message()
  :: run check_long_best_bid_update_message()
  :: run check_trade_report_message()
  :: run check_broken_trade_report_message()
  fi
}
