/*
 * Philippine Stock Exchange Pse Equities Itch Index
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

/* ---- Index Member Directory Message: 20 bytes -------------------------------- */

/* Index Member Directory Message. */
typedef IndexMemberDirectoryMessage {
  byte timestamp[4];
  byte index_orderbook[4];
  byte member_orderbook[4];
  byte index_member_weight[8]
};

int index_member_directory_message_at;

/* every byte of Index Member Directory Message set to one value */
inline fill_index_member_directory_message(index_member_directory_message_record, index_member_directory_message_value) {
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> index_member_directory_message_record.timestamp[index_member_directory_message_at] = index_member_directory_message_value; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> index_member_directory_message_record.index_orderbook[index_member_directory_message_at] = index_member_directory_message_value; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> index_member_directory_message_record.member_orderbook[index_member_directory_message_at] = index_member_directory_message_value; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 8 -> index_member_directory_message_record.index_member_weight[index_member_directory_message_at] = index_member_directory_message_value; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Index Member Directory Message set to where it lies, so a field read out of place says so */
inline ramp_index_member_directory_message(index_member_directory_message_record, index_member_directory_message_base) {
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> index_member_directory_message_record.timestamp[index_member_directory_message_at] = (index_member_directory_message_base + 0 + index_member_directory_message_at + 1) % 256; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> index_member_directory_message_record.index_orderbook[index_member_directory_message_at] = (index_member_directory_message_base + 4 + index_member_directory_message_at + 1) % 256; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> index_member_directory_message_record.member_orderbook[index_member_directory_message_at] = (index_member_directory_message_base + 8 + index_member_directory_message_at + 1) % 256; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 8 -> index_member_directory_message_record.index_member_weight[index_member_directory_message_at] = (index_member_directory_message_base + 12 + index_member_directory_message_at + 1) % 256; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Member Directory Message to the wire, 20 bytes from where the cursor stands */
inline encode_index_member_directory_message(index_member_directory_message_record) {
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> wire[at] = index_member_directory_message_record.timestamp[index_member_directory_message_at]; at = at + 1; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> wire[at] = index_member_directory_message_record.index_orderbook[index_member_directory_message_at]; at = at + 1; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> wire[at] = index_member_directory_message_record.member_orderbook[index_member_directory_message_at]; at = at + 1; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 8 -> wire[at] = index_member_directory_message_record.index_member_weight[index_member_directory_message_at]; at = at + 1; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Member Directory Message off the wire, 20 bytes from where the cursor stands */
inline decode_index_member_directory_message(index_member_directory_message_record) {
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> index_member_directory_message_record.timestamp[index_member_directory_message_at] = wire[at]; at = at + 1; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> index_member_directory_message_record.index_orderbook[index_member_directory_message_at] = wire[at]; at = at + 1; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> index_member_directory_message_record.member_orderbook[index_member_directory_message_at] = wire[at]; at = at + 1; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 8 -> index_member_directory_message_record.index_member_weight[index_member_directory_message_at] = wire[at]; at = at + 1; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Index Member Directory Message is what was written, byte for byte */
inline equal_index_member_directory_message(index_member_directory_message_read, index_member_directory_message_written) {
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> assert(index_member_directory_message_read.timestamp[index_member_directory_message_at] == index_member_directory_message_written.timestamp[index_member_directory_message_at]); index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> assert(index_member_directory_message_read.index_orderbook[index_member_directory_message_at] == index_member_directory_message_written.index_orderbook[index_member_directory_message_at]); index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> assert(index_member_directory_message_read.member_orderbook[index_member_directory_message_at] == index_member_directory_message_written.member_orderbook[index_member_directory_message_at]); index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 8 -> assert(index_member_directory_message_read.index_member_weight[index_member_directory_message_at] == index_member_directory_message_written.index_member_weight[index_member_directory_message_at]); index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Index Value Message: 16 bytes ------------------------------------------- */

/* Index Value Message. */
typedef IndexValueMessage {
  byte timestamp[4];
  byte index_orderbook[4];
  byte value[8]
};

int index_value_message_at;

/* every byte of Index Value Message set to one value */
inline fill_index_value_message(index_value_message_record, index_value_message_value) {
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> index_value_message_record.timestamp[index_value_message_at] = index_value_message_value; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> index_value_message_record.index_orderbook[index_value_message_at] = index_value_message_value; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 8 -> index_value_message_record.value[index_value_message_at] = index_value_message_value; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Index Value Message set to where it lies, so a field read out of place says so */
inline ramp_index_value_message(index_value_message_record, index_value_message_base) {
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> index_value_message_record.timestamp[index_value_message_at] = (index_value_message_base + 0 + index_value_message_at + 1) % 256; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> index_value_message_record.index_orderbook[index_value_message_at] = (index_value_message_base + 4 + index_value_message_at + 1) % 256; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 8 -> index_value_message_record.value[index_value_message_at] = (index_value_message_base + 8 + index_value_message_at + 1) % 256; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Value Message to the wire, 16 bytes from where the cursor stands */
inline encode_index_value_message(index_value_message_record) {
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> wire[at] = index_value_message_record.timestamp[index_value_message_at]; at = at + 1; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> wire[at] = index_value_message_record.index_orderbook[index_value_message_at]; at = at + 1; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 8 -> wire[at] = index_value_message_record.value[index_value_message_at]; at = at + 1; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Value Message off the wire, 16 bytes from where the cursor stands */
inline decode_index_value_message(index_value_message_record) {
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> index_value_message_record.timestamp[index_value_message_at] = wire[at]; at = at + 1; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> index_value_message_record.index_orderbook[index_value_message_at] = wire[at]; at = at + 1; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 8 -> index_value_message_record.value[index_value_message_at] = wire[at]; at = at + 1; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Index Value Message is what was written, byte for byte */
inline equal_index_value_message(index_value_message_read, index_value_message_written) {
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> assert(index_value_message_read.timestamp[index_value_message_at] == index_value_message_written.timestamp[index_value_message_at]); index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> assert(index_value_message_read.index_orderbook[index_value_message_at] == index_value_message_written.index_orderbook[index_value_message_at]); index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 8 -> assert(index_value_message_read.value[index_value_message_at] == index_value_message_written.value[index_value_message_at]); index_value_message_at = index_value_message_at + 1
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

/* Index Member Directory Message: encoded, read back, and compared */
proctype check_index_member_directory_message() {
  IndexMemberDirectoryMessage index_member_directory_message_sent;
  IndexMemberDirectoryMessage index_member_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_member_directory_message(index_member_directory_message_sent, 0)
  :: pattern == 1 -> fill_index_member_directory_message(index_member_directory_message_sent, 32)
  :: pattern == 2 -> fill_index_member_directory_message(index_member_directory_message_sent, 255)
  :: else -> ramp_index_member_directory_message(index_member_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_member_directory_message(index_member_directory_message_sent);
    assert(at == 20);
    at = 0;
    decode_index_member_directory_message(index_member_directory_message_got);
    assert(at == 20);
    equal_index_member_directory_message(index_member_directory_message_got, index_member_directory_message_sent)
  }
}

/* Index Value Message: encoded, read back, and compared */
proctype check_index_value_message() {
  IndexValueMessage index_value_message_sent;
  IndexValueMessage index_value_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_value_message(index_value_message_sent, 0)
  :: pattern == 1 -> fill_index_value_message(index_value_message_sent, 32)
  :: pattern == 2 -> fill_index_value_message(index_value_message_sent, 255)
  :: else -> ramp_index_value_message(index_value_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_value_message(index_value_message_sent);
    assert(at == 16);
    at = 0;
    decode_index_value_message(index_value_message_got);
    assert(at == 16);
    equal_index_value_message(index_value_message_got, index_value_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_time_stamp_seconds_message()
  :: run check_system_event_message()
  :: run check_orderbook_directory_message()
  :: run check_index_member_directory_message()
  :: run check_index_value_message()
  fi
}
