/*
 * Chicago Board Options Exchange Multicast Top Of Book
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
#define WIRE 40

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

/* Instructs feed recipients to clear all data for the CXA book in the unit specified in the Sequenced Unit Header. Distributed in rare recovery events such as a datacentre fail-over. */
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

/* ---- Single Side Update Message: 28 bytes ------------------------------------ */

/* Provides an updated price and size for a single side of a Symbol. The side is denoted by the Side field. One Single Side Update message may reflect one or more updates to the inside book that were processed at the same time but will only be done so in a way that can be arbitrated between A/B feeds. */
typedef SingleSideUpdateMessage {
  byte timestamp[8];
  byte symbol[6];
  byte side;
  byte price[8];
  byte quantity[4];
  byte reserved_1
};

int single_side_update_message_at;

/* every byte of Single Side Update Message set to one value */
inline fill_single_side_update_message(single_side_update_message_record, single_side_update_message_value) {
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> single_side_update_message_record.timestamp[single_side_update_message_at] = single_side_update_message_value; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 6 -> single_side_update_message_record.symbol[single_side_update_message_at] = single_side_update_message_value; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_record.side = single_side_update_message_value;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> single_side_update_message_record.price[single_side_update_message_at] = single_side_update_message_value; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.quantity[single_side_update_message_at] = single_side_update_message_value; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_record.reserved_1 = single_side_update_message_value;
  skip
}

/* each byte of Single Side Update Message set to where it lies, so a field read out of place says so */
inline ramp_single_side_update_message(single_side_update_message_record, single_side_update_message_base) {
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> single_side_update_message_record.timestamp[single_side_update_message_at] = (single_side_update_message_base + 0 + single_side_update_message_at + 1) % 256; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 6 -> single_side_update_message_record.symbol[single_side_update_message_at] = (single_side_update_message_base + 8 + single_side_update_message_at + 1) % 256; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_record.side = (single_side_update_message_base + 14 + 1) % 256;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> single_side_update_message_record.price[single_side_update_message_at] = (single_side_update_message_base + 15 + single_side_update_message_at + 1) % 256; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.quantity[single_side_update_message_at] = (single_side_update_message_base + 23 + single_side_update_message_at + 1) % 256; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_record.reserved_1 = (single_side_update_message_base + 27 + 1) % 256;
  skip
}

/* Single Side Update Message to the wire, 28 bytes from where the cursor stands */
inline encode_single_side_update_message(single_side_update_message_record) {
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> wire[at] = single_side_update_message_record.timestamp[single_side_update_message_at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 6 -> wire[at] = single_side_update_message_record.symbol[single_side_update_message_at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  wire[at] = single_side_update_message_record.side; at = at + 1;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> wire[at] = single_side_update_message_record.price[single_side_update_message_at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> wire[at] = single_side_update_message_record.quantity[single_side_update_message_at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  wire[at] = single_side_update_message_record.reserved_1; at = at + 1;
  skip
}

/* Single Side Update Message off the wire, 28 bytes from where the cursor stands */
inline decode_single_side_update_message(single_side_update_message_record) {
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> single_side_update_message_record.timestamp[single_side_update_message_at] = wire[at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 6 -> single_side_update_message_record.symbol[single_side_update_message_at] = wire[at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_record.side = wire[at]; at = at + 1;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> single_side_update_message_record.price[single_side_update_message_at] = wire[at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.quantity[single_side_update_message_at] = wire[at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Single Side Update Message is what was written, byte for byte */
inline equal_single_side_update_message(single_side_update_message_read, single_side_update_message_written) {
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> assert(single_side_update_message_read.timestamp[single_side_update_message_at] == single_side_update_message_written.timestamp[single_side_update_message_at]); single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 6 -> assert(single_side_update_message_read.symbol[single_side_update_message_at] == single_side_update_message_written.symbol[single_side_update_message_at]); single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  assert(single_side_update_message_read.side == single_side_update_message_written.side);
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> assert(single_side_update_message_read.price[single_side_update_message_at] == single_side_update_message_written.price[single_side_update_message_at]); single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> assert(single_side_update_message_read.quantity[single_side_update_message_at] == single_side_update_message_written.quantity[single_side_update_message_at]); single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  assert(single_side_update_message_read.reserved_1 == single_side_update_message_written.reserved_1);
  skip
}

/* ---- Two Side Update Message: 40 bytes --------------------------------------- */

/* Provides an updated price and size for both sides of a Symbol. One Two Side Update message may reflect one or more updates to the inside book that were processed at the same time but will only be done so in a way that can be arbitrated between A/B feeds. */
typedef TwoSideUpdateMessage {
  byte timestamp[8];
  byte symbol[6];
  byte bid_price[8];
  byte bid_quantity[4];
  byte reserved_1;
  byte ask_price[8];
  byte ask_quantity[4];
  byte second_reserved_1
};

int two_side_update_message_at;

/* every byte of Two Side Update Message set to one value */
inline fill_two_side_update_message(two_side_update_message_record, two_side_update_message_value) {
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> two_side_update_message_record.timestamp[two_side_update_message_at] = two_side_update_message_value; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 6 -> two_side_update_message_record.symbol[two_side_update_message_at] = two_side_update_message_value; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> two_side_update_message_record.bid_price[two_side_update_message_at] = two_side_update_message_value; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 4 -> two_side_update_message_record.bid_quantity[two_side_update_message_at] = two_side_update_message_value; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_record.reserved_1 = two_side_update_message_value;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> two_side_update_message_record.ask_price[two_side_update_message_at] = two_side_update_message_value; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 4 -> two_side_update_message_record.ask_quantity[two_side_update_message_at] = two_side_update_message_value; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_record.second_reserved_1 = two_side_update_message_value;
  skip
}

/* each byte of Two Side Update Message set to where it lies, so a field read out of place says so */
inline ramp_two_side_update_message(two_side_update_message_record, two_side_update_message_base) {
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> two_side_update_message_record.timestamp[two_side_update_message_at] = (two_side_update_message_base + 0 + two_side_update_message_at + 1) % 256; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 6 -> two_side_update_message_record.symbol[two_side_update_message_at] = (two_side_update_message_base + 8 + two_side_update_message_at + 1) % 256; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> two_side_update_message_record.bid_price[two_side_update_message_at] = (two_side_update_message_base + 14 + two_side_update_message_at + 1) % 256; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 4 -> two_side_update_message_record.bid_quantity[two_side_update_message_at] = (two_side_update_message_base + 22 + two_side_update_message_at + 1) % 256; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_record.reserved_1 = (two_side_update_message_base + 26 + 1) % 256;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> two_side_update_message_record.ask_price[two_side_update_message_at] = (two_side_update_message_base + 27 + two_side_update_message_at + 1) % 256; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 4 -> two_side_update_message_record.ask_quantity[two_side_update_message_at] = (two_side_update_message_base + 35 + two_side_update_message_at + 1) % 256; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_record.second_reserved_1 = (two_side_update_message_base + 39 + 1) % 256;
  skip
}

/* Two Side Update Message to the wire, 40 bytes from where the cursor stands */
inline encode_two_side_update_message(two_side_update_message_record) {
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> wire[at] = two_side_update_message_record.timestamp[two_side_update_message_at]; at = at + 1; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 6 -> wire[at] = two_side_update_message_record.symbol[two_side_update_message_at]; at = at + 1; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> wire[at] = two_side_update_message_record.bid_price[two_side_update_message_at]; at = at + 1; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 4 -> wire[at] = two_side_update_message_record.bid_quantity[two_side_update_message_at]; at = at + 1; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  wire[at] = two_side_update_message_record.reserved_1; at = at + 1;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> wire[at] = two_side_update_message_record.ask_price[two_side_update_message_at]; at = at + 1; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 4 -> wire[at] = two_side_update_message_record.ask_quantity[two_side_update_message_at]; at = at + 1; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  wire[at] = two_side_update_message_record.second_reserved_1; at = at + 1;
  skip
}

/* Two Side Update Message off the wire, 40 bytes from where the cursor stands */
inline decode_two_side_update_message(two_side_update_message_record) {
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> two_side_update_message_record.timestamp[two_side_update_message_at] = wire[at]; at = at + 1; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 6 -> two_side_update_message_record.symbol[two_side_update_message_at] = wire[at]; at = at + 1; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> two_side_update_message_record.bid_price[two_side_update_message_at] = wire[at]; at = at + 1; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 4 -> two_side_update_message_record.bid_quantity[two_side_update_message_at] = wire[at]; at = at + 1; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_record.reserved_1 = wire[at]; at = at + 1;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> two_side_update_message_record.ask_price[two_side_update_message_at] = wire[at]; at = at + 1; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 4 -> two_side_update_message_record.ask_quantity[two_side_update_message_at] = wire[at]; at = at + 1; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_record.second_reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Two Side Update Message is what was written, byte for byte */
inline equal_two_side_update_message(two_side_update_message_read, two_side_update_message_written) {
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> assert(two_side_update_message_read.timestamp[two_side_update_message_at] == two_side_update_message_written.timestamp[two_side_update_message_at]); two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 6 -> assert(two_side_update_message_read.symbol[two_side_update_message_at] == two_side_update_message_written.symbol[two_side_update_message_at]); two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> assert(two_side_update_message_read.bid_price[two_side_update_message_at] == two_side_update_message_written.bid_price[two_side_update_message_at]); two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 4 -> assert(two_side_update_message_read.bid_quantity[two_side_update_message_at] == two_side_update_message_written.bid_quantity[two_side_update_message_at]); two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  assert(two_side_update_message_read.reserved_1 == two_side_update_message_written.reserved_1);
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> assert(two_side_update_message_read.ask_price[two_side_update_message_at] == two_side_update_message_written.ask_price[two_side_update_message_at]); two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 4 -> assert(two_side_update_message_read.ask_quantity[two_side_update_message_at] == two_side_update_message_written.ask_quantity[two_side_update_message_at]); two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  assert(two_side_update_message_read.second_reserved_1 == two_side_update_message_written.second_reserved_1);
  skip
}

/* ---- Calculated Value Message: 31 bytes -------------------------------------- */

/* Sent when CXA calculates market values for a specified symbol or when a calculated market value is reported to CXA. The specified symbol may not trade on CXA, but instead could represent index or iNAV values reported to CXA from third parties as indicated by the Value Category field. The index values will be reported on each of the unitised CXA TOP feeds and are not specific to an individual unit. Calculated Value messages will be included in a spin response. */
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

/* Sent for each unit when the unit shuts down. No more sequenced messages will be delivered for this unit, but heartbeats from the unit may be received. */
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

/* Sent during Pre-Open and Pre-Close trading states when a symbol has an order update which relates to an overlapping order book (where the best bid price is greater than or equal to the best ask price). Includes the potential number of shares and the indicative auction price if the symbol were to undergo an auction now. Only sent if there are updates to the Buy Shares, Sell Shares, or Indicative Price fields. */
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

/* Sent at the completion of the Auction per symbol and includes the Auction Price and Shares traded. If there is no overlapping order book at the time of the auction, no auction trades will result, however the Auction Summary message will still be disseminated and contain zeroes in the Price and Shares fields. */
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

/* Single Side Update Message: encoded, read back, and compared */
proctype check_single_side_update_message() {
  SingleSideUpdateMessage single_side_update_message_sent;
  SingleSideUpdateMessage single_side_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_side_update_message(single_side_update_message_sent, 0)
  :: pattern == 1 -> fill_single_side_update_message(single_side_update_message_sent, 32)
  :: pattern == 2 -> fill_single_side_update_message(single_side_update_message_sent, 255)
  :: else -> ramp_single_side_update_message(single_side_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_side_update_message(single_side_update_message_sent);
    assert(at == 28);
    at = 0;
    decode_single_side_update_message(single_side_update_message_got);
    assert(at == 28);
    equal_single_side_update_message(single_side_update_message_got, single_side_update_message_sent)
  }
}

/* Two Side Update Message: encoded, read back, and compared */
proctype check_two_side_update_message() {
  TwoSideUpdateMessage two_side_update_message_sent;
  TwoSideUpdateMessage two_side_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_two_side_update_message(two_side_update_message_sent, 0)
  :: pattern == 1 -> fill_two_side_update_message(two_side_update_message_sent, 32)
  :: pattern == 2 -> fill_two_side_update_message(two_side_update_message_sent, 255)
  :: else -> ramp_two_side_update_message(two_side_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_two_side_update_message(two_side_update_message_sent);
    assert(at == 40);
    at = 0;
    decode_two_side_update_message(two_side_update_message_got);
    assert(at == 40);
    equal_two_side_update_message(two_side_update_message_got, two_side_update_message_sent)
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
  :: run check_single_side_update_message()
  :: run check_two_side_update_message()
  :: run check_calculated_value_message()
  :: run check_end_of_session_message()
  :: run check_auction_update_message()
  :: run check_auction_summary_message()
  fi
}
