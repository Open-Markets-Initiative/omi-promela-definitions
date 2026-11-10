/*
 * New York Stock Exchange Deep Feed
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
 *   - a run filling what frames it
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 56

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Send Time: 8 bytes ------------------------------------------------------ */

/* The time when this packet was published to the multicast channel */
typedef SendTime {
  byte seconds[4];
  byte nanoseconds[4]
};

int send_time_at;

/* every byte of Send Time set to one value */
inline fill_send_time(send_time_record, send_time_value) {
  send_time_at = 0;
  do
  :: send_time_at < 4 -> send_time_record.seconds[send_time_at] = send_time_value; send_time_at = send_time_at + 1
  :: else -> break
  od;
  send_time_at = 0;
  do
  :: send_time_at < 4 -> send_time_record.nanoseconds[send_time_at] = send_time_value; send_time_at = send_time_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Send Time set to where it lies, so a field read out of place says so */
inline ramp_send_time(send_time_record, send_time_base) {
  send_time_at = 0;
  do
  :: send_time_at < 4 -> send_time_record.seconds[send_time_at] = (send_time_base + 0 + send_time_at + 1) % 256; send_time_at = send_time_at + 1
  :: else -> break
  od;
  send_time_at = 0;
  do
  :: send_time_at < 4 -> send_time_record.nanoseconds[send_time_at] = (send_time_base + 4 + send_time_at + 1) % 256; send_time_at = send_time_at + 1
  :: else -> break
  od;
  skip
}

/* Send Time to the wire, 8 bytes from where the cursor stands */
inline encode_send_time(send_time_record) {
  send_time_at = 0;
  do
  :: send_time_at < 4 -> wire[at] = send_time_record.seconds[send_time_at]; at = at + 1; send_time_at = send_time_at + 1
  :: else -> break
  od;
  send_time_at = 0;
  do
  :: send_time_at < 4 -> wire[at] = send_time_record.nanoseconds[send_time_at]; at = at + 1; send_time_at = send_time_at + 1
  :: else -> break
  od;
  skip
}

/* Send Time off the wire, 8 bytes from where the cursor stands */
inline decode_send_time(send_time_record) {
  send_time_at = 0;
  do
  :: send_time_at < 4 -> send_time_record.seconds[send_time_at] = wire[at]; at = at + 1; send_time_at = send_time_at + 1
  :: else -> break
  od;
  send_time_at = 0;
  do
  :: send_time_at < 4 -> send_time_record.nanoseconds[send_time_at] = wire[at]; at = at + 1; send_time_at = send_time_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Send Time is what was written, byte for byte */
inline equal_send_time(send_time_read, send_time_written) {
  send_time_at = 0;
  do
  :: send_time_at < 4 -> assert(send_time_read.seconds[send_time_at] == send_time_written.seconds[send_time_at]); send_time_at = send_time_at + 1
  :: else -> break
  od;
  send_time_at = 0;
  do
  :: send_time_at < 4 -> assert(send_time_read.nanoseconds[send_time_at] == send_time_written.nanoseconds[send_time_at]); send_time_at = send_time_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Packet Header: 16 bytes ------------------------------------------------- */

typedef PacketHeader {
  byte packet_size[2];
  byte delivery_flag;
  byte message_count;
  byte sequence_number[4];
  SendTime send_time
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_size[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.delivery_flag = packet_header_value;
  packet_header_record.message_count = packet_header_value;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence_number[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  fill_send_time(packet_header_record.send_time, packet_header_value);
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_size[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.delivery_flag = (packet_header_base + 2 + 1) % 256;
  packet_header_record.message_count = (packet_header_base + 3 + 1) % 256;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence_number[packet_header_at] = (packet_header_base + 4 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  ramp_send_time(packet_header_record.send_time, packet_header_base + 8);
  skip
}

/* Packet Header to the wire, 16 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.packet_size[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  wire[at] = packet_header_record.delivery_flag; at = at + 1;
  wire[at] = packet_header_record.message_count; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.sequence_number[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  encode_send_time(packet_header_record.send_time);
  skip
}

/* Packet Header off the wire, 16 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_size[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.delivery_flag = wire[at]; at = at + 1;
  packet_header_record.message_count = wire[at]; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence_number[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  decode_send_time(packet_header_record.send_time);
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.packet_size[packet_header_at] == packet_header_written.packet_size[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  assert(packet_header_read.delivery_flag == packet_header_written.delivery_flag);
  assert(packet_header_read.message_count == packet_header_written.message_count);
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.sequence_number[packet_header_at] == packet_header_written.sequence_number[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  equal_send_time(packet_header_read.send_time, packet_header_written.send_time);
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

/* ---- Outright Market Depth Buy Message: 44 bytes ----------------------------- */

/* The Buy Market Depth message provides prices and aggregated volumes for each of the best three Buy levels. */
typedef OutrightMarketDepthBuyMessage {
  byte source_time[4];
  byte source_ns[4];
  byte series_index[4];
  byte symbol_seq_num[4];
  byte first_level_price[4];
  byte second_level_price[4];
  byte third_level_price[4];
  byte first_level_volume[2];
  byte second_level_volume[2];
  byte third_level_volume[2];
  byte quote_condition;
  byte reserved_1;
  byte first_level_customer_volume[2];
  byte second_level_customer_volume[2];
  byte third_level_customer_volume[2];
  byte reserved_2[2]
};

int outright_market_depth_buy_message_at;

/* every byte of Outright Market Depth Buy Message set to one value */
inline fill_outright_market_depth_buy_message(outright_market_depth_buy_message_record, outright_market_depth_buy_message_value) {
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> outright_market_depth_buy_message_record.source_time[outright_market_depth_buy_message_at] = outright_market_depth_buy_message_value; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> outright_market_depth_buy_message_record.source_ns[outright_market_depth_buy_message_at] = outright_market_depth_buy_message_value; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> outright_market_depth_buy_message_record.series_index[outright_market_depth_buy_message_at] = outright_market_depth_buy_message_value; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> outright_market_depth_buy_message_record.symbol_seq_num[outright_market_depth_buy_message_at] = outright_market_depth_buy_message_value; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> outright_market_depth_buy_message_record.first_level_price[outright_market_depth_buy_message_at] = outright_market_depth_buy_message_value; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> outright_market_depth_buy_message_record.second_level_price[outright_market_depth_buy_message_at] = outright_market_depth_buy_message_value; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> outright_market_depth_buy_message_record.third_level_price[outright_market_depth_buy_message_at] = outright_market_depth_buy_message_value; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> outright_market_depth_buy_message_record.first_level_volume[outright_market_depth_buy_message_at] = outright_market_depth_buy_message_value; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> outright_market_depth_buy_message_record.second_level_volume[outright_market_depth_buy_message_at] = outright_market_depth_buy_message_value; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> outright_market_depth_buy_message_record.third_level_volume[outright_market_depth_buy_message_at] = outright_market_depth_buy_message_value; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_record.quote_condition = outright_market_depth_buy_message_value;
  outright_market_depth_buy_message_record.reserved_1 = outright_market_depth_buy_message_value;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> outright_market_depth_buy_message_record.first_level_customer_volume[outright_market_depth_buy_message_at] = outright_market_depth_buy_message_value; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> outright_market_depth_buy_message_record.second_level_customer_volume[outright_market_depth_buy_message_at] = outright_market_depth_buy_message_value; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> outright_market_depth_buy_message_record.third_level_customer_volume[outright_market_depth_buy_message_at] = outright_market_depth_buy_message_value; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> outright_market_depth_buy_message_record.reserved_2[outright_market_depth_buy_message_at] = outright_market_depth_buy_message_value; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Outright Market Depth Buy Message set to where it lies, so a field read out of place says so */
inline ramp_outright_market_depth_buy_message(outright_market_depth_buy_message_record, outright_market_depth_buy_message_base) {
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> outright_market_depth_buy_message_record.source_time[outright_market_depth_buy_message_at] = (outright_market_depth_buy_message_base + 0 + outright_market_depth_buy_message_at + 1) % 256; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> outright_market_depth_buy_message_record.source_ns[outright_market_depth_buy_message_at] = (outright_market_depth_buy_message_base + 4 + outright_market_depth_buy_message_at + 1) % 256; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> outright_market_depth_buy_message_record.series_index[outright_market_depth_buy_message_at] = (outright_market_depth_buy_message_base + 8 + outright_market_depth_buy_message_at + 1) % 256; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> outright_market_depth_buy_message_record.symbol_seq_num[outright_market_depth_buy_message_at] = (outright_market_depth_buy_message_base + 12 + outright_market_depth_buy_message_at + 1) % 256; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> outright_market_depth_buy_message_record.first_level_price[outright_market_depth_buy_message_at] = (outright_market_depth_buy_message_base + 16 + outright_market_depth_buy_message_at + 1) % 256; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> outright_market_depth_buy_message_record.second_level_price[outright_market_depth_buy_message_at] = (outright_market_depth_buy_message_base + 20 + outright_market_depth_buy_message_at + 1) % 256; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> outright_market_depth_buy_message_record.third_level_price[outright_market_depth_buy_message_at] = (outright_market_depth_buy_message_base + 24 + outright_market_depth_buy_message_at + 1) % 256; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> outright_market_depth_buy_message_record.first_level_volume[outright_market_depth_buy_message_at] = (outright_market_depth_buy_message_base + 28 + outright_market_depth_buy_message_at + 1) % 256; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> outright_market_depth_buy_message_record.second_level_volume[outright_market_depth_buy_message_at] = (outright_market_depth_buy_message_base + 30 + outright_market_depth_buy_message_at + 1) % 256; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> outright_market_depth_buy_message_record.third_level_volume[outright_market_depth_buy_message_at] = (outright_market_depth_buy_message_base + 32 + outright_market_depth_buy_message_at + 1) % 256; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_record.quote_condition = (outright_market_depth_buy_message_base + 34 + 1) % 256;
  outright_market_depth_buy_message_record.reserved_1 = (outright_market_depth_buy_message_base + 35 + 1) % 256;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> outright_market_depth_buy_message_record.first_level_customer_volume[outright_market_depth_buy_message_at] = (outright_market_depth_buy_message_base + 36 + outright_market_depth_buy_message_at + 1) % 256; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> outright_market_depth_buy_message_record.second_level_customer_volume[outright_market_depth_buy_message_at] = (outright_market_depth_buy_message_base + 38 + outright_market_depth_buy_message_at + 1) % 256; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> outright_market_depth_buy_message_record.third_level_customer_volume[outright_market_depth_buy_message_at] = (outright_market_depth_buy_message_base + 40 + outright_market_depth_buy_message_at + 1) % 256; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> outright_market_depth_buy_message_record.reserved_2[outright_market_depth_buy_message_at] = (outright_market_depth_buy_message_base + 42 + outright_market_depth_buy_message_at + 1) % 256; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  skip
}

/* Outright Market Depth Buy Message to the wire, 44 bytes from where the cursor stands */
inline encode_outright_market_depth_buy_message(outright_market_depth_buy_message_record) {
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> wire[at] = outright_market_depth_buy_message_record.source_time[outright_market_depth_buy_message_at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> wire[at] = outright_market_depth_buy_message_record.source_ns[outright_market_depth_buy_message_at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> wire[at] = outright_market_depth_buy_message_record.series_index[outright_market_depth_buy_message_at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> wire[at] = outright_market_depth_buy_message_record.symbol_seq_num[outright_market_depth_buy_message_at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> wire[at] = outright_market_depth_buy_message_record.first_level_price[outright_market_depth_buy_message_at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> wire[at] = outright_market_depth_buy_message_record.second_level_price[outright_market_depth_buy_message_at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> wire[at] = outright_market_depth_buy_message_record.third_level_price[outright_market_depth_buy_message_at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> wire[at] = outright_market_depth_buy_message_record.first_level_volume[outright_market_depth_buy_message_at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> wire[at] = outright_market_depth_buy_message_record.second_level_volume[outright_market_depth_buy_message_at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> wire[at] = outright_market_depth_buy_message_record.third_level_volume[outright_market_depth_buy_message_at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  wire[at] = outright_market_depth_buy_message_record.quote_condition; at = at + 1;
  wire[at] = outright_market_depth_buy_message_record.reserved_1; at = at + 1;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> wire[at] = outright_market_depth_buy_message_record.first_level_customer_volume[outright_market_depth_buy_message_at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> wire[at] = outright_market_depth_buy_message_record.second_level_customer_volume[outright_market_depth_buy_message_at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> wire[at] = outright_market_depth_buy_message_record.third_level_customer_volume[outright_market_depth_buy_message_at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> wire[at] = outright_market_depth_buy_message_record.reserved_2[outright_market_depth_buy_message_at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  skip
}

/* Outright Market Depth Buy Message off the wire, 44 bytes from where the cursor stands */
inline decode_outright_market_depth_buy_message(outright_market_depth_buy_message_record) {
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> outright_market_depth_buy_message_record.source_time[outright_market_depth_buy_message_at] = wire[at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> outright_market_depth_buy_message_record.source_ns[outright_market_depth_buy_message_at] = wire[at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> outright_market_depth_buy_message_record.series_index[outright_market_depth_buy_message_at] = wire[at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> outright_market_depth_buy_message_record.symbol_seq_num[outright_market_depth_buy_message_at] = wire[at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> outright_market_depth_buy_message_record.first_level_price[outright_market_depth_buy_message_at] = wire[at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> outright_market_depth_buy_message_record.second_level_price[outright_market_depth_buy_message_at] = wire[at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> outright_market_depth_buy_message_record.third_level_price[outright_market_depth_buy_message_at] = wire[at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> outright_market_depth_buy_message_record.first_level_volume[outright_market_depth_buy_message_at] = wire[at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> outright_market_depth_buy_message_record.second_level_volume[outright_market_depth_buy_message_at] = wire[at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> outright_market_depth_buy_message_record.third_level_volume[outright_market_depth_buy_message_at] = wire[at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_record.quote_condition = wire[at]; at = at + 1;
  outright_market_depth_buy_message_record.reserved_1 = wire[at]; at = at + 1;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> outright_market_depth_buy_message_record.first_level_customer_volume[outright_market_depth_buy_message_at] = wire[at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> outright_market_depth_buy_message_record.second_level_customer_volume[outright_market_depth_buy_message_at] = wire[at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> outright_market_depth_buy_message_record.third_level_customer_volume[outright_market_depth_buy_message_at] = wire[at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> outright_market_depth_buy_message_record.reserved_2[outright_market_depth_buy_message_at] = wire[at]; at = at + 1; outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Outright Market Depth Buy Message is what was written, byte for byte */
inline equal_outright_market_depth_buy_message(outright_market_depth_buy_message_read, outright_market_depth_buy_message_written) {
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> assert(outright_market_depth_buy_message_read.source_time[outright_market_depth_buy_message_at] == outright_market_depth_buy_message_written.source_time[outright_market_depth_buy_message_at]); outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> assert(outright_market_depth_buy_message_read.source_ns[outright_market_depth_buy_message_at] == outright_market_depth_buy_message_written.source_ns[outright_market_depth_buy_message_at]); outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> assert(outright_market_depth_buy_message_read.series_index[outright_market_depth_buy_message_at] == outright_market_depth_buy_message_written.series_index[outright_market_depth_buy_message_at]); outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> assert(outright_market_depth_buy_message_read.symbol_seq_num[outright_market_depth_buy_message_at] == outright_market_depth_buy_message_written.symbol_seq_num[outright_market_depth_buy_message_at]); outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> assert(outright_market_depth_buy_message_read.first_level_price[outright_market_depth_buy_message_at] == outright_market_depth_buy_message_written.first_level_price[outright_market_depth_buy_message_at]); outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> assert(outright_market_depth_buy_message_read.second_level_price[outright_market_depth_buy_message_at] == outright_market_depth_buy_message_written.second_level_price[outright_market_depth_buy_message_at]); outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 4 -> assert(outright_market_depth_buy_message_read.third_level_price[outright_market_depth_buy_message_at] == outright_market_depth_buy_message_written.third_level_price[outright_market_depth_buy_message_at]); outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> assert(outright_market_depth_buy_message_read.first_level_volume[outright_market_depth_buy_message_at] == outright_market_depth_buy_message_written.first_level_volume[outright_market_depth_buy_message_at]); outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> assert(outright_market_depth_buy_message_read.second_level_volume[outright_market_depth_buy_message_at] == outright_market_depth_buy_message_written.second_level_volume[outright_market_depth_buy_message_at]); outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> assert(outright_market_depth_buy_message_read.third_level_volume[outright_market_depth_buy_message_at] == outright_market_depth_buy_message_written.third_level_volume[outright_market_depth_buy_message_at]); outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  assert(outright_market_depth_buy_message_read.quote_condition == outright_market_depth_buy_message_written.quote_condition);
  assert(outright_market_depth_buy_message_read.reserved_1 == outright_market_depth_buy_message_written.reserved_1);
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> assert(outright_market_depth_buy_message_read.first_level_customer_volume[outright_market_depth_buy_message_at] == outright_market_depth_buy_message_written.first_level_customer_volume[outright_market_depth_buy_message_at]); outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> assert(outright_market_depth_buy_message_read.second_level_customer_volume[outright_market_depth_buy_message_at] == outright_market_depth_buy_message_written.second_level_customer_volume[outright_market_depth_buy_message_at]); outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> assert(outright_market_depth_buy_message_read.third_level_customer_volume[outright_market_depth_buy_message_at] == outright_market_depth_buy_message_written.third_level_customer_volume[outright_market_depth_buy_message_at]); outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  outright_market_depth_buy_message_at = 0;
  do
  :: outright_market_depth_buy_message_at < 2 -> assert(outright_market_depth_buy_message_read.reserved_2[outright_market_depth_buy_message_at] == outright_market_depth_buy_message_written.reserved_2[outright_market_depth_buy_message_at]); outright_market_depth_buy_message_at = outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Outright Market Depth Sell Message: 44 bytes ---------------------------- */

/* The Sell Market Depth message provides prices and aggregated volumes for each of the best three Sell levels. */
typedef OutrightMarketDepthSellMessage {
  byte source_time[4];
  byte source_ns[4];
  byte series_index[4];
  byte symbol_seq_num[4];
  byte first_level_price[4];
  byte second_level_price[4];
  byte third_level_price[4];
  byte first_volume[2];
  byte second_volume[2];
  byte third_volume[2];
  byte quote_condition;
  byte reserved_1;
  byte first_level_customer_volume[2];
  byte second_level_customer_volume[2];
  byte third_level_customer_volume[2];
  byte reserved_2[2]
};

int outright_market_depth_sell_message_at;

/* every byte of Outright Market Depth Sell Message set to one value */
inline fill_outright_market_depth_sell_message(outright_market_depth_sell_message_record, outright_market_depth_sell_message_value) {
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> outright_market_depth_sell_message_record.source_time[outright_market_depth_sell_message_at] = outright_market_depth_sell_message_value; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> outright_market_depth_sell_message_record.source_ns[outright_market_depth_sell_message_at] = outright_market_depth_sell_message_value; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> outright_market_depth_sell_message_record.series_index[outright_market_depth_sell_message_at] = outright_market_depth_sell_message_value; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> outright_market_depth_sell_message_record.symbol_seq_num[outright_market_depth_sell_message_at] = outright_market_depth_sell_message_value; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> outright_market_depth_sell_message_record.first_level_price[outright_market_depth_sell_message_at] = outright_market_depth_sell_message_value; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> outright_market_depth_sell_message_record.second_level_price[outright_market_depth_sell_message_at] = outright_market_depth_sell_message_value; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> outright_market_depth_sell_message_record.third_level_price[outright_market_depth_sell_message_at] = outright_market_depth_sell_message_value; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> outright_market_depth_sell_message_record.first_volume[outright_market_depth_sell_message_at] = outright_market_depth_sell_message_value; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> outright_market_depth_sell_message_record.second_volume[outright_market_depth_sell_message_at] = outright_market_depth_sell_message_value; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> outright_market_depth_sell_message_record.third_volume[outright_market_depth_sell_message_at] = outright_market_depth_sell_message_value; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_record.quote_condition = outright_market_depth_sell_message_value;
  outright_market_depth_sell_message_record.reserved_1 = outright_market_depth_sell_message_value;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> outright_market_depth_sell_message_record.first_level_customer_volume[outright_market_depth_sell_message_at] = outright_market_depth_sell_message_value; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> outright_market_depth_sell_message_record.second_level_customer_volume[outright_market_depth_sell_message_at] = outright_market_depth_sell_message_value; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> outright_market_depth_sell_message_record.third_level_customer_volume[outright_market_depth_sell_message_at] = outright_market_depth_sell_message_value; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> outright_market_depth_sell_message_record.reserved_2[outright_market_depth_sell_message_at] = outright_market_depth_sell_message_value; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Outright Market Depth Sell Message set to where it lies, so a field read out of place says so */
inline ramp_outright_market_depth_sell_message(outright_market_depth_sell_message_record, outright_market_depth_sell_message_base) {
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> outright_market_depth_sell_message_record.source_time[outright_market_depth_sell_message_at] = (outright_market_depth_sell_message_base + 0 + outright_market_depth_sell_message_at + 1) % 256; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> outright_market_depth_sell_message_record.source_ns[outright_market_depth_sell_message_at] = (outright_market_depth_sell_message_base + 4 + outright_market_depth_sell_message_at + 1) % 256; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> outright_market_depth_sell_message_record.series_index[outright_market_depth_sell_message_at] = (outright_market_depth_sell_message_base + 8 + outright_market_depth_sell_message_at + 1) % 256; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> outright_market_depth_sell_message_record.symbol_seq_num[outright_market_depth_sell_message_at] = (outright_market_depth_sell_message_base + 12 + outright_market_depth_sell_message_at + 1) % 256; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> outright_market_depth_sell_message_record.first_level_price[outright_market_depth_sell_message_at] = (outright_market_depth_sell_message_base + 16 + outright_market_depth_sell_message_at + 1) % 256; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> outright_market_depth_sell_message_record.second_level_price[outright_market_depth_sell_message_at] = (outright_market_depth_sell_message_base + 20 + outright_market_depth_sell_message_at + 1) % 256; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> outright_market_depth_sell_message_record.third_level_price[outright_market_depth_sell_message_at] = (outright_market_depth_sell_message_base + 24 + outright_market_depth_sell_message_at + 1) % 256; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> outright_market_depth_sell_message_record.first_volume[outright_market_depth_sell_message_at] = (outright_market_depth_sell_message_base + 28 + outright_market_depth_sell_message_at + 1) % 256; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> outright_market_depth_sell_message_record.second_volume[outright_market_depth_sell_message_at] = (outright_market_depth_sell_message_base + 30 + outright_market_depth_sell_message_at + 1) % 256; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> outright_market_depth_sell_message_record.third_volume[outright_market_depth_sell_message_at] = (outright_market_depth_sell_message_base + 32 + outright_market_depth_sell_message_at + 1) % 256; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_record.quote_condition = (outright_market_depth_sell_message_base + 34 + 1) % 256;
  outright_market_depth_sell_message_record.reserved_1 = (outright_market_depth_sell_message_base + 35 + 1) % 256;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> outright_market_depth_sell_message_record.first_level_customer_volume[outright_market_depth_sell_message_at] = (outright_market_depth_sell_message_base + 36 + outright_market_depth_sell_message_at + 1) % 256; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> outright_market_depth_sell_message_record.second_level_customer_volume[outright_market_depth_sell_message_at] = (outright_market_depth_sell_message_base + 38 + outright_market_depth_sell_message_at + 1) % 256; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> outright_market_depth_sell_message_record.third_level_customer_volume[outright_market_depth_sell_message_at] = (outright_market_depth_sell_message_base + 40 + outright_market_depth_sell_message_at + 1) % 256; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> outright_market_depth_sell_message_record.reserved_2[outright_market_depth_sell_message_at] = (outright_market_depth_sell_message_base + 42 + outright_market_depth_sell_message_at + 1) % 256; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  skip
}

/* Outright Market Depth Sell Message to the wire, 44 bytes from where the cursor stands */
inline encode_outright_market_depth_sell_message(outright_market_depth_sell_message_record) {
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> wire[at] = outright_market_depth_sell_message_record.source_time[outright_market_depth_sell_message_at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> wire[at] = outright_market_depth_sell_message_record.source_ns[outright_market_depth_sell_message_at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> wire[at] = outright_market_depth_sell_message_record.series_index[outright_market_depth_sell_message_at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> wire[at] = outright_market_depth_sell_message_record.symbol_seq_num[outright_market_depth_sell_message_at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> wire[at] = outright_market_depth_sell_message_record.first_level_price[outright_market_depth_sell_message_at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> wire[at] = outright_market_depth_sell_message_record.second_level_price[outright_market_depth_sell_message_at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> wire[at] = outright_market_depth_sell_message_record.third_level_price[outright_market_depth_sell_message_at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> wire[at] = outright_market_depth_sell_message_record.first_volume[outright_market_depth_sell_message_at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> wire[at] = outright_market_depth_sell_message_record.second_volume[outright_market_depth_sell_message_at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> wire[at] = outright_market_depth_sell_message_record.third_volume[outright_market_depth_sell_message_at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  wire[at] = outright_market_depth_sell_message_record.quote_condition; at = at + 1;
  wire[at] = outright_market_depth_sell_message_record.reserved_1; at = at + 1;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> wire[at] = outright_market_depth_sell_message_record.first_level_customer_volume[outright_market_depth_sell_message_at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> wire[at] = outright_market_depth_sell_message_record.second_level_customer_volume[outright_market_depth_sell_message_at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> wire[at] = outright_market_depth_sell_message_record.third_level_customer_volume[outright_market_depth_sell_message_at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> wire[at] = outright_market_depth_sell_message_record.reserved_2[outright_market_depth_sell_message_at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  skip
}

/* Outright Market Depth Sell Message off the wire, 44 bytes from where the cursor stands */
inline decode_outright_market_depth_sell_message(outright_market_depth_sell_message_record) {
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> outright_market_depth_sell_message_record.source_time[outright_market_depth_sell_message_at] = wire[at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> outright_market_depth_sell_message_record.source_ns[outright_market_depth_sell_message_at] = wire[at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> outright_market_depth_sell_message_record.series_index[outright_market_depth_sell_message_at] = wire[at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> outright_market_depth_sell_message_record.symbol_seq_num[outright_market_depth_sell_message_at] = wire[at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> outright_market_depth_sell_message_record.first_level_price[outright_market_depth_sell_message_at] = wire[at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> outright_market_depth_sell_message_record.second_level_price[outright_market_depth_sell_message_at] = wire[at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> outright_market_depth_sell_message_record.third_level_price[outright_market_depth_sell_message_at] = wire[at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> outright_market_depth_sell_message_record.first_volume[outright_market_depth_sell_message_at] = wire[at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> outright_market_depth_sell_message_record.second_volume[outright_market_depth_sell_message_at] = wire[at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> outright_market_depth_sell_message_record.third_volume[outright_market_depth_sell_message_at] = wire[at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_record.quote_condition = wire[at]; at = at + 1;
  outright_market_depth_sell_message_record.reserved_1 = wire[at]; at = at + 1;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> outright_market_depth_sell_message_record.first_level_customer_volume[outright_market_depth_sell_message_at] = wire[at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> outright_market_depth_sell_message_record.second_level_customer_volume[outright_market_depth_sell_message_at] = wire[at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> outright_market_depth_sell_message_record.third_level_customer_volume[outright_market_depth_sell_message_at] = wire[at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> outright_market_depth_sell_message_record.reserved_2[outright_market_depth_sell_message_at] = wire[at]; at = at + 1; outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Outright Market Depth Sell Message is what was written, byte for byte */
inline equal_outright_market_depth_sell_message(outright_market_depth_sell_message_read, outright_market_depth_sell_message_written) {
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> assert(outright_market_depth_sell_message_read.source_time[outright_market_depth_sell_message_at] == outright_market_depth_sell_message_written.source_time[outright_market_depth_sell_message_at]); outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> assert(outright_market_depth_sell_message_read.source_ns[outright_market_depth_sell_message_at] == outright_market_depth_sell_message_written.source_ns[outright_market_depth_sell_message_at]); outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> assert(outright_market_depth_sell_message_read.series_index[outright_market_depth_sell_message_at] == outright_market_depth_sell_message_written.series_index[outright_market_depth_sell_message_at]); outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> assert(outright_market_depth_sell_message_read.symbol_seq_num[outright_market_depth_sell_message_at] == outright_market_depth_sell_message_written.symbol_seq_num[outright_market_depth_sell_message_at]); outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> assert(outright_market_depth_sell_message_read.first_level_price[outright_market_depth_sell_message_at] == outright_market_depth_sell_message_written.first_level_price[outright_market_depth_sell_message_at]); outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> assert(outright_market_depth_sell_message_read.second_level_price[outright_market_depth_sell_message_at] == outright_market_depth_sell_message_written.second_level_price[outright_market_depth_sell_message_at]); outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 4 -> assert(outright_market_depth_sell_message_read.third_level_price[outright_market_depth_sell_message_at] == outright_market_depth_sell_message_written.third_level_price[outright_market_depth_sell_message_at]); outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> assert(outright_market_depth_sell_message_read.first_volume[outright_market_depth_sell_message_at] == outright_market_depth_sell_message_written.first_volume[outright_market_depth_sell_message_at]); outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> assert(outright_market_depth_sell_message_read.second_volume[outright_market_depth_sell_message_at] == outright_market_depth_sell_message_written.second_volume[outright_market_depth_sell_message_at]); outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> assert(outright_market_depth_sell_message_read.third_volume[outright_market_depth_sell_message_at] == outright_market_depth_sell_message_written.third_volume[outright_market_depth_sell_message_at]); outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  assert(outright_market_depth_sell_message_read.quote_condition == outright_market_depth_sell_message_written.quote_condition);
  assert(outright_market_depth_sell_message_read.reserved_1 == outright_market_depth_sell_message_written.reserved_1);
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> assert(outright_market_depth_sell_message_read.first_level_customer_volume[outright_market_depth_sell_message_at] == outright_market_depth_sell_message_written.first_level_customer_volume[outright_market_depth_sell_message_at]); outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> assert(outright_market_depth_sell_message_read.second_level_customer_volume[outright_market_depth_sell_message_at] == outright_market_depth_sell_message_written.second_level_customer_volume[outright_market_depth_sell_message_at]); outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> assert(outright_market_depth_sell_message_read.third_level_customer_volume[outright_market_depth_sell_message_at] == outright_market_depth_sell_message_written.third_level_customer_volume[outright_market_depth_sell_message_at]); outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  outright_market_depth_sell_message_at = 0;
  do
  :: outright_market_depth_sell_message_at < 2 -> assert(outright_market_depth_sell_message_read.reserved_2[outright_market_depth_sell_message_at] == outright_market_depth_sell_message_written.reserved_2[outright_market_depth_sell_message_at]); outright_market_depth_sell_message_at = outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Underlying Status Message: 20 bytes ------------------------------------- */

/* The Underlying Status message is used to inform the subscribers of changes in the status of an Underlying symbol. */
typedef UnderlyingStatusMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte underlying_index[4];
  byte underlying_seq_num[4];
  byte security_status;
  byte halt_condition;
  byte reserved_2[2]
};

int underlying_status_message_at;

/* every byte of Underlying Status Message set to one value */
inline fill_underlying_status_message(underlying_status_message_record, underlying_status_message_value) {
  underlying_status_message_at = 0;
  do
  :: underlying_status_message_at < 4 -> underlying_status_message_record.source_time[underlying_status_message_at] = underlying_status_message_value; underlying_status_message_at = underlying_status_message_at + 1
  :: else -> break
  od;
  underlying_status_message_at = 0;
  do
  :: underlying_status_message_at < 4 -> underlying_status_message_record.source_time_ns[underlying_status_message_at] = underlying_status_message_value; underlying_status_message_at = underlying_status_message_at + 1
  :: else -> break
  od;
  underlying_status_message_at = 0;
  do
  :: underlying_status_message_at < 4 -> underlying_status_message_record.underlying_index[underlying_status_message_at] = underlying_status_message_value; underlying_status_message_at = underlying_status_message_at + 1
  :: else -> break
  od;
  underlying_status_message_at = 0;
  do
  :: underlying_status_message_at < 4 -> underlying_status_message_record.underlying_seq_num[underlying_status_message_at] = underlying_status_message_value; underlying_status_message_at = underlying_status_message_at + 1
  :: else -> break
  od;
  underlying_status_message_record.security_status = underlying_status_message_value;
  underlying_status_message_record.halt_condition = underlying_status_message_value;
  underlying_status_message_at = 0;
  do
  :: underlying_status_message_at < 2 -> underlying_status_message_record.reserved_2[underlying_status_message_at] = underlying_status_message_value; underlying_status_message_at = underlying_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Underlying Status Message set to where it lies, so a field read out of place says so */
inline ramp_underlying_status_message(underlying_status_message_record, underlying_status_message_base) {
  underlying_status_message_at = 0;
  do
  :: underlying_status_message_at < 4 -> underlying_status_message_record.source_time[underlying_status_message_at] = (underlying_status_message_base + 0 + underlying_status_message_at + 1) % 256; underlying_status_message_at = underlying_status_message_at + 1
  :: else -> break
  od;
  underlying_status_message_at = 0;
  do
  :: underlying_status_message_at < 4 -> underlying_status_message_record.source_time_ns[underlying_status_message_at] = (underlying_status_message_base + 4 + underlying_status_message_at + 1) % 256; underlying_status_message_at = underlying_status_message_at + 1
  :: else -> break
  od;
  underlying_status_message_at = 0;
  do
  :: underlying_status_message_at < 4 -> underlying_status_message_record.underlying_index[underlying_status_message_at] = (underlying_status_message_base + 8 + underlying_status_message_at + 1) % 256; underlying_status_message_at = underlying_status_message_at + 1
  :: else -> break
  od;
  underlying_status_message_at = 0;
  do
  :: underlying_status_message_at < 4 -> underlying_status_message_record.underlying_seq_num[underlying_status_message_at] = (underlying_status_message_base + 12 + underlying_status_message_at + 1) % 256; underlying_status_message_at = underlying_status_message_at + 1
  :: else -> break
  od;
  underlying_status_message_record.security_status = (underlying_status_message_base + 16 + 1) % 256;
  underlying_status_message_record.halt_condition = (underlying_status_message_base + 17 + 1) % 256;
  underlying_status_message_at = 0;
  do
  :: underlying_status_message_at < 2 -> underlying_status_message_record.reserved_2[underlying_status_message_at] = (underlying_status_message_base + 18 + underlying_status_message_at + 1) % 256; underlying_status_message_at = underlying_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Underlying Status Message to the wire, 20 bytes from where the cursor stands */
inline encode_underlying_status_message(underlying_status_message_record) {
  underlying_status_message_at = 0;
  do
  :: underlying_status_message_at < 4 -> wire[at] = underlying_status_message_record.source_time[underlying_status_message_at]; at = at + 1; underlying_status_message_at = underlying_status_message_at + 1
  :: else -> break
  od;
  underlying_status_message_at = 0;
  do
  :: underlying_status_message_at < 4 -> wire[at] = underlying_status_message_record.source_time_ns[underlying_status_message_at]; at = at + 1; underlying_status_message_at = underlying_status_message_at + 1
  :: else -> break
  od;
  underlying_status_message_at = 0;
  do
  :: underlying_status_message_at < 4 -> wire[at] = underlying_status_message_record.underlying_index[underlying_status_message_at]; at = at + 1; underlying_status_message_at = underlying_status_message_at + 1
  :: else -> break
  od;
  underlying_status_message_at = 0;
  do
  :: underlying_status_message_at < 4 -> wire[at] = underlying_status_message_record.underlying_seq_num[underlying_status_message_at]; at = at + 1; underlying_status_message_at = underlying_status_message_at + 1
  :: else -> break
  od;
  wire[at] = underlying_status_message_record.security_status; at = at + 1;
  wire[at] = underlying_status_message_record.halt_condition; at = at + 1;
  underlying_status_message_at = 0;
  do
  :: underlying_status_message_at < 2 -> wire[at] = underlying_status_message_record.reserved_2[underlying_status_message_at]; at = at + 1; underlying_status_message_at = underlying_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Underlying Status Message off the wire, 20 bytes from where the cursor stands */
inline decode_underlying_status_message(underlying_status_message_record) {
  underlying_status_message_at = 0;
  do
  :: underlying_status_message_at < 4 -> underlying_status_message_record.source_time[underlying_status_message_at] = wire[at]; at = at + 1; underlying_status_message_at = underlying_status_message_at + 1
  :: else -> break
  od;
  underlying_status_message_at = 0;
  do
  :: underlying_status_message_at < 4 -> underlying_status_message_record.source_time_ns[underlying_status_message_at] = wire[at]; at = at + 1; underlying_status_message_at = underlying_status_message_at + 1
  :: else -> break
  od;
  underlying_status_message_at = 0;
  do
  :: underlying_status_message_at < 4 -> underlying_status_message_record.underlying_index[underlying_status_message_at] = wire[at]; at = at + 1; underlying_status_message_at = underlying_status_message_at + 1
  :: else -> break
  od;
  underlying_status_message_at = 0;
  do
  :: underlying_status_message_at < 4 -> underlying_status_message_record.underlying_seq_num[underlying_status_message_at] = wire[at]; at = at + 1; underlying_status_message_at = underlying_status_message_at + 1
  :: else -> break
  od;
  underlying_status_message_record.security_status = wire[at]; at = at + 1;
  underlying_status_message_record.halt_condition = wire[at]; at = at + 1;
  underlying_status_message_at = 0;
  do
  :: underlying_status_message_at < 2 -> underlying_status_message_record.reserved_2[underlying_status_message_at] = wire[at]; at = at + 1; underlying_status_message_at = underlying_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Underlying Status Message is what was written, byte for byte */
inline equal_underlying_status_message(underlying_status_message_read, underlying_status_message_written) {
  underlying_status_message_at = 0;
  do
  :: underlying_status_message_at < 4 -> assert(underlying_status_message_read.source_time[underlying_status_message_at] == underlying_status_message_written.source_time[underlying_status_message_at]); underlying_status_message_at = underlying_status_message_at + 1
  :: else -> break
  od;
  underlying_status_message_at = 0;
  do
  :: underlying_status_message_at < 4 -> assert(underlying_status_message_read.source_time_ns[underlying_status_message_at] == underlying_status_message_written.source_time_ns[underlying_status_message_at]); underlying_status_message_at = underlying_status_message_at + 1
  :: else -> break
  od;
  underlying_status_message_at = 0;
  do
  :: underlying_status_message_at < 4 -> assert(underlying_status_message_read.underlying_index[underlying_status_message_at] == underlying_status_message_written.underlying_index[underlying_status_message_at]); underlying_status_message_at = underlying_status_message_at + 1
  :: else -> break
  od;
  underlying_status_message_at = 0;
  do
  :: underlying_status_message_at < 4 -> assert(underlying_status_message_read.underlying_seq_num[underlying_status_message_at] == underlying_status_message_written.underlying_seq_num[underlying_status_message_at]); underlying_status_message_at = underlying_status_message_at + 1
  :: else -> break
  od;
  assert(underlying_status_message_read.security_status == underlying_status_message_written.security_status);
  assert(underlying_status_message_read.halt_condition == underlying_status_message_written.halt_condition);
  underlying_status_message_at = 0;
  do
  :: underlying_status_message_at < 2 -> assert(underlying_status_message_read.reserved_2[underlying_status_message_at] == underlying_status_message_written.reserved_2[underlying_status_message_at]); underlying_status_message_at = underlying_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Outright Series Status Message: 20 bytes -------------------------------- */

/* The Series Status message is used to inform the subscribers of changes in symbol status of an outright symbol. */
typedef OutrightSeriesStatusMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte series_index[4];
  byte symbol_seq_num[4];
  byte security_status;
  byte halt_condition;
  byte reserved_2[2]
};

int outright_series_status_message_at;

/* every byte of Outright Series Status Message set to one value */
inline fill_outright_series_status_message(outright_series_status_message_record, outright_series_status_message_value) {
  outright_series_status_message_at = 0;
  do
  :: outright_series_status_message_at < 4 -> outright_series_status_message_record.source_time[outright_series_status_message_at] = outright_series_status_message_value; outright_series_status_message_at = outright_series_status_message_at + 1
  :: else -> break
  od;
  outright_series_status_message_at = 0;
  do
  :: outright_series_status_message_at < 4 -> outright_series_status_message_record.source_time_ns[outright_series_status_message_at] = outright_series_status_message_value; outright_series_status_message_at = outright_series_status_message_at + 1
  :: else -> break
  od;
  outright_series_status_message_at = 0;
  do
  :: outright_series_status_message_at < 4 -> outright_series_status_message_record.series_index[outright_series_status_message_at] = outright_series_status_message_value; outright_series_status_message_at = outright_series_status_message_at + 1
  :: else -> break
  od;
  outright_series_status_message_at = 0;
  do
  :: outright_series_status_message_at < 4 -> outright_series_status_message_record.symbol_seq_num[outright_series_status_message_at] = outright_series_status_message_value; outright_series_status_message_at = outright_series_status_message_at + 1
  :: else -> break
  od;
  outright_series_status_message_record.security_status = outright_series_status_message_value;
  outright_series_status_message_record.halt_condition = outright_series_status_message_value;
  outright_series_status_message_at = 0;
  do
  :: outright_series_status_message_at < 2 -> outright_series_status_message_record.reserved_2[outright_series_status_message_at] = outright_series_status_message_value; outright_series_status_message_at = outright_series_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Outright Series Status Message set to where it lies, so a field read out of place says so */
inline ramp_outright_series_status_message(outright_series_status_message_record, outright_series_status_message_base) {
  outright_series_status_message_at = 0;
  do
  :: outright_series_status_message_at < 4 -> outright_series_status_message_record.source_time[outright_series_status_message_at] = (outright_series_status_message_base + 0 + outright_series_status_message_at + 1) % 256; outright_series_status_message_at = outright_series_status_message_at + 1
  :: else -> break
  od;
  outright_series_status_message_at = 0;
  do
  :: outright_series_status_message_at < 4 -> outright_series_status_message_record.source_time_ns[outright_series_status_message_at] = (outright_series_status_message_base + 4 + outright_series_status_message_at + 1) % 256; outright_series_status_message_at = outright_series_status_message_at + 1
  :: else -> break
  od;
  outright_series_status_message_at = 0;
  do
  :: outright_series_status_message_at < 4 -> outright_series_status_message_record.series_index[outright_series_status_message_at] = (outright_series_status_message_base + 8 + outright_series_status_message_at + 1) % 256; outright_series_status_message_at = outright_series_status_message_at + 1
  :: else -> break
  od;
  outright_series_status_message_at = 0;
  do
  :: outright_series_status_message_at < 4 -> outright_series_status_message_record.symbol_seq_num[outright_series_status_message_at] = (outright_series_status_message_base + 12 + outright_series_status_message_at + 1) % 256; outright_series_status_message_at = outright_series_status_message_at + 1
  :: else -> break
  od;
  outright_series_status_message_record.security_status = (outright_series_status_message_base + 16 + 1) % 256;
  outright_series_status_message_record.halt_condition = (outright_series_status_message_base + 17 + 1) % 256;
  outright_series_status_message_at = 0;
  do
  :: outright_series_status_message_at < 2 -> outright_series_status_message_record.reserved_2[outright_series_status_message_at] = (outright_series_status_message_base + 18 + outright_series_status_message_at + 1) % 256; outright_series_status_message_at = outright_series_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Outright Series Status Message to the wire, 20 bytes from where the cursor stands */
inline encode_outright_series_status_message(outright_series_status_message_record) {
  outright_series_status_message_at = 0;
  do
  :: outright_series_status_message_at < 4 -> wire[at] = outright_series_status_message_record.source_time[outright_series_status_message_at]; at = at + 1; outright_series_status_message_at = outright_series_status_message_at + 1
  :: else -> break
  od;
  outright_series_status_message_at = 0;
  do
  :: outright_series_status_message_at < 4 -> wire[at] = outright_series_status_message_record.source_time_ns[outright_series_status_message_at]; at = at + 1; outright_series_status_message_at = outright_series_status_message_at + 1
  :: else -> break
  od;
  outright_series_status_message_at = 0;
  do
  :: outright_series_status_message_at < 4 -> wire[at] = outright_series_status_message_record.series_index[outright_series_status_message_at]; at = at + 1; outright_series_status_message_at = outright_series_status_message_at + 1
  :: else -> break
  od;
  outright_series_status_message_at = 0;
  do
  :: outright_series_status_message_at < 4 -> wire[at] = outright_series_status_message_record.symbol_seq_num[outright_series_status_message_at]; at = at + 1; outright_series_status_message_at = outright_series_status_message_at + 1
  :: else -> break
  od;
  wire[at] = outright_series_status_message_record.security_status; at = at + 1;
  wire[at] = outright_series_status_message_record.halt_condition; at = at + 1;
  outright_series_status_message_at = 0;
  do
  :: outright_series_status_message_at < 2 -> wire[at] = outright_series_status_message_record.reserved_2[outright_series_status_message_at]; at = at + 1; outright_series_status_message_at = outright_series_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Outright Series Status Message off the wire, 20 bytes from where the cursor stands */
inline decode_outright_series_status_message(outright_series_status_message_record) {
  outright_series_status_message_at = 0;
  do
  :: outright_series_status_message_at < 4 -> outright_series_status_message_record.source_time[outright_series_status_message_at] = wire[at]; at = at + 1; outright_series_status_message_at = outright_series_status_message_at + 1
  :: else -> break
  od;
  outright_series_status_message_at = 0;
  do
  :: outright_series_status_message_at < 4 -> outright_series_status_message_record.source_time_ns[outright_series_status_message_at] = wire[at]; at = at + 1; outright_series_status_message_at = outright_series_status_message_at + 1
  :: else -> break
  od;
  outright_series_status_message_at = 0;
  do
  :: outright_series_status_message_at < 4 -> outright_series_status_message_record.series_index[outright_series_status_message_at] = wire[at]; at = at + 1; outright_series_status_message_at = outright_series_status_message_at + 1
  :: else -> break
  od;
  outright_series_status_message_at = 0;
  do
  :: outright_series_status_message_at < 4 -> outright_series_status_message_record.symbol_seq_num[outright_series_status_message_at] = wire[at]; at = at + 1; outright_series_status_message_at = outright_series_status_message_at + 1
  :: else -> break
  od;
  outright_series_status_message_record.security_status = wire[at]; at = at + 1;
  outright_series_status_message_record.halt_condition = wire[at]; at = at + 1;
  outright_series_status_message_at = 0;
  do
  :: outright_series_status_message_at < 2 -> outright_series_status_message_record.reserved_2[outright_series_status_message_at] = wire[at]; at = at + 1; outright_series_status_message_at = outright_series_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Outright Series Status Message is what was written, byte for byte */
inline equal_outright_series_status_message(outright_series_status_message_read, outright_series_status_message_written) {
  outright_series_status_message_at = 0;
  do
  :: outright_series_status_message_at < 4 -> assert(outright_series_status_message_read.source_time[outright_series_status_message_at] == outright_series_status_message_written.source_time[outright_series_status_message_at]); outright_series_status_message_at = outright_series_status_message_at + 1
  :: else -> break
  od;
  outright_series_status_message_at = 0;
  do
  :: outright_series_status_message_at < 4 -> assert(outright_series_status_message_read.source_time_ns[outright_series_status_message_at] == outright_series_status_message_written.source_time_ns[outright_series_status_message_at]); outright_series_status_message_at = outright_series_status_message_at + 1
  :: else -> break
  od;
  outright_series_status_message_at = 0;
  do
  :: outright_series_status_message_at < 4 -> assert(outright_series_status_message_read.series_index[outright_series_status_message_at] == outright_series_status_message_written.series_index[outright_series_status_message_at]); outright_series_status_message_at = outright_series_status_message_at + 1
  :: else -> break
  od;
  outright_series_status_message_at = 0;
  do
  :: outright_series_status_message_at < 4 -> assert(outright_series_status_message_read.symbol_seq_num[outright_series_status_message_at] == outright_series_status_message_written.symbol_seq_num[outright_series_status_message_at]); outright_series_status_message_at = outright_series_status_message_at + 1
  :: else -> break
  od;
  assert(outright_series_status_message_read.security_status == outright_series_status_message_written.security_status);
  assert(outright_series_status_message_read.halt_condition == outright_series_status_message_written.halt_condition);
  outright_series_status_message_at = 0;
  do
  :: outright_series_status_message_at < 2 -> assert(outright_series_status_message_read.reserved_2[outright_series_status_message_at] == outright_series_status_message_written.reserved_2[outright_series_status_message_at]); outright_series_status_message_at = outright_series_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Refresh Outright Market Depth Buy Message: 44 bytes --------------------- */

/* The Refresh Market Depth Buy message is sent in the event no Buy Market Depth messages are published for the symbol for 2 consecutive minutes. */
typedef RefreshOutrightMarketDepthBuyMessage {
  byte source_time[4];
  byte source_ns[4];
  byte series_index[4];
  byte symbol_seq_num[4];
  byte first_level_price[4];
  byte second_level_price[4];
  byte third_level_price[4];
  byte first_volume[2];
  byte second_volume[2];
  byte third_volume[2];
  byte quote_condition;
  byte reserved_1;
  byte first_level_customer_volume[2];
  byte second_level_customer_volume[2];
  byte third_level_customer_volume[2];
  byte reserved_2[2]
};

int refresh_outright_market_depth_buy_message_at;

/* every byte of Refresh Outright Market Depth Buy Message set to one value */
inline fill_refresh_outright_market_depth_buy_message(refresh_outright_market_depth_buy_message_record, refresh_outright_market_depth_buy_message_value) {
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> refresh_outright_market_depth_buy_message_record.source_time[refresh_outright_market_depth_buy_message_at] = refresh_outright_market_depth_buy_message_value; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> refresh_outright_market_depth_buy_message_record.source_ns[refresh_outright_market_depth_buy_message_at] = refresh_outright_market_depth_buy_message_value; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> refresh_outright_market_depth_buy_message_record.series_index[refresh_outright_market_depth_buy_message_at] = refresh_outright_market_depth_buy_message_value; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> refresh_outright_market_depth_buy_message_record.symbol_seq_num[refresh_outright_market_depth_buy_message_at] = refresh_outright_market_depth_buy_message_value; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> refresh_outright_market_depth_buy_message_record.first_level_price[refresh_outright_market_depth_buy_message_at] = refresh_outright_market_depth_buy_message_value; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> refresh_outright_market_depth_buy_message_record.second_level_price[refresh_outright_market_depth_buy_message_at] = refresh_outright_market_depth_buy_message_value; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> refresh_outright_market_depth_buy_message_record.third_level_price[refresh_outright_market_depth_buy_message_at] = refresh_outright_market_depth_buy_message_value; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> refresh_outright_market_depth_buy_message_record.first_volume[refresh_outright_market_depth_buy_message_at] = refresh_outright_market_depth_buy_message_value; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> refresh_outright_market_depth_buy_message_record.second_volume[refresh_outright_market_depth_buy_message_at] = refresh_outright_market_depth_buy_message_value; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> refresh_outright_market_depth_buy_message_record.third_volume[refresh_outright_market_depth_buy_message_at] = refresh_outright_market_depth_buy_message_value; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_record.quote_condition = refresh_outright_market_depth_buy_message_value;
  refresh_outright_market_depth_buy_message_record.reserved_1 = refresh_outright_market_depth_buy_message_value;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> refresh_outright_market_depth_buy_message_record.first_level_customer_volume[refresh_outright_market_depth_buy_message_at] = refresh_outright_market_depth_buy_message_value; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> refresh_outright_market_depth_buy_message_record.second_level_customer_volume[refresh_outright_market_depth_buy_message_at] = refresh_outright_market_depth_buy_message_value; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> refresh_outright_market_depth_buy_message_record.third_level_customer_volume[refresh_outright_market_depth_buy_message_at] = refresh_outright_market_depth_buy_message_value; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> refresh_outright_market_depth_buy_message_record.reserved_2[refresh_outright_market_depth_buy_message_at] = refresh_outright_market_depth_buy_message_value; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Refresh Outright Market Depth Buy Message set to where it lies, so a field read out of place says so */
inline ramp_refresh_outright_market_depth_buy_message(refresh_outright_market_depth_buy_message_record, refresh_outright_market_depth_buy_message_base) {
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> refresh_outright_market_depth_buy_message_record.source_time[refresh_outright_market_depth_buy_message_at] = (refresh_outright_market_depth_buy_message_base + 0 + refresh_outright_market_depth_buy_message_at + 1) % 256; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> refresh_outright_market_depth_buy_message_record.source_ns[refresh_outright_market_depth_buy_message_at] = (refresh_outright_market_depth_buy_message_base + 4 + refresh_outright_market_depth_buy_message_at + 1) % 256; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> refresh_outright_market_depth_buy_message_record.series_index[refresh_outright_market_depth_buy_message_at] = (refresh_outright_market_depth_buy_message_base + 8 + refresh_outright_market_depth_buy_message_at + 1) % 256; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> refresh_outright_market_depth_buy_message_record.symbol_seq_num[refresh_outright_market_depth_buy_message_at] = (refresh_outright_market_depth_buy_message_base + 12 + refresh_outright_market_depth_buy_message_at + 1) % 256; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> refresh_outright_market_depth_buy_message_record.first_level_price[refresh_outright_market_depth_buy_message_at] = (refresh_outright_market_depth_buy_message_base + 16 + refresh_outright_market_depth_buy_message_at + 1) % 256; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> refresh_outright_market_depth_buy_message_record.second_level_price[refresh_outright_market_depth_buy_message_at] = (refresh_outright_market_depth_buy_message_base + 20 + refresh_outright_market_depth_buy_message_at + 1) % 256; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> refresh_outright_market_depth_buy_message_record.third_level_price[refresh_outright_market_depth_buy_message_at] = (refresh_outright_market_depth_buy_message_base + 24 + refresh_outright_market_depth_buy_message_at + 1) % 256; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> refresh_outright_market_depth_buy_message_record.first_volume[refresh_outright_market_depth_buy_message_at] = (refresh_outright_market_depth_buy_message_base + 28 + refresh_outright_market_depth_buy_message_at + 1) % 256; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> refresh_outright_market_depth_buy_message_record.second_volume[refresh_outright_market_depth_buy_message_at] = (refresh_outright_market_depth_buy_message_base + 30 + refresh_outright_market_depth_buy_message_at + 1) % 256; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> refresh_outright_market_depth_buy_message_record.third_volume[refresh_outright_market_depth_buy_message_at] = (refresh_outright_market_depth_buy_message_base + 32 + refresh_outright_market_depth_buy_message_at + 1) % 256; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_record.quote_condition = (refresh_outright_market_depth_buy_message_base + 34 + 1) % 256;
  refresh_outright_market_depth_buy_message_record.reserved_1 = (refresh_outright_market_depth_buy_message_base + 35 + 1) % 256;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> refresh_outright_market_depth_buy_message_record.first_level_customer_volume[refresh_outright_market_depth_buy_message_at] = (refresh_outright_market_depth_buy_message_base + 36 + refresh_outright_market_depth_buy_message_at + 1) % 256; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> refresh_outright_market_depth_buy_message_record.second_level_customer_volume[refresh_outright_market_depth_buy_message_at] = (refresh_outright_market_depth_buy_message_base + 38 + refresh_outright_market_depth_buy_message_at + 1) % 256; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> refresh_outright_market_depth_buy_message_record.third_level_customer_volume[refresh_outright_market_depth_buy_message_at] = (refresh_outright_market_depth_buy_message_base + 40 + refresh_outright_market_depth_buy_message_at + 1) % 256; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> refresh_outright_market_depth_buy_message_record.reserved_2[refresh_outright_market_depth_buy_message_at] = (refresh_outright_market_depth_buy_message_base + 42 + refresh_outright_market_depth_buy_message_at + 1) % 256; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Outright Market Depth Buy Message to the wire, 44 bytes from where the cursor stands */
inline encode_refresh_outright_market_depth_buy_message(refresh_outright_market_depth_buy_message_record) {
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> wire[at] = refresh_outright_market_depth_buy_message_record.source_time[refresh_outright_market_depth_buy_message_at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> wire[at] = refresh_outright_market_depth_buy_message_record.source_ns[refresh_outright_market_depth_buy_message_at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> wire[at] = refresh_outright_market_depth_buy_message_record.series_index[refresh_outright_market_depth_buy_message_at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> wire[at] = refresh_outright_market_depth_buy_message_record.symbol_seq_num[refresh_outright_market_depth_buy_message_at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> wire[at] = refresh_outright_market_depth_buy_message_record.first_level_price[refresh_outright_market_depth_buy_message_at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> wire[at] = refresh_outright_market_depth_buy_message_record.second_level_price[refresh_outright_market_depth_buy_message_at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> wire[at] = refresh_outright_market_depth_buy_message_record.third_level_price[refresh_outright_market_depth_buy_message_at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> wire[at] = refresh_outright_market_depth_buy_message_record.first_volume[refresh_outright_market_depth_buy_message_at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> wire[at] = refresh_outright_market_depth_buy_message_record.second_volume[refresh_outright_market_depth_buy_message_at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> wire[at] = refresh_outright_market_depth_buy_message_record.third_volume[refresh_outright_market_depth_buy_message_at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  wire[at] = refresh_outright_market_depth_buy_message_record.quote_condition; at = at + 1;
  wire[at] = refresh_outright_market_depth_buy_message_record.reserved_1; at = at + 1;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> wire[at] = refresh_outright_market_depth_buy_message_record.first_level_customer_volume[refresh_outright_market_depth_buy_message_at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> wire[at] = refresh_outright_market_depth_buy_message_record.second_level_customer_volume[refresh_outright_market_depth_buy_message_at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> wire[at] = refresh_outright_market_depth_buy_message_record.third_level_customer_volume[refresh_outright_market_depth_buy_message_at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> wire[at] = refresh_outright_market_depth_buy_message_record.reserved_2[refresh_outright_market_depth_buy_message_at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Outright Market Depth Buy Message off the wire, 44 bytes from where the cursor stands */
inline decode_refresh_outright_market_depth_buy_message(refresh_outright_market_depth_buy_message_record) {
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> refresh_outright_market_depth_buy_message_record.source_time[refresh_outright_market_depth_buy_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> refresh_outright_market_depth_buy_message_record.source_ns[refresh_outright_market_depth_buy_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> refresh_outright_market_depth_buy_message_record.series_index[refresh_outright_market_depth_buy_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> refresh_outright_market_depth_buy_message_record.symbol_seq_num[refresh_outright_market_depth_buy_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> refresh_outright_market_depth_buy_message_record.first_level_price[refresh_outright_market_depth_buy_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> refresh_outright_market_depth_buy_message_record.second_level_price[refresh_outright_market_depth_buy_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> refresh_outright_market_depth_buy_message_record.third_level_price[refresh_outright_market_depth_buy_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> refresh_outright_market_depth_buy_message_record.first_volume[refresh_outright_market_depth_buy_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> refresh_outright_market_depth_buy_message_record.second_volume[refresh_outright_market_depth_buy_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> refresh_outright_market_depth_buy_message_record.third_volume[refresh_outright_market_depth_buy_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_record.quote_condition = wire[at]; at = at + 1;
  refresh_outright_market_depth_buy_message_record.reserved_1 = wire[at]; at = at + 1;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> refresh_outright_market_depth_buy_message_record.first_level_customer_volume[refresh_outright_market_depth_buy_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> refresh_outright_market_depth_buy_message_record.second_level_customer_volume[refresh_outright_market_depth_buy_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> refresh_outright_market_depth_buy_message_record.third_level_customer_volume[refresh_outright_market_depth_buy_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> refresh_outright_market_depth_buy_message_record.reserved_2[refresh_outright_market_depth_buy_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Refresh Outright Market Depth Buy Message is what was written, byte for byte */
inline equal_refresh_outright_market_depth_buy_message(refresh_outright_market_depth_buy_message_read, refresh_outright_market_depth_buy_message_written) {
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> assert(refresh_outright_market_depth_buy_message_read.source_time[refresh_outright_market_depth_buy_message_at] == refresh_outright_market_depth_buy_message_written.source_time[refresh_outright_market_depth_buy_message_at]); refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> assert(refresh_outright_market_depth_buy_message_read.source_ns[refresh_outright_market_depth_buy_message_at] == refresh_outright_market_depth_buy_message_written.source_ns[refresh_outright_market_depth_buy_message_at]); refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> assert(refresh_outright_market_depth_buy_message_read.series_index[refresh_outright_market_depth_buy_message_at] == refresh_outright_market_depth_buy_message_written.series_index[refresh_outright_market_depth_buy_message_at]); refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> assert(refresh_outright_market_depth_buy_message_read.symbol_seq_num[refresh_outright_market_depth_buy_message_at] == refresh_outright_market_depth_buy_message_written.symbol_seq_num[refresh_outright_market_depth_buy_message_at]); refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> assert(refresh_outright_market_depth_buy_message_read.first_level_price[refresh_outright_market_depth_buy_message_at] == refresh_outright_market_depth_buy_message_written.first_level_price[refresh_outright_market_depth_buy_message_at]); refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> assert(refresh_outright_market_depth_buy_message_read.second_level_price[refresh_outright_market_depth_buy_message_at] == refresh_outright_market_depth_buy_message_written.second_level_price[refresh_outright_market_depth_buy_message_at]); refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 4 -> assert(refresh_outright_market_depth_buy_message_read.third_level_price[refresh_outright_market_depth_buy_message_at] == refresh_outright_market_depth_buy_message_written.third_level_price[refresh_outright_market_depth_buy_message_at]); refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> assert(refresh_outright_market_depth_buy_message_read.first_volume[refresh_outright_market_depth_buy_message_at] == refresh_outright_market_depth_buy_message_written.first_volume[refresh_outright_market_depth_buy_message_at]); refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> assert(refresh_outright_market_depth_buy_message_read.second_volume[refresh_outright_market_depth_buy_message_at] == refresh_outright_market_depth_buy_message_written.second_volume[refresh_outright_market_depth_buy_message_at]); refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> assert(refresh_outright_market_depth_buy_message_read.third_volume[refresh_outright_market_depth_buy_message_at] == refresh_outright_market_depth_buy_message_written.third_volume[refresh_outright_market_depth_buy_message_at]); refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  assert(refresh_outright_market_depth_buy_message_read.quote_condition == refresh_outright_market_depth_buy_message_written.quote_condition);
  assert(refresh_outright_market_depth_buy_message_read.reserved_1 == refresh_outright_market_depth_buy_message_written.reserved_1);
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> assert(refresh_outright_market_depth_buy_message_read.first_level_customer_volume[refresh_outright_market_depth_buy_message_at] == refresh_outright_market_depth_buy_message_written.first_level_customer_volume[refresh_outright_market_depth_buy_message_at]); refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> assert(refresh_outright_market_depth_buy_message_read.second_level_customer_volume[refresh_outright_market_depth_buy_message_at] == refresh_outright_market_depth_buy_message_written.second_level_customer_volume[refresh_outright_market_depth_buy_message_at]); refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> assert(refresh_outright_market_depth_buy_message_read.third_level_customer_volume[refresh_outright_market_depth_buy_message_at] == refresh_outright_market_depth_buy_message_written.third_level_customer_volume[refresh_outright_market_depth_buy_message_at]); refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_buy_message_at = 0;
  do
  :: refresh_outright_market_depth_buy_message_at < 2 -> assert(refresh_outright_market_depth_buy_message_read.reserved_2[refresh_outright_market_depth_buy_message_at] == refresh_outright_market_depth_buy_message_written.reserved_2[refresh_outright_market_depth_buy_message_at]); refresh_outright_market_depth_buy_message_at = refresh_outright_market_depth_buy_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Refresh Outright Market Depth Sell Message: 44 bytes -------------------- */

/* The Refresh Market Depth Sell message is sent in the event no Sell Market Depth messages are published for the symbol for 2 consecutive minutes. */
typedef RefreshOutrightMarketDepthSellMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte series_index[4];
  byte symbol_seq_num[4];
  byte first_level_price[4];
  byte second_level_price[4];
  byte third_level_price[4];
  byte first_volume[2];
  byte second_volume[2];
  byte third_volume[2];
  byte quote_condition;
  byte reserved_1;
  byte first_level_customer_volume[2];
  byte second_level_customer_volume[2];
  byte third_level_customer_volume[2];
  byte reserved_2[2]
};

int refresh_outright_market_depth_sell_message_at;

/* every byte of Refresh Outright Market Depth Sell Message set to one value */
inline fill_refresh_outright_market_depth_sell_message(refresh_outright_market_depth_sell_message_record, refresh_outright_market_depth_sell_message_value) {
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> refresh_outright_market_depth_sell_message_record.source_time[refresh_outright_market_depth_sell_message_at] = refresh_outright_market_depth_sell_message_value; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> refresh_outright_market_depth_sell_message_record.source_time_ns[refresh_outright_market_depth_sell_message_at] = refresh_outright_market_depth_sell_message_value; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> refresh_outright_market_depth_sell_message_record.series_index[refresh_outright_market_depth_sell_message_at] = refresh_outright_market_depth_sell_message_value; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> refresh_outright_market_depth_sell_message_record.symbol_seq_num[refresh_outright_market_depth_sell_message_at] = refresh_outright_market_depth_sell_message_value; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> refresh_outright_market_depth_sell_message_record.first_level_price[refresh_outright_market_depth_sell_message_at] = refresh_outright_market_depth_sell_message_value; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> refresh_outright_market_depth_sell_message_record.second_level_price[refresh_outright_market_depth_sell_message_at] = refresh_outright_market_depth_sell_message_value; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> refresh_outright_market_depth_sell_message_record.third_level_price[refresh_outright_market_depth_sell_message_at] = refresh_outright_market_depth_sell_message_value; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> refresh_outright_market_depth_sell_message_record.first_volume[refresh_outright_market_depth_sell_message_at] = refresh_outright_market_depth_sell_message_value; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> refresh_outright_market_depth_sell_message_record.second_volume[refresh_outright_market_depth_sell_message_at] = refresh_outright_market_depth_sell_message_value; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> refresh_outright_market_depth_sell_message_record.third_volume[refresh_outright_market_depth_sell_message_at] = refresh_outright_market_depth_sell_message_value; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_record.quote_condition = refresh_outright_market_depth_sell_message_value;
  refresh_outright_market_depth_sell_message_record.reserved_1 = refresh_outright_market_depth_sell_message_value;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> refresh_outright_market_depth_sell_message_record.first_level_customer_volume[refresh_outright_market_depth_sell_message_at] = refresh_outright_market_depth_sell_message_value; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> refresh_outright_market_depth_sell_message_record.second_level_customer_volume[refresh_outright_market_depth_sell_message_at] = refresh_outright_market_depth_sell_message_value; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> refresh_outright_market_depth_sell_message_record.third_level_customer_volume[refresh_outright_market_depth_sell_message_at] = refresh_outright_market_depth_sell_message_value; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> refresh_outright_market_depth_sell_message_record.reserved_2[refresh_outright_market_depth_sell_message_at] = refresh_outright_market_depth_sell_message_value; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Refresh Outright Market Depth Sell Message set to where it lies, so a field read out of place says so */
inline ramp_refresh_outright_market_depth_sell_message(refresh_outright_market_depth_sell_message_record, refresh_outright_market_depth_sell_message_base) {
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> refresh_outright_market_depth_sell_message_record.source_time[refresh_outright_market_depth_sell_message_at] = (refresh_outright_market_depth_sell_message_base + 0 + refresh_outright_market_depth_sell_message_at + 1) % 256; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> refresh_outright_market_depth_sell_message_record.source_time_ns[refresh_outright_market_depth_sell_message_at] = (refresh_outright_market_depth_sell_message_base + 4 + refresh_outright_market_depth_sell_message_at + 1) % 256; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> refresh_outright_market_depth_sell_message_record.series_index[refresh_outright_market_depth_sell_message_at] = (refresh_outright_market_depth_sell_message_base + 8 + refresh_outright_market_depth_sell_message_at + 1) % 256; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> refresh_outright_market_depth_sell_message_record.symbol_seq_num[refresh_outright_market_depth_sell_message_at] = (refresh_outright_market_depth_sell_message_base + 12 + refresh_outright_market_depth_sell_message_at + 1) % 256; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> refresh_outright_market_depth_sell_message_record.first_level_price[refresh_outright_market_depth_sell_message_at] = (refresh_outright_market_depth_sell_message_base + 16 + refresh_outright_market_depth_sell_message_at + 1) % 256; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> refresh_outright_market_depth_sell_message_record.second_level_price[refresh_outright_market_depth_sell_message_at] = (refresh_outright_market_depth_sell_message_base + 20 + refresh_outright_market_depth_sell_message_at + 1) % 256; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> refresh_outright_market_depth_sell_message_record.third_level_price[refresh_outright_market_depth_sell_message_at] = (refresh_outright_market_depth_sell_message_base + 24 + refresh_outright_market_depth_sell_message_at + 1) % 256; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> refresh_outright_market_depth_sell_message_record.first_volume[refresh_outright_market_depth_sell_message_at] = (refresh_outright_market_depth_sell_message_base + 28 + refresh_outright_market_depth_sell_message_at + 1) % 256; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> refresh_outright_market_depth_sell_message_record.second_volume[refresh_outright_market_depth_sell_message_at] = (refresh_outright_market_depth_sell_message_base + 30 + refresh_outright_market_depth_sell_message_at + 1) % 256; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> refresh_outright_market_depth_sell_message_record.third_volume[refresh_outright_market_depth_sell_message_at] = (refresh_outright_market_depth_sell_message_base + 32 + refresh_outright_market_depth_sell_message_at + 1) % 256; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_record.quote_condition = (refresh_outright_market_depth_sell_message_base + 34 + 1) % 256;
  refresh_outright_market_depth_sell_message_record.reserved_1 = (refresh_outright_market_depth_sell_message_base + 35 + 1) % 256;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> refresh_outright_market_depth_sell_message_record.first_level_customer_volume[refresh_outright_market_depth_sell_message_at] = (refresh_outright_market_depth_sell_message_base + 36 + refresh_outright_market_depth_sell_message_at + 1) % 256; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> refresh_outright_market_depth_sell_message_record.second_level_customer_volume[refresh_outright_market_depth_sell_message_at] = (refresh_outright_market_depth_sell_message_base + 38 + refresh_outright_market_depth_sell_message_at + 1) % 256; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> refresh_outright_market_depth_sell_message_record.third_level_customer_volume[refresh_outright_market_depth_sell_message_at] = (refresh_outright_market_depth_sell_message_base + 40 + refresh_outright_market_depth_sell_message_at + 1) % 256; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> refresh_outright_market_depth_sell_message_record.reserved_2[refresh_outright_market_depth_sell_message_at] = (refresh_outright_market_depth_sell_message_base + 42 + refresh_outright_market_depth_sell_message_at + 1) % 256; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Outright Market Depth Sell Message to the wire, 44 bytes from where the cursor stands */
inline encode_refresh_outright_market_depth_sell_message(refresh_outright_market_depth_sell_message_record) {
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> wire[at] = refresh_outright_market_depth_sell_message_record.source_time[refresh_outright_market_depth_sell_message_at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> wire[at] = refresh_outright_market_depth_sell_message_record.source_time_ns[refresh_outright_market_depth_sell_message_at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> wire[at] = refresh_outright_market_depth_sell_message_record.series_index[refresh_outright_market_depth_sell_message_at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> wire[at] = refresh_outright_market_depth_sell_message_record.symbol_seq_num[refresh_outright_market_depth_sell_message_at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> wire[at] = refresh_outright_market_depth_sell_message_record.first_level_price[refresh_outright_market_depth_sell_message_at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> wire[at] = refresh_outright_market_depth_sell_message_record.second_level_price[refresh_outright_market_depth_sell_message_at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> wire[at] = refresh_outright_market_depth_sell_message_record.third_level_price[refresh_outright_market_depth_sell_message_at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> wire[at] = refresh_outright_market_depth_sell_message_record.first_volume[refresh_outright_market_depth_sell_message_at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> wire[at] = refresh_outright_market_depth_sell_message_record.second_volume[refresh_outright_market_depth_sell_message_at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> wire[at] = refresh_outright_market_depth_sell_message_record.third_volume[refresh_outright_market_depth_sell_message_at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  wire[at] = refresh_outright_market_depth_sell_message_record.quote_condition; at = at + 1;
  wire[at] = refresh_outright_market_depth_sell_message_record.reserved_1; at = at + 1;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> wire[at] = refresh_outright_market_depth_sell_message_record.first_level_customer_volume[refresh_outright_market_depth_sell_message_at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> wire[at] = refresh_outright_market_depth_sell_message_record.second_level_customer_volume[refresh_outright_market_depth_sell_message_at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> wire[at] = refresh_outright_market_depth_sell_message_record.third_level_customer_volume[refresh_outright_market_depth_sell_message_at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> wire[at] = refresh_outright_market_depth_sell_message_record.reserved_2[refresh_outright_market_depth_sell_message_at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Outright Market Depth Sell Message off the wire, 44 bytes from where the cursor stands */
inline decode_refresh_outright_market_depth_sell_message(refresh_outright_market_depth_sell_message_record) {
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> refresh_outright_market_depth_sell_message_record.source_time[refresh_outright_market_depth_sell_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> refresh_outright_market_depth_sell_message_record.source_time_ns[refresh_outright_market_depth_sell_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> refresh_outright_market_depth_sell_message_record.series_index[refresh_outright_market_depth_sell_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> refresh_outright_market_depth_sell_message_record.symbol_seq_num[refresh_outright_market_depth_sell_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> refresh_outright_market_depth_sell_message_record.first_level_price[refresh_outright_market_depth_sell_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> refresh_outright_market_depth_sell_message_record.second_level_price[refresh_outright_market_depth_sell_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> refresh_outright_market_depth_sell_message_record.third_level_price[refresh_outright_market_depth_sell_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> refresh_outright_market_depth_sell_message_record.first_volume[refresh_outright_market_depth_sell_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> refresh_outright_market_depth_sell_message_record.second_volume[refresh_outright_market_depth_sell_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> refresh_outright_market_depth_sell_message_record.third_volume[refresh_outright_market_depth_sell_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_record.quote_condition = wire[at]; at = at + 1;
  refresh_outright_market_depth_sell_message_record.reserved_1 = wire[at]; at = at + 1;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> refresh_outright_market_depth_sell_message_record.first_level_customer_volume[refresh_outright_market_depth_sell_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> refresh_outright_market_depth_sell_message_record.second_level_customer_volume[refresh_outright_market_depth_sell_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> refresh_outright_market_depth_sell_message_record.third_level_customer_volume[refresh_outright_market_depth_sell_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> refresh_outright_market_depth_sell_message_record.reserved_2[refresh_outright_market_depth_sell_message_at] = wire[at]; at = at + 1; refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Refresh Outright Market Depth Sell Message is what was written, byte for byte */
inline equal_refresh_outright_market_depth_sell_message(refresh_outright_market_depth_sell_message_read, refresh_outright_market_depth_sell_message_written) {
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> assert(refresh_outright_market_depth_sell_message_read.source_time[refresh_outright_market_depth_sell_message_at] == refresh_outright_market_depth_sell_message_written.source_time[refresh_outright_market_depth_sell_message_at]); refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> assert(refresh_outright_market_depth_sell_message_read.source_time_ns[refresh_outright_market_depth_sell_message_at] == refresh_outright_market_depth_sell_message_written.source_time_ns[refresh_outright_market_depth_sell_message_at]); refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> assert(refresh_outright_market_depth_sell_message_read.series_index[refresh_outright_market_depth_sell_message_at] == refresh_outright_market_depth_sell_message_written.series_index[refresh_outright_market_depth_sell_message_at]); refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> assert(refresh_outright_market_depth_sell_message_read.symbol_seq_num[refresh_outright_market_depth_sell_message_at] == refresh_outright_market_depth_sell_message_written.symbol_seq_num[refresh_outright_market_depth_sell_message_at]); refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> assert(refresh_outright_market_depth_sell_message_read.first_level_price[refresh_outright_market_depth_sell_message_at] == refresh_outright_market_depth_sell_message_written.first_level_price[refresh_outright_market_depth_sell_message_at]); refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> assert(refresh_outright_market_depth_sell_message_read.second_level_price[refresh_outright_market_depth_sell_message_at] == refresh_outright_market_depth_sell_message_written.second_level_price[refresh_outright_market_depth_sell_message_at]); refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 4 -> assert(refresh_outright_market_depth_sell_message_read.third_level_price[refresh_outright_market_depth_sell_message_at] == refresh_outright_market_depth_sell_message_written.third_level_price[refresh_outright_market_depth_sell_message_at]); refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> assert(refresh_outright_market_depth_sell_message_read.first_volume[refresh_outright_market_depth_sell_message_at] == refresh_outright_market_depth_sell_message_written.first_volume[refresh_outright_market_depth_sell_message_at]); refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> assert(refresh_outright_market_depth_sell_message_read.second_volume[refresh_outright_market_depth_sell_message_at] == refresh_outright_market_depth_sell_message_written.second_volume[refresh_outright_market_depth_sell_message_at]); refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> assert(refresh_outright_market_depth_sell_message_read.third_volume[refresh_outright_market_depth_sell_message_at] == refresh_outright_market_depth_sell_message_written.third_volume[refresh_outright_market_depth_sell_message_at]); refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  assert(refresh_outright_market_depth_sell_message_read.quote_condition == refresh_outright_market_depth_sell_message_written.quote_condition);
  assert(refresh_outright_market_depth_sell_message_read.reserved_1 == refresh_outright_market_depth_sell_message_written.reserved_1);
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> assert(refresh_outright_market_depth_sell_message_read.first_level_customer_volume[refresh_outright_market_depth_sell_message_at] == refresh_outright_market_depth_sell_message_written.first_level_customer_volume[refresh_outright_market_depth_sell_message_at]); refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> assert(refresh_outright_market_depth_sell_message_read.second_level_customer_volume[refresh_outright_market_depth_sell_message_at] == refresh_outright_market_depth_sell_message_written.second_level_customer_volume[refresh_outright_market_depth_sell_message_at]); refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> assert(refresh_outright_market_depth_sell_message_read.third_level_customer_volume[refresh_outright_market_depth_sell_message_at] == refresh_outright_market_depth_sell_message_written.third_level_customer_volume[refresh_outright_market_depth_sell_message_at]); refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  refresh_outright_market_depth_sell_message_at = 0;
  do
  :: refresh_outright_market_depth_sell_message_at < 2 -> assert(refresh_outright_market_depth_sell_message_read.reserved_2[refresh_outright_market_depth_sell_message_at] == refresh_outright_market_depth_sell_message_written.reserved_2[refresh_outright_market_depth_sell_message_at]); refresh_outright_market_depth_sell_message_at = refresh_outright_market_depth_sell_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Underlying Index Mapping Message: 24 bytes ------------------------------ */

/* On system startup, each multicast channel sends all the symbols on its channel. Underlying Index Mapping messages are published first, followed by all Series Index Mapping messages, and for the Complex feed, Complex Symbol Definitions last of all. */
typedef UnderlyingIndexMappingMessage {
  byte underlying_index[4];
  byte underlying_symbol[11];
  byte channel_id;
  byte market_id[2];
  byte system_id;
  byte exchange_code;
  byte price_scale_code;
  byte security_type;
  byte price_resolution;
  byte reserved_1
};

int underlying_index_mapping_message_at;

/* every byte of Underlying Index Mapping Message set to one value */
inline fill_underlying_index_mapping_message(underlying_index_mapping_message_record, underlying_index_mapping_message_value) {
  underlying_index_mapping_message_at = 0;
  do
  :: underlying_index_mapping_message_at < 4 -> underlying_index_mapping_message_record.underlying_index[underlying_index_mapping_message_at] = underlying_index_mapping_message_value; underlying_index_mapping_message_at = underlying_index_mapping_message_at + 1
  :: else -> break
  od;
  underlying_index_mapping_message_at = 0;
  do
  :: underlying_index_mapping_message_at < 11 -> underlying_index_mapping_message_record.underlying_symbol[underlying_index_mapping_message_at] = underlying_index_mapping_message_value; underlying_index_mapping_message_at = underlying_index_mapping_message_at + 1
  :: else -> break
  od;
  underlying_index_mapping_message_record.channel_id = underlying_index_mapping_message_value;
  underlying_index_mapping_message_at = 0;
  do
  :: underlying_index_mapping_message_at < 2 -> underlying_index_mapping_message_record.market_id[underlying_index_mapping_message_at] = underlying_index_mapping_message_value; underlying_index_mapping_message_at = underlying_index_mapping_message_at + 1
  :: else -> break
  od;
  underlying_index_mapping_message_record.system_id = underlying_index_mapping_message_value;
  underlying_index_mapping_message_record.exchange_code = underlying_index_mapping_message_value;
  underlying_index_mapping_message_record.price_scale_code = underlying_index_mapping_message_value;
  underlying_index_mapping_message_record.security_type = underlying_index_mapping_message_value;
  underlying_index_mapping_message_record.price_resolution = underlying_index_mapping_message_value;
  underlying_index_mapping_message_record.reserved_1 = underlying_index_mapping_message_value;
  skip
}

/* each byte of Underlying Index Mapping Message set to where it lies, so a field read out of place says so */
inline ramp_underlying_index_mapping_message(underlying_index_mapping_message_record, underlying_index_mapping_message_base) {
  underlying_index_mapping_message_at = 0;
  do
  :: underlying_index_mapping_message_at < 4 -> underlying_index_mapping_message_record.underlying_index[underlying_index_mapping_message_at] = (underlying_index_mapping_message_base + 0 + underlying_index_mapping_message_at + 1) % 256; underlying_index_mapping_message_at = underlying_index_mapping_message_at + 1
  :: else -> break
  od;
  underlying_index_mapping_message_at = 0;
  do
  :: underlying_index_mapping_message_at < 11 -> underlying_index_mapping_message_record.underlying_symbol[underlying_index_mapping_message_at] = (underlying_index_mapping_message_base + 4 + underlying_index_mapping_message_at + 1) % 256; underlying_index_mapping_message_at = underlying_index_mapping_message_at + 1
  :: else -> break
  od;
  underlying_index_mapping_message_record.channel_id = (underlying_index_mapping_message_base + 15 + 1) % 256;
  underlying_index_mapping_message_at = 0;
  do
  :: underlying_index_mapping_message_at < 2 -> underlying_index_mapping_message_record.market_id[underlying_index_mapping_message_at] = (underlying_index_mapping_message_base + 16 + underlying_index_mapping_message_at + 1) % 256; underlying_index_mapping_message_at = underlying_index_mapping_message_at + 1
  :: else -> break
  od;
  underlying_index_mapping_message_record.system_id = (underlying_index_mapping_message_base + 18 + 1) % 256;
  underlying_index_mapping_message_record.exchange_code = (underlying_index_mapping_message_base + 19 + 1) % 256;
  underlying_index_mapping_message_record.price_scale_code = (underlying_index_mapping_message_base + 20 + 1) % 256;
  underlying_index_mapping_message_record.security_type = (underlying_index_mapping_message_base + 21 + 1) % 256;
  underlying_index_mapping_message_record.price_resolution = (underlying_index_mapping_message_base + 22 + 1) % 256;
  underlying_index_mapping_message_record.reserved_1 = (underlying_index_mapping_message_base + 23 + 1) % 256;
  skip
}

/* Underlying Index Mapping Message to the wire, 24 bytes from where the cursor stands */
inline encode_underlying_index_mapping_message(underlying_index_mapping_message_record) {
  underlying_index_mapping_message_at = 0;
  do
  :: underlying_index_mapping_message_at < 4 -> wire[at] = underlying_index_mapping_message_record.underlying_index[underlying_index_mapping_message_at]; at = at + 1; underlying_index_mapping_message_at = underlying_index_mapping_message_at + 1
  :: else -> break
  od;
  underlying_index_mapping_message_at = 0;
  do
  :: underlying_index_mapping_message_at < 11 -> wire[at] = underlying_index_mapping_message_record.underlying_symbol[underlying_index_mapping_message_at]; at = at + 1; underlying_index_mapping_message_at = underlying_index_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = underlying_index_mapping_message_record.channel_id; at = at + 1;
  underlying_index_mapping_message_at = 0;
  do
  :: underlying_index_mapping_message_at < 2 -> wire[at] = underlying_index_mapping_message_record.market_id[underlying_index_mapping_message_at]; at = at + 1; underlying_index_mapping_message_at = underlying_index_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = underlying_index_mapping_message_record.system_id; at = at + 1;
  wire[at] = underlying_index_mapping_message_record.exchange_code; at = at + 1;
  wire[at] = underlying_index_mapping_message_record.price_scale_code; at = at + 1;
  wire[at] = underlying_index_mapping_message_record.security_type; at = at + 1;
  wire[at] = underlying_index_mapping_message_record.price_resolution; at = at + 1;
  wire[at] = underlying_index_mapping_message_record.reserved_1; at = at + 1;
  skip
}

/* Underlying Index Mapping Message off the wire, 24 bytes from where the cursor stands */
inline decode_underlying_index_mapping_message(underlying_index_mapping_message_record) {
  underlying_index_mapping_message_at = 0;
  do
  :: underlying_index_mapping_message_at < 4 -> underlying_index_mapping_message_record.underlying_index[underlying_index_mapping_message_at] = wire[at]; at = at + 1; underlying_index_mapping_message_at = underlying_index_mapping_message_at + 1
  :: else -> break
  od;
  underlying_index_mapping_message_at = 0;
  do
  :: underlying_index_mapping_message_at < 11 -> underlying_index_mapping_message_record.underlying_symbol[underlying_index_mapping_message_at] = wire[at]; at = at + 1; underlying_index_mapping_message_at = underlying_index_mapping_message_at + 1
  :: else -> break
  od;
  underlying_index_mapping_message_record.channel_id = wire[at]; at = at + 1;
  underlying_index_mapping_message_at = 0;
  do
  :: underlying_index_mapping_message_at < 2 -> underlying_index_mapping_message_record.market_id[underlying_index_mapping_message_at] = wire[at]; at = at + 1; underlying_index_mapping_message_at = underlying_index_mapping_message_at + 1
  :: else -> break
  od;
  underlying_index_mapping_message_record.system_id = wire[at]; at = at + 1;
  underlying_index_mapping_message_record.exchange_code = wire[at]; at = at + 1;
  underlying_index_mapping_message_record.price_scale_code = wire[at]; at = at + 1;
  underlying_index_mapping_message_record.security_type = wire[at]; at = at + 1;
  underlying_index_mapping_message_record.price_resolution = wire[at]; at = at + 1;
  underlying_index_mapping_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Underlying Index Mapping Message is what was written, byte for byte */
inline equal_underlying_index_mapping_message(underlying_index_mapping_message_read, underlying_index_mapping_message_written) {
  underlying_index_mapping_message_at = 0;
  do
  :: underlying_index_mapping_message_at < 4 -> assert(underlying_index_mapping_message_read.underlying_index[underlying_index_mapping_message_at] == underlying_index_mapping_message_written.underlying_index[underlying_index_mapping_message_at]); underlying_index_mapping_message_at = underlying_index_mapping_message_at + 1
  :: else -> break
  od;
  underlying_index_mapping_message_at = 0;
  do
  :: underlying_index_mapping_message_at < 11 -> assert(underlying_index_mapping_message_read.underlying_symbol[underlying_index_mapping_message_at] == underlying_index_mapping_message_written.underlying_symbol[underlying_index_mapping_message_at]); underlying_index_mapping_message_at = underlying_index_mapping_message_at + 1
  :: else -> break
  od;
  assert(underlying_index_mapping_message_read.channel_id == underlying_index_mapping_message_written.channel_id);
  underlying_index_mapping_message_at = 0;
  do
  :: underlying_index_mapping_message_at < 2 -> assert(underlying_index_mapping_message_read.market_id[underlying_index_mapping_message_at] == underlying_index_mapping_message_written.market_id[underlying_index_mapping_message_at]); underlying_index_mapping_message_at = underlying_index_mapping_message_at + 1
  :: else -> break
  od;
  assert(underlying_index_mapping_message_read.system_id == underlying_index_mapping_message_written.system_id);
  assert(underlying_index_mapping_message_read.exchange_code == underlying_index_mapping_message_written.exchange_code);
  assert(underlying_index_mapping_message_read.price_scale_code == underlying_index_mapping_message_written.price_scale_code);
  assert(underlying_index_mapping_message_read.security_type == underlying_index_mapping_message_written.security_type);
  assert(underlying_index_mapping_message_read.price_resolution == underlying_index_mapping_message_written.price_resolution);
  assert(underlying_index_mapping_message_read.reserved_1 == underlying_index_mapping_message_written.reserved_1);
  skip
}

/* ---- Series Index Mapping Message: 56 bytes ---------------------------------- */

/* On system startup, each multicast channel sends all the symbols on its channel. Underlying Index Mapping messages are published first, followed by all Series Index Mapping messages, and for the Complex feed, Complex Symbol Definitions last of all. */
typedef SeriesIndexMappingMessage {
  byte series_index[4];
  byte channel_id;
  byte reserved_a_1;
  byte market_id[2];
  byte system_id;
  byte reserved_b_1;
  byte stream_id[2];
  byte underlying_index[4];
  byte contract_multiplier[2];
  byte maturity_date[6];
  byte put_or_call;
  byte strike_price[10];
  byte price_scale_code;
  byte underlying_symbol[11];
  byte option_symbol_root[5];
  byte group_id[4]
};

int series_index_mapping_message_at;

/* every byte of Series Index Mapping Message set to one value */
inline fill_series_index_mapping_message(series_index_mapping_message_record, series_index_mapping_message_value) {
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 4 -> series_index_mapping_message_record.series_index[series_index_mapping_message_at] = series_index_mapping_message_value; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_record.channel_id = series_index_mapping_message_value;
  series_index_mapping_message_record.reserved_a_1 = series_index_mapping_message_value;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 2 -> series_index_mapping_message_record.market_id[series_index_mapping_message_at] = series_index_mapping_message_value; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_record.system_id = series_index_mapping_message_value;
  series_index_mapping_message_record.reserved_b_1 = series_index_mapping_message_value;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 2 -> series_index_mapping_message_record.stream_id[series_index_mapping_message_at] = series_index_mapping_message_value; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 4 -> series_index_mapping_message_record.underlying_index[series_index_mapping_message_at] = series_index_mapping_message_value; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 2 -> series_index_mapping_message_record.contract_multiplier[series_index_mapping_message_at] = series_index_mapping_message_value; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 6 -> series_index_mapping_message_record.maturity_date[series_index_mapping_message_at] = series_index_mapping_message_value; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_record.put_or_call = series_index_mapping_message_value;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 10 -> series_index_mapping_message_record.strike_price[series_index_mapping_message_at] = series_index_mapping_message_value; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_record.price_scale_code = series_index_mapping_message_value;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 11 -> series_index_mapping_message_record.underlying_symbol[series_index_mapping_message_at] = series_index_mapping_message_value; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 5 -> series_index_mapping_message_record.option_symbol_root[series_index_mapping_message_at] = series_index_mapping_message_value; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 4 -> series_index_mapping_message_record.group_id[series_index_mapping_message_at] = series_index_mapping_message_value; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Series Index Mapping Message set to where it lies, so a field read out of place says so */
inline ramp_series_index_mapping_message(series_index_mapping_message_record, series_index_mapping_message_base) {
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 4 -> series_index_mapping_message_record.series_index[series_index_mapping_message_at] = (series_index_mapping_message_base + 0 + series_index_mapping_message_at + 1) % 256; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_record.channel_id = (series_index_mapping_message_base + 4 + 1) % 256;
  series_index_mapping_message_record.reserved_a_1 = (series_index_mapping_message_base + 5 + 1) % 256;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 2 -> series_index_mapping_message_record.market_id[series_index_mapping_message_at] = (series_index_mapping_message_base + 6 + series_index_mapping_message_at + 1) % 256; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_record.system_id = (series_index_mapping_message_base + 8 + 1) % 256;
  series_index_mapping_message_record.reserved_b_1 = (series_index_mapping_message_base + 9 + 1) % 256;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 2 -> series_index_mapping_message_record.stream_id[series_index_mapping_message_at] = (series_index_mapping_message_base + 10 + series_index_mapping_message_at + 1) % 256; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 4 -> series_index_mapping_message_record.underlying_index[series_index_mapping_message_at] = (series_index_mapping_message_base + 12 + series_index_mapping_message_at + 1) % 256; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 2 -> series_index_mapping_message_record.contract_multiplier[series_index_mapping_message_at] = (series_index_mapping_message_base + 16 + series_index_mapping_message_at + 1) % 256; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 6 -> series_index_mapping_message_record.maturity_date[series_index_mapping_message_at] = (series_index_mapping_message_base + 18 + series_index_mapping_message_at + 1) % 256; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_record.put_or_call = (series_index_mapping_message_base + 24 + 1) % 256;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 10 -> series_index_mapping_message_record.strike_price[series_index_mapping_message_at] = (series_index_mapping_message_base + 25 + series_index_mapping_message_at + 1) % 256; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_record.price_scale_code = (series_index_mapping_message_base + 35 + 1) % 256;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 11 -> series_index_mapping_message_record.underlying_symbol[series_index_mapping_message_at] = (series_index_mapping_message_base + 36 + series_index_mapping_message_at + 1) % 256; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 5 -> series_index_mapping_message_record.option_symbol_root[series_index_mapping_message_at] = (series_index_mapping_message_base + 47 + series_index_mapping_message_at + 1) % 256; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 4 -> series_index_mapping_message_record.group_id[series_index_mapping_message_at] = (series_index_mapping_message_base + 52 + series_index_mapping_message_at + 1) % 256; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* Series Index Mapping Message to the wire, 56 bytes from where the cursor stands */
inline encode_series_index_mapping_message(series_index_mapping_message_record) {
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 4 -> wire[at] = series_index_mapping_message_record.series_index[series_index_mapping_message_at]; at = at + 1; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = series_index_mapping_message_record.channel_id; at = at + 1;
  wire[at] = series_index_mapping_message_record.reserved_a_1; at = at + 1;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 2 -> wire[at] = series_index_mapping_message_record.market_id[series_index_mapping_message_at]; at = at + 1; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = series_index_mapping_message_record.system_id; at = at + 1;
  wire[at] = series_index_mapping_message_record.reserved_b_1; at = at + 1;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 2 -> wire[at] = series_index_mapping_message_record.stream_id[series_index_mapping_message_at]; at = at + 1; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 4 -> wire[at] = series_index_mapping_message_record.underlying_index[series_index_mapping_message_at]; at = at + 1; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 2 -> wire[at] = series_index_mapping_message_record.contract_multiplier[series_index_mapping_message_at]; at = at + 1; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 6 -> wire[at] = series_index_mapping_message_record.maturity_date[series_index_mapping_message_at]; at = at + 1; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = series_index_mapping_message_record.put_or_call; at = at + 1;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 10 -> wire[at] = series_index_mapping_message_record.strike_price[series_index_mapping_message_at]; at = at + 1; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = series_index_mapping_message_record.price_scale_code; at = at + 1;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 11 -> wire[at] = series_index_mapping_message_record.underlying_symbol[series_index_mapping_message_at]; at = at + 1; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 5 -> wire[at] = series_index_mapping_message_record.option_symbol_root[series_index_mapping_message_at]; at = at + 1; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 4 -> wire[at] = series_index_mapping_message_record.group_id[series_index_mapping_message_at]; at = at + 1; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* Series Index Mapping Message off the wire, 56 bytes from where the cursor stands */
inline decode_series_index_mapping_message(series_index_mapping_message_record) {
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 4 -> series_index_mapping_message_record.series_index[series_index_mapping_message_at] = wire[at]; at = at + 1; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_record.channel_id = wire[at]; at = at + 1;
  series_index_mapping_message_record.reserved_a_1 = wire[at]; at = at + 1;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 2 -> series_index_mapping_message_record.market_id[series_index_mapping_message_at] = wire[at]; at = at + 1; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_record.system_id = wire[at]; at = at + 1;
  series_index_mapping_message_record.reserved_b_1 = wire[at]; at = at + 1;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 2 -> series_index_mapping_message_record.stream_id[series_index_mapping_message_at] = wire[at]; at = at + 1; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 4 -> series_index_mapping_message_record.underlying_index[series_index_mapping_message_at] = wire[at]; at = at + 1; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 2 -> series_index_mapping_message_record.contract_multiplier[series_index_mapping_message_at] = wire[at]; at = at + 1; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 6 -> series_index_mapping_message_record.maturity_date[series_index_mapping_message_at] = wire[at]; at = at + 1; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_record.put_or_call = wire[at]; at = at + 1;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 10 -> series_index_mapping_message_record.strike_price[series_index_mapping_message_at] = wire[at]; at = at + 1; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_record.price_scale_code = wire[at]; at = at + 1;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 11 -> series_index_mapping_message_record.underlying_symbol[series_index_mapping_message_at] = wire[at]; at = at + 1; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 5 -> series_index_mapping_message_record.option_symbol_root[series_index_mapping_message_at] = wire[at]; at = at + 1; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 4 -> series_index_mapping_message_record.group_id[series_index_mapping_message_at] = wire[at]; at = at + 1; series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Series Index Mapping Message is what was written, byte for byte */
inline equal_series_index_mapping_message(series_index_mapping_message_read, series_index_mapping_message_written) {
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 4 -> assert(series_index_mapping_message_read.series_index[series_index_mapping_message_at] == series_index_mapping_message_written.series_index[series_index_mapping_message_at]); series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  assert(series_index_mapping_message_read.channel_id == series_index_mapping_message_written.channel_id);
  assert(series_index_mapping_message_read.reserved_a_1 == series_index_mapping_message_written.reserved_a_1);
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 2 -> assert(series_index_mapping_message_read.market_id[series_index_mapping_message_at] == series_index_mapping_message_written.market_id[series_index_mapping_message_at]); series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  assert(series_index_mapping_message_read.system_id == series_index_mapping_message_written.system_id);
  assert(series_index_mapping_message_read.reserved_b_1 == series_index_mapping_message_written.reserved_b_1);
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 2 -> assert(series_index_mapping_message_read.stream_id[series_index_mapping_message_at] == series_index_mapping_message_written.stream_id[series_index_mapping_message_at]); series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 4 -> assert(series_index_mapping_message_read.underlying_index[series_index_mapping_message_at] == series_index_mapping_message_written.underlying_index[series_index_mapping_message_at]); series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 2 -> assert(series_index_mapping_message_read.contract_multiplier[series_index_mapping_message_at] == series_index_mapping_message_written.contract_multiplier[series_index_mapping_message_at]); series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 6 -> assert(series_index_mapping_message_read.maturity_date[series_index_mapping_message_at] == series_index_mapping_message_written.maturity_date[series_index_mapping_message_at]); series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  assert(series_index_mapping_message_read.put_or_call == series_index_mapping_message_written.put_or_call);
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 10 -> assert(series_index_mapping_message_read.strike_price[series_index_mapping_message_at] == series_index_mapping_message_written.strike_price[series_index_mapping_message_at]); series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  assert(series_index_mapping_message_read.price_scale_code == series_index_mapping_message_written.price_scale_code);
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 11 -> assert(series_index_mapping_message_read.underlying_symbol[series_index_mapping_message_at] == series_index_mapping_message_written.underlying_symbol[series_index_mapping_message_at]); series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 5 -> assert(series_index_mapping_message_read.option_symbol_root[series_index_mapping_message_at] == series_index_mapping_message_written.option_symbol_root[series_index_mapping_message_at]); series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  series_index_mapping_message_at = 0;
  do
  :: series_index_mapping_message_at < 4 -> assert(series_index_mapping_message_read.group_id[series_index_mapping_message_at] == series_index_mapping_message_written.group_id[series_index_mapping_message_at]); series_index_mapping_message_at = series_index_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Stream Id Message: 4 bytes ---------------------------------------------- */

/* In all multicast channels, a Stream ID Message is sent immediately after each packet header to uniquely identify the source or Stream ID of the data in the packet. */
typedef StreamIdMessage {
  byte stream_id[2];
  byte reserved_2[2]
};

int stream_id_message_at;

/* every byte of Stream Id Message set to one value */
inline fill_stream_id_message(stream_id_message_record, stream_id_message_value) {
  stream_id_message_at = 0;
  do
  :: stream_id_message_at < 2 -> stream_id_message_record.stream_id[stream_id_message_at] = stream_id_message_value; stream_id_message_at = stream_id_message_at + 1
  :: else -> break
  od;
  stream_id_message_at = 0;
  do
  :: stream_id_message_at < 2 -> stream_id_message_record.reserved_2[stream_id_message_at] = stream_id_message_value; stream_id_message_at = stream_id_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Stream Id Message set to where it lies, so a field read out of place says so */
inline ramp_stream_id_message(stream_id_message_record, stream_id_message_base) {
  stream_id_message_at = 0;
  do
  :: stream_id_message_at < 2 -> stream_id_message_record.stream_id[stream_id_message_at] = (stream_id_message_base + 0 + stream_id_message_at + 1) % 256; stream_id_message_at = stream_id_message_at + 1
  :: else -> break
  od;
  stream_id_message_at = 0;
  do
  :: stream_id_message_at < 2 -> stream_id_message_record.reserved_2[stream_id_message_at] = (stream_id_message_base + 2 + stream_id_message_at + 1) % 256; stream_id_message_at = stream_id_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stream Id Message to the wire, 4 bytes from where the cursor stands */
inline encode_stream_id_message(stream_id_message_record) {
  stream_id_message_at = 0;
  do
  :: stream_id_message_at < 2 -> wire[at] = stream_id_message_record.stream_id[stream_id_message_at]; at = at + 1; stream_id_message_at = stream_id_message_at + 1
  :: else -> break
  od;
  stream_id_message_at = 0;
  do
  :: stream_id_message_at < 2 -> wire[at] = stream_id_message_record.reserved_2[stream_id_message_at]; at = at + 1; stream_id_message_at = stream_id_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stream Id Message off the wire, 4 bytes from where the cursor stands */
inline decode_stream_id_message(stream_id_message_record) {
  stream_id_message_at = 0;
  do
  :: stream_id_message_at < 2 -> stream_id_message_record.stream_id[stream_id_message_at] = wire[at]; at = at + 1; stream_id_message_at = stream_id_message_at + 1
  :: else -> break
  od;
  stream_id_message_at = 0;
  do
  :: stream_id_message_at < 2 -> stream_id_message_record.reserved_2[stream_id_message_at] = wire[at]; at = at + 1; stream_id_message_at = stream_id_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Stream Id Message is what was written, byte for byte */
inline equal_stream_id_message(stream_id_message_read, stream_id_message_written) {
  stream_id_message_at = 0;
  do
  :: stream_id_message_at < 2 -> assert(stream_id_message_read.stream_id[stream_id_message_at] == stream_id_message_written.stream_id[stream_id_message_at]); stream_id_message_at = stream_id_message_at + 1
  :: else -> break
  od;
  stream_id_message_at = 0;
  do
  :: stream_id_message_at < 2 -> assert(stream_id_message_read.reserved_2[stream_id_message_at] == stream_id_message_written.reserved_2[stream_id_message_at]); stream_id_message_at = stream_id_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sequence Number Reset Message: 10 bytes --------------------------------- */

/* This message is sent to reset the Message Sequence Number at start of day, or in response to failures. */
typedef SequenceNumberResetMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte product_id;
  byte channel_id
};

int sequence_number_reset_message_at;

/* every byte of Sequence Number Reset Message set to one value */
inline fill_sequence_number_reset_message(sequence_number_reset_message_record, sequence_number_reset_message_value) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> sequence_number_reset_message_record.source_time[sequence_number_reset_message_at] = sequence_number_reset_message_value; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> sequence_number_reset_message_record.source_time_ns[sequence_number_reset_message_at] = sequence_number_reset_message_value; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  sequence_number_reset_message_record.product_id = sequence_number_reset_message_value;
  sequence_number_reset_message_record.channel_id = sequence_number_reset_message_value;
  skip
}

/* each byte of Sequence Number Reset Message set to where it lies, so a field read out of place says so */
inline ramp_sequence_number_reset_message(sequence_number_reset_message_record, sequence_number_reset_message_base) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> sequence_number_reset_message_record.source_time[sequence_number_reset_message_at] = (sequence_number_reset_message_base + 0 + sequence_number_reset_message_at + 1) % 256; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> sequence_number_reset_message_record.source_time_ns[sequence_number_reset_message_at] = (sequence_number_reset_message_base + 4 + sequence_number_reset_message_at + 1) % 256; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  sequence_number_reset_message_record.product_id = (sequence_number_reset_message_base + 8 + 1) % 256;
  sequence_number_reset_message_record.channel_id = (sequence_number_reset_message_base + 9 + 1) % 256;
  skip
}

/* Sequence Number Reset Message to the wire, 10 bytes from where the cursor stands */
inline encode_sequence_number_reset_message(sequence_number_reset_message_record) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> wire[at] = sequence_number_reset_message_record.source_time[sequence_number_reset_message_at]; at = at + 1; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> wire[at] = sequence_number_reset_message_record.source_time_ns[sequence_number_reset_message_at]; at = at + 1; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  wire[at] = sequence_number_reset_message_record.product_id; at = at + 1;
  wire[at] = sequence_number_reset_message_record.channel_id; at = at + 1;
  skip
}

/* Sequence Number Reset Message off the wire, 10 bytes from where the cursor stands */
inline decode_sequence_number_reset_message(sequence_number_reset_message_record) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> sequence_number_reset_message_record.source_time[sequence_number_reset_message_at] = wire[at]; at = at + 1; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> sequence_number_reset_message_record.source_time_ns[sequence_number_reset_message_at] = wire[at]; at = at + 1; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  sequence_number_reset_message_record.product_id = wire[at]; at = at + 1;
  sequence_number_reset_message_record.channel_id = wire[at]; at = at + 1;
  skip
}

/* what was read of Sequence Number Reset Message is what was written, byte for byte */
inline equal_sequence_number_reset_message(sequence_number_reset_message_read, sequence_number_reset_message_written) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> assert(sequence_number_reset_message_read.source_time[sequence_number_reset_message_at] == sequence_number_reset_message_written.source_time[sequence_number_reset_message_at]); sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> assert(sequence_number_reset_message_read.source_time_ns[sequence_number_reset_message_at] == sequence_number_reset_message_written.source_time_ns[sequence_number_reset_message_at]); sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  assert(sequence_number_reset_message_read.product_id == sequence_number_reset_message_written.product_id);
  assert(sequence_number_reset_message_read.channel_id == sequence_number_reset_message_written.channel_id);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Send Time: encoded, read back, and compared */
proctype check_send_time() {
  SendTime send_time_sent;
  SendTime send_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_send_time(send_time_sent, 0)
  :: pattern == 1 -> fill_send_time(send_time_sent, 32)
  :: pattern == 2 -> fill_send_time(send_time_sent, 255)
  :: else -> ramp_send_time(send_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_send_time(send_time_sent);
    assert(at == 8);
    at = 0;
    decode_send_time(send_time_got);
    assert(at == 8);
    equal_send_time(send_time_got, send_time_sent)
  }
}

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

/* Outright Market Depth Buy Message: encoded, read back, and compared */
proctype check_outright_market_depth_buy_message() {
  OutrightMarketDepthBuyMessage outright_market_depth_buy_message_sent;
  OutrightMarketDepthBuyMessage outright_market_depth_buy_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_outright_market_depth_buy_message(outright_market_depth_buy_message_sent, 0)
  :: pattern == 1 -> fill_outright_market_depth_buy_message(outright_market_depth_buy_message_sent, 32)
  :: pattern == 2 -> fill_outright_market_depth_buy_message(outright_market_depth_buy_message_sent, 255)
  :: else -> ramp_outright_market_depth_buy_message(outright_market_depth_buy_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_outright_market_depth_buy_message(outright_market_depth_buy_message_sent);
    assert(at == 44);
    at = 0;
    decode_outright_market_depth_buy_message(outright_market_depth_buy_message_got);
    assert(at == 44);
    equal_outright_market_depth_buy_message(outright_market_depth_buy_message_got, outright_market_depth_buy_message_sent)
  }
}

/* Outright Market Depth Sell Message: encoded, read back, and compared */
proctype check_outright_market_depth_sell_message() {
  OutrightMarketDepthSellMessage outright_market_depth_sell_message_sent;
  OutrightMarketDepthSellMessage outright_market_depth_sell_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_outright_market_depth_sell_message(outright_market_depth_sell_message_sent, 0)
  :: pattern == 1 -> fill_outright_market_depth_sell_message(outright_market_depth_sell_message_sent, 32)
  :: pattern == 2 -> fill_outright_market_depth_sell_message(outright_market_depth_sell_message_sent, 255)
  :: else -> ramp_outright_market_depth_sell_message(outright_market_depth_sell_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_outright_market_depth_sell_message(outright_market_depth_sell_message_sent);
    assert(at == 44);
    at = 0;
    decode_outright_market_depth_sell_message(outright_market_depth_sell_message_got);
    assert(at == 44);
    equal_outright_market_depth_sell_message(outright_market_depth_sell_message_got, outright_market_depth_sell_message_sent)
  }
}

/* Underlying Status Message: encoded, read back, and compared */
proctype check_underlying_status_message() {
  UnderlyingStatusMessage underlying_status_message_sent;
  UnderlyingStatusMessage underlying_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_underlying_status_message(underlying_status_message_sent, 0)
  :: pattern == 1 -> fill_underlying_status_message(underlying_status_message_sent, 32)
  :: pattern == 2 -> fill_underlying_status_message(underlying_status_message_sent, 255)
  :: else -> ramp_underlying_status_message(underlying_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_underlying_status_message(underlying_status_message_sent);
    assert(at == 20);
    at = 0;
    decode_underlying_status_message(underlying_status_message_got);
    assert(at == 20);
    equal_underlying_status_message(underlying_status_message_got, underlying_status_message_sent)
  }
}

/* Outright Series Status Message: encoded, read back, and compared */
proctype check_outright_series_status_message() {
  OutrightSeriesStatusMessage outright_series_status_message_sent;
  OutrightSeriesStatusMessage outright_series_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_outright_series_status_message(outright_series_status_message_sent, 0)
  :: pattern == 1 -> fill_outright_series_status_message(outright_series_status_message_sent, 32)
  :: pattern == 2 -> fill_outright_series_status_message(outright_series_status_message_sent, 255)
  :: else -> ramp_outright_series_status_message(outright_series_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_outright_series_status_message(outright_series_status_message_sent);
    assert(at == 20);
    at = 0;
    decode_outright_series_status_message(outright_series_status_message_got);
    assert(at == 20);
    equal_outright_series_status_message(outright_series_status_message_got, outright_series_status_message_sent)
  }
}

/* Refresh Outright Market Depth Buy Message: encoded, read back, and compared */
proctype check_refresh_outright_market_depth_buy_message() {
  RefreshOutrightMarketDepthBuyMessage refresh_outright_market_depth_buy_message_sent;
  RefreshOutrightMarketDepthBuyMessage refresh_outright_market_depth_buy_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_refresh_outright_market_depth_buy_message(refresh_outright_market_depth_buy_message_sent, 0)
  :: pattern == 1 -> fill_refresh_outright_market_depth_buy_message(refresh_outright_market_depth_buy_message_sent, 32)
  :: pattern == 2 -> fill_refresh_outright_market_depth_buy_message(refresh_outright_market_depth_buy_message_sent, 255)
  :: else -> ramp_refresh_outright_market_depth_buy_message(refresh_outright_market_depth_buy_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_refresh_outright_market_depth_buy_message(refresh_outright_market_depth_buy_message_sent);
    assert(at == 44);
    at = 0;
    decode_refresh_outright_market_depth_buy_message(refresh_outright_market_depth_buy_message_got);
    assert(at == 44);
    equal_refresh_outright_market_depth_buy_message(refresh_outright_market_depth_buy_message_got, refresh_outright_market_depth_buy_message_sent)
  }
}

/* Refresh Outright Market Depth Sell Message: encoded, read back, and compared */
proctype check_refresh_outright_market_depth_sell_message() {
  RefreshOutrightMarketDepthSellMessage refresh_outright_market_depth_sell_message_sent;
  RefreshOutrightMarketDepthSellMessage refresh_outright_market_depth_sell_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_refresh_outright_market_depth_sell_message(refresh_outright_market_depth_sell_message_sent, 0)
  :: pattern == 1 -> fill_refresh_outright_market_depth_sell_message(refresh_outright_market_depth_sell_message_sent, 32)
  :: pattern == 2 -> fill_refresh_outright_market_depth_sell_message(refresh_outright_market_depth_sell_message_sent, 255)
  :: else -> ramp_refresh_outright_market_depth_sell_message(refresh_outright_market_depth_sell_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_refresh_outright_market_depth_sell_message(refresh_outright_market_depth_sell_message_sent);
    assert(at == 44);
    at = 0;
    decode_refresh_outright_market_depth_sell_message(refresh_outright_market_depth_sell_message_got);
    assert(at == 44);
    equal_refresh_outright_market_depth_sell_message(refresh_outright_market_depth_sell_message_got, refresh_outright_market_depth_sell_message_sent)
  }
}

/* Underlying Index Mapping Message: encoded, read back, and compared */
proctype check_underlying_index_mapping_message() {
  UnderlyingIndexMappingMessage underlying_index_mapping_message_sent;
  UnderlyingIndexMappingMessage underlying_index_mapping_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_underlying_index_mapping_message(underlying_index_mapping_message_sent, 0)
  :: pattern == 1 -> fill_underlying_index_mapping_message(underlying_index_mapping_message_sent, 32)
  :: pattern == 2 -> fill_underlying_index_mapping_message(underlying_index_mapping_message_sent, 255)
  :: else -> ramp_underlying_index_mapping_message(underlying_index_mapping_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_underlying_index_mapping_message(underlying_index_mapping_message_sent);
    assert(at == 24);
    at = 0;
    decode_underlying_index_mapping_message(underlying_index_mapping_message_got);
    assert(at == 24);
    equal_underlying_index_mapping_message(underlying_index_mapping_message_got, underlying_index_mapping_message_sent)
  }
}

/* Series Index Mapping Message: encoded, read back, and compared */
proctype check_series_index_mapping_message() {
  SeriesIndexMappingMessage series_index_mapping_message_sent;
  SeriesIndexMappingMessage series_index_mapping_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_series_index_mapping_message(series_index_mapping_message_sent, 0)
  :: pattern == 1 -> fill_series_index_mapping_message(series_index_mapping_message_sent, 32)
  :: pattern == 2 -> fill_series_index_mapping_message(series_index_mapping_message_sent, 255)
  :: else -> ramp_series_index_mapping_message(series_index_mapping_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_series_index_mapping_message(series_index_mapping_message_sent);
    assert(at == 56);
    at = 0;
    decode_series_index_mapping_message(series_index_mapping_message_got);
    assert(at == 56);
    equal_series_index_mapping_message(series_index_mapping_message_got, series_index_mapping_message_sent)
  }
}

/* Stream Id Message: encoded, read back, and compared */
proctype check_stream_id_message() {
  StreamIdMessage stream_id_message_sent;
  StreamIdMessage stream_id_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stream_id_message(stream_id_message_sent, 0)
  :: pattern == 1 -> fill_stream_id_message(stream_id_message_sent, 32)
  :: pattern == 2 -> fill_stream_id_message(stream_id_message_sent, 255)
  :: else -> ramp_stream_id_message(stream_id_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stream_id_message(stream_id_message_sent);
    assert(at == 4);
    at = 0;
    decode_stream_id_message(stream_id_message_got);
    assert(at == 4);
    equal_stream_id_message(stream_id_message_got, stream_id_message_sent)
  }
}

/* Sequence Number Reset Message: encoded, read back, and compared */
proctype check_sequence_number_reset_message() {
  SequenceNumberResetMessage sequence_number_reset_message_sent;
  SequenceNumberResetMessage sequence_number_reset_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequence_number_reset_message(sequence_number_reset_message_sent, 0)
  :: pattern == 1 -> fill_sequence_number_reset_message(sequence_number_reset_message_sent, 32)
  :: pattern == 2 -> fill_sequence_number_reset_message(sequence_number_reset_message_sent, 255)
  :: else -> ramp_sequence_number_reset_message(sequence_number_reset_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequence_number_reset_message(sequence_number_reset_message_sent);
    assert(at == 10);
    at = 0;
    decode_sequence_number_reset_message(sequence_number_reset_message_got);
    assert(at == 10);
    equal_sequence_number_reset_message(sequence_number_reset_message_got, sequence_number_reset_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_send_time()
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_outright_market_depth_buy_message()
  :: run check_outright_market_depth_sell_message()
  :: run check_underlying_status_message()
  :: run check_outright_series_status_message()
  :: run check_refresh_outright_market_depth_buy_message()
  :: run check_refresh_outright_market_depth_sell_message()
  :: run check_underlying_index_mapping_message()
  :: run check_series_index_mapping_message()
  :: run check_stream_id_message()
  :: run check_sequence_number_reset_message()
  fi
}
