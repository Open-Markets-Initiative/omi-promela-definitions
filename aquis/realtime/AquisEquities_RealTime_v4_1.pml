/*
 * Aquis Exchange Real Time Market Data Feed
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
 *   - a run counted by a field
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 27

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 1 bytes -------------------------------------------------- */

/* Aquis udp packet header */
typedef PacketHeader {
  byte message_count
};

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_record.message_count = packet_header_value;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_record.message_count = (packet_header_base + 0 + 1) % 256;
  skip
}

/* Packet Header to the wire, 1 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  wire[at] = packet_header_record.message_count; at = at + 1;
  skip
}

/* Packet Header off the wire, 1 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_record.message_count = wire[at]; at = at + 1;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  assert(packet_header_read.message_count == packet_header_written.message_count);
  skip
}

/* ---- Message Header: 6 bytes ------------------------------------------------- */

/* Aquis market data message header */
typedef MessageHeader {
  byte msg_type;
  byte msg_length;
  byte seq_no[4]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_record.msg_type = message_header_value;
  message_header_record.msg_length = message_header_value;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.seq_no[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_record.msg_type = (message_header_base + 0 + 1) % 256;
  message_header_record.msg_length = (message_header_base + 1 + 1) % 256;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.seq_no[message_header_at] = (message_header_base + 2 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 6 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  wire[at] = message_header_record.msg_type; at = at + 1;
  wire[at] = message_header_record.msg_length; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.seq_no[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 6 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_record.msg_type = wire[at]; at = at + 1;
  message_header_record.msg_length = wire[at]; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.seq_no[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  assert(message_header_read.msg_type == message_header_written.msg_type);
  assert(message_header_read.msg_length == message_header_written.msg_length);
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.seq_no[message_header_at] == message_header_written.seq_no[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Tick Table Data Message: 27 bytes --------------------------------------- */

/* A series of Tick Table Data messages are published pre-market to specify the dynamic tick tables and static ticks that apply to the securities traded on Aquis. */
typedef TickTableDataMessage {
  byte tick_table_id;
  byte name[10];
  byte threshold[8];
  byte tick_size[8]
};

int tick_table_data_message_at;

/* every byte of Tick Table Data Message set to one value */
inline fill_tick_table_data_message(tick_table_data_message_record, tick_table_data_message_value) {
  tick_table_data_message_record.tick_table_id = tick_table_data_message_value;
  tick_table_data_message_at = 0;
  do
  :: tick_table_data_message_at < 10 -> tick_table_data_message_record.name[tick_table_data_message_at] = tick_table_data_message_value; tick_table_data_message_at = tick_table_data_message_at + 1
  :: else -> break
  od;
  tick_table_data_message_at = 0;
  do
  :: tick_table_data_message_at < 8 -> tick_table_data_message_record.threshold[tick_table_data_message_at] = tick_table_data_message_value; tick_table_data_message_at = tick_table_data_message_at + 1
  :: else -> break
  od;
  tick_table_data_message_at = 0;
  do
  :: tick_table_data_message_at < 8 -> tick_table_data_message_record.tick_size[tick_table_data_message_at] = tick_table_data_message_value; tick_table_data_message_at = tick_table_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Tick Table Data Message set to where it lies, so a field read out of place says so */
inline ramp_tick_table_data_message(tick_table_data_message_record, tick_table_data_message_base) {
  tick_table_data_message_record.tick_table_id = (tick_table_data_message_base + 0 + 1) % 256;
  tick_table_data_message_at = 0;
  do
  :: tick_table_data_message_at < 10 -> tick_table_data_message_record.name[tick_table_data_message_at] = (tick_table_data_message_base + 1 + tick_table_data_message_at + 1) % 256; tick_table_data_message_at = tick_table_data_message_at + 1
  :: else -> break
  od;
  tick_table_data_message_at = 0;
  do
  :: tick_table_data_message_at < 8 -> tick_table_data_message_record.threshold[tick_table_data_message_at] = (tick_table_data_message_base + 11 + tick_table_data_message_at + 1) % 256; tick_table_data_message_at = tick_table_data_message_at + 1
  :: else -> break
  od;
  tick_table_data_message_at = 0;
  do
  :: tick_table_data_message_at < 8 -> tick_table_data_message_record.tick_size[tick_table_data_message_at] = (tick_table_data_message_base + 19 + tick_table_data_message_at + 1) % 256; tick_table_data_message_at = tick_table_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* Tick Table Data Message to the wire, 27 bytes from where the cursor stands */
inline encode_tick_table_data_message(tick_table_data_message_record) {
  wire[at] = tick_table_data_message_record.tick_table_id; at = at + 1;
  tick_table_data_message_at = 0;
  do
  :: tick_table_data_message_at < 10 -> wire[at] = tick_table_data_message_record.name[tick_table_data_message_at]; at = at + 1; tick_table_data_message_at = tick_table_data_message_at + 1
  :: else -> break
  od;
  tick_table_data_message_at = 0;
  do
  :: tick_table_data_message_at < 8 -> wire[at] = tick_table_data_message_record.threshold[tick_table_data_message_at]; at = at + 1; tick_table_data_message_at = tick_table_data_message_at + 1
  :: else -> break
  od;
  tick_table_data_message_at = 0;
  do
  :: tick_table_data_message_at < 8 -> wire[at] = tick_table_data_message_record.tick_size[tick_table_data_message_at]; at = at + 1; tick_table_data_message_at = tick_table_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* Tick Table Data Message off the wire, 27 bytes from where the cursor stands */
inline decode_tick_table_data_message(tick_table_data_message_record) {
  tick_table_data_message_record.tick_table_id = wire[at]; at = at + 1;
  tick_table_data_message_at = 0;
  do
  :: tick_table_data_message_at < 10 -> tick_table_data_message_record.name[tick_table_data_message_at] = wire[at]; at = at + 1; tick_table_data_message_at = tick_table_data_message_at + 1
  :: else -> break
  od;
  tick_table_data_message_at = 0;
  do
  :: tick_table_data_message_at < 8 -> tick_table_data_message_record.threshold[tick_table_data_message_at] = wire[at]; at = at + 1; tick_table_data_message_at = tick_table_data_message_at + 1
  :: else -> break
  od;
  tick_table_data_message_at = 0;
  do
  :: tick_table_data_message_at < 8 -> tick_table_data_message_record.tick_size[tick_table_data_message_at] = wire[at]; at = at + 1; tick_table_data_message_at = tick_table_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Tick Table Data Message is what was written, byte for byte */
inline equal_tick_table_data_message(tick_table_data_message_read, tick_table_data_message_written) {
  assert(tick_table_data_message_read.tick_table_id == tick_table_data_message_written.tick_table_id);
  tick_table_data_message_at = 0;
  do
  :: tick_table_data_message_at < 10 -> assert(tick_table_data_message_read.name[tick_table_data_message_at] == tick_table_data_message_written.name[tick_table_data_message_at]); tick_table_data_message_at = tick_table_data_message_at + 1
  :: else -> break
  od;
  tick_table_data_message_at = 0;
  do
  :: tick_table_data_message_at < 8 -> assert(tick_table_data_message_read.threshold[tick_table_data_message_at] == tick_table_data_message_written.threshold[tick_table_data_message_at]); tick_table_data_message_at = tick_table_data_message_at + 1
  :: else -> break
  od;
  tick_table_data_message_at = 0;
  do
  :: tick_table_data_message_at < 8 -> assert(tick_table_data_message_read.tick_size[tick_table_data_message_at] == tick_table_data_message_written.tick_size[tick_table_data_message_at]); tick_table_data_message_at = tick_table_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Lot Size Composite: 9 bytes --------------------------------------------- */

/* Lot size scaled at runtime by lotSizeDecimal */
typedef LotSizeComposite {
  byte lot_size[8];
  byte lot_size_decimal
};

int lot_size_composite_at;

/* every byte of Lot Size Composite set to one value */
inline fill_lot_size_composite(lot_size_composite_record, lot_size_composite_value) {
  lot_size_composite_at = 0;
  do
  :: lot_size_composite_at < 8 -> lot_size_composite_record.lot_size[lot_size_composite_at] = lot_size_composite_value; lot_size_composite_at = lot_size_composite_at + 1
  :: else -> break
  od;
  lot_size_composite_record.lot_size_decimal = lot_size_composite_value;
  skip
}

/* each byte of Lot Size Composite set to where it lies, so a field read out of place says so */
inline ramp_lot_size_composite(lot_size_composite_record, lot_size_composite_base) {
  lot_size_composite_at = 0;
  do
  :: lot_size_composite_at < 8 -> lot_size_composite_record.lot_size[lot_size_composite_at] = (lot_size_composite_base + 0 + lot_size_composite_at + 1) % 256; lot_size_composite_at = lot_size_composite_at + 1
  :: else -> break
  od;
  lot_size_composite_record.lot_size_decimal = (lot_size_composite_base + 8 + 1) % 256;
  skip
}

/* Lot Size Composite to the wire, 9 bytes from where the cursor stands */
inline encode_lot_size_composite(lot_size_composite_record) {
  lot_size_composite_at = 0;
  do
  :: lot_size_composite_at < 8 -> wire[at] = lot_size_composite_record.lot_size[lot_size_composite_at]; at = at + 1; lot_size_composite_at = lot_size_composite_at + 1
  :: else -> break
  od;
  wire[at] = lot_size_composite_record.lot_size_decimal; at = at + 1;
  skip
}

/* Lot Size Composite off the wire, 9 bytes from where the cursor stands */
inline decode_lot_size_composite(lot_size_composite_record) {
  lot_size_composite_at = 0;
  do
  :: lot_size_composite_at < 8 -> lot_size_composite_record.lot_size[lot_size_composite_at] = wire[at]; at = at + 1; lot_size_composite_at = lot_size_composite_at + 1
  :: else -> break
  od;
  lot_size_composite_record.lot_size_decimal = wire[at]; at = at + 1;
  skip
}

/* what was read of Lot Size Composite is what was written, byte for byte */
inline equal_lot_size_composite(lot_size_composite_read, lot_size_composite_written) {
  lot_size_composite_at = 0;
  do
  :: lot_size_composite_at < 8 -> assert(lot_size_composite_read.lot_size[lot_size_composite_at] == lot_size_composite_written.lot_size[lot_size_composite_at]); lot_size_composite_at = lot_size_composite_at + 1
  :: else -> break
  od;
  assert(lot_size_composite_read.lot_size_decimal == lot_size_composite_written.lot_size_decimal);
  skip
}

/* ---- Aod Update Message: 22 bytes -------------------------------------------- */

/* During the AoD this message is used to publish the indicative price and indicative matched volume. */
typedef AodUpdateMessage {
  byte security_id[2];
  byte indicative_price[8];
  byte match_vol[4];
  byte timestamp[8]
};

int aod_update_message_at;

/* every byte of Aod Update Message set to one value */
inline fill_aod_update_message(aod_update_message_record, aod_update_message_value) {
  aod_update_message_at = 0;
  do
  :: aod_update_message_at < 2 -> aod_update_message_record.security_id[aod_update_message_at] = aod_update_message_value; aod_update_message_at = aod_update_message_at + 1
  :: else -> break
  od;
  aod_update_message_at = 0;
  do
  :: aod_update_message_at < 8 -> aod_update_message_record.indicative_price[aod_update_message_at] = aod_update_message_value; aod_update_message_at = aod_update_message_at + 1
  :: else -> break
  od;
  aod_update_message_at = 0;
  do
  :: aod_update_message_at < 4 -> aod_update_message_record.match_vol[aod_update_message_at] = aod_update_message_value; aod_update_message_at = aod_update_message_at + 1
  :: else -> break
  od;
  aod_update_message_at = 0;
  do
  :: aod_update_message_at < 8 -> aod_update_message_record.timestamp[aod_update_message_at] = aod_update_message_value; aod_update_message_at = aod_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Aod Update Message set to where it lies, so a field read out of place says so */
inline ramp_aod_update_message(aod_update_message_record, aod_update_message_base) {
  aod_update_message_at = 0;
  do
  :: aod_update_message_at < 2 -> aod_update_message_record.security_id[aod_update_message_at] = (aod_update_message_base + 0 + aod_update_message_at + 1) % 256; aod_update_message_at = aod_update_message_at + 1
  :: else -> break
  od;
  aod_update_message_at = 0;
  do
  :: aod_update_message_at < 8 -> aod_update_message_record.indicative_price[aod_update_message_at] = (aod_update_message_base + 2 + aod_update_message_at + 1) % 256; aod_update_message_at = aod_update_message_at + 1
  :: else -> break
  od;
  aod_update_message_at = 0;
  do
  :: aod_update_message_at < 4 -> aod_update_message_record.match_vol[aod_update_message_at] = (aod_update_message_base + 10 + aod_update_message_at + 1) % 256; aod_update_message_at = aod_update_message_at + 1
  :: else -> break
  od;
  aod_update_message_at = 0;
  do
  :: aod_update_message_at < 8 -> aod_update_message_record.timestamp[aod_update_message_at] = (aod_update_message_base + 14 + aod_update_message_at + 1) % 256; aod_update_message_at = aod_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Aod Update Message to the wire, 22 bytes from where the cursor stands */
inline encode_aod_update_message(aod_update_message_record) {
  aod_update_message_at = 0;
  do
  :: aod_update_message_at < 2 -> wire[at] = aod_update_message_record.security_id[aod_update_message_at]; at = at + 1; aod_update_message_at = aod_update_message_at + 1
  :: else -> break
  od;
  aod_update_message_at = 0;
  do
  :: aod_update_message_at < 8 -> wire[at] = aod_update_message_record.indicative_price[aod_update_message_at]; at = at + 1; aod_update_message_at = aod_update_message_at + 1
  :: else -> break
  od;
  aod_update_message_at = 0;
  do
  :: aod_update_message_at < 4 -> wire[at] = aod_update_message_record.match_vol[aod_update_message_at]; at = at + 1; aod_update_message_at = aod_update_message_at + 1
  :: else -> break
  od;
  aod_update_message_at = 0;
  do
  :: aod_update_message_at < 8 -> wire[at] = aod_update_message_record.timestamp[aod_update_message_at]; at = at + 1; aod_update_message_at = aod_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Aod Update Message off the wire, 22 bytes from where the cursor stands */
inline decode_aod_update_message(aod_update_message_record) {
  aod_update_message_at = 0;
  do
  :: aod_update_message_at < 2 -> aod_update_message_record.security_id[aod_update_message_at] = wire[at]; at = at + 1; aod_update_message_at = aod_update_message_at + 1
  :: else -> break
  od;
  aod_update_message_at = 0;
  do
  :: aod_update_message_at < 8 -> aod_update_message_record.indicative_price[aod_update_message_at] = wire[at]; at = at + 1; aod_update_message_at = aod_update_message_at + 1
  :: else -> break
  od;
  aod_update_message_at = 0;
  do
  :: aod_update_message_at < 4 -> aod_update_message_record.match_vol[aod_update_message_at] = wire[at]; at = at + 1; aod_update_message_at = aod_update_message_at + 1
  :: else -> break
  od;
  aod_update_message_at = 0;
  do
  :: aod_update_message_at < 8 -> aod_update_message_record.timestamp[aod_update_message_at] = wire[at]; at = at + 1; aod_update_message_at = aod_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Aod Update Message is what was written, byte for byte */
inline equal_aod_update_message(aod_update_message_read, aod_update_message_written) {
  aod_update_message_at = 0;
  do
  :: aod_update_message_at < 2 -> assert(aod_update_message_read.security_id[aod_update_message_at] == aod_update_message_written.security_id[aod_update_message_at]); aod_update_message_at = aod_update_message_at + 1
  :: else -> break
  od;
  aod_update_message_at = 0;
  do
  :: aod_update_message_at < 8 -> assert(aod_update_message_read.indicative_price[aod_update_message_at] == aod_update_message_written.indicative_price[aod_update_message_at]); aod_update_message_at = aod_update_message_at + 1
  :: else -> break
  od;
  aod_update_message_at = 0;
  do
  :: aod_update_message_at < 4 -> assert(aod_update_message_read.match_vol[aod_update_message_at] == aod_update_message_written.match_vol[aod_update_message_at]); aod_update_message_at = aod_update_message_at + 1
  :: else -> break
  od;
  aod_update_message_at = 0;
  do
  :: aod_update_message_at < 8 -> assert(aod_update_message_read.timestamp[aod_update_message_at] == aod_update_message_written.timestamp[aod_update_message_at]); aod_update_message_at = aod_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mac Update Message: 26 bytes -------------------------------------------- */

/* During the MaC this message is used to publish the indicative price from the buy and sell order totals. */
typedef MacUpdateMessage {
  byte security_id[2];
  byte indicative_price[8];
  byte closing_buy_qty[4];
  byte closing_sell_qty[4];
  byte timestamp[8]
};

int mac_update_message_at;

/* every byte of Mac Update Message set to one value */
inline fill_mac_update_message(mac_update_message_record, mac_update_message_value) {
  mac_update_message_at = 0;
  do
  :: mac_update_message_at < 2 -> mac_update_message_record.security_id[mac_update_message_at] = mac_update_message_value; mac_update_message_at = mac_update_message_at + 1
  :: else -> break
  od;
  mac_update_message_at = 0;
  do
  :: mac_update_message_at < 8 -> mac_update_message_record.indicative_price[mac_update_message_at] = mac_update_message_value; mac_update_message_at = mac_update_message_at + 1
  :: else -> break
  od;
  mac_update_message_at = 0;
  do
  :: mac_update_message_at < 4 -> mac_update_message_record.closing_buy_qty[mac_update_message_at] = mac_update_message_value; mac_update_message_at = mac_update_message_at + 1
  :: else -> break
  od;
  mac_update_message_at = 0;
  do
  :: mac_update_message_at < 4 -> mac_update_message_record.closing_sell_qty[mac_update_message_at] = mac_update_message_value; mac_update_message_at = mac_update_message_at + 1
  :: else -> break
  od;
  mac_update_message_at = 0;
  do
  :: mac_update_message_at < 8 -> mac_update_message_record.timestamp[mac_update_message_at] = mac_update_message_value; mac_update_message_at = mac_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mac Update Message set to where it lies, so a field read out of place says so */
inline ramp_mac_update_message(mac_update_message_record, mac_update_message_base) {
  mac_update_message_at = 0;
  do
  :: mac_update_message_at < 2 -> mac_update_message_record.security_id[mac_update_message_at] = (mac_update_message_base + 0 + mac_update_message_at + 1) % 256; mac_update_message_at = mac_update_message_at + 1
  :: else -> break
  od;
  mac_update_message_at = 0;
  do
  :: mac_update_message_at < 8 -> mac_update_message_record.indicative_price[mac_update_message_at] = (mac_update_message_base + 2 + mac_update_message_at + 1) % 256; mac_update_message_at = mac_update_message_at + 1
  :: else -> break
  od;
  mac_update_message_at = 0;
  do
  :: mac_update_message_at < 4 -> mac_update_message_record.closing_buy_qty[mac_update_message_at] = (mac_update_message_base + 10 + mac_update_message_at + 1) % 256; mac_update_message_at = mac_update_message_at + 1
  :: else -> break
  od;
  mac_update_message_at = 0;
  do
  :: mac_update_message_at < 4 -> mac_update_message_record.closing_sell_qty[mac_update_message_at] = (mac_update_message_base + 14 + mac_update_message_at + 1) % 256; mac_update_message_at = mac_update_message_at + 1
  :: else -> break
  od;
  mac_update_message_at = 0;
  do
  :: mac_update_message_at < 8 -> mac_update_message_record.timestamp[mac_update_message_at] = (mac_update_message_base + 18 + mac_update_message_at + 1) % 256; mac_update_message_at = mac_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mac Update Message to the wire, 26 bytes from where the cursor stands */
inline encode_mac_update_message(mac_update_message_record) {
  mac_update_message_at = 0;
  do
  :: mac_update_message_at < 2 -> wire[at] = mac_update_message_record.security_id[mac_update_message_at]; at = at + 1; mac_update_message_at = mac_update_message_at + 1
  :: else -> break
  od;
  mac_update_message_at = 0;
  do
  :: mac_update_message_at < 8 -> wire[at] = mac_update_message_record.indicative_price[mac_update_message_at]; at = at + 1; mac_update_message_at = mac_update_message_at + 1
  :: else -> break
  od;
  mac_update_message_at = 0;
  do
  :: mac_update_message_at < 4 -> wire[at] = mac_update_message_record.closing_buy_qty[mac_update_message_at]; at = at + 1; mac_update_message_at = mac_update_message_at + 1
  :: else -> break
  od;
  mac_update_message_at = 0;
  do
  :: mac_update_message_at < 4 -> wire[at] = mac_update_message_record.closing_sell_qty[mac_update_message_at]; at = at + 1; mac_update_message_at = mac_update_message_at + 1
  :: else -> break
  od;
  mac_update_message_at = 0;
  do
  :: mac_update_message_at < 8 -> wire[at] = mac_update_message_record.timestamp[mac_update_message_at]; at = at + 1; mac_update_message_at = mac_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mac Update Message off the wire, 26 bytes from where the cursor stands */
inline decode_mac_update_message(mac_update_message_record) {
  mac_update_message_at = 0;
  do
  :: mac_update_message_at < 2 -> mac_update_message_record.security_id[mac_update_message_at] = wire[at]; at = at + 1; mac_update_message_at = mac_update_message_at + 1
  :: else -> break
  od;
  mac_update_message_at = 0;
  do
  :: mac_update_message_at < 8 -> mac_update_message_record.indicative_price[mac_update_message_at] = wire[at]; at = at + 1; mac_update_message_at = mac_update_message_at + 1
  :: else -> break
  od;
  mac_update_message_at = 0;
  do
  :: mac_update_message_at < 4 -> mac_update_message_record.closing_buy_qty[mac_update_message_at] = wire[at]; at = at + 1; mac_update_message_at = mac_update_message_at + 1
  :: else -> break
  od;
  mac_update_message_at = 0;
  do
  :: mac_update_message_at < 4 -> mac_update_message_record.closing_sell_qty[mac_update_message_at] = wire[at]; at = at + 1; mac_update_message_at = mac_update_message_at + 1
  :: else -> break
  od;
  mac_update_message_at = 0;
  do
  :: mac_update_message_at < 8 -> mac_update_message_record.timestamp[mac_update_message_at] = wire[at]; at = at + 1; mac_update_message_at = mac_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mac Update Message is what was written, byte for byte */
inline equal_mac_update_message(mac_update_message_read, mac_update_message_written) {
  mac_update_message_at = 0;
  do
  :: mac_update_message_at < 2 -> assert(mac_update_message_read.security_id[mac_update_message_at] == mac_update_message_written.security_id[mac_update_message_at]); mac_update_message_at = mac_update_message_at + 1
  :: else -> break
  od;
  mac_update_message_at = 0;
  do
  :: mac_update_message_at < 8 -> assert(mac_update_message_read.indicative_price[mac_update_message_at] == mac_update_message_written.indicative_price[mac_update_message_at]); mac_update_message_at = mac_update_message_at + 1
  :: else -> break
  od;
  mac_update_message_at = 0;
  do
  :: mac_update_message_at < 4 -> assert(mac_update_message_read.closing_buy_qty[mac_update_message_at] == mac_update_message_written.closing_buy_qty[mac_update_message_at]); mac_update_message_at = mac_update_message_at + 1
  :: else -> break
  od;
  mac_update_message_at = 0;
  do
  :: mac_update_message_at < 4 -> assert(mac_update_message_read.closing_sell_qty[mac_update_message_at] == mac_update_message_written.closing_sell_qty[mac_update_message_at]); mac_update_message_at = mac_update_message_at + 1
  :: else -> break
  od;
  mac_update_message_at = 0;
  do
  :: mac_update_message_at < 8 -> assert(mac_update_message_read.timestamp[mac_update_message_at] == mac_update_message_written.timestamp[mac_update_message_at]); mac_update_message_at = mac_update_message_at + 1
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
    assert(at == 1);
    at = 0;
    decode_packet_header(packet_header_got);
    assert(at == 1);
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
    assert(at == 6);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 6);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Tick Table Data Message: encoded, read back, and compared */
proctype check_tick_table_data_message() {
  TickTableDataMessage tick_table_data_message_sent;
  TickTableDataMessage tick_table_data_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_tick_table_data_message(tick_table_data_message_sent, 0)
  :: pattern == 1 -> fill_tick_table_data_message(tick_table_data_message_sent, 32)
  :: pattern == 2 -> fill_tick_table_data_message(tick_table_data_message_sent, 255)
  :: else -> ramp_tick_table_data_message(tick_table_data_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_tick_table_data_message(tick_table_data_message_sent);
    assert(at == 27);
    at = 0;
    decode_tick_table_data_message(tick_table_data_message_got);
    assert(at == 27);
    equal_tick_table_data_message(tick_table_data_message_got, tick_table_data_message_sent)
  }
}

/* Lot Size Composite: encoded, read back, and compared */
proctype check_lot_size_composite() {
  LotSizeComposite lot_size_composite_sent;
  LotSizeComposite lot_size_composite_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_lot_size_composite(lot_size_composite_sent, 0)
  :: pattern == 1 -> fill_lot_size_composite(lot_size_composite_sent, 32)
  :: pattern == 2 -> fill_lot_size_composite(lot_size_composite_sent, 255)
  :: else -> ramp_lot_size_composite(lot_size_composite_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_lot_size_composite(lot_size_composite_sent);
    assert(at == 9);
    at = 0;
    decode_lot_size_composite(lot_size_composite_got);
    assert(at == 9);
    equal_lot_size_composite(lot_size_composite_got, lot_size_composite_sent)
  }
}

/* Aod Update Message: encoded, read back, and compared */
proctype check_aod_update_message() {
  AodUpdateMessage aod_update_message_sent;
  AodUpdateMessage aod_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_aod_update_message(aod_update_message_sent, 0)
  :: pattern == 1 -> fill_aod_update_message(aod_update_message_sent, 32)
  :: pattern == 2 -> fill_aod_update_message(aod_update_message_sent, 255)
  :: else -> ramp_aod_update_message(aod_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_aod_update_message(aod_update_message_sent);
    assert(at == 22);
    at = 0;
    decode_aod_update_message(aod_update_message_got);
    assert(at == 22);
    equal_aod_update_message(aod_update_message_got, aod_update_message_sent)
  }
}

/* Mac Update Message: encoded, read back, and compared */
proctype check_mac_update_message() {
  MacUpdateMessage mac_update_message_sent;
  MacUpdateMessage mac_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mac_update_message(mac_update_message_sent, 0)
  :: pattern == 1 -> fill_mac_update_message(mac_update_message_sent, 32)
  :: pattern == 2 -> fill_mac_update_message(mac_update_message_sent, 255)
  :: else -> ramp_mac_update_message(mac_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mac_update_message(mac_update_message_sent);
    assert(at == 26);
    at = 0;
    decode_mac_update_message(mac_update_message_got);
    assert(at == 26);
    equal_mac_update_message(mac_update_message_got, mac_update_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_tick_table_data_message()
  :: run check_lot_size_composite()
  :: run check_aod_update_message()
  :: run check_mac_update_message()
  fi
}
