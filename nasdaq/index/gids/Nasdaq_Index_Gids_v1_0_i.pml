/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Global Index Data Service
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
 *   - a length prefix framing what follows
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 102

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

/* ---- Timestamp Seconds Message: 4 bytes -------------------------------------- */

/* For every second during which there is at least one payload message, the seconds since the Unix epoch. */
typedef TimestampSecondsMessage {
  byte second[4]
};

int timestamp_seconds_message_at;

/* every byte of Timestamp Seconds Message set to one value */
inline fill_timestamp_seconds_message(timestamp_seconds_message_record, timestamp_seconds_message_value) {
  timestamp_seconds_message_at = 0;
  do
  :: timestamp_seconds_message_at < 4 -> timestamp_seconds_message_record.second[timestamp_seconds_message_at] = timestamp_seconds_message_value; timestamp_seconds_message_at = timestamp_seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Timestamp Seconds Message set to where it lies, so a field read out of place says so */
inline ramp_timestamp_seconds_message(timestamp_seconds_message_record, timestamp_seconds_message_base) {
  timestamp_seconds_message_at = 0;
  do
  :: timestamp_seconds_message_at < 4 -> timestamp_seconds_message_record.second[timestamp_seconds_message_at] = (timestamp_seconds_message_base + 0 + timestamp_seconds_message_at + 1) % 256; timestamp_seconds_message_at = timestamp_seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* Timestamp Seconds Message to the wire, 4 bytes from where the cursor stands */
inline encode_timestamp_seconds_message(timestamp_seconds_message_record) {
  timestamp_seconds_message_at = 0;
  do
  :: timestamp_seconds_message_at < 4 -> wire[at] = timestamp_seconds_message_record.second[timestamp_seconds_message_at]; at = at + 1; timestamp_seconds_message_at = timestamp_seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* Timestamp Seconds Message off the wire, 4 bytes from where the cursor stands */
inline decode_timestamp_seconds_message(timestamp_seconds_message_record) {
  timestamp_seconds_message_at = 0;
  do
  :: timestamp_seconds_message_at < 4 -> timestamp_seconds_message_record.second[timestamp_seconds_message_at] = wire[at]; at = at + 1; timestamp_seconds_message_at = timestamp_seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Timestamp Seconds Message is what was written, byte for byte */
inline equal_timestamp_seconds_message(timestamp_seconds_message_read, timestamp_seconds_message_written) {
  timestamp_seconds_message_at = 0;
  do
  :: timestamp_seconds_message_at < 4 -> assert(timestamp_seconds_message_read.second[timestamp_seconds_message_at] == timestamp_seconds_message_written.second[timestamp_seconds_message_at]); timestamp_seconds_message_at = timestamp_seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System Event Message: 8 bytes ------------------------------------------- */

/* Signals a data feed handler event. */
typedef SystemEventMessage {
  byte nanoseconds[4];
  byte event_code;
  byte schedule[3]
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
  system_event_message_at = 0;
  do
  :: system_event_message_at < 3 -> system_event_message_record.schedule[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
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
  system_event_message_at = 0;
  do
  :: system_event_message_at < 3 -> system_event_message_record.schedule[system_event_message_at] = (system_event_message_base + 5 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Event Message to the wire, 8 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> wire[at] = system_event_message_record.nanoseconds[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 3 -> wire[at] = system_event_message_record.schedule[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Event Message off the wire, 8 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.nanoseconds[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = wire[at]; at = at + 1;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 3 -> system_event_message_record.schedule[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
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
  system_event_message_at = 0;
  do
  :: system_event_message_at < 3 -> assert(system_event_message_read.schedule[system_event_message_at] == system_event_message_written.schedule[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Intraday Index Value Message: 40 bytes ---------------------------------- */

/* The Intraday Index Value for a given instrument, disseminated at a defined frequency and schedule. */
typedef IntradayIndexValueMessage {
  byte nanoseconds[4];
  byte financial_product_type;
  byte brand[2];
  byte series[3];
  byte instrument_id[18];
  byte tick_value[8];
  byte tick_direction;
  byte currency[3]
};

int intraday_index_value_message_at;

/* every byte of Intraday Index Value Message set to one value */
inline fill_intraday_index_value_message(intraday_index_value_message_record, intraday_index_value_message_value) {
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 4 -> intraday_index_value_message_record.nanoseconds[intraday_index_value_message_at] = intraday_index_value_message_value; intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  intraday_index_value_message_record.financial_product_type = intraday_index_value_message_value;
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 2 -> intraday_index_value_message_record.brand[intraday_index_value_message_at] = intraday_index_value_message_value; intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 3 -> intraday_index_value_message_record.series[intraday_index_value_message_at] = intraday_index_value_message_value; intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 18 -> intraday_index_value_message_record.instrument_id[intraday_index_value_message_at] = intraday_index_value_message_value; intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 8 -> intraday_index_value_message_record.tick_value[intraday_index_value_message_at] = intraday_index_value_message_value; intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  intraday_index_value_message_record.tick_direction = intraday_index_value_message_value;
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 3 -> intraday_index_value_message_record.currency[intraday_index_value_message_at] = intraday_index_value_message_value; intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Intraday Index Value Message set to where it lies, so a field read out of place says so */
inline ramp_intraday_index_value_message(intraday_index_value_message_record, intraday_index_value_message_base) {
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 4 -> intraday_index_value_message_record.nanoseconds[intraday_index_value_message_at] = (intraday_index_value_message_base + 0 + intraday_index_value_message_at + 1) % 256; intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  intraday_index_value_message_record.financial_product_type = (intraday_index_value_message_base + 4 + 1) % 256;
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 2 -> intraday_index_value_message_record.brand[intraday_index_value_message_at] = (intraday_index_value_message_base + 5 + intraday_index_value_message_at + 1) % 256; intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 3 -> intraday_index_value_message_record.series[intraday_index_value_message_at] = (intraday_index_value_message_base + 7 + intraday_index_value_message_at + 1) % 256; intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 18 -> intraday_index_value_message_record.instrument_id[intraday_index_value_message_at] = (intraday_index_value_message_base + 10 + intraday_index_value_message_at + 1) % 256; intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 8 -> intraday_index_value_message_record.tick_value[intraday_index_value_message_at] = (intraday_index_value_message_base + 28 + intraday_index_value_message_at + 1) % 256; intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  intraday_index_value_message_record.tick_direction = (intraday_index_value_message_base + 36 + 1) % 256;
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 3 -> intraday_index_value_message_record.currency[intraday_index_value_message_at] = (intraday_index_value_message_base + 37 + intraday_index_value_message_at + 1) % 256; intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* Intraday Index Value Message to the wire, 40 bytes from where the cursor stands */
inline encode_intraday_index_value_message(intraday_index_value_message_record) {
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 4 -> wire[at] = intraday_index_value_message_record.nanoseconds[intraday_index_value_message_at]; at = at + 1; intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  wire[at] = intraday_index_value_message_record.financial_product_type; at = at + 1;
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 2 -> wire[at] = intraday_index_value_message_record.brand[intraday_index_value_message_at]; at = at + 1; intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 3 -> wire[at] = intraday_index_value_message_record.series[intraday_index_value_message_at]; at = at + 1; intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 18 -> wire[at] = intraday_index_value_message_record.instrument_id[intraday_index_value_message_at]; at = at + 1; intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 8 -> wire[at] = intraday_index_value_message_record.tick_value[intraday_index_value_message_at]; at = at + 1; intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  wire[at] = intraday_index_value_message_record.tick_direction; at = at + 1;
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 3 -> wire[at] = intraday_index_value_message_record.currency[intraday_index_value_message_at]; at = at + 1; intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* Intraday Index Value Message off the wire, 40 bytes from where the cursor stands */
inline decode_intraday_index_value_message(intraday_index_value_message_record) {
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 4 -> intraday_index_value_message_record.nanoseconds[intraday_index_value_message_at] = wire[at]; at = at + 1; intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  intraday_index_value_message_record.financial_product_type = wire[at]; at = at + 1;
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 2 -> intraday_index_value_message_record.brand[intraday_index_value_message_at] = wire[at]; at = at + 1; intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 3 -> intraday_index_value_message_record.series[intraday_index_value_message_at] = wire[at]; at = at + 1; intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 18 -> intraday_index_value_message_record.instrument_id[intraday_index_value_message_at] = wire[at]; at = at + 1; intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 8 -> intraday_index_value_message_record.tick_value[intraday_index_value_message_at] = wire[at]; at = at + 1; intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  intraday_index_value_message_record.tick_direction = wire[at]; at = at + 1;
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 3 -> intraday_index_value_message_record.currency[intraday_index_value_message_at] = wire[at]; at = at + 1; intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Intraday Index Value Message is what was written, byte for byte */
inline equal_intraday_index_value_message(intraday_index_value_message_read, intraday_index_value_message_written) {
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 4 -> assert(intraday_index_value_message_read.nanoseconds[intraday_index_value_message_at] == intraday_index_value_message_written.nanoseconds[intraday_index_value_message_at]); intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  assert(intraday_index_value_message_read.financial_product_type == intraday_index_value_message_written.financial_product_type);
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 2 -> assert(intraday_index_value_message_read.brand[intraday_index_value_message_at] == intraday_index_value_message_written.brand[intraday_index_value_message_at]); intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 3 -> assert(intraday_index_value_message_read.series[intraday_index_value_message_at] == intraday_index_value_message_written.series[intraday_index_value_message_at]); intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 18 -> assert(intraday_index_value_message_read.instrument_id[intraday_index_value_message_at] == intraday_index_value_message_written.instrument_id[intraday_index_value_message_at]); intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 8 -> assert(intraday_index_value_message_read.tick_value[intraday_index_value_message_at] == intraday_index_value_message_written.tick_value[intraday_index_value_message_at]); intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  assert(intraday_index_value_message_read.tick_direction == intraday_index_value_message_written.tick_direction);
  intraday_index_value_message_at = 0;
  do
  :: intraday_index_value_message_at < 3 -> assert(intraday_index_value_message_read.currency[intraday_index_value_message_at] == intraday_index_value_message_written.currency[intraday_index_value_message_at]); intraday_index_value_message_at = intraday_index_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Settlement Value Message: 40 bytes -------------------------------------- */

/* Sends the official settlement price and settlement session used to settle cash derivatives on financial products when they expire. */
typedef SettlementValueMessage {
  byte nanoseconds[4];
  byte financial_product_type;
  byte brand[2];
  byte series[3];
  byte instrument_id[18];
  byte settlement_value[8];
  byte settlement_type;
  byte currency[3]
};

int settlement_value_message_at;

/* every byte of Settlement Value Message set to one value */
inline fill_settlement_value_message(settlement_value_message_record, settlement_value_message_value) {
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 4 -> settlement_value_message_record.nanoseconds[settlement_value_message_at] = settlement_value_message_value; settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  settlement_value_message_record.financial_product_type = settlement_value_message_value;
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 2 -> settlement_value_message_record.brand[settlement_value_message_at] = settlement_value_message_value; settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 3 -> settlement_value_message_record.series[settlement_value_message_at] = settlement_value_message_value; settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 18 -> settlement_value_message_record.instrument_id[settlement_value_message_at] = settlement_value_message_value; settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 8 -> settlement_value_message_record.settlement_value[settlement_value_message_at] = settlement_value_message_value; settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  settlement_value_message_record.settlement_type = settlement_value_message_value;
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 3 -> settlement_value_message_record.currency[settlement_value_message_at] = settlement_value_message_value; settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Settlement Value Message set to where it lies, so a field read out of place says so */
inline ramp_settlement_value_message(settlement_value_message_record, settlement_value_message_base) {
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 4 -> settlement_value_message_record.nanoseconds[settlement_value_message_at] = (settlement_value_message_base + 0 + settlement_value_message_at + 1) % 256; settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  settlement_value_message_record.financial_product_type = (settlement_value_message_base + 4 + 1) % 256;
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 2 -> settlement_value_message_record.brand[settlement_value_message_at] = (settlement_value_message_base + 5 + settlement_value_message_at + 1) % 256; settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 3 -> settlement_value_message_record.series[settlement_value_message_at] = (settlement_value_message_base + 7 + settlement_value_message_at + 1) % 256; settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 18 -> settlement_value_message_record.instrument_id[settlement_value_message_at] = (settlement_value_message_base + 10 + settlement_value_message_at + 1) % 256; settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 8 -> settlement_value_message_record.settlement_value[settlement_value_message_at] = (settlement_value_message_base + 28 + settlement_value_message_at + 1) % 256; settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  settlement_value_message_record.settlement_type = (settlement_value_message_base + 36 + 1) % 256;
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 3 -> settlement_value_message_record.currency[settlement_value_message_at] = (settlement_value_message_base + 37 + settlement_value_message_at + 1) % 256; settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* Settlement Value Message to the wire, 40 bytes from where the cursor stands */
inline encode_settlement_value_message(settlement_value_message_record) {
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 4 -> wire[at] = settlement_value_message_record.nanoseconds[settlement_value_message_at]; at = at + 1; settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  wire[at] = settlement_value_message_record.financial_product_type; at = at + 1;
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 2 -> wire[at] = settlement_value_message_record.brand[settlement_value_message_at]; at = at + 1; settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 3 -> wire[at] = settlement_value_message_record.series[settlement_value_message_at]; at = at + 1; settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 18 -> wire[at] = settlement_value_message_record.instrument_id[settlement_value_message_at]; at = at + 1; settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 8 -> wire[at] = settlement_value_message_record.settlement_value[settlement_value_message_at]; at = at + 1; settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  wire[at] = settlement_value_message_record.settlement_type; at = at + 1;
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 3 -> wire[at] = settlement_value_message_record.currency[settlement_value_message_at]; at = at + 1; settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* Settlement Value Message off the wire, 40 bytes from where the cursor stands */
inline decode_settlement_value_message(settlement_value_message_record) {
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 4 -> settlement_value_message_record.nanoseconds[settlement_value_message_at] = wire[at]; at = at + 1; settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  settlement_value_message_record.financial_product_type = wire[at]; at = at + 1;
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 2 -> settlement_value_message_record.brand[settlement_value_message_at] = wire[at]; at = at + 1; settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 3 -> settlement_value_message_record.series[settlement_value_message_at] = wire[at]; at = at + 1; settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 18 -> settlement_value_message_record.instrument_id[settlement_value_message_at] = wire[at]; at = at + 1; settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 8 -> settlement_value_message_record.settlement_value[settlement_value_message_at] = wire[at]; at = at + 1; settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  settlement_value_message_record.settlement_type = wire[at]; at = at + 1;
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 3 -> settlement_value_message_record.currency[settlement_value_message_at] = wire[at]; at = at + 1; settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Settlement Value Message is what was written, byte for byte */
inline equal_settlement_value_message(settlement_value_message_read, settlement_value_message_written) {
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 4 -> assert(settlement_value_message_read.nanoseconds[settlement_value_message_at] == settlement_value_message_written.nanoseconds[settlement_value_message_at]); settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  assert(settlement_value_message_read.financial_product_type == settlement_value_message_written.financial_product_type);
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 2 -> assert(settlement_value_message_read.brand[settlement_value_message_at] == settlement_value_message_written.brand[settlement_value_message_at]); settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 3 -> assert(settlement_value_message_read.series[settlement_value_message_at] == settlement_value_message_written.series[settlement_value_message_at]); settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 18 -> assert(settlement_value_message_read.instrument_id[settlement_value_message_at] == settlement_value_message_written.instrument_id[settlement_value_message_at]); settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 8 -> assert(settlement_value_message_read.settlement_value[settlement_value_message_at] == settlement_value_message_written.settlement_value[settlement_value_message_at]); settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  assert(settlement_value_message_read.settlement_type == settlement_value_message_written.settlement_type);
  settlement_value_message_at = 0;
  do
  :: settlement_value_message_at < 3 -> assert(settlement_value_message_read.currency[settlement_value_message_at] == settlement_value_message_written.currency[settlement_value_message_at]); settlement_value_message_at = settlement_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Equities Summary Message: 78 bytes -------------------------------------- */

/* Relays the summary of the current trading day's activity for an equity index. */
typedef EquitiesSummaryMessage {
  byte nanoseconds[4];
  byte financial_product_type;
  byte brand[2];
  byte series[3];
  byte instrument_id[18];
  byte summary_type[3];
  byte sod_value[8];
  byte high[8];
  byte low[8];
  byte eod_value[8];
  byte net_change[8];
  byte effective_date[4];
  byte currency[3]
};

int equities_summary_message_at;

/* every byte of Equities Summary Message set to one value */
inline fill_equities_summary_message(equities_summary_message_record, equities_summary_message_value) {
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 4 -> equities_summary_message_record.nanoseconds[equities_summary_message_at] = equities_summary_message_value; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_record.financial_product_type = equities_summary_message_value;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 2 -> equities_summary_message_record.brand[equities_summary_message_at] = equities_summary_message_value; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 3 -> equities_summary_message_record.series[equities_summary_message_at] = equities_summary_message_value; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 18 -> equities_summary_message_record.instrument_id[equities_summary_message_at] = equities_summary_message_value; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 3 -> equities_summary_message_record.summary_type[equities_summary_message_at] = equities_summary_message_value; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 8 -> equities_summary_message_record.sod_value[equities_summary_message_at] = equities_summary_message_value; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 8 -> equities_summary_message_record.high[equities_summary_message_at] = equities_summary_message_value; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 8 -> equities_summary_message_record.low[equities_summary_message_at] = equities_summary_message_value; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 8 -> equities_summary_message_record.eod_value[equities_summary_message_at] = equities_summary_message_value; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 8 -> equities_summary_message_record.net_change[equities_summary_message_at] = equities_summary_message_value; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 4 -> equities_summary_message_record.effective_date[equities_summary_message_at] = equities_summary_message_value; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 3 -> equities_summary_message_record.currency[equities_summary_message_at] = equities_summary_message_value; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Equities Summary Message set to where it lies, so a field read out of place says so */
inline ramp_equities_summary_message(equities_summary_message_record, equities_summary_message_base) {
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 4 -> equities_summary_message_record.nanoseconds[equities_summary_message_at] = (equities_summary_message_base + 0 + equities_summary_message_at + 1) % 256; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_record.financial_product_type = (equities_summary_message_base + 4 + 1) % 256;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 2 -> equities_summary_message_record.brand[equities_summary_message_at] = (equities_summary_message_base + 5 + equities_summary_message_at + 1) % 256; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 3 -> equities_summary_message_record.series[equities_summary_message_at] = (equities_summary_message_base + 7 + equities_summary_message_at + 1) % 256; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 18 -> equities_summary_message_record.instrument_id[equities_summary_message_at] = (equities_summary_message_base + 10 + equities_summary_message_at + 1) % 256; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 3 -> equities_summary_message_record.summary_type[equities_summary_message_at] = (equities_summary_message_base + 28 + equities_summary_message_at + 1) % 256; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 8 -> equities_summary_message_record.sod_value[equities_summary_message_at] = (equities_summary_message_base + 31 + equities_summary_message_at + 1) % 256; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 8 -> equities_summary_message_record.high[equities_summary_message_at] = (equities_summary_message_base + 39 + equities_summary_message_at + 1) % 256; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 8 -> equities_summary_message_record.low[equities_summary_message_at] = (equities_summary_message_base + 47 + equities_summary_message_at + 1) % 256; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 8 -> equities_summary_message_record.eod_value[equities_summary_message_at] = (equities_summary_message_base + 55 + equities_summary_message_at + 1) % 256; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 8 -> equities_summary_message_record.net_change[equities_summary_message_at] = (equities_summary_message_base + 63 + equities_summary_message_at + 1) % 256; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 4 -> equities_summary_message_record.effective_date[equities_summary_message_at] = (equities_summary_message_base + 71 + equities_summary_message_at + 1) % 256; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 3 -> equities_summary_message_record.currency[equities_summary_message_at] = (equities_summary_message_base + 75 + equities_summary_message_at + 1) % 256; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Equities Summary Message to the wire, 78 bytes from where the cursor stands */
inline encode_equities_summary_message(equities_summary_message_record) {
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 4 -> wire[at] = equities_summary_message_record.nanoseconds[equities_summary_message_at]; at = at + 1; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_summary_message_record.financial_product_type; at = at + 1;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 2 -> wire[at] = equities_summary_message_record.brand[equities_summary_message_at]; at = at + 1; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 3 -> wire[at] = equities_summary_message_record.series[equities_summary_message_at]; at = at + 1; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 18 -> wire[at] = equities_summary_message_record.instrument_id[equities_summary_message_at]; at = at + 1; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 3 -> wire[at] = equities_summary_message_record.summary_type[equities_summary_message_at]; at = at + 1; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 8 -> wire[at] = equities_summary_message_record.sod_value[equities_summary_message_at]; at = at + 1; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 8 -> wire[at] = equities_summary_message_record.high[equities_summary_message_at]; at = at + 1; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 8 -> wire[at] = equities_summary_message_record.low[equities_summary_message_at]; at = at + 1; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 8 -> wire[at] = equities_summary_message_record.eod_value[equities_summary_message_at]; at = at + 1; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 8 -> wire[at] = equities_summary_message_record.net_change[equities_summary_message_at]; at = at + 1; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 4 -> wire[at] = equities_summary_message_record.effective_date[equities_summary_message_at]; at = at + 1; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 3 -> wire[at] = equities_summary_message_record.currency[equities_summary_message_at]; at = at + 1; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Equities Summary Message off the wire, 78 bytes from where the cursor stands */
inline decode_equities_summary_message(equities_summary_message_record) {
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 4 -> equities_summary_message_record.nanoseconds[equities_summary_message_at] = wire[at]; at = at + 1; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_record.financial_product_type = wire[at]; at = at + 1;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 2 -> equities_summary_message_record.brand[equities_summary_message_at] = wire[at]; at = at + 1; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 3 -> equities_summary_message_record.series[equities_summary_message_at] = wire[at]; at = at + 1; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 18 -> equities_summary_message_record.instrument_id[equities_summary_message_at] = wire[at]; at = at + 1; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 3 -> equities_summary_message_record.summary_type[equities_summary_message_at] = wire[at]; at = at + 1; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 8 -> equities_summary_message_record.sod_value[equities_summary_message_at] = wire[at]; at = at + 1; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 8 -> equities_summary_message_record.high[equities_summary_message_at] = wire[at]; at = at + 1; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 8 -> equities_summary_message_record.low[equities_summary_message_at] = wire[at]; at = at + 1; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 8 -> equities_summary_message_record.eod_value[equities_summary_message_at] = wire[at]; at = at + 1; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 8 -> equities_summary_message_record.net_change[equities_summary_message_at] = wire[at]; at = at + 1; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 4 -> equities_summary_message_record.effective_date[equities_summary_message_at] = wire[at]; at = at + 1; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 3 -> equities_summary_message_record.currency[equities_summary_message_at] = wire[at]; at = at + 1; equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Equities Summary Message is what was written, byte for byte */
inline equal_equities_summary_message(equities_summary_message_read, equities_summary_message_written) {
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 4 -> assert(equities_summary_message_read.nanoseconds[equities_summary_message_at] == equities_summary_message_written.nanoseconds[equities_summary_message_at]); equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  assert(equities_summary_message_read.financial_product_type == equities_summary_message_written.financial_product_type);
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 2 -> assert(equities_summary_message_read.brand[equities_summary_message_at] == equities_summary_message_written.brand[equities_summary_message_at]); equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 3 -> assert(equities_summary_message_read.series[equities_summary_message_at] == equities_summary_message_written.series[equities_summary_message_at]); equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 18 -> assert(equities_summary_message_read.instrument_id[equities_summary_message_at] == equities_summary_message_written.instrument_id[equities_summary_message_at]); equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 3 -> assert(equities_summary_message_read.summary_type[equities_summary_message_at] == equities_summary_message_written.summary_type[equities_summary_message_at]); equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 8 -> assert(equities_summary_message_read.sod_value[equities_summary_message_at] == equities_summary_message_written.sod_value[equities_summary_message_at]); equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 8 -> assert(equities_summary_message_read.high[equities_summary_message_at] == equities_summary_message_written.high[equities_summary_message_at]); equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 8 -> assert(equities_summary_message_read.low[equities_summary_message_at] == equities_summary_message_written.low[equities_summary_message_at]); equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 8 -> assert(equities_summary_message_read.eod_value[equities_summary_message_at] == equities_summary_message_written.eod_value[equities_summary_message_at]); equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 8 -> assert(equities_summary_message_read.net_change[equities_summary_message_at] == equities_summary_message_written.net_change[equities_summary_message_at]); equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 4 -> assert(equities_summary_message_read.effective_date[equities_summary_message_at] == equities_summary_message_written.effective_date[equities_summary_message_at]); equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  equities_summary_message_at = 0;
  do
  :: equities_summary_message_at < 3 -> assert(equities_summary_message_read.currency[equities_summary_message_at] == equities_summary_message_written.currency[equities_summary_message_at]); equities_summary_message_at = equities_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Fixed Income Summary Message: 102 bytes --------------------------------- */

/* Relays the summary of the current trading day's activity for a fixed income index. */
typedef FixedIncomeSummaryMessage {
  byte nanoseconds[4];
  byte financial_product_type;
  byte brand[2];
  byte series[3];
  byte instrument_id[18];
  byte summary_type[3];
  byte sod_value[8];
  byte high[8];
  byte low[8];
  byte eod_value[8];
  byte net_change[8];
  byte effective_date[4];
  byte yield[8];
  byte duration[8];
  byte coupon[8];
  byte currency[3]
};

int fixed_income_summary_message_at;

/* every byte of Fixed Income Summary Message set to one value */
inline fill_fixed_income_summary_message(fixed_income_summary_message_record, fixed_income_summary_message_value) {
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 4 -> fixed_income_summary_message_record.nanoseconds[fixed_income_summary_message_at] = fixed_income_summary_message_value; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_record.financial_product_type = fixed_income_summary_message_value;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 2 -> fixed_income_summary_message_record.brand[fixed_income_summary_message_at] = fixed_income_summary_message_value; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 3 -> fixed_income_summary_message_record.series[fixed_income_summary_message_at] = fixed_income_summary_message_value; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 18 -> fixed_income_summary_message_record.instrument_id[fixed_income_summary_message_at] = fixed_income_summary_message_value; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 3 -> fixed_income_summary_message_record.summary_type[fixed_income_summary_message_at] = fixed_income_summary_message_value; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> fixed_income_summary_message_record.sod_value[fixed_income_summary_message_at] = fixed_income_summary_message_value; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> fixed_income_summary_message_record.high[fixed_income_summary_message_at] = fixed_income_summary_message_value; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> fixed_income_summary_message_record.low[fixed_income_summary_message_at] = fixed_income_summary_message_value; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> fixed_income_summary_message_record.eod_value[fixed_income_summary_message_at] = fixed_income_summary_message_value; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> fixed_income_summary_message_record.net_change[fixed_income_summary_message_at] = fixed_income_summary_message_value; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 4 -> fixed_income_summary_message_record.effective_date[fixed_income_summary_message_at] = fixed_income_summary_message_value; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> fixed_income_summary_message_record.yield[fixed_income_summary_message_at] = fixed_income_summary_message_value; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> fixed_income_summary_message_record.duration[fixed_income_summary_message_at] = fixed_income_summary_message_value; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> fixed_income_summary_message_record.coupon[fixed_income_summary_message_at] = fixed_income_summary_message_value; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 3 -> fixed_income_summary_message_record.currency[fixed_income_summary_message_at] = fixed_income_summary_message_value; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Fixed Income Summary Message set to where it lies, so a field read out of place says so */
inline ramp_fixed_income_summary_message(fixed_income_summary_message_record, fixed_income_summary_message_base) {
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 4 -> fixed_income_summary_message_record.nanoseconds[fixed_income_summary_message_at] = (fixed_income_summary_message_base + 0 + fixed_income_summary_message_at + 1) % 256; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_record.financial_product_type = (fixed_income_summary_message_base + 4 + 1) % 256;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 2 -> fixed_income_summary_message_record.brand[fixed_income_summary_message_at] = (fixed_income_summary_message_base + 5 + fixed_income_summary_message_at + 1) % 256; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 3 -> fixed_income_summary_message_record.series[fixed_income_summary_message_at] = (fixed_income_summary_message_base + 7 + fixed_income_summary_message_at + 1) % 256; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 18 -> fixed_income_summary_message_record.instrument_id[fixed_income_summary_message_at] = (fixed_income_summary_message_base + 10 + fixed_income_summary_message_at + 1) % 256; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 3 -> fixed_income_summary_message_record.summary_type[fixed_income_summary_message_at] = (fixed_income_summary_message_base + 28 + fixed_income_summary_message_at + 1) % 256; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> fixed_income_summary_message_record.sod_value[fixed_income_summary_message_at] = (fixed_income_summary_message_base + 31 + fixed_income_summary_message_at + 1) % 256; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> fixed_income_summary_message_record.high[fixed_income_summary_message_at] = (fixed_income_summary_message_base + 39 + fixed_income_summary_message_at + 1) % 256; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> fixed_income_summary_message_record.low[fixed_income_summary_message_at] = (fixed_income_summary_message_base + 47 + fixed_income_summary_message_at + 1) % 256; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> fixed_income_summary_message_record.eod_value[fixed_income_summary_message_at] = (fixed_income_summary_message_base + 55 + fixed_income_summary_message_at + 1) % 256; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> fixed_income_summary_message_record.net_change[fixed_income_summary_message_at] = (fixed_income_summary_message_base + 63 + fixed_income_summary_message_at + 1) % 256; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 4 -> fixed_income_summary_message_record.effective_date[fixed_income_summary_message_at] = (fixed_income_summary_message_base + 71 + fixed_income_summary_message_at + 1) % 256; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> fixed_income_summary_message_record.yield[fixed_income_summary_message_at] = (fixed_income_summary_message_base + 75 + fixed_income_summary_message_at + 1) % 256; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> fixed_income_summary_message_record.duration[fixed_income_summary_message_at] = (fixed_income_summary_message_base + 83 + fixed_income_summary_message_at + 1) % 256; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> fixed_income_summary_message_record.coupon[fixed_income_summary_message_at] = (fixed_income_summary_message_base + 91 + fixed_income_summary_message_at + 1) % 256; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 3 -> fixed_income_summary_message_record.currency[fixed_income_summary_message_at] = (fixed_income_summary_message_base + 99 + fixed_income_summary_message_at + 1) % 256; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Fixed Income Summary Message to the wire, 102 bytes from where the cursor stands */
inline encode_fixed_income_summary_message(fixed_income_summary_message_record) {
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 4 -> wire[at] = fixed_income_summary_message_record.nanoseconds[fixed_income_summary_message_at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = fixed_income_summary_message_record.financial_product_type; at = at + 1;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 2 -> wire[at] = fixed_income_summary_message_record.brand[fixed_income_summary_message_at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 3 -> wire[at] = fixed_income_summary_message_record.series[fixed_income_summary_message_at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 18 -> wire[at] = fixed_income_summary_message_record.instrument_id[fixed_income_summary_message_at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 3 -> wire[at] = fixed_income_summary_message_record.summary_type[fixed_income_summary_message_at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> wire[at] = fixed_income_summary_message_record.sod_value[fixed_income_summary_message_at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> wire[at] = fixed_income_summary_message_record.high[fixed_income_summary_message_at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> wire[at] = fixed_income_summary_message_record.low[fixed_income_summary_message_at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> wire[at] = fixed_income_summary_message_record.eod_value[fixed_income_summary_message_at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> wire[at] = fixed_income_summary_message_record.net_change[fixed_income_summary_message_at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 4 -> wire[at] = fixed_income_summary_message_record.effective_date[fixed_income_summary_message_at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> wire[at] = fixed_income_summary_message_record.yield[fixed_income_summary_message_at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> wire[at] = fixed_income_summary_message_record.duration[fixed_income_summary_message_at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> wire[at] = fixed_income_summary_message_record.coupon[fixed_income_summary_message_at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 3 -> wire[at] = fixed_income_summary_message_record.currency[fixed_income_summary_message_at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Fixed Income Summary Message off the wire, 102 bytes from where the cursor stands */
inline decode_fixed_income_summary_message(fixed_income_summary_message_record) {
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 4 -> fixed_income_summary_message_record.nanoseconds[fixed_income_summary_message_at] = wire[at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_record.financial_product_type = wire[at]; at = at + 1;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 2 -> fixed_income_summary_message_record.brand[fixed_income_summary_message_at] = wire[at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 3 -> fixed_income_summary_message_record.series[fixed_income_summary_message_at] = wire[at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 18 -> fixed_income_summary_message_record.instrument_id[fixed_income_summary_message_at] = wire[at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 3 -> fixed_income_summary_message_record.summary_type[fixed_income_summary_message_at] = wire[at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> fixed_income_summary_message_record.sod_value[fixed_income_summary_message_at] = wire[at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> fixed_income_summary_message_record.high[fixed_income_summary_message_at] = wire[at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> fixed_income_summary_message_record.low[fixed_income_summary_message_at] = wire[at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> fixed_income_summary_message_record.eod_value[fixed_income_summary_message_at] = wire[at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> fixed_income_summary_message_record.net_change[fixed_income_summary_message_at] = wire[at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 4 -> fixed_income_summary_message_record.effective_date[fixed_income_summary_message_at] = wire[at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> fixed_income_summary_message_record.yield[fixed_income_summary_message_at] = wire[at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> fixed_income_summary_message_record.duration[fixed_income_summary_message_at] = wire[at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> fixed_income_summary_message_record.coupon[fixed_income_summary_message_at] = wire[at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 3 -> fixed_income_summary_message_record.currency[fixed_income_summary_message_at] = wire[at]; at = at + 1; fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Fixed Income Summary Message is what was written, byte for byte */
inline equal_fixed_income_summary_message(fixed_income_summary_message_read, fixed_income_summary_message_written) {
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 4 -> assert(fixed_income_summary_message_read.nanoseconds[fixed_income_summary_message_at] == fixed_income_summary_message_written.nanoseconds[fixed_income_summary_message_at]); fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  assert(fixed_income_summary_message_read.financial_product_type == fixed_income_summary_message_written.financial_product_type);
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 2 -> assert(fixed_income_summary_message_read.brand[fixed_income_summary_message_at] == fixed_income_summary_message_written.brand[fixed_income_summary_message_at]); fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 3 -> assert(fixed_income_summary_message_read.series[fixed_income_summary_message_at] == fixed_income_summary_message_written.series[fixed_income_summary_message_at]); fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 18 -> assert(fixed_income_summary_message_read.instrument_id[fixed_income_summary_message_at] == fixed_income_summary_message_written.instrument_id[fixed_income_summary_message_at]); fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 3 -> assert(fixed_income_summary_message_read.summary_type[fixed_income_summary_message_at] == fixed_income_summary_message_written.summary_type[fixed_income_summary_message_at]); fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> assert(fixed_income_summary_message_read.sod_value[fixed_income_summary_message_at] == fixed_income_summary_message_written.sod_value[fixed_income_summary_message_at]); fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> assert(fixed_income_summary_message_read.high[fixed_income_summary_message_at] == fixed_income_summary_message_written.high[fixed_income_summary_message_at]); fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> assert(fixed_income_summary_message_read.low[fixed_income_summary_message_at] == fixed_income_summary_message_written.low[fixed_income_summary_message_at]); fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> assert(fixed_income_summary_message_read.eod_value[fixed_income_summary_message_at] == fixed_income_summary_message_written.eod_value[fixed_income_summary_message_at]); fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> assert(fixed_income_summary_message_read.net_change[fixed_income_summary_message_at] == fixed_income_summary_message_written.net_change[fixed_income_summary_message_at]); fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 4 -> assert(fixed_income_summary_message_read.effective_date[fixed_income_summary_message_at] == fixed_income_summary_message_written.effective_date[fixed_income_summary_message_at]); fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> assert(fixed_income_summary_message_read.yield[fixed_income_summary_message_at] == fixed_income_summary_message_written.yield[fixed_income_summary_message_at]); fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> assert(fixed_income_summary_message_read.duration[fixed_income_summary_message_at] == fixed_income_summary_message_written.duration[fixed_income_summary_message_at]); fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 8 -> assert(fixed_income_summary_message_read.coupon[fixed_income_summary_message_at] == fixed_income_summary_message_written.coupon[fixed_income_summary_message_at]); fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  fixed_income_summary_message_at = 0;
  do
  :: fixed_income_summary_message_at < 3 -> assert(fixed_income_summary_message_read.currency[fixed_income_summary_message_at] == fixed_income_summary_message_written.currency[fixed_income_summary_message_at]); fixed_income_summary_message_at = fixed_income_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Commodity Summary Message: 78 bytes ------------------------------------- */

/* Relays the summary of the current trading day's activity for a commodity index. */
typedef CommoditySummaryMessage {
  byte nanoseconds[4];
  byte financial_product_type;
  byte brand[2];
  byte series[3];
  byte instrument_id[18];
  byte summary_type[3];
  byte sod_value[8];
  byte high[8];
  byte low[8];
  byte eod_value[8];
  byte net_change[8];
  byte effective_date[4];
  byte currency[3]
};

int commodity_summary_message_at;

/* every byte of Commodity Summary Message set to one value */
inline fill_commodity_summary_message(commodity_summary_message_record, commodity_summary_message_value) {
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 4 -> commodity_summary_message_record.nanoseconds[commodity_summary_message_at] = commodity_summary_message_value; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_record.financial_product_type = commodity_summary_message_value;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 2 -> commodity_summary_message_record.brand[commodity_summary_message_at] = commodity_summary_message_value; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 3 -> commodity_summary_message_record.series[commodity_summary_message_at] = commodity_summary_message_value; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 18 -> commodity_summary_message_record.instrument_id[commodity_summary_message_at] = commodity_summary_message_value; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 3 -> commodity_summary_message_record.summary_type[commodity_summary_message_at] = commodity_summary_message_value; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 8 -> commodity_summary_message_record.sod_value[commodity_summary_message_at] = commodity_summary_message_value; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 8 -> commodity_summary_message_record.high[commodity_summary_message_at] = commodity_summary_message_value; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 8 -> commodity_summary_message_record.low[commodity_summary_message_at] = commodity_summary_message_value; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 8 -> commodity_summary_message_record.eod_value[commodity_summary_message_at] = commodity_summary_message_value; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 8 -> commodity_summary_message_record.net_change[commodity_summary_message_at] = commodity_summary_message_value; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 4 -> commodity_summary_message_record.effective_date[commodity_summary_message_at] = commodity_summary_message_value; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 3 -> commodity_summary_message_record.currency[commodity_summary_message_at] = commodity_summary_message_value; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Commodity Summary Message set to where it lies, so a field read out of place says so */
inline ramp_commodity_summary_message(commodity_summary_message_record, commodity_summary_message_base) {
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 4 -> commodity_summary_message_record.nanoseconds[commodity_summary_message_at] = (commodity_summary_message_base + 0 + commodity_summary_message_at + 1) % 256; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_record.financial_product_type = (commodity_summary_message_base + 4 + 1) % 256;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 2 -> commodity_summary_message_record.brand[commodity_summary_message_at] = (commodity_summary_message_base + 5 + commodity_summary_message_at + 1) % 256; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 3 -> commodity_summary_message_record.series[commodity_summary_message_at] = (commodity_summary_message_base + 7 + commodity_summary_message_at + 1) % 256; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 18 -> commodity_summary_message_record.instrument_id[commodity_summary_message_at] = (commodity_summary_message_base + 10 + commodity_summary_message_at + 1) % 256; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 3 -> commodity_summary_message_record.summary_type[commodity_summary_message_at] = (commodity_summary_message_base + 28 + commodity_summary_message_at + 1) % 256; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 8 -> commodity_summary_message_record.sod_value[commodity_summary_message_at] = (commodity_summary_message_base + 31 + commodity_summary_message_at + 1) % 256; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 8 -> commodity_summary_message_record.high[commodity_summary_message_at] = (commodity_summary_message_base + 39 + commodity_summary_message_at + 1) % 256; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 8 -> commodity_summary_message_record.low[commodity_summary_message_at] = (commodity_summary_message_base + 47 + commodity_summary_message_at + 1) % 256; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 8 -> commodity_summary_message_record.eod_value[commodity_summary_message_at] = (commodity_summary_message_base + 55 + commodity_summary_message_at + 1) % 256; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 8 -> commodity_summary_message_record.net_change[commodity_summary_message_at] = (commodity_summary_message_base + 63 + commodity_summary_message_at + 1) % 256; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 4 -> commodity_summary_message_record.effective_date[commodity_summary_message_at] = (commodity_summary_message_base + 71 + commodity_summary_message_at + 1) % 256; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 3 -> commodity_summary_message_record.currency[commodity_summary_message_at] = (commodity_summary_message_base + 75 + commodity_summary_message_at + 1) % 256; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Commodity Summary Message to the wire, 78 bytes from where the cursor stands */
inline encode_commodity_summary_message(commodity_summary_message_record) {
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 4 -> wire[at] = commodity_summary_message_record.nanoseconds[commodity_summary_message_at]; at = at + 1; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = commodity_summary_message_record.financial_product_type; at = at + 1;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 2 -> wire[at] = commodity_summary_message_record.brand[commodity_summary_message_at]; at = at + 1; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 3 -> wire[at] = commodity_summary_message_record.series[commodity_summary_message_at]; at = at + 1; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 18 -> wire[at] = commodity_summary_message_record.instrument_id[commodity_summary_message_at]; at = at + 1; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 3 -> wire[at] = commodity_summary_message_record.summary_type[commodity_summary_message_at]; at = at + 1; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 8 -> wire[at] = commodity_summary_message_record.sod_value[commodity_summary_message_at]; at = at + 1; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 8 -> wire[at] = commodity_summary_message_record.high[commodity_summary_message_at]; at = at + 1; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 8 -> wire[at] = commodity_summary_message_record.low[commodity_summary_message_at]; at = at + 1; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 8 -> wire[at] = commodity_summary_message_record.eod_value[commodity_summary_message_at]; at = at + 1; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 8 -> wire[at] = commodity_summary_message_record.net_change[commodity_summary_message_at]; at = at + 1; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 4 -> wire[at] = commodity_summary_message_record.effective_date[commodity_summary_message_at]; at = at + 1; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 3 -> wire[at] = commodity_summary_message_record.currency[commodity_summary_message_at]; at = at + 1; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Commodity Summary Message off the wire, 78 bytes from where the cursor stands */
inline decode_commodity_summary_message(commodity_summary_message_record) {
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 4 -> commodity_summary_message_record.nanoseconds[commodity_summary_message_at] = wire[at]; at = at + 1; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_record.financial_product_type = wire[at]; at = at + 1;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 2 -> commodity_summary_message_record.brand[commodity_summary_message_at] = wire[at]; at = at + 1; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 3 -> commodity_summary_message_record.series[commodity_summary_message_at] = wire[at]; at = at + 1; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 18 -> commodity_summary_message_record.instrument_id[commodity_summary_message_at] = wire[at]; at = at + 1; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 3 -> commodity_summary_message_record.summary_type[commodity_summary_message_at] = wire[at]; at = at + 1; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 8 -> commodity_summary_message_record.sod_value[commodity_summary_message_at] = wire[at]; at = at + 1; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 8 -> commodity_summary_message_record.high[commodity_summary_message_at] = wire[at]; at = at + 1; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 8 -> commodity_summary_message_record.low[commodity_summary_message_at] = wire[at]; at = at + 1; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 8 -> commodity_summary_message_record.eod_value[commodity_summary_message_at] = wire[at]; at = at + 1; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 8 -> commodity_summary_message_record.net_change[commodity_summary_message_at] = wire[at]; at = at + 1; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 4 -> commodity_summary_message_record.effective_date[commodity_summary_message_at] = wire[at]; at = at + 1; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 3 -> commodity_summary_message_record.currency[commodity_summary_message_at] = wire[at]; at = at + 1; commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Commodity Summary Message is what was written, byte for byte */
inline equal_commodity_summary_message(commodity_summary_message_read, commodity_summary_message_written) {
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 4 -> assert(commodity_summary_message_read.nanoseconds[commodity_summary_message_at] == commodity_summary_message_written.nanoseconds[commodity_summary_message_at]); commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  assert(commodity_summary_message_read.financial_product_type == commodity_summary_message_written.financial_product_type);
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 2 -> assert(commodity_summary_message_read.brand[commodity_summary_message_at] == commodity_summary_message_written.brand[commodity_summary_message_at]); commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 3 -> assert(commodity_summary_message_read.series[commodity_summary_message_at] == commodity_summary_message_written.series[commodity_summary_message_at]); commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 18 -> assert(commodity_summary_message_read.instrument_id[commodity_summary_message_at] == commodity_summary_message_written.instrument_id[commodity_summary_message_at]); commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 3 -> assert(commodity_summary_message_read.summary_type[commodity_summary_message_at] == commodity_summary_message_written.summary_type[commodity_summary_message_at]); commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 8 -> assert(commodity_summary_message_read.sod_value[commodity_summary_message_at] == commodity_summary_message_written.sod_value[commodity_summary_message_at]); commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 8 -> assert(commodity_summary_message_read.high[commodity_summary_message_at] == commodity_summary_message_written.high[commodity_summary_message_at]); commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 8 -> assert(commodity_summary_message_read.low[commodity_summary_message_at] == commodity_summary_message_written.low[commodity_summary_message_at]); commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 8 -> assert(commodity_summary_message_read.eod_value[commodity_summary_message_at] == commodity_summary_message_written.eod_value[commodity_summary_message_at]); commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 8 -> assert(commodity_summary_message_read.net_change[commodity_summary_message_at] == commodity_summary_message_written.net_change[commodity_summary_message_at]); commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 4 -> assert(commodity_summary_message_read.effective_date[commodity_summary_message_at] == commodity_summary_message_written.effective_date[commodity_summary_message_at]); commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  commodity_summary_message_at = 0;
  do
  :: commodity_summary_message_at < 3 -> assert(commodity_summary_message_read.currency[commodity_summary_message_at] == commodity_summary_message_written.currency[commodity_summary_message_at]); commodity_summary_message_at = commodity_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Etp Intra Day Valuation Message: 34 bytes ------------------------------- */

/* Disseminates the Intraday Portfolio Value (IPV) of an ETF or the Intra-Day Indicative Value (IIV) of an ETMF. */
typedef EtpIntraDayValuationMessage {
  byte nanoseconds[4];
  byte financial_product_type;
  byte ipv_symbol[18];
  byte ipv_value[8];
  byte currency[3]
};

int etp_intra_day_valuation_message_at;

/* every byte of Etp Intra Day Valuation Message set to one value */
inline fill_etp_intra_day_valuation_message(etp_intra_day_valuation_message_record, etp_intra_day_valuation_message_value) {
  etp_intra_day_valuation_message_at = 0;
  do
  :: etp_intra_day_valuation_message_at < 4 -> etp_intra_day_valuation_message_record.nanoseconds[etp_intra_day_valuation_message_at] = etp_intra_day_valuation_message_value; etp_intra_day_valuation_message_at = etp_intra_day_valuation_message_at + 1
  :: else -> break
  od;
  etp_intra_day_valuation_message_record.financial_product_type = etp_intra_day_valuation_message_value;
  etp_intra_day_valuation_message_at = 0;
  do
  :: etp_intra_day_valuation_message_at < 18 -> etp_intra_day_valuation_message_record.ipv_symbol[etp_intra_day_valuation_message_at] = etp_intra_day_valuation_message_value; etp_intra_day_valuation_message_at = etp_intra_day_valuation_message_at + 1
  :: else -> break
  od;
  etp_intra_day_valuation_message_at = 0;
  do
  :: etp_intra_day_valuation_message_at < 8 -> etp_intra_day_valuation_message_record.ipv_value[etp_intra_day_valuation_message_at] = etp_intra_day_valuation_message_value; etp_intra_day_valuation_message_at = etp_intra_day_valuation_message_at + 1
  :: else -> break
  od;
  etp_intra_day_valuation_message_at = 0;
  do
  :: etp_intra_day_valuation_message_at < 3 -> etp_intra_day_valuation_message_record.currency[etp_intra_day_valuation_message_at] = etp_intra_day_valuation_message_value; etp_intra_day_valuation_message_at = etp_intra_day_valuation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Etp Intra Day Valuation Message set to where it lies, so a field read out of place says so */
inline ramp_etp_intra_day_valuation_message(etp_intra_day_valuation_message_record, etp_intra_day_valuation_message_base) {
  etp_intra_day_valuation_message_at = 0;
  do
  :: etp_intra_day_valuation_message_at < 4 -> etp_intra_day_valuation_message_record.nanoseconds[etp_intra_day_valuation_message_at] = (etp_intra_day_valuation_message_base + 0 + etp_intra_day_valuation_message_at + 1) % 256; etp_intra_day_valuation_message_at = etp_intra_day_valuation_message_at + 1
  :: else -> break
  od;
  etp_intra_day_valuation_message_record.financial_product_type = (etp_intra_day_valuation_message_base + 4 + 1) % 256;
  etp_intra_day_valuation_message_at = 0;
  do
  :: etp_intra_day_valuation_message_at < 18 -> etp_intra_day_valuation_message_record.ipv_symbol[etp_intra_day_valuation_message_at] = (etp_intra_day_valuation_message_base + 5 + etp_intra_day_valuation_message_at + 1) % 256; etp_intra_day_valuation_message_at = etp_intra_day_valuation_message_at + 1
  :: else -> break
  od;
  etp_intra_day_valuation_message_at = 0;
  do
  :: etp_intra_day_valuation_message_at < 8 -> etp_intra_day_valuation_message_record.ipv_value[etp_intra_day_valuation_message_at] = (etp_intra_day_valuation_message_base + 23 + etp_intra_day_valuation_message_at + 1) % 256; etp_intra_day_valuation_message_at = etp_intra_day_valuation_message_at + 1
  :: else -> break
  od;
  etp_intra_day_valuation_message_at = 0;
  do
  :: etp_intra_day_valuation_message_at < 3 -> etp_intra_day_valuation_message_record.currency[etp_intra_day_valuation_message_at] = (etp_intra_day_valuation_message_base + 31 + etp_intra_day_valuation_message_at + 1) % 256; etp_intra_day_valuation_message_at = etp_intra_day_valuation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Etp Intra Day Valuation Message to the wire, 34 bytes from where the cursor stands */
inline encode_etp_intra_day_valuation_message(etp_intra_day_valuation_message_record) {
  etp_intra_day_valuation_message_at = 0;
  do
  :: etp_intra_day_valuation_message_at < 4 -> wire[at] = etp_intra_day_valuation_message_record.nanoseconds[etp_intra_day_valuation_message_at]; at = at + 1; etp_intra_day_valuation_message_at = etp_intra_day_valuation_message_at + 1
  :: else -> break
  od;
  wire[at] = etp_intra_day_valuation_message_record.financial_product_type; at = at + 1;
  etp_intra_day_valuation_message_at = 0;
  do
  :: etp_intra_day_valuation_message_at < 18 -> wire[at] = etp_intra_day_valuation_message_record.ipv_symbol[etp_intra_day_valuation_message_at]; at = at + 1; etp_intra_day_valuation_message_at = etp_intra_day_valuation_message_at + 1
  :: else -> break
  od;
  etp_intra_day_valuation_message_at = 0;
  do
  :: etp_intra_day_valuation_message_at < 8 -> wire[at] = etp_intra_day_valuation_message_record.ipv_value[etp_intra_day_valuation_message_at]; at = at + 1; etp_intra_day_valuation_message_at = etp_intra_day_valuation_message_at + 1
  :: else -> break
  od;
  etp_intra_day_valuation_message_at = 0;
  do
  :: etp_intra_day_valuation_message_at < 3 -> wire[at] = etp_intra_day_valuation_message_record.currency[etp_intra_day_valuation_message_at]; at = at + 1; etp_intra_day_valuation_message_at = etp_intra_day_valuation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Etp Intra Day Valuation Message off the wire, 34 bytes from where the cursor stands */
inline decode_etp_intra_day_valuation_message(etp_intra_day_valuation_message_record) {
  etp_intra_day_valuation_message_at = 0;
  do
  :: etp_intra_day_valuation_message_at < 4 -> etp_intra_day_valuation_message_record.nanoseconds[etp_intra_day_valuation_message_at] = wire[at]; at = at + 1; etp_intra_day_valuation_message_at = etp_intra_day_valuation_message_at + 1
  :: else -> break
  od;
  etp_intra_day_valuation_message_record.financial_product_type = wire[at]; at = at + 1;
  etp_intra_day_valuation_message_at = 0;
  do
  :: etp_intra_day_valuation_message_at < 18 -> etp_intra_day_valuation_message_record.ipv_symbol[etp_intra_day_valuation_message_at] = wire[at]; at = at + 1; etp_intra_day_valuation_message_at = etp_intra_day_valuation_message_at + 1
  :: else -> break
  od;
  etp_intra_day_valuation_message_at = 0;
  do
  :: etp_intra_day_valuation_message_at < 8 -> etp_intra_day_valuation_message_record.ipv_value[etp_intra_day_valuation_message_at] = wire[at]; at = at + 1; etp_intra_day_valuation_message_at = etp_intra_day_valuation_message_at + 1
  :: else -> break
  od;
  etp_intra_day_valuation_message_at = 0;
  do
  :: etp_intra_day_valuation_message_at < 3 -> etp_intra_day_valuation_message_record.currency[etp_intra_day_valuation_message_at] = wire[at]; at = at + 1; etp_intra_day_valuation_message_at = etp_intra_day_valuation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Etp Intra Day Valuation Message is what was written, byte for byte */
inline equal_etp_intra_day_valuation_message(etp_intra_day_valuation_message_read, etp_intra_day_valuation_message_written) {
  etp_intra_day_valuation_message_at = 0;
  do
  :: etp_intra_day_valuation_message_at < 4 -> assert(etp_intra_day_valuation_message_read.nanoseconds[etp_intra_day_valuation_message_at] == etp_intra_day_valuation_message_written.nanoseconds[etp_intra_day_valuation_message_at]); etp_intra_day_valuation_message_at = etp_intra_day_valuation_message_at + 1
  :: else -> break
  od;
  assert(etp_intra_day_valuation_message_read.financial_product_type == etp_intra_day_valuation_message_written.financial_product_type);
  etp_intra_day_valuation_message_at = 0;
  do
  :: etp_intra_day_valuation_message_at < 18 -> assert(etp_intra_day_valuation_message_read.ipv_symbol[etp_intra_day_valuation_message_at] == etp_intra_day_valuation_message_written.ipv_symbol[etp_intra_day_valuation_message_at]); etp_intra_day_valuation_message_at = etp_intra_day_valuation_message_at + 1
  :: else -> break
  od;
  etp_intra_day_valuation_message_at = 0;
  do
  :: etp_intra_day_valuation_message_at < 8 -> assert(etp_intra_day_valuation_message_read.ipv_value[etp_intra_day_valuation_message_at] == etp_intra_day_valuation_message_written.ipv_value[etp_intra_day_valuation_message_at]); etp_intra_day_valuation_message_at = etp_intra_day_valuation_message_at + 1
  :: else -> break
  od;
  etp_intra_day_valuation_message_at = 0;
  do
  :: etp_intra_day_valuation_message_at < 3 -> assert(etp_intra_day_valuation_message_read.currency[etp_intra_day_valuation_message_at] == etp_intra_day_valuation_message_written.currency[etp_intra_day_valuation_message_at]); etp_intra_day_valuation_message_at = etp_intra_day_valuation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Etp Summary Message: 73 bytes ------------------------------------------- */

/* Relays the summary of the current trading day's IPV activity for an ETF or the IIV activity for an ETMF. */
typedef EtpSummaryMessage {
  byte nanoseconds[4];
  byte financial_product_type;
  byte summary_type[3];
  byte ipv_or_iiv_symbol[18];
  byte sod_value[8];
  byte high[8];
  byte low[8];
  byte eod_value[8];
  byte net_change[8];
  byte effective_date[4];
  byte currency[3]
};

int etp_summary_message_at;

/* every byte of Etp Summary Message set to one value */
inline fill_etp_summary_message(etp_summary_message_record, etp_summary_message_value) {
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 4 -> etp_summary_message_record.nanoseconds[etp_summary_message_at] = etp_summary_message_value; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_record.financial_product_type = etp_summary_message_value;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 3 -> etp_summary_message_record.summary_type[etp_summary_message_at] = etp_summary_message_value; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 18 -> etp_summary_message_record.ipv_or_iiv_symbol[etp_summary_message_at] = etp_summary_message_value; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 8 -> etp_summary_message_record.sod_value[etp_summary_message_at] = etp_summary_message_value; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 8 -> etp_summary_message_record.high[etp_summary_message_at] = etp_summary_message_value; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 8 -> etp_summary_message_record.low[etp_summary_message_at] = etp_summary_message_value; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 8 -> etp_summary_message_record.eod_value[etp_summary_message_at] = etp_summary_message_value; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 8 -> etp_summary_message_record.net_change[etp_summary_message_at] = etp_summary_message_value; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 4 -> etp_summary_message_record.effective_date[etp_summary_message_at] = etp_summary_message_value; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 3 -> etp_summary_message_record.currency[etp_summary_message_at] = etp_summary_message_value; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Etp Summary Message set to where it lies, so a field read out of place says so */
inline ramp_etp_summary_message(etp_summary_message_record, etp_summary_message_base) {
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 4 -> etp_summary_message_record.nanoseconds[etp_summary_message_at] = (etp_summary_message_base + 0 + etp_summary_message_at + 1) % 256; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_record.financial_product_type = (etp_summary_message_base + 4 + 1) % 256;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 3 -> etp_summary_message_record.summary_type[etp_summary_message_at] = (etp_summary_message_base + 5 + etp_summary_message_at + 1) % 256; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 18 -> etp_summary_message_record.ipv_or_iiv_symbol[etp_summary_message_at] = (etp_summary_message_base + 8 + etp_summary_message_at + 1) % 256; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 8 -> etp_summary_message_record.sod_value[etp_summary_message_at] = (etp_summary_message_base + 26 + etp_summary_message_at + 1) % 256; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 8 -> etp_summary_message_record.high[etp_summary_message_at] = (etp_summary_message_base + 34 + etp_summary_message_at + 1) % 256; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 8 -> etp_summary_message_record.low[etp_summary_message_at] = (etp_summary_message_base + 42 + etp_summary_message_at + 1) % 256; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 8 -> etp_summary_message_record.eod_value[etp_summary_message_at] = (etp_summary_message_base + 50 + etp_summary_message_at + 1) % 256; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 8 -> etp_summary_message_record.net_change[etp_summary_message_at] = (etp_summary_message_base + 58 + etp_summary_message_at + 1) % 256; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 4 -> etp_summary_message_record.effective_date[etp_summary_message_at] = (etp_summary_message_base + 66 + etp_summary_message_at + 1) % 256; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 3 -> etp_summary_message_record.currency[etp_summary_message_at] = (etp_summary_message_base + 70 + etp_summary_message_at + 1) % 256; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Etp Summary Message to the wire, 73 bytes from where the cursor stands */
inline encode_etp_summary_message(etp_summary_message_record) {
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 4 -> wire[at] = etp_summary_message_record.nanoseconds[etp_summary_message_at]; at = at + 1; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = etp_summary_message_record.financial_product_type; at = at + 1;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 3 -> wire[at] = etp_summary_message_record.summary_type[etp_summary_message_at]; at = at + 1; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 18 -> wire[at] = etp_summary_message_record.ipv_or_iiv_symbol[etp_summary_message_at]; at = at + 1; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 8 -> wire[at] = etp_summary_message_record.sod_value[etp_summary_message_at]; at = at + 1; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 8 -> wire[at] = etp_summary_message_record.high[etp_summary_message_at]; at = at + 1; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 8 -> wire[at] = etp_summary_message_record.low[etp_summary_message_at]; at = at + 1; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 8 -> wire[at] = etp_summary_message_record.eod_value[etp_summary_message_at]; at = at + 1; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 8 -> wire[at] = etp_summary_message_record.net_change[etp_summary_message_at]; at = at + 1; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 4 -> wire[at] = etp_summary_message_record.effective_date[etp_summary_message_at]; at = at + 1; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 3 -> wire[at] = etp_summary_message_record.currency[etp_summary_message_at]; at = at + 1; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Etp Summary Message off the wire, 73 bytes from where the cursor stands */
inline decode_etp_summary_message(etp_summary_message_record) {
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 4 -> etp_summary_message_record.nanoseconds[etp_summary_message_at] = wire[at]; at = at + 1; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_record.financial_product_type = wire[at]; at = at + 1;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 3 -> etp_summary_message_record.summary_type[etp_summary_message_at] = wire[at]; at = at + 1; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 18 -> etp_summary_message_record.ipv_or_iiv_symbol[etp_summary_message_at] = wire[at]; at = at + 1; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 8 -> etp_summary_message_record.sod_value[etp_summary_message_at] = wire[at]; at = at + 1; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 8 -> etp_summary_message_record.high[etp_summary_message_at] = wire[at]; at = at + 1; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 8 -> etp_summary_message_record.low[etp_summary_message_at] = wire[at]; at = at + 1; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 8 -> etp_summary_message_record.eod_value[etp_summary_message_at] = wire[at]; at = at + 1; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 8 -> etp_summary_message_record.net_change[etp_summary_message_at] = wire[at]; at = at + 1; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 4 -> etp_summary_message_record.effective_date[etp_summary_message_at] = wire[at]; at = at + 1; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 3 -> etp_summary_message_record.currency[etp_summary_message_at] = wire[at]; at = at + 1; etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Etp Summary Message is what was written, byte for byte */
inline equal_etp_summary_message(etp_summary_message_read, etp_summary_message_written) {
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 4 -> assert(etp_summary_message_read.nanoseconds[etp_summary_message_at] == etp_summary_message_written.nanoseconds[etp_summary_message_at]); etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  assert(etp_summary_message_read.financial_product_type == etp_summary_message_written.financial_product_type);
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 3 -> assert(etp_summary_message_read.summary_type[etp_summary_message_at] == etp_summary_message_written.summary_type[etp_summary_message_at]); etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 18 -> assert(etp_summary_message_read.ipv_or_iiv_symbol[etp_summary_message_at] == etp_summary_message_written.ipv_or_iiv_symbol[etp_summary_message_at]); etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 8 -> assert(etp_summary_message_read.sod_value[etp_summary_message_at] == etp_summary_message_written.sod_value[etp_summary_message_at]); etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 8 -> assert(etp_summary_message_read.high[etp_summary_message_at] == etp_summary_message_written.high[etp_summary_message_at]); etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 8 -> assert(etp_summary_message_read.low[etp_summary_message_at] == etp_summary_message_written.low[etp_summary_message_at]); etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 8 -> assert(etp_summary_message_read.eod_value[etp_summary_message_at] == etp_summary_message_written.eod_value[etp_summary_message_at]); etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 8 -> assert(etp_summary_message_read.net_change[etp_summary_message_at] == etp_summary_message_written.net_change[etp_summary_message_at]); etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 4 -> assert(etp_summary_message_read.effective_date[etp_summary_message_at] == etp_summary_message_written.effective_date[etp_summary_message_at]); etp_summary_message_at = etp_summary_message_at + 1
  :: else -> break
  od;
  etp_summary_message_at = 0;
  do
  :: etp_summary_message_at < 3 -> assert(etp_summary_message_read.currency[etp_summary_message_at] == etp_summary_message_written.currency[etp_summary_message_at]); etp_summary_message_at = etp_summary_message_at + 1
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

/* Timestamp Seconds Message: encoded, read back, and compared */
proctype check_timestamp_seconds_message() {
  TimestampSecondsMessage timestamp_seconds_message_sent;
  TimestampSecondsMessage timestamp_seconds_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_timestamp_seconds_message(timestamp_seconds_message_sent, 0)
  :: pattern == 1 -> fill_timestamp_seconds_message(timestamp_seconds_message_sent, 32)
  :: pattern == 2 -> fill_timestamp_seconds_message(timestamp_seconds_message_sent, 255)
  :: else -> ramp_timestamp_seconds_message(timestamp_seconds_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_timestamp_seconds_message(timestamp_seconds_message_sent);
    assert(at == 4);
    at = 0;
    decode_timestamp_seconds_message(timestamp_seconds_message_got);
    assert(at == 4);
    equal_timestamp_seconds_message(timestamp_seconds_message_got, timestamp_seconds_message_sent)
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
    assert(at == 8);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 8);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Intraday Index Value Message: encoded, read back, and compared */
proctype check_intraday_index_value_message() {
  IntradayIndexValueMessage intraday_index_value_message_sent;
  IntradayIndexValueMessage intraday_index_value_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_intraday_index_value_message(intraday_index_value_message_sent, 0)
  :: pattern == 1 -> fill_intraday_index_value_message(intraday_index_value_message_sent, 32)
  :: pattern == 2 -> fill_intraday_index_value_message(intraday_index_value_message_sent, 255)
  :: else -> ramp_intraday_index_value_message(intraday_index_value_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_intraday_index_value_message(intraday_index_value_message_sent);
    assert(at == 40);
    at = 0;
    decode_intraday_index_value_message(intraday_index_value_message_got);
    assert(at == 40);
    equal_intraday_index_value_message(intraday_index_value_message_got, intraday_index_value_message_sent)
  }
}

/* Settlement Value Message: encoded, read back, and compared */
proctype check_settlement_value_message() {
  SettlementValueMessage settlement_value_message_sent;
  SettlementValueMessage settlement_value_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_settlement_value_message(settlement_value_message_sent, 0)
  :: pattern == 1 -> fill_settlement_value_message(settlement_value_message_sent, 32)
  :: pattern == 2 -> fill_settlement_value_message(settlement_value_message_sent, 255)
  :: else -> ramp_settlement_value_message(settlement_value_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_settlement_value_message(settlement_value_message_sent);
    assert(at == 40);
    at = 0;
    decode_settlement_value_message(settlement_value_message_got);
    assert(at == 40);
    equal_settlement_value_message(settlement_value_message_got, settlement_value_message_sent)
  }
}

/* Equities Summary Message: encoded, read back, and compared */
proctype check_equities_summary_message() {
  EquitiesSummaryMessage equities_summary_message_sent;
  EquitiesSummaryMessage equities_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_equities_summary_message(equities_summary_message_sent, 0)
  :: pattern == 1 -> fill_equities_summary_message(equities_summary_message_sent, 32)
  :: pattern == 2 -> fill_equities_summary_message(equities_summary_message_sent, 255)
  :: else -> ramp_equities_summary_message(equities_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_equities_summary_message(equities_summary_message_sent);
    assert(at == 78);
    at = 0;
    decode_equities_summary_message(equities_summary_message_got);
    assert(at == 78);
    equal_equities_summary_message(equities_summary_message_got, equities_summary_message_sent)
  }
}

/* Fixed Income Summary Message: encoded, read back, and compared */
proctype check_fixed_income_summary_message() {
  FixedIncomeSummaryMessage fixed_income_summary_message_sent;
  FixedIncomeSummaryMessage fixed_income_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fixed_income_summary_message(fixed_income_summary_message_sent, 0)
  :: pattern == 1 -> fill_fixed_income_summary_message(fixed_income_summary_message_sent, 32)
  :: pattern == 2 -> fill_fixed_income_summary_message(fixed_income_summary_message_sent, 255)
  :: else -> ramp_fixed_income_summary_message(fixed_income_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fixed_income_summary_message(fixed_income_summary_message_sent);
    assert(at == 102);
    at = 0;
    decode_fixed_income_summary_message(fixed_income_summary_message_got);
    assert(at == 102);
    equal_fixed_income_summary_message(fixed_income_summary_message_got, fixed_income_summary_message_sent)
  }
}

/* Commodity Summary Message: encoded, read back, and compared */
proctype check_commodity_summary_message() {
  CommoditySummaryMessage commodity_summary_message_sent;
  CommoditySummaryMessage commodity_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_commodity_summary_message(commodity_summary_message_sent, 0)
  :: pattern == 1 -> fill_commodity_summary_message(commodity_summary_message_sent, 32)
  :: pattern == 2 -> fill_commodity_summary_message(commodity_summary_message_sent, 255)
  :: else -> ramp_commodity_summary_message(commodity_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_commodity_summary_message(commodity_summary_message_sent);
    assert(at == 78);
    at = 0;
    decode_commodity_summary_message(commodity_summary_message_got);
    assert(at == 78);
    equal_commodity_summary_message(commodity_summary_message_got, commodity_summary_message_sent)
  }
}

/* Etp Intra Day Valuation Message: encoded, read back, and compared */
proctype check_etp_intra_day_valuation_message() {
  EtpIntraDayValuationMessage etp_intra_day_valuation_message_sent;
  EtpIntraDayValuationMessage etp_intra_day_valuation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_etp_intra_day_valuation_message(etp_intra_day_valuation_message_sent, 0)
  :: pattern == 1 -> fill_etp_intra_day_valuation_message(etp_intra_day_valuation_message_sent, 32)
  :: pattern == 2 -> fill_etp_intra_day_valuation_message(etp_intra_day_valuation_message_sent, 255)
  :: else -> ramp_etp_intra_day_valuation_message(etp_intra_day_valuation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_etp_intra_day_valuation_message(etp_intra_day_valuation_message_sent);
    assert(at == 34);
    at = 0;
    decode_etp_intra_day_valuation_message(etp_intra_day_valuation_message_got);
    assert(at == 34);
    equal_etp_intra_day_valuation_message(etp_intra_day_valuation_message_got, etp_intra_day_valuation_message_sent)
  }
}

/* Etp Summary Message: encoded, read back, and compared */
proctype check_etp_summary_message() {
  EtpSummaryMessage etp_summary_message_sent;
  EtpSummaryMessage etp_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_etp_summary_message(etp_summary_message_sent, 0)
  :: pattern == 1 -> fill_etp_summary_message(etp_summary_message_sent, 32)
  :: pattern == 2 -> fill_etp_summary_message(etp_summary_message_sent, 255)
  :: else -> ramp_etp_summary_message(etp_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_etp_summary_message(etp_summary_message_sent);
    assert(at == 73);
    at = 0;
    decode_etp_summary_message(etp_summary_message_got);
    assert(at == 73);
    equal_etp_summary_message(etp_summary_message_got, etp_summary_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_timestamp_seconds_message()
  :: run check_system_event_message()
  :: run check_intraday_index_value_message()
  :: run check_settlement_value_message()
  :: run check_equities_summary_message()
  :: run check_fixed_income_summary_message()
  :: run check_commodity_summary_message()
  :: run check_etp_intra_day_valuation_message()
  :: run check_etp_summary_message()
  fi
}
