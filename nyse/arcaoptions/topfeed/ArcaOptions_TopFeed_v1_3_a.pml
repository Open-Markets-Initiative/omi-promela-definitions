/*
 * New York Stock Exchange Top Feed
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

/* ---- Outright Quote Message: 36 bytes ---------------------------------------- */

/* The Outright Quote message provides the price and aggregated volume for the best bid and best offer. Volumes aggregate quote and order interest. The message also indicates aggregated Customer volumes within the overall volumes. */
typedef OutrightQuoteMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte series_index[4];
  byte symbol_seq_num[4];
  byte ask_price[4];
  byte bid_price[4];
  byte ask_volume[2];
  byte bid_volume[2];
  byte ask_customer_volume[2];
  byte bid_customer_volume[2];
  byte quote_condition;
  byte reserved_1;
  byte reserved_2[2]
};

int outright_quote_message_at;

/* every byte of Outright Quote Message set to one value */
inline fill_outright_quote_message(outright_quote_message_record, outright_quote_message_value) {
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> outright_quote_message_record.source_time[outright_quote_message_at] = outright_quote_message_value; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> outright_quote_message_record.source_time_ns[outright_quote_message_at] = outright_quote_message_value; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> outright_quote_message_record.series_index[outright_quote_message_at] = outright_quote_message_value; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> outright_quote_message_record.symbol_seq_num[outright_quote_message_at] = outright_quote_message_value; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> outright_quote_message_record.ask_price[outright_quote_message_at] = outright_quote_message_value; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> outright_quote_message_record.bid_price[outright_quote_message_at] = outright_quote_message_value; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 2 -> outright_quote_message_record.ask_volume[outright_quote_message_at] = outright_quote_message_value; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 2 -> outright_quote_message_record.bid_volume[outright_quote_message_at] = outright_quote_message_value; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 2 -> outright_quote_message_record.ask_customer_volume[outright_quote_message_at] = outright_quote_message_value; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 2 -> outright_quote_message_record.bid_customer_volume[outright_quote_message_at] = outright_quote_message_value; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_record.quote_condition = outright_quote_message_value;
  outright_quote_message_record.reserved_1 = outright_quote_message_value;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 2 -> outright_quote_message_record.reserved_2[outright_quote_message_at] = outright_quote_message_value; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Outright Quote Message set to where it lies, so a field read out of place says so */
inline ramp_outright_quote_message(outright_quote_message_record, outright_quote_message_base) {
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> outright_quote_message_record.source_time[outright_quote_message_at] = (outright_quote_message_base + 0 + outright_quote_message_at + 1) % 256; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> outright_quote_message_record.source_time_ns[outright_quote_message_at] = (outright_quote_message_base + 4 + outright_quote_message_at + 1) % 256; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> outright_quote_message_record.series_index[outright_quote_message_at] = (outright_quote_message_base + 8 + outright_quote_message_at + 1) % 256; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> outright_quote_message_record.symbol_seq_num[outright_quote_message_at] = (outright_quote_message_base + 12 + outright_quote_message_at + 1) % 256; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> outright_quote_message_record.ask_price[outright_quote_message_at] = (outright_quote_message_base + 16 + outright_quote_message_at + 1) % 256; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> outright_quote_message_record.bid_price[outright_quote_message_at] = (outright_quote_message_base + 20 + outright_quote_message_at + 1) % 256; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 2 -> outright_quote_message_record.ask_volume[outright_quote_message_at] = (outright_quote_message_base + 24 + outright_quote_message_at + 1) % 256; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 2 -> outright_quote_message_record.bid_volume[outright_quote_message_at] = (outright_quote_message_base + 26 + outright_quote_message_at + 1) % 256; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 2 -> outright_quote_message_record.ask_customer_volume[outright_quote_message_at] = (outright_quote_message_base + 28 + outright_quote_message_at + 1) % 256; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 2 -> outright_quote_message_record.bid_customer_volume[outright_quote_message_at] = (outright_quote_message_base + 30 + outright_quote_message_at + 1) % 256; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_record.quote_condition = (outright_quote_message_base + 32 + 1) % 256;
  outright_quote_message_record.reserved_1 = (outright_quote_message_base + 33 + 1) % 256;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 2 -> outright_quote_message_record.reserved_2[outright_quote_message_at] = (outright_quote_message_base + 34 + outright_quote_message_at + 1) % 256; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Outright Quote Message to the wire, 36 bytes from where the cursor stands */
inline encode_outright_quote_message(outright_quote_message_record) {
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> wire[at] = outright_quote_message_record.source_time[outright_quote_message_at]; at = at + 1; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> wire[at] = outright_quote_message_record.source_time_ns[outright_quote_message_at]; at = at + 1; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> wire[at] = outright_quote_message_record.series_index[outright_quote_message_at]; at = at + 1; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> wire[at] = outright_quote_message_record.symbol_seq_num[outright_quote_message_at]; at = at + 1; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> wire[at] = outright_quote_message_record.ask_price[outright_quote_message_at]; at = at + 1; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> wire[at] = outright_quote_message_record.bid_price[outright_quote_message_at]; at = at + 1; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 2 -> wire[at] = outright_quote_message_record.ask_volume[outright_quote_message_at]; at = at + 1; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 2 -> wire[at] = outright_quote_message_record.bid_volume[outright_quote_message_at]; at = at + 1; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 2 -> wire[at] = outright_quote_message_record.ask_customer_volume[outright_quote_message_at]; at = at + 1; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 2 -> wire[at] = outright_quote_message_record.bid_customer_volume[outright_quote_message_at]; at = at + 1; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = outright_quote_message_record.quote_condition; at = at + 1;
  wire[at] = outright_quote_message_record.reserved_1; at = at + 1;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 2 -> wire[at] = outright_quote_message_record.reserved_2[outright_quote_message_at]; at = at + 1; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Outright Quote Message off the wire, 36 bytes from where the cursor stands */
inline decode_outright_quote_message(outright_quote_message_record) {
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> outright_quote_message_record.source_time[outright_quote_message_at] = wire[at]; at = at + 1; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> outright_quote_message_record.source_time_ns[outright_quote_message_at] = wire[at]; at = at + 1; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> outright_quote_message_record.series_index[outright_quote_message_at] = wire[at]; at = at + 1; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> outright_quote_message_record.symbol_seq_num[outright_quote_message_at] = wire[at]; at = at + 1; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> outright_quote_message_record.ask_price[outright_quote_message_at] = wire[at]; at = at + 1; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> outright_quote_message_record.bid_price[outright_quote_message_at] = wire[at]; at = at + 1; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 2 -> outright_quote_message_record.ask_volume[outright_quote_message_at] = wire[at]; at = at + 1; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 2 -> outright_quote_message_record.bid_volume[outright_quote_message_at] = wire[at]; at = at + 1; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 2 -> outright_quote_message_record.ask_customer_volume[outright_quote_message_at] = wire[at]; at = at + 1; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 2 -> outright_quote_message_record.bid_customer_volume[outright_quote_message_at] = wire[at]; at = at + 1; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_record.quote_condition = wire[at]; at = at + 1;
  outright_quote_message_record.reserved_1 = wire[at]; at = at + 1;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 2 -> outright_quote_message_record.reserved_2[outright_quote_message_at] = wire[at]; at = at + 1; outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Outright Quote Message is what was written, byte for byte */
inline equal_outright_quote_message(outright_quote_message_read, outright_quote_message_written) {
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> assert(outright_quote_message_read.source_time[outright_quote_message_at] == outright_quote_message_written.source_time[outright_quote_message_at]); outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> assert(outright_quote_message_read.source_time_ns[outright_quote_message_at] == outright_quote_message_written.source_time_ns[outright_quote_message_at]); outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> assert(outright_quote_message_read.series_index[outright_quote_message_at] == outright_quote_message_written.series_index[outright_quote_message_at]); outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> assert(outright_quote_message_read.symbol_seq_num[outright_quote_message_at] == outright_quote_message_written.symbol_seq_num[outright_quote_message_at]); outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> assert(outright_quote_message_read.ask_price[outright_quote_message_at] == outright_quote_message_written.ask_price[outright_quote_message_at]); outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 4 -> assert(outright_quote_message_read.bid_price[outright_quote_message_at] == outright_quote_message_written.bid_price[outright_quote_message_at]); outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 2 -> assert(outright_quote_message_read.ask_volume[outright_quote_message_at] == outright_quote_message_written.ask_volume[outright_quote_message_at]); outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 2 -> assert(outright_quote_message_read.bid_volume[outright_quote_message_at] == outright_quote_message_written.bid_volume[outright_quote_message_at]); outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 2 -> assert(outright_quote_message_read.ask_customer_volume[outright_quote_message_at] == outright_quote_message_written.ask_customer_volume[outright_quote_message_at]); outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 2 -> assert(outright_quote_message_read.bid_customer_volume[outright_quote_message_at] == outright_quote_message_written.bid_customer_volume[outright_quote_message_at]); outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  assert(outright_quote_message_read.quote_condition == outright_quote_message_written.quote_condition);
  assert(outright_quote_message_read.reserved_1 == outright_quote_message_written.reserved_1);
  outright_quote_message_at = 0;
  do
  :: outright_quote_message_at < 2 -> assert(outright_quote_message_read.reserved_2[outright_quote_message_at] == outright_quote_message_written.reserved_2[outright_quote_message_at]); outright_quote_message_at = outright_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Outright Trade Message: 32 bytes ---------------------------------------- */

/* The Outright Trade message is used to publish all Last Sales for outright symbols. */
typedef OutrightTradeMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte series_index[4];
  byte symbol_seq_num[4];
  byte trade_id[4];
  byte price[4];
  byte volume_4[4];
  byte trade_cond_1;
  byte trade_cond_2;
  byte reserved_2[2]
};

int outright_trade_message_at;

/* every byte of Outright Trade Message set to one value */
inline fill_outright_trade_message(outright_trade_message_record, outright_trade_message_value) {
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> outright_trade_message_record.source_time[outright_trade_message_at] = outright_trade_message_value; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> outright_trade_message_record.source_time_ns[outright_trade_message_at] = outright_trade_message_value; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> outright_trade_message_record.series_index[outright_trade_message_at] = outright_trade_message_value; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> outright_trade_message_record.symbol_seq_num[outright_trade_message_at] = outright_trade_message_value; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> outright_trade_message_record.trade_id[outright_trade_message_at] = outright_trade_message_value; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> outright_trade_message_record.price[outright_trade_message_at] = outright_trade_message_value; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> outright_trade_message_record.volume_4[outright_trade_message_at] = outright_trade_message_value; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_record.trade_cond_1 = outright_trade_message_value;
  outright_trade_message_record.trade_cond_2 = outright_trade_message_value;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 2 -> outright_trade_message_record.reserved_2[outright_trade_message_at] = outright_trade_message_value; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Outright Trade Message set to where it lies, so a field read out of place says so */
inline ramp_outright_trade_message(outright_trade_message_record, outright_trade_message_base) {
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> outright_trade_message_record.source_time[outright_trade_message_at] = (outright_trade_message_base + 0 + outright_trade_message_at + 1) % 256; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> outright_trade_message_record.source_time_ns[outright_trade_message_at] = (outright_trade_message_base + 4 + outright_trade_message_at + 1) % 256; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> outright_trade_message_record.series_index[outright_trade_message_at] = (outright_trade_message_base + 8 + outright_trade_message_at + 1) % 256; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> outright_trade_message_record.symbol_seq_num[outright_trade_message_at] = (outright_trade_message_base + 12 + outright_trade_message_at + 1) % 256; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> outright_trade_message_record.trade_id[outright_trade_message_at] = (outright_trade_message_base + 16 + outright_trade_message_at + 1) % 256; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> outright_trade_message_record.price[outright_trade_message_at] = (outright_trade_message_base + 20 + outright_trade_message_at + 1) % 256; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> outright_trade_message_record.volume_4[outright_trade_message_at] = (outright_trade_message_base + 24 + outright_trade_message_at + 1) % 256; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_record.trade_cond_1 = (outright_trade_message_base + 28 + 1) % 256;
  outright_trade_message_record.trade_cond_2 = (outright_trade_message_base + 29 + 1) % 256;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 2 -> outright_trade_message_record.reserved_2[outright_trade_message_at] = (outright_trade_message_base + 30 + outright_trade_message_at + 1) % 256; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Outright Trade Message to the wire, 32 bytes from where the cursor stands */
inline encode_outright_trade_message(outright_trade_message_record) {
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> wire[at] = outright_trade_message_record.source_time[outright_trade_message_at]; at = at + 1; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> wire[at] = outright_trade_message_record.source_time_ns[outright_trade_message_at]; at = at + 1; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> wire[at] = outright_trade_message_record.series_index[outright_trade_message_at]; at = at + 1; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> wire[at] = outright_trade_message_record.symbol_seq_num[outright_trade_message_at]; at = at + 1; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> wire[at] = outright_trade_message_record.trade_id[outright_trade_message_at]; at = at + 1; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> wire[at] = outright_trade_message_record.price[outright_trade_message_at]; at = at + 1; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> wire[at] = outright_trade_message_record.volume_4[outright_trade_message_at]; at = at + 1; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = outright_trade_message_record.trade_cond_1; at = at + 1;
  wire[at] = outright_trade_message_record.trade_cond_2; at = at + 1;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 2 -> wire[at] = outright_trade_message_record.reserved_2[outright_trade_message_at]; at = at + 1; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Outright Trade Message off the wire, 32 bytes from where the cursor stands */
inline decode_outright_trade_message(outright_trade_message_record) {
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> outright_trade_message_record.source_time[outright_trade_message_at] = wire[at]; at = at + 1; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> outright_trade_message_record.source_time_ns[outright_trade_message_at] = wire[at]; at = at + 1; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> outright_trade_message_record.series_index[outright_trade_message_at] = wire[at]; at = at + 1; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> outright_trade_message_record.symbol_seq_num[outright_trade_message_at] = wire[at]; at = at + 1; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> outright_trade_message_record.trade_id[outright_trade_message_at] = wire[at]; at = at + 1; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> outright_trade_message_record.price[outright_trade_message_at] = wire[at]; at = at + 1; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> outright_trade_message_record.volume_4[outright_trade_message_at] = wire[at]; at = at + 1; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_record.trade_cond_1 = wire[at]; at = at + 1;
  outright_trade_message_record.trade_cond_2 = wire[at]; at = at + 1;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 2 -> outright_trade_message_record.reserved_2[outright_trade_message_at] = wire[at]; at = at + 1; outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Outright Trade Message is what was written, byte for byte */
inline equal_outright_trade_message(outright_trade_message_read, outright_trade_message_written) {
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> assert(outright_trade_message_read.source_time[outright_trade_message_at] == outright_trade_message_written.source_time[outright_trade_message_at]); outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> assert(outright_trade_message_read.source_time_ns[outright_trade_message_at] == outright_trade_message_written.source_time_ns[outright_trade_message_at]); outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> assert(outright_trade_message_read.series_index[outright_trade_message_at] == outright_trade_message_written.series_index[outright_trade_message_at]); outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> assert(outright_trade_message_read.symbol_seq_num[outright_trade_message_at] == outright_trade_message_written.symbol_seq_num[outright_trade_message_at]); outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> assert(outright_trade_message_read.trade_id[outright_trade_message_at] == outright_trade_message_written.trade_id[outright_trade_message_at]); outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> assert(outright_trade_message_read.price[outright_trade_message_at] == outright_trade_message_written.price[outright_trade_message_at]); outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 4 -> assert(outright_trade_message_read.volume_4[outright_trade_message_at] == outright_trade_message_written.volume_4[outright_trade_message_at]); outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  assert(outright_trade_message_read.trade_cond_1 == outright_trade_message_written.trade_cond_1);
  assert(outright_trade_message_read.trade_cond_2 == outright_trade_message_written.trade_cond_2);
  outright_trade_message_at = 0;
  do
  :: outright_trade_message_at < 2 -> assert(outright_trade_message_read.reserved_2[outright_trade_message_at] == outright_trade_message_written.reserved_2[outright_trade_message_at]); outright_trade_message_at = outright_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Outright Trade Cancel Message: 20 bytes --------------------------------- */

/* The Trade Cancel message is used to cancel or bust a trade. */
typedef OutrightTradeCancelMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte series_index[4];
  byte symbol_seq_num[4];
  byte original_trade_id[4]
};

int outright_trade_cancel_message_at;

/* every byte of Outright Trade Cancel Message set to one value */
inline fill_outright_trade_cancel_message(outright_trade_cancel_message_record, outright_trade_cancel_message_value) {
  outright_trade_cancel_message_at = 0;
  do
  :: outright_trade_cancel_message_at < 4 -> outright_trade_cancel_message_record.source_time[outright_trade_cancel_message_at] = outright_trade_cancel_message_value; outright_trade_cancel_message_at = outright_trade_cancel_message_at + 1
  :: else -> break
  od;
  outright_trade_cancel_message_at = 0;
  do
  :: outright_trade_cancel_message_at < 4 -> outright_trade_cancel_message_record.source_time_ns[outright_trade_cancel_message_at] = outright_trade_cancel_message_value; outright_trade_cancel_message_at = outright_trade_cancel_message_at + 1
  :: else -> break
  od;
  outright_trade_cancel_message_at = 0;
  do
  :: outright_trade_cancel_message_at < 4 -> outright_trade_cancel_message_record.series_index[outright_trade_cancel_message_at] = outright_trade_cancel_message_value; outright_trade_cancel_message_at = outright_trade_cancel_message_at + 1
  :: else -> break
  od;
  outright_trade_cancel_message_at = 0;
  do
  :: outright_trade_cancel_message_at < 4 -> outright_trade_cancel_message_record.symbol_seq_num[outright_trade_cancel_message_at] = outright_trade_cancel_message_value; outright_trade_cancel_message_at = outright_trade_cancel_message_at + 1
  :: else -> break
  od;
  outright_trade_cancel_message_at = 0;
  do
  :: outright_trade_cancel_message_at < 4 -> outright_trade_cancel_message_record.original_trade_id[outright_trade_cancel_message_at] = outright_trade_cancel_message_value; outright_trade_cancel_message_at = outright_trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Outright Trade Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_outright_trade_cancel_message(outright_trade_cancel_message_record, outright_trade_cancel_message_base) {
  outright_trade_cancel_message_at = 0;
  do
  :: outright_trade_cancel_message_at < 4 -> outright_trade_cancel_message_record.source_time[outright_trade_cancel_message_at] = (outright_trade_cancel_message_base + 0 + outright_trade_cancel_message_at + 1) % 256; outright_trade_cancel_message_at = outright_trade_cancel_message_at + 1
  :: else -> break
  od;
  outright_trade_cancel_message_at = 0;
  do
  :: outright_trade_cancel_message_at < 4 -> outright_trade_cancel_message_record.source_time_ns[outright_trade_cancel_message_at] = (outright_trade_cancel_message_base + 4 + outright_trade_cancel_message_at + 1) % 256; outright_trade_cancel_message_at = outright_trade_cancel_message_at + 1
  :: else -> break
  od;
  outright_trade_cancel_message_at = 0;
  do
  :: outright_trade_cancel_message_at < 4 -> outright_trade_cancel_message_record.series_index[outright_trade_cancel_message_at] = (outright_trade_cancel_message_base + 8 + outright_trade_cancel_message_at + 1) % 256; outright_trade_cancel_message_at = outright_trade_cancel_message_at + 1
  :: else -> break
  od;
  outright_trade_cancel_message_at = 0;
  do
  :: outright_trade_cancel_message_at < 4 -> outright_trade_cancel_message_record.symbol_seq_num[outright_trade_cancel_message_at] = (outright_trade_cancel_message_base + 12 + outright_trade_cancel_message_at + 1) % 256; outright_trade_cancel_message_at = outright_trade_cancel_message_at + 1
  :: else -> break
  od;
  outright_trade_cancel_message_at = 0;
  do
  :: outright_trade_cancel_message_at < 4 -> outright_trade_cancel_message_record.original_trade_id[outright_trade_cancel_message_at] = (outright_trade_cancel_message_base + 16 + outright_trade_cancel_message_at + 1) % 256; outright_trade_cancel_message_at = outright_trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Outright Trade Cancel Message to the wire, 20 bytes from where the cursor stands */
inline encode_outright_trade_cancel_message(outright_trade_cancel_message_record) {
  outright_trade_cancel_message_at = 0;
  do
  :: outright_trade_cancel_message_at < 4 -> wire[at] = outright_trade_cancel_message_record.source_time[outright_trade_cancel_message_at]; at = at + 1; outright_trade_cancel_message_at = outright_trade_cancel_message_at + 1
  :: else -> break
  od;
  outright_trade_cancel_message_at = 0;
  do
  :: outright_trade_cancel_message_at < 4 -> wire[at] = outright_trade_cancel_message_record.source_time_ns[outright_trade_cancel_message_at]; at = at + 1; outright_trade_cancel_message_at = outright_trade_cancel_message_at + 1
  :: else -> break
  od;
  outright_trade_cancel_message_at = 0;
  do
  :: outright_trade_cancel_message_at < 4 -> wire[at] = outright_trade_cancel_message_record.series_index[outright_trade_cancel_message_at]; at = at + 1; outright_trade_cancel_message_at = outright_trade_cancel_message_at + 1
  :: else -> break
  od;
  outright_trade_cancel_message_at = 0;
  do
  :: outright_trade_cancel_message_at < 4 -> wire[at] = outright_trade_cancel_message_record.symbol_seq_num[outright_trade_cancel_message_at]; at = at + 1; outright_trade_cancel_message_at = outright_trade_cancel_message_at + 1
  :: else -> break
  od;
  outright_trade_cancel_message_at = 0;
  do
  :: outright_trade_cancel_message_at < 4 -> wire[at] = outright_trade_cancel_message_record.original_trade_id[outright_trade_cancel_message_at]; at = at + 1; outright_trade_cancel_message_at = outright_trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Outright Trade Cancel Message off the wire, 20 bytes from where the cursor stands */
inline decode_outright_trade_cancel_message(outright_trade_cancel_message_record) {
  outright_trade_cancel_message_at = 0;
  do
  :: outright_trade_cancel_message_at < 4 -> outright_trade_cancel_message_record.source_time[outright_trade_cancel_message_at] = wire[at]; at = at + 1; outright_trade_cancel_message_at = outright_trade_cancel_message_at + 1
  :: else -> break
  od;
  outright_trade_cancel_message_at = 0;
  do
  :: outright_trade_cancel_message_at < 4 -> outright_trade_cancel_message_record.source_time_ns[outright_trade_cancel_message_at] = wire[at]; at = at + 1; outright_trade_cancel_message_at = outright_trade_cancel_message_at + 1
  :: else -> break
  od;
  outright_trade_cancel_message_at = 0;
  do
  :: outright_trade_cancel_message_at < 4 -> outright_trade_cancel_message_record.series_index[outright_trade_cancel_message_at] = wire[at]; at = at + 1; outright_trade_cancel_message_at = outright_trade_cancel_message_at + 1
  :: else -> break
  od;
  outright_trade_cancel_message_at = 0;
  do
  :: outright_trade_cancel_message_at < 4 -> outright_trade_cancel_message_record.symbol_seq_num[outright_trade_cancel_message_at] = wire[at]; at = at + 1; outright_trade_cancel_message_at = outright_trade_cancel_message_at + 1
  :: else -> break
  od;
  outright_trade_cancel_message_at = 0;
  do
  :: outright_trade_cancel_message_at < 4 -> outright_trade_cancel_message_record.original_trade_id[outright_trade_cancel_message_at] = wire[at]; at = at + 1; outright_trade_cancel_message_at = outright_trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Outright Trade Cancel Message is what was written, byte for byte */
inline equal_outright_trade_cancel_message(outright_trade_cancel_message_read, outright_trade_cancel_message_written) {
  outright_trade_cancel_message_at = 0;
  do
  :: outright_trade_cancel_message_at < 4 -> assert(outright_trade_cancel_message_read.source_time[outright_trade_cancel_message_at] == outright_trade_cancel_message_written.source_time[outright_trade_cancel_message_at]); outright_trade_cancel_message_at = outright_trade_cancel_message_at + 1
  :: else -> break
  od;
  outright_trade_cancel_message_at = 0;
  do
  :: outright_trade_cancel_message_at < 4 -> assert(outright_trade_cancel_message_read.source_time_ns[outright_trade_cancel_message_at] == outright_trade_cancel_message_written.source_time_ns[outright_trade_cancel_message_at]); outright_trade_cancel_message_at = outright_trade_cancel_message_at + 1
  :: else -> break
  od;
  outright_trade_cancel_message_at = 0;
  do
  :: outright_trade_cancel_message_at < 4 -> assert(outright_trade_cancel_message_read.series_index[outright_trade_cancel_message_at] == outright_trade_cancel_message_written.series_index[outright_trade_cancel_message_at]); outright_trade_cancel_message_at = outright_trade_cancel_message_at + 1
  :: else -> break
  od;
  outright_trade_cancel_message_at = 0;
  do
  :: outright_trade_cancel_message_at < 4 -> assert(outright_trade_cancel_message_read.symbol_seq_num[outright_trade_cancel_message_at] == outright_trade_cancel_message_written.symbol_seq_num[outright_trade_cancel_message_at]); outright_trade_cancel_message_at = outright_trade_cancel_message_at + 1
  :: else -> break
  od;
  outright_trade_cancel_message_at = 0;
  do
  :: outright_trade_cancel_message_at < 4 -> assert(outright_trade_cancel_message_read.original_trade_id[outright_trade_cancel_message_at] == outright_trade_cancel_message_written.original_trade_id[outright_trade_cancel_message_at]); outright_trade_cancel_message_at = outright_trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Outright Trade Correction Message: 36 bytes ----------------------------- */

/* The Trade Correction message is used to correct a trade. */
typedef OutrightTradeCorrectionMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte series_index[4];
  byte symbol_seq_num[4];
  byte original_trade_id[4];
  byte trade_id[4];
  byte price[4];
  byte volume_4[4];
  byte trade_cond_1;
  byte trade_cond_2;
  byte reserved_2[2]
};

int outright_trade_correction_message_at;

/* every byte of Outright Trade Correction Message set to one value */
inline fill_outright_trade_correction_message(outright_trade_correction_message_record, outright_trade_correction_message_value) {
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> outright_trade_correction_message_record.source_time[outright_trade_correction_message_at] = outright_trade_correction_message_value; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> outright_trade_correction_message_record.source_time_ns[outright_trade_correction_message_at] = outright_trade_correction_message_value; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> outright_trade_correction_message_record.series_index[outright_trade_correction_message_at] = outright_trade_correction_message_value; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> outright_trade_correction_message_record.symbol_seq_num[outright_trade_correction_message_at] = outright_trade_correction_message_value; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> outright_trade_correction_message_record.original_trade_id[outright_trade_correction_message_at] = outright_trade_correction_message_value; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> outright_trade_correction_message_record.trade_id[outright_trade_correction_message_at] = outright_trade_correction_message_value; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> outright_trade_correction_message_record.price[outright_trade_correction_message_at] = outright_trade_correction_message_value; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> outright_trade_correction_message_record.volume_4[outright_trade_correction_message_at] = outright_trade_correction_message_value; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_record.trade_cond_1 = outright_trade_correction_message_value;
  outright_trade_correction_message_record.trade_cond_2 = outright_trade_correction_message_value;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 2 -> outright_trade_correction_message_record.reserved_2[outright_trade_correction_message_at] = outright_trade_correction_message_value; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Outright Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_outright_trade_correction_message(outright_trade_correction_message_record, outright_trade_correction_message_base) {
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> outright_trade_correction_message_record.source_time[outright_trade_correction_message_at] = (outright_trade_correction_message_base + 0 + outright_trade_correction_message_at + 1) % 256; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> outright_trade_correction_message_record.source_time_ns[outright_trade_correction_message_at] = (outright_trade_correction_message_base + 4 + outright_trade_correction_message_at + 1) % 256; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> outright_trade_correction_message_record.series_index[outright_trade_correction_message_at] = (outright_trade_correction_message_base + 8 + outright_trade_correction_message_at + 1) % 256; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> outright_trade_correction_message_record.symbol_seq_num[outright_trade_correction_message_at] = (outright_trade_correction_message_base + 12 + outright_trade_correction_message_at + 1) % 256; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> outright_trade_correction_message_record.original_trade_id[outright_trade_correction_message_at] = (outright_trade_correction_message_base + 16 + outright_trade_correction_message_at + 1) % 256; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> outright_trade_correction_message_record.trade_id[outright_trade_correction_message_at] = (outright_trade_correction_message_base + 20 + outright_trade_correction_message_at + 1) % 256; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> outright_trade_correction_message_record.price[outright_trade_correction_message_at] = (outright_trade_correction_message_base + 24 + outright_trade_correction_message_at + 1) % 256; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> outright_trade_correction_message_record.volume_4[outright_trade_correction_message_at] = (outright_trade_correction_message_base + 28 + outright_trade_correction_message_at + 1) % 256; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_record.trade_cond_1 = (outright_trade_correction_message_base + 32 + 1) % 256;
  outright_trade_correction_message_record.trade_cond_2 = (outright_trade_correction_message_base + 33 + 1) % 256;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 2 -> outright_trade_correction_message_record.reserved_2[outright_trade_correction_message_at] = (outright_trade_correction_message_base + 34 + outright_trade_correction_message_at + 1) % 256; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Outright Trade Correction Message to the wire, 36 bytes from where the cursor stands */
inline encode_outright_trade_correction_message(outright_trade_correction_message_record) {
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> wire[at] = outright_trade_correction_message_record.source_time[outright_trade_correction_message_at]; at = at + 1; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> wire[at] = outright_trade_correction_message_record.source_time_ns[outright_trade_correction_message_at]; at = at + 1; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> wire[at] = outright_trade_correction_message_record.series_index[outright_trade_correction_message_at]; at = at + 1; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> wire[at] = outright_trade_correction_message_record.symbol_seq_num[outright_trade_correction_message_at]; at = at + 1; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> wire[at] = outright_trade_correction_message_record.original_trade_id[outright_trade_correction_message_at]; at = at + 1; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> wire[at] = outright_trade_correction_message_record.trade_id[outright_trade_correction_message_at]; at = at + 1; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> wire[at] = outright_trade_correction_message_record.price[outright_trade_correction_message_at]; at = at + 1; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> wire[at] = outright_trade_correction_message_record.volume_4[outright_trade_correction_message_at]; at = at + 1; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = outright_trade_correction_message_record.trade_cond_1; at = at + 1;
  wire[at] = outright_trade_correction_message_record.trade_cond_2; at = at + 1;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 2 -> wire[at] = outright_trade_correction_message_record.reserved_2[outright_trade_correction_message_at]; at = at + 1; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Outright Trade Correction Message off the wire, 36 bytes from where the cursor stands */
inline decode_outright_trade_correction_message(outright_trade_correction_message_record) {
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> outright_trade_correction_message_record.source_time[outright_trade_correction_message_at] = wire[at]; at = at + 1; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> outright_trade_correction_message_record.source_time_ns[outright_trade_correction_message_at] = wire[at]; at = at + 1; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> outright_trade_correction_message_record.series_index[outright_trade_correction_message_at] = wire[at]; at = at + 1; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> outright_trade_correction_message_record.symbol_seq_num[outright_trade_correction_message_at] = wire[at]; at = at + 1; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> outright_trade_correction_message_record.original_trade_id[outright_trade_correction_message_at] = wire[at]; at = at + 1; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> outright_trade_correction_message_record.trade_id[outright_trade_correction_message_at] = wire[at]; at = at + 1; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> outright_trade_correction_message_record.price[outright_trade_correction_message_at] = wire[at]; at = at + 1; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> outright_trade_correction_message_record.volume_4[outright_trade_correction_message_at] = wire[at]; at = at + 1; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_record.trade_cond_1 = wire[at]; at = at + 1;
  outright_trade_correction_message_record.trade_cond_2 = wire[at]; at = at + 1;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 2 -> outright_trade_correction_message_record.reserved_2[outright_trade_correction_message_at] = wire[at]; at = at + 1; outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Outright Trade Correction Message is what was written, byte for byte */
inline equal_outright_trade_correction_message(outright_trade_correction_message_read, outright_trade_correction_message_written) {
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> assert(outright_trade_correction_message_read.source_time[outright_trade_correction_message_at] == outright_trade_correction_message_written.source_time[outright_trade_correction_message_at]); outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> assert(outright_trade_correction_message_read.source_time_ns[outright_trade_correction_message_at] == outright_trade_correction_message_written.source_time_ns[outright_trade_correction_message_at]); outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> assert(outright_trade_correction_message_read.series_index[outright_trade_correction_message_at] == outright_trade_correction_message_written.series_index[outright_trade_correction_message_at]); outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> assert(outright_trade_correction_message_read.symbol_seq_num[outright_trade_correction_message_at] == outright_trade_correction_message_written.symbol_seq_num[outright_trade_correction_message_at]); outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> assert(outright_trade_correction_message_read.original_trade_id[outright_trade_correction_message_at] == outright_trade_correction_message_written.original_trade_id[outright_trade_correction_message_at]); outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> assert(outright_trade_correction_message_read.trade_id[outright_trade_correction_message_at] == outright_trade_correction_message_written.trade_id[outright_trade_correction_message_at]); outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> assert(outright_trade_correction_message_read.price[outright_trade_correction_message_at] == outright_trade_correction_message_written.price[outright_trade_correction_message_at]); outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 4 -> assert(outright_trade_correction_message_read.volume_4[outright_trade_correction_message_at] == outright_trade_correction_message_written.volume_4[outright_trade_correction_message_at]); outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  assert(outright_trade_correction_message_read.trade_cond_1 == outright_trade_correction_message_written.trade_cond_1);
  assert(outright_trade_correction_message_read.trade_cond_2 == outright_trade_correction_message_written.trade_cond_2);
  outright_trade_correction_message_at = 0;
  do
  :: outright_trade_correction_message_at < 2 -> assert(outright_trade_correction_message_read.reserved_2[outright_trade_correction_message_at] == outright_trade_correction_message_written.reserved_2[outright_trade_correction_message_at]); outright_trade_correction_message_at = outright_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Outright Imbalance Message: 32 bytes ------------------------------------ */

/* The Outright Imbalance message is sent during the Pre-opening phase or a symbol Halt to provide indicative opening price and net imbalance of all orders at that price which are orders eligible for next Auction. */
typedef OutrightImbalanceMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte series_index[4];
  byte symbol_seq_num[4];
  byte reference_price[4];
  byte paired_qty[2];
  byte total_imbalance_qty[2];
  byte market_imbalance_qty[2];
  byte auction_type;
  byte imbalance_side;
  byte market_imbalance_side;
  byte reserved_3[3]
};

int outright_imbalance_message_at;

/* every byte of Outright Imbalance Message set to one value */
inline fill_outright_imbalance_message(outright_imbalance_message_record, outright_imbalance_message_value) {
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 4 -> outright_imbalance_message_record.source_time[outright_imbalance_message_at] = outright_imbalance_message_value; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 4 -> outright_imbalance_message_record.source_time_ns[outright_imbalance_message_at] = outright_imbalance_message_value; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 4 -> outright_imbalance_message_record.series_index[outright_imbalance_message_at] = outright_imbalance_message_value; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 4 -> outright_imbalance_message_record.symbol_seq_num[outright_imbalance_message_at] = outright_imbalance_message_value; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 4 -> outright_imbalance_message_record.reference_price[outright_imbalance_message_at] = outright_imbalance_message_value; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 2 -> outright_imbalance_message_record.paired_qty[outright_imbalance_message_at] = outright_imbalance_message_value; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 2 -> outright_imbalance_message_record.total_imbalance_qty[outright_imbalance_message_at] = outright_imbalance_message_value; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 2 -> outright_imbalance_message_record.market_imbalance_qty[outright_imbalance_message_at] = outright_imbalance_message_value; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_record.auction_type = outright_imbalance_message_value;
  outright_imbalance_message_record.imbalance_side = outright_imbalance_message_value;
  outright_imbalance_message_record.market_imbalance_side = outright_imbalance_message_value;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 3 -> outright_imbalance_message_record.reserved_3[outright_imbalance_message_at] = outright_imbalance_message_value; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Outright Imbalance Message set to where it lies, so a field read out of place says so */
inline ramp_outright_imbalance_message(outright_imbalance_message_record, outright_imbalance_message_base) {
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 4 -> outright_imbalance_message_record.source_time[outright_imbalance_message_at] = (outright_imbalance_message_base + 0 + outright_imbalance_message_at + 1) % 256; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 4 -> outright_imbalance_message_record.source_time_ns[outright_imbalance_message_at] = (outright_imbalance_message_base + 4 + outright_imbalance_message_at + 1) % 256; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 4 -> outright_imbalance_message_record.series_index[outright_imbalance_message_at] = (outright_imbalance_message_base + 8 + outright_imbalance_message_at + 1) % 256; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 4 -> outright_imbalance_message_record.symbol_seq_num[outright_imbalance_message_at] = (outright_imbalance_message_base + 12 + outright_imbalance_message_at + 1) % 256; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 4 -> outright_imbalance_message_record.reference_price[outright_imbalance_message_at] = (outright_imbalance_message_base + 16 + outright_imbalance_message_at + 1) % 256; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 2 -> outright_imbalance_message_record.paired_qty[outright_imbalance_message_at] = (outright_imbalance_message_base + 20 + outright_imbalance_message_at + 1) % 256; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 2 -> outright_imbalance_message_record.total_imbalance_qty[outright_imbalance_message_at] = (outright_imbalance_message_base + 22 + outright_imbalance_message_at + 1) % 256; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 2 -> outright_imbalance_message_record.market_imbalance_qty[outright_imbalance_message_at] = (outright_imbalance_message_base + 24 + outright_imbalance_message_at + 1) % 256; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_record.auction_type = (outright_imbalance_message_base + 26 + 1) % 256;
  outright_imbalance_message_record.imbalance_side = (outright_imbalance_message_base + 27 + 1) % 256;
  outright_imbalance_message_record.market_imbalance_side = (outright_imbalance_message_base + 28 + 1) % 256;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 3 -> outright_imbalance_message_record.reserved_3[outright_imbalance_message_at] = (outright_imbalance_message_base + 29 + outright_imbalance_message_at + 1) % 256; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* Outright Imbalance Message to the wire, 32 bytes from where the cursor stands */
inline encode_outright_imbalance_message(outright_imbalance_message_record) {
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 4 -> wire[at] = outright_imbalance_message_record.source_time[outright_imbalance_message_at]; at = at + 1; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 4 -> wire[at] = outright_imbalance_message_record.source_time_ns[outright_imbalance_message_at]; at = at + 1; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 4 -> wire[at] = outright_imbalance_message_record.series_index[outright_imbalance_message_at]; at = at + 1; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 4 -> wire[at] = outright_imbalance_message_record.symbol_seq_num[outright_imbalance_message_at]; at = at + 1; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 4 -> wire[at] = outright_imbalance_message_record.reference_price[outright_imbalance_message_at]; at = at + 1; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 2 -> wire[at] = outright_imbalance_message_record.paired_qty[outright_imbalance_message_at]; at = at + 1; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 2 -> wire[at] = outright_imbalance_message_record.total_imbalance_qty[outright_imbalance_message_at]; at = at + 1; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 2 -> wire[at] = outright_imbalance_message_record.market_imbalance_qty[outright_imbalance_message_at]; at = at + 1; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  wire[at] = outright_imbalance_message_record.auction_type; at = at + 1;
  wire[at] = outright_imbalance_message_record.imbalance_side; at = at + 1;
  wire[at] = outright_imbalance_message_record.market_imbalance_side; at = at + 1;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 3 -> wire[at] = outright_imbalance_message_record.reserved_3[outright_imbalance_message_at]; at = at + 1; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* Outright Imbalance Message off the wire, 32 bytes from where the cursor stands */
inline decode_outright_imbalance_message(outright_imbalance_message_record) {
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 4 -> outright_imbalance_message_record.source_time[outright_imbalance_message_at] = wire[at]; at = at + 1; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 4 -> outright_imbalance_message_record.source_time_ns[outright_imbalance_message_at] = wire[at]; at = at + 1; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 4 -> outright_imbalance_message_record.series_index[outright_imbalance_message_at] = wire[at]; at = at + 1; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 4 -> outright_imbalance_message_record.symbol_seq_num[outright_imbalance_message_at] = wire[at]; at = at + 1; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 4 -> outright_imbalance_message_record.reference_price[outright_imbalance_message_at] = wire[at]; at = at + 1; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 2 -> outright_imbalance_message_record.paired_qty[outright_imbalance_message_at] = wire[at]; at = at + 1; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 2 -> outright_imbalance_message_record.total_imbalance_qty[outright_imbalance_message_at] = wire[at]; at = at + 1; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 2 -> outright_imbalance_message_record.market_imbalance_qty[outright_imbalance_message_at] = wire[at]; at = at + 1; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_record.auction_type = wire[at]; at = at + 1;
  outright_imbalance_message_record.imbalance_side = wire[at]; at = at + 1;
  outright_imbalance_message_record.market_imbalance_side = wire[at]; at = at + 1;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 3 -> outright_imbalance_message_record.reserved_3[outright_imbalance_message_at] = wire[at]; at = at + 1; outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Outright Imbalance Message is what was written, byte for byte */
inline equal_outright_imbalance_message(outright_imbalance_message_read, outright_imbalance_message_written) {
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 4 -> assert(outright_imbalance_message_read.source_time[outright_imbalance_message_at] == outright_imbalance_message_written.source_time[outright_imbalance_message_at]); outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 4 -> assert(outright_imbalance_message_read.source_time_ns[outright_imbalance_message_at] == outright_imbalance_message_written.source_time_ns[outright_imbalance_message_at]); outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 4 -> assert(outright_imbalance_message_read.series_index[outright_imbalance_message_at] == outright_imbalance_message_written.series_index[outright_imbalance_message_at]); outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 4 -> assert(outright_imbalance_message_read.symbol_seq_num[outright_imbalance_message_at] == outright_imbalance_message_written.symbol_seq_num[outright_imbalance_message_at]); outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 4 -> assert(outright_imbalance_message_read.reference_price[outright_imbalance_message_at] == outright_imbalance_message_written.reference_price[outright_imbalance_message_at]); outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 2 -> assert(outright_imbalance_message_read.paired_qty[outright_imbalance_message_at] == outright_imbalance_message_written.paired_qty[outright_imbalance_message_at]); outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 2 -> assert(outright_imbalance_message_read.total_imbalance_qty[outright_imbalance_message_at] == outright_imbalance_message_written.total_imbalance_qty[outright_imbalance_message_at]); outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 2 -> assert(outright_imbalance_message_read.market_imbalance_qty[outright_imbalance_message_at] == outright_imbalance_message_written.market_imbalance_qty[outright_imbalance_message_at]); outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  assert(outright_imbalance_message_read.auction_type == outright_imbalance_message_written.auction_type);
  assert(outright_imbalance_message_read.imbalance_side == outright_imbalance_message_written.imbalance_side);
  assert(outright_imbalance_message_read.market_imbalance_side == outright_imbalance_message_written.market_imbalance_side);
  outright_imbalance_message_at = 0;
  do
  :: outright_imbalance_message_at < 3 -> assert(outright_imbalance_message_read.reserved_3[outright_imbalance_message_at] == outright_imbalance_message_written.reserved_3[outright_imbalance_message_at]); outright_imbalance_message_at = outright_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Outright Crossing Rfq Message: 24 bytes --------------------------------- */

/* The Outright Crossing RFQ (Request for Quote) message is sent out in the event of an auction on an outright order. */
typedef OutrightCrossingRfqMessage {
  byte source_time[4];
  byte source_ns[4];
  byte series_index[4];
  byte symbol_seq_num[4];
  byte side;
  byte reserved_1;
  byte volume_2[2];
  byte price[4]
};

int outright_crossing_rfq_message_at;

/* every byte of Outright Crossing Rfq Message set to one value */
inline fill_outright_crossing_rfq_message(outright_crossing_rfq_message_record, outright_crossing_rfq_message_value) {
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 4 -> outright_crossing_rfq_message_record.source_time[outright_crossing_rfq_message_at] = outright_crossing_rfq_message_value; outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 4 -> outright_crossing_rfq_message_record.source_ns[outright_crossing_rfq_message_at] = outright_crossing_rfq_message_value; outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 4 -> outright_crossing_rfq_message_record.series_index[outright_crossing_rfq_message_at] = outright_crossing_rfq_message_value; outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 4 -> outright_crossing_rfq_message_record.symbol_seq_num[outright_crossing_rfq_message_at] = outright_crossing_rfq_message_value; outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  outright_crossing_rfq_message_record.side = outright_crossing_rfq_message_value;
  outright_crossing_rfq_message_record.reserved_1 = outright_crossing_rfq_message_value;
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 2 -> outright_crossing_rfq_message_record.volume_2[outright_crossing_rfq_message_at] = outright_crossing_rfq_message_value; outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 4 -> outright_crossing_rfq_message_record.price[outright_crossing_rfq_message_at] = outright_crossing_rfq_message_value; outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Outright Crossing Rfq Message set to where it lies, so a field read out of place says so */
inline ramp_outright_crossing_rfq_message(outright_crossing_rfq_message_record, outright_crossing_rfq_message_base) {
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 4 -> outright_crossing_rfq_message_record.source_time[outright_crossing_rfq_message_at] = (outright_crossing_rfq_message_base + 0 + outright_crossing_rfq_message_at + 1) % 256; outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 4 -> outright_crossing_rfq_message_record.source_ns[outright_crossing_rfq_message_at] = (outright_crossing_rfq_message_base + 4 + outright_crossing_rfq_message_at + 1) % 256; outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 4 -> outright_crossing_rfq_message_record.series_index[outright_crossing_rfq_message_at] = (outright_crossing_rfq_message_base + 8 + outright_crossing_rfq_message_at + 1) % 256; outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 4 -> outright_crossing_rfq_message_record.symbol_seq_num[outright_crossing_rfq_message_at] = (outright_crossing_rfq_message_base + 12 + outright_crossing_rfq_message_at + 1) % 256; outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  outright_crossing_rfq_message_record.side = (outright_crossing_rfq_message_base + 16 + 1) % 256;
  outright_crossing_rfq_message_record.reserved_1 = (outright_crossing_rfq_message_base + 17 + 1) % 256;
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 2 -> outright_crossing_rfq_message_record.volume_2[outright_crossing_rfq_message_at] = (outright_crossing_rfq_message_base + 18 + outright_crossing_rfq_message_at + 1) % 256; outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 4 -> outright_crossing_rfq_message_record.price[outright_crossing_rfq_message_at] = (outright_crossing_rfq_message_base + 20 + outright_crossing_rfq_message_at + 1) % 256; outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  skip
}

/* Outright Crossing Rfq Message to the wire, 24 bytes from where the cursor stands */
inline encode_outright_crossing_rfq_message(outright_crossing_rfq_message_record) {
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 4 -> wire[at] = outright_crossing_rfq_message_record.source_time[outright_crossing_rfq_message_at]; at = at + 1; outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 4 -> wire[at] = outright_crossing_rfq_message_record.source_ns[outright_crossing_rfq_message_at]; at = at + 1; outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 4 -> wire[at] = outright_crossing_rfq_message_record.series_index[outright_crossing_rfq_message_at]; at = at + 1; outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 4 -> wire[at] = outright_crossing_rfq_message_record.symbol_seq_num[outright_crossing_rfq_message_at]; at = at + 1; outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  wire[at] = outright_crossing_rfq_message_record.side; at = at + 1;
  wire[at] = outright_crossing_rfq_message_record.reserved_1; at = at + 1;
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 2 -> wire[at] = outright_crossing_rfq_message_record.volume_2[outright_crossing_rfq_message_at]; at = at + 1; outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 4 -> wire[at] = outright_crossing_rfq_message_record.price[outright_crossing_rfq_message_at]; at = at + 1; outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  skip
}

/* Outright Crossing Rfq Message off the wire, 24 bytes from where the cursor stands */
inline decode_outright_crossing_rfq_message(outright_crossing_rfq_message_record) {
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 4 -> outright_crossing_rfq_message_record.source_time[outright_crossing_rfq_message_at] = wire[at]; at = at + 1; outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 4 -> outright_crossing_rfq_message_record.source_ns[outright_crossing_rfq_message_at] = wire[at]; at = at + 1; outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 4 -> outright_crossing_rfq_message_record.series_index[outright_crossing_rfq_message_at] = wire[at]; at = at + 1; outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 4 -> outright_crossing_rfq_message_record.symbol_seq_num[outright_crossing_rfq_message_at] = wire[at]; at = at + 1; outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  outright_crossing_rfq_message_record.side = wire[at]; at = at + 1;
  outright_crossing_rfq_message_record.reserved_1 = wire[at]; at = at + 1;
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 2 -> outright_crossing_rfq_message_record.volume_2[outright_crossing_rfq_message_at] = wire[at]; at = at + 1; outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 4 -> outright_crossing_rfq_message_record.price[outright_crossing_rfq_message_at] = wire[at]; at = at + 1; outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Outright Crossing Rfq Message is what was written, byte for byte */
inline equal_outright_crossing_rfq_message(outright_crossing_rfq_message_read, outright_crossing_rfq_message_written) {
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 4 -> assert(outright_crossing_rfq_message_read.source_time[outright_crossing_rfq_message_at] == outright_crossing_rfq_message_written.source_time[outright_crossing_rfq_message_at]); outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 4 -> assert(outright_crossing_rfq_message_read.source_ns[outright_crossing_rfq_message_at] == outright_crossing_rfq_message_written.source_ns[outright_crossing_rfq_message_at]); outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 4 -> assert(outright_crossing_rfq_message_read.series_index[outright_crossing_rfq_message_at] == outright_crossing_rfq_message_written.series_index[outright_crossing_rfq_message_at]); outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 4 -> assert(outright_crossing_rfq_message_read.symbol_seq_num[outright_crossing_rfq_message_at] == outright_crossing_rfq_message_written.symbol_seq_num[outright_crossing_rfq_message_at]); outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  assert(outright_crossing_rfq_message_read.side == outright_crossing_rfq_message_written.side);
  assert(outright_crossing_rfq_message_read.reserved_1 == outright_crossing_rfq_message_written.reserved_1);
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 2 -> assert(outright_crossing_rfq_message_read.volume_2[outright_crossing_rfq_message_at] == outright_crossing_rfq_message_written.volume_2[outright_crossing_rfq_message_at]); outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  outright_crossing_rfq_message_at = 0;
  do
  :: outright_crossing_rfq_message_at < 4 -> assert(outright_crossing_rfq_message_read.price[outright_crossing_rfq_message_at] == outright_crossing_rfq_message_written.price[outright_crossing_rfq_message_at]); outright_crossing_rfq_message_at = outright_crossing_rfq_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Outright Bold Rfq Message: 28 bytes ------------------------------------- */

/* The Outright BOLD RFQ (Request for Quote) message notifies clients of a special exposure order (a BOLD order) available for execution on a first-come first-served basis. */
typedef OutrightBoldRfqMessage {
  byte source_time[4];
  byte source_ns[4];
  byte series_index[4];
  byte symbol_seq_num[4];
  byte side;
  byte capacity;
  byte contracts[2];
  byte price[4];
  byte participant[4]
};

int outright_bold_rfq_message_at;

/* every byte of Outright Bold Rfq Message set to one value */
inline fill_outright_bold_rfq_message(outright_bold_rfq_message_record, outright_bold_rfq_message_value) {
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> outright_bold_rfq_message_record.source_time[outright_bold_rfq_message_at] = outright_bold_rfq_message_value; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> outright_bold_rfq_message_record.source_ns[outright_bold_rfq_message_at] = outright_bold_rfq_message_value; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> outright_bold_rfq_message_record.series_index[outright_bold_rfq_message_at] = outright_bold_rfq_message_value; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> outright_bold_rfq_message_record.symbol_seq_num[outright_bold_rfq_message_at] = outright_bold_rfq_message_value; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_record.side = outright_bold_rfq_message_value;
  outright_bold_rfq_message_record.capacity = outright_bold_rfq_message_value;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 2 -> outright_bold_rfq_message_record.contracts[outright_bold_rfq_message_at] = outright_bold_rfq_message_value; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> outright_bold_rfq_message_record.price[outright_bold_rfq_message_at] = outright_bold_rfq_message_value; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> outright_bold_rfq_message_record.participant[outright_bold_rfq_message_at] = outright_bold_rfq_message_value; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Outright Bold Rfq Message set to where it lies, so a field read out of place says so */
inline ramp_outright_bold_rfq_message(outright_bold_rfq_message_record, outright_bold_rfq_message_base) {
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> outright_bold_rfq_message_record.source_time[outright_bold_rfq_message_at] = (outright_bold_rfq_message_base + 0 + outright_bold_rfq_message_at + 1) % 256; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> outright_bold_rfq_message_record.source_ns[outright_bold_rfq_message_at] = (outright_bold_rfq_message_base + 4 + outright_bold_rfq_message_at + 1) % 256; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> outright_bold_rfq_message_record.series_index[outright_bold_rfq_message_at] = (outright_bold_rfq_message_base + 8 + outright_bold_rfq_message_at + 1) % 256; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> outright_bold_rfq_message_record.symbol_seq_num[outright_bold_rfq_message_at] = (outright_bold_rfq_message_base + 12 + outright_bold_rfq_message_at + 1) % 256; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_record.side = (outright_bold_rfq_message_base + 16 + 1) % 256;
  outright_bold_rfq_message_record.capacity = (outright_bold_rfq_message_base + 17 + 1) % 256;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 2 -> outright_bold_rfq_message_record.contracts[outright_bold_rfq_message_at] = (outright_bold_rfq_message_base + 18 + outright_bold_rfq_message_at + 1) % 256; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> outright_bold_rfq_message_record.price[outright_bold_rfq_message_at] = (outright_bold_rfq_message_base + 20 + outright_bold_rfq_message_at + 1) % 256; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> outright_bold_rfq_message_record.participant[outright_bold_rfq_message_at] = (outright_bold_rfq_message_base + 24 + outright_bold_rfq_message_at + 1) % 256; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  skip
}

/* Outright Bold Rfq Message to the wire, 28 bytes from where the cursor stands */
inline encode_outright_bold_rfq_message(outright_bold_rfq_message_record) {
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> wire[at] = outright_bold_rfq_message_record.source_time[outright_bold_rfq_message_at]; at = at + 1; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> wire[at] = outright_bold_rfq_message_record.source_ns[outright_bold_rfq_message_at]; at = at + 1; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> wire[at] = outright_bold_rfq_message_record.series_index[outright_bold_rfq_message_at]; at = at + 1; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> wire[at] = outright_bold_rfq_message_record.symbol_seq_num[outright_bold_rfq_message_at]; at = at + 1; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  wire[at] = outright_bold_rfq_message_record.side; at = at + 1;
  wire[at] = outright_bold_rfq_message_record.capacity; at = at + 1;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 2 -> wire[at] = outright_bold_rfq_message_record.contracts[outright_bold_rfq_message_at]; at = at + 1; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> wire[at] = outright_bold_rfq_message_record.price[outright_bold_rfq_message_at]; at = at + 1; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> wire[at] = outright_bold_rfq_message_record.participant[outright_bold_rfq_message_at]; at = at + 1; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  skip
}

/* Outright Bold Rfq Message off the wire, 28 bytes from where the cursor stands */
inline decode_outright_bold_rfq_message(outright_bold_rfq_message_record) {
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> outright_bold_rfq_message_record.source_time[outright_bold_rfq_message_at] = wire[at]; at = at + 1; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> outright_bold_rfq_message_record.source_ns[outright_bold_rfq_message_at] = wire[at]; at = at + 1; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> outright_bold_rfq_message_record.series_index[outright_bold_rfq_message_at] = wire[at]; at = at + 1; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> outright_bold_rfq_message_record.symbol_seq_num[outright_bold_rfq_message_at] = wire[at]; at = at + 1; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_record.side = wire[at]; at = at + 1;
  outright_bold_rfq_message_record.capacity = wire[at]; at = at + 1;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 2 -> outright_bold_rfq_message_record.contracts[outright_bold_rfq_message_at] = wire[at]; at = at + 1; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> outright_bold_rfq_message_record.price[outright_bold_rfq_message_at] = wire[at]; at = at + 1; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> outright_bold_rfq_message_record.participant[outright_bold_rfq_message_at] = wire[at]; at = at + 1; outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Outright Bold Rfq Message is what was written, byte for byte */
inline equal_outright_bold_rfq_message(outright_bold_rfq_message_read, outright_bold_rfq_message_written) {
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> assert(outright_bold_rfq_message_read.source_time[outright_bold_rfq_message_at] == outright_bold_rfq_message_written.source_time[outright_bold_rfq_message_at]); outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> assert(outright_bold_rfq_message_read.source_ns[outright_bold_rfq_message_at] == outright_bold_rfq_message_written.source_ns[outright_bold_rfq_message_at]); outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> assert(outright_bold_rfq_message_read.series_index[outright_bold_rfq_message_at] == outright_bold_rfq_message_written.series_index[outright_bold_rfq_message_at]); outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> assert(outright_bold_rfq_message_read.symbol_seq_num[outright_bold_rfq_message_at] == outright_bold_rfq_message_written.symbol_seq_num[outright_bold_rfq_message_at]); outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  assert(outright_bold_rfq_message_read.side == outright_bold_rfq_message_written.side);
  assert(outright_bold_rfq_message_read.capacity == outright_bold_rfq_message_written.capacity);
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 2 -> assert(outright_bold_rfq_message_read.contracts[outright_bold_rfq_message_at] == outright_bold_rfq_message_written.contracts[outright_bold_rfq_message_at]); outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> assert(outright_bold_rfq_message_read.price[outright_bold_rfq_message_at] == outright_bold_rfq_message_written.price[outright_bold_rfq_message_at]); outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  outright_bold_rfq_message_at = 0;
  do
  :: outright_bold_rfq_message_at < 4 -> assert(outright_bold_rfq_message_read.participant[outright_bold_rfq_message_at] == outright_bold_rfq_message_written.participant[outright_bold_rfq_message_at]); outright_bold_rfq_message_at = outright_bold_rfq_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Outright Summary Message: 36 bytes -------------------------------------- */

/* The Outright summary message provides trading highlights of the day. It is sent out once at the end of the trading day as soon as a symbol closes. */
typedef OutrightSummaryMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte series_index[4];
  byte symbol_seq_num[4];
  byte high_price[4];
  byte low_price[4];
  byte open[4];
  byte close[4];
  byte total_volume[4]
};

int outright_summary_message_at;

/* every byte of Outright Summary Message set to one value */
inline fill_outright_summary_message(outright_summary_message_record, outright_summary_message_value) {
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.source_time[outright_summary_message_at] = outright_summary_message_value; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.source_time_ns[outright_summary_message_at] = outright_summary_message_value; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.series_index[outright_summary_message_at] = outright_summary_message_value; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.symbol_seq_num[outright_summary_message_at] = outright_summary_message_value; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.high_price[outright_summary_message_at] = outright_summary_message_value; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.low_price[outright_summary_message_at] = outright_summary_message_value; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.open[outright_summary_message_at] = outright_summary_message_value; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.close[outright_summary_message_at] = outright_summary_message_value; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.total_volume[outright_summary_message_at] = outright_summary_message_value; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Outright Summary Message set to where it lies, so a field read out of place says so */
inline ramp_outright_summary_message(outright_summary_message_record, outright_summary_message_base) {
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.source_time[outright_summary_message_at] = (outright_summary_message_base + 0 + outright_summary_message_at + 1) % 256; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.source_time_ns[outright_summary_message_at] = (outright_summary_message_base + 4 + outright_summary_message_at + 1) % 256; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.series_index[outright_summary_message_at] = (outright_summary_message_base + 8 + outright_summary_message_at + 1) % 256; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.symbol_seq_num[outright_summary_message_at] = (outright_summary_message_base + 12 + outright_summary_message_at + 1) % 256; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.high_price[outright_summary_message_at] = (outright_summary_message_base + 16 + outright_summary_message_at + 1) % 256; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.low_price[outright_summary_message_at] = (outright_summary_message_base + 20 + outright_summary_message_at + 1) % 256; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.open[outright_summary_message_at] = (outright_summary_message_base + 24 + outright_summary_message_at + 1) % 256; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.close[outright_summary_message_at] = (outright_summary_message_base + 28 + outright_summary_message_at + 1) % 256; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.total_volume[outright_summary_message_at] = (outright_summary_message_base + 32 + outright_summary_message_at + 1) % 256; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Outright Summary Message to the wire, 36 bytes from where the cursor stands */
inline encode_outright_summary_message(outright_summary_message_record) {
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> wire[at] = outright_summary_message_record.source_time[outright_summary_message_at]; at = at + 1; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> wire[at] = outright_summary_message_record.source_time_ns[outright_summary_message_at]; at = at + 1; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> wire[at] = outright_summary_message_record.series_index[outright_summary_message_at]; at = at + 1; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> wire[at] = outright_summary_message_record.symbol_seq_num[outright_summary_message_at]; at = at + 1; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> wire[at] = outright_summary_message_record.high_price[outright_summary_message_at]; at = at + 1; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> wire[at] = outright_summary_message_record.low_price[outright_summary_message_at]; at = at + 1; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> wire[at] = outright_summary_message_record.open[outright_summary_message_at]; at = at + 1; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> wire[at] = outright_summary_message_record.close[outright_summary_message_at]; at = at + 1; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> wire[at] = outright_summary_message_record.total_volume[outright_summary_message_at]; at = at + 1; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Outright Summary Message off the wire, 36 bytes from where the cursor stands */
inline decode_outright_summary_message(outright_summary_message_record) {
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.source_time[outright_summary_message_at] = wire[at]; at = at + 1; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.source_time_ns[outright_summary_message_at] = wire[at]; at = at + 1; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.series_index[outright_summary_message_at] = wire[at]; at = at + 1; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.symbol_seq_num[outright_summary_message_at] = wire[at]; at = at + 1; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.high_price[outright_summary_message_at] = wire[at]; at = at + 1; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.low_price[outright_summary_message_at] = wire[at]; at = at + 1; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.open[outright_summary_message_at] = wire[at]; at = at + 1; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.close[outright_summary_message_at] = wire[at]; at = at + 1; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> outright_summary_message_record.total_volume[outright_summary_message_at] = wire[at]; at = at + 1; outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Outright Summary Message is what was written, byte for byte */
inline equal_outright_summary_message(outright_summary_message_read, outright_summary_message_written) {
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> assert(outright_summary_message_read.source_time[outright_summary_message_at] == outright_summary_message_written.source_time[outright_summary_message_at]); outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> assert(outright_summary_message_read.source_time_ns[outright_summary_message_at] == outright_summary_message_written.source_time_ns[outright_summary_message_at]); outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> assert(outright_summary_message_read.series_index[outright_summary_message_at] == outright_summary_message_written.series_index[outright_summary_message_at]); outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> assert(outright_summary_message_read.symbol_seq_num[outright_summary_message_at] == outright_summary_message_written.symbol_seq_num[outright_summary_message_at]); outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> assert(outright_summary_message_read.high_price[outright_summary_message_at] == outright_summary_message_written.high_price[outright_summary_message_at]); outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> assert(outright_summary_message_read.low_price[outright_summary_message_at] == outright_summary_message_written.low_price[outright_summary_message_at]); outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> assert(outright_summary_message_read.open[outright_summary_message_at] == outright_summary_message_written.open[outright_summary_message_at]); outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> assert(outright_summary_message_read.close[outright_summary_message_at] == outright_summary_message_written.close[outright_summary_message_at]); outright_summary_message_at = outright_summary_message_at + 1
  :: else -> break
  od;
  outright_summary_message_at = 0;
  do
  :: outright_summary_message_at < 4 -> assert(outright_summary_message_read.total_volume[outright_summary_message_at] == outright_summary_message_written.total_volume[outright_summary_message_at]); outright_summary_message_at = outright_summary_message_at + 1
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

/* ---- Refresh Outright Quote Message: 36 bytes -------------------------------- */

/* The Refresh Quote message is sent in the event no quote messages are published for the symbol for 2 consecutive minutes. */
typedef RefreshOutrightQuoteMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte series_index[4];
  byte symbol_seq_num[4];
  byte ask_price[4];
  byte bid_price[4];
  byte ask_volume[2];
  byte bid_volume[2];
  byte ask_customer_volume[2];
  byte bid_customer_volume[2];
  byte quote_condition;
  byte reserved_1;
  byte reserved_2[2]
};

int refresh_outright_quote_message_at;

/* every byte of Refresh Outright Quote Message set to one value */
inline fill_refresh_outright_quote_message(refresh_outright_quote_message_record, refresh_outright_quote_message_value) {
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> refresh_outright_quote_message_record.source_time[refresh_outright_quote_message_at] = refresh_outright_quote_message_value; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> refresh_outright_quote_message_record.source_time_ns[refresh_outright_quote_message_at] = refresh_outright_quote_message_value; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> refresh_outright_quote_message_record.series_index[refresh_outright_quote_message_at] = refresh_outright_quote_message_value; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> refresh_outright_quote_message_record.symbol_seq_num[refresh_outright_quote_message_at] = refresh_outright_quote_message_value; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> refresh_outright_quote_message_record.ask_price[refresh_outright_quote_message_at] = refresh_outright_quote_message_value; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> refresh_outright_quote_message_record.bid_price[refresh_outright_quote_message_at] = refresh_outright_quote_message_value; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 2 -> refresh_outright_quote_message_record.ask_volume[refresh_outright_quote_message_at] = refresh_outright_quote_message_value; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 2 -> refresh_outright_quote_message_record.bid_volume[refresh_outright_quote_message_at] = refresh_outright_quote_message_value; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 2 -> refresh_outright_quote_message_record.ask_customer_volume[refresh_outright_quote_message_at] = refresh_outright_quote_message_value; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 2 -> refresh_outright_quote_message_record.bid_customer_volume[refresh_outright_quote_message_at] = refresh_outright_quote_message_value; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_record.quote_condition = refresh_outright_quote_message_value;
  refresh_outright_quote_message_record.reserved_1 = refresh_outright_quote_message_value;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 2 -> refresh_outright_quote_message_record.reserved_2[refresh_outright_quote_message_at] = refresh_outright_quote_message_value; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Refresh Outright Quote Message set to where it lies, so a field read out of place says so */
inline ramp_refresh_outright_quote_message(refresh_outright_quote_message_record, refresh_outright_quote_message_base) {
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> refresh_outright_quote_message_record.source_time[refresh_outright_quote_message_at] = (refresh_outright_quote_message_base + 0 + refresh_outright_quote_message_at + 1) % 256; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> refresh_outright_quote_message_record.source_time_ns[refresh_outright_quote_message_at] = (refresh_outright_quote_message_base + 4 + refresh_outright_quote_message_at + 1) % 256; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> refresh_outright_quote_message_record.series_index[refresh_outright_quote_message_at] = (refresh_outright_quote_message_base + 8 + refresh_outright_quote_message_at + 1) % 256; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> refresh_outright_quote_message_record.symbol_seq_num[refresh_outright_quote_message_at] = (refresh_outright_quote_message_base + 12 + refresh_outright_quote_message_at + 1) % 256; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> refresh_outright_quote_message_record.ask_price[refresh_outright_quote_message_at] = (refresh_outright_quote_message_base + 16 + refresh_outright_quote_message_at + 1) % 256; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> refresh_outright_quote_message_record.bid_price[refresh_outright_quote_message_at] = (refresh_outright_quote_message_base + 20 + refresh_outright_quote_message_at + 1) % 256; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 2 -> refresh_outright_quote_message_record.ask_volume[refresh_outright_quote_message_at] = (refresh_outright_quote_message_base + 24 + refresh_outright_quote_message_at + 1) % 256; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 2 -> refresh_outright_quote_message_record.bid_volume[refresh_outright_quote_message_at] = (refresh_outright_quote_message_base + 26 + refresh_outright_quote_message_at + 1) % 256; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 2 -> refresh_outright_quote_message_record.ask_customer_volume[refresh_outright_quote_message_at] = (refresh_outright_quote_message_base + 28 + refresh_outright_quote_message_at + 1) % 256; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 2 -> refresh_outright_quote_message_record.bid_customer_volume[refresh_outright_quote_message_at] = (refresh_outright_quote_message_base + 30 + refresh_outright_quote_message_at + 1) % 256; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_record.quote_condition = (refresh_outright_quote_message_base + 32 + 1) % 256;
  refresh_outright_quote_message_record.reserved_1 = (refresh_outright_quote_message_base + 33 + 1) % 256;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 2 -> refresh_outright_quote_message_record.reserved_2[refresh_outright_quote_message_at] = (refresh_outright_quote_message_base + 34 + refresh_outright_quote_message_at + 1) % 256; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Outright Quote Message to the wire, 36 bytes from where the cursor stands */
inline encode_refresh_outright_quote_message(refresh_outright_quote_message_record) {
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> wire[at] = refresh_outright_quote_message_record.source_time[refresh_outright_quote_message_at]; at = at + 1; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> wire[at] = refresh_outright_quote_message_record.source_time_ns[refresh_outright_quote_message_at]; at = at + 1; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> wire[at] = refresh_outright_quote_message_record.series_index[refresh_outright_quote_message_at]; at = at + 1; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> wire[at] = refresh_outright_quote_message_record.symbol_seq_num[refresh_outright_quote_message_at]; at = at + 1; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> wire[at] = refresh_outright_quote_message_record.ask_price[refresh_outright_quote_message_at]; at = at + 1; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> wire[at] = refresh_outright_quote_message_record.bid_price[refresh_outright_quote_message_at]; at = at + 1; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 2 -> wire[at] = refresh_outright_quote_message_record.ask_volume[refresh_outright_quote_message_at]; at = at + 1; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 2 -> wire[at] = refresh_outright_quote_message_record.bid_volume[refresh_outright_quote_message_at]; at = at + 1; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 2 -> wire[at] = refresh_outright_quote_message_record.ask_customer_volume[refresh_outright_quote_message_at]; at = at + 1; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 2 -> wire[at] = refresh_outright_quote_message_record.bid_customer_volume[refresh_outright_quote_message_at]; at = at + 1; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = refresh_outright_quote_message_record.quote_condition; at = at + 1;
  wire[at] = refresh_outright_quote_message_record.reserved_1; at = at + 1;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 2 -> wire[at] = refresh_outright_quote_message_record.reserved_2[refresh_outright_quote_message_at]; at = at + 1; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Outright Quote Message off the wire, 36 bytes from where the cursor stands */
inline decode_refresh_outright_quote_message(refresh_outright_quote_message_record) {
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> refresh_outright_quote_message_record.source_time[refresh_outright_quote_message_at] = wire[at]; at = at + 1; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> refresh_outright_quote_message_record.source_time_ns[refresh_outright_quote_message_at] = wire[at]; at = at + 1; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> refresh_outright_quote_message_record.series_index[refresh_outright_quote_message_at] = wire[at]; at = at + 1; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> refresh_outright_quote_message_record.symbol_seq_num[refresh_outright_quote_message_at] = wire[at]; at = at + 1; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> refresh_outright_quote_message_record.ask_price[refresh_outright_quote_message_at] = wire[at]; at = at + 1; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> refresh_outright_quote_message_record.bid_price[refresh_outright_quote_message_at] = wire[at]; at = at + 1; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 2 -> refresh_outright_quote_message_record.ask_volume[refresh_outright_quote_message_at] = wire[at]; at = at + 1; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 2 -> refresh_outright_quote_message_record.bid_volume[refresh_outright_quote_message_at] = wire[at]; at = at + 1; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 2 -> refresh_outright_quote_message_record.ask_customer_volume[refresh_outright_quote_message_at] = wire[at]; at = at + 1; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 2 -> refresh_outright_quote_message_record.bid_customer_volume[refresh_outright_quote_message_at] = wire[at]; at = at + 1; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_record.quote_condition = wire[at]; at = at + 1;
  refresh_outright_quote_message_record.reserved_1 = wire[at]; at = at + 1;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 2 -> refresh_outright_quote_message_record.reserved_2[refresh_outright_quote_message_at] = wire[at]; at = at + 1; refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Refresh Outright Quote Message is what was written, byte for byte */
inline equal_refresh_outright_quote_message(refresh_outright_quote_message_read, refresh_outright_quote_message_written) {
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> assert(refresh_outright_quote_message_read.source_time[refresh_outright_quote_message_at] == refresh_outright_quote_message_written.source_time[refresh_outright_quote_message_at]); refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> assert(refresh_outright_quote_message_read.source_time_ns[refresh_outright_quote_message_at] == refresh_outright_quote_message_written.source_time_ns[refresh_outright_quote_message_at]); refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> assert(refresh_outright_quote_message_read.series_index[refresh_outright_quote_message_at] == refresh_outright_quote_message_written.series_index[refresh_outright_quote_message_at]); refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> assert(refresh_outright_quote_message_read.symbol_seq_num[refresh_outright_quote_message_at] == refresh_outright_quote_message_written.symbol_seq_num[refresh_outright_quote_message_at]); refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> assert(refresh_outright_quote_message_read.ask_price[refresh_outright_quote_message_at] == refresh_outright_quote_message_written.ask_price[refresh_outright_quote_message_at]); refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 4 -> assert(refresh_outright_quote_message_read.bid_price[refresh_outright_quote_message_at] == refresh_outright_quote_message_written.bid_price[refresh_outright_quote_message_at]); refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 2 -> assert(refresh_outright_quote_message_read.ask_volume[refresh_outright_quote_message_at] == refresh_outright_quote_message_written.ask_volume[refresh_outright_quote_message_at]); refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 2 -> assert(refresh_outright_quote_message_read.bid_volume[refresh_outright_quote_message_at] == refresh_outright_quote_message_written.bid_volume[refresh_outright_quote_message_at]); refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 2 -> assert(refresh_outright_quote_message_read.ask_customer_volume[refresh_outright_quote_message_at] == refresh_outright_quote_message_written.ask_customer_volume[refresh_outright_quote_message_at]); refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 2 -> assert(refresh_outright_quote_message_read.bid_customer_volume[refresh_outright_quote_message_at] == refresh_outright_quote_message_written.bid_customer_volume[refresh_outright_quote_message_at]); refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  assert(refresh_outright_quote_message_read.quote_condition == refresh_outright_quote_message_written.quote_condition);
  assert(refresh_outright_quote_message_read.reserved_1 == refresh_outright_quote_message_written.reserved_1);
  refresh_outright_quote_message_at = 0;
  do
  :: refresh_outright_quote_message_at < 2 -> assert(refresh_outright_quote_message_read.reserved_2[refresh_outright_quote_message_at] == refresh_outright_quote_message_written.reserved_2[refresh_outright_quote_message_at]); refresh_outright_quote_message_at = refresh_outright_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Refresh Outright Trade Message: 32 bytes -------------------------------- */

/* The Refresh Outright Trade message is sent in the event no Outright Trade messages are published for the symbol for 2 consecutive minutes. */
typedef RefreshOutrightTradeMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte series_index[4];
  byte symbol_seq_num[4];
  byte trade_id[4];
  byte price[4];
  byte volume_4[4];
  byte trade_cond_1;
  byte trade_cond_2;
  byte reserved_2[2]
};

int refresh_outright_trade_message_at;

/* every byte of Refresh Outright Trade Message set to one value */
inline fill_refresh_outright_trade_message(refresh_outright_trade_message_record, refresh_outright_trade_message_value) {
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> refresh_outright_trade_message_record.source_time[refresh_outright_trade_message_at] = refresh_outright_trade_message_value; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> refresh_outright_trade_message_record.source_time_ns[refresh_outright_trade_message_at] = refresh_outright_trade_message_value; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> refresh_outright_trade_message_record.series_index[refresh_outright_trade_message_at] = refresh_outright_trade_message_value; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> refresh_outright_trade_message_record.symbol_seq_num[refresh_outright_trade_message_at] = refresh_outright_trade_message_value; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> refresh_outright_trade_message_record.trade_id[refresh_outright_trade_message_at] = refresh_outright_trade_message_value; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> refresh_outright_trade_message_record.price[refresh_outright_trade_message_at] = refresh_outright_trade_message_value; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> refresh_outright_trade_message_record.volume_4[refresh_outright_trade_message_at] = refresh_outright_trade_message_value; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_record.trade_cond_1 = refresh_outright_trade_message_value;
  refresh_outright_trade_message_record.trade_cond_2 = refresh_outright_trade_message_value;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 2 -> refresh_outright_trade_message_record.reserved_2[refresh_outright_trade_message_at] = refresh_outright_trade_message_value; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Refresh Outright Trade Message set to where it lies, so a field read out of place says so */
inline ramp_refresh_outright_trade_message(refresh_outright_trade_message_record, refresh_outright_trade_message_base) {
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> refresh_outright_trade_message_record.source_time[refresh_outright_trade_message_at] = (refresh_outright_trade_message_base + 0 + refresh_outright_trade_message_at + 1) % 256; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> refresh_outright_trade_message_record.source_time_ns[refresh_outright_trade_message_at] = (refresh_outright_trade_message_base + 4 + refresh_outright_trade_message_at + 1) % 256; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> refresh_outright_trade_message_record.series_index[refresh_outright_trade_message_at] = (refresh_outright_trade_message_base + 8 + refresh_outright_trade_message_at + 1) % 256; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> refresh_outright_trade_message_record.symbol_seq_num[refresh_outright_trade_message_at] = (refresh_outright_trade_message_base + 12 + refresh_outright_trade_message_at + 1) % 256; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> refresh_outright_trade_message_record.trade_id[refresh_outright_trade_message_at] = (refresh_outright_trade_message_base + 16 + refresh_outright_trade_message_at + 1) % 256; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> refresh_outright_trade_message_record.price[refresh_outright_trade_message_at] = (refresh_outright_trade_message_base + 20 + refresh_outright_trade_message_at + 1) % 256; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> refresh_outright_trade_message_record.volume_4[refresh_outright_trade_message_at] = (refresh_outright_trade_message_base + 24 + refresh_outright_trade_message_at + 1) % 256; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_record.trade_cond_1 = (refresh_outright_trade_message_base + 28 + 1) % 256;
  refresh_outright_trade_message_record.trade_cond_2 = (refresh_outright_trade_message_base + 29 + 1) % 256;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 2 -> refresh_outright_trade_message_record.reserved_2[refresh_outright_trade_message_at] = (refresh_outright_trade_message_base + 30 + refresh_outright_trade_message_at + 1) % 256; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Outright Trade Message to the wire, 32 bytes from where the cursor stands */
inline encode_refresh_outright_trade_message(refresh_outright_trade_message_record) {
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> wire[at] = refresh_outright_trade_message_record.source_time[refresh_outright_trade_message_at]; at = at + 1; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> wire[at] = refresh_outright_trade_message_record.source_time_ns[refresh_outright_trade_message_at]; at = at + 1; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> wire[at] = refresh_outright_trade_message_record.series_index[refresh_outright_trade_message_at]; at = at + 1; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> wire[at] = refresh_outright_trade_message_record.symbol_seq_num[refresh_outright_trade_message_at]; at = at + 1; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> wire[at] = refresh_outright_trade_message_record.trade_id[refresh_outright_trade_message_at]; at = at + 1; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> wire[at] = refresh_outright_trade_message_record.price[refresh_outright_trade_message_at]; at = at + 1; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> wire[at] = refresh_outright_trade_message_record.volume_4[refresh_outright_trade_message_at]; at = at + 1; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = refresh_outright_trade_message_record.trade_cond_1; at = at + 1;
  wire[at] = refresh_outright_trade_message_record.trade_cond_2; at = at + 1;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 2 -> wire[at] = refresh_outright_trade_message_record.reserved_2[refresh_outright_trade_message_at]; at = at + 1; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Outright Trade Message off the wire, 32 bytes from where the cursor stands */
inline decode_refresh_outright_trade_message(refresh_outright_trade_message_record) {
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> refresh_outright_trade_message_record.source_time[refresh_outright_trade_message_at] = wire[at]; at = at + 1; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> refresh_outright_trade_message_record.source_time_ns[refresh_outright_trade_message_at] = wire[at]; at = at + 1; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> refresh_outright_trade_message_record.series_index[refresh_outright_trade_message_at] = wire[at]; at = at + 1; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> refresh_outright_trade_message_record.symbol_seq_num[refresh_outright_trade_message_at] = wire[at]; at = at + 1; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> refresh_outright_trade_message_record.trade_id[refresh_outright_trade_message_at] = wire[at]; at = at + 1; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> refresh_outright_trade_message_record.price[refresh_outright_trade_message_at] = wire[at]; at = at + 1; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> refresh_outright_trade_message_record.volume_4[refresh_outright_trade_message_at] = wire[at]; at = at + 1; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_record.trade_cond_1 = wire[at]; at = at + 1;
  refresh_outright_trade_message_record.trade_cond_2 = wire[at]; at = at + 1;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 2 -> refresh_outright_trade_message_record.reserved_2[refresh_outright_trade_message_at] = wire[at]; at = at + 1; refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Refresh Outright Trade Message is what was written, byte for byte */
inline equal_refresh_outright_trade_message(refresh_outright_trade_message_read, refresh_outright_trade_message_written) {
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> assert(refresh_outright_trade_message_read.source_time[refresh_outright_trade_message_at] == refresh_outright_trade_message_written.source_time[refresh_outright_trade_message_at]); refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> assert(refresh_outright_trade_message_read.source_time_ns[refresh_outright_trade_message_at] == refresh_outright_trade_message_written.source_time_ns[refresh_outright_trade_message_at]); refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> assert(refresh_outright_trade_message_read.series_index[refresh_outright_trade_message_at] == refresh_outright_trade_message_written.series_index[refresh_outright_trade_message_at]); refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> assert(refresh_outright_trade_message_read.symbol_seq_num[refresh_outright_trade_message_at] == refresh_outright_trade_message_written.symbol_seq_num[refresh_outright_trade_message_at]); refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> assert(refresh_outright_trade_message_read.trade_id[refresh_outright_trade_message_at] == refresh_outright_trade_message_written.trade_id[refresh_outright_trade_message_at]); refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> assert(refresh_outright_trade_message_read.price[refresh_outright_trade_message_at] == refresh_outright_trade_message_written.price[refresh_outright_trade_message_at]); refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 4 -> assert(refresh_outright_trade_message_read.volume_4[refresh_outright_trade_message_at] == refresh_outright_trade_message_written.volume_4[refresh_outright_trade_message_at]); refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  assert(refresh_outright_trade_message_read.trade_cond_1 == refresh_outright_trade_message_written.trade_cond_1);
  assert(refresh_outright_trade_message_read.trade_cond_2 == refresh_outright_trade_message_written.trade_cond_2);
  refresh_outright_trade_message_at = 0;
  do
  :: refresh_outright_trade_message_at < 2 -> assert(refresh_outright_trade_message_read.reserved_2[refresh_outright_trade_message_at] == refresh_outright_trade_message_written.reserved_2[refresh_outright_trade_message_at]); refresh_outright_trade_message_at = refresh_outright_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Refresh Outright Imbalance Message: 32 bytes ---------------------------- */

/* The Refresh Outright Imbalance message is sent in the event no Outright Imbalance messages are published for the symbol for 2 consecutive minutes during Pre-opening or a symbol Halt. */
typedef RefreshOutrightImbalanceMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte series_index[4];
  byte symbol_seq_num[4];
  byte reference_price[4];
  byte paired_qty[2];
  byte total_imbalance_qty[2];
  byte market_imbalance_qty[2];
  byte auction_type;
  byte imbalance_side;
  byte market_imbalance_side;
  byte reserved_3[3]
};

int refresh_outright_imbalance_message_at;

/* every byte of Refresh Outright Imbalance Message set to one value */
inline fill_refresh_outright_imbalance_message(refresh_outright_imbalance_message_record, refresh_outright_imbalance_message_value) {
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 4 -> refresh_outright_imbalance_message_record.source_time[refresh_outright_imbalance_message_at] = refresh_outright_imbalance_message_value; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 4 -> refresh_outright_imbalance_message_record.source_time_ns[refresh_outright_imbalance_message_at] = refresh_outright_imbalance_message_value; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 4 -> refresh_outright_imbalance_message_record.series_index[refresh_outright_imbalance_message_at] = refresh_outright_imbalance_message_value; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 4 -> refresh_outright_imbalance_message_record.symbol_seq_num[refresh_outright_imbalance_message_at] = refresh_outright_imbalance_message_value; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 4 -> refresh_outright_imbalance_message_record.reference_price[refresh_outright_imbalance_message_at] = refresh_outright_imbalance_message_value; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 2 -> refresh_outright_imbalance_message_record.paired_qty[refresh_outright_imbalance_message_at] = refresh_outright_imbalance_message_value; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 2 -> refresh_outright_imbalance_message_record.total_imbalance_qty[refresh_outright_imbalance_message_at] = refresh_outright_imbalance_message_value; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 2 -> refresh_outright_imbalance_message_record.market_imbalance_qty[refresh_outright_imbalance_message_at] = refresh_outright_imbalance_message_value; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_record.auction_type = refresh_outright_imbalance_message_value;
  refresh_outright_imbalance_message_record.imbalance_side = refresh_outright_imbalance_message_value;
  refresh_outright_imbalance_message_record.market_imbalance_side = refresh_outright_imbalance_message_value;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 3 -> refresh_outright_imbalance_message_record.reserved_3[refresh_outright_imbalance_message_at] = refresh_outright_imbalance_message_value; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Refresh Outright Imbalance Message set to where it lies, so a field read out of place says so */
inline ramp_refresh_outright_imbalance_message(refresh_outright_imbalance_message_record, refresh_outright_imbalance_message_base) {
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 4 -> refresh_outright_imbalance_message_record.source_time[refresh_outright_imbalance_message_at] = (refresh_outright_imbalance_message_base + 0 + refresh_outright_imbalance_message_at + 1) % 256; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 4 -> refresh_outright_imbalance_message_record.source_time_ns[refresh_outright_imbalance_message_at] = (refresh_outright_imbalance_message_base + 4 + refresh_outright_imbalance_message_at + 1) % 256; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 4 -> refresh_outright_imbalance_message_record.series_index[refresh_outright_imbalance_message_at] = (refresh_outright_imbalance_message_base + 8 + refresh_outright_imbalance_message_at + 1) % 256; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 4 -> refresh_outright_imbalance_message_record.symbol_seq_num[refresh_outright_imbalance_message_at] = (refresh_outright_imbalance_message_base + 12 + refresh_outright_imbalance_message_at + 1) % 256; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 4 -> refresh_outright_imbalance_message_record.reference_price[refresh_outright_imbalance_message_at] = (refresh_outright_imbalance_message_base + 16 + refresh_outright_imbalance_message_at + 1) % 256; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 2 -> refresh_outright_imbalance_message_record.paired_qty[refresh_outright_imbalance_message_at] = (refresh_outright_imbalance_message_base + 20 + refresh_outright_imbalance_message_at + 1) % 256; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 2 -> refresh_outright_imbalance_message_record.total_imbalance_qty[refresh_outright_imbalance_message_at] = (refresh_outright_imbalance_message_base + 22 + refresh_outright_imbalance_message_at + 1) % 256; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 2 -> refresh_outright_imbalance_message_record.market_imbalance_qty[refresh_outright_imbalance_message_at] = (refresh_outright_imbalance_message_base + 24 + refresh_outright_imbalance_message_at + 1) % 256; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_record.auction_type = (refresh_outright_imbalance_message_base + 26 + 1) % 256;
  refresh_outright_imbalance_message_record.imbalance_side = (refresh_outright_imbalance_message_base + 27 + 1) % 256;
  refresh_outright_imbalance_message_record.market_imbalance_side = (refresh_outright_imbalance_message_base + 28 + 1) % 256;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 3 -> refresh_outright_imbalance_message_record.reserved_3[refresh_outright_imbalance_message_at] = (refresh_outright_imbalance_message_base + 29 + refresh_outright_imbalance_message_at + 1) % 256; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Outright Imbalance Message to the wire, 32 bytes from where the cursor stands */
inline encode_refresh_outright_imbalance_message(refresh_outright_imbalance_message_record) {
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 4 -> wire[at] = refresh_outright_imbalance_message_record.source_time[refresh_outright_imbalance_message_at]; at = at + 1; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 4 -> wire[at] = refresh_outright_imbalance_message_record.source_time_ns[refresh_outright_imbalance_message_at]; at = at + 1; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 4 -> wire[at] = refresh_outright_imbalance_message_record.series_index[refresh_outright_imbalance_message_at]; at = at + 1; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 4 -> wire[at] = refresh_outright_imbalance_message_record.symbol_seq_num[refresh_outright_imbalance_message_at]; at = at + 1; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 4 -> wire[at] = refresh_outright_imbalance_message_record.reference_price[refresh_outright_imbalance_message_at]; at = at + 1; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 2 -> wire[at] = refresh_outright_imbalance_message_record.paired_qty[refresh_outright_imbalance_message_at]; at = at + 1; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 2 -> wire[at] = refresh_outright_imbalance_message_record.total_imbalance_qty[refresh_outright_imbalance_message_at]; at = at + 1; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 2 -> wire[at] = refresh_outright_imbalance_message_record.market_imbalance_qty[refresh_outright_imbalance_message_at]; at = at + 1; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  wire[at] = refresh_outright_imbalance_message_record.auction_type; at = at + 1;
  wire[at] = refresh_outright_imbalance_message_record.imbalance_side; at = at + 1;
  wire[at] = refresh_outright_imbalance_message_record.market_imbalance_side; at = at + 1;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 3 -> wire[at] = refresh_outright_imbalance_message_record.reserved_3[refresh_outright_imbalance_message_at]; at = at + 1; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Outright Imbalance Message off the wire, 32 bytes from where the cursor stands */
inline decode_refresh_outright_imbalance_message(refresh_outright_imbalance_message_record) {
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 4 -> refresh_outright_imbalance_message_record.source_time[refresh_outright_imbalance_message_at] = wire[at]; at = at + 1; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 4 -> refresh_outright_imbalance_message_record.source_time_ns[refresh_outright_imbalance_message_at] = wire[at]; at = at + 1; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 4 -> refresh_outright_imbalance_message_record.series_index[refresh_outright_imbalance_message_at] = wire[at]; at = at + 1; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 4 -> refresh_outright_imbalance_message_record.symbol_seq_num[refresh_outright_imbalance_message_at] = wire[at]; at = at + 1; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 4 -> refresh_outright_imbalance_message_record.reference_price[refresh_outright_imbalance_message_at] = wire[at]; at = at + 1; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 2 -> refresh_outright_imbalance_message_record.paired_qty[refresh_outright_imbalance_message_at] = wire[at]; at = at + 1; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 2 -> refresh_outright_imbalance_message_record.total_imbalance_qty[refresh_outright_imbalance_message_at] = wire[at]; at = at + 1; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 2 -> refresh_outright_imbalance_message_record.market_imbalance_qty[refresh_outright_imbalance_message_at] = wire[at]; at = at + 1; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_record.auction_type = wire[at]; at = at + 1;
  refresh_outright_imbalance_message_record.imbalance_side = wire[at]; at = at + 1;
  refresh_outright_imbalance_message_record.market_imbalance_side = wire[at]; at = at + 1;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 3 -> refresh_outright_imbalance_message_record.reserved_3[refresh_outright_imbalance_message_at] = wire[at]; at = at + 1; refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Refresh Outright Imbalance Message is what was written, byte for byte */
inline equal_refresh_outright_imbalance_message(refresh_outright_imbalance_message_read, refresh_outright_imbalance_message_written) {
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 4 -> assert(refresh_outright_imbalance_message_read.source_time[refresh_outright_imbalance_message_at] == refresh_outright_imbalance_message_written.source_time[refresh_outright_imbalance_message_at]); refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 4 -> assert(refresh_outright_imbalance_message_read.source_time_ns[refresh_outright_imbalance_message_at] == refresh_outright_imbalance_message_written.source_time_ns[refresh_outright_imbalance_message_at]); refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 4 -> assert(refresh_outright_imbalance_message_read.series_index[refresh_outright_imbalance_message_at] == refresh_outright_imbalance_message_written.series_index[refresh_outright_imbalance_message_at]); refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 4 -> assert(refresh_outright_imbalance_message_read.symbol_seq_num[refresh_outright_imbalance_message_at] == refresh_outright_imbalance_message_written.symbol_seq_num[refresh_outright_imbalance_message_at]); refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 4 -> assert(refresh_outright_imbalance_message_read.reference_price[refresh_outright_imbalance_message_at] == refresh_outright_imbalance_message_written.reference_price[refresh_outright_imbalance_message_at]); refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 2 -> assert(refresh_outright_imbalance_message_read.paired_qty[refresh_outright_imbalance_message_at] == refresh_outright_imbalance_message_written.paired_qty[refresh_outright_imbalance_message_at]); refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 2 -> assert(refresh_outright_imbalance_message_read.total_imbalance_qty[refresh_outright_imbalance_message_at] == refresh_outright_imbalance_message_written.total_imbalance_qty[refresh_outright_imbalance_message_at]); refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 2 -> assert(refresh_outright_imbalance_message_read.market_imbalance_qty[refresh_outright_imbalance_message_at] == refresh_outright_imbalance_message_written.market_imbalance_qty[refresh_outright_imbalance_message_at]); refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
  :: else -> break
  od;
  assert(refresh_outright_imbalance_message_read.auction_type == refresh_outright_imbalance_message_written.auction_type);
  assert(refresh_outright_imbalance_message_read.imbalance_side == refresh_outright_imbalance_message_written.imbalance_side);
  assert(refresh_outright_imbalance_message_read.market_imbalance_side == refresh_outright_imbalance_message_written.market_imbalance_side);
  refresh_outright_imbalance_message_at = 0;
  do
  :: refresh_outright_imbalance_message_at < 3 -> assert(refresh_outright_imbalance_message_read.reserved_3[refresh_outright_imbalance_message_at] == refresh_outright_imbalance_message_written.reserved_3[refresh_outright_imbalance_message_at]); refresh_outright_imbalance_message_at = refresh_outright_imbalance_message_at + 1
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

/* Outright Quote Message: encoded, read back, and compared */
proctype check_outright_quote_message() {
  OutrightQuoteMessage outright_quote_message_sent;
  OutrightQuoteMessage outright_quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_outright_quote_message(outright_quote_message_sent, 0)
  :: pattern == 1 -> fill_outright_quote_message(outright_quote_message_sent, 32)
  :: pattern == 2 -> fill_outright_quote_message(outright_quote_message_sent, 255)
  :: else -> ramp_outright_quote_message(outright_quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_outright_quote_message(outright_quote_message_sent);
    assert(at == 36);
    at = 0;
    decode_outright_quote_message(outright_quote_message_got);
    assert(at == 36);
    equal_outright_quote_message(outright_quote_message_got, outright_quote_message_sent)
  }
}

/* Outright Trade Message: encoded, read back, and compared */
proctype check_outright_trade_message() {
  OutrightTradeMessage outright_trade_message_sent;
  OutrightTradeMessage outright_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_outright_trade_message(outright_trade_message_sent, 0)
  :: pattern == 1 -> fill_outright_trade_message(outright_trade_message_sent, 32)
  :: pattern == 2 -> fill_outright_trade_message(outright_trade_message_sent, 255)
  :: else -> ramp_outright_trade_message(outright_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_outright_trade_message(outright_trade_message_sent);
    assert(at == 32);
    at = 0;
    decode_outright_trade_message(outright_trade_message_got);
    assert(at == 32);
    equal_outright_trade_message(outright_trade_message_got, outright_trade_message_sent)
  }
}

/* Outright Trade Cancel Message: encoded, read back, and compared */
proctype check_outright_trade_cancel_message() {
  OutrightTradeCancelMessage outright_trade_cancel_message_sent;
  OutrightTradeCancelMessage outright_trade_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_outright_trade_cancel_message(outright_trade_cancel_message_sent, 0)
  :: pattern == 1 -> fill_outright_trade_cancel_message(outright_trade_cancel_message_sent, 32)
  :: pattern == 2 -> fill_outright_trade_cancel_message(outright_trade_cancel_message_sent, 255)
  :: else -> ramp_outright_trade_cancel_message(outright_trade_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_outright_trade_cancel_message(outright_trade_cancel_message_sent);
    assert(at == 20);
    at = 0;
    decode_outright_trade_cancel_message(outright_trade_cancel_message_got);
    assert(at == 20);
    equal_outright_trade_cancel_message(outright_trade_cancel_message_got, outright_trade_cancel_message_sent)
  }
}

/* Outright Trade Correction Message: encoded, read back, and compared */
proctype check_outright_trade_correction_message() {
  OutrightTradeCorrectionMessage outright_trade_correction_message_sent;
  OutrightTradeCorrectionMessage outright_trade_correction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_outright_trade_correction_message(outright_trade_correction_message_sent, 0)
  :: pattern == 1 -> fill_outright_trade_correction_message(outright_trade_correction_message_sent, 32)
  :: pattern == 2 -> fill_outright_trade_correction_message(outright_trade_correction_message_sent, 255)
  :: else -> ramp_outright_trade_correction_message(outright_trade_correction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_outright_trade_correction_message(outright_trade_correction_message_sent);
    assert(at == 36);
    at = 0;
    decode_outright_trade_correction_message(outright_trade_correction_message_got);
    assert(at == 36);
    equal_outright_trade_correction_message(outright_trade_correction_message_got, outright_trade_correction_message_sent)
  }
}

/* Outright Imbalance Message: encoded, read back, and compared */
proctype check_outright_imbalance_message() {
  OutrightImbalanceMessage outright_imbalance_message_sent;
  OutrightImbalanceMessage outright_imbalance_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_outright_imbalance_message(outright_imbalance_message_sent, 0)
  :: pattern == 1 -> fill_outright_imbalance_message(outright_imbalance_message_sent, 32)
  :: pattern == 2 -> fill_outright_imbalance_message(outright_imbalance_message_sent, 255)
  :: else -> ramp_outright_imbalance_message(outright_imbalance_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_outright_imbalance_message(outright_imbalance_message_sent);
    assert(at == 32);
    at = 0;
    decode_outright_imbalance_message(outright_imbalance_message_got);
    assert(at == 32);
    equal_outright_imbalance_message(outright_imbalance_message_got, outright_imbalance_message_sent)
  }
}

/* Outright Crossing Rfq Message: encoded, read back, and compared */
proctype check_outright_crossing_rfq_message() {
  OutrightCrossingRfqMessage outright_crossing_rfq_message_sent;
  OutrightCrossingRfqMessage outright_crossing_rfq_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_outright_crossing_rfq_message(outright_crossing_rfq_message_sent, 0)
  :: pattern == 1 -> fill_outright_crossing_rfq_message(outright_crossing_rfq_message_sent, 32)
  :: pattern == 2 -> fill_outright_crossing_rfq_message(outright_crossing_rfq_message_sent, 255)
  :: else -> ramp_outright_crossing_rfq_message(outright_crossing_rfq_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_outright_crossing_rfq_message(outright_crossing_rfq_message_sent);
    assert(at == 24);
    at = 0;
    decode_outright_crossing_rfq_message(outright_crossing_rfq_message_got);
    assert(at == 24);
    equal_outright_crossing_rfq_message(outright_crossing_rfq_message_got, outright_crossing_rfq_message_sent)
  }
}

/* Outright Bold Rfq Message: encoded, read back, and compared */
proctype check_outright_bold_rfq_message() {
  OutrightBoldRfqMessage outright_bold_rfq_message_sent;
  OutrightBoldRfqMessage outright_bold_rfq_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_outright_bold_rfq_message(outright_bold_rfq_message_sent, 0)
  :: pattern == 1 -> fill_outright_bold_rfq_message(outright_bold_rfq_message_sent, 32)
  :: pattern == 2 -> fill_outright_bold_rfq_message(outright_bold_rfq_message_sent, 255)
  :: else -> ramp_outright_bold_rfq_message(outright_bold_rfq_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_outright_bold_rfq_message(outright_bold_rfq_message_sent);
    assert(at == 28);
    at = 0;
    decode_outright_bold_rfq_message(outright_bold_rfq_message_got);
    assert(at == 28);
    equal_outright_bold_rfq_message(outright_bold_rfq_message_got, outright_bold_rfq_message_sent)
  }
}

/* Outright Summary Message: encoded, read back, and compared */
proctype check_outright_summary_message() {
  OutrightSummaryMessage outright_summary_message_sent;
  OutrightSummaryMessage outright_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_outright_summary_message(outright_summary_message_sent, 0)
  :: pattern == 1 -> fill_outright_summary_message(outright_summary_message_sent, 32)
  :: pattern == 2 -> fill_outright_summary_message(outright_summary_message_sent, 255)
  :: else -> ramp_outright_summary_message(outright_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_outright_summary_message(outright_summary_message_sent);
    assert(at == 36);
    at = 0;
    decode_outright_summary_message(outright_summary_message_got);
    assert(at == 36);
    equal_outright_summary_message(outright_summary_message_got, outright_summary_message_sent)
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

/* Refresh Outright Quote Message: encoded, read back, and compared */
proctype check_refresh_outright_quote_message() {
  RefreshOutrightQuoteMessage refresh_outright_quote_message_sent;
  RefreshOutrightQuoteMessage refresh_outright_quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_refresh_outright_quote_message(refresh_outright_quote_message_sent, 0)
  :: pattern == 1 -> fill_refresh_outright_quote_message(refresh_outright_quote_message_sent, 32)
  :: pattern == 2 -> fill_refresh_outright_quote_message(refresh_outright_quote_message_sent, 255)
  :: else -> ramp_refresh_outright_quote_message(refresh_outright_quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_refresh_outright_quote_message(refresh_outright_quote_message_sent);
    assert(at == 36);
    at = 0;
    decode_refresh_outright_quote_message(refresh_outright_quote_message_got);
    assert(at == 36);
    equal_refresh_outright_quote_message(refresh_outright_quote_message_got, refresh_outright_quote_message_sent)
  }
}

/* Refresh Outright Trade Message: encoded, read back, and compared */
proctype check_refresh_outright_trade_message() {
  RefreshOutrightTradeMessage refresh_outright_trade_message_sent;
  RefreshOutrightTradeMessage refresh_outright_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_refresh_outright_trade_message(refresh_outright_trade_message_sent, 0)
  :: pattern == 1 -> fill_refresh_outright_trade_message(refresh_outright_trade_message_sent, 32)
  :: pattern == 2 -> fill_refresh_outright_trade_message(refresh_outright_trade_message_sent, 255)
  :: else -> ramp_refresh_outright_trade_message(refresh_outright_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_refresh_outright_trade_message(refresh_outright_trade_message_sent);
    assert(at == 32);
    at = 0;
    decode_refresh_outright_trade_message(refresh_outright_trade_message_got);
    assert(at == 32);
    equal_refresh_outright_trade_message(refresh_outright_trade_message_got, refresh_outright_trade_message_sent)
  }
}

/* Refresh Outright Imbalance Message: encoded, read back, and compared */
proctype check_refresh_outright_imbalance_message() {
  RefreshOutrightImbalanceMessage refresh_outright_imbalance_message_sent;
  RefreshOutrightImbalanceMessage refresh_outright_imbalance_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_refresh_outright_imbalance_message(refresh_outright_imbalance_message_sent, 0)
  :: pattern == 1 -> fill_refresh_outright_imbalance_message(refresh_outright_imbalance_message_sent, 32)
  :: pattern == 2 -> fill_refresh_outright_imbalance_message(refresh_outright_imbalance_message_sent, 255)
  :: else -> ramp_refresh_outright_imbalance_message(refresh_outright_imbalance_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_refresh_outright_imbalance_message(refresh_outright_imbalance_message_sent);
    assert(at == 32);
    at = 0;
    decode_refresh_outright_imbalance_message(refresh_outright_imbalance_message_got);
    assert(at == 32);
    equal_refresh_outright_imbalance_message(refresh_outright_imbalance_message_got, refresh_outright_imbalance_message_sent)
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
  :: run check_outright_quote_message()
  :: run check_outright_trade_message()
  :: run check_outright_trade_cancel_message()
  :: run check_outright_trade_correction_message()
  :: run check_outright_imbalance_message()
  :: run check_outright_crossing_rfq_message()
  :: run check_outright_bold_rfq_message()
  :: run check_outright_summary_message()
  :: run check_underlying_status_message()
  :: run check_outright_series_status_message()
  :: run check_refresh_outright_quote_message()
  :: run check_refresh_outright_trade_message()
  :: run check_refresh_outright_imbalance_message()
  :: run check_underlying_index_mapping_message()
  :: run check_series_index_mapping_message()
  :: run check_stream_id_message()
  :: run check_sequence_number_reset_message()
  fi
}
