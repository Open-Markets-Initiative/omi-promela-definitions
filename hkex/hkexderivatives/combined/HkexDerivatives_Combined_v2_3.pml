/*
 * Hong Kong Exchanges and Clearing Orion Market Data Derivatives Combined
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
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 118

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 16 bytes ------------------------------------------------- */

/* Omd packet header (byte 3 is Compression Mode indicator) */
typedef PacketHeader {
  byte pkt_size[2];
  byte msg_count;
  byte compression_mode;
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
  packet_header_record.compression_mode = packet_header_value;
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
  packet_header_record.compression_mode = (packet_header_base + 3 + 1) % 256;
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
  wire[at] = packet_header_record.compression_mode; at = at + 1;
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
  packet_header_record.compression_mode = wire[at]; at = at + 1;
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
  assert(packet_header_read.compression_mode == packet_header_written.compression_mode);
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

/* ---- Add Order: 40 bytes ----------------------------------------------------- */

/* Generated when a new normal order is inserted into the order book. */
typedef AddOrder {
  byte orderbook_id[4];
  byte order_id[8];
  byte price[8];
  byte quantity[4];
  byte side;
  byte lot_type;
  byte order_type;
  byte order_book_position[4];
  byte business_time[8];
  byte filler_1
};

int add_order_at;

/* every byte of Add Order set to one value */
inline fill_add_order(add_order_record, add_order_value) {
  add_order_at = 0;
  do
  :: add_order_at < 4 -> add_order_record.orderbook_id[add_order_at] = add_order_value; add_order_at = add_order_at + 1
  :: else -> break
  od;
  add_order_at = 0;
  do
  :: add_order_at < 8 -> add_order_record.order_id[add_order_at] = add_order_value; add_order_at = add_order_at + 1
  :: else -> break
  od;
  add_order_at = 0;
  do
  :: add_order_at < 8 -> add_order_record.price[add_order_at] = add_order_value; add_order_at = add_order_at + 1
  :: else -> break
  od;
  add_order_at = 0;
  do
  :: add_order_at < 4 -> add_order_record.quantity[add_order_at] = add_order_value; add_order_at = add_order_at + 1
  :: else -> break
  od;
  add_order_record.side = add_order_value;
  add_order_record.lot_type = add_order_value;
  add_order_record.order_type = add_order_value;
  add_order_at = 0;
  do
  :: add_order_at < 4 -> add_order_record.order_book_position[add_order_at] = add_order_value; add_order_at = add_order_at + 1
  :: else -> break
  od;
  add_order_at = 0;
  do
  :: add_order_at < 8 -> add_order_record.business_time[add_order_at] = add_order_value; add_order_at = add_order_at + 1
  :: else -> break
  od;
  add_order_record.filler_1 = add_order_value;
  skip
}

/* each byte of Add Order set to where it lies, so a field read out of place says so */
inline ramp_add_order(add_order_record, add_order_base) {
  add_order_at = 0;
  do
  :: add_order_at < 4 -> add_order_record.orderbook_id[add_order_at] = (add_order_base + 0 + add_order_at + 1) % 256; add_order_at = add_order_at + 1
  :: else -> break
  od;
  add_order_at = 0;
  do
  :: add_order_at < 8 -> add_order_record.order_id[add_order_at] = (add_order_base + 4 + add_order_at + 1) % 256; add_order_at = add_order_at + 1
  :: else -> break
  od;
  add_order_at = 0;
  do
  :: add_order_at < 8 -> add_order_record.price[add_order_at] = (add_order_base + 12 + add_order_at + 1) % 256; add_order_at = add_order_at + 1
  :: else -> break
  od;
  add_order_at = 0;
  do
  :: add_order_at < 4 -> add_order_record.quantity[add_order_at] = (add_order_base + 20 + add_order_at + 1) % 256; add_order_at = add_order_at + 1
  :: else -> break
  od;
  add_order_record.side = (add_order_base + 24 + 1) % 256;
  add_order_record.lot_type = (add_order_base + 25 + 1) % 256;
  add_order_record.order_type = (add_order_base + 26 + 1) % 256;
  add_order_at = 0;
  do
  :: add_order_at < 4 -> add_order_record.order_book_position[add_order_at] = (add_order_base + 27 + add_order_at + 1) % 256; add_order_at = add_order_at + 1
  :: else -> break
  od;
  add_order_at = 0;
  do
  :: add_order_at < 8 -> add_order_record.business_time[add_order_at] = (add_order_base + 31 + add_order_at + 1) % 256; add_order_at = add_order_at + 1
  :: else -> break
  od;
  add_order_record.filler_1 = (add_order_base + 39 + 1) % 256;
  skip
}

/* Add Order to the wire, 40 bytes from where the cursor stands */
inline encode_add_order(add_order_record) {
  add_order_at = 0;
  do
  :: add_order_at < 4 -> wire[at] = add_order_record.orderbook_id[add_order_at]; at = at + 1; add_order_at = add_order_at + 1
  :: else -> break
  od;
  add_order_at = 0;
  do
  :: add_order_at < 8 -> wire[at] = add_order_record.order_id[add_order_at]; at = at + 1; add_order_at = add_order_at + 1
  :: else -> break
  od;
  add_order_at = 0;
  do
  :: add_order_at < 8 -> wire[at] = add_order_record.price[add_order_at]; at = at + 1; add_order_at = add_order_at + 1
  :: else -> break
  od;
  add_order_at = 0;
  do
  :: add_order_at < 4 -> wire[at] = add_order_record.quantity[add_order_at]; at = at + 1; add_order_at = add_order_at + 1
  :: else -> break
  od;
  wire[at] = add_order_record.side; at = at + 1;
  wire[at] = add_order_record.lot_type; at = at + 1;
  wire[at] = add_order_record.order_type; at = at + 1;
  add_order_at = 0;
  do
  :: add_order_at < 4 -> wire[at] = add_order_record.order_book_position[add_order_at]; at = at + 1; add_order_at = add_order_at + 1
  :: else -> break
  od;
  add_order_at = 0;
  do
  :: add_order_at < 8 -> wire[at] = add_order_record.business_time[add_order_at]; at = at + 1; add_order_at = add_order_at + 1
  :: else -> break
  od;
  wire[at] = add_order_record.filler_1; at = at + 1;
  skip
}

/* Add Order off the wire, 40 bytes from where the cursor stands */
inline decode_add_order(add_order_record) {
  add_order_at = 0;
  do
  :: add_order_at < 4 -> add_order_record.orderbook_id[add_order_at] = wire[at]; at = at + 1; add_order_at = add_order_at + 1
  :: else -> break
  od;
  add_order_at = 0;
  do
  :: add_order_at < 8 -> add_order_record.order_id[add_order_at] = wire[at]; at = at + 1; add_order_at = add_order_at + 1
  :: else -> break
  od;
  add_order_at = 0;
  do
  :: add_order_at < 8 -> add_order_record.price[add_order_at] = wire[at]; at = at + 1; add_order_at = add_order_at + 1
  :: else -> break
  od;
  add_order_at = 0;
  do
  :: add_order_at < 4 -> add_order_record.quantity[add_order_at] = wire[at]; at = at + 1; add_order_at = add_order_at + 1
  :: else -> break
  od;
  add_order_record.side = wire[at]; at = at + 1;
  add_order_record.lot_type = wire[at]; at = at + 1;
  add_order_record.order_type = wire[at]; at = at + 1;
  add_order_at = 0;
  do
  :: add_order_at < 4 -> add_order_record.order_book_position[add_order_at] = wire[at]; at = at + 1; add_order_at = add_order_at + 1
  :: else -> break
  od;
  add_order_at = 0;
  do
  :: add_order_at < 8 -> add_order_record.business_time[add_order_at] = wire[at]; at = at + 1; add_order_at = add_order_at + 1
  :: else -> break
  od;
  add_order_record.filler_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Add Order is what was written, byte for byte */
inline equal_add_order(add_order_read, add_order_written) {
  add_order_at = 0;
  do
  :: add_order_at < 4 -> assert(add_order_read.orderbook_id[add_order_at] == add_order_written.orderbook_id[add_order_at]); add_order_at = add_order_at + 1
  :: else -> break
  od;
  add_order_at = 0;
  do
  :: add_order_at < 8 -> assert(add_order_read.order_id[add_order_at] == add_order_written.order_id[add_order_at]); add_order_at = add_order_at + 1
  :: else -> break
  od;
  add_order_at = 0;
  do
  :: add_order_at < 8 -> assert(add_order_read.price[add_order_at] == add_order_written.price[add_order_at]); add_order_at = add_order_at + 1
  :: else -> break
  od;
  add_order_at = 0;
  do
  :: add_order_at < 4 -> assert(add_order_read.quantity[add_order_at] == add_order_written.quantity[add_order_at]); add_order_at = add_order_at + 1
  :: else -> break
  od;
  assert(add_order_read.side == add_order_written.side);
  assert(add_order_read.lot_type == add_order_written.lot_type);
  assert(add_order_read.order_type == add_order_written.order_type);
  add_order_at = 0;
  do
  :: add_order_at < 4 -> assert(add_order_read.order_book_position[add_order_at] == add_order_written.order_book_position[add_order_at]); add_order_at = add_order_at + 1
  :: else -> break
  od;
  add_order_at = 0;
  do
  :: add_order_at < 8 -> assert(add_order_read.business_time[add_order_at] == add_order_written.business_time[add_order_at]); add_order_at = add_order_at + 1
  :: else -> break
  od;
  assert(add_order_read.filler_1 == add_order_written.filler_1);
  skip
}

/* ---- Aggregate Implied Order: 22 bytes --------------------------------------- */

/* Generated whenever there is an update on implied order at the given implied price. */
typedef AggregateImpliedOrder {
  byte orderbook_id[4];
  byte implied_price[8];
  byte implied_quantity[8];
  byte side;
  byte filler_1
};

int aggregate_implied_order_at;

/* every byte of Aggregate Implied Order set to one value */
inline fill_aggregate_implied_order(aggregate_implied_order_record, aggregate_implied_order_value) {
  aggregate_implied_order_at = 0;
  do
  :: aggregate_implied_order_at < 4 -> aggregate_implied_order_record.orderbook_id[aggregate_implied_order_at] = aggregate_implied_order_value; aggregate_implied_order_at = aggregate_implied_order_at + 1
  :: else -> break
  od;
  aggregate_implied_order_at = 0;
  do
  :: aggregate_implied_order_at < 8 -> aggregate_implied_order_record.implied_price[aggregate_implied_order_at] = aggregate_implied_order_value; aggregate_implied_order_at = aggregate_implied_order_at + 1
  :: else -> break
  od;
  aggregate_implied_order_at = 0;
  do
  :: aggregate_implied_order_at < 8 -> aggregate_implied_order_record.implied_quantity[aggregate_implied_order_at] = aggregate_implied_order_value; aggregate_implied_order_at = aggregate_implied_order_at + 1
  :: else -> break
  od;
  aggregate_implied_order_record.side = aggregate_implied_order_value;
  aggregate_implied_order_record.filler_1 = aggregate_implied_order_value;
  skip
}

/* each byte of Aggregate Implied Order set to where it lies, so a field read out of place says so */
inline ramp_aggregate_implied_order(aggregate_implied_order_record, aggregate_implied_order_base) {
  aggregate_implied_order_at = 0;
  do
  :: aggregate_implied_order_at < 4 -> aggregate_implied_order_record.orderbook_id[aggregate_implied_order_at] = (aggregate_implied_order_base + 0 + aggregate_implied_order_at + 1) % 256; aggregate_implied_order_at = aggregate_implied_order_at + 1
  :: else -> break
  od;
  aggregate_implied_order_at = 0;
  do
  :: aggregate_implied_order_at < 8 -> aggregate_implied_order_record.implied_price[aggregate_implied_order_at] = (aggregate_implied_order_base + 4 + aggregate_implied_order_at + 1) % 256; aggregate_implied_order_at = aggregate_implied_order_at + 1
  :: else -> break
  od;
  aggregate_implied_order_at = 0;
  do
  :: aggregate_implied_order_at < 8 -> aggregate_implied_order_record.implied_quantity[aggregate_implied_order_at] = (aggregate_implied_order_base + 12 + aggregate_implied_order_at + 1) % 256; aggregate_implied_order_at = aggregate_implied_order_at + 1
  :: else -> break
  od;
  aggregate_implied_order_record.side = (aggregate_implied_order_base + 20 + 1) % 256;
  aggregate_implied_order_record.filler_1 = (aggregate_implied_order_base + 21 + 1) % 256;
  skip
}

/* Aggregate Implied Order to the wire, 22 bytes from where the cursor stands */
inline encode_aggregate_implied_order(aggregate_implied_order_record) {
  aggregate_implied_order_at = 0;
  do
  :: aggregate_implied_order_at < 4 -> wire[at] = aggregate_implied_order_record.orderbook_id[aggregate_implied_order_at]; at = at + 1; aggregate_implied_order_at = aggregate_implied_order_at + 1
  :: else -> break
  od;
  aggregate_implied_order_at = 0;
  do
  :: aggregate_implied_order_at < 8 -> wire[at] = aggregate_implied_order_record.implied_price[aggregate_implied_order_at]; at = at + 1; aggregate_implied_order_at = aggregate_implied_order_at + 1
  :: else -> break
  od;
  aggregate_implied_order_at = 0;
  do
  :: aggregate_implied_order_at < 8 -> wire[at] = aggregate_implied_order_record.implied_quantity[aggregate_implied_order_at]; at = at + 1; aggregate_implied_order_at = aggregate_implied_order_at + 1
  :: else -> break
  od;
  wire[at] = aggregate_implied_order_record.side; at = at + 1;
  wire[at] = aggregate_implied_order_record.filler_1; at = at + 1;
  skip
}

/* Aggregate Implied Order off the wire, 22 bytes from where the cursor stands */
inline decode_aggregate_implied_order(aggregate_implied_order_record) {
  aggregate_implied_order_at = 0;
  do
  :: aggregate_implied_order_at < 4 -> aggregate_implied_order_record.orderbook_id[aggregate_implied_order_at] = wire[at]; at = at + 1; aggregate_implied_order_at = aggregate_implied_order_at + 1
  :: else -> break
  od;
  aggregate_implied_order_at = 0;
  do
  :: aggregate_implied_order_at < 8 -> aggregate_implied_order_record.implied_price[aggregate_implied_order_at] = wire[at]; at = at + 1; aggregate_implied_order_at = aggregate_implied_order_at + 1
  :: else -> break
  od;
  aggregate_implied_order_at = 0;
  do
  :: aggregate_implied_order_at < 8 -> aggregate_implied_order_record.implied_quantity[aggregate_implied_order_at] = wire[at]; at = at + 1; aggregate_implied_order_at = aggregate_implied_order_at + 1
  :: else -> break
  od;
  aggregate_implied_order_record.side = wire[at]; at = at + 1;
  aggregate_implied_order_record.filler_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Aggregate Implied Order is what was written, byte for byte */
inline equal_aggregate_implied_order(aggregate_implied_order_read, aggregate_implied_order_written) {
  aggregate_implied_order_at = 0;
  do
  :: aggregate_implied_order_at < 4 -> assert(aggregate_implied_order_read.orderbook_id[aggregate_implied_order_at] == aggregate_implied_order_written.orderbook_id[aggregate_implied_order_at]); aggregate_implied_order_at = aggregate_implied_order_at + 1
  :: else -> break
  od;
  aggregate_implied_order_at = 0;
  do
  :: aggregate_implied_order_at < 8 -> assert(aggregate_implied_order_read.implied_price[aggregate_implied_order_at] == aggregate_implied_order_written.implied_price[aggregate_implied_order_at]); aggregate_implied_order_at = aggregate_implied_order_at + 1
  :: else -> break
  od;
  aggregate_implied_order_at = 0;
  do
  :: aggregate_implied_order_at < 8 -> assert(aggregate_implied_order_read.implied_quantity[aggregate_implied_order_at] == aggregate_implied_order_written.implied_quantity[aggregate_implied_order_at]); aggregate_implied_order_at = aggregate_implied_order_at + 1
  :: else -> break
  od;
  assert(aggregate_implied_order_read.side == aggregate_implied_order_written.side);
  assert(aggregate_implied_order_read.filler_1 == aggregate_implied_order_written.filler_1);
  skip
}

/* ---- Calculated Opening Price Message: 24 bytes ------------------------------ */

/* The Calculated Opening Price (COP) message indicates an instrument's theoretical opening price during the pre-opening phases of the market prior to an auction */
typedef CalculatedOpeningPriceMessage {
  byte orderbook_id[4];
  byte calculated_opening_price[8];
  byte filler_4[4];
  byte calculated_opening_quantity[8]
};

int calculated_opening_price_message_at;

/* every byte of Calculated Opening Price Message set to one value */
inline fill_calculated_opening_price_message(calculated_opening_price_message_record, calculated_opening_price_message_value) {
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 4 -> calculated_opening_price_message_record.orderbook_id[calculated_opening_price_message_at] = calculated_opening_price_message_value; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 8 -> calculated_opening_price_message_record.calculated_opening_price[calculated_opening_price_message_at] = calculated_opening_price_message_value; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 4 -> calculated_opening_price_message_record.filler_4[calculated_opening_price_message_at] = calculated_opening_price_message_value; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 8 -> calculated_opening_price_message_record.calculated_opening_quantity[calculated_opening_price_message_at] = calculated_opening_price_message_value; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Calculated Opening Price Message set to where it lies, so a field read out of place says so */
inline ramp_calculated_opening_price_message(calculated_opening_price_message_record, calculated_opening_price_message_base) {
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 4 -> calculated_opening_price_message_record.orderbook_id[calculated_opening_price_message_at] = (calculated_opening_price_message_base + 0 + calculated_opening_price_message_at + 1) % 256; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 8 -> calculated_opening_price_message_record.calculated_opening_price[calculated_opening_price_message_at] = (calculated_opening_price_message_base + 4 + calculated_opening_price_message_at + 1) % 256; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 4 -> calculated_opening_price_message_record.filler_4[calculated_opening_price_message_at] = (calculated_opening_price_message_base + 12 + calculated_opening_price_message_at + 1) % 256; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 8 -> calculated_opening_price_message_record.calculated_opening_quantity[calculated_opening_price_message_at] = (calculated_opening_price_message_base + 16 + calculated_opening_price_message_at + 1) % 256; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Calculated Opening Price Message to the wire, 24 bytes from where the cursor stands */
inline encode_calculated_opening_price_message(calculated_opening_price_message_record) {
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 4 -> wire[at] = calculated_opening_price_message_record.orderbook_id[calculated_opening_price_message_at]; at = at + 1; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 8 -> wire[at] = calculated_opening_price_message_record.calculated_opening_price[calculated_opening_price_message_at]; at = at + 1; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 4 -> wire[at] = calculated_opening_price_message_record.filler_4[calculated_opening_price_message_at]; at = at + 1; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 8 -> wire[at] = calculated_opening_price_message_record.calculated_opening_quantity[calculated_opening_price_message_at]; at = at + 1; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Calculated Opening Price Message off the wire, 24 bytes from where the cursor stands */
inline decode_calculated_opening_price_message(calculated_opening_price_message_record) {
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 4 -> calculated_opening_price_message_record.orderbook_id[calculated_opening_price_message_at] = wire[at]; at = at + 1; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 8 -> calculated_opening_price_message_record.calculated_opening_price[calculated_opening_price_message_at] = wire[at]; at = at + 1; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 4 -> calculated_opening_price_message_record.filler_4[calculated_opening_price_message_at] = wire[at]; at = at + 1; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 8 -> calculated_opening_price_message_record.calculated_opening_quantity[calculated_opening_price_message_at] = wire[at]; at = at + 1; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Calculated Opening Price Message is what was written, byte for byte */
inline equal_calculated_opening_price_message(calculated_opening_price_message_read, calculated_opening_price_message_written) {
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 4 -> assert(calculated_opening_price_message_read.orderbook_id[calculated_opening_price_message_at] == calculated_opening_price_message_written.orderbook_id[calculated_opening_price_message_at]); calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 8 -> assert(calculated_opening_price_message_read.calculated_opening_price[calculated_opening_price_message_at] == calculated_opening_price_message_written.calculated_opening_price[calculated_opening_price_message_at]); calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 4 -> assert(calculated_opening_price_message_read.filler_4[calculated_opening_price_message_at] == calculated_opening_price_message_written.filler_4[calculated_opening_price_message_at]); calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 8 -> assert(calculated_opening_price_message_read.calculated_opening_quantity[calculated_opening_price_message_at] == calculated_opening_price_message_written.calculated_opening_quantity[calculated_opening_price_message_at]); calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sequence Reset: 4 bytes ------------------------------------------------- */

/* The Sequence Reset message is sent on each multicast channel at start of day */
typedef SequenceReset {
  byte new_seq_no[4]
};

int sequence_reset_at;

/* every byte of Sequence Reset set to one value */
inline fill_sequence_reset(sequence_reset_record, sequence_reset_value) {
  sequence_reset_at = 0;
  do
  :: sequence_reset_at < 4 -> sequence_reset_record.new_seq_no[sequence_reset_at] = sequence_reset_value; sequence_reset_at = sequence_reset_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sequence Reset set to where it lies, so a field read out of place says so */
inline ramp_sequence_reset(sequence_reset_record, sequence_reset_base) {
  sequence_reset_at = 0;
  do
  :: sequence_reset_at < 4 -> sequence_reset_record.new_seq_no[sequence_reset_at] = (sequence_reset_base + 0 + sequence_reset_at + 1) % 256; sequence_reset_at = sequence_reset_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Reset to the wire, 4 bytes from where the cursor stands */
inline encode_sequence_reset(sequence_reset_record) {
  sequence_reset_at = 0;
  do
  :: sequence_reset_at < 4 -> wire[at] = sequence_reset_record.new_seq_no[sequence_reset_at]; at = at + 1; sequence_reset_at = sequence_reset_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Reset off the wire, 4 bytes from where the cursor stands */
inline decode_sequence_reset(sequence_reset_record) {
  sequence_reset_at = 0;
  do
  :: sequence_reset_at < 4 -> sequence_reset_record.new_seq_no[sequence_reset_at] = wire[at]; at = at + 1; sequence_reset_at = sequence_reset_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sequence Reset is what was written, byte for byte */
inline equal_sequence_reset(sequence_reset_read, sequence_reset_written) {
  sequence_reset_at = 0;
  do
  :: sequence_reset_at < 4 -> assert(sequence_reset_read.new_seq_no[sequence_reset_at] == sequence_reset_written.new_seq_no[sequence_reset_at]); sequence_reset_at = sequence_reset_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Disaster Recovery Signal Message: 4 bytes ------------------------------- */

/* The Disaster Recovery Signal message is sent on a dedicated multicast channel whenever a site failover scenario is triggered */
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

/* ---- Delete Order: 22 bytes -------------------------------------------------- */

/* Generated when an existing normal order identified by OrderBookID, OrderID and Side is deleted. */
typedef DeleteOrder {
  byte orderbook_id[4];
  byte order_id[8];
  byte side;
  byte business_time[8];
  byte filler_1
};

int delete_order_at;

/* every byte of Delete Order set to one value */
inline fill_delete_order(delete_order_record, delete_order_value) {
  delete_order_at = 0;
  do
  :: delete_order_at < 4 -> delete_order_record.orderbook_id[delete_order_at] = delete_order_value; delete_order_at = delete_order_at + 1
  :: else -> break
  od;
  delete_order_at = 0;
  do
  :: delete_order_at < 8 -> delete_order_record.order_id[delete_order_at] = delete_order_value; delete_order_at = delete_order_at + 1
  :: else -> break
  od;
  delete_order_record.side = delete_order_value;
  delete_order_at = 0;
  do
  :: delete_order_at < 8 -> delete_order_record.business_time[delete_order_at] = delete_order_value; delete_order_at = delete_order_at + 1
  :: else -> break
  od;
  delete_order_record.filler_1 = delete_order_value;
  skip
}

/* each byte of Delete Order set to where it lies, so a field read out of place says so */
inline ramp_delete_order(delete_order_record, delete_order_base) {
  delete_order_at = 0;
  do
  :: delete_order_at < 4 -> delete_order_record.orderbook_id[delete_order_at] = (delete_order_base + 0 + delete_order_at + 1) % 256; delete_order_at = delete_order_at + 1
  :: else -> break
  od;
  delete_order_at = 0;
  do
  :: delete_order_at < 8 -> delete_order_record.order_id[delete_order_at] = (delete_order_base + 4 + delete_order_at + 1) % 256; delete_order_at = delete_order_at + 1
  :: else -> break
  od;
  delete_order_record.side = (delete_order_base + 12 + 1) % 256;
  delete_order_at = 0;
  do
  :: delete_order_at < 8 -> delete_order_record.business_time[delete_order_at] = (delete_order_base + 13 + delete_order_at + 1) % 256; delete_order_at = delete_order_at + 1
  :: else -> break
  od;
  delete_order_record.filler_1 = (delete_order_base + 21 + 1) % 256;
  skip
}

/* Delete Order to the wire, 22 bytes from where the cursor stands */
inline encode_delete_order(delete_order_record) {
  delete_order_at = 0;
  do
  :: delete_order_at < 4 -> wire[at] = delete_order_record.orderbook_id[delete_order_at]; at = at + 1; delete_order_at = delete_order_at + 1
  :: else -> break
  od;
  delete_order_at = 0;
  do
  :: delete_order_at < 8 -> wire[at] = delete_order_record.order_id[delete_order_at]; at = at + 1; delete_order_at = delete_order_at + 1
  :: else -> break
  od;
  wire[at] = delete_order_record.side; at = at + 1;
  delete_order_at = 0;
  do
  :: delete_order_at < 8 -> wire[at] = delete_order_record.business_time[delete_order_at]; at = at + 1; delete_order_at = delete_order_at + 1
  :: else -> break
  od;
  wire[at] = delete_order_record.filler_1; at = at + 1;
  skip
}

/* Delete Order off the wire, 22 bytes from where the cursor stands */
inline decode_delete_order(delete_order_record) {
  delete_order_at = 0;
  do
  :: delete_order_at < 4 -> delete_order_record.orderbook_id[delete_order_at] = wire[at]; at = at + 1; delete_order_at = delete_order_at + 1
  :: else -> break
  od;
  delete_order_at = 0;
  do
  :: delete_order_at < 8 -> delete_order_record.order_id[delete_order_at] = wire[at]; at = at + 1; delete_order_at = delete_order_at + 1
  :: else -> break
  od;
  delete_order_record.side = wire[at]; at = at + 1;
  delete_order_at = 0;
  do
  :: delete_order_at < 8 -> delete_order_record.business_time[delete_order_at] = wire[at]; at = at + 1; delete_order_at = delete_order_at + 1
  :: else -> break
  od;
  delete_order_record.filler_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Delete Order is what was written, byte for byte */
inline equal_delete_order(delete_order_read, delete_order_written) {
  delete_order_at = 0;
  do
  :: delete_order_at < 4 -> assert(delete_order_read.orderbook_id[delete_order_at] == delete_order_written.orderbook_id[delete_order_at]); delete_order_at = delete_order_at + 1
  :: else -> break
  od;
  delete_order_at = 0;
  do
  :: delete_order_at < 8 -> assert(delete_order_read.order_id[delete_order_at] == delete_order_written.order_id[delete_order_at]); delete_order_at = delete_order_at + 1
  :: else -> break
  od;
  assert(delete_order_read.side == delete_order_written.side);
  delete_order_at = 0;
  do
  :: delete_order_at < 8 -> assert(delete_order_read.business_time[delete_order_at] == delete_order_written.business_time[delete_order_at]); delete_order_at = delete_order_at + 1
  :: else -> break
  od;
  assert(delete_order_read.filler_1 == delete_order_written.filler_1);
  skip
}

/* ---- Implied Volatility Message: 8 bytes ------------------------------------- */

/* Contains implied volitility */
typedef ImpliedVolatilityMessage {
  byte orderbook_id[4];
  byte implied_volatility[4]
};

int implied_volatility_message_at;

/* every byte of Implied Volatility Message set to one value */
inline fill_implied_volatility_message(implied_volatility_message_record, implied_volatility_message_value) {
  implied_volatility_message_at = 0;
  do
  :: implied_volatility_message_at < 4 -> implied_volatility_message_record.orderbook_id[implied_volatility_message_at] = implied_volatility_message_value; implied_volatility_message_at = implied_volatility_message_at + 1
  :: else -> break
  od;
  implied_volatility_message_at = 0;
  do
  :: implied_volatility_message_at < 4 -> implied_volatility_message_record.implied_volatility[implied_volatility_message_at] = implied_volatility_message_value; implied_volatility_message_at = implied_volatility_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Implied Volatility Message set to where it lies, so a field read out of place says so */
inline ramp_implied_volatility_message(implied_volatility_message_record, implied_volatility_message_base) {
  implied_volatility_message_at = 0;
  do
  :: implied_volatility_message_at < 4 -> implied_volatility_message_record.orderbook_id[implied_volatility_message_at] = (implied_volatility_message_base + 0 + implied_volatility_message_at + 1) % 256; implied_volatility_message_at = implied_volatility_message_at + 1
  :: else -> break
  od;
  implied_volatility_message_at = 0;
  do
  :: implied_volatility_message_at < 4 -> implied_volatility_message_record.implied_volatility[implied_volatility_message_at] = (implied_volatility_message_base + 4 + implied_volatility_message_at + 1) % 256; implied_volatility_message_at = implied_volatility_message_at + 1
  :: else -> break
  od;
  skip
}

/* Implied Volatility Message to the wire, 8 bytes from where the cursor stands */
inline encode_implied_volatility_message(implied_volatility_message_record) {
  implied_volatility_message_at = 0;
  do
  :: implied_volatility_message_at < 4 -> wire[at] = implied_volatility_message_record.orderbook_id[implied_volatility_message_at]; at = at + 1; implied_volatility_message_at = implied_volatility_message_at + 1
  :: else -> break
  od;
  implied_volatility_message_at = 0;
  do
  :: implied_volatility_message_at < 4 -> wire[at] = implied_volatility_message_record.implied_volatility[implied_volatility_message_at]; at = at + 1; implied_volatility_message_at = implied_volatility_message_at + 1
  :: else -> break
  od;
  skip
}

/* Implied Volatility Message off the wire, 8 bytes from where the cursor stands */
inline decode_implied_volatility_message(implied_volatility_message_record) {
  implied_volatility_message_at = 0;
  do
  :: implied_volatility_message_at < 4 -> implied_volatility_message_record.orderbook_id[implied_volatility_message_at] = wire[at]; at = at + 1; implied_volatility_message_at = implied_volatility_message_at + 1
  :: else -> break
  od;
  implied_volatility_message_at = 0;
  do
  :: implied_volatility_message_at < 4 -> implied_volatility_message_record.implied_volatility[implied_volatility_message_at] = wire[at]; at = at + 1; implied_volatility_message_at = implied_volatility_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Implied Volatility Message is what was written, byte for byte */
inline equal_implied_volatility_message(implied_volatility_message_read, implied_volatility_message_written) {
  implied_volatility_message_at = 0;
  do
  :: implied_volatility_message_at < 4 -> assert(implied_volatility_message_read.orderbook_id[implied_volatility_message_at] == implied_volatility_message_written.orderbook_id[implied_volatility_message_at]); implied_volatility_message_at = implied_volatility_message_at + 1
  :: else -> break
  od;
  implied_volatility_message_at = 0;
  do
  :: implied_volatility_message_at < 4 -> assert(implied_volatility_message_read.implied_volatility[implied_volatility_message_at] == implied_volatility_message_written.implied_volatility[implied_volatility_message_at]); implied_volatility_message_at = implied_volatility_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Order: 40 bytes -------------------------------------------------- */

/* Generated when an existing normal order identified by the OrderID is modified. */
typedef ModifyOrder {
  byte orderbook_id[4];
  byte order_id[8];
  byte price[8];
  byte quantity[4];
  byte side;
  byte filler_2[2];
  byte order_type;
  byte order_book_position[4];
  byte business_time[8]
};

int modify_order_at;

/* every byte of Modify Order set to one value */
inline fill_modify_order(modify_order_record, modify_order_value) {
  modify_order_at = 0;
  do
  :: modify_order_at < 4 -> modify_order_record.orderbook_id[modify_order_at] = modify_order_value; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 8 -> modify_order_record.order_id[modify_order_at] = modify_order_value; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 8 -> modify_order_record.price[modify_order_at] = modify_order_value; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 4 -> modify_order_record.quantity[modify_order_at] = modify_order_value; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_record.side = modify_order_value;
  modify_order_at = 0;
  do
  :: modify_order_at < 2 -> modify_order_record.filler_2[modify_order_at] = modify_order_value; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_record.order_type = modify_order_value;
  modify_order_at = 0;
  do
  :: modify_order_at < 4 -> modify_order_record.order_book_position[modify_order_at] = modify_order_value; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 8 -> modify_order_record.business_time[modify_order_at] = modify_order_value; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Modify Order set to where it lies, so a field read out of place says so */
inline ramp_modify_order(modify_order_record, modify_order_base) {
  modify_order_at = 0;
  do
  :: modify_order_at < 4 -> modify_order_record.orderbook_id[modify_order_at] = (modify_order_base + 0 + modify_order_at + 1) % 256; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 8 -> modify_order_record.order_id[modify_order_at] = (modify_order_base + 4 + modify_order_at + 1) % 256; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 8 -> modify_order_record.price[modify_order_at] = (modify_order_base + 12 + modify_order_at + 1) % 256; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 4 -> modify_order_record.quantity[modify_order_at] = (modify_order_base + 20 + modify_order_at + 1) % 256; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_record.side = (modify_order_base + 24 + 1) % 256;
  modify_order_at = 0;
  do
  :: modify_order_at < 2 -> modify_order_record.filler_2[modify_order_at] = (modify_order_base + 25 + modify_order_at + 1) % 256; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_record.order_type = (modify_order_base + 27 + 1) % 256;
  modify_order_at = 0;
  do
  :: modify_order_at < 4 -> modify_order_record.order_book_position[modify_order_at] = (modify_order_base + 28 + modify_order_at + 1) % 256; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 8 -> modify_order_record.business_time[modify_order_at] = (modify_order_base + 32 + modify_order_at + 1) % 256; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order to the wire, 40 bytes from where the cursor stands */
inline encode_modify_order(modify_order_record) {
  modify_order_at = 0;
  do
  :: modify_order_at < 4 -> wire[at] = modify_order_record.orderbook_id[modify_order_at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 8 -> wire[at] = modify_order_record.order_id[modify_order_at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 8 -> wire[at] = modify_order_record.price[modify_order_at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 4 -> wire[at] = modify_order_record.quantity[modify_order_at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_record.side; at = at + 1;
  modify_order_at = 0;
  do
  :: modify_order_at < 2 -> wire[at] = modify_order_record.filler_2[modify_order_at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_record.order_type; at = at + 1;
  modify_order_at = 0;
  do
  :: modify_order_at < 4 -> wire[at] = modify_order_record.order_book_position[modify_order_at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 8 -> wire[at] = modify_order_record.business_time[modify_order_at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order off the wire, 40 bytes from where the cursor stands */
inline decode_modify_order(modify_order_record) {
  modify_order_at = 0;
  do
  :: modify_order_at < 4 -> modify_order_record.orderbook_id[modify_order_at] = wire[at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 8 -> modify_order_record.order_id[modify_order_at] = wire[at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 8 -> modify_order_record.price[modify_order_at] = wire[at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 4 -> modify_order_record.quantity[modify_order_at] = wire[at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_record.side = wire[at]; at = at + 1;
  modify_order_at = 0;
  do
  :: modify_order_at < 2 -> modify_order_record.filler_2[modify_order_at] = wire[at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_record.order_type = wire[at]; at = at + 1;
  modify_order_at = 0;
  do
  :: modify_order_at < 4 -> modify_order_record.order_book_position[modify_order_at] = wire[at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 8 -> modify_order_record.business_time[modify_order_at] = wire[at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Modify Order is what was written, byte for byte */
inline equal_modify_order(modify_order_read, modify_order_written) {
  modify_order_at = 0;
  do
  :: modify_order_at < 4 -> assert(modify_order_read.orderbook_id[modify_order_at] == modify_order_written.orderbook_id[modify_order_at]); modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 8 -> assert(modify_order_read.order_id[modify_order_at] == modify_order_written.order_id[modify_order_at]); modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 8 -> assert(modify_order_read.price[modify_order_at] == modify_order_written.price[modify_order_at]); modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 4 -> assert(modify_order_read.quantity[modify_order_at] == modify_order_written.quantity[modify_order_at]); modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  assert(modify_order_read.side == modify_order_written.side);
  modify_order_at = 0;
  do
  :: modify_order_at < 2 -> assert(modify_order_read.filler_2[modify_order_at] == modify_order_written.filler_2[modify_order_at]); modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  assert(modify_order_read.order_type == modify_order_written.order_type);
  modify_order_at = 0;
  do
  :: modify_order_at < 4 -> assert(modify_order_read.order_book_position[modify_order_at] == modify_order_written.order_book_position[modify_order_at]); modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 8 -> assert(modify_order_read.business_time[modify_order_at] == modify_order_written.business_time[modify_order_at]); modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Open Interest Message: 28 bytes ----------------------------------------- */

/* Issued to show the Previous Day settlement price and open interest */
typedef OpenInterestMessage {
  byte day_indicator[2];
  byte filler_6[6];
  byte orderbook_id[4];
  byte settlement_price[8];
  byte gross_oi[4];
  byte net_oi[4]
};

int open_interest_message_at;

/* every byte of Open Interest Message set to one value */
inline fill_open_interest_message(open_interest_message_record, open_interest_message_value) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 2 -> open_interest_message_record.day_indicator[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 6 -> open_interest_message_record.filler_6[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.orderbook_id[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> open_interest_message_record.settlement_price[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.gross_oi[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.net_oi[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Open Interest Message set to where it lies, so a field read out of place says so */
inline ramp_open_interest_message(open_interest_message_record, open_interest_message_base) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 2 -> open_interest_message_record.day_indicator[open_interest_message_at] = (open_interest_message_base + 0 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 6 -> open_interest_message_record.filler_6[open_interest_message_at] = (open_interest_message_base + 2 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.orderbook_id[open_interest_message_at] = (open_interest_message_base + 8 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> open_interest_message_record.settlement_price[open_interest_message_at] = (open_interest_message_base + 12 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.gross_oi[open_interest_message_at] = (open_interest_message_base + 20 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.net_oi[open_interest_message_at] = (open_interest_message_base + 24 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Interest Message to the wire, 28 bytes from where the cursor stands */
inline encode_open_interest_message(open_interest_message_record) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 2 -> wire[at] = open_interest_message_record.day_indicator[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 6 -> wire[at] = open_interest_message_record.filler_6[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.orderbook_id[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> wire[at] = open_interest_message_record.settlement_price[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.gross_oi[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.net_oi[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Interest Message off the wire, 28 bytes from where the cursor stands */
inline decode_open_interest_message(open_interest_message_record) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 2 -> open_interest_message_record.day_indicator[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 6 -> open_interest_message_record.filler_6[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.orderbook_id[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> open_interest_message_record.settlement_price[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.gross_oi[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.net_oi[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Open Interest Message is what was written, byte for byte */
inline equal_open_interest_message(open_interest_message_read, open_interest_message_written) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 2 -> assert(open_interest_message_read.day_indicator[open_interest_message_at] == open_interest_message_written.day_indicator[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 6 -> assert(open_interest_message_read.filler_6[open_interest_message_at] == open_interest_message_written.filler_6[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.orderbook_id[open_interest_message_at] == open_interest_message_written.orderbook_id[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> assert(open_interest_message_read.settlement_price[open_interest_message_at] == open_interest_message_written.settlement_price[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.gross_oi[open_interest_message_at] == open_interest_message_written.gross_oi[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.net_oi[open_interest_message_at] == open_interest_message_written.net_oi[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Orderbook Clear Message: 4 bytes ---------------------------------------- */

/* The Orderbook Clear message is used to inform clients that all existing orders should be removed from both the bid and ask sides of the specified orderbook */
typedef OrderbookClearMessage {
  byte orderbook_id[4]
};

int orderbook_clear_message_at;

/* every byte of Orderbook Clear Message set to one value */
inline fill_orderbook_clear_message(orderbook_clear_message_record, orderbook_clear_message_value) {
  orderbook_clear_message_at = 0;
  do
  :: orderbook_clear_message_at < 4 -> orderbook_clear_message_record.orderbook_id[orderbook_clear_message_at] = orderbook_clear_message_value; orderbook_clear_message_at = orderbook_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Orderbook Clear Message set to where it lies, so a field read out of place says so */
inline ramp_orderbook_clear_message(orderbook_clear_message_record, orderbook_clear_message_base) {
  orderbook_clear_message_at = 0;
  do
  :: orderbook_clear_message_at < 4 -> orderbook_clear_message_record.orderbook_id[orderbook_clear_message_at] = (orderbook_clear_message_base + 0 + orderbook_clear_message_at + 1) % 256; orderbook_clear_message_at = orderbook_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Orderbook Clear Message to the wire, 4 bytes from where the cursor stands */
inline encode_orderbook_clear_message(orderbook_clear_message_record) {
  orderbook_clear_message_at = 0;
  do
  :: orderbook_clear_message_at < 4 -> wire[at] = orderbook_clear_message_record.orderbook_id[orderbook_clear_message_at]; at = at + 1; orderbook_clear_message_at = orderbook_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Orderbook Clear Message off the wire, 4 bytes from where the cursor stands */
inline decode_orderbook_clear_message(orderbook_clear_message_record) {
  orderbook_clear_message_at = 0;
  do
  :: orderbook_clear_message_at < 4 -> orderbook_clear_message_record.orderbook_id[orderbook_clear_message_at] = wire[at]; at = at + 1; orderbook_clear_message_at = orderbook_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Orderbook Clear Message is what was written, byte for byte */
inline equal_orderbook_clear_message(orderbook_clear_message_read, orderbook_clear_message_written) {
  orderbook_clear_message_at = 0;
  do
  :: orderbook_clear_message_at < 4 -> assert(orderbook_clear_message_read.orderbook_id[orderbook_clear_message_at] == orderbook_clear_message_written.orderbook_id[orderbook_clear_message_at]); orderbook_clear_message_at = orderbook_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Request: 12 bytes ------------------------------------------------- */

/* The Quote Request message is generated whenever market participants request a new quotation */
typedef QuoteRequest {
  byte orderbook_id[4];
  byte quote_quantity[4];
  byte bid_ask_flag;
  byte filler_3[3]
};

int quote_request_at;

/* every byte of Quote Request set to one value */
inline fill_quote_request(quote_request_record, quote_request_value) {
  quote_request_at = 0;
  do
  :: quote_request_at < 4 -> quote_request_record.orderbook_id[quote_request_at] = quote_request_value; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_at = 0;
  do
  :: quote_request_at < 4 -> quote_request_record.quote_quantity[quote_request_at] = quote_request_value; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_record.bid_ask_flag = quote_request_value;
  quote_request_at = 0;
  do
  :: quote_request_at < 3 -> quote_request_record.filler_3[quote_request_at] = quote_request_value; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Request set to where it lies, so a field read out of place says so */
inline ramp_quote_request(quote_request_record, quote_request_base) {
  quote_request_at = 0;
  do
  :: quote_request_at < 4 -> quote_request_record.orderbook_id[quote_request_at] = (quote_request_base + 0 + quote_request_at + 1) % 256; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_at = 0;
  do
  :: quote_request_at < 4 -> quote_request_record.quote_quantity[quote_request_at] = (quote_request_base + 4 + quote_request_at + 1) % 256; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_record.bid_ask_flag = (quote_request_base + 8 + 1) % 256;
  quote_request_at = 0;
  do
  :: quote_request_at < 3 -> quote_request_record.filler_3[quote_request_at] = (quote_request_base + 9 + quote_request_at + 1) % 256; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Request to the wire, 12 bytes from where the cursor stands */
inline encode_quote_request(quote_request_record) {
  quote_request_at = 0;
  do
  :: quote_request_at < 4 -> wire[at] = quote_request_record.orderbook_id[quote_request_at]; at = at + 1; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_at = 0;
  do
  :: quote_request_at < 4 -> wire[at] = quote_request_record.quote_quantity[quote_request_at]; at = at + 1; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  wire[at] = quote_request_record.bid_ask_flag; at = at + 1;
  quote_request_at = 0;
  do
  :: quote_request_at < 3 -> wire[at] = quote_request_record.filler_3[quote_request_at]; at = at + 1; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Request off the wire, 12 bytes from where the cursor stands */
inline decode_quote_request(quote_request_record) {
  quote_request_at = 0;
  do
  :: quote_request_at < 4 -> quote_request_record.orderbook_id[quote_request_at] = wire[at]; at = at + 1; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_at = 0;
  do
  :: quote_request_at < 4 -> quote_request_record.quote_quantity[quote_request_at] = wire[at]; at = at + 1; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_record.bid_ask_flag = wire[at]; at = at + 1;
  quote_request_at = 0;
  do
  :: quote_request_at < 3 -> quote_request_record.filler_3[quote_request_at] = wire[at]; at = at + 1; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Request is what was written, byte for byte */
inline equal_quote_request(quote_request_read, quote_request_written) {
  quote_request_at = 0;
  do
  :: quote_request_at < 4 -> assert(quote_request_read.orderbook_id[quote_request_at] == quote_request_written.orderbook_id[quote_request_at]); quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_at = 0;
  do
  :: quote_request_at < 4 -> assert(quote_request_read.quote_quantity[quote_request_at] == quote_request_written.quote_quantity[quote_request_at]); quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  assert(quote_request_read.bid_ask_flag == quote_request_written.bid_ask_flag);
  quote_request_at = 0;
  do
  :: quote_request_at < 3 -> assert(quote_request_read.filler_3[quote_request_at] == quote_request_written.filler_3[quote_request_at]); quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Commodity Definition: 89 bytes ------------------------------------------ */

/* Describes individual commodities available from the OMD-D system */
typedef CommodityDefinition {
  byte commodity_code[4];
  byte commodity_name[40];
  byte commodity_id[6];
  byte underlying_code[20];
  byte underlying_type;
  byte decimal_in_underlying_price;
  byte base_currency[3];
  byte underlying_source[6];
  byte ca_created;
  byte effective_tomorrow;
  byte filler_6[6]
};

int commodity_definition_at;

/* every byte of Commodity Definition set to one value */
inline fill_commodity_definition(commodity_definition_record, commodity_definition_value) {
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 4 -> commodity_definition_record.commodity_code[commodity_definition_at] = commodity_definition_value; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 40 -> commodity_definition_record.commodity_name[commodity_definition_at] = commodity_definition_value; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 6 -> commodity_definition_record.commodity_id[commodity_definition_at] = commodity_definition_value; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 20 -> commodity_definition_record.underlying_code[commodity_definition_at] = commodity_definition_value; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_record.underlying_type = commodity_definition_value;
  commodity_definition_record.decimal_in_underlying_price = commodity_definition_value;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 3 -> commodity_definition_record.base_currency[commodity_definition_at] = commodity_definition_value; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 6 -> commodity_definition_record.underlying_source[commodity_definition_at] = commodity_definition_value; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_record.ca_created = commodity_definition_value;
  commodity_definition_record.effective_tomorrow = commodity_definition_value;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 6 -> commodity_definition_record.filler_6[commodity_definition_at] = commodity_definition_value; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Commodity Definition set to where it lies, so a field read out of place says so */
inline ramp_commodity_definition(commodity_definition_record, commodity_definition_base) {
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 4 -> commodity_definition_record.commodity_code[commodity_definition_at] = (commodity_definition_base + 0 + commodity_definition_at + 1) % 256; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 40 -> commodity_definition_record.commodity_name[commodity_definition_at] = (commodity_definition_base + 4 + commodity_definition_at + 1) % 256; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 6 -> commodity_definition_record.commodity_id[commodity_definition_at] = (commodity_definition_base + 44 + commodity_definition_at + 1) % 256; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 20 -> commodity_definition_record.underlying_code[commodity_definition_at] = (commodity_definition_base + 50 + commodity_definition_at + 1) % 256; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_record.underlying_type = (commodity_definition_base + 70 + 1) % 256;
  commodity_definition_record.decimal_in_underlying_price = (commodity_definition_base + 71 + 1) % 256;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 3 -> commodity_definition_record.base_currency[commodity_definition_at] = (commodity_definition_base + 72 + commodity_definition_at + 1) % 256; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 6 -> commodity_definition_record.underlying_source[commodity_definition_at] = (commodity_definition_base + 75 + commodity_definition_at + 1) % 256; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_record.ca_created = (commodity_definition_base + 81 + 1) % 256;
  commodity_definition_record.effective_tomorrow = (commodity_definition_base + 82 + 1) % 256;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 6 -> commodity_definition_record.filler_6[commodity_definition_at] = (commodity_definition_base + 83 + commodity_definition_at + 1) % 256; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  skip
}

/* Commodity Definition to the wire, 89 bytes from where the cursor stands */
inline encode_commodity_definition(commodity_definition_record) {
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 4 -> wire[at] = commodity_definition_record.commodity_code[commodity_definition_at]; at = at + 1; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 40 -> wire[at] = commodity_definition_record.commodity_name[commodity_definition_at]; at = at + 1; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 6 -> wire[at] = commodity_definition_record.commodity_id[commodity_definition_at]; at = at + 1; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 20 -> wire[at] = commodity_definition_record.underlying_code[commodity_definition_at]; at = at + 1; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  wire[at] = commodity_definition_record.underlying_type; at = at + 1;
  wire[at] = commodity_definition_record.decimal_in_underlying_price; at = at + 1;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 3 -> wire[at] = commodity_definition_record.base_currency[commodity_definition_at]; at = at + 1; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 6 -> wire[at] = commodity_definition_record.underlying_source[commodity_definition_at]; at = at + 1; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  wire[at] = commodity_definition_record.ca_created; at = at + 1;
  wire[at] = commodity_definition_record.effective_tomorrow; at = at + 1;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 6 -> wire[at] = commodity_definition_record.filler_6[commodity_definition_at]; at = at + 1; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  skip
}

/* Commodity Definition off the wire, 89 bytes from where the cursor stands */
inline decode_commodity_definition(commodity_definition_record) {
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 4 -> commodity_definition_record.commodity_code[commodity_definition_at] = wire[at]; at = at + 1; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 40 -> commodity_definition_record.commodity_name[commodity_definition_at] = wire[at]; at = at + 1; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 6 -> commodity_definition_record.commodity_id[commodity_definition_at] = wire[at]; at = at + 1; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 20 -> commodity_definition_record.underlying_code[commodity_definition_at] = wire[at]; at = at + 1; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_record.underlying_type = wire[at]; at = at + 1;
  commodity_definition_record.decimal_in_underlying_price = wire[at]; at = at + 1;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 3 -> commodity_definition_record.base_currency[commodity_definition_at] = wire[at]; at = at + 1; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 6 -> commodity_definition_record.underlying_source[commodity_definition_at] = wire[at]; at = at + 1; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_record.ca_created = wire[at]; at = at + 1;
  commodity_definition_record.effective_tomorrow = wire[at]; at = at + 1;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 6 -> commodity_definition_record.filler_6[commodity_definition_at] = wire[at]; at = at + 1; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Commodity Definition is what was written, byte for byte */
inline equal_commodity_definition(commodity_definition_read, commodity_definition_written) {
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 4 -> assert(commodity_definition_read.commodity_code[commodity_definition_at] == commodity_definition_written.commodity_code[commodity_definition_at]); commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 40 -> assert(commodity_definition_read.commodity_name[commodity_definition_at] == commodity_definition_written.commodity_name[commodity_definition_at]); commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 6 -> assert(commodity_definition_read.commodity_id[commodity_definition_at] == commodity_definition_written.commodity_id[commodity_definition_at]); commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 20 -> assert(commodity_definition_read.underlying_code[commodity_definition_at] == commodity_definition_written.underlying_code[commodity_definition_at]); commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  assert(commodity_definition_read.underlying_type == commodity_definition_written.underlying_type);
  assert(commodity_definition_read.decimal_in_underlying_price == commodity_definition_written.decimal_in_underlying_price);
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 3 -> assert(commodity_definition_read.base_currency[commodity_definition_at] == commodity_definition_written.base_currency[commodity_definition_at]); commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 6 -> assert(commodity_definition_read.underlying_source[commodity_definition_at] == commodity_definition_written.underlying_source[commodity_definition_at]); commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  assert(commodity_definition_read.ca_created == commodity_definition_written.ca_created);
  assert(commodity_definition_read.effective_tomorrow == commodity_definition_written.effective_tomorrow);
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 6 -> assert(commodity_definition_read.filler_6[commodity_definition_at] == commodity_definition_written.filler_6[commodity_definition_at]); commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Class Definition: 106 bytes --------------------------------------------- */

/* Describes individual instrument classes available from the OMD-D system. */
typedef ClassDefinition {
  byte instrument_class_id[14];
  byte instrument_class_key[4];
  byte instrument_class_name[40];
  byte exchange[2];
  byte market[2];
  byte instrument_group[2];
  byte modifier;
  byte commodity_code[4];
  byte filler_3[3];
  byte price_quotation_factor[4];
  byte contract_size[4];
  byte decimal_in_contract_size;
  byte decimal_in_strike_price;
  byte decimal_in_price;
  byte tick_size[8];
  byte tradable;
  byte base_currency[3];
  byte settlement_currency_id[3];
  byte effective_tomorrow;
  byte filler_7[7]
};

int class_definition_at;

/* every byte of Class Definition set to one value */
inline fill_class_definition(class_definition_record, class_definition_value) {
  class_definition_at = 0;
  do
  :: class_definition_at < 14 -> class_definition_record.instrument_class_id[class_definition_at] = class_definition_value; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> class_definition_record.instrument_class_key[class_definition_at] = class_definition_value; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 40 -> class_definition_record.instrument_class_name[class_definition_at] = class_definition_value; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> class_definition_record.exchange[class_definition_at] = class_definition_value; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> class_definition_record.market[class_definition_at] = class_definition_value; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> class_definition_record.instrument_group[class_definition_at] = class_definition_value; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_record.modifier = class_definition_value;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> class_definition_record.commodity_code[class_definition_at] = class_definition_value; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 3 -> class_definition_record.filler_3[class_definition_at] = class_definition_value; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> class_definition_record.price_quotation_factor[class_definition_at] = class_definition_value; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> class_definition_record.contract_size[class_definition_at] = class_definition_value; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_record.decimal_in_contract_size = class_definition_value;
  class_definition_record.decimal_in_strike_price = class_definition_value;
  class_definition_record.decimal_in_price = class_definition_value;
  class_definition_at = 0;
  do
  :: class_definition_at < 8 -> class_definition_record.tick_size[class_definition_at] = class_definition_value; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_record.tradable = class_definition_value;
  class_definition_at = 0;
  do
  :: class_definition_at < 3 -> class_definition_record.base_currency[class_definition_at] = class_definition_value; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 3 -> class_definition_record.settlement_currency_id[class_definition_at] = class_definition_value; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_record.effective_tomorrow = class_definition_value;
  class_definition_at = 0;
  do
  :: class_definition_at < 7 -> class_definition_record.filler_7[class_definition_at] = class_definition_value; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Class Definition set to where it lies, so a field read out of place says so */
inline ramp_class_definition(class_definition_record, class_definition_base) {
  class_definition_at = 0;
  do
  :: class_definition_at < 14 -> class_definition_record.instrument_class_id[class_definition_at] = (class_definition_base + 0 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> class_definition_record.instrument_class_key[class_definition_at] = (class_definition_base + 14 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 40 -> class_definition_record.instrument_class_name[class_definition_at] = (class_definition_base + 18 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> class_definition_record.exchange[class_definition_at] = (class_definition_base + 58 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> class_definition_record.market[class_definition_at] = (class_definition_base + 60 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> class_definition_record.instrument_group[class_definition_at] = (class_definition_base + 62 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_record.modifier = (class_definition_base + 64 + 1) % 256;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> class_definition_record.commodity_code[class_definition_at] = (class_definition_base + 65 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 3 -> class_definition_record.filler_3[class_definition_at] = (class_definition_base + 69 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> class_definition_record.price_quotation_factor[class_definition_at] = (class_definition_base + 72 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> class_definition_record.contract_size[class_definition_at] = (class_definition_base + 76 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_record.decimal_in_contract_size = (class_definition_base + 80 + 1) % 256;
  class_definition_record.decimal_in_strike_price = (class_definition_base + 81 + 1) % 256;
  class_definition_record.decimal_in_price = (class_definition_base + 82 + 1) % 256;
  class_definition_at = 0;
  do
  :: class_definition_at < 8 -> class_definition_record.tick_size[class_definition_at] = (class_definition_base + 83 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_record.tradable = (class_definition_base + 91 + 1) % 256;
  class_definition_at = 0;
  do
  :: class_definition_at < 3 -> class_definition_record.base_currency[class_definition_at] = (class_definition_base + 92 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 3 -> class_definition_record.settlement_currency_id[class_definition_at] = (class_definition_base + 95 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_record.effective_tomorrow = (class_definition_base + 98 + 1) % 256;
  class_definition_at = 0;
  do
  :: class_definition_at < 7 -> class_definition_record.filler_7[class_definition_at] = (class_definition_base + 99 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  skip
}

/* Class Definition to the wire, 106 bytes from where the cursor stands */
inline encode_class_definition(class_definition_record) {
  class_definition_at = 0;
  do
  :: class_definition_at < 14 -> wire[at] = class_definition_record.instrument_class_id[class_definition_at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> wire[at] = class_definition_record.instrument_class_key[class_definition_at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 40 -> wire[at] = class_definition_record.instrument_class_name[class_definition_at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> wire[at] = class_definition_record.exchange[class_definition_at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> wire[at] = class_definition_record.market[class_definition_at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> wire[at] = class_definition_record.instrument_group[class_definition_at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  wire[at] = class_definition_record.modifier; at = at + 1;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> wire[at] = class_definition_record.commodity_code[class_definition_at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 3 -> wire[at] = class_definition_record.filler_3[class_definition_at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> wire[at] = class_definition_record.price_quotation_factor[class_definition_at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> wire[at] = class_definition_record.contract_size[class_definition_at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  wire[at] = class_definition_record.decimal_in_contract_size; at = at + 1;
  wire[at] = class_definition_record.decimal_in_strike_price; at = at + 1;
  wire[at] = class_definition_record.decimal_in_price; at = at + 1;
  class_definition_at = 0;
  do
  :: class_definition_at < 8 -> wire[at] = class_definition_record.tick_size[class_definition_at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  wire[at] = class_definition_record.tradable; at = at + 1;
  class_definition_at = 0;
  do
  :: class_definition_at < 3 -> wire[at] = class_definition_record.base_currency[class_definition_at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 3 -> wire[at] = class_definition_record.settlement_currency_id[class_definition_at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  wire[at] = class_definition_record.effective_tomorrow; at = at + 1;
  class_definition_at = 0;
  do
  :: class_definition_at < 7 -> wire[at] = class_definition_record.filler_7[class_definition_at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  skip
}

/* Class Definition off the wire, 106 bytes from where the cursor stands */
inline decode_class_definition(class_definition_record) {
  class_definition_at = 0;
  do
  :: class_definition_at < 14 -> class_definition_record.instrument_class_id[class_definition_at] = wire[at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> class_definition_record.instrument_class_key[class_definition_at] = wire[at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 40 -> class_definition_record.instrument_class_name[class_definition_at] = wire[at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> class_definition_record.exchange[class_definition_at] = wire[at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> class_definition_record.market[class_definition_at] = wire[at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> class_definition_record.instrument_group[class_definition_at] = wire[at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_record.modifier = wire[at]; at = at + 1;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> class_definition_record.commodity_code[class_definition_at] = wire[at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 3 -> class_definition_record.filler_3[class_definition_at] = wire[at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> class_definition_record.price_quotation_factor[class_definition_at] = wire[at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> class_definition_record.contract_size[class_definition_at] = wire[at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_record.decimal_in_contract_size = wire[at]; at = at + 1;
  class_definition_record.decimal_in_strike_price = wire[at]; at = at + 1;
  class_definition_record.decimal_in_price = wire[at]; at = at + 1;
  class_definition_at = 0;
  do
  :: class_definition_at < 8 -> class_definition_record.tick_size[class_definition_at] = wire[at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_record.tradable = wire[at]; at = at + 1;
  class_definition_at = 0;
  do
  :: class_definition_at < 3 -> class_definition_record.base_currency[class_definition_at] = wire[at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 3 -> class_definition_record.settlement_currency_id[class_definition_at] = wire[at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_record.effective_tomorrow = wire[at]; at = at + 1;
  class_definition_at = 0;
  do
  :: class_definition_at < 7 -> class_definition_record.filler_7[class_definition_at] = wire[at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Class Definition is what was written, byte for byte */
inline equal_class_definition(class_definition_read, class_definition_written) {
  class_definition_at = 0;
  do
  :: class_definition_at < 14 -> assert(class_definition_read.instrument_class_id[class_definition_at] == class_definition_written.instrument_class_id[class_definition_at]); class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> assert(class_definition_read.instrument_class_key[class_definition_at] == class_definition_written.instrument_class_key[class_definition_at]); class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 40 -> assert(class_definition_read.instrument_class_name[class_definition_at] == class_definition_written.instrument_class_name[class_definition_at]); class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> assert(class_definition_read.exchange[class_definition_at] == class_definition_written.exchange[class_definition_at]); class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> assert(class_definition_read.market[class_definition_at] == class_definition_written.market[class_definition_at]); class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> assert(class_definition_read.instrument_group[class_definition_at] == class_definition_written.instrument_group[class_definition_at]); class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  assert(class_definition_read.modifier == class_definition_written.modifier);
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> assert(class_definition_read.commodity_code[class_definition_at] == class_definition_written.commodity_code[class_definition_at]); class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 3 -> assert(class_definition_read.filler_3[class_definition_at] == class_definition_written.filler_3[class_definition_at]); class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> assert(class_definition_read.price_quotation_factor[class_definition_at] == class_definition_written.price_quotation_factor[class_definition_at]); class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> assert(class_definition_read.contract_size[class_definition_at] == class_definition_written.contract_size[class_definition_at]); class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  assert(class_definition_read.decimal_in_contract_size == class_definition_written.decimal_in_contract_size);
  assert(class_definition_read.decimal_in_strike_price == class_definition_written.decimal_in_strike_price);
  assert(class_definition_read.decimal_in_price == class_definition_written.decimal_in_price);
  class_definition_at = 0;
  do
  :: class_definition_at < 8 -> assert(class_definition_read.tick_size[class_definition_at] == class_definition_written.tick_size[class_definition_at]); class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  assert(class_definition_read.tradable == class_definition_written.tradable);
  class_definition_at = 0;
  do
  :: class_definition_at < 3 -> assert(class_definition_read.base_currency[class_definition_at] == class_definition_written.base_currency[class_definition_at]); class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 3 -> assert(class_definition_read.settlement_currency_id[class_definition_at] == class_definition_written.settlement_currency_id[class_definition_at]); class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  assert(class_definition_read.effective_tomorrow == class_definition_written.effective_tomorrow);
  class_definition_at = 0;
  do
  :: class_definition_at < 7 -> assert(class_definition_read.filler_7[class_definition_at] == class_definition_written.filler_7[class_definition_at]); class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Definition: 118 bytes ---------------------------------------- */

/* Describes instrument static data. */
typedef InstrumentDefinition {
  byte orderbook_id[4];
  byte symbol[32];
  byte instrument_class_key[4];
  byte exchange[2];
  byte market[2];
  byte instrument_group[2];
  byte modifier;
  byte commodity_code[4];
  byte last_trading_date[4];
  byte strike_price[8];
  byte filler_3[3];
  byte date_time_last_trading[8];
  byte effective_last_trading_date[4];
  byte date_time_first_trading[8];
  byte instrument_status_code;
  byte decimal_in_strike_price;
  byte decimal_in_price;
  byte financial_product;
  byte put_or_call;
  byte contract_size[4];
  byte price_quotation_factor[4];
  byte number_of_legs;
  byte vcm_flag;
  byte isin_code[12];
  byte effective_tomorrow;
  byte filler_4[4]
};

int instrument_definition_at;

/* every byte of Instrument Definition set to one value */
inline fill_instrument_definition(instrument_definition_record, instrument_definition_value) {
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.orderbook_id[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 32 -> instrument_definition_record.symbol[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.instrument_class_key[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 2 -> instrument_definition_record.exchange[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 2 -> instrument_definition_record.market[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 2 -> instrument_definition_record.instrument_group[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_record.modifier = instrument_definition_value;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.commodity_code[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.last_trading_date[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 8 -> instrument_definition_record.strike_price[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 3 -> instrument_definition_record.filler_3[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 8 -> instrument_definition_record.date_time_last_trading[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.effective_last_trading_date[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 8 -> instrument_definition_record.date_time_first_trading[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_record.instrument_status_code = instrument_definition_value;
  instrument_definition_record.decimal_in_strike_price = instrument_definition_value;
  instrument_definition_record.decimal_in_price = instrument_definition_value;
  instrument_definition_record.financial_product = instrument_definition_value;
  instrument_definition_record.put_or_call = instrument_definition_value;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.contract_size[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.price_quotation_factor[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_record.number_of_legs = instrument_definition_value;
  instrument_definition_record.vcm_flag = instrument_definition_value;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 12 -> instrument_definition_record.isin_code[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_record.effective_tomorrow = instrument_definition_value;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.filler_4[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument Definition set to where it lies, so a field read out of place says so */
inline ramp_instrument_definition(instrument_definition_record, instrument_definition_base) {
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.orderbook_id[instrument_definition_at] = (instrument_definition_base + 0 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 32 -> instrument_definition_record.symbol[instrument_definition_at] = (instrument_definition_base + 4 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.instrument_class_key[instrument_definition_at] = (instrument_definition_base + 36 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 2 -> instrument_definition_record.exchange[instrument_definition_at] = (instrument_definition_base + 40 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 2 -> instrument_definition_record.market[instrument_definition_at] = (instrument_definition_base + 42 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 2 -> instrument_definition_record.instrument_group[instrument_definition_at] = (instrument_definition_base + 44 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_record.modifier = (instrument_definition_base + 46 + 1) % 256;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.commodity_code[instrument_definition_at] = (instrument_definition_base + 47 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.last_trading_date[instrument_definition_at] = (instrument_definition_base + 51 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 8 -> instrument_definition_record.strike_price[instrument_definition_at] = (instrument_definition_base + 55 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 3 -> instrument_definition_record.filler_3[instrument_definition_at] = (instrument_definition_base + 63 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 8 -> instrument_definition_record.date_time_last_trading[instrument_definition_at] = (instrument_definition_base + 66 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.effective_last_trading_date[instrument_definition_at] = (instrument_definition_base + 74 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 8 -> instrument_definition_record.date_time_first_trading[instrument_definition_at] = (instrument_definition_base + 78 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_record.instrument_status_code = (instrument_definition_base + 86 + 1) % 256;
  instrument_definition_record.decimal_in_strike_price = (instrument_definition_base + 87 + 1) % 256;
  instrument_definition_record.decimal_in_price = (instrument_definition_base + 88 + 1) % 256;
  instrument_definition_record.financial_product = (instrument_definition_base + 89 + 1) % 256;
  instrument_definition_record.put_or_call = (instrument_definition_base + 90 + 1) % 256;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.contract_size[instrument_definition_at] = (instrument_definition_base + 91 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.price_quotation_factor[instrument_definition_at] = (instrument_definition_base + 95 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_record.number_of_legs = (instrument_definition_base + 99 + 1) % 256;
  instrument_definition_record.vcm_flag = (instrument_definition_base + 100 + 1) % 256;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 12 -> instrument_definition_record.isin_code[instrument_definition_at] = (instrument_definition_base + 101 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_record.effective_tomorrow = (instrument_definition_base + 113 + 1) % 256;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.filler_4[instrument_definition_at] = (instrument_definition_base + 114 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Definition to the wire, 118 bytes from where the cursor stands */
inline encode_instrument_definition(instrument_definition_record) {
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> wire[at] = instrument_definition_record.orderbook_id[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 32 -> wire[at] = instrument_definition_record.symbol[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> wire[at] = instrument_definition_record.instrument_class_key[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 2 -> wire[at] = instrument_definition_record.exchange[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 2 -> wire[at] = instrument_definition_record.market[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 2 -> wire[at] = instrument_definition_record.instrument_group[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  wire[at] = instrument_definition_record.modifier; at = at + 1;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> wire[at] = instrument_definition_record.commodity_code[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> wire[at] = instrument_definition_record.last_trading_date[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 8 -> wire[at] = instrument_definition_record.strike_price[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 3 -> wire[at] = instrument_definition_record.filler_3[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 8 -> wire[at] = instrument_definition_record.date_time_last_trading[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> wire[at] = instrument_definition_record.effective_last_trading_date[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 8 -> wire[at] = instrument_definition_record.date_time_first_trading[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  wire[at] = instrument_definition_record.instrument_status_code; at = at + 1;
  wire[at] = instrument_definition_record.decimal_in_strike_price; at = at + 1;
  wire[at] = instrument_definition_record.decimal_in_price; at = at + 1;
  wire[at] = instrument_definition_record.financial_product; at = at + 1;
  wire[at] = instrument_definition_record.put_or_call; at = at + 1;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> wire[at] = instrument_definition_record.contract_size[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> wire[at] = instrument_definition_record.price_quotation_factor[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  wire[at] = instrument_definition_record.number_of_legs; at = at + 1;
  wire[at] = instrument_definition_record.vcm_flag; at = at + 1;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 12 -> wire[at] = instrument_definition_record.isin_code[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  wire[at] = instrument_definition_record.effective_tomorrow; at = at + 1;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> wire[at] = instrument_definition_record.filler_4[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Definition off the wire, 118 bytes from where the cursor stands */
inline decode_instrument_definition(instrument_definition_record) {
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.orderbook_id[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 32 -> instrument_definition_record.symbol[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.instrument_class_key[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 2 -> instrument_definition_record.exchange[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 2 -> instrument_definition_record.market[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 2 -> instrument_definition_record.instrument_group[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_record.modifier = wire[at]; at = at + 1;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.commodity_code[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.last_trading_date[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 8 -> instrument_definition_record.strike_price[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 3 -> instrument_definition_record.filler_3[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 8 -> instrument_definition_record.date_time_last_trading[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.effective_last_trading_date[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 8 -> instrument_definition_record.date_time_first_trading[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_record.instrument_status_code = wire[at]; at = at + 1;
  instrument_definition_record.decimal_in_strike_price = wire[at]; at = at + 1;
  instrument_definition_record.decimal_in_price = wire[at]; at = at + 1;
  instrument_definition_record.financial_product = wire[at]; at = at + 1;
  instrument_definition_record.put_or_call = wire[at]; at = at + 1;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.contract_size[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.price_quotation_factor[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_record.number_of_legs = wire[at]; at = at + 1;
  instrument_definition_record.vcm_flag = wire[at]; at = at + 1;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 12 -> instrument_definition_record.isin_code[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_record.effective_tomorrow = wire[at]; at = at + 1;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.filler_4[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument Definition is what was written, byte for byte */
inline equal_instrument_definition(instrument_definition_read, instrument_definition_written) {
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> assert(instrument_definition_read.orderbook_id[instrument_definition_at] == instrument_definition_written.orderbook_id[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 32 -> assert(instrument_definition_read.symbol[instrument_definition_at] == instrument_definition_written.symbol[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> assert(instrument_definition_read.instrument_class_key[instrument_definition_at] == instrument_definition_written.instrument_class_key[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 2 -> assert(instrument_definition_read.exchange[instrument_definition_at] == instrument_definition_written.exchange[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 2 -> assert(instrument_definition_read.market[instrument_definition_at] == instrument_definition_written.market[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 2 -> assert(instrument_definition_read.instrument_group[instrument_definition_at] == instrument_definition_written.instrument_group[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  assert(instrument_definition_read.modifier == instrument_definition_written.modifier);
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> assert(instrument_definition_read.commodity_code[instrument_definition_at] == instrument_definition_written.commodity_code[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> assert(instrument_definition_read.last_trading_date[instrument_definition_at] == instrument_definition_written.last_trading_date[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 8 -> assert(instrument_definition_read.strike_price[instrument_definition_at] == instrument_definition_written.strike_price[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 3 -> assert(instrument_definition_read.filler_3[instrument_definition_at] == instrument_definition_written.filler_3[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 8 -> assert(instrument_definition_read.date_time_last_trading[instrument_definition_at] == instrument_definition_written.date_time_last_trading[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> assert(instrument_definition_read.effective_last_trading_date[instrument_definition_at] == instrument_definition_written.effective_last_trading_date[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 8 -> assert(instrument_definition_read.date_time_first_trading[instrument_definition_at] == instrument_definition_written.date_time_first_trading[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  assert(instrument_definition_read.instrument_status_code == instrument_definition_written.instrument_status_code);
  assert(instrument_definition_read.decimal_in_strike_price == instrument_definition_written.decimal_in_strike_price);
  assert(instrument_definition_read.decimal_in_price == instrument_definition_written.decimal_in_price);
  assert(instrument_definition_read.financial_product == instrument_definition_written.financial_product);
  assert(instrument_definition_read.put_or_call == instrument_definition_written.put_or_call);
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> assert(instrument_definition_read.contract_size[instrument_definition_at] == instrument_definition_written.contract_size[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> assert(instrument_definition_read.price_quotation_factor[instrument_definition_at] == instrument_definition_written.price_quotation_factor[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  assert(instrument_definition_read.number_of_legs == instrument_definition_written.number_of_legs);
  assert(instrument_definition_read.vcm_flag == instrument_definition_written.vcm_flag);
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 12 -> assert(instrument_definition_read.isin_code[instrument_definition_at] == instrument_definition_written.isin_code[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  assert(instrument_definition_read.effective_tomorrow == instrument_definition_written.effective_tomorrow);
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> assert(instrument_definition_read.filler_4[instrument_definition_at] == instrument_definition_written.filler_4[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Combination Definition: 16 bytes ---------------------------------------- */

/* Describes the composition of a combination instrument. */
typedef CombinationDefinition {
  byte combo_orderbook_id[4];
  byte leg_orderbook_id[4];
  byte filler_3[3];
  byte leg_side;
  byte leg_ratio[4]
};

int combination_definition_at;

/* every byte of Combination Definition set to one value */
inline fill_combination_definition(combination_definition_record, combination_definition_value) {
  combination_definition_at = 0;
  do
  :: combination_definition_at < 4 -> combination_definition_record.combo_orderbook_id[combination_definition_at] = combination_definition_value; combination_definition_at = combination_definition_at + 1
  :: else -> break
  od;
  combination_definition_at = 0;
  do
  :: combination_definition_at < 4 -> combination_definition_record.leg_orderbook_id[combination_definition_at] = combination_definition_value; combination_definition_at = combination_definition_at + 1
  :: else -> break
  od;
  combination_definition_at = 0;
  do
  :: combination_definition_at < 3 -> combination_definition_record.filler_3[combination_definition_at] = combination_definition_value; combination_definition_at = combination_definition_at + 1
  :: else -> break
  od;
  combination_definition_record.leg_side = combination_definition_value;
  combination_definition_at = 0;
  do
  :: combination_definition_at < 4 -> combination_definition_record.leg_ratio[combination_definition_at] = combination_definition_value; combination_definition_at = combination_definition_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Combination Definition set to where it lies, so a field read out of place says so */
inline ramp_combination_definition(combination_definition_record, combination_definition_base) {
  combination_definition_at = 0;
  do
  :: combination_definition_at < 4 -> combination_definition_record.combo_orderbook_id[combination_definition_at] = (combination_definition_base + 0 + combination_definition_at + 1) % 256; combination_definition_at = combination_definition_at + 1
  :: else -> break
  od;
  combination_definition_at = 0;
  do
  :: combination_definition_at < 4 -> combination_definition_record.leg_orderbook_id[combination_definition_at] = (combination_definition_base + 4 + combination_definition_at + 1) % 256; combination_definition_at = combination_definition_at + 1
  :: else -> break
  od;
  combination_definition_at = 0;
  do
  :: combination_definition_at < 3 -> combination_definition_record.filler_3[combination_definition_at] = (combination_definition_base + 8 + combination_definition_at + 1) % 256; combination_definition_at = combination_definition_at + 1
  :: else -> break
  od;
  combination_definition_record.leg_side = (combination_definition_base + 11 + 1) % 256;
  combination_definition_at = 0;
  do
  :: combination_definition_at < 4 -> combination_definition_record.leg_ratio[combination_definition_at] = (combination_definition_base + 12 + combination_definition_at + 1) % 256; combination_definition_at = combination_definition_at + 1
  :: else -> break
  od;
  skip
}

/* Combination Definition to the wire, 16 bytes from where the cursor stands */
inline encode_combination_definition(combination_definition_record) {
  combination_definition_at = 0;
  do
  :: combination_definition_at < 4 -> wire[at] = combination_definition_record.combo_orderbook_id[combination_definition_at]; at = at + 1; combination_definition_at = combination_definition_at + 1
  :: else -> break
  od;
  combination_definition_at = 0;
  do
  :: combination_definition_at < 4 -> wire[at] = combination_definition_record.leg_orderbook_id[combination_definition_at]; at = at + 1; combination_definition_at = combination_definition_at + 1
  :: else -> break
  od;
  combination_definition_at = 0;
  do
  :: combination_definition_at < 3 -> wire[at] = combination_definition_record.filler_3[combination_definition_at]; at = at + 1; combination_definition_at = combination_definition_at + 1
  :: else -> break
  od;
  wire[at] = combination_definition_record.leg_side; at = at + 1;
  combination_definition_at = 0;
  do
  :: combination_definition_at < 4 -> wire[at] = combination_definition_record.leg_ratio[combination_definition_at]; at = at + 1; combination_definition_at = combination_definition_at + 1
  :: else -> break
  od;
  skip
}

/* Combination Definition off the wire, 16 bytes from where the cursor stands */
inline decode_combination_definition(combination_definition_record) {
  combination_definition_at = 0;
  do
  :: combination_definition_at < 4 -> combination_definition_record.combo_orderbook_id[combination_definition_at] = wire[at]; at = at + 1; combination_definition_at = combination_definition_at + 1
  :: else -> break
  od;
  combination_definition_at = 0;
  do
  :: combination_definition_at < 4 -> combination_definition_record.leg_orderbook_id[combination_definition_at] = wire[at]; at = at + 1; combination_definition_at = combination_definition_at + 1
  :: else -> break
  od;
  combination_definition_at = 0;
  do
  :: combination_definition_at < 3 -> combination_definition_record.filler_3[combination_definition_at] = wire[at]; at = at + 1; combination_definition_at = combination_definition_at + 1
  :: else -> break
  od;
  combination_definition_record.leg_side = wire[at]; at = at + 1;
  combination_definition_at = 0;
  do
  :: combination_definition_at < 4 -> combination_definition_record.leg_ratio[combination_definition_at] = wire[at]; at = at + 1; combination_definition_at = combination_definition_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Combination Definition is what was written, byte for byte */
inline equal_combination_definition(combination_definition_read, combination_definition_written) {
  combination_definition_at = 0;
  do
  :: combination_definition_at < 4 -> assert(combination_definition_read.combo_orderbook_id[combination_definition_at] == combination_definition_written.combo_orderbook_id[combination_definition_at]); combination_definition_at = combination_definition_at + 1
  :: else -> break
  od;
  combination_definition_at = 0;
  do
  :: combination_definition_at < 4 -> assert(combination_definition_read.leg_orderbook_id[combination_definition_at] == combination_definition_written.leg_orderbook_id[combination_definition_at]); combination_definition_at = combination_definition_at + 1
  :: else -> break
  od;
  combination_definition_at = 0;
  do
  :: combination_definition_at < 3 -> assert(combination_definition_read.filler_3[combination_definition_at] == combination_definition_written.filler_3[combination_definition_at]); combination_definition_at = combination_definition_at + 1
  :: else -> break
  od;
  assert(combination_definition_read.leg_side == combination_definition_written.leg_side);
  combination_definition_at = 0;
  do
  :: combination_definition_at < 4 -> assert(combination_definition_read.leg_ratio[combination_definition_at] == combination_definition_written.leg_ratio[combination_definition_at]); combination_definition_at = combination_definition_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Refresh Complete: 4 bytes ----------------------------------------------- */

/* RefreshComplete */
typedef RefreshComplete {
  byte last_seq_num[4]
};

int refresh_complete_at;

/* every byte of Refresh Complete set to one value */
inline fill_refresh_complete(refresh_complete_record, refresh_complete_value) {
  refresh_complete_at = 0;
  do
  :: refresh_complete_at < 4 -> refresh_complete_record.last_seq_num[refresh_complete_at] = refresh_complete_value; refresh_complete_at = refresh_complete_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Refresh Complete set to where it lies, so a field read out of place says so */
inline ramp_refresh_complete(refresh_complete_record, refresh_complete_base) {
  refresh_complete_at = 0;
  do
  :: refresh_complete_at < 4 -> refresh_complete_record.last_seq_num[refresh_complete_at] = (refresh_complete_base + 0 + refresh_complete_at + 1) % 256; refresh_complete_at = refresh_complete_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Complete to the wire, 4 bytes from where the cursor stands */
inline encode_refresh_complete(refresh_complete_record) {
  refresh_complete_at = 0;
  do
  :: refresh_complete_at < 4 -> wire[at] = refresh_complete_record.last_seq_num[refresh_complete_at]; at = at + 1; refresh_complete_at = refresh_complete_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Complete off the wire, 4 bytes from where the cursor stands */
inline decode_refresh_complete(refresh_complete_record) {
  refresh_complete_at = 0;
  do
  :: refresh_complete_at < 4 -> refresh_complete_record.last_seq_num[refresh_complete_at] = wire[at]; at = at + 1; refresh_complete_at = refresh_complete_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Refresh Complete is what was written, byte for byte */
inline equal_refresh_complete(refresh_complete_read, refresh_complete_written) {
  refresh_complete_at = 0;
  do
  :: refresh_complete_at < 4 -> assert(refresh_complete_read.last_seq_num[refresh_complete_at] == refresh_complete_written.last_seq_num[refresh_complete_at]); refresh_complete_at = refresh_complete_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Status: 54 bytes ------------------------------------------------- */

/* Indicates the state of the Market, Instrument Type, or Class. */
typedef MarketStatus {
  byte state_level;
  byte instrument_class_key[4];
  byte market[2];
  byte instrument_group[2];
  byte commodity_code[4];
  byte filler_8[8];
  byte actual_start_date[8];
  byte actual_start_time[6];
  byte planned_start_date[8];
  byte planned_start_time[6];
  byte trading_session;
  byte state[2];
  byte filler_2[2]
};

int market_status_at;

/* every byte of Market Status set to one value */
inline fill_market_status(market_status_record, market_status_value) {
  market_status_record.state_level = market_status_value;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> market_status_record.instrument_class_key[market_status_at] = market_status_value; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 2 -> market_status_record.market[market_status_at] = market_status_value; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 2 -> market_status_record.instrument_group[market_status_at] = market_status_value; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> market_status_record.commodity_code[market_status_at] = market_status_value; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 8 -> market_status_record.filler_8[market_status_at] = market_status_value; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 8 -> market_status_record.actual_start_date[market_status_at] = market_status_value; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 6 -> market_status_record.actual_start_time[market_status_at] = market_status_value; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 8 -> market_status_record.planned_start_date[market_status_at] = market_status_value; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 6 -> market_status_record.planned_start_time[market_status_at] = market_status_value; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_record.trading_session = market_status_value;
  market_status_at = 0;
  do
  :: market_status_at < 2 -> market_status_record.state[market_status_at] = market_status_value; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 2 -> market_status_record.filler_2[market_status_at] = market_status_value; market_status_at = market_status_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Status set to where it lies, so a field read out of place says so */
inline ramp_market_status(market_status_record, market_status_base) {
  market_status_record.state_level = (market_status_base + 0 + 1) % 256;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> market_status_record.instrument_class_key[market_status_at] = (market_status_base + 1 + market_status_at + 1) % 256; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 2 -> market_status_record.market[market_status_at] = (market_status_base + 5 + market_status_at + 1) % 256; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 2 -> market_status_record.instrument_group[market_status_at] = (market_status_base + 7 + market_status_at + 1) % 256; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> market_status_record.commodity_code[market_status_at] = (market_status_base + 9 + market_status_at + 1) % 256; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 8 -> market_status_record.filler_8[market_status_at] = (market_status_base + 13 + market_status_at + 1) % 256; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 8 -> market_status_record.actual_start_date[market_status_at] = (market_status_base + 21 + market_status_at + 1) % 256; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 6 -> market_status_record.actual_start_time[market_status_at] = (market_status_base + 29 + market_status_at + 1) % 256; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 8 -> market_status_record.planned_start_date[market_status_at] = (market_status_base + 35 + market_status_at + 1) % 256; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 6 -> market_status_record.planned_start_time[market_status_at] = (market_status_base + 43 + market_status_at + 1) % 256; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_record.trading_session = (market_status_base + 49 + 1) % 256;
  market_status_at = 0;
  do
  :: market_status_at < 2 -> market_status_record.state[market_status_at] = (market_status_base + 50 + market_status_at + 1) % 256; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 2 -> market_status_record.filler_2[market_status_at] = (market_status_base + 52 + market_status_at + 1) % 256; market_status_at = market_status_at + 1
  :: else -> break
  od;
  skip
}

/* Market Status to the wire, 54 bytes from where the cursor stands */
inline encode_market_status(market_status_record) {
  wire[at] = market_status_record.state_level; at = at + 1;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> wire[at] = market_status_record.instrument_class_key[market_status_at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 2 -> wire[at] = market_status_record.market[market_status_at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 2 -> wire[at] = market_status_record.instrument_group[market_status_at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> wire[at] = market_status_record.commodity_code[market_status_at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 8 -> wire[at] = market_status_record.filler_8[market_status_at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 8 -> wire[at] = market_status_record.actual_start_date[market_status_at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 6 -> wire[at] = market_status_record.actual_start_time[market_status_at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 8 -> wire[at] = market_status_record.planned_start_date[market_status_at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 6 -> wire[at] = market_status_record.planned_start_time[market_status_at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  wire[at] = market_status_record.trading_session; at = at + 1;
  market_status_at = 0;
  do
  :: market_status_at < 2 -> wire[at] = market_status_record.state[market_status_at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 2 -> wire[at] = market_status_record.filler_2[market_status_at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  skip
}

/* Market Status off the wire, 54 bytes from where the cursor stands */
inline decode_market_status(market_status_record) {
  market_status_record.state_level = wire[at]; at = at + 1;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> market_status_record.instrument_class_key[market_status_at] = wire[at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 2 -> market_status_record.market[market_status_at] = wire[at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 2 -> market_status_record.instrument_group[market_status_at] = wire[at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> market_status_record.commodity_code[market_status_at] = wire[at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 8 -> market_status_record.filler_8[market_status_at] = wire[at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 8 -> market_status_record.actual_start_date[market_status_at] = wire[at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 6 -> market_status_record.actual_start_time[market_status_at] = wire[at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 8 -> market_status_record.planned_start_date[market_status_at] = wire[at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 6 -> market_status_record.planned_start_time[market_status_at] = wire[at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_record.trading_session = wire[at]; at = at + 1;
  market_status_at = 0;
  do
  :: market_status_at < 2 -> market_status_record.state[market_status_at] = wire[at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 2 -> market_status_record.filler_2[market_status_at] = wire[at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Status is what was written, byte for byte */
inline equal_market_status(market_status_read, market_status_written) {
  assert(market_status_read.state_level == market_status_written.state_level);
  market_status_at = 0;
  do
  :: market_status_at < 4 -> assert(market_status_read.instrument_class_key[market_status_at] == market_status_written.instrument_class_key[market_status_at]); market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 2 -> assert(market_status_read.market[market_status_at] == market_status_written.market[market_status_at]); market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 2 -> assert(market_status_read.instrument_group[market_status_at] == market_status_written.instrument_group[market_status_at]); market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> assert(market_status_read.commodity_code[market_status_at] == market_status_written.commodity_code[market_status_at]); market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 8 -> assert(market_status_read.filler_8[market_status_at] == market_status_written.filler_8[market_status_at]); market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 8 -> assert(market_status_read.actual_start_date[market_status_at] == market_status_written.actual_start_date[market_status_at]); market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 6 -> assert(market_status_read.actual_start_time[market_status_at] == market_status_written.actual_start_time[market_status_at]); market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 8 -> assert(market_status_read.planned_start_date[market_status_at] == market_status_written.planned_start_date[market_status_at]); market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 6 -> assert(market_status_read.planned_start_time[market_status_at] == market_status_written.planned_start_time[market_status_at]); market_status_at = market_status_at + 1
  :: else -> break
  od;
  assert(market_status_read.trading_session == market_status_written.trading_session);
  market_status_at = 0;
  do
  :: market_status_at < 2 -> assert(market_status_read.state[market_status_at] == market_status_written.state[market_status_at]); market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 2 -> assert(market_status_read.filler_2[market_status_at] == market_status_written.filler_2[market_status_at]); market_status_at = market_status_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Status: 8 bytes ---------------------------------------------- */

/* Generated whenever there is a change to suspension indicator or instrument status. */
typedef InstrumentStatus {
  byte orderbook_id[4];
  byte suspension_indicator;
  byte instrument_status_code;
  byte filler_2[2]
};

int instrument_status_at;

/* every byte of Instrument Status set to one value */
inline fill_instrument_status(instrument_status_record, instrument_status_value) {
  instrument_status_at = 0;
  do
  :: instrument_status_at < 4 -> instrument_status_record.orderbook_id[instrument_status_at] = instrument_status_value; instrument_status_at = instrument_status_at + 1
  :: else -> break
  od;
  instrument_status_record.suspension_indicator = instrument_status_value;
  instrument_status_record.instrument_status_code = instrument_status_value;
  instrument_status_at = 0;
  do
  :: instrument_status_at < 2 -> instrument_status_record.filler_2[instrument_status_at] = instrument_status_value; instrument_status_at = instrument_status_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument Status set to where it lies, so a field read out of place says so */
inline ramp_instrument_status(instrument_status_record, instrument_status_base) {
  instrument_status_at = 0;
  do
  :: instrument_status_at < 4 -> instrument_status_record.orderbook_id[instrument_status_at] = (instrument_status_base + 0 + instrument_status_at + 1) % 256; instrument_status_at = instrument_status_at + 1
  :: else -> break
  od;
  instrument_status_record.suspension_indicator = (instrument_status_base + 4 + 1) % 256;
  instrument_status_record.instrument_status_code = (instrument_status_base + 5 + 1) % 256;
  instrument_status_at = 0;
  do
  :: instrument_status_at < 2 -> instrument_status_record.filler_2[instrument_status_at] = (instrument_status_base + 6 + instrument_status_at + 1) % 256; instrument_status_at = instrument_status_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Status to the wire, 8 bytes from where the cursor stands */
inline encode_instrument_status(instrument_status_record) {
  instrument_status_at = 0;
  do
  :: instrument_status_at < 4 -> wire[at] = instrument_status_record.orderbook_id[instrument_status_at]; at = at + 1; instrument_status_at = instrument_status_at + 1
  :: else -> break
  od;
  wire[at] = instrument_status_record.suspension_indicator; at = at + 1;
  wire[at] = instrument_status_record.instrument_status_code; at = at + 1;
  instrument_status_at = 0;
  do
  :: instrument_status_at < 2 -> wire[at] = instrument_status_record.filler_2[instrument_status_at]; at = at + 1; instrument_status_at = instrument_status_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Status off the wire, 8 bytes from where the cursor stands */
inline decode_instrument_status(instrument_status_record) {
  instrument_status_at = 0;
  do
  :: instrument_status_at < 4 -> instrument_status_record.orderbook_id[instrument_status_at] = wire[at]; at = at + 1; instrument_status_at = instrument_status_at + 1
  :: else -> break
  od;
  instrument_status_record.suspension_indicator = wire[at]; at = at + 1;
  instrument_status_record.instrument_status_code = wire[at]; at = at + 1;
  instrument_status_at = 0;
  do
  :: instrument_status_at < 2 -> instrument_status_record.filler_2[instrument_status_at] = wire[at]; at = at + 1; instrument_status_at = instrument_status_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument Status is what was written, byte for byte */
inline equal_instrument_status(instrument_status_read, instrument_status_written) {
  instrument_status_at = 0;
  do
  :: instrument_status_at < 4 -> assert(instrument_status_read.orderbook_id[instrument_status_at] == instrument_status_written.orderbook_id[instrument_status_at]); instrument_status_at = instrument_status_at + 1
  :: else -> break
  od;
  assert(instrument_status_read.suspension_indicator == instrument_status_written.suspension_indicator);
  assert(instrument_status_read.instrument_status_code == instrument_status_written.instrument_status_code);
  instrument_status_at = 0;
  do
  :: instrument_status_at < 2 -> assert(instrument_status_read.filler_2[instrument_status_at] == instrument_status_written.filler_2[instrument_status_at]); instrument_status_at = instrument_status_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Commodity And Class Status: 10 bytes ------------------------------------ */

/* Generated whenever a commodity and / or instrument class status changes. */
typedef CommodityAndClassStatus {
  byte commodity_code[4];
  byte instrument_class_key[4];
  byte suspended;
  byte filler_1
};

int commodity_and_class_status_at;

/* every byte of Commodity And Class Status set to one value */
inline fill_commodity_and_class_status(commodity_and_class_status_record, commodity_and_class_status_value) {
  commodity_and_class_status_at = 0;
  do
  :: commodity_and_class_status_at < 4 -> commodity_and_class_status_record.commodity_code[commodity_and_class_status_at] = commodity_and_class_status_value; commodity_and_class_status_at = commodity_and_class_status_at + 1
  :: else -> break
  od;
  commodity_and_class_status_at = 0;
  do
  :: commodity_and_class_status_at < 4 -> commodity_and_class_status_record.instrument_class_key[commodity_and_class_status_at] = commodity_and_class_status_value; commodity_and_class_status_at = commodity_and_class_status_at + 1
  :: else -> break
  od;
  commodity_and_class_status_record.suspended = commodity_and_class_status_value;
  commodity_and_class_status_record.filler_1 = commodity_and_class_status_value;
  skip
}

/* each byte of Commodity And Class Status set to where it lies, so a field read out of place says so */
inline ramp_commodity_and_class_status(commodity_and_class_status_record, commodity_and_class_status_base) {
  commodity_and_class_status_at = 0;
  do
  :: commodity_and_class_status_at < 4 -> commodity_and_class_status_record.commodity_code[commodity_and_class_status_at] = (commodity_and_class_status_base + 0 + commodity_and_class_status_at + 1) % 256; commodity_and_class_status_at = commodity_and_class_status_at + 1
  :: else -> break
  od;
  commodity_and_class_status_at = 0;
  do
  :: commodity_and_class_status_at < 4 -> commodity_and_class_status_record.instrument_class_key[commodity_and_class_status_at] = (commodity_and_class_status_base + 4 + commodity_and_class_status_at + 1) % 256; commodity_and_class_status_at = commodity_and_class_status_at + 1
  :: else -> break
  od;
  commodity_and_class_status_record.suspended = (commodity_and_class_status_base + 8 + 1) % 256;
  commodity_and_class_status_record.filler_1 = (commodity_and_class_status_base + 9 + 1) % 256;
  skip
}

/* Commodity And Class Status to the wire, 10 bytes from where the cursor stands */
inline encode_commodity_and_class_status(commodity_and_class_status_record) {
  commodity_and_class_status_at = 0;
  do
  :: commodity_and_class_status_at < 4 -> wire[at] = commodity_and_class_status_record.commodity_code[commodity_and_class_status_at]; at = at + 1; commodity_and_class_status_at = commodity_and_class_status_at + 1
  :: else -> break
  od;
  commodity_and_class_status_at = 0;
  do
  :: commodity_and_class_status_at < 4 -> wire[at] = commodity_and_class_status_record.instrument_class_key[commodity_and_class_status_at]; at = at + 1; commodity_and_class_status_at = commodity_and_class_status_at + 1
  :: else -> break
  od;
  wire[at] = commodity_and_class_status_record.suspended; at = at + 1;
  wire[at] = commodity_and_class_status_record.filler_1; at = at + 1;
  skip
}

/* Commodity And Class Status off the wire, 10 bytes from where the cursor stands */
inline decode_commodity_and_class_status(commodity_and_class_status_record) {
  commodity_and_class_status_at = 0;
  do
  :: commodity_and_class_status_at < 4 -> commodity_and_class_status_record.commodity_code[commodity_and_class_status_at] = wire[at]; at = at + 1; commodity_and_class_status_at = commodity_and_class_status_at + 1
  :: else -> break
  od;
  commodity_and_class_status_at = 0;
  do
  :: commodity_and_class_status_at < 4 -> commodity_and_class_status_record.instrument_class_key[commodity_and_class_status_at] = wire[at]; at = at + 1; commodity_and_class_status_at = commodity_and_class_status_at + 1
  :: else -> break
  od;
  commodity_and_class_status_record.suspended = wire[at]; at = at + 1;
  commodity_and_class_status_record.filler_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Commodity And Class Status is what was written, byte for byte */
inline equal_commodity_and_class_status(commodity_and_class_status_read, commodity_and_class_status_written) {
  commodity_and_class_status_at = 0;
  do
  :: commodity_and_class_status_at < 4 -> assert(commodity_and_class_status_read.commodity_code[commodity_and_class_status_at] == commodity_and_class_status_written.commodity_code[commodity_and_class_status_at]); commodity_and_class_status_at = commodity_and_class_status_at + 1
  :: else -> break
  od;
  commodity_and_class_status_at = 0;
  do
  :: commodity_and_class_status_at < 4 -> assert(commodity_and_class_status_read.instrument_class_key[commodity_and_class_status_at] == commodity_and_class_status_written.instrument_class_key[commodity_and_class_status_at]); commodity_and_class_status_at = commodity_and_class_status_at + 1
  :: else -> break
  od;
  assert(commodity_and_class_status_read.suspended == commodity_and_class_status_written.suspended);
  assert(commodity_and_class_status_read.filler_1 == commodity_and_class_status_written.filler_1);
  skip
}

/* ---- Vcm Trigger: 46 bytes --------------------------------------------------- */

/* Generated when VCM is triggered on a particular instrument. */
typedef VcmTrigger {
  byte orderbook_id[4];
  byte cooling_off_start_time[8];
  byte cooling_off_end_time[8];
  byte vcm_reference_price[8];
  byte vcm_lower_price[8];
  byte vcm_upper_price[8];
  byte filler_2[2]
};

int vcm_trigger_at;

/* every byte of Vcm Trigger set to one value */
inline fill_vcm_trigger(vcm_trigger_record, vcm_trigger_value) {
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 4 -> vcm_trigger_record.orderbook_id[vcm_trigger_at] = vcm_trigger_value; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 8 -> vcm_trigger_record.cooling_off_start_time[vcm_trigger_at] = vcm_trigger_value; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 8 -> vcm_trigger_record.cooling_off_end_time[vcm_trigger_at] = vcm_trigger_value; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 8 -> vcm_trigger_record.vcm_reference_price[vcm_trigger_at] = vcm_trigger_value; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 8 -> vcm_trigger_record.vcm_lower_price[vcm_trigger_at] = vcm_trigger_value; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 8 -> vcm_trigger_record.vcm_upper_price[vcm_trigger_at] = vcm_trigger_value; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 2 -> vcm_trigger_record.filler_2[vcm_trigger_at] = vcm_trigger_value; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Vcm Trigger set to where it lies, so a field read out of place says so */
inline ramp_vcm_trigger(vcm_trigger_record, vcm_trigger_base) {
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 4 -> vcm_trigger_record.orderbook_id[vcm_trigger_at] = (vcm_trigger_base + 0 + vcm_trigger_at + 1) % 256; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 8 -> vcm_trigger_record.cooling_off_start_time[vcm_trigger_at] = (vcm_trigger_base + 4 + vcm_trigger_at + 1) % 256; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 8 -> vcm_trigger_record.cooling_off_end_time[vcm_trigger_at] = (vcm_trigger_base + 12 + vcm_trigger_at + 1) % 256; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 8 -> vcm_trigger_record.vcm_reference_price[vcm_trigger_at] = (vcm_trigger_base + 20 + vcm_trigger_at + 1) % 256; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 8 -> vcm_trigger_record.vcm_lower_price[vcm_trigger_at] = (vcm_trigger_base + 28 + vcm_trigger_at + 1) % 256; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 8 -> vcm_trigger_record.vcm_upper_price[vcm_trigger_at] = (vcm_trigger_base + 36 + vcm_trigger_at + 1) % 256; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 2 -> vcm_trigger_record.filler_2[vcm_trigger_at] = (vcm_trigger_base + 44 + vcm_trigger_at + 1) % 256; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  skip
}

/* Vcm Trigger to the wire, 46 bytes from where the cursor stands */
inline encode_vcm_trigger(vcm_trigger_record) {
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 4 -> wire[at] = vcm_trigger_record.orderbook_id[vcm_trigger_at]; at = at + 1; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 8 -> wire[at] = vcm_trigger_record.cooling_off_start_time[vcm_trigger_at]; at = at + 1; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 8 -> wire[at] = vcm_trigger_record.cooling_off_end_time[vcm_trigger_at]; at = at + 1; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 8 -> wire[at] = vcm_trigger_record.vcm_reference_price[vcm_trigger_at]; at = at + 1; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 8 -> wire[at] = vcm_trigger_record.vcm_lower_price[vcm_trigger_at]; at = at + 1; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 8 -> wire[at] = vcm_trigger_record.vcm_upper_price[vcm_trigger_at]; at = at + 1; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 2 -> wire[at] = vcm_trigger_record.filler_2[vcm_trigger_at]; at = at + 1; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  skip
}

/* Vcm Trigger off the wire, 46 bytes from where the cursor stands */
inline decode_vcm_trigger(vcm_trigger_record) {
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 4 -> vcm_trigger_record.orderbook_id[vcm_trigger_at] = wire[at]; at = at + 1; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 8 -> vcm_trigger_record.cooling_off_start_time[vcm_trigger_at] = wire[at]; at = at + 1; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 8 -> vcm_trigger_record.cooling_off_end_time[vcm_trigger_at] = wire[at]; at = at + 1; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 8 -> vcm_trigger_record.vcm_reference_price[vcm_trigger_at] = wire[at]; at = at + 1; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 8 -> vcm_trigger_record.vcm_lower_price[vcm_trigger_at] = wire[at]; at = at + 1; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 8 -> vcm_trigger_record.vcm_upper_price[vcm_trigger_at] = wire[at]; at = at + 1; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 2 -> vcm_trigger_record.filler_2[vcm_trigger_at] = wire[at]; at = at + 1; vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Vcm Trigger is what was written, byte for byte */
inline equal_vcm_trigger(vcm_trigger_read, vcm_trigger_written) {
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 4 -> assert(vcm_trigger_read.orderbook_id[vcm_trigger_at] == vcm_trigger_written.orderbook_id[vcm_trigger_at]); vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 8 -> assert(vcm_trigger_read.cooling_off_start_time[vcm_trigger_at] == vcm_trigger_written.cooling_off_start_time[vcm_trigger_at]); vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 8 -> assert(vcm_trigger_read.cooling_off_end_time[vcm_trigger_at] == vcm_trigger_written.cooling_off_end_time[vcm_trigger_at]); vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 8 -> assert(vcm_trigger_read.vcm_reference_price[vcm_trigger_at] == vcm_trigger_written.vcm_reference_price[vcm_trigger_at]); vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 8 -> assert(vcm_trigger_read.vcm_lower_price[vcm_trigger_at] == vcm_trigger_written.vcm_lower_price[vcm_trigger_at]); vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 8 -> assert(vcm_trigger_read.vcm_upper_price[vcm_trigger_at] == vcm_trigger_written.vcm_upper_price[vcm_trigger_at]); vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  vcm_trigger_at = 0;
  do
  :: vcm_trigger_at < 2 -> assert(vcm_trigger_read.filler_2[vcm_trigger_at] == vcm_trigger_written.filler_2[vcm_trigger_at]); vcm_trigger_at = vcm_trigger_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Thm Trigger: 16 bytes --------------------------------------------------- */

/* Generated when trading halt is triggered on a particular instrument class. */
typedef ThmTrigger {
  byte instrument_class_key[4];
  byte market[2];
  byte instrument_group[2];
  byte modifier;
  byte commodity_code[4];
  byte thm_status;
  byte filler_2[2]
};

int thm_trigger_at;

/* every byte of Thm Trigger set to one value */
inline fill_thm_trigger(thm_trigger_record, thm_trigger_value) {
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 4 -> thm_trigger_record.instrument_class_key[thm_trigger_at] = thm_trigger_value; thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 2 -> thm_trigger_record.market[thm_trigger_at] = thm_trigger_value; thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 2 -> thm_trigger_record.instrument_group[thm_trigger_at] = thm_trigger_value; thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  thm_trigger_record.modifier = thm_trigger_value;
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 4 -> thm_trigger_record.commodity_code[thm_trigger_at] = thm_trigger_value; thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  thm_trigger_record.thm_status = thm_trigger_value;
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 2 -> thm_trigger_record.filler_2[thm_trigger_at] = thm_trigger_value; thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Thm Trigger set to where it lies, so a field read out of place says so */
inline ramp_thm_trigger(thm_trigger_record, thm_trigger_base) {
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 4 -> thm_trigger_record.instrument_class_key[thm_trigger_at] = (thm_trigger_base + 0 + thm_trigger_at + 1) % 256; thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 2 -> thm_trigger_record.market[thm_trigger_at] = (thm_trigger_base + 4 + thm_trigger_at + 1) % 256; thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 2 -> thm_trigger_record.instrument_group[thm_trigger_at] = (thm_trigger_base + 6 + thm_trigger_at + 1) % 256; thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  thm_trigger_record.modifier = (thm_trigger_base + 8 + 1) % 256;
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 4 -> thm_trigger_record.commodity_code[thm_trigger_at] = (thm_trigger_base + 9 + thm_trigger_at + 1) % 256; thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  thm_trigger_record.thm_status = (thm_trigger_base + 13 + 1) % 256;
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 2 -> thm_trigger_record.filler_2[thm_trigger_at] = (thm_trigger_base + 14 + thm_trigger_at + 1) % 256; thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  skip
}

/* Thm Trigger to the wire, 16 bytes from where the cursor stands */
inline encode_thm_trigger(thm_trigger_record) {
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 4 -> wire[at] = thm_trigger_record.instrument_class_key[thm_trigger_at]; at = at + 1; thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 2 -> wire[at] = thm_trigger_record.market[thm_trigger_at]; at = at + 1; thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 2 -> wire[at] = thm_trigger_record.instrument_group[thm_trigger_at]; at = at + 1; thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  wire[at] = thm_trigger_record.modifier; at = at + 1;
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 4 -> wire[at] = thm_trigger_record.commodity_code[thm_trigger_at]; at = at + 1; thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  wire[at] = thm_trigger_record.thm_status; at = at + 1;
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 2 -> wire[at] = thm_trigger_record.filler_2[thm_trigger_at]; at = at + 1; thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  skip
}

/* Thm Trigger off the wire, 16 bytes from where the cursor stands */
inline decode_thm_trigger(thm_trigger_record) {
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 4 -> thm_trigger_record.instrument_class_key[thm_trigger_at] = wire[at]; at = at + 1; thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 2 -> thm_trigger_record.market[thm_trigger_at] = wire[at]; at = at + 1; thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 2 -> thm_trigger_record.instrument_group[thm_trigger_at] = wire[at]; at = at + 1; thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  thm_trigger_record.modifier = wire[at]; at = at + 1;
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 4 -> thm_trigger_record.commodity_code[thm_trigger_at] = wire[at]; at = at + 1; thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  thm_trigger_record.thm_status = wire[at]; at = at + 1;
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 2 -> thm_trigger_record.filler_2[thm_trigger_at] = wire[at]; at = at + 1; thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Thm Trigger is what was written, byte for byte */
inline equal_thm_trigger(thm_trigger_read, thm_trigger_written) {
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 4 -> assert(thm_trigger_read.instrument_class_key[thm_trigger_at] == thm_trigger_written.instrument_class_key[thm_trigger_at]); thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 2 -> assert(thm_trigger_read.market[thm_trigger_at] == thm_trigger_written.market[thm_trigger_at]); thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 2 -> assert(thm_trigger_read.instrument_group[thm_trigger_at] == thm_trigger_written.instrument_group[thm_trigger_at]); thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  assert(thm_trigger_read.modifier == thm_trigger_written.modifier);
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 4 -> assert(thm_trigger_read.commodity_code[thm_trigger_at] == thm_trigger_written.commodity_code[thm_trigger_at]); thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  assert(thm_trigger_read.thm_status == thm_trigger_written.thm_status);
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 2 -> assert(thm_trigger_read.filler_2[thm_trigger_at] == thm_trigger_written.filler_2[thm_trigger_at]); thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade: 56 bytes --------------------------------------------------------- */

/* The trade message is generated each time a trade has been performed. */
typedef Trade {
  byte orderbook_id[4];
  byte order_id[8];
  byte price[8];
  byte trade_id[8];
  byte match_id[8];
  byte statistics_update;
  byte match_type;
  byte trade_type;
  byte trade_subtype;
  byte filler_4[4];
  byte quantity[4];
  byte trade_time[8]
};

int trade_at;

/* every byte of Trade set to one value */
inline fill_trade(trade_record, trade_value) {
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.orderbook_id[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.order_id[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.price[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.trade_id[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.match_id[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.statistics_update = trade_value;
  trade_record.match_type = trade_value;
  trade_record.trade_type = trade_value;
  trade_record.trade_subtype = trade_value;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.filler_4[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.quantity[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.trade_time[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade set to where it lies, so a field read out of place says so */
inline ramp_trade(trade_record, trade_base) {
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.orderbook_id[trade_at] = (trade_base + 0 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.order_id[trade_at] = (trade_base + 4 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.price[trade_at] = (trade_base + 12 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.trade_id[trade_at] = (trade_base + 20 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.match_id[trade_at] = (trade_base + 28 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.statistics_update = (trade_base + 36 + 1) % 256;
  trade_record.match_type = (trade_base + 37 + 1) % 256;
  trade_record.trade_type = (trade_base + 38 + 1) % 256;
  trade_record.trade_subtype = (trade_base + 39 + 1) % 256;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.filler_4[trade_at] = (trade_base + 40 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.quantity[trade_at] = (trade_base + 44 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.trade_time[trade_at] = (trade_base + 48 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  skip
}

/* Trade to the wire, 56 bytes from where the cursor stands */
inline encode_trade(trade_record) {
  trade_at = 0;
  do
  :: trade_at < 4 -> wire[at] = trade_record.orderbook_id[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.order_id[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.price[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.trade_id[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.match_id[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  wire[at] = trade_record.statistics_update; at = at + 1;
  wire[at] = trade_record.match_type; at = at + 1;
  wire[at] = trade_record.trade_type; at = at + 1;
  wire[at] = trade_record.trade_subtype; at = at + 1;
  trade_at = 0;
  do
  :: trade_at < 4 -> wire[at] = trade_record.filler_4[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> wire[at] = trade_record.quantity[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.trade_time[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  skip
}

/* Trade off the wire, 56 bytes from where the cursor stands */
inline decode_trade(trade_record) {
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.orderbook_id[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.order_id[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.price[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.trade_id[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.match_id[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.statistics_update = wire[at]; at = at + 1;
  trade_record.match_type = wire[at]; at = at + 1;
  trade_record.trade_type = wire[at]; at = at + 1;
  trade_record.trade_subtype = wire[at]; at = at + 1;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.filler_4[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.quantity[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.trade_time[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade is what was written, byte for byte */
inline equal_trade(trade_read, trade_written) {
  trade_at = 0;
  do
  :: trade_at < 4 -> assert(trade_read.orderbook_id[trade_at] == trade_written.orderbook_id[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.order_id[trade_at] == trade_written.order_id[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.price[trade_at] == trade_written.price[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.trade_id[trade_at] == trade_written.trade_id[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.match_id[trade_at] == trade_written.match_id[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  assert(trade_read.statistics_update == trade_written.statistics_update);
  assert(trade_read.match_type == trade_written.match_type);
  assert(trade_read.trade_type == trade_written.trade_type);
  assert(trade_read.trade_subtype == trade_written.trade_subtype);
  trade_at = 0;
  do
  :: trade_at < 4 -> assert(trade_read.filler_4[trade_at] == trade_written.filler_4[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> assert(trade_read.quantity[trade_at] == trade_written.quantity[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.trade_time[trade_at] == trade_written.trade_time[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Amendment Message: 36 bytes --------------------------------------- */

/* Represents a trade amendment or cancellation. */
typedef TradeAmendmentMessage {
  byte orderbook_id[4];
  byte trade_id[8];
  byte price[8];
  byte quantity[4];
  byte amendment_execution_time[8];
  byte trade_state;
  byte filler_3[3]
};

int trade_amendment_message_at;

/* every byte of Trade Amendment Message set to one value */
inline fill_trade_amendment_message(trade_amendment_message_record, trade_amendment_message_value) {
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 4 -> trade_amendment_message_record.orderbook_id[trade_amendment_message_at] = trade_amendment_message_value; trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 8 -> trade_amendment_message_record.trade_id[trade_amendment_message_at] = trade_amendment_message_value; trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 8 -> trade_amendment_message_record.price[trade_amendment_message_at] = trade_amendment_message_value; trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 4 -> trade_amendment_message_record.quantity[trade_amendment_message_at] = trade_amendment_message_value; trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 8 -> trade_amendment_message_record.amendment_execution_time[trade_amendment_message_at] = trade_amendment_message_value; trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  trade_amendment_message_record.trade_state = trade_amendment_message_value;
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 3 -> trade_amendment_message_record.filler_3[trade_amendment_message_at] = trade_amendment_message_value; trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Amendment Message set to where it lies, so a field read out of place says so */
inline ramp_trade_amendment_message(trade_amendment_message_record, trade_amendment_message_base) {
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 4 -> trade_amendment_message_record.orderbook_id[trade_amendment_message_at] = (trade_amendment_message_base + 0 + trade_amendment_message_at + 1) % 256; trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 8 -> trade_amendment_message_record.trade_id[trade_amendment_message_at] = (trade_amendment_message_base + 4 + trade_amendment_message_at + 1) % 256; trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 8 -> trade_amendment_message_record.price[trade_amendment_message_at] = (trade_amendment_message_base + 12 + trade_amendment_message_at + 1) % 256; trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 4 -> trade_amendment_message_record.quantity[trade_amendment_message_at] = (trade_amendment_message_base + 20 + trade_amendment_message_at + 1) % 256; trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 8 -> trade_amendment_message_record.amendment_execution_time[trade_amendment_message_at] = (trade_amendment_message_base + 24 + trade_amendment_message_at + 1) % 256; trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  trade_amendment_message_record.trade_state = (trade_amendment_message_base + 32 + 1) % 256;
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 3 -> trade_amendment_message_record.filler_3[trade_amendment_message_at] = (trade_amendment_message_base + 33 + trade_amendment_message_at + 1) % 256; trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Amendment Message to the wire, 36 bytes from where the cursor stands */
inline encode_trade_amendment_message(trade_amendment_message_record) {
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 4 -> wire[at] = trade_amendment_message_record.orderbook_id[trade_amendment_message_at]; at = at + 1; trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 8 -> wire[at] = trade_amendment_message_record.trade_id[trade_amendment_message_at]; at = at + 1; trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 8 -> wire[at] = trade_amendment_message_record.price[trade_amendment_message_at]; at = at + 1; trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 4 -> wire[at] = trade_amendment_message_record.quantity[trade_amendment_message_at]; at = at + 1; trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 8 -> wire[at] = trade_amendment_message_record.amendment_execution_time[trade_amendment_message_at]; at = at + 1; trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_amendment_message_record.trade_state; at = at + 1;
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 3 -> wire[at] = trade_amendment_message_record.filler_3[trade_amendment_message_at]; at = at + 1; trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Amendment Message off the wire, 36 bytes from where the cursor stands */
inline decode_trade_amendment_message(trade_amendment_message_record) {
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 4 -> trade_amendment_message_record.orderbook_id[trade_amendment_message_at] = wire[at]; at = at + 1; trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 8 -> trade_amendment_message_record.trade_id[trade_amendment_message_at] = wire[at]; at = at + 1; trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 8 -> trade_amendment_message_record.price[trade_amendment_message_at] = wire[at]; at = at + 1; trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 4 -> trade_amendment_message_record.quantity[trade_amendment_message_at] = wire[at]; at = at + 1; trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 8 -> trade_amendment_message_record.amendment_execution_time[trade_amendment_message_at] = wire[at]; at = at + 1; trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  trade_amendment_message_record.trade_state = wire[at]; at = at + 1;
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 3 -> trade_amendment_message_record.filler_3[trade_amendment_message_at] = wire[at]; at = at + 1; trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Amendment Message is what was written, byte for byte */
inline equal_trade_amendment_message(trade_amendment_message_read, trade_amendment_message_written) {
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 4 -> assert(trade_amendment_message_read.orderbook_id[trade_amendment_message_at] == trade_amendment_message_written.orderbook_id[trade_amendment_message_at]); trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 8 -> assert(trade_amendment_message_read.trade_id[trade_amendment_message_at] == trade_amendment_message_written.trade_id[trade_amendment_message_at]); trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 8 -> assert(trade_amendment_message_read.price[trade_amendment_message_at] == trade_amendment_message_written.price[trade_amendment_message_at]); trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 4 -> assert(trade_amendment_message_read.quantity[trade_amendment_message_at] == trade_amendment_message_written.quantity[trade_amendment_message_at]); trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 8 -> assert(trade_amendment_message_read.amendment_execution_time[trade_amendment_message_at] == trade_amendment_message_written.amendment_execution_time[trade_amendment_message_at]); trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  assert(trade_amendment_message_read.trade_state == trade_amendment_message_written.trade_state);
  trade_amendment_message_at = 0;
  do
  :: trade_amendment_message_at < 3 -> assert(trade_amendment_message_read.filler_3[trade_amendment_message_at] == trade_amendment_message_written.filler_3[trade_amendment_message_at]); trade_amendment_message_at = trade_amendment_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Statistics Message: 56 bytes -------------------------------------- */

/* Trade information for completed deals */
typedef TradeStatisticsMessage {
  byte orderbook_id[4];
  byte last_price[8];
  byte session;
  byte open_price[8];
  byte high_price[8];
  byte low_price[8];
  byte trade_report_volume[8];
  byte turnover[8];
  byte filler_3[3]
};

int trade_statistics_message_at;

/* every byte of Trade Statistics Message set to one value */
inline fill_trade_statistics_message(trade_statistics_message_record, trade_statistics_message_value) {
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.orderbook_id[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.last_price[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_record.session = trade_statistics_message_value;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.open_price[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.high_price[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.low_price[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.trade_report_volume[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.turnover[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 3 -> trade_statistics_message_record.filler_3[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Statistics Message set to where it lies, so a field read out of place says so */
inline ramp_trade_statistics_message(trade_statistics_message_record, trade_statistics_message_base) {
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.orderbook_id[trade_statistics_message_at] = (trade_statistics_message_base + 0 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.last_price[trade_statistics_message_at] = (trade_statistics_message_base + 4 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_record.session = (trade_statistics_message_base + 12 + 1) % 256;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.open_price[trade_statistics_message_at] = (trade_statistics_message_base + 13 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.high_price[trade_statistics_message_at] = (trade_statistics_message_base + 21 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.low_price[trade_statistics_message_at] = (trade_statistics_message_base + 29 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.trade_report_volume[trade_statistics_message_at] = (trade_statistics_message_base + 37 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.turnover[trade_statistics_message_at] = (trade_statistics_message_base + 45 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 3 -> trade_statistics_message_record.filler_3[trade_statistics_message_at] = (trade_statistics_message_base + 53 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Statistics Message to the wire, 56 bytes from where the cursor stands */
inline encode_trade_statistics_message(trade_statistics_message_record) {
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> wire[at] = trade_statistics_message_record.orderbook_id[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> wire[at] = trade_statistics_message_record.last_price[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_statistics_message_record.session; at = at + 1;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> wire[at] = trade_statistics_message_record.open_price[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> wire[at] = trade_statistics_message_record.high_price[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> wire[at] = trade_statistics_message_record.low_price[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> wire[at] = trade_statistics_message_record.trade_report_volume[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> wire[at] = trade_statistics_message_record.turnover[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 3 -> wire[at] = trade_statistics_message_record.filler_3[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Statistics Message off the wire, 56 bytes from where the cursor stands */
inline decode_trade_statistics_message(trade_statistics_message_record) {
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.orderbook_id[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.last_price[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_record.session = wire[at]; at = at + 1;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.open_price[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.high_price[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.low_price[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.trade_report_volume[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.turnover[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 3 -> trade_statistics_message_record.filler_3[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Statistics Message is what was written, byte for byte */
inline equal_trade_statistics_message(trade_statistics_message_read, trade_statistics_message_written) {
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> assert(trade_statistics_message_read.orderbook_id[trade_statistics_message_at] == trade_statistics_message_written.orderbook_id[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> assert(trade_statistics_message_read.last_price[trade_statistics_message_at] == trade_statistics_message_written.last_price[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  assert(trade_statistics_message_read.session == trade_statistics_message_written.session);
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> assert(trade_statistics_message_read.open_price[trade_statistics_message_at] == trade_statistics_message_written.open_price[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> assert(trade_statistics_message_read.high_price[trade_statistics_message_at] == trade_statistics_message_written.high_price[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> assert(trade_statistics_message_read.low_price[trade_statistics_message_at] == trade_statistics_message_written.low_price[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> assert(trade_statistics_message_read.trade_report_volume[trade_statistics_message_at] == trade_statistics_message_written.trade_report_volume[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> assert(trade_statistics_message_read.turnover[trade_statistics_message_at] == trade_statistics_message_written.turnover[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 3 -> assert(trade_statistics_message_read.filler_3[trade_statistics_message_at] == trade_statistics_message_written.filler_3[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
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

/* Add Order: encoded, read back, and compared */
proctype check_add_order() {
  AddOrder add_order_sent;
  AddOrder add_order_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order(add_order_sent, 0)
  :: pattern == 1 -> fill_add_order(add_order_sent, 32)
  :: pattern == 2 -> fill_add_order(add_order_sent, 255)
  :: else -> ramp_add_order(add_order_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order(add_order_sent);
    assert(at == 40);
    at = 0;
    decode_add_order(add_order_got);
    assert(at == 40);
    equal_add_order(add_order_got, add_order_sent)
  }
}

/* Aggregate Implied Order: encoded, read back, and compared */
proctype check_aggregate_implied_order() {
  AggregateImpliedOrder aggregate_implied_order_sent;
  AggregateImpliedOrder aggregate_implied_order_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_aggregate_implied_order(aggregate_implied_order_sent, 0)
  :: pattern == 1 -> fill_aggregate_implied_order(aggregate_implied_order_sent, 32)
  :: pattern == 2 -> fill_aggregate_implied_order(aggregate_implied_order_sent, 255)
  :: else -> ramp_aggregate_implied_order(aggregate_implied_order_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_aggregate_implied_order(aggregate_implied_order_sent);
    assert(at == 22);
    at = 0;
    decode_aggregate_implied_order(aggregate_implied_order_got);
    assert(at == 22);
    equal_aggregate_implied_order(aggregate_implied_order_got, aggregate_implied_order_sent)
  }
}

/* Calculated Opening Price Message: encoded, read back, and compared */
proctype check_calculated_opening_price_message() {
  CalculatedOpeningPriceMessage calculated_opening_price_message_sent;
  CalculatedOpeningPriceMessage calculated_opening_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_calculated_opening_price_message(calculated_opening_price_message_sent, 0)
  :: pattern == 1 -> fill_calculated_opening_price_message(calculated_opening_price_message_sent, 32)
  :: pattern == 2 -> fill_calculated_opening_price_message(calculated_opening_price_message_sent, 255)
  :: else -> ramp_calculated_opening_price_message(calculated_opening_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_calculated_opening_price_message(calculated_opening_price_message_sent);
    assert(at == 24);
    at = 0;
    decode_calculated_opening_price_message(calculated_opening_price_message_got);
    assert(at == 24);
    equal_calculated_opening_price_message(calculated_opening_price_message_got, calculated_opening_price_message_sent)
  }
}

/* Sequence Reset: encoded, read back, and compared */
proctype check_sequence_reset() {
  SequenceReset sequence_reset_sent;
  SequenceReset sequence_reset_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequence_reset(sequence_reset_sent, 0)
  :: pattern == 1 -> fill_sequence_reset(sequence_reset_sent, 32)
  :: pattern == 2 -> fill_sequence_reset(sequence_reset_sent, 255)
  :: else -> ramp_sequence_reset(sequence_reset_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequence_reset(sequence_reset_sent);
    assert(at == 4);
    at = 0;
    decode_sequence_reset(sequence_reset_got);
    assert(at == 4);
    equal_sequence_reset(sequence_reset_got, sequence_reset_sent)
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

/* Delete Order: encoded, read back, and compared */
proctype check_delete_order() {
  DeleteOrder delete_order_sent;
  DeleteOrder delete_order_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_delete_order(delete_order_sent, 0)
  :: pattern == 1 -> fill_delete_order(delete_order_sent, 32)
  :: pattern == 2 -> fill_delete_order(delete_order_sent, 255)
  :: else -> ramp_delete_order(delete_order_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_delete_order(delete_order_sent);
    assert(at == 22);
    at = 0;
    decode_delete_order(delete_order_got);
    assert(at == 22);
    equal_delete_order(delete_order_got, delete_order_sent)
  }
}

/* Implied Volatility Message: encoded, read back, and compared */
proctype check_implied_volatility_message() {
  ImpliedVolatilityMessage implied_volatility_message_sent;
  ImpliedVolatilityMessage implied_volatility_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_implied_volatility_message(implied_volatility_message_sent, 0)
  :: pattern == 1 -> fill_implied_volatility_message(implied_volatility_message_sent, 32)
  :: pattern == 2 -> fill_implied_volatility_message(implied_volatility_message_sent, 255)
  :: else -> ramp_implied_volatility_message(implied_volatility_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_implied_volatility_message(implied_volatility_message_sent);
    assert(at == 8);
    at = 0;
    decode_implied_volatility_message(implied_volatility_message_got);
    assert(at == 8);
    equal_implied_volatility_message(implied_volatility_message_got, implied_volatility_message_sent)
  }
}

/* Modify Order: encoded, read back, and compared */
proctype check_modify_order() {
  ModifyOrder modify_order_sent;
  ModifyOrder modify_order_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_order(modify_order_sent, 0)
  :: pattern == 1 -> fill_modify_order(modify_order_sent, 32)
  :: pattern == 2 -> fill_modify_order(modify_order_sent, 255)
  :: else -> ramp_modify_order(modify_order_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_order(modify_order_sent);
    assert(at == 40);
    at = 0;
    decode_modify_order(modify_order_got);
    assert(at == 40);
    equal_modify_order(modify_order_got, modify_order_sent)
  }
}

/* Open Interest Message: encoded, read back, and compared */
proctype check_open_interest_message() {
  OpenInterestMessage open_interest_message_sent;
  OpenInterestMessage open_interest_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_open_interest_message(open_interest_message_sent, 0)
  :: pattern == 1 -> fill_open_interest_message(open_interest_message_sent, 32)
  :: pattern == 2 -> fill_open_interest_message(open_interest_message_sent, 255)
  :: else -> ramp_open_interest_message(open_interest_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_open_interest_message(open_interest_message_sent);
    assert(at == 28);
    at = 0;
    decode_open_interest_message(open_interest_message_got);
    assert(at == 28);
    equal_open_interest_message(open_interest_message_got, open_interest_message_sent)
  }
}

/* Orderbook Clear Message: encoded, read back, and compared */
proctype check_orderbook_clear_message() {
  OrderbookClearMessage orderbook_clear_message_sent;
  OrderbookClearMessage orderbook_clear_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_orderbook_clear_message(orderbook_clear_message_sent, 0)
  :: pattern == 1 -> fill_orderbook_clear_message(orderbook_clear_message_sent, 32)
  :: pattern == 2 -> fill_orderbook_clear_message(orderbook_clear_message_sent, 255)
  :: else -> ramp_orderbook_clear_message(orderbook_clear_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_orderbook_clear_message(orderbook_clear_message_sent);
    assert(at == 4);
    at = 0;
    decode_orderbook_clear_message(orderbook_clear_message_got);
    assert(at == 4);
    equal_orderbook_clear_message(orderbook_clear_message_got, orderbook_clear_message_sent)
  }
}

/* Quote Request: encoded, read back, and compared */
proctype check_quote_request() {
  QuoteRequest quote_request_sent;
  QuoteRequest quote_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_request(quote_request_sent, 0)
  :: pattern == 1 -> fill_quote_request(quote_request_sent, 32)
  :: pattern == 2 -> fill_quote_request(quote_request_sent, 255)
  :: else -> ramp_quote_request(quote_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_request(quote_request_sent);
    assert(at == 12);
    at = 0;
    decode_quote_request(quote_request_got);
    assert(at == 12);
    equal_quote_request(quote_request_got, quote_request_sent)
  }
}

/* Commodity Definition: encoded, read back, and compared */
proctype check_commodity_definition() {
  CommodityDefinition commodity_definition_sent;
  CommodityDefinition commodity_definition_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_commodity_definition(commodity_definition_sent, 0)
  :: pattern == 1 -> fill_commodity_definition(commodity_definition_sent, 32)
  :: pattern == 2 -> fill_commodity_definition(commodity_definition_sent, 255)
  :: else -> ramp_commodity_definition(commodity_definition_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_commodity_definition(commodity_definition_sent);
    assert(at == 89);
    at = 0;
    decode_commodity_definition(commodity_definition_got);
    assert(at == 89);
    equal_commodity_definition(commodity_definition_got, commodity_definition_sent)
  }
}

/* Class Definition: encoded, read back, and compared */
proctype check_class_definition() {
  ClassDefinition class_definition_sent;
  ClassDefinition class_definition_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_class_definition(class_definition_sent, 0)
  :: pattern == 1 -> fill_class_definition(class_definition_sent, 32)
  :: pattern == 2 -> fill_class_definition(class_definition_sent, 255)
  :: else -> ramp_class_definition(class_definition_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_class_definition(class_definition_sent);
    assert(at == 106);
    at = 0;
    decode_class_definition(class_definition_got);
    assert(at == 106);
    equal_class_definition(class_definition_got, class_definition_sent)
  }
}

/* Instrument Definition: encoded, read back, and compared */
proctype check_instrument_definition() {
  InstrumentDefinition instrument_definition_sent;
  InstrumentDefinition instrument_definition_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_definition(instrument_definition_sent, 0)
  :: pattern == 1 -> fill_instrument_definition(instrument_definition_sent, 32)
  :: pattern == 2 -> fill_instrument_definition(instrument_definition_sent, 255)
  :: else -> ramp_instrument_definition(instrument_definition_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_definition(instrument_definition_sent);
    assert(at == 118);
    at = 0;
    decode_instrument_definition(instrument_definition_got);
    assert(at == 118);
    equal_instrument_definition(instrument_definition_got, instrument_definition_sent)
  }
}

/* Combination Definition: encoded, read back, and compared */
proctype check_combination_definition() {
  CombinationDefinition combination_definition_sent;
  CombinationDefinition combination_definition_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_combination_definition(combination_definition_sent, 0)
  :: pattern == 1 -> fill_combination_definition(combination_definition_sent, 32)
  :: pattern == 2 -> fill_combination_definition(combination_definition_sent, 255)
  :: else -> ramp_combination_definition(combination_definition_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_combination_definition(combination_definition_sent);
    assert(at == 16);
    at = 0;
    decode_combination_definition(combination_definition_got);
    assert(at == 16);
    equal_combination_definition(combination_definition_got, combination_definition_sent)
  }
}

/* Refresh Complete: encoded, read back, and compared */
proctype check_refresh_complete() {
  RefreshComplete refresh_complete_sent;
  RefreshComplete refresh_complete_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_refresh_complete(refresh_complete_sent, 0)
  :: pattern == 1 -> fill_refresh_complete(refresh_complete_sent, 32)
  :: pattern == 2 -> fill_refresh_complete(refresh_complete_sent, 255)
  :: else -> ramp_refresh_complete(refresh_complete_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_refresh_complete(refresh_complete_sent);
    assert(at == 4);
    at = 0;
    decode_refresh_complete(refresh_complete_got);
    assert(at == 4);
    equal_refresh_complete(refresh_complete_got, refresh_complete_sent)
  }
}

/* Market Status: encoded, read back, and compared */
proctype check_market_status() {
  MarketStatus market_status_sent;
  MarketStatus market_status_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_status(market_status_sent, 0)
  :: pattern == 1 -> fill_market_status(market_status_sent, 32)
  :: pattern == 2 -> fill_market_status(market_status_sent, 255)
  :: else -> ramp_market_status(market_status_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_status(market_status_sent);
    assert(at == 54);
    at = 0;
    decode_market_status(market_status_got);
    assert(at == 54);
    equal_market_status(market_status_got, market_status_sent)
  }
}

/* Instrument Status: encoded, read back, and compared */
proctype check_instrument_status() {
  InstrumentStatus instrument_status_sent;
  InstrumentStatus instrument_status_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_status(instrument_status_sent, 0)
  :: pattern == 1 -> fill_instrument_status(instrument_status_sent, 32)
  :: pattern == 2 -> fill_instrument_status(instrument_status_sent, 255)
  :: else -> ramp_instrument_status(instrument_status_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_status(instrument_status_sent);
    assert(at == 8);
    at = 0;
    decode_instrument_status(instrument_status_got);
    assert(at == 8);
    equal_instrument_status(instrument_status_got, instrument_status_sent)
  }
}

/* Commodity And Class Status: encoded, read back, and compared */
proctype check_commodity_and_class_status() {
  CommodityAndClassStatus commodity_and_class_status_sent;
  CommodityAndClassStatus commodity_and_class_status_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_commodity_and_class_status(commodity_and_class_status_sent, 0)
  :: pattern == 1 -> fill_commodity_and_class_status(commodity_and_class_status_sent, 32)
  :: pattern == 2 -> fill_commodity_and_class_status(commodity_and_class_status_sent, 255)
  :: else -> ramp_commodity_and_class_status(commodity_and_class_status_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_commodity_and_class_status(commodity_and_class_status_sent);
    assert(at == 10);
    at = 0;
    decode_commodity_and_class_status(commodity_and_class_status_got);
    assert(at == 10);
    equal_commodity_and_class_status(commodity_and_class_status_got, commodity_and_class_status_sent)
  }
}

/* Vcm Trigger: encoded, read back, and compared */
proctype check_vcm_trigger() {
  VcmTrigger vcm_trigger_sent;
  VcmTrigger vcm_trigger_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_vcm_trigger(vcm_trigger_sent, 0)
  :: pattern == 1 -> fill_vcm_trigger(vcm_trigger_sent, 32)
  :: pattern == 2 -> fill_vcm_trigger(vcm_trigger_sent, 255)
  :: else -> ramp_vcm_trigger(vcm_trigger_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_vcm_trigger(vcm_trigger_sent);
    assert(at == 46);
    at = 0;
    decode_vcm_trigger(vcm_trigger_got);
    assert(at == 46);
    equal_vcm_trigger(vcm_trigger_got, vcm_trigger_sent)
  }
}

/* Thm Trigger: encoded, read back, and compared */
proctype check_thm_trigger() {
  ThmTrigger thm_trigger_sent;
  ThmTrigger thm_trigger_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_thm_trigger(thm_trigger_sent, 0)
  :: pattern == 1 -> fill_thm_trigger(thm_trigger_sent, 32)
  :: pattern == 2 -> fill_thm_trigger(thm_trigger_sent, 255)
  :: else -> ramp_thm_trigger(thm_trigger_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_thm_trigger(thm_trigger_sent);
    assert(at == 16);
    at = 0;
    decode_thm_trigger(thm_trigger_got);
    assert(at == 16);
    equal_thm_trigger(thm_trigger_got, thm_trigger_sent)
  }
}

/* Trade: encoded, read back, and compared */
proctype check_trade() {
  Trade trade_sent;
  Trade trade_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade(trade_sent, 0)
  :: pattern == 1 -> fill_trade(trade_sent, 32)
  :: pattern == 2 -> fill_trade(trade_sent, 255)
  :: else -> ramp_trade(trade_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade(trade_sent);
    assert(at == 56);
    at = 0;
    decode_trade(trade_got);
    assert(at == 56);
    equal_trade(trade_got, trade_sent)
  }
}

/* Trade Amendment Message: encoded, read back, and compared */
proctype check_trade_amendment_message() {
  TradeAmendmentMessage trade_amendment_message_sent;
  TradeAmendmentMessage trade_amendment_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_amendment_message(trade_amendment_message_sent, 0)
  :: pattern == 1 -> fill_trade_amendment_message(trade_amendment_message_sent, 32)
  :: pattern == 2 -> fill_trade_amendment_message(trade_amendment_message_sent, 255)
  :: else -> ramp_trade_amendment_message(trade_amendment_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_amendment_message(trade_amendment_message_sent);
    assert(at == 36);
    at = 0;
    decode_trade_amendment_message(trade_amendment_message_got);
    assert(at == 36);
    equal_trade_amendment_message(trade_amendment_message_got, trade_amendment_message_sent)
  }
}

/* Trade Statistics Message: encoded, read back, and compared */
proctype check_trade_statistics_message() {
  TradeStatisticsMessage trade_statistics_message_sent;
  TradeStatisticsMessage trade_statistics_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_statistics_message(trade_statistics_message_sent, 0)
  :: pattern == 1 -> fill_trade_statistics_message(trade_statistics_message_sent, 32)
  :: pattern == 2 -> fill_trade_statistics_message(trade_statistics_message_sent, 255)
  :: else -> ramp_trade_statistics_message(trade_statistics_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_statistics_message(trade_statistics_message_sent);
    assert(at == 56);
    at = 0;
    decode_trade_statistics_message(trade_statistics_message_got);
    assert(at == 56);
    equal_trade_statistics_message(trade_statistics_message_got, trade_statistics_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_msg_header()
  :: run check_add_order()
  :: run check_aggregate_implied_order()
  :: run check_calculated_opening_price_message()
  :: run check_sequence_reset()
  :: run check_disaster_recovery_signal_message()
  :: run check_delete_order()
  :: run check_implied_volatility_message()
  :: run check_modify_order()
  :: run check_open_interest_message()
  :: run check_orderbook_clear_message()
  :: run check_quote_request()
  :: run check_commodity_definition()
  :: run check_class_definition()
  :: run check_instrument_definition()
  :: run check_combination_definition()
  :: run check_refresh_complete()
  :: run check_market_status()
  :: run check_instrument_status()
  :: run check_commodity_and_class_status()
  :: run check_vcm_trigger()
  :: run check_thm_trigger()
  :: run check_trade()
  :: run check_trade_amendment_message()
  :: run check_trade_statistics_message()
  fi
}
