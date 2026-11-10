/*
 * New York Stock Exchange Complex Feed
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
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 36

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

/* ---- Complex Quote Message: 36 bytes ----------------------------------------- */

/* The Complex Quote message is a two-sided message providing best bid and offer limits of orders on complex symbols with aggregated volumes at each limit. */
typedef ComplexQuoteMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte complex_index[4];
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

int complex_quote_message_at;

/* every byte of Complex Quote Message set to one value */
inline fill_complex_quote_message(complex_quote_message_record, complex_quote_message_value) {
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> complex_quote_message_record.source_time[complex_quote_message_at] = complex_quote_message_value; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> complex_quote_message_record.source_time_ns[complex_quote_message_at] = complex_quote_message_value; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> complex_quote_message_record.complex_index[complex_quote_message_at] = complex_quote_message_value; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> complex_quote_message_record.symbol_seq_num[complex_quote_message_at] = complex_quote_message_value; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> complex_quote_message_record.ask_price[complex_quote_message_at] = complex_quote_message_value; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> complex_quote_message_record.bid_price[complex_quote_message_at] = complex_quote_message_value; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 2 -> complex_quote_message_record.ask_volume[complex_quote_message_at] = complex_quote_message_value; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 2 -> complex_quote_message_record.bid_volume[complex_quote_message_at] = complex_quote_message_value; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 2 -> complex_quote_message_record.ask_customer_volume[complex_quote_message_at] = complex_quote_message_value; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 2 -> complex_quote_message_record.bid_customer_volume[complex_quote_message_at] = complex_quote_message_value; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_record.quote_condition = complex_quote_message_value;
  complex_quote_message_record.reserved_1 = complex_quote_message_value;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 2 -> complex_quote_message_record.reserved_2[complex_quote_message_at] = complex_quote_message_value; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Complex Quote Message set to where it lies, so a field read out of place says so */
inline ramp_complex_quote_message(complex_quote_message_record, complex_quote_message_base) {
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> complex_quote_message_record.source_time[complex_quote_message_at] = (complex_quote_message_base + 0 + complex_quote_message_at + 1) % 256; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> complex_quote_message_record.source_time_ns[complex_quote_message_at] = (complex_quote_message_base + 4 + complex_quote_message_at + 1) % 256; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> complex_quote_message_record.complex_index[complex_quote_message_at] = (complex_quote_message_base + 8 + complex_quote_message_at + 1) % 256; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> complex_quote_message_record.symbol_seq_num[complex_quote_message_at] = (complex_quote_message_base + 12 + complex_quote_message_at + 1) % 256; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> complex_quote_message_record.ask_price[complex_quote_message_at] = (complex_quote_message_base + 16 + complex_quote_message_at + 1) % 256; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> complex_quote_message_record.bid_price[complex_quote_message_at] = (complex_quote_message_base + 20 + complex_quote_message_at + 1) % 256; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 2 -> complex_quote_message_record.ask_volume[complex_quote_message_at] = (complex_quote_message_base + 24 + complex_quote_message_at + 1) % 256; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 2 -> complex_quote_message_record.bid_volume[complex_quote_message_at] = (complex_quote_message_base + 26 + complex_quote_message_at + 1) % 256; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 2 -> complex_quote_message_record.ask_customer_volume[complex_quote_message_at] = (complex_quote_message_base + 28 + complex_quote_message_at + 1) % 256; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 2 -> complex_quote_message_record.bid_customer_volume[complex_quote_message_at] = (complex_quote_message_base + 30 + complex_quote_message_at + 1) % 256; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_record.quote_condition = (complex_quote_message_base + 32 + 1) % 256;
  complex_quote_message_record.reserved_1 = (complex_quote_message_base + 33 + 1) % 256;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 2 -> complex_quote_message_record.reserved_2[complex_quote_message_at] = (complex_quote_message_base + 34 + complex_quote_message_at + 1) % 256; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Quote Message to the wire, 36 bytes from where the cursor stands */
inline encode_complex_quote_message(complex_quote_message_record) {
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> wire[at] = complex_quote_message_record.source_time[complex_quote_message_at]; at = at + 1; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> wire[at] = complex_quote_message_record.source_time_ns[complex_quote_message_at]; at = at + 1; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> wire[at] = complex_quote_message_record.complex_index[complex_quote_message_at]; at = at + 1; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> wire[at] = complex_quote_message_record.symbol_seq_num[complex_quote_message_at]; at = at + 1; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> wire[at] = complex_quote_message_record.ask_price[complex_quote_message_at]; at = at + 1; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> wire[at] = complex_quote_message_record.bid_price[complex_quote_message_at]; at = at + 1; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 2 -> wire[at] = complex_quote_message_record.ask_volume[complex_quote_message_at]; at = at + 1; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 2 -> wire[at] = complex_quote_message_record.bid_volume[complex_quote_message_at]; at = at + 1; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 2 -> wire[at] = complex_quote_message_record.ask_customer_volume[complex_quote_message_at]; at = at + 1; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 2 -> wire[at] = complex_quote_message_record.bid_customer_volume[complex_quote_message_at]; at = at + 1; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_quote_message_record.quote_condition; at = at + 1;
  wire[at] = complex_quote_message_record.reserved_1; at = at + 1;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 2 -> wire[at] = complex_quote_message_record.reserved_2[complex_quote_message_at]; at = at + 1; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Quote Message off the wire, 36 bytes from where the cursor stands */
inline decode_complex_quote_message(complex_quote_message_record) {
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> complex_quote_message_record.source_time[complex_quote_message_at] = wire[at]; at = at + 1; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> complex_quote_message_record.source_time_ns[complex_quote_message_at] = wire[at]; at = at + 1; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> complex_quote_message_record.complex_index[complex_quote_message_at] = wire[at]; at = at + 1; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> complex_quote_message_record.symbol_seq_num[complex_quote_message_at] = wire[at]; at = at + 1; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> complex_quote_message_record.ask_price[complex_quote_message_at] = wire[at]; at = at + 1; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> complex_quote_message_record.bid_price[complex_quote_message_at] = wire[at]; at = at + 1; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 2 -> complex_quote_message_record.ask_volume[complex_quote_message_at] = wire[at]; at = at + 1; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 2 -> complex_quote_message_record.bid_volume[complex_quote_message_at] = wire[at]; at = at + 1; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 2 -> complex_quote_message_record.ask_customer_volume[complex_quote_message_at] = wire[at]; at = at + 1; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 2 -> complex_quote_message_record.bid_customer_volume[complex_quote_message_at] = wire[at]; at = at + 1; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_record.quote_condition = wire[at]; at = at + 1;
  complex_quote_message_record.reserved_1 = wire[at]; at = at + 1;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 2 -> complex_quote_message_record.reserved_2[complex_quote_message_at] = wire[at]; at = at + 1; complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Complex Quote Message is what was written, byte for byte */
inline equal_complex_quote_message(complex_quote_message_read, complex_quote_message_written) {
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> assert(complex_quote_message_read.source_time[complex_quote_message_at] == complex_quote_message_written.source_time[complex_quote_message_at]); complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> assert(complex_quote_message_read.source_time_ns[complex_quote_message_at] == complex_quote_message_written.source_time_ns[complex_quote_message_at]); complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> assert(complex_quote_message_read.complex_index[complex_quote_message_at] == complex_quote_message_written.complex_index[complex_quote_message_at]); complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> assert(complex_quote_message_read.symbol_seq_num[complex_quote_message_at] == complex_quote_message_written.symbol_seq_num[complex_quote_message_at]); complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> assert(complex_quote_message_read.ask_price[complex_quote_message_at] == complex_quote_message_written.ask_price[complex_quote_message_at]); complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 4 -> assert(complex_quote_message_read.bid_price[complex_quote_message_at] == complex_quote_message_written.bid_price[complex_quote_message_at]); complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 2 -> assert(complex_quote_message_read.ask_volume[complex_quote_message_at] == complex_quote_message_written.ask_volume[complex_quote_message_at]); complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 2 -> assert(complex_quote_message_read.bid_volume[complex_quote_message_at] == complex_quote_message_written.bid_volume[complex_quote_message_at]); complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 2 -> assert(complex_quote_message_read.ask_customer_volume[complex_quote_message_at] == complex_quote_message_written.ask_customer_volume[complex_quote_message_at]); complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 2 -> assert(complex_quote_message_read.bid_customer_volume[complex_quote_message_at] == complex_quote_message_written.bid_customer_volume[complex_quote_message_at]); complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  assert(complex_quote_message_read.quote_condition == complex_quote_message_written.quote_condition);
  assert(complex_quote_message_read.reserved_1 == complex_quote_message_written.reserved_1);
  complex_quote_message_at = 0;
  do
  :: complex_quote_message_at < 2 -> assert(complex_quote_message_read.reserved_2[complex_quote_message_at] == complex_quote_message_written.reserved_2[complex_quote_message_at]); complex_quote_message_at = complex_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Complex Trade Message: 32 bytes ----------------------------------------- */

/* The Complex Trade message is used to publish all complex Last Sales. */
typedef ComplexTradeMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte complex_index[4];
  byte symbol_seq_num[4];
  byte trade_id[4];
  byte price[4];
  byte volume_4[4];
  byte trade_cond_1;
  byte trade_cond_2;
  byte reserved_2[2]
};

int complex_trade_message_at;

/* every byte of Complex Trade Message set to one value */
inline fill_complex_trade_message(complex_trade_message_record, complex_trade_message_value) {
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> complex_trade_message_record.source_time[complex_trade_message_at] = complex_trade_message_value; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> complex_trade_message_record.source_time_ns[complex_trade_message_at] = complex_trade_message_value; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> complex_trade_message_record.complex_index[complex_trade_message_at] = complex_trade_message_value; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> complex_trade_message_record.symbol_seq_num[complex_trade_message_at] = complex_trade_message_value; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> complex_trade_message_record.trade_id[complex_trade_message_at] = complex_trade_message_value; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> complex_trade_message_record.price[complex_trade_message_at] = complex_trade_message_value; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> complex_trade_message_record.volume_4[complex_trade_message_at] = complex_trade_message_value; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_record.trade_cond_1 = complex_trade_message_value;
  complex_trade_message_record.trade_cond_2 = complex_trade_message_value;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 2 -> complex_trade_message_record.reserved_2[complex_trade_message_at] = complex_trade_message_value; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Complex Trade Message set to where it lies, so a field read out of place says so */
inline ramp_complex_trade_message(complex_trade_message_record, complex_trade_message_base) {
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> complex_trade_message_record.source_time[complex_trade_message_at] = (complex_trade_message_base + 0 + complex_trade_message_at + 1) % 256; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> complex_trade_message_record.source_time_ns[complex_trade_message_at] = (complex_trade_message_base + 4 + complex_trade_message_at + 1) % 256; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> complex_trade_message_record.complex_index[complex_trade_message_at] = (complex_trade_message_base + 8 + complex_trade_message_at + 1) % 256; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> complex_trade_message_record.symbol_seq_num[complex_trade_message_at] = (complex_trade_message_base + 12 + complex_trade_message_at + 1) % 256; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> complex_trade_message_record.trade_id[complex_trade_message_at] = (complex_trade_message_base + 16 + complex_trade_message_at + 1) % 256; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> complex_trade_message_record.price[complex_trade_message_at] = (complex_trade_message_base + 20 + complex_trade_message_at + 1) % 256; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> complex_trade_message_record.volume_4[complex_trade_message_at] = (complex_trade_message_base + 24 + complex_trade_message_at + 1) % 256; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_record.trade_cond_1 = (complex_trade_message_base + 28 + 1) % 256;
  complex_trade_message_record.trade_cond_2 = (complex_trade_message_base + 29 + 1) % 256;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 2 -> complex_trade_message_record.reserved_2[complex_trade_message_at] = (complex_trade_message_base + 30 + complex_trade_message_at + 1) % 256; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Trade Message to the wire, 32 bytes from where the cursor stands */
inline encode_complex_trade_message(complex_trade_message_record) {
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> wire[at] = complex_trade_message_record.source_time[complex_trade_message_at]; at = at + 1; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> wire[at] = complex_trade_message_record.source_time_ns[complex_trade_message_at]; at = at + 1; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> wire[at] = complex_trade_message_record.complex_index[complex_trade_message_at]; at = at + 1; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> wire[at] = complex_trade_message_record.symbol_seq_num[complex_trade_message_at]; at = at + 1; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> wire[at] = complex_trade_message_record.trade_id[complex_trade_message_at]; at = at + 1; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> wire[at] = complex_trade_message_record.price[complex_trade_message_at]; at = at + 1; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> wire[at] = complex_trade_message_record.volume_4[complex_trade_message_at]; at = at + 1; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_trade_message_record.trade_cond_1; at = at + 1;
  wire[at] = complex_trade_message_record.trade_cond_2; at = at + 1;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 2 -> wire[at] = complex_trade_message_record.reserved_2[complex_trade_message_at]; at = at + 1; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Trade Message off the wire, 32 bytes from where the cursor stands */
inline decode_complex_trade_message(complex_trade_message_record) {
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> complex_trade_message_record.source_time[complex_trade_message_at] = wire[at]; at = at + 1; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> complex_trade_message_record.source_time_ns[complex_trade_message_at] = wire[at]; at = at + 1; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> complex_trade_message_record.complex_index[complex_trade_message_at] = wire[at]; at = at + 1; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> complex_trade_message_record.symbol_seq_num[complex_trade_message_at] = wire[at]; at = at + 1; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> complex_trade_message_record.trade_id[complex_trade_message_at] = wire[at]; at = at + 1; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> complex_trade_message_record.price[complex_trade_message_at] = wire[at]; at = at + 1; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> complex_trade_message_record.volume_4[complex_trade_message_at] = wire[at]; at = at + 1; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_record.trade_cond_1 = wire[at]; at = at + 1;
  complex_trade_message_record.trade_cond_2 = wire[at]; at = at + 1;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 2 -> complex_trade_message_record.reserved_2[complex_trade_message_at] = wire[at]; at = at + 1; complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Complex Trade Message is what was written, byte for byte */
inline equal_complex_trade_message(complex_trade_message_read, complex_trade_message_written) {
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> assert(complex_trade_message_read.source_time[complex_trade_message_at] == complex_trade_message_written.source_time[complex_trade_message_at]); complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> assert(complex_trade_message_read.source_time_ns[complex_trade_message_at] == complex_trade_message_written.source_time_ns[complex_trade_message_at]); complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> assert(complex_trade_message_read.complex_index[complex_trade_message_at] == complex_trade_message_written.complex_index[complex_trade_message_at]); complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> assert(complex_trade_message_read.symbol_seq_num[complex_trade_message_at] == complex_trade_message_written.symbol_seq_num[complex_trade_message_at]); complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> assert(complex_trade_message_read.trade_id[complex_trade_message_at] == complex_trade_message_written.trade_id[complex_trade_message_at]); complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> assert(complex_trade_message_read.price[complex_trade_message_at] == complex_trade_message_written.price[complex_trade_message_at]); complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 4 -> assert(complex_trade_message_read.volume_4[complex_trade_message_at] == complex_trade_message_written.volume_4[complex_trade_message_at]); complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  assert(complex_trade_message_read.trade_cond_1 == complex_trade_message_written.trade_cond_1);
  assert(complex_trade_message_read.trade_cond_2 == complex_trade_message_written.trade_cond_2);
  complex_trade_message_at = 0;
  do
  :: complex_trade_message_at < 2 -> assert(complex_trade_message_read.reserved_2[complex_trade_message_at] == complex_trade_message_written.reserved_2[complex_trade_message_at]); complex_trade_message_at = complex_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Complex Crossing Rfq Message: 24 bytes ---------------------------------- */

/* The Complex Crossing RFQ (Request for Quote) message is sent out in the event of a COA auction on a complex order. */
typedef ComplexCrossingRfqMessage {
  byte source_time[4];
  byte source_ns[4];
  byte complex_index[4];
  byte symbol_seq_num[4];
  byte side;
  byte reserved_1;
  byte volume_2[2];
  byte price[4]
};

int complex_crossing_rfq_message_at;

/* every byte of Complex Crossing Rfq Message set to one value */
inline fill_complex_crossing_rfq_message(complex_crossing_rfq_message_record, complex_crossing_rfq_message_value) {
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 4 -> complex_crossing_rfq_message_record.source_time[complex_crossing_rfq_message_at] = complex_crossing_rfq_message_value; complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 4 -> complex_crossing_rfq_message_record.source_ns[complex_crossing_rfq_message_at] = complex_crossing_rfq_message_value; complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 4 -> complex_crossing_rfq_message_record.complex_index[complex_crossing_rfq_message_at] = complex_crossing_rfq_message_value; complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 4 -> complex_crossing_rfq_message_record.symbol_seq_num[complex_crossing_rfq_message_at] = complex_crossing_rfq_message_value; complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  complex_crossing_rfq_message_record.side = complex_crossing_rfq_message_value;
  complex_crossing_rfq_message_record.reserved_1 = complex_crossing_rfq_message_value;
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 2 -> complex_crossing_rfq_message_record.volume_2[complex_crossing_rfq_message_at] = complex_crossing_rfq_message_value; complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 4 -> complex_crossing_rfq_message_record.price[complex_crossing_rfq_message_at] = complex_crossing_rfq_message_value; complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Complex Crossing Rfq Message set to where it lies, so a field read out of place says so */
inline ramp_complex_crossing_rfq_message(complex_crossing_rfq_message_record, complex_crossing_rfq_message_base) {
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 4 -> complex_crossing_rfq_message_record.source_time[complex_crossing_rfq_message_at] = (complex_crossing_rfq_message_base + 0 + complex_crossing_rfq_message_at + 1) % 256; complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 4 -> complex_crossing_rfq_message_record.source_ns[complex_crossing_rfq_message_at] = (complex_crossing_rfq_message_base + 4 + complex_crossing_rfq_message_at + 1) % 256; complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 4 -> complex_crossing_rfq_message_record.complex_index[complex_crossing_rfq_message_at] = (complex_crossing_rfq_message_base + 8 + complex_crossing_rfq_message_at + 1) % 256; complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 4 -> complex_crossing_rfq_message_record.symbol_seq_num[complex_crossing_rfq_message_at] = (complex_crossing_rfq_message_base + 12 + complex_crossing_rfq_message_at + 1) % 256; complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  complex_crossing_rfq_message_record.side = (complex_crossing_rfq_message_base + 16 + 1) % 256;
  complex_crossing_rfq_message_record.reserved_1 = (complex_crossing_rfq_message_base + 17 + 1) % 256;
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 2 -> complex_crossing_rfq_message_record.volume_2[complex_crossing_rfq_message_at] = (complex_crossing_rfq_message_base + 18 + complex_crossing_rfq_message_at + 1) % 256; complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 4 -> complex_crossing_rfq_message_record.price[complex_crossing_rfq_message_at] = (complex_crossing_rfq_message_base + 20 + complex_crossing_rfq_message_at + 1) % 256; complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Crossing Rfq Message to the wire, 24 bytes from where the cursor stands */
inline encode_complex_crossing_rfq_message(complex_crossing_rfq_message_record) {
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 4 -> wire[at] = complex_crossing_rfq_message_record.source_time[complex_crossing_rfq_message_at]; at = at + 1; complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 4 -> wire[at] = complex_crossing_rfq_message_record.source_ns[complex_crossing_rfq_message_at]; at = at + 1; complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 4 -> wire[at] = complex_crossing_rfq_message_record.complex_index[complex_crossing_rfq_message_at]; at = at + 1; complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 4 -> wire[at] = complex_crossing_rfq_message_record.symbol_seq_num[complex_crossing_rfq_message_at]; at = at + 1; complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_crossing_rfq_message_record.side; at = at + 1;
  wire[at] = complex_crossing_rfq_message_record.reserved_1; at = at + 1;
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 2 -> wire[at] = complex_crossing_rfq_message_record.volume_2[complex_crossing_rfq_message_at]; at = at + 1; complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 4 -> wire[at] = complex_crossing_rfq_message_record.price[complex_crossing_rfq_message_at]; at = at + 1; complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Crossing Rfq Message off the wire, 24 bytes from where the cursor stands */
inline decode_complex_crossing_rfq_message(complex_crossing_rfq_message_record) {
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 4 -> complex_crossing_rfq_message_record.source_time[complex_crossing_rfq_message_at] = wire[at]; at = at + 1; complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 4 -> complex_crossing_rfq_message_record.source_ns[complex_crossing_rfq_message_at] = wire[at]; at = at + 1; complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 4 -> complex_crossing_rfq_message_record.complex_index[complex_crossing_rfq_message_at] = wire[at]; at = at + 1; complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 4 -> complex_crossing_rfq_message_record.symbol_seq_num[complex_crossing_rfq_message_at] = wire[at]; at = at + 1; complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  complex_crossing_rfq_message_record.side = wire[at]; at = at + 1;
  complex_crossing_rfq_message_record.reserved_1 = wire[at]; at = at + 1;
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 2 -> complex_crossing_rfq_message_record.volume_2[complex_crossing_rfq_message_at] = wire[at]; at = at + 1; complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 4 -> complex_crossing_rfq_message_record.price[complex_crossing_rfq_message_at] = wire[at]; at = at + 1; complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Complex Crossing Rfq Message is what was written, byte for byte */
inline equal_complex_crossing_rfq_message(complex_crossing_rfq_message_read, complex_crossing_rfq_message_written) {
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 4 -> assert(complex_crossing_rfq_message_read.source_time[complex_crossing_rfq_message_at] == complex_crossing_rfq_message_written.source_time[complex_crossing_rfq_message_at]); complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 4 -> assert(complex_crossing_rfq_message_read.source_ns[complex_crossing_rfq_message_at] == complex_crossing_rfq_message_written.source_ns[complex_crossing_rfq_message_at]); complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 4 -> assert(complex_crossing_rfq_message_read.complex_index[complex_crossing_rfq_message_at] == complex_crossing_rfq_message_written.complex_index[complex_crossing_rfq_message_at]); complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 4 -> assert(complex_crossing_rfq_message_read.symbol_seq_num[complex_crossing_rfq_message_at] == complex_crossing_rfq_message_written.symbol_seq_num[complex_crossing_rfq_message_at]); complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  assert(complex_crossing_rfq_message_read.side == complex_crossing_rfq_message_written.side);
  assert(complex_crossing_rfq_message_read.reserved_1 == complex_crossing_rfq_message_written.reserved_1);
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 2 -> assert(complex_crossing_rfq_message_read.volume_2[complex_crossing_rfq_message_at] == complex_crossing_rfq_message_written.volume_2[complex_crossing_rfq_message_at]); complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  complex_crossing_rfq_message_at = 0;
  do
  :: complex_crossing_rfq_message_at < 4 -> assert(complex_crossing_rfq_message_read.price[complex_crossing_rfq_message_at] == complex_crossing_rfq_message_written.price[complex_crossing_rfq_message_at]); complex_crossing_rfq_message_at = complex_crossing_rfq_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Complex Cube Rfq Message: 24 bytes -------------------------------------- */

typedef ComplexCubeRfqMessage {
  byte source_time[4];
  byte source_ns[4];
  byte complex_index[4];
  byte symbol_seq_num[4];
  byte side;
  byte reserved_1;
  byte volume_2[2];
  byte price[4]
};

int complex_cube_rfq_message_at;

/* every byte of Complex Cube Rfq Message set to one value */
inline fill_complex_cube_rfq_message(complex_cube_rfq_message_record, complex_cube_rfq_message_value) {
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 4 -> complex_cube_rfq_message_record.source_time[complex_cube_rfq_message_at] = complex_cube_rfq_message_value; complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 4 -> complex_cube_rfq_message_record.source_ns[complex_cube_rfq_message_at] = complex_cube_rfq_message_value; complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 4 -> complex_cube_rfq_message_record.complex_index[complex_cube_rfq_message_at] = complex_cube_rfq_message_value; complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 4 -> complex_cube_rfq_message_record.symbol_seq_num[complex_cube_rfq_message_at] = complex_cube_rfq_message_value; complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  complex_cube_rfq_message_record.side = complex_cube_rfq_message_value;
  complex_cube_rfq_message_record.reserved_1 = complex_cube_rfq_message_value;
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 2 -> complex_cube_rfq_message_record.volume_2[complex_cube_rfq_message_at] = complex_cube_rfq_message_value; complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 4 -> complex_cube_rfq_message_record.price[complex_cube_rfq_message_at] = complex_cube_rfq_message_value; complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Complex Cube Rfq Message set to where it lies, so a field read out of place says so */
inline ramp_complex_cube_rfq_message(complex_cube_rfq_message_record, complex_cube_rfq_message_base) {
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 4 -> complex_cube_rfq_message_record.source_time[complex_cube_rfq_message_at] = (complex_cube_rfq_message_base + 0 + complex_cube_rfq_message_at + 1) % 256; complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 4 -> complex_cube_rfq_message_record.source_ns[complex_cube_rfq_message_at] = (complex_cube_rfq_message_base + 4 + complex_cube_rfq_message_at + 1) % 256; complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 4 -> complex_cube_rfq_message_record.complex_index[complex_cube_rfq_message_at] = (complex_cube_rfq_message_base + 8 + complex_cube_rfq_message_at + 1) % 256; complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 4 -> complex_cube_rfq_message_record.symbol_seq_num[complex_cube_rfq_message_at] = (complex_cube_rfq_message_base + 12 + complex_cube_rfq_message_at + 1) % 256; complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  complex_cube_rfq_message_record.side = (complex_cube_rfq_message_base + 16 + 1) % 256;
  complex_cube_rfq_message_record.reserved_1 = (complex_cube_rfq_message_base + 17 + 1) % 256;
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 2 -> complex_cube_rfq_message_record.volume_2[complex_cube_rfq_message_at] = (complex_cube_rfq_message_base + 18 + complex_cube_rfq_message_at + 1) % 256; complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 4 -> complex_cube_rfq_message_record.price[complex_cube_rfq_message_at] = (complex_cube_rfq_message_base + 20 + complex_cube_rfq_message_at + 1) % 256; complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Cube Rfq Message to the wire, 24 bytes from where the cursor stands */
inline encode_complex_cube_rfq_message(complex_cube_rfq_message_record) {
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 4 -> wire[at] = complex_cube_rfq_message_record.source_time[complex_cube_rfq_message_at]; at = at + 1; complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 4 -> wire[at] = complex_cube_rfq_message_record.source_ns[complex_cube_rfq_message_at]; at = at + 1; complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 4 -> wire[at] = complex_cube_rfq_message_record.complex_index[complex_cube_rfq_message_at]; at = at + 1; complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 4 -> wire[at] = complex_cube_rfq_message_record.symbol_seq_num[complex_cube_rfq_message_at]; at = at + 1; complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_cube_rfq_message_record.side; at = at + 1;
  wire[at] = complex_cube_rfq_message_record.reserved_1; at = at + 1;
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 2 -> wire[at] = complex_cube_rfq_message_record.volume_2[complex_cube_rfq_message_at]; at = at + 1; complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 4 -> wire[at] = complex_cube_rfq_message_record.price[complex_cube_rfq_message_at]; at = at + 1; complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Cube Rfq Message off the wire, 24 bytes from where the cursor stands */
inline decode_complex_cube_rfq_message(complex_cube_rfq_message_record) {
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 4 -> complex_cube_rfq_message_record.source_time[complex_cube_rfq_message_at] = wire[at]; at = at + 1; complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 4 -> complex_cube_rfq_message_record.source_ns[complex_cube_rfq_message_at] = wire[at]; at = at + 1; complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 4 -> complex_cube_rfq_message_record.complex_index[complex_cube_rfq_message_at] = wire[at]; at = at + 1; complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 4 -> complex_cube_rfq_message_record.symbol_seq_num[complex_cube_rfq_message_at] = wire[at]; at = at + 1; complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  complex_cube_rfq_message_record.side = wire[at]; at = at + 1;
  complex_cube_rfq_message_record.reserved_1 = wire[at]; at = at + 1;
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 2 -> complex_cube_rfq_message_record.volume_2[complex_cube_rfq_message_at] = wire[at]; at = at + 1; complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 4 -> complex_cube_rfq_message_record.price[complex_cube_rfq_message_at] = wire[at]; at = at + 1; complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Complex Cube Rfq Message is what was written, byte for byte */
inline equal_complex_cube_rfq_message(complex_cube_rfq_message_read, complex_cube_rfq_message_written) {
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 4 -> assert(complex_cube_rfq_message_read.source_time[complex_cube_rfq_message_at] == complex_cube_rfq_message_written.source_time[complex_cube_rfq_message_at]); complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 4 -> assert(complex_cube_rfq_message_read.source_ns[complex_cube_rfq_message_at] == complex_cube_rfq_message_written.source_ns[complex_cube_rfq_message_at]); complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 4 -> assert(complex_cube_rfq_message_read.complex_index[complex_cube_rfq_message_at] == complex_cube_rfq_message_written.complex_index[complex_cube_rfq_message_at]); complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 4 -> assert(complex_cube_rfq_message_read.symbol_seq_num[complex_cube_rfq_message_at] == complex_cube_rfq_message_written.symbol_seq_num[complex_cube_rfq_message_at]); complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  assert(complex_cube_rfq_message_read.side == complex_cube_rfq_message_written.side);
  assert(complex_cube_rfq_message_read.reserved_1 == complex_cube_rfq_message_written.reserved_1);
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 2 -> assert(complex_cube_rfq_message_read.volume_2[complex_cube_rfq_message_at] == complex_cube_rfq_message_written.volume_2[complex_cube_rfq_message_at]); complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  complex_cube_rfq_message_at = 0;
  do
  :: complex_cube_rfq_message_at < 4 -> assert(complex_cube_rfq_message_read.price[complex_cube_rfq_message_at] == complex_cube_rfq_message_written.price[complex_cube_rfq_message_at]); complex_cube_rfq_message_at = complex_cube_rfq_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Complex Status Message: 20 bytes ---------------------------------------- */

/* The Complex Status message is used to inform the subscribers of changes in symbol status of a complex symbol. */
typedef ComplexStatusMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte complex_index[4];
  byte symbol_seq_num[4];
  byte security_status;
  byte halt_condition;
  byte reserved_2[2]
};

int complex_status_message_at;

/* every byte of Complex Status Message set to one value */
inline fill_complex_status_message(complex_status_message_record, complex_status_message_value) {
  complex_status_message_at = 0;
  do
  :: complex_status_message_at < 4 -> complex_status_message_record.source_time[complex_status_message_at] = complex_status_message_value; complex_status_message_at = complex_status_message_at + 1
  :: else -> break
  od;
  complex_status_message_at = 0;
  do
  :: complex_status_message_at < 4 -> complex_status_message_record.source_time_ns[complex_status_message_at] = complex_status_message_value; complex_status_message_at = complex_status_message_at + 1
  :: else -> break
  od;
  complex_status_message_at = 0;
  do
  :: complex_status_message_at < 4 -> complex_status_message_record.complex_index[complex_status_message_at] = complex_status_message_value; complex_status_message_at = complex_status_message_at + 1
  :: else -> break
  od;
  complex_status_message_at = 0;
  do
  :: complex_status_message_at < 4 -> complex_status_message_record.symbol_seq_num[complex_status_message_at] = complex_status_message_value; complex_status_message_at = complex_status_message_at + 1
  :: else -> break
  od;
  complex_status_message_record.security_status = complex_status_message_value;
  complex_status_message_record.halt_condition = complex_status_message_value;
  complex_status_message_at = 0;
  do
  :: complex_status_message_at < 2 -> complex_status_message_record.reserved_2[complex_status_message_at] = complex_status_message_value; complex_status_message_at = complex_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Complex Status Message set to where it lies, so a field read out of place says so */
inline ramp_complex_status_message(complex_status_message_record, complex_status_message_base) {
  complex_status_message_at = 0;
  do
  :: complex_status_message_at < 4 -> complex_status_message_record.source_time[complex_status_message_at] = (complex_status_message_base + 0 + complex_status_message_at + 1) % 256; complex_status_message_at = complex_status_message_at + 1
  :: else -> break
  od;
  complex_status_message_at = 0;
  do
  :: complex_status_message_at < 4 -> complex_status_message_record.source_time_ns[complex_status_message_at] = (complex_status_message_base + 4 + complex_status_message_at + 1) % 256; complex_status_message_at = complex_status_message_at + 1
  :: else -> break
  od;
  complex_status_message_at = 0;
  do
  :: complex_status_message_at < 4 -> complex_status_message_record.complex_index[complex_status_message_at] = (complex_status_message_base + 8 + complex_status_message_at + 1) % 256; complex_status_message_at = complex_status_message_at + 1
  :: else -> break
  od;
  complex_status_message_at = 0;
  do
  :: complex_status_message_at < 4 -> complex_status_message_record.symbol_seq_num[complex_status_message_at] = (complex_status_message_base + 12 + complex_status_message_at + 1) % 256; complex_status_message_at = complex_status_message_at + 1
  :: else -> break
  od;
  complex_status_message_record.security_status = (complex_status_message_base + 16 + 1) % 256;
  complex_status_message_record.halt_condition = (complex_status_message_base + 17 + 1) % 256;
  complex_status_message_at = 0;
  do
  :: complex_status_message_at < 2 -> complex_status_message_record.reserved_2[complex_status_message_at] = (complex_status_message_base + 18 + complex_status_message_at + 1) % 256; complex_status_message_at = complex_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Status Message to the wire, 20 bytes from where the cursor stands */
inline encode_complex_status_message(complex_status_message_record) {
  complex_status_message_at = 0;
  do
  :: complex_status_message_at < 4 -> wire[at] = complex_status_message_record.source_time[complex_status_message_at]; at = at + 1; complex_status_message_at = complex_status_message_at + 1
  :: else -> break
  od;
  complex_status_message_at = 0;
  do
  :: complex_status_message_at < 4 -> wire[at] = complex_status_message_record.source_time_ns[complex_status_message_at]; at = at + 1; complex_status_message_at = complex_status_message_at + 1
  :: else -> break
  od;
  complex_status_message_at = 0;
  do
  :: complex_status_message_at < 4 -> wire[at] = complex_status_message_record.complex_index[complex_status_message_at]; at = at + 1; complex_status_message_at = complex_status_message_at + 1
  :: else -> break
  od;
  complex_status_message_at = 0;
  do
  :: complex_status_message_at < 4 -> wire[at] = complex_status_message_record.symbol_seq_num[complex_status_message_at]; at = at + 1; complex_status_message_at = complex_status_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_status_message_record.security_status; at = at + 1;
  wire[at] = complex_status_message_record.halt_condition; at = at + 1;
  complex_status_message_at = 0;
  do
  :: complex_status_message_at < 2 -> wire[at] = complex_status_message_record.reserved_2[complex_status_message_at]; at = at + 1; complex_status_message_at = complex_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Status Message off the wire, 20 bytes from where the cursor stands */
inline decode_complex_status_message(complex_status_message_record) {
  complex_status_message_at = 0;
  do
  :: complex_status_message_at < 4 -> complex_status_message_record.source_time[complex_status_message_at] = wire[at]; at = at + 1; complex_status_message_at = complex_status_message_at + 1
  :: else -> break
  od;
  complex_status_message_at = 0;
  do
  :: complex_status_message_at < 4 -> complex_status_message_record.source_time_ns[complex_status_message_at] = wire[at]; at = at + 1; complex_status_message_at = complex_status_message_at + 1
  :: else -> break
  od;
  complex_status_message_at = 0;
  do
  :: complex_status_message_at < 4 -> complex_status_message_record.complex_index[complex_status_message_at] = wire[at]; at = at + 1; complex_status_message_at = complex_status_message_at + 1
  :: else -> break
  od;
  complex_status_message_at = 0;
  do
  :: complex_status_message_at < 4 -> complex_status_message_record.symbol_seq_num[complex_status_message_at] = wire[at]; at = at + 1; complex_status_message_at = complex_status_message_at + 1
  :: else -> break
  od;
  complex_status_message_record.security_status = wire[at]; at = at + 1;
  complex_status_message_record.halt_condition = wire[at]; at = at + 1;
  complex_status_message_at = 0;
  do
  :: complex_status_message_at < 2 -> complex_status_message_record.reserved_2[complex_status_message_at] = wire[at]; at = at + 1; complex_status_message_at = complex_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Complex Status Message is what was written, byte for byte */
inline equal_complex_status_message(complex_status_message_read, complex_status_message_written) {
  complex_status_message_at = 0;
  do
  :: complex_status_message_at < 4 -> assert(complex_status_message_read.source_time[complex_status_message_at] == complex_status_message_written.source_time[complex_status_message_at]); complex_status_message_at = complex_status_message_at + 1
  :: else -> break
  od;
  complex_status_message_at = 0;
  do
  :: complex_status_message_at < 4 -> assert(complex_status_message_read.source_time_ns[complex_status_message_at] == complex_status_message_written.source_time_ns[complex_status_message_at]); complex_status_message_at = complex_status_message_at + 1
  :: else -> break
  od;
  complex_status_message_at = 0;
  do
  :: complex_status_message_at < 4 -> assert(complex_status_message_read.complex_index[complex_status_message_at] == complex_status_message_written.complex_index[complex_status_message_at]); complex_status_message_at = complex_status_message_at + 1
  :: else -> break
  od;
  complex_status_message_at = 0;
  do
  :: complex_status_message_at < 4 -> assert(complex_status_message_read.symbol_seq_num[complex_status_message_at] == complex_status_message_written.symbol_seq_num[complex_status_message_at]); complex_status_message_at = complex_status_message_at + 1
  :: else -> break
  od;
  assert(complex_status_message_read.security_status == complex_status_message_written.security_status);
  assert(complex_status_message_read.halt_condition == complex_status_message_written.halt_condition);
  complex_status_message_at = 0;
  do
  :: complex_status_message_at < 2 -> assert(complex_status_message_read.reserved_2[complex_status_message_at] == complex_status_message_written.reserved_2[complex_status_message_at]); complex_status_message_at = complex_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Refresh Complex Quote Message: 36 bytes --------------------------------- */

/* The Refresh Complex Quote message is sent in the event no quote messages are published for the symbol for 2 consecutive minutes. */
typedef RefreshComplexQuoteMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte complex_index[4];
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

int refresh_complex_quote_message_at;

/* every byte of Refresh Complex Quote Message set to one value */
inline fill_refresh_complex_quote_message(refresh_complex_quote_message_record, refresh_complex_quote_message_value) {
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> refresh_complex_quote_message_record.source_time[refresh_complex_quote_message_at] = refresh_complex_quote_message_value; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> refresh_complex_quote_message_record.source_time_ns[refresh_complex_quote_message_at] = refresh_complex_quote_message_value; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> refresh_complex_quote_message_record.complex_index[refresh_complex_quote_message_at] = refresh_complex_quote_message_value; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> refresh_complex_quote_message_record.symbol_seq_num[refresh_complex_quote_message_at] = refresh_complex_quote_message_value; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> refresh_complex_quote_message_record.ask_price[refresh_complex_quote_message_at] = refresh_complex_quote_message_value; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> refresh_complex_quote_message_record.bid_price[refresh_complex_quote_message_at] = refresh_complex_quote_message_value; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 2 -> refresh_complex_quote_message_record.ask_volume[refresh_complex_quote_message_at] = refresh_complex_quote_message_value; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 2 -> refresh_complex_quote_message_record.bid_volume[refresh_complex_quote_message_at] = refresh_complex_quote_message_value; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 2 -> refresh_complex_quote_message_record.ask_customer_volume[refresh_complex_quote_message_at] = refresh_complex_quote_message_value; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 2 -> refresh_complex_quote_message_record.bid_customer_volume[refresh_complex_quote_message_at] = refresh_complex_quote_message_value; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_record.quote_condition = refresh_complex_quote_message_value;
  refresh_complex_quote_message_record.reserved_1 = refresh_complex_quote_message_value;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 2 -> refresh_complex_quote_message_record.reserved_2[refresh_complex_quote_message_at] = refresh_complex_quote_message_value; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Refresh Complex Quote Message set to where it lies, so a field read out of place says so */
inline ramp_refresh_complex_quote_message(refresh_complex_quote_message_record, refresh_complex_quote_message_base) {
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> refresh_complex_quote_message_record.source_time[refresh_complex_quote_message_at] = (refresh_complex_quote_message_base + 0 + refresh_complex_quote_message_at + 1) % 256; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> refresh_complex_quote_message_record.source_time_ns[refresh_complex_quote_message_at] = (refresh_complex_quote_message_base + 4 + refresh_complex_quote_message_at + 1) % 256; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> refresh_complex_quote_message_record.complex_index[refresh_complex_quote_message_at] = (refresh_complex_quote_message_base + 8 + refresh_complex_quote_message_at + 1) % 256; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> refresh_complex_quote_message_record.symbol_seq_num[refresh_complex_quote_message_at] = (refresh_complex_quote_message_base + 12 + refresh_complex_quote_message_at + 1) % 256; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> refresh_complex_quote_message_record.ask_price[refresh_complex_quote_message_at] = (refresh_complex_quote_message_base + 16 + refresh_complex_quote_message_at + 1) % 256; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> refresh_complex_quote_message_record.bid_price[refresh_complex_quote_message_at] = (refresh_complex_quote_message_base + 20 + refresh_complex_quote_message_at + 1) % 256; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 2 -> refresh_complex_quote_message_record.ask_volume[refresh_complex_quote_message_at] = (refresh_complex_quote_message_base + 24 + refresh_complex_quote_message_at + 1) % 256; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 2 -> refresh_complex_quote_message_record.bid_volume[refresh_complex_quote_message_at] = (refresh_complex_quote_message_base + 26 + refresh_complex_quote_message_at + 1) % 256; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 2 -> refresh_complex_quote_message_record.ask_customer_volume[refresh_complex_quote_message_at] = (refresh_complex_quote_message_base + 28 + refresh_complex_quote_message_at + 1) % 256; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 2 -> refresh_complex_quote_message_record.bid_customer_volume[refresh_complex_quote_message_at] = (refresh_complex_quote_message_base + 30 + refresh_complex_quote_message_at + 1) % 256; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_record.quote_condition = (refresh_complex_quote_message_base + 32 + 1) % 256;
  refresh_complex_quote_message_record.reserved_1 = (refresh_complex_quote_message_base + 33 + 1) % 256;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 2 -> refresh_complex_quote_message_record.reserved_2[refresh_complex_quote_message_at] = (refresh_complex_quote_message_base + 34 + refresh_complex_quote_message_at + 1) % 256; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Complex Quote Message to the wire, 36 bytes from where the cursor stands */
inline encode_refresh_complex_quote_message(refresh_complex_quote_message_record) {
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> wire[at] = refresh_complex_quote_message_record.source_time[refresh_complex_quote_message_at]; at = at + 1; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> wire[at] = refresh_complex_quote_message_record.source_time_ns[refresh_complex_quote_message_at]; at = at + 1; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> wire[at] = refresh_complex_quote_message_record.complex_index[refresh_complex_quote_message_at]; at = at + 1; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> wire[at] = refresh_complex_quote_message_record.symbol_seq_num[refresh_complex_quote_message_at]; at = at + 1; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> wire[at] = refresh_complex_quote_message_record.ask_price[refresh_complex_quote_message_at]; at = at + 1; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> wire[at] = refresh_complex_quote_message_record.bid_price[refresh_complex_quote_message_at]; at = at + 1; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 2 -> wire[at] = refresh_complex_quote_message_record.ask_volume[refresh_complex_quote_message_at]; at = at + 1; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 2 -> wire[at] = refresh_complex_quote_message_record.bid_volume[refresh_complex_quote_message_at]; at = at + 1; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 2 -> wire[at] = refresh_complex_quote_message_record.ask_customer_volume[refresh_complex_quote_message_at]; at = at + 1; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 2 -> wire[at] = refresh_complex_quote_message_record.bid_customer_volume[refresh_complex_quote_message_at]; at = at + 1; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = refresh_complex_quote_message_record.quote_condition; at = at + 1;
  wire[at] = refresh_complex_quote_message_record.reserved_1; at = at + 1;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 2 -> wire[at] = refresh_complex_quote_message_record.reserved_2[refresh_complex_quote_message_at]; at = at + 1; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Complex Quote Message off the wire, 36 bytes from where the cursor stands */
inline decode_refresh_complex_quote_message(refresh_complex_quote_message_record) {
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> refresh_complex_quote_message_record.source_time[refresh_complex_quote_message_at] = wire[at]; at = at + 1; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> refresh_complex_quote_message_record.source_time_ns[refresh_complex_quote_message_at] = wire[at]; at = at + 1; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> refresh_complex_quote_message_record.complex_index[refresh_complex_quote_message_at] = wire[at]; at = at + 1; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> refresh_complex_quote_message_record.symbol_seq_num[refresh_complex_quote_message_at] = wire[at]; at = at + 1; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> refresh_complex_quote_message_record.ask_price[refresh_complex_quote_message_at] = wire[at]; at = at + 1; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> refresh_complex_quote_message_record.bid_price[refresh_complex_quote_message_at] = wire[at]; at = at + 1; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 2 -> refresh_complex_quote_message_record.ask_volume[refresh_complex_quote_message_at] = wire[at]; at = at + 1; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 2 -> refresh_complex_quote_message_record.bid_volume[refresh_complex_quote_message_at] = wire[at]; at = at + 1; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 2 -> refresh_complex_quote_message_record.ask_customer_volume[refresh_complex_quote_message_at] = wire[at]; at = at + 1; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 2 -> refresh_complex_quote_message_record.bid_customer_volume[refresh_complex_quote_message_at] = wire[at]; at = at + 1; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_record.quote_condition = wire[at]; at = at + 1;
  refresh_complex_quote_message_record.reserved_1 = wire[at]; at = at + 1;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 2 -> refresh_complex_quote_message_record.reserved_2[refresh_complex_quote_message_at] = wire[at]; at = at + 1; refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Refresh Complex Quote Message is what was written, byte for byte */
inline equal_refresh_complex_quote_message(refresh_complex_quote_message_read, refresh_complex_quote_message_written) {
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> assert(refresh_complex_quote_message_read.source_time[refresh_complex_quote_message_at] == refresh_complex_quote_message_written.source_time[refresh_complex_quote_message_at]); refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> assert(refresh_complex_quote_message_read.source_time_ns[refresh_complex_quote_message_at] == refresh_complex_quote_message_written.source_time_ns[refresh_complex_quote_message_at]); refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> assert(refresh_complex_quote_message_read.complex_index[refresh_complex_quote_message_at] == refresh_complex_quote_message_written.complex_index[refresh_complex_quote_message_at]); refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> assert(refresh_complex_quote_message_read.symbol_seq_num[refresh_complex_quote_message_at] == refresh_complex_quote_message_written.symbol_seq_num[refresh_complex_quote_message_at]); refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> assert(refresh_complex_quote_message_read.ask_price[refresh_complex_quote_message_at] == refresh_complex_quote_message_written.ask_price[refresh_complex_quote_message_at]); refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 4 -> assert(refresh_complex_quote_message_read.bid_price[refresh_complex_quote_message_at] == refresh_complex_quote_message_written.bid_price[refresh_complex_quote_message_at]); refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 2 -> assert(refresh_complex_quote_message_read.ask_volume[refresh_complex_quote_message_at] == refresh_complex_quote_message_written.ask_volume[refresh_complex_quote_message_at]); refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 2 -> assert(refresh_complex_quote_message_read.bid_volume[refresh_complex_quote_message_at] == refresh_complex_quote_message_written.bid_volume[refresh_complex_quote_message_at]); refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 2 -> assert(refresh_complex_quote_message_read.ask_customer_volume[refresh_complex_quote_message_at] == refresh_complex_quote_message_written.ask_customer_volume[refresh_complex_quote_message_at]); refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 2 -> assert(refresh_complex_quote_message_read.bid_customer_volume[refresh_complex_quote_message_at] == refresh_complex_quote_message_written.bid_customer_volume[refresh_complex_quote_message_at]); refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  assert(refresh_complex_quote_message_read.quote_condition == refresh_complex_quote_message_written.quote_condition);
  assert(refresh_complex_quote_message_read.reserved_1 == refresh_complex_quote_message_written.reserved_1);
  refresh_complex_quote_message_at = 0;
  do
  :: refresh_complex_quote_message_at < 2 -> assert(refresh_complex_quote_message_read.reserved_2[refresh_complex_quote_message_at] == refresh_complex_quote_message_written.reserved_2[refresh_complex_quote_message_at]); refresh_complex_quote_message_at = refresh_complex_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Refresh Complex Trade Message: 32 bytes --------------------------------- */

/* The Refresh Complex Trade message is sent in the event no Complex Trade messages are published for the symbol for 2 consecutive minutes. */
typedef RefreshComplexTradeMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte complex_index[4];
  byte symbol_seq_num[4];
  byte trade_id[4];
  byte price[4];
  byte volume_4[4];
  byte trade_cond_1;
  byte trade_cond_2;
  byte reserved_2[2]
};

int refresh_complex_trade_message_at;

/* every byte of Refresh Complex Trade Message set to one value */
inline fill_refresh_complex_trade_message(refresh_complex_trade_message_record, refresh_complex_trade_message_value) {
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> refresh_complex_trade_message_record.source_time[refresh_complex_trade_message_at] = refresh_complex_trade_message_value; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> refresh_complex_trade_message_record.source_time_ns[refresh_complex_trade_message_at] = refresh_complex_trade_message_value; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> refresh_complex_trade_message_record.complex_index[refresh_complex_trade_message_at] = refresh_complex_trade_message_value; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> refresh_complex_trade_message_record.symbol_seq_num[refresh_complex_trade_message_at] = refresh_complex_trade_message_value; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> refresh_complex_trade_message_record.trade_id[refresh_complex_trade_message_at] = refresh_complex_trade_message_value; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> refresh_complex_trade_message_record.price[refresh_complex_trade_message_at] = refresh_complex_trade_message_value; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> refresh_complex_trade_message_record.volume_4[refresh_complex_trade_message_at] = refresh_complex_trade_message_value; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_record.trade_cond_1 = refresh_complex_trade_message_value;
  refresh_complex_trade_message_record.trade_cond_2 = refresh_complex_trade_message_value;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 2 -> refresh_complex_trade_message_record.reserved_2[refresh_complex_trade_message_at] = refresh_complex_trade_message_value; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Refresh Complex Trade Message set to where it lies, so a field read out of place says so */
inline ramp_refresh_complex_trade_message(refresh_complex_trade_message_record, refresh_complex_trade_message_base) {
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> refresh_complex_trade_message_record.source_time[refresh_complex_trade_message_at] = (refresh_complex_trade_message_base + 0 + refresh_complex_trade_message_at + 1) % 256; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> refresh_complex_trade_message_record.source_time_ns[refresh_complex_trade_message_at] = (refresh_complex_trade_message_base + 4 + refresh_complex_trade_message_at + 1) % 256; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> refresh_complex_trade_message_record.complex_index[refresh_complex_trade_message_at] = (refresh_complex_trade_message_base + 8 + refresh_complex_trade_message_at + 1) % 256; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> refresh_complex_trade_message_record.symbol_seq_num[refresh_complex_trade_message_at] = (refresh_complex_trade_message_base + 12 + refresh_complex_trade_message_at + 1) % 256; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> refresh_complex_trade_message_record.trade_id[refresh_complex_trade_message_at] = (refresh_complex_trade_message_base + 16 + refresh_complex_trade_message_at + 1) % 256; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> refresh_complex_trade_message_record.price[refresh_complex_trade_message_at] = (refresh_complex_trade_message_base + 20 + refresh_complex_trade_message_at + 1) % 256; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> refresh_complex_trade_message_record.volume_4[refresh_complex_trade_message_at] = (refresh_complex_trade_message_base + 24 + refresh_complex_trade_message_at + 1) % 256; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_record.trade_cond_1 = (refresh_complex_trade_message_base + 28 + 1) % 256;
  refresh_complex_trade_message_record.trade_cond_2 = (refresh_complex_trade_message_base + 29 + 1) % 256;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 2 -> refresh_complex_trade_message_record.reserved_2[refresh_complex_trade_message_at] = (refresh_complex_trade_message_base + 30 + refresh_complex_trade_message_at + 1) % 256; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Complex Trade Message to the wire, 32 bytes from where the cursor stands */
inline encode_refresh_complex_trade_message(refresh_complex_trade_message_record) {
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> wire[at] = refresh_complex_trade_message_record.source_time[refresh_complex_trade_message_at]; at = at + 1; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> wire[at] = refresh_complex_trade_message_record.source_time_ns[refresh_complex_trade_message_at]; at = at + 1; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> wire[at] = refresh_complex_trade_message_record.complex_index[refresh_complex_trade_message_at]; at = at + 1; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> wire[at] = refresh_complex_trade_message_record.symbol_seq_num[refresh_complex_trade_message_at]; at = at + 1; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> wire[at] = refresh_complex_trade_message_record.trade_id[refresh_complex_trade_message_at]; at = at + 1; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> wire[at] = refresh_complex_trade_message_record.price[refresh_complex_trade_message_at]; at = at + 1; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> wire[at] = refresh_complex_trade_message_record.volume_4[refresh_complex_trade_message_at]; at = at + 1; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = refresh_complex_trade_message_record.trade_cond_1; at = at + 1;
  wire[at] = refresh_complex_trade_message_record.trade_cond_2; at = at + 1;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 2 -> wire[at] = refresh_complex_trade_message_record.reserved_2[refresh_complex_trade_message_at]; at = at + 1; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Complex Trade Message off the wire, 32 bytes from where the cursor stands */
inline decode_refresh_complex_trade_message(refresh_complex_trade_message_record) {
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> refresh_complex_trade_message_record.source_time[refresh_complex_trade_message_at] = wire[at]; at = at + 1; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> refresh_complex_trade_message_record.source_time_ns[refresh_complex_trade_message_at] = wire[at]; at = at + 1; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> refresh_complex_trade_message_record.complex_index[refresh_complex_trade_message_at] = wire[at]; at = at + 1; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> refresh_complex_trade_message_record.symbol_seq_num[refresh_complex_trade_message_at] = wire[at]; at = at + 1; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> refresh_complex_trade_message_record.trade_id[refresh_complex_trade_message_at] = wire[at]; at = at + 1; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> refresh_complex_trade_message_record.price[refresh_complex_trade_message_at] = wire[at]; at = at + 1; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> refresh_complex_trade_message_record.volume_4[refresh_complex_trade_message_at] = wire[at]; at = at + 1; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_record.trade_cond_1 = wire[at]; at = at + 1;
  refresh_complex_trade_message_record.trade_cond_2 = wire[at]; at = at + 1;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 2 -> refresh_complex_trade_message_record.reserved_2[refresh_complex_trade_message_at] = wire[at]; at = at + 1; refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Refresh Complex Trade Message is what was written, byte for byte */
inline equal_refresh_complex_trade_message(refresh_complex_trade_message_read, refresh_complex_trade_message_written) {
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> assert(refresh_complex_trade_message_read.source_time[refresh_complex_trade_message_at] == refresh_complex_trade_message_written.source_time[refresh_complex_trade_message_at]); refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> assert(refresh_complex_trade_message_read.source_time_ns[refresh_complex_trade_message_at] == refresh_complex_trade_message_written.source_time_ns[refresh_complex_trade_message_at]); refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> assert(refresh_complex_trade_message_read.complex_index[refresh_complex_trade_message_at] == refresh_complex_trade_message_written.complex_index[refresh_complex_trade_message_at]); refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> assert(refresh_complex_trade_message_read.symbol_seq_num[refresh_complex_trade_message_at] == refresh_complex_trade_message_written.symbol_seq_num[refresh_complex_trade_message_at]); refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> assert(refresh_complex_trade_message_read.trade_id[refresh_complex_trade_message_at] == refresh_complex_trade_message_written.trade_id[refresh_complex_trade_message_at]); refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> assert(refresh_complex_trade_message_read.price[refresh_complex_trade_message_at] == refresh_complex_trade_message_written.price[refresh_complex_trade_message_at]); refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 4 -> assert(refresh_complex_trade_message_read.volume_4[refresh_complex_trade_message_at] == refresh_complex_trade_message_written.volume_4[refresh_complex_trade_message_at]); refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
  :: else -> break
  od;
  assert(refresh_complex_trade_message_read.trade_cond_1 == refresh_complex_trade_message_written.trade_cond_1);
  assert(refresh_complex_trade_message_read.trade_cond_2 == refresh_complex_trade_message_written.trade_cond_2);
  refresh_complex_trade_message_at = 0;
  do
  :: refresh_complex_trade_message_at < 2 -> assert(refresh_complex_trade_message_read.reserved_2[refresh_complex_trade_message_at] == refresh_complex_trade_message_written.reserved_2[refresh_complex_trade_message_at]); refresh_complex_trade_message_at = refresh_complex_trade_message_at + 1
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

/* Complex Quote Message: encoded, read back, and compared */
proctype check_complex_quote_message() {
  ComplexQuoteMessage complex_quote_message_sent;
  ComplexQuoteMessage complex_quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_quote_message(complex_quote_message_sent, 0)
  :: pattern == 1 -> fill_complex_quote_message(complex_quote_message_sent, 32)
  :: pattern == 2 -> fill_complex_quote_message(complex_quote_message_sent, 255)
  :: else -> ramp_complex_quote_message(complex_quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_quote_message(complex_quote_message_sent);
    assert(at == 36);
    at = 0;
    decode_complex_quote_message(complex_quote_message_got);
    assert(at == 36);
    equal_complex_quote_message(complex_quote_message_got, complex_quote_message_sent)
  }
}

/* Complex Trade Message: encoded, read back, and compared */
proctype check_complex_trade_message() {
  ComplexTradeMessage complex_trade_message_sent;
  ComplexTradeMessage complex_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_trade_message(complex_trade_message_sent, 0)
  :: pattern == 1 -> fill_complex_trade_message(complex_trade_message_sent, 32)
  :: pattern == 2 -> fill_complex_trade_message(complex_trade_message_sent, 255)
  :: else -> ramp_complex_trade_message(complex_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_trade_message(complex_trade_message_sent);
    assert(at == 32);
    at = 0;
    decode_complex_trade_message(complex_trade_message_got);
    assert(at == 32);
    equal_complex_trade_message(complex_trade_message_got, complex_trade_message_sent)
  }
}

/* Complex Crossing Rfq Message: encoded, read back, and compared */
proctype check_complex_crossing_rfq_message() {
  ComplexCrossingRfqMessage complex_crossing_rfq_message_sent;
  ComplexCrossingRfqMessage complex_crossing_rfq_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_crossing_rfq_message(complex_crossing_rfq_message_sent, 0)
  :: pattern == 1 -> fill_complex_crossing_rfq_message(complex_crossing_rfq_message_sent, 32)
  :: pattern == 2 -> fill_complex_crossing_rfq_message(complex_crossing_rfq_message_sent, 255)
  :: else -> ramp_complex_crossing_rfq_message(complex_crossing_rfq_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_crossing_rfq_message(complex_crossing_rfq_message_sent);
    assert(at == 24);
    at = 0;
    decode_complex_crossing_rfq_message(complex_crossing_rfq_message_got);
    assert(at == 24);
    equal_complex_crossing_rfq_message(complex_crossing_rfq_message_got, complex_crossing_rfq_message_sent)
  }
}

/* Complex Cube Rfq Message: encoded, read back, and compared */
proctype check_complex_cube_rfq_message() {
  ComplexCubeRfqMessage complex_cube_rfq_message_sent;
  ComplexCubeRfqMessage complex_cube_rfq_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_cube_rfq_message(complex_cube_rfq_message_sent, 0)
  :: pattern == 1 -> fill_complex_cube_rfq_message(complex_cube_rfq_message_sent, 32)
  :: pattern == 2 -> fill_complex_cube_rfq_message(complex_cube_rfq_message_sent, 255)
  :: else -> ramp_complex_cube_rfq_message(complex_cube_rfq_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_cube_rfq_message(complex_cube_rfq_message_sent);
    assert(at == 24);
    at = 0;
    decode_complex_cube_rfq_message(complex_cube_rfq_message_got);
    assert(at == 24);
    equal_complex_cube_rfq_message(complex_cube_rfq_message_got, complex_cube_rfq_message_sent)
  }
}

/* Complex Status Message: encoded, read back, and compared */
proctype check_complex_status_message() {
  ComplexStatusMessage complex_status_message_sent;
  ComplexStatusMessage complex_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_status_message(complex_status_message_sent, 0)
  :: pattern == 1 -> fill_complex_status_message(complex_status_message_sent, 32)
  :: pattern == 2 -> fill_complex_status_message(complex_status_message_sent, 255)
  :: else -> ramp_complex_status_message(complex_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_status_message(complex_status_message_sent);
    assert(at == 20);
    at = 0;
    decode_complex_status_message(complex_status_message_got);
    assert(at == 20);
    equal_complex_status_message(complex_status_message_got, complex_status_message_sent)
  }
}

/* Refresh Complex Quote Message: encoded, read back, and compared */
proctype check_refresh_complex_quote_message() {
  RefreshComplexQuoteMessage refresh_complex_quote_message_sent;
  RefreshComplexQuoteMessage refresh_complex_quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_refresh_complex_quote_message(refresh_complex_quote_message_sent, 0)
  :: pattern == 1 -> fill_refresh_complex_quote_message(refresh_complex_quote_message_sent, 32)
  :: pattern == 2 -> fill_refresh_complex_quote_message(refresh_complex_quote_message_sent, 255)
  :: else -> ramp_refresh_complex_quote_message(refresh_complex_quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_refresh_complex_quote_message(refresh_complex_quote_message_sent);
    assert(at == 36);
    at = 0;
    decode_refresh_complex_quote_message(refresh_complex_quote_message_got);
    assert(at == 36);
    equal_refresh_complex_quote_message(refresh_complex_quote_message_got, refresh_complex_quote_message_sent)
  }
}

/* Refresh Complex Trade Message: encoded, read back, and compared */
proctype check_refresh_complex_trade_message() {
  RefreshComplexTradeMessage refresh_complex_trade_message_sent;
  RefreshComplexTradeMessage refresh_complex_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_refresh_complex_trade_message(refresh_complex_trade_message_sent, 0)
  :: pattern == 1 -> fill_refresh_complex_trade_message(refresh_complex_trade_message_sent, 32)
  :: pattern == 2 -> fill_refresh_complex_trade_message(refresh_complex_trade_message_sent, 255)
  :: else -> ramp_refresh_complex_trade_message(refresh_complex_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_refresh_complex_trade_message(refresh_complex_trade_message_sent);
    assert(at == 32);
    at = 0;
    decode_refresh_complex_trade_message(refresh_complex_trade_message_got);
    assert(at == 32);
    equal_refresh_complex_trade_message(refresh_complex_trade_message_got, refresh_complex_trade_message_sent)
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
  :: run check_complex_quote_message()
  :: run check_complex_trade_message()
  :: run check_complex_crossing_rfq_message()
  :: run check_complex_cube_rfq_message()
  :: run check_complex_status_message()
  :: run check_refresh_complex_quote_message()
  :: run check_refresh_complex_trade_message()
  :: run check_stream_id_message()
  :: run check_sequence_number_reset_message()
  fi
}
