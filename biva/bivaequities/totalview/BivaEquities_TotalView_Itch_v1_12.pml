/*
 * Bolsa Institucional de Valores Total View
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
#define WIRE 99

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

/* Itch timestamp, number of seconds since midnight of the system start */
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

/* System event message */
typedef SystemEventMessage {
  byte nanoseconds[4];
  byte group[8];
  byte event_code;
  byte orderbook[4]
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.nanoseconds[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
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
  :: system_event_message_at < 4 -> system_event_message_record.nanoseconds[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
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
  :: system_event_message_at < 4 -> wire[at] = system_event_message_record.nanoseconds[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
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
  :: system_event_message_at < 4 -> system_event_message_record.nanoseconds[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
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
  :: system_event_message_at < 4 -> assert(system_event_message_read.nanoseconds[system_event_message_at] == system_event_message_written.nanoseconds[system_event_message_at]); system_event_message_at = system_event_message_at + 1
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

/* ---- Price Tick Size Message: 16 bytes --------------------------------------- */

/* Orderbook price tick table */
typedef PriceTickSizeMessage {
  byte nanoseconds[4];
  byte tick_size_table_id[4];
  byte price_tick_size[4];
  byte price_start[4]
};

int price_tick_size_message_at;

/* every byte of Price Tick Size Message set to one value */
inline fill_price_tick_size_message(price_tick_size_message_record, price_tick_size_message_value) {
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.nanoseconds[price_tick_size_message_at] = price_tick_size_message_value; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.tick_size_table_id[price_tick_size_message_at] = price_tick_size_message_value; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.price_tick_size[price_tick_size_message_at] = price_tick_size_message_value; price_tick_size_message_at = price_tick_size_message_at + 1
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
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.nanoseconds[price_tick_size_message_at] = (price_tick_size_message_base + 0 + price_tick_size_message_at + 1) % 256; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.tick_size_table_id[price_tick_size_message_at] = (price_tick_size_message_base + 4 + price_tick_size_message_at + 1) % 256; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.price_tick_size[price_tick_size_message_at] = (price_tick_size_message_base + 8 + price_tick_size_message_at + 1) % 256; price_tick_size_message_at = price_tick_size_message_at + 1
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
  :: price_tick_size_message_at < 4 -> wire[at] = price_tick_size_message_record.nanoseconds[price_tick_size_message_at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> wire[at] = price_tick_size_message_record.tick_size_table_id[price_tick_size_message_at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> wire[at] = price_tick_size_message_record.price_tick_size[price_tick_size_message_at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
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
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.nanoseconds[price_tick_size_message_at] = wire[at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.tick_size_table_id[price_tick_size_message_at] = wire[at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.price_tick_size[price_tick_size_message_at] = wire[at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
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
  :: price_tick_size_message_at < 4 -> assert(price_tick_size_message_read.nanoseconds[price_tick_size_message_at] == price_tick_size_message_written.nanoseconds[price_tick_size_message_at]); price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> assert(price_tick_size_message_read.tick_size_table_id[price_tick_size_message_at] == price_tick_size_message_written.tick_size_table_id[price_tick_size_message_at]); price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> assert(price_tick_size_message_read.price_tick_size[price_tick_size_message_at] == price_tick_size_message_written.price_tick_size[price_tick_size_message_at]); price_tick_size_message_at = price_tick_size_message_at + 1
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

/* Orderbook quantity tick table */
typedef QuantityTickSizeMessage {
  byte nanoseconds[4];
  byte tick_size_table_id[4];
  byte quantity_tick_size[8];
  byte quantity_start[8]
};

int quantity_tick_size_message_at;

/* every byte of Quantity Tick Size Message set to one value */
inline fill_quantity_tick_size_message(quantity_tick_size_message_record, quantity_tick_size_message_value) {
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 4 -> quantity_tick_size_message_record.nanoseconds[quantity_tick_size_message_at] = quantity_tick_size_message_value; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 4 -> quantity_tick_size_message_record.tick_size_table_id[quantity_tick_size_message_at] = quantity_tick_size_message_value; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 8 -> quantity_tick_size_message_record.quantity_tick_size[quantity_tick_size_message_at] = quantity_tick_size_message_value; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
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
  :: quantity_tick_size_message_at < 4 -> quantity_tick_size_message_record.nanoseconds[quantity_tick_size_message_at] = (quantity_tick_size_message_base + 0 + quantity_tick_size_message_at + 1) % 256; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 4 -> quantity_tick_size_message_record.tick_size_table_id[quantity_tick_size_message_at] = (quantity_tick_size_message_base + 4 + quantity_tick_size_message_at + 1) % 256; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 8 -> quantity_tick_size_message_record.quantity_tick_size[quantity_tick_size_message_at] = (quantity_tick_size_message_base + 8 + quantity_tick_size_message_at + 1) % 256; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
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
  :: quantity_tick_size_message_at < 4 -> wire[at] = quantity_tick_size_message_record.nanoseconds[quantity_tick_size_message_at]; at = at + 1; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 4 -> wire[at] = quantity_tick_size_message_record.tick_size_table_id[quantity_tick_size_message_at]; at = at + 1; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 8 -> wire[at] = quantity_tick_size_message_record.quantity_tick_size[quantity_tick_size_message_at]; at = at + 1; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
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
  :: quantity_tick_size_message_at < 4 -> quantity_tick_size_message_record.nanoseconds[quantity_tick_size_message_at] = wire[at]; at = at + 1; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 4 -> quantity_tick_size_message_record.tick_size_table_id[quantity_tick_size_message_at] = wire[at]; at = at + 1; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 8 -> quantity_tick_size_message_record.quantity_tick_size[quantity_tick_size_message_at] = wire[at]; at = at + 1; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
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
  :: quantity_tick_size_message_at < 4 -> assert(quantity_tick_size_message_read.nanoseconds[quantity_tick_size_message_at] == quantity_tick_size_message_written.nanoseconds[quantity_tick_size_message_at]); quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 4 -> assert(quantity_tick_size_message_read.tick_size_table_id[quantity_tick_size_message_at] == quantity_tick_size_message_written.tick_size_table_id[quantity_tick_size_message_at]); quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 8 -> assert(quantity_tick_size_message_read.quantity_tick_size[quantity_tick_size_message_at] == quantity_tick_size_message_written.quantity_tick_size[quantity_tick_size_message_at]); quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 8 -> assert(quantity_tick_size_message_read.quantity_start[quantity_tick_size_message_at] == quantity_tick_size_message_written.quantity_start[quantity_tick_size_message_at]); quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Orderbook Directory Message: 99 bytes ----------------------------------- */

/* Orderbook directory */
typedef OrderbookDirectoryMessage {
  byte nanoseconds[4];
  byte orderbook[4];
  byte isin[12];
  byte sec_code[15];
  byte currency[3];
  byte group[8];
  byte minimum_quantity[8];
  byte quantity_tick_size_table_id[4];
  byte quantity_decimals[4];
  byte price_tick_size_table_id[4];
  byte price_decimals[4];
  byte delisting_or_maturity_date[4];
  byte delisting_time[4];
  byte turnover_ratio;
  byte quotation_basis[3];
  byte instrument[12];
  byte listing_type;
  byte listing_exchange[4]
};

int orderbook_directory_message_at;

/* every byte of Orderbook Directory Message set to one value */
inline fill_orderbook_directory_message(orderbook_directory_message_record, orderbook_directory_message_value) {
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.nanoseconds[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.orderbook[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> orderbook_directory_message_record.isin[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 15 -> orderbook_directory_message_record.sec_code[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
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
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.minimum_quantity[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.quantity_tick_size_table_id[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.quantity_decimals[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
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
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.delisting_or_maturity_date[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.delisting_time[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_record.turnover_ratio = orderbook_directory_message_value;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 3 -> orderbook_directory_message_record.quotation_basis[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> orderbook_directory_message_record.instrument[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_record.listing_type = orderbook_directory_message_value;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.listing_exchange[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Orderbook Directory Message set to where it lies, so a field read out of place says so */
inline ramp_orderbook_directory_message(orderbook_directory_message_record, orderbook_directory_message_base) {
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.nanoseconds[orderbook_directory_message_at] = (orderbook_directory_message_base + 0 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.orderbook[orderbook_directory_message_at] = (orderbook_directory_message_base + 4 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> orderbook_directory_message_record.isin[orderbook_directory_message_at] = (orderbook_directory_message_base + 8 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 15 -> orderbook_directory_message_record.sec_code[orderbook_directory_message_at] = (orderbook_directory_message_base + 20 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 3 -> orderbook_directory_message_record.currency[orderbook_directory_message_at] = (orderbook_directory_message_base + 35 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.group[orderbook_directory_message_at] = (orderbook_directory_message_base + 38 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.minimum_quantity[orderbook_directory_message_at] = (orderbook_directory_message_base + 46 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.quantity_tick_size_table_id[orderbook_directory_message_at] = (orderbook_directory_message_base + 54 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.quantity_decimals[orderbook_directory_message_at] = (orderbook_directory_message_base + 58 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.price_tick_size_table_id[orderbook_directory_message_at] = (orderbook_directory_message_base + 62 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.price_decimals[orderbook_directory_message_at] = (orderbook_directory_message_base + 66 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.delisting_or_maturity_date[orderbook_directory_message_at] = (orderbook_directory_message_base + 70 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.delisting_time[orderbook_directory_message_at] = (orderbook_directory_message_base + 74 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_record.turnover_ratio = (orderbook_directory_message_base + 78 + 1) % 256;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 3 -> orderbook_directory_message_record.quotation_basis[orderbook_directory_message_at] = (orderbook_directory_message_base + 79 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> orderbook_directory_message_record.instrument[orderbook_directory_message_at] = (orderbook_directory_message_base + 82 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_record.listing_type = (orderbook_directory_message_base + 94 + 1) % 256;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.listing_exchange[orderbook_directory_message_at] = (orderbook_directory_message_base + 95 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Orderbook Directory Message to the wire, 99 bytes from where the cursor stands */
inline encode_orderbook_directory_message(orderbook_directory_message_record) {
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.nanoseconds[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.orderbook[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> wire[at] = orderbook_directory_message_record.isin[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 15 -> wire[at] = orderbook_directory_message_record.sec_code[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
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
  :: orderbook_directory_message_at < 8 -> wire[at] = orderbook_directory_message_record.minimum_quantity[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.quantity_tick_size_table_id[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.quantity_decimals[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
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
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.delisting_or_maturity_date[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.delisting_time[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = orderbook_directory_message_record.turnover_ratio; at = at + 1;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 3 -> wire[at] = orderbook_directory_message_record.quotation_basis[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> wire[at] = orderbook_directory_message_record.instrument[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = orderbook_directory_message_record.listing_type; at = at + 1;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.listing_exchange[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Orderbook Directory Message off the wire, 99 bytes from where the cursor stands */
inline decode_orderbook_directory_message(orderbook_directory_message_record) {
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.nanoseconds[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.orderbook[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> orderbook_directory_message_record.isin[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 15 -> orderbook_directory_message_record.sec_code[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
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
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.minimum_quantity[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.quantity_tick_size_table_id[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.quantity_decimals[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
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
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.delisting_or_maturity_date[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.delisting_time[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_record.turnover_ratio = wire[at]; at = at + 1;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 3 -> orderbook_directory_message_record.quotation_basis[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> orderbook_directory_message_record.instrument[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_record.listing_type = wire[at]; at = at + 1;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.listing_exchange[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Orderbook Directory Message is what was written, byte for byte */
inline equal_orderbook_directory_message(orderbook_directory_message_read, orderbook_directory_message_written) {
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.nanoseconds[orderbook_directory_message_at] == orderbook_directory_message_written.nanoseconds[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.orderbook[orderbook_directory_message_at] == orderbook_directory_message_written.orderbook[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> assert(orderbook_directory_message_read.isin[orderbook_directory_message_at] == orderbook_directory_message_written.isin[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 15 -> assert(orderbook_directory_message_read.sec_code[orderbook_directory_message_at] == orderbook_directory_message_written.sec_code[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
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
  :: orderbook_directory_message_at < 8 -> assert(orderbook_directory_message_read.minimum_quantity[orderbook_directory_message_at] == orderbook_directory_message_written.minimum_quantity[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.quantity_tick_size_table_id[orderbook_directory_message_at] == orderbook_directory_message_written.quantity_tick_size_table_id[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.quantity_decimals[orderbook_directory_message_at] == orderbook_directory_message_written.quantity_decimals[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
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
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.delisting_or_maturity_date[orderbook_directory_message_at] == orderbook_directory_message_written.delisting_or_maturity_date[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.delisting_time[orderbook_directory_message_at] == orderbook_directory_message_written.delisting_time[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  assert(orderbook_directory_message_read.turnover_ratio == orderbook_directory_message_written.turnover_ratio);
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 3 -> assert(orderbook_directory_message_read.quotation_basis[orderbook_directory_message_at] == orderbook_directory_message_written.quotation_basis[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> assert(orderbook_directory_message_read.instrument[orderbook_directory_message_at] == orderbook_directory_message_written.instrument[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  assert(orderbook_directory_message_read.listing_type == orderbook_directory_message_written.listing_type);
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.listing_exchange[orderbook_directory_message_at] == orderbook_directory_message_written.listing_exchange[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Participant Directory Message: 20 bytes --------------------------------- */

/* Participant directory */
typedef ParticipantDirectoryMessage {
  byte nanoseconds[4];
  byte participant_id[4];
  byte participant_code[12]
};

int participant_directory_message_at;

/* every byte of Participant Directory Message set to one value */
inline fill_participant_directory_message(participant_directory_message_record, participant_directory_message_value) {
  participant_directory_message_at = 0;
  do
  :: participant_directory_message_at < 4 -> participant_directory_message_record.nanoseconds[participant_directory_message_at] = participant_directory_message_value; participant_directory_message_at = participant_directory_message_at + 1
  :: else -> break
  od;
  participant_directory_message_at = 0;
  do
  :: participant_directory_message_at < 4 -> participant_directory_message_record.participant_id[participant_directory_message_at] = participant_directory_message_value; participant_directory_message_at = participant_directory_message_at + 1
  :: else -> break
  od;
  participant_directory_message_at = 0;
  do
  :: participant_directory_message_at < 12 -> participant_directory_message_record.participant_code[participant_directory_message_at] = participant_directory_message_value; participant_directory_message_at = participant_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Participant Directory Message set to where it lies, so a field read out of place says so */
inline ramp_participant_directory_message(participant_directory_message_record, participant_directory_message_base) {
  participant_directory_message_at = 0;
  do
  :: participant_directory_message_at < 4 -> participant_directory_message_record.nanoseconds[participant_directory_message_at] = (participant_directory_message_base + 0 + participant_directory_message_at + 1) % 256; participant_directory_message_at = participant_directory_message_at + 1
  :: else -> break
  od;
  participant_directory_message_at = 0;
  do
  :: participant_directory_message_at < 4 -> participant_directory_message_record.participant_id[participant_directory_message_at] = (participant_directory_message_base + 4 + participant_directory_message_at + 1) % 256; participant_directory_message_at = participant_directory_message_at + 1
  :: else -> break
  od;
  participant_directory_message_at = 0;
  do
  :: participant_directory_message_at < 12 -> participant_directory_message_record.participant_code[participant_directory_message_at] = (participant_directory_message_base + 8 + participant_directory_message_at + 1) % 256; participant_directory_message_at = participant_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Participant Directory Message to the wire, 20 bytes from where the cursor stands */
inline encode_participant_directory_message(participant_directory_message_record) {
  participant_directory_message_at = 0;
  do
  :: participant_directory_message_at < 4 -> wire[at] = participant_directory_message_record.nanoseconds[participant_directory_message_at]; at = at + 1; participant_directory_message_at = participant_directory_message_at + 1
  :: else -> break
  od;
  participant_directory_message_at = 0;
  do
  :: participant_directory_message_at < 4 -> wire[at] = participant_directory_message_record.participant_id[participant_directory_message_at]; at = at + 1; participant_directory_message_at = participant_directory_message_at + 1
  :: else -> break
  od;
  participant_directory_message_at = 0;
  do
  :: participant_directory_message_at < 12 -> wire[at] = participant_directory_message_record.participant_code[participant_directory_message_at]; at = at + 1; participant_directory_message_at = participant_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Participant Directory Message off the wire, 20 bytes from where the cursor stands */
inline decode_participant_directory_message(participant_directory_message_record) {
  participant_directory_message_at = 0;
  do
  :: participant_directory_message_at < 4 -> participant_directory_message_record.nanoseconds[participant_directory_message_at] = wire[at]; at = at + 1; participant_directory_message_at = participant_directory_message_at + 1
  :: else -> break
  od;
  participant_directory_message_at = 0;
  do
  :: participant_directory_message_at < 4 -> participant_directory_message_record.participant_id[participant_directory_message_at] = wire[at]; at = at + 1; participant_directory_message_at = participant_directory_message_at + 1
  :: else -> break
  od;
  participant_directory_message_at = 0;
  do
  :: participant_directory_message_at < 12 -> participant_directory_message_record.participant_code[participant_directory_message_at] = wire[at]; at = at + 1; participant_directory_message_at = participant_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Participant Directory Message is what was written, byte for byte */
inline equal_participant_directory_message(participant_directory_message_read, participant_directory_message_written) {
  participant_directory_message_at = 0;
  do
  :: participant_directory_message_at < 4 -> assert(participant_directory_message_read.nanoseconds[participant_directory_message_at] == participant_directory_message_written.nanoseconds[participant_directory_message_at]); participant_directory_message_at = participant_directory_message_at + 1
  :: else -> break
  od;
  participant_directory_message_at = 0;
  do
  :: participant_directory_message_at < 4 -> assert(participant_directory_message_read.participant_id[participant_directory_message_at] == participant_directory_message_written.participant_id[participant_directory_message_at]); participant_directory_message_at = participant_directory_message_at + 1
  :: else -> break
  od;
  participant_directory_message_at = 0;
  do
  :: participant_directory_message_at < 12 -> assert(participant_directory_message_read.participant_code[participant_directory_message_at] == participant_directory_message_written.participant_code[participant_directory_message_at]); participant_directory_message_at = participant_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Orderbook Trading Action Message: 10 bytes ------------------------------ */

/* Trading action message */
typedef OrderbookTradingActionMessage {
  byte nanoseconds[4];
  byte orderbook[4];
  byte trading_state;
  byte trading_action_reason
};

int orderbook_trading_action_message_at;

/* every byte of Orderbook Trading Action Message set to one value */
inline fill_orderbook_trading_action_message(orderbook_trading_action_message_record, orderbook_trading_action_message_value) {
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> orderbook_trading_action_message_record.nanoseconds[orderbook_trading_action_message_at] = orderbook_trading_action_message_value; orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> orderbook_trading_action_message_record.orderbook[orderbook_trading_action_message_at] = orderbook_trading_action_message_value; orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  orderbook_trading_action_message_record.trading_state = orderbook_trading_action_message_value;
  orderbook_trading_action_message_record.trading_action_reason = orderbook_trading_action_message_value;
  skip
}

/* each byte of Orderbook Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_orderbook_trading_action_message(orderbook_trading_action_message_record, orderbook_trading_action_message_base) {
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> orderbook_trading_action_message_record.nanoseconds[orderbook_trading_action_message_at] = (orderbook_trading_action_message_base + 0 + orderbook_trading_action_message_at + 1) % 256; orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> orderbook_trading_action_message_record.orderbook[orderbook_trading_action_message_at] = (orderbook_trading_action_message_base + 4 + orderbook_trading_action_message_at + 1) % 256; orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  orderbook_trading_action_message_record.trading_state = (orderbook_trading_action_message_base + 8 + 1) % 256;
  orderbook_trading_action_message_record.trading_action_reason = (orderbook_trading_action_message_base + 9 + 1) % 256;
  skip
}

/* Orderbook Trading Action Message to the wire, 10 bytes from where the cursor stands */
inline encode_orderbook_trading_action_message(orderbook_trading_action_message_record) {
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> wire[at] = orderbook_trading_action_message_record.nanoseconds[orderbook_trading_action_message_at]; at = at + 1; orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> wire[at] = orderbook_trading_action_message_record.orderbook[orderbook_trading_action_message_at]; at = at + 1; orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = orderbook_trading_action_message_record.trading_state; at = at + 1;
  wire[at] = orderbook_trading_action_message_record.trading_action_reason; at = at + 1;
  skip
}

/* Orderbook Trading Action Message off the wire, 10 bytes from where the cursor stands */
inline decode_orderbook_trading_action_message(orderbook_trading_action_message_record) {
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> orderbook_trading_action_message_record.nanoseconds[orderbook_trading_action_message_at] = wire[at]; at = at + 1; orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> orderbook_trading_action_message_record.orderbook[orderbook_trading_action_message_at] = wire[at]; at = at + 1; orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  orderbook_trading_action_message_record.trading_state = wire[at]; at = at + 1;
  orderbook_trading_action_message_record.trading_action_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Orderbook Trading Action Message is what was written, byte for byte */
inline equal_orderbook_trading_action_message(orderbook_trading_action_message_read, orderbook_trading_action_message_written) {
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> assert(orderbook_trading_action_message_read.nanoseconds[orderbook_trading_action_message_at] == orderbook_trading_action_message_written.nanoseconds[orderbook_trading_action_message_at]); orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> assert(orderbook_trading_action_message_read.orderbook[orderbook_trading_action_message_at] == orderbook_trading_action_message_written.orderbook[orderbook_trading_action_message_at]); orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  assert(orderbook_trading_action_message_read.trading_state == orderbook_trading_action_message_written.trading_state);
  assert(orderbook_trading_action_message_read.trading_action_reason == orderbook_trading_action_message_written.trading_action_reason);
  skip
}

/* ---- Orderbook Reference Price Message: 14 bytes ----------------------------- */

/* Orderbook reference price message */
typedef OrderbookReferencePriceMessage {
  byte nanoseconds[4];
  byte orderbook[4];
  byte reference_price[4];
  byte price_type;
  byte reference_price_reason
};

int orderbook_reference_price_message_at;

/* every byte of Orderbook Reference Price Message set to one value */
inline fill_orderbook_reference_price_message(orderbook_reference_price_message_record, orderbook_reference_price_message_value) {
  orderbook_reference_price_message_at = 0;
  do
  :: orderbook_reference_price_message_at < 4 -> orderbook_reference_price_message_record.nanoseconds[orderbook_reference_price_message_at] = orderbook_reference_price_message_value; orderbook_reference_price_message_at = orderbook_reference_price_message_at + 1
  :: else -> break
  od;
  orderbook_reference_price_message_at = 0;
  do
  :: orderbook_reference_price_message_at < 4 -> orderbook_reference_price_message_record.orderbook[orderbook_reference_price_message_at] = orderbook_reference_price_message_value; orderbook_reference_price_message_at = orderbook_reference_price_message_at + 1
  :: else -> break
  od;
  orderbook_reference_price_message_at = 0;
  do
  :: orderbook_reference_price_message_at < 4 -> orderbook_reference_price_message_record.reference_price[orderbook_reference_price_message_at] = orderbook_reference_price_message_value; orderbook_reference_price_message_at = orderbook_reference_price_message_at + 1
  :: else -> break
  od;
  orderbook_reference_price_message_record.price_type = orderbook_reference_price_message_value;
  orderbook_reference_price_message_record.reference_price_reason = orderbook_reference_price_message_value;
  skip
}

/* each byte of Orderbook Reference Price Message set to where it lies, so a field read out of place says so */
inline ramp_orderbook_reference_price_message(orderbook_reference_price_message_record, orderbook_reference_price_message_base) {
  orderbook_reference_price_message_at = 0;
  do
  :: orderbook_reference_price_message_at < 4 -> orderbook_reference_price_message_record.nanoseconds[orderbook_reference_price_message_at] = (orderbook_reference_price_message_base + 0 + orderbook_reference_price_message_at + 1) % 256; orderbook_reference_price_message_at = orderbook_reference_price_message_at + 1
  :: else -> break
  od;
  orderbook_reference_price_message_at = 0;
  do
  :: orderbook_reference_price_message_at < 4 -> orderbook_reference_price_message_record.orderbook[orderbook_reference_price_message_at] = (orderbook_reference_price_message_base + 4 + orderbook_reference_price_message_at + 1) % 256; orderbook_reference_price_message_at = orderbook_reference_price_message_at + 1
  :: else -> break
  od;
  orderbook_reference_price_message_at = 0;
  do
  :: orderbook_reference_price_message_at < 4 -> orderbook_reference_price_message_record.reference_price[orderbook_reference_price_message_at] = (orderbook_reference_price_message_base + 8 + orderbook_reference_price_message_at + 1) % 256; orderbook_reference_price_message_at = orderbook_reference_price_message_at + 1
  :: else -> break
  od;
  orderbook_reference_price_message_record.price_type = (orderbook_reference_price_message_base + 12 + 1) % 256;
  orderbook_reference_price_message_record.reference_price_reason = (orderbook_reference_price_message_base + 13 + 1) % 256;
  skip
}

/* Orderbook Reference Price Message to the wire, 14 bytes from where the cursor stands */
inline encode_orderbook_reference_price_message(orderbook_reference_price_message_record) {
  orderbook_reference_price_message_at = 0;
  do
  :: orderbook_reference_price_message_at < 4 -> wire[at] = orderbook_reference_price_message_record.nanoseconds[orderbook_reference_price_message_at]; at = at + 1; orderbook_reference_price_message_at = orderbook_reference_price_message_at + 1
  :: else -> break
  od;
  orderbook_reference_price_message_at = 0;
  do
  :: orderbook_reference_price_message_at < 4 -> wire[at] = orderbook_reference_price_message_record.orderbook[orderbook_reference_price_message_at]; at = at + 1; orderbook_reference_price_message_at = orderbook_reference_price_message_at + 1
  :: else -> break
  od;
  orderbook_reference_price_message_at = 0;
  do
  :: orderbook_reference_price_message_at < 4 -> wire[at] = orderbook_reference_price_message_record.reference_price[orderbook_reference_price_message_at]; at = at + 1; orderbook_reference_price_message_at = orderbook_reference_price_message_at + 1
  :: else -> break
  od;
  wire[at] = orderbook_reference_price_message_record.price_type; at = at + 1;
  wire[at] = orderbook_reference_price_message_record.reference_price_reason; at = at + 1;
  skip
}

/* Orderbook Reference Price Message off the wire, 14 bytes from where the cursor stands */
inline decode_orderbook_reference_price_message(orderbook_reference_price_message_record) {
  orderbook_reference_price_message_at = 0;
  do
  :: orderbook_reference_price_message_at < 4 -> orderbook_reference_price_message_record.nanoseconds[orderbook_reference_price_message_at] = wire[at]; at = at + 1; orderbook_reference_price_message_at = orderbook_reference_price_message_at + 1
  :: else -> break
  od;
  orderbook_reference_price_message_at = 0;
  do
  :: orderbook_reference_price_message_at < 4 -> orderbook_reference_price_message_record.orderbook[orderbook_reference_price_message_at] = wire[at]; at = at + 1; orderbook_reference_price_message_at = orderbook_reference_price_message_at + 1
  :: else -> break
  od;
  orderbook_reference_price_message_at = 0;
  do
  :: orderbook_reference_price_message_at < 4 -> orderbook_reference_price_message_record.reference_price[orderbook_reference_price_message_at] = wire[at]; at = at + 1; orderbook_reference_price_message_at = orderbook_reference_price_message_at + 1
  :: else -> break
  od;
  orderbook_reference_price_message_record.price_type = wire[at]; at = at + 1;
  orderbook_reference_price_message_record.reference_price_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Orderbook Reference Price Message is what was written, byte for byte */
inline equal_orderbook_reference_price_message(orderbook_reference_price_message_read, orderbook_reference_price_message_written) {
  orderbook_reference_price_message_at = 0;
  do
  :: orderbook_reference_price_message_at < 4 -> assert(orderbook_reference_price_message_read.nanoseconds[orderbook_reference_price_message_at] == orderbook_reference_price_message_written.nanoseconds[orderbook_reference_price_message_at]); orderbook_reference_price_message_at = orderbook_reference_price_message_at + 1
  :: else -> break
  od;
  orderbook_reference_price_message_at = 0;
  do
  :: orderbook_reference_price_message_at < 4 -> assert(orderbook_reference_price_message_read.orderbook[orderbook_reference_price_message_at] == orderbook_reference_price_message_written.orderbook[orderbook_reference_price_message_at]); orderbook_reference_price_message_at = orderbook_reference_price_message_at + 1
  :: else -> break
  od;
  orderbook_reference_price_message_at = 0;
  do
  :: orderbook_reference_price_message_at < 4 -> assert(orderbook_reference_price_message_read.reference_price[orderbook_reference_price_message_at] == orderbook_reference_price_message_written.reference_price[orderbook_reference_price_message_at]); orderbook_reference_price_message_at = orderbook_reference_price_message_at + 1
  :: else -> break
  od;
  assert(orderbook_reference_price_message_read.price_type == orderbook_reference_price_message_written.price_type);
  assert(orderbook_reference_price_message_read.reference_price_reason == orderbook_reference_price_message_written.reference_price_reason);
  skip
}

/* ---- Add Order Message: 33 bytes --------------------------------------------- */

/* Add order message */
typedef AddOrderMessage {
  byte nanoseconds[4];
  byte order_number[8];
  byte order_verb;
  byte quantity[8];
  byte orderbook[4];
  byte price[4];
  byte participant_id[4]
};

int add_order_message_at;

/* every byte of Add Order Message set to one value */
inline fill_add_order_message(add_order_message_record, add_order_message_value) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.nanoseconds[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_number[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.order_verb = add_order_message_value;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.quantity[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.orderbook[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.participant_id[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_message(add_order_message_record, add_order_message_base) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.nanoseconds[add_order_message_at] = (add_order_message_base + 0 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_number[add_order_message_at] = (add_order_message_base + 4 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.order_verb = (add_order_message_base + 12 + 1) % 256;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.quantity[add_order_message_at] = (add_order_message_base + 13 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.orderbook[add_order_message_at] = (add_order_message_base + 21 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = (add_order_message_base + 25 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.participant_id[add_order_message_at] = (add_order_message_base + 29 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message to the wire, 33 bytes from where the cursor stands */
inline encode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.nanoseconds[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> wire[at] = add_order_message_record.order_number[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_record.order_verb; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> wire[at] = add_order_message_record.quantity[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.orderbook[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.price[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.participant_id[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message off the wire, 33 bytes from where the cursor stands */
inline decode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.nanoseconds[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_number[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.order_verb = wire[at]; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.quantity[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.orderbook[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.participant_id[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Message is what was written, byte for byte */
inline equal_add_order_message(add_order_message_read, add_order_message_written) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.nanoseconds[add_order_message_at] == add_order_message_written.nanoseconds[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> assert(add_order_message_read.order_number[add_order_message_at] == add_order_message_written.order_number[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  assert(add_order_message_read.order_verb == add_order_message_written.order_verb);
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> assert(add_order_message_read.quantity[add_order_message_at] == add_order_message_written.quantity[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.orderbook[add_order_message_at] == add_order_message_written.orderbook[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.price[add_order_message_at] == add_order_message_written.price[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.participant_id[add_order_message_at] == add_order_message_written.participant_id[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Executed Message: 34 bytes ---------------------------------------- */

/* Order executed */
typedef OrderExecutedMessage {
  byte nanoseconds[4];
  byte order_number[8];
  byte executed_quantity[8];
  byte match_number[8];
  byte trade_indicator;
  byte stat_update;
  byte aggressor_participant_id[4]
};

int order_executed_message_at;

/* every byte of Order Executed Message set to one value */
inline fill_order_executed_message(order_executed_message_record, order_executed_message_value) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.nanoseconds[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_number[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.executed_quantity[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.match_number[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.trade_indicator = order_executed_message_value;
  order_executed_message_record.stat_update = order_executed_message_value;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.aggressor_participant_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Executed Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_message(order_executed_message_record, order_executed_message_base) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.nanoseconds[order_executed_message_at] = (order_executed_message_base + 0 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_number[order_executed_message_at] = (order_executed_message_base + 4 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.executed_quantity[order_executed_message_at] = (order_executed_message_base + 12 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.match_number[order_executed_message_at] = (order_executed_message_base + 20 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.trade_indicator = (order_executed_message_base + 28 + 1) % 256;
  order_executed_message_record.stat_update = (order_executed_message_base + 29 + 1) % 256;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.aggressor_participant_id[order_executed_message_at] = (order_executed_message_base + 30 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message to the wire, 34 bytes from where the cursor stands */
inline encode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.nanoseconds[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.order_number[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.executed_quantity[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.match_number[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_message_record.trade_indicator; at = at + 1;
  wire[at] = order_executed_message_record.stat_update; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.aggressor_participant_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message off the wire, 34 bytes from where the cursor stands */
inline decode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.nanoseconds[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_number[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.executed_quantity[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.match_number[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.trade_indicator = wire[at]; at = at + 1;
  order_executed_message_record.stat_update = wire[at]; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.aggressor_participant_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Executed Message is what was written, byte for byte */
inline equal_order_executed_message(order_executed_message_read, order_executed_message_written) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.nanoseconds[order_executed_message_at] == order_executed_message_written.nanoseconds[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.order_number[order_executed_message_at] == order_executed_message_written.order_number[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.executed_quantity[order_executed_message_at] == order_executed_message_written.executed_quantity[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.match_number[order_executed_message_at] == order_executed_message_written.match_number[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  assert(order_executed_message_read.trade_indicator == order_executed_message_written.trade_indicator);
  assert(order_executed_message_read.stat_update == order_executed_message_written.stat_update);
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.aggressor_participant_id[order_executed_message_at] == order_executed_message_written.aggressor_participant_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Executed With Price Message: 39 bytes ----------------------------- */

/* Order executed with price */
typedef OrderExecutedWithPriceMessage {
  byte nanoseconds[4];
  byte order_number[8];
  byte executed_quantity[8];
  byte match_number[8];
  byte trade_indicator;
  byte printable;
  byte execution_price[4];
  byte stat_update;
  byte counterparty_participant_id[4]
};

int order_executed_with_price_message_at;

/* every byte of Order Executed With Price Message set to one value */
inline fill_order_executed_with_price_message(order_executed_with_price_message_record, order_executed_with_price_message_value) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.nanoseconds[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.order_number[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.executed_quantity[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.match_number[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.trade_indicator = order_executed_with_price_message_value;
  order_executed_with_price_message_record.printable = order_executed_with_price_message_value;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.execution_price[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.stat_update = order_executed_with_price_message_value;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.counterparty_participant_id[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Executed With Price Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_with_price_message(order_executed_with_price_message_record, order_executed_with_price_message_base) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.nanoseconds[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 0 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.order_number[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 4 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.executed_quantity[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 12 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.match_number[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 20 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.trade_indicator = (order_executed_with_price_message_base + 28 + 1) % 256;
  order_executed_with_price_message_record.printable = (order_executed_with_price_message_base + 29 + 1) % 256;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.execution_price[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 30 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.stat_update = (order_executed_with_price_message_base + 34 + 1) % 256;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.counterparty_participant_id[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 35 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed With Price Message to the wire, 39 bytes from where the cursor stands */
inline encode_order_executed_with_price_message(order_executed_with_price_message_record) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.nanoseconds[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> wire[at] = order_executed_with_price_message_record.order_number[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> wire[at] = order_executed_with_price_message_record.executed_quantity[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> wire[at] = order_executed_with_price_message_record.match_number[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_with_price_message_record.trade_indicator; at = at + 1;
  wire[at] = order_executed_with_price_message_record.printable; at = at + 1;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.execution_price[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_with_price_message_record.stat_update; at = at + 1;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.counterparty_participant_id[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed With Price Message off the wire, 39 bytes from where the cursor stands */
inline decode_order_executed_with_price_message(order_executed_with_price_message_record) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.nanoseconds[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.order_number[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.executed_quantity[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.match_number[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.trade_indicator = wire[at]; at = at + 1;
  order_executed_with_price_message_record.printable = wire[at]; at = at + 1;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.execution_price[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.stat_update = wire[at]; at = at + 1;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.counterparty_participant_id[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Executed With Price Message is what was written, byte for byte */
inline equal_order_executed_with_price_message(order_executed_with_price_message_read, order_executed_with_price_message_written) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.nanoseconds[order_executed_with_price_message_at] == order_executed_with_price_message_written.nanoseconds[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> assert(order_executed_with_price_message_read.order_number[order_executed_with_price_message_at] == order_executed_with_price_message_written.order_number[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> assert(order_executed_with_price_message_read.executed_quantity[order_executed_with_price_message_at] == order_executed_with_price_message_written.executed_quantity[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> assert(order_executed_with_price_message_read.match_number[order_executed_with_price_message_at] == order_executed_with_price_message_written.match_number[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  assert(order_executed_with_price_message_read.trade_indicator == order_executed_with_price_message_written.trade_indicator);
  assert(order_executed_with_price_message_read.printable == order_executed_with_price_message_written.printable);
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.execution_price[order_executed_with_price_message_at] == order_executed_with_price_message_written.execution_price[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  assert(order_executed_with_price_message_read.stat_update == order_executed_with_price_message_written.stat_update);
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.counterparty_participant_id[order_executed_with_price_message_at] == order_executed_with_price_message_written.counterparty_participant_id[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Message: 39 bytes ------------------------------------------------- */

/* Trade message */
typedef TradeMessage {
  byte nanoseconds[4];
  byte executed_quantity[8];
  byte orderbook[4];
  byte printable;
  byte execution_price[4];
  byte match_number[8];
  byte trade_indicator;
  byte stat_update;
  byte buy_participant_id[4];
  byte sell_participant_id[4]
};

int trade_message_at;

/* every byte of Trade Message set to one value */
inline fill_trade_message(trade_message_record, trade_message_value) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.nanoseconds[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
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
  trade_message_record.stat_update = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.buy_participant_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.sell_participant_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Message set to where it lies, so a field read out of place says so */
inline ramp_trade_message(trade_message_record, trade_message_base) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.nanoseconds[trade_message_at] = (trade_message_base + 0 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
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
  trade_message_record.stat_update = (trade_message_base + 30 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.buy_participant_id[trade_message_at] = (trade_message_base + 31 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.sell_participant_id[trade_message_at] = (trade_message_base + 35 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message to the wire, 39 bytes from where the cursor stands */
inline encode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.nanoseconds[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
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
  wire[at] = trade_message_record.stat_update; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.buy_participant_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.sell_participant_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message off the wire, 39 bytes from where the cursor stands */
inline decode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.nanoseconds[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
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
  trade_message_record.stat_update = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.buy_participant_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.sell_participant_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Message is what was written, byte for byte */
inline equal_trade_message(trade_message_read, trade_message_written) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.nanoseconds[trade_message_at] == trade_message_written.nanoseconds[trade_message_at]); trade_message_at = trade_message_at + 1
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
  assert(trade_message_read.stat_update == trade_message_written.stat_update);
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.buy_participant_id[trade_message_at] == trade_message_written.buy_participant_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.sell_participant_id[trade_message_at] == trade_message_written.sell_participant_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Broken Trade Message: 13 bytes ------------------------------------------ */

/* Busted trade message */
typedef BrokenTradeMessage {
  byte nanoseconds[4];
  byte match_number[8];
  byte broken_trade_reason
};

int broken_trade_message_at;

/* every byte of Broken Trade Message set to one value */
inline fill_broken_trade_message(broken_trade_message_record, broken_trade_message_value) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.nanoseconds[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.match_number[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_record.broken_trade_reason = broken_trade_message_value;
  skip
}

/* each byte of Broken Trade Message set to where it lies, so a field read out of place says so */
inline ramp_broken_trade_message(broken_trade_message_record, broken_trade_message_base) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.nanoseconds[broken_trade_message_at] = (broken_trade_message_base + 0 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.match_number[broken_trade_message_at] = (broken_trade_message_base + 4 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_record.broken_trade_reason = (broken_trade_message_base + 12 + 1) % 256;
  skip
}

/* Broken Trade Message to the wire, 13 bytes from where the cursor stands */
inline encode_broken_trade_message(broken_trade_message_record) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> wire[at] = broken_trade_message_record.nanoseconds[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> wire[at] = broken_trade_message_record.match_number[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = broken_trade_message_record.broken_trade_reason; at = at + 1;
  skip
}

/* Broken Trade Message off the wire, 13 bytes from where the cursor stands */
inline decode_broken_trade_message(broken_trade_message_record) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.nanoseconds[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.match_number[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_record.broken_trade_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Broken Trade Message is what was written, byte for byte */
inline equal_broken_trade_message(broken_trade_message_read, broken_trade_message_written) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> assert(broken_trade_message_read.nanoseconds[broken_trade_message_at] == broken_trade_message_written.nanoseconds[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> assert(broken_trade_message_read.match_number[broken_trade_message_at] == broken_trade_message_written.match_number[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  assert(broken_trade_message_read.broken_trade_reason == broken_trade_message_written.broken_trade_reason);
  skip
}

/* ---- Order Delete Message: 12 bytes ------------------------------------------ */

/* Delete order */
typedef OrderDeleteMessage {
  byte nanoseconds[4];
  byte order_number[8]
};

int order_delete_message_at;

/* every byte of Order Delete Message set to one value */
inline fill_order_delete_message(order_delete_message_record, order_delete_message_value) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.nanoseconds[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.order_number[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Delete Message set to where it lies, so a field read out of place says so */
inline ramp_order_delete_message(order_delete_message_record, order_delete_message_base) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.nanoseconds[order_delete_message_at] = (order_delete_message_base + 0 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.order_number[order_delete_message_at] = (order_delete_message_base + 4 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Delete Message to the wire, 12 bytes from where the cursor stands */
inline encode_order_delete_message(order_delete_message_record) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> wire[at] = order_delete_message_record.nanoseconds[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> wire[at] = order_delete_message_record.order_number[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Delete Message off the wire, 12 bytes from where the cursor stands */
inline decode_order_delete_message(order_delete_message_record) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.nanoseconds[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.order_number[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Delete Message is what was written, byte for byte */
inline equal_order_delete_message(order_delete_message_read, order_delete_message_written) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> assert(order_delete_message_read.nanoseconds[order_delete_message_at] == order_delete_message_written.nanoseconds[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> assert(order_delete_message_read.order_number[order_delete_message_at] == order_delete_message_written.order_number[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Replace Message: 32 bytes ----------------------------------------- */

/* Updated order */
typedef OrderReplaceMessage {
  byte nanoseconds[4];
  byte original_order_number[8];
  byte new_order_number[8];
  byte quantity[8];
  byte price[4]
};

int order_replace_message_at;

/* every byte of Order Replace Message set to one value */
inline fill_order_replace_message(order_replace_message_record, order_replace_message_value) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.nanoseconds[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.original_order_number[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.new_order_number[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.quantity[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.price[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Replace Message set to where it lies, so a field read out of place says so */
inline ramp_order_replace_message(order_replace_message_record, order_replace_message_base) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.nanoseconds[order_replace_message_at] = (order_replace_message_base + 0 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.original_order_number[order_replace_message_at] = (order_replace_message_base + 4 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.new_order_number[order_replace_message_at] = (order_replace_message_base + 12 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.quantity[order_replace_message_at] = (order_replace_message_base + 20 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.price[order_replace_message_at] = (order_replace_message_base + 28 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replace Message to the wire, 32 bytes from where the cursor stands */
inline encode_order_replace_message(order_replace_message_record) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> wire[at] = order_replace_message_record.nanoseconds[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> wire[at] = order_replace_message_record.original_order_number[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> wire[at] = order_replace_message_record.new_order_number[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> wire[at] = order_replace_message_record.quantity[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> wire[at] = order_replace_message_record.price[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replace Message off the wire, 32 bytes from where the cursor stands */
inline decode_order_replace_message(order_replace_message_record) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.nanoseconds[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.original_order_number[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.new_order_number[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.quantity[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.price[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Replace Message is what was written, byte for byte */
inline equal_order_replace_message(order_replace_message_read, order_replace_message_written) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> assert(order_replace_message_read.nanoseconds[order_replace_message_at] == order_replace_message_written.nanoseconds[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> assert(order_replace_message_read.original_order_number[order_replace_message_at] == order_replace_message_written.original_order_number[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> assert(order_replace_message_read.new_order_number[order_replace_message_at] == order_replace_message_written.new_order_number[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> assert(order_replace_message_read.quantity[order_replace_message_at] == order_replace_message_written.quantity[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> assert(order_replace_message_read.price[order_replace_message_at] == order_replace_message_written.price[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Indicative Price Quantity Message: 29 bytes ----------------------------- */

/* Indicative price quantity message */
typedef IndicativePriceQuantityMessage {
  byte nanoseconds[4];
  byte theoretical_opening_quantity[8];
  byte orderbook[4];
  byte best_bid[4];
  byte best_offer[4];
  byte theoretical_opening_price[4];
  byte cross_type
};

int indicative_price_quantity_message_at;

/* every byte of Indicative Price Quantity Message set to one value */
inline fill_indicative_price_quantity_message(indicative_price_quantity_message_record, indicative_price_quantity_message_value) {
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> indicative_price_quantity_message_record.nanoseconds[indicative_price_quantity_message_at] = indicative_price_quantity_message_value; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> indicative_price_quantity_message_record.theoretical_opening_quantity[indicative_price_quantity_message_at] = indicative_price_quantity_message_value; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> indicative_price_quantity_message_record.orderbook[indicative_price_quantity_message_at] = indicative_price_quantity_message_value; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> indicative_price_quantity_message_record.best_bid[indicative_price_quantity_message_at] = indicative_price_quantity_message_value; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> indicative_price_quantity_message_record.best_offer[indicative_price_quantity_message_at] = indicative_price_quantity_message_value; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> indicative_price_quantity_message_record.theoretical_opening_price[indicative_price_quantity_message_at] = indicative_price_quantity_message_value; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_record.cross_type = indicative_price_quantity_message_value;
  skip
}

/* each byte of Indicative Price Quantity Message set to where it lies, so a field read out of place says so */
inline ramp_indicative_price_quantity_message(indicative_price_quantity_message_record, indicative_price_quantity_message_base) {
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> indicative_price_quantity_message_record.nanoseconds[indicative_price_quantity_message_at] = (indicative_price_quantity_message_base + 0 + indicative_price_quantity_message_at + 1) % 256; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> indicative_price_quantity_message_record.theoretical_opening_quantity[indicative_price_quantity_message_at] = (indicative_price_quantity_message_base + 4 + indicative_price_quantity_message_at + 1) % 256; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> indicative_price_quantity_message_record.orderbook[indicative_price_quantity_message_at] = (indicative_price_quantity_message_base + 12 + indicative_price_quantity_message_at + 1) % 256; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> indicative_price_quantity_message_record.best_bid[indicative_price_quantity_message_at] = (indicative_price_quantity_message_base + 16 + indicative_price_quantity_message_at + 1) % 256; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> indicative_price_quantity_message_record.best_offer[indicative_price_quantity_message_at] = (indicative_price_quantity_message_base + 20 + indicative_price_quantity_message_at + 1) % 256; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> indicative_price_quantity_message_record.theoretical_opening_price[indicative_price_quantity_message_at] = (indicative_price_quantity_message_base + 24 + indicative_price_quantity_message_at + 1) % 256; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_record.cross_type = (indicative_price_quantity_message_base + 28 + 1) % 256;
  skip
}

/* Indicative Price Quantity Message to the wire, 29 bytes from where the cursor stands */
inline encode_indicative_price_quantity_message(indicative_price_quantity_message_record) {
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> wire[at] = indicative_price_quantity_message_record.nanoseconds[indicative_price_quantity_message_at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> wire[at] = indicative_price_quantity_message_record.theoretical_opening_quantity[indicative_price_quantity_message_at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> wire[at] = indicative_price_quantity_message_record.orderbook[indicative_price_quantity_message_at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> wire[at] = indicative_price_quantity_message_record.best_bid[indicative_price_quantity_message_at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> wire[at] = indicative_price_quantity_message_record.best_offer[indicative_price_quantity_message_at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> wire[at] = indicative_price_quantity_message_record.theoretical_opening_price[indicative_price_quantity_message_at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  wire[at] = indicative_price_quantity_message_record.cross_type; at = at + 1;
  skip
}

/* Indicative Price Quantity Message off the wire, 29 bytes from where the cursor stands */
inline decode_indicative_price_quantity_message(indicative_price_quantity_message_record) {
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> indicative_price_quantity_message_record.nanoseconds[indicative_price_quantity_message_at] = wire[at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> indicative_price_quantity_message_record.theoretical_opening_quantity[indicative_price_quantity_message_at] = wire[at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> indicative_price_quantity_message_record.orderbook[indicative_price_quantity_message_at] = wire[at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> indicative_price_quantity_message_record.best_bid[indicative_price_quantity_message_at] = wire[at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> indicative_price_quantity_message_record.best_offer[indicative_price_quantity_message_at] = wire[at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> indicative_price_quantity_message_record.theoretical_opening_price[indicative_price_quantity_message_at] = wire[at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_record.cross_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Indicative Price Quantity Message is what was written, byte for byte */
inline equal_indicative_price_quantity_message(indicative_price_quantity_message_read, indicative_price_quantity_message_written) {
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> assert(indicative_price_quantity_message_read.nanoseconds[indicative_price_quantity_message_at] == indicative_price_quantity_message_written.nanoseconds[indicative_price_quantity_message_at]); indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> assert(indicative_price_quantity_message_read.theoretical_opening_quantity[indicative_price_quantity_message_at] == indicative_price_quantity_message_written.theoretical_opening_quantity[indicative_price_quantity_message_at]); indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> assert(indicative_price_quantity_message_read.orderbook[indicative_price_quantity_message_at] == indicative_price_quantity_message_written.orderbook[indicative_price_quantity_message_at]); indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> assert(indicative_price_quantity_message_read.best_bid[indicative_price_quantity_message_at] == indicative_price_quantity_message_written.best_bid[indicative_price_quantity_message_at]); indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> assert(indicative_price_quantity_message_read.best_offer[indicative_price_quantity_message_at] == indicative_price_quantity_message_written.best_offer[indicative_price_quantity_message_at]); indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> assert(indicative_price_quantity_message_read.theoretical_opening_price[indicative_price_quantity_message_at] == indicative_price_quantity_message_written.theoretical_opening_price[indicative_price_quantity_message_at]); indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  assert(indicative_price_quantity_message_read.cross_type == indicative_price_quantity_message_written.cross_type);
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
    assert(at == 99);
    at = 0;
    decode_orderbook_directory_message(orderbook_directory_message_got);
    assert(at == 99);
    equal_orderbook_directory_message(orderbook_directory_message_got, orderbook_directory_message_sent)
  }
}

/* Participant Directory Message: encoded, read back, and compared */
proctype check_participant_directory_message() {
  ParticipantDirectoryMessage participant_directory_message_sent;
  ParticipantDirectoryMessage participant_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_participant_directory_message(participant_directory_message_sent, 0)
  :: pattern == 1 -> fill_participant_directory_message(participant_directory_message_sent, 32)
  :: pattern == 2 -> fill_participant_directory_message(participant_directory_message_sent, 255)
  :: else -> ramp_participant_directory_message(participant_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_participant_directory_message(participant_directory_message_sent);
    assert(at == 20);
    at = 0;
    decode_participant_directory_message(participant_directory_message_got);
    assert(at == 20);
    equal_participant_directory_message(participant_directory_message_got, participant_directory_message_sent)
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

/* Orderbook Reference Price Message: encoded, read back, and compared */
proctype check_orderbook_reference_price_message() {
  OrderbookReferencePriceMessage orderbook_reference_price_message_sent;
  OrderbookReferencePriceMessage orderbook_reference_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_orderbook_reference_price_message(orderbook_reference_price_message_sent, 0)
  :: pattern == 1 -> fill_orderbook_reference_price_message(orderbook_reference_price_message_sent, 32)
  :: pattern == 2 -> fill_orderbook_reference_price_message(orderbook_reference_price_message_sent, 255)
  :: else -> ramp_orderbook_reference_price_message(orderbook_reference_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_orderbook_reference_price_message(orderbook_reference_price_message_sent);
    assert(at == 14);
    at = 0;
    decode_orderbook_reference_price_message(orderbook_reference_price_message_got);
    assert(at == 14);
    equal_orderbook_reference_price_message(orderbook_reference_price_message_got, orderbook_reference_price_message_sent)
  }
}

/* Add Order Message: encoded, read back, and compared */
proctype check_add_order_message() {
  AddOrderMessage add_order_message_sent;
  AddOrderMessage add_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_message(add_order_message_sent, 0)
  :: pattern == 1 -> fill_add_order_message(add_order_message_sent, 32)
  :: pattern == 2 -> fill_add_order_message(add_order_message_sent, 255)
  :: else -> ramp_add_order_message(add_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_message(add_order_message_sent);
    assert(at == 33);
    at = 0;
    decode_add_order_message(add_order_message_got);
    assert(at == 33);
    equal_add_order_message(add_order_message_got, add_order_message_sent)
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
    assert(at == 34);
    at = 0;
    decode_order_executed_message(order_executed_message_got);
    assert(at == 34);
    equal_order_executed_message(order_executed_message_got, order_executed_message_sent)
  }
}

/* Order Executed With Price Message: encoded, read back, and compared */
proctype check_order_executed_with_price_message() {
  OrderExecutedWithPriceMessage order_executed_with_price_message_sent;
  OrderExecutedWithPriceMessage order_executed_with_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_executed_with_price_message(order_executed_with_price_message_sent, 0)
  :: pattern == 1 -> fill_order_executed_with_price_message(order_executed_with_price_message_sent, 32)
  :: pattern == 2 -> fill_order_executed_with_price_message(order_executed_with_price_message_sent, 255)
  :: else -> ramp_order_executed_with_price_message(order_executed_with_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_executed_with_price_message(order_executed_with_price_message_sent);
    assert(at == 39);
    at = 0;
    decode_order_executed_with_price_message(order_executed_with_price_message_got);
    assert(at == 39);
    equal_order_executed_with_price_message(order_executed_with_price_message_got, order_executed_with_price_message_sent)
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
    assert(at == 39);
    at = 0;
    decode_trade_message(trade_message_got);
    assert(at == 39);
    equal_trade_message(trade_message_got, trade_message_sent)
  }
}

/* Broken Trade Message: encoded, read back, and compared */
proctype check_broken_trade_message() {
  BrokenTradeMessage broken_trade_message_sent;
  BrokenTradeMessage broken_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_broken_trade_message(broken_trade_message_sent, 0)
  :: pattern == 1 -> fill_broken_trade_message(broken_trade_message_sent, 32)
  :: pattern == 2 -> fill_broken_trade_message(broken_trade_message_sent, 255)
  :: else -> ramp_broken_trade_message(broken_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_broken_trade_message(broken_trade_message_sent);
    assert(at == 13);
    at = 0;
    decode_broken_trade_message(broken_trade_message_got);
    assert(at == 13);
    equal_broken_trade_message(broken_trade_message_got, broken_trade_message_sent)
  }
}

/* Order Delete Message: encoded, read back, and compared */
proctype check_order_delete_message() {
  OrderDeleteMessage order_delete_message_sent;
  OrderDeleteMessage order_delete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_delete_message(order_delete_message_sent, 0)
  :: pattern == 1 -> fill_order_delete_message(order_delete_message_sent, 32)
  :: pattern == 2 -> fill_order_delete_message(order_delete_message_sent, 255)
  :: else -> ramp_order_delete_message(order_delete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_delete_message(order_delete_message_sent);
    assert(at == 12);
    at = 0;
    decode_order_delete_message(order_delete_message_got);
    assert(at == 12);
    equal_order_delete_message(order_delete_message_got, order_delete_message_sent)
  }
}

/* Order Replace Message: encoded, read back, and compared */
proctype check_order_replace_message() {
  OrderReplaceMessage order_replace_message_sent;
  OrderReplaceMessage order_replace_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_replace_message(order_replace_message_sent, 0)
  :: pattern == 1 -> fill_order_replace_message(order_replace_message_sent, 32)
  :: pattern == 2 -> fill_order_replace_message(order_replace_message_sent, 255)
  :: else -> ramp_order_replace_message(order_replace_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_replace_message(order_replace_message_sent);
    assert(at == 32);
    at = 0;
    decode_order_replace_message(order_replace_message_got);
    assert(at == 32);
    equal_order_replace_message(order_replace_message_got, order_replace_message_sent)
  }
}

/* Indicative Price Quantity Message: encoded, read back, and compared */
proctype check_indicative_price_quantity_message() {
  IndicativePriceQuantityMessage indicative_price_quantity_message_sent;
  IndicativePriceQuantityMessage indicative_price_quantity_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_indicative_price_quantity_message(indicative_price_quantity_message_sent, 0)
  :: pattern == 1 -> fill_indicative_price_quantity_message(indicative_price_quantity_message_sent, 32)
  :: pattern == 2 -> fill_indicative_price_quantity_message(indicative_price_quantity_message_sent, 255)
  :: else -> ramp_indicative_price_quantity_message(indicative_price_quantity_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_indicative_price_quantity_message(indicative_price_quantity_message_sent);
    assert(at == 29);
    at = 0;
    decode_indicative_price_quantity_message(indicative_price_quantity_message_got);
    assert(at == 29);
    equal_indicative_price_quantity_message(indicative_price_quantity_message_got, indicative_price_quantity_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_time_stamp_seconds_message()
  :: run check_system_event_message()
  :: run check_price_tick_size_message()
  :: run check_quantity_tick_size_message()
  :: run check_orderbook_directory_message()
  :: run check_participant_directory_message()
  :: run check_orderbook_trading_action_message()
  :: run check_orderbook_reference_price_message()
  :: run check_add_order_message()
  :: run check_order_executed_message()
  :: run check_order_executed_with_price_message()
  :: run check_trade_message()
  :: run check_broken_trade_message()
  :: run check_order_delete_message()
  :: run check_order_replace_message()
  :: run check_indicative_price_quantity_message()
  fi
}
