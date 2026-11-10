/*
 * Chicago Board Options Exchange Multicast Depth Of Book
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
 *   - a run filling what frames it
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 50

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 8 bytes -------------------------------------------------- */

typedef PacketHeader {
  byte length[2];
  byte message_count;
  byte unit;
  byte sequence[4]
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.length[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = packet_header_value;
  packet_header_record.unit = packet_header_value;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.length[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = (packet_header_base + 2 + 1) % 256;
  packet_header_record.unit = (packet_header_base + 3 + 1) % 256;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence[packet_header_at] = (packet_header_base + 4 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 8 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.length[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  wire[at] = packet_header_record.message_count; at = at + 1;
  wire[at] = packet_header_record.unit; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.sequence[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 8 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.length[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = wire[at]; at = at + 1;
  packet_header_record.unit = wire[at]; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.length[packet_header_at] == packet_header_written.length[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  assert(packet_header_read.message_count == packet_header_written.message_count);
  assert(packet_header_read.unit == packet_header_written.unit);
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.sequence[packet_header_at] == packet_header_written.sequence[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 2 bytes ------------------------------------------------- */

typedef MessageHeader {
  byte message_length;
  byte message_type
};

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_record.message_length = message_header_value;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_record.message_length = (message_header_base + 0 + 1) % 256;
  message_header_record.message_type = (message_header_base + 1 + 1) % 256;
  skip
}

/* Message Header to the wire, 2 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  wire[at] = message_header_record.message_length; at = at + 1;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 2 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_record.message_length = wire[at]; at = at + 1;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  assert(message_header_read.message_length == message_header_written.message_length);
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- Unit Clear Message: 4 bytes --------------------------------------------- */

/* Instructs feed recipients to clear all orders for the CXA book in the unit specified in the Sequenced Unit Header. Distributed in rare recovery events such as a datacentre fail-over. */
typedef UnitClearMessage {
  byte reserved_4[4]
};

int unit_clear_message_at;

/* every byte of Unit Clear Message set to one value */
inline fill_unit_clear_message(unit_clear_message_record, unit_clear_message_value) {
  unit_clear_message_at = 0;
  do
  :: unit_clear_message_at < 4 -> unit_clear_message_record.reserved_4[unit_clear_message_at] = unit_clear_message_value; unit_clear_message_at = unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Unit Clear Message set to where it lies, so a field read out of place says so */
inline ramp_unit_clear_message(unit_clear_message_record, unit_clear_message_base) {
  unit_clear_message_at = 0;
  do
  :: unit_clear_message_at < 4 -> unit_clear_message_record.reserved_4[unit_clear_message_at] = (unit_clear_message_base + 0 + unit_clear_message_at + 1) % 256; unit_clear_message_at = unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Unit Clear Message to the wire, 4 bytes from where the cursor stands */
inline encode_unit_clear_message(unit_clear_message_record) {
  unit_clear_message_at = 0;
  do
  :: unit_clear_message_at < 4 -> wire[at] = unit_clear_message_record.reserved_4[unit_clear_message_at]; at = at + 1; unit_clear_message_at = unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Unit Clear Message off the wire, 4 bytes from where the cursor stands */
inline decode_unit_clear_message(unit_clear_message_record) {
  unit_clear_message_at = 0;
  do
  :: unit_clear_message_at < 4 -> unit_clear_message_record.reserved_4[unit_clear_message_at] = wire[at]; at = at + 1; unit_clear_message_at = unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Unit Clear Message is what was written, byte for byte */
inline equal_unit_clear_message(unit_clear_message_read, unit_clear_message_written) {
  unit_clear_message_at = 0;
  do
  :: unit_clear_message_at < 4 -> assert(unit_clear_message_read.reserved_4[unit_clear_message_at] == unit_clear_message_written.reserved_4[unit_clear_message_at]); unit_clear_message_at = unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Status Message: 20 bytes ---------------------------------------- */

/* Indicates the current trading status of a security. A Trading Status message will be sent whenever trading status changes for a security. */
typedef TradingStatusMessage {
  byte timestamp[8];
  byte symbol[6];
  byte trading_status;
  byte market_id_code[4];
  byte reserved_1
};

int trading_status_message_at;

/* every byte of Trading Status Message set to one value */
inline fill_trading_status_message(trading_status_message_record, trading_status_message_value) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.timestamp[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> trading_status_message_record.symbol[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.trading_status = trading_status_message_value;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.market_id_code[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.reserved_1 = trading_status_message_value;
  skip
}

/* each byte of Trading Status Message set to where it lies, so a field read out of place says so */
inline ramp_trading_status_message(trading_status_message_record, trading_status_message_base) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.timestamp[trading_status_message_at] = (trading_status_message_base + 0 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> trading_status_message_record.symbol[trading_status_message_at] = (trading_status_message_base + 8 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.trading_status = (trading_status_message_base + 14 + 1) % 256;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.market_id_code[trading_status_message_at] = (trading_status_message_base + 15 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.reserved_1 = (trading_status_message_base + 19 + 1) % 256;
  skip
}

/* Trading Status Message to the wire, 20 bytes from where the cursor stands */
inline encode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> wire[at] = trading_status_message_record.timestamp[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> wire[at] = trading_status_message_record.symbol[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_status_message_record.trading_status; at = at + 1;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> wire[at] = trading_status_message_record.market_id_code[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_status_message_record.reserved_1; at = at + 1;
  skip
}

/* Trading Status Message off the wire, 20 bytes from where the cursor stands */
inline decode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.timestamp[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> trading_status_message_record.symbol[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.trading_status = wire[at]; at = at + 1;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.market_id_code[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Trading Status Message is what was written, byte for byte */
inline equal_trading_status_message(trading_status_message_read, trading_status_message_written) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> assert(trading_status_message_read.timestamp[trading_status_message_at] == trading_status_message_written.timestamp[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> assert(trading_status_message_read.symbol[trading_status_message_at] == trading_status_message_written.symbol[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  assert(trading_status_message_read.trading_status == trading_status_message_written.trading_status);
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> assert(trading_status_message_read.market_id_code[trading_status_message_at] == trading_status_message_written.market_id_code[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  assert(trading_status_message_read.reserved_1 == trading_status_message_written.reserved_1);
  skip
}

/* ---- Add Order Message: 40 bytes --------------------------------------------- */

/* Represents a newly accepted visible or undisclosed order on the CXA book. Includes a day-specific Order Id assigned by CXA to the order. */
typedef AddOrderMessage {
  byte timestamp[8];
  byte order_id[8];
  byte side_indicator;
  byte quantity[4];
  byte symbol[6];
  byte price[8];
  byte pid_[4];
  byte reserved_1
};

int add_order_message_at;

/* every byte of Add Order Message set to one value */
inline fill_add_order_message(add_order_message_record, add_order_message_value) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.timestamp[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_id[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.side_indicator = add_order_message_value;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.quantity[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> add_order_message_record.symbol[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.price[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.pid_[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.reserved_1 = add_order_message_value;
  skip
}

/* each byte of Add Order Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_message(add_order_message_record, add_order_message_base) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.timestamp[add_order_message_at] = (add_order_message_base + 0 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_id[add_order_message_at] = (add_order_message_base + 8 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.side_indicator = (add_order_message_base + 16 + 1) % 256;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.quantity[add_order_message_at] = (add_order_message_base + 17 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> add_order_message_record.symbol[add_order_message_at] = (add_order_message_base + 21 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.price[add_order_message_at] = (add_order_message_base + 27 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.pid_[add_order_message_at] = (add_order_message_base + 35 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.reserved_1 = (add_order_message_base + 39 + 1) % 256;
  skip
}

/* Add Order Message to the wire, 40 bytes from where the cursor stands */
inline encode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> wire[at] = add_order_message_record.timestamp[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> wire[at] = add_order_message_record.order_id[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_record.side_indicator; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.quantity[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> wire[at] = add_order_message_record.symbol[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> wire[at] = add_order_message_record.price[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.pid_[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_record.reserved_1; at = at + 1;
  skip
}

/* Add Order Message off the wire, 40 bytes from where the cursor stands */
inline decode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.timestamp[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_id[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.side_indicator = wire[at]; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.quantity[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> add_order_message_record.symbol[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.price[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.pid_[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Add Order Message is what was written, byte for byte */
inline equal_add_order_message(add_order_message_read, add_order_message_written) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> assert(add_order_message_read.timestamp[add_order_message_at] == add_order_message_written.timestamp[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> assert(add_order_message_read.order_id[add_order_message_at] == add_order_message_written.order_id[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  assert(add_order_message_read.side_indicator == add_order_message_written.side_indicator);
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.quantity[add_order_message_at] == add_order_message_written.quantity[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> assert(add_order_message_read.symbol[add_order_message_at] == add_order_message_written.symbol[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> assert(add_order_message_read.price[add_order_message_at] == add_order_message_written.price[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.pid_[add_order_message_at] == add_order_message_written.pid_[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  assert(add_order_message_read.reserved_1 == add_order_message_written.reserved_1);
  skip
}

/* ---- Order Executed Message: 41 bytes ---------------------------------------- */

/* Sent when a visible order on the CXA book is executed in whole or in part. The execution price equals the order price found in the original Add Order message or the order price in the latest Modify Order message referencing the Order Id. */
typedef OrderExecutedMessage {
  byte timestamp[8];
  byte order_id[8];
  byte executed_quantity[4];
  byte execution_id[8];
  byte contra_order_id[8];
  byte contra_pid[4];
  byte reserved_1
};

int order_executed_message_at;

/* every byte of Order Executed Message set to one value */
inline fill_order_executed_message(order_executed_message_record, order_executed_message_value) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.timestamp[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.execution_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.contra_order_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.contra_pid[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.reserved_1 = order_executed_message_value;
  skip
}

/* each byte of Order Executed Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_message(order_executed_message_record, order_executed_message_base) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.timestamp[order_executed_message_at] = (order_executed_message_base + 0 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = (order_executed_message_base + 8 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = (order_executed_message_base + 16 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.execution_id[order_executed_message_at] = (order_executed_message_base + 20 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.contra_order_id[order_executed_message_at] = (order_executed_message_base + 28 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.contra_pid[order_executed_message_at] = (order_executed_message_base + 36 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.reserved_1 = (order_executed_message_base + 40 + 1) % 256;
  skip
}

/* Order Executed Message to the wire, 41 bytes from where the cursor stands */
inline encode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.timestamp[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.order_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.executed_quantity[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.execution_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.contra_order_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.contra_pid[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_message_record.reserved_1; at = at + 1;
  skip
}

/* Order Executed Message off the wire, 41 bytes from where the cursor stands */
inline decode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.timestamp[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.execution_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.contra_order_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.contra_pid[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Executed Message is what was written, byte for byte */
inline equal_order_executed_message(order_executed_message_read, order_executed_message_written) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.timestamp[order_executed_message_at] == order_executed_message_written.timestamp[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.order_id[order_executed_message_at] == order_executed_message_written.order_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.executed_quantity[order_executed_message_at] == order_executed_message_written.executed_quantity[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.execution_id[order_executed_message_at] == order_executed_message_written.execution_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.contra_order_id[order_executed_message_at] == order_executed_message_written.contra_order_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.contra_pid[order_executed_message_at] == order_executed_message_written.contra_pid[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  assert(order_executed_message_read.reserved_1 == order_executed_message_written.reserved_1);
  skip
}

/* ---- Order Executed At Price Message: 50 bytes ------------------------------- */

/* Used to update lit orders that have fully or partially executed in an auction. There is one Order Executed at Price message per auction trade, which includes the order IDs of both resting orders matched in the trade. Each message is followed by either a Reduce Size message (if the contra order has partially executed) or a Delete Order message (if the contra order has fully executed). */
typedef OrderExecutedAtPriceMessage {
  byte timestamp[8];
  byte order_id[8];
  byte executed_quantity[4];
  byte execution_id[8];
  byte contra_order_id[8];
  byte contra_pid[4];
  byte execution_type;
  byte price[8];
  byte reserved_1
};

int order_executed_at_price_message_at;

/* every byte of Order Executed At Price Message set to one value */
inline fill_order_executed_at_price_message(order_executed_at_price_message_record, order_executed_at_price_message_value) {
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 8 -> order_executed_at_price_message_record.timestamp[order_executed_at_price_message_at] = order_executed_at_price_message_value; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 8 -> order_executed_at_price_message_record.order_id[order_executed_at_price_message_at] = order_executed_at_price_message_value; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 4 -> order_executed_at_price_message_record.executed_quantity[order_executed_at_price_message_at] = order_executed_at_price_message_value; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 8 -> order_executed_at_price_message_record.execution_id[order_executed_at_price_message_at] = order_executed_at_price_message_value; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 8 -> order_executed_at_price_message_record.contra_order_id[order_executed_at_price_message_at] = order_executed_at_price_message_value; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 4 -> order_executed_at_price_message_record.contra_pid[order_executed_at_price_message_at] = order_executed_at_price_message_value; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_record.execution_type = order_executed_at_price_message_value;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 8 -> order_executed_at_price_message_record.price[order_executed_at_price_message_at] = order_executed_at_price_message_value; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_record.reserved_1 = order_executed_at_price_message_value;
  skip
}

/* each byte of Order Executed At Price Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_at_price_message(order_executed_at_price_message_record, order_executed_at_price_message_base) {
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 8 -> order_executed_at_price_message_record.timestamp[order_executed_at_price_message_at] = (order_executed_at_price_message_base + 0 + order_executed_at_price_message_at + 1) % 256; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 8 -> order_executed_at_price_message_record.order_id[order_executed_at_price_message_at] = (order_executed_at_price_message_base + 8 + order_executed_at_price_message_at + 1) % 256; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 4 -> order_executed_at_price_message_record.executed_quantity[order_executed_at_price_message_at] = (order_executed_at_price_message_base + 16 + order_executed_at_price_message_at + 1) % 256; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 8 -> order_executed_at_price_message_record.execution_id[order_executed_at_price_message_at] = (order_executed_at_price_message_base + 20 + order_executed_at_price_message_at + 1) % 256; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 8 -> order_executed_at_price_message_record.contra_order_id[order_executed_at_price_message_at] = (order_executed_at_price_message_base + 28 + order_executed_at_price_message_at + 1) % 256; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 4 -> order_executed_at_price_message_record.contra_pid[order_executed_at_price_message_at] = (order_executed_at_price_message_base + 36 + order_executed_at_price_message_at + 1) % 256; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_record.execution_type = (order_executed_at_price_message_base + 40 + 1) % 256;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 8 -> order_executed_at_price_message_record.price[order_executed_at_price_message_at] = (order_executed_at_price_message_base + 41 + order_executed_at_price_message_at + 1) % 256; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_record.reserved_1 = (order_executed_at_price_message_base + 49 + 1) % 256;
  skip
}

/* Order Executed At Price Message to the wire, 50 bytes from where the cursor stands */
inline encode_order_executed_at_price_message(order_executed_at_price_message_record) {
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 8 -> wire[at] = order_executed_at_price_message_record.timestamp[order_executed_at_price_message_at]; at = at + 1; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 8 -> wire[at] = order_executed_at_price_message_record.order_id[order_executed_at_price_message_at]; at = at + 1; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 4 -> wire[at] = order_executed_at_price_message_record.executed_quantity[order_executed_at_price_message_at]; at = at + 1; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 8 -> wire[at] = order_executed_at_price_message_record.execution_id[order_executed_at_price_message_at]; at = at + 1; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 8 -> wire[at] = order_executed_at_price_message_record.contra_order_id[order_executed_at_price_message_at]; at = at + 1; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 4 -> wire[at] = order_executed_at_price_message_record.contra_pid[order_executed_at_price_message_at]; at = at + 1; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_at_price_message_record.execution_type; at = at + 1;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 8 -> wire[at] = order_executed_at_price_message_record.price[order_executed_at_price_message_at]; at = at + 1; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_at_price_message_record.reserved_1; at = at + 1;
  skip
}

/* Order Executed At Price Message off the wire, 50 bytes from where the cursor stands */
inline decode_order_executed_at_price_message(order_executed_at_price_message_record) {
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 8 -> order_executed_at_price_message_record.timestamp[order_executed_at_price_message_at] = wire[at]; at = at + 1; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 8 -> order_executed_at_price_message_record.order_id[order_executed_at_price_message_at] = wire[at]; at = at + 1; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 4 -> order_executed_at_price_message_record.executed_quantity[order_executed_at_price_message_at] = wire[at]; at = at + 1; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 8 -> order_executed_at_price_message_record.execution_id[order_executed_at_price_message_at] = wire[at]; at = at + 1; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 8 -> order_executed_at_price_message_record.contra_order_id[order_executed_at_price_message_at] = wire[at]; at = at + 1; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 4 -> order_executed_at_price_message_record.contra_pid[order_executed_at_price_message_at] = wire[at]; at = at + 1; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_record.execution_type = wire[at]; at = at + 1;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 8 -> order_executed_at_price_message_record.price[order_executed_at_price_message_at] = wire[at]; at = at + 1; order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Executed At Price Message is what was written, byte for byte */
inline equal_order_executed_at_price_message(order_executed_at_price_message_read, order_executed_at_price_message_written) {
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 8 -> assert(order_executed_at_price_message_read.timestamp[order_executed_at_price_message_at] == order_executed_at_price_message_written.timestamp[order_executed_at_price_message_at]); order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 8 -> assert(order_executed_at_price_message_read.order_id[order_executed_at_price_message_at] == order_executed_at_price_message_written.order_id[order_executed_at_price_message_at]); order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 4 -> assert(order_executed_at_price_message_read.executed_quantity[order_executed_at_price_message_at] == order_executed_at_price_message_written.executed_quantity[order_executed_at_price_message_at]); order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 8 -> assert(order_executed_at_price_message_read.execution_id[order_executed_at_price_message_at] == order_executed_at_price_message_written.execution_id[order_executed_at_price_message_at]); order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 8 -> assert(order_executed_at_price_message_read.contra_order_id[order_executed_at_price_message_at] == order_executed_at_price_message_written.contra_order_id[order_executed_at_price_message_at]); order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 4 -> assert(order_executed_at_price_message_read.contra_pid[order_executed_at_price_message_at] == order_executed_at_price_message_written.contra_pid[order_executed_at_price_message_at]); order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  assert(order_executed_at_price_message_read.execution_type == order_executed_at_price_message_written.execution_type);
  order_executed_at_price_message_at = 0;
  do
  :: order_executed_at_price_message_at < 8 -> assert(order_executed_at_price_message_read.price[order_executed_at_price_message_at] == order_executed_at_price_message_written.price[order_executed_at_price_message_at]); order_executed_at_price_message_at = order_executed_at_price_message_at + 1
  :: else -> break
  od;
  assert(order_executed_at_price_message_read.reserved_1 == order_executed_at_price_message_written.reserved_1);
  skip
}

/* ---- Reduce Size Message: 20 bytes ------------------------------------------- */

/* Sent when a visible order on the CXA book is partially reduced. */
typedef ReduceSizeMessage {
  byte timestamp[8];
  byte order_id[8];
  byte cancelled_quantity[4]
};

int reduce_size_message_at;

/* every byte of Reduce Size Message set to one value */
inline fill_reduce_size_message(reduce_size_message_record, reduce_size_message_value) {
  reduce_size_message_at = 0;
  do
  :: reduce_size_message_at < 8 -> reduce_size_message_record.timestamp[reduce_size_message_at] = reduce_size_message_value; reduce_size_message_at = reduce_size_message_at + 1
  :: else -> break
  od;
  reduce_size_message_at = 0;
  do
  :: reduce_size_message_at < 8 -> reduce_size_message_record.order_id[reduce_size_message_at] = reduce_size_message_value; reduce_size_message_at = reduce_size_message_at + 1
  :: else -> break
  od;
  reduce_size_message_at = 0;
  do
  :: reduce_size_message_at < 4 -> reduce_size_message_record.cancelled_quantity[reduce_size_message_at] = reduce_size_message_value; reduce_size_message_at = reduce_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reduce Size Message set to where it lies, so a field read out of place says so */
inline ramp_reduce_size_message(reduce_size_message_record, reduce_size_message_base) {
  reduce_size_message_at = 0;
  do
  :: reduce_size_message_at < 8 -> reduce_size_message_record.timestamp[reduce_size_message_at] = (reduce_size_message_base + 0 + reduce_size_message_at + 1) % 256; reduce_size_message_at = reduce_size_message_at + 1
  :: else -> break
  od;
  reduce_size_message_at = 0;
  do
  :: reduce_size_message_at < 8 -> reduce_size_message_record.order_id[reduce_size_message_at] = (reduce_size_message_base + 8 + reduce_size_message_at + 1) % 256; reduce_size_message_at = reduce_size_message_at + 1
  :: else -> break
  od;
  reduce_size_message_at = 0;
  do
  :: reduce_size_message_at < 4 -> reduce_size_message_record.cancelled_quantity[reduce_size_message_at] = (reduce_size_message_base + 16 + reduce_size_message_at + 1) % 256; reduce_size_message_at = reduce_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reduce Size Message to the wire, 20 bytes from where the cursor stands */
inline encode_reduce_size_message(reduce_size_message_record) {
  reduce_size_message_at = 0;
  do
  :: reduce_size_message_at < 8 -> wire[at] = reduce_size_message_record.timestamp[reduce_size_message_at]; at = at + 1; reduce_size_message_at = reduce_size_message_at + 1
  :: else -> break
  od;
  reduce_size_message_at = 0;
  do
  :: reduce_size_message_at < 8 -> wire[at] = reduce_size_message_record.order_id[reduce_size_message_at]; at = at + 1; reduce_size_message_at = reduce_size_message_at + 1
  :: else -> break
  od;
  reduce_size_message_at = 0;
  do
  :: reduce_size_message_at < 4 -> wire[at] = reduce_size_message_record.cancelled_quantity[reduce_size_message_at]; at = at + 1; reduce_size_message_at = reduce_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reduce Size Message off the wire, 20 bytes from where the cursor stands */
inline decode_reduce_size_message(reduce_size_message_record) {
  reduce_size_message_at = 0;
  do
  :: reduce_size_message_at < 8 -> reduce_size_message_record.timestamp[reduce_size_message_at] = wire[at]; at = at + 1; reduce_size_message_at = reduce_size_message_at + 1
  :: else -> break
  od;
  reduce_size_message_at = 0;
  do
  :: reduce_size_message_at < 8 -> reduce_size_message_record.order_id[reduce_size_message_at] = wire[at]; at = at + 1; reduce_size_message_at = reduce_size_message_at + 1
  :: else -> break
  od;
  reduce_size_message_at = 0;
  do
  :: reduce_size_message_at < 4 -> reduce_size_message_record.cancelled_quantity[reduce_size_message_at] = wire[at]; at = at + 1; reduce_size_message_at = reduce_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reduce Size Message is what was written, byte for byte */
inline equal_reduce_size_message(reduce_size_message_read, reduce_size_message_written) {
  reduce_size_message_at = 0;
  do
  :: reduce_size_message_at < 8 -> assert(reduce_size_message_read.timestamp[reduce_size_message_at] == reduce_size_message_written.timestamp[reduce_size_message_at]); reduce_size_message_at = reduce_size_message_at + 1
  :: else -> break
  od;
  reduce_size_message_at = 0;
  do
  :: reduce_size_message_at < 8 -> assert(reduce_size_message_read.order_id[reduce_size_message_at] == reduce_size_message_written.order_id[reduce_size_message_at]); reduce_size_message_at = reduce_size_message_at + 1
  :: else -> break
  od;
  reduce_size_message_at = 0;
  do
  :: reduce_size_message_at < 4 -> assert(reduce_size_message_read.cancelled_quantity[reduce_size_message_at] == reduce_size_message_written.cancelled_quantity[reduce_size_message_at]); reduce_size_message_at = reduce_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Order Message: 29 bytes ------------------------------------------ */

/* Sent whenever an open order is visibly modified. The Order Id refers to the Order Id of the original Add Order message. Modify Order messages that appear to be "no ops" (i.e., they do not appear to modify any relevant fields) will still lose priority. */
typedef ModifyOrderMessage {
  byte timestamp[8];
  byte order_id[8];
  byte quantity[4];
  byte price[8];
  byte reserved_1
};

int modify_order_message_at;

/* every byte of Modify Order Message set to one value */
inline fill_modify_order_message(modify_order_message_record, modify_order_message_value) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.timestamp[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
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
  :: modify_order_message_at < 8 -> modify_order_message_record.price[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.reserved_1 = modify_order_message_value;
  skip
}

/* each byte of Modify Order Message set to where it lies, so a field read out of place says so */
inline ramp_modify_order_message(modify_order_message_record, modify_order_message_base) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.timestamp[modify_order_message_at] = (modify_order_message_base + 0 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.order_id[modify_order_message_at] = (modify_order_message_base + 8 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.quantity[modify_order_message_at] = (modify_order_message_base + 16 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.price[modify_order_message_at] = (modify_order_message_base + 20 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.reserved_1 = (modify_order_message_base + 28 + 1) % 256;
  skip
}

/* Modify Order Message to the wire, 29 bytes from where the cursor stands */
inline encode_modify_order_message(modify_order_message_record) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> wire[at] = modify_order_message_record.timestamp[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
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
  :: modify_order_message_at < 8 -> wire[at] = modify_order_message_record.price[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_message_record.reserved_1; at = at + 1;
  skip
}

/* Modify Order Message off the wire, 29 bytes from where the cursor stands */
inline decode_modify_order_message(modify_order_message_record) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.timestamp[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
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
  :: modify_order_message_at < 8 -> modify_order_message_record.price[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Modify Order Message is what was written, byte for byte */
inline equal_modify_order_message(modify_order_message_read, modify_order_message_written) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> assert(modify_order_message_read.timestamp[modify_order_message_at] == modify_order_message_written.timestamp[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
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
  :: modify_order_message_at < 8 -> assert(modify_order_message_read.price[modify_order_message_at] == modify_order_message_written.price[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  assert(modify_order_message_read.reserved_1 == modify_order_message_written.reserved_1);
  skip
}

/* ---- Delete Order Message: 16 bytes ------------------------------------------ */

/* Sent whenever a booked order is cancelled or leaves the order book. The Order Id refers to the Order Id of the original Add Order message. */
typedef DeleteOrderMessage {
  byte timestamp[8];
  byte order_id[8]
};

int delete_order_message_at;

/* every byte of Delete Order Message set to one value */
inline fill_delete_order_message(delete_order_message_record, delete_order_message_value) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.timestamp[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Delete Order Message set to where it lies, so a field read out of place says so */
inline ramp_delete_order_message(delete_order_message_record, delete_order_message_base) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.timestamp[delete_order_message_at] = (delete_order_message_base + 0 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = (delete_order_message_base + 8 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Order Message to the wire, 16 bytes from where the cursor stands */
inline encode_delete_order_message(delete_order_message_record) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> wire[at] = delete_order_message_record.timestamp[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> wire[at] = delete_order_message_record.order_id[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Order Message off the wire, 16 bytes from where the cursor stands */
inline decode_delete_order_message(delete_order_message_record) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.timestamp[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Delete Order Message is what was written, byte for byte */
inline equal_delete_order_message(delete_order_message_read, delete_order_message_written) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> assert(delete_order_message_read.timestamp[delete_order_message_at] == delete_order_message_written.timestamp[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> assert(delete_order_message_read.order_id[delete_order_message_at] == delete_order_message_written.order_id[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Break Message: 16 bytes ------------------------------------------- */

/* Sent whenever an execution on CXA or off-exchange trade reported to CXA is cancelled. A trade correction is performed by sending a Trade Break message followed by a new Trade message with the corrected size and price. Applications that simply build a CXA book can ignore Trade Break messages. */
typedef TradeBreakMessage {
  byte timestamp[8];
  byte execution_id[8]
};

int trade_break_message_at;

/* every byte of Trade Break Message set to one value */
inline fill_trade_break_message(trade_break_message_record, trade_break_message_value) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.timestamp[trade_break_message_at] = trade_break_message_value; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.execution_id[trade_break_message_at] = trade_break_message_value; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Break Message set to where it lies, so a field read out of place says so */
inline ramp_trade_break_message(trade_break_message_record, trade_break_message_base) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.timestamp[trade_break_message_at] = (trade_break_message_base + 0 + trade_break_message_at + 1) % 256; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.execution_id[trade_break_message_at] = (trade_break_message_base + 8 + trade_break_message_at + 1) % 256; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Break Message to the wire, 16 bytes from where the cursor stands */
inline encode_trade_break_message(trade_break_message_record) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> wire[at] = trade_break_message_record.timestamp[trade_break_message_at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> wire[at] = trade_break_message_record.execution_id[trade_break_message_at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Break Message off the wire, 16 bytes from where the cursor stands */
inline decode_trade_break_message(trade_break_message_record) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.timestamp[trade_break_message_at] = wire[at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.execution_id[trade_break_message_at] = wire[at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Break Message is what was written, byte for byte */
inline equal_trade_break_message(trade_break_message_read, trade_break_message_written) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> assert(trade_break_message_read.timestamp[trade_break_message_at] == trade_break_message_written.timestamp[trade_break_message_at]); trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> assert(trade_break_message_read.execution_id[trade_break_message_at] == trade_break_message_written.execution_id[trade_break_message_at]); trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Calculated Value Message: 31 bytes -------------------------------------- */

/* Sent when CXA calculates market values for a specified symbol or when a calculated market value is reported to CXA. The specified symbol may not trade on CXA, but instead could represent index or iNAV values reported to CXA from third parties as indicated by the Value Category field. The index values will be reported on each of the unitised CXA PITCH feeds and are not specific to an individual unit. */
typedef CalculatedValueMessage {
  byte timestamp[8];
  byte symbol[6];
  byte value_category;
  byte value[8];
  byte value_timestamp[8]
};

int calculated_value_message_at;

/* every byte of Calculated Value Message set to one value */
inline fill_calculated_value_message(calculated_value_message_record, calculated_value_message_value) {
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> calculated_value_message_record.timestamp[calculated_value_message_at] = calculated_value_message_value; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 6 -> calculated_value_message_record.symbol[calculated_value_message_at] = calculated_value_message_value; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  calculated_value_message_record.value_category = calculated_value_message_value;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> calculated_value_message_record.value[calculated_value_message_at] = calculated_value_message_value; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> calculated_value_message_record.value_timestamp[calculated_value_message_at] = calculated_value_message_value; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Calculated Value Message set to where it lies, so a field read out of place says so */
inline ramp_calculated_value_message(calculated_value_message_record, calculated_value_message_base) {
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> calculated_value_message_record.timestamp[calculated_value_message_at] = (calculated_value_message_base + 0 + calculated_value_message_at + 1) % 256; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 6 -> calculated_value_message_record.symbol[calculated_value_message_at] = (calculated_value_message_base + 8 + calculated_value_message_at + 1) % 256; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  calculated_value_message_record.value_category = (calculated_value_message_base + 14 + 1) % 256;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> calculated_value_message_record.value[calculated_value_message_at] = (calculated_value_message_base + 15 + calculated_value_message_at + 1) % 256; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> calculated_value_message_record.value_timestamp[calculated_value_message_at] = (calculated_value_message_base + 23 + calculated_value_message_at + 1) % 256; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* Calculated Value Message to the wire, 31 bytes from where the cursor stands */
inline encode_calculated_value_message(calculated_value_message_record) {
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> wire[at] = calculated_value_message_record.timestamp[calculated_value_message_at]; at = at + 1; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 6 -> wire[at] = calculated_value_message_record.symbol[calculated_value_message_at]; at = at + 1; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  wire[at] = calculated_value_message_record.value_category; at = at + 1;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> wire[at] = calculated_value_message_record.value[calculated_value_message_at]; at = at + 1; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> wire[at] = calculated_value_message_record.value_timestamp[calculated_value_message_at]; at = at + 1; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* Calculated Value Message off the wire, 31 bytes from where the cursor stands */
inline decode_calculated_value_message(calculated_value_message_record) {
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> calculated_value_message_record.timestamp[calculated_value_message_at] = wire[at]; at = at + 1; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 6 -> calculated_value_message_record.symbol[calculated_value_message_at] = wire[at]; at = at + 1; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  calculated_value_message_record.value_category = wire[at]; at = at + 1;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> calculated_value_message_record.value[calculated_value_message_at] = wire[at]; at = at + 1; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> calculated_value_message_record.value_timestamp[calculated_value_message_at] = wire[at]; at = at + 1; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Calculated Value Message is what was written, byte for byte */
inline equal_calculated_value_message(calculated_value_message_read, calculated_value_message_written) {
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> assert(calculated_value_message_read.timestamp[calculated_value_message_at] == calculated_value_message_written.timestamp[calculated_value_message_at]); calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 6 -> assert(calculated_value_message_read.symbol[calculated_value_message_at] == calculated_value_message_written.symbol[calculated_value_message_at]); calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  assert(calculated_value_message_read.value_category == calculated_value_message_written.value_category);
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> assert(calculated_value_message_read.value[calculated_value_message_at] == calculated_value_message_written.value[calculated_value_message_at]); calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> assert(calculated_value_message_read.value_timestamp[calculated_value_message_at] == calculated_value_message_written.value_timestamp[calculated_value_message_at]); calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Session Message: 4 bytes ----------------------------------------- */

/* Sent for each unit when the unit shuts down. No additional sequenced messages will be delivered for this unit, but heartbeats from the unit may be received. */
typedef EndOfSessionMessage {
  byte reserved_4[4]
};

int end_of_session_message_at;

/* every byte of End Of Session Message set to one value */
inline fill_end_of_session_message(end_of_session_message_record, end_of_session_message_value) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> end_of_session_message_record.reserved_4[end_of_session_message_at] = end_of_session_message_value; end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Session Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_session_message(end_of_session_message_record, end_of_session_message_base) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> end_of_session_message_record.reserved_4[end_of_session_message_at] = (end_of_session_message_base + 0 + end_of_session_message_at + 1) % 256; end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Session Message to the wire, 4 bytes from where the cursor stands */
inline encode_end_of_session_message(end_of_session_message_record) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> wire[at] = end_of_session_message_record.reserved_4[end_of_session_message_at]; at = at + 1; end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Session Message off the wire, 4 bytes from where the cursor stands */
inline decode_end_of_session_message(end_of_session_message_record) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> end_of_session_message_record.reserved_4[end_of_session_message_at] = wire[at]; at = at + 1; end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Session Message is what was written, byte for byte */
inline equal_end_of_session_message(end_of_session_message_read, end_of_session_message_written) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> assert(end_of_session_message_read.reserved_4[end_of_session_message_at] == end_of_session_message_written.reserved_4[end_of_session_message_at]); end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Update Message: 32 bytes ---------------------------------------- */

/* Sent during Pre-Open and Pre-Close trading states when a symbol has an order update relating to an overlapping order book (where the best bid price is greater than or equal to the best ask price). Includes the potential number of shares and the indicative auction price if the symbol were to undergo an auction now. Only sent if there are updates to the Buy Shares, Sell Shares, or Indicative Price fields. */
typedef AuctionUpdateMessage {
  byte timestamp[8];
  byte symbol[6];
  byte auction_type;
  byte buy_shares[4];
  byte sell_shares[4];
  byte indicative_price[8];
  byte reserved_1
};

int auction_update_message_at;

/* every byte of Auction Update Message set to one value */
inline fill_auction_update_message(auction_update_message_record, auction_update_message_value) {
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> auction_update_message_record.timestamp[auction_update_message_at] = auction_update_message_value; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 6 -> auction_update_message_record.symbol[auction_update_message_at] = auction_update_message_value; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_record.auction_type = auction_update_message_value;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 4 -> auction_update_message_record.buy_shares[auction_update_message_at] = auction_update_message_value; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 4 -> auction_update_message_record.sell_shares[auction_update_message_at] = auction_update_message_value; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> auction_update_message_record.indicative_price[auction_update_message_at] = auction_update_message_value; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_record.reserved_1 = auction_update_message_value;
  skip
}

/* each byte of Auction Update Message set to where it lies, so a field read out of place says so */
inline ramp_auction_update_message(auction_update_message_record, auction_update_message_base) {
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> auction_update_message_record.timestamp[auction_update_message_at] = (auction_update_message_base + 0 + auction_update_message_at + 1) % 256; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 6 -> auction_update_message_record.symbol[auction_update_message_at] = (auction_update_message_base + 8 + auction_update_message_at + 1) % 256; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_record.auction_type = (auction_update_message_base + 14 + 1) % 256;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 4 -> auction_update_message_record.buy_shares[auction_update_message_at] = (auction_update_message_base + 15 + auction_update_message_at + 1) % 256; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 4 -> auction_update_message_record.sell_shares[auction_update_message_at] = (auction_update_message_base + 19 + auction_update_message_at + 1) % 256; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> auction_update_message_record.indicative_price[auction_update_message_at] = (auction_update_message_base + 23 + auction_update_message_at + 1) % 256; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_record.reserved_1 = (auction_update_message_base + 31 + 1) % 256;
  skip
}

/* Auction Update Message to the wire, 32 bytes from where the cursor stands */
inline encode_auction_update_message(auction_update_message_record) {
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> wire[at] = auction_update_message_record.timestamp[auction_update_message_at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 6 -> wire[at] = auction_update_message_record.symbol[auction_update_message_at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_update_message_record.auction_type; at = at + 1;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 4 -> wire[at] = auction_update_message_record.buy_shares[auction_update_message_at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 4 -> wire[at] = auction_update_message_record.sell_shares[auction_update_message_at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> wire[at] = auction_update_message_record.indicative_price[auction_update_message_at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_update_message_record.reserved_1; at = at + 1;
  skip
}

/* Auction Update Message off the wire, 32 bytes from where the cursor stands */
inline decode_auction_update_message(auction_update_message_record) {
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> auction_update_message_record.timestamp[auction_update_message_at] = wire[at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 6 -> auction_update_message_record.symbol[auction_update_message_at] = wire[at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_record.auction_type = wire[at]; at = at + 1;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 4 -> auction_update_message_record.buy_shares[auction_update_message_at] = wire[at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 4 -> auction_update_message_record.sell_shares[auction_update_message_at] = wire[at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> auction_update_message_record.indicative_price[auction_update_message_at] = wire[at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Auction Update Message is what was written, byte for byte */
inline equal_auction_update_message(auction_update_message_read, auction_update_message_written) {
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> assert(auction_update_message_read.timestamp[auction_update_message_at] == auction_update_message_written.timestamp[auction_update_message_at]); auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 6 -> assert(auction_update_message_read.symbol[auction_update_message_at] == auction_update_message_written.symbol[auction_update_message_at]); auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  assert(auction_update_message_read.auction_type == auction_update_message_written.auction_type);
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 4 -> assert(auction_update_message_read.buy_shares[auction_update_message_at] == auction_update_message_written.buy_shares[auction_update_message_at]); auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 4 -> assert(auction_update_message_read.sell_shares[auction_update_message_at] == auction_update_message_written.sell_shares[auction_update_message_at]); auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> assert(auction_update_message_read.indicative_price[auction_update_message_at] == auction_update_message_written.indicative_price[auction_update_message_at]); auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  assert(auction_update_message_read.reserved_1 == auction_update_message_written.reserved_1);
  skip
}

/* ---- Auction Summary Message: 28 bytes --------------------------------------- */

/* Sent at the completion of the Auction per symbol and includes the Auction Price and Shares executed. If there is no overlapping order book at the time of the auction, no auction trades will result, but the Auction Summary message will still be disseminated and contain zeroes in the Price and Shares fields. */
typedef AuctionSummaryMessage {
  byte timestamp[8];
  byte symbol[6];
  byte auction_type;
  byte price[8];
  byte shares[4];
  byte reserved_1
};

int auction_summary_message_at;

/* every byte of Auction Summary Message set to one value */
inline fill_auction_summary_message(auction_summary_message_record, auction_summary_message_value) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.timestamp[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 6 -> auction_summary_message_record.symbol[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.auction_type = auction_summary_message_value;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.price[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.shares[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.reserved_1 = auction_summary_message_value;
  skip
}

/* each byte of Auction Summary Message set to where it lies, so a field read out of place says so */
inline ramp_auction_summary_message(auction_summary_message_record, auction_summary_message_base) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.timestamp[auction_summary_message_at] = (auction_summary_message_base + 0 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 6 -> auction_summary_message_record.symbol[auction_summary_message_at] = (auction_summary_message_base + 8 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.auction_type = (auction_summary_message_base + 14 + 1) % 256;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.price[auction_summary_message_at] = (auction_summary_message_base + 15 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.shares[auction_summary_message_at] = (auction_summary_message_base + 23 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.reserved_1 = (auction_summary_message_base + 27 + 1) % 256;
  skip
}

/* Auction Summary Message to the wire, 28 bytes from where the cursor stands */
inline encode_auction_summary_message(auction_summary_message_record) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> wire[at] = auction_summary_message_record.timestamp[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 6 -> wire[at] = auction_summary_message_record.symbol[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_summary_message_record.auction_type; at = at + 1;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> wire[at] = auction_summary_message_record.price[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> wire[at] = auction_summary_message_record.shares[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_summary_message_record.reserved_1; at = at + 1;
  skip
}

/* Auction Summary Message off the wire, 28 bytes from where the cursor stands */
inline decode_auction_summary_message(auction_summary_message_record) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.timestamp[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 6 -> auction_summary_message_record.symbol[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.auction_type = wire[at]; at = at + 1;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.price[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.shares[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Auction Summary Message is what was written, byte for byte */
inline equal_auction_summary_message(auction_summary_message_read, auction_summary_message_written) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> assert(auction_summary_message_read.timestamp[auction_summary_message_at] == auction_summary_message_written.timestamp[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 6 -> assert(auction_summary_message_read.symbol[auction_summary_message_at] == auction_summary_message_written.symbol[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  assert(auction_summary_message_read.auction_type == auction_summary_message_written.auction_type);
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> assert(auction_summary_message_read.price[auction_summary_message_at] == auction_summary_message_written.price[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> assert(auction_summary_message_read.shares[auction_summary_message_at] == auction_summary_message_written.shares[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  assert(auction_summary_message_read.reserved_1 == auction_summary_message_written.reserved_1);
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
    assert(at == 8);
    at = 0;
    decode_packet_header(packet_header_got);
    assert(at == 8);
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
    assert(at == 2);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 2);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Unit Clear Message: encoded, read back, and compared */
proctype check_unit_clear_message() {
  UnitClearMessage unit_clear_message_sent;
  UnitClearMessage unit_clear_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_unit_clear_message(unit_clear_message_sent, 0)
  :: pattern == 1 -> fill_unit_clear_message(unit_clear_message_sent, 32)
  :: pattern == 2 -> fill_unit_clear_message(unit_clear_message_sent, 255)
  :: else -> ramp_unit_clear_message(unit_clear_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_unit_clear_message(unit_clear_message_sent);
    assert(at == 4);
    at = 0;
    decode_unit_clear_message(unit_clear_message_got);
    assert(at == 4);
    equal_unit_clear_message(unit_clear_message_got, unit_clear_message_sent)
  }
}

/* Trading Status Message: encoded, read back, and compared */
proctype check_trading_status_message() {
  TradingStatusMessage trading_status_message_sent;
  TradingStatusMessage trading_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_status_message(trading_status_message_sent, 0)
  :: pattern == 1 -> fill_trading_status_message(trading_status_message_sent, 32)
  :: pattern == 2 -> fill_trading_status_message(trading_status_message_sent, 255)
  :: else -> ramp_trading_status_message(trading_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_status_message(trading_status_message_sent);
    assert(at == 20);
    at = 0;
    decode_trading_status_message(trading_status_message_got);
    assert(at == 20);
    equal_trading_status_message(trading_status_message_got, trading_status_message_sent)
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
    assert(at == 40);
    at = 0;
    decode_add_order_message(add_order_message_got);
    assert(at == 40);
    equal_add_order_message(add_order_message_got, add_order_message_sent)
  }
}

/* Order Executed Message: encoded, read back, and compared */
proctype check_order_executed_message() {
  OrderExecutedMessage order_executed_message_sent;
  OrderExecutedMessage order_executed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_executed_message(order_executed_message_sent, 0)
  :: pattern == 1 -> fill_order_executed_message(order_executed_message_sent, 32)
  :: pattern == 2 -> fill_order_executed_message(order_executed_message_sent, 255)
  :: else -> ramp_order_executed_message(order_executed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_executed_message(order_executed_message_sent);
    assert(at == 41);
    at = 0;
    decode_order_executed_message(order_executed_message_got);
    assert(at == 41);
    equal_order_executed_message(order_executed_message_got, order_executed_message_sent)
  }
}

/* Order Executed At Price Message: encoded, read back, and compared */
proctype check_order_executed_at_price_message() {
  OrderExecutedAtPriceMessage order_executed_at_price_message_sent;
  OrderExecutedAtPriceMessage order_executed_at_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_executed_at_price_message(order_executed_at_price_message_sent, 0)
  :: pattern == 1 -> fill_order_executed_at_price_message(order_executed_at_price_message_sent, 32)
  :: pattern == 2 -> fill_order_executed_at_price_message(order_executed_at_price_message_sent, 255)
  :: else -> ramp_order_executed_at_price_message(order_executed_at_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_executed_at_price_message(order_executed_at_price_message_sent);
    assert(at == 50);
    at = 0;
    decode_order_executed_at_price_message(order_executed_at_price_message_got);
    assert(at == 50);
    equal_order_executed_at_price_message(order_executed_at_price_message_got, order_executed_at_price_message_sent)
  }
}

/* Reduce Size Message: encoded, read back, and compared */
proctype check_reduce_size_message() {
  ReduceSizeMessage reduce_size_message_sent;
  ReduceSizeMessage reduce_size_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reduce_size_message(reduce_size_message_sent, 0)
  :: pattern == 1 -> fill_reduce_size_message(reduce_size_message_sent, 32)
  :: pattern == 2 -> fill_reduce_size_message(reduce_size_message_sent, 255)
  :: else -> ramp_reduce_size_message(reduce_size_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reduce_size_message(reduce_size_message_sent);
    assert(at == 20);
    at = 0;
    decode_reduce_size_message(reduce_size_message_got);
    assert(at == 20);
    equal_reduce_size_message(reduce_size_message_got, reduce_size_message_sent)
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
    assert(at == 29);
    at = 0;
    decode_modify_order_message(modify_order_message_got);
    assert(at == 29);
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
    assert(at == 16);
    at = 0;
    decode_delete_order_message(delete_order_message_got);
    assert(at == 16);
    equal_delete_order_message(delete_order_message_got, delete_order_message_sent)
  }
}

/* Trade Break Message: encoded, read back, and compared */
proctype check_trade_break_message() {
  TradeBreakMessage trade_break_message_sent;
  TradeBreakMessage trade_break_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_break_message(trade_break_message_sent, 0)
  :: pattern == 1 -> fill_trade_break_message(trade_break_message_sent, 32)
  :: pattern == 2 -> fill_trade_break_message(trade_break_message_sent, 255)
  :: else -> ramp_trade_break_message(trade_break_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_break_message(trade_break_message_sent);
    assert(at == 16);
    at = 0;
    decode_trade_break_message(trade_break_message_got);
    assert(at == 16);
    equal_trade_break_message(trade_break_message_got, trade_break_message_sent)
  }
}

/* Calculated Value Message: encoded, read back, and compared */
proctype check_calculated_value_message() {
  CalculatedValueMessage calculated_value_message_sent;
  CalculatedValueMessage calculated_value_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_calculated_value_message(calculated_value_message_sent, 0)
  :: pattern == 1 -> fill_calculated_value_message(calculated_value_message_sent, 32)
  :: pattern == 2 -> fill_calculated_value_message(calculated_value_message_sent, 255)
  :: else -> ramp_calculated_value_message(calculated_value_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_calculated_value_message(calculated_value_message_sent);
    assert(at == 31);
    at = 0;
    decode_calculated_value_message(calculated_value_message_got);
    assert(at == 31);
    equal_calculated_value_message(calculated_value_message_got, calculated_value_message_sent)
  }
}

/* End Of Session Message: encoded, read back, and compared */
proctype check_end_of_session_message() {
  EndOfSessionMessage end_of_session_message_sent;
  EndOfSessionMessage end_of_session_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_session_message(end_of_session_message_sent, 0)
  :: pattern == 1 -> fill_end_of_session_message(end_of_session_message_sent, 32)
  :: pattern == 2 -> fill_end_of_session_message(end_of_session_message_sent, 255)
  :: else -> ramp_end_of_session_message(end_of_session_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_session_message(end_of_session_message_sent);
    assert(at == 4);
    at = 0;
    decode_end_of_session_message(end_of_session_message_got);
    assert(at == 4);
    equal_end_of_session_message(end_of_session_message_got, end_of_session_message_sent)
  }
}

/* Auction Update Message: encoded, read back, and compared */
proctype check_auction_update_message() {
  AuctionUpdateMessage auction_update_message_sent;
  AuctionUpdateMessage auction_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_update_message(auction_update_message_sent, 0)
  :: pattern == 1 -> fill_auction_update_message(auction_update_message_sent, 32)
  :: pattern == 2 -> fill_auction_update_message(auction_update_message_sent, 255)
  :: else -> ramp_auction_update_message(auction_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_update_message(auction_update_message_sent);
    assert(at == 32);
    at = 0;
    decode_auction_update_message(auction_update_message_got);
    assert(at == 32);
    equal_auction_update_message(auction_update_message_got, auction_update_message_sent)
  }
}

/* Auction Summary Message: encoded, read back, and compared */
proctype check_auction_summary_message() {
  AuctionSummaryMessage auction_summary_message_sent;
  AuctionSummaryMessage auction_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_summary_message(auction_summary_message_sent, 0)
  :: pattern == 1 -> fill_auction_summary_message(auction_summary_message_sent, 32)
  :: pattern == 2 -> fill_auction_summary_message(auction_summary_message_sent, 255)
  :: else -> ramp_auction_summary_message(auction_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_summary_message(auction_summary_message_sent);
    assert(at == 28);
    at = 0;
    decode_auction_summary_message(auction_summary_message_got);
    assert(at == 28);
    equal_auction_summary_message(auction_summary_message_got, auction_summary_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_unit_clear_message()
  :: run check_trading_status_message()
  :: run check_add_order_message()
  :: run check_order_executed_message()
  :: run check_order_executed_at_price_message()
  :: run check_reduce_size_message()
  :: run check_modify_order_message()
  :: run check_delete_order_message()
  :: run check_trade_break_message()
  :: run check_calculated_value_message()
  :: run check_end_of_session_message()
  :: run check_auction_update_message()
  :: run check_auction_summary_message()
  fi
}
