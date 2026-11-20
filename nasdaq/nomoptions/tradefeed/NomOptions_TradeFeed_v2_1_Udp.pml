/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Trade Feed
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
#define WIRE 62

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

/* Derivative Directory Message for active options symbols. */
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

/* ---- Trade Message: 43 bytes ------------------------------------------------- */

/* The Trade Report message will be used to relay execution system transactions that are reported during the current business day. */
typedef TradeMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte cross_id[4];
  byte trade_condition;
  byte price[4];
  byte volume[4];
  byte reserved_16[16]
};

int trade_message_at;

/* every byte of Trade Message set to one value */
inline fill_trade_message(trade_message_record, trade_message_value) {
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.tracking_number[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.timestamp[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.instrument_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.cross_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_condition = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.price[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.volume[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 16 -> trade_message_record.reserved_16[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Message set to where it lies, so a field read out of place says so */
inline ramp_trade_message(trade_message_record, trade_message_base) {
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.tracking_number[trade_message_at] = (trade_message_base + 0 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.timestamp[trade_message_at] = (trade_message_base + 2 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.instrument_id[trade_message_at] = (trade_message_base + 10 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.cross_id[trade_message_at] = (trade_message_base + 14 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_condition = (trade_message_base + 18 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.price[trade_message_at] = (trade_message_base + 19 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.volume[trade_message_at] = (trade_message_base + 23 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 16 -> trade_message_record.reserved_16[trade_message_at] = (trade_message_base + 27 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message to the wire, 43 bytes from where the cursor stands */
inline encode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> wire[at] = trade_message_record.tracking_number[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.timestamp[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.instrument_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.cross_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.trade_condition; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.price[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.volume[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 16 -> wire[at] = trade_message_record.reserved_16[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message off the wire, 43 bytes from where the cursor stands */
inline decode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.tracking_number[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.timestamp[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.instrument_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.cross_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_condition = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.price[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.volume[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 16 -> trade_message_record.reserved_16[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Message is what was written, byte for byte */
inline equal_trade_message(trade_message_read, trade_message_written) {
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> assert(trade_message_read.tracking_number[trade_message_at] == trade_message_written.tracking_number[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.timestamp[trade_message_at] == trade_message_written.timestamp[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.instrument_id[trade_message_at] == trade_message_written.instrument_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.cross_id[trade_message_at] == trade_message_written.cross_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.trade_condition == trade_message_written.trade_condition);
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.price[trade_message_at] == trade_message_written.price[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.volume[trade_message_at] == trade_message_written.volume[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 16 -> assert(trade_message_read.reserved_16[trade_message_at] == trade_message_written.reserved_16[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Broken Trade Report Message: 26 bytes ----------------------------------- */

/* The Broken Trade Report message is used in the event that an options trade transaction is broken on the same business day that it is reported. */
typedef BrokenTradeReportMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte original_cross_id[4];
  byte original_price[4];
  byte original_volume[4]
};

int broken_trade_report_message_at;

/* every byte of Broken Trade Report Message set to one value */
inline fill_broken_trade_report_message(broken_trade_report_message_record, broken_trade_report_message_value) {
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 2 -> broken_trade_report_message_record.tracking_number[broken_trade_report_message_at] = broken_trade_report_message_value; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 8 -> broken_trade_report_message_record.timestamp[broken_trade_report_message_at] = broken_trade_report_message_value; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> broken_trade_report_message_record.instrument_id[broken_trade_report_message_at] = broken_trade_report_message_value; broken_trade_report_message_at = broken_trade_report_message_at + 1
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
  :: broken_trade_report_message_at < 2 -> broken_trade_report_message_record.tracking_number[broken_trade_report_message_at] = (broken_trade_report_message_base + 0 + broken_trade_report_message_at + 1) % 256; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 8 -> broken_trade_report_message_record.timestamp[broken_trade_report_message_at] = (broken_trade_report_message_base + 2 + broken_trade_report_message_at + 1) % 256; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> broken_trade_report_message_record.instrument_id[broken_trade_report_message_at] = (broken_trade_report_message_base + 10 + broken_trade_report_message_at + 1) % 256; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> broken_trade_report_message_record.original_cross_id[broken_trade_report_message_at] = (broken_trade_report_message_base + 14 + broken_trade_report_message_at + 1) % 256; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> broken_trade_report_message_record.original_price[broken_trade_report_message_at] = (broken_trade_report_message_base + 18 + broken_trade_report_message_at + 1) % 256; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> broken_trade_report_message_record.original_volume[broken_trade_report_message_at] = (broken_trade_report_message_base + 22 + broken_trade_report_message_at + 1) % 256; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Broken Trade Report Message to the wire, 26 bytes from where the cursor stands */
inline encode_broken_trade_report_message(broken_trade_report_message_record) {
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 2 -> wire[at] = broken_trade_report_message_record.tracking_number[broken_trade_report_message_at]; at = at + 1; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 8 -> wire[at] = broken_trade_report_message_record.timestamp[broken_trade_report_message_at]; at = at + 1; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> wire[at] = broken_trade_report_message_record.instrument_id[broken_trade_report_message_at]; at = at + 1; broken_trade_report_message_at = broken_trade_report_message_at + 1
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

/* Broken Trade Report Message off the wire, 26 bytes from where the cursor stands */
inline decode_broken_trade_report_message(broken_trade_report_message_record) {
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 2 -> broken_trade_report_message_record.tracking_number[broken_trade_report_message_at] = wire[at]; at = at + 1; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 8 -> broken_trade_report_message_record.timestamp[broken_trade_report_message_at] = wire[at]; at = at + 1; broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> broken_trade_report_message_record.instrument_id[broken_trade_report_message_at] = wire[at]; at = at + 1; broken_trade_report_message_at = broken_trade_report_message_at + 1
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
  :: broken_trade_report_message_at < 2 -> assert(broken_trade_report_message_read.tracking_number[broken_trade_report_message_at] == broken_trade_report_message_written.tracking_number[broken_trade_report_message_at]); broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 8 -> assert(broken_trade_report_message_read.timestamp[broken_trade_report_message_at] == broken_trade_report_message_written.timestamp[broken_trade_report_message_at]); broken_trade_report_message_at = broken_trade_report_message_at + 1
  :: else -> break
  od;
  broken_trade_report_message_at = 0;
  do
  :: broken_trade_report_message_at < 4 -> assert(broken_trade_report_message_read.instrument_id[broken_trade_report_message_at] == broken_trade_report_message_written.instrument_id[broken_trade_report_message_at]); broken_trade_report_message_at = broken_trade_report_message_at + 1
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

/* Trade Message: encoded, read back, and compared */
proctype check_trade_message() {
  TradeMessage trade_message_sent;
  TradeMessage trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_message(trade_message_sent, 0)
  :: pattern == 1 -> fill_trade_message(trade_message_sent, 32)
  :: pattern == 2 -> fill_trade_message(trade_message_sent, 255)
  :: else -> ramp_trade_message(trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_message(trade_message_sent);
    assert(at == 43);
    at = 0;
    decode_trade_message(trade_message_got);
    assert(at == 43);
    equal_trade_message(trade_message_got, trade_message_sent)
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
    assert(at == 26);
    at = 0;
    decode_broken_trade_report_message(broken_trade_report_message_got);
    assert(at == 26);
    equal_broken_trade_report_message(broken_trade_report_message_got, broken_trade_report_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_system_event_message()
  :: run check_derivative_directory_message()
  :: run check_trading_action_message()
  :: run check_trade_message()
  :: run check_broken_trade_report_message()
  fi
}
