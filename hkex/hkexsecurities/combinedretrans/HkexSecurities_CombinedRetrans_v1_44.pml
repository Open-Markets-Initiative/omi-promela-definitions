/*
 * Hong Kong Exchanges and Clearing Orion Market Data Cash Combined Retransmission
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
 *   - a Reassemble rule
 *   - a run counted by a field
 *   - the dispatch that chooses a message by its type
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 108

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 16 bytes ------------------------------------------------- */

/* Omd packet header (byte-identical to the Udp form; SeqNum and SendTime set to 0 on Tcp per §3.5) */
typedef PacketHeader {
  byte pkt_size[2];
  byte msg_count;
  byte filler;
  byte seq_num[4];
  byte send_time[8]
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.pkt_size[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.msg_count = packet_header_value;
  packet_header_record.filler = packet_header_value;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.seq_num[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.send_time[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.pkt_size[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.msg_count = (packet_header_base + 2 + 1) % 256;
  packet_header_record.filler = (packet_header_base + 3 + 1) % 256;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.seq_num[packet_header_at] = (packet_header_base + 4 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.send_time[packet_header_at] = (packet_header_base + 8 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 16 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.pkt_size[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  wire[at] = packet_header_record.msg_count; at = at + 1;
  wire[at] = packet_header_record.filler; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.seq_num[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> wire[at] = packet_header_record.send_time[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 16 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.pkt_size[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.msg_count = wire[at]; at = at + 1;
  packet_header_record.filler = wire[at]; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.seq_num[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.send_time[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.pkt_size[packet_header_at] == packet_header_written.pkt_size[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  assert(packet_header_read.msg_count == packet_header_written.msg_count);
  assert(packet_header_read.filler == packet_header_written.filler);
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.seq_num[packet_header_at] == packet_header_written.seq_num[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> assert(packet_header_read.send_time[packet_header_at] == packet_header_written.send_time[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Msg Header: 4 bytes ----------------------------------------------------- */

/* Omd message header */
typedef MsgHeader {
  byte msg_size[2];
  byte msg_type[2]
};

int msg_header_at;

/* every byte of Msg Header set to one value */
inline fill_msg_header(msg_header_record, msg_header_value) {
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_size[msg_header_at] = msg_header_value; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_type[msg_header_at] = msg_header_value; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Msg Header set to where it lies, so a field read out of place says so */
inline ramp_msg_header(msg_header_record, msg_header_base) {
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_size[msg_header_at] = (msg_header_base + 0 + msg_header_at + 1) % 256; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_type[msg_header_at] = (msg_header_base + 2 + msg_header_at + 1) % 256; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* Msg Header to the wire, 4 bytes from where the cursor stands */
inline encode_msg_header(msg_header_record) {
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> wire[at] = msg_header_record.msg_size[msg_header_at]; at = at + 1; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> wire[at] = msg_header_record.msg_type[msg_header_at]; at = at + 1; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* Msg Header off the wire, 4 bytes from where the cursor stands */
inline decode_msg_header(msg_header_record) {
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_size[msg_header_at] = wire[at]; at = at + 1; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_type[msg_header_at] = wire[at]; at = at + 1; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Msg Header is what was written, byte for byte */
inline equal_msg_header(msg_header_read, msg_header_written) {
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> assert(msg_header_read.msg_size[msg_header_at] == msg_header_written.msg_size[msg_header_at]); msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> assert(msg_header_read.msg_type[msg_header_at] == msg_header_written.msg_type[msg_header_at]); msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Odd Lot Order Message: 24 bytes ------------------------------------- */

/* The Add Odd Lot Order message is generated when a new odd lot order is inserted into the order book. */
typedef AddOddLotOrderMessage {
  byte security_code[4];
  byte order_id[8];
  byte price[4];
  byte quantity[4];
  byte broker_id[2];
  byte side[2]
};

int add_odd_lot_order_message_at;

/* every byte of Add Odd Lot Order Message set to one value */
inline fill_add_odd_lot_order_message(add_odd_lot_order_message_record, add_odd_lot_order_message_value) {
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 4 -> add_odd_lot_order_message_record.security_code[add_odd_lot_order_message_at] = add_odd_lot_order_message_value; add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 8 -> add_odd_lot_order_message_record.order_id[add_odd_lot_order_message_at] = add_odd_lot_order_message_value; add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 4 -> add_odd_lot_order_message_record.price[add_odd_lot_order_message_at] = add_odd_lot_order_message_value; add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 4 -> add_odd_lot_order_message_record.quantity[add_odd_lot_order_message_at] = add_odd_lot_order_message_value; add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 2 -> add_odd_lot_order_message_record.broker_id[add_odd_lot_order_message_at] = add_odd_lot_order_message_value; add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 2 -> add_odd_lot_order_message_record.side[add_odd_lot_order_message_at] = add_odd_lot_order_message_value; add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Odd Lot Order Message set to where it lies, so a field read out of place says so */
inline ramp_add_odd_lot_order_message(add_odd_lot_order_message_record, add_odd_lot_order_message_base) {
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 4 -> add_odd_lot_order_message_record.security_code[add_odd_lot_order_message_at] = (add_odd_lot_order_message_base + 0 + add_odd_lot_order_message_at + 1) % 256; add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 8 -> add_odd_lot_order_message_record.order_id[add_odd_lot_order_message_at] = (add_odd_lot_order_message_base + 4 + add_odd_lot_order_message_at + 1) % 256; add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 4 -> add_odd_lot_order_message_record.price[add_odd_lot_order_message_at] = (add_odd_lot_order_message_base + 12 + add_odd_lot_order_message_at + 1) % 256; add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 4 -> add_odd_lot_order_message_record.quantity[add_odd_lot_order_message_at] = (add_odd_lot_order_message_base + 16 + add_odd_lot_order_message_at + 1) % 256; add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 2 -> add_odd_lot_order_message_record.broker_id[add_odd_lot_order_message_at] = (add_odd_lot_order_message_base + 20 + add_odd_lot_order_message_at + 1) % 256; add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 2 -> add_odd_lot_order_message_record.side[add_odd_lot_order_message_at] = (add_odd_lot_order_message_base + 22 + add_odd_lot_order_message_at + 1) % 256; add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Odd Lot Order Message to the wire, 24 bytes from where the cursor stands */
inline encode_add_odd_lot_order_message(add_odd_lot_order_message_record) {
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 4 -> wire[at] = add_odd_lot_order_message_record.security_code[add_odd_lot_order_message_at]; at = at + 1; add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 8 -> wire[at] = add_odd_lot_order_message_record.order_id[add_odd_lot_order_message_at]; at = at + 1; add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 4 -> wire[at] = add_odd_lot_order_message_record.price[add_odd_lot_order_message_at]; at = at + 1; add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 4 -> wire[at] = add_odd_lot_order_message_record.quantity[add_odd_lot_order_message_at]; at = at + 1; add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 2 -> wire[at] = add_odd_lot_order_message_record.broker_id[add_odd_lot_order_message_at]; at = at + 1; add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 2 -> wire[at] = add_odd_lot_order_message_record.side[add_odd_lot_order_message_at]; at = at + 1; add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Odd Lot Order Message off the wire, 24 bytes from where the cursor stands */
inline decode_add_odd_lot_order_message(add_odd_lot_order_message_record) {
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 4 -> add_odd_lot_order_message_record.security_code[add_odd_lot_order_message_at] = wire[at]; at = at + 1; add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 8 -> add_odd_lot_order_message_record.order_id[add_odd_lot_order_message_at] = wire[at]; at = at + 1; add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 4 -> add_odd_lot_order_message_record.price[add_odd_lot_order_message_at] = wire[at]; at = at + 1; add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 4 -> add_odd_lot_order_message_record.quantity[add_odd_lot_order_message_at] = wire[at]; at = at + 1; add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 2 -> add_odd_lot_order_message_record.broker_id[add_odd_lot_order_message_at] = wire[at]; at = at + 1; add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 2 -> add_odd_lot_order_message_record.side[add_odd_lot_order_message_at] = wire[at]; at = at + 1; add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Odd Lot Order Message is what was written, byte for byte */
inline equal_add_odd_lot_order_message(add_odd_lot_order_message_read, add_odd_lot_order_message_written) {
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 4 -> assert(add_odd_lot_order_message_read.security_code[add_odd_lot_order_message_at] == add_odd_lot_order_message_written.security_code[add_odd_lot_order_message_at]); add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 8 -> assert(add_odd_lot_order_message_read.order_id[add_odd_lot_order_message_at] == add_odd_lot_order_message_written.order_id[add_odd_lot_order_message_at]); add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 4 -> assert(add_odd_lot_order_message_read.price[add_odd_lot_order_message_at] == add_odd_lot_order_message_written.price[add_odd_lot_order_message_at]); add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 4 -> assert(add_odd_lot_order_message_read.quantity[add_odd_lot_order_message_at] == add_odd_lot_order_message_written.quantity[add_odd_lot_order_message_at]); add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 2 -> assert(add_odd_lot_order_message_read.broker_id[add_odd_lot_order_message_at] == add_odd_lot_order_message_written.broker_id[add_odd_lot_order_message_at]); add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  add_odd_lot_order_message_at = 0;
  do
  :: add_odd_lot_order_message_at < 2 -> assert(add_odd_lot_order_message_read.side[add_odd_lot_order_message_at] == add_odd_lot_order_message_written.side[add_odd_lot_order_message_at]); add_odd_lot_order_message_at = add_odd_lot_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order Message: 28 bytes --------------------------------------------- */

/* The Add Order message is generated when a new order is inserted into the order book. The OrderId is unique per security but will not increment consecutively. Note for Securities instruments the OrderBookPosition is always set to zero. */
typedef AddOrderMessage {
  byte security_code[4];
  byte order_id[8];
  byte price[4];
  byte quantity[4];
  byte side[2];
  byte order_type;
  byte filler_1;
  byte order_book_position[4]
};

int add_order_message_at;

/* every byte of Add Order Message set to one value */
inline fill_add_order_message(add_order_message_record, add_order_message_value) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.security_code[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_id[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.quantity[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> add_order_message_record.side[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.order_type = add_order_message_value;
  add_order_message_record.filler_1 = add_order_message_value;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.order_book_position[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_message(add_order_message_record, add_order_message_base) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.security_code[add_order_message_at] = (add_order_message_base + 0 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_id[add_order_message_at] = (add_order_message_base + 4 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = (add_order_message_base + 12 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.quantity[add_order_message_at] = (add_order_message_base + 16 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> add_order_message_record.side[add_order_message_at] = (add_order_message_base + 20 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.order_type = (add_order_message_base + 22 + 1) % 256;
  add_order_message_record.filler_1 = (add_order_message_base + 23 + 1) % 256;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.order_book_position[add_order_message_at] = (add_order_message_base + 24 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message to the wire, 28 bytes from where the cursor stands */
inline encode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.security_code[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> wire[at] = add_order_message_record.order_id[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.price[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.quantity[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> wire[at] = add_order_message_record.side[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_record.order_type; at = at + 1;
  wire[at] = add_order_message_record.filler_1; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.order_book_position[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message off the wire, 28 bytes from where the cursor stands */
inline decode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.security_code[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_id[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.quantity[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> add_order_message_record.side[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.order_type = wire[at]; at = at + 1;
  add_order_message_record.filler_1 = wire[at]; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.order_book_position[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Message is what was written, byte for byte */
inline equal_add_order_message(add_order_message_read, add_order_message_written) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.security_code[add_order_message_at] == add_order_message_written.security_code[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> assert(add_order_message_read.order_id[add_order_message_at] == add_order_message_written.order_id[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.price[add_order_message_at] == add_order_message_written.price[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.quantity[add_order_message_at] == add_order_message_written.quantity[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> assert(add_order_message_read.side[add_order_message_at] == add_order_message_written.side[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  assert(add_order_message_read.order_type == add_order_message_written.order_type);
  assert(add_order_message_read.filler_1 == add_order_message_written.filler_1);
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.order_book_position[add_order_message_at] == add_order_message_written.order_book_position[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Closing Price Message: 12 bytes ----------------------------------------- */

/* The Closing Price message is generated near the end of the business day for each security. If the closing price is not available, ClosingPrice is set to 0. NumberOfTrades is not populated for SS (OMD Securities Standard) clients. */
typedef ClosingPriceMessage {
  byte security_code[4];
  byte closing_price[4];
  byte number_of_trades[4]
};

int closing_price_message_at;

/* every byte of Closing Price Message set to one value */
inline fill_closing_price_message(closing_price_message_record, closing_price_message_value) {
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> closing_price_message_record.security_code[closing_price_message_at] = closing_price_message_value; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> closing_price_message_record.closing_price[closing_price_message_at] = closing_price_message_value; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> closing_price_message_record.number_of_trades[closing_price_message_at] = closing_price_message_value; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Closing Price Message set to where it lies, so a field read out of place says so */
inline ramp_closing_price_message(closing_price_message_record, closing_price_message_base) {
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> closing_price_message_record.security_code[closing_price_message_at] = (closing_price_message_base + 0 + closing_price_message_at + 1) % 256; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> closing_price_message_record.closing_price[closing_price_message_at] = (closing_price_message_base + 4 + closing_price_message_at + 1) % 256; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> closing_price_message_record.number_of_trades[closing_price_message_at] = (closing_price_message_base + 8 + closing_price_message_at + 1) % 256; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Closing Price Message to the wire, 12 bytes from where the cursor stands */
inline encode_closing_price_message(closing_price_message_record) {
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> wire[at] = closing_price_message_record.security_code[closing_price_message_at]; at = at + 1; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> wire[at] = closing_price_message_record.closing_price[closing_price_message_at]; at = at + 1; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> wire[at] = closing_price_message_record.number_of_trades[closing_price_message_at]; at = at + 1; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Closing Price Message off the wire, 12 bytes from where the cursor stands */
inline decode_closing_price_message(closing_price_message_record) {
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> closing_price_message_record.security_code[closing_price_message_at] = wire[at]; at = at + 1; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> closing_price_message_record.closing_price[closing_price_message_at] = wire[at]; at = at + 1; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> closing_price_message_record.number_of_trades[closing_price_message_at] = wire[at]; at = at + 1; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Closing Price Message is what was written, byte for byte */
inline equal_closing_price_message(closing_price_message_read, closing_price_message_written) {
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> assert(closing_price_message_read.security_code[closing_price_message_at] == closing_price_message_written.security_code[closing_price_message_at]); closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> assert(closing_price_message_read.closing_price[closing_price_message_at] == closing_price_message_written.closing_price[closing_price_message_at]); closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> assert(closing_price_message_read.number_of_trades[closing_price_message_at] == closing_price_message_written.number_of_trades[closing_price_message_at]); closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sequence Reset Message: 4 bytes ----------------------------------------- */

/* The Sequence Reset message is sent on each multicast channel at start of day. It may also be sent when there is a need for the rectification of stock reference data before market open. */
typedef SequenceResetMessage {
  byte new_seq_no[4]
};

int sequence_reset_message_at;

/* every byte of Sequence Reset Message set to one value */
inline fill_sequence_reset_message(sequence_reset_message_record, sequence_reset_message_value) {
  sequence_reset_message_at = 0;
  do
  :: sequence_reset_message_at < 4 -> sequence_reset_message_record.new_seq_no[sequence_reset_message_at] = sequence_reset_message_value; sequence_reset_message_at = sequence_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sequence Reset Message set to where it lies, so a field read out of place says so */
inline ramp_sequence_reset_message(sequence_reset_message_record, sequence_reset_message_base) {
  sequence_reset_message_at = 0;
  do
  :: sequence_reset_message_at < 4 -> sequence_reset_message_record.new_seq_no[sequence_reset_message_at] = (sequence_reset_message_base + 0 + sequence_reset_message_at + 1) % 256; sequence_reset_message_at = sequence_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Reset Message to the wire, 4 bytes from where the cursor stands */
inline encode_sequence_reset_message(sequence_reset_message_record) {
  sequence_reset_message_at = 0;
  do
  :: sequence_reset_message_at < 4 -> wire[at] = sequence_reset_message_record.new_seq_no[sequence_reset_message_at]; at = at + 1; sequence_reset_message_at = sequence_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Reset Message off the wire, 4 bytes from where the cursor stands */
inline decode_sequence_reset_message(sequence_reset_message_record) {
  sequence_reset_message_at = 0;
  do
  :: sequence_reset_message_at < 4 -> sequence_reset_message_record.new_seq_no[sequence_reset_message_at] = wire[at]; at = at + 1; sequence_reset_message_at = sequence_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sequence Reset Message is what was written, byte for byte */
inline equal_sequence_reset_message(sequence_reset_message_read, sequence_reset_message_written) {
  sequence_reset_message_at = 0;
  do
  :: sequence_reset_message_at < 4 -> assert(sequence_reset_message_read.new_seq_no[sequence_reset_message_at] == sequence_reset_message_written.new_seq_no[sequence_reset_message_at]); sequence_reset_message_at = sequence_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Disaster Recovery Signal Message: 4 bytes ------------------------------- */

/* The Disaster Recovery (DR) Signal message is sent on a dedicated multicast channel whenever a site failover scenario is triggered. */
typedef DisasterRecoverySignalMessage {
  byte dr_status[4]
};

int disaster_recovery_signal_message_at;

/* every byte of Disaster Recovery Signal Message set to one value */
inline fill_disaster_recovery_signal_message(disaster_recovery_signal_message_record, disaster_recovery_signal_message_value) {
  disaster_recovery_signal_message_at = 0;
  do
  :: disaster_recovery_signal_message_at < 4 -> disaster_recovery_signal_message_record.dr_status[disaster_recovery_signal_message_at] = disaster_recovery_signal_message_value; disaster_recovery_signal_message_at = disaster_recovery_signal_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Disaster Recovery Signal Message set to where it lies, so a field read out of place says so */
inline ramp_disaster_recovery_signal_message(disaster_recovery_signal_message_record, disaster_recovery_signal_message_base) {
  disaster_recovery_signal_message_at = 0;
  do
  :: disaster_recovery_signal_message_at < 4 -> disaster_recovery_signal_message_record.dr_status[disaster_recovery_signal_message_at] = (disaster_recovery_signal_message_base + 0 + disaster_recovery_signal_message_at + 1) % 256; disaster_recovery_signal_message_at = disaster_recovery_signal_message_at + 1
  :: else -> break
  od;
  skip
}

/* Disaster Recovery Signal Message to the wire, 4 bytes from where the cursor stands */
inline encode_disaster_recovery_signal_message(disaster_recovery_signal_message_record) {
  disaster_recovery_signal_message_at = 0;
  do
  :: disaster_recovery_signal_message_at < 4 -> wire[at] = disaster_recovery_signal_message_record.dr_status[disaster_recovery_signal_message_at]; at = at + 1; disaster_recovery_signal_message_at = disaster_recovery_signal_message_at + 1
  :: else -> break
  od;
  skip
}

/* Disaster Recovery Signal Message off the wire, 4 bytes from where the cursor stands */
inline decode_disaster_recovery_signal_message(disaster_recovery_signal_message_record) {
  disaster_recovery_signal_message_at = 0;
  do
  :: disaster_recovery_signal_message_at < 4 -> disaster_recovery_signal_message_record.dr_status[disaster_recovery_signal_message_at] = wire[at]; at = at + 1; disaster_recovery_signal_message_at = disaster_recovery_signal_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Disaster Recovery Signal Message is what was written, byte for byte */
inline equal_disaster_recovery_signal_message(disaster_recovery_signal_message_read, disaster_recovery_signal_message_written) {
  disaster_recovery_signal_message_at = 0;
  do
  :: disaster_recovery_signal_message_at < 4 -> assert(disaster_recovery_signal_message_read.dr_status[disaster_recovery_signal_message_at] == disaster_recovery_signal_message_written.dr_status[disaster_recovery_signal_message_at]); disaster_recovery_signal_message_at = disaster_recovery_signal_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Delete Odd Lot Order Message: 16 bytes ---------------------------------- */

/* The Delete Odd Lot Order message is generated when an existing odd lot order identified by the OrderId is deleted. */
typedef DeleteOddLotOrderMessage {
  byte security_code[4];
  byte order_id[8];
  byte broker_id[2];
  byte side[2]
};

int delete_odd_lot_order_message_at;

/* every byte of Delete Odd Lot Order Message set to one value */
inline fill_delete_odd_lot_order_message(delete_odd_lot_order_message_record, delete_odd_lot_order_message_value) {
  delete_odd_lot_order_message_at = 0;
  do
  :: delete_odd_lot_order_message_at < 4 -> delete_odd_lot_order_message_record.security_code[delete_odd_lot_order_message_at] = delete_odd_lot_order_message_value; delete_odd_lot_order_message_at = delete_odd_lot_order_message_at + 1
  :: else -> break
  od;
  delete_odd_lot_order_message_at = 0;
  do
  :: delete_odd_lot_order_message_at < 8 -> delete_odd_lot_order_message_record.order_id[delete_odd_lot_order_message_at] = delete_odd_lot_order_message_value; delete_odd_lot_order_message_at = delete_odd_lot_order_message_at + 1
  :: else -> break
  od;
  delete_odd_lot_order_message_at = 0;
  do
  :: delete_odd_lot_order_message_at < 2 -> delete_odd_lot_order_message_record.broker_id[delete_odd_lot_order_message_at] = delete_odd_lot_order_message_value; delete_odd_lot_order_message_at = delete_odd_lot_order_message_at + 1
  :: else -> break
  od;
  delete_odd_lot_order_message_at = 0;
  do
  :: delete_odd_lot_order_message_at < 2 -> delete_odd_lot_order_message_record.side[delete_odd_lot_order_message_at] = delete_odd_lot_order_message_value; delete_odd_lot_order_message_at = delete_odd_lot_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Delete Odd Lot Order Message set to where it lies, so a field read out of place says so */
inline ramp_delete_odd_lot_order_message(delete_odd_lot_order_message_record, delete_odd_lot_order_message_base) {
  delete_odd_lot_order_message_at = 0;
  do
  :: delete_odd_lot_order_message_at < 4 -> delete_odd_lot_order_message_record.security_code[delete_odd_lot_order_message_at] = (delete_odd_lot_order_message_base + 0 + delete_odd_lot_order_message_at + 1) % 256; delete_odd_lot_order_message_at = delete_odd_lot_order_message_at + 1
  :: else -> break
  od;
  delete_odd_lot_order_message_at = 0;
  do
  :: delete_odd_lot_order_message_at < 8 -> delete_odd_lot_order_message_record.order_id[delete_odd_lot_order_message_at] = (delete_odd_lot_order_message_base + 4 + delete_odd_lot_order_message_at + 1) % 256; delete_odd_lot_order_message_at = delete_odd_lot_order_message_at + 1
  :: else -> break
  od;
  delete_odd_lot_order_message_at = 0;
  do
  :: delete_odd_lot_order_message_at < 2 -> delete_odd_lot_order_message_record.broker_id[delete_odd_lot_order_message_at] = (delete_odd_lot_order_message_base + 12 + delete_odd_lot_order_message_at + 1) % 256; delete_odd_lot_order_message_at = delete_odd_lot_order_message_at + 1
  :: else -> break
  od;
  delete_odd_lot_order_message_at = 0;
  do
  :: delete_odd_lot_order_message_at < 2 -> delete_odd_lot_order_message_record.side[delete_odd_lot_order_message_at] = (delete_odd_lot_order_message_base + 14 + delete_odd_lot_order_message_at + 1) % 256; delete_odd_lot_order_message_at = delete_odd_lot_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Odd Lot Order Message to the wire, 16 bytes from where the cursor stands */
inline encode_delete_odd_lot_order_message(delete_odd_lot_order_message_record) {
  delete_odd_lot_order_message_at = 0;
  do
  :: delete_odd_lot_order_message_at < 4 -> wire[at] = delete_odd_lot_order_message_record.security_code[delete_odd_lot_order_message_at]; at = at + 1; delete_odd_lot_order_message_at = delete_odd_lot_order_message_at + 1
  :: else -> break
  od;
  delete_odd_lot_order_message_at = 0;
  do
  :: delete_odd_lot_order_message_at < 8 -> wire[at] = delete_odd_lot_order_message_record.order_id[delete_odd_lot_order_message_at]; at = at + 1; delete_odd_lot_order_message_at = delete_odd_lot_order_message_at + 1
  :: else -> break
  od;
  delete_odd_lot_order_message_at = 0;
  do
  :: delete_odd_lot_order_message_at < 2 -> wire[at] = delete_odd_lot_order_message_record.broker_id[delete_odd_lot_order_message_at]; at = at + 1; delete_odd_lot_order_message_at = delete_odd_lot_order_message_at + 1
  :: else -> break
  od;
  delete_odd_lot_order_message_at = 0;
  do
  :: delete_odd_lot_order_message_at < 2 -> wire[at] = delete_odd_lot_order_message_record.side[delete_odd_lot_order_message_at]; at = at + 1; delete_odd_lot_order_message_at = delete_odd_lot_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Odd Lot Order Message off the wire, 16 bytes from where the cursor stands */
inline decode_delete_odd_lot_order_message(delete_odd_lot_order_message_record) {
  delete_odd_lot_order_message_at = 0;
  do
  :: delete_odd_lot_order_message_at < 4 -> delete_odd_lot_order_message_record.security_code[delete_odd_lot_order_message_at] = wire[at]; at = at + 1; delete_odd_lot_order_message_at = delete_odd_lot_order_message_at + 1
  :: else -> break
  od;
  delete_odd_lot_order_message_at = 0;
  do
  :: delete_odd_lot_order_message_at < 8 -> delete_odd_lot_order_message_record.order_id[delete_odd_lot_order_message_at] = wire[at]; at = at + 1; delete_odd_lot_order_message_at = delete_odd_lot_order_message_at + 1
  :: else -> break
  od;
  delete_odd_lot_order_message_at = 0;
  do
  :: delete_odd_lot_order_message_at < 2 -> delete_odd_lot_order_message_record.broker_id[delete_odd_lot_order_message_at] = wire[at]; at = at + 1; delete_odd_lot_order_message_at = delete_odd_lot_order_message_at + 1
  :: else -> break
  od;
  delete_odd_lot_order_message_at = 0;
  do
  :: delete_odd_lot_order_message_at < 2 -> delete_odd_lot_order_message_record.side[delete_odd_lot_order_message_at] = wire[at]; at = at + 1; delete_odd_lot_order_message_at = delete_odd_lot_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Delete Odd Lot Order Message is what was written, byte for byte */
inline equal_delete_odd_lot_order_message(delete_odd_lot_order_message_read, delete_odd_lot_order_message_written) {
  delete_odd_lot_order_message_at = 0;
  do
  :: delete_odd_lot_order_message_at < 4 -> assert(delete_odd_lot_order_message_read.security_code[delete_odd_lot_order_message_at] == delete_odd_lot_order_message_written.security_code[delete_odd_lot_order_message_at]); delete_odd_lot_order_message_at = delete_odd_lot_order_message_at + 1
  :: else -> break
  od;
  delete_odd_lot_order_message_at = 0;
  do
  :: delete_odd_lot_order_message_at < 8 -> assert(delete_odd_lot_order_message_read.order_id[delete_odd_lot_order_message_at] == delete_odd_lot_order_message_written.order_id[delete_odd_lot_order_message_at]); delete_odd_lot_order_message_at = delete_odd_lot_order_message_at + 1
  :: else -> break
  od;
  delete_odd_lot_order_message_at = 0;
  do
  :: delete_odd_lot_order_message_at < 2 -> assert(delete_odd_lot_order_message_read.broker_id[delete_odd_lot_order_message_at] == delete_odd_lot_order_message_written.broker_id[delete_odd_lot_order_message_at]); delete_odd_lot_order_message_at = delete_odd_lot_order_message_at + 1
  :: else -> break
  od;
  delete_odd_lot_order_message_at = 0;
  do
  :: delete_odd_lot_order_message_at < 2 -> assert(delete_odd_lot_order_message_read.side[delete_odd_lot_order_message_at] == delete_odd_lot_order_message_written.side[delete_odd_lot_order_message_at]); delete_odd_lot_order_message_at = delete_odd_lot_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Delete Order Message: 16 bytes ------------------------------------------ */

/* The Delete Order message is generated when an existing order identified by the OrderId is deleted. */
typedef DeleteOrderMessage {
  byte security_code[4];
  byte order_id[8];
  byte side[2];
  byte filler_2[2]
};

int delete_order_message_at;

/* every byte of Delete Order Message set to one value */
inline fill_delete_order_message(delete_order_message_record, delete_order_message_value) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.security_code[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 2 -> delete_order_message_record.side[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 2 -> delete_order_message_record.filler_2[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Delete Order Message set to where it lies, so a field read out of place says so */
inline ramp_delete_order_message(delete_order_message_record, delete_order_message_base) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.security_code[delete_order_message_at] = (delete_order_message_base + 0 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = (delete_order_message_base + 4 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 2 -> delete_order_message_record.side[delete_order_message_at] = (delete_order_message_base + 12 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 2 -> delete_order_message_record.filler_2[delete_order_message_at] = (delete_order_message_base + 14 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Order Message to the wire, 16 bytes from where the cursor stands */
inline encode_delete_order_message(delete_order_message_record) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> wire[at] = delete_order_message_record.security_code[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> wire[at] = delete_order_message_record.order_id[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 2 -> wire[at] = delete_order_message_record.side[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 2 -> wire[at] = delete_order_message_record.filler_2[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Order Message off the wire, 16 bytes from where the cursor stands */
inline decode_delete_order_message(delete_order_message_record) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.security_code[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 2 -> delete_order_message_record.side[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 2 -> delete_order_message_record.filler_2[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Delete Order Message is what was written, byte for byte */
inline equal_delete_order_message(delete_order_message_read, delete_order_message_written) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> assert(delete_order_message_read.security_code[delete_order_message_at] == delete_order_message_written.security_code[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> assert(delete_order_message_read.order_id[delete_order_message_at] == delete_order_message_written.order_id[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 2 -> assert(delete_order_message_read.side[delete_order_message_at] == delete_order_message_written.side[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 2 -> assert(delete_order_message_read.filler_2[delete_order_message_at] == delete_order_message_written.filler_2[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Index Definition Message: 16 bytes -------------------------------------- */

/* The Index Definition message contains the static referential data for the given index and is generated at the start of the business day. May be re-disseminated during trading hours. */
typedef IndexDefinitionMessage {
  byte index_code[11];
  byte index_source;
  byte currency_code[3];
  byte filler_1
};

int index_definition_message_at;

/* every byte of Index Definition Message set to one value */
inline fill_index_definition_message(index_definition_message_record, index_definition_message_value) {
  index_definition_message_at = 0;
  do
  :: index_definition_message_at < 11 -> index_definition_message_record.index_code[index_definition_message_at] = index_definition_message_value; index_definition_message_at = index_definition_message_at + 1
  :: else -> break
  od;
  index_definition_message_record.index_source = index_definition_message_value;
  index_definition_message_at = 0;
  do
  :: index_definition_message_at < 3 -> index_definition_message_record.currency_code[index_definition_message_at] = index_definition_message_value; index_definition_message_at = index_definition_message_at + 1
  :: else -> break
  od;
  index_definition_message_record.filler_1 = index_definition_message_value;
  skip
}

/* each byte of Index Definition Message set to where it lies, so a field read out of place says so */
inline ramp_index_definition_message(index_definition_message_record, index_definition_message_base) {
  index_definition_message_at = 0;
  do
  :: index_definition_message_at < 11 -> index_definition_message_record.index_code[index_definition_message_at] = (index_definition_message_base + 0 + index_definition_message_at + 1) % 256; index_definition_message_at = index_definition_message_at + 1
  :: else -> break
  od;
  index_definition_message_record.index_source = (index_definition_message_base + 11 + 1) % 256;
  index_definition_message_at = 0;
  do
  :: index_definition_message_at < 3 -> index_definition_message_record.currency_code[index_definition_message_at] = (index_definition_message_base + 12 + index_definition_message_at + 1) % 256; index_definition_message_at = index_definition_message_at + 1
  :: else -> break
  od;
  index_definition_message_record.filler_1 = (index_definition_message_base + 15 + 1) % 256;
  skip
}

/* Index Definition Message to the wire, 16 bytes from where the cursor stands */
inline encode_index_definition_message(index_definition_message_record) {
  index_definition_message_at = 0;
  do
  :: index_definition_message_at < 11 -> wire[at] = index_definition_message_record.index_code[index_definition_message_at]; at = at + 1; index_definition_message_at = index_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = index_definition_message_record.index_source; at = at + 1;
  index_definition_message_at = 0;
  do
  :: index_definition_message_at < 3 -> wire[at] = index_definition_message_record.currency_code[index_definition_message_at]; at = at + 1; index_definition_message_at = index_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = index_definition_message_record.filler_1; at = at + 1;
  skip
}

/* Index Definition Message off the wire, 16 bytes from where the cursor stands */
inline decode_index_definition_message(index_definition_message_record) {
  index_definition_message_at = 0;
  do
  :: index_definition_message_at < 11 -> index_definition_message_record.index_code[index_definition_message_at] = wire[at]; at = at + 1; index_definition_message_at = index_definition_message_at + 1
  :: else -> break
  od;
  index_definition_message_record.index_source = wire[at]; at = at + 1;
  index_definition_message_at = 0;
  do
  :: index_definition_message_at < 3 -> index_definition_message_record.currency_code[index_definition_message_at] = wire[at]; at = at + 1; index_definition_message_at = index_definition_message_at + 1
  :: else -> break
  od;
  index_definition_message_record.filler_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Index Definition Message is what was written, byte for byte */
inline equal_index_definition_message(index_definition_message_read, index_definition_message_written) {
  index_definition_message_at = 0;
  do
  :: index_definition_message_at < 11 -> assert(index_definition_message_read.index_code[index_definition_message_at] == index_definition_message_written.index_code[index_definition_message_at]); index_definition_message_at = index_definition_message_at + 1
  :: else -> break
  od;
  assert(index_definition_message_read.index_source == index_definition_message_written.index_source);
  index_definition_message_at = 0;
  do
  :: index_definition_message_at < 3 -> assert(index_definition_message_read.currency_code[index_definition_message_at] == index_definition_message_written.currency_code[index_definition_message_at]); index_definition_message_at = index_definition_message_at + 1
  :: else -> break
  od;
  assert(index_definition_message_read.filler_1 == index_definition_message_written.filler_1);
  skip
}

/* ---- Index Data Message: 108 bytes ------------------------------------------- */

/* The Index Data message contains all the real-time data for a given index. Fields may be populated with null values to indicate when an update is not provided. */
typedef IndexDataMessage {
  byte index_code[11];
  byte index_status;
  byte index_time[8];
  byte index_value[8];
  byte net_chg_prev_day[8];
  byte high_value[8];
  byte low_value[8];
  byte eas_value[8];
  byte index_turnover[8];
  byte opening_value[8];
  byte closing_value[8];
  byte previous_ses_close[8];
  byte index_volume[8];
  byte net_chg_prev_day_pct[4];
  byte exception;
  byte filler_3[3]
};

int index_data_message_at;

/* every byte of Index Data Message set to one value */
inline fill_index_data_message(index_data_message_record, index_data_message_value) {
  index_data_message_at = 0;
  do
  :: index_data_message_at < 11 -> index_data_message_record.index_code[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_record.index_status = index_data_message_value;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.index_time[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.index_value[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.net_chg_prev_day[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.high_value[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.low_value[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.eas_value[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.index_turnover[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.opening_value[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.closing_value[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.previous_ses_close[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.index_volume[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 4 -> index_data_message_record.net_chg_prev_day_pct[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_record.exception = index_data_message_value;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 3 -> index_data_message_record.filler_3[index_data_message_at] = index_data_message_value; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Index Data Message set to where it lies, so a field read out of place says so */
inline ramp_index_data_message(index_data_message_record, index_data_message_base) {
  index_data_message_at = 0;
  do
  :: index_data_message_at < 11 -> index_data_message_record.index_code[index_data_message_at] = (index_data_message_base + 0 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_record.index_status = (index_data_message_base + 11 + 1) % 256;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.index_time[index_data_message_at] = (index_data_message_base + 12 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.index_value[index_data_message_at] = (index_data_message_base + 20 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.net_chg_prev_day[index_data_message_at] = (index_data_message_base + 28 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.high_value[index_data_message_at] = (index_data_message_base + 36 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.low_value[index_data_message_at] = (index_data_message_base + 44 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.eas_value[index_data_message_at] = (index_data_message_base + 52 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.index_turnover[index_data_message_at] = (index_data_message_base + 60 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.opening_value[index_data_message_at] = (index_data_message_base + 68 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.closing_value[index_data_message_at] = (index_data_message_base + 76 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.previous_ses_close[index_data_message_at] = (index_data_message_base + 84 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.index_volume[index_data_message_at] = (index_data_message_base + 92 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 4 -> index_data_message_record.net_chg_prev_day_pct[index_data_message_at] = (index_data_message_base + 100 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_record.exception = (index_data_message_base + 104 + 1) % 256;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 3 -> index_data_message_record.filler_3[index_data_message_at] = (index_data_message_base + 105 + index_data_message_at + 1) % 256; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Data Message to the wire, 108 bytes from where the cursor stands */
inline encode_index_data_message(index_data_message_record) {
  index_data_message_at = 0;
  do
  :: index_data_message_at < 11 -> wire[at] = index_data_message_record.index_code[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  wire[at] = index_data_message_record.index_status; at = at + 1;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> wire[at] = index_data_message_record.index_time[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> wire[at] = index_data_message_record.index_value[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> wire[at] = index_data_message_record.net_chg_prev_day[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> wire[at] = index_data_message_record.high_value[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> wire[at] = index_data_message_record.low_value[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> wire[at] = index_data_message_record.eas_value[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> wire[at] = index_data_message_record.index_turnover[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> wire[at] = index_data_message_record.opening_value[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> wire[at] = index_data_message_record.closing_value[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> wire[at] = index_data_message_record.previous_ses_close[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> wire[at] = index_data_message_record.index_volume[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 4 -> wire[at] = index_data_message_record.net_chg_prev_day_pct[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  wire[at] = index_data_message_record.exception; at = at + 1;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 3 -> wire[at] = index_data_message_record.filler_3[index_data_message_at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Data Message off the wire, 108 bytes from where the cursor stands */
inline decode_index_data_message(index_data_message_record) {
  index_data_message_at = 0;
  do
  :: index_data_message_at < 11 -> index_data_message_record.index_code[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_record.index_status = wire[at]; at = at + 1;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.index_time[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.index_value[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.net_chg_prev_day[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.high_value[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.low_value[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.eas_value[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.index_turnover[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.opening_value[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.closing_value[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.previous_ses_close[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> index_data_message_record.index_volume[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 4 -> index_data_message_record.net_chg_prev_day_pct[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_record.exception = wire[at]; at = at + 1;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 3 -> index_data_message_record.filler_3[index_data_message_at] = wire[at]; at = at + 1; index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Index Data Message is what was written, byte for byte */
inline equal_index_data_message(index_data_message_read, index_data_message_written) {
  index_data_message_at = 0;
  do
  :: index_data_message_at < 11 -> assert(index_data_message_read.index_code[index_data_message_at] == index_data_message_written.index_code[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  assert(index_data_message_read.index_status == index_data_message_written.index_status);
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> assert(index_data_message_read.index_time[index_data_message_at] == index_data_message_written.index_time[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> assert(index_data_message_read.index_value[index_data_message_at] == index_data_message_written.index_value[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> assert(index_data_message_read.net_chg_prev_day[index_data_message_at] == index_data_message_written.net_chg_prev_day[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> assert(index_data_message_read.high_value[index_data_message_at] == index_data_message_written.high_value[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> assert(index_data_message_read.low_value[index_data_message_at] == index_data_message_written.low_value[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> assert(index_data_message_read.eas_value[index_data_message_at] == index_data_message_written.eas_value[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> assert(index_data_message_read.index_turnover[index_data_message_at] == index_data_message_written.index_turnover[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> assert(index_data_message_read.opening_value[index_data_message_at] == index_data_message_written.opening_value[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> assert(index_data_message_read.closing_value[index_data_message_at] == index_data_message_written.closing_value[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> assert(index_data_message_read.previous_ses_close[index_data_message_at] == index_data_message_written.previous_ses_close[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 8 -> assert(index_data_message_read.index_volume[index_data_message_at] == index_data_message_written.index_volume[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  index_data_message_at = 0;
  do
  :: index_data_message_at < 4 -> assert(index_data_message_read.net_chg_prev_day_pct[index_data_message_at] == index_data_message_written.net_chg_prev_day_pct[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  assert(index_data_message_read.exception == index_data_message_written.exception);
  index_data_message_at = 0;
  do
  :: index_data_message_at < 3 -> assert(index_data_message_read.filler_3[index_data_message_at] == index_data_message_written.filler_3[index_data_message_at]); index_data_message_at = index_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Indicative Equilibrium Price Message: 16 bytes -------------------------- */

/* The Indicative Equilibrium Price (IEP) message is generated whenever there is change of the IEP or Indicative Equilibrium Volume (IEV) during Pre-Opening Session (POS) or Closing Auction Session (CAS). The IEP is 0 when IEP does not exist. */
typedef IndicativeEquilibriumPriceMessage {
  byte security_code[4];
  byte price[4];
  byte aggregate_quantity[8]
};

int indicative_equilibrium_price_message_at;

/* every byte of Indicative Equilibrium Price Message set to one value */
inline fill_indicative_equilibrium_price_message(indicative_equilibrium_price_message_record, indicative_equilibrium_price_message_value) {
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 4 -> indicative_equilibrium_price_message_record.security_code[indicative_equilibrium_price_message_at] = indicative_equilibrium_price_message_value; indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 4 -> indicative_equilibrium_price_message_record.price[indicative_equilibrium_price_message_at] = indicative_equilibrium_price_message_value; indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 8 -> indicative_equilibrium_price_message_record.aggregate_quantity[indicative_equilibrium_price_message_at] = indicative_equilibrium_price_message_value; indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Indicative Equilibrium Price Message set to where it lies, so a field read out of place says so */
inline ramp_indicative_equilibrium_price_message(indicative_equilibrium_price_message_record, indicative_equilibrium_price_message_base) {
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 4 -> indicative_equilibrium_price_message_record.security_code[indicative_equilibrium_price_message_at] = (indicative_equilibrium_price_message_base + 0 + indicative_equilibrium_price_message_at + 1) % 256; indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 4 -> indicative_equilibrium_price_message_record.price[indicative_equilibrium_price_message_at] = (indicative_equilibrium_price_message_base + 4 + indicative_equilibrium_price_message_at + 1) % 256; indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 8 -> indicative_equilibrium_price_message_record.aggregate_quantity[indicative_equilibrium_price_message_at] = (indicative_equilibrium_price_message_base + 8 + indicative_equilibrium_price_message_at + 1) % 256; indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Indicative Equilibrium Price Message to the wire, 16 bytes from where the cursor stands */
inline encode_indicative_equilibrium_price_message(indicative_equilibrium_price_message_record) {
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 4 -> wire[at] = indicative_equilibrium_price_message_record.security_code[indicative_equilibrium_price_message_at]; at = at + 1; indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 4 -> wire[at] = indicative_equilibrium_price_message_record.price[indicative_equilibrium_price_message_at]; at = at + 1; indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 8 -> wire[at] = indicative_equilibrium_price_message_record.aggregate_quantity[indicative_equilibrium_price_message_at]; at = at + 1; indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Indicative Equilibrium Price Message off the wire, 16 bytes from where the cursor stands */
inline decode_indicative_equilibrium_price_message(indicative_equilibrium_price_message_record) {
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 4 -> indicative_equilibrium_price_message_record.security_code[indicative_equilibrium_price_message_at] = wire[at]; at = at + 1; indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 4 -> indicative_equilibrium_price_message_record.price[indicative_equilibrium_price_message_at] = wire[at]; at = at + 1; indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 8 -> indicative_equilibrium_price_message_record.aggregate_quantity[indicative_equilibrium_price_message_at] = wire[at]; at = at + 1; indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Indicative Equilibrium Price Message is what was written, byte for byte */
inline equal_indicative_equilibrium_price_message(indicative_equilibrium_price_message_read, indicative_equilibrium_price_message_written) {
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 4 -> assert(indicative_equilibrium_price_message_read.security_code[indicative_equilibrium_price_message_at] == indicative_equilibrium_price_message_written.security_code[indicative_equilibrium_price_message_at]); indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 4 -> assert(indicative_equilibrium_price_message_read.price[indicative_equilibrium_price_message_at] == indicative_equilibrium_price_message_written.price[indicative_equilibrium_price_message_at]); indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 8 -> assert(indicative_equilibrium_price_message_read.aggregate_quantity[indicative_equilibrium_price_message_at] == indicative_equilibrium_price_message_written.aggregate_quantity[indicative_equilibrium_price_message_at]); indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Order Message: 24 bytes ------------------------------------------ */

/* The Modify Order message is generated when an existing order identified by the OrderId is modified. The only attribute that can be modified is the quantity. Note for Securities instruments the OrderBookPosition is always set to zero. */
typedef ModifyOrderMessage {
  byte security_code[4];
  byte order_id[8];
  byte quantity[4];
  byte side[2];
  byte filler_2[2];
  byte order_book_position[4]
};

int modify_order_message_at;

/* every byte of Modify Order Message set to one value */
inline fill_modify_order_message(modify_order_message_record, modify_order_message_value) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.security_code[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.order_id[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.quantity[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 2 -> modify_order_message_record.side[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 2 -> modify_order_message_record.filler_2[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.order_book_position[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Modify Order Message set to where it lies, so a field read out of place says so */
inline ramp_modify_order_message(modify_order_message_record, modify_order_message_base) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.security_code[modify_order_message_at] = (modify_order_message_base + 0 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.order_id[modify_order_message_at] = (modify_order_message_base + 4 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.quantity[modify_order_message_at] = (modify_order_message_base + 12 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 2 -> modify_order_message_record.side[modify_order_message_at] = (modify_order_message_base + 16 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 2 -> modify_order_message_record.filler_2[modify_order_message_at] = (modify_order_message_base + 18 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.order_book_position[modify_order_message_at] = (modify_order_message_base + 20 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order Message to the wire, 24 bytes from where the cursor stands */
inline encode_modify_order_message(modify_order_message_record) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.security_code[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> wire[at] = modify_order_message_record.order_id[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.quantity[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 2 -> wire[at] = modify_order_message_record.side[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 2 -> wire[at] = modify_order_message_record.filler_2[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.order_book_position[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order Message off the wire, 24 bytes from where the cursor stands */
inline decode_modify_order_message(modify_order_message_record) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.security_code[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.order_id[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.quantity[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 2 -> modify_order_message_record.side[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 2 -> modify_order_message_record.filler_2[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.order_book_position[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Modify Order Message is what was written, byte for byte */
inline equal_modify_order_message(modify_order_message_read, modify_order_message_written) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.security_code[modify_order_message_at] == modify_order_message_written.security_code[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> assert(modify_order_message_read.order_id[modify_order_message_at] == modify_order_message_written.order_id[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.quantity[modify_order_message_at] == modify_order_message_written.quantity[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 2 -> assert(modify_order_message_read.side[modify_order_message_at] == modify_order_message_written.side[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 2 -> assert(modify_order_message_read.filler_2[modify_order_message_at] == modify_order_message_written.filler_2[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.order_book_position[modify_order_message_at] == modify_order_message_written.order_book_position[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Nominal Price Message: 8 bytes ------------------------------------------ */

/* The Nominal message may be generated when an order is added, deleted or modified in a book or when trade or trade cancel is performed. Before the first Nominal Price message, the nominal price should be the same as the previous closing price provided in Security Definition (11). */
typedef NominalPriceMessage {
  byte security_code[4];
  byte nominal_price[4]
};

int nominal_price_message_at;

/* every byte of Nominal Price Message set to one value */
inline fill_nominal_price_message(nominal_price_message_record, nominal_price_message_value) {
  nominal_price_message_at = 0;
  do
  :: nominal_price_message_at < 4 -> nominal_price_message_record.security_code[nominal_price_message_at] = nominal_price_message_value; nominal_price_message_at = nominal_price_message_at + 1
  :: else -> break
  od;
  nominal_price_message_at = 0;
  do
  :: nominal_price_message_at < 4 -> nominal_price_message_record.nominal_price[nominal_price_message_at] = nominal_price_message_value; nominal_price_message_at = nominal_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Nominal Price Message set to where it lies, so a field read out of place says so */
inline ramp_nominal_price_message(nominal_price_message_record, nominal_price_message_base) {
  nominal_price_message_at = 0;
  do
  :: nominal_price_message_at < 4 -> nominal_price_message_record.security_code[nominal_price_message_at] = (nominal_price_message_base + 0 + nominal_price_message_at + 1) % 256; nominal_price_message_at = nominal_price_message_at + 1
  :: else -> break
  od;
  nominal_price_message_at = 0;
  do
  :: nominal_price_message_at < 4 -> nominal_price_message_record.nominal_price[nominal_price_message_at] = (nominal_price_message_base + 4 + nominal_price_message_at + 1) % 256; nominal_price_message_at = nominal_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Nominal Price Message to the wire, 8 bytes from where the cursor stands */
inline encode_nominal_price_message(nominal_price_message_record) {
  nominal_price_message_at = 0;
  do
  :: nominal_price_message_at < 4 -> wire[at] = nominal_price_message_record.security_code[nominal_price_message_at]; at = at + 1; nominal_price_message_at = nominal_price_message_at + 1
  :: else -> break
  od;
  nominal_price_message_at = 0;
  do
  :: nominal_price_message_at < 4 -> wire[at] = nominal_price_message_record.nominal_price[nominal_price_message_at]; at = at + 1; nominal_price_message_at = nominal_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Nominal Price Message off the wire, 8 bytes from where the cursor stands */
inline decode_nominal_price_message(nominal_price_message_record) {
  nominal_price_message_at = 0;
  do
  :: nominal_price_message_at < 4 -> nominal_price_message_record.security_code[nominal_price_message_at] = wire[at]; at = at + 1; nominal_price_message_at = nominal_price_message_at + 1
  :: else -> break
  od;
  nominal_price_message_at = 0;
  do
  :: nominal_price_message_at < 4 -> nominal_price_message_record.nominal_price[nominal_price_message_at] = wire[at]; at = at + 1; nominal_price_message_at = nominal_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Nominal Price Message is what was written, byte for byte */
inline equal_nominal_price_message(nominal_price_message_read, nominal_price_message_written) {
  nominal_price_message_at = 0;
  do
  :: nominal_price_message_at < 4 -> assert(nominal_price_message_read.security_code[nominal_price_message_at] == nominal_price_message_written.security_code[nominal_price_message_at]); nominal_price_message_at = nominal_price_message_at + 1
  :: else -> break
  od;
  nominal_price_message_at = 0;
  do
  :: nominal_price_message_at < 4 -> assert(nominal_price_message_read.nominal_price[nominal_price_message_at] == nominal_price_message_written.nominal_price[nominal_price_message_at]); nominal_price_message_at = nominal_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Imbalance Message: 16 bytes --------------------------------------- */

/* The Order Imbalance message provides order imbalance information at the Indicative Equilibrium Price (IEP) during the Pre-Opening Session (POS) and Closing Auction Session (CAS). */
typedef OrderImbalanceMessage {
  byte security_code[4];
  byte order_imbalance_direction;
  byte filler_1;
  byte order_imbalance_quantity[8];
  byte filler_2[2]
};

int order_imbalance_message_at;

/* every byte of Order Imbalance Message set to one value */
inline fill_order_imbalance_message(order_imbalance_message_record, order_imbalance_message_value) {
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 4 -> order_imbalance_message_record.security_code[order_imbalance_message_at] = order_imbalance_message_value; order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  order_imbalance_message_record.order_imbalance_direction = order_imbalance_message_value;
  order_imbalance_message_record.filler_1 = order_imbalance_message_value;
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 8 -> order_imbalance_message_record.order_imbalance_quantity[order_imbalance_message_at] = order_imbalance_message_value; order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 2 -> order_imbalance_message_record.filler_2[order_imbalance_message_at] = order_imbalance_message_value; order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Imbalance Message set to where it lies, so a field read out of place says so */
inline ramp_order_imbalance_message(order_imbalance_message_record, order_imbalance_message_base) {
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 4 -> order_imbalance_message_record.security_code[order_imbalance_message_at] = (order_imbalance_message_base + 0 + order_imbalance_message_at + 1) % 256; order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  order_imbalance_message_record.order_imbalance_direction = (order_imbalance_message_base + 4 + 1) % 256;
  order_imbalance_message_record.filler_1 = (order_imbalance_message_base + 5 + 1) % 256;
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 8 -> order_imbalance_message_record.order_imbalance_quantity[order_imbalance_message_at] = (order_imbalance_message_base + 6 + order_imbalance_message_at + 1) % 256; order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 2 -> order_imbalance_message_record.filler_2[order_imbalance_message_at] = (order_imbalance_message_base + 14 + order_imbalance_message_at + 1) % 256; order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Imbalance Message to the wire, 16 bytes from where the cursor stands */
inline encode_order_imbalance_message(order_imbalance_message_record) {
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 4 -> wire[at] = order_imbalance_message_record.security_code[order_imbalance_message_at]; at = at + 1; order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  wire[at] = order_imbalance_message_record.order_imbalance_direction; at = at + 1;
  wire[at] = order_imbalance_message_record.filler_1; at = at + 1;
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 8 -> wire[at] = order_imbalance_message_record.order_imbalance_quantity[order_imbalance_message_at]; at = at + 1; order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 2 -> wire[at] = order_imbalance_message_record.filler_2[order_imbalance_message_at]; at = at + 1; order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Imbalance Message off the wire, 16 bytes from where the cursor stands */
inline decode_order_imbalance_message(order_imbalance_message_record) {
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 4 -> order_imbalance_message_record.security_code[order_imbalance_message_at] = wire[at]; at = at + 1; order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  order_imbalance_message_record.order_imbalance_direction = wire[at]; at = at + 1;
  order_imbalance_message_record.filler_1 = wire[at]; at = at + 1;
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 8 -> order_imbalance_message_record.order_imbalance_quantity[order_imbalance_message_at] = wire[at]; at = at + 1; order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 2 -> order_imbalance_message_record.filler_2[order_imbalance_message_at] = wire[at]; at = at + 1; order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Imbalance Message is what was written, byte for byte */
inline equal_order_imbalance_message(order_imbalance_message_read, order_imbalance_message_written) {
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 4 -> assert(order_imbalance_message_read.security_code[order_imbalance_message_at] == order_imbalance_message_written.security_code[order_imbalance_message_at]); order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  assert(order_imbalance_message_read.order_imbalance_direction == order_imbalance_message_written.order_imbalance_direction);
  assert(order_imbalance_message_read.filler_1 == order_imbalance_message_written.filler_1);
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 8 -> assert(order_imbalance_message_read.order_imbalance_quantity[order_imbalance_message_at] == order_imbalance_message_written.order_imbalance_quantity[order_imbalance_message_at]); order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 2 -> assert(order_imbalance_message_read.filler_2[order_imbalance_message_at] == order_imbalance_message_written.filler_2[order_imbalance_message_at]); order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Definition Message: 36 bytes ------------------------------------- */

/* The Market Definition message is generated at the start of the business day for each market segment. */
typedef MarketDefinitionMessage {
  byte market_code[4];
  byte market_name[25];
  byte currency_code[3];
  byte number_of_securities[4]
};

int market_definition_message_at;

/* every byte of Market Definition Message set to one value */
inline fill_market_definition_message(market_definition_message_record, market_definition_message_value) {
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> market_definition_message_record.market_code[market_definition_message_at] = market_definition_message_value; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 25 -> market_definition_message_record.market_name[market_definition_message_at] = market_definition_message_value; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 3 -> market_definition_message_record.currency_code[market_definition_message_at] = market_definition_message_value; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> market_definition_message_record.number_of_securities[market_definition_message_at] = market_definition_message_value; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Definition Message set to where it lies, so a field read out of place says so */
inline ramp_market_definition_message(market_definition_message_record, market_definition_message_base) {
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> market_definition_message_record.market_code[market_definition_message_at] = (market_definition_message_base + 0 + market_definition_message_at + 1) % 256; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 25 -> market_definition_message_record.market_name[market_definition_message_at] = (market_definition_message_base + 4 + market_definition_message_at + 1) % 256; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 3 -> market_definition_message_record.currency_code[market_definition_message_at] = (market_definition_message_base + 29 + market_definition_message_at + 1) % 256; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> market_definition_message_record.number_of_securities[market_definition_message_at] = (market_definition_message_base + 32 + market_definition_message_at + 1) % 256; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Definition Message to the wire, 36 bytes from where the cursor stands */
inline encode_market_definition_message(market_definition_message_record) {
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> wire[at] = market_definition_message_record.market_code[market_definition_message_at]; at = at + 1; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 25 -> wire[at] = market_definition_message_record.market_name[market_definition_message_at]; at = at + 1; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 3 -> wire[at] = market_definition_message_record.currency_code[market_definition_message_at]; at = at + 1; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> wire[at] = market_definition_message_record.number_of_securities[market_definition_message_at]; at = at + 1; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Definition Message off the wire, 36 bytes from where the cursor stands */
inline decode_market_definition_message(market_definition_message_record) {
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> market_definition_message_record.market_code[market_definition_message_at] = wire[at]; at = at + 1; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 25 -> market_definition_message_record.market_name[market_definition_message_at] = wire[at]; at = at + 1; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 3 -> market_definition_message_record.currency_code[market_definition_message_at] = wire[at]; at = at + 1; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> market_definition_message_record.number_of_securities[market_definition_message_at] = wire[at]; at = at + 1; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Definition Message is what was written, byte for byte */
inline equal_market_definition_message(market_definition_message_read, market_definition_message_written) {
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> assert(market_definition_message_read.market_code[market_definition_message_at] == market_definition_message_written.market_code[market_definition_message_at]); market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 25 -> assert(market_definition_message_read.market_name[market_definition_message_at] == market_definition_message_written.market_name[market_definition_message_at]); market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 3 -> assert(market_definition_message_read.currency_code[market_definition_message_at] == market_definition_message_written.currency_code[market_definition_message_at]); market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> assert(market_definition_message_read.number_of_securities[market_definition_message_at] == market_definition_message_written.number_of_securities[market_definition_message_at]); market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Currency Rate Message: 12 bytes ----------------------------------------- */

/* The Currency Rate message provides the foreign exchange conversion rates between various foreign currencies and the Hong Kong dollar. */
typedef CurrencyRateMessage {
  byte currency_code[3];
  byte filler_1;
  byte currency_factor[2];
  byte filler_2[2];
  byte currency_rate[4]
};

int currency_rate_message_at;

/* every byte of Currency Rate Message set to one value */
inline fill_currency_rate_message(currency_rate_message_record, currency_rate_message_value) {
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 3 -> currency_rate_message_record.currency_code[currency_rate_message_at] = currency_rate_message_value; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  currency_rate_message_record.filler_1 = currency_rate_message_value;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 2 -> currency_rate_message_record.currency_factor[currency_rate_message_at] = currency_rate_message_value; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 2 -> currency_rate_message_record.filler_2[currency_rate_message_at] = currency_rate_message_value; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 4 -> currency_rate_message_record.currency_rate[currency_rate_message_at] = currency_rate_message_value; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Currency Rate Message set to where it lies, so a field read out of place says so */
inline ramp_currency_rate_message(currency_rate_message_record, currency_rate_message_base) {
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 3 -> currency_rate_message_record.currency_code[currency_rate_message_at] = (currency_rate_message_base + 0 + currency_rate_message_at + 1) % 256; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  currency_rate_message_record.filler_1 = (currency_rate_message_base + 3 + 1) % 256;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 2 -> currency_rate_message_record.currency_factor[currency_rate_message_at] = (currency_rate_message_base + 4 + currency_rate_message_at + 1) % 256; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 2 -> currency_rate_message_record.filler_2[currency_rate_message_at] = (currency_rate_message_base + 6 + currency_rate_message_at + 1) % 256; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 4 -> currency_rate_message_record.currency_rate[currency_rate_message_at] = (currency_rate_message_base + 8 + currency_rate_message_at + 1) % 256; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  skip
}

/* Currency Rate Message to the wire, 12 bytes from where the cursor stands */
inline encode_currency_rate_message(currency_rate_message_record) {
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 3 -> wire[at] = currency_rate_message_record.currency_code[currency_rate_message_at]; at = at + 1; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  wire[at] = currency_rate_message_record.filler_1; at = at + 1;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 2 -> wire[at] = currency_rate_message_record.currency_factor[currency_rate_message_at]; at = at + 1; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 2 -> wire[at] = currency_rate_message_record.filler_2[currency_rate_message_at]; at = at + 1; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 4 -> wire[at] = currency_rate_message_record.currency_rate[currency_rate_message_at]; at = at + 1; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  skip
}

/* Currency Rate Message off the wire, 12 bytes from where the cursor stands */
inline decode_currency_rate_message(currency_rate_message_record) {
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 3 -> currency_rate_message_record.currency_code[currency_rate_message_at] = wire[at]; at = at + 1; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  currency_rate_message_record.filler_1 = wire[at]; at = at + 1;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 2 -> currency_rate_message_record.currency_factor[currency_rate_message_at] = wire[at]; at = at + 1; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 2 -> currency_rate_message_record.filler_2[currency_rate_message_at] = wire[at]; at = at + 1; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 4 -> currency_rate_message_record.currency_rate[currency_rate_message_at] = wire[at]; at = at + 1; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Currency Rate Message is what was written, byte for byte */
inline equal_currency_rate_message(currency_rate_message_read, currency_rate_message_written) {
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 3 -> assert(currency_rate_message_read.currency_code[currency_rate_message_at] == currency_rate_message_written.currency_code[currency_rate_message_at]); currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  assert(currency_rate_message_read.filler_1 == currency_rate_message_written.filler_1);
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 2 -> assert(currency_rate_message_read.currency_factor[currency_rate_message_at] == currency_rate_message_written.currency_factor[currency_rate_message_at]); currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 2 -> assert(currency_rate_message_read.filler_2[currency_rate_message_at] == currency_rate_message_written.filler_2[currency_rate_message_at]); currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 4 -> assert(currency_rate_message_read.currency_rate[currency_rate_message_at] == currency_rate_message_written.currency_rate[currency_rate_message_at]); currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reference Price Message: 16 bytes --------------------------------------- */

/* Reference price, lower and upper price limits for order input during an applicable auction session (POS or CAS). Sent again when there is any change. */
typedef ReferencePriceMessage {
  byte security_code[4];
  byte reference_price[4];
  byte lower_price[4];
  byte upper_price[4]
};

int reference_price_message_at;

/* every byte of Reference Price Message set to one value */
inline fill_reference_price_message(reference_price_message_record, reference_price_message_value) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.security_code[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.reference_price[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.lower_price[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.upper_price[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reference Price Message set to where it lies, so a field read out of place says so */
inline ramp_reference_price_message(reference_price_message_record, reference_price_message_base) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.security_code[reference_price_message_at] = (reference_price_message_base + 0 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.reference_price[reference_price_message_at] = (reference_price_message_base + 4 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.lower_price[reference_price_message_at] = (reference_price_message_base + 8 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.upper_price[reference_price_message_at] = (reference_price_message_base + 12 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reference Price Message to the wire, 16 bytes from where the cursor stands */
inline encode_reference_price_message(reference_price_message_record) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> wire[at] = reference_price_message_record.security_code[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> wire[at] = reference_price_message_record.reference_price[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> wire[at] = reference_price_message_record.lower_price[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> wire[at] = reference_price_message_record.upper_price[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reference Price Message off the wire, 16 bytes from where the cursor stands */
inline decode_reference_price_message(reference_price_message_record) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.security_code[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.reference_price[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.lower_price[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.upper_price[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reference Price Message is what was written, byte for byte */
inline equal_reference_price_message(reference_price_message_read, reference_price_message_written) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> assert(reference_price_message_read.security_code[reference_price_message_at] == reference_price_message_written.security_code[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> assert(reference_price_message_read.reference_price[reference_price_message_at] == reference_price_message_written.reference_price[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> assert(reference_price_message_read.lower_price[reference_price_message_at] == reference_price_message_written.lower_price[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> assert(reference_price_message_read.upper_price[reference_price_message_at] == reference_price_message_written.upper_price[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Refresh Complete Message: 4 bytes --------------------------------------- */

/* This message is published to mark the end of a refresh. */
typedef RefreshCompleteMessage {
  byte last_seq_num[4]
};

int refresh_complete_message_at;

/* every byte of Refresh Complete Message set to one value */
inline fill_refresh_complete_message(refresh_complete_message_record, refresh_complete_message_value) {
  refresh_complete_message_at = 0;
  do
  :: refresh_complete_message_at < 4 -> refresh_complete_message_record.last_seq_num[refresh_complete_message_at] = refresh_complete_message_value; refresh_complete_message_at = refresh_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Refresh Complete Message set to where it lies, so a field read out of place says so */
inline ramp_refresh_complete_message(refresh_complete_message_record, refresh_complete_message_base) {
  refresh_complete_message_at = 0;
  do
  :: refresh_complete_message_at < 4 -> refresh_complete_message_record.last_seq_num[refresh_complete_message_at] = (refresh_complete_message_base + 0 + refresh_complete_message_at + 1) % 256; refresh_complete_message_at = refresh_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Complete Message to the wire, 4 bytes from where the cursor stands */
inline encode_refresh_complete_message(refresh_complete_message_record) {
  refresh_complete_message_at = 0;
  do
  :: refresh_complete_message_at < 4 -> wire[at] = refresh_complete_message_record.last_seq_num[refresh_complete_message_at]; at = at + 1; refresh_complete_message_at = refresh_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Complete Message off the wire, 4 bytes from where the cursor stands */
inline decode_refresh_complete_message(refresh_complete_message_record) {
  refresh_complete_message_at = 0;
  do
  :: refresh_complete_message_at < 4 -> refresh_complete_message_record.last_seq_num[refresh_complete_message_at] = wire[at]; at = at + 1; refresh_complete_message_at = refresh_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Refresh Complete Message is what was written, byte for byte */
inline equal_refresh_complete_message(refresh_complete_message_read, refresh_complete_message_written) {
  refresh_complete_message_at = 0;
  do
  :: refresh_complete_message_at < 4 -> assert(refresh_complete_message_read.last_seq_num[refresh_complete_message_at] == refresh_complete_message_written.last_seq_num[refresh_complete_message_at]); refresh_complete_message_at = refresh_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Logon Message: 12 bytes ------------------------------------------------- */

/* The Logon message enables client authentication. Not required for multicast channels; only used for retransmission requests. */
typedef LogonMessage {
  byte username[12]
};

int logon_message_at;

/* every byte of Logon Message set to one value */
inline fill_logon_message(logon_message_record, logon_message_value) {
  logon_message_at = 0;
  do
  :: logon_message_at < 12 -> logon_message_record.username[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logon Message set to where it lies, so a field read out of place says so */
inline ramp_logon_message(logon_message_record, logon_message_base) {
  logon_message_at = 0;
  do
  :: logon_message_at < 12 -> logon_message_record.username[logon_message_at] = (logon_message_base + 0 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Message to the wire, 12 bytes from where the cursor stands */
inline encode_logon_message(logon_message_record) {
  logon_message_at = 0;
  do
  :: logon_message_at < 12 -> wire[at] = logon_message_record.username[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Message off the wire, 12 bytes from where the cursor stands */
inline decode_logon_message(logon_message_record) {
  logon_message_at = 0;
  do
  :: logon_message_at < 12 -> logon_message_record.username[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logon Message is what was written, byte for byte */
inline equal_logon_message(logon_message_read, logon_message_written) {
  logon_message_at = 0;
  do
  :: logon_message_at < 12 -> assert(logon_message_read.username[logon_message_at] == logon_message_written.username[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Logon Response Message: 4 bytes ----------------------------------------- */

/* Response to a Logon request indicating session status. */
typedef LogonResponseMessage {
  byte session_status;
  byte filler_3[3]
};

int logon_response_message_at;

/* every byte of Logon Response Message set to one value */
inline fill_logon_response_message(logon_response_message_record, logon_response_message_value) {
  logon_response_message_record.session_status = logon_response_message_value;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 3 -> logon_response_message_record.filler_3[logon_response_message_at] = logon_response_message_value; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logon Response Message set to where it lies, so a field read out of place says so */
inline ramp_logon_response_message(logon_response_message_record, logon_response_message_base) {
  logon_response_message_record.session_status = (logon_response_message_base + 0 + 1) % 256;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 3 -> logon_response_message_record.filler_3[logon_response_message_at] = (logon_response_message_base + 1 + logon_response_message_at + 1) % 256; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Response Message to the wire, 4 bytes from where the cursor stands */
inline encode_logon_response_message(logon_response_message_record) {
  wire[at] = logon_response_message_record.session_status; at = at + 1;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 3 -> wire[at] = logon_response_message_record.filler_3[logon_response_message_at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Response Message off the wire, 4 bytes from where the cursor stands */
inline decode_logon_response_message(logon_response_message_record) {
  logon_response_message_record.session_status = wire[at]; at = at + 1;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 3 -> logon_response_message_record.filler_3[logon_response_message_at] = wire[at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logon Response Message is what was written, byte for byte */
inline equal_logon_response_message(logon_response_message_read, logon_response_message_written) {
  assert(logon_response_message_read.session_status == logon_response_message_written.session_status);
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 3 -> assert(logon_response_message_read.filler_3[logon_response_message_at] == logon_response_message_written.filler_3[logon_response_message_at]); logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Retransmission Request Message: 12 bytes -------------------------------- */

/* Client-initiated request to retransmit a range of messages from a specific multicast channel. */
typedef RetransmissionRequestMessage {
  byte channel_id[2];
  byte filler_2[2];
  byte begin_seq_num[4];
  byte end_seq_num[4]
};

int retransmission_request_message_at;

/* every byte of Retransmission Request Message set to one value */
inline fill_retransmission_request_message(retransmission_request_message_record, retransmission_request_message_value) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 2 -> retransmission_request_message_record.channel_id[retransmission_request_message_at] = retransmission_request_message_value; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 2 -> retransmission_request_message_record.filler_2[retransmission_request_message_at] = retransmission_request_message_value; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.begin_seq_num[retransmission_request_message_at] = retransmission_request_message_value; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.end_seq_num[retransmission_request_message_at] = retransmission_request_message_value; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Retransmission Request Message set to where it lies, so a field read out of place says so */
inline ramp_retransmission_request_message(retransmission_request_message_record, retransmission_request_message_base) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 2 -> retransmission_request_message_record.channel_id[retransmission_request_message_at] = (retransmission_request_message_base + 0 + retransmission_request_message_at + 1) % 256; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 2 -> retransmission_request_message_record.filler_2[retransmission_request_message_at] = (retransmission_request_message_base + 2 + retransmission_request_message_at + 1) % 256; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.begin_seq_num[retransmission_request_message_at] = (retransmission_request_message_base + 4 + retransmission_request_message_at + 1) % 256; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.end_seq_num[retransmission_request_message_at] = (retransmission_request_message_base + 8 + retransmission_request_message_at + 1) % 256; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Request Message to the wire, 12 bytes from where the cursor stands */
inline encode_retransmission_request_message(retransmission_request_message_record) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 2 -> wire[at] = retransmission_request_message_record.channel_id[retransmission_request_message_at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 2 -> wire[at] = retransmission_request_message_record.filler_2[retransmission_request_message_at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> wire[at] = retransmission_request_message_record.begin_seq_num[retransmission_request_message_at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> wire[at] = retransmission_request_message_record.end_seq_num[retransmission_request_message_at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Request Message off the wire, 12 bytes from where the cursor stands */
inline decode_retransmission_request_message(retransmission_request_message_record) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 2 -> retransmission_request_message_record.channel_id[retransmission_request_message_at] = wire[at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 2 -> retransmission_request_message_record.filler_2[retransmission_request_message_at] = wire[at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.begin_seq_num[retransmission_request_message_at] = wire[at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.end_seq_num[retransmission_request_message_at] = wire[at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Retransmission Request Message is what was written, byte for byte */
inline equal_retransmission_request_message(retransmission_request_message_read, retransmission_request_message_written) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 2 -> assert(retransmission_request_message_read.channel_id[retransmission_request_message_at] == retransmission_request_message_written.channel_id[retransmission_request_message_at]); retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 2 -> assert(retransmission_request_message_read.filler_2[retransmission_request_message_at] == retransmission_request_message_written.filler_2[retransmission_request_message_at]); retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> assert(retransmission_request_message_read.begin_seq_num[retransmission_request_message_at] == retransmission_request_message_written.begin_seq_num[retransmission_request_message_at]); retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> assert(retransmission_request_message_read.end_seq_num[retransmission_request_message_at] == retransmission_request_message_written.end_seq_num[retransmission_request_message_at]); retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Retransmission Response Message: 12 bytes ------------------------------- */

/* Server response to a Retransmission Request indicating whether the range can be resent. */
typedef RetransmissionResponseMessage {
  byte channel_id[2];
  byte retrans_status;
  byte filler_1;
  byte begin_seq_num[4];
  byte end_seq_num[4]
};

int retransmission_response_message_at;

/* every byte of Retransmission Response Message set to one value */
inline fill_retransmission_response_message(retransmission_response_message_record, retransmission_response_message_value) {
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 2 -> retransmission_response_message_record.channel_id[retransmission_response_message_at] = retransmission_response_message_value; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_record.retrans_status = retransmission_response_message_value;
  retransmission_response_message_record.filler_1 = retransmission_response_message_value;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> retransmission_response_message_record.begin_seq_num[retransmission_response_message_at] = retransmission_response_message_value; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> retransmission_response_message_record.end_seq_num[retransmission_response_message_at] = retransmission_response_message_value; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Retransmission Response Message set to where it lies, so a field read out of place says so */
inline ramp_retransmission_response_message(retransmission_response_message_record, retransmission_response_message_base) {
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 2 -> retransmission_response_message_record.channel_id[retransmission_response_message_at] = (retransmission_response_message_base + 0 + retransmission_response_message_at + 1) % 256; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_record.retrans_status = (retransmission_response_message_base + 2 + 1) % 256;
  retransmission_response_message_record.filler_1 = (retransmission_response_message_base + 3 + 1) % 256;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> retransmission_response_message_record.begin_seq_num[retransmission_response_message_at] = (retransmission_response_message_base + 4 + retransmission_response_message_at + 1) % 256; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> retransmission_response_message_record.end_seq_num[retransmission_response_message_at] = (retransmission_response_message_base + 8 + retransmission_response_message_at + 1) % 256; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Response Message to the wire, 12 bytes from where the cursor stands */
inline encode_retransmission_response_message(retransmission_response_message_record) {
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 2 -> wire[at] = retransmission_response_message_record.channel_id[retransmission_response_message_at]; at = at + 1; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  wire[at] = retransmission_response_message_record.retrans_status; at = at + 1;
  wire[at] = retransmission_response_message_record.filler_1; at = at + 1;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> wire[at] = retransmission_response_message_record.begin_seq_num[retransmission_response_message_at]; at = at + 1; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> wire[at] = retransmission_response_message_record.end_seq_num[retransmission_response_message_at]; at = at + 1; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Response Message off the wire, 12 bytes from where the cursor stands */
inline decode_retransmission_response_message(retransmission_response_message_record) {
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 2 -> retransmission_response_message_record.channel_id[retransmission_response_message_at] = wire[at]; at = at + 1; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_record.retrans_status = wire[at]; at = at + 1;
  retransmission_response_message_record.filler_1 = wire[at]; at = at + 1;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> retransmission_response_message_record.begin_seq_num[retransmission_response_message_at] = wire[at]; at = at + 1; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> retransmission_response_message_record.end_seq_num[retransmission_response_message_at] = wire[at]; at = at + 1; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Retransmission Response Message is what was written, byte for byte */
inline equal_retransmission_response_message(retransmission_response_message_read, retransmission_response_message_written) {
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 2 -> assert(retransmission_response_message_read.channel_id[retransmission_response_message_at] == retransmission_response_message_written.channel_id[retransmission_response_message_at]); retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  assert(retransmission_response_message_read.retrans_status == retransmission_response_message_written.retrans_status);
  assert(retransmission_response_message_read.filler_1 == retransmission_response_message_written.filler_1);
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> assert(retransmission_response_message_read.begin_seq_num[retransmission_response_message_at] == retransmission_response_message_written.begin_seq_num[retransmission_response_message_at]); retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> assert(retransmission_response_message_read.end_seq_num[retransmission_response_message_at] == retransmission_response_message_written.end_seq_num[retransmission_response_message_at]); retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Statistics Message: 48 bytes -------------------------------------------- */

/* The Statistics message provides statistics including volume-weighted average price and turnover. Generated (excluding overseas trades) once after CTS/auction match, manual trade, odd lot trade, or trade cancel. VWAP is not populated for SS (OMD Securities Standard) clients. */
typedef StatisticsMessage {
  byte security_code[4];
  byte shares_traded[8];
  byte turnover[8];
  byte high_price[4];
  byte low_price[4];
  byte last_price[4];
  byte vwap[4];
  byte short_sell_shares_traded[4];
  byte short_sell_turnover[8]
};

int statistics_message_at;

/* every byte of Statistics Message set to one value */
inline fill_statistics_message(statistics_message_record, statistics_message_value) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.security_code[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.shares_traded[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.turnover[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.high_price[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.low_price[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.last_price[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.vwap[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.short_sell_shares_traded[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.short_sell_turnover[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Statistics Message set to where it lies, so a field read out of place says so */
inline ramp_statistics_message(statistics_message_record, statistics_message_base) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.security_code[statistics_message_at] = (statistics_message_base + 0 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.shares_traded[statistics_message_at] = (statistics_message_base + 4 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.turnover[statistics_message_at] = (statistics_message_base + 12 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.high_price[statistics_message_at] = (statistics_message_base + 20 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.low_price[statistics_message_at] = (statistics_message_base + 24 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.last_price[statistics_message_at] = (statistics_message_base + 28 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.vwap[statistics_message_at] = (statistics_message_base + 32 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.short_sell_shares_traded[statistics_message_at] = (statistics_message_base + 36 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.short_sell_turnover[statistics_message_at] = (statistics_message_base + 40 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* Statistics Message to the wire, 48 bytes from where the cursor stands */
inline encode_statistics_message(statistics_message_record) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.security_code[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.shares_traded[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.turnover[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.high_price[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.low_price[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.last_price[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.vwap[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.short_sell_shares_traded[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.short_sell_turnover[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* Statistics Message off the wire, 48 bytes from where the cursor stands */
inline decode_statistics_message(statistics_message_record) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.security_code[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.shares_traded[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.turnover[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.high_price[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.low_price[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.last_price[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.vwap[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.short_sell_shares_traded[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.short_sell_turnover[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Statistics Message is what was written, byte for byte */
inline equal_statistics_message(statistics_message_read, statistics_message_written) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> assert(statistics_message_read.security_code[statistics_message_at] == statistics_message_written.security_code[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.shares_traded[statistics_message_at] == statistics_message_written.shares_traded[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.turnover[statistics_message_at] == statistics_message_written.turnover[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> assert(statistics_message_read.high_price[statistics_message_at] == statistics_message_written.high_price[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> assert(statistics_message_read.low_price[statistics_message_at] == statistics_message_written.low_price[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> assert(statistics_message_read.last_price[statistics_message_at] == statistics_message_written.last_price[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> assert(statistics_message_read.vwap[statistics_message_at] == statistics_message_written.vwap[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> assert(statistics_message_read.short_sell_shares_traded[statistics_message_at] == statistics_message_written.short_sell_shares_traded[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.short_sell_turnover[statistics_message_at] == statistics_message_written.short_sell_turnover[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Turnover Message: 16 bytes --------------------------------------- */

/* The Market Turnover message contains the total turnover (excluding overseas trades) for all securities on a given market segment for a given trading currency. When CurrencyCode is blank, the turnover represents the total for all trading currencies, expressed in HKD. Updates disseminated around every 2 seconds during trading hours. */
typedef MarketTurnoverMessage {
  byte market_code[4];
  byte currency_code[3];
  byte filler_1;
  byte turnover[8]
};

int market_turnover_message_at;

/* every byte of Market Turnover Message set to one value */
inline fill_market_turnover_message(market_turnover_message_record, market_turnover_message_value) {
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 4 -> market_turnover_message_record.market_code[market_turnover_message_at] = market_turnover_message_value; market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 3 -> market_turnover_message_record.currency_code[market_turnover_message_at] = market_turnover_message_value; market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  market_turnover_message_record.filler_1 = market_turnover_message_value;
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 8 -> market_turnover_message_record.turnover[market_turnover_message_at] = market_turnover_message_value; market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Turnover Message set to where it lies, so a field read out of place says so */
inline ramp_market_turnover_message(market_turnover_message_record, market_turnover_message_base) {
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 4 -> market_turnover_message_record.market_code[market_turnover_message_at] = (market_turnover_message_base + 0 + market_turnover_message_at + 1) % 256; market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 3 -> market_turnover_message_record.currency_code[market_turnover_message_at] = (market_turnover_message_base + 4 + market_turnover_message_at + 1) % 256; market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  market_turnover_message_record.filler_1 = (market_turnover_message_base + 7 + 1) % 256;
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 8 -> market_turnover_message_record.turnover[market_turnover_message_at] = (market_turnover_message_base + 8 + market_turnover_message_at + 1) % 256; market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Turnover Message to the wire, 16 bytes from where the cursor stands */
inline encode_market_turnover_message(market_turnover_message_record) {
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 4 -> wire[at] = market_turnover_message_record.market_code[market_turnover_message_at]; at = at + 1; market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 3 -> wire[at] = market_turnover_message_record.currency_code[market_turnover_message_at]; at = at + 1; market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  wire[at] = market_turnover_message_record.filler_1; at = at + 1;
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 8 -> wire[at] = market_turnover_message_record.turnover[market_turnover_message_at]; at = at + 1; market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Turnover Message off the wire, 16 bytes from where the cursor stands */
inline decode_market_turnover_message(market_turnover_message_record) {
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 4 -> market_turnover_message_record.market_code[market_turnover_message_at] = wire[at]; at = at + 1; market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 3 -> market_turnover_message_record.currency_code[market_turnover_message_at] = wire[at]; at = at + 1; market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  market_turnover_message_record.filler_1 = wire[at]; at = at + 1;
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 8 -> market_turnover_message_record.turnover[market_turnover_message_at] = wire[at]; at = at + 1; market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Turnover Message is what was written, byte for byte */
inline equal_market_turnover_message(market_turnover_message_read, market_turnover_message_written) {
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 4 -> assert(market_turnover_message_read.market_code[market_turnover_message_at] == market_turnover_message_written.market_code[market_turnover_message_at]); market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 3 -> assert(market_turnover_message_read.currency_code[market_turnover_message_at] == market_turnover_message_written.currency_code[market_turnover_message_at]); market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  assert(market_turnover_message_read.filler_1 == market_turnover_message_written.filler_1);
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 8 -> assert(market_turnover_message_read.turnover[market_turnover_message_at] == market_turnover_message_written.turnover[market_turnover_message_at]); market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Yield Message: 8 bytes -------------------------------------------------- */

/* The Yield message is generated for bond securities when their yield percentage changes. */
typedef YieldMessage {
  byte security_code[4];
  byte yield[4]
};

int yield_message_at;

/* every byte of Yield Message set to one value */
inline fill_yield_message(yield_message_record, yield_message_value) {
  yield_message_at = 0;
  do
  :: yield_message_at < 4 -> yield_message_record.security_code[yield_message_at] = yield_message_value; yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  yield_message_at = 0;
  do
  :: yield_message_at < 4 -> yield_message_record.yield[yield_message_at] = yield_message_value; yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Yield Message set to where it lies, so a field read out of place says so */
inline ramp_yield_message(yield_message_record, yield_message_base) {
  yield_message_at = 0;
  do
  :: yield_message_at < 4 -> yield_message_record.security_code[yield_message_at] = (yield_message_base + 0 + yield_message_at + 1) % 256; yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  yield_message_at = 0;
  do
  :: yield_message_at < 4 -> yield_message_record.yield[yield_message_at] = (yield_message_base + 4 + yield_message_at + 1) % 256; yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  skip
}

/* Yield Message to the wire, 8 bytes from where the cursor stands */
inline encode_yield_message(yield_message_record) {
  yield_message_at = 0;
  do
  :: yield_message_at < 4 -> wire[at] = yield_message_record.security_code[yield_message_at]; at = at + 1; yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  yield_message_at = 0;
  do
  :: yield_message_at < 4 -> wire[at] = yield_message_record.yield[yield_message_at]; at = at + 1; yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  skip
}

/* Yield Message off the wire, 8 bytes from where the cursor stands */
inline decode_yield_message(yield_message_record) {
  yield_message_at = 0;
  do
  :: yield_message_at < 4 -> yield_message_record.security_code[yield_message_at] = wire[at]; at = at + 1; yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  yield_message_at = 0;
  do
  :: yield_message_at < 4 -> yield_message_record.yield[yield_message_at] = wire[at]; at = at + 1; yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Yield Message is what was written, byte for byte */
inline equal_yield_message(yield_message_read, yield_message_written) {
  yield_message_at = 0;
  do
  :: yield_message_at < 4 -> assert(yield_message_read.security_code[yield_message_at] == yield_message_written.security_code[yield_message_at]); yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  yield_message_at = 0;
  do
  :: yield_message_at < 4 -> assert(yield_message_read.yield[yield_message_at] == yield_message_written.yield[yield_message_at]); yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Session Status Message: 28 bytes -------------------------------- */

/* The Trading Session Status provides information on the status of a market segment. It is sent whenever there is change of trading session. This message may be sent on a separate multicast channel from order and trade data and therefore may not be synchronized. */
typedef TradingSessionStatusMessage {
  byte market_code[4];
  byte filler_1;
  byte trading_session_sub_id;
  byte trading_ses_status;
  byte trading_ses_control_flag;
  byte filler_4[4];
  byte start_date_time[8];
  byte end_date_time[8]
};

int trading_session_status_message_at;

/* every byte of Trading Session Status Message set to one value */
inline fill_trading_session_status_message(trading_session_status_message_record, trading_session_status_message_value) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> trading_session_status_message_record.market_code[trading_session_status_message_at] = trading_session_status_message_value; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_record.filler_1 = trading_session_status_message_value;
  trading_session_status_message_record.trading_session_sub_id = trading_session_status_message_value;
  trading_session_status_message_record.trading_ses_status = trading_session_status_message_value;
  trading_session_status_message_record.trading_ses_control_flag = trading_session_status_message_value;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> trading_session_status_message_record.filler_4[trading_session_status_message_at] = trading_session_status_message_value; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.start_date_time[trading_session_status_message_at] = trading_session_status_message_value; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.end_date_time[trading_session_status_message_at] = trading_session_status_message_value; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Session Status Message set to where it lies, so a field read out of place says so */
inline ramp_trading_session_status_message(trading_session_status_message_record, trading_session_status_message_base) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> trading_session_status_message_record.market_code[trading_session_status_message_at] = (trading_session_status_message_base + 0 + trading_session_status_message_at + 1) % 256; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_record.filler_1 = (trading_session_status_message_base + 4 + 1) % 256;
  trading_session_status_message_record.trading_session_sub_id = (trading_session_status_message_base + 5 + 1) % 256;
  trading_session_status_message_record.trading_ses_status = (trading_session_status_message_base + 6 + 1) % 256;
  trading_session_status_message_record.trading_ses_control_flag = (trading_session_status_message_base + 7 + 1) % 256;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> trading_session_status_message_record.filler_4[trading_session_status_message_at] = (trading_session_status_message_base + 8 + trading_session_status_message_at + 1) % 256; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.start_date_time[trading_session_status_message_at] = (trading_session_status_message_base + 12 + trading_session_status_message_at + 1) % 256; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.end_date_time[trading_session_status_message_at] = (trading_session_status_message_base + 20 + trading_session_status_message_at + 1) % 256; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Session Status Message to the wire, 28 bytes from where the cursor stands */
inline encode_trading_session_status_message(trading_session_status_message_record) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> wire[at] = trading_session_status_message_record.market_code[trading_session_status_message_at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_session_status_message_record.filler_1; at = at + 1;
  wire[at] = trading_session_status_message_record.trading_session_sub_id; at = at + 1;
  wire[at] = trading_session_status_message_record.trading_ses_status; at = at + 1;
  wire[at] = trading_session_status_message_record.trading_ses_control_flag; at = at + 1;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> wire[at] = trading_session_status_message_record.filler_4[trading_session_status_message_at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> wire[at] = trading_session_status_message_record.start_date_time[trading_session_status_message_at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> wire[at] = trading_session_status_message_record.end_date_time[trading_session_status_message_at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Session Status Message off the wire, 28 bytes from where the cursor stands */
inline decode_trading_session_status_message(trading_session_status_message_record) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> trading_session_status_message_record.market_code[trading_session_status_message_at] = wire[at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_record.filler_1 = wire[at]; at = at + 1;
  trading_session_status_message_record.trading_session_sub_id = wire[at]; at = at + 1;
  trading_session_status_message_record.trading_ses_status = wire[at]; at = at + 1;
  trading_session_status_message_record.trading_ses_control_flag = wire[at]; at = at + 1;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> trading_session_status_message_record.filler_4[trading_session_status_message_at] = wire[at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.start_date_time[trading_session_status_message_at] = wire[at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.end_date_time[trading_session_status_message_at] = wire[at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Session Status Message is what was written, byte for byte */
inline equal_trading_session_status_message(trading_session_status_message_read, trading_session_status_message_written) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> assert(trading_session_status_message_read.market_code[trading_session_status_message_at] == trading_session_status_message_written.market_code[trading_session_status_message_at]); trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  assert(trading_session_status_message_read.filler_1 == trading_session_status_message_written.filler_1);
  assert(trading_session_status_message_read.trading_session_sub_id == trading_session_status_message_written.trading_session_sub_id);
  assert(trading_session_status_message_read.trading_ses_status == trading_session_status_message_written.trading_ses_status);
  assert(trading_session_status_message_read.trading_ses_control_flag == trading_session_status_message_written.trading_ses_control_flag);
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> assert(trading_session_status_message_read.filler_4[trading_session_status_message_at] == trading_session_status_message_written.filler_4[trading_session_status_message_at]); trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> assert(trading_session_status_message_read.start_date_time[trading_session_status_message_at] == trading_session_status_message_written.start_date_time[trading_session_status_message_at]); trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> assert(trading_session_status_message_read.end_date_time[trading_session_status_message_at] == trading_session_status_message_written.end_date_time[trading_session_status_message_at]); trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Security Status Message: 8 bytes ---------------------------------------- */

/* The Security Status message is generated at the start of the business day if the security is not available for trading, and whenever a security state changes. */
typedef SecurityStatusMessage {
  byte security_code[4];
  byte suspension_indicator;
  byte filler_3[3]
};

int security_status_message_at;

/* every byte of Security Status Message set to one value */
inline fill_security_status_message(security_status_message_record, security_status_message_value) {
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.security_code[security_status_message_at] = security_status_message_value; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_record.suspension_indicator = security_status_message_value;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 3 -> security_status_message_record.filler_3[security_status_message_at] = security_status_message_value; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Security Status Message set to where it lies, so a field read out of place says so */
inline ramp_security_status_message(security_status_message_record, security_status_message_base) {
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.security_code[security_status_message_at] = (security_status_message_base + 0 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_record.suspension_indicator = (security_status_message_base + 4 + 1) % 256;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 3 -> security_status_message_record.filler_3[security_status_message_at] = (security_status_message_base + 5 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Status Message to the wire, 8 bytes from where the cursor stands */
inline encode_security_status_message(security_status_message_record) {
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> wire[at] = security_status_message_record.security_code[security_status_message_at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  wire[at] = security_status_message_record.suspension_indicator; at = at + 1;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 3 -> wire[at] = security_status_message_record.filler_3[security_status_message_at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Status Message off the wire, 8 bytes from where the cursor stands */
inline decode_security_status_message(security_status_message_record) {
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.security_code[security_status_message_at] = wire[at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_record.suspension_indicator = wire[at]; at = at + 1;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 3 -> security_status_message_record.filler_3[security_status_message_at] = wire[at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Security Status Message is what was written, byte for byte */
inline equal_security_status_message(security_status_message_read, security_status_message_written) {
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> assert(security_status_message_read.security_code[security_status_message_at] == security_status_message_written.security_code[security_status_message_at]); security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  assert(security_status_message_read.suspension_indicator == security_status_message_written.suspension_indicator);
  security_status_message_at = 0;
  do
  :: security_status_message_at < 3 -> assert(security_status_message_read.filler_3[security_status_message_at] == security_status_message_written.filler_3[security_status_message_at]); security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Stock Connect Daily Quota Balance Message: 20 bytes --------------------- */

/* Provides updates on the Northbound Daily Quota Balance (DQB) for Shanghai-Hong Kong Stock Connect and Shenzhen-Hong Kong Stock Connect separately. Updates disseminated around every 5 seconds during trading hours. */
typedef StockConnectDailyQuotaBalanceMessage {
  byte stock_connect_market[2];
  byte trading_direction[2];
  byte daily_quota_balance[8];
  byte daily_quota_balance_time[8]
};

int stock_connect_daily_quota_balance_message_at;

/* every byte of Stock Connect Daily Quota Balance Message set to one value */
inline fill_stock_connect_daily_quota_balance_message(stock_connect_daily_quota_balance_message_record, stock_connect_daily_quota_balance_message_value) {
  stock_connect_daily_quota_balance_message_at = 0;
  do
  :: stock_connect_daily_quota_balance_message_at < 2 -> stock_connect_daily_quota_balance_message_record.stock_connect_market[stock_connect_daily_quota_balance_message_at] = stock_connect_daily_quota_balance_message_value; stock_connect_daily_quota_balance_message_at = stock_connect_daily_quota_balance_message_at + 1
  :: else -> break
  od;
  stock_connect_daily_quota_balance_message_at = 0;
  do
  :: stock_connect_daily_quota_balance_message_at < 2 -> stock_connect_daily_quota_balance_message_record.trading_direction[stock_connect_daily_quota_balance_message_at] = stock_connect_daily_quota_balance_message_value; stock_connect_daily_quota_balance_message_at = stock_connect_daily_quota_balance_message_at + 1
  :: else -> break
  od;
  stock_connect_daily_quota_balance_message_at = 0;
  do
  :: stock_connect_daily_quota_balance_message_at < 8 -> stock_connect_daily_quota_balance_message_record.daily_quota_balance[stock_connect_daily_quota_balance_message_at] = stock_connect_daily_quota_balance_message_value; stock_connect_daily_quota_balance_message_at = stock_connect_daily_quota_balance_message_at + 1
  :: else -> break
  od;
  stock_connect_daily_quota_balance_message_at = 0;
  do
  :: stock_connect_daily_quota_balance_message_at < 8 -> stock_connect_daily_quota_balance_message_record.daily_quota_balance_time[stock_connect_daily_quota_balance_message_at] = stock_connect_daily_quota_balance_message_value; stock_connect_daily_quota_balance_message_at = stock_connect_daily_quota_balance_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Stock Connect Daily Quota Balance Message set to where it lies, so a field read out of place says so */
inline ramp_stock_connect_daily_quota_balance_message(stock_connect_daily_quota_balance_message_record, stock_connect_daily_quota_balance_message_base) {
  stock_connect_daily_quota_balance_message_at = 0;
  do
  :: stock_connect_daily_quota_balance_message_at < 2 -> stock_connect_daily_quota_balance_message_record.stock_connect_market[stock_connect_daily_quota_balance_message_at] = (stock_connect_daily_quota_balance_message_base + 0 + stock_connect_daily_quota_balance_message_at + 1) % 256; stock_connect_daily_quota_balance_message_at = stock_connect_daily_quota_balance_message_at + 1
  :: else -> break
  od;
  stock_connect_daily_quota_balance_message_at = 0;
  do
  :: stock_connect_daily_quota_balance_message_at < 2 -> stock_connect_daily_quota_balance_message_record.trading_direction[stock_connect_daily_quota_balance_message_at] = (stock_connect_daily_quota_balance_message_base + 2 + stock_connect_daily_quota_balance_message_at + 1) % 256; stock_connect_daily_quota_balance_message_at = stock_connect_daily_quota_balance_message_at + 1
  :: else -> break
  od;
  stock_connect_daily_quota_balance_message_at = 0;
  do
  :: stock_connect_daily_quota_balance_message_at < 8 -> stock_connect_daily_quota_balance_message_record.daily_quota_balance[stock_connect_daily_quota_balance_message_at] = (stock_connect_daily_quota_balance_message_base + 4 + stock_connect_daily_quota_balance_message_at + 1) % 256; stock_connect_daily_quota_balance_message_at = stock_connect_daily_quota_balance_message_at + 1
  :: else -> break
  od;
  stock_connect_daily_quota_balance_message_at = 0;
  do
  :: stock_connect_daily_quota_balance_message_at < 8 -> stock_connect_daily_quota_balance_message_record.daily_quota_balance_time[stock_connect_daily_quota_balance_message_at] = (stock_connect_daily_quota_balance_message_base + 12 + stock_connect_daily_quota_balance_message_at + 1) % 256; stock_connect_daily_quota_balance_message_at = stock_connect_daily_quota_balance_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Connect Daily Quota Balance Message to the wire, 20 bytes from where the cursor stands */
inline encode_stock_connect_daily_quota_balance_message(stock_connect_daily_quota_balance_message_record) {
  stock_connect_daily_quota_balance_message_at = 0;
  do
  :: stock_connect_daily_quota_balance_message_at < 2 -> wire[at] = stock_connect_daily_quota_balance_message_record.stock_connect_market[stock_connect_daily_quota_balance_message_at]; at = at + 1; stock_connect_daily_quota_balance_message_at = stock_connect_daily_quota_balance_message_at + 1
  :: else -> break
  od;
  stock_connect_daily_quota_balance_message_at = 0;
  do
  :: stock_connect_daily_quota_balance_message_at < 2 -> wire[at] = stock_connect_daily_quota_balance_message_record.trading_direction[stock_connect_daily_quota_balance_message_at]; at = at + 1; stock_connect_daily_quota_balance_message_at = stock_connect_daily_quota_balance_message_at + 1
  :: else -> break
  od;
  stock_connect_daily_quota_balance_message_at = 0;
  do
  :: stock_connect_daily_quota_balance_message_at < 8 -> wire[at] = stock_connect_daily_quota_balance_message_record.daily_quota_balance[stock_connect_daily_quota_balance_message_at]; at = at + 1; stock_connect_daily_quota_balance_message_at = stock_connect_daily_quota_balance_message_at + 1
  :: else -> break
  od;
  stock_connect_daily_quota_balance_message_at = 0;
  do
  :: stock_connect_daily_quota_balance_message_at < 8 -> wire[at] = stock_connect_daily_quota_balance_message_record.daily_quota_balance_time[stock_connect_daily_quota_balance_message_at]; at = at + 1; stock_connect_daily_quota_balance_message_at = stock_connect_daily_quota_balance_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Connect Daily Quota Balance Message off the wire, 20 bytes from where the cursor stands */
inline decode_stock_connect_daily_quota_balance_message(stock_connect_daily_quota_balance_message_record) {
  stock_connect_daily_quota_balance_message_at = 0;
  do
  :: stock_connect_daily_quota_balance_message_at < 2 -> stock_connect_daily_quota_balance_message_record.stock_connect_market[stock_connect_daily_quota_balance_message_at] = wire[at]; at = at + 1; stock_connect_daily_quota_balance_message_at = stock_connect_daily_quota_balance_message_at + 1
  :: else -> break
  od;
  stock_connect_daily_quota_balance_message_at = 0;
  do
  :: stock_connect_daily_quota_balance_message_at < 2 -> stock_connect_daily_quota_balance_message_record.trading_direction[stock_connect_daily_quota_balance_message_at] = wire[at]; at = at + 1; stock_connect_daily_quota_balance_message_at = stock_connect_daily_quota_balance_message_at + 1
  :: else -> break
  od;
  stock_connect_daily_quota_balance_message_at = 0;
  do
  :: stock_connect_daily_quota_balance_message_at < 8 -> stock_connect_daily_quota_balance_message_record.daily_quota_balance[stock_connect_daily_quota_balance_message_at] = wire[at]; at = at + 1; stock_connect_daily_quota_balance_message_at = stock_connect_daily_quota_balance_message_at + 1
  :: else -> break
  od;
  stock_connect_daily_quota_balance_message_at = 0;
  do
  :: stock_connect_daily_quota_balance_message_at < 8 -> stock_connect_daily_quota_balance_message_record.daily_quota_balance_time[stock_connect_daily_quota_balance_message_at] = wire[at]; at = at + 1; stock_connect_daily_quota_balance_message_at = stock_connect_daily_quota_balance_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Stock Connect Daily Quota Balance Message is what was written, byte for byte */
inline equal_stock_connect_daily_quota_balance_message(stock_connect_daily_quota_balance_message_read, stock_connect_daily_quota_balance_message_written) {
  stock_connect_daily_quota_balance_message_at = 0;
  do
  :: stock_connect_daily_quota_balance_message_at < 2 -> assert(stock_connect_daily_quota_balance_message_read.stock_connect_market[stock_connect_daily_quota_balance_message_at] == stock_connect_daily_quota_balance_message_written.stock_connect_market[stock_connect_daily_quota_balance_message_at]); stock_connect_daily_quota_balance_message_at = stock_connect_daily_quota_balance_message_at + 1
  :: else -> break
  od;
  stock_connect_daily_quota_balance_message_at = 0;
  do
  :: stock_connect_daily_quota_balance_message_at < 2 -> assert(stock_connect_daily_quota_balance_message_read.trading_direction[stock_connect_daily_quota_balance_message_at] == stock_connect_daily_quota_balance_message_written.trading_direction[stock_connect_daily_quota_balance_message_at]); stock_connect_daily_quota_balance_message_at = stock_connect_daily_quota_balance_message_at + 1
  :: else -> break
  od;
  stock_connect_daily_quota_balance_message_at = 0;
  do
  :: stock_connect_daily_quota_balance_message_at < 8 -> assert(stock_connect_daily_quota_balance_message_read.daily_quota_balance[stock_connect_daily_quota_balance_message_at] == stock_connect_daily_quota_balance_message_written.daily_quota_balance[stock_connect_daily_quota_balance_message_at]); stock_connect_daily_quota_balance_message_at = stock_connect_daily_quota_balance_message_at + 1
  :: else -> break
  od;
  stock_connect_daily_quota_balance_message_at = 0;
  do
  :: stock_connect_daily_quota_balance_message_at < 8 -> assert(stock_connect_daily_quota_balance_message_read.daily_quota_balance_time[stock_connect_daily_quota_balance_message_at] == stock_connect_daily_quota_balance_message_written.daily_quota_balance_time[stock_connect_daily_quota_balance_message_at]); stock_connect_daily_quota_balance_message_at = stock_connect_daily_quota_balance_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Stock Connect Market Turnover Message: 28 bytes ------------------------- */

/* Provides aggregate turnover under Shanghai-Hong Kong and Shenzhen-Hong Kong Stock Connect programs. Aggregate turnover provided separately for Northbound and Southbound trading. For Northbound, Buy+Sell Turnover only provided after market close (typically by 16:00). For Southbound, updates disseminated around every minute during trading hours. */
typedef StockConnectMarketTurnoverMessage {
  byte stock_connect_market[2];
  byte trading_direction[2];
  byte buy_turnover[8];
  byte sell_turnover[8];
  byte buy_sell_turnover[8]
};

int stock_connect_market_turnover_message_at;

/* every byte of Stock Connect Market Turnover Message set to one value */
inline fill_stock_connect_market_turnover_message(stock_connect_market_turnover_message_record, stock_connect_market_turnover_message_value) {
  stock_connect_market_turnover_message_at = 0;
  do
  :: stock_connect_market_turnover_message_at < 2 -> stock_connect_market_turnover_message_record.stock_connect_market[stock_connect_market_turnover_message_at] = stock_connect_market_turnover_message_value; stock_connect_market_turnover_message_at = stock_connect_market_turnover_message_at + 1
  :: else -> break
  od;
  stock_connect_market_turnover_message_at = 0;
  do
  :: stock_connect_market_turnover_message_at < 2 -> stock_connect_market_turnover_message_record.trading_direction[stock_connect_market_turnover_message_at] = stock_connect_market_turnover_message_value; stock_connect_market_turnover_message_at = stock_connect_market_turnover_message_at + 1
  :: else -> break
  od;
  stock_connect_market_turnover_message_at = 0;
  do
  :: stock_connect_market_turnover_message_at < 8 -> stock_connect_market_turnover_message_record.buy_turnover[stock_connect_market_turnover_message_at] = stock_connect_market_turnover_message_value; stock_connect_market_turnover_message_at = stock_connect_market_turnover_message_at + 1
  :: else -> break
  od;
  stock_connect_market_turnover_message_at = 0;
  do
  :: stock_connect_market_turnover_message_at < 8 -> stock_connect_market_turnover_message_record.sell_turnover[stock_connect_market_turnover_message_at] = stock_connect_market_turnover_message_value; stock_connect_market_turnover_message_at = stock_connect_market_turnover_message_at + 1
  :: else -> break
  od;
  stock_connect_market_turnover_message_at = 0;
  do
  :: stock_connect_market_turnover_message_at < 8 -> stock_connect_market_turnover_message_record.buy_sell_turnover[stock_connect_market_turnover_message_at] = stock_connect_market_turnover_message_value; stock_connect_market_turnover_message_at = stock_connect_market_turnover_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Stock Connect Market Turnover Message set to where it lies, so a field read out of place says so */
inline ramp_stock_connect_market_turnover_message(stock_connect_market_turnover_message_record, stock_connect_market_turnover_message_base) {
  stock_connect_market_turnover_message_at = 0;
  do
  :: stock_connect_market_turnover_message_at < 2 -> stock_connect_market_turnover_message_record.stock_connect_market[stock_connect_market_turnover_message_at] = (stock_connect_market_turnover_message_base + 0 + stock_connect_market_turnover_message_at + 1) % 256; stock_connect_market_turnover_message_at = stock_connect_market_turnover_message_at + 1
  :: else -> break
  od;
  stock_connect_market_turnover_message_at = 0;
  do
  :: stock_connect_market_turnover_message_at < 2 -> stock_connect_market_turnover_message_record.trading_direction[stock_connect_market_turnover_message_at] = (stock_connect_market_turnover_message_base + 2 + stock_connect_market_turnover_message_at + 1) % 256; stock_connect_market_turnover_message_at = stock_connect_market_turnover_message_at + 1
  :: else -> break
  od;
  stock_connect_market_turnover_message_at = 0;
  do
  :: stock_connect_market_turnover_message_at < 8 -> stock_connect_market_turnover_message_record.buy_turnover[stock_connect_market_turnover_message_at] = (stock_connect_market_turnover_message_base + 4 + stock_connect_market_turnover_message_at + 1) % 256; stock_connect_market_turnover_message_at = stock_connect_market_turnover_message_at + 1
  :: else -> break
  od;
  stock_connect_market_turnover_message_at = 0;
  do
  :: stock_connect_market_turnover_message_at < 8 -> stock_connect_market_turnover_message_record.sell_turnover[stock_connect_market_turnover_message_at] = (stock_connect_market_turnover_message_base + 12 + stock_connect_market_turnover_message_at + 1) % 256; stock_connect_market_turnover_message_at = stock_connect_market_turnover_message_at + 1
  :: else -> break
  od;
  stock_connect_market_turnover_message_at = 0;
  do
  :: stock_connect_market_turnover_message_at < 8 -> stock_connect_market_turnover_message_record.buy_sell_turnover[stock_connect_market_turnover_message_at] = (stock_connect_market_turnover_message_base + 20 + stock_connect_market_turnover_message_at + 1) % 256; stock_connect_market_turnover_message_at = stock_connect_market_turnover_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Connect Market Turnover Message to the wire, 28 bytes from where the cursor stands */
inline encode_stock_connect_market_turnover_message(stock_connect_market_turnover_message_record) {
  stock_connect_market_turnover_message_at = 0;
  do
  :: stock_connect_market_turnover_message_at < 2 -> wire[at] = stock_connect_market_turnover_message_record.stock_connect_market[stock_connect_market_turnover_message_at]; at = at + 1; stock_connect_market_turnover_message_at = stock_connect_market_turnover_message_at + 1
  :: else -> break
  od;
  stock_connect_market_turnover_message_at = 0;
  do
  :: stock_connect_market_turnover_message_at < 2 -> wire[at] = stock_connect_market_turnover_message_record.trading_direction[stock_connect_market_turnover_message_at]; at = at + 1; stock_connect_market_turnover_message_at = stock_connect_market_turnover_message_at + 1
  :: else -> break
  od;
  stock_connect_market_turnover_message_at = 0;
  do
  :: stock_connect_market_turnover_message_at < 8 -> wire[at] = stock_connect_market_turnover_message_record.buy_turnover[stock_connect_market_turnover_message_at]; at = at + 1; stock_connect_market_turnover_message_at = stock_connect_market_turnover_message_at + 1
  :: else -> break
  od;
  stock_connect_market_turnover_message_at = 0;
  do
  :: stock_connect_market_turnover_message_at < 8 -> wire[at] = stock_connect_market_turnover_message_record.sell_turnover[stock_connect_market_turnover_message_at]; at = at + 1; stock_connect_market_turnover_message_at = stock_connect_market_turnover_message_at + 1
  :: else -> break
  od;
  stock_connect_market_turnover_message_at = 0;
  do
  :: stock_connect_market_turnover_message_at < 8 -> wire[at] = stock_connect_market_turnover_message_record.buy_sell_turnover[stock_connect_market_turnover_message_at]; at = at + 1; stock_connect_market_turnover_message_at = stock_connect_market_turnover_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Connect Market Turnover Message off the wire, 28 bytes from where the cursor stands */
inline decode_stock_connect_market_turnover_message(stock_connect_market_turnover_message_record) {
  stock_connect_market_turnover_message_at = 0;
  do
  :: stock_connect_market_turnover_message_at < 2 -> stock_connect_market_turnover_message_record.stock_connect_market[stock_connect_market_turnover_message_at] = wire[at]; at = at + 1; stock_connect_market_turnover_message_at = stock_connect_market_turnover_message_at + 1
  :: else -> break
  od;
  stock_connect_market_turnover_message_at = 0;
  do
  :: stock_connect_market_turnover_message_at < 2 -> stock_connect_market_turnover_message_record.trading_direction[stock_connect_market_turnover_message_at] = wire[at]; at = at + 1; stock_connect_market_turnover_message_at = stock_connect_market_turnover_message_at + 1
  :: else -> break
  od;
  stock_connect_market_turnover_message_at = 0;
  do
  :: stock_connect_market_turnover_message_at < 8 -> stock_connect_market_turnover_message_record.buy_turnover[stock_connect_market_turnover_message_at] = wire[at]; at = at + 1; stock_connect_market_turnover_message_at = stock_connect_market_turnover_message_at + 1
  :: else -> break
  od;
  stock_connect_market_turnover_message_at = 0;
  do
  :: stock_connect_market_turnover_message_at < 8 -> stock_connect_market_turnover_message_record.sell_turnover[stock_connect_market_turnover_message_at] = wire[at]; at = at + 1; stock_connect_market_turnover_message_at = stock_connect_market_turnover_message_at + 1
  :: else -> break
  od;
  stock_connect_market_turnover_message_at = 0;
  do
  :: stock_connect_market_turnover_message_at < 8 -> stock_connect_market_turnover_message_record.buy_sell_turnover[stock_connect_market_turnover_message_at] = wire[at]; at = at + 1; stock_connect_market_turnover_message_at = stock_connect_market_turnover_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Stock Connect Market Turnover Message is what was written, byte for byte */
inline equal_stock_connect_market_turnover_message(stock_connect_market_turnover_message_read, stock_connect_market_turnover_message_written) {
  stock_connect_market_turnover_message_at = 0;
  do
  :: stock_connect_market_turnover_message_at < 2 -> assert(stock_connect_market_turnover_message_read.stock_connect_market[stock_connect_market_turnover_message_at] == stock_connect_market_turnover_message_written.stock_connect_market[stock_connect_market_turnover_message_at]); stock_connect_market_turnover_message_at = stock_connect_market_turnover_message_at + 1
  :: else -> break
  od;
  stock_connect_market_turnover_message_at = 0;
  do
  :: stock_connect_market_turnover_message_at < 2 -> assert(stock_connect_market_turnover_message_read.trading_direction[stock_connect_market_turnover_message_at] == stock_connect_market_turnover_message_written.trading_direction[stock_connect_market_turnover_message_at]); stock_connect_market_turnover_message_at = stock_connect_market_turnover_message_at + 1
  :: else -> break
  od;
  stock_connect_market_turnover_message_at = 0;
  do
  :: stock_connect_market_turnover_message_at < 8 -> assert(stock_connect_market_turnover_message_read.buy_turnover[stock_connect_market_turnover_message_at] == stock_connect_market_turnover_message_written.buy_turnover[stock_connect_market_turnover_message_at]); stock_connect_market_turnover_message_at = stock_connect_market_turnover_message_at + 1
  :: else -> break
  od;
  stock_connect_market_turnover_message_at = 0;
  do
  :: stock_connect_market_turnover_message_at < 8 -> assert(stock_connect_market_turnover_message_read.sell_turnover[stock_connect_market_turnover_message_at] == stock_connect_market_turnover_message_written.sell_turnover[stock_connect_market_turnover_message_at]); stock_connect_market_turnover_message_at = stock_connect_market_turnover_message_at + 1
  :: else -> break
  od;
  stock_connect_market_turnover_message_at = 0;
  do
  :: stock_connect_market_turnover_message_at < 8 -> assert(stock_connect_market_turnover_message_read.buy_sell_turnover[stock_connect_market_turnover_message_at] == stock_connect_market_turnover_message_written.buy_sell_turnover[stock_connect_market_turnover_message_at]); stock_connect_market_turnover_message_at = stock_connect_market_turnover_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Message: 28 bytes ------------------------------------------------- */

/* The Trade message is generated each time a trade has been performed. */
typedef TradeMessage {
  byte security_code[4];
  byte trade_id[4];
  byte price[4];
  byte quantity[4];
  byte trd_type[2];
  byte filler_2[2];
  byte trade_time[8]
};

int trade_message_at;

/* every byte of Trade Message set to one value */
inline fill_trade_message(trade_message_record, trade_message_value) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.security_code[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.trade_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.price[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.quantity[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.trd_type[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.filler_2[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.trade_time[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Message set to where it lies, so a field read out of place says so */
inline ramp_trade_message(trade_message_record, trade_message_base) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.security_code[trade_message_at] = (trade_message_base + 0 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.trade_id[trade_message_at] = (trade_message_base + 4 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.price[trade_message_at] = (trade_message_base + 8 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.quantity[trade_message_at] = (trade_message_base + 12 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.trd_type[trade_message_at] = (trade_message_base + 16 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.filler_2[trade_message_at] = (trade_message_base + 18 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.trade_time[trade_message_at] = (trade_message_base + 20 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message to the wire, 28 bytes from where the cursor stands */
inline encode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.security_code[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.trade_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.price[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.quantity[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> wire[at] = trade_message_record.trd_type[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> wire[at] = trade_message_record.filler_2[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.trade_time[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message off the wire, 28 bytes from where the cursor stands */
inline decode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.security_code[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.trade_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.price[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.quantity[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.trd_type[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.filler_2[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.trade_time[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Message is what was written, byte for byte */
inline equal_trade_message(trade_message_read, trade_message_written) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.security_code[trade_message_at] == trade_message_written.security_code[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.trade_id[trade_message_at] == trade_message_written.trade_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.price[trade_message_at] == trade_message_written.price[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.quantity[trade_message_at] == trade_message_written.quantity[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> assert(trade_message_read.trd_type[trade_message_at] == trade_message_written.trd_type[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> assert(trade_message_read.filler_2[trade_message_at] == trade_message_written.filler_2[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.trade_time[trade_message_at] == trade_message_written.trade_time[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Cancel Message: 8 bytes ------------------------------------------- */

/* The Trade Cancel message is generated when a trade has been cancelled. */
typedef TradeCancelMessage {
  byte security_code[4];
  byte trade_id[4]
};

int trade_cancel_message_at;

/* every byte of Trade Cancel Message set to one value */
inline fill_trade_cancel_message(trade_cancel_message_record, trade_cancel_message_value) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.security_code[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.trade_id[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancel_message(trade_cancel_message_record, trade_cancel_message_base) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.security_code[trade_cancel_message_at] = (trade_cancel_message_base + 0 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.trade_id[trade_cancel_message_at] = (trade_cancel_message_base + 4 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel Message to the wire, 8 bytes from where the cursor stands */
inline encode_trade_cancel_message(trade_cancel_message_record) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> wire[at] = trade_cancel_message_record.security_code[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> wire[at] = trade_cancel_message_record.trade_id[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel Message off the wire, 8 bytes from where the cursor stands */
inline decode_trade_cancel_message(trade_cancel_message_record) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.security_code[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.trade_id[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Cancel Message is what was written, byte for byte */
inline equal_trade_cancel_message(trade_cancel_message_read, trade_cancel_message_written) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> assert(trade_cancel_message_read.security_code[trade_cancel_message_at] == trade_cancel_message_written.security_code[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> assert(trade_cancel_message_read.trade_id[trade_cancel_message_at] == trade_cancel_message_written.trade_id[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Ticker Message: 32 bytes ------------------------------------------ */

/* The Trade Ticker is an aggregation of several trades into one message, combining quantities of subsequent trades made on a given instrument at a given fixed price. */
typedef TradeTickerMessage {
  byte security_code[4];
  byte ticker_id[4];
  byte price[4];
  byte aggregate_quantity[8];
  byte trade_time[8];
  byte trd_type[2];
  byte trd_cancel_flag;
  byte filler_1
};

int trade_ticker_message_at;

/* every byte of Trade Ticker Message set to one value */
inline fill_trade_ticker_message(trade_ticker_message_record, trade_ticker_message_value) {
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.security_code[trade_ticker_message_at] = trade_ticker_message_value; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.ticker_id[trade_ticker_message_at] = trade_ticker_message_value; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.price[trade_ticker_message_at] = trade_ticker_message_value; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.aggregate_quantity[trade_ticker_message_at] = trade_ticker_message_value; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.trade_time[trade_ticker_message_at] = trade_ticker_message_value; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 2 -> trade_ticker_message_record.trd_type[trade_ticker_message_at] = trade_ticker_message_value; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_record.trd_cancel_flag = trade_ticker_message_value;
  trade_ticker_message_record.filler_1 = trade_ticker_message_value;
  skip
}

/* each byte of Trade Ticker Message set to where it lies, so a field read out of place says so */
inline ramp_trade_ticker_message(trade_ticker_message_record, trade_ticker_message_base) {
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.security_code[trade_ticker_message_at] = (trade_ticker_message_base + 0 + trade_ticker_message_at + 1) % 256; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.ticker_id[trade_ticker_message_at] = (trade_ticker_message_base + 4 + trade_ticker_message_at + 1) % 256; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.price[trade_ticker_message_at] = (trade_ticker_message_base + 8 + trade_ticker_message_at + 1) % 256; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.aggregate_quantity[trade_ticker_message_at] = (trade_ticker_message_base + 12 + trade_ticker_message_at + 1) % 256; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.trade_time[trade_ticker_message_at] = (trade_ticker_message_base + 20 + trade_ticker_message_at + 1) % 256; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 2 -> trade_ticker_message_record.trd_type[trade_ticker_message_at] = (trade_ticker_message_base + 28 + trade_ticker_message_at + 1) % 256; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_record.trd_cancel_flag = (trade_ticker_message_base + 30 + 1) % 256;
  trade_ticker_message_record.filler_1 = (trade_ticker_message_base + 31 + 1) % 256;
  skip
}

/* Trade Ticker Message to the wire, 32 bytes from where the cursor stands */
inline encode_trade_ticker_message(trade_ticker_message_record) {
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> wire[at] = trade_ticker_message_record.security_code[trade_ticker_message_at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> wire[at] = trade_ticker_message_record.ticker_id[trade_ticker_message_at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> wire[at] = trade_ticker_message_record.price[trade_ticker_message_at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> wire[at] = trade_ticker_message_record.aggregate_quantity[trade_ticker_message_at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> wire[at] = trade_ticker_message_record.trade_time[trade_ticker_message_at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 2 -> wire[at] = trade_ticker_message_record.trd_type[trade_ticker_message_at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_ticker_message_record.trd_cancel_flag; at = at + 1;
  wire[at] = trade_ticker_message_record.filler_1; at = at + 1;
  skip
}

/* Trade Ticker Message off the wire, 32 bytes from where the cursor stands */
inline decode_trade_ticker_message(trade_ticker_message_record) {
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.security_code[trade_ticker_message_at] = wire[at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.ticker_id[trade_ticker_message_at] = wire[at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.price[trade_ticker_message_at] = wire[at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.aggregate_quantity[trade_ticker_message_at] = wire[at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.trade_time[trade_ticker_message_at] = wire[at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 2 -> trade_ticker_message_record.trd_type[trade_ticker_message_at] = wire[at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_record.trd_cancel_flag = wire[at]; at = at + 1;
  trade_ticker_message_record.filler_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Ticker Message is what was written, byte for byte */
inline equal_trade_ticker_message(trade_ticker_message_read, trade_ticker_message_written) {
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> assert(trade_ticker_message_read.security_code[trade_ticker_message_at] == trade_ticker_message_written.security_code[trade_ticker_message_at]); trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> assert(trade_ticker_message_read.ticker_id[trade_ticker_message_at] == trade_ticker_message_written.ticker_id[trade_ticker_message_at]); trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> assert(trade_ticker_message_read.price[trade_ticker_message_at] == trade_ticker_message_written.price[trade_ticker_message_at]); trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> assert(trade_ticker_message_read.aggregate_quantity[trade_ticker_message_at] == trade_ticker_message_written.aggregate_quantity[trade_ticker_message_at]); trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> assert(trade_ticker_message_read.trade_time[trade_ticker_message_at] == trade_ticker_message_written.trade_time[trade_ticker_message_at]); trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 2 -> assert(trade_ticker_message_read.trd_type[trade_ticker_message_at] == trade_ticker_message_written.trd_type[trade_ticker_message_at]); trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  assert(trade_ticker_message_read.trd_cancel_flag == trade_ticker_message_written.trd_cancel_flag);
  assert(trade_ticker_message_read.filler_1 == trade_ticker_message_written.filler_1);
  skip
}

/* ---- Vcm Trigger Message: 32 bytes ------------------------------------------- */

/* The VCM Trigger message is generated whenever a cooling off period is triggered by Volatility Control Mechanism (VCM). */
typedef VcmTriggerMessage {
  byte security_code[4];
  byte cooling_off_start_time[8];
  byte cooling_off_end_time[8];
  byte vcm_reference_price[4];
  byte vcm_lower_price[4];
  byte vcm_upper_price[4]
};

int vcm_trigger_message_at;

/* every byte of Vcm Trigger Message set to one value */
inline fill_vcm_trigger_message(vcm_trigger_message_record, vcm_trigger_message_value) {
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> vcm_trigger_message_record.security_code[vcm_trigger_message_at] = vcm_trigger_message_value; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 8 -> vcm_trigger_message_record.cooling_off_start_time[vcm_trigger_message_at] = vcm_trigger_message_value; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 8 -> vcm_trigger_message_record.cooling_off_end_time[vcm_trigger_message_at] = vcm_trigger_message_value; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> vcm_trigger_message_record.vcm_reference_price[vcm_trigger_message_at] = vcm_trigger_message_value; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> vcm_trigger_message_record.vcm_lower_price[vcm_trigger_message_at] = vcm_trigger_message_value; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> vcm_trigger_message_record.vcm_upper_price[vcm_trigger_message_at] = vcm_trigger_message_value; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Vcm Trigger Message set to where it lies, so a field read out of place says so */
inline ramp_vcm_trigger_message(vcm_trigger_message_record, vcm_trigger_message_base) {
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> vcm_trigger_message_record.security_code[vcm_trigger_message_at] = (vcm_trigger_message_base + 0 + vcm_trigger_message_at + 1) % 256; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 8 -> vcm_trigger_message_record.cooling_off_start_time[vcm_trigger_message_at] = (vcm_trigger_message_base + 4 + vcm_trigger_message_at + 1) % 256; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 8 -> vcm_trigger_message_record.cooling_off_end_time[vcm_trigger_message_at] = (vcm_trigger_message_base + 12 + vcm_trigger_message_at + 1) % 256; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> vcm_trigger_message_record.vcm_reference_price[vcm_trigger_message_at] = (vcm_trigger_message_base + 20 + vcm_trigger_message_at + 1) % 256; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> vcm_trigger_message_record.vcm_lower_price[vcm_trigger_message_at] = (vcm_trigger_message_base + 24 + vcm_trigger_message_at + 1) % 256; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> vcm_trigger_message_record.vcm_upper_price[vcm_trigger_message_at] = (vcm_trigger_message_base + 28 + vcm_trigger_message_at + 1) % 256; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  skip
}

/* Vcm Trigger Message to the wire, 32 bytes from where the cursor stands */
inline encode_vcm_trigger_message(vcm_trigger_message_record) {
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> wire[at] = vcm_trigger_message_record.security_code[vcm_trigger_message_at]; at = at + 1; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 8 -> wire[at] = vcm_trigger_message_record.cooling_off_start_time[vcm_trigger_message_at]; at = at + 1; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 8 -> wire[at] = vcm_trigger_message_record.cooling_off_end_time[vcm_trigger_message_at]; at = at + 1; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> wire[at] = vcm_trigger_message_record.vcm_reference_price[vcm_trigger_message_at]; at = at + 1; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> wire[at] = vcm_trigger_message_record.vcm_lower_price[vcm_trigger_message_at]; at = at + 1; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> wire[at] = vcm_trigger_message_record.vcm_upper_price[vcm_trigger_message_at]; at = at + 1; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  skip
}

/* Vcm Trigger Message off the wire, 32 bytes from where the cursor stands */
inline decode_vcm_trigger_message(vcm_trigger_message_record) {
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> vcm_trigger_message_record.security_code[vcm_trigger_message_at] = wire[at]; at = at + 1; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 8 -> vcm_trigger_message_record.cooling_off_start_time[vcm_trigger_message_at] = wire[at]; at = at + 1; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 8 -> vcm_trigger_message_record.cooling_off_end_time[vcm_trigger_message_at] = wire[at]; at = at + 1; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> vcm_trigger_message_record.vcm_reference_price[vcm_trigger_message_at] = wire[at]; at = at + 1; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> vcm_trigger_message_record.vcm_lower_price[vcm_trigger_message_at] = wire[at]; at = at + 1; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> vcm_trigger_message_record.vcm_upper_price[vcm_trigger_message_at] = wire[at]; at = at + 1; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Vcm Trigger Message is what was written, byte for byte */
inline equal_vcm_trigger_message(vcm_trigger_message_read, vcm_trigger_message_written) {
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> assert(vcm_trigger_message_read.security_code[vcm_trigger_message_at] == vcm_trigger_message_written.security_code[vcm_trigger_message_at]); vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 8 -> assert(vcm_trigger_message_read.cooling_off_start_time[vcm_trigger_message_at] == vcm_trigger_message_written.cooling_off_start_time[vcm_trigger_message_at]); vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 8 -> assert(vcm_trigger_message_read.cooling_off_end_time[vcm_trigger_message_at] == vcm_trigger_message_written.cooling_off_end_time[vcm_trigger_message_at]); vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> assert(vcm_trigger_message_read.vcm_reference_price[vcm_trigger_message_at] == vcm_trigger_message_written.vcm_reference_price[vcm_trigger_message_at]); vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> assert(vcm_trigger_message_read.vcm_lower_price[vcm_trigger_message_at] == vcm_trigger_message_written.vcm_lower_price[vcm_trigger_message_at]); vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> assert(vcm_trigger_message_read.vcm_upper_price[vcm_trigger_message_at] == vcm_trigger_message_written.vcm_upper_price[vcm_trigger_message_at]); vcm_trigger_message_at = vcm_trigger_message_at + 1
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
    assert(at == 16);
    at = 0;
    decode_packet_header(packet_header_got);
    assert(at == 16);
    equal_packet_header(packet_header_got, packet_header_sent)
  }
}

/* Msg Header: encoded, read back, and compared */
proctype check_msg_header() {
  MsgHeader msg_header_sent;
  MsgHeader msg_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_msg_header(msg_header_sent, 0)
  :: pattern == 1 -> fill_msg_header(msg_header_sent, 32)
  :: pattern == 2 -> fill_msg_header(msg_header_sent, 255)
  :: else -> ramp_msg_header(msg_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_msg_header(msg_header_sent);
    assert(at == 4);
    at = 0;
    decode_msg_header(msg_header_got);
    assert(at == 4);
    equal_msg_header(msg_header_got, msg_header_sent)
  }
}

/* Add Odd Lot Order Message: encoded, read back, and compared */
proctype check_add_odd_lot_order_message() {
  AddOddLotOrderMessage add_odd_lot_order_message_sent;
  AddOddLotOrderMessage add_odd_lot_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_odd_lot_order_message(add_odd_lot_order_message_sent, 0)
  :: pattern == 1 -> fill_add_odd_lot_order_message(add_odd_lot_order_message_sent, 32)
  :: pattern == 2 -> fill_add_odd_lot_order_message(add_odd_lot_order_message_sent, 255)
  :: else -> ramp_add_odd_lot_order_message(add_odd_lot_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_odd_lot_order_message(add_odd_lot_order_message_sent);
    assert(at == 24);
    at = 0;
    decode_add_odd_lot_order_message(add_odd_lot_order_message_got);
    assert(at == 24);
    equal_add_odd_lot_order_message(add_odd_lot_order_message_got, add_odd_lot_order_message_sent)
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
    assert(at == 28);
    at = 0;
    decode_add_order_message(add_order_message_got);
    assert(at == 28);
    equal_add_order_message(add_order_message_got, add_order_message_sent)
  }
}

/* Closing Price Message: encoded, read back, and compared */
proctype check_closing_price_message() {
  ClosingPriceMessage closing_price_message_sent;
  ClosingPriceMessage closing_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_closing_price_message(closing_price_message_sent, 0)
  :: pattern == 1 -> fill_closing_price_message(closing_price_message_sent, 32)
  :: pattern == 2 -> fill_closing_price_message(closing_price_message_sent, 255)
  :: else -> ramp_closing_price_message(closing_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_closing_price_message(closing_price_message_sent);
    assert(at == 12);
    at = 0;
    decode_closing_price_message(closing_price_message_got);
    assert(at == 12);
    equal_closing_price_message(closing_price_message_got, closing_price_message_sent)
  }
}

/* Sequence Reset Message: encoded, read back, and compared */
proctype check_sequence_reset_message() {
  SequenceResetMessage sequence_reset_message_sent;
  SequenceResetMessage sequence_reset_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequence_reset_message(sequence_reset_message_sent, 0)
  :: pattern == 1 -> fill_sequence_reset_message(sequence_reset_message_sent, 32)
  :: pattern == 2 -> fill_sequence_reset_message(sequence_reset_message_sent, 255)
  :: else -> ramp_sequence_reset_message(sequence_reset_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequence_reset_message(sequence_reset_message_sent);
    assert(at == 4);
    at = 0;
    decode_sequence_reset_message(sequence_reset_message_got);
    assert(at == 4);
    equal_sequence_reset_message(sequence_reset_message_got, sequence_reset_message_sent)
  }
}

/* Disaster Recovery Signal Message: encoded, read back, and compared */
proctype check_disaster_recovery_signal_message() {
  DisasterRecoverySignalMessage disaster_recovery_signal_message_sent;
  DisasterRecoverySignalMessage disaster_recovery_signal_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_disaster_recovery_signal_message(disaster_recovery_signal_message_sent, 0)
  :: pattern == 1 -> fill_disaster_recovery_signal_message(disaster_recovery_signal_message_sent, 32)
  :: pattern == 2 -> fill_disaster_recovery_signal_message(disaster_recovery_signal_message_sent, 255)
  :: else -> ramp_disaster_recovery_signal_message(disaster_recovery_signal_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_disaster_recovery_signal_message(disaster_recovery_signal_message_sent);
    assert(at == 4);
    at = 0;
    decode_disaster_recovery_signal_message(disaster_recovery_signal_message_got);
    assert(at == 4);
    equal_disaster_recovery_signal_message(disaster_recovery_signal_message_got, disaster_recovery_signal_message_sent)
  }
}

/* Delete Odd Lot Order Message: encoded, read back, and compared */
proctype check_delete_odd_lot_order_message() {
  DeleteOddLotOrderMessage delete_odd_lot_order_message_sent;
  DeleteOddLotOrderMessage delete_odd_lot_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_delete_odd_lot_order_message(delete_odd_lot_order_message_sent, 0)
  :: pattern == 1 -> fill_delete_odd_lot_order_message(delete_odd_lot_order_message_sent, 32)
  :: pattern == 2 -> fill_delete_odd_lot_order_message(delete_odd_lot_order_message_sent, 255)
  :: else -> ramp_delete_odd_lot_order_message(delete_odd_lot_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_delete_odd_lot_order_message(delete_odd_lot_order_message_sent);
    assert(at == 16);
    at = 0;
    decode_delete_odd_lot_order_message(delete_odd_lot_order_message_got);
    assert(at == 16);
    equal_delete_odd_lot_order_message(delete_odd_lot_order_message_got, delete_odd_lot_order_message_sent)
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
    assert(at == 16);
    at = 0;
    decode_delete_order_message(delete_order_message_got);
    assert(at == 16);
    equal_delete_order_message(delete_order_message_got, delete_order_message_sent)
  }
}

/* Index Definition Message: encoded, read back, and compared */
proctype check_index_definition_message() {
  IndexDefinitionMessage index_definition_message_sent;
  IndexDefinitionMessage index_definition_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_definition_message(index_definition_message_sent, 0)
  :: pattern == 1 -> fill_index_definition_message(index_definition_message_sent, 32)
  :: pattern == 2 -> fill_index_definition_message(index_definition_message_sent, 255)
  :: else -> ramp_index_definition_message(index_definition_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_definition_message(index_definition_message_sent);
    assert(at == 16);
    at = 0;
    decode_index_definition_message(index_definition_message_got);
    assert(at == 16);
    equal_index_definition_message(index_definition_message_got, index_definition_message_sent)
  }
}

/* Index Data Message: encoded, read back, and compared */
proctype check_index_data_message() {
  IndexDataMessage index_data_message_sent;
  IndexDataMessage index_data_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_data_message(index_data_message_sent, 0)
  :: pattern == 1 -> fill_index_data_message(index_data_message_sent, 32)
  :: pattern == 2 -> fill_index_data_message(index_data_message_sent, 255)
  :: else -> ramp_index_data_message(index_data_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_data_message(index_data_message_sent);
    assert(at == 108);
    at = 0;
    decode_index_data_message(index_data_message_got);
    assert(at == 108);
    equal_index_data_message(index_data_message_got, index_data_message_sent)
  }
}

/* Indicative Equilibrium Price Message: encoded, read back, and compared */
proctype check_indicative_equilibrium_price_message() {
  IndicativeEquilibriumPriceMessage indicative_equilibrium_price_message_sent;
  IndicativeEquilibriumPriceMessage indicative_equilibrium_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_indicative_equilibrium_price_message(indicative_equilibrium_price_message_sent, 0)
  :: pattern == 1 -> fill_indicative_equilibrium_price_message(indicative_equilibrium_price_message_sent, 32)
  :: pattern == 2 -> fill_indicative_equilibrium_price_message(indicative_equilibrium_price_message_sent, 255)
  :: else -> ramp_indicative_equilibrium_price_message(indicative_equilibrium_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_indicative_equilibrium_price_message(indicative_equilibrium_price_message_sent);
    assert(at == 16);
    at = 0;
    decode_indicative_equilibrium_price_message(indicative_equilibrium_price_message_got);
    assert(at == 16);
    equal_indicative_equilibrium_price_message(indicative_equilibrium_price_message_got, indicative_equilibrium_price_message_sent)
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
    assert(at == 24);
    at = 0;
    decode_modify_order_message(modify_order_message_got);
    assert(at == 24);
    equal_modify_order_message(modify_order_message_got, modify_order_message_sent)
  }
}

/* Nominal Price Message: encoded, read back, and compared */
proctype check_nominal_price_message() {
  NominalPriceMessage nominal_price_message_sent;
  NominalPriceMessage nominal_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_nominal_price_message(nominal_price_message_sent, 0)
  :: pattern == 1 -> fill_nominal_price_message(nominal_price_message_sent, 32)
  :: pattern == 2 -> fill_nominal_price_message(nominal_price_message_sent, 255)
  :: else -> ramp_nominal_price_message(nominal_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_nominal_price_message(nominal_price_message_sent);
    assert(at == 8);
    at = 0;
    decode_nominal_price_message(nominal_price_message_got);
    assert(at == 8);
    equal_nominal_price_message(nominal_price_message_got, nominal_price_message_sent)
  }
}

/* Order Imbalance Message: encoded, read back, and compared */
proctype check_order_imbalance_message() {
  OrderImbalanceMessage order_imbalance_message_sent;
  OrderImbalanceMessage order_imbalance_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_imbalance_message(order_imbalance_message_sent, 0)
  :: pattern == 1 -> fill_order_imbalance_message(order_imbalance_message_sent, 32)
  :: pattern == 2 -> fill_order_imbalance_message(order_imbalance_message_sent, 255)
  :: else -> ramp_order_imbalance_message(order_imbalance_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_imbalance_message(order_imbalance_message_sent);
    assert(at == 16);
    at = 0;
    decode_order_imbalance_message(order_imbalance_message_got);
    assert(at == 16);
    equal_order_imbalance_message(order_imbalance_message_got, order_imbalance_message_sent)
  }
}

/* Market Definition Message: encoded, read back, and compared */
proctype check_market_definition_message() {
  MarketDefinitionMessage market_definition_message_sent;
  MarketDefinitionMessage market_definition_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_definition_message(market_definition_message_sent, 0)
  :: pattern == 1 -> fill_market_definition_message(market_definition_message_sent, 32)
  :: pattern == 2 -> fill_market_definition_message(market_definition_message_sent, 255)
  :: else -> ramp_market_definition_message(market_definition_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_definition_message(market_definition_message_sent);
    assert(at == 36);
    at = 0;
    decode_market_definition_message(market_definition_message_got);
    assert(at == 36);
    equal_market_definition_message(market_definition_message_got, market_definition_message_sent)
  }
}

/* Currency Rate Message: encoded, read back, and compared */
proctype check_currency_rate_message() {
  CurrencyRateMessage currency_rate_message_sent;
  CurrencyRateMessage currency_rate_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_currency_rate_message(currency_rate_message_sent, 0)
  :: pattern == 1 -> fill_currency_rate_message(currency_rate_message_sent, 32)
  :: pattern == 2 -> fill_currency_rate_message(currency_rate_message_sent, 255)
  :: else -> ramp_currency_rate_message(currency_rate_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_currency_rate_message(currency_rate_message_sent);
    assert(at == 12);
    at = 0;
    decode_currency_rate_message(currency_rate_message_got);
    assert(at == 12);
    equal_currency_rate_message(currency_rate_message_got, currency_rate_message_sent)
  }
}

/* Reference Price Message: encoded, read back, and compared */
proctype check_reference_price_message() {
  ReferencePriceMessage reference_price_message_sent;
  ReferencePriceMessage reference_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reference_price_message(reference_price_message_sent, 0)
  :: pattern == 1 -> fill_reference_price_message(reference_price_message_sent, 32)
  :: pattern == 2 -> fill_reference_price_message(reference_price_message_sent, 255)
  :: else -> ramp_reference_price_message(reference_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reference_price_message(reference_price_message_sent);
    assert(at == 16);
    at = 0;
    decode_reference_price_message(reference_price_message_got);
    assert(at == 16);
    equal_reference_price_message(reference_price_message_got, reference_price_message_sent)
  }
}

/* Refresh Complete Message: encoded, read back, and compared */
proctype check_refresh_complete_message() {
  RefreshCompleteMessage refresh_complete_message_sent;
  RefreshCompleteMessage refresh_complete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_refresh_complete_message(refresh_complete_message_sent, 0)
  :: pattern == 1 -> fill_refresh_complete_message(refresh_complete_message_sent, 32)
  :: pattern == 2 -> fill_refresh_complete_message(refresh_complete_message_sent, 255)
  :: else -> ramp_refresh_complete_message(refresh_complete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_refresh_complete_message(refresh_complete_message_sent);
    assert(at == 4);
    at = 0;
    decode_refresh_complete_message(refresh_complete_message_got);
    assert(at == 4);
    equal_refresh_complete_message(refresh_complete_message_got, refresh_complete_message_sent)
  }
}

/* Logon Message: encoded, read back, and compared */
proctype check_logon_message() {
  LogonMessage logon_message_sent;
  LogonMessage logon_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logon_message(logon_message_sent, 0)
  :: pattern == 1 -> fill_logon_message(logon_message_sent, 32)
  :: pattern == 2 -> fill_logon_message(logon_message_sent, 255)
  :: else -> ramp_logon_message(logon_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logon_message(logon_message_sent);
    assert(at == 12);
    at = 0;
    decode_logon_message(logon_message_got);
    assert(at == 12);
    equal_logon_message(logon_message_got, logon_message_sent)
  }
}

/* Logon Response Message: encoded, read back, and compared */
proctype check_logon_response_message() {
  LogonResponseMessage logon_response_message_sent;
  LogonResponseMessage logon_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logon_response_message(logon_response_message_sent, 0)
  :: pattern == 1 -> fill_logon_response_message(logon_response_message_sent, 32)
  :: pattern == 2 -> fill_logon_response_message(logon_response_message_sent, 255)
  :: else -> ramp_logon_response_message(logon_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logon_response_message(logon_response_message_sent);
    assert(at == 4);
    at = 0;
    decode_logon_response_message(logon_response_message_got);
    assert(at == 4);
    equal_logon_response_message(logon_response_message_got, logon_response_message_sent)
  }
}

/* Retransmission Request Message: encoded, read back, and compared */
proctype check_retransmission_request_message() {
  RetransmissionRequestMessage retransmission_request_message_sent;
  RetransmissionRequestMessage retransmission_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmission_request_message(retransmission_request_message_sent, 0)
  :: pattern == 1 -> fill_retransmission_request_message(retransmission_request_message_sent, 32)
  :: pattern == 2 -> fill_retransmission_request_message(retransmission_request_message_sent, 255)
  :: else -> ramp_retransmission_request_message(retransmission_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmission_request_message(retransmission_request_message_sent);
    assert(at == 12);
    at = 0;
    decode_retransmission_request_message(retransmission_request_message_got);
    assert(at == 12);
    equal_retransmission_request_message(retransmission_request_message_got, retransmission_request_message_sent)
  }
}

/* Retransmission Response Message: encoded, read back, and compared */
proctype check_retransmission_response_message() {
  RetransmissionResponseMessage retransmission_response_message_sent;
  RetransmissionResponseMessage retransmission_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmission_response_message(retransmission_response_message_sent, 0)
  :: pattern == 1 -> fill_retransmission_response_message(retransmission_response_message_sent, 32)
  :: pattern == 2 -> fill_retransmission_response_message(retransmission_response_message_sent, 255)
  :: else -> ramp_retransmission_response_message(retransmission_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmission_response_message(retransmission_response_message_sent);
    assert(at == 12);
    at = 0;
    decode_retransmission_response_message(retransmission_response_message_got);
    assert(at == 12);
    equal_retransmission_response_message(retransmission_response_message_got, retransmission_response_message_sent)
  }
}

/* Statistics Message: encoded, read back, and compared */
proctype check_statistics_message() {
  StatisticsMessage statistics_message_sent;
  StatisticsMessage statistics_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_statistics_message(statistics_message_sent, 0)
  :: pattern == 1 -> fill_statistics_message(statistics_message_sent, 32)
  :: pattern == 2 -> fill_statistics_message(statistics_message_sent, 255)
  :: else -> ramp_statistics_message(statistics_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_statistics_message(statistics_message_sent);
    assert(at == 48);
    at = 0;
    decode_statistics_message(statistics_message_got);
    assert(at == 48);
    equal_statistics_message(statistics_message_got, statistics_message_sent)
  }
}

/* Market Turnover Message: encoded, read back, and compared */
proctype check_market_turnover_message() {
  MarketTurnoverMessage market_turnover_message_sent;
  MarketTurnoverMessage market_turnover_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_turnover_message(market_turnover_message_sent, 0)
  :: pattern == 1 -> fill_market_turnover_message(market_turnover_message_sent, 32)
  :: pattern == 2 -> fill_market_turnover_message(market_turnover_message_sent, 255)
  :: else -> ramp_market_turnover_message(market_turnover_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_turnover_message(market_turnover_message_sent);
    assert(at == 16);
    at = 0;
    decode_market_turnover_message(market_turnover_message_got);
    assert(at == 16);
    equal_market_turnover_message(market_turnover_message_got, market_turnover_message_sent)
  }
}

/* Yield Message: encoded, read back, and compared */
proctype check_yield_message() {
  YieldMessage yield_message_sent;
  YieldMessage yield_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_yield_message(yield_message_sent, 0)
  :: pattern == 1 -> fill_yield_message(yield_message_sent, 32)
  :: pattern == 2 -> fill_yield_message(yield_message_sent, 255)
  :: else -> ramp_yield_message(yield_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_yield_message(yield_message_sent);
    assert(at == 8);
    at = 0;
    decode_yield_message(yield_message_got);
    assert(at == 8);
    equal_yield_message(yield_message_got, yield_message_sent)
  }
}

/* Trading Session Status Message: encoded, read back, and compared */
proctype check_trading_session_status_message() {
  TradingSessionStatusMessage trading_session_status_message_sent;
  TradingSessionStatusMessage trading_session_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_session_status_message(trading_session_status_message_sent, 0)
  :: pattern == 1 -> fill_trading_session_status_message(trading_session_status_message_sent, 32)
  :: pattern == 2 -> fill_trading_session_status_message(trading_session_status_message_sent, 255)
  :: else -> ramp_trading_session_status_message(trading_session_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_session_status_message(trading_session_status_message_sent);
    assert(at == 28);
    at = 0;
    decode_trading_session_status_message(trading_session_status_message_got);
    assert(at == 28);
    equal_trading_session_status_message(trading_session_status_message_got, trading_session_status_message_sent)
  }
}

/* Security Status Message: encoded, read back, and compared */
proctype check_security_status_message() {
  SecurityStatusMessage security_status_message_sent;
  SecurityStatusMessage security_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_security_status_message(security_status_message_sent, 0)
  :: pattern == 1 -> fill_security_status_message(security_status_message_sent, 32)
  :: pattern == 2 -> fill_security_status_message(security_status_message_sent, 255)
  :: else -> ramp_security_status_message(security_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_security_status_message(security_status_message_sent);
    assert(at == 8);
    at = 0;
    decode_security_status_message(security_status_message_got);
    assert(at == 8);
    equal_security_status_message(security_status_message_got, security_status_message_sent)
  }
}

/* Stock Connect Daily Quota Balance Message: encoded, read back, and compared */
proctype check_stock_connect_daily_quota_balance_message() {
  StockConnectDailyQuotaBalanceMessage stock_connect_daily_quota_balance_message_sent;
  StockConnectDailyQuotaBalanceMessage stock_connect_daily_quota_balance_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stock_connect_daily_quota_balance_message(stock_connect_daily_quota_balance_message_sent, 0)
  :: pattern == 1 -> fill_stock_connect_daily_quota_balance_message(stock_connect_daily_quota_balance_message_sent, 32)
  :: pattern == 2 -> fill_stock_connect_daily_quota_balance_message(stock_connect_daily_quota_balance_message_sent, 255)
  :: else -> ramp_stock_connect_daily_quota_balance_message(stock_connect_daily_quota_balance_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stock_connect_daily_quota_balance_message(stock_connect_daily_quota_balance_message_sent);
    assert(at == 20);
    at = 0;
    decode_stock_connect_daily_quota_balance_message(stock_connect_daily_quota_balance_message_got);
    assert(at == 20);
    equal_stock_connect_daily_quota_balance_message(stock_connect_daily_quota_balance_message_got, stock_connect_daily_quota_balance_message_sent)
  }
}

/* Stock Connect Market Turnover Message: encoded, read back, and compared */
proctype check_stock_connect_market_turnover_message() {
  StockConnectMarketTurnoverMessage stock_connect_market_turnover_message_sent;
  StockConnectMarketTurnoverMessage stock_connect_market_turnover_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stock_connect_market_turnover_message(stock_connect_market_turnover_message_sent, 0)
  :: pattern == 1 -> fill_stock_connect_market_turnover_message(stock_connect_market_turnover_message_sent, 32)
  :: pattern == 2 -> fill_stock_connect_market_turnover_message(stock_connect_market_turnover_message_sent, 255)
  :: else -> ramp_stock_connect_market_turnover_message(stock_connect_market_turnover_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stock_connect_market_turnover_message(stock_connect_market_turnover_message_sent);
    assert(at == 28);
    at = 0;
    decode_stock_connect_market_turnover_message(stock_connect_market_turnover_message_got);
    assert(at == 28);
    equal_stock_connect_market_turnover_message(stock_connect_market_turnover_message_got, stock_connect_market_turnover_message_sent)
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
    assert(at == 28);
    at = 0;
    decode_trade_message(trade_message_got);
    assert(at == 28);
    equal_trade_message(trade_message_got, trade_message_sent)
  }
}

/* Trade Cancel Message: encoded, read back, and compared */
proctype check_trade_cancel_message() {
  TradeCancelMessage trade_cancel_message_sent;
  TradeCancelMessage trade_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancel_message(trade_cancel_message_sent, 0)
  :: pattern == 1 -> fill_trade_cancel_message(trade_cancel_message_sent, 32)
  :: pattern == 2 -> fill_trade_cancel_message(trade_cancel_message_sent, 255)
  :: else -> ramp_trade_cancel_message(trade_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancel_message(trade_cancel_message_sent);
    assert(at == 8);
    at = 0;
    decode_trade_cancel_message(trade_cancel_message_got);
    assert(at == 8);
    equal_trade_cancel_message(trade_cancel_message_got, trade_cancel_message_sent)
  }
}

/* Trade Ticker Message: encoded, read back, and compared */
proctype check_trade_ticker_message() {
  TradeTickerMessage trade_ticker_message_sent;
  TradeTickerMessage trade_ticker_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_ticker_message(trade_ticker_message_sent, 0)
  :: pattern == 1 -> fill_trade_ticker_message(trade_ticker_message_sent, 32)
  :: pattern == 2 -> fill_trade_ticker_message(trade_ticker_message_sent, 255)
  :: else -> ramp_trade_ticker_message(trade_ticker_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_ticker_message(trade_ticker_message_sent);
    assert(at == 32);
    at = 0;
    decode_trade_ticker_message(trade_ticker_message_got);
    assert(at == 32);
    equal_trade_ticker_message(trade_ticker_message_got, trade_ticker_message_sent)
  }
}

/* Vcm Trigger Message: encoded, read back, and compared */
proctype check_vcm_trigger_message() {
  VcmTriggerMessage vcm_trigger_message_sent;
  VcmTriggerMessage vcm_trigger_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_vcm_trigger_message(vcm_trigger_message_sent, 0)
  :: pattern == 1 -> fill_vcm_trigger_message(vcm_trigger_message_sent, 32)
  :: pattern == 2 -> fill_vcm_trigger_message(vcm_trigger_message_sent, 255)
  :: else -> ramp_vcm_trigger_message(vcm_trigger_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_vcm_trigger_message(vcm_trigger_message_sent);
    assert(at == 32);
    at = 0;
    decode_vcm_trigger_message(vcm_trigger_message_got);
    assert(at == 32);
    equal_vcm_trigger_message(vcm_trigger_message_got, vcm_trigger_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_msg_header()
  :: run check_add_odd_lot_order_message()
  :: run check_add_order_message()
  :: run check_closing_price_message()
  :: run check_sequence_reset_message()
  :: run check_disaster_recovery_signal_message()
  :: run check_delete_odd_lot_order_message()
  :: run check_delete_order_message()
  :: run check_index_definition_message()
  :: run check_index_data_message()
  :: run check_indicative_equilibrium_price_message()
  :: run check_modify_order_message()
  :: run check_nominal_price_message()
  :: run check_order_imbalance_message()
  :: run check_market_definition_message()
  :: run check_currency_rate_message()
  :: run check_reference_price_message()
  :: run check_refresh_complete_message()
  :: run check_logon_message()
  :: run check_logon_response_message()
  :: run check_retransmission_request_message()
  :: run check_retransmission_response_message()
  :: run check_statistics_message()
  :: run check_market_turnover_message()
  :: run check_yield_message()
  :: run check_trading_session_status_message()
  :: run check_security_status_message()
  :: run check_stock_connect_daily_quota_balance_message()
  :: run check_stock_connect_market_turnover_message()
  :: run check_trade_message()
  :: run check_trade_cancel_message()
  :: run check_trade_ticker_message()
  :: run check_vcm_trigger_message()
  fi
}
