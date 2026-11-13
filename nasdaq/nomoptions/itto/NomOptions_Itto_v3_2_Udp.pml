/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Itch to Trade Options
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

/* ---- Seconds Message: 4 bytes ------------------------------------------------ */

/* Sent every second for which at least one ITTO message is being generated. For bandwidth efficiency the timestamp is separated into this standalone Seconds message and a Nanoseconds portion carried by every other message. */
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

/* ---- System Event Message: 5 bytes ------------------------------------------- */

/* The system event message type is used to signal a market or data feed handler event. */
typedef SystemEventMessage {
  byte nanoseconds[4];
  byte event_code
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
  skip
}

/* System Event Message to the wire, 5 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> wire[at] = system_event_message_record.nanoseconds[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  skip
}

/* System Event Message off the wire, 5 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.nanoseconds[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = wire[at]; at = at + 1;
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
  skip
}

/* ---- Base Reference Message: 12 bytes ---------------------------------------- */

/* Indicates the base reference number to which all the order, quote and trade reference number deltas must be added to obtain the absolute order or quote Nasdaq reference number. Sent prior to any order, quote and trade messages. */
typedef BaseReferenceMessage {
  byte nanoseconds[4];
  byte base_reference_number[8]
};

int base_reference_message_at;

/* every byte of Base Reference Message set to one value */
inline fill_base_reference_message(base_reference_message_record, base_reference_message_value) {
  base_reference_message_at = 0;
  do
  :: base_reference_message_at < 4 -> base_reference_message_record.nanoseconds[base_reference_message_at] = base_reference_message_value; base_reference_message_at = base_reference_message_at + 1
  :: else -> break
  od;
  base_reference_message_at = 0;
  do
  :: base_reference_message_at < 8 -> base_reference_message_record.base_reference_number[base_reference_message_at] = base_reference_message_value; base_reference_message_at = base_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Base Reference Message set to where it lies, so a field read out of place says so */
inline ramp_base_reference_message(base_reference_message_record, base_reference_message_base) {
  base_reference_message_at = 0;
  do
  :: base_reference_message_at < 4 -> base_reference_message_record.nanoseconds[base_reference_message_at] = (base_reference_message_base + 0 + base_reference_message_at + 1) % 256; base_reference_message_at = base_reference_message_at + 1
  :: else -> break
  od;
  base_reference_message_at = 0;
  do
  :: base_reference_message_at < 8 -> base_reference_message_record.base_reference_number[base_reference_message_at] = (base_reference_message_base + 4 + base_reference_message_at + 1) % 256; base_reference_message_at = base_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* Base Reference Message to the wire, 12 bytes from where the cursor stands */
inline encode_base_reference_message(base_reference_message_record) {
  base_reference_message_at = 0;
  do
  :: base_reference_message_at < 4 -> wire[at] = base_reference_message_record.nanoseconds[base_reference_message_at]; at = at + 1; base_reference_message_at = base_reference_message_at + 1
  :: else -> break
  od;
  base_reference_message_at = 0;
  do
  :: base_reference_message_at < 8 -> wire[at] = base_reference_message_record.base_reference_number[base_reference_message_at]; at = at + 1; base_reference_message_at = base_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* Base Reference Message off the wire, 12 bytes from where the cursor stands */
inline decode_base_reference_message(base_reference_message_record) {
  base_reference_message_at = 0;
  do
  :: base_reference_message_at < 4 -> base_reference_message_record.nanoseconds[base_reference_message_at] = wire[at]; at = at + 1; base_reference_message_at = base_reference_message_at + 1
  :: else -> break
  od;
  base_reference_message_at = 0;
  do
  :: base_reference_message_at < 8 -> base_reference_message_record.base_reference_number[base_reference_message_at] = wire[at]; at = at + 1; base_reference_message_at = base_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Base Reference Message is what was written, byte for byte */
inline equal_base_reference_message(base_reference_message_read, base_reference_message_written) {
  base_reference_message_at = 0;
  do
  :: base_reference_message_at < 4 -> assert(base_reference_message_read.nanoseconds[base_reference_message_at] == base_reference_message_written.nanoseconds[base_reference_message_at]); base_reference_message_at = base_reference_message_at + 1
  :: else -> break
  od;
  base_reference_message_at = 0;
  do
  :: base_reference_message_at < 8 -> assert(base_reference_message_read.base_reference_number[base_reference_message_at] == base_reference_message_written.base_reference_number[base_reference_message_at]); base_reference_message_at = base_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Options Directory Message: 39 bytes ------------------------------------- */

/* At the start of each trading day, Nasdaq disseminates options symbol directory messages for all active options symbols in the Nasdaq option system. Intra-day updates are sent as they occur; for a given Option Id the canonical information is invariant. */
typedef OptionsDirectoryMessage {
  byte nanoseconds[4];
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
  options_directory_message_record.expiration_date = (options_directory_message_base + 16 + 1) % 256;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 4 -> options_directory_message_record.explicit_strike_price[options_directory_message_at] = (options_directory_message_base + 17 + options_directory_message_at + 1) % 256; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_record.option_type = (options_directory_message_base + 21 + 1) % 256;
  options_directory_message_record.source = (options_directory_message_base + 22 + 1) % 256;
  options_directory_message_at = 0;
  do
  :: options_directory_message_at < 13 -> options_directory_message_record.underlying_symbol[options_directory_message_at] = (options_directory_message_base + 23 + options_directory_message_at + 1) % 256; options_directory_message_at = options_directory_message_at + 1
  :: else -> break
  od;
  options_directory_message_record.options_closing_type = (options_directory_message_base + 36 + 1) % 256;
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

/* ---- Options Trading Action Message: 9 bytes --------------------------------- */

/* Nasdaq uses this administrative message to indicate the current trading status of an index or equity option within the Nasdaq Options Market. Prior to the start of system hours Nasdaq sends a Trading Action spin carrying T (Trading Resumption) for every contract eligible for trading; an option absent from the spin should be treated as halted. */
typedef OptionsTradingActionMessage {
  byte nanoseconds[4];
  byte option_id[4];
  byte current_trading_state
};

int options_trading_action_message_at;

/* every byte of Options Trading Action Message set to one value */
inline fill_options_trading_action_message(options_trading_action_message_record, options_trading_action_message_value) {
  options_trading_action_message_at = 0;
  do
  :: options_trading_action_message_at < 4 -> options_trading_action_message_record.nanoseconds[options_trading_action_message_at] = options_trading_action_message_value; options_trading_action_message_at = options_trading_action_message_at + 1
  :: else -> break
  od;
  options_trading_action_message_at = 0;
  do
  :: options_trading_action_message_at < 4 -> options_trading_action_message_record.option_id[options_trading_action_message_at] = options_trading_action_message_value; options_trading_action_message_at = options_trading_action_message_at + 1
  :: else -> break
  od;
  options_trading_action_message_record.current_trading_state = options_trading_action_message_value;
  skip
}

/* each byte of Options Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_options_trading_action_message(options_trading_action_message_record, options_trading_action_message_base) {
  options_trading_action_message_at = 0;
  do
  :: options_trading_action_message_at < 4 -> options_trading_action_message_record.nanoseconds[options_trading_action_message_at] = (options_trading_action_message_base + 0 + options_trading_action_message_at + 1) % 256; options_trading_action_message_at = options_trading_action_message_at + 1
  :: else -> break
  od;
  options_trading_action_message_at = 0;
  do
  :: options_trading_action_message_at < 4 -> options_trading_action_message_record.option_id[options_trading_action_message_at] = (options_trading_action_message_base + 4 + options_trading_action_message_at + 1) % 256; options_trading_action_message_at = options_trading_action_message_at + 1
  :: else -> break
  od;
  options_trading_action_message_record.current_trading_state = (options_trading_action_message_base + 8 + 1) % 256;
  skip
}

/* Options Trading Action Message to the wire, 9 bytes from where the cursor stands */
inline encode_options_trading_action_message(options_trading_action_message_record) {
  options_trading_action_message_at = 0;
  do
  :: options_trading_action_message_at < 4 -> wire[at] = options_trading_action_message_record.nanoseconds[options_trading_action_message_at]; at = at + 1; options_trading_action_message_at = options_trading_action_message_at + 1
  :: else -> break
  od;
  options_trading_action_message_at = 0;
  do
  :: options_trading_action_message_at < 4 -> wire[at] = options_trading_action_message_record.option_id[options_trading_action_message_at]; at = at + 1; options_trading_action_message_at = options_trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = options_trading_action_message_record.current_trading_state; at = at + 1;
  skip
}

/* Options Trading Action Message off the wire, 9 bytes from where the cursor stands */
inline decode_options_trading_action_message(options_trading_action_message_record) {
  options_trading_action_message_at = 0;
  do
  :: options_trading_action_message_at < 4 -> options_trading_action_message_record.nanoseconds[options_trading_action_message_at] = wire[at]; at = at + 1; options_trading_action_message_at = options_trading_action_message_at + 1
  :: else -> break
  od;
  options_trading_action_message_at = 0;
  do
  :: options_trading_action_message_at < 4 -> options_trading_action_message_record.option_id[options_trading_action_message_at] = wire[at]; at = at + 1; options_trading_action_message_at = options_trading_action_message_at + 1
  :: else -> break
  od;
  options_trading_action_message_record.current_trading_state = wire[at]; at = at + 1;
  skip
}

/* what was read of Options Trading Action Message is what was written, byte for byte */
inline equal_options_trading_action_message(options_trading_action_message_read, options_trading_action_message_written) {
  options_trading_action_message_at = 0;
  do
  :: options_trading_action_message_at < 4 -> assert(options_trading_action_message_read.nanoseconds[options_trading_action_message_at] == options_trading_action_message_written.nanoseconds[options_trading_action_message_at]); options_trading_action_message_at = options_trading_action_message_at + 1
  :: else -> break
  od;
  options_trading_action_message_at = 0;
  do
  :: options_trading_action_message_at < 4 -> assert(options_trading_action_message_read.option_id[options_trading_action_message_at] == options_trading_action_message_written.option_id[options_trading_action_message_at]); options_trading_action_message_at = options_trading_action_message_at + 1
  :: else -> break
  od;
  assert(options_trading_action_message_read.current_trading_state == options_trading_action_message_written.current_trading_state);
  skip
}

/* ---- Option Open Message: 9 bytes -------------------------------------------- */

/* Disseminated for each option as soon as the opening is completed. On the open state the option is available for auto execution within the Nasdaq Options Market System; on the closed state it is no longer eligible. Recipients should continue to process the Trading Action spin, which this message does not override. */
typedef OptionOpenMessage {
  byte nanoseconds[4];
  byte option_id[4];
  byte open_state
};

int option_open_message_at;

/* every byte of Option Open Message set to one value */
inline fill_option_open_message(option_open_message_record, option_open_message_value) {
  option_open_message_at = 0;
  do
  :: option_open_message_at < 4 -> option_open_message_record.nanoseconds[option_open_message_at] = option_open_message_value; option_open_message_at = option_open_message_at + 1
  :: else -> break
  od;
  option_open_message_at = 0;
  do
  :: option_open_message_at < 4 -> option_open_message_record.option_id[option_open_message_at] = option_open_message_value; option_open_message_at = option_open_message_at + 1
  :: else -> break
  od;
  option_open_message_record.open_state = option_open_message_value;
  skip
}

/* each byte of Option Open Message set to where it lies, so a field read out of place says so */
inline ramp_option_open_message(option_open_message_record, option_open_message_base) {
  option_open_message_at = 0;
  do
  :: option_open_message_at < 4 -> option_open_message_record.nanoseconds[option_open_message_at] = (option_open_message_base + 0 + option_open_message_at + 1) % 256; option_open_message_at = option_open_message_at + 1
  :: else -> break
  od;
  option_open_message_at = 0;
  do
  :: option_open_message_at < 4 -> option_open_message_record.option_id[option_open_message_at] = (option_open_message_base + 4 + option_open_message_at + 1) % 256; option_open_message_at = option_open_message_at + 1
  :: else -> break
  od;
  option_open_message_record.open_state = (option_open_message_base + 8 + 1) % 256;
  skip
}

/* Option Open Message to the wire, 9 bytes from where the cursor stands */
inline encode_option_open_message(option_open_message_record) {
  option_open_message_at = 0;
  do
  :: option_open_message_at < 4 -> wire[at] = option_open_message_record.nanoseconds[option_open_message_at]; at = at + 1; option_open_message_at = option_open_message_at + 1
  :: else -> break
  od;
  option_open_message_at = 0;
  do
  :: option_open_message_at < 4 -> wire[at] = option_open_message_record.option_id[option_open_message_at]; at = at + 1; option_open_message_at = option_open_message_at + 1
  :: else -> break
  od;
  wire[at] = option_open_message_record.open_state; at = at + 1;
  skip
}

/* Option Open Message off the wire, 9 bytes from where the cursor stands */
inline decode_option_open_message(option_open_message_record) {
  option_open_message_at = 0;
  do
  :: option_open_message_at < 4 -> option_open_message_record.nanoseconds[option_open_message_at] = wire[at]; at = at + 1; option_open_message_at = option_open_message_at + 1
  :: else -> break
  od;
  option_open_message_at = 0;
  do
  :: option_open_message_at < 4 -> option_open_message_record.option_id[option_open_message_at] = wire[at]; at = at + 1; option_open_message_at = option_open_message_at + 1
  :: else -> break
  od;
  option_open_message_record.open_state = wire[at]; at = at + 1;
  skip
}

/* what was read of Option Open Message is what was written, byte for byte */
inline equal_option_open_message(option_open_message_read, option_open_message_written) {
  option_open_message_at = 0;
  do
  :: option_open_message_at < 4 -> assert(option_open_message_read.nanoseconds[option_open_message_at] == option_open_message_written.nanoseconds[option_open_message_at]); option_open_message_at = option_open_message_at + 1
  :: else -> break
  od;
  option_open_message_at = 0;
  do
  :: option_open_message_at < 4 -> assert(option_open_message_read.option_id[option_open_message_at] == option_open_message_written.option_id[option_open_message_at]); option_open_message_at = option_open_message_at + 1
  :: else -> break
  od;
  assert(option_open_message_read.open_state == option_open_message_written.open_state);
  skip
}

/* ---- Add Order Message Short Form: 17 bytes ---------------------------------- */

/* Indicates that a new order has been accepted by the Nasdaq Option system and was added to the displayable book, carrying a day unique Order Reference Number. The short form of the message, published for bandwidth efficiency. */
typedef AddOrderMessageShortForm {
  byte nanoseconds[4];
  byte order_reference_number_delta[4];
  byte market_side;
  byte option_id[4];
  byte price[2];
  byte volume[2]
};

int add_order_message_short_form_at;

/* every byte of Add Order Message Short Form set to one value */
inline fill_add_order_message_short_form(add_order_message_short_form_record, add_order_message_short_form_value) {
  add_order_message_short_form_at = 0;
  do
  :: add_order_message_short_form_at < 4 -> add_order_message_short_form_record.nanoseconds[add_order_message_short_form_at] = add_order_message_short_form_value; add_order_message_short_form_at = add_order_message_short_form_at + 1
  :: else -> break
  od;
  add_order_message_short_form_at = 0;
  do
  :: add_order_message_short_form_at < 4 -> add_order_message_short_form_record.order_reference_number_delta[add_order_message_short_form_at] = add_order_message_short_form_value; add_order_message_short_form_at = add_order_message_short_form_at + 1
  :: else -> break
  od;
  add_order_message_short_form_record.market_side = add_order_message_short_form_value;
  add_order_message_short_form_at = 0;
  do
  :: add_order_message_short_form_at < 4 -> add_order_message_short_form_record.option_id[add_order_message_short_form_at] = add_order_message_short_form_value; add_order_message_short_form_at = add_order_message_short_form_at + 1
  :: else -> break
  od;
  add_order_message_short_form_at = 0;
  do
  :: add_order_message_short_form_at < 2 -> add_order_message_short_form_record.price[add_order_message_short_form_at] = add_order_message_short_form_value; add_order_message_short_form_at = add_order_message_short_form_at + 1
  :: else -> break
  od;
  add_order_message_short_form_at = 0;
  do
  :: add_order_message_short_form_at < 2 -> add_order_message_short_form_record.volume[add_order_message_short_form_at] = add_order_message_short_form_value; add_order_message_short_form_at = add_order_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Message Short Form set to where it lies, so a field read out of place says so */
inline ramp_add_order_message_short_form(add_order_message_short_form_record, add_order_message_short_form_base) {
  add_order_message_short_form_at = 0;
  do
  :: add_order_message_short_form_at < 4 -> add_order_message_short_form_record.nanoseconds[add_order_message_short_form_at] = (add_order_message_short_form_base + 0 + add_order_message_short_form_at + 1) % 256; add_order_message_short_form_at = add_order_message_short_form_at + 1
  :: else -> break
  od;
  add_order_message_short_form_at = 0;
  do
  :: add_order_message_short_form_at < 4 -> add_order_message_short_form_record.order_reference_number_delta[add_order_message_short_form_at] = (add_order_message_short_form_base + 4 + add_order_message_short_form_at + 1) % 256; add_order_message_short_form_at = add_order_message_short_form_at + 1
  :: else -> break
  od;
  add_order_message_short_form_record.market_side = (add_order_message_short_form_base + 8 + 1) % 256;
  add_order_message_short_form_at = 0;
  do
  :: add_order_message_short_form_at < 4 -> add_order_message_short_form_record.option_id[add_order_message_short_form_at] = (add_order_message_short_form_base + 9 + add_order_message_short_form_at + 1) % 256; add_order_message_short_form_at = add_order_message_short_form_at + 1
  :: else -> break
  od;
  add_order_message_short_form_at = 0;
  do
  :: add_order_message_short_form_at < 2 -> add_order_message_short_form_record.price[add_order_message_short_form_at] = (add_order_message_short_form_base + 13 + add_order_message_short_form_at + 1) % 256; add_order_message_short_form_at = add_order_message_short_form_at + 1
  :: else -> break
  od;
  add_order_message_short_form_at = 0;
  do
  :: add_order_message_short_form_at < 2 -> add_order_message_short_form_record.volume[add_order_message_short_form_at] = (add_order_message_short_form_base + 15 + add_order_message_short_form_at + 1) % 256; add_order_message_short_form_at = add_order_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message Short Form to the wire, 17 bytes from where the cursor stands */
inline encode_add_order_message_short_form(add_order_message_short_form_record) {
  add_order_message_short_form_at = 0;
  do
  :: add_order_message_short_form_at < 4 -> wire[at] = add_order_message_short_form_record.nanoseconds[add_order_message_short_form_at]; at = at + 1; add_order_message_short_form_at = add_order_message_short_form_at + 1
  :: else -> break
  od;
  add_order_message_short_form_at = 0;
  do
  :: add_order_message_short_form_at < 4 -> wire[at] = add_order_message_short_form_record.order_reference_number_delta[add_order_message_short_form_at]; at = at + 1; add_order_message_short_form_at = add_order_message_short_form_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_short_form_record.market_side; at = at + 1;
  add_order_message_short_form_at = 0;
  do
  :: add_order_message_short_form_at < 4 -> wire[at] = add_order_message_short_form_record.option_id[add_order_message_short_form_at]; at = at + 1; add_order_message_short_form_at = add_order_message_short_form_at + 1
  :: else -> break
  od;
  add_order_message_short_form_at = 0;
  do
  :: add_order_message_short_form_at < 2 -> wire[at] = add_order_message_short_form_record.price[add_order_message_short_form_at]; at = at + 1; add_order_message_short_form_at = add_order_message_short_form_at + 1
  :: else -> break
  od;
  add_order_message_short_form_at = 0;
  do
  :: add_order_message_short_form_at < 2 -> wire[at] = add_order_message_short_form_record.volume[add_order_message_short_form_at]; at = at + 1; add_order_message_short_form_at = add_order_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message Short Form off the wire, 17 bytes from where the cursor stands */
inline decode_add_order_message_short_form(add_order_message_short_form_record) {
  add_order_message_short_form_at = 0;
  do
  :: add_order_message_short_form_at < 4 -> add_order_message_short_form_record.nanoseconds[add_order_message_short_form_at] = wire[at]; at = at + 1; add_order_message_short_form_at = add_order_message_short_form_at + 1
  :: else -> break
  od;
  add_order_message_short_form_at = 0;
  do
  :: add_order_message_short_form_at < 4 -> add_order_message_short_form_record.order_reference_number_delta[add_order_message_short_form_at] = wire[at]; at = at + 1; add_order_message_short_form_at = add_order_message_short_form_at + 1
  :: else -> break
  od;
  add_order_message_short_form_record.market_side = wire[at]; at = at + 1;
  add_order_message_short_form_at = 0;
  do
  :: add_order_message_short_form_at < 4 -> add_order_message_short_form_record.option_id[add_order_message_short_form_at] = wire[at]; at = at + 1; add_order_message_short_form_at = add_order_message_short_form_at + 1
  :: else -> break
  od;
  add_order_message_short_form_at = 0;
  do
  :: add_order_message_short_form_at < 2 -> add_order_message_short_form_record.price[add_order_message_short_form_at] = wire[at]; at = at + 1; add_order_message_short_form_at = add_order_message_short_form_at + 1
  :: else -> break
  od;
  add_order_message_short_form_at = 0;
  do
  :: add_order_message_short_form_at < 2 -> add_order_message_short_form_record.volume[add_order_message_short_form_at] = wire[at]; at = at + 1; add_order_message_short_form_at = add_order_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Message Short Form is what was written, byte for byte */
inline equal_add_order_message_short_form(add_order_message_short_form_read, add_order_message_short_form_written) {
  add_order_message_short_form_at = 0;
  do
  :: add_order_message_short_form_at < 4 -> assert(add_order_message_short_form_read.nanoseconds[add_order_message_short_form_at] == add_order_message_short_form_written.nanoseconds[add_order_message_short_form_at]); add_order_message_short_form_at = add_order_message_short_form_at + 1
  :: else -> break
  od;
  add_order_message_short_form_at = 0;
  do
  :: add_order_message_short_form_at < 4 -> assert(add_order_message_short_form_read.order_reference_number_delta[add_order_message_short_form_at] == add_order_message_short_form_written.order_reference_number_delta[add_order_message_short_form_at]); add_order_message_short_form_at = add_order_message_short_form_at + 1
  :: else -> break
  od;
  assert(add_order_message_short_form_read.market_side == add_order_message_short_form_written.market_side);
  add_order_message_short_form_at = 0;
  do
  :: add_order_message_short_form_at < 4 -> assert(add_order_message_short_form_read.option_id[add_order_message_short_form_at] == add_order_message_short_form_written.option_id[add_order_message_short_form_at]); add_order_message_short_form_at = add_order_message_short_form_at + 1
  :: else -> break
  od;
  add_order_message_short_form_at = 0;
  do
  :: add_order_message_short_form_at < 2 -> assert(add_order_message_short_form_read.price[add_order_message_short_form_at] == add_order_message_short_form_written.price[add_order_message_short_form_at]); add_order_message_short_form_at = add_order_message_short_form_at + 1
  :: else -> break
  od;
  add_order_message_short_form_at = 0;
  do
  :: add_order_message_short_form_at < 2 -> assert(add_order_message_short_form_read.volume[add_order_message_short_form_at] == add_order_message_short_form_written.volume[add_order_message_short_form_at]); add_order_message_short_form_at = add_order_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order Message Long Form: 21 bytes ----------------------------------- */

/* Indicates that a new order has been accepted by the Nasdaq Option system and was added to the displayable book, carrying a day unique Order Reference Number. The long form of the message, with four byte price and volume. */
typedef AddOrderMessageLongForm {
  byte nanoseconds[4];
  byte order_reference_number_delta[4];
  byte market_side;
  byte option_id[4];
  byte price_long[4];
  byte volume_long[4]
};

int add_order_message_long_form_at;

/* every byte of Add Order Message Long Form set to one value */
inline fill_add_order_message_long_form(add_order_message_long_form_record, add_order_message_long_form_value) {
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 4 -> add_order_message_long_form_record.nanoseconds[add_order_message_long_form_at] = add_order_message_long_form_value; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 4 -> add_order_message_long_form_record.order_reference_number_delta[add_order_message_long_form_at] = add_order_message_long_form_value; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_record.market_side = add_order_message_long_form_value;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 4 -> add_order_message_long_form_record.option_id[add_order_message_long_form_at] = add_order_message_long_form_value; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 4 -> add_order_message_long_form_record.price_long[add_order_message_long_form_at] = add_order_message_long_form_value; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 4 -> add_order_message_long_form_record.volume_long[add_order_message_long_form_at] = add_order_message_long_form_value; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Message Long Form set to where it lies, so a field read out of place says so */
inline ramp_add_order_message_long_form(add_order_message_long_form_record, add_order_message_long_form_base) {
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 4 -> add_order_message_long_form_record.nanoseconds[add_order_message_long_form_at] = (add_order_message_long_form_base + 0 + add_order_message_long_form_at + 1) % 256; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 4 -> add_order_message_long_form_record.order_reference_number_delta[add_order_message_long_form_at] = (add_order_message_long_form_base + 4 + add_order_message_long_form_at + 1) % 256; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_record.market_side = (add_order_message_long_form_base + 8 + 1) % 256;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 4 -> add_order_message_long_form_record.option_id[add_order_message_long_form_at] = (add_order_message_long_form_base + 9 + add_order_message_long_form_at + 1) % 256; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 4 -> add_order_message_long_form_record.price_long[add_order_message_long_form_at] = (add_order_message_long_form_base + 13 + add_order_message_long_form_at + 1) % 256; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 4 -> add_order_message_long_form_record.volume_long[add_order_message_long_form_at] = (add_order_message_long_form_base + 17 + add_order_message_long_form_at + 1) % 256; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message Long Form to the wire, 21 bytes from where the cursor stands */
inline encode_add_order_message_long_form(add_order_message_long_form_record) {
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 4 -> wire[at] = add_order_message_long_form_record.nanoseconds[add_order_message_long_form_at]; at = at + 1; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 4 -> wire[at] = add_order_message_long_form_record.order_reference_number_delta[add_order_message_long_form_at]; at = at + 1; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_long_form_record.market_side; at = at + 1;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 4 -> wire[at] = add_order_message_long_form_record.option_id[add_order_message_long_form_at]; at = at + 1; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 4 -> wire[at] = add_order_message_long_form_record.price_long[add_order_message_long_form_at]; at = at + 1; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 4 -> wire[at] = add_order_message_long_form_record.volume_long[add_order_message_long_form_at]; at = at + 1; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message Long Form off the wire, 21 bytes from where the cursor stands */
inline decode_add_order_message_long_form(add_order_message_long_form_record) {
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 4 -> add_order_message_long_form_record.nanoseconds[add_order_message_long_form_at] = wire[at]; at = at + 1; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 4 -> add_order_message_long_form_record.order_reference_number_delta[add_order_message_long_form_at] = wire[at]; at = at + 1; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_record.market_side = wire[at]; at = at + 1;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 4 -> add_order_message_long_form_record.option_id[add_order_message_long_form_at] = wire[at]; at = at + 1; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 4 -> add_order_message_long_form_record.price_long[add_order_message_long_form_at] = wire[at]; at = at + 1; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 4 -> add_order_message_long_form_record.volume_long[add_order_message_long_form_at] = wire[at]; at = at + 1; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Message Long Form is what was written, byte for byte */
inline equal_add_order_message_long_form(add_order_message_long_form_read, add_order_message_long_form_written) {
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 4 -> assert(add_order_message_long_form_read.nanoseconds[add_order_message_long_form_at] == add_order_message_long_form_written.nanoseconds[add_order_message_long_form_at]); add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 4 -> assert(add_order_message_long_form_read.order_reference_number_delta[add_order_message_long_form_at] == add_order_message_long_form_written.order_reference_number_delta[add_order_message_long_form_at]); add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  assert(add_order_message_long_form_read.market_side == add_order_message_long_form_written.market_side);
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 4 -> assert(add_order_message_long_form_read.option_id[add_order_message_long_form_at] == add_order_message_long_form_written.option_id[add_order_message_long_form_at]); add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 4 -> assert(add_order_message_long_form_read.price_long[add_order_message_long_form_at] == add_order_message_long_form_written.price_long[add_order_message_long_form_at]); add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 4 -> assert(add_order_message_long_form_read.volume_long[add_order_message_long_form_at] == add_order_message_long_form_written.volume_long[add_order_message_long_form_at]); add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Quote Message Short Form: 24 bytes ---------------------------------- */

/* Indicates that a new quote has been accepted by the Nasdaq Option system and was added to the displayable book, carrying unique Bid and Ask Reference Numbers. The short form of the message, published for bandwidth efficiency. */
typedef AddQuoteMessageShortForm {
  byte nanoseconds[4];
  byte bid_reference_number_delta[4];
  byte ask_reference_number_delta[4];
  byte option_id[4];
  byte bid_price[2];
  byte bid_size[2];
  byte ask_price[2];
  byte ask_size[2]
};

int add_quote_message_short_form_at;

/* every byte of Add Quote Message Short Form set to one value */
inline fill_add_quote_message_short_form(add_quote_message_short_form_record, add_quote_message_short_form_value) {
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 4 -> add_quote_message_short_form_record.nanoseconds[add_quote_message_short_form_at] = add_quote_message_short_form_value; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 4 -> add_quote_message_short_form_record.bid_reference_number_delta[add_quote_message_short_form_at] = add_quote_message_short_form_value; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 4 -> add_quote_message_short_form_record.ask_reference_number_delta[add_quote_message_short_form_at] = add_quote_message_short_form_value; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 4 -> add_quote_message_short_form_record.option_id[add_quote_message_short_form_at] = add_quote_message_short_form_value; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 2 -> add_quote_message_short_form_record.bid_price[add_quote_message_short_form_at] = add_quote_message_short_form_value; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 2 -> add_quote_message_short_form_record.bid_size[add_quote_message_short_form_at] = add_quote_message_short_form_value; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 2 -> add_quote_message_short_form_record.ask_price[add_quote_message_short_form_at] = add_quote_message_short_form_value; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 2 -> add_quote_message_short_form_record.ask_size[add_quote_message_short_form_at] = add_quote_message_short_form_value; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Quote Message Short Form set to where it lies, so a field read out of place says so */
inline ramp_add_quote_message_short_form(add_quote_message_short_form_record, add_quote_message_short_form_base) {
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 4 -> add_quote_message_short_form_record.nanoseconds[add_quote_message_short_form_at] = (add_quote_message_short_form_base + 0 + add_quote_message_short_form_at + 1) % 256; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 4 -> add_quote_message_short_form_record.bid_reference_number_delta[add_quote_message_short_form_at] = (add_quote_message_short_form_base + 4 + add_quote_message_short_form_at + 1) % 256; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 4 -> add_quote_message_short_form_record.ask_reference_number_delta[add_quote_message_short_form_at] = (add_quote_message_short_form_base + 8 + add_quote_message_short_form_at + 1) % 256; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 4 -> add_quote_message_short_form_record.option_id[add_quote_message_short_form_at] = (add_quote_message_short_form_base + 12 + add_quote_message_short_form_at + 1) % 256; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 2 -> add_quote_message_short_form_record.bid_price[add_quote_message_short_form_at] = (add_quote_message_short_form_base + 16 + add_quote_message_short_form_at + 1) % 256; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 2 -> add_quote_message_short_form_record.bid_size[add_quote_message_short_form_at] = (add_quote_message_short_form_base + 18 + add_quote_message_short_form_at + 1) % 256; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 2 -> add_quote_message_short_form_record.ask_price[add_quote_message_short_form_at] = (add_quote_message_short_form_base + 20 + add_quote_message_short_form_at + 1) % 256; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 2 -> add_quote_message_short_form_record.ask_size[add_quote_message_short_form_at] = (add_quote_message_short_form_base + 22 + add_quote_message_short_form_at + 1) % 256; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* Add Quote Message Short Form to the wire, 24 bytes from where the cursor stands */
inline encode_add_quote_message_short_form(add_quote_message_short_form_record) {
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 4 -> wire[at] = add_quote_message_short_form_record.nanoseconds[add_quote_message_short_form_at]; at = at + 1; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 4 -> wire[at] = add_quote_message_short_form_record.bid_reference_number_delta[add_quote_message_short_form_at]; at = at + 1; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 4 -> wire[at] = add_quote_message_short_form_record.ask_reference_number_delta[add_quote_message_short_form_at]; at = at + 1; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 4 -> wire[at] = add_quote_message_short_form_record.option_id[add_quote_message_short_form_at]; at = at + 1; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 2 -> wire[at] = add_quote_message_short_form_record.bid_price[add_quote_message_short_form_at]; at = at + 1; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 2 -> wire[at] = add_quote_message_short_form_record.bid_size[add_quote_message_short_form_at]; at = at + 1; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 2 -> wire[at] = add_quote_message_short_form_record.ask_price[add_quote_message_short_form_at]; at = at + 1; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 2 -> wire[at] = add_quote_message_short_form_record.ask_size[add_quote_message_short_form_at]; at = at + 1; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* Add Quote Message Short Form off the wire, 24 bytes from where the cursor stands */
inline decode_add_quote_message_short_form(add_quote_message_short_form_record) {
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 4 -> add_quote_message_short_form_record.nanoseconds[add_quote_message_short_form_at] = wire[at]; at = at + 1; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 4 -> add_quote_message_short_form_record.bid_reference_number_delta[add_quote_message_short_form_at] = wire[at]; at = at + 1; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 4 -> add_quote_message_short_form_record.ask_reference_number_delta[add_quote_message_short_form_at] = wire[at]; at = at + 1; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 4 -> add_quote_message_short_form_record.option_id[add_quote_message_short_form_at] = wire[at]; at = at + 1; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 2 -> add_quote_message_short_form_record.bid_price[add_quote_message_short_form_at] = wire[at]; at = at + 1; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 2 -> add_quote_message_short_form_record.bid_size[add_quote_message_short_form_at] = wire[at]; at = at + 1; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 2 -> add_quote_message_short_form_record.ask_price[add_quote_message_short_form_at] = wire[at]; at = at + 1; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 2 -> add_quote_message_short_form_record.ask_size[add_quote_message_short_form_at] = wire[at]; at = at + 1; add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Quote Message Short Form is what was written, byte for byte */
inline equal_add_quote_message_short_form(add_quote_message_short_form_read, add_quote_message_short_form_written) {
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 4 -> assert(add_quote_message_short_form_read.nanoseconds[add_quote_message_short_form_at] == add_quote_message_short_form_written.nanoseconds[add_quote_message_short_form_at]); add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 4 -> assert(add_quote_message_short_form_read.bid_reference_number_delta[add_quote_message_short_form_at] == add_quote_message_short_form_written.bid_reference_number_delta[add_quote_message_short_form_at]); add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 4 -> assert(add_quote_message_short_form_read.ask_reference_number_delta[add_quote_message_short_form_at] == add_quote_message_short_form_written.ask_reference_number_delta[add_quote_message_short_form_at]); add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 4 -> assert(add_quote_message_short_form_read.option_id[add_quote_message_short_form_at] == add_quote_message_short_form_written.option_id[add_quote_message_short_form_at]); add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 2 -> assert(add_quote_message_short_form_read.bid_price[add_quote_message_short_form_at] == add_quote_message_short_form_written.bid_price[add_quote_message_short_form_at]); add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 2 -> assert(add_quote_message_short_form_read.bid_size[add_quote_message_short_form_at] == add_quote_message_short_form_written.bid_size[add_quote_message_short_form_at]); add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 2 -> assert(add_quote_message_short_form_read.ask_price[add_quote_message_short_form_at] == add_quote_message_short_form_written.ask_price[add_quote_message_short_form_at]); add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  add_quote_message_short_form_at = 0;
  do
  :: add_quote_message_short_form_at < 2 -> assert(add_quote_message_short_form_read.ask_size[add_quote_message_short_form_at] == add_quote_message_short_form_written.ask_size[add_quote_message_short_form_at]); add_quote_message_short_form_at = add_quote_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Quote Message Long Form: 32 bytes ----------------------------------- */

/* Indicates that a new quote has been accepted by the Nasdaq Option system and was added to the displayable book, carrying unique Bid and Ask Reference Numbers. The long form of the message, with four byte prices and sizes. */
typedef AddQuoteMessageLongForm {
  byte nanoseconds[4];
  byte bid_reference_number_delta[4];
  byte ask_reference_number_delta[4];
  byte option_id[4];
  byte bid[4];
  byte bid_size_long[4];
  byte ask[4];
  byte ask_size_long[4]
};

int add_quote_message_long_form_at;

/* every byte of Add Quote Message Long Form set to one value */
inline fill_add_quote_message_long_form(add_quote_message_long_form_record, add_quote_message_long_form_value) {
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> add_quote_message_long_form_record.nanoseconds[add_quote_message_long_form_at] = add_quote_message_long_form_value; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> add_quote_message_long_form_record.bid_reference_number_delta[add_quote_message_long_form_at] = add_quote_message_long_form_value; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> add_quote_message_long_form_record.ask_reference_number_delta[add_quote_message_long_form_at] = add_quote_message_long_form_value; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> add_quote_message_long_form_record.option_id[add_quote_message_long_form_at] = add_quote_message_long_form_value; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> add_quote_message_long_form_record.bid[add_quote_message_long_form_at] = add_quote_message_long_form_value; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> add_quote_message_long_form_record.bid_size_long[add_quote_message_long_form_at] = add_quote_message_long_form_value; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> add_quote_message_long_form_record.ask[add_quote_message_long_form_at] = add_quote_message_long_form_value; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> add_quote_message_long_form_record.ask_size_long[add_quote_message_long_form_at] = add_quote_message_long_form_value; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Quote Message Long Form set to where it lies, so a field read out of place says so */
inline ramp_add_quote_message_long_form(add_quote_message_long_form_record, add_quote_message_long_form_base) {
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> add_quote_message_long_form_record.nanoseconds[add_quote_message_long_form_at] = (add_quote_message_long_form_base + 0 + add_quote_message_long_form_at + 1) % 256; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> add_quote_message_long_form_record.bid_reference_number_delta[add_quote_message_long_form_at] = (add_quote_message_long_form_base + 4 + add_quote_message_long_form_at + 1) % 256; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> add_quote_message_long_form_record.ask_reference_number_delta[add_quote_message_long_form_at] = (add_quote_message_long_form_base + 8 + add_quote_message_long_form_at + 1) % 256; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> add_quote_message_long_form_record.option_id[add_quote_message_long_form_at] = (add_quote_message_long_form_base + 12 + add_quote_message_long_form_at + 1) % 256; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> add_quote_message_long_form_record.bid[add_quote_message_long_form_at] = (add_quote_message_long_form_base + 16 + add_quote_message_long_form_at + 1) % 256; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> add_quote_message_long_form_record.bid_size_long[add_quote_message_long_form_at] = (add_quote_message_long_form_base + 20 + add_quote_message_long_form_at + 1) % 256; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> add_quote_message_long_form_record.ask[add_quote_message_long_form_at] = (add_quote_message_long_form_base + 24 + add_quote_message_long_form_at + 1) % 256; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> add_quote_message_long_form_record.ask_size_long[add_quote_message_long_form_at] = (add_quote_message_long_form_base + 28 + add_quote_message_long_form_at + 1) % 256; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* Add Quote Message Long Form to the wire, 32 bytes from where the cursor stands */
inline encode_add_quote_message_long_form(add_quote_message_long_form_record) {
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> wire[at] = add_quote_message_long_form_record.nanoseconds[add_quote_message_long_form_at]; at = at + 1; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> wire[at] = add_quote_message_long_form_record.bid_reference_number_delta[add_quote_message_long_form_at]; at = at + 1; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> wire[at] = add_quote_message_long_form_record.ask_reference_number_delta[add_quote_message_long_form_at]; at = at + 1; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> wire[at] = add_quote_message_long_form_record.option_id[add_quote_message_long_form_at]; at = at + 1; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> wire[at] = add_quote_message_long_form_record.bid[add_quote_message_long_form_at]; at = at + 1; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> wire[at] = add_quote_message_long_form_record.bid_size_long[add_quote_message_long_form_at]; at = at + 1; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> wire[at] = add_quote_message_long_form_record.ask[add_quote_message_long_form_at]; at = at + 1; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> wire[at] = add_quote_message_long_form_record.ask_size_long[add_quote_message_long_form_at]; at = at + 1; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* Add Quote Message Long Form off the wire, 32 bytes from where the cursor stands */
inline decode_add_quote_message_long_form(add_quote_message_long_form_record) {
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> add_quote_message_long_form_record.nanoseconds[add_quote_message_long_form_at] = wire[at]; at = at + 1; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> add_quote_message_long_form_record.bid_reference_number_delta[add_quote_message_long_form_at] = wire[at]; at = at + 1; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> add_quote_message_long_form_record.ask_reference_number_delta[add_quote_message_long_form_at] = wire[at]; at = at + 1; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> add_quote_message_long_form_record.option_id[add_quote_message_long_form_at] = wire[at]; at = at + 1; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> add_quote_message_long_form_record.bid[add_quote_message_long_form_at] = wire[at]; at = at + 1; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> add_quote_message_long_form_record.bid_size_long[add_quote_message_long_form_at] = wire[at]; at = at + 1; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> add_quote_message_long_form_record.ask[add_quote_message_long_form_at] = wire[at]; at = at + 1; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> add_quote_message_long_form_record.ask_size_long[add_quote_message_long_form_at] = wire[at]; at = at + 1; add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Quote Message Long Form is what was written, byte for byte */
inline equal_add_quote_message_long_form(add_quote_message_long_form_read, add_quote_message_long_form_written) {
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> assert(add_quote_message_long_form_read.nanoseconds[add_quote_message_long_form_at] == add_quote_message_long_form_written.nanoseconds[add_quote_message_long_form_at]); add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> assert(add_quote_message_long_form_read.bid_reference_number_delta[add_quote_message_long_form_at] == add_quote_message_long_form_written.bid_reference_number_delta[add_quote_message_long_form_at]); add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> assert(add_quote_message_long_form_read.ask_reference_number_delta[add_quote_message_long_form_at] == add_quote_message_long_form_written.ask_reference_number_delta[add_quote_message_long_form_at]); add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> assert(add_quote_message_long_form_read.option_id[add_quote_message_long_form_at] == add_quote_message_long_form_written.option_id[add_quote_message_long_form_at]); add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> assert(add_quote_message_long_form_read.bid[add_quote_message_long_form_at] == add_quote_message_long_form_written.bid[add_quote_message_long_form_at]); add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> assert(add_quote_message_long_form_read.bid_size_long[add_quote_message_long_form_at] == add_quote_message_long_form_written.bid_size_long[add_quote_message_long_form_at]); add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> assert(add_quote_message_long_form_read.ask[add_quote_message_long_form_at] == add_quote_message_long_form_written.ask[add_quote_message_long_form_at]); add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  add_quote_message_long_form_at = 0;
  do
  :: add_quote_message_long_form_at < 4 -> assert(add_quote_message_long_form_read.ask_size_long[add_quote_message_long_form_at] == add_quote_message_long_form_written.ask_size_long[add_quote_message_long_form_at]); add_quote_message_long_form_at = add_quote_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Executed Message: 20 bytes ---------------------------------- */

/* Sent whenever a Side order, an order or one side of a quote, is executed in whole or in part. Several of these messages may be received for the same Side order when it is executed in several parts, and they are cumulative. */
typedef SingleSideExecutedMessage {
  byte nanoseconds[4];
  byte reference_number_delta[4];
  byte executed_contracts[4];
  byte cross_number[4];
  byte match_number[4]
};

int single_side_executed_message_at;

/* every byte of Single Side Executed Message set to one value */
inline fill_single_side_executed_message(single_side_executed_message_record, single_side_executed_message_value) {
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.nanoseconds[single_side_executed_message_at] = single_side_executed_message_value; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.reference_number_delta[single_side_executed_message_at] = single_side_executed_message_value; single_side_executed_message_at = single_side_executed_message_at + 1
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
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.nanoseconds[single_side_executed_message_at] = (single_side_executed_message_base + 0 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.reference_number_delta[single_side_executed_message_at] = (single_side_executed_message_base + 4 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.executed_contracts[single_side_executed_message_at] = (single_side_executed_message_base + 8 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.cross_number[single_side_executed_message_at] = (single_side_executed_message_base + 12 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.match_number[single_side_executed_message_at] = (single_side_executed_message_base + 16 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Executed Message to the wire, 20 bytes from where the cursor stands */
inline encode_single_side_executed_message(single_side_executed_message_record) {
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> wire[at] = single_side_executed_message_record.nanoseconds[single_side_executed_message_at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> wire[at] = single_side_executed_message_record.reference_number_delta[single_side_executed_message_at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
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

/* Single Side Executed Message off the wire, 20 bytes from where the cursor stands */
inline decode_single_side_executed_message(single_side_executed_message_record) {
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.nanoseconds[single_side_executed_message_at] = wire[at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.reference_number_delta[single_side_executed_message_at] = wire[at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
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
  :: single_side_executed_message_at < 4 -> assert(single_side_executed_message_read.nanoseconds[single_side_executed_message_at] == single_side_executed_message_written.nanoseconds[single_side_executed_message_at]); single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> assert(single_side_executed_message_read.reference_number_delta[single_side_executed_message_at] == single_side_executed_message_written.reference_number_delta[single_side_executed_message_at]); single_side_executed_message_at = single_side_executed_message_at + 1
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

/* ---- Single Side Executed With Price Message: 25 bytes ----------------------- */

/* Sent whenever an incoming Side order is executed against the book in whole or in part at a price different from the initial display price, so the execution price is carried in the message. */
typedef SingleSideExecutedWithPriceMessage {
  byte nanoseconds[4];
  byte reference_number_delta[4];
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
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.nanoseconds[single_side_executed_with_price_message_at] = single_side_executed_with_price_message_value; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.reference_number_delta[single_side_executed_with_price_message_at] = single_side_executed_with_price_message_value; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
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
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.nanoseconds[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 0 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.reference_number_delta[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 4 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.cross_number[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 8 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.match_number[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 12 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_record.printable = (single_side_executed_with_price_message_base + 16 + 1) % 256;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.price_long[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 17 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.volume_long[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 21 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Executed With Price Message to the wire, 25 bytes from where the cursor stands */
inline encode_single_side_executed_with_price_message(single_side_executed_with_price_message_record) {
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> wire[at] = single_side_executed_with_price_message_record.nanoseconds[single_side_executed_with_price_message_at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> wire[at] = single_side_executed_with_price_message_record.reference_number_delta[single_side_executed_with_price_message_at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
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

/* Single Side Executed With Price Message off the wire, 25 bytes from where the cursor stands */
inline decode_single_side_executed_with_price_message(single_side_executed_with_price_message_record) {
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.nanoseconds[single_side_executed_with_price_message_at] = wire[at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.reference_number_delta[single_side_executed_with_price_message_at] = wire[at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
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
  :: single_side_executed_with_price_message_at < 4 -> assert(single_side_executed_with_price_message_read.nanoseconds[single_side_executed_with_price_message_at] == single_side_executed_with_price_message_written.nanoseconds[single_side_executed_with_price_message_at]); single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> assert(single_side_executed_with_price_message_read.reference_number_delta[single_side_executed_with_price_message_at] == single_side_executed_with_price_message_written.reference_number_delta[single_side_executed_with_price_message_at]); single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
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

/* ---- Order Cancel Message: 12 bytes ------------------------------------------ */

/* Sent whenever an order on the book is modified as a result of a partial cancellation. */
typedef OrderCancelMessage {
  byte nanoseconds[4];
  byte order_reference_number_delta[4];
  byte cancelled_contracts[4]
};

int order_cancel_message_at;

/* every byte of Order Cancel Message set to one value */
inline fill_order_cancel_message(order_cancel_message_record, order_cancel_message_value) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.nanoseconds[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.order_reference_number_delta[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
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
  :: order_cancel_message_at < 4 -> order_cancel_message_record.nanoseconds[order_cancel_message_at] = (order_cancel_message_base + 0 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.order_reference_number_delta[order_cancel_message_at] = (order_cancel_message_base + 4 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.cancelled_contracts[order_cancel_message_at] = (order_cancel_message_base + 8 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Message to the wire, 12 bytes from where the cursor stands */
inline encode_order_cancel_message(order_cancel_message_record) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> wire[at] = order_cancel_message_record.nanoseconds[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> wire[at] = order_cancel_message_record.order_reference_number_delta[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> wire[at] = order_cancel_message_record.cancelled_contracts[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Message off the wire, 12 bytes from where the cursor stands */
inline decode_order_cancel_message(order_cancel_message_record) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.nanoseconds[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.order_reference_number_delta[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
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
  :: order_cancel_message_at < 4 -> assert(order_cancel_message_read.nanoseconds[order_cancel_message_at] == order_cancel_message_written.nanoseconds[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> assert(order_cancel_message_read.order_reference_number_delta[order_cancel_message_at] == order_cancel_message_written.order_reference_number_delta[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> assert(order_cancel_message_read.cancelled_contracts[order_cancel_message_at] == order_cancel_message_written.cancelled_contracts[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Replace Message Short Form: 16 bytes ------------------------ */

/* Sent whenever an order or one side of a quote on the book is replaced. The replacement has a new sequence number and replaces the prior sequence number. The short form of the message, published for bandwidth efficiency. */
typedef SingleSideReplaceMessageShortForm {
  byte nanoseconds[4];
  byte original_reference_number_delta[4];
  byte new_reference_number_delta[4];
  byte price[2];
  byte volume[2]
};

int single_side_replace_message_short_form_at;

/* every byte of Single Side Replace Message Short Form set to one value */
inline fill_single_side_replace_message_short_form(single_side_replace_message_short_form_record, single_side_replace_message_short_form_value) {
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 4 -> single_side_replace_message_short_form_record.nanoseconds[single_side_replace_message_short_form_at] = single_side_replace_message_short_form_value; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 4 -> single_side_replace_message_short_form_record.original_reference_number_delta[single_side_replace_message_short_form_at] = single_side_replace_message_short_form_value; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 4 -> single_side_replace_message_short_form_record.new_reference_number_delta[single_side_replace_message_short_form_at] = single_side_replace_message_short_form_value; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 2 -> single_side_replace_message_short_form_record.price[single_side_replace_message_short_form_at] = single_side_replace_message_short_form_value; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 2 -> single_side_replace_message_short_form_record.volume[single_side_replace_message_short_form_at] = single_side_replace_message_short_form_value; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Side Replace Message Short Form set to where it lies, so a field read out of place says so */
inline ramp_single_side_replace_message_short_form(single_side_replace_message_short_form_record, single_side_replace_message_short_form_base) {
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 4 -> single_side_replace_message_short_form_record.nanoseconds[single_side_replace_message_short_form_at] = (single_side_replace_message_short_form_base + 0 + single_side_replace_message_short_form_at + 1) % 256; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 4 -> single_side_replace_message_short_form_record.original_reference_number_delta[single_side_replace_message_short_form_at] = (single_side_replace_message_short_form_base + 4 + single_side_replace_message_short_form_at + 1) % 256; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 4 -> single_side_replace_message_short_form_record.new_reference_number_delta[single_side_replace_message_short_form_at] = (single_side_replace_message_short_form_base + 8 + single_side_replace_message_short_form_at + 1) % 256; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 2 -> single_side_replace_message_short_form_record.price[single_side_replace_message_short_form_at] = (single_side_replace_message_short_form_base + 12 + single_side_replace_message_short_form_at + 1) % 256; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 2 -> single_side_replace_message_short_form_record.volume[single_side_replace_message_short_form_at] = (single_side_replace_message_short_form_base + 14 + single_side_replace_message_short_form_at + 1) % 256; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Replace Message Short Form to the wire, 16 bytes from where the cursor stands */
inline encode_single_side_replace_message_short_form(single_side_replace_message_short_form_record) {
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 4 -> wire[at] = single_side_replace_message_short_form_record.nanoseconds[single_side_replace_message_short_form_at]; at = at + 1; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 4 -> wire[at] = single_side_replace_message_short_form_record.original_reference_number_delta[single_side_replace_message_short_form_at]; at = at + 1; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 4 -> wire[at] = single_side_replace_message_short_form_record.new_reference_number_delta[single_side_replace_message_short_form_at]; at = at + 1; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 2 -> wire[at] = single_side_replace_message_short_form_record.price[single_side_replace_message_short_form_at]; at = at + 1; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 2 -> wire[at] = single_side_replace_message_short_form_record.volume[single_side_replace_message_short_form_at]; at = at + 1; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Replace Message Short Form off the wire, 16 bytes from where the cursor stands */
inline decode_single_side_replace_message_short_form(single_side_replace_message_short_form_record) {
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 4 -> single_side_replace_message_short_form_record.nanoseconds[single_side_replace_message_short_form_at] = wire[at]; at = at + 1; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 4 -> single_side_replace_message_short_form_record.original_reference_number_delta[single_side_replace_message_short_form_at] = wire[at]; at = at + 1; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 4 -> single_side_replace_message_short_form_record.new_reference_number_delta[single_side_replace_message_short_form_at] = wire[at]; at = at + 1; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 2 -> single_side_replace_message_short_form_record.price[single_side_replace_message_short_form_at] = wire[at]; at = at + 1; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 2 -> single_side_replace_message_short_form_record.volume[single_side_replace_message_short_form_at] = wire[at]; at = at + 1; single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Side Replace Message Short Form is what was written, byte for byte */
inline equal_single_side_replace_message_short_form(single_side_replace_message_short_form_read, single_side_replace_message_short_form_written) {
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 4 -> assert(single_side_replace_message_short_form_read.nanoseconds[single_side_replace_message_short_form_at] == single_side_replace_message_short_form_written.nanoseconds[single_side_replace_message_short_form_at]); single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 4 -> assert(single_side_replace_message_short_form_read.original_reference_number_delta[single_side_replace_message_short_form_at] == single_side_replace_message_short_form_written.original_reference_number_delta[single_side_replace_message_short_form_at]); single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 4 -> assert(single_side_replace_message_short_form_read.new_reference_number_delta[single_side_replace_message_short_form_at] == single_side_replace_message_short_form_written.new_reference_number_delta[single_side_replace_message_short_form_at]); single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 2 -> assert(single_side_replace_message_short_form_read.price[single_side_replace_message_short_form_at] == single_side_replace_message_short_form_written.price[single_side_replace_message_short_form_at]); single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_short_form_at = 0;
  do
  :: single_side_replace_message_short_form_at < 2 -> assert(single_side_replace_message_short_form_read.volume[single_side_replace_message_short_form_at] == single_side_replace_message_short_form_written.volume[single_side_replace_message_short_form_at]); single_side_replace_message_short_form_at = single_side_replace_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Replace Message Long Form: 20 bytes ------------------------- */

/* Sent whenever an order or one side of a quote on the book is replaced. The replacement has a new sequence number and replaces the prior sequence number. The long form of the message, with four byte price and volume. */
typedef SingleSideReplaceMessageLongForm {
  byte nanoseconds[4];
  byte original_reference_number_delta[4];
  byte new_reference_number_delta[4];
  byte price_long[4];
  byte volume_long[4]
};

int single_side_replace_message_long_form_at;

/* every byte of Single Side Replace Message Long Form set to one value */
inline fill_single_side_replace_message_long_form(single_side_replace_message_long_form_record, single_side_replace_message_long_form_value) {
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 4 -> single_side_replace_message_long_form_record.nanoseconds[single_side_replace_message_long_form_at] = single_side_replace_message_long_form_value; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 4 -> single_side_replace_message_long_form_record.original_reference_number_delta[single_side_replace_message_long_form_at] = single_side_replace_message_long_form_value; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 4 -> single_side_replace_message_long_form_record.new_reference_number_delta[single_side_replace_message_long_form_at] = single_side_replace_message_long_form_value; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
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
  :: single_side_replace_message_long_form_at < 4 -> single_side_replace_message_long_form_record.nanoseconds[single_side_replace_message_long_form_at] = (single_side_replace_message_long_form_base + 0 + single_side_replace_message_long_form_at + 1) % 256; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 4 -> single_side_replace_message_long_form_record.original_reference_number_delta[single_side_replace_message_long_form_at] = (single_side_replace_message_long_form_base + 4 + single_side_replace_message_long_form_at + 1) % 256; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 4 -> single_side_replace_message_long_form_record.new_reference_number_delta[single_side_replace_message_long_form_at] = (single_side_replace_message_long_form_base + 8 + single_side_replace_message_long_form_at + 1) % 256; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 4 -> single_side_replace_message_long_form_record.price_long[single_side_replace_message_long_form_at] = (single_side_replace_message_long_form_base + 12 + single_side_replace_message_long_form_at + 1) % 256; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 4 -> single_side_replace_message_long_form_record.volume_long[single_side_replace_message_long_form_at] = (single_side_replace_message_long_form_base + 16 + single_side_replace_message_long_form_at + 1) % 256; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Replace Message Long Form to the wire, 20 bytes from where the cursor stands */
inline encode_single_side_replace_message_long_form(single_side_replace_message_long_form_record) {
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 4 -> wire[at] = single_side_replace_message_long_form_record.nanoseconds[single_side_replace_message_long_form_at]; at = at + 1; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 4 -> wire[at] = single_side_replace_message_long_form_record.original_reference_number_delta[single_side_replace_message_long_form_at]; at = at + 1; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 4 -> wire[at] = single_side_replace_message_long_form_record.new_reference_number_delta[single_side_replace_message_long_form_at]; at = at + 1; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
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

/* Single Side Replace Message Long Form off the wire, 20 bytes from where the cursor stands */
inline decode_single_side_replace_message_long_form(single_side_replace_message_long_form_record) {
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 4 -> single_side_replace_message_long_form_record.nanoseconds[single_side_replace_message_long_form_at] = wire[at]; at = at + 1; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 4 -> single_side_replace_message_long_form_record.original_reference_number_delta[single_side_replace_message_long_form_at] = wire[at]; at = at + 1; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 4 -> single_side_replace_message_long_form_record.new_reference_number_delta[single_side_replace_message_long_form_at] = wire[at]; at = at + 1; single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
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
  :: single_side_replace_message_long_form_at < 4 -> assert(single_side_replace_message_long_form_read.nanoseconds[single_side_replace_message_long_form_at] == single_side_replace_message_long_form_written.nanoseconds[single_side_replace_message_long_form_at]); single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 4 -> assert(single_side_replace_message_long_form_read.original_reference_number_delta[single_side_replace_message_long_form_at] == single_side_replace_message_long_form_written.original_reference_number_delta[single_side_replace_message_long_form_at]); single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
  :: else -> break
  od;
  single_side_replace_message_long_form_at = 0;
  do
  :: single_side_replace_message_long_form_at < 4 -> assert(single_side_replace_message_long_form_read.new_reference_number_delta[single_side_replace_message_long_form_at] == single_side_replace_message_long_form_written.new_reference_number_delta[single_side_replace_message_long_form_at]); single_side_replace_message_long_form_at = single_side_replace_message_long_form_at + 1
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

/* ---- Single Side Delete Message: 8 bytes ------------------------------------- */

/* Sent when an order or a side of a quote is being cancelled. All remaining contracts are no longer accessible so the side should be removed from the book. */
typedef SingleSideDeleteMessage {
  byte nanoseconds[4];
  byte reference_number_delta[4]
};

int single_side_delete_message_at;

/* every byte of Single Side Delete Message set to one value */
inline fill_single_side_delete_message(single_side_delete_message_record, single_side_delete_message_value) {
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 4 -> single_side_delete_message_record.nanoseconds[single_side_delete_message_at] = single_side_delete_message_value; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 4 -> single_side_delete_message_record.reference_number_delta[single_side_delete_message_at] = single_side_delete_message_value; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Side Delete Message set to where it lies, so a field read out of place says so */
inline ramp_single_side_delete_message(single_side_delete_message_record, single_side_delete_message_base) {
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 4 -> single_side_delete_message_record.nanoseconds[single_side_delete_message_at] = (single_side_delete_message_base + 0 + single_side_delete_message_at + 1) % 256; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 4 -> single_side_delete_message_record.reference_number_delta[single_side_delete_message_at] = (single_side_delete_message_base + 4 + single_side_delete_message_at + 1) % 256; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Delete Message to the wire, 8 bytes from where the cursor stands */
inline encode_single_side_delete_message(single_side_delete_message_record) {
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 4 -> wire[at] = single_side_delete_message_record.nanoseconds[single_side_delete_message_at]; at = at + 1; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 4 -> wire[at] = single_side_delete_message_record.reference_number_delta[single_side_delete_message_at]; at = at + 1; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Delete Message off the wire, 8 bytes from where the cursor stands */
inline decode_single_side_delete_message(single_side_delete_message_record) {
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 4 -> single_side_delete_message_record.nanoseconds[single_side_delete_message_at] = wire[at]; at = at + 1; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 4 -> single_side_delete_message_record.reference_number_delta[single_side_delete_message_at] = wire[at]; at = at + 1; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Side Delete Message is what was written, byte for byte */
inline equal_single_side_delete_message(single_side_delete_message_read, single_side_delete_message_written) {
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 4 -> assert(single_side_delete_message_read.nanoseconds[single_side_delete_message_at] == single_side_delete_message_written.nanoseconds[single_side_delete_message_at]); single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 4 -> assert(single_side_delete_message_read.reference_number_delta[single_side_delete_message_at] == single_side_delete_message_written.reference_number_delta[single_side_delete_message_at]); single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Update Message: 17 bytes ------------------------------------ */

/* Sent whenever an order or a side of a quote is being updated for price and or contracts. The reference number associated with the order or quote is unchanged and it retains its priority on the book. */
typedef SingleSideUpdateMessage {
  byte nanoseconds[4];
  byte reference_number_delta[4];
  byte change_reason;
  byte price_long[4];
  byte volume_long[4]
};

int single_side_update_message_at;

/* every byte of Single Side Update Message set to one value */
inline fill_single_side_update_message(single_side_update_message_record, single_side_update_message_value) {
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.nanoseconds[single_side_update_message_at] = single_side_update_message_value; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.reference_number_delta[single_side_update_message_at] = single_side_update_message_value; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_record.change_reason = single_side_update_message_value;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.price_long[single_side_update_message_at] = single_side_update_message_value; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.volume_long[single_side_update_message_at] = single_side_update_message_value; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Side Update Message set to where it lies, so a field read out of place says so */
inline ramp_single_side_update_message(single_side_update_message_record, single_side_update_message_base) {
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.nanoseconds[single_side_update_message_at] = (single_side_update_message_base + 0 + single_side_update_message_at + 1) % 256; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.reference_number_delta[single_side_update_message_at] = (single_side_update_message_base + 4 + single_side_update_message_at + 1) % 256; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_record.change_reason = (single_side_update_message_base + 8 + 1) % 256;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.price_long[single_side_update_message_at] = (single_side_update_message_base + 9 + single_side_update_message_at + 1) % 256; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.volume_long[single_side_update_message_at] = (single_side_update_message_base + 13 + single_side_update_message_at + 1) % 256; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Update Message to the wire, 17 bytes from where the cursor stands */
inline encode_single_side_update_message(single_side_update_message_record) {
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> wire[at] = single_side_update_message_record.nanoseconds[single_side_update_message_at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> wire[at] = single_side_update_message_record.reference_number_delta[single_side_update_message_at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  wire[at] = single_side_update_message_record.change_reason; at = at + 1;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> wire[at] = single_side_update_message_record.price_long[single_side_update_message_at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> wire[at] = single_side_update_message_record.volume_long[single_side_update_message_at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Update Message off the wire, 17 bytes from where the cursor stands */
inline decode_single_side_update_message(single_side_update_message_record) {
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.nanoseconds[single_side_update_message_at] = wire[at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.reference_number_delta[single_side_update_message_at] = wire[at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_record.change_reason = wire[at]; at = at + 1;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.price_long[single_side_update_message_at] = wire[at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.volume_long[single_side_update_message_at] = wire[at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Side Update Message is what was written, byte for byte */
inline equal_single_side_update_message(single_side_update_message_read, single_side_update_message_written) {
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> assert(single_side_update_message_read.nanoseconds[single_side_update_message_at] == single_side_update_message_written.nanoseconds[single_side_update_message_at]); single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> assert(single_side_update_message_read.reference_number_delta[single_side_update_message_at] == single_side_update_message_written.reference_number_delta[single_side_update_message_at]); single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  assert(single_side_update_message_read.change_reason == single_side_update_message_written.change_reason);
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> assert(single_side_update_message_read.price_long[single_side_update_message_at] == single_side_update_message_written.price_long[single_side_update_message_at]); single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> assert(single_side_update_message_read.volume_long[single_side_update_message_at] == single_side_update_message_written.volume_long[single_side_update_message_at]); single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Replace Message Short Form: 28 bytes ------------------------------ */

/* Sent whenever a quote on the book is replaced. The replaced quote has new sequence numbers on both sides, replacing the prior sequence numbers. The short form of the message, published for bandwidth efficiency. */
typedef QuoteReplaceMessageShortForm {
  byte nanoseconds[4];
  byte original_bid_reference_number_delta[4];
  byte bid_reference_number_delta[4];
  byte original_ask_reference_number_delta[4];
  byte ask_reference_delta_number[4];
  byte bid_price[2];
  byte bid_size[2];
  byte ask_price[2];
  byte ask_size[2]
};

int quote_replace_message_short_form_at;

/* every byte of Quote Replace Message Short Form set to one value */
inline fill_quote_replace_message_short_form(quote_replace_message_short_form_record, quote_replace_message_short_form_value) {
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 4 -> quote_replace_message_short_form_record.nanoseconds[quote_replace_message_short_form_at] = quote_replace_message_short_form_value; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 4 -> quote_replace_message_short_form_record.original_bid_reference_number_delta[quote_replace_message_short_form_at] = quote_replace_message_short_form_value; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 4 -> quote_replace_message_short_form_record.bid_reference_number_delta[quote_replace_message_short_form_at] = quote_replace_message_short_form_value; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 4 -> quote_replace_message_short_form_record.original_ask_reference_number_delta[quote_replace_message_short_form_at] = quote_replace_message_short_form_value; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 4 -> quote_replace_message_short_form_record.ask_reference_delta_number[quote_replace_message_short_form_at] = quote_replace_message_short_form_value; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.bid_price[quote_replace_message_short_form_at] = quote_replace_message_short_form_value; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.bid_size[quote_replace_message_short_form_at] = quote_replace_message_short_form_value; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.ask_price[quote_replace_message_short_form_at] = quote_replace_message_short_form_value; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.ask_size[quote_replace_message_short_form_at] = quote_replace_message_short_form_value; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Replace Message Short Form set to where it lies, so a field read out of place says so */
inline ramp_quote_replace_message_short_form(quote_replace_message_short_form_record, quote_replace_message_short_form_base) {
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 4 -> quote_replace_message_short_form_record.nanoseconds[quote_replace_message_short_form_at] = (quote_replace_message_short_form_base + 0 + quote_replace_message_short_form_at + 1) % 256; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 4 -> quote_replace_message_short_form_record.original_bid_reference_number_delta[quote_replace_message_short_form_at] = (quote_replace_message_short_form_base + 4 + quote_replace_message_short_form_at + 1) % 256; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 4 -> quote_replace_message_short_form_record.bid_reference_number_delta[quote_replace_message_short_form_at] = (quote_replace_message_short_form_base + 8 + quote_replace_message_short_form_at + 1) % 256; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 4 -> quote_replace_message_short_form_record.original_ask_reference_number_delta[quote_replace_message_short_form_at] = (quote_replace_message_short_form_base + 12 + quote_replace_message_short_form_at + 1) % 256; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 4 -> quote_replace_message_short_form_record.ask_reference_delta_number[quote_replace_message_short_form_at] = (quote_replace_message_short_form_base + 16 + quote_replace_message_short_form_at + 1) % 256; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.bid_price[quote_replace_message_short_form_at] = (quote_replace_message_short_form_base + 20 + quote_replace_message_short_form_at + 1) % 256; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.bid_size[quote_replace_message_short_form_at] = (quote_replace_message_short_form_base + 22 + quote_replace_message_short_form_at + 1) % 256; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.ask_price[quote_replace_message_short_form_at] = (quote_replace_message_short_form_base + 24 + quote_replace_message_short_form_at + 1) % 256; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.ask_size[quote_replace_message_short_form_at] = (quote_replace_message_short_form_base + 26 + quote_replace_message_short_form_at + 1) % 256; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Replace Message Short Form to the wire, 28 bytes from where the cursor stands */
inline encode_quote_replace_message_short_form(quote_replace_message_short_form_record) {
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 4 -> wire[at] = quote_replace_message_short_form_record.nanoseconds[quote_replace_message_short_form_at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 4 -> wire[at] = quote_replace_message_short_form_record.original_bid_reference_number_delta[quote_replace_message_short_form_at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 4 -> wire[at] = quote_replace_message_short_form_record.bid_reference_number_delta[quote_replace_message_short_form_at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 4 -> wire[at] = quote_replace_message_short_form_record.original_ask_reference_number_delta[quote_replace_message_short_form_at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 4 -> wire[at] = quote_replace_message_short_form_record.ask_reference_delta_number[quote_replace_message_short_form_at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> wire[at] = quote_replace_message_short_form_record.bid_price[quote_replace_message_short_form_at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> wire[at] = quote_replace_message_short_form_record.bid_size[quote_replace_message_short_form_at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> wire[at] = quote_replace_message_short_form_record.ask_price[quote_replace_message_short_form_at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> wire[at] = quote_replace_message_short_form_record.ask_size[quote_replace_message_short_form_at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Replace Message Short Form off the wire, 28 bytes from where the cursor stands */
inline decode_quote_replace_message_short_form(quote_replace_message_short_form_record) {
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 4 -> quote_replace_message_short_form_record.nanoseconds[quote_replace_message_short_form_at] = wire[at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 4 -> quote_replace_message_short_form_record.original_bid_reference_number_delta[quote_replace_message_short_form_at] = wire[at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 4 -> quote_replace_message_short_form_record.bid_reference_number_delta[quote_replace_message_short_form_at] = wire[at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 4 -> quote_replace_message_short_form_record.original_ask_reference_number_delta[quote_replace_message_short_form_at] = wire[at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 4 -> quote_replace_message_short_form_record.ask_reference_delta_number[quote_replace_message_short_form_at] = wire[at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.bid_price[quote_replace_message_short_form_at] = wire[at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.bid_size[quote_replace_message_short_form_at] = wire[at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.ask_price[quote_replace_message_short_form_at] = wire[at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> quote_replace_message_short_form_record.ask_size[quote_replace_message_short_form_at] = wire[at]; at = at + 1; quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Replace Message Short Form is what was written, byte for byte */
inline equal_quote_replace_message_short_form(quote_replace_message_short_form_read, quote_replace_message_short_form_written) {
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 4 -> assert(quote_replace_message_short_form_read.nanoseconds[quote_replace_message_short_form_at] == quote_replace_message_short_form_written.nanoseconds[quote_replace_message_short_form_at]); quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 4 -> assert(quote_replace_message_short_form_read.original_bid_reference_number_delta[quote_replace_message_short_form_at] == quote_replace_message_short_form_written.original_bid_reference_number_delta[quote_replace_message_short_form_at]); quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 4 -> assert(quote_replace_message_short_form_read.bid_reference_number_delta[quote_replace_message_short_form_at] == quote_replace_message_short_form_written.bid_reference_number_delta[quote_replace_message_short_form_at]); quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 4 -> assert(quote_replace_message_short_form_read.original_ask_reference_number_delta[quote_replace_message_short_form_at] == quote_replace_message_short_form_written.original_ask_reference_number_delta[quote_replace_message_short_form_at]); quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 4 -> assert(quote_replace_message_short_form_read.ask_reference_delta_number[quote_replace_message_short_form_at] == quote_replace_message_short_form_written.ask_reference_delta_number[quote_replace_message_short_form_at]); quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> assert(quote_replace_message_short_form_read.bid_price[quote_replace_message_short_form_at] == quote_replace_message_short_form_written.bid_price[quote_replace_message_short_form_at]); quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> assert(quote_replace_message_short_form_read.bid_size[quote_replace_message_short_form_at] == quote_replace_message_short_form_written.bid_size[quote_replace_message_short_form_at]); quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> assert(quote_replace_message_short_form_read.ask_price[quote_replace_message_short_form_at] == quote_replace_message_short_form_written.ask_price[quote_replace_message_short_form_at]); quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  quote_replace_message_short_form_at = 0;
  do
  :: quote_replace_message_short_form_at < 2 -> assert(quote_replace_message_short_form_read.ask_size[quote_replace_message_short_form_at] == quote_replace_message_short_form_written.ask_size[quote_replace_message_short_form_at]); quote_replace_message_short_form_at = quote_replace_message_short_form_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Replace Message Long Form: 36 bytes ------------------------------- */

/* Sent whenever a quote on the book is replaced. The replaced quote has new sequence numbers on both sides, replacing the prior sequence numbers. The long form of the message, with four byte prices and sizes. */
typedef QuoteReplaceMessageLongForm {
  byte nanoseconds[4];
  byte original_bid_reference_number_delta[4];
  byte bid_reference_number_delta[4];
  byte original_ask_reference_number_delta[4];
  byte ask_reference_delta_number[4];
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
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.nanoseconds[quote_replace_message_long_form_at] = quote_replace_message_long_form_value; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.original_bid_reference_number_delta[quote_replace_message_long_form_at] = quote_replace_message_long_form_value; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.bid_reference_number_delta[quote_replace_message_long_form_at] = quote_replace_message_long_form_value; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.original_ask_reference_number_delta[quote_replace_message_long_form_at] = quote_replace_message_long_form_value; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.ask_reference_delta_number[quote_replace_message_long_form_at] = quote_replace_message_long_form_value; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
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
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.nanoseconds[quote_replace_message_long_form_at] = (quote_replace_message_long_form_base + 0 + quote_replace_message_long_form_at + 1) % 256; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.original_bid_reference_number_delta[quote_replace_message_long_form_at] = (quote_replace_message_long_form_base + 4 + quote_replace_message_long_form_at + 1) % 256; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.bid_reference_number_delta[quote_replace_message_long_form_at] = (quote_replace_message_long_form_base + 8 + quote_replace_message_long_form_at + 1) % 256; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.original_ask_reference_number_delta[quote_replace_message_long_form_at] = (quote_replace_message_long_form_base + 12 + quote_replace_message_long_form_at + 1) % 256; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.ask_reference_delta_number[quote_replace_message_long_form_at] = (quote_replace_message_long_form_base + 16 + quote_replace_message_long_form_at + 1) % 256; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.bid_price_long[quote_replace_message_long_form_at] = (quote_replace_message_long_form_base + 20 + quote_replace_message_long_form_at + 1) % 256; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.bid_size_long[quote_replace_message_long_form_at] = (quote_replace_message_long_form_base + 24 + quote_replace_message_long_form_at + 1) % 256; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.ask_price_long[quote_replace_message_long_form_at] = (quote_replace_message_long_form_base + 28 + quote_replace_message_long_form_at + 1) % 256; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.ask_size_long[quote_replace_message_long_form_at] = (quote_replace_message_long_form_base + 32 + quote_replace_message_long_form_at + 1) % 256; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Replace Message Long Form to the wire, 36 bytes from where the cursor stands */
inline encode_quote_replace_message_long_form(quote_replace_message_long_form_record) {
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> wire[at] = quote_replace_message_long_form_record.nanoseconds[quote_replace_message_long_form_at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> wire[at] = quote_replace_message_long_form_record.original_bid_reference_number_delta[quote_replace_message_long_form_at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> wire[at] = quote_replace_message_long_form_record.bid_reference_number_delta[quote_replace_message_long_form_at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> wire[at] = quote_replace_message_long_form_record.original_ask_reference_number_delta[quote_replace_message_long_form_at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> wire[at] = quote_replace_message_long_form_record.ask_reference_delta_number[quote_replace_message_long_form_at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
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

/* Quote Replace Message Long Form off the wire, 36 bytes from where the cursor stands */
inline decode_quote_replace_message_long_form(quote_replace_message_long_form_record) {
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.nanoseconds[quote_replace_message_long_form_at] = wire[at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.original_bid_reference_number_delta[quote_replace_message_long_form_at] = wire[at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.bid_reference_number_delta[quote_replace_message_long_form_at] = wire[at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.original_ask_reference_number_delta[quote_replace_message_long_form_at] = wire[at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> quote_replace_message_long_form_record.ask_reference_delta_number[quote_replace_message_long_form_at] = wire[at]; at = at + 1; quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
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
  :: quote_replace_message_long_form_at < 4 -> assert(quote_replace_message_long_form_read.nanoseconds[quote_replace_message_long_form_at] == quote_replace_message_long_form_written.nanoseconds[quote_replace_message_long_form_at]); quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> assert(quote_replace_message_long_form_read.original_bid_reference_number_delta[quote_replace_message_long_form_at] == quote_replace_message_long_form_written.original_bid_reference_number_delta[quote_replace_message_long_form_at]); quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> assert(quote_replace_message_long_form_read.bid_reference_number_delta[quote_replace_message_long_form_at] == quote_replace_message_long_form_written.bid_reference_number_delta[quote_replace_message_long_form_at]); quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> assert(quote_replace_message_long_form_read.original_ask_reference_number_delta[quote_replace_message_long_form_at] == quote_replace_message_long_form_written.original_ask_reference_number_delta[quote_replace_message_long_form_at]); quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
  :: else -> break
  od;
  quote_replace_message_long_form_at = 0;
  do
  :: quote_replace_message_long_form_at < 4 -> assert(quote_replace_message_long_form_read.ask_reference_delta_number[quote_replace_message_long_form_at] == quote_replace_message_long_form_written.ask_reference_delta_number[quote_replace_message_long_form_at]); quote_replace_message_long_form_at = quote_replace_message_long_form_at + 1
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

/* ---- Quote Delete Message: 12 bytes ------------------------------------------ */

/* Sent when a single quote is being cancelled. All remaining contracts are no longer accessible so the quote should be removed from the book. */
typedef QuoteDeleteMessage {
  byte nanoseconds[4];
  byte bid_reference_number_delta[4];
  byte ask_reference_number_delta[4]
};

int quote_delete_message_at;

/* every byte of Quote Delete Message set to one value */
inline fill_quote_delete_message(quote_delete_message_record, quote_delete_message_value) {
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 4 -> quote_delete_message_record.nanoseconds[quote_delete_message_at] = quote_delete_message_value; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 4 -> quote_delete_message_record.bid_reference_number_delta[quote_delete_message_at] = quote_delete_message_value; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 4 -> quote_delete_message_record.ask_reference_number_delta[quote_delete_message_at] = quote_delete_message_value; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Delete Message set to where it lies, so a field read out of place says so */
inline ramp_quote_delete_message(quote_delete_message_record, quote_delete_message_base) {
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 4 -> quote_delete_message_record.nanoseconds[quote_delete_message_at] = (quote_delete_message_base + 0 + quote_delete_message_at + 1) % 256; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 4 -> quote_delete_message_record.bid_reference_number_delta[quote_delete_message_at] = (quote_delete_message_base + 4 + quote_delete_message_at + 1) % 256; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 4 -> quote_delete_message_record.ask_reference_number_delta[quote_delete_message_at] = (quote_delete_message_base + 8 + quote_delete_message_at + 1) % 256; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Delete Message to the wire, 12 bytes from where the cursor stands */
inline encode_quote_delete_message(quote_delete_message_record) {
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 4 -> wire[at] = quote_delete_message_record.nanoseconds[quote_delete_message_at]; at = at + 1; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 4 -> wire[at] = quote_delete_message_record.bid_reference_number_delta[quote_delete_message_at]; at = at + 1; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 4 -> wire[at] = quote_delete_message_record.ask_reference_number_delta[quote_delete_message_at]; at = at + 1; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Delete Message off the wire, 12 bytes from where the cursor stands */
inline decode_quote_delete_message(quote_delete_message_record) {
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 4 -> quote_delete_message_record.nanoseconds[quote_delete_message_at] = wire[at]; at = at + 1; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 4 -> quote_delete_message_record.bid_reference_number_delta[quote_delete_message_at] = wire[at]; at = at + 1; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 4 -> quote_delete_message_record.ask_reference_number_delta[quote_delete_message_at] = wire[at]; at = at + 1; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Delete Message is what was written, byte for byte */
inline equal_quote_delete_message(quote_delete_message_read, quote_delete_message_written) {
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 4 -> assert(quote_delete_message_read.nanoseconds[quote_delete_message_at] == quote_delete_message_written.nanoseconds[quote_delete_message_at]); quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 4 -> assert(quote_delete_message_read.bid_reference_number_delta[quote_delete_message_at] == quote_delete_message_written.bid_reference_number_delta[quote_delete_message_at]); quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 4 -> assert(quote_delete_message_read.ask_reference_number_delta[quote_delete_message_at] == quote_delete_message_written.ask_reference_number_delta[quote_delete_message_at]); quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Options Trade Non Auction Message: 25 bytes ----------------------------- */

/* Provides execution details for normal match events involving non displayable order types, for which no Add Order or Add Quote message is generated. Auction events are reported separately by the Options Cross Trade message. */
typedef OptionsTradeNonAuctionMessage {
  byte nanoseconds[4];
  byte buy_sell_indicator;
  byte option_id[4];
  byte cross_number[4];
  byte match_number[4];
  byte price_long[4];
  byte volume_long[4]
};

int options_trade_non_auction_message_at;

/* every byte of Options Trade Non Auction Message set to one value */
inline fill_options_trade_non_auction_message(options_trade_non_auction_message_record, options_trade_non_auction_message_value) {
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> options_trade_non_auction_message_record.nanoseconds[options_trade_non_auction_message_at] = options_trade_non_auction_message_value; options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  options_trade_non_auction_message_record.buy_sell_indicator = options_trade_non_auction_message_value;
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> options_trade_non_auction_message_record.option_id[options_trade_non_auction_message_at] = options_trade_non_auction_message_value; options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> options_trade_non_auction_message_record.cross_number[options_trade_non_auction_message_at] = options_trade_non_auction_message_value; options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> options_trade_non_auction_message_record.match_number[options_trade_non_auction_message_at] = options_trade_non_auction_message_value; options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> options_trade_non_auction_message_record.price_long[options_trade_non_auction_message_at] = options_trade_non_auction_message_value; options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> options_trade_non_auction_message_record.volume_long[options_trade_non_auction_message_at] = options_trade_non_auction_message_value; options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Options Trade Non Auction Message set to where it lies, so a field read out of place says so */
inline ramp_options_trade_non_auction_message(options_trade_non_auction_message_record, options_trade_non_auction_message_base) {
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> options_trade_non_auction_message_record.nanoseconds[options_trade_non_auction_message_at] = (options_trade_non_auction_message_base + 0 + options_trade_non_auction_message_at + 1) % 256; options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  options_trade_non_auction_message_record.buy_sell_indicator = (options_trade_non_auction_message_base + 4 + 1) % 256;
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> options_trade_non_auction_message_record.option_id[options_trade_non_auction_message_at] = (options_trade_non_auction_message_base + 5 + options_trade_non_auction_message_at + 1) % 256; options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> options_trade_non_auction_message_record.cross_number[options_trade_non_auction_message_at] = (options_trade_non_auction_message_base + 9 + options_trade_non_auction_message_at + 1) % 256; options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> options_trade_non_auction_message_record.match_number[options_trade_non_auction_message_at] = (options_trade_non_auction_message_base + 13 + options_trade_non_auction_message_at + 1) % 256; options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> options_trade_non_auction_message_record.price_long[options_trade_non_auction_message_at] = (options_trade_non_auction_message_base + 17 + options_trade_non_auction_message_at + 1) % 256; options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> options_trade_non_auction_message_record.volume_long[options_trade_non_auction_message_at] = (options_trade_non_auction_message_base + 21 + options_trade_non_auction_message_at + 1) % 256; options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Options Trade Non Auction Message to the wire, 25 bytes from where the cursor stands */
inline encode_options_trade_non_auction_message(options_trade_non_auction_message_record) {
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> wire[at] = options_trade_non_auction_message_record.nanoseconds[options_trade_non_auction_message_at]; at = at + 1; options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  wire[at] = options_trade_non_auction_message_record.buy_sell_indicator; at = at + 1;
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> wire[at] = options_trade_non_auction_message_record.option_id[options_trade_non_auction_message_at]; at = at + 1; options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> wire[at] = options_trade_non_auction_message_record.cross_number[options_trade_non_auction_message_at]; at = at + 1; options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> wire[at] = options_trade_non_auction_message_record.match_number[options_trade_non_auction_message_at]; at = at + 1; options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> wire[at] = options_trade_non_auction_message_record.price_long[options_trade_non_auction_message_at]; at = at + 1; options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> wire[at] = options_trade_non_auction_message_record.volume_long[options_trade_non_auction_message_at]; at = at + 1; options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Options Trade Non Auction Message off the wire, 25 bytes from where the cursor stands */
inline decode_options_trade_non_auction_message(options_trade_non_auction_message_record) {
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> options_trade_non_auction_message_record.nanoseconds[options_trade_non_auction_message_at] = wire[at]; at = at + 1; options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  options_trade_non_auction_message_record.buy_sell_indicator = wire[at]; at = at + 1;
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> options_trade_non_auction_message_record.option_id[options_trade_non_auction_message_at] = wire[at]; at = at + 1; options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> options_trade_non_auction_message_record.cross_number[options_trade_non_auction_message_at] = wire[at]; at = at + 1; options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> options_trade_non_auction_message_record.match_number[options_trade_non_auction_message_at] = wire[at]; at = at + 1; options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> options_trade_non_auction_message_record.price_long[options_trade_non_auction_message_at] = wire[at]; at = at + 1; options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> options_trade_non_auction_message_record.volume_long[options_trade_non_auction_message_at] = wire[at]; at = at + 1; options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Options Trade Non Auction Message is what was written, byte for byte */
inline equal_options_trade_non_auction_message(options_trade_non_auction_message_read, options_trade_non_auction_message_written) {
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> assert(options_trade_non_auction_message_read.nanoseconds[options_trade_non_auction_message_at] == options_trade_non_auction_message_written.nanoseconds[options_trade_non_auction_message_at]); options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  assert(options_trade_non_auction_message_read.buy_sell_indicator == options_trade_non_auction_message_written.buy_sell_indicator);
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> assert(options_trade_non_auction_message_read.option_id[options_trade_non_auction_message_at] == options_trade_non_auction_message_written.option_id[options_trade_non_auction_message_at]); options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> assert(options_trade_non_auction_message_read.cross_number[options_trade_non_auction_message_at] == options_trade_non_auction_message_written.cross_number[options_trade_non_auction_message_at]); options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> assert(options_trade_non_auction_message_read.match_number[options_trade_non_auction_message_at] == options_trade_non_auction_message_written.match_number[options_trade_non_auction_message_at]); options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> assert(options_trade_non_auction_message_read.price_long[options_trade_non_auction_message_at] == options_trade_non_auction_message_written.price_long[options_trade_non_auction_message_at]); options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  options_trade_non_auction_message_at = 0;
  do
  :: options_trade_non_auction_message_at < 4 -> assert(options_trade_non_auction_message_read.volume_long[options_trade_non_auction_message_at] == options_trade_non_auction_message_written.volume_long[options_trade_non_auction_message_at]); options_trade_non_auction_message_at = options_trade_non_auction_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Options Cross Trade Message: 25 bytes ----------------------------------- */

/* Sent for every option when an auction in that option is completed, indicating the bulk volume associated with the auction event. Also used to report all executions within a price improvement (PRISM) auction. To avoid double counting of auction volume, firms should not include transactions marked as auction trades. */
typedef OptionsCrossTradeMessage {
  byte nanoseconds[4];
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
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.nanoseconds[options_cross_trade_message_at] = options_cross_trade_message_value; options_cross_trade_message_at = options_cross_trade_message_at + 1
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
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.nanoseconds[options_cross_trade_message_at] = (options_cross_trade_message_base + 0 + options_cross_trade_message_at + 1) % 256; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.option_id[options_cross_trade_message_at] = (options_cross_trade_message_base + 4 + options_cross_trade_message_at + 1) % 256; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.cross_number[options_cross_trade_message_at] = (options_cross_trade_message_base + 8 + options_cross_trade_message_at + 1) % 256; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.match_number[options_cross_trade_message_at] = (options_cross_trade_message_base + 12 + options_cross_trade_message_at + 1) % 256; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_record.cross_type = (options_cross_trade_message_base + 16 + 1) % 256;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.price_long[options_cross_trade_message_at] = (options_cross_trade_message_base + 17 + options_cross_trade_message_at + 1) % 256; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.volume_long[options_cross_trade_message_at] = (options_cross_trade_message_base + 21 + options_cross_trade_message_at + 1) % 256; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Options Cross Trade Message to the wire, 25 bytes from where the cursor stands */
inline encode_options_cross_trade_message(options_cross_trade_message_record) {
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> wire[at] = options_cross_trade_message_record.nanoseconds[options_cross_trade_message_at]; at = at + 1; options_cross_trade_message_at = options_cross_trade_message_at + 1
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

/* Options Cross Trade Message off the wire, 25 bytes from where the cursor stands */
inline decode_options_cross_trade_message(options_cross_trade_message_record) {
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.nanoseconds[options_cross_trade_message_at] = wire[at]; at = at + 1; options_cross_trade_message_at = options_cross_trade_message_at + 1
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
  :: options_cross_trade_message_at < 4 -> assert(options_cross_trade_message_read.nanoseconds[options_cross_trade_message_at] == options_cross_trade_message_written.nanoseconds[options_cross_trade_message_at]); options_cross_trade_message_at = options_cross_trade_message_at + 1
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

/* ---- Broken Trade Or Order Execution Message: 12 bytes ----------------------- */

/* Sent whenever an execution on Nasdaq is broken, which may happen if it is found to be clearly erroneous pursuant to the Nasdaq Clearly Erroneous Policy. A trade break is final; once a trade is broken it cannot be reinstated. */
typedef BrokenTradeOrOrderExecutionMessage {
  byte nanoseconds[4];
  byte cross_number[4];
  byte match_number[4]
};

int broken_trade_or_order_execution_message_at;

/* every byte of Broken Trade Or Order Execution Message set to one value */
inline fill_broken_trade_or_order_execution_message(broken_trade_or_order_execution_message_record, broken_trade_or_order_execution_message_value) {
  broken_trade_or_order_execution_message_at = 0;
  do
  :: broken_trade_or_order_execution_message_at < 4 -> broken_trade_or_order_execution_message_record.nanoseconds[broken_trade_or_order_execution_message_at] = broken_trade_or_order_execution_message_value; broken_trade_or_order_execution_message_at = broken_trade_or_order_execution_message_at + 1
  :: else -> break
  od;
  broken_trade_or_order_execution_message_at = 0;
  do
  :: broken_trade_or_order_execution_message_at < 4 -> broken_trade_or_order_execution_message_record.cross_number[broken_trade_or_order_execution_message_at] = broken_trade_or_order_execution_message_value; broken_trade_or_order_execution_message_at = broken_trade_or_order_execution_message_at + 1
  :: else -> break
  od;
  broken_trade_or_order_execution_message_at = 0;
  do
  :: broken_trade_or_order_execution_message_at < 4 -> broken_trade_or_order_execution_message_record.match_number[broken_trade_or_order_execution_message_at] = broken_trade_or_order_execution_message_value; broken_trade_or_order_execution_message_at = broken_trade_or_order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Broken Trade Or Order Execution Message set to where it lies, so a field read out of place says so */
inline ramp_broken_trade_or_order_execution_message(broken_trade_or_order_execution_message_record, broken_trade_or_order_execution_message_base) {
  broken_trade_or_order_execution_message_at = 0;
  do
  :: broken_trade_or_order_execution_message_at < 4 -> broken_trade_or_order_execution_message_record.nanoseconds[broken_trade_or_order_execution_message_at] = (broken_trade_or_order_execution_message_base + 0 + broken_trade_or_order_execution_message_at + 1) % 256; broken_trade_or_order_execution_message_at = broken_trade_or_order_execution_message_at + 1
  :: else -> break
  od;
  broken_trade_or_order_execution_message_at = 0;
  do
  :: broken_trade_or_order_execution_message_at < 4 -> broken_trade_or_order_execution_message_record.cross_number[broken_trade_or_order_execution_message_at] = (broken_trade_or_order_execution_message_base + 4 + broken_trade_or_order_execution_message_at + 1) % 256; broken_trade_or_order_execution_message_at = broken_trade_or_order_execution_message_at + 1
  :: else -> break
  od;
  broken_trade_or_order_execution_message_at = 0;
  do
  :: broken_trade_or_order_execution_message_at < 4 -> broken_trade_or_order_execution_message_record.match_number[broken_trade_or_order_execution_message_at] = (broken_trade_or_order_execution_message_base + 8 + broken_trade_or_order_execution_message_at + 1) % 256; broken_trade_or_order_execution_message_at = broken_trade_or_order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Broken Trade Or Order Execution Message to the wire, 12 bytes from where the cursor stands */
inline encode_broken_trade_or_order_execution_message(broken_trade_or_order_execution_message_record) {
  broken_trade_or_order_execution_message_at = 0;
  do
  :: broken_trade_or_order_execution_message_at < 4 -> wire[at] = broken_trade_or_order_execution_message_record.nanoseconds[broken_trade_or_order_execution_message_at]; at = at + 1; broken_trade_or_order_execution_message_at = broken_trade_or_order_execution_message_at + 1
  :: else -> break
  od;
  broken_trade_or_order_execution_message_at = 0;
  do
  :: broken_trade_or_order_execution_message_at < 4 -> wire[at] = broken_trade_or_order_execution_message_record.cross_number[broken_trade_or_order_execution_message_at]; at = at + 1; broken_trade_or_order_execution_message_at = broken_trade_or_order_execution_message_at + 1
  :: else -> break
  od;
  broken_trade_or_order_execution_message_at = 0;
  do
  :: broken_trade_or_order_execution_message_at < 4 -> wire[at] = broken_trade_or_order_execution_message_record.match_number[broken_trade_or_order_execution_message_at]; at = at + 1; broken_trade_or_order_execution_message_at = broken_trade_or_order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Broken Trade Or Order Execution Message off the wire, 12 bytes from where the cursor stands */
inline decode_broken_trade_or_order_execution_message(broken_trade_or_order_execution_message_record) {
  broken_trade_or_order_execution_message_at = 0;
  do
  :: broken_trade_or_order_execution_message_at < 4 -> broken_trade_or_order_execution_message_record.nanoseconds[broken_trade_or_order_execution_message_at] = wire[at]; at = at + 1; broken_trade_or_order_execution_message_at = broken_trade_or_order_execution_message_at + 1
  :: else -> break
  od;
  broken_trade_or_order_execution_message_at = 0;
  do
  :: broken_trade_or_order_execution_message_at < 4 -> broken_trade_or_order_execution_message_record.cross_number[broken_trade_or_order_execution_message_at] = wire[at]; at = at + 1; broken_trade_or_order_execution_message_at = broken_trade_or_order_execution_message_at + 1
  :: else -> break
  od;
  broken_trade_or_order_execution_message_at = 0;
  do
  :: broken_trade_or_order_execution_message_at < 4 -> broken_trade_or_order_execution_message_record.match_number[broken_trade_or_order_execution_message_at] = wire[at]; at = at + 1; broken_trade_or_order_execution_message_at = broken_trade_or_order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Broken Trade Or Order Execution Message is what was written, byte for byte */
inline equal_broken_trade_or_order_execution_message(broken_trade_or_order_execution_message_read, broken_trade_or_order_execution_message_written) {
  broken_trade_or_order_execution_message_at = 0;
  do
  :: broken_trade_or_order_execution_message_at < 4 -> assert(broken_trade_or_order_execution_message_read.nanoseconds[broken_trade_or_order_execution_message_at] == broken_trade_or_order_execution_message_written.nanoseconds[broken_trade_or_order_execution_message_at]); broken_trade_or_order_execution_message_at = broken_trade_or_order_execution_message_at + 1
  :: else -> break
  od;
  broken_trade_or_order_execution_message_at = 0;
  do
  :: broken_trade_or_order_execution_message_at < 4 -> assert(broken_trade_or_order_execution_message_read.cross_number[broken_trade_or_order_execution_message_at] == broken_trade_or_order_execution_message_written.cross_number[broken_trade_or_order_execution_message_at]); broken_trade_or_order_execution_message_at = broken_trade_or_order_execution_message_at + 1
  :: else -> break
  od;
  broken_trade_or_order_execution_message_at = 0;
  do
  :: broken_trade_or_order_execution_message_at < 4 -> assert(broken_trade_or_order_execution_message_read.match_number[broken_trade_or_order_execution_message_at] == broken_trade_or_order_execution_message_written.match_number[broken_trade_or_order_execution_message_at]); broken_trade_or_order_execution_message_at = broken_trade_or_order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Net Order Imbalance Indicator Message: 30 bytes ------------------------- */

/* Nasdaq disseminates Net Order Imbalance Indicator data at five second intervals in the minutes leading up to the Nasdaq Opening Auction events, and for price improvement (PRISM) auctions. */
typedef NetOrderImbalanceIndicatorMessage {
  byte nanoseconds[4];
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

int net_order_imbalance_indicator_message_at;

/* every byte of Net Order Imbalance Indicator Message set to one value */
inline fill_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_record, net_order_imbalance_indicator_message_value) {
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.nanoseconds[net_order_imbalance_indicator_message_at] = net_order_imbalance_indicator_message_value; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.auction_id[net_order_imbalance_indicator_message_at] = net_order_imbalance_indicator_message_value; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_record.auction_type = net_order_imbalance_indicator_message_value;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.paired_contracts[net_order_imbalance_indicator_message_at] = net_order_imbalance_indicator_message_value; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_record.imbalance_direction = net_order_imbalance_indicator_message_value;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.option_id[net_order_imbalance_indicator_message_at] = net_order_imbalance_indicator_message_value; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.imbalance_price[net_order_imbalance_indicator_message_at] = net_order_imbalance_indicator_message_value; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.imbalance_volume[net_order_imbalance_indicator_message_at] = net_order_imbalance_indicator_message_value; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_record.customer_firm_indicator = net_order_imbalance_indicator_message_value;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 3 -> net_order_imbalance_indicator_message_record.reserved_3[net_order_imbalance_indicator_message_at] = net_order_imbalance_indicator_message_value; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Net Order Imbalance Indicator Message set to where it lies, so a field read out of place says so */
inline ramp_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_record, net_order_imbalance_indicator_message_base) {
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.nanoseconds[net_order_imbalance_indicator_message_at] = (net_order_imbalance_indicator_message_base + 0 + net_order_imbalance_indicator_message_at + 1) % 256; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.auction_id[net_order_imbalance_indicator_message_at] = (net_order_imbalance_indicator_message_base + 4 + net_order_imbalance_indicator_message_at + 1) % 256; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_record.auction_type = (net_order_imbalance_indicator_message_base + 8 + 1) % 256;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.paired_contracts[net_order_imbalance_indicator_message_at] = (net_order_imbalance_indicator_message_base + 9 + net_order_imbalance_indicator_message_at + 1) % 256; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_record.imbalance_direction = (net_order_imbalance_indicator_message_base + 13 + 1) % 256;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.option_id[net_order_imbalance_indicator_message_at] = (net_order_imbalance_indicator_message_base + 14 + net_order_imbalance_indicator_message_at + 1) % 256; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.imbalance_price[net_order_imbalance_indicator_message_at] = (net_order_imbalance_indicator_message_base + 18 + net_order_imbalance_indicator_message_at + 1) % 256; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.imbalance_volume[net_order_imbalance_indicator_message_at] = (net_order_imbalance_indicator_message_base + 22 + net_order_imbalance_indicator_message_at + 1) % 256; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_record.customer_firm_indicator = (net_order_imbalance_indicator_message_base + 26 + 1) % 256;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 3 -> net_order_imbalance_indicator_message_record.reserved_3[net_order_imbalance_indicator_message_at] = (net_order_imbalance_indicator_message_base + 27 + net_order_imbalance_indicator_message_at + 1) % 256; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  skip
}

/* Net Order Imbalance Indicator Message to the wire, 30 bytes from where the cursor stands */
inline encode_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_record) {
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> wire[at] = net_order_imbalance_indicator_message_record.nanoseconds[net_order_imbalance_indicator_message_at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> wire[at] = net_order_imbalance_indicator_message_record.auction_id[net_order_imbalance_indicator_message_at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = net_order_imbalance_indicator_message_record.auction_type; at = at + 1;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> wire[at] = net_order_imbalance_indicator_message_record.paired_contracts[net_order_imbalance_indicator_message_at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = net_order_imbalance_indicator_message_record.imbalance_direction; at = at + 1;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> wire[at] = net_order_imbalance_indicator_message_record.option_id[net_order_imbalance_indicator_message_at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> wire[at] = net_order_imbalance_indicator_message_record.imbalance_price[net_order_imbalance_indicator_message_at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> wire[at] = net_order_imbalance_indicator_message_record.imbalance_volume[net_order_imbalance_indicator_message_at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = net_order_imbalance_indicator_message_record.customer_firm_indicator; at = at + 1;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 3 -> wire[at] = net_order_imbalance_indicator_message_record.reserved_3[net_order_imbalance_indicator_message_at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  skip
}

/* Net Order Imbalance Indicator Message off the wire, 30 bytes from where the cursor stands */
inline decode_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_record) {
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.nanoseconds[net_order_imbalance_indicator_message_at] = wire[at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.auction_id[net_order_imbalance_indicator_message_at] = wire[at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_record.auction_type = wire[at]; at = at + 1;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.paired_contracts[net_order_imbalance_indicator_message_at] = wire[at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_record.imbalance_direction = wire[at]; at = at + 1;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.option_id[net_order_imbalance_indicator_message_at] = wire[at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.imbalance_price[net_order_imbalance_indicator_message_at] = wire[at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.imbalance_volume[net_order_imbalance_indicator_message_at] = wire[at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_record.customer_firm_indicator = wire[at]; at = at + 1;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 3 -> net_order_imbalance_indicator_message_record.reserved_3[net_order_imbalance_indicator_message_at] = wire[at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Net Order Imbalance Indicator Message is what was written, byte for byte */
inline equal_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_read, net_order_imbalance_indicator_message_written) {
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> assert(net_order_imbalance_indicator_message_read.nanoseconds[net_order_imbalance_indicator_message_at] == net_order_imbalance_indicator_message_written.nanoseconds[net_order_imbalance_indicator_message_at]); net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> assert(net_order_imbalance_indicator_message_read.auction_id[net_order_imbalance_indicator_message_at] == net_order_imbalance_indicator_message_written.auction_id[net_order_imbalance_indicator_message_at]); net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  assert(net_order_imbalance_indicator_message_read.auction_type == net_order_imbalance_indicator_message_written.auction_type);
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> assert(net_order_imbalance_indicator_message_read.paired_contracts[net_order_imbalance_indicator_message_at] == net_order_imbalance_indicator_message_written.paired_contracts[net_order_imbalance_indicator_message_at]); net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  assert(net_order_imbalance_indicator_message_read.imbalance_direction == net_order_imbalance_indicator_message_written.imbalance_direction);
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> assert(net_order_imbalance_indicator_message_read.option_id[net_order_imbalance_indicator_message_at] == net_order_imbalance_indicator_message_written.option_id[net_order_imbalance_indicator_message_at]); net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> assert(net_order_imbalance_indicator_message_read.imbalance_price[net_order_imbalance_indicator_message_at] == net_order_imbalance_indicator_message_written.imbalance_price[net_order_imbalance_indicator_message_at]); net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> assert(net_order_imbalance_indicator_message_read.imbalance_volume[net_order_imbalance_indicator_message_at] == net_order_imbalance_indicator_message_written.imbalance_volume[net_order_imbalance_indicator_message_at]); net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  assert(net_order_imbalance_indicator_message_read.customer_firm_indicator == net_order_imbalance_indicator_message_written.customer_firm_indicator);
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 3 -> assert(net_order_imbalance_indicator_message_read.reserved_3[net_order_imbalance_indicator_message_at] == net_order_imbalance_indicator_message_written.reserved_3[net_order_imbalance_indicator_message_at]); net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
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
    assert(at == 5);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 5);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Base Reference Message: encoded, read back, and compared */
proctype check_base_reference_message() {
  BaseReferenceMessage base_reference_message_sent;
  BaseReferenceMessage base_reference_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_base_reference_message(base_reference_message_sent, 0)
  :: pattern == 1 -> fill_base_reference_message(base_reference_message_sent, 32)
  :: pattern == 2 -> fill_base_reference_message(base_reference_message_sent, 255)
  :: else -> ramp_base_reference_message(base_reference_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_base_reference_message(base_reference_message_sent);
    assert(at == 12);
    at = 0;
    decode_base_reference_message(base_reference_message_got);
    assert(at == 12);
    equal_base_reference_message(base_reference_message_got, base_reference_message_sent)
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

/* Options Trading Action Message: encoded, read back, and compared */
proctype check_options_trading_action_message() {
  OptionsTradingActionMessage options_trading_action_message_sent;
  OptionsTradingActionMessage options_trading_action_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_options_trading_action_message(options_trading_action_message_sent, 0)
  :: pattern == 1 -> fill_options_trading_action_message(options_trading_action_message_sent, 32)
  :: pattern == 2 -> fill_options_trading_action_message(options_trading_action_message_sent, 255)
  :: else -> ramp_options_trading_action_message(options_trading_action_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_options_trading_action_message(options_trading_action_message_sent);
    assert(at == 9);
    at = 0;
    decode_options_trading_action_message(options_trading_action_message_got);
    assert(at == 9);
    equal_options_trading_action_message(options_trading_action_message_got, options_trading_action_message_sent)
  }
}

/* Option Open Message: encoded, read back, and compared */
proctype check_option_open_message() {
  OptionOpenMessage option_open_message_sent;
  OptionOpenMessage option_open_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_option_open_message(option_open_message_sent, 0)
  :: pattern == 1 -> fill_option_open_message(option_open_message_sent, 32)
  :: pattern == 2 -> fill_option_open_message(option_open_message_sent, 255)
  :: else -> ramp_option_open_message(option_open_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_option_open_message(option_open_message_sent);
    assert(at == 9);
    at = 0;
    decode_option_open_message(option_open_message_got);
    assert(at == 9);
    equal_option_open_message(option_open_message_got, option_open_message_sent)
  }
}

/* Add Order Message Short Form: encoded, read back, and compared */
proctype check_add_order_message_short_form() {
  AddOrderMessageShortForm add_order_message_short_form_sent;
  AddOrderMessageShortForm add_order_message_short_form_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_message_short_form(add_order_message_short_form_sent, 0)
  :: pattern == 1 -> fill_add_order_message_short_form(add_order_message_short_form_sent, 32)
  :: pattern == 2 -> fill_add_order_message_short_form(add_order_message_short_form_sent, 255)
  :: else -> ramp_add_order_message_short_form(add_order_message_short_form_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_message_short_form(add_order_message_short_form_sent);
    assert(at == 17);
    at = 0;
    decode_add_order_message_short_form(add_order_message_short_form_got);
    assert(at == 17);
    equal_add_order_message_short_form(add_order_message_short_form_got, add_order_message_short_form_sent)
  }
}

/* Add Order Message Long Form: encoded, read back, and compared */
proctype check_add_order_message_long_form() {
  AddOrderMessageLongForm add_order_message_long_form_sent;
  AddOrderMessageLongForm add_order_message_long_form_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_message_long_form(add_order_message_long_form_sent, 0)
  :: pattern == 1 -> fill_add_order_message_long_form(add_order_message_long_form_sent, 32)
  :: pattern == 2 -> fill_add_order_message_long_form(add_order_message_long_form_sent, 255)
  :: else -> ramp_add_order_message_long_form(add_order_message_long_form_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_message_long_form(add_order_message_long_form_sent);
    assert(at == 21);
    at = 0;
    decode_add_order_message_long_form(add_order_message_long_form_got);
    assert(at == 21);
    equal_add_order_message_long_form(add_order_message_long_form_got, add_order_message_long_form_sent)
  }
}

/* Add Quote Message Short Form: encoded, read back, and compared */
proctype check_add_quote_message_short_form() {
  AddQuoteMessageShortForm add_quote_message_short_form_sent;
  AddQuoteMessageShortForm add_quote_message_short_form_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_quote_message_short_form(add_quote_message_short_form_sent, 0)
  :: pattern == 1 -> fill_add_quote_message_short_form(add_quote_message_short_form_sent, 32)
  :: pattern == 2 -> fill_add_quote_message_short_form(add_quote_message_short_form_sent, 255)
  :: else -> ramp_add_quote_message_short_form(add_quote_message_short_form_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_quote_message_short_form(add_quote_message_short_form_sent);
    assert(at == 24);
    at = 0;
    decode_add_quote_message_short_form(add_quote_message_short_form_got);
    assert(at == 24);
    equal_add_quote_message_short_form(add_quote_message_short_form_got, add_quote_message_short_form_sent)
  }
}

/* Add Quote Message Long Form: encoded, read back, and compared */
proctype check_add_quote_message_long_form() {
  AddQuoteMessageLongForm add_quote_message_long_form_sent;
  AddQuoteMessageLongForm add_quote_message_long_form_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_quote_message_long_form(add_quote_message_long_form_sent, 0)
  :: pattern == 1 -> fill_add_quote_message_long_form(add_quote_message_long_form_sent, 32)
  :: pattern == 2 -> fill_add_quote_message_long_form(add_quote_message_long_form_sent, 255)
  :: else -> ramp_add_quote_message_long_form(add_quote_message_long_form_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_quote_message_long_form(add_quote_message_long_form_sent);
    assert(at == 32);
    at = 0;
    decode_add_quote_message_long_form(add_quote_message_long_form_got);
    assert(at == 32);
    equal_add_quote_message_long_form(add_quote_message_long_form_got, add_quote_message_long_form_sent)
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
    assert(at == 20);
    at = 0;
    decode_single_side_executed_message(single_side_executed_message_got);
    assert(at == 20);
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
    assert(at == 25);
    at = 0;
    decode_single_side_executed_with_price_message(single_side_executed_with_price_message_got);
    assert(at == 25);
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
    assert(at == 12);
    at = 0;
    decode_order_cancel_message(order_cancel_message_got);
    assert(at == 12);
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
    assert(at == 16);
    at = 0;
    decode_single_side_replace_message_short_form(single_side_replace_message_short_form_got);
    assert(at == 16);
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
    assert(at == 20);
    at = 0;
    decode_single_side_replace_message_long_form(single_side_replace_message_long_form_got);
    assert(at == 20);
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
    assert(at == 8);
    at = 0;
    decode_single_side_delete_message(single_side_delete_message_got);
    assert(at == 8);
    equal_single_side_delete_message(single_side_delete_message_got, single_side_delete_message_sent)
  }
}

/* Single Side Update Message: encoded, read back, and compared */
proctype check_single_side_update_message() {
  SingleSideUpdateMessage single_side_update_message_sent;
  SingleSideUpdateMessage single_side_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_side_update_message(single_side_update_message_sent, 0)
  :: pattern == 1 -> fill_single_side_update_message(single_side_update_message_sent, 32)
  :: pattern == 2 -> fill_single_side_update_message(single_side_update_message_sent, 255)
  :: else -> ramp_single_side_update_message(single_side_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_side_update_message(single_side_update_message_sent);
    assert(at == 17);
    at = 0;
    decode_single_side_update_message(single_side_update_message_got);
    assert(at == 17);
    equal_single_side_update_message(single_side_update_message_got, single_side_update_message_sent)
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
    assert(at == 28);
    at = 0;
    decode_quote_replace_message_short_form(quote_replace_message_short_form_got);
    assert(at == 28);
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
    assert(at == 36);
    at = 0;
    decode_quote_replace_message_long_form(quote_replace_message_long_form_got);
    assert(at == 36);
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
    assert(at == 12);
    at = 0;
    decode_quote_delete_message(quote_delete_message_got);
    assert(at == 12);
    equal_quote_delete_message(quote_delete_message_got, quote_delete_message_sent)
  }
}

/* Options Trade Non Auction Message: encoded, read back, and compared */
proctype check_options_trade_non_auction_message() {
  OptionsTradeNonAuctionMessage options_trade_non_auction_message_sent;
  OptionsTradeNonAuctionMessage options_trade_non_auction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_options_trade_non_auction_message(options_trade_non_auction_message_sent, 0)
  :: pattern == 1 -> fill_options_trade_non_auction_message(options_trade_non_auction_message_sent, 32)
  :: pattern == 2 -> fill_options_trade_non_auction_message(options_trade_non_auction_message_sent, 255)
  :: else -> ramp_options_trade_non_auction_message(options_trade_non_auction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_options_trade_non_auction_message(options_trade_non_auction_message_sent);
    assert(at == 25);
    at = 0;
    decode_options_trade_non_auction_message(options_trade_non_auction_message_got);
    assert(at == 25);
    equal_options_trade_non_auction_message(options_trade_non_auction_message_got, options_trade_non_auction_message_sent)
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
    assert(at == 25);
    at = 0;
    decode_options_cross_trade_message(options_cross_trade_message_got);
    assert(at == 25);
    equal_options_cross_trade_message(options_cross_trade_message_got, options_cross_trade_message_sent)
  }
}

/* Broken Trade Or Order Execution Message: encoded, read back, and compared */
proctype check_broken_trade_or_order_execution_message() {
  BrokenTradeOrOrderExecutionMessage broken_trade_or_order_execution_message_sent;
  BrokenTradeOrOrderExecutionMessage broken_trade_or_order_execution_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_broken_trade_or_order_execution_message(broken_trade_or_order_execution_message_sent, 0)
  :: pattern == 1 -> fill_broken_trade_or_order_execution_message(broken_trade_or_order_execution_message_sent, 32)
  :: pattern == 2 -> fill_broken_trade_or_order_execution_message(broken_trade_or_order_execution_message_sent, 255)
  :: else -> ramp_broken_trade_or_order_execution_message(broken_trade_or_order_execution_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_broken_trade_or_order_execution_message(broken_trade_or_order_execution_message_sent);
    assert(at == 12);
    at = 0;
    decode_broken_trade_or_order_execution_message(broken_trade_or_order_execution_message_got);
    assert(at == 12);
    equal_broken_trade_or_order_execution_message(broken_trade_or_order_execution_message_got, broken_trade_or_order_execution_message_sent)
  }
}

/* Net Order Imbalance Indicator Message: encoded, read back, and compared */
proctype check_net_order_imbalance_indicator_message() {
  NetOrderImbalanceIndicatorMessage net_order_imbalance_indicator_message_sent;
  NetOrderImbalanceIndicatorMessage net_order_imbalance_indicator_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_sent, 0)
  :: pattern == 1 -> fill_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_sent, 32)
  :: pattern == 2 -> fill_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_sent, 255)
  :: else -> ramp_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_sent);
    assert(at == 30);
    at = 0;
    decode_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_got);
    assert(at == 30);
    equal_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_got, net_order_imbalance_indicator_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_seconds_message()
  :: run check_system_event_message()
  :: run check_base_reference_message()
  :: run check_options_directory_message()
  :: run check_options_trading_action_message()
  :: run check_option_open_message()
  :: run check_add_order_message_short_form()
  :: run check_add_order_message_long_form()
  :: run check_add_quote_message_short_form()
  :: run check_add_quote_message_long_form()
  :: run check_single_side_executed_message()
  :: run check_single_side_executed_with_price_message()
  :: run check_order_cancel_message()
  :: run check_single_side_replace_message_short_form()
  :: run check_single_side_replace_message_long_form()
  :: run check_single_side_delete_message()
  :: run check_single_side_update_message()
  :: run check_quote_replace_message_short_form()
  :: run check_quote_replace_message_long_form()
  :: run check_quote_delete_message()
  :: run check_options_trade_non_auction_message()
  :: run check_options_cross_trade_message()
  :: run check_broken_trade_or_order_execution_message()
  :: run check_net_order_imbalance_indicator_message()
  fi
}
