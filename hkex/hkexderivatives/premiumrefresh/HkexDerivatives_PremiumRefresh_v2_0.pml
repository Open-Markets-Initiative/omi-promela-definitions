/*
 * Hong Kong Exchanges and Clearing Orion Market Data Derivatives Premium Refresh
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
#define WIRE 116

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

/* ---- Open Interest Message: 24 bytes ----------------------------------------- */

/* Issued to show the Previous Day settlement price and open interest */
typedef OpenInterestMessage {
  byte day_indicator[2];
  byte filler_6[6];
  byte orderbook_id[4];
  byte settlement_price[4];
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
  :: open_interest_message_at < 4 -> open_interest_message_record.settlement_price[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
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
  :: open_interest_message_at < 4 -> open_interest_message_record.settlement_price[open_interest_message_at] = (open_interest_message_base + 12 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.gross_oi[open_interest_message_at] = (open_interest_message_base + 16 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.net_oi[open_interest_message_at] = (open_interest_message_base + 20 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Interest Message to the wire, 24 bytes from where the cursor stands */
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
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.settlement_price[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
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

/* Open Interest Message off the wire, 24 bytes from where the cursor stands */
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
  :: open_interest_message_at < 4 -> open_interest_message_record.settlement_price[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
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
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.settlement_price[open_interest_message_at] == open_interest_message_written.settlement_price[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
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

/* ---- Commodity Definition: 82 bytes ------------------------------------------ */

/* Describes individual commodities available from the OMD-D system */
typedef CommodityDefinition {
  byte commodity_code[4];
  byte commodity_name[40];
  byte commodity_id[6];
  byte underlying_code[20];
  byte underlying_type;
  byte decimal_in_underlying_price[2];
  byte base_currency[3];
  byte effective_tomorrow;
  byte filler_5[5]
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
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 2 -> commodity_definition_record.decimal_in_underlying_price[commodity_definition_at] = commodity_definition_value; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 3 -> commodity_definition_record.base_currency[commodity_definition_at] = commodity_definition_value; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_record.effective_tomorrow = commodity_definition_value;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 5 -> commodity_definition_record.filler_5[commodity_definition_at] = commodity_definition_value; commodity_definition_at = commodity_definition_at + 1
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
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 2 -> commodity_definition_record.decimal_in_underlying_price[commodity_definition_at] = (commodity_definition_base + 71 + commodity_definition_at + 1) % 256; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 3 -> commodity_definition_record.base_currency[commodity_definition_at] = (commodity_definition_base + 73 + commodity_definition_at + 1) % 256; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_record.effective_tomorrow = (commodity_definition_base + 76 + 1) % 256;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 5 -> commodity_definition_record.filler_5[commodity_definition_at] = (commodity_definition_base + 77 + commodity_definition_at + 1) % 256; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  skip
}

/* Commodity Definition to the wire, 82 bytes from where the cursor stands */
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
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 2 -> wire[at] = commodity_definition_record.decimal_in_underlying_price[commodity_definition_at]; at = at + 1; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 3 -> wire[at] = commodity_definition_record.base_currency[commodity_definition_at]; at = at + 1; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  wire[at] = commodity_definition_record.effective_tomorrow; at = at + 1;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 5 -> wire[at] = commodity_definition_record.filler_5[commodity_definition_at]; at = at + 1; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  skip
}

/* Commodity Definition off the wire, 82 bytes from where the cursor stands */
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
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 2 -> commodity_definition_record.decimal_in_underlying_price[commodity_definition_at] = wire[at]; at = at + 1; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 3 -> commodity_definition_record.base_currency[commodity_definition_at] = wire[at]; at = at + 1; commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_record.effective_tomorrow = wire[at]; at = at + 1;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 5 -> commodity_definition_record.filler_5[commodity_definition_at] = wire[at]; at = at + 1; commodity_definition_at = commodity_definition_at + 1
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
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 2 -> assert(commodity_definition_read.decimal_in_underlying_price[commodity_definition_at] == commodity_definition_written.decimal_in_underlying_price[commodity_definition_at]); commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 3 -> assert(commodity_definition_read.base_currency[commodity_definition_at] == commodity_definition_written.base_currency[commodity_definition_at]); commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  assert(commodity_definition_read.effective_tomorrow == commodity_definition_written.effective_tomorrow);
  commodity_definition_at = 0;
  do
  :: commodity_definition_at < 5 -> assert(commodity_definition_read.filler_5[commodity_definition_at] == commodity_definition_written.filler_5[commodity_definition_at]); commodity_definition_at = commodity_definition_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Class Definition: 116 bytes --------------------------------------------- */

/* Describes individual instrument classes available from the OMD-D system. */
typedef ClassDefinition {
  byte instrument_class_id[14];
  byte instrument_class_key[4];
  byte key_type;
  byte instrument_class_name[40];
  byte exchange[2];
  byte market[2];
  byte instrument_group[2];
  byte commodity_code[4];
  byte instrument_type_id[8];
  byte instrument_type_key[4];
  byte filler_3[3];
  byte price_quotation_factor[4];
  byte contract_size[4];
  byte decimal_in_contract_size[2];
  byte decimal_in_strike_price[2];
  byte decimal_in_price[2];
  byte tick_size[8];
  byte tradable;
  byte base_currency[3];
  byte settlement_currency_id[3];
  byte effective_tomorrow;
  byte filler_2[2]
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
  class_definition_record.key_type = class_definition_value;
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
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> class_definition_record.commodity_code[class_definition_at] = class_definition_value; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 8 -> class_definition_record.instrument_type_id[class_definition_at] = class_definition_value; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> class_definition_record.instrument_type_key[class_definition_at] = class_definition_value; class_definition_at = class_definition_at + 1
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
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> class_definition_record.decimal_in_contract_size[class_definition_at] = class_definition_value; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> class_definition_record.decimal_in_strike_price[class_definition_at] = class_definition_value; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> class_definition_record.decimal_in_price[class_definition_at] = class_definition_value; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
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
  :: class_definition_at < 2 -> class_definition_record.filler_2[class_definition_at] = class_definition_value; class_definition_at = class_definition_at + 1
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
  class_definition_record.key_type = (class_definition_base + 18 + 1) % 256;
  class_definition_at = 0;
  do
  :: class_definition_at < 40 -> class_definition_record.instrument_class_name[class_definition_at] = (class_definition_base + 19 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> class_definition_record.exchange[class_definition_at] = (class_definition_base + 59 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> class_definition_record.market[class_definition_at] = (class_definition_base + 61 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> class_definition_record.instrument_group[class_definition_at] = (class_definition_base + 63 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> class_definition_record.commodity_code[class_definition_at] = (class_definition_base + 65 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 8 -> class_definition_record.instrument_type_id[class_definition_at] = (class_definition_base + 69 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> class_definition_record.instrument_type_key[class_definition_at] = (class_definition_base + 77 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 3 -> class_definition_record.filler_3[class_definition_at] = (class_definition_base + 81 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> class_definition_record.price_quotation_factor[class_definition_at] = (class_definition_base + 84 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> class_definition_record.contract_size[class_definition_at] = (class_definition_base + 88 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> class_definition_record.decimal_in_contract_size[class_definition_at] = (class_definition_base + 92 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> class_definition_record.decimal_in_strike_price[class_definition_at] = (class_definition_base + 94 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> class_definition_record.decimal_in_price[class_definition_at] = (class_definition_base + 96 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 8 -> class_definition_record.tick_size[class_definition_at] = (class_definition_base + 98 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_record.tradable = (class_definition_base + 106 + 1) % 256;
  class_definition_at = 0;
  do
  :: class_definition_at < 3 -> class_definition_record.base_currency[class_definition_at] = (class_definition_base + 107 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 3 -> class_definition_record.settlement_currency_id[class_definition_at] = (class_definition_base + 110 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_record.effective_tomorrow = (class_definition_base + 113 + 1) % 256;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> class_definition_record.filler_2[class_definition_at] = (class_definition_base + 114 + class_definition_at + 1) % 256; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  skip
}

/* Class Definition to the wire, 116 bytes from where the cursor stands */
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
  wire[at] = class_definition_record.key_type; at = at + 1;
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
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> wire[at] = class_definition_record.commodity_code[class_definition_at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 8 -> wire[at] = class_definition_record.instrument_type_id[class_definition_at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> wire[at] = class_definition_record.instrument_type_key[class_definition_at]; at = at + 1; class_definition_at = class_definition_at + 1
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
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> wire[at] = class_definition_record.decimal_in_contract_size[class_definition_at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> wire[at] = class_definition_record.decimal_in_strike_price[class_definition_at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> wire[at] = class_definition_record.decimal_in_price[class_definition_at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
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
  :: class_definition_at < 2 -> wire[at] = class_definition_record.filler_2[class_definition_at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  skip
}

/* Class Definition off the wire, 116 bytes from where the cursor stands */
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
  class_definition_record.key_type = wire[at]; at = at + 1;
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
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> class_definition_record.commodity_code[class_definition_at] = wire[at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 8 -> class_definition_record.instrument_type_id[class_definition_at] = wire[at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> class_definition_record.instrument_type_key[class_definition_at] = wire[at]; at = at + 1; class_definition_at = class_definition_at + 1
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
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> class_definition_record.decimal_in_contract_size[class_definition_at] = wire[at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> class_definition_record.decimal_in_strike_price[class_definition_at] = wire[at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> class_definition_record.decimal_in_price[class_definition_at] = wire[at]; at = at + 1; class_definition_at = class_definition_at + 1
  :: else -> break
  od;
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
  :: class_definition_at < 2 -> class_definition_record.filler_2[class_definition_at] = wire[at]; at = at + 1; class_definition_at = class_definition_at + 1
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
  assert(class_definition_read.key_type == class_definition_written.key_type);
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
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> assert(class_definition_read.commodity_code[class_definition_at] == class_definition_written.commodity_code[class_definition_at]); class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 8 -> assert(class_definition_read.instrument_type_id[class_definition_at] == class_definition_written.instrument_type_id[class_definition_at]); class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 4 -> assert(class_definition_read.instrument_type_key[class_definition_at] == class_definition_written.instrument_type_key[class_definition_at]); class_definition_at = class_definition_at + 1
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
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> assert(class_definition_read.decimal_in_contract_size[class_definition_at] == class_definition_written.decimal_in_contract_size[class_definition_at]); class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> assert(class_definition_read.decimal_in_strike_price[class_definition_at] == class_definition_written.decimal_in_strike_price[class_definition_at]); class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  class_definition_at = 0;
  do
  :: class_definition_at < 2 -> assert(class_definition_read.decimal_in_price[class_definition_at] == class_definition_written.decimal_in_price[class_definition_at]); class_definition_at = class_definition_at + 1
  :: else -> break
  od;
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
  :: class_definition_at < 2 -> assert(class_definition_read.filler_2[class_definition_at] == class_definition_written.filler_2[class_definition_at]); class_definition_at = class_definition_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Definition: 116 bytes ---------------------------------------- */

/* Describes instrument static data. */
typedef InstrumentDefinition {
  byte orderbook_id[4];
  byte symbol[32];
  byte instrument_class_key[4];
  byte market[2];
  byte instrument_group[2];
  byte modifier[2];
  byte commodity_code[4];
  byte last_trading_date[4];
  byte last_trading_time[8];
  byte strike_price[8];
  byte effective_last_trading_date[4];
  byte first_trading_date[4];
  byte first_trading_time[8];
  byte filler_3[3];
  byte instrument_status_code;
  byte instrument_contract_size[4];
  byte instrument_price_quotation_factor[4];
  byte number_of_legs;
  byte vcm_flag;
  byte isin_code[12];
  byte effective_tomorrow;
  byte second_filler_3[3]
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
  :: instrument_definition_at < 2 -> instrument_definition_record.market[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 2 -> instrument_definition_record.instrument_group[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 2 -> instrument_definition_record.modifier[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
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
  :: instrument_definition_at < 8 -> instrument_definition_record.last_trading_time[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 8 -> instrument_definition_record.strike_price[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.effective_last_trading_date[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.first_trading_date[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 8 -> instrument_definition_record.first_trading_time[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 3 -> instrument_definition_record.filler_3[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_record.instrument_status_code = instrument_definition_value;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.instrument_contract_size[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.instrument_price_quotation_factor[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
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
  :: instrument_definition_at < 3 -> instrument_definition_record.second_filler_3[instrument_definition_at] = instrument_definition_value; instrument_definition_at = instrument_definition_at + 1
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
  :: instrument_definition_at < 2 -> instrument_definition_record.market[instrument_definition_at] = (instrument_definition_base + 40 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 2 -> instrument_definition_record.instrument_group[instrument_definition_at] = (instrument_definition_base + 42 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 2 -> instrument_definition_record.modifier[instrument_definition_at] = (instrument_definition_base + 44 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.commodity_code[instrument_definition_at] = (instrument_definition_base + 46 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.last_trading_date[instrument_definition_at] = (instrument_definition_base + 50 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 8 -> instrument_definition_record.last_trading_time[instrument_definition_at] = (instrument_definition_base + 54 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 8 -> instrument_definition_record.strike_price[instrument_definition_at] = (instrument_definition_base + 62 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.effective_last_trading_date[instrument_definition_at] = (instrument_definition_base + 70 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.first_trading_date[instrument_definition_at] = (instrument_definition_base + 74 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 8 -> instrument_definition_record.first_trading_time[instrument_definition_at] = (instrument_definition_base + 78 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 3 -> instrument_definition_record.filler_3[instrument_definition_at] = (instrument_definition_base + 86 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_record.instrument_status_code = (instrument_definition_base + 89 + 1) % 256;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.instrument_contract_size[instrument_definition_at] = (instrument_definition_base + 90 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.instrument_price_quotation_factor[instrument_definition_at] = (instrument_definition_base + 94 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_record.number_of_legs = (instrument_definition_base + 98 + 1) % 256;
  instrument_definition_record.vcm_flag = (instrument_definition_base + 99 + 1) % 256;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 12 -> instrument_definition_record.isin_code[instrument_definition_at] = (instrument_definition_base + 100 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_record.effective_tomorrow = (instrument_definition_base + 112 + 1) % 256;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 3 -> instrument_definition_record.second_filler_3[instrument_definition_at] = (instrument_definition_base + 113 + instrument_definition_at + 1) % 256; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Definition to the wire, 116 bytes from where the cursor stands */
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
  :: instrument_definition_at < 2 -> wire[at] = instrument_definition_record.market[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 2 -> wire[at] = instrument_definition_record.instrument_group[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 2 -> wire[at] = instrument_definition_record.modifier[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
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
  :: instrument_definition_at < 8 -> wire[at] = instrument_definition_record.last_trading_time[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 8 -> wire[at] = instrument_definition_record.strike_price[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> wire[at] = instrument_definition_record.effective_last_trading_date[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> wire[at] = instrument_definition_record.first_trading_date[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 8 -> wire[at] = instrument_definition_record.first_trading_time[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 3 -> wire[at] = instrument_definition_record.filler_3[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  wire[at] = instrument_definition_record.instrument_status_code; at = at + 1;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> wire[at] = instrument_definition_record.instrument_contract_size[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> wire[at] = instrument_definition_record.instrument_price_quotation_factor[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
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
  :: instrument_definition_at < 3 -> wire[at] = instrument_definition_record.second_filler_3[instrument_definition_at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Definition off the wire, 116 bytes from where the cursor stands */
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
  :: instrument_definition_at < 2 -> instrument_definition_record.market[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 2 -> instrument_definition_record.instrument_group[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 2 -> instrument_definition_record.modifier[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
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
  :: instrument_definition_at < 8 -> instrument_definition_record.last_trading_time[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 8 -> instrument_definition_record.strike_price[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.effective_last_trading_date[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.first_trading_date[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 8 -> instrument_definition_record.first_trading_time[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 3 -> instrument_definition_record.filler_3[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_record.instrument_status_code = wire[at]; at = at + 1;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.instrument_contract_size[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> instrument_definition_record.instrument_price_quotation_factor[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
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
  :: instrument_definition_at < 3 -> instrument_definition_record.second_filler_3[instrument_definition_at] = wire[at]; at = at + 1; instrument_definition_at = instrument_definition_at + 1
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
  :: instrument_definition_at < 2 -> assert(instrument_definition_read.market[instrument_definition_at] == instrument_definition_written.market[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 2 -> assert(instrument_definition_read.instrument_group[instrument_definition_at] == instrument_definition_written.instrument_group[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 2 -> assert(instrument_definition_read.modifier[instrument_definition_at] == instrument_definition_written.modifier[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
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
  :: instrument_definition_at < 8 -> assert(instrument_definition_read.last_trading_time[instrument_definition_at] == instrument_definition_written.last_trading_time[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 8 -> assert(instrument_definition_read.strike_price[instrument_definition_at] == instrument_definition_written.strike_price[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> assert(instrument_definition_read.effective_last_trading_date[instrument_definition_at] == instrument_definition_written.effective_last_trading_date[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> assert(instrument_definition_read.first_trading_date[instrument_definition_at] == instrument_definition_written.first_trading_date[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 8 -> assert(instrument_definition_read.first_trading_time[instrument_definition_at] == instrument_definition_written.first_trading_time[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 3 -> assert(instrument_definition_read.filler_3[instrument_definition_at] == instrument_definition_written.filler_3[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  assert(instrument_definition_read.instrument_status_code == instrument_definition_written.instrument_status_code);
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> assert(instrument_definition_read.instrument_contract_size[instrument_definition_at] == instrument_definition_written.instrument_contract_size[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
  :: else -> break
  od;
  instrument_definition_at = 0;
  do
  :: instrument_definition_at < 4 -> assert(instrument_definition_read.instrument_price_quotation_factor[instrument_definition_at] == instrument_definition_written.instrument_price_quotation_factor[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
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
  :: instrument_definition_at < 3 -> assert(instrument_definition_read.second_filler_3[instrument_definition_at] == instrument_definition_written.second_filler_3[instrument_definition_at]); instrument_definition_at = instrument_definition_at + 1
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

/* ---- Market Status: 36 bytes ------------------------------------------------- */

/* Indicates the state of the Exchange, Market, Instrument Type, or Class. */
typedef MarketStatus {
  byte state_level;
  byte status_market[4];
  byte instrument_type_key[4];
  byte instrument_class_key[4];
  byte filler_4[4];
  byte actual_start_time[8];
  byte planned_start_time[8];
  byte state[2];
  byte filler_1
};

int market_status_at;

/* every byte of Market Status set to one value */
inline fill_market_status(market_status_record, market_status_value) {
  market_status_record.state_level = market_status_value;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> market_status_record.status_market[market_status_at] = market_status_value; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> market_status_record.instrument_type_key[market_status_at] = market_status_value; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> market_status_record.instrument_class_key[market_status_at] = market_status_value; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> market_status_record.filler_4[market_status_at] = market_status_value; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 8 -> market_status_record.actual_start_time[market_status_at] = market_status_value; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 8 -> market_status_record.planned_start_time[market_status_at] = market_status_value; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 2 -> market_status_record.state[market_status_at] = market_status_value; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_record.filler_1 = market_status_value;
  skip
}

/* each byte of Market Status set to where it lies, so a field read out of place says so */
inline ramp_market_status(market_status_record, market_status_base) {
  market_status_record.state_level = (market_status_base + 0 + 1) % 256;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> market_status_record.status_market[market_status_at] = (market_status_base + 1 + market_status_at + 1) % 256; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> market_status_record.instrument_type_key[market_status_at] = (market_status_base + 5 + market_status_at + 1) % 256; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> market_status_record.instrument_class_key[market_status_at] = (market_status_base + 9 + market_status_at + 1) % 256; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> market_status_record.filler_4[market_status_at] = (market_status_base + 13 + market_status_at + 1) % 256; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 8 -> market_status_record.actual_start_time[market_status_at] = (market_status_base + 17 + market_status_at + 1) % 256; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 8 -> market_status_record.planned_start_time[market_status_at] = (market_status_base + 25 + market_status_at + 1) % 256; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 2 -> market_status_record.state[market_status_at] = (market_status_base + 33 + market_status_at + 1) % 256; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_record.filler_1 = (market_status_base + 35 + 1) % 256;
  skip
}

/* Market Status to the wire, 36 bytes from where the cursor stands */
inline encode_market_status(market_status_record) {
  wire[at] = market_status_record.state_level; at = at + 1;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> wire[at] = market_status_record.status_market[market_status_at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> wire[at] = market_status_record.instrument_type_key[market_status_at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> wire[at] = market_status_record.instrument_class_key[market_status_at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> wire[at] = market_status_record.filler_4[market_status_at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 8 -> wire[at] = market_status_record.actual_start_time[market_status_at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 8 -> wire[at] = market_status_record.planned_start_time[market_status_at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 2 -> wire[at] = market_status_record.state[market_status_at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  wire[at] = market_status_record.filler_1; at = at + 1;
  skip
}

/* Market Status off the wire, 36 bytes from where the cursor stands */
inline decode_market_status(market_status_record) {
  market_status_record.state_level = wire[at]; at = at + 1;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> market_status_record.status_market[market_status_at] = wire[at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> market_status_record.instrument_type_key[market_status_at] = wire[at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> market_status_record.instrument_class_key[market_status_at] = wire[at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> market_status_record.filler_4[market_status_at] = wire[at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 8 -> market_status_record.actual_start_time[market_status_at] = wire[at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 8 -> market_status_record.planned_start_time[market_status_at] = wire[at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 2 -> market_status_record.state[market_status_at] = wire[at]; at = at + 1; market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_record.filler_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Status is what was written, byte for byte */
inline equal_market_status(market_status_read, market_status_written) {
  assert(market_status_read.state_level == market_status_written.state_level);
  market_status_at = 0;
  do
  :: market_status_at < 4 -> assert(market_status_read.status_market[market_status_at] == market_status_written.status_market[market_status_at]); market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> assert(market_status_read.instrument_type_key[market_status_at] == market_status_written.instrument_type_key[market_status_at]); market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> assert(market_status_read.instrument_class_key[market_status_at] == market_status_written.instrument_class_key[market_status_at]); market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 4 -> assert(market_status_read.filler_4[market_status_at] == market_status_written.filler_4[market_status_at]); market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 8 -> assert(market_status_read.actual_start_time[market_status_at] == market_status_written.actual_start_time[market_status_at]); market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 8 -> assert(market_status_read.planned_start_time[market_status_at] == market_status_written.planned_start_time[market_status_at]); market_status_at = market_status_at + 1
  :: else -> break
  od;
  market_status_at = 0;
  do
  :: market_status_at < 2 -> assert(market_status_read.state[market_status_at] == market_status_written.state[market_status_at]); market_status_at = market_status_at + 1
  :: else -> break
  od;
  assert(market_status_read.filler_1 == market_status_written.filler_1);
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

/* ---- Vcm End: 20 bytes ------------------------------------------------------- */

/* Generated when VCM is ended on a particular instrument. */
typedef VcmEnd {
  byte orderbook_id[4];
  byte cooling_off_start_time[8];
  byte cooling_off_end_time[8]
};

int vcm_end_at;

/* every byte of Vcm End set to one value */
inline fill_vcm_end(vcm_end_record, vcm_end_value) {
  vcm_end_at = 0;
  do
  :: vcm_end_at < 4 -> vcm_end_record.orderbook_id[vcm_end_at] = vcm_end_value; vcm_end_at = vcm_end_at + 1
  :: else -> break
  od;
  vcm_end_at = 0;
  do
  :: vcm_end_at < 8 -> vcm_end_record.cooling_off_start_time[vcm_end_at] = vcm_end_value; vcm_end_at = vcm_end_at + 1
  :: else -> break
  od;
  vcm_end_at = 0;
  do
  :: vcm_end_at < 8 -> vcm_end_record.cooling_off_end_time[vcm_end_at] = vcm_end_value; vcm_end_at = vcm_end_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Vcm End set to where it lies, so a field read out of place says so */
inline ramp_vcm_end(vcm_end_record, vcm_end_base) {
  vcm_end_at = 0;
  do
  :: vcm_end_at < 4 -> vcm_end_record.orderbook_id[vcm_end_at] = (vcm_end_base + 0 + vcm_end_at + 1) % 256; vcm_end_at = vcm_end_at + 1
  :: else -> break
  od;
  vcm_end_at = 0;
  do
  :: vcm_end_at < 8 -> vcm_end_record.cooling_off_start_time[vcm_end_at] = (vcm_end_base + 4 + vcm_end_at + 1) % 256; vcm_end_at = vcm_end_at + 1
  :: else -> break
  od;
  vcm_end_at = 0;
  do
  :: vcm_end_at < 8 -> vcm_end_record.cooling_off_end_time[vcm_end_at] = (vcm_end_base + 12 + vcm_end_at + 1) % 256; vcm_end_at = vcm_end_at + 1
  :: else -> break
  od;
  skip
}

/* Vcm End to the wire, 20 bytes from where the cursor stands */
inline encode_vcm_end(vcm_end_record) {
  vcm_end_at = 0;
  do
  :: vcm_end_at < 4 -> wire[at] = vcm_end_record.orderbook_id[vcm_end_at]; at = at + 1; vcm_end_at = vcm_end_at + 1
  :: else -> break
  od;
  vcm_end_at = 0;
  do
  :: vcm_end_at < 8 -> wire[at] = vcm_end_record.cooling_off_start_time[vcm_end_at]; at = at + 1; vcm_end_at = vcm_end_at + 1
  :: else -> break
  od;
  vcm_end_at = 0;
  do
  :: vcm_end_at < 8 -> wire[at] = vcm_end_record.cooling_off_end_time[vcm_end_at]; at = at + 1; vcm_end_at = vcm_end_at + 1
  :: else -> break
  od;
  skip
}

/* Vcm End off the wire, 20 bytes from where the cursor stands */
inline decode_vcm_end(vcm_end_record) {
  vcm_end_at = 0;
  do
  :: vcm_end_at < 4 -> vcm_end_record.orderbook_id[vcm_end_at] = wire[at]; at = at + 1; vcm_end_at = vcm_end_at + 1
  :: else -> break
  od;
  vcm_end_at = 0;
  do
  :: vcm_end_at < 8 -> vcm_end_record.cooling_off_start_time[vcm_end_at] = wire[at]; at = at + 1; vcm_end_at = vcm_end_at + 1
  :: else -> break
  od;
  vcm_end_at = 0;
  do
  :: vcm_end_at < 8 -> vcm_end_record.cooling_off_end_time[vcm_end_at] = wire[at]; at = at + 1; vcm_end_at = vcm_end_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Vcm End is what was written, byte for byte */
inline equal_vcm_end(vcm_end_read, vcm_end_written) {
  vcm_end_at = 0;
  do
  :: vcm_end_at < 4 -> assert(vcm_end_read.orderbook_id[vcm_end_at] == vcm_end_written.orderbook_id[vcm_end_at]); vcm_end_at = vcm_end_at + 1
  :: else -> break
  od;
  vcm_end_at = 0;
  do
  :: vcm_end_at < 8 -> assert(vcm_end_read.cooling_off_start_time[vcm_end_at] == vcm_end_written.cooling_off_start_time[vcm_end_at]); vcm_end_at = vcm_end_at + 1
  :: else -> break
  od;
  vcm_end_at = 0;
  do
  :: vcm_end_at < 8 -> assert(vcm_end_read.cooling_off_end_time[vcm_end_at] == vcm_end_written.cooling_off_end_time[vcm_end_at]); vcm_end_at = vcm_end_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Thm Trigger: 14 bytes --------------------------------------------------- */

/* Generated when trading halt is triggered on a particular instrument class. */
typedef ThmTrigger {
  byte instrument_class_key[4];
  byte filler_10[10]
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
  :: thm_trigger_at < 10 -> thm_trigger_record.filler_10[thm_trigger_at] = thm_trigger_value; thm_trigger_at = thm_trigger_at + 1
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
  :: thm_trigger_at < 10 -> thm_trigger_record.filler_10[thm_trigger_at] = (thm_trigger_base + 4 + thm_trigger_at + 1) % 256; thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  skip
}

/* Thm Trigger to the wire, 14 bytes from where the cursor stands */
inline encode_thm_trigger(thm_trigger_record) {
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 4 -> wire[at] = thm_trigger_record.instrument_class_key[thm_trigger_at]; at = at + 1; thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 10 -> wire[at] = thm_trigger_record.filler_10[thm_trigger_at]; at = at + 1; thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  skip
}

/* Thm Trigger off the wire, 14 bytes from where the cursor stands */
inline decode_thm_trigger(thm_trigger_record) {
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 4 -> thm_trigger_record.instrument_class_key[thm_trigger_at] = wire[at]; at = at + 1; thm_trigger_at = thm_trigger_at + 1
  :: else -> break
  od;
  thm_trigger_at = 0;
  do
  :: thm_trigger_at < 10 -> thm_trigger_record.filler_10[thm_trigger_at] = wire[at]; at = at + 1; thm_trigger_at = thm_trigger_at + 1
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
  :: thm_trigger_at < 10 -> assert(thm_trigger_read.filler_10[thm_trigger_at] == thm_trigger_written.filler_10[thm_trigger_at]); thm_trigger_at = thm_trigger_at + 1
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
    assert(at == 24);
    at = 0;
    decode_open_interest_message(open_interest_message_got);
    assert(at == 24);
    equal_open_interest_message(open_interest_message_got, open_interest_message_sent)
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
    assert(at == 82);
    at = 0;
    decode_commodity_definition(commodity_definition_got);
    assert(at == 82);
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
    assert(at == 116);
    at = 0;
    decode_class_definition(class_definition_got);
    assert(at == 116);
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
    assert(at == 116);
    at = 0;
    decode_instrument_definition(instrument_definition_got);
    assert(at == 116);
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
    assert(at == 36);
    at = 0;
    decode_market_status(market_status_got);
    assert(at == 36);
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

/* Vcm End: encoded, read back, and compared */
proctype check_vcm_end() {
  VcmEnd vcm_end_sent;
  VcmEnd vcm_end_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_vcm_end(vcm_end_sent, 0)
  :: pattern == 1 -> fill_vcm_end(vcm_end_sent, 32)
  :: pattern == 2 -> fill_vcm_end(vcm_end_sent, 255)
  :: else -> ramp_vcm_end(vcm_end_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_vcm_end(vcm_end_sent);
    assert(at == 20);
    at = 0;
    decode_vcm_end(vcm_end_got);
    assert(at == 20);
    equal_vcm_end(vcm_end_got, vcm_end_sent)
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
    assert(at == 14);
    at = 0;
    decode_thm_trigger(thm_trigger_got);
    assert(at == 14);
    equal_thm_trigger(thm_trigger_got, thm_trigger_sent)
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
  :: run check_aggregate_implied_order()
  :: run check_calculated_opening_price_message()
  :: run check_implied_volatility_message()
  :: run check_open_interest_message()
  :: run check_commodity_definition()
  :: run check_class_definition()
  :: run check_instrument_definition()
  :: run check_combination_definition()
  :: run check_refresh_complete()
  :: run check_market_status()
  :: run check_instrument_status()
  :: run check_commodity_and_class_status()
  :: run check_vcm_trigger()
  :: run check_vcm_end()
  :: run check_thm_trigger()
  :: run check_trade_statistics_message()
  fi
}
