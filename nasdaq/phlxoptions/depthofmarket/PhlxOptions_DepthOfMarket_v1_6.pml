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

/* This message is sent every second for which at least one PHLX Depth message is being generated. */
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

/* This message indicates the base reference number to which all the order/quote/trade reference number deltas must be added to obtain the absolute order/quote PHLX reference number. */
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

/* ---- Option Directory Message: 39 bytes -------------------------------------- */

/* At the start of each trading day, the options system disseminates option symbol directory messages for all active option symbols in the PHLX ® options system. */
typedef OptionDirectoryMessage {
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

int option_directory_message_at;

/* every byte of Option Directory Message set to one value */
inline fill_option_directory_message(option_directory_message_record, option_directory_message_value) {
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 4 -> option_directory_message_record.nanoseconds[option_directory_message_at] = option_directory_message_value; option_directory_message_at = option_directory_message_at + 1
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
  option_directory_message_record.expiration_date = option_directory_message_value;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 4 -> option_directory_message_record.explicit_strike_price[option_directory_message_at] = option_directory_message_value; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_record.option_type = option_directory_message_value;
  option_directory_message_record.source = option_directory_message_value;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 13 -> option_directory_message_record.underlying_symbol[option_directory_message_at] = option_directory_message_value; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_record.options_closing_type = option_directory_message_value;
  option_directory_message_record.tradable = option_directory_message_value;
  option_directory_message_record.mpv = option_directory_message_value;
  skip
}

/* each byte of Option Directory Message set to where it lies, so a field read out of place says so */
inline ramp_option_directory_message(option_directory_message_record, option_directory_message_base) {
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 4 -> option_directory_message_record.nanoseconds[option_directory_message_at] = (option_directory_message_base + 0 + option_directory_message_at + 1) % 256; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 4 -> option_directory_message_record.option_id[option_directory_message_at] = (option_directory_message_base + 4 + option_directory_message_at + 1) % 256; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 6 -> option_directory_message_record.security_symbol[option_directory_message_at] = (option_directory_message_base + 8 + option_directory_message_at + 1) % 256; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_record.expiration_year = (option_directory_message_base + 14 + 1) % 256;
  option_directory_message_record.expiration_month = (option_directory_message_base + 15 + 1) % 256;
  option_directory_message_record.expiration_date = (option_directory_message_base + 16 + 1) % 256;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 4 -> option_directory_message_record.explicit_strike_price[option_directory_message_at] = (option_directory_message_base + 17 + option_directory_message_at + 1) % 256; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_record.option_type = (option_directory_message_base + 21 + 1) % 256;
  option_directory_message_record.source = (option_directory_message_base + 22 + 1) % 256;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 13 -> option_directory_message_record.underlying_symbol[option_directory_message_at] = (option_directory_message_base + 23 + option_directory_message_at + 1) % 256; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_record.options_closing_type = (option_directory_message_base + 36 + 1) % 256;
  option_directory_message_record.tradable = (option_directory_message_base + 37 + 1) % 256;
  option_directory_message_record.mpv = (option_directory_message_base + 38 + 1) % 256;
  skip
}

/* Option Directory Message to the wire, 39 bytes from where the cursor stands */
inline encode_option_directory_message(option_directory_message_record) {
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 4 -> wire[at] = option_directory_message_record.nanoseconds[option_directory_message_at]; at = at + 1; option_directory_message_at = option_directory_message_at + 1
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
  wire[at] = option_directory_message_record.expiration_date; at = at + 1;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 4 -> wire[at] = option_directory_message_record.explicit_strike_price[option_directory_message_at]; at = at + 1; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = option_directory_message_record.option_type; at = at + 1;
  wire[at] = option_directory_message_record.source; at = at + 1;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 13 -> wire[at] = option_directory_message_record.underlying_symbol[option_directory_message_at]; at = at + 1; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = option_directory_message_record.options_closing_type; at = at + 1;
  wire[at] = option_directory_message_record.tradable; at = at + 1;
  wire[at] = option_directory_message_record.mpv; at = at + 1;
  skip
}

/* Option Directory Message off the wire, 39 bytes from where the cursor stands */
inline decode_option_directory_message(option_directory_message_record) {
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 4 -> option_directory_message_record.nanoseconds[option_directory_message_at] = wire[at]; at = at + 1; option_directory_message_at = option_directory_message_at + 1
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
  option_directory_message_record.expiration_date = wire[at]; at = at + 1;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 4 -> option_directory_message_record.explicit_strike_price[option_directory_message_at] = wire[at]; at = at + 1; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_record.option_type = wire[at]; at = at + 1;
  option_directory_message_record.source = wire[at]; at = at + 1;
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 13 -> option_directory_message_record.underlying_symbol[option_directory_message_at] = wire[at]; at = at + 1; option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  option_directory_message_record.options_closing_type = wire[at]; at = at + 1;
  option_directory_message_record.tradable = wire[at]; at = at + 1;
  option_directory_message_record.mpv = wire[at]; at = at + 1;
  skip
}

/* what was read of Option Directory Message is what was written, byte for byte */
inline equal_option_directory_message(option_directory_message_read, option_directory_message_written) {
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 4 -> assert(option_directory_message_read.nanoseconds[option_directory_message_at] == option_directory_message_written.nanoseconds[option_directory_message_at]); option_directory_message_at = option_directory_message_at + 1
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
  assert(option_directory_message_read.expiration_date == option_directory_message_written.expiration_date);
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 4 -> assert(option_directory_message_read.explicit_strike_price[option_directory_message_at] == option_directory_message_written.explicit_strike_price[option_directory_message_at]); option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  assert(option_directory_message_read.option_type == option_directory_message_written.option_type);
  assert(option_directory_message_read.source == option_directory_message_written.source);
  option_directory_message_at = 0;
  do
  :: option_directory_message_at < 13 -> assert(option_directory_message_read.underlying_symbol[option_directory_message_at] == option_directory_message_written.underlying_symbol[option_directory_message_at]); option_directory_message_at = option_directory_message_at + 1
  :: else -> break
  od;
  assert(option_directory_message_read.options_closing_type == option_directory_message_written.options_closing_type);
  assert(option_directory_message_read.tradable == option_directory_message_written.tradable);
  assert(option_directory_message_read.mpv == option_directory_message_written.mpv);
  skip
}

/* ---- Trading Action Message: 9 bytes ----------------------------------------- */

/* The options system uses this administrative message to indicate the current trading status of an index or equity option within the PHLX Options Market. */
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

/* ---- Security Open Message: 9 bytes ------------------------------------------ */

/* The options system plans to disseminate the Option Open Message for each option as soon as the opening is completed. Upon receipt of the open state message, firms should be advised that the option denoted in the message is now available for auto execution within the PHLX ® Options Market System. Upon receipt of the closed state message, firms should be advised that the option is no longer eligible for auto-execution within the Options Market System. */
typedef SecurityOpenMessage {
  byte nanoseconds[4];
  byte option_id[4];
  byte open_state
};

int security_open_message_at;

/* every byte of Security Open Message set to one value */
inline fill_security_open_message(security_open_message_record, security_open_message_value) {
  security_open_message_at = 0;
  do
  :: security_open_message_at < 4 -> security_open_message_record.nanoseconds[security_open_message_at] = security_open_message_value; security_open_message_at = security_open_message_at + 1
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
  :: security_open_message_at < 4 -> security_open_message_record.nanoseconds[security_open_message_at] = (security_open_message_base + 0 + security_open_message_at + 1) % 256; security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  security_open_message_at = 0;
  do
  :: security_open_message_at < 4 -> security_open_message_record.option_id[security_open_message_at] = (security_open_message_base + 4 + security_open_message_at + 1) % 256; security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  security_open_message_record.open_state = (security_open_message_base + 8 + 1) % 256;
  skip
}

/* Security Open Message to the wire, 9 bytes from where the cursor stands */
inline encode_security_open_message(security_open_message_record) {
  security_open_message_at = 0;
  do
  :: security_open_message_at < 4 -> wire[at] = security_open_message_record.nanoseconds[security_open_message_at]; at = at + 1; security_open_message_at = security_open_message_at + 1
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

/* Security Open Message off the wire, 9 bytes from where the cursor stands */
inline decode_security_open_message(security_open_message_record) {
  security_open_message_at = 0;
  do
  :: security_open_message_at < 4 -> security_open_message_record.nanoseconds[security_open_message_at] = wire[at]; at = at + 1; security_open_message_at = security_open_message_at + 1
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
  :: security_open_message_at < 4 -> assert(security_open_message_read.nanoseconds[security_open_message_at] == security_open_message_written.nanoseconds[security_open_message_at]); security_open_message_at = security_open_message_at + 1
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

/* ---- Add Order Short Message: 21 bytes --------------------------------------- */

/* An Add Order Message indicates that a new order has been accepted by the options system and was added to the displayable book. The message includes a day-unique Order Reference Number used by options system to track the order. */
typedef AddOrderShortMessage {
  byte nanoseconds[4];
  byte order_reference_number_delta[4];
  byte market_side;
  byte option_id[4];
  byte short_price[2];
  byte short_volume[2];
  byte order_id[4]
};

int add_order_short_message_at;

/* every byte of Add Order Short Message set to one value */
inline fill_add_order_short_message(add_order_short_message_record, add_order_short_message_value) {
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> add_order_short_message_record.nanoseconds[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> add_order_short_message_record.order_reference_number_delta[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_record.market_side = add_order_short_message_value;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> add_order_short_message_record.option_id[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> add_order_short_message_record.short_price[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> add_order_short_message_record.short_volume[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> add_order_short_message_record.order_id[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Short Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_short_message(add_order_short_message_record, add_order_short_message_base) {
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> add_order_short_message_record.nanoseconds[add_order_short_message_at] = (add_order_short_message_base + 0 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> add_order_short_message_record.order_reference_number_delta[add_order_short_message_at] = (add_order_short_message_base + 4 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_record.market_side = (add_order_short_message_base + 8 + 1) % 256;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> add_order_short_message_record.option_id[add_order_short_message_at] = (add_order_short_message_base + 9 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> add_order_short_message_record.short_price[add_order_short_message_at] = (add_order_short_message_base + 13 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> add_order_short_message_record.short_volume[add_order_short_message_at] = (add_order_short_message_base + 15 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> add_order_short_message_record.order_id[add_order_short_message_at] = (add_order_short_message_base + 17 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Short Message to the wire, 21 bytes from where the cursor stands */
inline encode_add_order_short_message(add_order_short_message_record) {
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> wire[at] = add_order_short_message_record.nanoseconds[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> wire[at] = add_order_short_message_record.order_reference_number_delta[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_short_message_record.market_side; at = at + 1;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> wire[at] = add_order_short_message_record.option_id[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> wire[at] = add_order_short_message_record.short_price[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> wire[at] = add_order_short_message_record.short_volume[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> wire[at] = add_order_short_message_record.order_id[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Short Message off the wire, 21 bytes from where the cursor stands */
inline decode_add_order_short_message(add_order_short_message_record) {
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> add_order_short_message_record.nanoseconds[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> add_order_short_message_record.order_reference_number_delta[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_record.market_side = wire[at]; at = at + 1;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> add_order_short_message_record.option_id[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> add_order_short_message_record.short_price[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> add_order_short_message_record.short_volume[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> add_order_short_message_record.order_id[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Short Message is what was written, byte for byte */
inline equal_add_order_short_message(add_order_short_message_read, add_order_short_message_written) {
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> assert(add_order_short_message_read.nanoseconds[add_order_short_message_at] == add_order_short_message_written.nanoseconds[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> assert(add_order_short_message_read.order_reference_number_delta[add_order_short_message_at] == add_order_short_message_written.order_reference_number_delta[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  assert(add_order_short_message_read.market_side == add_order_short_message_written.market_side);
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> assert(add_order_short_message_read.option_id[add_order_short_message_at] == add_order_short_message_written.option_id[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> assert(add_order_short_message_read.short_price[add_order_short_message_at] == add_order_short_message_written.short_price[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> assert(add_order_short_message_read.short_volume[add_order_short_message_at] == add_order_short_message_written.short_volume[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> assert(add_order_short_message_read.order_id[add_order_short_message_at] == add_order_short_message_written.order_id[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order Long Message: 25 bytes ---------------------------------------- */

/* An Add Order Message indicates that a new order has been accepted by the options system and was added to the displayable book. The message includes a day-unique Order Reference Number used by options system to track the order. */
typedef AddOrderLongMessage {
  byte nanoseconds[4];
  byte order_reference_number_delta[4];
  byte market_side;
  byte option_id[4];
  byte price[4];
  byte volume[4];
  byte order_id[4]
};

int add_order_long_message_at;

/* every byte of Add Order Long Message set to one value */
inline fill_add_order_long_message(add_order_long_message_record, add_order_long_message_value) {
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.nanoseconds[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.order_reference_number_delta[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_record.market_side = add_order_long_message_value;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.option_id[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.price[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.volume[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.order_id[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Long Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_long_message(add_order_long_message_record, add_order_long_message_base) {
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.nanoseconds[add_order_long_message_at] = (add_order_long_message_base + 0 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.order_reference_number_delta[add_order_long_message_at] = (add_order_long_message_base + 4 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_record.market_side = (add_order_long_message_base + 8 + 1) % 256;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.option_id[add_order_long_message_at] = (add_order_long_message_base + 9 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.price[add_order_long_message_at] = (add_order_long_message_base + 13 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.volume[add_order_long_message_at] = (add_order_long_message_base + 17 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.order_id[add_order_long_message_at] = (add_order_long_message_base + 21 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Long Message to the wire, 25 bytes from where the cursor stands */
inline encode_add_order_long_message(add_order_long_message_record) {
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> wire[at] = add_order_long_message_record.nanoseconds[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> wire[at] = add_order_long_message_record.order_reference_number_delta[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_long_message_record.market_side; at = at + 1;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> wire[at] = add_order_long_message_record.option_id[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> wire[at] = add_order_long_message_record.price[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> wire[at] = add_order_long_message_record.volume[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> wire[at] = add_order_long_message_record.order_id[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Long Message off the wire, 25 bytes from where the cursor stands */
inline decode_add_order_long_message(add_order_long_message_record) {
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.nanoseconds[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.order_reference_number_delta[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_record.market_side = wire[at]; at = at + 1;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.option_id[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.price[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.volume[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.order_id[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Long Message is what was written, byte for byte */
inline equal_add_order_long_message(add_order_long_message_read, add_order_long_message_written) {
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> assert(add_order_long_message_read.nanoseconds[add_order_long_message_at] == add_order_long_message_written.nanoseconds[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> assert(add_order_long_message_read.order_reference_number_delta[add_order_long_message_at] == add_order_long_message_written.order_reference_number_delta[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  assert(add_order_long_message_read.market_side == add_order_long_message_written.market_side);
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> assert(add_order_long_message_read.option_id[add_order_long_message_at] == add_order_long_message_written.option_id[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> assert(add_order_long_message_read.price[add_order_long_message_at] == add_order_long_message_written.price[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> assert(add_order_long_message_read.volume[add_order_long_message_at] == add_order_long_message_written.volume[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> assert(add_order_long_message_read.order_id[add_order_long_message_at] == add_order_long_message_written.order_id[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Quote Short Message: 24 bytes --------------------------------------- */

/* An Add Quote Message indicates that a new quote has been accepted by the PHLX ® options system and was added to the displayable book. The message includes a unique Bid/Ask Reference Numbers used by the options system to track the quote. */
typedef AddQuoteShortMessage {
  byte nanoseconds[4];
  byte bid_reference_number_delta[4];
  byte ask_reference_number_delta[4];
  byte option_id[4];
  byte short_bid_price[2];
  byte short_bid_size[2];
  byte short_ask_price[2];
  byte short_ask_size[2]
};

int add_quote_short_message_at;

/* every byte of Add Quote Short Message set to one value */
inline fill_add_quote_short_message(add_quote_short_message_record, add_quote_short_message_value) {
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 4 -> add_quote_short_message_record.nanoseconds[add_quote_short_message_at] = add_quote_short_message_value; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 4 -> add_quote_short_message_record.bid_reference_number_delta[add_quote_short_message_at] = add_quote_short_message_value; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 4 -> add_quote_short_message_record.ask_reference_number_delta[add_quote_short_message_at] = add_quote_short_message_value; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 4 -> add_quote_short_message_record.option_id[add_quote_short_message_at] = add_quote_short_message_value; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 2 -> add_quote_short_message_record.short_bid_price[add_quote_short_message_at] = add_quote_short_message_value; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 2 -> add_quote_short_message_record.short_bid_size[add_quote_short_message_at] = add_quote_short_message_value; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 2 -> add_quote_short_message_record.short_ask_price[add_quote_short_message_at] = add_quote_short_message_value; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 2 -> add_quote_short_message_record.short_ask_size[add_quote_short_message_at] = add_quote_short_message_value; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Quote Short Message set to where it lies, so a field read out of place says so */
inline ramp_add_quote_short_message(add_quote_short_message_record, add_quote_short_message_base) {
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 4 -> add_quote_short_message_record.nanoseconds[add_quote_short_message_at] = (add_quote_short_message_base + 0 + add_quote_short_message_at + 1) % 256; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 4 -> add_quote_short_message_record.bid_reference_number_delta[add_quote_short_message_at] = (add_quote_short_message_base + 4 + add_quote_short_message_at + 1) % 256; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 4 -> add_quote_short_message_record.ask_reference_number_delta[add_quote_short_message_at] = (add_quote_short_message_base + 8 + add_quote_short_message_at + 1) % 256; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 4 -> add_quote_short_message_record.option_id[add_quote_short_message_at] = (add_quote_short_message_base + 12 + add_quote_short_message_at + 1) % 256; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 2 -> add_quote_short_message_record.short_bid_price[add_quote_short_message_at] = (add_quote_short_message_base + 16 + add_quote_short_message_at + 1) % 256; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 2 -> add_quote_short_message_record.short_bid_size[add_quote_short_message_at] = (add_quote_short_message_base + 18 + add_quote_short_message_at + 1) % 256; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 2 -> add_quote_short_message_record.short_ask_price[add_quote_short_message_at] = (add_quote_short_message_base + 20 + add_quote_short_message_at + 1) % 256; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 2 -> add_quote_short_message_record.short_ask_size[add_quote_short_message_at] = (add_quote_short_message_base + 22 + add_quote_short_message_at + 1) % 256; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Quote Short Message to the wire, 24 bytes from where the cursor stands */
inline encode_add_quote_short_message(add_quote_short_message_record) {
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 4 -> wire[at] = add_quote_short_message_record.nanoseconds[add_quote_short_message_at]; at = at + 1; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 4 -> wire[at] = add_quote_short_message_record.bid_reference_number_delta[add_quote_short_message_at]; at = at + 1; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 4 -> wire[at] = add_quote_short_message_record.ask_reference_number_delta[add_quote_short_message_at]; at = at + 1; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 4 -> wire[at] = add_quote_short_message_record.option_id[add_quote_short_message_at]; at = at + 1; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 2 -> wire[at] = add_quote_short_message_record.short_bid_price[add_quote_short_message_at]; at = at + 1; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 2 -> wire[at] = add_quote_short_message_record.short_bid_size[add_quote_short_message_at]; at = at + 1; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 2 -> wire[at] = add_quote_short_message_record.short_ask_price[add_quote_short_message_at]; at = at + 1; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 2 -> wire[at] = add_quote_short_message_record.short_ask_size[add_quote_short_message_at]; at = at + 1; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Quote Short Message off the wire, 24 bytes from where the cursor stands */
inline decode_add_quote_short_message(add_quote_short_message_record) {
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 4 -> add_quote_short_message_record.nanoseconds[add_quote_short_message_at] = wire[at]; at = at + 1; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 4 -> add_quote_short_message_record.bid_reference_number_delta[add_quote_short_message_at] = wire[at]; at = at + 1; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 4 -> add_quote_short_message_record.ask_reference_number_delta[add_quote_short_message_at] = wire[at]; at = at + 1; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 4 -> add_quote_short_message_record.option_id[add_quote_short_message_at] = wire[at]; at = at + 1; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 2 -> add_quote_short_message_record.short_bid_price[add_quote_short_message_at] = wire[at]; at = at + 1; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 2 -> add_quote_short_message_record.short_bid_size[add_quote_short_message_at] = wire[at]; at = at + 1; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 2 -> add_quote_short_message_record.short_ask_price[add_quote_short_message_at] = wire[at]; at = at + 1; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 2 -> add_quote_short_message_record.short_ask_size[add_quote_short_message_at] = wire[at]; at = at + 1; add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Quote Short Message is what was written, byte for byte */
inline equal_add_quote_short_message(add_quote_short_message_read, add_quote_short_message_written) {
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 4 -> assert(add_quote_short_message_read.nanoseconds[add_quote_short_message_at] == add_quote_short_message_written.nanoseconds[add_quote_short_message_at]); add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 4 -> assert(add_quote_short_message_read.bid_reference_number_delta[add_quote_short_message_at] == add_quote_short_message_written.bid_reference_number_delta[add_quote_short_message_at]); add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 4 -> assert(add_quote_short_message_read.ask_reference_number_delta[add_quote_short_message_at] == add_quote_short_message_written.ask_reference_number_delta[add_quote_short_message_at]); add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 4 -> assert(add_quote_short_message_read.option_id[add_quote_short_message_at] == add_quote_short_message_written.option_id[add_quote_short_message_at]); add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 2 -> assert(add_quote_short_message_read.short_bid_price[add_quote_short_message_at] == add_quote_short_message_written.short_bid_price[add_quote_short_message_at]); add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 2 -> assert(add_quote_short_message_read.short_bid_size[add_quote_short_message_at] == add_quote_short_message_written.short_bid_size[add_quote_short_message_at]); add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 2 -> assert(add_quote_short_message_read.short_ask_price[add_quote_short_message_at] == add_quote_short_message_written.short_ask_price[add_quote_short_message_at]); add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  add_quote_short_message_at = 0;
  do
  :: add_quote_short_message_at < 2 -> assert(add_quote_short_message_read.short_ask_size[add_quote_short_message_at] == add_quote_short_message_written.short_ask_size[add_quote_short_message_at]); add_quote_short_message_at = add_quote_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Quote Long Message: 32 bytes ---------------------------------------- */

/* An Add Quote Message indicates that a new quote has been accepted by the PHLX ® options system and was added to the displayable book. The message includes a unique Bid/Ask Reference Numbers used by the options system to track the quote. */
typedef AddQuoteLongMessage {
  byte nanoseconds[4];
  byte bid_reference_number_delta[4];
  byte ask_reference_number_delta[4];
  byte option_id[4];
  byte bid_price[4];
  byte bid_size[4];
  byte ask_price[4];
  byte ask_size[4]
};

int add_quote_long_message_at;

/* every byte of Add Quote Long Message set to one value */
inline fill_add_quote_long_message(add_quote_long_message_record, add_quote_long_message_value) {
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> add_quote_long_message_record.nanoseconds[add_quote_long_message_at] = add_quote_long_message_value; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> add_quote_long_message_record.bid_reference_number_delta[add_quote_long_message_at] = add_quote_long_message_value; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> add_quote_long_message_record.ask_reference_number_delta[add_quote_long_message_at] = add_quote_long_message_value; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> add_quote_long_message_record.option_id[add_quote_long_message_at] = add_quote_long_message_value; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> add_quote_long_message_record.bid_price[add_quote_long_message_at] = add_quote_long_message_value; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> add_quote_long_message_record.bid_size[add_quote_long_message_at] = add_quote_long_message_value; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> add_quote_long_message_record.ask_price[add_quote_long_message_at] = add_quote_long_message_value; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> add_quote_long_message_record.ask_size[add_quote_long_message_at] = add_quote_long_message_value; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Quote Long Message set to where it lies, so a field read out of place says so */
inline ramp_add_quote_long_message(add_quote_long_message_record, add_quote_long_message_base) {
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> add_quote_long_message_record.nanoseconds[add_quote_long_message_at] = (add_quote_long_message_base + 0 + add_quote_long_message_at + 1) % 256; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> add_quote_long_message_record.bid_reference_number_delta[add_quote_long_message_at] = (add_quote_long_message_base + 4 + add_quote_long_message_at + 1) % 256; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> add_quote_long_message_record.ask_reference_number_delta[add_quote_long_message_at] = (add_quote_long_message_base + 8 + add_quote_long_message_at + 1) % 256; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> add_quote_long_message_record.option_id[add_quote_long_message_at] = (add_quote_long_message_base + 12 + add_quote_long_message_at + 1) % 256; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> add_quote_long_message_record.bid_price[add_quote_long_message_at] = (add_quote_long_message_base + 16 + add_quote_long_message_at + 1) % 256; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> add_quote_long_message_record.bid_size[add_quote_long_message_at] = (add_quote_long_message_base + 20 + add_quote_long_message_at + 1) % 256; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> add_quote_long_message_record.ask_price[add_quote_long_message_at] = (add_quote_long_message_base + 24 + add_quote_long_message_at + 1) % 256; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> add_quote_long_message_record.ask_size[add_quote_long_message_at] = (add_quote_long_message_base + 28 + add_quote_long_message_at + 1) % 256; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Quote Long Message to the wire, 32 bytes from where the cursor stands */
inline encode_add_quote_long_message(add_quote_long_message_record) {
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> wire[at] = add_quote_long_message_record.nanoseconds[add_quote_long_message_at]; at = at + 1; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> wire[at] = add_quote_long_message_record.bid_reference_number_delta[add_quote_long_message_at]; at = at + 1; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> wire[at] = add_quote_long_message_record.ask_reference_number_delta[add_quote_long_message_at]; at = at + 1; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> wire[at] = add_quote_long_message_record.option_id[add_quote_long_message_at]; at = at + 1; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> wire[at] = add_quote_long_message_record.bid_price[add_quote_long_message_at]; at = at + 1; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> wire[at] = add_quote_long_message_record.bid_size[add_quote_long_message_at]; at = at + 1; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> wire[at] = add_quote_long_message_record.ask_price[add_quote_long_message_at]; at = at + 1; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> wire[at] = add_quote_long_message_record.ask_size[add_quote_long_message_at]; at = at + 1; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Quote Long Message off the wire, 32 bytes from where the cursor stands */
inline decode_add_quote_long_message(add_quote_long_message_record) {
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> add_quote_long_message_record.nanoseconds[add_quote_long_message_at] = wire[at]; at = at + 1; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> add_quote_long_message_record.bid_reference_number_delta[add_quote_long_message_at] = wire[at]; at = at + 1; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> add_quote_long_message_record.ask_reference_number_delta[add_quote_long_message_at] = wire[at]; at = at + 1; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> add_quote_long_message_record.option_id[add_quote_long_message_at] = wire[at]; at = at + 1; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> add_quote_long_message_record.bid_price[add_quote_long_message_at] = wire[at]; at = at + 1; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> add_quote_long_message_record.bid_size[add_quote_long_message_at] = wire[at]; at = at + 1; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> add_quote_long_message_record.ask_price[add_quote_long_message_at] = wire[at]; at = at + 1; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> add_quote_long_message_record.ask_size[add_quote_long_message_at] = wire[at]; at = at + 1; add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Quote Long Message is what was written, byte for byte */
inline equal_add_quote_long_message(add_quote_long_message_read, add_quote_long_message_written) {
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> assert(add_quote_long_message_read.nanoseconds[add_quote_long_message_at] == add_quote_long_message_written.nanoseconds[add_quote_long_message_at]); add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> assert(add_quote_long_message_read.bid_reference_number_delta[add_quote_long_message_at] == add_quote_long_message_written.bid_reference_number_delta[add_quote_long_message_at]); add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> assert(add_quote_long_message_read.ask_reference_number_delta[add_quote_long_message_at] == add_quote_long_message_written.ask_reference_number_delta[add_quote_long_message_at]); add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> assert(add_quote_long_message_read.option_id[add_quote_long_message_at] == add_quote_long_message_written.option_id[add_quote_long_message_at]); add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> assert(add_quote_long_message_read.bid_price[add_quote_long_message_at] == add_quote_long_message_written.bid_price[add_quote_long_message_at]); add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> assert(add_quote_long_message_read.bid_size[add_quote_long_message_at] == add_quote_long_message_written.bid_size[add_quote_long_message_at]); add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> assert(add_quote_long_message_read.ask_price[add_quote_long_message_at] == add_quote_long_message_written.ask_price[add_quote_long_message_at]); add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  add_quote_long_message_at = 0;
  do
  :: add_quote_long_message_at < 4 -> assert(add_quote_long_message_read.ask_size[add_quote_long_message_at] == add_quote_long_message_written.ask_size[add_quote_long_message_at]); add_quote_long_message_at = add_quote_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Executed Message: 20 bytes ---------------------------------- */

/* This message is sent whenever a Side order is executed in whole or in part. It is possible to receive several Single Side Executed Messages for the same Side order if that Side order is executed in several parts. The multiple Single Side Executed Messages on the same order are cumulative. By combining the executions received separately via two types of Single Side Executed Messages and Trade Messages, it is possible to build a complete view of all non-auction executions that happen on PHLX ®. Auction execution information is available in one bulk print via the Auction Trade Message. */
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

/* This message is sent whenever an incoming Side order is executed against the book in whole or in part at a price different from the initial display price. Since the execution price is different than the display price of the original Add/Replace, the options system includes a price field within this execution message. It is possible to receive multiple Single Side Executed and Single Side Executed with Price messages for the same Side order if that Side order is executed in several parts. The multiple Single Side Executed messages on the same Side order are cumulative. */
typedef SingleSideExecutedWithPriceMessage {
  byte nanoseconds[4];
  byte reference_number_delta[4];
  byte cross_number[4];
  byte match_number[4];
  byte printable;
  byte price[4];
  byte volume[4]
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
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.price[single_side_executed_with_price_message_at] = single_side_executed_with_price_message_value; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.volume[single_side_executed_with_price_message_at] = single_side_executed_with_price_message_value; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
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
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.price[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 17 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.volume[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 21 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
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
  :: single_side_executed_with_price_message_at < 4 -> wire[at] = single_side_executed_with_price_message_record.price[single_side_executed_with_price_message_at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> wire[at] = single_side_executed_with_price_message_record.volume[single_side_executed_with_price_message_at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
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
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.price[single_side_executed_with_price_message_at] = wire[at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.volume[single_side_executed_with_price_message_at] = wire[at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
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
  :: single_side_executed_with_price_message_at < 4 -> assert(single_side_executed_with_price_message_read.price[single_side_executed_with_price_message_at] == single_side_executed_with_price_message_written.price[single_side_executed_with_price_message_at]); single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> assert(single_side_executed_with_price_message_read.volume[single_side_executed_with_price_message_at] == single_side_executed_with_price_message_written.volume[single_side_executed_with_price_message_at]); single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Cancel Message: 12 bytes ------------------------------------ */

/* This message is sent whenever an order or a side of a quote on the book is modified as a result of a partial cancellation. */
typedef SingleSideCancelMessage {
  byte nanoseconds[4];
  byte reference_number_delta[4];
  byte cancelled_contracts[4]
};

int single_side_cancel_message_at;

/* every byte of Single Side Cancel Message set to one value */
inline fill_single_side_cancel_message(single_side_cancel_message_record, single_side_cancel_message_value) {
  single_side_cancel_message_at = 0;
  do
  :: single_side_cancel_message_at < 4 -> single_side_cancel_message_record.nanoseconds[single_side_cancel_message_at] = single_side_cancel_message_value; single_side_cancel_message_at = single_side_cancel_message_at + 1
  :: else -> break
  od;
  single_side_cancel_message_at = 0;
  do
  :: single_side_cancel_message_at < 4 -> single_side_cancel_message_record.reference_number_delta[single_side_cancel_message_at] = single_side_cancel_message_value; single_side_cancel_message_at = single_side_cancel_message_at + 1
  :: else -> break
  od;
  single_side_cancel_message_at = 0;
  do
  :: single_side_cancel_message_at < 4 -> single_side_cancel_message_record.cancelled_contracts[single_side_cancel_message_at] = single_side_cancel_message_value; single_side_cancel_message_at = single_side_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Side Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_single_side_cancel_message(single_side_cancel_message_record, single_side_cancel_message_base) {
  single_side_cancel_message_at = 0;
  do
  :: single_side_cancel_message_at < 4 -> single_side_cancel_message_record.nanoseconds[single_side_cancel_message_at] = (single_side_cancel_message_base + 0 + single_side_cancel_message_at + 1) % 256; single_side_cancel_message_at = single_side_cancel_message_at + 1
  :: else -> break
  od;
  single_side_cancel_message_at = 0;
  do
  :: single_side_cancel_message_at < 4 -> single_side_cancel_message_record.reference_number_delta[single_side_cancel_message_at] = (single_side_cancel_message_base + 4 + single_side_cancel_message_at + 1) % 256; single_side_cancel_message_at = single_side_cancel_message_at + 1
  :: else -> break
  od;
  single_side_cancel_message_at = 0;
  do
  :: single_side_cancel_message_at < 4 -> single_side_cancel_message_record.cancelled_contracts[single_side_cancel_message_at] = (single_side_cancel_message_base + 8 + single_side_cancel_message_at + 1) % 256; single_side_cancel_message_at = single_side_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Cancel Message to the wire, 12 bytes from where the cursor stands */
inline encode_single_side_cancel_message(single_side_cancel_message_record) {
  single_side_cancel_message_at = 0;
  do
  :: single_side_cancel_message_at < 4 -> wire[at] = single_side_cancel_message_record.nanoseconds[single_side_cancel_message_at]; at = at + 1; single_side_cancel_message_at = single_side_cancel_message_at + 1
  :: else -> break
  od;
  single_side_cancel_message_at = 0;
  do
  :: single_side_cancel_message_at < 4 -> wire[at] = single_side_cancel_message_record.reference_number_delta[single_side_cancel_message_at]; at = at + 1; single_side_cancel_message_at = single_side_cancel_message_at + 1
  :: else -> break
  od;
  single_side_cancel_message_at = 0;
  do
  :: single_side_cancel_message_at < 4 -> wire[at] = single_side_cancel_message_record.cancelled_contracts[single_side_cancel_message_at]; at = at + 1; single_side_cancel_message_at = single_side_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Cancel Message off the wire, 12 bytes from where the cursor stands */
inline decode_single_side_cancel_message(single_side_cancel_message_record) {
  single_side_cancel_message_at = 0;
  do
  :: single_side_cancel_message_at < 4 -> single_side_cancel_message_record.nanoseconds[single_side_cancel_message_at] = wire[at]; at = at + 1; single_side_cancel_message_at = single_side_cancel_message_at + 1
  :: else -> break
  od;
  single_side_cancel_message_at = 0;
  do
  :: single_side_cancel_message_at < 4 -> single_side_cancel_message_record.reference_number_delta[single_side_cancel_message_at] = wire[at]; at = at + 1; single_side_cancel_message_at = single_side_cancel_message_at + 1
  :: else -> break
  od;
  single_side_cancel_message_at = 0;
  do
  :: single_side_cancel_message_at < 4 -> single_side_cancel_message_record.cancelled_contracts[single_side_cancel_message_at] = wire[at]; at = at + 1; single_side_cancel_message_at = single_side_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Side Cancel Message is what was written, byte for byte */
inline equal_single_side_cancel_message(single_side_cancel_message_read, single_side_cancel_message_written) {
  single_side_cancel_message_at = 0;
  do
  :: single_side_cancel_message_at < 4 -> assert(single_side_cancel_message_read.nanoseconds[single_side_cancel_message_at] == single_side_cancel_message_written.nanoseconds[single_side_cancel_message_at]); single_side_cancel_message_at = single_side_cancel_message_at + 1
  :: else -> break
  od;
  single_side_cancel_message_at = 0;
  do
  :: single_side_cancel_message_at < 4 -> assert(single_side_cancel_message_read.reference_number_delta[single_side_cancel_message_at] == single_side_cancel_message_written.reference_number_delta[single_side_cancel_message_at]); single_side_cancel_message_at = single_side_cancel_message_at + 1
  :: else -> break
  od;
  single_side_cancel_message_at = 0;
  do
  :: single_side_cancel_message_at < 4 -> assert(single_side_cancel_message_read.cancelled_contracts[single_side_cancel_message_at] == single_side_cancel_message_written.cancelled_contracts[single_side_cancel_message_at]); single_side_cancel_message_at = single_side_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Replace Short Message: 16 bytes ----------------------------- */

/* This message is sent whenever one side of a quote on the book is replaced. The replacement has a new reference number and replaces the prior reference number. */
typedef SingleSideReplaceShortMessage {
  byte nanoseconds[4];
  byte original_reference_number_delta[4];
  byte new_reference_number_delta[4];
  byte short_price[2];
  byte short_volume[2]
};

int single_side_replace_short_message_at;

/* every byte of Single Side Replace Short Message set to one value */
inline fill_single_side_replace_short_message(single_side_replace_short_message_record, single_side_replace_short_message_value) {
  single_side_replace_short_message_at = 0;
  do
  :: single_side_replace_short_message_at < 4 -> single_side_replace_short_message_record.nanoseconds[single_side_replace_short_message_at] = single_side_replace_short_message_value; single_side_replace_short_message_at = single_side_replace_short_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_message_at = 0;
  do
  :: single_side_replace_short_message_at < 4 -> single_side_replace_short_message_record.original_reference_number_delta[single_side_replace_short_message_at] = single_side_replace_short_message_value; single_side_replace_short_message_at = single_side_replace_short_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_message_at = 0;
  do
  :: single_side_replace_short_message_at < 4 -> single_side_replace_short_message_record.new_reference_number_delta[single_side_replace_short_message_at] = single_side_replace_short_message_value; single_side_replace_short_message_at = single_side_replace_short_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_message_at = 0;
  do
  :: single_side_replace_short_message_at < 2 -> single_side_replace_short_message_record.short_price[single_side_replace_short_message_at] = single_side_replace_short_message_value; single_side_replace_short_message_at = single_side_replace_short_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_message_at = 0;
  do
  :: single_side_replace_short_message_at < 2 -> single_side_replace_short_message_record.short_volume[single_side_replace_short_message_at] = single_side_replace_short_message_value; single_side_replace_short_message_at = single_side_replace_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Side Replace Short Message set to where it lies, so a field read out of place says so */
inline ramp_single_side_replace_short_message(single_side_replace_short_message_record, single_side_replace_short_message_base) {
  single_side_replace_short_message_at = 0;
  do
  :: single_side_replace_short_message_at < 4 -> single_side_replace_short_message_record.nanoseconds[single_side_replace_short_message_at] = (single_side_replace_short_message_base + 0 + single_side_replace_short_message_at + 1) % 256; single_side_replace_short_message_at = single_side_replace_short_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_message_at = 0;
  do
  :: single_side_replace_short_message_at < 4 -> single_side_replace_short_message_record.original_reference_number_delta[single_side_replace_short_message_at] = (single_side_replace_short_message_base + 4 + single_side_replace_short_message_at + 1) % 256; single_side_replace_short_message_at = single_side_replace_short_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_message_at = 0;
  do
  :: single_side_replace_short_message_at < 4 -> single_side_replace_short_message_record.new_reference_number_delta[single_side_replace_short_message_at] = (single_side_replace_short_message_base + 8 + single_side_replace_short_message_at + 1) % 256; single_side_replace_short_message_at = single_side_replace_short_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_message_at = 0;
  do
  :: single_side_replace_short_message_at < 2 -> single_side_replace_short_message_record.short_price[single_side_replace_short_message_at] = (single_side_replace_short_message_base + 12 + single_side_replace_short_message_at + 1) % 256; single_side_replace_short_message_at = single_side_replace_short_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_message_at = 0;
  do
  :: single_side_replace_short_message_at < 2 -> single_side_replace_short_message_record.short_volume[single_side_replace_short_message_at] = (single_side_replace_short_message_base + 14 + single_side_replace_short_message_at + 1) % 256; single_side_replace_short_message_at = single_side_replace_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Replace Short Message to the wire, 16 bytes from where the cursor stands */
inline encode_single_side_replace_short_message(single_side_replace_short_message_record) {
  single_side_replace_short_message_at = 0;
  do
  :: single_side_replace_short_message_at < 4 -> wire[at] = single_side_replace_short_message_record.nanoseconds[single_side_replace_short_message_at]; at = at + 1; single_side_replace_short_message_at = single_side_replace_short_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_message_at = 0;
  do
  :: single_side_replace_short_message_at < 4 -> wire[at] = single_side_replace_short_message_record.original_reference_number_delta[single_side_replace_short_message_at]; at = at + 1; single_side_replace_short_message_at = single_side_replace_short_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_message_at = 0;
  do
  :: single_side_replace_short_message_at < 4 -> wire[at] = single_side_replace_short_message_record.new_reference_number_delta[single_side_replace_short_message_at]; at = at + 1; single_side_replace_short_message_at = single_side_replace_short_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_message_at = 0;
  do
  :: single_side_replace_short_message_at < 2 -> wire[at] = single_side_replace_short_message_record.short_price[single_side_replace_short_message_at]; at = at + 1; single_side_replace_short_message_at = single_side_replace_short_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_message_at = 0;
  do
  :: single_side_replace_short_message_at < 2 -> wire[at] = single_side_replace_short_message_record.short_volume[single_side_replace_short_message_at]; at = at + 1; single_side_replace_short_message_at = single_side_replace_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Replace Short Message off the wire, 16 bytes from where the cursor stands */
inline decode_single_side_replace_short_message(single_side_replace_short_message_record) {
  single_side_replace_short_message_at = 0;
  do
  :: single_side_replace_short_message_at < 4 -> single_side_replace_short_message_record.nanoseconds[single_side_replace_short_message_at] = wire[at]; at = at + 1; single_side_replace_short_message_at = single_side_replace_short_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_message_at = 0;
  do
  :: single_side_replace_short_message_at < 4 -> single_side_replace_short_message_record.original_reference_number_delta[single_side_replace_short_message_at] = wire[at]; at = at + 1; single_side_replace_short_message_at = single_side_replace_short_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_message_at = 0;
  do
  :: single_side_replace_short_message_at < 4 -> single_side_replace_short_message_record.new_reference_number_delta[single_side_replace_short_message_at] = wire[at]; at = at + 1; single_side_replace_short_message_at = single_side_replace_short_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_message_at = 0;
  do
  :: single_side_replace_short_message_at < 2 -> single_side_replace_short_message_record.short_price[single_side_replace_short_message_at] = wire[at]; at = at + 1; single_side_replace_short_message_at = single_side_replace_short_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_message_at = 0;
  do
  :: single_side_replace_short_message_at < 2 -> single_side_replace_short_message_record.short_volume[single_side_replace_short_message_at] = wire[at]; at = at + 1; single_side_replace_short_message_at = single_side_replace_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Side Replace Short Message is what was written, byte for byte */
inline equal_single_side_replace_short_message(single_side_replace_short_message_read, single_side_replace_short_message_written) {
  single_side_replace_short_message_at = 0;
  do
  :: single_side_replace_short_message_at < 4 -> assert(single_side_replace_short_message_read.nanoseconds[single_side_replace_short_message_at] == single_side_replace_short_message_written.nanoseconds[single_side_replace_short_message_at]); single_side_replace_short_message_at = single_side_replace_short_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_message_at = 0;
  do
  :: single_side_replace_short_message_at < 4 -> assert(single_side_replace_short_message_read.original_reference_number_delta[single_side_replace_short_message_at] == single_side_replace_short_message_written.original_reference_number_delta[single_side_replace_short_message_at]); single_side_replace_short_message_at = single_side_replace_short_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_message_at = 0;
  do
  :: single_side_replace_short_message_at < 4 -> assert(single_side_replace_short_message_read.new_reference_number_delta[single_side_replace_short_message_at] == single_side_replace_short_message_written.new_reference_number_delta[single_side_replace_short_message_at]); single_side_replace_short_message_at = single_side_replace_short_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_message_at = 0;
  do
  :: single_side_replace_short_message_at < 2 -> assert(single_side_replace_short_message_read.short_price[single_side_replace_short_message_at] == single_side_replace_short_message_written.short_price[single_side_replace_short_message_at]); single_side_replace_short_message_at = single_side_replace_short_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_message_at = 0;
  do
  :: single_side_replace_short_message_at < 2 -> assert(single_side_replace_short_message_read.short_volume[single_side_replace_short_message_at] == single_side_replace_short_message_written.short_volume[single_side_replace_short_message_at]); single_side_replace_short_message_at = single_side_replace_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Replace Long Message: 20 bytes ------------------------------ */

/* This message is sent whenever one side of a quote on the book is replaced. The replacement has a new reference number and replaces the prior reference number. */
typedef SingleSideReplaceLongMessage {
  byte nanoseconds[4];
  byte original_reference_number_delta[4];
  byte new_reference_number_delta[4];
  byte price[4];
  byte volume[4]
};

int single_side_replace_long_message_at;

/* every byte of Single Side Replace Long Message set to one value */
inline fill_single_side_replace_long_message(single_side_replace_long_message_record, single_side_replace_long_message_value) {
  single_side_replace_long_message_at = 0;
  do
  :: single_side_replace_long_message_at < 4 -> single_side_replace_long_message_record.nanoseconds[single_side_replace_long_message_at] = single_side_replace_long_message_value; single_side_replace_long_message_at = single_side_replace_long_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_message_at = 0;
  do
  :: single_side_replace_long_message_at < 4 -> single_side_replace_long_message_record.original_reference_number_delta[single_side_replace_long_message_at] = single_side_replace_long_message_value; single_side_replace_long_message_at = single_side_replace_long_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_message_at = 0;
  do
  :: single_side_replace_long_message_at < 4 -> single_side_replace_long_message_record.new_reference_number_delta[single_side_replace_long_message_at] = single_side_replace_long_message_value; single_side_replace_long_message_at = single_side_replace_long_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_message_at = 0;
  do
  :: single_side_replace_long_message_at < 4 -> single_side_replace_long_message_record.price[single_side_replace_long_message_at] = single_side_replace_long_message_value; single_side_replace_long_message_at = single_side_replace_long_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_message_at = 0;
  do
  :: single_side_replace_long_message_at < 4 -> single_side_replace_long_message_record.volume[single_side_replace_long_message_at] = single_side_replace_long_message_value; single_side_replace_long_message_at = single_side_replace_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Side Replace Long Message set to where it lies, so a field read out of place says so */
inline ramp_single_side_replace_long_message(single_side_replace_long_message_record, single_side_replace_long_message_base) {
  single_side_replace_long_message_at = 0;
  do
  :: single_side_replace_long_message_at < 4 -> single_side_replace_long_message_record.nanoseconds[single_side_replace_long_message_at] = (single_side_replace_long_message_base + 0 + single_side_replace_long_message_at + 1) % 256; single_side_replace_long_message_at = single_side_replace_long_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_message_at = 0;
  do
  :: single_side_replace_long_message_at < 4 -> single_side_replace_long_message_record.original_reference_number_delta[single_side_replace_long_message_at] = (single_side_replace_long_message_base + 4 + single_side_replace_long_message_at + 1) % 256; single_side_replace_long_message_at = single_side_replace_long_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_message_at = 0;
  do
  :: single_side_replace_long_message_at < 4 -> single_side_replace_long_message_record.new_reference_number_delta[single_side_replace_long_message_at] = (single_side_replace_long_message_base + 8 + single_side_replace_long_message_at + 1) % 256; single_side_replace_long_message_at = single_side_replace_long_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_message_at = 0;
  do
  :: single_side_replace_long_message_at < 4 -> single_side_replace_long_message_record.price[single_side_replace_long_message_at] = (single_side_replace_long_message_base + 12 + single_side_replace_long_message_at + 1) % 256; single_side_replace_long_message_at = single_side_replace_long_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_message_at = 0;
  do
  :: single_side_replace_long_message_at < 4 -> single_side_replace_long_message_record.volume[single_side_replace_long_message_at] = (single_side_replace_long_message_base + 16 + single_side_replace_long_message_at + 1) % 256; single_side_replace_long_message_at = single_side_replace_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Replace Long Message to the wire, 20 bytes from where the cursor stands */
inline encode_single_side_replace_long_message(single_side_replace_long_message_record) {
  single_side_replace_long_message_at = 0;
  do
  :: single_side_replace_long_message_at < 4 -> wire[at] = single_side_replace_long_message_record.nanoseconds[single_side_replace_long_message_at]; at = at + 1; single_side_replace_long_message_at = single_side_replace_long_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_message_at = 0;
  do
  :: single_side_replace_long_message_at < 4 -> wire[at] = single_side_replace_long_message_record.original_reference_number_delta[single_side_replace_long_message_at]; at = at + 1; single_side_replace_long_message_at = single_side_replace_long_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_message_at = 0;
  do
  :: single_side_replace_long_message_at < 4 -> wire[at] = single_side_replace_long_message_record.new_reference_number_delta[single_side_replace_long_message_at]; at = at + 1; single_side_replace_long_message_at = single_side_replace_long_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_message_at = 0;
  do
  :: single_side_replace_long_message_at < 4 -> wire[at] = single_side_replace_long_message_record.price[single_side_replace_long_message_at]; at = at + 1; single_side_replace_long_message_at = single_side_replace_long_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_message_at = 0;
  do
  :: single_side_replace_long_message_at < 4 -> wire[at] = single_side_replace_long_message_record.volume[single_side_replace_long_message_at]; at = at + 1; single_side_replace_long_message_at = single_side_replace_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Replace Long Message off the wire, 20 bytes from where the cursor stands */
inline decode_single_side_replace_long_message(single_side_replace_long_message_record) {
  single_side_replace_long_message_at = 0;
  do
  :: single_side_replace_long_message_at < 4 -> single_side_replace_long_message_record.nanoseconds[single_side_replace_long_message_at] = wire[at]; at = at + 1; single_side_replace_long_message_at = single_side_replace_long_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_message_at = 0;
  do
  :: single_side_replace_long_message_at < 4 -> single_side_replace_long_message_record.original_reference_number_delta[single_side_replace_long_message_at] = wire[at]; at = at + 1; single_side_replace_long_message_at = single_side_replace_long_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_message_at = 0;
  do
  :: single_side_replace_long_message_at < 4 -> single_side_replace_long_message_record.new_reference_number_delta[single_side_replace_long_message_at] = wire[at]; at = at + 1; single_side_replace_long_message_at = single_side_replace_long_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_message_at = 0;
  do
  :: single_side_replace_long_message_at < 4 -> single_side_replace_long_message_record.price[single_side_replace_long_message_at] = wire[at]; at = at + 1; single_side_replace_long_message_at = single_side_replace_long_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_message_at = 0;
  do
  :: single_side_replace_long_message_at < 4 -> single_side_replace_long_message_record.volume[single_side_replace_long_message_at] = wire[at]; at = at + 1; single_side_replace_long_message_at = single_side_replace_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Side Replace Long Message is what was written, byte for byte */
inline equal_single_side_replace_long_message(single_side_replace_long_message_read, single_side_replace_long_message_written) {
  single_side_replace_long_message_at = 0;
  do
  :: single_side_replace_long_message_at < 4 -> assert(single_side_replace_long_message_read.nanoseconds[single_side_replace_long_message_at] == single_side_replace_long_message_written.nanoseconds[single_side_replace_long_message_at]); single_side_replace_long_message_at = single_side_replace_long_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_message_at = 0;
  do
  :: single_side_replace_long_message_at < 4 -> assert(single_side_replace_long_message_read.original_reference_number_delta[single_side_replace_long_message_at] == single_side_replace_long_message_written.original_reference_number_delta[single_side_replace_long_message_at]); single_side_replace_long_message_at = single_side_replace_long_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_message_at = 0;
  do
  :: single_side_replace_long_message_at < 4 -> assert(single_side_replace_long_message_read.new_reference_number_delta[single_side_replace_long_message_at] == single_side_replace_long_message_written.new_reference_number_delta[single_side_replace_long_message_at]); single_side_replace_long_message_at = single_side_replace_long_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_message_at = 0;
  do
  :: single_side_replace_long_message_at < 4 -> assert(single_side_replace_long_message_read.price[single_side_replace_long_message_at] == single_side_replace_long_message_written.price[single_side_replace_long_message_at]); single_side_replace_long_message_at = single_side_replace_long_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_message_at = 0;
  do
  :: single_side_replace_long_message_at < 4 -> assert(single_side_replace_long_message_read.volume[single_side_replace_long_message_at] == single_side_replace_long_message_written.volume[single_side_replace_long_message_at]); single_side_replace_long_message_at = single_side_replace_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Replace Short Message: 20 bytes ----------------------------------- */

/* This message is sent whenever an order on the book is replaced. The replacement has a new reference number and replaces the prior reference number. */
typedef OrderReplaceShortMessage {
  byte nanoseconds[4];
  byte original_reference_number_delta[4];
  byte new_reference_number_delta[4];
  byte short_price[2];
  byte short_volume[2];
  byte order_id[4]
};

int order_replace_short_message_at;

/* every byte of Order Replace Short Message set to one value */
inline fill_order_replace_short_message(order_replace_short_message_record, order_replace_short_message_value) {
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 4 -> order_replace_short_message_record.nanoseconds[order_replace_short_message_at] = order_replace_short_message_value; order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 4 -> order_replace_short_message_record.original_reference_number_delta[order_replace_short_message_at] = order_replace_short_message_value; order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 4 -> order_replace_short_message_record.new_reference_number_delta[order_replace_short_message_at] = order_replace_short_message_value; order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 2 -> order_replace_short_message_record.short_price[order_replace_short_message_at] = order_replace_short_message_value; order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 2 -> order_replace_short_message_record.short_volume[order_replace_short_message_at] = order_replace_short_message_value; order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 4 -> order_replace_short_message_record.order_id[order_replace_short_message_at] = order_replace_short_message_value; order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Replace Short Message set to where it lies, so a field read out of place says so */
inline ramp_order_replace_short_message(order_replace_short_message_record, order_replace_short_message_base) {
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 4 -> order_replace_short_message_record.nanoseconds[order_replace_short_message_at] = (order_replace_short_message_base + 0 + order_replace_short_message_at + 1) % 256; order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 4 -> order_replace_short_message_record.original_reference_number_delta[order_replace_short_message_at] = (order_replace_short_message_base + 4 + order_replace_short_message_at + 1) % 256; order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 4 -> order_replace_short_message_record.new_reference_number_delta[order_replace_short_message_at] = (order_replace_short_message_base + 8 + order_replace_short_message_at + 1) % 256; order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 2 -> order_replace_short_message_record.short_price[order_replace_short_message_at] = (order_replace_short_message_base + 12 + order_replace_short_message_at + 1) % 256; order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 2 -> order_replace_short_message_record.short_volume[order_replace_short_message_at] = (order_replace_short_message_base + 14 + order_replace_short_message_at + 1) % 256; order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 4 -> order_replace_short_message_record.order_id[order_replace_short_message_at] = (order_replace_short_message_base + 16 + order_replace_short_message_at + 1) % 256; order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replace Short Message to the wire, 20 bytes from where the cursor stands */
inline encode_order_replace_short_message(order_replace_short_message_record) {
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 4 -> wire[at] = order_replace_short_message_record.nanoseconds[order_replace_short_message_at]; at = at + 1; order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 4 -> wire[at] = order_replace_short_message_record.original_reference_number_delta[order_replace_short_message_at]; at = at + 1; order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 4 -> wire[at] = order_replace_short_message_record.new_reference_number_delta[order_replace_short_message_at]; at = at + 1; order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 2 -> wire[at] = order_replace_short_message_record.short_price[order_replace_short_message_at]; at = at + 1; order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 2 -> wire[at] = order_replace_short_message_record.short_volume[order_replace_short_message_at]; at = at + 1; order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 4 -> wire[at] = order_replace_short_message_record.order_id[order_replace_short_message_at]; at = at + 1; order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replace Short Message off the wire, 20 bytes from where the cursor stands */
inline decode_order_replace_short_message(order_replace_short_message_record) {
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 4 -> order_replace_short_message_record.nanoseconds[order_replace_short_message_at] = wire[at]; at = at + 1; order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 4 -> order_replace_short_message_record.original_reference_number_delta[order_replace_short_message_at] = wire[at]; at = at + 1; order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 4 -> order_replace_short_message_record.new_reference_number_delta[order_replace_short_message_at] = wire[at]; at = at + 1; order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 2 -> order_replace_short_message_record.short_price[order_replace_short_message_at] = wire[at]; at = at + 1; order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 2 -> order_replace_short_message_record.short_volume[order_replace_short_message_at] = wire[at]; at = at + 1; order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 4 -> order_replace_short_message_record.order_id[order_replace_short_message_at] = wire[at]; at = at + 1; order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Replace Short Message is what was written, byte for byte */
inline equal_order_replace_short_message(order_replace_short_message_read, order_replace_short_message_written) {
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 4 -> assert(order_replace_short_message_read.nanoseconds[order_replace_short_message_at] == order_replace_short_message_written.nanoseconds[order_replace_short_message_at]); order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 4 -> assert(order_replace_short_message_read.original_reference_number_delta[order_replace_short_message_at] == order_replace_short_message_written.original_reference_number_delta[order_replace_short_message_at]); order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 4 -> assert(order_replace_short_message_read.new_reference_number_delta[order_replace_short_message_at] == order_replace_short_message_written.new_reference_number_delta[order_replace_short_message_at]); order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 2 -> assert(order_replace_short_message_read.short_price[order_replace_short_message_at] == order_replace_short_message_written.short_price[order_replace_short_message_at]); order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 2 -> assert(order_replace_short_message_read.short_volume[order_replace_short_message_at] == order_replace_short_message_written.short_volume[order_replace_short_message_at]); order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  order_replace_short_message_at = 0;
  do
  :: order_replace_short_message_at < 4 -> assert(order_replace_short_message_read.order_id[order_replace_short_message_at] == order_replace_short_message_written.order_id[order_replace_short_message_at]); order_replace_short_message_at = order_replace_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Replace Long Message: 24 bytes ------------------------------------ */

/* This message is sent whenever an order on the book is replaced. The replacement has a new reference number and replaces the prior reference number. */
typedef OrderReplaceLongMessage {
  byte nanoseconds[4];
  byte original_reference_number_delta[4];
  byte new_reference_number_delta[4];
  byte price[4];
  byte volume[4];
  byte order_id[4]
};

int order_replace_long_message_at;

/* every byte of Order Replace Long Message set to one value */
inline fill_order_replace_long_message(order_replace_long_message_record, order_replace_long_message_value) {
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> order_replace_long_message_record.nanoseconds[order_replace_long_message_at] = order_replace_long_message_value; order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> order_replace_long_message_record.original_reference_number_delta[order_replace_long_message_at] = order_replace_long_message_value; order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> order_replace_long_message_record.new_reference_number_delta[order_replace_long_message_at] = order_replace_long_message_value; order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> order_replace_long_message_record.price[order_replace_long_message_at] = order_replace_long_message_value; order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> order_replace_long_message_record.volume[order_replace_long_message_at] = order_replace_long_message_value; order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> order_replace_long_message_record.order_id[order_replace_long_message_at] = order_replace_long_message_value; order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Replace Long Message set to where it lies, so a field read out of place says so */
inline ramp_order_replace_long_message(order_replace_long_message_record, order_replace_long_message_base) {
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> order_replace_long_message_record.nanoseconds[order_replace_long_message_at] = (order_replace_long_message_base + 0 + order_replace_long_message_at + 1) % 256; order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> order_replace_long_message_record.original_reference_number_delta[order_replace_long_message_at] = (order_replace_long_message_base + 4 + order_replace_long_message_at + 1) % 256; order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> order_replace_long_message_record.new_reference_number_delta[order_replace_long_message_at] = (order_replace_long_message_base + 8 + order_replace_long_message_at + 1) % 256; order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> order_replace_long_message_record.price[order_replace_long_message_at] = (order_replace_long_message_base + 12 + order_replace_long_message_at + 1) % 256; order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> order_replace_long_message_record.volume[order_replace_long_message_at] = (order_replace_long_message_base + 16 + order_replace_long_message_at + 1) % 256; order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> order_replace_long_message_record.order_id[order_replace_long_message_at] = (order_replace_long_message_base + 20 + order_replace_long_message_at + 1) % 256; order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replace Long Message to the wire, 24 bytes from where the cursor stands */
inline encode_order_replace_long_message(order_replace_long_message_record) {
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> wire[at] = order_replace_long_message_record.nanoseconds[order_replace_long_message_at]; at = at + 1; order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> wire[at] = order_replace_long_message_record.original_reference_number_delta[order_replace_long_message_at]; at = at + 1; order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> wire[at] = order_replace_long_message_record.new_reference_number_delta[order_replace_long_message_at]; at = at + 1; order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> wire[at] = order_replace_long_message_record.price[order_replace_long_message_at]; at = at + 1; order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> wire[at] = order_replace_long_message_record.volume[order_replace_long_message_at]; at = at + 1; order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> wire[at] = order_replace_long_message_record.order_id[order_replace_long_message_at]; at = at + 1; order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replace Long Message off the wire, 24 bytes from where the cursor stands */
inline decode_order_replace_long_message(order_replace_long_message_record) {
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> order_replace_long_message_record.nanoseconds[order_replace_long_message_at] = wire[at]; at = at + 1; order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> order_replace_long_message_record.original_reference_number_delta[order_replace_long_message_at] = wire[at]; at = at + 1; order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> order_replace_long_message_record.new_reference_number_delta[order_replace_long_message_at] = wire[at]; at = at + 1; order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> order_replace_long_message_record.price[order_replace_long_message_at] = wire[at]; at = at + 1; order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> order_replace_long_message_record.volume[order_replace_long_message_at] = wire[at]; at = at + 1; order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> order_replace_long_message_record.order_id[order_replace_long_message_at] = wire[at]; at = at + 1; order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Replace Long Message is what was written, byte for byte */
inline equal_order_replace_long_message(order_replace_long_message_read, order_replace_long_message_written) {
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> assert(order_replace_long_message_read.nanoseconds[order_replace_long_message_at] == order_replace_long_message_written.nanoseconds[order_replace_long_message_at]); order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> assert(order_replace_long_message_read.original_reference_number_delta[order_replace_long_message_at] == order_replace_long_message_written.original_reference_number_delta[order_replace_long_message_at]); order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> assert(order_replace_long_message_read.new_reference_number_delta[order_replace_long_message_at] == order_replace_long_message_written.new_reference_number_delta[order_replace_long_message_at]); order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> assert(order_replace_long_message_read.price[order_replace_long_message_at] == order_replace_long_message_written.price[order_replace_long_message_at]); order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> assert(order_replace_long_message_read.volume[order_replace_long_message_at] == order_replace_long_message_written.volume[order_replace_long_message_at]); order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  order_replace_long_message_at = 0;
  do
  :: order_replace_long_message_at < 4 -> assert(order_replace_long_message_read.order_id[order_replace_long_message_at] == order_replace_long_message_written.order_id[order_replace_long_message_at]); order_replace_long_message_at = order_replace_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Delete Message: 8 bytes ------------------------------------- */

/* The message is sent when an order or a side of a quote is being cancelled. All remaining contracts are no longer accessible so the side should be removed from the book. */
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

/* This message is sent whenever an order or a side of a quote is being updated for price and (or) contracts. The reference number associated with the order quote is unchanged. */
typedef SingleSideUpdateMessage {
  byte nanoseconds[4];
  byte reference_number_delta[4];
  byte change_reason;
  byte price[4];
  byte volume[4]
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
  :: single_side_update_message_at < 4 -> single_side_update_message_record.price[single_side_update_message_at] = single_side_update_message_value; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.volume[single_side_update_message_at] = single_side_update_message_value; single_side_update_message_at = single_side_update_message_at + 1
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
  :: single_side_update_message_at < 4 -> single_side_update_message_record.price[single_side_update_message_at] = (single_side_update_message_base + 9 + single_side_update_message_at + 1) % 256; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.volume[single_side_update_message_at] = (single_side_update_message_base + 13 + single_side_update_message_at + 1) % 256; single_side_update_message_at = single_side_update_message_at + 1
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
  :: single_side_update_message_at < 4 -> wire[at] = single_side_update_message_record.price[single_side_update_message_at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> wire[at] = single_side_update_message_record.volume[single_side_update_message_at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
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
  :: single_side_update_message_at < 4 -> single_side_update_message_record.price[single_side_update_message_at] = wire[at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.volume[single_side_update_message_at] = wire[at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
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
  :: single_side_update_message_at < 4 -> assert(single_side_update_message_read.price[single_side_update_message_at] == single_side_update_message_written.price[single_side_update_message_at]); single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> assert(single_side_update_message_read.volume[single_side_update_message_at] == single_side_update_message_written.volume[single_side_update_message_at]); single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Replace Short Message: 28 bytes ----------------------------------- */

/* This message is sent whenever a quote on the book is replaced. The replaced quote has new reference numbers on both sides. */
typedef QuoteReplaceShortMessage {
  byte nanoseconds[4];
  byte original_bid_reference_number_delta[4];
  byte bid_reference_number_delta[4];
  byte original_ask_reference_number_delta[4];
  byte ask_reference_number_delta[4];
  byte short_bid_price[2];
  byte short_bid_size[2];
  byte short_ask_price[2];
  byte short_ask_size[2]
};

int quote_replace_short_message_at;

/* every byte of Quote Replace Short Message set to one value */
inline fill_quote_replace_short_message(quote_replace_short_message_record, quote_replace_short_message_value) {
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 4 -> quote_replace_short_message_record.nanoseconds[quote_replace_short_message_at] = quote_replace_short_message_value; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 4 -> quote_replace_short_message_record.original_bid_reference_number_delta[quote_replace_short_message_at] = quote_replace_short_message_value; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 4 -> quote_replace_short_message_record.bid_reference_number_delta[quote_replace_short_message_at] = quote_replace_short_message_value; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 4 -> quote_replace_short_message_record.original_ask_reference_number_delta[quote_replace_short_message_at] = quote_replace_short_message_value; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 4 -> quote_replace_short_message_record.ask_reference_number_delta[quote_replace_short_message_at] = quote_replace_short_message_value; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 2 -> quote_replace_short_message_record.short_bid_price[quote_replace_short_message_at] = quote_replace_short_message_value; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 2 -> quote_replace_short_message_record.short_bid_size[quote_replace_short_message_at] = quote_replace_short_message_value; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 2 -> quote_replace_short_message_record.short_ask_price[quote_replace_short_message_at] = quote_replace_short_message_value; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 2 -> quote_replace_short_message_record.short_ask_size[quote_replace_short_message_at] = quote_replace_short_message_value; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Replace Short Message set to where it lies, so a field read out of place says so */
inline ramp_quote_replace_short_message(quote_replace_short_message_record, quote_replace_short_message_base) {
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 4 -> quote_replace_short_message_record.nanoseconds[quote_replace_short_message_at] = (quote_replace_short_message_base + 0 + quote_replace_short_message_at + 1) % 256; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 4 -> quote_replace_short_message_record.original_bid_reference_number_delta[quote_replace_short_message_at] = (quote_replace_short_message_base + 4 + quote_replace_short_message_at + 1) % 256; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 4 -> quote_replace_short_message_record.bid_reference_number_delta[quote_replace_short_message_at] = (quote_replace_short_message_base + 8 + quote_replace_short_message_at + 1) % 256; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 4 -> quote_replace_short_message_record.original_ask_reference_number_delta[quote_replace_short_message_at] = (quote_replace_short_message_base + 12 + quote_replace_short_message_at + 1) % 256; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 4 -> quote_replace_short_message_record.ask_reference_number_delta[quote_replace_short_message_at] = (quote_replace_short_message_base + 16 + quote_replace_short_message_at + 1) % 256; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 2 -> quote_replace_short_message_record.short_bid_price[quote_replace_short_message_at] = (quote_replace_short_message_base + 20 + quote_replace_short_message_at + 1) % 256; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 2 -> quote_replace_short_message_record.short_bid_size[quote_replace_short_message_at] = (quote_replace_short_message_base + 22 + quote_replace_short_message_at + 1) % 256; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 2 -> quote_replace_short_message_record.short_ask_price[quote_replace_short_message_at] = (quote_replace_short_message_base + 24 + quote_replace_short_message_at + 1) % 256; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 2 -> quote_replace_short_message_record.short_ask_size[quote_replace_short_message_at] = (quote_replace_short_message_base + 26 + quote_replace_short_message_at + 1) % 256; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Replace Short Message to the wire, 28 bytes from where the cursor stands */
inline encode_quote_replace_short_message(quote_replace_short_message_record) {
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 4 -> wire[at] = quote_replace_short_message_record.nanoseconds[quote_replace_short_message_at]; at = at + 1; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 4 -> wire[at] = quote_replace_short_message_record.original_bid_reference_number_delta[quote_replace_short_message_at]; at = at + 1; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 4 -> wire[at] = quote_replace_short_message_record.bid_reference_number_delta[quote_replace_short_message_at]; at = at + 1; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 4 -> wire[at] = quote_replace_short_message_record.original_ask_reference_number_delta[quote_replace_short_message_at]; at = at + 1; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 4 -> wire[at] = quote_replace_short_message_record.ask_reference_number_delta[quote_replace_short_message_at]; at = at + 1; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 2 -> wire[at] = quote_replace_short_message_record.short_bid_price[quote_replace_short_message_at]; at = at + 1; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 2 -> wire[at] = quote_replace_short_message_record.short_bid_size[quote_replace_short_message_at]; at = at + 1; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 2 -> wire[at] = quote_replace_short_message_record.short_ask_price[quote_replace_short_message_at]; at = at + 1; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 2 -> wire[at] = quote_replace_short_message_record.short_ask_size[quote_replace_short_message_at]; at = at + 1; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Replace Short Message off the wire, 28 bytes from where the cursor stands */
inline decode_quote_replace_short_message(quote_replace_short_message_record) {
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 4 -> quote_replace_short_message_record.nanoseconds[quote_replace_short_message_at] = wire[at]; at = at + 1; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 4 -> quote_replace_short_message_record.original_bid_reference_number_delta[quote_replace_short_message_at] = wire[at]; at = at + 1; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 4 -> quote_replace_short_message_record.bid_reference_number_delta[quote_replace_short_message_at] = wire[at]; at = at + 1; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 4 -> quote_replace_short_message_record.original_ask_reference_number_delta[quote_replace_short_message_at] = wire[at]; at = at + 1; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 4 -> quote_replace_short_message_record.ask_reference_number_delta[quote_replace_short_message_at] = wire[at]; at = at + 1; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 2 -> quote_replace_short_message_record.short_bid_price[quote_replace_short_message_at] = wire[at]; at = at + 1; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 2 -> quote_replace_short_message_record.short_bid_size[quote_replace_short_message_at] = wire[at]; at = at + 1; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 2 -> quote_replace_short_message_record.short_ask_price[quote_replace_short_message_at] = wire[at]; at = at + 1; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 2 -> quote_replace_short_message_record.short_ask_size[quote_replace_short_message_at] = wire[at]; at = at + 1; quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Replace Short Message is what was written, byte for byte */
inline equal_quote_replace_short_message(quote_replace_short_message_read, quote_replace_short_message_written) {
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 4 -> assert(quote_replace_short_message_read.nanoseconds[quote_replace_short_message_at] == quote_replace_short_message_written.nanoseconds[quote_replace_short_message_at]); quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 4 -> assert(quote_replace_short_message_read.original_bid_reference_number_delta[quote_replace_short_message_at] == quote_replace_short_message_written.original_bid_reference_number_delta[quote_replace_short_message_at]); quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 4 -> assert(quote_replace_short_message_read.bid_reference_number_delta[quote_replace_short_message_at] == quote_replace_short_message_written.bid_reference_number_delta[quote_replace_short_message_at]); quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 4 -> assert(quote_replace_short_message_read.original_ask_reference_number_delta[quote_replace_short_message_at] == quote_replace_short_message_written.original_ask_reference_number_delta[quote_replace_short_message_at]); quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 4 -> assert(quote_replace_short_message_read.ask_reference_number_delta[quote_replace_short_message_at] == quote_replace_short_message_written.ask_reference_number_delta[quote_replace_short_message_at]); quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 2 -> assert(quote_replace_short_message_read.short_bid_price[quote_replace_short_message_at] == quote_replace_short_message_written.short_bid_price[quote_replace_short_message_at]); quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 2 -> assert(quote_replace_short_message_read.short_bid_size[quote_replace_short_message_at] == quote_replace_short_message_written.short_bid_size[quote_replace_short_message_at]); quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 2 -> assert(quote_replace_short_message_read.short_ask_price[quote_replace_short_message_at] == quote_replace_short_message_written.short_ask_price[quote_replace_short_message_at]); quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  quote_replace_short_message_at = 0;
  do
  :: quote_replace_short_message_at < 2 -> assert(quote_replace_short_message_read.short_ask_size[quote_replace_short_message_at] == quote_replace_short_message_written.short_ask_size[quote_replace_short_message_at]); quote_replace_short_message_at = quote_replace_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Replace Long Message: 36 bytes ------------------------------------ */

/* This message is sent whenever a quote on the book is replaced. The replaced quote has new reference numbers on both sides. */
typedef QuoteReplaceLongMessage {
  byte nanoseconds[4];
  byte original_bid_reference_number_delta[4];
  byte bid_reference_number_delta[4];
  byte original_ask_reference_number_delta[4];
  byte ask_reference_number_delta[4];
  byte bid_price[4];
  byte bid_size[4];
  byte ask_price[4];
  byte ask_size[4]
};

int quote_replace_long_message_at;

/* every byte of Quote Replace Long Message set to one value */
inline fill_quote_replace_long_message(quote_replace_long_message_record, quote_replace_long_message_value) {
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.nanoseconds[quote_replace_long_message_at] = quote_replace_long_message_value; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.original_bid_reference_number_delta[quote_replace_long_message_at] = quote_replace_long_message_value; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.bid_reference_number_delta[quote_replace_long_message_at] = quote_replace_long_message_value; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.original_ask_reference_number_delta[quote_replace_long_message_at] = quote_replace_long_message_value; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.ask_reference_number_delta[quote_replace_long_message_at] = quote_replace_long_message_value; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.bid_price[quote_replace_long_message_at] = quote_replace_long_message_value; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.bid_size[quote_replace_long_message_at] = quote_replace_long_message_value; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.ask_price[quote_replace_long_message_at] = quote_replace_long_message_value; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.ask_size[quote_replace_long_message_at] = quote_replace_long_message_value; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Replace Long Message set to where it lies, so a field read out of place says so */
inline ramp_quote_replace_long_message(quote_replace_long_message_record, quote_replace_long_message_base) {
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.nanoseconds[quote_replace_long_message_at] = (quote_replace_long_message_base + 0 + quote_replace_long_message_at + 1) % 256; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.original_bid_reference_number_delta[quote_replace_long_message_at] = (quote_replace_long_message_base + 4 + quote_replace_long_message_at + 1) % 256; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.bid_reference_number_delta[quote_replace_long_message_at] = (quote_replace_long_message_base + 8 + quote_replace_long_message_at + 1) % 256; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.original_ask_reference_number_delta[quote_replace_long_message_at] = (quote_replace_long_message_base + 12 + quote_replace_long_message_at + 1) % 256; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.ask_reference_number_delta[quote_replace_long_message_at] = (quote_replace_long_message_base + 16 + quote_replace_long_message_at + 1) % 256; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.bid_price[quote_replace_long_message_at] = (quote_replace_long_message_base + 20 + quote_replace_long_message_at + 1) % 256; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.bid_size[quote_replace_long_message_at] = (quote_replace_long_message_base + 24 + quote_replace_long_message_at + 1) % 256; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.ask_price[quote_replace_long_message_at] = (quote_replace_long_message_base + 28 + quote_replace_long_message_at + 1) % 256; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.ask_size[quote_replace_long_message_at] = (quote_replace_long_message_base + 32 + quote_replace_long_message_at + 1) % 256; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Replace Long Message to the wire, 36 bytes from where the cursor stands */
inline encode_quote_replace_long_message(quote_replace_long_message_record) {
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> wire[at] = quote_replace_long_message_record.nanoseconds[quote_replace_long_message_at]; at = at + 1; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> wire[at] = quote_replace_long_message_record.original_bid_reference_number_delta[quote_replace_long_message_at]; at = at + 1; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> wire[at] = quote_replace_long_message_record.bid_reference_number_delta[quote_replace_long_message_at]; at = at + 1; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> wire[at] = quote_replace_long_message_record.original_ask_reference_number_delta[quote_replace_long_message_at]; at = at + 1; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> wire[at] = quote_replace_long_message_record.ask_reference_number_delta[quote_replace_long_message_at]; at = at + 1; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> wire[at] = quote_replace_long_message_record.bid_price[quote_replace_long_message_at]; at = at + 1; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> wire[at] = quote_replace_long_message_record.bid_size[quote_replace_long_message_at]; at = at + 1; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> wire[at] = quote_replace_long_message_record.ask_price[quote_replace_long_message_at]; at = at + 1; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> wire[at] = quote_replace_long_message_record.ask_size[quote_replace_long_message_at]; at = at + 1; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Replace Long Message off the wire, 36 bytes from where the cursor stands */
inline decode_quote_replace_long_message(quote_replace_long_message_record) {
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.nanoseconds[quote_replace_long_message_at] = wire[at]; at = at + 1; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.original_bid_reference_number_delta[quote_replace_long_message_at] = wire[at]; at = at + 1; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.bid_reference_number_delta[quote_replace_long_message_at] = wire[at]; at = at + 1; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.original_ask_reference_number_delta[quote_replace_long_message_at] = wire[at]; at = at + 1; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.ask_reference_number_delta[quote_replace_long_message_at] = wire[at]; at = at + 1; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.bid_price[quote_replace_long_message_at] = wire[at]; at = at + 1; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.bid_size[quote_replace_long_message_at] = wire[at]; at = at + 1; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.ask_price[quote_replace_long_message_at] = wire[at]; at = at + 1; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> quote_replace_long_message_record.ask_size[quote_replace_long_message_at] = wire[at]; at = at + 1; quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Replace Long Message is what was written, byte for byte */
inline equal_quote_replace_long_message(quote_replace_long_message_read, quote_replace_long_message_written) {
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> assert(quote_replace_long_message_read.nanoseconds[quote_replace_long_message_at] == quote_replace_long_message_written.nanoseconds[quote_replace_long_message_at]); quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> assert(quote_replace_long_message_read.original_bid_reference_number_delta[quote_replace_long_message_at] == quote_replace_long_message_written.original_bid_reference_number_delta[quote_replace_long_message_at]); quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> assert(quote_replace_long_message_read.bid_reference_number_delta[quote_replace_long_message_at] == quote_replace_long_message_written.bid_reference_number_delta[quote_replace_long_message_at]); quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> assert(quote_replace_long_message_read.original_ask_reference_number_delta[quote_replace_long_message_at] == quote_replace_long_message_written.original_ask_reference_number_delta[quote_replace_long_message_at]); quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> assert(quote_replace_long_message_read.ask_reference_number_delta[quote_replace_long_message_at] == quote_replace_long_message_written.ask_reference_number_delta[quote_replace_long_message_at]); quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> assert(quote_replace_long_message_read.bid_price[quote_replace_long_message_at] == quote_replace_long_message_written.bid_price[quote_replace_long_message_at]); quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> assert(quote_replace_long_message_read.bid_size[quote_replace_long_message_at] == quote_replace_long_message_written.bid_size[quote_replace_long_message_at]); quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> assert(quote_replace_long_message_read.ask_price[quote_replace_long_message_at] == quote_replace_long_message_written.ask_price[quote_replace_long_message_at]); quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  quote_replace_long_message_at = 0;
  do
  :: quote_replace_long_message_at < 4 -> assert(quote_replace_long_message_read.ask_size[quote_replace_long_message_at] == quote_replace_long_message_written.ask_size[quote_replace_long_message_at]); quote_replace_long_message_at = quote_replace_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Delete Message: 12 bytes ------------------------------------------ */

/* The message is sent when a single quote is being cancelled. All remaining contracts are no longer accessible so the quote should be removed from the book. */
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

/* ---- Block Delete Message: 10 bytes ------------------------------------------ */

/* This message contains a block of Single Side Deletes. Each reference number inside the block represents an order or a side of a quote that is being cancelled. All remaining contracts are no longer accessible so the side should be removed from the book. */
typedef BlockDeleteMessage {
  byte nanoseconds[4];
  byte number_of_reference_number_deltas[2];
  byte reference_number_delta[4]
};

int block_delete_message_at;

/* every byte of Block Delete Message set to one value */
inline fill_block_delete_message(block_delete_message_record, block_delete_message_value) {
  block_delete_message_at = 0;
  do
  :: block_delete_message_at < 4 -> block_delete_message_record.nanoseconds[block_delete_message_at] = block_delete_message_value; block_delete_message_at = block_delete_message_at + 1
  :: else -> break
  od;
  block_delete_message_at = 0;
  do
  :: block_delete_message_at < 2 -> block_delete_message_record.number_of_reference_number_deltas[block_delete_message_at] = block_delete_message_value; block_delete_message_at = block_delete_message_at + 1
  :: else -> break
  od;
  block_delete_message_at = 0;
  do
  :: block_delete_message_at < 4 -> block_delete_message_record.reference_number_delta[block_delete_message_at] = block_delete_message_value; block_delete_message_at = block_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Block Delete Message set to where it lies, so a field read out of place says so */
inline ramp_block_delete_message(block_delete_message_record, block_delete_message_base) {
  block_delete_message_at = 0;
  do
  :: block_delete_message_at < 4 -> block_delete_message_record.nanoseconds[block_delete_message_at] = (block_delete_message_base + 0 + block_delete_message_at + 1) % 256; block_delete_message_at = block_delete_message_at + 1
  :: else -> break
  od;
  block_delete_message_at = 0;
  do
  :: block_delete_message_at < 2 -> block_delete_message_record.number_of_reference_number_deltas[block_delete_message_at] = (block_delete_message_base + 4 + block_delete_message_at + 1) % 256; block_delete_message_at = block_delete_message_at + 1
  :: else -> break
  od;
  block_delete_message_at = 0;
  do
  :: block_delete_message_at < 4 -> block_delete_message_record.reference_number_delta[block_delete_message_at] = (block_delete_message_base + 6 + block_delete_message_at + 1) % 256; block_delete_message_at = block_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Block Delete Message to the wire, 10 bytes from where the cursor stands */
inline encode_block_delete_message(block_delete_message_record) {
  block_delete_message_at = 0;
  do
  :: block_delete_message_at < 4 -> wire[at] = block_delete_message_record.nanoseconds[block_delete_message_at]; at = at + 1; block_delete_message_at = block_delete_message_at + 1
  :: else -> break
  od;
  block_delete_message_at = 0;
  do
  :: block_delete_message_at < 2 -> wire[at] = block_delete_message_record.number_of_reference_number_deltas[block_delete_message_at]; at = at + 1; block_delete_message_at = block_delete_message_at + 1
  :: else -> break
  od;
  block_delete_message_at = 0;
  do
  :: block_delete_message_at < 4 -> wire[at] = block_delete_message_record.reference_number_delta[block_delete_message_at]; at = at + 1; block_delete_message_at = block_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Block Delete Message off the wire, 10 bytes from where the cursor stands */
inline decode_block_delete_message(block_delete_message_record) {
  block_delete_message_at = 0;
  do
  :: block_delete_message_at < 4 -> block_delete_message_record.nanoseconds[block_delete_message_at] = wire[at]; at = at + 1; block_delete_message_at = block_delete_message_at + 1
  :: else -> break
  od;
  block_delete_message_at = 0;
  do
  :: block_delete_message_at < 2 -> block_delete_message_record.number_of_reference_number_deltas[block_delete_message_at] = wire[at]; at = at + 1; block_delete_message_at = block_delete_message_at + 1
  :: else -> break
  od;
  block_delete_message_at = 0;
  do
  :: block_delete_message_at < 4 -> block_delete_message_record.reference_number_delta[block_delete_message_at] = wire[at]; at = at + 1; block_delete_message_at = block_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Block Delete Message is what was written, byte for byte */
inline equal_block_delete_message(block_delete_message_read, block_delete_message_written) {
  block_delete_message_at = 0;
  do
  :: block_delete_message_at < 4 -> assert(block_delete_message_read.nanoseconds[block_delete_message_at] == block_delete_message_written.nanoseconds[block_delete_message_at]); block_delete_message_at = block_delete_message_at + 1
  :: else -> break
  od;
  block_delete_message_at = 0;
  do
  :: block_delete_message_at < 2 -> assert(block_delete_message_read.number_of_reference_number_deltas[block_delete_message_at] == block_delete_message_written.number_of_reference_number_deltas[block_delete_message_at]); block_delete_message_at = block_delete_message_at + 1
  :: else -> break
  od;
  block_delete_message_at = 0;
  do
  :: block_delete_message_at < 4 -> assert(block_delete_message_read.reference_number_delta[block_delete_message_at] == block_delete_message_written.reference_number_delta[block_delete_message_at]); block_delete_message_at = block_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Non Auction Options Trade Message: 25 bytes ----------------------------- */

/* This Options Trade Message is designed to provide execution details for match events involving non-displayable order types and Complex orders. (Note: There is a separate message for Option auction events.) */
typedef NonAuctionOptionsTradeMessage {
  byte nanoseconds[4];
  byte trade_indicator;
  byte option_id[4];
  byte cross_number[4];
  byte match_number[4];
  byte price[4];
  byte volume[4]
};

int non_auction_options_trade_message_at;

/* every byte of Non Auction Options Trade Message set to one value */
inline fill_non_auction_options_trade_message(non_auction_options_trade_message_record, non_auction_options_trade_message_value) {
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> non_auction_options_trade_message_record.nanoseconds[non_auction_options_trade_message_at] = non_auction_options_trade_message_value; non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  non_auction_options_trade_message_record.trade_indicator = non_auction_options_trade_message_value;
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> non_auction_options_trade_message_record.option_id[non_auction_options_trade_message_at] = non_auction_options_trade_message_value; non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> non_auction_options_trade_message_record.cross_number[non_auction_options_trade_message_at] = non_auction_options_trade_message_value; non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> non_auction_options_trade_message_record.match_number[non_auction_options_trade_message_at] = non_auction_options_trade_message_value; non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> non_auction_options_trade_message_record.price[non_auction_options_trade_message_at] = non_auction_options_trade_message_value; non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> non_auction_options_trade_message_record.volume[non_auction_options_trade_message_at] = non_auction_options_trade_message_value; non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Non Auction Options Trade Message set to where it lies, so a field read out of place says so */
inline ramp_non_auction_options_trade_message(non_auction_options_trade_message_record, non_auction_options_trade_message_base) {
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> non_auction_options_trade_message_record.nanoseconds[non_auction_options_trade_message_at] = (non_auction_options_trade_message_base + 0 + non_auction_options_trade_message_at + 1) % 256; non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  non_auction_options_trade_message_record.trade_indicator = (non_auction_options_trade_message_base + 4 + 1) % 256;
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> non_auction_options_trade_message_record.option_id[non_auction_options_trade_message_at] = (non_auction_options_trade_message_base + 5 + non_auction_options_trade_message_at + 1) % 256; non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> non_auction_options_trade_message_record.cross_number[non_auction_options_trade_message_at] = (non_auction_options_trade_message_base + 9 + non_auction_options_trade_message_at + 1) % 256; non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> non_auction_options_trade_message_record.match_number[non_auction_options_trade_message_at] = (non_auction_options_trade_message_base + 13 + non_auction_options_trade_message_at + 1) % 256; non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> non_auction_options_trade_message_record.price[non_auction_options_trade_message_at] = (non_auction_options_trade_message_base + 17 + non_auction_options_trade_message_at + 1) % 256; non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> non_auction_options_trade_message_record.volume[non_auction_options_trade_message_at] = (non_auction_options_trade_message_base + 21 + non_auction_options_trade_message_at + 1) % 256; non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Non Auction Options Trade Message to the wire, 25 bytes from where the cursor stands */
inline encode_non_auction_options_trade_message(non_auction_options_trade_message_record) {
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> wire[at] = non_auction_options_trade_message_record.nanoseconds[non_auction_options_trade_message_at]; at = at + 1; non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = non_auction_options_trade_message_record.trade_indicator; at = at + 1;
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> wire[at] = non_auction_options_trade_message_record.option_id[non_auction_options_trade_message_at]; at = at + 1; non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> wire[at] = non_auction_options_trade_message_record.cross_number[non_auction_options_trade_message_at]; at = at + 1; non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> wire[at] = non_auction_options_trade_message_record.match_number[non_auction_options_trade_message_at]; at = at + 1; non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> wire[at] = non_auction_options_trade_message_record.price[non_auction_options_trade_message_at]; at = at + 1; non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> wire[at] = non_auction_options_trade_message_record.volume[non_auction_options_trade_message_at]; at = at + 1; non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Non Auction Options Trade Message off the wire, 25 bytes from where the cursor stands */
inline decode_non_auction_options_trade_message(non_auction_options_trade_message_record) {
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> non_auction_options_trade_message_record.nanoseconds[non_auction_options_trade_message_at] = wire[at]; at = at + 1; non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  non_auction_options_trade_message_record.trade_indicator = wire[at]; at = at + 1;
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> non_auction_options_trade_message_record.option_id[non_auction_options_trade_message_at] = wire[at]; at = at + 1; non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> non_auction_options_trade_message_record.cross_number[non_auction_options_trade_message_at] = wire[at]; at = at + 1; non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> non_auction_options_trade_message_record.match_number[non_auction_options_trade_message_at] = wire[at]; at = at + 1; non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> non_auction_options_trade_message_record.price[non_auction_options_trade_message_at] = wire[at]; at = at + 1; non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> non_auction_options_trade_message_record.volume[non_auction_options_trade_message_at] = wire[at]; at = at + 1; non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Non Auction Options Trade Message is what was written, byte for byte */
inline equal_non_auction_options_trade_message(non_auction_options_trade_message_read, non_auction_options_trade_message_written) {
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> assert(non_auction_options_trade_message_read.nanoseconds[non_auction_options_trade_message_at] == non_auction_options_trade_message_written.nanoseconds[non_auction_options_trade_message_at]); non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  assert(non_auction_options_trade_message_read.trade_indicator == non_auction_options_trade_message_written.trade_indicator);
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> assert(non_auction_options_trade_message_read.option_id[non_auction_options_trade_message_at] == non_auction_options_trade_message_written.option_id[non_auction_options_trade_message_at]); non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> assert(non_auction_options_trade_message_read.cross_number[non_auction_options_trade_message_at] == non_auction_options_trade_message_written.cross_number[non_auction_options_trade_message_at]); non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> assert(non_auction_options_trade_message_read.match_number[non_auction_options_trade_message_at] == non_auction_options_trade_message_written.match_number[non_auction_options_trade_message_at]); non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> assert(non_auction_options_trade_message_read.price[non_auction_options_trade_message_at] == non_auction_options_trade_message_written.price[non_auction_options_trade_message_at]); non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  non_auction_options_trade_message_at = 0;
  do
  :: non_auction_options_trade_message_at < 4 -> assert(non_auction_options_trade_message_read.volume[non_auction_options_trade_message_at] == non_auction_options_trade_message_written.volume[non_auction_options_trade_message_at]); non_auction_options_trade_message_at = non_auction_options_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Options Cross Trade Message: 25 bytes ----------------------------------- */

/* Options Auction Trade message is sent for every option when an auction in that option is completed. The message indicates the bulk volume associated with the auction event. */
typedef OptionsCrossTradeMessage {
  byte nanoseconds[4];
  byte option_id[4];
  byte cross_number[4];
  byte match_number[4];
  byte cross_type;
  byte price[4];
  byte volume[4]
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
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.price[options_cross_trade_message_at] = options_cross_trade_message_value; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.volume[options_cross_trade_message_at] = options_cross_trade_message_value; options_cross_trade_message_at = options_cross_trade_message_at + 1
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
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.price[options_cross_trade_message_at] = (options_cross_trade_message_base + 17 + options_cross_trade_message_at + 1) % 256; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.volume[options_cross_trade_message_at] = (options_cross_trade_message_base + 21 + options_cross_trade_message_at + 1) % 256; options_cross_trade_message_at = options_cross_trade_message_at + 1
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
  :: options_cross_trade_message_at < 4 -> wire[at] = options_cross_trade_message_record.price[options_cross_trade_message_at]; at = at + 1; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> wire[at] = options_cross_trade_message_record.volume[options_cross_trade_message_at]; at = at + 1; options_cross_trade_message_at = options_cross_trade_message_at + 1
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
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.price[options_cross_trade_message_at] = wire[at]; at = at + 1; options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> options_cross_trade_message_record.volume[options_cross_trade_message_at] = wire[at]; at = at + 1; options_cross_trade_message_at = options_cross_trade_message_at + 1
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
  :: options_cross_trade_message_at < 4 -> assert(options_cross_trade_message_read.price[options_cross_trade_message_at] == options_cross_trade_message_written.price[options_cross_trade_message_at]); options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  options_cross_trade_message_at = 0;
  do
  :: options_cross_trade_message_at < 4 -> assert(options_cross_trade_message_read.volume[options_cross_trade_message_at] == options_cross_trade_message_written.volume[options_cross_trade_message_at]); options_cross_trade_message_at = options_cross_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Broken Trade Order Executed Message: 12 bytes --------------------------- */

/* The Broken Trade Message is sent whenever an execution on PHLX ® is broken. An execution may be broken if it is found to be “clearly erroneous” pursuant to PHLX ® Clearly Erroneous Policy. A trade break is final; once a trade is broken, it cannot be reinstated. */
typedef BrokenTradeOrderExecutedMessage {
  byte nanoseconds[4];
  byte cross_number[4];
  byte match_number[4]
};

int broken_trade_order_executed_message_at;

/* every byte of Broken Trade Order Executed Message set to one value */
inline fill_broken_trade_order_executed_message(broken_trade_order_executed_message_record, broken_trade_order_executed_message_value) {
  broken_trade_order_executed_message_at = 0;
  do
  :: broken_trade_order_executed_message_at < 4 -> broken_trade_order_executed_message_record.nanoseconds[broken_trade_order_executed_message_at] = broken_trade_order_executed_message_value; broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
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
  :: broken_trade_order_executed_message_at < 4 -> broken_trade_order_executed_message_record.nanoseconds[broken_trade_order_executed_message_at] = (broken_trade_order_executed_message_base + 0 + broken_trade_order_executed_message_at + 1) % 256; broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
  :: else -> break
  od;
  broken_trade_order_executed_message_at = 0;
  do
  :: broken_trade_order_executed_message_at < 4 -> broken_trade_order_executed_message_record.cross_number[broken_trade_order_executed_message_at] = (broken_trade_order_executed_message_base + 4 + broken_trade_order_executed_message_at + 1) % 256; broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
  :: else -> break
  od;
  broken_trade_order_executed_message_at = 0;
  do
  :: broken_trade_order_executed_message_at < 4 -> broken_trade_order_executed_message_record.match_number[broken_trade_order_executed_message_at] = (broken_trade_order_executed_message_base + 8 + broken_trade_order_executed_message_at + 1) % 256; broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Broken Trade Order Executed Message to the wire, 12 bytes from where the cursor stands */
inline encode_broken_trade_order_executed_message(broken_trade_order_executed_message_record) {
  broken_trade_order_executed_message_at = 0;
  do
  :: broken_trade_order_executed_message_at < 4 -> wire[at] = broken_trade_order_executed_message_record.nanoseconds[broken_trade_order_executed_message_at]; at = at + 1; broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
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

/* Broken Trade Order Executed Message off the wire, 12 bytes from where the cursor stands */
inline decode_broken_trade_order_executed_message(broken_trade_order_executed_message_record) {
  broken_trade_order_executed_message_at = 0;
  do
  :: broken_trade_order_executed_message_at < 4 -> broken_trade_order_executed_message_record.nanoseconds[broken_trade_order_executed_message_at] = wire[at]; at = at + 1; broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
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
  :: broken_trade_order_executed_message_at < 4 -> assert(broken_trade_order_executed_message_read.nanoseconds[broken_trade_order_executed_message_at] == broken_trade_order_executed_message_written.nanoseconds[broken_trade_order_executed_message_at]); broken_trade_order_executed_message_at = broken_trade_order_executed_message_at + 1
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

/* ---- Auction Notification Message: 30 bytes ---------------------------------- */

/* This message is also sent as notification that there is an exposed buy (sell) order available for execution at the National Best Offer (Bid). */
typedef AuctionNotificationMessage {
  byte nanoseconds[4];
  byte auction_id[4];
  byte auction_type;
  byte paired_contracts[4];
  byte imbalance_direction;
  byte option_id[4];
  byte imbalance_price[4];
  byte imbalance_volume[4];
  byte customer_indicator;
  byte reserved_3[3]
};

int auction_notification_message_at;

/* every byte of Auction Notification Message set to one value */
inline fill_auction_notification_message(auction_notification_message_record, auction_notification_message_value) {
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.nanoseconds[auction_notification_message_at] = auction_notification_message_value; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.auction_id[auction_notification_message_at] = auction_notification_message_value; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_record.auction_type = auction_notification_message_value;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.paired_contracts[auction_notification_message_at] = auction_notification_message_value; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_record.imbalance_direction = auction_notification_message_value;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.option_id[auction_notification_message_at] = auction_notification_message_value; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.imbalance_price[auction_notification_message_at] = auction_notification_message_value; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.imbalance_volume[auction_notification_message_at] = auction_notification_message_value; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_record.customer_indicator = auction_notification_message_value;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 3 -> auction_notification_message_record.reserved_3[auction_notification_message_at] = auction_notification_message_value; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Notification Message set to where it lies, so a field read out of place says so */
inline ramp_auction_notification_message(auction_notification_message_record, auction_notification_message_base) {
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.nanoseconds[auction_notification_message_at] = (auction_notification_message_base + 0 + auction_notification_message_at + 1) % 256; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.auction_id[auction_notification_message_at] = (auction_notification_message_base + 4 + auction_notification_message_at + 1) % 256; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_record.auction_type = (auction_notification_message_base + 8 + 1) % 256;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.paired_contracts[auction_notification_message_at] = (auction_notification_message_base + 9 + auction_notification_message_at + 1) % 256; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_record.imbalance_direction = (auction_notification_message_base + 13 + 1) % 256;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.option_id[auction_notification_message_at] = (auction_notification_message_base + 14 + auction_notification_message_at + 1) % 256; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.imbalance_price[auction_notification_message_at] = (auction_notification_message_base + 18 + auction_notification_message_at + 1) % 256; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.imbalance_volume[auction_notification_message_at] = (auction_notification_message_base + 22 + auction_notification_message_at + 1) % 256; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_record.customer_indicator = (auction_notification_message_base + 26 + 1) % 256;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 3 -> auction_notification_message_record.reserved_3[auction_notification_message_at] = (auction_notification_message_base + 27 + auction_notification_message_at + 1) % 256; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Notification Message to the wire, 30 bytes from where the cursor stands */
inline encode_auction_notification_message(auction_notification_message_record) {
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> wire[at] = auction_notification_message_record.nanoseconds[auction_notification_message_at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> wire[at] = auction_notification_message_record.auction_id[auction_notification_message_at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_notification_message_record.auction_type; at = at + 1;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> wire[at] = auction_notification_message_record.paired_contracts[auction_notification_message_at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_notification_message_record.imbalance_direction; at = at + 1;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> wire[at] = auction_notification_message_record.option_id[auction_notification_message_at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> wire[at] = auction_notification_message_record.imbalance_price[auction_notification_message_at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> wire[at] = auction_notification_message_record.imbalance_volume[auction_notification_message_at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_notification_message_record.customer_indicator; at = at + 1;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 3 -> wire[at] = auction_notification_message_record.reserved_3[auction_notification_message_at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Notification Message off the wire, 30 bytes from where the cursor stands */
inline decode_auction_notification_message(auction_notification_message_record) {
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.nanoseconds[auction_notification_message_at] = wire[at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.auction_id[auction_notification_message_at] = wire[at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_record.auction_type = wire[at]; at = at + 1;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.paired_contracts[auction_notification_message_at] = wire[at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_record.imbalance_direction = wire[at]; at = at + 1;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.option_id[auction_notification_message_at] = wire[at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.imbalance_price[auction_notification_message_at] = wire[at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.imbalance_volume[auction_notification_message_at] = wire[at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_record.customer_indicator = wire[at]; at = at + 1;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 3 -> auction_notification_message_record.reserved_3[auction_notification_message_at] = wire[at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Notification Message is what was written, byte for byte */
inline equal_auction_notification_message(auction_notification_message_read, auction_notification_message_written) {
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> assert(auction_notification_message_read.nanoseconds[auction_notification_message_at] == auction_notification_message_written.nanoseconds[auction_notification_message_at]); auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> assert(auction_notification_message_read.auction_id[auction_notification_message_at] == auction_notification_message_written.auction_id[auction_notification_message_at]); auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  assert(auction_notification_message_read.auction_type == auction_notification_message_written.auction_type);
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> assert(auction_notification_message_read.paired_contracts[auction_notification_message_at] == auction_notification_message_written.paired_contracts[auction_notification_message_at]); auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  assert(auction_notification_message_read.imbalance_direction == auction_notification_message_written.imbalance_direction);
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> assert(auction_notification_message_read.option_id[auction_notification_message_at] == auction_notification_message_written.option_id[auction_notification_message_at]); auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> assert(auction_notification_message_read.imbalance_price[auction_notification_message_at] == auction_notification_message_written.imbalance_price[auction_notification_message_at]); auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> assert(auction_notification_message_read.imbalance_volume[auction_notification_message_at] == auction_notification_message_written.imbalance_volume[auction_notification_message_at]); auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  assert(auction_notification_message_read.customer_indicator == auction_notification_message_written.customer_indicator);
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 3 -> assert(auction_notification_message_read.reserved_3[auction_notification_message_at] == auction_notification_message_written.reserved_3[auction_notification_message_at]); auction_notification_message_at = auction_notification_message_at + 1
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
    assert(at == 39);
    at = 0;
    decode_option_directory_message(option_directory_message_got);
    assert(at == 39);
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
    assert(at == 9);
    at = 0;
    decode_trading_action_message(trading_action_message_got);
    assert(at == 9);
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
    assert(at == 9);
    at = 0;
    decode_security_open_message(security_open_message_got);
    assert(at == 9);
    equal_security_open_message(security_open_message_got, security_open_message_sent)
  }
}

/* Add Order Short Message: encoded, read back, and compared */
proctype check_add_order_short_message() {
  AddOrderShortMessage add_order_short_message_sent;
  AddOrderShortMessage add_order_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_short_message(add_order_short_message_sent, 0)
  :: pattern == 1 -> fill_add_order_short_message(add_order_short_message_sent, 32)
  :: pattern == 2 -> fill_add_order_short_message(add_order_short_message_sent, 255)
  :: else -> ramp_add_order_short_message(add_order_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_short_message(add_order_short_message_sent);
    assert(at == 21);
    at = 0;
    decode_add_order_short_message(add_order_short_message_got);
    assert(at == 21);
    equal_add_order_short_message(add_order_short_message_got, add_order_short_message_sent)
  }
}

/* Add Order Long Message: encoded, read back, and compared */
proctype check_add_order_long_message() {
  AddOrderLongMessage add_order_long_message_sent;
  AddOrderLongMessage add_order_long_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_long_message(add_order_long_message_sent, 0)
  :: pattern == 1 -> fill_add_order_long_message(add_order_long_message_sent, 32)
  :: pattern == 2 -> fill_add_order_long_message(add_order_long_message_sent, 255)
  :: else -> ramp_add_order_long_message(add_order_long_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_long_message(add_order_long_message_sent);
    assert(at == 25);
    at = 0;
    decode_add_order_long_message(add_order_long_message_got);
    assert(at == 25);
    equal_add_order_long_message(add_order_long_message_got, add_order_long_message_sent)
  }
}

/* Add Quote Short Message: encoded, read back, and compared */
proctype check_add_quote_short_message() {
  AddQuoteShortMessage add_quote_short_message_sent;
  AddQuoteShortMessage add_quote_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_quote_short_message(add_quote_short_message_sent, 0)
  :: pattern == 1 -> fill_add_quote_short_message(add_quote_short_message_sent, 32)
  :: pattern == 2 -> fill_add_quote_short_message(add_quote_short_message_sent, 255)
  :: else -> ramp_add_quote_short_message(add_quote_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_quote_short_message(add_quote_short_message_sent);
    assert(at == 24);
    at = 0;
    decode_add_quote_short_message(add_quote_short_message_got);
    assert(at == 24);
    equal_add_quote_short_message(add_quote_short_message_got, add_quote_short_message_sent)
  }
}

/* Add Quote Long Message: encoded, read back, and compared */
proctype check_add_quote_long_message() {
  AddQuoteLongMessage add_quote_long_message_sent;
  AddQuoteLongMessage add_quote_long_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_quote_long_message(add_quote_long_message_sent, 0)
  :: pattern == 1 -> fill_add_quote_long_message(add_quote_long_message_sent, 32)
  :: pattern == 2 -> fill_add_quote_long_message(add_quote_long_message_sent, 255)
  :: else -> ramp_add_quote_long_message(add_quote_long_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_quote_long_message(add_quote_long_message_sent);
    assert(at == 32);
    at = 0;
    decode_add_quote_long_message(add_quote_long_message_got);
    assert(at == 32);
    equal_add_quote_long_message(add_quote_long_message_got, add_quote_long_message_sent)
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

/* Single Side Cancel Message: encoded, read back, and compared */
proctype check_single_side_cancel_message() {
  SingleSideCancelMessage single_side_cancel_message_sent;
  SingleSideCancelMessage single_side_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_side_cancel_message(single_side_cancel_message_sent, 0)
  :: pattern == 1 -> fill_single_side_cancel_message(single_side_cancel_message_sent, 32)
  :: pattern == 2 -> fill_single_side_cancel_message(single_side_cancel_message_sent, 255)
  :: else -> ramp_single_side_cancel_message(single_side_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_side_cancel_message(single_side_cancel_message_sent);
    assert(at == 12);
    at = 0;
    decode_single_side_cancel_message(single_side_cancel_message_got);
    assert(at == 12);
    equal_single_side_cancel_message(single_side_cancel_message_got, single_side_cancel_message_sent)
  }
}

/* Single Side Replace Short Message: encoded, read back, and compared */
proctype check_single_side_replace_short_message() {
  SingleSideReplaceShortMessage single_side_replace_short_message_sent;
  SingleSideReplaceShortMessage single_side_replace_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_side_replace_short_message(single_side_replace_short_message_sent, 0)
  :: pattern == 1 -> fill_single_side_replace_short_message(single_side_replace_short_message_sent, 32)
  :: pattern == 2 -> fill_single_side_replace_short_message(single_side_replace_short_message_sent, 255)
  :: else -> ramp_single_side_replace_short_message(single_side_replace_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_side_replace_short_message(single_side_replace_short_message_sent);
    assert(at == 16);
    at = 0;
    decode_single_side_replace_short_message(single_side_replace_short_message_got);
    assert(at == 16);
    equal_single_side_replace_short_message(single_side_replace_short_message_got, single_side_replace_short_message_sent)
  }
}

/* Single Side Replace Long Message: encoded, read back, and compared */
proctype check_single_side_replace_long_message() {
  SingleSideReplaceLongMessage single_side_replace_long_message_sent;
  SingleSideReplaceLongMessage single_side_replace_long_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_side_replace_long_message(single_side_replace_long_message_sent, 0)
  :: pattern == 1 -> fill_single_side_replace_long_message(single_side_replace_long_message_sent, 32)
  :: pattern == 2 -> fill_single_side_replace_long_message(single_side_replace_long_message_sent, 255)
  :: else -> ramp_single_side_replace_long_message(single_side_replace_long_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_side_replace_long_message(single_side_replace_long_message_sent);
    assert(at == 20);
    at = 0;
    decode_single_side_replace_long_message(single_side_replace_long_message_got);
    assert(at == 20);
    equal_single_side_replace_long_message(single_side_replace_long_message_got, single_side_replace_long_message_sent)
  }
}

/* Order Replace Short Message: encoded, read back, and compared */
proctype check_order_replace_short_message() {
  OrderReplaceShortMessage order_replace_short_message_sent;
  OrderReplaceShortMessage order_replace_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_replace_short_message(order_replace_short_message_sent, 0)
  :: pattern == 1 -> fill_order_replace_short_message(order_replace_short_message_sent, 32)
  :: pattern == 2 -> fill_order_replace_short_message(order_replace_short_message_sent, 255)
  :: else -> ramp_order_replace_short_message(order_replace_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_replace_short_message(order_replace_short_message_sent);
    assert(at == 20);
    at = 0;
    decode_order_replace_short_message(order_replace_short_message_got);
    assert(at == 20);
    equal_order_replace_short_message(order_replace_short_message_got, order_replace_short_message_sent)
  }
}

/* Order Replace Long Message: encoded, read back, and compared */
proctype check_order_replace_long_message() {
  OrderReplaceLongMessage order_replace_long_message_sent;
  OrderReplaceLongMessage order_replace_long_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_replace_long_message(order_replace_long_message_sent, 0)
  :: pattern == 1 -> fill_order_replace_long_message(order_replace_long_message_sent, 32)
  :: pattern == 2 -> fill_order_replace_long_message(order_replace_long_message_sent, 255)
  :: else -> ramp_order_replace_long_message(order_replace_long_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_replace_long_message(order_replace_long_message_sent);
    assert(at == 24);
    at = 0;
    decode_order_replace_long_message(order_replace_long_message_got);
    assert(at == 24);
    equal_order_replace_long_message(order_replace_long_message_got, order_replace_long_message_sent)
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

/* Quote Replace Short Message: encoded, read back, and compared */
proctype check_quote_replace_short_message() {
  QuoteReplaceShortMessage quote_replace_short_message_sent;
  QuoteReplaceShortMessage quote_replace_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_replace_short_message(quote_replace_short_message_sent, 0)
  :: pattern == 1 -> fill_quote_replace_short_message(quote_replace_short_message_sent, 32)
  :: pattern == 2 -> fill_quote_replace_short_message(quote_replace_short_message_sent, 255)
  :: else -> ramp_quote_replace_short_message(quote_replace_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_replace_short_message(quote_replace_short_message_sent);
    assert(at == 28);
    at = 0;
    decode_quote_replace_short_message(quote_replace_short_message_got);
    assert(at == 28);
    equal_quote_replace_short_message(quote_replace_short_message_got, quote_replace_short_message_sent)
  }
}

/* Quote Replace Long Message: encoded, read back, and compared */
proctype check_quote_replace_long_message() {
  QuoteReplaceLongMessage quote_replace_long_message_sent;
  QuoteReplaceLongMessage quote_replace_long_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_replace_long_message(quote_replace_long_message_sent, 0)
  :: pattern == 1 -> fill_quote_replace_long_message(quote_replace_long_message_sent, 32)
  :: pattern == 2 -> fill_quote_replace_long_message(quote_replace_long_message_sent, 255)
  :: else -> ramp_quote_replace_long_message(quote_replace_long_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_replace_long_message(quote_replace_long_message_sent);
    assert(at == 36);
    at = 0;
    decode_quote_replace_long_message(quote_replace_long_message_got);
    assert(at == 36);
    equal_quote_replace_long_message(quote_replace_long_message_got, quote_replace_long_message_sent)
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

/* Block Delete Message: encoded, read back, and compared */
proctype check_block_delete_message() {
  BlockDeleteMessage block_delete_message_sent;
  BlockDeleteMessage block_delete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_block_delete_message(block_delete_message_sent, 0)
  :: pattern == 1 -> fill_block_delete_message(block_delete_message_sent, 32)
  :: pattern == 2 -> fill_block_delete_message(block_delete_message_sent, 255)
  :: else -> ramp_block_delete_message(block_delete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_block_delete_message(block_delete_message_sent);
    assert(at == 10);
    at = 0;
    decode_block_delete_message(block_delete_message_got);
    assert(at == 10);
    equal_block_delete_message(block_delete_message_got, block_delete_message_sent)
  }
}

/* Non Auction Options Trade Message: encoded, read back, and compared */
proctype check_non_auction_options_trade_message() {
  NonAuctionOptionsTradeMessage non_auction_options_trade_message_sent;
  NonAuctionOptionsTradeMessage non_auction_options_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_non_auction_options_trade_message(non_auction_options_trade_message_sent, 0)
  :: pattern == 1 -> fill_non_auction_options_trade_message(non_auction_options_trade_message_sent, 32)
  :: pattern == 2 -> fill_non_auction_options_trade_message(non_auction_options_trade_message_sent, 255)
  :: else -> ramp_non_auction_options_trade_message(non_auction_options_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_non_auction_options_trade_message(non_auction_options_trade_message_sent);
    assert(at == 25);
    at = 0;
    decode_non_auction_options_trade_message(non_auction_options_trade_message_got);
    assert(at == 25);
    equal_non_auction_options_trade_message(non_auction_options_trade_message_got, non_auction_options_trade_message_sent)
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
    assert(at == 12);
    at = 0;
    decode_broken_trade_order_executed_message(broken_trade_order_executed_message_got);
    assert(at == 12);
    equal_broken_trade_order_executed_message(broken_trade_order_executed_message_got, broken_trade_order_executed_message_sent)
  }
}

/* Auction Notification Message: encoded, read back, and compared */
proctype check_auction_notification_message() {
  AuctionNotificationMessage auction_notification_message_sent;
  AuctionNotificationMessage auction_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_notification_message(auction_notification_message_sent, 0)
  :: pattern == 1 -> fill_auction_notification_message(auction_notification_message_sent, 32)
  :: pattern == 2 -> fill_auction_notification_message(auction_notification_message_sent, 255)
  :: else -> ramp_auction_notification_message(auction_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_notification_message(auction_notification_message_sent);
    assert(at == 30);
    at = 0;
    decode_auction_notification_message(auction_notification_message_got);
    assert(at == 30);
    equal_auction_notification_message(auction_notification_message_got, auction_notification_message_sent)
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
  :: run check_option_directory_message()
  :: run check_trading_action_message()
  :: run check_security_open_message()
  :: run check_add_order_short_message()
  :: run check_add_order_long_message()
  :: run check_add_quote_short_message()
  :: run check_add_quote_long_message()
  :: run check_single_side_executed_message()
  :: run check_single_side_executed_with_price_message()
  :: run check_single_side_cancel_message()
  :: run check_single_side_replace_short_message()
  :: run check_single_side_replace_long_message()
  :: run check_order_replace_short_message()
  :: run check_order_replace_long_message()
  :: run check_single_side_delete_message()
  :: run check_single_side_update_message()
  :: run check_quote_replace_short_message()
  :: run check_quote_replace_long_message()
  :: run check_quote_delete_message()
  :: run check_block_delete_message()
  :: run check_non_auction_options_trade_message()
  :: run check_options_cross_trade_message()
  :: run check_broken_trade_order_executed_message()
  :: run check_auction_notification_message()
  fi
}
