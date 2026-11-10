/*
 * Giełda Papierów Wartościowych w Warszawie Warsaw Stock Exchange Order Book
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
 *   - a field filling what is left of what holds it
 *   - a run filling what frames it
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 60

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 16 bytes ------------------------------------------------- */

/* All messages are preceded by a common packet header format, which section 1.1 states for every Market Information message */
typedef PacketHeader {
  byte packet_length[2];
  byte packet_type[2];
  byte packet_sequence_number[4];
  byte send_time[4];
  byte service_id[2];
  byte delivery_flag;
  byte number_msg_entries
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_length[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_type[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.packet_sequence_number[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.send_time[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.service_id[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.delivery_flag = packet_header_value;
  packet_header_record.number_msg_entries = packet_header_value;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_length[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_type[packet_header_at] = (packet_header_base + 2 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.packet_sequence_number[packet_header_at] = (packet_header_base + 4 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.send_time[packet_header_at] = (packet_header_base + 8 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.service_id[packet_header_at] = (packet_header_base + 12 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.delivery_flag = (packet_header_base + 14 + 1) % 256;
  packet_header_record.number_msg_entries = (packet_header_base + 15 + 1) % 256;
  skip
}

/* Packet Header to the wire, 16 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.packet_length[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.packet_type[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.packet_sequence_number[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.send_time[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.service_id[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  wire[at] = packet_header_record.delivery_flag; at = at + 1;
  wire[at] = packet_header_record.number_msg_entries; at = at + 1;
  skip
}

/* Packet Header off the wire, 16 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_length[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_type[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.packet_sequence_number[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.send_time[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.service_id[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.delivery_flag = wire[at]; at = at + 1;
  packet_header_record.number_msg_entries = wire[at]; at = at + 1;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.packet_length[packet_header_at] == packet_header_written.packet_length[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.packet_type[packet_header_at] == packet_header_written.packet_type[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.packet_sequence_number[packet_header_at] == packet_header_written.packet_sequence_number[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.send_time[packet_header_at] == packet_header_written.send_time[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.service_id[packet_header_at] == packet_header_written.service_id[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  assert(packet_header_read.delivery_flag == packet_header_written.delivery_flag);
  assert(packet_header_read.number_msg_entries == packet_header_written.number_msg_entries);
  skip
}

/* ---- Message Header: 4 bytes ------------------------------------------------- */

typedef MessageHeader {
  byte message_size[2];
  byte message_type[2]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_size[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_size[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = (message_header_base + 2 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 4 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_size[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_type[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 4 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_size[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_size[message_header_at] == message_header_written.message_size[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_type[message_header_at] == message_header_written.message_type[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Update Market Sheet Message: 60 bytes ----------------------------- */

/* The Order update message generated by the trading engine UTP indicates the creation or modification of a line in the "market sheet" (a.k.a */
typedef OrderUpdateMarketSheetMessage {
  byte symbol_index[4];
  byte source_time[4];
  byte source_seq_num[4];
  byte price[4];
  byte aggregated_volume[4];
  byte volume[4];
  byte link_id[4];
  byte order_id[4];
  byte system_id[4];
  byte source_time_micro_secs[2];
  byte number_orders[2];
  byte side;
  byte order_type;
  byte action_type;
  byte price_scale_code;
  byte order_date[4];
  byte order_priority_date[4];
  byte order_priority_time[4];
  byte order_priority_micro_secs[2];
  byte order_origin;
  byte reserved_1
};

int order_update_market_sheet_message_at;

/* every byte of Order Update Market Sheet Message set to one value */
inline fill_order_update_market_sheet_message(order_update_market_sheet_message_record, order_update_market_sheet_message_value) {
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.symbol_index[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.source_time[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.source_seq_num[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.price[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.aggregated_volume[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.volume[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.link_id[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.order_id[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.system_id[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> order_update_market_sheet_message_record.source_time_micro_secs[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> order_update_market_sheet_message_record.number_orders[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_record.side = order_update_market_sheet_message_value;
  order_update_market_sheet_message_record.order_type = order_update_market_sheet_message_value;
  order_update_market_sheet_message_record.action_type = order_update_market_sheet_message_value;
  order_update_market_sheet_message_record.price_scale_code = order_update_market_sheet_message_value;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.order_date[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.order_priority_date[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.order_priority_time[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> order_update_market_sheet_message_record.order_priority_micro_secs[order_update_market_sheet_message_at] = order_update_market_sheet_message_value; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_record.order_origin = order_update_market_sheet_message_value;
  order_update_market_sheet_message_record.reserved_1 = order_update_market_sheet_message_value;
  skip
}

/* each byte of Order Update Market Sheet Message set to where it lies, so a field read out of place says so */
inline ramp_order_update_market_sheet_message(order_update_market_sheet_message_record, order_update_market_sheet_message_base) {
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.symbol_index[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 0 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.source_time[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 4 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.source_seq_num[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 8 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.price[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 12 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.aggregated_volume[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 16 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.volume[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 20 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.link_id[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 24 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.order_id[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 28 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.system_id[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 32 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> order_update_market_sheet_message_record.source_time_micro_secs[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 36 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> order_update_market_sheet_message_record.number_orders[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 38 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_record.side = (order_update_market_sheet_message_base + 40 + 1) % 256;
  order_update_market_sheet_message_record.order_type = (order_update_market_sheet_message_base + 41 + 1) % 256;
  order_update_market_sheet_message_record.action_type = (order_update_market_sheet_message_base + 42 + 1) % 256;
  order_update_market_sheet_message_record.price_scale_code = (order_update_market_sheet_message_base + 43 + 1) % 256;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.order_date[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 44 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.order_priority_date[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 48 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.order_priority_time[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 52 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> order_update_market_sheet_message_record.order_priority_micro_secs[order_update_market_sheet_message_at] = (order_update_market_sheet_message_base + 56 + order_update_market_sheet_message_at + 1) % 256; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_record.order_origin = (order_update_market_sheet_message_base + 58 + 1) % 256;
  order_update_market_sheet_message_record.reserved_1 = (order_update_market_sheet_message_base + 59 + 1) % 256;
  skip
}

/* Order Update Market Sheet Message to the wire, 60 bytes from where the cursor stands */
inline encode_order_update_market_sheet_message(order_update_market_sheet_message_record) {
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> wire[at] = order_update_market_sheet_message_record.symbol_index[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> wire[at] = order_update_market_sheet_message_record.source_time[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> wire[at] = order_update_market_sheet_message_record.source_seq_num[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> wire[at] = order_update_market_sheet_message_record.price[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> wire[at] = order_update_market_sheet_message_record.aggregated_volume[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> wire[at] = order_update_market_sheet_message_record.volume[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> wire[at] = order_update_market_sheet_message_record.link_id[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> wire[at] = order_update_market_sheet_message_record.order_id[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> wire[at] = order_update_market_sheet_message_record.system_id[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> wire[at] = order_update_market_sheet_message_record.source_time_micro_secs[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> wire[at] = order_update_market_sheet_message_record.number_orders[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  wire[at] = order_update_market_sheet_message_record.side; at = at + 1;
  wire[at] = order_update_market_sheet_message_record.order_type; at = at + 1;
  wire[at] = order_update_market_sheet_message_record.action_type; at = at + 1;
  wire[at] = order_update_market_sheet_message_record.price_scale_code; at = at + 1;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> wire[at] = order_update_market_sheet_message_record.order_date[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> wire[at] = order_update_market_sheet_message_record.order_priority_date[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> wire[at] = order_update_market_sheet_message_record.order_priority_time[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> wire[at] = order_update_market_sheet_message_record.order_priority_micro_secs[order_update_market_sheet_message_at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  wire[at] = order_update_market_sheet_message_record.order_origin; at = at + 1;
  wire[at] = order_update_market_sheet_message_record.reserved_1; at = at + 1;
  skip
}

/* Order Update Market Sheet Message off the wire, 60 bytes from where the cursor stands */
inline decode_order_update_market_sheet_message(order_update_market_sheet_message_record) {
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.symbol_index[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.source_time[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.source_seq_num[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.price[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.aggregated_volume[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.volume[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.link_id[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.order_id[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.system_id[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> order_update_market_sheet_message_record.source_time_micro_secs[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> order_update_market_sheet_message_record.number_orders[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_record.side = wire[at]; at = at + 1;
  order_update_market_sheet_message_record.order_type = wire[at]; at = at + 1;
  order_update_market_sheet_message_record.action_type = wire[at]; at = at + 1;
  order_update_market_sheet_message_record.price_scale_code = wire[at]; at = at + 1;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.order_date[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.order_priority_date[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> order_update_market_sheet_message_record.order_priority_time[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> order_update_market_sheet_message_record.order_priority_micro_secs[order_update_market_sheet_message_at] = wire[at]; at = at + 1; order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_record.order_origin = wire[at]; at = at + 1;
  order_update_market_sheet_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Update Market Sheet Message is what was written, byte for byte */
inline equal_order_update_market_sheet_message(order_update_market_sheet_message_read, order_update_market_sheet_message_written) {
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> assert(order_update_market_sheet_message_read.symbol_index[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.symbol_index[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> assert(order_update_market_sheet_message_read.source_time[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.source_time[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> assert(order_update_market_sheet_message_read.source_seq_num[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.source_seq_num[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> assert(order_update_market_sheet_message_read.price[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.price[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> assert(order_update_market_sheet_message_read.aggregated_volume[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.aggregated_volume[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> assert(order_update_market_sheet_message_read.volume[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.volume[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> assert(order_update_market_sheet_message_read.link_id[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.link_id[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> assert(order_update_market_sheet_message_read.order_id[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.order_id[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> assert(order_update_market_sheet_message_read.system_id[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.system_id[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> assert(order_update_market_sheet_message_read.source_time_micro_secs[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.source_time_micro_secs[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> assert(order_update_market_sheet_message_read.number_orders[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.number_orders[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  assert(order_update_market_sheet_message_read.side == order_update_market_sheet_message_written.side);
  assert(order_update_market_sheet_message_read.order_type == order_update_market_sheet_message_written.order_type);
  assert(order_update_market_sheet_message_read.action_type == order_update_market_sheet_message_written.action_type);
  assert(order_update_market_sheet_message_read.price_scale_code == order_update_market_sheet_message_written.price_scale_code);
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> assert(order_update_market_sheet_message_read.order_date[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.order_date[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> assert(order_update_market_sheet_message_read.order_priority_date[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.order_priority_date[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 4 -> assert(order_update_market_sheet_message_read.order_priority_time[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.order_priority_time[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  order_update_market_sheet_message_at = 0;
  do
  :: order_update_market_sheet_message_at < 2 -> assert(order_update_market_sheet_message_read.order_priority_micro_secs[order_update_market_sheet_message_at] == order_update_market_sheet_message_written.order_priority_micro_secs[order_update_market_sheet_message_at]); order_update_market_sheet_message_at = order_update_market_sheet_message_at + 1
  :: else -> break
  od;
  assert(order_update_market_sheet_message_read.order_origin == order_update_market_sheet_message_written.order_origin);
  assert(order_update_market_sheet_message_read.reserved_1 == order_update_market_sheet_message_written.reserved_1);
  skip
}

/* ---- Order Book Retransmission Delimiter Message: 12 bytes ------------------- */

/* The Orderbook retransmission delimiter message is set to clean then update the market sheet with the orders from previous days still remaining in the order book */
typedef OrderBookRetransmissionDelimiterMessage {
  byte source_time[4];
  byte source_seq_num[4];
  byte application_id[2];
  byte instance_num;
  byte retransmission_indicator
};

int order_book_retransmission_delimiter_message_at;

/* every byte of Order Book Retransmission Delimiter Message set to one value */
inline fill_order_book_retransmission_delimiter_message(order_book_retransmission_delimiter_message_record, order_book_retransmission_delimiter_message_value) {
  order_book_retransmission_delimiter_message_at = 0;
  do
  :: order_book_retransmission_delimiter_message_at < 4 -> order_book_retransmission_delimiter_message_record.source_time[order_book_retransmission_delimiter_message_at] = order_book_retransmission_delimiter_message_value; order_book_retransmission_delimiter_message_at = order_book_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  order_book_retransmission_delimiter_message_at = 0;
  do
  :: order_book_retransmission_delimiter_message_at < 4 -> order_book_retransmission_delimiter_message_record.source_seq_num[order_book_retransmission_delimiter_message_at] = order_book_retransmission_delimiter_message_value; order_book_retransmission_delimiter_message_at = order_book_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  order_book_retransmission_delimiter_message_at = 0;
  do
  :: order_book_retransmission_delimiter_message_at < 2 -> order_book_retransmission_delimiter_message_record.application_id[order_book_retransmission_delimiter_message_at] = order_book_retransmission_delimiter_message_value; order_book_retransmission_delimiter_message_at = order_book_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  order_book_retransmission_delimiter_message_record.instance_num = order_book_retransmission_delimiter_message_value;
  order_book_retransmission_delimiter_message_record.retransmission_indicator = order_book_retransmission_delimiter_message_value;
  skip
}

/* each byte of Order Book Retransmission Delimiter Message set to where it lies, so a field read out of place says so */
inline ramp_order_book_retransmission_delimiter_message(order_book_retransmission_delimiter_message_record, order_book_retransmission_delimiter_message_base) {
  order_book_retransmission_delimiter_message_at = 0;
  do
  :: order_book_retransmission_delimiter_message_at < 4 -> order_book_retransmission_delimiter_message_record.source_time[order_book_retransmission_delimiter_message_at] = (order_book_retransmission_delimiter_message_base + 0 + order_book_retransmission_delimiter_message_at + 1) % 256; order_book_retransmission_delimiter_message_at = order_book_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  order_book_retransmission_delimiter_message_at = 0;
  do
  :: order_book_retransmission_delimiter_message_at < 4 -> order_book_retransmission_delimiter_message_record.source_seq_num[order_book_retransmission_delimiter_message_at] = (order_book_retransmission_delimiter_message_base + 4 + order_book_retransmission_delimiter_message_at + 1) % 256; order_book_retransmission_delimiter_message_at = order_book_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  order_book_retransmission_delimiter_message_at = 0;
  do
  :: order_book_retransmission_delimiter_message_at < 2 -> order_book_retransmission_delimiter_message_record.application_id[order_book_retransmission_delimiter_message_at] = (order_book_retransmission_delimiter_message_base + 8 + order_book_retransmission_delimiter_message_at + 1) % 256; order_book_retransmission_delimiter_message_at = order_book_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  order_book_retransmission_delimiter_message_record.instance_num = (order_book_retransmission_delimiter_message_base + 10 + 1) % 256;
  order_book_retransmission_delimiter_message_record.retransmission_indicator = (order_book_retransmission_delimiter_message_base + 11 + 1) % 256;
  skip
}

/* Order Book Retransmission Delimiter Message to the wire, 12 bytes from where the cursor stands */
inline encode_order_book_retransmission_delimiter_message(order_book_retransmission_delimiter_message_record) {
  order_book_retransmission_delimiter_message_at = 0;
  do
  :: order_book_retransmission_delimiter_message_at < 4 -> wire[at] = order_book_retransmission_delimiter_message_record.source_time[order_book_retransmission_delimiter_message_at]; at = at + 1; order_book_retransmission_delimiter_message_at = order_book_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  order_book_retransmission_delimiter_message_at = 0;
  do
  :: order_book_retransmission_delimiter_message_at < 4 -> wire[at] = order_book_retransmission_delimiter_message_record.source_seq_num[order_book_retransmission_delimiter_message_at]; at = at + 1; order_book_retransmission_delimiter_message_at = order_book_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  order_book_retransmission_delimiter_message_at = 0;
  do
  :: order_book_retransmission_delimiter_message_at < 2 -> wire[at] = order_book_retransmission_delimiter_message_record.application_id[order_book_retransmission_delimiter_message_at]; at = at + 1; order_book_retransmission_delimiter_message_at = order_book_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  wire[at] = order_book_retransmission_delimiter_message_record.instance_num; at = at + 1;
  wire[at] = order_book_retransmission_delimiter_message_record.retransmission_indicator; at = at + 1;
  skip
}

/* Order Book Retransmission Delimiter Message off the wire, 12 bytes from where the cursor stands */
inline decode_order_book_retransmission_delimiter_message(order_book_retransmission_delimiter_message_record) {
  order_book_retransmission_delimiter_message_at = 0;
  do
  :: order_book_retransmission_delimiter_message_at < 4 -> order_book_retransmission_delimiter_message_record.source_time[order_book_retransmission_delimiter_message_at] = wire[at]; at = at + 1; order_book_retransmission_delimiter_message_at = order_book_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  order_book_retransmission_delimiter_message_at = 0;
  do
  :: order_book_retransmission_delimiter_message_at < 4 -> order_book_retransmission_delimiter_message_record.source_seq_num[order_book_retransmission_delimiter_message_at] = wire[at]; at = at + 1; order_book_retransmission_delimiter_message_at = order_book_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  order_book_retransmission_delimiter_message_at = 0;
  do
  :: order_book_retransmission_delimiter_message_at < 2 -> order_book_retransmission_delimiter_message_record.application_id[order_book_retransmission_delimiter_message_at] = wire[at]; at = at + 1; order_book_retransmission_delimiter_message_at = order_book_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  order_book_retransmission_delimiter_message_record.instance_num = wire[at]; at = at + 1;
  order_book_retransmission_delimiter_message_record.retransmission_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Book Retransmission Delimiter Message is what was written, byte for byte */
inline equal_order_book_retransmission_delimiter_message(order_book_retransmission_delimiter_message_read, order_book_retransmission_delimiter_message_written) {
  order_book_retransmission_delimiter_message_at = 0;
  do
  :: order_book_retransmission_delimiter_message_at < 4 -> assert(order_book_retransmission_delimiter_message_read.source_time[order_book_retransmission_delimiter_message_at] == order_book_retransmission_delimiter_message_written.source_time[order_book_retransmission_delimiter_message_at]); order_book_retransmission_delimiter_message_at = order_book_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  order_book_retransmission_delimiter_message_at = 0;
  do
  :: order_book_retransmission_delimiter_message_at < 4 -> assert(order_book_retransmission_delimiter_message_read.source_seq_num[order_book_retransmission_delimiter_message_at] == order_book_retransmission_delimiter_message_written.source_seq_num[order_book_retransmission_delimiter_message_at]); order_book_retransmission_delimiter_message_at = order_book_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  order_book_retransmission_delimiter_message_at = 0;
  do
  :: order_book_retransmission_delimiter_message_at < 2 -> assert(order_book_retransmission_delimiter_message_read.application_id[order_book_retransmission_delimiter_message_at] == order_book_retransmission_delimiter_message_written.application_id[order_book_retransmission_delimiter_message_at]); order_book_retransmission_delimiter_message_at = order_book_retransmission_delimiter_message_at + 1
  :: else -> break
  od;
  assert(order_book_retransmission_delimiter_message_read.instance_num == order_book_retransmission_delimiter_message_written.instance_num);
  assert(order_book_retransmission_delimiter_message_read.retransmission_indicator == order_book_retransmission_delimiter_message_written.retransmission_indicator);
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
    assert(at == 16);
    at = 0;
    decode_packet_header(packet_header_got);
    assert(at == 16);
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
    assert(at == 4);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 4);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Order Update Market Sheet Message: encoded, read back, and compared */
proctype check_order_update_market_sheet_message() {
  OrderUpdateMarketSheetMessage order_update_market_sheet_message_sent;
  OrderUpdateMarketSheetMessage order_update_market_sheet_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_update_market_sheet_message(order_update_market_sheet_message_sent, 0)
  :: pattern == 1 -> fill_order_update_market_sheet_message(order_update_market_sheet_message_sent, 32)
  :: pattern == 2 -> fill_order_update_market_sheet_message(order_update_market_sheet_message_sent, 255)
  :: else -> ramp_order_update_market_sheet_message(order_update_market_sheet_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_update_market_sheet_message(order_update_market_sheet_message_sent);
    assert(at == 60);
    at = 0;
    decode_order_update_market_sheet_message(order_update_market_sheet_message_got);
    assert(at == 60);
    equal_order_update_market_sheet_message(order_update_market_sheet_message_got, order_update_market_sheet_message_sent)
  }
}

/* Order Book Retransmission Delimiter Message: encoded, read back, and compared */
proctype check_order_book_retransmission_delimiter_message() {
  OrderBookRetransmissionDelimiterMessage order_book_retransmission_delimiter_message_sent;
  OrderBookRetransmissionDelimiterMessage order_book_retransmission_delimiter_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_book_retransmission_delimiter_message(order_book_retransmission_delimiter_message_sent, 0)
  :: pattern == 1 -> fill_order_book_retransmission_delimiter_message(order_book_retransmission_delimiter_message_sent, 32)
  :: pattern == 2 -> fill_order_book_retransmission_delimiter_message(order_book_retransmission_delimiter_message_sent, 255)
  :: else -> ramp_order_book_retransmission_delimiter_message(order_book_retransmission_delimiter_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_book_retransmission_delimiter_message(order_book_retransmission_delimiter_message_sent);
    assert(at == 12);
    at = 0;
    decode_order_book_retransmission_delimiter_message(order_book_retransmission_delimiter_message_got);
    assert(at == 12);
    equal_order_book_retransmission_delimiter_message(order_book_retransmission_delimiter_message_got, order_book_retransmission_delimiter_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_order_update_market_sheet_message()
  :: run check_order_book_retransmission_delimiter_message()
  fi
}
