/*
 * New York Stock Exchange ArcaBook
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
#define WIRE 48

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

/* ---- Add Order Message: 27 bytes --------------------------------------------- */

/* Order Book Add Order message. Size of the message: 31 bytes (NYSE, NYSE MKT and NYSE Arca). */
typedef AddOrderMessage {
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_num[4];
  byte order_id[4];
  byte price[4];
  byte volume[4];
  byte side;
  byte order_idgtc_indicator;
  byte trade_session
};

int add_order_message_at;

/* every byte of Add Order Message set to one value */
inline fill_add_order_message(add_order_message_record, add_order_message_value) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.source_time_ns[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.symbol_index[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.symbol_seq_num[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.order_id[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.volume[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.side = add_order_message_value;
  add_order_message_record.order_idgtc_indicator = add_order_message_value;
  add_order_message_record.trade_session = add_order_message_value;
  skip
}

/* each byte of Add Order Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_message(add_order_message_record, add_order_message_base) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.source_time_ns[add_order_message_at] = (add_order_message_base + 0 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.symbol_index[add_order_message_at] = (add_order_message_base + 4 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.symbol_seq_num[add_order_message_at] = (add_order_message_base + 8 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.order_id[add_order_message_at] = (add_order_message_base + 12 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = (add_order_message_base + 16 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.volume[add_order_message_at] = (add_order_message_base + 20 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.side = (add_order_message_base + 24 + 1) % 256;
  add_order_message_record.order_idgtc_indicator = (add_order_message_base + 25 + 1) % 256;
  add_order_message_record.trade_session = (add_order_message_base + 26 + 1) % 256;
  skip
}

/* Add Order Message to the wire, 27 bytes from where the cursor stands */
inline encode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.source_time_ns[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.symbol_index[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.symbol_seq_num[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.order_id[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.price[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.volume[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_record.side; at = at + 1;
  wire[at] = add_order_message_record.order_idgtc_indicator; at = at + 1;
  wire[at] = add_order_message_record.trade_session; at = at + 1;
  skip
}

/* Add Order Message off the wire, 27 bytes from where the cursor stands */
inline decode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.source_time_ns[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.symbol_index[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.symbol_seq_num[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.order_id[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.volume[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.side = wire[at]; at = at + 1;
  add_order_message_record.order_idgtc_indicator = wire[at]; at = at + 1;
  add_order_message_record.trade_session = wire[at]; at = at + 1;
  skip
}

/* what was read of Add Order Message is what was written, byte for byte */
inline equal_add_order_message(add_order_message_read, add_order_message_written) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.source_time_ns[add_order_message_at] == add_order_message_written.source_time_ns[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.symbol_index[add_order_message_at] == add_order_message_written.symbol_index[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.symbol_seq_num[add_order_message_at] == add_order_message_written.symbol_seq_num[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.order_id[add_order_message_at] == add_order_message_written.order_id[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.price[add_order_message_at] == add_order_message_written.price[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.volume[add_order_message_at] == add_order_message_written.volume[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  assert(add_order_message_read.side == add_order_message_written.side);
  assert(add_order_message_read.order_idgtc_indicator == add_order_message_written.order_idgtc_indicator);
  assert(add_order_message_read.trade_session == add_order_message_written.trade_session);
  skip
}

/* ---- Attributed Add Order Message: 32 bytes ---------------------------------- */

/* Order Book Attribution Add Order message. Size of the message: NYSE 31 bytes, NYSE MKT 31 bytes, NYSE Arca 36 bytes. */
typedef AttributedAddOrderMessage {
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_num[4];
  byte order_id[4];
  byte price[4];
  byte volume[4];
  byte side;
  byte order_idgtc_indicator;
  byte trade_session;
  byte firm_id[5]
};

int attributed_add_order_message_at;

/* every byte of Attributed Add Order Message set to one value */
inline fill_attributed_add_order_message(attributed_add_order_message_record, attributed_add_order_message_value) {
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> attributed_add_order_message_record.source_time_ns[attributed_add_order_message_at] = attributed_add_order_message_value; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> attributed_add_order_message_record.symbol_index[attributed_add_order_message_at] = attributed_add_order_message_value; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> attributed_add_order_message_record.symbol_seq_num[attributed_add_order_message_at] = attributed_add_order_message_value; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> attributed_add_order_message_record.order_id[attributed_add_order_message_at] = attributed_add_order_message_value; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> attributed_add_order_message_record.price[attributed_add_order_message_at] = attributed_add_order_message_value; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> attributed_add_order_message_record.volume[attributed_add_order_message_at] = attributed_add_order_message_value; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_record.side = attributed_add_order_message_value;
  attributed_add_order_message_record.order_idgtc_indicator = attributed_add_order_message_value;
  attributed_add_order_message_record.trade_session = attributed_add_order_message_value;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 5 -> attributed_add_order_message_record.firm_id[attributed_add_order_message_at] = attributed_add_order_message_value; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Attributed Add Order Message set to where it lies, so a field read out of place says so */
inline ramp_attributed_add_order_message(attributed_add_order_message_record, attributed_add_order_message_base) {
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> attributed_add_order_message_record.source_time_ns[attributed_add_order_message_at] = (attributed_add_order_message_base + 0 + attributed_add_order_message_at + 1) % 256; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> attributed_add_order_message_record.symbol_index[attributed_add_order_message_at] = (attributed_add_order_message_base + 4 + attributed_add_order_message_at + 1) % 256; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> attributed_add_order_message_record.symbol_seq_num[attributed_add_order_message_at] = (attributed_add_order_message_base + 8 + attributed_add_order_message_at + 1) % 256; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> attributed_add_order_message_record.order_id[attributed_add_order_message_at] = (attributed_add_order_message_base + 12 + attributed_add_order_message_at + 1) % 256; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> attributed_add_order_message_record.price[attributed_add_order_message_at] = (attributed_add_order_message_base + 16 + attributed_add_order_message_at + 1) % 256; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> attributed_add_order_message_record.volume[attributed_add_order_message_at] = (attributed_add_order_message_base + 20 + attributed_add_order_message_at + 1) % 256; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_record.side = (attributed_add_order_message_base + 24 + 1) % 256;
  attributed_add_order_message_record.order_idgtc_indicator = (attributed_add_order_message_base + 25 + 1) % 256;
  attributed_add_order_message_record.trade_session = (attributed_add_order_message_base + 26 + 1) % 256;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 5 -> attributed_add_order_message_record.firm_id[attributed_add_order_message_at] = (attributed_add_order_message_base + 27 + attributed_add_order_message_at + 1) % 256; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Attributed Add Order Message to the wire, 32 bytes from where the cursor stands */
inline encode_attributed_add_order_message(attributed_add_order_message_record) {
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> wire[at] = attributed_add_order_message_record.source_time_ns[attributed_add_order_message_at]; at = at + 1; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> wire[at] = attributed_add_order_message_record.symbol_index[attributed_add_order_message_at]; at = at + 1; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> wire[at] = attributed_add_order_message_record.symbol_seq_num[attributed_add_order_message_at]; at = at + 1; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> wire[at] = attributed_add_order_message_record.order_id[attributed_add_order_message_at]; at = at + 1; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> wire[at] = attributed_add_order_message_record.price[attributed_add_order_message_at]; at = at + 1; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> wire[at] = attributed_add_order_message_record.volume[attributed_add_order_message_at]; at = at + 1; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  wire[at] = attributed_add_order_message_record.side; at = at + 1;
  wire[at] = attributed_add_order_message_record.order_idgtc_indicator; at = at + 1;
  wire[at] = attributed_add_order_message_record.trade_session; at = at + 1;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 5 -> wire[at] = attributed_add_order_message_record.firm_id[attributed_add_order_message_at]; at = at + 1; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Attributed Add Order Message off the wire, 32 bytes from where the cursor stands */
inline decode_attributed_add_order_message(attributed_add_order_message_record) {
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> attributed_add_order_message_record.source_time_ns[attributed_add_order_message_at] = wire[at]; at = at + 1; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> attributed_add_order_message_record.symbol_index[attributed_add_order_message_at] = wire[at]; at = at + 1; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> attributed_add_order_message_record.symbol_seq_num[attributed_add_order_message_at] = wire[at]; at = at + 1; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> attributed_add_order_message_record.order_id[attributed_add_order_message_at] = wire[at]; at = at + 1; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> attributed_add_order_message_record.price[attributed_add_order_message_at] = wire[at]; at = at + 1; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> attributed_add_order_message_record.volume[attributed_add_order_message_at] = wire[at]; at = at + 1; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_record.side = wire[at]; at = at + 1;
  attributed_add_order_message_record.order_idgtc_indicator = wire[at]; at = at + 1;
  attributed_add_order_message_record.trade_session = wire[at]; at = at + 1;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 5 -> attributed_add_order_message_record.firm_id[attributed_add_order_message_at] = wire[at]; at = at + 1; attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Attributed Add Order Message is what was written, byte for byte */
inline equal_attributed_add_order_message(attributed_add_order_message_read, attributed_add_order_message_written) {
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> assert(attributed_add_order_message_read.source_time_ns[attributed_add_order_message_at] == attributed_add_order_message_written.source_time_ns[attributed_add_order_message_at]); attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> assert(attributed_add_order_message_read.symbol_index[attributed_add_order_message_at] == attributed_add_order_message_written.symbol_index[attributed_add_order_message_at]); attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> assert(attributed_add_order_message_read.symbol_seq_num[attributed_add_order_message_at] == attributed_add_order_message_written.symbol_seq_num[attributed_add_order_message_at]); attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> assert(attributed_add_order_message_read.order_id[attributed_add_order_message_at] == attributed_add_order_message_written.order_id[attributed_add_order_message_at]); attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> assert(attributed_add_order_message_read.price[attributed_add_order_message_at] == attributed_add_order_message_written.price[attributed_add_order_message_at]); attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 4 -> assert(attributed_add_order_message_read.volume[attributed_add_order_message_at] == attributed_add_order_message_written.volume[attributed_add_order_message_at]); attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  assert(attributed_add_order_message_read.side == attributed_add_order_message_written.side);
  assert(attributed_add_order_message_read.order_idgtc_indicator == attributed_add_order_message_written.order_idgtc_indicator);
  assert(attributed_add_order_message_read.trade_session == attributed_add_order_message_written.trade_session);
  attributed_add_order_message_at = 0;
  do
  :: attributed_add_order_message_at < 5 -> assert(attributed_add_order_message_read.firm_id[attributed_add_order_message_at] == attributed_add_order_message_written.firm_id[attributed_add_order_message_at]); attributed_add_order_message_at = attributed_add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Order Message: 27 bytes ------------------------------------------ */

/* Sent when an order in the Order Book is modified: the price or the size of the order changes, or the order is routed to an away market with some shares remaining in the Order Book. The Order ID refers to the original order sent in the add order message. Size of the message: 31 bytes (NYSE, NYSE MKT and NYSE Arca). */
typedef ModifyOrderMessage {
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_num[4];
  byte order_id[4];
  byte price[4];
  byte volume[4];
  byte side;
  byte order_idgtc_indicator;
  byte reason_code
};

int modify_order_message_at;

/* every byte of Modify Order Message set to one value */
inline fill_modify_order_message(modify_order_message_record, modify_order_message_value) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.source_time_ns[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.symbol_index[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.symbol_seq_num[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.order_id[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.price[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.volume[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.side = modify_order_message_value;
  modify_order_message_record.order_idgtc_indicator = modify_order_message_value;
  modify_order_message_record.reason_code = modify_order_message_value;
  skip
}

/* each byte of Modify Order Message set to where it lies, so a field read out of place says so */
inline ramp_modify_order_message(modify_order_message_record, modify_order_message_base) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.source_time_ns[modify_order_message_at] = (modify_order_message_base + 0 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.symbol_index[modify_order_message_at] = (modify_order_message_base + 4 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.symbol_seq_num[modify_order_message_at] = (modify_order_message_base + 8 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.order_id[modify_order_message_at] = (modify_order_message_base + 12 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.price[modify_order_message_at] = (modify_order_message_base + 16 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.volume[modify_order_message_at] = (modify_order_message_base + 20 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.side = (modify_order_message_base + 24 + 1) % 256;
  modify_order_message_record.order_idgtc_indicator = (modify_order_message_base + 25 + 1) % 256;
  modify_order_message_record.reason_code = (modify_order_message_base + 26 + 1) % 256;
  skip
}

/* Modify Order Message to the wire, 27 bytes from where the cursor stands */
inline encode_modify_order_message(modify_order_message_record) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.source_time_ns[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.symbol_index[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.symbol_seq_num[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.order_id[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.price[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.volume[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_message_record.side; at = at + 1;
  wire[at] = modify_order_message_record.order_idgtc_indicator; at = at + 1;
  wire[at] = modify_order_message_record.reason_code; at = at + 1;
  skip
}

/* Modify Order Message off the wire, 27 bytes from where the cursor stands */
inline decode_modify_order_message(modify_order_message_record) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.source_time_ns[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.symbol_index[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.symbol_seq_num[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.order_id[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.price[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.volume[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.side = wire[at]; at = at + 1;
  modify_order_message_record.order_idgtc_indicator = wire[at]; at = at + 1;
  modify_order_message_record.reason_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Modify Order Message is what was written, byte for byte */
inline equal_modify_order_message(modify_order_message_read, modify_order_message_written) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.source_time_ns[modify_order_message_at] == modify_order_message_written.source_time_ns[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.symbol_index[modify_order_message_at] == modify_order_message_written.symbol_index[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.symbol_seq_num[modify_order_message_at] == modify_order_message_written.symbol_seq_num[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.order_id[modify_order_message_at] == modify_order_message_written.order_id[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.price[modify_order_message_at] == modify_order_message_written.price[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.volume[modify_order_message_at] == modify_order_message_written.volume[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  assert(modify_order_message_read.side == modify_order_message_written.side);
  assert(modify_order_message_read.order_idgtc_indicator == modify_order_message_written.order_idgtc_indicator);
  assert(modify_order_message_read.reason_code == modify_order_message_written.reason_code);
  skip
}

/* ---- Delete Order Message: 19 bytes ------------------------------------------ */

/* Sent when an order is taken off of the order book: the order is cancelled, expires, or is routed to an away market. Size of the message: 23 bytes (NYSE, NYSE MKT and NYSE Arca). */
typedef DeleteOrderMessage {
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_num[4];
  byte order_id[4];
  byte side;
  byte order_idgtc_indicator;
  byte reason_code
};

int delete_order_message_at;

/* every byte of Delete Order Message set to one value */
inline fill_delete_order_message(delete_order_message_record, delete_order_message_value) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.source_time_ns[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.symbol_index[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.symbol_seq_num[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.order_id[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_record.side = delete_order_message_value;
  delete_order_message_record.order_idgtc_indicator = delete_order_message_value;
  delete_order_message_record.reason_code = delete_order_message_value;
  skip
}

/* each byte of Delete Order Message set to where it lies, so a field read out of place says so */
inline ramp_delete_order_message(delete_order_message_record, delete_order_message_base) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.source_time_ns[delete_order_message_at] = (delete_order_message_base + 0 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.symbol_index[delete_order_message_at] = (delete_order_message_base + 4 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.symbol_seq_num[delete_order_message_at] = (delete_order_message_base + 8 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.order_id[delete_order_message_at] = (delete_order_message_base + 12 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_record.side = (delete_order_message_base + 16 + 1) % 256;
  delete_order_message_record.order_idgtc_indicator = (delete_order_message_base + 17 + 1) % 256;
  delete_order_message_record.reason_code = (delete_order_message_base + 18 + 1) % 256;
  skip
}

/* Delete Order Message to the wire, 19 bytes from where the cursor stands */
inline encode_delete_order_message(delete_order_message_record) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> wire[at] = delete_order_message_record.source_time_ns[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> wire[at] = delete_order_message_record.symbol_index[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> wire[at] = delete_order_message_record.symbol_seq_num[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> wire[at] = delete_order_message_record.order_id[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  wire[at] = delete_order_message_record.side; at = at + 1;
  wire[at] = delete_order_message_record.order_idgtc_indicator; at = at + 1;
  wire[at] = delete_order_message_record.reason_code; at = at + 1;
  skip
}

/* Delete Order Message off the wire, 19 bytes from where the cursor stands */
inline decode_delete_order_message(delete_order_message_record) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.source_time_ns[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.symbol_index[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.symbol_seq_num[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.order_id[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_record.side = wire[at]; at = at + 1;
  delete_order_message_record.order_idgtc_indicator = wire[at]; at = at + 1;
  delete_order_message_record.reason_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Delete Order Message is what was written, byte for byte */
inline equal_delete_order_message(delete_order_message_read, delete_order_message_written) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> assert(delete_order_message_read.source_time_ns[delete_order_message_at] == delete_order_message_written.source_time_ns[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> assert(delete_order_message_read.symbol_index[delete_order_message_at] == delete_order_message_written.symbol_index[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> assert(delete_order_message_read.symbol_seq_num[delete_order_message_at] == delete_order_message_written.symbol_seq_num[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> assert(delete_order_message_read.order_id[delete_order_message_at] == delete_order_message_written.order_id[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  assert(delete_order_message_read.side == delete_order_message_written.side);
  assert(delete_order_message_read.order_idgtc_indicator == delete_order_message_written.order_idgtc_indicator);
  assert(delete_order_message_read.reason_code == delete_order_message_written.reason_code);
  skip
}

/* ---- Execution Message: 30 bytes --------------------------------------------- */

/* Order Book Execution message. With reason codes set to zero, a partial fill is followed by a modify message and a full fill by a delete message for the executed OrderID; with reason codes in use, only the execution message is sent, with reason code 7 (reduce the order's volume) or 3 (remove the order). Size of the message: 34 bytes (NYSE, NYSE MKT and NYSE Arca). */
typedef ExecutionMessage {
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_num[4];
  byte order_id[4];
  byte price[4];
  byte volume[4];
  byte order_idgtc_indicator;
  byte reason_code;
  byte trade_id[4]
};

int execution_message_at;

/* every byte of Execution Message set to one value */
inline fill_execution_message(execution_message_record, execution_message_value) {
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> execution_message_record.source_time_ns[execution_message_at] = execution_message_value; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> execution_message_record.symbol_index[execution_message_at] = execution_message_value; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> execution_message_record.symbol_seq_num[execution_message_at] = execution_message_value; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> execution_message_record.order_id[execution_message_at] = execution_message_value; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> execution_message_record.price[execution_message_at] = execution_message_value; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> execution_message_record.volume[execution_message_at] = execution_message_value; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_record.order_idgtc_indicator = execution_message_value;
  execution_message_record.reason_code = execution_message_value;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> execution_message_record.trade_id[execution_message_at] = execution_message_value; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Execution Message set to where it lies, so a field read out of place says so */
inline ramp_execution_message(execution_message_record, execution_message_base) {
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> execution_message_record.source_time_ns[execution_message_at] = (execution_message_base + 0 + execution_message_at + 1) % 256; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> execution_message_record.symbol_index[execution_message_at] = (execution_message_base + 4 + execution_message_at + 1) % 256; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> execution_message_record.symbol_seq_num[execution_message_at] = (execution_message_base + 8 + execution_message_at + 1) % 256; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> execution_message_record.order_id[execution_message_at] = (execution_message_base + 12 + execution_message_at + 1) % 256; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> execution_message_record.price[execution_message_at] = (execution_message_base + 16 + execution_message_at + 1) % 256; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> execution_message_record.volume[execution_message_at] = (execution_message_base + 20 + execution_message_at + 1) % 256; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_record.order_idgtc_indicator = (execution_message_base + 24 + 1) % 256;
  execution_message_record.reason_code = (execution_message_base + 25 + 1) % 256;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> execution_message_record.trade_id[execution_message_at] = (execution_message_base + 26 + execution_message_at + 1) % 256; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Message to the wire, 30 bytes from where the cursor stands */
inline encode_execution_message(execution_message_record) {
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> wire[at] = execution_message_record.source_time_ns[execution_message_at]; at = at + 1; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> wire[at] = execution_message_record.symbol_index[execution_message_at]; at = at + 1; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> wire[at] = execution_message_record.symbol_seq_num[execution_message_at]; at = at + 1; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> wire[at] = execution_message_record.order_id[execution_message_at]; at = at + 1; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> wire[at] = execution_message_record.price[execution_message_at]; at = at + 1; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> wire[at] = execution_message_record.volume[execution_message_at]; at = at + 1; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_message_record.order_idgtc_indicator; at = at + 1;
  wire[at] = execution_message_record.reason_code; at = at + 1;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> wire[at] = execution_message_record.trade_id[execution_message_at]; at = at + 1; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Message off the wire, 30 bytes from where the cursor stands */
inline decode_execution_message(execution_message_record) {
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> execution_message_record.source_time_ns[execution_message_at] = wire[at]; at = at + 1; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> execution_message_record.symbol_index[execution_message_at] = wire[at]; at = at + 1; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> execution_message_record.symbol_seq_num[execution_message_at] = wire[at]; at = at + 1; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> execution_message_record.order_id[execution_message_at] = wire[at]; at = at + 1; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> execution_message_record.price[execution_message_at] = wire[at]; at = at + 1; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> execution_message_record.volume[execution_message_at] = wire[at]; at = at + 1; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_record.order_idgtc_indicator = wire[at]; at = at + 1;
  execution_message_record.reason_code = wire[at]; at = at + 1;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> execution_message_record.trade_id[execution_message_at] = wire[at]; at = at + 1; execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Execution Message is what was written, byte for byte */
inline equal_execution_message(execution_message_read, execution_message_written) {
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> assert(execution_message_read.source_time_ns[execution_message_at] == execution_message_written.source_time_ns[execution_message_at]); execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> assert(execution_message_read.symbol_index[execution_message_at] == execution_message_written.symbol_index[execution_message_at]); execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> assert(execution_message_read.symbol_seq_num[execution_message_at] == execution_message_written.symbol_seq_num[execution_message_at]); execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> assert(execution_message_read.order_id[execution_message_at] == execution_message_written.order_id[execution_message_at]); execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> assert(execution_message_read.price[execution_message_at] == execution_message_written.price[execution_message_at]); execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> assert(execution_message_read.volume[execution_message_at] == execution_message_written.volume[execution_message_at]); execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  assert(execution_message_read.order_idgtc_indicator == execution_message_written.order_idgtc_indicator);
  assert(execution_message_read.reason_code == execution_message_written.reason_code);
  execution_message_at = 0;
  do
  :: execution_message_at < 4 -> assert(execution_message_read.trade_id[execution_message_at] == execution_message_written.trade_id[execution_message_at]); execution_message_at = execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order Refresh Message: 31 bytes ------------------------------------- */

/* Sent only during a refresh or after a symbol clear which will result in a book refresh. Size of the message: 35 bytes (NYSE, NYSE MKT and NYSE Arca). */
typedef AddOrderRefreshMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_num[4];
  byte order_id[4];
  byte price[4];
  byte volume[4];
  byte side;
  byte order_idgtc_indicator;
  byte trade_session
};

int add_order_refresh_message_at;

/* every byte of Add Order Refresh Message set to one value */
inline fill_add_order_refresh_message(add_order_refresh_message_record, add_order_refresh_message_value) {
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.source_time[add_order_refresh_message_at] = add_order_refresh_message_value; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.source_time_ns[add_order_refresh_message_at] = add_order_refresh_message_value; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.symbol_index[add_order_refresh_message_at] = add_order_refresh_message_value; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.symbol_seq_num[add_order_refresh_message_at] = add_order_refresh_message_value; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.order_id[add_order_refresh_message_at] = add_order_refresh_message_value; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.price[add_order_refresh_message_at] = add_order_refresh_message_value; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.volume[add_order_refresh_message_at] = add_order_refresh_message_value; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_record.side = add_order_refresh_message_value;
  add_order_refresh_message_record.order_idgtc_indicator = add_order_refresh_message_value;
  add_order_refresh_message_record.trade_session = add_order_refresh_message_value;
  skip
}

/* each byte of Add Order Refresh Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_refresh_message(add_order_refresh_message_record, add_order_refresh_message_base) {
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.source_time[add_order_refresh_message_at] = (add_order_refresh_message_base + 0 + add_order_refresh_message_at + 1) % 256; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.source_time_ns[add_order_refresh_message_at] = (add_order_refresh_message_base + 4 + add_order_refresh_message_at + 1) % 256; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.symbol_index[add_order_refresh_message_at] = (add_order_refresh_message_base + 8 + add_order_refresh_message_at + 1) % 256; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.symbol_seq_num[add_order_refresh_message_at] = (add_order_refresh_message_base + 12 + add_order_refresh_message_at + 1) % 256; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.order_id[add_order_refresh_message_at] = (add_order_refresh_message_base + 16 + add_order_refresh_message_at + 1) % 256; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.price[add_order_refresh_message_at] = (add_order_refresh_message_base + 20 + add_order_refresh_message_at + 1) % 256; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.volume[add_order_refresh_message_at] = (add_order_refresh_message_base + 24 + add_order_refresh_message_at + 1) % 256; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_record.side = (add_order_refresh_message_base + 28 + 1) % 256;
  add_order_refresh_message_record.order_idgtc_indicator = (add_order_refresh_message_base + 29 + 1) % 256;
  add_order_refresh_message_record.trade_session = (add_order_refresh_message_base + 30 + 1) % 256;
  skip
}

/* Add Order Refresh Message to the wire, 31 bytes from where the cursor stands */
inline encode_add_order_refresh_message(add_order_refresh_message_record) {
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> wire[at] = add_order_refresh_message_record.source_time[add_order_refresh_message_at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> wire[at] = add_order_refresh_message_record.source_time_ns[add_order_refresh_message_at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> wire[at] = add_order_refresh_message_record.symbol_index[add_order_refresh_message_at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> wire[at] = add_order_refresh_message_record.symbol_seq_num[add_order_refresh_message_at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> wire[at] = add_order_refresh_message_record.order_id[add_order_refresh_message_at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> wire[at] = add_order_refresh_message_record.price[add_order_refresh_message_at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> wire[at] = add_order_refresh_message_record.volume[add_order_refresh_message_at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_refresh_message_record.side; at = at + 1;
  wire[at] = add_order_refresh_message_record.order_idgtc_indicator; at = at + 1;
  wire[at] = add_order_refresh_message_record.trade_session; at = at + 1;
  skip
}

/* Add Order Refresh Message off the wire, 31 bytes from where the cursor stands */
inline decode_add_order_refresh_message(add_order_refresh_message_record) {
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.source_time[add_order_refresh_message_at] = wire[at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.source_time_ns[add_order_refresh_message_at] = wire[at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.symbol_index[add_order_refresh_message_at] = wire[at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.symbol_seq_num[add_order_refresh_message_at] = wire[at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.order_id[add_order_refresh_message_at] = wire[at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.price[add_order_refresh_message_at] = wire[at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.volume[add_order_refresh_message_at] = wire[at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_record.side = wire[at]; at = at + 1;
  add_order_refresh_message_record.order_idgtc_indicator = wire[at]; at = at + 1;
  add_order_refresh_message_record.trade_session = wire[at]; at = at + 1;
  skip
}

/* what was read of Add Order Refresh Message is what was written, byte for byte */
inline equal_add_order_refresh_message(add_order_refresh_message_read, add_order_refresh_message_written) {
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> assert(add_order_refresh_message_read.source_time[add_order_refresh_message_at] == add_order_refresh_message_written.source_time[add_order_refresh_message_at]); add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> assert(add_order_refresh_message_read.source_time_ns[add_order_refresh_message_at] == add_order_refresh_message_written.source_time_ns[add_order_refresh_message_at]); add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> assert(add_order_refresh_message_read.symbol_index[add_order_refresh_message_at] == add_order_refresh_message_written.symbol_index[add_order_refresh_message_at]); add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> assert(add_order_refresh_message_read.symbol_seq_num[add_order_refresh_message_at] == add_order_refresh_message_written.symbol_seq_num[add_order_refresh_message_at]); add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> assert(add_order_refresh_message_read.order_id[add_order_refresh_message_at] == add_order_refresh_message_written.order_id[add_order_refresh_message_at]); add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> assert(add_order_refresh_message_read.price[add_order_refresh_message_at] == add_order_refresh_message_written.price[add_order_refresh_message_at]); add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> assert(add_order_refresh_message_read.volume[add_order_refresh_message_at] == add_order_refresh_message_written.volume[add_order_refresh_message_at]); add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  assert(add_order_refresh_message_read.side == add_order_refresh_message_written.side);
  assert(add_order_refresh_message_read.order_idgtc_indicator == add_order_refresh_message_written.order_idgtc_indicator);
  assert(add_order_refresh_message_read.trade_session == add_order_refresh_message_written.trade_session);
  skip
}

/* ---- Attributed Add Order Refresh Message: 36 bytes -------------------------- */

/* Sent by NYSE Arca only during a refresh or after a symbol clear which will result in a book refresh. Size of the message: NYSE 35 bytes, NYSE MKT 35 bytes, NYSE Arca 40 bytes. */
typedef AttributedAddOrderRefreshMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_num[4];
  byte order_id[4];
  byte price[4];
  byte volume[4];
  byte side;
  byte order_idgtc_indicator;
  byte trade_session;
  byte firm_id[5]
};

int attributed_add_order_refresh_message_at;

/* every byte of Attributed Add Order Refresh Message set to one value */
inline fill_attributed_add_order_refresh_message(attributed_add_order_refresh_message_record, attributed_add_order_refresh_message_value) {
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> attributed_add_order_refresh_message_record.source_time[attributed_add_order_refresh_message_at] = attributed_add_order_refresh_message_value; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> attributed_add_order_refresh_message_record.source_time_ns[attributed_add_order_refresh_message_at] = attributed_add_order_refresh_message_value; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> attributed_add_order_refresh_message_record.symbol_index[attributed_add_order_refresh_message_at] = attributed_add_order_refresh_message_value; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> attributed_add_order_refresh_message_record.symbol_seq_num[attributed_add_order_refresh_message_at] = attributed_add_order_refresh_message_value; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> attributed_add_order_refresh_message_record.order_id[attributed_add_order_refresh_message_at] = attributed_add_order_refresh_message_value; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> attributed_add_order_refresh_message_record.price[attributed_add_order_refresh_message_at] = attributed_add_order_refresh_message_value; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> attributed_add_order_refresh_message_record.volume[attributed_add_order_refresh_message_at] = attributed_add_order_refresh_message_value; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_record.side = attributed_add_order_refresh_message_value;
  attributed_add_order_refresh_message_record.order_idgtc_indicator = attributed_add_order_refresh_message_value;
  attributed_add_order_refresh_message_record.trade_session = attributed_add_order_refresh_message_value;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 5 -> attributed_add_order_refresh_message_record.firm_id[attributed_add_order_refresh_message_at] = attributed_add_order_refresh_message_value; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Attributed Add Order Refresh Message set to where it lies, so a field read out of place says so */
inline ramp_attributed_add_order_refresh_message(attributed_add_order_refresh_message_record, attributed_add_order_refresh_message_base) {
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> attributed_add_order_refresh_message_record.source_time[attributed_add_order_refresh_message_at] = (attributed_add_order_refresh_message_base + 0 + attributed_add_order_refresh_message_at + 1) % 256; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> attributed_add_order_refresh_message_record.source_time_ns[attributed_add_order_refresh_message_at] = (attributed_add_order_refresh_message_base + 4 + attributed_add_order_refresh_message_at + 1) % 256; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> attributed_add_order_refresh_message_record.symbol_index[attributed_add_order_refresh_message_at] = (attributed_add_order_refresh_message_base + 8 + attributed_add_order_refresh_message_at + 1) % 256; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> attributed_add_order_refresh_message_record.symbol_seq_num[attributed_add_order_refresh_message_at] = (attributed_add_order_refresh_message_base + 12 + attributed_add_order_refresh_message_at + 1) % 256; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> attributed_add_order_refresh_message_record.order_id[attributed_add_order_refresh_message_at] = (attributed_add_order_refresh_message_base + 16 + attributed_add_order_refresh_message_at + 1) % 256; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> attributed_add_order_refresh_message_record.price[attributed_add_order_refresh_message_at] = (attributed_add_order_refresh_message_base + 20 + attributed_add_order_refresh_message_at + 1) % 256; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> attributed_add_order_refresh_message_record.volume[attributed_add_order_refresh_message_at] = (attributed_add_order_refresh_message_base + 24 + attributed_add_order_refresh_message_at + 1) % 256; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_record.side = (attributed_add_order_refresh_message_base + 28 + 1) % 256;
  attributed_add_order_refresh_message_record.order_idgtc_indicator = (attributed_add_order_refresh_message_base + 29 + 1) % 256;
  attributed_add_order_refresh_message_record.trade_session = (attributed_add_order_refresh_message_base + 30 + 1) % 256;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 5 -> attributed_add_order_refresh_message_record.firm_id[attributed_add_order_refresh_message_at] = (attributed_add_order_refresh_message_base + 31 + attributed_add_order_refresh_message_at + 1) % 256; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  skip
}

/* Attributed Add Order Refresh Message to the wire, 36 bytes from where the cursor stands */
inline encode_attributed_add_order_refresh_message(attributed_add_order_refresh_message_record) {
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> wire[at] = attributed_add_order_refresh_message_record.source_time[attributed_add_order_refresh_message_at]; at = at + 1; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> wire[at] = attributed_add_order_refresh_message_record.source_time_ns[attributed_add_order_refresh_message_at]; at = at + 1; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> wire[at] = attributed_add_order_refresh_message_record.symbol_index[attributed_add_order_refresh_message_at]; at = at + 1; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> wire[at] = attributed_add_order_refresh_message_record.symbol_seq_num[attributed_add_order_refresh_message_at]; at = at + 1; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> wire[at] = attributed_add_order_refresh_message_record.order_id[attributed_add_order_refresh_message_at]; at = at + 1; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> wire[at] = attributed_add_order_refresh_message_record.price[attributed_add_order_refresh_message_at]; at = at + 1; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> wire[at] = attributed_add_order_refresh_message_record.volume[attributed_add_order_refresh_message_at]; at = at + 1; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  wire[at] = attributed_add_order_refresh_message_record.side; at = at + 1;
  wire[at] = attributed_add_order_refresh_message_record.order_idgtc_indicator; at = at + 1;
  wire[at] = attributed_add_order_refresh_message_record.trade_session; at = at + 1;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 5 -> wire[at] = attributed_add_order_refresh_message_record.firm_id[attributed_add_order_refresh_message_at]; at = at + 1; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  skip
}

/* Attributed Add Order Refresh Message off the wire, 36 bytes from where the cursor stands */
inline decode_attributed_add_order_refresh_message(attributed_add_order_refresh_message_record) {
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> attributed_add_order_refresh_message_record.source_time[attributed_add_order_refresh_message_at] = wire[at]; at = at + 1; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> attributed_add_order_refresh_message_record.source_time_ns[attributed_add_order_refresh_message_at] = wire[at]; at = at + 1; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> attributed_add_order_refresh_message_record.symbol_index[attributed_add_order_refresh_message_at] = wire[at]; at = at + 1; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> attributed_add_order_refresh_message_record.symbol_seq_num[attributed_add_order_refresh_message_at] = wire[at]; at = at + 1; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> attributed_add_order_refresh_message_record.order_id[attributed_add_order_refresh_message_at] = wire[at]; at = at + 1; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> attributed_add_order_refresh_message_record.price[attributed_add_order_refresh_message_at] = wire[at]; at = at + 1; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> attributed_add_order_refresh_message_record.volume[attributed_add_order_refresh_message_at] = wire[at]; at = at + 1; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_record.side = wire[at]; at = at + 1;
  attributed_add_order_refresh_message_record.order_idgtc_indicator = wire[at]; at = at + 1;
  attributed_add_order_refresh_message_record.trade_session = wire[at]; at = at + 1;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 5 -> attributed_add_order_refresh_message_record.firm_id[attributed_add_order_refresh_message_at] = wire[at]; at = at + 1; attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Attributed Add Order Refresh Message is what was written, byte for byte */
inline equal_attributed_add_order_refresh_message(attributed_add_order_refresh_message_read, attributed_add_order_refresh_message_written) {
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> assert(attributed_add_order_refresh_message_read.source_time[attributed_add_order_refresh_message_at] == attributed_add_order_refresh_message_written.source_time[attributed_add_order_refresh_message_at]); attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> assert(attributed_add_order_refresh_message_read.source_time_ns[attributed_add_order_refresh_message_at] == attributed_add_order_refresh_message_written.source_time_ns[attributed_add_order_refresh_message_at]); attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> assert(attributed_add_order_refresh_message_read.symbol_index[attributed_add_order_refresh_message_at] == attributed_add_order_refresh_message_written.symbol_index[attributed_add_order_refresh_message_at]); attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> assert(attributed_add_order_refresh_message_read.symbol_seq_num[attributed_add_order_refresh_message_at] == attributed_add_order_refresh_message_written.symbol_seq_num[attributed_add_order_refresh_message_at]); attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> assert(attributed_add_order_refresh_message_read.order_id[attributed_add_order_refresh_message_at] == attributed_add_order_refresh_message_written.order_id[attributed_add_order_refresh_message_at]); attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> assert(attributed_add_order_refresh_message_read.price[attributed_add_order_refresh_message_at] == attributed_add_order_refresh_message_written.price[attributed_add_order_refresh_message_at]); attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 4 -> assert(attributed_add_order_refresh_message_read.volume[attributed_add_order_refresh_message_at] == attributed_add_order_refresh_message_written.volume[attributed_add_order_refresh_message_at]); attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  assert(attributed_add_order_refresh_message_read.side == attributed_add_order_refresh_message_written.side);
  assert(attributed_add_order_refresh_message_read.order_idgtc_indicator == attributed_add_order_refresh_message_written.order_idgtc_indicator);
  assert(attributed_add_order_refresh_message_read.trade_session == attributed_add_order_refresh_message_written.trade_session);
  attributed_add_order_refresh_message_at = 0;
  do
  :: attributed_add_order_refresh_message_at < 5 -> assert(attributed_add_order_refresh_message_read.firm_id[attributed_add_order_refresh_message_at] == attributed_add_order_refresh_message_written.firm_id[attributed_add_order_refresh_message_at]); attributed_add_order_refresh_message_at = attributed_add_order_refresh_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Imbalance Message: 48 bytes --------------------------------------------- */

/* Imbalance message. Size of the message: 52 bytes (NYSE, NYSE MKT and NYSE Arca). */
typedef ImbalanceMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_num[4];
  byte reference_price[4];
  byte paired_qty[4];
  byte total_imbalance_qty[4];
  byte market_imbalance_qty[4];
  byte auction_time[2];
  byte auction_type;
  byte imbalance_side;
  byte continuous_book_clearing_price[4];
  byte closing_only_clearing_price[4];
  byte ssr_filing_price[4]
};

int imbalance_message_at;

/* every byte of Imbalance Message set to one value */
inline fill_imbalance_message(imbalance_message_record, imbalance_message_value) {
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.source_time[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.source_time_ns[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.symbol_index[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.symbol_seq_num[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.reference_price[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.paired_qty[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.total_imbalance_qty[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.market_imbalance_qty[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 2 -> imbalance_message_record.auction_time[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_record.auction_type = imbalance_message_value;
  imbalance_message_record.imbalance_side = imbalance_message_value;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.continuous_book_clearing_price[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.closing_only_clearing_price[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.ssr_filing_price[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Imbalance Message set to where it lies, so a field read out of place says so */
inline ramp_imbalance_message(imbalance_message_record, imbalance_message_base) {
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.source_time[imbalance_message_at] = (imbalance_message_base + 0 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.source_time_ns[imbalance_message_at] = (imbalance_message_base + 4 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.symbol_index[imbalance_message_at] = (imbalance_message_base + 8 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.symbol_seq_num[imbalance_message_at] = (imbalance_message_base + 12 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.reference_price[imbalance_message_at] = (imbalance_message_base + 16 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.paired_qty[imbalance_message_at] = (imbalance_message_base + 20 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.total_imbalance_qty[imbalance_message_at] = (imbalance_message_base + 24 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.market_imbalance_qty[imbalance_message_at] = (imbalance_message_base + 28 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 2 -> imbalance_message_record.auction_time[imbalance_message_at] = (imbalance_message_base + 32 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_record.auction_type = (imbalance_message_base + 34 + 1) % 256;
  imbalance_message_record.imbalance_side = (imbalance_message_base + 35 + 1) % 256;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.continuous_book_clearing_price[imbalance_message_at] = (imbalance_message_base + 36 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.closing_only_clearing_price[imbalance_message_at] = (imbalance_message_base + 40 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.ssr_filing_price[imbalance_message_at] = (imbalance_message_base + 44 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* Imbalance Message to the wire, 48 bytes from where the cursor stands */
inline encode_imbalance_message(imbalance_message_record) {
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.source_time[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.source_time_ns[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.symbol_index[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.symbol_seq_num[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.reference_price[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.paired_qty[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.total_imbalance_qty[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.market_imbalance_qty[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 2 -> wire[at] = imbalance_message_record.auction_time[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  wire[at] = imbalance_message_record.auction_type; at = at + 1;
  wire[at] = imbalance_message_record.imbalance_side; at = at + 1;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.continuous_book_clearing_price[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.closing_only_clearing_price[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.ssr_filing_price[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* Imbalance Message off the wire, 48 bytes from where the cursor stands */
inline decode_imbalance_message(imbalance_message_record) {
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.source_time[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.source_time_ns[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.symbol_index[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.symbol_seq_num[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.reference_price[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.paired_qty[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.total_imbalance_qty[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.market_imbalance_qty[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 2 -> imbalance_message_record.auction_time[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_record.auction_type = wire[at]; at = at + 1;
  imbalance_message_record.imbalance_side = wire[at]; at = at + 1;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.continuous_book_clearing_price[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.closing_only_clearing_price[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.ssr_filing_price[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Imbalance Message is what was written, byte for byte */
inline equal_imbalance_message(imbalance_message_read, imbalance_message_written) {
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.source_time[imbalance_message_at] == imbalance_message_written.source_time[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.source_time_ns[imbalance_message_at] == imbalance_message_written.source_time_ns[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.symbol_index[imbalance_message_at] == imbalance_message_written.symbol_index[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.symbol_seq_num[imbalance_message_at] == imbalance_message_written.symbol_seq_num[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.reference_price[imbalance_message_at] == imbalance_message_written.reference_price[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.paired_qty[imbalance_message_at] == imbalance_message_written.paired_qty[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.total_imbalance_qty[imbalance_message_at] == imbalance_message_written.total_imbalance_qty[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.market_imbalance_qty[imbalance_message_at] == imbalance_message_written.market_imbalance_qty[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 2 -> assert(imbalance_message_read.auction_time[imbalance_message_at] == imbalance_message_written.auction_time[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  assert(imbalance_message_read.auction_type == imbalance_message_written.auction_type);
  assert(imbalance_message_read.imbalance_side == imbalance_message_written.imbalance_side);
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.continuous_book_clearing_price[imbalance_message_at] == imbalance_message_written.continuous_book_clearing_price[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.closing_only_clearing_price[imbalance_message_at] == imbalance_message_written.closing_only_clearing_price[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.ssr_filing_price[imbalance_message_at] == imbalance_message_written.ssr_filing_price[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
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
    assert(at == 27);
    at = 0;
    decode_add_order_message(add_order_message_got);
    assert(at == 27);
    equal_add_order_message(add_order_message_got, add_order_message_sent)
  }
}

/* Attributed Add Order Message: encoded, read back, and compared */
proctype check_attributed_add_order_message() {
  AttributedAddOrderMessage attributed_add_order_message_sent;
  AttributedAddOrderMessage attributed_add_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_attributed_add_order_message(attributed_add_order_message_sent, 0)
  :: pattern == 1 -> fill_attributed_add_order_message(attributed_add_order_message_sent, 32)
  :: pattern == 2 -> fill_attributed_add_order_message(attributed_add_order_message_sent, 255)
  :: else -> ramp_attributed_add_order_message(attributed_add_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_attributed_add_order_message(attributed_add_order_message_sent);
    assert(at == 32);
    at = 0;
    decode_attributed_add_order_message(attributed_add_order_message_got);
    assert(at == 32);
    equal_attributed_add_order_message(attributed_add_order_message_got, attributed_add_order_message_sent)
  }
}

/* Modify Order Message: encoded, read back, and compared */
proctype check_modify_order_message() {
  ModifyOrderMessage modify_order_message_sent;
  ModifyOrderMessage modify_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_order_message(modify_order_message_sent, 0)
  :: pattern == 1 -> fill_modify_order_message(modify_order_message_sent, 32)
  :: pattern == 2 -> fill_modify_order_message(modify_order_message_sent, 255)
  :: else -> ramp_modify_order_message(modify_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_order_message(modify_order_message_sent);
    assert(at == 27);
    at = 0;
    decode_modify_order_message(modify_order_message_got);
    assert(at == 27);
    equal_modify_order_message(modify_order_message_got, modify_order_message_sent)
  }
}

/* Delete Order Message: encoded, read back, and compared */
proctype check_delete_order_message() {
  DeleteOrderMessage delete_order_message_sent;
  DeleteOrderMessage delete_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_delete_order_message(delete_order_message_sent, 0)
  :: pattern == 1 -> fill_delete_order_message(delete_order_message_sent, 32)
  :: pattern == 2 -> fill_delete_order_message(delete_order_message_sent, 255)
  :: else -> ramp_delete_order_message(delete_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_delete_order_message(delete_order_message_sent);
    assert(at == 19);
    at = 0;
    decode_delete_order_message(delete_order_message_got);
    assert(at == 19);
    equal_delete_order_message(delete_order_message_got, delete_order_message_sent)
  }
}

/* Execution Message: encoded, read back, and compared */
proctype check_execution_message() {
  ExecutionMessage execution_message_sent;
  ExecutionMessage execution_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_message(execution_message_sent, 0)
  :: pattern == 1 -> fill_execution_message(execution_message_sent, 32)
  :: pattern == 2 -> fill_execution_message(execution_message_sent, 255)
  :: else -> ramp_execution_message(execution_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_message(execution_message_sent);
    assert(at == 30);
    at = 0;
    decode_execution_message(execution_message_got);
    assert(at == 30);
    equal_execution_message(execution_message_got, execution_message_sent)
  }
}

/* Add Order Refresh Message: encoded, read back, and compared */
proctype check_add_order_refresh_message() {
  AddOrderRefreshMessage add_order_refresh_message_sent;
  AddOrderRefreshMessage add_order_refresh_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_refresh_message(add_order_refresh_message_sent, 0)
  :: pattern == 1 -> fill_add_order_refresh_message(add_order_refresh_message_sent, 32)
  :: pattern == 2 -> fill_add_order_refresh_message(add_order_refresh_message_sent, 255)
  :: else -> ramp_add_order_refresh_message(add_order_refresh_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_refresh_message(add_order_refresh_message_sent);
    assert(at == 31);
    at = 0;
    decode_add_order_refresh_message(add_order_refresh_message_got);
    assert(at == 31);
    equal_add_order_refresh_message(add_order_refresh_message_got, add_order_refresh_message_sent)
  }
}

/* Attributed Add Order Refresh Message: encoded, read back, and compared */
proctype check_attributed_add_order_refresh_message() {
  AttributedAddOrderRefreshMessage attributed_add_order_refresh_message_sent;
  AttributedAddOrderRefreshMessage attributed_add_order_refresh_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_attributed_add_order_refresh_message(attributed_add_order_refresh_message_sent, 0)
  :: pattern == 1 -> fill_attributed_add_order_refresh_message(attributed_add_order_refresh_message_sent, 32)
  :: pattern == 2 -> fill_attributed_add_order_refresh_message(attributed_add_order_refresh_message_sent, 255)
  :: else -> ramp_attributed_add_order_refresh_message(attributed_add_order_refresh_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_attributed_add_order_refresh_message(attributed_add_order_refresh_message_sent);
    assert(at == 36);
    at = 0;
    decode_attributed_add_order_refresh_message(attributed_add_order_refresh_message_got);
    assert(at == 36);
    equal_attributed_add_order_refresh_message(attributed_add_order_refresh_message_got, attributed_add_order_refresh_message_sent)
  }
}

/* Imbalance Message: encoded, read back, and compared */
proctype check_imbalance_message() {
  ImbalanceMessage imbalance_message_sent;
  ImbalanceMessage imbalance_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_imbalance_message(imbalance_message_sent, 0)
  :: pattern == 1 -> fill_imbalance_message(imbalance_message_sent, 32)
  :: pattern == 2 -> fill_imbalance_message(imbalance_message_sent, 255)
  :: else -> ramp_imbalance_message(imbalance_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_imbalance_message(imbalance_message_sent);
    assert(at == 48);
    at = 0;
    decode_imbalance_message(imbalance_message_got);
    assert(at == 48);
    equal_imbalance_message(imbalance_message_got, imbalance_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_send_time()
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_add_order_message()
  :: run check_attributed_add_order_message()
  :: run check_modify_order_message()
  :: run check_delete_order_message()
  :: run check_execution_message()
  :: run check_add_order_refresh_message()
  :: run check_attributed_add_order_refresh_message()
  :: run check_imbalance_message()
  fi
}
