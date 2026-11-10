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

/* ---- Add Order Short Form Message: 32 bytes ---------------------------------- */

/* An Add Order Message indicates that a new order has been accepted and was added to the displayable book. */
typedef AddOrderShortFormMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte order_reference_number[8];
  byte side;
  byte order_capacity;
  byte price_short[2];
  byte volume_short[2];
  byte reserved_4[4]
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
  add_order_short_form_message_record.side = add_order_short_form_message_value;
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
  :: add_order_short_form_message_at < 4 -> add_order_short_form_message_record.reserved_4[add_order_short_form_message_at] = add_order_short_form_message_value; add_order_short_form_message_at = add_order_short_form_message_at + 1
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
  add_order_short_form_message_record.side = (add_order_short_form_message_base + 22 + 1) % 256;
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
  :: add_order_short_form_message_at < 4 -> add_order_short_form_message_record.reserved_4[add_order_short_form_message_at] = (add_order_short_form_message_base + 28 + add_order_short_form_message_at + 1) % 256; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Short Form Message to the wire, 32 bytes from where the cursor stands */
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
  wire[at] = add_order_short_form_message_record.side; at = at + 1;
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
  :: add_order_short_form_message_at < 4 -> wire[at] = add_order_short_form_message_record.reserved_4[add_order_short_form_message_at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Short Form Message off the wire, 32 bytes from where the cursor stands */
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
  add_order_short_form_message_record.side = wire[at]; at = at + 1;
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
  :: add_order_short_form_message_at < 4 -> add_order_short_form_message_record.reserved_4[add_order_short_form_message_at] = wire[at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
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
  assert(add_order_short_form_message_read.side == add_order_short_form_message_written.side);
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
  :: add_order_short_form_message_at < 4 -> assert(add_order_short_form_message_read.reserved_4[add_order_short_form_message_at] == add_order_short_form_message_written.reserved_4[add_order_short_form_message_at]); add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order Long Form Message: 36 bytes ----------------------------------- */

/* An Add Order Message indicates that a new order has been accepted and was added to the displayable book. */
typedef AddOrderLongFormMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte order_reference_number[8];
  byte side;
  byte order_capacity;
  byte price_long[4];
  byte volume_long[4];
  byte reserved_4[4]
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
  add_order_long_form_message_record.side = add_order_long_form_message_value;
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
  :: add_order_long_form_message_at < 4 -> add_order_long_form_message_record.reserved_4[add_order_long_form_message_at] = add_order_long_form_message_value; add_order_long_form_message_at = add_order_long_form_message_at + 1
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
  add_order_long_form_message_record.side = (add_order_long_form_message_base + 22 + 1) % 256;
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
  :: add_order_long_form_message_at < 4 -> add_order_long_form_message_record.reserved_4[add_order_long_form_message_at] = (add_order_long_form_message_base + 32 + add_order_long_form_message_at + 1) % 256; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Long Form Message to the wire, 36 bytes from where the cursor stands */
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
  wire[at] = add_order_long_form_message_record.side; at = at + 1;
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
  :: add_order_long_form_message_at < 4 -> wire[at] = add_order_long_form_message_record.reserved_4[add_order_long_form_message_at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Long Form Message off the wire, 36 bytes from where the cursor stands */
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
  add_order_long_form_message_record.side = wire[at]; at = at + 1;
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
  :: add_order_long_form_message_at < 4 -> add_order_long_form_message_record.reserved_4[add_order_long_form_message_at] = wire[at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
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
  assert(add_order_long_form_message_read.side == add_order_long_form_message_written.side);
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
  :: add_order_long_form_message_at < 4 -> assert(add_order_long_form_message_read.reserved_4[add_order_long_form_message_at] == add_order_long_form_message_written.reserved_4[add_order_long_form_message_at]); add_order_long_form_message_at = add_order_long_form_message_at + 1
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

/* ---- Single Side Executed Message: 43 bytes ---------------------------------- */

/* This message is sent whenever a Side order is executed in whole or in part. */
typedef SingleSideExecutedMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte strategy_id[4];
  byte order_reference_number[8];
  byte executed_volume[4];
  byte trade_condition;
  byte auction_id[4];
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
  :: single_side_executed_message_at < 8 -> single_side_executed_message_record.timestamp[single_side_executed_message_at] = single_side_executed_message_value; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.instrument_id[single_side_executed_message_at] = single_side_executed_message_value; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.strategy_id[single_side_executed_message_at] = single_side_executed_message_value; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 8 -> single_side_executed_message_record.order_reference_number[single_side_executed_message_at] = single_side_executed_message_value; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.executed_volume[single_side_executed_message_at] = single_side_executed_message_value; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_record.trade_condition = single_side_executed_message_value;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.auction_id[single_side_executed_message_at] = single_side_executed_message_value; single_side_executed_message_at = single_side_executed_message_at + 1
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
  :: single_side_executed_message_at < 8 -> single_side_executed_message_record.timestamp[single_side_executed_message_at] = (single_side_executed_message_base + 2 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.instrument_id[single_side_executed_message_at] = (single_side_executed_message_base + 10 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.strategy_id[single_side_executed_message_at] = (single_side_executed_message_base + 14 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 8 -> single_side_executed_message_record.order_reference_number[single_side_executed_message_at] = (single_side_executed_message_base + 18 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.executed_volume[single_side_executed_message_at] = (single_side_executed_message_base + 26 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_record.trade_condition = (single_side_executed_message_base + 30 + 1) % 256;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.auction_id[single_side_executed_message_at] = (single_side_executed_message_base + 31 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.cross_number[single_side_executed_message_at] = (single_side_executed_message_base + 35 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.match_number[single_side_executed_message_at] = (single_side_executed_message_base + 39 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Executed Message to the wire, 43 bytes from where the cursor stands */
inline encode_single_side_executed_message(single_side_executed_message_record) {
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 2 -> wire[at] = single_side_executed_message_record.tracking_number[single_side_executed_message_at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 8 -> wire[at] = single_side_executed_message_record.timestamp[single_side_executed_message_at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> wire[at] = single_side_executed_message_record.instrument_id[single_side_executed_message_at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> wire[at] = single_side_executed_message_record.strategy_id[single_side_executed_message_at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 8 -> wire[at] = single_side_executed_message_record.order_reference_number[single_side_executed_message_at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> wire[at] = single_side_executed_message_record.executed_volume[single_side_executed_message_at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = single_side_executed_message_record.trade_condition; at = at + 1;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> wire[at] = single_side_executed_message_record.auction_id[single_side_executed_message_at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
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

/* Single Side Executed Message off the wire, 43 bytes from where the cursor stands */
inline decode_single_side_executed_message(single_side_executed_message_record) {
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 2 -> single_side_executed_message_record.tracking_number[single_side_executed_message_at] = wire[at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 8 -> single_side_executed_message_record.timestamp[single_side_executed_message_at] = wire[at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.instrument_id[single_side_executed_message_at] = wire[at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.strategy_id[single_side_executed_message_at] = wire[at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 8 -> single_side_executed_message_record.order_reference_number[single_side_executed_message_at] = wire[at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.executed_volume[single_side_executed_message_at] = wire[at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_record.trade_condition = wire[at]; at = at + 1;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.auction_id[single_side_executed_message_at] = wire[at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
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
  :: single_side_executed_message_at < 8 -> assert(single_side_executed_message_read.timestamp[single_side_executed_message_at] == single_side_executed_message_written.timestamp[single_side_executed_message_at]); single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> assert(single_side_executed_message_read.instrument_id[single_side_executed_message_at] == single_side_executed_message_written.instrument_id[single_side_executed_message_at]); single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> assert(single_side_executed_message_read.strategy_id[single_side_executed_message_at] == single_side_executed_message_written.strategy_id[single_side_executed_message_at]); single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 8 -> assert(single_side_executed_message_read.order_reference_number[single_side_executed_message_at] == single_side_executed_message_written.order_reference_number[single_side_executed_message_at]); single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> assert(single_side_executed_message_read.executed_volume[single_side_executed_message_at] == single_side_executed_message_written.executed_volume[single_side_executed_message_at]); single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  assert(single_side_executed_message_read.trade_condition == single_side_executed_message_written.trade_condition);
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> assert(single_side_executed_message_read.auction_id[single_side_executed_message_at] == single_side_executed_message_written.auction_id[single_side_executed_message_at]); single_side_executed_message_at = single_side_executed_message_at + 1
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

/* ---- Single Side Executed With Price Message: 48 bytes ----------------------- */

/* This message is sent whenever an incoming Side order is executed against the book in whole or in part at a price different from the initial display price. */
typedef SingleSideExecutedWithPriceMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte strategy_id[4];
  byte order_reference_number[8];
  byte cross_number[4];
  byte match_number[4];
  byte printable;
  byte price_long[4];
  byte volume_long[4];
  byte trade_condition;
  byte auction_id[4]
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
  :: single_side_executed_with_price_message_at < 8 -> single_side_executed_with_price_message_record.timestamp[single_side_executed_with_price_message_at] = single_side_executed_with_price_message_value; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.instrument_id[single_side_executed_with_price_message_at] = single_side_executed_with_price_message_value; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.strategy_id[single_side_executed_with_price_message_at] = single_side_executed_with_price_message_value; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 8 -> single_side_executed_with_price_message_record.order_reference_number[single_side_executed_with_price_message_at] = single_side_executed_with_price_message_value; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
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
  single_side_executed_with_price_message_record.trade_condition = single_side_executed_with_price_message_value;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.auction_id[single_side_executed_with_price_message_at] = single_side_executed_with_price_message_value; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
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
  :: single_side_executed_with_price_message_at < 8 -> single_side_executed_with_price_message_record.timestamp[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 2 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.instrument_id[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 10 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.strategy_id[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 14 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 8 -> single_side_executed_with_price_message_record.order_reference_number[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 18 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.cross_number[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 26 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.match_number[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 30 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_record.printable = (single_side_executed_with_price_message_base + 34 + 1) % 256;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.price_long[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 35 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.volume_long[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 39 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_record.trade_condition = (single_side_executed_with_price_message_base + 43 + 1) % 256;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.auction_id[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 44 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Executed With Price Message to the wire, 48 bytes from where the cursor stands */
inline encode_single_side_executed_with_price_message(single_side_executed_with_price_message_record) {
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 2 -> wire[at] = single_side_executed_with_price_message_record.tracking_number[single_side_executed_with_price_message_at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 8 -> wire[at] = single_side_executed_with_price_message_record.timestamp[single_side_executed_with_price_message_at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> wire[at] = single_side_executed_with_price_message_record.instrument_id[single_side_executed_with_price_message_at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> wire[at] = single_side_executed_with_price_message_record.strategy_id[single_side_executed_with_price_message_at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 8 -> wire[at] = single_side_executed_with_price_message_record.order_reference_number[single_side_executed_with_price_message_at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
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
  wire[at] = single_side_executed_with_price_message_record.trade_condition; at = at + 1;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> wire[at] = single_side_executed_with_price_message_record.auction_id[single_side_executed_with_price_message_at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Executed With Price Message off the wire, 48 bytes from where the cursor stands */
inline decode_single_side_executed_with_price_message(single_side_executed_with_price_message_record) {
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 2 -> single_side_executed_with_price_message_record.tracking_number[single_side_executed_with_price_message_at] = wire[at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 8 -> single_side_executed_with_price_message_record.timestamp[single_side_executed_with_price_message_at] = wire[at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.instrument_id[single_side_executed_with_price_message_at] = wire[at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.strategy_id[single_side_executed_with_price_message_at] = wire[at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 8 -> single_side_executed_with_price_message_record.order_reference_number[single_side_executed_with_price_message_at] = wire[at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
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
  single_side_executed_with_price_message_record.trade_condition = wire[at]; at = at + 1;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.auction_id[single_side_executed_with_price_message_at] = wire[at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
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
  :: single_side_executed_with_price_message_at < 8 -> assert(single_side_executed_with_price_message_read.timestamp[single_side_executed_with_price_message_at] == single_side_executed_with_price_message_written.timestamp[single_side_executed_with_price_message_at]); single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> assert(single_side_executed_with_price_message_read.instrument_id[single_side_executed_with_price_message_at] == single_side_executed_with_price_message_written.instrument_id[single_side_executed_with_price_message_at]); single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> assert(single_side_executed_with_price_message_read.strategy_id[single_side_executed_with_price_message_at] == single_side_executed_with_price_message_written.strategy_id[single_side_executed_with_price_message_at]); single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 8 -> assert(single_side_executed_with_price_message_read.order_reference_number[single_side_executed_with_price_message_at] == single_side_executed_with_price_message_written.order_reference_number[single_side_executed_with_price_message_at]); single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
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
  assert(single_side_executed_with_price_message_read.trade_condition == single_side_executed_with_price_message_written.trade_condition);
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> assert(single_side_executed_with_price_message_read.auction_id[single_side_executed_with_price_message_at] == single_side_executed_with_price_message_written.auction_id[single_side_executed_with_price_message_at]); single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancel Message: 26 bytes ------------------------------------------ */

/* This message is sent whenever an order on the book is modified as a result of a partial cancellation. */
typedef OrderCancelMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte order_reference_number[8];
  byte cancelled_volume[4]
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
  :: order_cancel_message_at < 8 -> order_cancel_message_record.timestamp[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.instrument_id[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.order_reference_number[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.cancelled_volume[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
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
  :: order_cancel_message_at < 8 -> order_cancel_message_record.timestamp[order_cancel_message_at] = (order_cancel_message_base + 2 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.instrument_id[order_cancel_message_at] = (order_cancel_message_base + 10 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.order_reference_number[order_cancel_message_at] = (order_cancel_message_base + 14 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.cancelled_volume[order_cancel_message_at] = (order_cancel_message_base + 22 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Message to the wire, 26 bytes from where the cursor stands */
inline encode_order_cancel_message(order_cancel_message_record) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> wire[at] = order_cancel_message_record.tracking_number[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> wire[at] = order_cancel_message_record.timestamp[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> wire[at] = order_cancel_message_record.instrument_id[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> wire[at] = order_cancel_message_record.order_reference_number[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> wire[at] = order_cancel_message_record.cancelled_volume[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Message off the wire, 26 bytes from where the cursor stands */
inline decode_order_cancel_message(order_cancel_message_record) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> order_cancel_message_record.tracking_number[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.timestamp[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.instrument_id[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.order_reference_number[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.cancelled_volume[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
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
  :: order_cancel_message_at < 8 -> assert(order_cancel_message_read.timestamp[order_cancel_message_at] == order_cancel_message_written.timestamp[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> assert(order_cancel_message_read.instrument_id[order_cancel_message_at] == order_cancel_message_written.instrument_id[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> assert(order_cancel_message_read.order_reference_number[order_cancel_message_at] == order_cancel_message_written.order_reference_number[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> assert(order_cancel_message_read.cancelled_volume[order_cancel_message_at] == order_cancel_message_written.cancelled_volume[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Replace Short Form Message: 34 bytes ------------------------ */

/* This message is sent whenever an order or one side of a quote on the book is replaced. */
typedef SingleSideReplaceShortFormMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte order_reference_number[8];
  byte new_reference_number[8];
  byte price_short[2];
  byte volume_short[2]
};

int single_side_replace_short_form_message_at;

/* every byte of Single Side Replace Short Form Message set to one value */
inline fill_single_side_replace_short_form_message(single_side_replace_short_form_message_record, single_side_replace_short_form_message_value) {
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> single_side_replace_short_form_message_record.tracking_number[single_side_replace_short_form_message_at] = single_side_replace_short_form_message_value; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> single_side_replace_short_form_message_record.timestamp[single_side_replace_short_form_message_at] = single_side_replace_short_form_message_value; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 4 -> single_side_replace_short_form_message_record.instrument_id[single_side_replace_short_form_message_at] = single_side_replace_short_form_message_value; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> single_side_replace_short_form_message_record.order_reference_number[single_side_replace_short_form_message_at] = single_side_replace_short_form_message_value; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> single_side_replace_short_form_message_record.new_reference_number[single_side_replace_short_form_message_at] = single_side_replace_short_form_message_value; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> single_side_replace_short_form_message_record.price_short[single_side_replace_short_form_message_at] = single_side_replace_short_form_message_value; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> single_side_replace_short_form_message_record.volume_short[single_side_replace_short_form_message_at] = single_side_replace_short_form_message_value; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Side Replace Short Form Message set to where it lies, so a field read out of place says so */
inline ramp_single_side_replace_short_form_message(single_side_replace_short_form_message_record, single_side_replace_short_form_message_base) {
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> single_side_replace_short_form_message_record.tracking_number[single_side_replace_short_form_message_at] = (single_side_replace_short_form_message_base + 0 + single_side_replace_short_form_message_at + 1) % 256; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> single_side_replace_short_form_message_record.timestamp[single_side_replace_short_form_message_at] = (single_side_replace_short_form_message_base + 2 + single_side_replace_short_form_message_at + 1) % 256; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 4 -> single_side_replace_short_form_message_record.instrument_id[single_side_replace_short_form_message_at] = (single_side_replace_short_form_message_base + 10 + single_side_replace_short_form_message_at + 1) % 256; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> single_side_replace_short_form_message_record.order_reference_number[single_side_replace_short_form_message_at] = (single_side_replace_short_form_message_base + 14 + single_side_replace_short_form_message_at + 1) % 256; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> single_side_replace_short_form_message_record.new_reference_number[single_side_replace_short_form_message_at] = (single_side_replace_short_form_message_base + 22 + single_side_replace_short_form_message_at + 1) % 256; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> single_side_replace_short_form_message_record.price_short[single_side_replace_short_form_message_at] = (single_side_replace_short_form_message_base + 30 + single_side_replace_short_form_message_at + 1) % 256; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> single_side_replace_short_form_message_record.volume_short[single_side_replace_short_form_message_at] = (single_side_replace_short_form_message_base + 32 + single_side_replace_short_form_message_at + 1) % 256; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Replace Short Form Message to the wire, 34 bytes from where the cursor stands */
inline encode_single_side_replace_short_form_message(single_side_replace_short_form_message_record) {
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> wire[at] = single_side_replace_short_form_message_record.tracking_number[single_side_replace_short_form_message_at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> wire[at] = single_side_replace_short_form_message_record.timestamp[single_side_replace_short_form_message_at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 4 -> wire[at] = single_side_replace_short_form_message_record.instrument_id[single_side_replace_short_form_message_at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> wire[at] = single_side_replace_short_form_message_record.order_reference_number[single_side_replace_short_form_message_at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> wire[at] = single_side_replace_short_form_message_record.new_reference_number[single_side_replace_short_form_message_at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> wire[at] = single_side_replace_short_form_message_record.price_short[single_side_replace_short_form_message_at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> wire[at] = single_side_replace_short_form_message_record.volume_short[single_side_replace_short_form_message_at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Replace Short Form Message off the wire, 34 bytes from where the cursor stands */
inline decode_single_side_replace_short_form_message(single_side_replace_short_form_message_record) {
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> single_side_replace_short_form_message_record.tracking_number[single_side_replace_short_form_message_at] = wire[at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> single_side_replace_short_form_message_record.timestamp[single_side_replace_short_form_message_at] = wire[at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 4 -> single_side_replace_short_form_message_record.instrument_id[single_side_replace_short_form_message_at] = wire[at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> single_side_replace_short_form_message_record.order_reference_number[single_side_replace_short_form_message_at] = wire[at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> single_side_replace_short_form_message_record.new_reference_number[single_side_replace_short_form_message_at] = wire[at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> single_side_replace_short_form_message_record.price_short[single_side_replace_short_form_message_at] = wire[at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> single_side_replace_short_form_message_record.volume_short[single_side_replace_short_form_message_at] = wire[at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Side Replace Short Form Message is what was written, byte for byte */
inline equal_single_side_replace_short_form_message(single_side_replace_short_form_message_read, single_side_replace_short_form_message_written) {
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> assert(single_side_replace_short_form_message_read.tracking_number[single_side_replace_short_form_message_at] == single_side_replace_short_form_message_written.tracking_number[single_side_replace_short_form_message_at]); single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> assert(single_side_replace_short_form_message_read.timestamp[single_side_replace_short_form_message_at] == single_side_replace_short_form_message_written.timestamp[single_side_replace_short_form_message_at]); single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 4 -> assert(single_side_replace_short_form_message_read.instrument_id[single_side_replace_short_form_message_at] == single_side_replace_short_form_message_written.instrument_id[single_side_replace_short_form_message_at]); single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> assert(single_side_replace_short_form_message_read.order_reference_number[single_side_replace_short_form_message_at] == single_side_replace_short_form_message_written.order_reference_number[single_side_replace_short_form_message_at]); single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> assert(single_side_replace_short_form_message_read.new_reference_number[single_side_replace_short_form_message_at] == single_side_replace_short_form_message_written.new_reference_number[single_side_replace_short_form_message_at]); single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> assert(single_side_replace_short_form_message_read.price_short[single_side_replace_short_form_message_at] == single_side_replace_short_form_message_written.price_short[single_side_replace_short_form_message_at]); single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> assert(single_side_replace_short_form_message_read.volume_short[single_side_replace_short_form_message_at] == single_side_replace_short_form_message_written.volume_short[single_side_replace_short_form_message_at]); single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Replace Long Form Message: 38 bytes ------------------------- */

/* This message is sent whenever an order or one side of a quote on the book is replaced. */
typedef SingleSideReplaceLongFormMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte order_reference_number[8];
  byte new_reference_number[8];
  byte price_long[4];
  byte volume_long[4]
};

int single_side_replace_long_form_message_at;

/* every byte of Single Side Replace Long Form Message set to one value */
inline fill_single_side_replace_long_form_message(single_side_replace_long_form_message_record, single_side_replace_long_form_message_value) {
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 2 -> single_side_replace_long_form_message_record.tracking_number[single_side_replace_long_form_message_at] = single_side_replace_long_form_message_value; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> single_side_replace_long_form_message_record.timestamp[single_side_replace_long_form_message_at] = single_side_replace_long_form_message_value; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> single_side_replace_long_form_message_record.instrument_id[single_side_replace_long_form_message_at] = single_side_replace_long_form_message_value; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> single_side_replace_long_form_message_record.order_reference_number[single_side_replace_long_form_message_at] = single_side_replace_long_form_message_value; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> single_side_replace_long_form_message_record.new_reference_number[single_side_replace_long_form_message_at] = single_side_replace_long_form_message_value; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> single_side_replace_long_form_message_record.price_long[single_side_replace_long_form_message_at] = single_side_replace_long_form_message_value; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> single_side_replace_long_form_message_record.volume_long[single_side_replace_long_form_message_at] = single_side_replace_long_form_message_value; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Side Replace Long Form Message set to where it lies, so a field read out of place says so */
inline ramp_single_side_replace_long_form_message(single_side_replace_long_form_message_record, single_side_replace_long_form_message_base) {
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 2 -> single_side_replace_long_form_message_record.tracking_number[single_side_replace_long_form_message_at] = (single_side_replace_long_form_message_base + 0 + single_side_replace_long_form_message_at + 1) % 256; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> single_side_replace_long_form_message_record.timestamp[single_side_replace_long_form_message_at] = (single_side_replace_long_form_message_base + 2 + single_side_replace_long_form_message_at + 1) % 256; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> single_side_replace_long_form_message_record.instrument_id[single_side_replace_long_form_message_at] = (single_side_replace_long_form_message_base + 10 + single_side_replace_long_form_message_at + 1) % 256; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> single_side_replace_long_form_message_record.order_reference_number[single_side_replace_long_form_message_at] = (single_side_replace_long_form_message_base + 14 + single_side_replace_long_form_message_at + 1) % 256; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> single_side_replace_long_form_message_record.new_reference_number[single_side_replace_long_form_message_at] = (single_side_replace_long_form_message_base + 22 + single_side_replace_long_form_message_at + 1) % 256; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> single_side_replace_long_form_message_record.price_long[single_side_replace_long_form_message_at] = (single_side_replace_long_form_message_base + 30 + single_side_replace_long_form_message_at + 1) % 256; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> single_side_replace_long_form_message_record.volume_long[single_side_replace_long_form_message_at] = (single_side_replace_long_form_message_base + 34 + single_side_replace_long_form_message_at + 1) % 256; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Replace Long Form Message to the wire, 38 bytes from where the cursor stands */
inline encode_single_side_replace_long_form_message(single_side_replace_long_form_message_record) {
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 2 -> wire[at] = single_side_replace_long_form_message_record.tracking_number[single_side_replace_long_form_message_at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> wire[at] = single_side_replace_long_form_message_record.timestamp[single_side_replace_long_form_message_at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> wire[at] = single_side_replace_long_form_message_record.instrument_id[single_side_replace_long_form_message_at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> wire[at] = single_side_replace_long_form_message_record.order_reference_number[single_side_replace_long_form_message_at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> wire[at] = single_side_replace_long_form_message_record.new_reference_number[single_side_replace_long_form_message_at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> wire[at] = single_side_replace_long_form_message_record.price_long[single_side_replace_long_form_message_at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> wire[at] = single_side_replace_long_form_message_record.volume_long[single_side_replace_long_form_message_at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Replace Long Form Message off the wire, 38 bytes from where the cursor stands */
inline decode_single_side_replace_long_form_message(single_side_replace_long_form_message_record) {
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 2 -> single_side_replace_long_form_message_record.tracking_number[single_side_replace_long_form_message_at] = wire[at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> single_side_replace_long_form_message_record.timestamp[single_side_replace_long_form_message_at] = wire[at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> single_side_replace_long_form_message_record.instrument_id[single_side_replace_long_form_message_at] = wire[at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> single_side_replace_long_form_message_record.order_reference_number[single_side_replace_long_form_message_at] = wire[at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> single_side_replace_long_form_message_record.new_reference_number[single_side_replace_long_form_message_at] = wire[at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> single_side_replace_long_form_message_record.price_long[single_side_replace_long_form_message_at] = wire[at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> single_side_replace_long_form_message_record.volume_long[single_side_replace_long_form_message_at] = wire[at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Side Replace Long Form Message is what was written, byte for byte */
inline equal_single_side_replace_long_form_message(single_side_replace_long_form_message_read, single_side_replace_long_form_message_written) {
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 2 -> assert(single_side_replace_long_form_message_read.tracking_number[single_side_replace_long_form_message_at] == single_side_replace_long_form_message_written.tracking_number[single_side_replace_long_form_message_at]); single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> assert(single_side_replace_long_form_message_read.timestamp[single_side_replace_long_form_message_at] == single_side_replace_long_form_message_written.timestamp[single_side_replace_long_form_message_at]); single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> assert(single_side_replace_long_form_message_read.instrument_id[single_side_replace_long_form_message_at] == single_side_replace_long_form_message_written.instrument_id[single_side_replace_long_form_message_at]); single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> assert(single_side_replace_long_form_message_read.order_reference_number[single_side_replace_long_form_message_at] == single_side_replace_long_form_message_written.order_reference_number[single_side_replace_long_form_message_at]); single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> assert(single_side_replace_long_form_message_read.new_reference_number[single_side_replace_long_form_message_at] == single_side_replace_long_form_message_written.new_reference_number[single_side_replace_long_form_message_at]); single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> assert(single_side_replace_long_form_message_read.price_long[single_side_replace_long_form_message_at] == single_side_replace_long_form_message_written.price_long[single_side_replace_long_form_message_at]); single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> assert(single_side_replace_long_form_message_read.volume_long[single_side_replace_long_form_message_at] == single_side_replace_long_form_message_written.volume_long[single_side_replace_long_form_message_at]); single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Delete Message: 22 bytes ------------------------------------ */

/* The message is sent when an order or a side of a quote is being cancelled. All remaining contracts are no longer accessible so the side should be removed from the book. */
typedef SingleSideDeleteMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte order_reference_number[8]
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
  :: single_side_delete_message_at < 8 -> single_side_delete_message_record.timestamp[single_side_delete_message_at] = single_side_delete_message_value; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 4 -> single_side_delete_message_record.instrument_id[single_side_delete_message_at] = single_side_delete_message_value; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 8 -> single_side_delete_message_record.order_reference_number[single_side_delete_message_at] = single_side_delete_message_value; single_side_delete_message_at = single_side_delete_message_at + 1
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
  :: single_side_delete_message_at < 8 -> single_side_delete_message_record.timestamp[single_side_delete_message_at] = (single_side_delete_message_base + 2 + single_side_delete_message_at + 1) % 256; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 4 -> single_side_delete_message_record.instrument_id[single_side_delete_message_at] = (single_side_delete_message_base + 10 + single_side_delete_message_at + 1) % 256; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 8 -> single_side_delete_message_record.order_reference_number[single_side_delete_message_at] = (single_side_delete_message_base + 14 + single_side_delete_message_at + 1) % 256; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Delete Message to the wire, 22 bytes from where the cursor stands */
inline encode_single_side_delete_message(single_side_delete_message_record) {
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 2 -> wire[at] = single_side_delete_message_record.tracking_number[single_side_delete_message_at]; at = at + 1; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 8 -> wire[at] = single_side_delete_message_record.timestamp[single_side_delete_message_at]; at = at + 1; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 4 -> wire[at] = single_side_delete_message_record.instrument_id[single_side_delete_message_at]; at = at + 1; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 8 -> wire[at] = single_side_delete_message_record.order_reference_number[single_side_delete_message_at]; at = at + 1; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Delete Message off the wire, 22 bytes from where the cursor stands */
inline decode_single_side_delete_message(single_side_delete_message_record) {
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 2 -> single_side_delete_message_record.tracking_number[single_side_delete_message_at] = wire[at]; at = at + 1; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 8 -> single_side_delete_message_record.timestamp[single_side_delete_message_at] = wire[at]; at = at + 1; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 4 -> single_side_delete_message_record.instrument_id[single_side_delete_message_at] = wire[at]; at = at + 1; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 8 -> single_side_delete_message_record.order_reference_number[single_side_delete_message_at] = wire[at]; at = at + 1; single_side_delete_message_at = single_side_delete_message_at + 1
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
  :: single_side_delete_message_at < 8 -> assert(single_side_delete_message_read.timestamp[single_side_delete_message_at] == single_side_delete_message_written.timestamp[single_side_delete_message_at]); single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 4 -> assert(single_side_delete_message_read.instrument_id[single_side_delete_message_at] == single_side_delete_message_written.instrument_id[single_side_delete_message_at]); single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 8 -> assert(single_side_delete_message_read.order_reference_number[single_side_delete_message_at] == single_side_delete_message_written.order_reference_number[single_side_delete_message_at]); single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Update Message: 31 bytes ------------------------------------ */

/* This message is sent whenever an order or a side of a quote is being updated for price and (or) contracts. */
typedef SingleSideUpdateMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte order_reference_number[8];
  byte change_reason;
  byte price_long[4];
  byte volume_long[4]
};

int single_side_update_message_at;

/* every byte of Single Side Update Message set to one value */
inline fill_single_side_update_message(single_side_update_message_record, single_side_update_message_value) {
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 2 -> single_side_update_message_record.tracking_number[single_side_update_message_at] = single_side_update_message_value; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> single_side_update_message_record.timestamp[single_side_update_message_at] = single_side_update_message_value; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.instrument_id[single_side_update_message_at] = single_side_update_message_value; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> single_side_update_message_record.order_reference_number[single_side_update_message_at] = single_side_update_message_value; single_side_update_message_at = single_side_update_message_at + 1
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
  :: single_side_update_message_at < 2 -> single_side_update_message_record.tracking_number[single_side_update_message_at] = (single_side_update_message_base + 0 + single_side_update_message_at + 1) % 256; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> single_side_update_message_record.timestamp[single_side_update_message_at] = (single_side_update_message_base + 2 + single_side_update_message_at + 1) % 256; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.instrument_id[single_side_update_message_at] = (single_side_update_message_base + 10 + single_side_update_message_at + 1) % 256; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> single_side_update_message_record.order_reference_number[single_side_update_message_at] = (single_side_update_message_base + 14 + single_side_update_message_at + 1) % 256; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_record.change_reason = (single_side_update_message_base + 22 + 1) % 256;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.price_long[single_side_update_message_at] = (single_side_update_message_base + 23 + single_side_update_message_at + 1) % 256; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.volume_long[single_side_update_message_at] = (single_side_update_message_base + 27 + single_side_update_message_at + 1) % 256; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Update Message to the wire, 31 bytes from where the cursor stands */
inline encode_single_side_update_message(single_side_update_message_record) {
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 2 -> wire[at] = single_side_update_message_record.tracking_number[single_side_update_message_at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> wire[at] = single_side_update_message_record.timestamp[single_side_update_message_at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> wire[at] = single_side_update_message_record.instrument_id[single_side_update_message_at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> wire[at] = single_side_update_message_record.order_reference_number[single_side_update_message_at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
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

/* Single Side Update Message off the wire, 31 bytes from where the cursor stands */
inline decode_single_side_update_message(single_side_update_message_record) {
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 2 -> single_side_update_message_record.tracking_number[single_side_update_message_at] = wire[at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> single_side_update_message_record.timestamp[single_side_update_message_at] = wire[at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.instrument_id[single_side_update_message_at] = wire[at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> single_side_update_message_record.order_reference_number[single_side_update_message_at] = wire[at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
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
  :: single_side_update_message_at < 2 -> assert(single_side_update_message_read.tracking_number[single_side_update_message_at] == single_side_update_message_written.tracking_number[single_side_update_message_at]); single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> assert(single_side_update_message_read.timestamp[single_side_update_message_at] == single_side_update_message_written.timestamp[single_side_update_message_at]); single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> assert(single_side_update_message_read.instrument_id[single_side_update_message_at] == single_side_update_message_written.instrument_id[single_side_update_message_at]); single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> assert(single_side_update_message_read.order_reference_number[single_side_update_message_at] == single_side_update_message_written.order_reference_number[single_side_update_message_at]); single_side_update_message_at = single_side_update_message_at + 1
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

/* ---- Quote Replace Short Form Message: 54 bytes ------------------------------ */

/* This message is sent whenever a quote on the book is replaced. */
typedef QuoteReplaceShortFormMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte original_bid_reference_number[8];
  byte bid_reference_number[8];
  byte original_ask_reference_number[8];
  byte ask_reference_number[8];
  byte bid_price_short[2];
  byte bid_size_short[2];
  byte ask_price_short[2];
  byte ask_size_short[2]
};

int quote_replace_short_form_message_at;

/* every byte of Quote Replace Short Form Message set to one value */
inline fill_quote_replace_short_form_message(quote_replace_short_form_message_record, quote_replace_short_form_message_value) {
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 2 -> quote_replace_short_form_message_record.tracking_number[quote_replace_short_form_message_at] = quote_replace_short_form_message_value; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 8 -> quote_replace_short_form_message_record.timestamp[quote_replace_short_form_message_at] = quote_replace_short_form_message_value; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 4 -> quote_replace_short_form_message_record.instrument_id[quote_replace_short_form_message_at] = quote_replace_short_form_message_value; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 8 -> quote_replace_short_form_message_record.original_bid_reference_number[quote_replace_short_form_message_at] = quote_replace_short_form_message_value; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 8 -> quote_replace_short_form_message_record.bid_reference_number[quote_replace_short_form_message_at] = quote_replace_short_form_message_value; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 8 -> quote_replace_short_form_message_record.original_ask_reference_number[quote_replace_short_form_message_at] = quote_replace_short_form_message_value; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 8 -> quote_replace_short_form_message_record.ask_reference_number[quote_replace_short_form_message_at] = quote_replace_short_form_message_value; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 2 -> quote_replace_short_form_message_record.bid_price_short[quote_replace_short_form_message_at] = quote_replace_short_form_message_value; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 2 -> quote_replace_short_form_message_record.bid_size_short[quote_replace_short_form_message_at] = quote_replace_short_form_message_value; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 2 -> quote_replace_short_form_message_record.ask_price_short[quote_replace_short_form_message_at] = quote_replace_short_form_message_value; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 2 -> quote_replace_short_form_message_record.ask_size_short[quote_replace_short_form_message_at] = quote_replace_short_form_message_value; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Replace Short Form Message set to where it lies, so a field read out of place says so */
inline ramp_quote_replace_short_form_message(quote_replace_short_form_message_record, quote_replace_short_form_message_base) {
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 2 -> quote_replace_short_form_message_record.tracking_number[quote_replace_short_form_message_at] = (quote_replace_short_form_message_base + 0 + quote_replace_short_form_message_at + 1) % 256; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 8 -> quote_replace_short_form_message_record.timestamp[quote_replace_short_form_message_at] = (quote_replace_short_form_message_base + 2 + quote_replace_short_form_message_at + 1) % 256; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 4 -> quote_replace_short_form_message_record.instrument_id[quote_replace_short_form_message_at] = (quote_replace_short_form_message_base + 10 + quote_replace_short_form_message_at + 1) % 256; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 8 -> quote_replace_short_form_message_record.original_bid_reference_number[quote_replace_short_form_message_at] = (quote_replace_short_form_message_base + 14 + quote_replace_short_form_message_at + 1) % 256; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 8 -> quote_replace_short_form_message_record.bid_reference_number[quote_replace_short_form_message_at] = (quote_replace_short_form_message_base + 22 + quote_replace_short_form_message_at + 1) % 256; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 8 -> quote_replace_short_form_message_record.original_ask_reference_number[quote_replace_short_form_message_at] = (quote_replace_short_form_message_base + 30 + quote_replace_short_form_message_at + 1) % 256; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 8 -> quote_replace_short_form_message_record.ask_reference_number[quote_replace_short_form_message_at] = (quote_replace_short_form_message_base + 38 + quote_replace_short_form_message_at + 1) % 256; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 2 -> quote_replace_short_form_message_record.bid_price_short[quote_replace_short_form_message_at] = (quote_replace_short_form_message_base + 46 + quote_replace_short_form_message_at + 1) % 256; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 2 -> quote_replace_short_form_message_record.bid_size_short[quote_replace_short_form_message_at] = (quote_replace_short_form_message_base + 48 + quote_replace_short_form_message_at + 1) % 256; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 2 -> quote_replace_short_form_message_record.ask_price_short[quote_replace_short_form_message_at] = (quote_replace_short_form_message_base + 50 + quote_replace_short_form_message_at + 1) % 256; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 2 -> quote_replace_short_form_message_record.ask_size_short[quote_replace_short_form_message_at] = (quote_replace_short_form_message_base + 52 + quote_replace_short_form_message_at + 1) % 256; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Replace Short Form Message to the wire, 54 bytes from where the cursor stands */
inline encode_quote_replace_short_form_message(quote_replace_short_form_message_record) {
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 2 -> wire[at] = quote_replace_short_form_message_record.tracking_number[quote_replace_short_form_message_at]; at = at + 1; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 8 -> wire[at] = quote_replace_short_form_message_record.timestamp[quote_replace_short_form_message_at]; at = at + 1; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 4 -> wire[at] = quote_replace_short_form_message_record.instrument_id[quote_replace_short_form_message_at]; at = at + 1; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 8 -> wire[at] = quote_replace_short_form_message_record.original_bid_reference_number[quote_replace_short_form_message_at]; at = at + 1; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 8 -> wire[at] = quote_replace_short_form_message_record.bid_reference_number[quote_replace_short_form_message_at]; at = at + 1; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 8 -> wire[at] = quote_replace_short_form_message_record.original_ask_reference_number[quote_replace_short_form_message_at]; at = at + 1; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 8 -> wire[at] = quote_replace_short_form_message_record.ask_reference_number[quote_replace_short_form_message_at]; at = at + 1; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 2 -> wire[at] = quote_replace_short_form_message_record.bid_price_short[quote_replace_short_form_message_at]; at = at + 1; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 2 -> wire[at] = quote_replace_short_form_message_record.bid_size_short[quote_replace_short_form_message_at]; at = at + 1; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 2 -> wire[at] = quote_replace_short_form_message_record.ask_price_short[quote_replace_short_form_message_at]; at = at + 1; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 2 -> wire[at] = quote_replace_short_form_message_record.ask_size_short[quote_replace_short_form_message_at]; at = at + 1; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Replace Short Form Message off the wire, 54 bytes from where the cursor stands */
inline decode_quote_replace_short_form_message(quote_replace_short_form_message_record) {
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 2 -> quote_replace_short_form_message_record.tracking_number[quote_replace_short_form_message_at] = wire[at]; at = at + 1; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 8 -> quote_replace_short_form_message_record.timestamp[quote_replace_short_form_message_at] = wire[at]; at = at + 1; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 4 -> quote_replace_short_form_message_record.instrument_id[quote_replace_short_form_message_at] = wire[at]; at = at + 1; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 8 -> quote_replace_short_form_message_record.original_bid_reference_number[quote_replace_short_form_message_at] = wire[at]; at = at + 1; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 8 -> quote_replace_short_form_message_record.bid_reference_number[quote_replace_short_form_message_at] = wire[at]; at = at + 1; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 8 -> quote_replace_short_form_message_record.original_ask_reference_number[quote_replace_short_form_message_at] = wire[at]; at = at + 1; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 8 -> quote_replace_short_form_message_record.ask_reference_number[quote_replace_short_form_message_at] = wire[at]; at = at + 1; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 2 -> quote_replace_short_form_message_record.bid_price_short[quote_replace_short_form_message_at] = wire[at]; at = at + 1; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 2 -> quote_replace_short_form_message_record.bid_size_short[quote_replace_short_form_message_at] = wire[at]; at = at + 1; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 2 -> quote_replace_short_form_message_record.ask_price_short[quote_replace_short_form_message_at] = wire[at]; at = at + 1; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 2 -> quote_replace_short_form_message_record.ask_size_short[quote_replace_short_form_message_at] = wire[at]; at = at + 1; quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Replace Short Form Message is what was written, byte for byte */
inline equal_quote_replace_short_form_message(quote_replace_short_form_message_read, quote_replace_short_form_message_written) {
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 2 -> assert(quote_replace_short_form_message_read.tracking_number[quote_replace_short_form_message_at] == quote_replace_short_form_message_written.tracking_number[quote_replace_short_form_message_at]); quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 8 -> assert(quote_replace_short_form_message_read.timestamp[quote_replace_short_form_message_at] == quote_replace_short_form_message_written.timestamp[quote_replace_short_form_message_at]); quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 4 -> assert(quote_replace_short_form_message_read.instrument_id[quote_replace_short_form_message_at] == quote_replace_short_form_message_written.instrument_id[quote_replace_short_form_message_at]); quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 8 -> assert(quote_replace_short_form_message_read.original_bid_reference_number[quote_replace_short_form_message_at] == quote_replace_short_form_message_written.original_bid_reference_number[quote_replace_short_form_message_at]); quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 8 -> assert(quote_replace_short_form_message_read.bid_reference_number[quote_replace_short_form_message_at] == quote_replace_short_form_message_written.bid_reference_number[quote_replace_short_form_message_at]); quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 8 -> assert(quote_replace_short_form_message_read.original_ask_reference_number[quote_replace_short_form_message_at] == quote_replace_short_form_message_written.original_ask_reference_number[quote_replace_short_form_message_at]); quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 8 -> assert(quote_replace_short_form_message_read.ask_reference_number[quote_replace_short_form_message_at] == quote_replace_short_form_message_written.ask_reference_number[quote_replace_short_form_message_at]); quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 2 -> assert(quote_replace_short_form_message_read.bid_price_short[quote_replace_short_form_message_at] == quote_replace_short_form_message_written.bid_price_short[quote_replace_short_form_message_at]); quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 2 -> assert(quote_replace_short_form_message_read.bid_size_short[quote_replace_short_form_message_at] == quote_replace_short_form_message_written.bid_size_short[quote_replace_short_form_message_at]); quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 2 -> assert(quote_replace_short_form_message_read.ask_price_short[quote_replace_short_form_message_at] == quote_replace_short_form_message_written.ask_price_short[quote_replace_short_form_message_at]); quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  quote_replace_short_form_message_at = 0;
  do
  :: quote_replace_short_form_message_at < 2 -> assert(quote_replace_short_form_message_read.ask_size_short[quote_replace_short_form_message_at] == quote_replace_short_form_message_written.ask_size_short[quote_replace_short_form_message_at]); quote_replace_short_form_message_at = quote_replace_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Replace Long Form Message: 62 bytes ------------------------------- */

/* This message is sent whenever a quote on the book is replaced. */
typedef QuoteReplaceLongFormMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte original_bid_reference_number[8];
  byte bid_reference_number[8];
  byte original_ask_reference_number[8];
  byte ask_reference_number[8];
  byte bid_price_long[4];
  byte bid_size_long[4];
  byte ask_price_long[4];
  byte ask_size_long[4]
};

int quote_replace_long_form_message_at;

/* every byte of Quote Replace Long Form Message set to one value */
inline fill_quote_replace_long_form_message(quote_replace_long_form_message_record, quote_replace_long_form_message_value) {
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 2 -> quote_replace_long_form_message_record.tracking_number[quote_replace_long_form_message_at] = quote_replace_long_form_message_value; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 8 -> quote_replace_long_form_message_record.timestamp[quote_replace_long_form_message_at] = quote_replace_long_form_message_value; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 4 -> quote_replace_long_form_message_record.instrument_id[quote_replace_long_form_message_at] = quote_replace_long_form_message_value; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 8 -> quote_replace_long_form_message_record.original_bid_reference_number[quote_replace_long_form_message_at] = quote_replace_long_form_message_value; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 8 -> quote_replace_long_form_message_record.bid_reference_number[quote_replace_long_form_message_at] = quote_replace_long_form_message_value; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 8 -> quote_replace_long_form_message_record.original_ask_reference_number[quote_replace_long_form_message_at] = quote_replace_long_form_message_value; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 8 -> quote_replace_long_form_message_record.ask_reference_number[quote_replace_long_form_message_at] = quote_replace_long_form_message_value; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 4 -> quote_replace_long_form_message_record.bid_price_long[quote_replace_long_form_message_at] = quote_replace_long_form_message_value; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 4 -> quote_replace_long_form_message_record.bid_size_long[quote_replace_long_form_message_at] = quote_replace_long_form_message_value; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 4 -> quote_replace_long_form_message_record.ask_price_long[quote_replace_long_form_message_at] = quote_replace_long_form_message_value; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 4 -> quote_replace_long_form_message_record.ask_size_long[quote_replace_long_form_message_at] = quote_replace_long_form_message_value; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Replace Long Form Message set to where it lies, so a field read out of place says so */
inline ramp_quote_replace_long_form_message(quote_replace_long_form_message_record, quote_replace_long_form_message_base) {
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 2 -> quote_replace_long_form_message_record.tracking_number[quote_replace_long_form_message_at] = (quote_replace_long_form_message_base + 0 + quote_replace_long_form_message_at + 1) % 256; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 8 -> quote_replace_long_form_message_record.timestamp[quote_replace_long_form_message_at] = (quote_replace_long_form_message_base + 2 + quote_replace_long_form_message_at + 1) % 256; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 4 -> quote_replace_long_form_message_record.instrument_id[quote_replace_long_form_message_at] = (quote_replace_long_form_message_base + 10 + quote_replace_long_form_message_at + 1) % 256; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 8 -> quote_replace_long_form_message_record.original_bid_reference_number[quote_replace_long_form_message_at] = (quote_replace_long_form_message_base + 14 + quote_replace_long_form_message_at + 1) % 256; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 8 -> quote_replace_long_form_message_record.bid_reference_number[quote_replace_long_form_message_at] = (quote_replace_long_form_message_base + 22 + quote_replace_long_form_message_at + 1) % 256; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 8 -> quote_replace_long_form_message_record.original_ask_reference_number[quote_replace_long_form_message_at] = (quote_replace_long_form_message_base + 30 + quote_replace_long_form_message_at + 1) % 256; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 8 -> quote_replace_long_form_message_record.ask_reference_number[quote_replace_long_form_message_at] = (quote_replace_long_form_message_base + 38 + quote_replace_long_form_message_at + 1) % 256; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 4 -> quote_replace_long_form_message_record.bid_price_long[quote_replace_long_form_message_at] = (quote_replace_long_form_message_base + 46 + quote_replace_long_form_message_at + 1) % 256; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 4 -> quote_replace_long_form_message_record.bid_size_long[quote_replace_long_form_message_at] = (quote_replace_long_form_message_base + 50 + quote_replace_long_form_message_at + 1) % 256; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 4 -> quote_replace_long_form_message_record.ask_price_long[quote_replace_long_form_message_at] = (quote_replace_long_form_message_base + 54 + quote_replace_long_form_message_at + 1) % 256; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 4 -> quote_replace_long_form_message_record.ask_size_long[quote_replace_long_form_message_at] = (quote_replace_long_form_message_base + 58 + quote_replace_long_form_message_at + 1) % 256; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Replace Long Form Message to the wire, 62 bytes from where the cursor stands */
inline encode_quote_replace_long_form_message(quote_replace_long_form_message_record) {
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 2 -> wire[at] = quote_replace_long_form_message_record.tracking_number[quote_replace_long_form_message_at]; at = at + 1; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 8 -> wire[at] = quote_replace_long_form_message_record.timestamp[quote_replace_long_form_message_at]; at = at + 1; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 4 -> wire[at] = quote_replace_long_form_message_record.instrument_id[quote_replace_long_form_message_at]; at = at + 1; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 8 -> wire[at] = quote_replace_long_form_message_record.original_bid_reference_number[quote_replace_long_form_message_at]; at = at + 1; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 8 -> wire[at] = quote_replace_long_form_message_record.bid_reference_number[quote_replace_long_form_message_at]; at = at + 1; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 8 -> wire[at] = quote_replace_long_form_message_record.original_ask_reference_number[quote_replace_long_form_message_at]; at = at + 1; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 8 -> wire[at] = quote_replace_long_form_message_record.ask_reference_number[quote_replace_long_form_message_at]; at = at + 1; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 4 -> wire[at] = quote_replace_long_form_message_record.bid_price_long[quote_replace_long_form_message_at]; at = at + 1; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 4 -> wire[at] = quote_replace_long_form_message_record.bid_size_long[quote_replace_long_form_message_at]; at = at + 1; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 4 -> wire[at] = quote_replace_long_form_message_record.ask_price_long[quote_replace_long_form_message_at]; at = at + 1; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 4 -> wire[at] = quote_replace_long_form_message_record.ask_size_long[quote_replace_long_form_message_at]; at = at + 1; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Replace Long Form Message off the wire, 62 bytes from where the cursor stands */
inline decode_quote_replace_long_form_message(quote_replace_long_form_message_record) {
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 2 -> quote_replace_long_form_message_record.tracking_number[quote_replace_long_form_message_at] = wire[at]; at = at + 1; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 8 -> quote_replace_long_form_message_record.timestamp[quote_replace_long_form_message_at] = wire[at]; at = at + 1; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 4 -> quote_replace_long_form_message_record.instrument_id[quote_replace_long_form_message_at] = wire[at]; at = at + 1; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 8 -> quote_replace_long_form_message_record.original_bid_reference_number[quote_replace_long_form_message_at] = wire[at]; at = at + 1; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 8 -> quote_replace_long_form_message_record.bid_reference_number[quote_replace_long_form_message_at] = wire[at]; at = at + 1; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 8 -> quote_replace_long_form_message_record.original_ask_reference_number[quote_replace_long_form_message_at] = wire[at]; at = at + 1; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 8 -> quote_replace_long_form_message_record.ask_reference_number[quote_replace_long_form_message_at] = wire[at]; at = at + 1; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 4 -> quote_replace_long_form_message_record.bid_price_long[quote_replace_long_form_message_at] = wire[at]; at = at + 1; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 4 -> quote_replace_long_form_message_record.bid_size_long[quote_replace_long_form_message_at] = wire[at]; at = at + 1; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 4 -> quote_replace_long_form_message_record.ask_price_long[quote_replace_long_form_message_at] = wire[at]; at = at + 1; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 4 -> quote_replace_long_form_message_record.ask_size_long[quote_replace_long_form_message_at] = wire[at]; at = at + 1; quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Replace Long Form Message is what was written, byte for byte */
inline equal_quote_replace_long_form_message(quote_replace_long_form_message_read, quote_replace_long_form_message_written) {
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 2 -> assert(quote_replace_long_form_message_read.tracking_number[quote_replace_long_form_message_at] == quote_replace_long_form_message_written.tracking_number[quote_replace_long_form_message_at]); quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 8 -> assert(quote_replace_long_form_message_read.timestamp[quote_replace_long_form_message_at] == quote_replace_long_form_message_written.timestamp[quote_replace_long_form_message_at]); quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 4 -> assert(quote_replace_long_form_message_read.instrument_id[quote_replace_long_form_message_at] == quote_replace_long_form_message_written.instrument_id[quote_replace_long_form_message_at]); quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 8 -> assert(quote_replace_long_form_message_read.original_bid_reference_number[quote_replace_long_form_message_at] == quote_replace_long_form_message_written.original_bid_reference_number[quote_replace_long_form_message_at]); quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 8 -> assert(quote_replace_long_form_message_read.bid_reference_number[quote_replace_long_form_message_at] == quote_replace_long_form_message_written.bid_reference_number[quote_replace_long_form_message_at]); quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 8 -> assert(quote_replace_long_form_message_read.original_ask_reference_number[quote_replace_long_form_message_at] == quote_replace_long_form_message_written.original_ask_reference_number[quote_replace_long_form_message_at]); quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 8 -> assert(quote_replace_long_form_message_read.ask_reference_number[quote_replace_long_form_message_at] == quote_replace_long_form_message_written.ask_reference_number[quote_replace_long_form_message_at]); quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 4 -> assert(quote_replace_long_form_message_read.bid_price_long[quote_replace_long_form_message_at] == quote_replace_long_form_message_written.bid_price_long[quote_replace_long_form_message_at]); quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 4 -> assert(quote_replace_long_form_message_read.bid_size_long[quote_replace_long_form_message_at] == quote_replace_long_form_message_written.bid_size_long[quote_replace_long_form_message_at]); quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 4 -> assert(quote_replace_long_form_message_read.ask_price_long[quote_replace_long_form_message_at] == quote_replace_long_form_message_written.ask_price_long[quote_replace_long_form_message_at]); quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  quote_replace_long_form_message_at = 0;
  do
  :: quote_replace_long_form_message_at < 4 -> assert(quote_replace_long_form_message_read.ask_size_long[quote_replace_long_form_message_at] == quote_replace_long_form_message_written.ask_size_long[quote_replace_long_form_message_at]); quote_replace_long_form_message_at = quote_replace_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Delete Message: 30 bytes ------------------------------------------ */

/* The message is sent when a single quote is being cancelled. */
typedef QuoteDeleteMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
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
  :: quote_delete_message_at < 8 -> quote_delete_message_record.timestamp[quote_delete_message_at] = quote_delete_message_value; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 4 -> quote_delete_message_record.instrument_id[quote_delete_message_at] = quote_delete_message_value; quote_delete_message_at = quote_delete_message_at + 1
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
  :: quote_delete_message_at < 8 -> quote_delete_message_record.timestamp[quote_delete_message_at] = (quote_delete_message_base + 2 + quote_delete_message_at + 1) % 256; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 4 -> quote_delete_message_record.instrument_id[quote_delete_message_at] = (quote_delete_message_base + 10 + quote_delete_message_at + 1) % 256; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 8 -> quote_delete_message_record.bid_reference_number[quote_delete_message_at] = (quote_delete_message_base + 14 + quote_delete_message_at + 1) % 256; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 8 -> quote_delete_message_record.ask_reference_number[quote_delete_message_at] = (quote_delete_message_base + 22 + quote_delete_message_at + 1) % 256; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Delete Message to the wire, 30 bytes from where the cursor stands */
inline encode_quote_delete_message(quote_delete_message_record) {
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 2 -> wire[at] = quote_delete_message_record.tracking_number[quote_delete_message_at]; at = at + 1; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 8 -> wire[at] = quote_delete_message_record.timestamp[quote_delete_message_at]; at = at + 1; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 4 -> wire[at] = quote_delete_message_record.instrument_id[quote_delete_message_at]; at = at + 1; quote_delete_message_at = quote_delete_message_at + 1
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

/* Quote Delete Message off the wire, 30 bytes from where the cursor stands */
inline decode_quote_delete_message(quote_delete_message_record) {
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 2 -> quote_delete_message_record.tracking_number[quote_delete_message_at] = wire[at]; at = at + 1; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 8 -> quote_delete_message_record.timestamp[quote_delete_message_at] = wire[at]; at = at + 1; quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 4 -> quote_delete_message_record.instrument_id[quote_delete_message_at] = wire[at]; at = at + 1; quote_delete_message_at = quote_delete_message_at + 1
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
  :: quote_delete_message_at < 8 -> assert(quote_delete_message_read.timestamp[quote_delete_message_at] == quote_delete_message_written.timestamp[quote_delete_message_at]); quote_delete_message_at = quote_delete_message_at + 1
  :: else -> break
  od;
  quote_delete_message_at = 0;
  do
  :: quote_delete_message_at < 4 -> assert(quote_delete_message_read.instrument_id[quote_delete_message_at] == quote_delete_message_written.instrument_id[quote_delete_message_at]); quote_delete_message_at = quote_delete_message_at + 1
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

/* ---- Trade Message: 58 bytes ------------------------------------------------- */

/* This Options Trade Message is designed to provide execution details for normal match events involving non-displayable order types. */
typedef TradeMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte cross_number[4];
  byte match_number[4];
  byte strategy_id[4];
  byte cross_type;
  byte price_long[4];
  byte volume_long[4];
  byte trade_condition;
  byte auction_id[4];
  byte printable;
  byte trade_type;
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
  :: trade_message_at < 4 -> trade_message_record.cross_number[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.match_number[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.strategy_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.cross_type = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.price_long[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.volume_long[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_condition = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.auction_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.printable = trade_message_value;
  trade_message_record.trade_type = trade_message_value;
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
  :: trade_message_at < 4 -> trade_message_record.cross_number[trade_message_at] = (trade_message_base + 14 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.match_number[trade_message_at] = (trade_message_base + 18 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.strategy_id[trade_message_at] = (trade_message_base + 22 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.cross_type = (trade_message_base + 26 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.price_long[trade_message_at] = (trade_message_base + 27 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.volume_long[trade_message_at] = (trade_message_base + 31 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_condition = (trade_message_base + 35 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.auction_id[trade_message_at] = (trade_message_base + 36 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.printable = (trade_message_base + 40 + 1) % 256;
  trade_message_record.trade_type = (trade_message_base + 41 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 16 -> trade_message_record.reserved_16[trade_message_at] = (trade_message_base + 42 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message to the wire, 58 bytes from where the cursor stands */
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
  :: trade_message_at < 4 -> wire[at] = trade_message_record.cross_number[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.match_number[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.strategy_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.cross_type; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.price_long[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.volume_long[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.trade_condition; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.auction_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.printable; at = at + 1;
  wire[at] = trade_message_record.trade_type; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 16 -> wire[at] = trade_message_record.reserved_16[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message off the wire, 58 bytes from where the cursor stands */
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
  :: trade_message_at < 4 -> trade_message_record.cross_number[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.match_number[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.strategy_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.cross_type = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.price_long[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.volume_long[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_condition = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.auction_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.printable = wire[at]; at = at + 1;
  trade_message_record.trade_type = wire[at]; at = at + 1;
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
  :: trade_message_at < 4 -> assert(trade_message_read.cross_number[trade_message_at] == trade_message_written.cross_number[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.match_number[trade_message_at] == trade_message_written.match_number[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.strategy_id[trade_message_at] == trade_message_written.strategy_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.cross_type == trade_message_written.cross_type);
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.price_long[trade_message_at] == trade_message_written.price_long[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.volume_long[trade_message_at] == trade_message_written.volume_long[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.trade_condition == trade_message_written.trade_condition);
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.auction_id[trade_message_at] == trade_message_written.auction_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.printable == trade_message_written.printable);
  assert(trade_message_read.trade_type == trade_message_written.trade_type);
  trade_message_at = 0;
  do
  :: trade_message_at < 16 -> assert(trade_message_read.reserved_16[trade_message_at] == trade_message_written.reserved_16[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Net Order Imbalance Message: 33 bytes ----------------------------------- */

/* This message is used to announce opening and re-opening auctions only. */
typedef NetOrderImbalanceMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte instrument_id[4];
  byte auction_id[4];
  byte auction_type;
  byte paired_quantity[4];
  byte side_imbalance_direction;
  byte price_imbalance_price[4];
  byte imbalance_volume[4];
  byte order_capacity
};

int net_order_imbalance_message_at;

/* every byte of Net Order Imbalance Message set to one value */
inline fill_net_order_imbalance_message(net_order_imbalance_message_record, net_order_imbalance_message_value) {
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 2 -> net_order_imbalance_message_record.tracking_number[net_order_imbalance_message_at] = net_order_imbalance_message_value; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 8 -> net_order_imbalance_message_record.timestamp[net_order_imbalance_message_at] = net_order_imbalance_message_value; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 4 -> net_order_imbalance_message_record.instrument_id[net_order_imbalance_message_at] = net_order_imbalance_message_value; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 4 -> net_order_imbalance_message_record.auction_id[net_order_imbalance_message_at] = net_order_imbalance_message_value; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_record.auction_type = net_order_imbalance_message_value;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 4 -> net_order_imbalance_message_record.paired_quantity[net_order_imbalance_message_at] = net_order_imbalance_message_value; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_record.side_imbalance_direction = net_order_imbalance_message_value;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 4 -> net_order_imbalance_message_record.price_imbalance_price[net_order_imbalance_message_at] = net_order_imbalance_message_value; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 4 -> net_order_imbalance_message_record.imbalance_volume[net_order_imbalance_message_at] = net_order_imbalance_message_value; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_record.order_capacity = net_order_imbalance_message_value;
  skip
}

/* each byte of Net Order Imbalance Message set to where it lies, so a field read out of place says so */
inline ramp_net_order_imbalance_message(net_order_imbalance_message_record, net_order_imbalance_message_base) {
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 2 -> net_order_imbalance_message_record.tracking_number[net_order_imbalance_message_at] = (net_order_imbalance_message_base + 0 + net_order_imbalance_message_at + 1) % 256; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 8 -> net_order_imbalance_message_record.timestamp[net_order_imbalance_message_at] = (net_order_imbalance_message_base + 2 + net_order_imbalance_message_at + 1) % 256; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 4 -> net_order_imbalance_message_record.instrument_id[net_order_imbalance_message_at] = (net_order_imbalance_message_base + 10 + net_order_imbalance_message_at + 1) % 256; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 4 -> net_order_imbalance_message_record.auction_id[net_order_imbalance_message_at] = (net_order_imbalance_message_base + 14 + net_order_imbalance_message_at + 1) % 256; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_record.auction_type = (net_order_imbalance_message_base + 18 + 1) % 256;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 4 -> net_order_imbalance_message_record.paired_quantity[net_order_imbalance_message_at] = (net_order_imbalance_message_base + 19 + net_order_imbalance_message_at + 1) % 256; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_record.side_imbalance_direction = (net_order_imbalance_message_base + 23 + 1) % 256;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 4 -> net_order_imbalance_message_record.price_imbalance_price[net_order_imbalance_message_at] = (net_order_imbalance_message_base + 24 + net_order_imbalance_message_at + 1) % 256; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 4 -> net_order_imbalance_message_record.imbalance_volume[net_order_imbalance_message_at] = (net_order_imbalance_message_base + 28 + net_order_imbalance_message_at + 1) % 256; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_record.order_capacity = (net_order_imbalance_message_base + 32 + 1) % 256;
  skip
}

/* Net Order Imbalance Message to the wire, 33 bytes from where the cursor stands */
inline encode_net_order_imbalance_message(net_order_imbalance_message_record) {
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 2 -> wire[at] = net_order_imbalance_message_record.tracking_number[net_order_imbalance_message_at]; at = at + 1; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 8 -> wire[at] = net_order_imbalance_message_record.timestamp[net_order_imbalance_message_at]; at = at + 1; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 4 -> wire[at] = net_order_imbalance_message_record.instrument_id[net_order_imbalance_message_at]; at = at + 1; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 4 -> wire[at] = net_order_imbalance_message_record.auction_id[net_order_imbalance_message_at]; at = at + 1; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  wire[at] = net_order_imbalance_message_record.auction_type; at = at + 1;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 4 -> wire[at] = net_order_imbalance_message_record.paired_quantity[net_order_imbalance_message_at]; at = at + 1; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  wire[at] = net_order_imbalance_message_record.side_imbalance_direction; at = at + 1;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 4 -> wire[at] = net_order_imbalance_message_record.price_imbalance_price[net_order_imbalance_message_at]; at = at + 1; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 4 -> wire[at] = net_order_imbalance_message_record.imbalance_volume[net_order_imbalance_message_at]; at = at + 1; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  wire[at] = net_order_imbalance_message_record.order_capacity; at = at + 1;
  skip
}

/* Net Order Imbalance Message off the wire, 33 bytes from where the cursor stands */
inline decode_net_order_imbalance_message(net_order_imbalance_message_record) {
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 2 -> net_order_imbalance_message_record.tracking_number[net_order_imbalance_message_at] = wire[at]; at = at + 1; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 8 -> net_order_imbalance_message_record.timestamp[net_order_imbalance_message_at] = wire[at]; at = at + 1; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 4 -> net_order_imbalance_message_record.instrument_id[net_order_imbalance_message_at] = wire[at]; at = at + 1; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 4 -> net_order_imbalance_message_record.auction_id[net_order_imbalance_message_at] = wire[at]; at = at + 1; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_record.auction_type = wire[at]; at = at + 1;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 4 -> net_order_imbalance_message_record.paired_quantity[net_order_imbalance_message_at] = wire[at]; at = at + 1; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_record.side_imbalance_direction = wire[at]; at = at + 1;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 4 -> net_order_imbalance_message_record.price_imbalance_price[net_order_imbalance_message_at] = wire[at]; at = at + 1; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 4 -> net_order_imbalance_message_record.imbalance_volume[net_order_imbalance_message_at] = wire[at]; at = at + 1; net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_record.order_capacity = wire[at]; at = at + 1;
  skip
}

/* what was read of Net Order Imbalance Message is what was written, byte for byte */
inline equal_net_order_imbalance_message(net_order_imbalance_message_read, net_order_imbalance_message_written) {
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 2 -> assert(net_order_imbalance_message_read.tracking_number[net_order_imbalance_message_at] == net_order_imbalance_message_written.tracking_number[net_order_imbalance_message_at]); net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 8 -> assert(net_order_imbalance_message_read.timestamp[net_order_imbalance_message_at] == net_order_imbalance_message_written.timestamp[net_order_imbalance_message_at]); net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 4 -> assert(net_order_imbalance_message_read.instrument_id[net_order_imbalance_message_at] == net_order_imbalance_message_written.instrument_id[net_order_imbalance_message_at]); net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 4 -> assert(net_order_imbalance_message_read.auction_id[net_order_imbalance_message_at] == net_order_imbalance_message_written.auction_id[net_order_imbalance_message_at]); net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  assert(net_order_imbalance_message_read.auction_type == net_order_imbalance_message_written.auction_type);
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 4 -> assert(net_order_imbalance_message_read.paired_quantity[net_order_imbalance_message_at] == net_order_imbalance_message_written.paired_quantity[net_order_imbalance_message_at]); net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  assert(net_order_imbalance_message_read.side_imbalance_direction == net_order_imbalance_message_written.side_imbalance_direction);
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 4 -> assert(net_order_imbalance_message_read.price_imbalance_price[net_order_imbalance_message_at] == net_order_imbalance_message_written.price_imbalance_price[net_order_imbalance_message_at]); net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_message_at = 0;
  do
  :: net_order_imbalance_message_at < 4 -> assert(net_order_imbalance_message_read.imbalance_volume[net_order_imbalance_message_at] == net_order_imbalance_message_written.imbalance_volume[net_order_imbalance_message_at]); net_order_imbalance_message_at = net_order_imbalance_message_at + 1
  :: else -> break
  od;
  assert(net_order_imbalance_message_read.order_capacity == net_order_imbalance_message_written.order_capacity);
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
    assert(at == 32);
    at = 0;
    decode_add_order_short_form_message(add_order_short_form_message_got);
    assert(at == 32);
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
    assert(at == 36);
    at = 0;
    decode_add_order_long_form_message(add_order_long_form_message_got);
    assert(at == 36);
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
    assert(at == 43);
    at = 0;
    decode_single_side_executed_message(single_side_executed_message_got);
    assert(at == 43);
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
    assert(at == 48);
    at = 0;
    decode_single_side_executed_with_price_message(single_side_executed_with_price_message_got);
    assert(at == 48);
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
    assert(at == 26);
    at = 0;
    decode_order_cancel_message(order_cancel_message_got);
    assert(at == 26);
    equal_order_cancel_message(order_cancel_message_got, order_cancel_message_sent)
  }
}

/* Single Side Replace Short Form Message: encoded, read back, and compared */
proctype check_single_side_replace_short_form_message() {
  SingleSideReplaceShortFormMessage single_side_replace_short_form_message_sent;
  SingleSideReplaceShortFormMessage single_side_replace_short_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_side_replace_short_form_message(single_side_replace_short_form_message_sent, 0)
  :: pattern == 1 -> fill_single_side_replace_short_form_message(single_side_replace_short_form_message_sent, 32)
  :: pattern == 2 -> fill_single_side_replace_short_form_message(single_side_replace_short_form_message_sent, 255)
  :: else -> ramp_single_side_replace_short_form_message(single_side_replace_short_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_side_replace_short_form_message(single_side_replace_short_form_message_sent);
    assert(at == 34);
    at = 0;
    decode_single_side_replace_short_form_message(single_side_replace_short_form_message_got);
    assert(at == 34);
    equal_single_side_replace_short_form_message(single_side_replace_short_form_message_got, single_side_replace_short_form_message_sent)
  }
}

/* Single Side Replace Long Form Message: encoded, read back, and compared */
proctype check_single_side_replace_long_form_message() {
  SingleSideReplaceLongFormMessage single_side_replace_long_form_message_sent;
  SingleSideReplaceLongFormMessage single_side_replace_long_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_side_replace_long_form_message(single_side_replace_long_form_message_sent, 0)
  :: pattern == 1 -> fill_single_side_replace_long_form_message(single_side_replace_long_form_message_sent, 32)
  :: pattern == 2 -> fill_single_side_replace_long_form_message(single_side_replace_long_form_message_sent, 255)
  :: else -> ramp_single_side_replace_long_form_message(single_side_replace_long_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_side_replace_long_form_message(single_side_replace_long_form_message_sent);
    assert(at == 38);
    at = 0;
    decode_single_side_replace_long_form_message(single_side_replace_long_form_message_got);
    assert(at == 38);
    equal_single_side_replace_long_form_message(single_side_replace_long_form_message_got, single_side_replace_long_form_message_sent)
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
    assert(at == 22);
    at = 0;
    decode_single_side_delete_message(single_side_delete_message_got);
    assert(at == 22);
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
    assert(at == 31);
    at = 0;
    decode_single_side_update_message(single_side_update_message_got);
    assert(at == 31);
    equal_single_side_update_message(single_side_update_message_got, single_side_update_message_sent)
  }
}

/* Quote Replace Short Form Message: encoded, read back, and compared */
proctype check_quote_replace_short_form_message() {
  QuoteReplaceShortFormMessage quote_replace_short_form_message_sent;
  QuoteReplaceShortFormMessage quote_replace_short_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_replace_short_form_message(quote_replace_short_form_message_sent, 0)
  :: pattern == 1 -> fill_quote_replace_short_form_message(quote_replace_short_form_message_sent, 32)
  :: pattern == 2 -> fill_quote_replace_short_form_message(quote_replace_short_form_message_sent, 255)
  :: else -> ramp_quote_replace_short_form_message(quote_replace_short_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_replace_short_form_message(quote_replace_short_form_message_sent);
    assert(at == 54);
    at = 0;
    decode_quote_replace_short_form_message(quote_replace_short_form_message_got);
    assert(at == 54);
    equal_quote_replace_short_form_message(quote_replace_short_form_message_got, quote_replace_short_form_message_sent)
  }
}

/* Quote Replace Long Form Message: encoded, read back, and compared */
proctype check_quote_replace_long_form_message() {
  QuoteReplaceLongFormMessage quote_replace_long_form_message_sent;
  QuoteReplaceLongFormMessage quote_replace_long_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_replace_long_form_message(quote_replace_long_form_message_sent, 0)
  :: pattern == 1 -> fill_quote_replace_long_form_message(quote_replace_long_form_message_sent, 32)
  :: pattern == 2 -> fill_quote_replace_long_form_message(quote_replace_long_form_message_sent, 255)
  :: else -> ramp_quote_replace_long_form_message(quote_replace_long_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_replace_long_form_message(quote_replace_long_form_message_sent);
    assert(at == 62);
    at = 0;
    decode_quote_replace_long_form_message(quote_replace_long_form_message_got);
    assert(at == 62);
    equal_quote_replace_long_form_message(quote_replace_long_form_message_got, quote_replace_long_form_message_sent)
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
    assert(at == 30);
    at = 0;
    decode_quote_delete_message(quote_delete_message_got);
    assert(at == 30);
    equal_quote_delete_message(quote_delete_message_got, quote_delete_message_sent)
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
    assert(at == 58);
    at = 0;
    decode_trade_message(trade_message_got);
    assert(at == 58);
    equal_trade_message(trade_message_got, trade_message_sent)
  }
}

/* Net Order Imbalance Message: encoded, read back, and compared */
proctype check_net_order_imbalance_message() {
  NetOrderImbalanceMessage net_order_imbalance_message_sent;
  NetOrderImbalanceMessage net_order_imbalance_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_net_order_imbalance_message(net_order_imbalance_message_sent, 0)
  :: pattern == 1 -> fill_net_order_imbalance_message(net_order_imbalance_message_sent, 32)
  :: pattern == 2 -> fill_net_order_imbalance_message(net_order_imbalance_message_sent, 255)
  :: else -> ramp_net_order_imbalance_message(net_order_imbalance_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_net_order_imbalance_message(net_order_imbalance_message_sent);
    assert(at == 33);
    at = 0;
    decode_net_order_imbalance_message(net_order_imbalance_message_got);
    assert(at == 33);
    equal_net_order_imbalance_message(net_order_imbalance_message_got, net_order_imbalance_message_sent)
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
  :: run check_add_order_short_form_message()
  :: run check_add_order_long_form_message()
  :: run check_add_quote_short_form_message()
  :: run check_add_quote_long_form_message()
  :: run check_single_side_executed_message()
  :: run check_single_side_executed_with_price_message()
  :: run check_order_cancel_message()
  :: run check_single_side_replace_short_form_message()
  :: run check_single_side_replace_long_form_message()
  :: run check_single_side_delete_message()
  :: run check_single_side_update_message()
  :: run check_quote_replace_short_form_message()
  :: run check_quote_replace_long_form_message()
  :: run check_quote_delete_message()
  :: run check_trade_message()
  :: run check_net_order_imbalance_message()
  fi
}
