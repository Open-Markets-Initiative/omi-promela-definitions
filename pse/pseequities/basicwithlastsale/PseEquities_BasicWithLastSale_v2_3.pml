/*
 * Philippine Stock Exchange Pse Equities Itch Basic With Last Sale
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
#define WIRE 89

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

/* ---- Time Stamp Seconds Message: 4 bytes ------------------------------------- */

/* Time Stamp - Seconds Message. */
typedef TimeStampSecondsMessage {
  byte second[4]
};

int time_stamp_seconds_message_at;

/* every byte of Time Stamp Seconds Message set to one value */
inline fill_time_stamp_seconds_message(time_stamp_seconds_message_record, time_stamp_seconds_message_value) {
  time_stamp_seconds_message_at = 0;
  do
  :: time_stamp_seconds_message_at < 4 -> time_stamp_seconds_message_record.second[time_stamp_seconds_message_at] = time_stamp_seconds_message_value; time_stamp_seconds_message_at = time_stamp_seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Time Stamp Seconds Message set to where it lies, so a field read out of place says so */
inline ramp_time_stamp_seconds_message(time_stamp_seconds_message_record, time_stamp_seconds_message_base) {
  time_stamp_seconds_message_at = 0;
  do
  :: time_stamp_seconds_message_at < 4 -> time_stamp_seconds_message_record.second[time_stamp_seconds_message_at] = (time_stamp_seconds_message_base + 0 + time_stamp_seconds_message_at + 1) % 256; time_stamp_seconds_message_at = time_stamp_seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Stamp Seconds Message to the wire, 4 bytes from where the cursor stands */
inline encode_time_stamp_seconds_message(time_stamp_seconds_message_record) {
  time_stamp_seconds_message_at = 0;
  do
  :: time_stamp_seconds_message_at < 4 -> wire[at] = time_stamp_seconds_message_record.second[time_stamp_seconds_message_at]; at = at + 1; time_stamp_seconds_message_at = time_stamp_seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Stamp Seconds Message off the wire, 4 bytes from where the cursor stands */
inline decode_time_stamp_seconds_message(time_stamp_seconds_message_record) {
  time_stamp_seconds_message_at = 0;
  do
  :: time_stamp_seconds_message_at < 4 -> time_stamp_seconds_message_record.second[time_stamp_seconds_message_at] = wire[at]; at = at + 1; time_stamp_seconds_message_at = time_stamp_seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Time Stamp Seconds Message is what was written, byte for byte */
inline equal_time_stamp_seconds_message(time_stamp_seconds_message_read, time_stamp_seconds_message_written) {
  time_stamp_seconds_message_at = 0;
  do
  :: time_stamp_seconds_message_at < 4 -> assert(time_stamp_seconds_message_read.second[time_stamp_seconds_message_at] == time_stamp_seconds_message_written.second[time_stamp_seconds_message_at]); time_stamp_seconds_message_at = time_stamp_seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System Event Message: 17 bytes ------------------------------------------ */

/* System Event Message. */
typedef SystemEventMessage {
  byte timestamp[4];
  byte group[8];
  byte event_code;
  byte orderbook[4]
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.timestamp[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.group[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = system_event_message_value;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.orderbook[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.timestamp[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.group[system_event_message_at] = (system_event_message_base + 4 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 12 + 1) % 256;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.orderbook[system_event_message_at] = (system_event_message_base + 13 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Event Message to the wire, 17 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> wire[at] = system_event_message_record.timestamp[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> wire[at] = system_event_message_record.group[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> wire[at] = system_event_message_record.orderbook[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Event Message off the wire, 17 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.timestamp[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.group[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = wire[at]; at = at + 1;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.orderbook[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> assert(system_event_message_read.timestamp[system_event_message_at] == system_event_message_written.timestamp[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> assert(system_event_message_read.group[system_event_message_at] == system_event_message_written.group[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> assert(system_event_message_read.orderbook[system_event_message_at] == system_event_message_written.orderbook[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Schedule Message: 21 bytes -------------------------------------- */

/* Trading Schedule Message. */
typedef TradingScheduleMessage {
  byte timestamp[4];
  byte group[8];
  byte event_code;
  byte orderbook[4];
  byte scheduled_time[4]
};

int trading_schedule_message_at;

/* every byte of Trading Schedule Message set to one value */
inline fill_trading_schedule_message(trading_schedule_message_record, trading_schedule_message_value) {
  trading_schedule_message_at = 0;
  do
  :: trading_schedule_message_at < 4 -> trading_schedule_message_record.timestamp[trading_schedule_message_at] = trading_schedule_message_value; trading_schedule_message_at = trading_schedule_message_at + 1
  :: else -> break
  od;
  trading_schedule_message_at = 0;
  do
  :: trading_schedule_message_at < 8 -> trading_schedule_message_record.group[trading_schedule_message_at] = trading_schedule_message_value; trading_schedule_message_at = trading_schedule_message_at + 1
  :: else -> break
  od;
  trading_schedule_message_record.event_code = trading_schedule_message_value;
  trading_schedule_message_at = 0;
  do
  :: trading_schedule_message_at < 4 -> trading_schedule_message_record.orderbook[trading_schedule_message_at] = trading_schedule_message_value; trading_schedule_message_at = trading_schedule_message_at + 1
  :: else -> break
  od;
  trading_schedule_message_at = 0;
  do
  :: trading_schedule_message_at < 4 -> trading_schedule_message_record.scheduled_time[trading_schedule_message_at] = trading_schedule_message_value; trading_schedule_message_at = trading_schedule_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Schedule Message set to where it lies, so a field read out of place says so */
inline ramp_trading_schedule_message(trading_schedule_message_record, trading_schedule_message_base) {
  trading_schedule_message_at = 0;
  do
  :: trading_schedule_message_at < 4 -> trading_schedule_message_record.timestamp[trading_schedule_message_at] = (trading_schedule_message_base + 0 + trading_schedule_message_at + 1) % 256; trading_schedule_message_at = trading_schedule_message_at + 1
  :: else -> break
  od;
  trading_schedule_message_at = 0;
  do
  :: trading_schedule_message_at < 8 -> trading_schedule_message_record.group[trading_schedule_message_at] = (trading_schedule_message_base + 4 + trading_schedule_message_at + 1) % 256; trading_schedule_message_at = trading_schedule_message_at + 1
  :: else -> break
  od;
  trading_schedule_message_record.event_code = (trading_schedule_message_base + 12 + 1) % 256;
  trading_schedule_message_at = 0;
  do
  :: trading_schedule_message_at < 4 -> trading_schedule_message_record.orderbook[trading_schedule_message_at] = (trading_schedule_message_base + 13 + trading_schedule_message_at + 1) % 256; trading_schedule_message_at = trading_schedule_message_at + 1
  :: else -> break
  od;
  trading_schedule_message_at = 0;
  do
  :: trading_schedule_message_at < 4 -> trading_schedule_message_record.scheduled_time[trading_schedule_message_at] = (trading_schedule_message_base + 17 + trading_schedule_message_at + 1) % 256; trading_schedule_message_at = trading_schedule_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Schedule Message to the wire, 21 bytes from where the cursor stands */
inline encode_trading_schedule_message(trading_schedule_message_record) {
  trading_schedule_message_at = 0;
  do
  :: trading_schedule_message_at < 4 -> wire[at] = trading_schedule_message_record.timestamp[trading_schedule_message_at]; at = at + 1; trading_schedule_message_at = trading_schedule_message_at + 1
  :: else -> break
  od;
  trading_schedule_message_at = 0;
  do
  :: trading_schedule_message_at < 8 -> wire[at] = trading_schedule_message_record.group[trading_schedule_message_at]; at = at + 1; trading_schedule_message_at = trading_schedule_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_schedule_message_record.event_code; at = at + 1;
  trading_schedule_message_at = 0;
  do
  :: trading_schedule_message_at < 4 -> wire[at] = trading_schedule_message_record.orderbook[trading_schedule_message_at]; at = at + 1; trading_schedule_message_at = trading_schedule_message_at + 1
  :: else -> break
  od;
  trading_schedule_message_at = 0;
  do
  :: trading_schedule_message_at < 4 -> wire[at] = trading_schedule_message_record.scheduled_time[trading_schedule_message_at]; at = at + 1; trading_schedule_message_at = trading_schedule_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Schedule Message off the wire, 21 bytes from where the cursor stands */
inline decode_trading_schedule_message(trading_schedule_message_record) {
  trading_schedule_message_at = 0;
  do
  :: trading_schedule_message_at < 4 -> trading_schedule_message_record.timestamp[trading_schedule_message_at] = wire[at]; at = at + 1; trading_schedule_message_at = trading_schedule_message_at + 1
  :: else -> break
  od;
  trading_schedule_message_at = 0;
  do
  :: trading_schedule_message_at < 8 -> trading_schedule_message_record.group[trading_schedule_message_at] = wire[at]; at = at + 1; trading_schedule_message_at = trading_schedule_message_at + 1
  :: else -> break
  od;
  trading_schedule_message_record.event_code = wire[at]; at = at + 1;
  trading_schedule_message_at = 0;
  do
  :: trading_schedule_message_at < 4 -> trading_schedule_message_record.orderbook[trading_schedule_message_at] = wire[at]; at = at + 1; trading_schedule_message_at = trading_schedule_message_at + 1
  :: else -> break
  od;
  trading_schedule_message_at = 0;
  do
  :: trading_schedule_message_at < 4 -> trading_schedule_message_record.scheduled_time[trading_schedule_message_at] = wire[at]; at = at + 1; trading_schedule_message_at = trading_schedule_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Schedule Message is what was written, byte for byte */
inline equal_trading_schedule_message(trading_schedule_message_read, trading_schedule_message_written) {
  trading_schedule_message_at = 0;
  do
  :: trading_schedule_message_at < 4 -> assert(trading_schedule_message_read.timestamp[trading_schedule_message_at] == trading_schedule_message_written.timestamp[trading_schedule_message_at]); trading_schedule_message_at = trading_schedule_message_at + 1
  :: else -> break
  od;
  trading_schedule_message_at = 0;
  do
  :: trading_schedule_message_at < 8 -> assert(trading_schedule_message_read.group[trading_schedule_message_at] == trading_schedule_message_written.group[trading_schedule_message_at]); trading_schedule_message_at = trading_schedule_message_at + 1
  :: else -> break
  od;
  assert(trading_schedule_message_read.event_code == trading_schedule_message_written.event_code);
  trading_schedule_message_at = 0;
  do
  :: trading_schedule_message_at < 4 -> assert(trading_schedule_message_read.orderbook[trading_schedule_message_at] == trading_schedule_message_written.orderbook[trading_schedule_message_at]); trading_schedule_message_at = trading_schedule_message_at + 1
  :: else -> break
  od;
  trading_schedule_message_at = 0;
  do
  :: trading_schedule_message_at < 4 -> assert(trading_schedule_message_read.scheduled_time[trading_schedule_message_at] == trading_schedule_message_written.scheduled_time[trading_schedule_message_at]); trading_schedule_message_at = trading_schedule_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Price Tick Size Message: 16 bytes --------------------------------------- */

/* Tick Size Table. */
typedef PriceTickSizeMessage {
  byte timestamp[4];
  byte tick_size_table_id[4];
  byte tick_size_integer_4[4];
  byte price_start[4]
};

int price_tick_size_message_at;

/* every byte of Price Tick Size Message set to one value */
inline fill_price_tick_size_message(price_tick_size_message_record, price_tick_size_message_value) {
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.timestamp[price_tick_size_message_at] = price_tick_size_message_value; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.tick_size_table_id[price_tick_size_message_at] = price_tick_size_message_value; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.tick_size_integer_4[price_tick_size_message_at] = price_tick_size_message_value; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.price_start[price_tick_size_message_at] = price_tick_size_message_value; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Price Tick Size Message set to where it lies, so a field read out of place says so */
inline ramp_price_tick_size_message(price_tick_size_message_record, price_tick_size_message_base) {
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.timestamp[price_tick_size_message_at] = (price_tick_size_message_base + 0 + price_tick_size_message_at + 1) % 256; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.tick_size_table_id[price_tick_size_message_at] = (price_tick_size_message_base + 4 + price_tick_size_message_at + 1) % 256; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.tick_size_integer_4[price_tick_size_message_at] = (price_tick_size_message_base + 8 + price_tick_size_message_at + 1) % 256; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.price_start[price_tick_size_message_at] = (price_tick_size_message_base + 12 + price_tick_size_message_at + 1) % 256; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Tick Size Message to the wire, 16 bytes from where the cursor stands */
inline encode_price_tick_size_message(price_tick_size_message_record) {
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> wire[at] = price_tick_size_message_record.timestamp[price_tick_size_message_at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> wire[at] = price_tick_size_message_record.tick_size_table_id[price_tick_size_message_at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> wire[at] = price_tick_size_message_record.tick_size_integer_4[price_tick_size_message_at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> wire[at] = price_tick_size_message_record.price_start[price_tick_size_message_at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Tick Size Message off the wire, 16 bytes from where the cursor stands */
inline decode_price_tick_size_message(price_tick_size_message_record) {
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.timestamp[price_tick_size_message_at] = wire[at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.tick_size_table_id[price_tick_size_message_at] = wire[at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.tick_size_integer_4[price_tick_size_message_at] = wire[at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.price_start[price_tick_size_message_at] = wire[at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Price Tick Size Message is what was written, byte for byte */
inline equal_price_tick_size_message(price_tick_size_message_read, price_tick_size_message_written) {
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> assert(price_tick_size_message_read.timestamp[price_tick_size_message_at] == price_tick_size_message_written.timestamp[price_tick_size_message_at]); price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> assert(price_tick_size_message_read.tick_size_table_id[price_tick_size_message_at] == price_tick_size_message_written.tick_size_table_id[price_tick_size_message_at]); price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> assert(price_tick_size_message_read.tick_size_integer_4[price_tick_size_message_at] == price_tick_size_message_written.tick_size_integer_4[price_tick_size_message_at]); price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> assert(price_tick_size_message_read.price_start[price_tick_size_message_at] == price_tick_size_message_written.price_start[price_tick_size_message_at]); price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quantity Tick Size Message: 24 bytes ------------------------------------ */

/* Tick Size Table. */
typedef QuantityTickSizeMessage {
  byte timestamp[4];
  byte tick_size_table_id[4];
  byte tick_size_integer_8[8];
  byte quantity_start[8]
};

int quantity_tick_size_message_at;

/* every byte of Quantity Tick Size Message set to one value */
inline fill_quantity_tick_size_message(quantity_tick_size_message_record, quantity_tick_size_message_value) {
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 4 -> quantity_tick_size_message_record.timestamp[quantity_tick_size_message_at] = quantity_tick_size_message_value; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 4 -> quantity_tick_size_message_record.tick_size_table_id[quantity_tick_size_message_at] = quantity_tick_size_message_value; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 8 -> quantity_tick_size_message_record.tick_size_integer_8[quantity_tick_size_message_at] = quantity_tick_size_message_value; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 8 -> quantity_tick_size_message_record.quantity_start[quantity_tick_size_message_at] = quantity_tick_size_message_value; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quantity Tick Size Message set to where it lies, so a field read out of place says so */
inline ramp_quantity_tick_size_message(quantity_tick_size_message_record, quantity_tick_size_message_base) {
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 4 -> quantity_tick_size_message_record.timestamp[quantity_tick_size_message_at] = (quantity_tick_size_message_base + 0 + quantity_tick_size_message_at + 1) % 256; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 4 -> quantity_tick_size_message_record.tick_size_table_id[quantity_tick_size_message_at] = (quantity_tick_size_message_base + 4 + quantity_tick_size_message_at + 1) % 256; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 8 -> quantity_tick_size_message_record.tick_size_integer_8[quantity_tick_size_message_at] = (quantity_tick_size_message_base + 8 + quantity_tick_size_message_at + 1) % 256; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 8 -> quantity_tick_size_message_record.quantity_start[quantity_tick_size_message_at] = (quantity_tick_size_message_base + 16 + quantity_tick_size_message_at + 1) % 256; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quantity Tick Size Message to the wire, 24 bytes from where the cursor stands */
inline encode_quantity_tick_size_message(quantity_tick_size_message_record) {
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 4 -> wire[at] = quantity_tick_size_message_record.timestamp[quantity_tick_size_message_at]; at = at + 1; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 4 -> wire[at] = quantity_tick_size_message_record.tick_size_table_id[quantity_tick_size_message_at]; at = at + 1; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 8 -> wire[at] = quantity_tick_size_message_record.tick_size_integer_8[quantity_tick_size_message_at]; at = at + 1; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 8 -> wire[at] = quantity_tick_size_message_record.quantity_start[quantity_tick_size_message_at]; at = at + 1; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quantity Tick Size Message off the wire, 24 bytes from where the cursor stands */
inline decode_quantity_tick_size_message(quantity_tick_size_message_record) {
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 4 -> quantity_tick_size_message_record.timestamp[quantity_tick_size_message_at] = wire[at]; at = at + 1; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 4 -> quantity_tick_size_message_record.tick_size_table_id[quantity_tick_size_message_at] = wire[at]; at = at + 1; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 8 -> quantity_tick_size_message_record.tick_size_integer_8[quantity_tick_size_message_at] = wire[at]; at = at + 1; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 8 -> quantity_tick_size_message_record.quantity_start[quantity_tick_size_message_at] = wire[at]; at = at + 1; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quantity Tick Size Message is what was written, byte for byte */
inline equal_quantity_tick_size_message(quantity_tick_size_message_read, quantity_tick_size_message_written) {
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 4 -> assert(quantity_tick_size_message_read.timestamp[quantity_tick_size_message_at] == quantity_tick_size_message_written.timestamp[quantity_tick_size_message_at]); quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 4 -> assert(quantity_tick_size_message_read.tick_size_table_id[quantity_tick_size_message_at] == quantity_tick_size_message_written.tick_size_table_id[quantity_tick_size_message_at]); quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 8 -> assert(quantity_tick_size_message_read.tick_size_integer_8[quantity_tick_size_message_at] == quantity_tick_size_message_written.tick_size_integer_8[quantity_tick_size_message_at]); quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 8 -> assert(quantity_tick_size_message_read.quantity_start[quantity_tick_size_message_at] == quantity_tick_size_message_written.quantity_start[quantity_tick_size_message_at]); quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Orderbook Directory Message: 89 bytes ----------------------------------- */

/* Orderbook Directory Message. */
typedef OrderbookDirectoryMessage {
  byte timestamp[4];
  byte orderbook[4];
  byte price_type;
  byte isin[12];
  byte sec_code[12];
  byte currency[3];
  byte group[8];
  byte lot_size[8];
  byte quantity_tick_size_table_id[4];
  byte price_tick_size_table_id[4];
  byte price_decimals[4];
  byte delisting_date[4];
  byte delisting_time[4];
  byte instrument_type;
  byte shares[8];
  byte product_code[8]
};

int orderbook_directory_message_at;

/* every byte of Orderbook Directory Message set to one value */
inline fill_orderbook_directory_message(orderbook_directory_message_record, orderbook_directory_message_value) {
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.timestamp[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.orderbook[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_record.price_type = orderbook_directory_message_value;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> orderbook_directory_message_record.isin[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> orderbook_directory_message_record.sec_code[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 3 -> orderbook_directory_message_record.currency[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.group[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.lot_size[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.quantity_tick_size_table_id[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.price_tick_size_table_id[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.price_decimals[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.delisting_date[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.delisting_time[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_record.instrument_type = orderbook_directory_message_value;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.shares[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.product_code[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Orderbook Directory Message set to where it lies, so a field read out of place says so */
inline ramp_orderbook_directory_message(orderbook_directory_message_record, orderbook_directory_message_base) {
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.timestamp[orderbook_directory_message_at] = (orderbook_directory_message_base + 0 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.orderbook[orderbook_directory_message_at] = (orderbook_directory_message_base + 4 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_record.price_type = (orderbook_directory_message_base + 8 + 1) % 256;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> orderbook_directory_message_record.isin[orderbook_directory_message_at] = (orderbook_directory_message_base + 9 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> orderbook_directory_message_record.sec_code[orderbook_directory_message_at] = (orderbook_directory_message_base + 21 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 3 -> orderbook_directory_message_record.currency[orderbook_directory_message_at] = (orderbook_directory_message_base + 33 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.group[orderbook_directory_message_at] = (orderbook_directory_message_base + 36 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.lot_size[orderbook_directory_message_at] = (orderbook_directory_message_base + 44 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.quantity_tick_size_table_id[orderbook_directory_message_at] = (orderbook_directory_message_base + 52 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.price_tick_size_table_id[orderbook_directory_message_at] = (orderbook_directory_message_base + 56 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.price_decimals[orderbook_directory_message_at] = (orderbook_directory_message_base + 60 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.delisting_date[orderbook_directory_message_at] = (orderbook_directory_message_base + 64 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.delisting_time[orderbook_directory_message_at] = (orderbook_directory_message_base + 68 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_record.instrument_type = (orderbook_directory_message_base + 72 + 1) % 256;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.shares[orderbook_directory_message_at] = (orderbook_directory_message_base + 73 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.product_code[orderbook_directory_message_at] = (orderbook_directory_message_base + 81 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Orderbook Directory Message to the wire, 89 bytes from where the cursor stands */
inline encode_orderbook_directory_message(orderbook_directory_message_record) {
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.timestamp[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.orderbook[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = orderbook_directory_message_record.price_type; at = at + 1;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> wire[at] = orderbook_directory_message_record.isin[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> wire[at] = orderbook_directory_message_record.sec_code[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 3 -> wire[at] = orderbook_directory_message_record.currency[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> wire[at] = orderbook_directory_message_record.group[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> wire[at] = orderbook_directory_message_record.lot_size[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.quantity_tick_size_table_id[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.price_tick_size_table_id[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.price_decimals[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.delisting_date[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.delisting_time[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = orderbook_directory_message_record.instrument_type; at = at + 1;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> wire[at] = orderbook_directory_message_record.shares[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> wire[at] = orderbook_directory_message_record.product_code[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Orderbook Directory Message off the wire, 89 bytes from where the cursor stands */
inline decode_orderbook_directory_message(orderbook_directory_message_record) {
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.timestamp[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.orderbook[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_record.price_type = wire[at]; at = at + 1;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> orderbook_directory_message_record.isin[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> orderbook_directory_message_record.sec_code[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 3 -> orderbook_directory_message_record.currency[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.group[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.lot_size[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.quantity_tick_size_table_id[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.price_tick_size_table_id[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.price_decimals[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.delisting_date[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.delisting_time[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_record.instrument_type = wire[at]; at = at + 1;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.shares[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.product_code[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Orderbook Directory Message is what was written, byte for byte */
inline equal_orderbook_directory_message(orderbook_directory_message_read, orderbook_directory_message_written) {
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.timestamp[orderbook_directory_message_at] == orderbook_directory_message_written.timestamp[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.orderbook[orderbook_directory_message_at] == orderbook_directory_message_written.orderbook[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  assert(orderbook_directory_message_read.price_type == orderbook_directory_message_written.price_type);
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> assert(orderbook_directory_message_read.isin[orderbook_directory_message_at] == orderbook_directory_message_written.isin[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> assert(orderbook_directory_message_read.sec_code[orderbook_directory_message_at] == orderbook_directory_message_written.sec_code[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 3 -> assert(orderbook_directory_message_read.currency[orderbook_directory_message_at] == orderbook_directory_message_written.currency[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> assert(orderbook_directory_message_read.group[orderbook_directory_message_at] == orderbook_directory_message_written.group[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> assert(orderbook_directory_message_read.lot_size[orderbook_directory_message_at] == orderbook_directory_message_written.lot_size[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.quantity_tick_size_table_id[orderbook_directory_message_at] == orderbook_directory_message_written.quantity_tick_size_table_id[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.price_tick_size_table_id[orderbook_directory_message_at] == orderbook_directory_message_written.price_tick_size_table_id[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.price_decimals[orderbook_directory_message_at] == orderbook_directory_message_written.price_decimals[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.delisting_date[orderbook_directory_message_at] == orderbook_directory_message_written.delisting_date[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.delisting_time[orderbook_directory_message_at] == orderbook_directory_message_written.delisting_time[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  assert(orderbook_directory_message_read.instrument_type == orderbook_directory_message_written.instrument_type);
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> assert(orderbook_directory_message_read.shares[orderbook_directory_message_at] == orderbook_directory_message_written.shares[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> assert(orderbook_directory_message_read.product_code[orderbook_directory_message_at] == orderbook_directory_message_written.product_code[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Orderbook Restrictions Message: 29 bytes -------------------------------- */

/* Orderbook Restrictions Message. */
typedef OrderbookRestrictionsMessage {
  byte timestamp[4];
  byte orderbook[4];
  byte short_sell_eligible;
  byte high_collar[4];
  byte low_collar[4];
  byte cb_limit_up[4];
  byte cb_limit_down[4];
  byte cb_limit_decimals[4]
};

int orderbook_restrictions_message_at;

/* every byte of Orderbook Restrictions Message set to one value */
inline fill_orderbook_restrictions_message(orderbook_restrictions_message_record, orderbook_restrictions_message_value) {
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> orderbook_restrictions_message_record.timestamp[orderbook_restrictions_message_at] = orderbook_restrictions_message_value; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> orderbook_restrictions_message_record.orderbook[orderbook_restrictions_message_at] = orderbook_restrictions_message_value; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_record.short_sell_eligible = orderbook_restrictions_message_value;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> orderbook_restrictions_message_record.high_collar[orderbook_restrictions_message_at] = orderbook_restrictions_message_value; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> orderbook_restrictions_message_record.low_collar[orderbook_restrictions_message_at] = orderbook_restrictions_message_value; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> orderbook_restrictions_message_record.cb_limit_up[orderbook_restrictions_message_at] = orderbook_restrictions_message_value; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> orderbook_restrictions_message_record.cb_limit_down[orderbook_restrictions_message_at] = orderbook_restrictions_message_value; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> orderbook_restrictions_message_record.cb_limit_decimals[orderbook_restrictions_message_at] = orderbook_restrictions_message_value; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Orderbook Restrictions Message set to where it lies, so a field read out of place says so */
inline ramp_orderbook_restrictions_message(orderbook_restrictions_message_record, orderbook_restrictions_message_base) {
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> orderbook_restrictions_message_record.timestamp[orderbook_restrictions_message_at] = (orderbook_restrictions_message_base + 0 + orderbook_restrictions_message_at + 1) % 256; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> orderbook_restrictions_message_record.orderbook[orderbook_restrictions_message_at] = (orderbook_restrictions_message_base + 4 + orderbook_restrictions_message_at + 1) % 256; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_record.short_sell_eligible = (orderbook_restrictions_message_base + 8 + 1) % 256;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> orderbook_restrictions_message_record.high_collar[orderbook_restrictions_message_at] = (orderbook_restrictions_message_base + 9 + orderbook_restrictions_message_at + 1) % 256; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> orderbook_restrictions_message_record.low_collar[orderbook_restrictions_message_at] = (orderbook_restrictions_message_base + 13 + orderbook_restrictions_message_at + 1) % 256; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> orderbook_restrictions_message_record.cb_limit_up[orderbook_restrictions_message_at] = (orderbook_restrictions_message_base + 17 + orderbook_restrictions_message_at + 1) % 256; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> orderbook_restrictions_message_record.cb_limit_down[orderbook_restrictions_message_at] = (orderbook_restrictions_message_base + 21 + orderbook_restrictions_message_at + 1) % 256; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> orderbook_restrictions_message_record.cb_limit_decimals[orderbook_restrictions_message_at] = (orderbook_restrictions_message_base + 25 + orderbook_restrictions_message_at + 1) % 256; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  skip
}

/* Orderbook Restrictions Message to the wire, 29 bytes from where the cursor stands */
inline encode_orderbook_restrictions_message(orderbook_restrictions_message_record) {
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> wire[at] = orderbook_restrictions_message_record.timestamp[orderbook_restrictions_message_at]; at = at + 1; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> wire[at] = orderbook_restrictions_message_record.orderbook[orderbook_restrictions_message_at]; at = at + 1; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  wire[at] = orderbook_restrictions_message_record.short_sell_eligible; at = at + 1;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> wire[at] = orderbook_restrictions_message_record.high_collar[orderbook_restrictions_message_at]; at = at + 1; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> wire[at] = orderbook_restrictions_message_record.low_collar[orderbook_restrictions_message_at]; at = at + 1; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> wire[at] = orderbook_restrictions_message_record.cb_limit_up[orderbook_restrictions_message_at]; at = at + 1; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> wire[at] = orderbook_restrictions_message_record.cb_limit_down[orderbook_restrictions_message_at]; at = at + 1; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> wire[at] = orderbook_restrictions_message_record.cb_limit_decimals[orderbook_restrictions_message_at]; at = at + 1; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  skip
}

/* Orderbook Restrictions Message off the wire, 29 bytes from where the cursor stands */
inline decode_orderbook_restrictions_message(orderbook_restrictions_message_record) {
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> orderbook_restrictions_message_record.timestamp[orderbook_restrictions_message_at] = wire[at]; at = at + 1; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> orderbook_restrictions_message_record.orderbook[orderbook_restrictions_message_at] = wire[at]; at = at + 1; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_record.short_sell_eligible = wire[at]; at = at + 1;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> orderbook_restrictions_message_record.high_collar[orderbook_restrictions_message_at] = wire[at]; at = at + 1; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> orderbook_restrictions_message_record.low_collar[orderbook_restrictions_message_at] = wire[at]; at = at + 1; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> orderbook_restrictions_message_record.cb_limit_up[orderbook_restrictions_message_at] = wire[at]; at = at + 1; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> orderbook_restrictions_message_record.cb_limit_down[orderbook_restrictions_message_at] = wire[at]; at = at + 1; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> orderbook_restrictions_message_record.cb_limit_decimals[orderbook_restrictions_message_at] = wire[at]; at = at + 1; orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Orderbook Restrictions Message is what was written, byte for byte */
inline equal_orderbook_restrictions_message(orderbook_restrictions_message_read, orderbook_restrictions_message_written) {
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> assert(orderbook_restrictions_message_read.timestamp[orderbook_restrictions_message_at] == orderbook_restrictions_message_written.timestamp[orderbook_restrictions_message_at]); orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> assert(orderbook_restrictions_message_read.orderbook[orderbook_restrictions_message_at] == orderbook_restrictions_message_written.orderbook[orderbook_restrictions_message_at]); orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  assert(orderbook_restrictions_message_read.short_sell_eligible == orderbook_restrictions_message_written.short_sell_eligible);
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> assert(orderbook_restrictions_message_read.high_collar[orderbook_restrictions_message_at] == orderbook_restrictions_message_written.high_collar[orderbook_restrictions_message_at]); orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> assert(orderbook_restrictions_message_read.low_collar[orderbook_restrictions_message_at] == orderbook_restrictions_message_written.low_collar[orderbook_restrictions_message_at]); orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> assert(orderbook_restrictions_message_read.cb_limit_up[orderbook_restrictions_message_at] == orderbook_restrictions_message_written.cb_limit_up[orderbook_restrictions_message_at]); orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> assert(orderbook_restrictions_message_read.cb_limit_down[orderbook_restrictions_message_at] == orderbook_restrictions_message_written.cb_limit_down[orderbook_restrictions_message_at]); orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  orderbook_restrictions_message_at = 0;
  do
  :: orderbook_restrictions_message_at < 4 -> assert(orderbook_restrictions_message_read.cb_limit_decimals[orderbook_restrictions_message_at] == orderbook_restrictions_message_written.cb_limit_decimals[orderbook_restrictions_message_at]); orderbook_restrictions_message_at = orderbook_restrictions_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Orderbook Trading Action Message: 10 bytes ------------------------------ */

/* Stock Trading Action Message. */
typedef OrderbookTradingActionMessage {
  byte timestamp[4];
  byte orderbook[4];
  byte trading_state;
  byte reason
};

int orderbook_trading_action_message_at;

/* every byte of Orderbook Trading Action Message set to one value */
inline fill_orderbook_trading_action_message(orderbook_trading_action_message_record, orderbook_trading_action_message_value) {
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> orderbook_trading_action_message_record.timestamp[orderbook_trading_action_message_at] = orderbook_trading_action_message_value; orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> orderbook_trading_action_message_record.orderbook[orderbook_trading_action_message_at] = orderbook_trading_action_message_value; orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  orderbook_trading_action_message_record.trading_state = orderbook_trading_action_message_value;
  orderbook_trading_action_message_record.reason = orderbook_trading_action_message_value;
  skip
}

/* each byte of Orderbook Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_orderbook_trading_action_message(orderbook_trading_action_message_record, orderbook_trading_action_message_base) {
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> orderbook_trading_action_message_record.timestamp[orderbook_trading_action_message_at] = (orderbook_trading_action_message_base + 0 + orderbook_trading_action_message_at + 1) % 256; orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> orderbook_trading_action_message_record.orderbook[orderbook_trading_action_message_at] = (orderbook_trading_action_message_base + 4 + orderbook_trading_action_message_at + 1) % 256; orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  orderbook_trading_action_message_record.trading_state = (orderbook_trading_action_message_base + 8 + 1) % 256;
  orderbook_trading_action_message_record.reason = (orderbook_trading_action_message_base + 9 + 1) % 256;
  skip
}

/* Orderbook Trading Action Message to the wire, 10 bytes from where the cursor stands */
inline encode_orderbook_trading_action_message(orderbook_trading_action_message_record) {
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> wire[at] = orderbook_trading_action_message_record.timestamp[orderbook_trading_action_message_at]; at = at + 1; orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> wire[at] = orderbook_trading_action_message_record.orderbook[orderbook_trading_action_message_at]; at = at + 1; orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = orderbook_trading_action_message_record.trading_state; at = at + 1;
  wire[at] = orderbook_trading_action_message_record.reason; at = at + 1;
  skip
}

/* Orderbook Trading Action Message off the wire, 10 bytes from where the cursor stands */
inline decode_orderbook_trading_action_message(orderbook_trading_action_message_record) {
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> orderbook_trading_action_message_record.timestamp[orderbook_trading_action_message_at] = wire[at]; at = at + 1; orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> orderbook_trading_action_message_record.orderbook[orderbook_trading_action_message_at] = wire[at]; at = at + 1; orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  orderbook_trading_action_message_record.trading_state = wire[at]; at = at + 1;
  orderbook_trading_action_message_record.reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Orderbook Trading Action Message is what was written, byte for byte */
inline equal_orderbook_trading_action_message(orderbook_trading_action_message_read, orderbook_trading_action_message_written) {
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> assert(orderbook_trading_action_message_read.timestamp[orderbook_trading_action_message_at] == orderbook_trading_action_message_written.timestamp[orderbook_trading_action_message_at]); orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> assert(orderbook_trading_action_message_read.orderbook[orderbook_trading_action_message_at] == orderbook_trading_action_message_written.orderbook[orderbook_trading_action_message_at]); orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  assert(orderbook_trading_action_message_read.trading_state == orderbook_trading_action_message_written.trading_state);
  assert(orderbook_trading_action_message_read.reason == orderbook_trading_action_message_written.reason);
  skip
}

/* ---- Trade Message: 30 bytes ------------------------------------------------- */

/* Trade Message. */
typedef TradeMessage {
  byte timestamp[4];
  byte executed_quantity[8];
  byte orderbook[4];
  byte printable;
  byte execution_price[4];
  byte match_number[8];
  byte trade_indicator
};

int trade_message_at;

/* every byte of Trade Message set to one value */
inline fill_trade_message(trade_message_record, trade_message_value) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.timestamp[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.executed_quantity[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.orderbook[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.printable = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.execution_price[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.match_number[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_indicator = trade_message_value;
  skip
}

/* each byte of Trade Message set to where it lies, so a field read out of place says so */
inline ramp_trade_message(trade_message_record, trade_message_base) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.timestamp[trade_message_at] = (trade_message_base + 0 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.executed_quantity[trade_message_at] = (trade_message_base + 4 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.orderbook[trade_message_at] = (trade_message_base + 12 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.printable = (trade_message_base + 16 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.execution_price[trade_message_at] = (trade_message_base + 17 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.match_number[trade_message_at] = (trade_message_base + 21 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_indicator = (trade_message_base + 29 + 1) % 256;
  skip
}

/* Trade Message to the wire, 30 bytes from where the cursor stands */
inline encode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.timestamp[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.executed_quantity[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.orderbook[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.printable; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.execution_price[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.match_number[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.trade_indicator; at = at + 1;
  skip
}

/* Trade Message off the wire, 30 bytes from where the cursor stands */
inline decode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.timestamp[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.executed_quantity[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.orderbook[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.printable = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.execution_price[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.match_number[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Message is what was written, byte for byte */
inline equal_trade_message(trade_message_read, trade_message_written) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.timestamp[trade_message_at] == trade_message_written.timestamp[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.executed_quantity[trade_message_at] == trade_message_written.executed_quantity[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.orderbook[trade_message_at] == trade_message_written.orderbook[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.printable == trade_message_written.printable);
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.execution_price[trade_message_at] == trade_message_written.execution_price[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.match_number[trade_message_at] == trade_message_written.match_number[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.trade_indicator == trade_message_written.trade_indicator);
  skip
}

/* ---- Trade With Broker Id Message: 38 bytes ---------------------------------- */

/* Trade (with Broker ID) Message. */
typedef TradeWithBrokerIdMessage {
  byte timestamp[4];
  byte executed_quantity[8];
  byte orderbook[4];
  byte printable;
  byte execution_price[4];
  byte match_number[8];
  byte trade_indicator;
  byte buy_broker_id[4];
  byte sell_broker_id[4]
};

int trade_with_broker_id_message_at;

/* every byte of Trade With Broker Id Message set to one value */
inline fill_trade_with_broker_id_message(trade_with_broker_id_message_record, trade_with_broker_id_message_value) {
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 4 -> trade_with_broker_id_message_record.timestamp[trade_with_broker_id_message_at] = trade_with_broker_id_message_value; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 8 -> trade_with_broker_id_message_record.executed_quantity[trade_with_broker_id_message_at] = trade_with_broker_id_message_value; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 4 -> trade_with_broker_id_message_record.orderbook[trade_with_broker_id_message_at] = trade_with_broker_id_message_value; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  trade_with_broker_id_message_record.printable = trade_with_broker_id_message_value;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 4 -> trade_with_broker_id_message_record.execution_price[trade_with_broker_id_message_at] = trade_with_broker_id_message_value; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 8 -> trade_with_broker_id_message_record.match_number[trade_with_broker_id_message_at] = trade_with_broker_id_message_value; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  trade_with_broker_id_message_record.trade_indicator = trade_with_broker_id_message_value;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 4 -> trade_with_broker_id_message_record.buy_broker_id[trade_with_broker_id_message_at] = trade_with_broker_id_message_value; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 4 -> trade_with_broker_id_message_record.sell_broker_id[trade_with_broker_id_message_at] = trade_with_broker_id_message_value; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade With Broker Id Message set to where it lies, so a field read out of place says so */
inline ramp_trade_with_broker_id_message(trade_with_broker_id_message_record, trade_with_broker_id_message_base) {
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 4 -> trade_with_broker_id_message_record.timestamp[trade_with_broker_id_message_at] = (trade_with_broker_id_message_base + 0 + trade_with_broker_id_message_at + 1) % 256; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 8 -> trade_with_broker_id_message_record.executed_quantity[trade_with_broker_id_message_at] = (trade_with_broker_id_message_base + 4 + trade_with_broker_id_message_at + 1) % 256; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 4 -> trade_with_broker_id_message_record.orderbook[trade_with_broker_id_message_at] = (trade_with_broker_id_message_base + 12 + trade_with_broker_id_message_at + 1) % 256; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  trade_with_broker_id_message_record.printable = (trade_with_broker_id_message_base + 16 + 1) % 256;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 4 -> trade_with_broker_id_message_record.execution_price[trade_with_broker_id_message_at] = (trade_with_broker_id_message_base + 17 + trade_with_broker_id_message_at + 1) % 256; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 8 -> trade_with_broker_id_message_record.match_number[trade_with_broker_id_message_at] = (trade_with_broker_id_message_base + 21 + trade_with_broker_id_message_at + 1) % 256; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  trade_with_broker_id_message_record.trade_indicator = (trade_with_broker_id_message_base + 29 + 1) % 256;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 4 -> trade_with_broker_id_message_record.buy_broker_id[trade_with_broker_id_message_at] = (trade_with_broker_id_message_base + 30 + trade_with_broker_id_message_at + 1) % 256; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 4 -> trade_with_broker_id_message_record.sell_broker_id[trade_with_broker_id_message_at] = (trade_with_broker_id_message_base + 34 + trade_with_broker_id_message_at + 1) % 256; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade With Broker Id Message to the wire, 38 bytes from where the cursor stands */
inline encode_trade_with_broker_id_message(trade_with_broker_id_message_record) {
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 4 -> wire[at] = trade_with_broker_id_message_record.timestamp[trade_with_broker_id_message_at]; at = at + 1; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 8 -> wire[at] = trade_with_broker_id_message_record.executed_quantity[trade_with_broker_id_message_at]; at = at + 1; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 4 -> wire[at] = trade_with_broker_id_message_record.orderbook[trade_with_broker_id_message_at]; at = at + 1; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_with_broker_id_message_record.printable; at = at + 1;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 4 -> wire[at] = trade_with_broker_id_message_record.execution_price[trade_with_broker_id_message_at]; at = at + 1; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 8 -> wire[at] = trade_with_broker_id_message_record.match_number[trade_with_broker_id_message_at]; at = at + 1; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_with_broker_id_message_record.trade_indicator; at = at + 1;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 4 -> wire[at] = trade_with_broker_id_message_record.buy_broker_id[trade_with_broker_id_message_at]; at = at + 1; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 4 -> wire[at] = trade_with_broker_id_message_record.sell_broker_id[trade_with_broker_id_message_at]; at = at + 1; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade With Broker Id Message off the wire, 38 bytes from where the cursor stands */
inline decode_trade_with_broker_id_message(trade_with_broker_id_message_record) {
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 4 -> trade_with_broker_id_message_record.timestamp[trade_with_broker_id_message_at] = wire[at]; at = at + 1; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 8 -> trade_with_broker_id_message_record.executed_quantity[trade_with_broker_id_message_at] = wire[at]; at = at + 1; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 4 -> trade_with_broker_id_message_record.orderbook[trade_with_broker_id_message_at] = wire[at]; at = at + 1; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  trade_with_broker_id_message_record.printable = wire[at]; at = at + 1;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 4 -> trade_with_broker_id_message_record.execution_price[trade_with_broker_id_message_at] = wire[at]; at = at + 1; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 8 -> trade_with_broker_id_message_record.match_number[trade_with_broker_id_message_at] = wire[at]; at = at + 1; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  trade_with_broker_id_message_record.trade_indicator = wire[at]; at = at + 1;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 4 -> trade_with_broker_id_message_record.buy_broker_id[trade_with_broker_id_message_at] = wire[at]; at = at + 1; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 4 -> trade_with_broker_id_message_record.sell_broker_id[trade_with_broker_id_message_at] = wire[at]; at = at + 1; trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade With Broker Id Message is what was written, byte for byte */
inline equal_trade_with_broker_id_message(trade_with_broker_id_message_read, trade_with_broker_id_message_written) {
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 4 -> assert(trade_with_broker_id_message_read.timestamp[trade_with_broker_id_message_at] == trade_with_broker_id_message_written.timestamp[trade_with_broker_id_message_at]); trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 8 -> assert(trade_with_broker_id_message_read.executed_quantity[trade_with_broker_id_message_at] == trade_with_broker_id_message_written.executed_quantity[trade_with_broker_id_message_at]); trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 4 -> assert(trade_with_broker_id_message_read.orderbook[trade_with_broker_id_message_at] == trade_with_broker_id_message_written.orderbook[trade_with_broker_id_message_at]); trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  assert(trade_with_broker_id_message_read.printable == trade_with_broker_id_message_written.printable);
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 4 -> assert(trade_with_broker_id_message_read.execution_price[trade_with_broker_id_message_at] == trade_with_broker_id_message_written.execution_price[trade_with_broker_id_message_at]); trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 8 -> assert(trade_with_broker_id_message_read.match_number[trade_with_broker_id_message_at] == trade_with_broker_id_message_written.match_number[trade_with_broker_id_message_at]); trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  assert(trade_with_broker_id_message_read.trade_indicator == trade_with_broker_id_message_written.trade_indicator);
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 4 -> assert(trade_with_broker_id_message_read.buy_broker_id[trade_with_broker_id_message_at] == trade_with_broker_id_message_written.buy_broker_id[trade_with_broker_id_message_at]); trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  trade_with_broker_id_message_at = 0;
  do
  :: trade_with_broker_id_message_at < 4 -> assert(trade_with_broker_id_message_read.sell_broker_id[trade_with_broker_id_message_at] == trade_with_broker_id_message_written.sell_broker_id[trade_with_broker_id_message_at]); trade_with_broker_id_message_at = trade_with_broker_id_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Bbo Quotation Message: 32 bytes ----------------------------------------- */

/* BBO Quotation Message. */
typedef BboQuotationMessage {
  byte timestamp[4];
  byte orderbook[4];
  byte best_bid_price[4];
  byte best_bid_size[8];
  byte best_offer_price[4];
  byte best_offer_size[8]
};

int bbo_quotation_message_at;

/* every byte of Bbo Quotation Message set to one value */
inline fill_bbo_quotation_message(bbo_quotation_message_record, bbo_quotation_message_value) {
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 4 -> bbo_quotation_message_record.timestamp[bbo_quotation_message_at] = bbo_quotation_message_value; bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 4 -> bbo_quotation_message_record.orderbook[bbo_quotation_message_at] = bbo_quotation_message_value; bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 4 -> bbo_quotation_message_record.best_bid_price[bbo_quotation_message_at] = bbo_quotation_message_value; bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 8 -> bbo_quotation_message_record.best_bid_size[bbo_quotation_message_at] = bbo_quotation_message_value; bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 4 -> bbo_quotation_message_record.best_offer_price[bbo_quotation_message_at] = bbo_quotation_message_value; bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 8 -> bbo_quotation_message_record.best_offer_size[bbo_quotation_message_at] = bbo_quotation_message_value; bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Bbo Quotation Message set to where it lies, so a field read out of place says so */
inline ramp_bbo_quotation_message(bbo_quotation_message_record, bbo_quotation_message_base) {
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 4 -> bbo_quotation_message_record.timestamp[bbo_quotation_message_at] = (bbo_quotation_message_base + 0 + bbo_quotation_message_at + 1) % 256; bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 4 -> bbo_quotation_message_record.orderbook[bbo_quotation_message_at] = (bbo_quotation_message_base + 4 + bbo_quotation_message_at + 1) % 256; bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 4 -> bbo_quotation_message_record.best_bid_price[bbo_quotation_message_at] = (bbo_quotation_message_base + 8 + bbo_quotation_message_at + 1) % 256; bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 8 -> bbo_quotation_message_record.best_bid_size[bbo_quotation_message_at] = (bbo_quotation_message_base + 12 + bbo_quotation_message_at + 1) % 256; bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 4 -> bbo_quotation_message_record.best_offer_price[bbo_quotation_message_at] = (bbo_quotation_message_base + 20 + bbo_quotation_message_at + 1) % 256; bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 8 -> bbo_quotation_message_record.best_offer_size[bbo_quotation_message_at] = (bbo_quotation_message_base + 24 + bbo_quotation_message_at + 1) % 256; bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Bbo Quotation Message to the wire, 32 bytes from where the cursor stands */
inline encode_bbo_quotation_message(bbo_quotation_message_record) {
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 4 -> wire[at] = bbo_quotation_message_record.timestamp[bbo_quotation_message_at]; at = at + 1; bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 4 -> wire[at] = bbo_quotation_message_record.orderbook[bbo_quotation_message_at]; at = at + 1; bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 4 -> wire[at] = bbo_quotation_message_record.best_bid_price[bbo_quotation_message_at]; at = at + 1; bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 8 -> wire[at] = bbo_quotation_message_record.best_bid_size[bbo_quotation_message_at]; at = at + 1; bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 4 -> wire[at] = bbo_quotation_message_record.best_offer_price[bbo_quotation_message_at]; at = at + 1; bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 8 -> wire[at] = bbo_quotation_message_record.best_offer_size[bbo_quotation_message_at]; at = at + 1; bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Bbo Quotation Message off the wire, 32 bytes from where the cursor stands */
inline decode_bbo_quotation_message(bbo_quotation_message_record) {
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 4 -> bbo_quotation_message_record.timestamp[bbo_quotation_message_at] = wire[at]; at = at + 1; bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 4 -> bbo_quotation_message_record.orderbook[bbo_quotation_message_at] = wire[at]; at = at + 1; bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 4 -> bbo_quotation_message_record.best_bid_price[bbo_quotation_message_at] = wire[at]; at = at + 1; bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 8 -> bbo_quotation_message_record.best_bid_size[bbo_quotation_message_at] = wire[at]; at = at + 1; bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 4 -> bbo_quotation_message_record.best_offer_price[bbo_quotation_message_at] = wire[at]; at = at + 1; bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 8 -> bbo_quotation_message_record.best_offer_size[bbo_quotation_message_at] = wire[at]; at = at + 1; bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Bbo Quotation Message is what was written, byte for byte */
inline equal_bbo_quotation_message(bbo_quotation_message_read, bbo_quotation_message_written) {
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 4 -> assert(bbo_quotation_message_read.timestamp[bbo_quotation_message_at] == bbo_quotation_message_written.timestamp[bbo_quotation_message_at]); bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 4 -> assert(bbo_quotation_message_read.orderbook[bbo_quotation_message_at] == bbo_quotation_message_written.orderbook[bbo_quotation_message_at]); bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 4 -> assert(bbo_quotation_message_read.best_bid_price[bbo_quotation_message_at] == bbo_quotation_message_written.best_bid_price[bbo_quotation_message_at]); bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 8 -> assert(bbo_quotation_message_read.best_bid_size[bbo_quotation_message_at] == bbo_quotation_message_written.best_bid_size[bbo_quotation_message_at]); bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 4 -> assert(bbo_quotation_message_read.best_offer_price[bbo_quotation_message_at] == bbo_quotation_message_written.best_offer_price[bbo_quotation_message_at]); bbo_quotation_message_at = bbo_quotation_message_at + 1
  :: else -> break
  od;
  bbo_quotation_message_at = 0;
  do
  :: bbo_quotation_message_at < 8 -> assert(bbo_quotation_message_read.best_offer_size[bbo_quotation_message_at] == bbo_quotation_message_written.best_offer_size[bbo_quotation_message_at]); bbo_quotation_message_at = bbo_quotation_message_at + 1
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

/* Time Stamp Seconds Message: encoded, read back, and compared */
proctype check_time_stamp_seconds_message() {
  TimeStampSecondsMessage time_stamp_seconds_message_sent;
  TimeStampSecondsMessage time_stamp_seconds_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_time_stamp_seconds_message(time_stamp_seconds_message_sent, 0)
  :: pattern == 1 -> fill_time_stamp_seconds_message(time_stamp_seconds_message_sent, 32)
  :: pattern == 2 -> fill_time_stamp_seconds_message(time_stamp_seconds_message_sent, 255)
  :: else -> ramp_time_stamp_seconds_message(time_stamp_seconds_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_time_stamp_seconds_message(time_stamp_seconds_message_sent);
    assert(at == 4);
    at = 0;
    decode_time_stamp_seconds_message(time_stamp_seconds_message_got);
    assert(at == 4);
    equal_time_stamp_seconds_message(time_stamp_seconds_message_got, time_stamp_seconds_message_sent)
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
    assert(at == 17);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 17);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Trading Schedule Message: encoded, read back, and compared */
proctype check_trading_schedule_message() {
  TradingScheduleMessage trading_schedule_message_sent;
  TradingScheduleMessage trading_schedule_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_schedule_message(trading_schedule_message_sent, 0)
  :: pattern == 1 -> fill_trading_schedule_message(trading_schedule_message_sent, 32)
  :: pattern == 2 -> fill_trading_schedule_message(trading_schedule_message_sent, 255)
  :: else -> ramp_trading_schedule_message(trading_schedule_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_schedule_message(trading_schedule_message_sent);
    assert(at == 21);
    at = 0;
    decode_trading_schedule_message(trading_schedule_message_got);
    assert(at == 21);
    equal_trading_schedule_message(trading_schedule_message_got, trading_schedule_message_sent)
  }
}

/* Price Tick Size Message: encoded, read back, and compared */
proctype check_price_tick_size_message() {
  PriceTickSizeMessage price_tick_size_message_sent;
  PriceTickSizeMessage price_tick_size_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_price_tick_size_message(price_tick_size_message_sent, 0)
  :: pattern == 1 -> fill_price_tick_size_message(price_tick_size_message_sent, 32)
  :: pattern == 2 -> fill_price_tick_size_message(price_tick_size_message_sent, 255)
  :: else -> ramp_price_tick_size_message(price_tick_size_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_price_tick_size_message(price_tick_size_message_sent);
    assert(at == 16);
    at = 0;
    decode_price_tick_size_message(price_tick_size_message_got);
    assert(at == 16);
    equal_price_tick_size_message(price_tick_size_message_got, price_tick_size_message_sent)
  }
}

/* Quantity Tick Size Message: encoded, read back, and compared */
proctype check_quantity_tick_size_message() {
  QuantityTickSizeMessage quantity_tick_size_message_sent;
  QuantityTickSizeMessage quantity_tick_size_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quantity_tick_size_message(quantity_tick_size_message_sent, 0)
  :: pattern == 1 -> fill_quantity_tick_size_message(quantity_tick_size_message_sent, 32)
  :: pattern == 2 -> fill_quantity_tick_size_message(quantity_tick_size_message_sent, 255)
  :: else -> ramp_quantity_tick_size_message(quantity_tick_size_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quantity_tick_size_message(quantity_tick_size_message_sent);
    assert(at == 24);
    at = 0;
    decode_quantity_tick_size_message(quantity_tick_size_message_got);
    assert(at == 24);
    equal_quantity_tick_size_message(quantity_tick_size_message_got, quantity_tick_size_message_sent)
  }
}

/* Orderbook Directory Message: encoded, read back, and compared */
proctype check_orderbook_directory_message() {
  OrderbookDirectoryMessage orderbook_directory_message_sent;
  OrderbookDirectoryMessage orderbook_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_orderbook_directory_message(orderbook_directory_message_sent, 0)
  :: pattern == 1 -> fill_orderbook_directory_message(orderbook_directory_message_sent, 32)
  :: pattern == 2 -> fill_orderbook_directory_message(orderbook_directory_message_sent, 255)
  :: else -> ramp_orderbook_directory_message(orderbook_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_orderbook_directory_message(orderbook_directory_message_sent);
    assert(at == 89);
    at = 0;
    decode_orderbook_directory_message(orderbook_directory_message_got);
    assert(at == 89);
    equal_orderbook_directory_message(orderbook_directory_message_got, orderbook_directory_message_sent)
  }
}

/* Orderbook Restrictions Message: encoded, read back, and compared */
proctype check_orderbook_restrictions_message() {
  OrderbookRestrictionsMessage orderbook_restrictions_message_sent;
  OrderbookRestrictionsMessage orderbook_restrictions_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_orderbook_restrictions_message(orderbook_restrictions_message_sent, 0)
  :: pattern == 1 -> fill_orderbook_restrictions_message(orderbook_restrictions_message_sent, 32)
  :: pattern == 2 -> fill_orderbook_restrictions_message(orderbook_restrictions_message_sent, 255)
  :: else -> ramp_orderbook_restrictions_message(orderbook_restrictions_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_orderbook_restrictions_message(orderbook_restrictions_message_sent);
    assert(at == 29);
    at = 0;
    decode_orderbook_restrictions_message(orderbook_restrictions_message_got);
    assert(at == 29);
    equal_orderbook_restrictions_message(orderbook_restrictions_message_got, orderbook_restrictions_message_sent)
  }
}

/* Orderbook Trading Action Message: encoded, read back, and compared */
proctype check_orderbook_trading_action_message() {
  OrderbookTradingActionMessage orderbook_trading_action_message_sent;
  OrderbookTradingActionMessage orderbook_trading_action_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_orderbook_trading_action_message(orderbook_trading_action_message_sent, 0)
  :: pattern == 1 -> fill_orderbook_trading_action_message(orderbook_trading_action_message_sent, 32)
  :: pattern == 2 -> fill_orderbook_trading_action_message(orderbook_trading_action_message_sent, 255)
  :: else -> ramp_orderbook_trading_action_message(orderbook_trading_action_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_orderbook_trading_action_message(orderbook_trading_action_message_sent);
    assert(at == 10);
    at = 0;
    decode_orderbook_trading_action_message(orderbook_trading_action_message_got);
    assert(at == 10);
    equal_orderbook_trading_action_message(orderbook_trading_action_message_got, orderbook_trading_action_message_sent)
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
    assert(at == 30);
    at = 0;
    decode_trade_message(trade_message_got);
    assert(at == 30);
    equal_trade_message(trade_message_got, trade_message_sent)
  }
}

/* Trade With Broker Id Message: encoded, read back, and compared */
proctype check_trade_with_broker_id_message() {
  TradeWithBrokerIdMessage trade_with_broker_id_message_sent;
  TradeWithBrokerIdMessage trade_with_broker_id_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_with_broker_id_message(trade_with_broker_id_message_sent, 0)
  :: pattern == 1 -> fill_trade_with_broker_id_message(trade_with_broker_id_message_sent, 32)
  :: pattern == 2 -> fill_trade_with_broker_id_message(trade_with_broker_id_message_sent, 255)
  :: else -> ramp_trade_with_broker_id_message(trade_with_broker_id_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_with_broker_id_message(trade_with_broker_id_message_sent);
    assert(at == 38);
    at = 0;
    decode_trade_with_broker_id_message(trade_with_broker_id_message_got);
    assert(at == 38);
    equal_trade_with_broker_id_message(trade_with_broker_id_message_got, trade_with_broker_id_message_sent)
  }
}

/* Bbo Quotation Message: encoded, read back, and compared */
proctype check_bbo_quotation_message() {
  BboQuotationMessage bbo_quotation_message_sent;
  BboQuotationMessage bbo_quotation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bbo_quotation_message(bbo_quotation_message_sent, 0)
  :: pattern == 1 -> fill_bbo_quotation_message(bbo_quotation_message_sent, 32)
  :: pattern == 2 -> fill_bbo_quotation_message(bbo_quotation_message_sent, 255)
  :: else -> ramp_bbo_quotation_message(bbo_quotation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bbo_quotation_message(bbo_quotation_message_sent);
    assert(at == 32);
    at = 0;
    decode_bbo_quotation_message(bbo_quotation_message_got);
    assert(at == 32);
    equal_bbo_quotation_message(bbo_quotation_message_got, bbo_quotation_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_time_stamp_seconds_message()
  :: run check_system_event_message()
  :: run check_trading_schedule_message()
  :: run check_price_tick_size_message()
  :: run check_quantity_tick_size_message()
  :: run check_orderbook_directory_message()
  :: run check_orderbook_restrictions_message()
  :: run check_orderbook_trading_action_message()
  :: run check_trade_message()
  :: run check_trade_with_broker_id_message()
  :: run check_bbo_quotation_message()
  fi
}
