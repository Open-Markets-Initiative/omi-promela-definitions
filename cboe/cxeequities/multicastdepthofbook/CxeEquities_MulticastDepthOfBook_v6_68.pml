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
#define WIRE 70

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

/* ---- Time Message: 4 bytes --------------------------------------------------- */

/* A Time message is immediately generated and sent when there is a PITCH event for a given clock second */
typedef TimeMessage {
  byte time[4]
};

int time_message_at;

/* every byte of Time Message set to one value */
inline fill_time_message(time_message_record, time_message_value) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.time[time_message_at] = time_message_value; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Time Message set to where it lies, so a field read out of place says so */
inline ramp_time_message(time_message_record, time_message_base) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.time[time_message_at] = (time_message_base + 0 + time_message_at + 1) % 256; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Message to the wire, 4 bytes from where the cursor stands */
inline encode_time_message(time_message_record) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> wire[at] = time_message_record.time[time_message_at]; at = at + 1; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Message off the wire, 4 bytes from where the cursor stands */
inline decode_time_message(time_message_record) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.time[time_message_at] = wire[at]; at = at + 1; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Time Message is what was written, byte for byte */
inline equal_time_message(time_message_read, time_message_written) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> assert(time_message_read.time[time_message_at] == time_message_written.time[time_message_at]); time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Unit Clear Message: 4 bytes --------------------------------------------- */

/* The Unit Clear message instructs feed recipients to clear all orders for the Cboe book in the unit specified in the Sequenced Unit Header */
typedef UnitClearMessage {
  byte time_offset[4]
};

int unit_clear_message_at;

/* every byte of Unit Clear Message set to one value */
inline fill_unit_clear_message(unit_clear_message_record, unit_clear_message_value) {
  unit_clear_message_at = 0;
  do
  :: unit_clear_message_at < 4 -> unit_clear_message_record.time_offset[unit_clear_message_at] = unit_clear_message_value; unit_clear_message_at = unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Unit Clear Message set to where it lies, so a field read out of place says so */
inline ramp_unit_clear_message(unit_clear_message_record, unit_clear_message_base) {
  unit_clear_message_at = 0;
  do
  :: unit_clear_message_at < 4 -> unit_clear_message_record.time_offset[unit_clear_message_at] = (unit_clear_message_base + 0 + unit_clear_message_at + 1) % 256; unit_clear_message_at = unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Unit Clear Message to the wire, 4 bytes from where the cursor stands */
inline encode_unit_clear_message(unit_clear_message_record) {
  unit_clear_message_at = 0;
  do
  :: unit_clear_message_at < 4 -> wire[at] = unit_clear_message_record.time_offset[unit_clear_message_at]; at = at + 1; unit_clear_message_at = unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Unit Clear Message off the wire, 4 bytes from where the cursor stands */
inline decode_unit_clear_message(unit_clear_message_record) {
  unit_clear_message_at = 0;
  do
  :: unit_clear_message_at < 4 -> unit_clear_message_record.time_offset[unit_clear_message_at] = wire[at]; at = at + 1; unit_clear_message_at = unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Unit Clear Message is what was written, byte for byte */
inline equal_unit_clear_message(unit_clear_message_read, unit_clear_message_written) {
  unit_clear_message_at = 0;
  do
  :: unit_clear_message_at < 4 -> assert(unit_clear_message_read.time_offset[unit_clear_message_at] == unit_clear_message_written.time_offset[unit_clear_message_at]); unit_clear_message_at = unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order Long Message: 31 bytes ---------------------------------------- */

/* An Add Order message represents a newly accepted visible order on the Cboe book */
typedef AddOrderLongMessage {
  byte time_offset[4];
  byte order_id[8];
  byte side_indicator;
  byte quantity[4];
  byte symbol_short[6];
  byte price_long[8]
};

int add_order_long_message_at;

/* every byte of Add Order Long Message set to one value */
inline fill_add_order_long_message(add_order_long_message_record, add_order_long_message_value) {
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.time_offset[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> add_order_long_message_record.order_id[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_record.side_indicator = add_order_long_message_value;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.quantity[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 6 -> add_order_long_message_record.symbol_short[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> add_order_long_message_record.price_long[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Long Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_long_message(add_order_long_message_record, add_order_long_message_base) {
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.time_offset[add_order_long_message_at] = (add_order_long_message_base + 0 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> add_order_long_message_record.order_id[add_order_long_message_at] = (add_order_long_message_base + 4 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_record.side_indicator = (add_order_long_message_base + 12 + 1) % 256;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.quantity[add_order_long_message_at] = (add_order_long_message_base + 13 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 6 -> add_order_long_message_record.symbol_short[add_order_long_message_at] = (add_order_long_message_base + 17 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> add_order_long_message_record.price_long[add_order_long_message_at] = (add_order_long_message_base + 23 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Long Message to the wire, 31 bytes from where the cursor stands */
inline encode_add_order_long_message(add_order_long_message_record) {
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> wire[at] = add_order_long_message_record.time_offset[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> wire[at] = add_order_long_message_record.order_id[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_long_message_record.side_indicator; at = at + 1;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> wire[at] = add_order_long_message_record.quantity[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 6 -> wire[at] = add_order_long_message_record.symbol_short[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> wire[at] = add_order_long_message_record.price_long[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Long Message off the wire, 31 bytes from where the cursor stands */
inline decode_add_order_long_message(add_order_long_message_record) {
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.time_offset[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> add_order_long_message_record.order_id[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_record.side_indicator = wire[at]; at = at + 1;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.quantity[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 6 -> add_order_long_message_record.symbol_short[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> add_order_long_message_record.price_long[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Long Message is what was written, byte for byte */
inline equal_add_order_long_message(add_order_long_message_read, add_order_long_message_written) {
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> assert(add_order_long_message_read.time_offset[add_order_long_message_at] == add_order_long_message_written.time_offset[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> assert(add_order_long_message_read.order_id[add_order_long_message_at] == add_order_long_message_written.order_id[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  assert(add_order_long_message_read.side_indicator == add_order_long_message_written.side_indicator);
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> assert(add_order_long_message_read.quantity[add_order_long_message_at] == add_order_long_message_written.quantity[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 6 -> assert(add_order_long_message_read.symbol_short[add_order_long_message_at] == add_order_long_message_written.symbol_short[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> assert(add_order_long_message_read.price_long[add_order_long_message_at] == add_order_long_message_written.price_long[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order Short Message: 23 bytes --------------------------------------- */

/* An Add Order message represents a newly accepted visible order on the Cboe book. */
typedef AddOrderShortMessage {
  byte time_offset[4];
  byte order_id[8];
  byte side_indicator;
  byte quantity_short[2];
  byte symbol_short[6];
  byte price_short[2]
};

int add_order_short_message_at;

/* every byte of Add Order Short Message set to one value */
inline fill_add_order_short_message(add_order_short_message_record, add_order_short_message_value) {
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> add_order_short_message_record.time_offset[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 8 -> add_order_short_message_record.order_id[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_record.side_indicator = add_order_short_message_value;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> add_order_short_message_record.quantity_short[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 6 -> add_order_short_message_record.symbol_short[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> add_order_short_message_record.price_short[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Short Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_short_message(add_order_short_message_record, add_order_short_message_base) {
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> add_order_short_message_record.time_offset[add_order_short_message_at] = (add_order_short_message_base + 0 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 8 -> add_order_short_message_record.order_id[add_order_short_message_at] = (add_order_short_message_base + 4 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_record.side_indicator = (add_order_short_message_base + 12 + 1) % 256;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> add_order_short_message_record.quantity_short[add_order_short_message_at] = (add_order_short_message_base + 13 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 6 -> add_order_short_message_record.symbol_short[add_order_short_message_at] = (add_order_short_message_base + 15 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> add_order_short_message_record.price_short[add_order_short_message_at] = (add_order_short_message_base + 21 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Short Message to the wire, 23 bytes from where the cursor stands */
inline encode_add_order_short_message(add_order_short_message_record) {
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> wire[at] = add_order_short_message_record.time_offset[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 8 -> wire[at] = add_order_short_message_record.order_id[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_short_message_record.side_indicator; at = at + 1;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> wire[at] = add_order_short_message_record.quantity_short[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 6 -> wire[at] = add_order_short_message_record.symbol_short[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> wire[at] = add_order_short_message_record.price_short[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Short Message off the wire, 23 bytes from where the cursor stands */
inline decode_add_order_short_message(add_order_short_message_record) {
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> add_order_short_message_record.time_offset[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 8 -> add_order_short_message_record.order_id[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_record.side_indicator = wire[at]; at = at + 1;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> add_order_short_message_record.quantity_short[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 6 -> add_order_short_message_record.symbol_short[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> add_order_short_message_record.price_short[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Short Message is what was written, byte for byte */
inline equal_add_order_short_message(add_order_short_message_read, add_order_short_message_written) {
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> assert(add_order_short_message_read.time_offset[add_order_short_message_at] == add_order_short_message_written.time_offset[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 8 -> assert(add_order_short_message_read.order_id[add_order_short_message_at] == add_order_short_message_written.order_id[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  assert(add_order_short_message_read.side_indicator == add_order_short_message_written.side_indicator);
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> assert(add_order_short_message_read.quantity_short[add_order_short_message_at] == add_order_short_message_written.quantity_short[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 6 -> assert(add_order_short_message_read.symbol_short[add_order_short_message_at] == add_order_short_message_written.symbol_short[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> assert(add_order_short_message_read.price_short[add_order_short_message_at] == add_order_short_message_written.price_short[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Execution Flags: 4 bytes ------------------------------------------------ */

/* Execution Flags */
typedef ExecutionFlags {
  byte market_mechanism;
  byte trading_mode;
  byte ex_cum_dividend;
  byte algorithmic_trade
};

/* every byte of Execution Flags set to one value */
inline fill_execution_flags(execution_flags_record, execution_flags_value) {
  execution_flags_record.market_mechanism = execution_flags_value;
  execution_flags_record.trading_mode = execution_flags_value;
  execution_flags_record.ex_cum_dividend = execution_flags_value;
  execution_flags_record.algorithmic_trade = execution_flags_value;
  skip
}

/* each byte of Execution Flags set to where it lies, so a field read out of place says so */
inline ramp_execution_flags(execution_flags_record, execution_flags_base) {
  execution_flags_record.market_mechanism = (execution_flags_base + 0 + 1) % 256;
  execution_flags_record.trading_mode = (execution_flags_base + 1 + 1) % 256;
  execution_flags_record.ex_cum_dividend = (execution_flags_base + 2 + 1) % 256;
  execution_flags_record.algorithmic_trade = (execution_flags_base + 3 + 1) % 256;
  skip
}

/* Execution Flags to the wire, 4 bytes from where the cursor stands */
inline encode_execution_flags(execution_flags_record) {
  wire[at] = execution_flags_record.market_mechanism; at = at + 1;
  wire[at] = execution_flags_record.trading_mode; at = at + 1;
  wire[at] = execution_flags_record.ex_cum_dividend; at = at + 1;
  wire[at] = execution_flags_record.algorithmic_trade; at = at + 1;
  skip
}

/* Execution Flags off the wire, 4 bytes from where the cursor stands */
inline decode_execution_flags(execution_flags_record) {
  execution_flags_record.market_mechanism = wire[at]; at = at + 1;
  execution_flags_record.trading_mode = wire[at]; at = at + 1;
  execution_flags_record.ex_cum_dividend = wire[at]; at = at + 1;
  execution_flags_record.algorithmic_trade = wire[at]; at = at + 1;
  skip
}

/* what was read of Execution Flags is what was written, byte for byte */
inline equal_execution_flags(execution_flags_read, execution_flags_written) {
  assert(execution_flags_read.market_mechanism == execution_flags_written.market_mechanism);
  assert(execution_flags_read.trading_mode == execution_flags_written.trading_mode);
  assert(execution_flags_read.ex_cum_dividend == execution_flags_written.ex_cum_dividend);
  assert(execution_flags_read.algorithmic_trade == execution_flags_written.algorithmic_trade);
  skip
}

/* ---- Order Executed Message: 28 bytes ---------------------------------------- */

/* Order Executed messages are sent when a visible order on the Cboe book is executed in whole or in part */
typedef OrderExecutedMessage {
  byte time_offset[4];
  byte order_id[8];
  byte executed_shares[4];
  byte execution_id[8];
  ExecutionFlags execution_flags
};

int order_executed_message_at;

/* every byte of Order Executed Message set to one value */
inline fill_order_executed_message(order_executed_message_record, order_executed_message_value) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.time_offset[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_shares[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.execution_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  fill_execution_flags(order_executed_message_record.execution_flags, order_executed_message_value);
  skip
}

/* each byte of Order Executed Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_message(order_executed_message_record, order_executed_message_base) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.time_offset[order_executed_message_at] = (order_executed_message_base + 0 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = (order_executed_message_base + 4 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_shares[order_executed_message_at] = (order_executed_message_base + 12 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.execution_id[order_executed_message_at] = (order_executed_message_base + 16 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  ramp_execution_flags(order_executed_message_record.execution_flags, order_executed_message_base + 24);
  skip
}

/* Order Executed Message to the wire, 28 bytes from where the cursor stands */
inline encode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.time_offset[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.order_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.executed_shares[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.execution_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  encode_execution_flags(order_executed_message_record.execution_flags);
  skip
}

/* Order Executed Message off the wire, 28 bytes from where the cursor stands */
inline decode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.time_offset[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_shares[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.execution_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  decode_execution_flags(order_executed_message_record.execution_flags);
  skip
}

/* what was read of Order Executed Message is what was written, byte for byte */
inline equal_order_executed_message(order_executed_message_read, order_executed_message_written) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.time_offset[order_executed_message_at] == order_executed_message_written.time_offset[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.order_id[order_executed_message_at] == order_executed_message_written.order_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.executed_shares[order_executed_message_at] == order_executed_message_written.executed_shares[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.execution_id[order_executed_message_at] == order_executed_message_written.execution_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  equal_execution_flags(order_executed_message_read.execution_flags, order_executed_message_written.execution_flags);
  skip
}

/* ---- Order Executed At Price Size Message: 40 bytes -------------------------- */

/* Order Executed at Price/Size messages are sent when a visible order on the Cboe book is executed in whole or in part at a different price than the limit price on the original Add Order message or the limit order price in the latest Modify Order message referencing the Order Id. */
typedef OrderExecutedAtPriceSizeMessage {
  byte time_offset[4];
  byte order_id[8];
  byte executed_shares[4];
  byte remaining_shares[4];
  byte execution_id[8];
  byte price_long[8];
  ExecutionFlags execution_flags
};

int order_executed_at_price_size_message_at;

/* every byte of Order Executed At Price Size Message set to one value */
inline fill_order_executed_at_price_size_message(order_executed_at_price_size_message_record, order_executed_at_price_size_message_value) {
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> order_executed_at_price_size_message_record.time_offset[order_executed_at_price_size_message_at] = order_executed_at_price_size_message_value; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> order_executed_at_price_size_message_record.order_id[order_executed_at_price_size_message_at] = order_executed_at_price_size_message_value; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> order_executed_at_price_size_message_record.executed_shares[order_executed_at_price_size_message_at] = order_executed_at_price_size_message_value; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> order_executed_at_price_size_message_record.remaining_shares[order_executed_at_price_size_message_at] = order_executed_at_price_size_message_value; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> order_executed_at_price_size_message_record.execution_id[order_executed_at_price_size_message_at] = order_executed_at_price_size_message_value; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> order_executed_at_price_size_message_record.price_long[order_executed_at_price_size_message_at] = order_executed_at_price_size_message_value; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  fill_execution_flags(order_executed_at_price_size_message_record.execution_flags, order_executed_at_price_size_message_value);
  skip
}

/* each byte of Order Executed At Price Size Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_at_price_size_message(order_executed_at_price_size_message_record, order_executed_at_price_size_message_base) {
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> order_executed_at_price_size_message_record.time_offset[order_executed_at_price_size_message_at] = (order_executed_at_price_size_message_base + 0 + order_executed_at_price_size_message_at + 1) % 256; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> order_executed_at_price_size_message_record.order_id[order_executed_at_price_size_message_at] = (order_executed_at_price_size_message_base + 4 + order_executed_at_price_size_message_at + 1) % 256; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> order_executed_at_price_size_message_record.executed_shares[order_executed_at_price_size_message_at] = (order_executed_at_price_size_message_base + 12 + order_executed_at_price_size_message_at + 1) % 256; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> order_executed_at_price_size_message_record.remaining_shares[order_executed_at_price_size_message_at] = (order_executed_at_price_size_message_base + 16 + order_executed_at_price_size_message_at + 1) % 256; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> order_executed_at_price_size_message_record.execution_id[order_executed_at_price_size_message_at] = (order_executed_at_price_size_message_base + 20 + order_executed_at_price_size_message_at + 1) % 256; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> order_executed_at_price_size_message_record.price_long[order_executed_at_price_size_message_at] = (order_executed_at_price_size_message_base + 28 + order_executed_at_price_size_message_at + 1) % 256; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  ramp_execution_flags(order_executed_at_price_size_message_record.execution_flags, order_executed_at_price_size_message_base + 36);
  skip
}

/* Order Executed At Price Size Message to the wire, 40 bytes from where the cursor stands */
inline encode_order_executed_at_price_size_message(order_executed_at_price_size_message_record) {
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> wire[at] = order_executed_at_price_size_message_record.time_offset[order_executed_at_price_size_message_at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> wire[at] = order_executed_at_price_size_message_record.order_id[order_executed_at_price_size_message_at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> wire[at] = order_executed_at_price_size_message_record.executed_shares[order_executed_at_price_size_message_at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> wire[at] = order_executed_at_price_size_message_record.remaining_shares[order_executed_at_price_size_message_at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> wire[at] = order_executed_at_price_size_message_record.execution_id[order_executed_at_price_size_message_at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> wire[at] = order_executed_at_price_size_message_record.price_long[order_executed_at_price_size_message_at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  encode_execution_flags(order_executed_at_price_size_message_record.execution_flags);
  skip
}

/* Order Executed At Price Size Message off the wire, 40 bytes from where the cursor stands */
inline decode_order_executed_at_price_size_message(order_executed_at_price_size_message_record) {
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> order_executed_at_price_size_message_record.time_offset[order_executed_at_price_size_message_at] = wire[at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> order_executed_at_price_size_message_record.order_id[order_executed_at_price_size_message_at] = wire[at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> order_executed_at_price_size_message_record.executed_shares[order_executed_at_price_size_message_at] = wire[at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> order_executed_at_price_size_message_record.remaining_shares[order_executed_at_price_size_message_at] = wire[at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> order_executed_at_price_size_message_record.execution_id[order_executed_at_price_size_message_at] = wire[at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> order_executed_at_price_size_message_record.price_long[order_executed_at_price_size_message_at] = wire[at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  decode_execution_flags(order_executed_at_price_size_message_record.execution_flags);
  skip
}

/* what was read of Order Executed At Price Size Message is what was written, byte for byte */
inline equal_order_executed_at_price_size_message(order_executed_at_price_size_message_read, order_executed_at_price_size_message_written) {
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> assert(order_executed_at_price_size_message_read.time_offset[order_executed_at_price_size_message_at] == order_executed_at_price_size_message_written.time_offset[order_executed_at_price_size_message_at]); order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> assert(order_executed_at_price_size_message_read.order_id[order_executed_at_price_size_message_at] == order_executed_at_price_size_message_written.order_id[order_executed_at_price_size_message_at]); order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> assert(order_executed_at_price_size_message_read.executed_shares[order_executed_at_price_size_message_at] == order_executed_at_price_size_message_written.executed_shares[order_executed_at_price_size_message_at]); order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> assert(order_executed_at_price_size_message_read.remaining_shares[order_executed_at_price_size_message_at] == order_executed_at_price_size_message_written.remaining_shares[order_executed_at_price_size_message_at]); order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> assert(order_executed_at_price_size_message_read.execution_id[order_executed_at_price_size_message_at] == order_executed_at_price_size_message_written.execution_id[order_executed_at_price_size_message_at]); order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> assert(order_executed_at_price_size_message_read.price_long[order_executed_at_price_size_message_at] == order_executed_at_price_size_message_written.price_long[order_executed_at_price_size_message_at]); order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  equal_execution_flags(order_executed_at_price_size_message_read.execution_flags, order_executed_at_price_size_message_written.execution_flags);
  skip
}

/* ---- Reduce Size Long Message: 16 bytes -------------------------------------- */

/* Reduce Size messages are sent when a visible order on the Cboe book is partially reduced. */
typedef ReduceSizeLongMessage {
  byte time_offset[4];
  byte order_id[8];
  byte canceled_shares_long[4]
};

int reduce_size_long_message_at;

/* every byte of Reduce Size Long Message set to one value */
inline fill_reduce_size_long_message(reduce_size_long_message_record, reduce_size_long_message_value) {
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> reduce_size_long_message_record.time_offset[reduce_size_long_message_at] = reduce_size_long_message_value; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 8 -> reduce_size_long_message_record.order_id[reduce_size_long_message_at] = reduce_size_long_message_value; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> reduce_size_long_message_record.canceled_shares_long[reduce_size_long_message_at] = reduce_size_long_message_value; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reduce Size Long Message set to where it lies, so a field read out of place says so */
inline ramp_reduce_size_long_message(reduce_size_long_message_record, reduce_size_long_message_base) {
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> reduce_size_long_message_record.time_offset[reduce_size_long_message_at] = (reduce_size_long_message_base + 0 + reduce_size_long_message_at + 1) % 256; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 8 -> reduce_size_long_message_record.order_id[reduce_size_long_message_at] = (reduce_size_long_message_base + 4 + reduce_size_long_message_at + 1) % 256; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> reduce_size_long_message_record.canceled_shares_long[reduce_size_long_message_at] = (reduce_size_long_message_base + 12 + reduce_size_long_message_at + 1) % 256; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reduce Size Long Message to the wire, 16 bytes from where the cursor stands */
inline encode_reduce_size_long_message(reduce_size_long_message_record) {
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> wire[at] = reduce_size_long_message_record.time_offset[reduce_size_long_message_at]; at = at + 1; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 8 -> wire[at] = reduce_size_long_message_record.order_id[reduce_size_long_message_at]; at = at + 1; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> wire[at] = reduce_size_long_message_record.canceled_shares_long[reduce_size_long_message_at]; at = at + 1; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reduce Size Long Message off the wire, 16 bytes from where the cursor stands */
inline decode_reduce_size_long_message(reduce_size_long_message_record) {
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> reduce_size_long_message_record.time_offset[reduce_size_long_message_at] = wire[at]; at = at + 1; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 8 -> reduce_size_long_message_record.order_id[reduce_size_long_message_at] = wire[at]; at = at + 1; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> reduce_size_long_message_record.canceled_shares_long[reduce_size_long_message_at] = wire[at]; at = at + 1; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reduce Size Long Message is what was written, byte for byte */
inline equal_reduce_size_long_message(reduce_size_long_message_read, reduce_size_long_message_written) {
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> assert(reduce_size_long_message_read.time_offset[reduce_size_long_message_at] == reduce_size_long_message_written.time_offset[reduce_size_long_message_at]); reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 8 -> assert(reduce_size_long_message_read.order_id[reduce_size_long_message_at] == reduce_size_long_message_written.order_id[reduce_size_long_message_at]); reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> assert(reduce_size_long_message_read.canceled_shares_long[reduce_size_long_message_at] == reduce_size_long_message_written.canceled_shares_long[reduce_size_long_message_at]); reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reduce Size Short Message: 14 bytes ------------------------------------- */

/* Reduce Size messages are sent when a visible order on the Cboe book is partially reduced */
typedef ReduceSizeShortMessage {
  byte time_offset[4];
  byte order_id[8];
  byte canceled_shares_short[2]
};

int reduce_size_short_message_at;

/* every byte of Reduce Size Short Message set to one value */
inline fill_reduce_size_short_message(reduce_size_short_message_record, reduce_size_short_message_value) {
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 4 -> reduce_size_short_message_record.time_offset[reduce_size_short_message_at] = reduce_size_short_message_value; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 8 -> reduce_size_short_message_record.order_id[reduce_size_short_message_at] = reduce_size_short_message_value; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 2 -> reduce_size_short_message_record.canceled_shares_short[reduce_size_short_message_at] = reduce_size_short_message_value; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reduce Size Short Message set to where it lies, so a field read out of place says so */
inline ramp_reduce_size_short_message(reduce_size_short_message_record, reduce_size_short_message_base) {
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 4 -> reduce_size_short_message_record.time_offset[reduce_size_short_message_at] = (reduce_size_short_message_base + 0 + reduce_size_short_message_at + 1) % 256; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 8 -> reduce_size_short_message_record.order_id[reduce_size_short_message_at] = (reduce_size_short_message_base + 4 + reduce_size_short_message_at + 1) % 256; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 2 -> reduce_size_short_message_record.canceled_shares_short[reduce_size_short_message_at] = (reduce_size_short_message_base + 12 + reduce_size_short_message_at + 1) % 256; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reduce Size Short Message to the wire, 14 bytes from where the cursor stands */
inline encode_reduce_size_short_message(reduce_size_short_message_record) {
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 4 -> wire[at] = reduce_size_short_message_record.time_offset[reduce_size_short_message_at]; at = at + 1; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 8 -> wire[at] = reduce_size_short_message_record.order_id[reduce_size_short_message_at]; at = at + 1; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 2 -> wire[at] = reduce_size_short_message_record.canceled_shares_short[reduce_size_short_message_at]; at = at + 1; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reduce Size Short Message off the wire, 14 bytes from where the cursor stands */
inline decode_reduce_size_short_message(reduce_size_short_message_record) {
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 4 -> reduce_size_short_message_record.time_offset[reduce_size_short_message_at] = wire[at]; at = at + 1; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 8 -> reduce_size_short_message_record.order_id[reduce_size_short_message_at] = wire[at]; at = at + 1; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 2 -> reduce_size_short_message_record.canceled_shares_short[reduce_size_short_message_at] = wire[at]; at = at + 1; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reduce Size Short Message is what was written, byte for byte */
inline equal_reduce_size_short_message(reduce_size_short_message_read, reduce_size_short_message_written) {
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 4 -> assert(reduce_size_short_message_read.time_offset[reduce_size_short_message_at] == reduce_size_short_message_written.time_offset[reduce_size_short_message_at]); reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 8 -> assert(reduce_size_short_message_read.order_id[reduce_size_short_message_at] == reduce_size_short_message_written.order_id[reduce_size_short_message_at]); reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 2 -> assert(reduce_size_short_message_read.canceled_shares_short[reduce_size_short_message_at] == reduce_size_short_message_written.canceled_shares_short[reduce_size_short_message_at]); reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Order Long Message: 24 bytes ------------------------------------- */

/* The Modify Order message is sent whenever an open order is visibly modified. The Order Id refers to the Order Id of the original Add Order message. */
typedef ModifyOrderLongMessage {
  byte time_offset[4];
  byte order_id[8];
  byte shares_long[4];
  byte price_long[8]
};

int modify_order_long_message_at;

/* every byte of Modify Order Long Message set to one value */
inline fill_modify_order_long_message(modify_order_long_message_record, modify_order_long_message_value) {
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 4 -> modify_order_long_message_record.time_offset[modify_order_long_message_at] = modify_order_long_message_value; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 8 -> modify_order_long_message_record.order_id[modify_order_long_message_at] = modify_order_long_message_value; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 4 -> modify_order_long_message_record.shares_long[modify_order_long_message_at] = modify_order_long_message_value; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 8 -> modify_order_long_message_record.price_long[modify_order_long_message_at] = modify_order_long_message_value; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Modify Order Long Message set to where it lies, so a field read out of place says so */
inline ramp_modify_order_long_message(modify_order_long_message_record, modify_order_long_message_base) {
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 4 -> modify_order_long_message_record.time_offset[modify_order_long_message_at] = (modify_order_long_message_base + 0 + modify_order_long_message_at + 1) % 256; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 8 -> modify_order_long_message_record.order_id[modify_order_long_message_at] = (modify_order_long_message_base + 4 + modify_order_long_message_at + 1) % 256; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 4 -> modify_order_long_message_record.shares_long[modify_order_long_message_at] = (modify_order_long_message_base + 12 + modify_order_long_message_at + 1) % 256; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 8 -> modify_order_long_message_record.price_long[modify_order_long_message_at] = (modify_order_long_message_base + 16 + modify_order_long_message_at + 1) % 256; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order Long Message to the wire, 24 bytes from where the cursor stands */
inline encode_modify_order_long_message(modify_order_long_message_record) {
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 4 -> wire[at] = modify_order_long_message_record.time_offset[modify_order_long_message_at]; at = at + 1; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 8 -> wire[at] = modify_order_long_message_record.order_id[modify_order_long_message_at]; at = at + 1; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 4 -> wire[at] = modify_order_long_message_record.shares_long[modify_order_long_message_at]; at = at + 1; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 8 -> wire[at] = modify_order_long_message_record.price_long[modify_order_long_message_at]; at = at + 1; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order Long Message off the wire, 24 bytes from where the cursor stands */
inline decode_modify_order_long_message(modify_order_long_message_record) {
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 4 -> modify_order_long_message_record.time_offset[modify_order_long_message_at] = wire[at]; at = at + 1; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 8 -> modify_order_long_message_record.order_id[modify_order_long_message_at] = wire[at]; at = at + 1; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 4 -> modify_order_long_message_record.shares_long[modify_order_long_message_at] = wire[at]; at = at + 1; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 8 -> modify_order_long_message_record.price_long[modify_order_long_message_at] = wire[at]; at = at + 1; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Modify Order Long Message is what was written, byte for byte */
inline equal_modify_order_long_message(modify_order_long_message_read, modify_order_long_message_written) {
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 4 -> assert(modify_order_long_message_read.time_offset[modify_order_long_message_at] == modify_order_long_message_written.time_offset[modify_order_long_message_at]); modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 8 -> assert(modify_order_long_message_read.order_id[modify_order_long_message_at] == modify_order_long_message_written.order_id[modify_order_long_message_at]); modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 4 -> assert(modify_order_long_message_read.shares_long[modify_order_long_message_at] == modify_order_long_message_written.shares_long[modify_order_long_message_at]); modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 8 -> assert(modify_order_long_message_read.price_long[modify_order_long_message_at] == modify_order_long_message_written.price_long[modify_order_long_message_at]); modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Order Short Message: 16 bytes ------------------------------------ */

/* The Modify Order message is sent whenever an open order is visibly modified. The Order Id refers to the Order Id of the original Add Order message. */
typedef ModifyOrderShortMessage {
  byte time_offset[4];
  byte order_id[8];
  byte shares_short[2];
  byte price_short[2]
};

int modify_order_short_message_at;

/* every byte of Modify Order Short Message set to one value */
inline fill_modify_order_short_message(modify_order_short_message_record, modify_order_short_message_value) {
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 4 -> modify_order_short_message_record.time_offset[modify_order_short_message_at] = modify_order_short_message_value; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 8 -> modify_order_short_message_record.order_id[modify_order_short_message_at] = modify_order_short_message_value; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 2 -> modify_order_short_message_record.shares_short[modify_order_short_message_at] = modify_order_short_message_value; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 2 -> modify_order_short_message_record.price_short[modify_order_short_message_at] = modify_order_short_message_value; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Modify Order Short Message set to where it lies, so a field read out of place says so */
inline ramp_modify_order_short_message(modify_order_short_message_record, modify_order_short_message_base) {
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 4 -> modify_order_short_message_record.time_offset[modify_order_short_message_at] = (modify_order_short_message_base + 0 + modify_order_short_message_at + 1) % 256; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 8 -> modify_order_short_message_record.order_id[modify_order_short_message_at] = (modify_order_short_message_base + 4 + modify_order_short_message_at + 1) % 256; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 2 -> modify_order_short_message_record.shares_short[modify_order_short_message_at] = (modify_order_short_message_base + 12 + modify_order_short_message_at + 1) % 256; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 2 -> modify_order_short_message_record.price_short[modify_order_short_message_at] = (modify_order_short_message_base + 14 + modify_order_short_message_at + 1) % 256; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order Short Message to the wire, 16 bytes from where the cursor stands */
inline encode_modify_order_short_message(modify_order_short_message_record) {
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 4 -> wire[at] = modify_order_short_message_record.time_offset[modify_order_short_message_at]; at = at + 1; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 8 -> wire[at] = modify_order_short_message_record.order_id[modify_order_short_message_at]; at = at + 1; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 2 -> wire[at] = modify_order_short_message_record.shares_short[modify_order_short_message_at]; at = at + 1; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 2 -> wire[at] = modify_order_short_message_record.price_short[modify_order_short_message_at]; at = at + 1; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order Short Message off the wire, 16 bytes from where the cursor stands */
inline decode_modify_order_short_message(modify_order_short_message_record) {
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 4 -> modify_order_short_message_record.time_offset[modify_order_short_message_at] = wire[at]; at = at + 1; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 8 -> modify_order_short_message_record.order_id[modify_order_short_message_at] = wire[at]; at = at + 1; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 2 -> modify_order_short_message_record.shares_short[modify_order_short_message_at] = wire[at]; at = at + 1; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 2 -> modify_order_short_message_record.price_short[modify_order_short_message_at] = wire[at]; at = at + 1; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Modify Order Short Message is what was written, byte for byte */
inline equal_modify_order_short_message(modify_order_short_message_read, modify_order_short_message_written) {
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 4 -> assert(modify_order_short_message_read.time_offset[modify_order_short_message_at] == modify_order_short_message_written.time_offset[modify_order_short_message_at]); modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 8 -> assert(modify_order_short_message_read.order_id[modify_order_short_message_at] == modify_order_short_message_written.order_id[modify_order_short_message_at]); modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 2 -> assert(modify_order_short_message_read.shares_short[modify_order_short_message_at] == modify_order_short_message_written.shares_short[modify_order_short_message_at]); modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 2 -> assert(modify_order_short_message_read.price_short[modify_order_short_message_at] == modify_order_short_message_written.price_short[modify_order_short_message_at]); modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Delete Order Message: 12 bytes ------------------------------------------ */

/* The Delete Order message is sent whenever an open order is completely canceled. The Order Id refers to the Order Id of the original Add Order message. */
typedef DeleteOrderMessage {
  byte time_offset[4];
  byte order_id[8]
};

int delete_order_message_at;

/* every byte of Delete Order Message set to one value */
inline fill_delete_order_message(delete_order_message_record, delete_order_message_value) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.time_offset[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
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
  :: delete_order_message_at < 4 -> delete_order_message_record.time_offset[delete_order_message_at] = (delete_order_message_base + 0 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = (delete_order_message_base + 4 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Order Message to the wire, 12 bytes from where the cursor stands */
inline encode_delete_order_message(delete_order_message_record) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> wire[at] = delete_order_message_record.time_offset[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> wire[at] = delete_order_message_record.order_id[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Order Message off the wire, 12 bytes from where the cursor stands */
inline decode_delete_order_message(delete_order_message_record) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.time_offset[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
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
  :: delete_order_message_at < 4 -> assert(delete_order_message_read.time_offset[delete_order_message_at] == delete_order_message_written.time_offset[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> assert(delete_order_message_read.order_id[delete_order_message_at] == delete_order_message_written.order_id[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Flags: 5 bytes ---------------------------------------------------- */

/* Trade Flags */
typedef TradeFlags {
  byte market_mechanism;
  byte trading_mode;
  byte transaction_category;
  byte trade_types;
  byte algorithmic_trade
};

/* every byte of Trade Flags set to one value */
inline fill_trade_flags(trade_flags_record, trade_flags_value) {
  trade_flags_record.market_mechanism = trade_flags_value;
  trade_flags_record.trading_mode = trade_flags_value;
  trade_flags_record.transaction_category = trade_flags_value;
  trade_flags_record.trade_types = trade_flags_value;
  trade_flags_record.algorithmic_trade = trade_flags_value;
  skip
}

/* each byte of Trade Flags set to where it lies, so a field read out of place says so */
inline ramp_trade_flags(trade_flags_record, trade_flags_base) {
  trade_flags_record.market_mechanism = (trade_flags_base + 0 + 1) % 256;
  trade_flags_record.trading_mode = (trade_flags_base + 1 + 1) % 256;
  trade_flags_record.transaction_category = (trade_flags_base + 2 + 1) % 256;
  trade_flags_record.trade_types = (trade_flags_base + 3 + 1) % 256;
  trade_flags_record.algorithmic_trade = (trade_flags_base + 4 + 1) % 256;
  skip
}

/* Trade Flags to the wire, 5 bytes from where the cursor stands */
inline encode_trade_flags(trade_flags_record) {
  wire[at] = trade_flags_record.market_mechanism; at = at + 1;
  wire[at] = trade_flags_record.trading_mode; at = at + 1;
  wire[at] = trade_flags_record.transaction_category; at = at + 1;
  wire[at] = trade_flags_record.trade_types; at = at + 1;
  wire[at] = trade_flags_record.algorithmic_trade; at = at + 1;
  skip
}

/* Trade Flags off the wire, 5 bytes from where the cursor stands */
inline decode_trade_flags(trade_flags_record) {
  trade_flags_record.market_mechanism = wire[at]; at = at + 1;
  trade_flags_record.trading_mode = wire[at]; at = at + 1;
  trade_flags_record.transaction_category = wire[at]; at = at + 1;
  trade_flags_record.trade_types = wire[at]; at = at + 1;
  trade_flags_record.algorithmic_trade = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Flags is what was written, byte for byte */
inline equal_trade_flags(trade_flags_read, trade_flags_written) {
  assert(trade_flags_read.market_mechanism == trade_flags_written.market_mechanism);
  assert(trade_flags_read.trading_mode == trade_flags_written.trading_mode);
  assert(trade_flags_read.transaction_category == trade_flags_written.transaction_category);
  assert(trade_flags_read.trade_types == trade_flags_written.trade_types);
  assert(trade_flags_read.algorithmic_trade == trade_flags_written.algorithmic_trade);
  skip
}

/* ---- Trade Long Message: 44 bytes -------------------------------------------- */

/* The Trade message provides information about executions of complex order auctions on the Cboe complex book. */
typedef TradeLongMessage {
  byte time_offset[4];
  byte order_id[8];
  byte side_indicator;
  byte shares_long[4];
  byte symbol_short[6];
  byte price_long[8];
  byte execution_id[8];
  TradeFlags trade_flags
};

int trade_long_message_at;

/* every byte of Trade Long Message set to one value */
inline fill_trade_long_message(trade_long_message_record, trade_long_message_value) {
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> trade_long_message_record.time_offset[trade_long_message_at] = trade_long_message_value; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.order_id[trade_long_message_at] = trade_long_message_value; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_record.side_indicator = trade_long_message_value;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> trade_long_message_record.shares_long[trade_long_message_at] = trade_long_message_value; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 6 -> trade_long_message_record.symbol_short[trade_long_message_at] = trade_long_message_value; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.price_long[trade_long_message_at] = trade_long_message_value; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.execution_id[trade_long_message_at] = trade_long_message_value; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  fill_trade_flags(trade_long_message_record.trade_flags, trade_long_message_value);
  skip
}

/* each byte of Trade Long Message set to where it lies, so a field read out of place says so */
inline ramp_trade_long_message(trade_long_message_record, trade_long_message_base) {
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> trade_long_message_record.time_offset[trade_long_message_at] = (trade_long_message_base + 0 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.order_id[trade_long_message_at] = (trade_long_message_base + 4 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_record.side_indicator = (trade_long_message_base + 12 + 1) % 256;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> trade_long_message_record.shares_long[trade_long_message_at] = (trade_long_message_base + 13 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 6 -> trade_long_message_record.symbol_short[trade_long_message_at] = (trade_long_message_base + 17 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.price_long[trade_long_message_at] = (trade_long_message_base + 23 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.execution_id[trade_long_message_at] = (trade_long_message_base + 31 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  ramp_trade_flags(trade_long_message_record.trade_flags, trade_long_message_base + 39);
  skip
}

/* Trade Long Message to the wire, 44 bytes from where the cursor stands */
inline encode_trade_long_message(trade_long_message_record) {
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> wire[at] = trade_long_message_record.time_offset[trade_long_message_at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> wire[at] = trade_long_message_record.order_id[trade_long_message_at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_long_message_record.side_indicator; at = at + 1;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> wire[at] = trade_long_message_record.shares_long[trade_long_message_at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 6 -> wire[at] = trade_long_message_record.symbol_short[trade_long_message_at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> wire[at] = trade_long_message_record.price_long[trade_long_message_at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> wire[at] = trade_long_message_record.execution_id[trade_long_message_at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  encode_trade_flags(trade_long_message_record.trade_flags);
  skip
}

/* Trade Long Message off the wire, 44 bytes from where the cursor stands */
inline decode_trade_long_message(trade_long_message_record) {
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> trade_long_message_record.time_offset[trade_long_message_at] = wire[at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.order_id[trade_long_message_at] = wire[at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_record.side_indicator = wire[at]; at = at + 1;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> trade_long_message_record.shares_long[trade_long_message_at] = wire[at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 6 -> trade_long_message_record.symbol_short[trade_long_message_at] = wire[at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.price_long[trade_long_message_at] = wire[at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.execution_id[trade_long_message_at] = wire[at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  decode_trade_flags(trade_long_message_record.trade_flags);
  skip
}

/* what was read of Trade Long Message is what was written, byte for byte */
inline equal_trade_long_message(trade_long_message_read, trade_long_message_written) {
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> assert(trade_long_message_read.time_offset[trade_long_message_at] == trade_long_message_written.time_offset[trade_long_message_at]); trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> assert(trade_long_message_read.order_id[trade_long_message_at] == trade_long_message_written.order_id[trade_long_message_at]); trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  assert(trade_long_message_read.side_indicator == trade_long_message_written.side_indicator);
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> assert(trade_long_message_read.shares_long[trade_long_message_at] == trade_long_message_written.shares_long[trade_long_message_at]); trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 6 -> assert(trade_long_message_read.symbol_short[trade_long_message_at] == trade_long_message_written.symbol_short[trade_long_message_at]); trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> assert(trade_long_message_read.price_long[trade_long_message_at] == trade_long_message_written.price_long[trade_long_message_at]); trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> assert(trade_long_message_read.execution_id[trade_long_message_at] == trade_long_message_written.execution_id[trade_long_message_at]); trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  equal_trade_flags(trade_long_message_read.trade_flags, trade_long_message_written.trade_flags);
  skip
}

/* ---- Trade Short Message: 36 bytes ------------------------------------------- */

/* The Trade message provides information about executions of non-displayed orders on the Cboe book and routed executions to other trading centers. */
typedef TradeShortMessage {
  byte time_offset[4];
  byte order_id[8];
  byte side_indicator;
  byte contracts_short[2];
  byte symbol_alphanumeric_6[6];
  byte price_short[2];
  byte execution_id[8];
  TradeFlags trade_flags
};

int trade_short_message_at;

/* every byte of Trade Short Message set to one value */
inline fill_trade_short_message(trade_short_message_record, trade_short_message_value) {
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 4 -> trade_short_message_record.time_offset[trade_short_message_at] = trade_short_message_value; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> trade_short_message_record.order_id[trade_short_message_at] = trade_short_message_value; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_record.side_indicator = trade_short_message_value;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> trade_short_message_record.contracts_short[trade_short_message_at] = trade_short_message_value; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 6 -> trade_short_message_record.symbol_alphanumeric_6[trade_short_message_at] = trade_short_message_value; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> trade_short_message_record.price_short[trade_short_message_at] = trade_short_message_value; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> trade_short_message_record.execution_id[trade_short_message_at] = trade_short_message_value; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  fill_trade_flags(trade_short_message_record.trade_flags, trade_short_message_value);
  skip
}

/* each byte of Trade Short Message set to where it lies, so a field read out of place says so */
inline ramp_trade_short_message(trade_short_message_record, trade_short_message_base) {
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 4 -> trade_short_message_record.time_offset[trade_short_message_at] = (trade_short_message_base + 0 + trade_short_message_at + 1) % 256; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> trade_short_message_record.order_id[trade_short_message_at] = (trade_short_message_base + 4 + trade_short_message_at + 1) % 256; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_record.side_indicator = (trade_short_message_base + 12 + 1) % 256;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> trade_short_message_record.contracts_short[trade_short_message_at] = (trade_short_message_base + 13 + trade_short_message_at + 1) % 256; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 6 -> trade_short_message_record.symbol_alphanumeric_6[trade_short_message_at] = (trade_short_message_base + 15 + trade_short_message_at + 1) % 256; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> trade_short_message_record.price_short[trade_short_message_at] = (trade_short_message_base + 21 + trade_short_message_at + 1) % 256; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> trade_short_message_record.execution_id[trade_short_message_at] = (trade_short_message_base + 23 + trade_short_message_at + 1) % 256; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  ramp_trade_flags(trade_short_message_record.trade_flags, trade_short_message_base + 31);
  skip
}

/* Trade Short Message to the wire, 36 bytes from where the cursor stands */
inline encode_trade_short_message(trade_short_message_record) {
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 4 -> wire[at] = trade_short_message_record.time_offset[trade_short_message_at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> wire[at] = trade_short_message_record.order_id[trade_short_message_at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_short_message_record.side_indicator; at = at + 1;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> wire[at] = trade_short_message_record.contracts_short[trade_short_message_at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 6 -> wire[at] = trade_short_message_record.symbol_alphanumeric_6[trade_short_message_at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> wire[at] = trade_short_message_record.price_short[trade_short_message_at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> wire[at] = trade_short_message_record.execution_id[trade_short_message_at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  encode_trade_flags(trade_short_message_record.trade_flags);
  skip
}

/* Trade Short Message off the wire, 36 bytes from where the cursor stands */
inline decode_trade_short_message(trade_short_message_record) {
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 4 -> trade_short_message_record.time_offset[trade_short_message_at] = wire[at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> trade_short_message_record.order_id[trade_short_message_at] = wire[at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_record.side_indicator = wire[at]; at = at + 1;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> trade_short_message_record.contracts_short[trade_short_message_at] = wire[at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 6 -> trade_short_message_record.symbol_alphanumeric_6[trade_short_message_at] = wire[at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> trade_short_message_record.price_short[trade_short_message_at] = wire[at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> trade_short_message_record.execution_id[trade_short_message_at] = wire[at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  decode_trade_flags(trade_short_message_record.trade_flags);
  skip
}

/* what was read of Trade Short Message is what was written, byte for byte */
inline equal_trade_short_message(trade_short_message_read, trade_short_message_written) {
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 4 -> assert(trade_short_message_read.time_offset[trade_short_message_at] == trade_short_message_written.time_offset[trade_short_message_at]); trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> assert(trade_short_message_read.order_id[trade_short_message_at] == trade_short_message_written.order_id[trade_short_message_at]); trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  assert(trade_short_message_read.side_indicator == trade_short_message_written.side_indicator);
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> assert(trade_short_message_read.contracts_short[trade_short_message_at] == trade_short_message_written.contracts_short[trade_short_message_at]); trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 6 -> assert(trade_short_message_read.symbol_alphanumeric_6[trade_short_message_at] == trade_short_message_written.symbol_alphanumeric_6[trade_short_message_at]); trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> assert(trade_short_message_read.price_short[trade_short_message_at] == trade_short_message_written.price_short[trade_short_message_at]); trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> assert(trade_short_message_read.execution_id[trade_short_message_at] == trade_short_message_written.execution_id[trade_short_message_at]); trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  equal_trade_flags(trade_short_message_read.trade_flags, trade_short_message_written.trade_flags);
  skip
}

/* ---- Extended Trade Flags: 14 bytes ------------------------------------------ */

/* Extended Trade Flags */
typedef ExtendedTradeFlags {
  byte market_mechanism;
  byte trading_mode;
  byte transaction_category;
  byte negotiated_trade;
  byte crossing_trade;
  byte modification_indicator;
  byte benchmark_reference_price_indicator;
  byte special_dividend;
  byte off_book_automated_indicator;
  byte price_formation_discovery_process;
  byte algorithmic_indicator;
  byte publication_mode_deferral_reason;
  byte deferral_or_enrichment_type;
  byte duplicative_indicator
};

/* every byte of Extended Trade Flags set to one value */
inline fill_extended_trade_flags(extended_trade_flags_record, extended_trade_flags_value) {
  extended_trade_flags_record.market_mechanism = extended_trade_flags_value;
  extended_trade_flags_record.trading_mode = extended_trade_flags_value;
  extended_trade_flags_record.transaction_category = extended_trade_flags_value;
  extended_trade_flags_record.negotiated_trade = extended_trade_flags_value;
  extended_trade_flags_record.crossing_trade = extended_trade_flags_value;
  extended_trade_flags_record.modification_indicator = extended_trade_flags_value;
  extended_trade_flags_record.benchmark_reference_price_indicator = extended_trade_flags_value;
  extended_trade_flags_record.special_dividend = extended_trade_flags_value;
  extended_trade_flags_record.off_book_automated_indicator = extended_trade_flags_value;
  extended_trade_flags_record.price_formation_discovery_process = extended_trade_flags_value;
  extended_trade_flags_record.algorithmic_indicator = extended_trade_flags_value;
  extended_trade_flags_record.publication_mode_deferral_reason = extended_trade_flags_value;
  extended_trade_flags_record.deferral_or_enrichment_type = extended_trade_flags_value;
  extended_trade_flags_record.duplicative_indicator = extended_trade_flags_value;
  skip
}

/* each byte of Extended Trade Flags set to where it lies, so a field read out of place says so */
inline ramp_extended_trade_flags(extended_trade_flags_record, extended_trade_flags_base) {
  extended_trade_flags_record.market_mechanism = (extended_trade_flags_base + 0 + 1) % 256;
  extended_trade_flags_record.trading_mode = (extended_trade_flags_base + 1 + 1) % 256;
  extended_trade_flags_record.transaction_category = (extended_trade_flags_base + 2 + 1) % 256;
  extended_trade_flags_record.negotiated_trade = (extended_trade_flags_base + 3 + 1) % 256;
  extended_trade_flags_record.crossing_trade = (extended_trade_flags_base + 4 + 1) % 256;
  extended_trade_flags_record.modification_indicator = (extended_trade_flags_base + 5 + 1) % 256;
  extended_trade_flags_record.benchmark_reference_price_indicator = (extended_trade_flags_base + 6 + 1) % 256;
  extended_trade_flags_record.special_dividend = (extended_trade_flags_base + 7 + 1) % 256;
  extended_trade_flags_record.off_book_automated_indicator = (extended_trade_flags_base + 8 + 1) % 256;
  extended_trade_flags_record.price_formation_discovery_process = (extended_trade_flags_base + 9 + 1) % 256;
  extended_trade_flags_record.algorithmic_indicator = (extended_trade_flags_base + 10 + 1) % 256;
  extended_trade_flags_record.publication_mode_deferral_reason = (extended_trade_flags_base + 11 + 1) % 256;
  extended_trade_flags_record.deferral_or_enrichment_type = (extended_trade_flags_base + 12 + 1) % 256;
  extended_trade_flags_record.duplicative_indicator = (extended_trade_flags_base + 13 + 1) % 256;
  skip
}

/* Extended Trade Flags to the wire, 14 bytes from where the cursor stands */
inline encode_extended_trade_flags(extended_trade_flags_record) {
  wire[at] = extended_trade_flags_record.market_mechanism; at = at + 1;
  wire[at] = extended_trade_flags_record.trading_mode; at = at + 1;
  wire[at] = extended_trade_flags_record.transaction_category; at = at + 1;
  wire[at] = extended_trade_flags_record.negotiated_trade; at = at + 1;
  wire[at] = extended_trade_flags_record.crossing_trade; at = at + 1;
  wire[at] = extended_trade_flags_record.modification_indicator; at = at + 1;
  wire[at] = extended_trade_flags_record.benchmark_reference_price_indicator; at = at + 1;
  wire[at] = extended_trade_flags_record.special_dividend; at = at + 1;
  wire[at] = extended_trade_flags_record.off_book_automated_indicator; at = at + 1;
  wire[at] = extended_trade_flags_record.price_formation_discovery_process; at = at + 1;
  wire[at] = extended_trade_flags_record.algorithmic_indicator; at = at + 1;
  wire[at] = extended_trade_flags_record.publication_mode_deferral_reason; at = at + 1;
  wire[at] = extended_trade_flags_record.deferral_or_enrichment_type; at = at + 1;
  wire[at] = extended_trade_flags_record.duplicative_indicator; at = at + 1;
  skip
}

/* Extended Trade Flags off the wire, 14 bytes from where the cursor stands */
inline decode_extended_trade_flags(extended_trade_flags_record) {
  extended_trade_flags_record.market_mechanism = wire[at]; at = at + 1;
  extended_trade_flags_record.trading_mode = wire[at]; at = at + 1;
  extended_trade_flags_record.transaction_category = wire[at]; at = at + 1;
  extended_trade_flags_record.negotiated_trade = wire[at]; at = at + 1;
  extended_trade_flags_record.crossing_trade = wire[at]; at = at + 1;
  extended_trade_flags_record.modification_indicator = wire[at]; at = at + 1;
  extended_trade_flags_record.benchmark_reference_price_indicator = wire[at]; at = at + 1;
  extended_trade_flags_record.special_dividend = wire[at]; at = at + 1;
  extended_trade_flags_record.off_book_automated_indicator = wire[at]; at = at + 1;
  extended_trade_flags_record.price_formation_discovery_process = wire[at]; at = at + 1;
  extended_trade_flags_record.algorithmic_indicator = wire[at]; at = at + 1;
  extended_trade_flags_record.publication_mode_deferral_reason = wire[at]; at = at + 1;
  extended_trade_flags_record.deferral_or_enrichment_type = wire[at]; at = at + 1;
  extended_trade_flags_record.duplicative_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Extended Trade Flags is what was written, byte for byte */
inline equal_extended_trade_flags(extended_trade_flags_read, extended_trade_flags_written) {
  assert(extended_trade_flags_read.market_mechanism == extended_trade_flags_written.market_mechanism);
  assert(extended_trade_flags_read.trading_mode == extended_trade_flags_written.trading_mode);
  assert(extended_trade_flags_read.transaction_category == extended_trade_flags_written.transaction_category);
  assert(extended_trade_flags_read.negotiated_trade == extended_trade_flags_written.negotiated_trade);
  assert(extended_trade_flags_read.crossing_trade == extended_trade_flags_written.crossing_trade);
  assert(extended_trade_flags_read.modification_indicator == extended_trade_flags_written.modification_indicator);
  assert(extended_trade_flags_read.benchmark_reference_price_indicator == extended_trade_flags_written.benchmark_reference_price_indicator);
  assert(extended_trade_flags_read.special_dividend == extended_trade_flags_written.special_dividend);
  assert(extended_trade_flags_read.off_book_automated_indicator == extended_trade_flags_written.off_book_automated_indicator);
  assert(extended_trade_flags_read.price_formation_discovery_process == extended_trade_flags_written.price_formation_discovery_process);
  assert(extended_trade_flags_read.algorithmic_indicator == extended_trade_flags_written.algorithmic_indicator);
  assert(extended_trade_flags_read.publication_mode_deferral_reason == extended_trade_flags_written.publication_mode_deferral_reason);
  assert(extended_trade_flags_read.deferral_or_enrichment_type == extended_trade_flags_written.deferral_or_enrichment_type);
  assert(extended_trade_flags_read.duplicative_indicator == extended_trade_flags_written.duplicative_indicator);
  skip
}

/* ---- Trade Extended Message: 64 bytes ---------------------------------------- */

/* The Trade message provides information about executions of complex order auctions on the Cboe complex book. */
typedef TradeExtendedMessage {
  byte time_offset[4];
  byte shares_extended[8];
  byte symbol_short[6];
  byte price_long[8];
  byte trade_id[8];
  byte trade_timestamp[8];
  byte execution_venue[4];
  byte currency[3];
  byte cboe_trade_flags;
  ExtendedTradeFlags extended_trade_flags
};

int trade_extended_message_at;

/* every byte of Trade Extended Message set to one value */
inline fill_trade_extended_message(trade_extended_message_record, trade_extended_message_value) {
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 4 -> trade_extended_message_record.time_offset[trade_extended_message_at] = trade_extended_message_value; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> trade_extended_message_record.shares_extended[trade_extended_message_at] = trade_extended_message_value; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 6 -> trade_extended_message_record.symbol_short[trade_extended_message_at] = trade_extended_message_value; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> trade_extended_message_record.price_long[trade_extended_message_at] = trade_extended_message_value; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> trade_extended_message_record.trade_id[trade_extended_message_at] = trade_extended_message_value; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> trade_extended_message_record.trade_timestamp[trade_extended_message_at] = trade_extended_message_value; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 4 -> trade_extended_message_record.execution_venue[trade_extended_message_at] = trade_extended_message_value; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 3 -> trade_extended_message_record.currency[trade_extended_message_at] = trade_extended_message_value; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_record.cboe_trade_flags = trade_extended_message_value;
  fill_extended_trade_flags(trade_extended_message_record.extended_trade_flags, trade_extended_message_value);
  skip
}

/* each byte of Trade Extended Message set to where it lies, so a field read out of place says so */
inline ramp_trade_extended_message(trade_extended_message_record, trade_extended_message_base) {
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 4 -> trade_extended_message_record.time_offset[trade_extended_message_at] = (trade_extended_message_base + 0 + trade_extended_message_at + 1) % 256; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> trade_extended_message_record.shares_extended[trade_extended_message_at] = (trade_extended_message_base + 4 + trade_extended_message_at + 1) % 256; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 6 -> trade_extended_message_record.symbol_short[trade_extended_message_at] = (trade_extended_message_base + 12 + trade_extended_message_at + 1) % 256; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> trade_extended_message_record.price_long[trade_extended_message_at] = (trade_extended_message_base + 18 + trade_extended_message_at + 1) % 256; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> trade_extended_message_record.trade_id[trade_extended_message_at] = (trade_extended_message_base + 26 + trade_extended_message_at + 1) % 256; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> trade_extended_message_record.trade_timestamp[trade_extended_message_at] = (trade_extended_message_base + 34 + trade_extended_message_at + 1) % 256; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 4 -> trade_extended_message_record.execution_venue[trade_extended_message_at] = (trade_extended_message_base + 42 + trade_extended_message_at + 1) % 256; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 3 -> trade_extended_message_record.currency[trade_extended_message_at] = (trade_extended_message_base + 46 + trade_extended_message_at + 1) % 256; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_record.cboe_trade_flags = (trade_extended_message_base + 49 + 1) % 256;
  ramp_extended_trade_flags(trade_extended_message_record.extended_trade_flags, trade_extended_message_base + 50);
  skip
}

/* Trade Extended Message to the wire, 64 bytes from where the cursor stands */
inline encode_trade_extended_message(trade_extended_message_record) {
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 4 -> wire[at] = trade_extended_message_record.time_offset[trade_extended_message_at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> wire[at] = trade_extended_message_record.shares_extended[trade_extended_message_at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 6 -> wire[at] = trade_extended_message_record.symbol_short[trade_extended_message_at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> wire[at] = trade_extended_message_record.price_long[trade_extended_message_at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> wire[at] = trade_extended_message_record.trade_id[trade_extended_message_at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> wire[at] = trade_extended_message_record.trade_timestamp[trade_extended_message_at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 4 -> wire[at] = trade_extended_message_record.execution_venue[trade_extended_message_at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 3 -> wire[at] = trade_extended_message_record.currency[trade_extended_message_at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_extended_message_record.cboe_trade_flags; at = at + 1;
  encode_extended_trade_flags(trade_extended_message_record.extended_trade_flags);
  skip
}

/* Trade Extended Message off the wire, 64 bytes from where the cursor stands */
inline decode_trade_extended_message(trade_extended_message_record) {
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 4 -> trade_extended_message_record.time_offset[trade_extended_message_at] = wire[at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> trade_extended_message_record.shares_extended[trade_extended_message_at] = wire[at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 6 -> trade_extended_message_record.symbol_short[trade_extended_message_at] = wire[at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> trade_extended_message_record.price_long[trade_extended_message_at] = wire[at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> trade_extended_message_record.trade_id[trade_extended_message_at] = wire[at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> trade_extended_message_record.trade_timestamp[trade_extended_message_at] = wire[at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 4 -> trade_extended_message_record.execution_venue[trade_extended_message_at] = wire[at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 3 -> trade_extended_message_record.currency[trade_extended_message_at] = wire[at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_record.cboe_trade_flags = wire[at]; at = at + 1;
  decode_extended_trade_flags(trade_extended_message_record.extended_trade_flags);
  skip
}

/* what was read of Trade Extended Message is what was written, byte for byte */
inline equal_trade_extended_message(trade_extended_message_read, trade_extended_message_written) {
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 4 -> assert(trade_extended_message_read.time_offset[trade_extended_message_at] == trade_extended_message_written.time_offset[trade_extended_message_at]); trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> assert(trade_extended_message_read.shares_extended[trade_extended_message_at] == trade_extended_message_written.shares_extended[trade_extended_message_at]); trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 6 -> assert(trade_extended_message_read.symbol_short[trade_extended_message_at] == trade_extended_message_written.symbol_short[trade_extended_message_at]); trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> assert(trade_extended_message_read.price_long[trade_extended_message_at] == trade_extended_message_written.price_long[trade_extended_message_at]); trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> assert(trade_extended_message_read.trade_id[trade_extended_message_at] == trade_extended_message_written.trade_id[trade_extended_message_at]); trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> assert(trade_extended_message_read.trade_timestamp[trade_extended_message_at] == trade_extended_message_written.trade_timestamp[trade_extended_message_at]); trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 4 -> assert(trade_extended_message_read.execution_venue[trade_extended_message_at] == trade_extended_message_written.execution_venue[trade_extended_message_at]); trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 3 -> assert(trade_extended_message_read.currency[trade_extended_message_at] == trade_extended_message_written.currency[trade_extended_message_at]); trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  assert(trade_extended_message_read.cboe_trade_flags == trade_extended_message_written.cboe_trade_flags);
  equal_extended_trade_flags(trade_extended_message_read.extended_trade_flags, trade_extended_message_written.extended_trade_flags);
  skip
}

/* ---- Trade Unknown Symbol Message: 70 bytes ---------------------------------- */

/* This message provides details of trades reported to Cboe, but traded on a symbol not currently known to Cboe */
typedef TradeUnknownSymbolMessage {
  byte time_offset[4];
  byte shares_extended[8];
  byte symbol_long[12];
  byte price_long[8];
  byte trade_id[8];
  byte trade_timestamp[8];
  byte execution_venue[4];
  byte currency[3];
  byte cboe_trade_flags;
  ExtendedTradeFlags extended_trade_flags
};

int trade_unknown_symbol_message_at;

/* every byte of Trade Unknown Symbol Message set to one value */
inline fill_trade_unknown_symbol_message(trade_unknown_symbol_message_record, trade_unknown_symbol_message_value) {
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 4 -> trade_unknown_symbol_message_record.time_offset[trade_unknown_symbol_message_at] = trade_unknown_symbol_message_value; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 8 -> trade_unknown_symbol_message_record.shares_extended[trade_unknown_symbol_message_at] = trade_unknown_symbol_message_value; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 12 -> trade_unknown_symbol_message_record.symbol_long[trade_unknown_symbol_message_at] = trade_unknown_symbol_message_value; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 8 -> trade_unknown_symbol_message_record.price_long[trade_unknown_symbol_message_at] = trade_unknown_symbol_message_value; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 8 -> trade_unknown_symbol_message_record.trade_id[trade_unknown_symbol_message_at] = trade_unknown_symbol_message_value; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 8 -> trade_unknown_symbol_message_record.trade_timestamp[trade_unknown_symbol_message_at] = trade_unknown_symbol_message_value; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 4 -> trade_unknown_symbol_message_record.execution_venue[trade_unknown_symbol_message_at] = trade_unknown_symbol_message_value; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 3 -> trade_unknown_symbol_message_record.currency[trade_unknown_symbol_message_at] = trade_unknown_symbol_message_value; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_record.cboe_trade_flags = trade_unknown_symbol_message_value;
  fill_extended_trade_flags(trade_unknown_symbol_message_record.extended_trade_flags, trade_unknown_symbol_message_value);
  skip
}

/* each byte of Trade Unknown Symbol Message set to where it lies, so a field read out of place says so */
inline ramp_trade_unknown_symbol_message(trade_unknown_symbol_message_record, trade_unknown_symbol_message_base) {
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 4 -> trade_unknown_symbol_message_record.time_offset[trade_unknown_symbol_message_at] = (trade_unknown_symbol_message_base + 0 + trade_unknown_symbol_message_at + 1) % 256; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 8 -> trade_unknown_symbol_message_record.shares_extended[trade_unknown_symbol_message_at] = (trade_unknown_symbol_message_base + 4 + trade_unknown_symbol_message_at + 1) % 256; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 12 -> trade_unknown_symbol_message_record.symbol_long[trade_unknown_symbol_message_at] = (trade_unknown_symbol_message_base + 12 + trade_unknown_symbol_message_at + 1) % 256; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 8 -> trade_unknown_symbol_message_record.price_long[trade_unknown_symbol_message_at] = (trade_unknown_symbol_message_base + 24 + trade_unknown_symbol_message_at + 1) % 256; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 8 -> trade_unknown_symbol_message_record.trade_id[trade_unknown_symbol_message_at] = (trade_unknown_symbol_message_base + 32 + trade_unknown_symbol_message_at + 1) % 256; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 8 -> trade_unknown_symbol_message_record.trade_timestamp[trade_unknown_symbol_message_at] = (trade_unknown_symbol_message_base + 40 + trade_unknown_symbol_message_at + 1) % 256; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 4 -> trade_unknown_symbol_message_record.execution_venue[trade_unknown_symbol_message_at] = (trade_unknown_symbol_message_base + 48 + trade_unknown_symbol_message_at + 1) % 256; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 3 -> trade_unknown_symbol_message_record.currency[trade_unknown_symbol_message_at] = (trade_unknown_symbol_message_base + 52 + trade_unknown_symbol_message_at + 1) % 256; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_record.cboe_trade_flags = (trade_unknown_symbol_message_base + 55 + 1) % 256;
  ramp_extended_trade_flags(trade_unknown_symbol_message_record.extended_trade_flags, trade_unknown_symbol_message_base + 56);
  skip
}

/* Trade Unknown Symbol Message to the wire, 70 bytes from where the cursor stands */
inline encode_trade_unknown_symbol_message(trade_unknown_symbol_message_record) {
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 4 -> wire[at] = trade_unknown_symbol_message_record.time_offset[trade_unknown_symbol_message_at]; at = at + 1; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 8 -> wire[at] = trade_unknown_symbol_message_record.shares_extended[trade_unknown_symbol_message_at]; at = at + 1; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 12 -> wire[at] = trade_unknown_symbol_message_record.symbol_long[trade_unknown_symbol_message_at]; at = at + 1; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 8 -> wire[at] = trade_unknown_symbol_message_record.price_long[trade_unknown_symbol_message_at]; at = at + 1; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 8 -> wire[at] = trade_unknown_symbol_message_record.trade_id[trade_unknown_symbol_message_at]; at = at + 1; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 8 -> wire[at] = trade_unknown_symbol_message_record.trade_timestamp[trade_unknown_symbol_message_at]; at = at + 1; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 4 -> wire[at] = trade_unknown_symbol_message_record.execution_venue[trade_unknown_symbol_message_at]; at = at + 1; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 3 -> wire[at] = trade_unknown_symbol_message_record.currency[trade_unknown_symbol_message_at]; at = at + 1; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_unknown_symbol_message_record.cboe_trade_flags; at = at + 1;
  encode_extended_trade_flags(trade_unknown_symbol_message_record.extended_trade_flags);
  skip
}

/* Trade Unknown Symbol Message off the wire, 70 bytes from where the cursor stands */
inline decode_trade_unknown_symbol_message(trade_unknown_symbol_message_record) {
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 4 -> trade_unknown_symbol_message_record.time_offset[trade_unknown_symbol_message_at] = wire[at]; at = at + 1; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 8 -> trade_unknown_symbol_message_record.shares_extended[trade_unknown_symbol_message_at] = wire[at]; at = at + 1; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 12 -> trade_unknown_symbol_message_record.symbol_long[trade_unknown_symbol_message_at] = wire[at]; at = at + 1; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 8 -> trade_unknown_symbol_message_record.price_long[trade_unknown_symbol_message_at] = wire[at]; at = at + 1; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 8 -> trade_unknown_symbol_message_record.trade_id[trade_unknown_symbol_message_at] = wire[at]; at = at + 1; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 8 -> trade_unknown_symbol_message_record.trade_timestamp[trade_unknown_symbol_message_at] = wire[at]; at = at + 1; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 4 -> trade_unknown_symbol_message_record.execution_venue[trade_unknown_symbol_message_at] = wire[at]; at = at + 1; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 3 -> trade_unknown_symbol_message_record.currency[trade_unknown_symbol_message_at] = wire[at]; at = at + 1; trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_record.cboe_trade_flags = wire[at]; at = at + 1;
  decode_extended_trade_flags(trade_unknown_symbol_message_record.extended_trade_flags);
  skip
}

/* what was read of Trade Unknown Symbol Message is what was written, byte for byte */
inline equal_trade_unknown_symbol_message(trade_unknown_symbol_message_read, trade_unknown_symbol_message_written) {
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 4 -> assert(trade_unknown_symbol_message_read.time_offset[trade_unknown_symbol_message_at] == trade_unknown_symbol_message_written.time_offset[trade_unknown_symbol_message_at]); trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 8 -> assert(trade_unknown_symbol_message_read.shares_extended[trade_unknown_symbol_message_at] == trade_unknown_symbol_message_written.shares_extended[trade_unknown_symbol_message_at]); trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 12 -> assert(trade_unknown_symbol_message_read.symbol_long[trade_unknown_symbol_message_at] == trade_unknown_symbol_message_written.symbol_long[trade_unknown_symbol_message_at]); trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 8 -> assert(trade_unknown_symbol_message_read.price_long[trade_unknown_symbol_message_at] == trade_unknown_symbol_message_written.price_long[trade_unknown_symbol_message_at]); trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 8 -> assert(trade_unknown_symbol_message_read.trade_id[trade_unknown_symbol_message_at] == trade_unknown_symbol_message_written.trade_id[trade_unknown_symbol_message_at]); trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 8 -> assert(trade_unknown_symbol_message_read.trade_timestamp[trade_unknown_symbol_message_at] == trade_unknown_symbol_message_written.trade_timestamp[trade_unknown_symbol_message_at]); trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 4 -> assert(trade_unknown_symbol_message_read.execution_venue[trade_unknown_symbol_message_at] == trade_unknown_symbol_message_written.execution_venue[trade_unknown_symbol_message_at]); trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  trade_unknown_symbol_message_at = 0;
  do
  :: trade_unknown_symbol_message_at < 3 -> assert(trade_unknown_symbol_message_read.currency[trade_unknown_symbol_message_at] == trade_unknown_symbol_message_written.currency[trade_unknown_symbol_message_at]); trade_unknown_symbol_message_at = trade_unknown_symbol_message_at + 1
  :: else -> break
  od;
  assert(trade_unknown_symbol_message_read.cboe_trade_flags == trade_unknown_symbol_message_written.cboe_trade_flags);
  equal_extended_trade_flags(trade_unknown_symbol_message_read.extended_trade_flags, trade_unknown_symbol_message_written.extended_trade_flags);
  skip
}

/* ---- End Of Session: 4 bytes ------------------------------------------------- */

/* The End of Session message is sent for each unit when the unit shuts down */
typedef EndOfSession {
  byte time_offset[4]
};

int end_of_session_at;

/* every byte of End Of Session set to one value */
inline fill_end_of_session(end_of_session_record, end_of_session_value) {
  end_of_session_at = 0;
  do
  :: end_of_session_at < 4 -> end_of_session_record.time_offset[end_of_session_at] = end_of_session_value; end_of_session_at = end_of_session_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Session set to where it lies, so a field read out of place says so */
inline ramp_end_of_session(end_of_session_record, end_of_session_base) {
  end_of_session_at = 0;
  do
  :: end_of_session_at < 4 -> end_of_session_record.time_offset[end_of_session_at] = (end_of_session_base + 0 + end_of_session_at + 1) % 256; end_of_session_at = end_of_session_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Session to the wire, 4 bytes from where the cursor stands */
inline encode_end_of_session(end_of_session_record) {
  end_of_session_at = 0;
  do
  :: end_of_session_at < 4 -> wire[at] = end_of_session_record.time_offset[end_of_session_at]; at = at + 1; end_of_session_at = end_of_session_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Session off the wire, 4 bytes from where the cursor stands */
inline decode_end_of_session(end_of_session_record) {
  end_of_session_at = 0;
  do
  :: end_of_session_at < 4 -> end_of_session_record.time_offset[end_of_session_at] = wire[at]; at = at + 1; end_of_session_at = end_of_session_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Session is what was written, byte for byte */
inline equal_end_of_session(end_of_session_read, end_of_session_written) {
  end_of_session_at = 0;
  do
  :: end_of_session_at < 4 -> assert(end_of_session_read.time_offset[end_of_session_at] == end_of_session_written.time_offset[end_of_session_at]); end_of_session_at = end_of_session_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Transaction Begin Message: 4 bytes -------------------------------------- */

/* The Transaction Begin message indicates any subsequent messages, up to the accompanying Transaction End message, are all part of the same transaction block */
typedef TransactionBeginMessage {
  byte time_offset[4]
};

int transaction_begin_message_at;

/* every byte of Transaction Begin Message set to one value */
inline fill_transaction_begin_message(transaction_begin_message_record, transaction_begin_message_value) {
  transaction_begin_message_at = 0;
  do
  :: transaction_begin_message_at < 4 -> transaction_begin_message_record.time_offset[transaction_begin_message_at] = transaction_begin_message_value; transaction_begin_message_at = transaction_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Transaction Begin Message set to where it lies, so a field read out of place says so */
inline ramp_transaction_begin_message(transaction_begin_message_record, transaction_begin_message_base) {
  transaction_begin_message_at = 0;
  do
  :: transaction_begin_message_at < 4 -> transaction_begin_message_record.time_offset[transaction_begin_message_at] = (transaction_begin_message_base + 0 + transaction_begin_message_at + 1) % 256; transaction_begin_message_at = transaction_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* Transaction Begin Message to the wire, 4 bytes from where the cursor stands */
inline encode_transaction_begin_message(transaction_begin_message_record) {
  transaction_begin_message_at = 0;
  do
  :: transaction_begin_message_at < 4 -> wire[at] = transaction_begin_message_record.time_offset[transaction_begin_message_at]; at = at + 1; transaction_begin_message_at = transaction_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* Transaction Begin Message off the wire, 4 bytes from where the cursor stands */
inline decode_transaction_begin_message(transaction_begin_message_record) {
  transaction_begin_message_at = 0;
  do
  :: transaction_begin_message_at < 4 -> transaction_begin_message_record.time_offset[transaction_begin_message_at] = wire[at]; at = at + 1; transaction_begin_message_at = transaction_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Transaction Begin Message is what was written, byte for byte */
inline equal_transaction_begin_message(transaction_begin_message_read, transaction_begin_message_written) {
  transaction_begin_message_at = 0;
  do
  :: transaction_begin_message_at < 4 -> assert(transaction_begin_message_read.time_offset[transaction_begin_message_at] == transaction_begin_message_written.time_offset[transaction_begin_message_at]); transaction_begin_message_at = transaction_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Transaction End Message: 4 bytes ---------------------------------------- */

/* The Transaction End message indicates that a transaction indicated by a previous Transaction Begin message has completed */
typedef TransactionEndMessage {
  byte time_offset[4]
};

int transaction_end_message_at;

/* every byte of Transaction End Message set to one value */
inline fill_transaction_end_message(transaction_end_message_record, transaction_end_message_value) {
  transaction_end_message_at = 0;
  do
  :: transaction_end_message_at < 4 -> transaction_end_message_record.time_offset[transaction_end_message_at] = transaction_end_message_value; transaction_end_message_at = transaction_end_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Transaction End Message set to where it lies, so a field read out of place says so */
inline ramp_transaction_end_message(transaction_end_message_record, transaction_end_message_base) {
  transaction_end_message_at = 0;
  do
  :: transaction_end_message_at < 4 -> transaction_end_message_record.time_offset[transaction_end_message_at] = (transaction_end_message_base + 0 + transaction_end_message_at + 1) % 256; transaction_end_message_at = transaction_end_message_at + 1
  :: else -> break
  od;
  skip
}

/* Transaction End Message to the wire, 4 bytes from where the cursor stands */
inline encode_transaction_end_message(transaction_end_message_record) {
  transaction_end_message_at = 0;
  do
  :: transaction_end_message_at < 4 -> wire[at] = transaction_end_message_record.time_offset[transaction_end_message_at]; at = at + 1; transaction_end_message_at = transaction_end_message_at + 1
  :: else -> break
  od;
  skip
}

/* Transaction End Message off the wire, 4 bytes from where the cursor stands */
inline decode_transaction_end_message(transaction_end_message_record) {
  transaction_end_message_at = 0;
  do
  :: transaction_end_message_at < 4 -> transaction_end_message_record.time_offset[transaction_end_message_at] = wire[at]; at = at + 1; transaction_end_message_at = transaction_end_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Transaction End Message is what was written, byte for byte */
inline equal_transaction_end_message(transaction_end_message_read, transaction_end_message_written) {
  transaction_end_message_at = 0;
  do
  :: transaction_end_message_at < 4 -> assert(transaction_end_message_read.time_offset[transaction_end_message_at] == transaction_end_message_written.time_offset[transaction_end_message_at]); transaction_end_message_at = transaction_end_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Status Message: 14 bytes ---------------------------------------- */

/* The Trading Status message is used to indicate the current trading status of a complex instrument. */
typedef TradingStatusMessage {
  byte time_offset[4];
  byte symbol_short[6];
  byte trading_status;
  byte reserved_3[3]
};

int trading_status_message_at;

/* every byte of Trading Status Message set to one value */
inline fill_trading_status_message(trading_status_message_record, trading_status_message_value) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.time_offset[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> trading_status_message_record.symbol_short[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.trading_status = trading_status_message_value;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> trading_status_message_record.reserved_3[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Status Message set to where it lies, so a field read out of place says so */
inline ramp_trading_status_message(trading_status_message_record, trading_status_message_base) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.time_offset[trading_status_message_at] = (trading_status_message_base + 0 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> trading_status_message_record.symbol_short[trading_status_message_at] = (trading_status_message_base + 4 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.trading_status = (trading_status_message_base + 10 + 1) % 256;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> trading_status_message_record.reserved_3[trading_status_message_at] = (trading_status_message_base + 11 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Status Message to the wire, 14 bytes from where the cursor stands */
inline encode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> wire[at] = trading_status_message_record.time_offset[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> wire[at] = trading_status_message_record.symbol_short[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_status_message_record.trading_status; at = at + 1;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> wire[at] = trading_status_message_record.reserved_3[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Status Message off the wire, 14 bytes from where the cursor stands */
inline decode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.time_offset[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> trading_status_message_record.symbol_short[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.trading_status = wire[at]; at = at + 1;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> trading_status_message_record.reserved_3[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Status Message is what was written, byte for byte */
inline equal_trading_status_message(trading_status_message_read, trading_status_message_written) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> assert(trading_status_message_read.time_offset[trading_status_message_at] == trading_status_message_written.time_offset[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> assert(trading_status_message_read.symbol_short[trading_status_message_at] == trading_status_message_written.symbol_short[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  assert(trading_status_message_read.trading_status == trading_status_message_written.trading_status);
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> assert(trading_status_message_read.reserved_3[trading_status_message_at] == trading_status_message_written.reserved_3[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Statistics Message: 20 bytes -------------------------------------------- */

/* The Statistics Message is used to disseminate the statistics prices: opening, closing, high, low */
typedef StatisticsMessage {
  byte time_offset[4];
  byte symbol_short[6];
  byte price_long[8];
  byte statistic_type;
  byte price_determination
};

int statistics_message_at;

/* every byte of Statistics Message set to one value */
inline fill_statistics_message(statistics_message_record, statistics_message_value) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.time_offset[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 6 -> statistics_message_record.symbol_short[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.price_long[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_record.statistic_type = statistics_message_value;
  statistics_message_record.price_determination = statistics_message_value;
  skip
}

/* each byte of Statistics Message set to where it lies, so a field read out of place says so */
inline ramp_statistics_message(statistics_message_record, statistics_message_base) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.time_offset[statistics_message_at] = (statistics_message_base + 0 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 6 -> statistics_message_record.symbol_short[statistics_message_at] = (statistics_message_base + 4 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.price_long[statistics_message_at] = (statistics_message_base + 10 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_record.statistic_type = (statistics_message_base + 18 + 1) % 256;
  statistics_message_record.price_determination = (statistics_message_base + 19 + 1) % 256;
  skip
}

/* Statistics Message to the wire, 20 bytes from where the cursor stands */
inline encode_statistics_message(statistics_message_record) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.time_offset[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 6 -> wire[at] = statistics_message_record.symbol_short[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.price_long[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  wire[at] = statistics_message_record.statistic_type; at = at + 1;
  wire[at] = statistics_message_record.price_determination; at = at + 1;
  skip
}

/* Statistics Message off the wire, 20 bytes from where the cursor stands */
inline decode_statistics_message(statistics_message_record) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.time_offset[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 6 -> statistics_message_record.symbol_short[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.price_long[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_record.statistic_type = wire[at]; at = at + 1;
  statistics_message_record.price_determination = wire[at]; at = at + 1;
  skip
}

/* what was read of Statistics Message is what was written, byte for byte */
inline equal_statistics_message(statistics_message_read, statistics_message_written) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> assert(statistics_message_read.time_offset[statistics_message_at] == statistics_message_written.time_offset[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 6 -> assert(statistics_message_read.symbol_short[statistics_message_at] == statistics_message_written.symbol_short[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.price_long[statistics_message_at] == statistics_message_written.price_long[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  assert(statistics_message_read.statistic_type == statistics_message_written.statistic_type);
  assert(statistics_message_read.price_determination == statistics_message_written.price_determination);
  skip
}

/* ---- Auction Update Message: 33 bytes ---------------------------------------- */

/* Auction Update messages are used to disseminate indicative price and size information during auctions for Cboe auction eligible securities */
typedef AuctionUpdateMessage {
  byte time_offset[4];
  byte symbol_short[6];
  byte auction_type;
  byte reference_price[8];
  byte indicative_price[8];
  byte indicative_shares[4];
  byte outside_tolerance;
  byte includes_primary
};

int auction_update_message_at;

/* every byte of Auction Update Message set to one value */
inline fill_auction_update_message(auction_update_message_record, auction_update_message_value) {
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 4 -> auction_update_message_record.time_offset[auction_update_message_at] = auction_update_message_value; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 6 -> auction_update_message_record.symbol_short[auction_update_message_at] = auction_update_message_value; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_record.auction_type = auction_update_message_value;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> auction_update_message_record.reference_price[auction_update_message_at] = auction_update_message_value; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> auction_update_message_record.indicative_price[auction_update_message_at] = auction_update_message_value; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 4 -> auction_update_message_record.indicative_shares[auction_update_message_at] = auction_update_message_value; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_record.outside_tolerance = auction_update_message_value;
  auction_update_message_record.includes_primary = auction_update_message_value;
  skip
}

/* each byte of Auction Update Message set to where it lies, so a field read out of place says so */
inline ramp_auction_update_message(auction_update_message_record, auction_update_message_base) {
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 4 -> auction_update_message_record.time_offset[auction_update_message_at] = (auction_update_message_base + 0 + auction_update_message_at + 1) % 256; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 6 -> auction_update_message_record.symbol_short[auction_update_message_at] = (auction_update_message_base + 4 + auction_update_message_at + 1) % 256; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_record.auction_type = (auction_update_message_base + 10 + 1) % 256;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> auction_update_message_record.reference_price[auction_update_message_at] = (auction_update_message_base + 11 + auction_update_message_at + 1) % 256; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> auction_update_message_record.indicative_price[auction_update_message_at] = (auction_update_message_base + 19 + auction_update_message_at + 1) % 256; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 4 -> auction_update_message_record.indicative_shares[auction_update_message_at] = (auction_update_message_base + 27 + auction_update_message_at + 1) % 256; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_record.outside_tolerance = (auction_update_message_base + 31 + 1) % 256;
  auction_update_message_record.includes_primary = (auction_update_message_base + 32 + 1) % 256;
  skip
}

/* Auction Update Message to the wire, 33 bytes from where the cursor stands */
inline encode_auction_update_message(auction_update_message_record) {
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 4 -> wire[at] = auction_update_message_record.time_offset[auction_update_message_at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 6 -> wire[at] = auction_update_message_record.symbol_short[auction_update_message_at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_update_message_record.auction_type; at = at + 1;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> wire[at] = auction_update_message_record.reference_price[auction_update_message_at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> wire[at] = auction_update_message_record.indicative_price[auction_update_message_at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 4 -> wire[at] = auction_update_message_record.indicative_shares[auction_update_message_at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_update_message_record.outside_tolerance; at = at + 1;
  wire[at] = auction_update_message_record.includes_primary; at = at + 1;
  skip
}

/* Auction Update Message off the wire, 33 bytes from where the cursor stands */
inline decode_auction_update_message(auction_update_message_record) {
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 4 -> auction_update_message_record.time_offset[auction_update_message_at] = wire[at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 6 -> auction_update_message_record.symbol_short[auction_update_message_at] = wire[at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_record.auction_type = wire[at]; at = at + 1;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> auction_update_message_record.reference_price[auction_update_message_at] = wire[at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> auction_update_message_record.indicative_price[auction_update_message_at] = wire[at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 4 -> auction_update_message_record.indicative_shares[auction_update_message_at] = wire[at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_record.outside_tolerance = wire[at]; at = at + 1;
  auction_update_message_record.includes_primary = wire[at]; at = at + 1;
  skip
}

/* what was read of Auction Update Message is what was written, byte for byte */
inline equal_auction_update_message(auction_update_message_read, auction_update_message_written) {
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 4 -> assert(auction_update_message_read.time_offset[auction_update_message_at] == auction_update_message_written.time_offset[auction_update_message_at]); auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 6 -> assert(auction_update_message_read.symbol_short[auction_update_message_at] == auction_update_message_written.symbol_short[auction_update_message_at]); auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  assert(auction_update_message_read.auction_type == auction_update_message_written.auction_type);
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> assert(auction_update_message_read.reference_price[auction_update_message_at] == auction_update_message_written.reference_price[auction_update_message_at]); auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> assert(auction_update_message_read.indicative_price[auction_update_message_at] == auction_update_message_written.indicative_price[auction_update_message_at]); auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 4 -> assert(auction_update_message_read.indicative_shares[auction_update_message_at] == auction_update_message_written.indicative_shares[auction_update_message_at]); auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  assert(auction_update_message_read.outside_tolerance == auction_update_message_written.outside_tolerance);
  assert(auction_update_message_read.includes_primary == auction_update_message_written.includes_primary);
  skip
}

/* ---- Auction Summary Message: 23 bytes --------------------------------------- */

/* Auction Summary messages are used to disseminate the results of an auction in a Cboe auction eligible security */
typedef AuctionSummaryMessage {
  byte time_offset[4];
  byte symbol_short[6];
  byte auction_type;
  byte price_long[8];
  byte shares_long[4]
};

int auction_summary_message_at;

/* every byte of Auction Summary Message set to one value */
inline fill_auction_summary_message(auction_summary_message_record, auction_summary_message_value) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.time_offset[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 6 -> auction_summary_message_record.symbol_short[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.auction_type = auction_summary_message_value;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.price_long[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.shares_long[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Summary Message set to where it lies, so a field read out of place says so */
inline ramp_auction_summary_message(auction_summary_message_record, auction_summary_message_base) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.time_offset[auction_summary_message_at] = (auction_summary_message_base + 0 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 6 -> auction_summary_message_record.symbol_short[auction_summary_message_at] = (auction_summary_message_base + 4 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.auction_type = (auction_summary_message_base + 10 + 1) % 256;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.price_long[auction_summary_message_at] = (auction_summary_message_base + 11 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.shares_long[auction_summary_message_at] = (auction_summary_message_base + 19 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Summary Message to the wire, 23 bytes from where the cursor stands */
inline encode_auction_summary_message(auction_summary_message_record) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> wire[at] = auction_summary_message_record.time_offset[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 6 -> wire[at] = auction_summary_message_record.symbol_short[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_summary_message_record.auction_type; at = at + 1;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> wire[at] = auction_summary_message_record.price_long[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> wire[at] = auction_summary_message_record.shares_long[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Summary Message off the wire, 23 bytes from where the cursor stands */
inline decode_auction_summary_message(auction_summary_message_record) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.time_offset[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 6 -> auction_summary_message_record.symbol_short[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.auction_type = wire[at]; at = at + 1;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.price_long[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.shares_long[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Summary Message is what was written, byte for byte */
inline equal_auction_summary_message(auction_summary_message_read, auction_summary_message_written) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> assert(auction_summary_message_read.time_offset[auction_summary_message_at] == auction_summary_message_written.time_offset[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 6 -> assert(auction_summary_message_read.symbol_short[auction_summary_message_at] == auction_summary_message_written.symbol_short[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  assert(auction_summary_message_read.auction_type == auction_summary_message_written.auction_type);
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> assert(auction_summary_message_read.price_long[auction_summary_message_at] == auction_summary_message_written.price_long[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> assert(auction_summary_message_read.shares_long[auction_summary_message_at] == auction_summary_message_written.shares_long[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Index Quote Message: 27 bytes ------------------------------------------- */

/* Index Quote Messages are sent every second */
typedef IndexQuoteMessage {
  byte index_timestamp[8];
  byte index_ticker[10];
  byte index_price[8];
  byte index_status
};

int index_quote_message_at;

/* every byte of Index Quote Message set to one value */
inline fill_index_quote_message(index_quote_message_record, index_quote_message_value) {
  index_quote_message_at = 0;
  do
  :: index_quote_message_at < 8 -> index_quote_message_record.index_timestamp[index_quote_message_at] = index_quote_message_value; index_quote_message_at = index_quote_message_at + 1
  :: else -> break
  od;
  index_quote_message_at = 0;
  do
  :: index_quote_message_at < 10 -> index_quote_message_record.index_ticker[index_quote_message_at] = index_quote_message_value; index_quote_message_at = index_quote_message_at + 1
  :: else -> break
  od;
  index_quote_message_at = 0;
  do
  :: index_quote_message_at < 8 -> index_quote_message_record.index_price[index_quote_message_at] = index_quote_message_value; index_quote_message_at = index_quote_message_at + 1
  :: else -> break
  od;
  index_quote_message_record.index_status = index_quote_message_value;
  skip
}

/* each byte of Index Quote Message set to where it lies, so a field read out of place says so */
inline ramp_index_quote_message(index_quote_message_record, index_quote_message_base) {
  index_quote_message_at = 0;
  do
  :: index_quote_message_at < 8 -> index_quote_message_record.index_timestamp[index_quote_message_at] = (index_quote_message_base + 0 + index_quote_message_at + 1) % 256; index_quote_message_at = index_quote_message_at + 1
  :: else -> break
  od;
  index_quote_message_at = 0;
  do
  :: index_quote_message_at < 10 -> index_quote_message_record.index_ticker[index_quote_message_at] = (index_quote_message_base + 8 + index_quote_message_at + 1) % 256; index_quote_message_at = index_quote_message_at + 1
  :: else -> break
  od;
  index_quote_message_at = 0;
  do
  :: index_quote_message_at < 8 -> index_quote_message_record.index_price[index_quote_message_at] = (index_quote_message_base + 18 + index_quote_message_at + 1) % 256; index_quote_message_at = index_quote_message_at + 1
  :: else -> break
  od;
  index_quote_message_record.index_status = (index_quote_message_base + 26 + 1) % 256;
  skip
}

/* Index Quote Message to the wire, 27 bytes from where the cursor stands */
inline encode_index_quote_message(index_quote_message_record) {
  index_quote_message_at = 0;
  do
  :: index_quote_message_at < 8 -> wire[at] = index_quote_message_record.index_timestamp[index_quote_message_at]; at = at + 1; index_quote_message_at = index_quote_message_at + 1
  :: else -> break
  od;
  index_quote_message_at = 0;
  do
  :: index_quote_message_at < 10 -> wire[at] = index_quote_message_record.index_ticker[index_quote_message_at]; at = at + 1; index_quote_message_at = index_quote_message_at + 1
  :: else -> break
  od;
  index_quote_message_at = 0;
  do
  :: index_quote_message_at < 8 -> wire[at] = index_quote_message_record.index_price[index_quote_message_at]; at = at + 1; index_quote_message_at = index_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = index_quote_message_record.index_status; at = at + 1;
  skip
}

/* Index Quote Message off the wire, 27 bytes from where the cursor stands */
inline decode_index_quote_message(index_quote_message_record) {
  index_quote_message_at = 0;
  do
  :: index_quote_message_at < 8 -> index_quote_message_record.index_timestamp[index_quote_message_at] = wire[at]; at = at + 1; index_quote_message_at = index_quote_message_at + 1
  :: else -> break
  od;
  index_quote_message_at = 0;
  do
  :: index_quote_message_at < 10 -> index_quote_message_record.index_ticker[index_quote_message_at] = wire[at]; at = at + 1; index_quote_message_at = index_quote_message_at + 1
  :: else -> break
  od;
  index_quote_message_at = 0;
  do
  :: index_quote_message_at < 8 -> index_quote_message_record.index_price[index_quote_message_at] = wire[at]; at = at + 1; index_quote_message_at = index_quote_message_at + 1
  :: else -> break
  od;
  index_quote_message_record.index_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Index Quote Message is what was written, byte for byte */
inline equal_index_quote_message(index_quote_message_read, index_quote_message_written) {
  index_quote_message_at = 0;
  do
  :: index_quote_message_at < 8 -> assert(index_quote_message_read.index_timestamp[index_quote_message_at] == index_quote_message_written.index_timestamp[index_quote_message_at]); index_quote_message_at = index_quote_message_at + 1
  :: else -> break
  od;
  index_quote_message_at = 0;
  do
  :: index_quote_message_at < 10 -> assert(index_quote_message_read.index_ticker[index_quote_message_at] == index_quote_message_written.index_ticker[index_quote_message_at]); index_quote_message_at = index_quote_message_at + 1
  :: else -> break
  od;
  index_quote_message_at = 0;
  do
  :: index_quote_message_at < 8 -> assert(index_quote_message_read.index_price[index_quote_message_at] == index_quote_message_written.index_price[index_quote_message_at]); index_quote_message_at = index_quote_message_at + 1
  :: else -> break
  od;
  assert(index_quote_message_read.index_status == index_quote_message_written.index_status);
  skip
}

/* ---- Index Quote Edsp Message: 26 bytes -------------------------------------- */

/* Index Quote EDSP Messages are sent at end of day */
typedef IndexQuoteEdspMessage {
  byte index_timestamp[8];
  byte index_ticker[10];
  byte index_price[8]
};

int index_quote_edsp_message_at;

/* every byte of Index Quote Edsp Message set to one value */
inline fill_index_quote_edsp_message(index_quote_edsp_message_record, index_quote_edsp_message_value) {
  index_quote_edsp_message_at = 0;
  do
  :: index_quote_edsp_message_at < 8 -> index_quote_edsp_message_record.index_timestamp[index_quote_edsp_message_at] = index_quote_edsp_message_value; index_quote_edsp_message_at = index_quote_edsp_message_at + 1
  :: else -> break
  od;
  index_quote_edsp_message_at = 0;
  do
  :: index_quote_edsp_message_at < 10 -> index_quote_edsp_message_record.index_ticker[index_quote_edsp_message_at] = index_quote_edsp_message_value; index_quote_edsp_message_at = index_quote_edsp_message_at + 1
  :: else -> break
  od;
  index_quote_edsp_message_at = 0;
  do
  :: index_quote_edsp_message_at < 8 -> index_quote_edsp_message_record.index_price[index_quote_edsp_message_at] = index_quote_edsp_message_value; index_quote_edsp_message_at = index_quote_edsp_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Index Quote Edsp Message set to where it lies, so a field read out of place says so */
inline ramp_index_quote_edsp_message(index_quote_edsp_message_record, index_quote_edsp_message_base) {
  index_quote_edsp_message_at = 0;
  do
  :: index_quote_edsp_message_at < 8 -> index_quote_edsp_message_record.index_timestamp[index_quote_edsp_message_at] = (index_quote_edsp_message_base + 0 + index_quote_edsp_message_at + 1) % 256; index_quote_edsp_message_at = index_quote_edsp_message_at + 1
  :: else -> break
  od;
  index_quote_edsp_message_at = 0;
  do
  :: index_quote_edsp_message_at < 10 -> index_quote_edsp_message_record.index_ticker[index_quote_edsp_message_at] = (index_quote_edsp_message_base + 8 + index_quote_edsp_message_at + 1) % 256; index_quote_edsp_message_at = index_quote_edsp_message_at + 1
  :: else -> break
  od;
  index_quote_edsp_message_at = 0;
  do
  :: index_quote_edsp_message_at < 8 -> index_quote_edsp_message_record.index_price[index_quote_edsp_message_at] = (index_quote_edsp_message_base + 18 + index_quote_edsp_message_at + 1) % 256; index_quote_edsp_message_at = index_quote_edsp_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Quote Edsp Message to the wire, 26 bytes from where the cursor stands */
inline encode_index_quote_edsp_message(index_quote_edsp_message_record) {
  index_quote_edsp_message_at = 0;
  do
  :: index_quote_edsp_message_at < 8 -> wire[at] = index_quote_edsp_message_record.index_timestamp[index_quote_edsp_message_at]; at = at + 1; index_quote_edsp_message_at = index_quote_edsp_message_at + 1
  :: else -> break
  od;
  index_quote_edsp_message_at = 0;
  do
  :: index_quote_edsp_message_at < 10 -> wire[at] = index_quote_edsp_message_record.index_ticker[index_quote_edsp_message_at]; at = at + 1; index_quote_edsp_message_at = index_quote_edsp_message_at + 1
  :: else -> break
  od;
  index_quote_edsp_message_at = 0;
  do
  :: index_quote_edsp_message_at < 8 -> wire[at] = index_quote_edsp_message_record.index_price[index_quote_edsp_message_at]; at = at + 1; index_quote_edsp_message_at = index_quote_edsp_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Quote Edsp Message off the wire, 26 bytes from where the cursor stands */
inline decode_index_quote_edsp_message(index_quote_edsp_message_record) {
  index_quote_edsp_message_at = 0;
  do
  :: index_quote_edsp_message_at < 8 -> index_quote_edsp_message_record.index_timestamp[index_quote_edsp_message_at] = wire[at]; at = at + 1; index_quote_edsp_message_at = index_quote_edsp_message_at + 1
  :: else -> break
  od;
  index_quote_edsp_message_at = 0;
  do
  :: index_quote_edsp_message_at < 10 -> index_quote_edsp_message_record.index_ticker[index_quote_edsp_message_at] = wire[at]; at = at + 1; index_quote_edsp_message_at = index_quote_edsp_message_at + 1
  :: else -> break
  od;
  index_quote_edsp_message_at = 0;
  do
  :: index_quote_edsp_message_at < 8 -> index_quote_edsp_message_record.index_price[index_quote_edsp_message_at] = wire[at]; at = at + 1; index_quote_edsp_message_at = index_quote_edsp_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Index Quote Edsp Message is what was written, byte for byte */
inline equal_index_quote_edsp_message(index_quote_edsp_message_read, index_quote_edsp_message_written) {
  index_quote_edsp_message_at = 0;
  do
  :: index_quote_edsp_message_at < 8 -> assert(index_quote_edsp_message_read.index_timestamp[index_quote_edsp_message_at] == index_quote_edsp_message_written.index_timestamp[index_quote_edsp_message_at]); index_quote_edsp_message_at = index_quote_edsp_message_at + 1
  :: else -> break
  od;
  index_quote_edsp_message_at = 0;
  do
  :: index_quote_edsp_message_at < 10 -> assert(index_quote_edsp_message_read.index_ticker[index_quote_edsp_message_at] == index_quote_edsp_message_written.index_ticker[index_quote_edsp_message_at]); index_quote_edsp_message_at = index_quote_edsp_message_at + 1
  :: else -> break
  od;
  index_quote_edsp_message_at = 0;
  do
  :: index_quote_edsp_message_at < 8 -> assert(index_quote_edsp_message_read.index_price[index_quote_edsp_message_at] == index_quote_edsp_message_written.index_price[index_quote_edsp_message_at]); index_quote_edsp_message_at = index_quote_edsp_message_at + 1
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

/* Time Message: encoded, read back, and compared */
proctype check_time_message() {
  TimeMessage time_message_sent;
  TimeMessage time_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_time_message(time_message_sent, 0)
  :: pattern == 1 -> fill_time_message(time_message_sent, 32)
  :: pattern == 2 -> fill_time_message(time_message_sent, 255)
  :: else -> ramp_time_message(time_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_time_message(time_message_sent);
    assert(at == 4);
    at = 0;
    decode_time_message(time_message_got);
    assert(at == 4);
    equal_time_message(time_message_got, time_message_sent)
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

/* Add Order Long Message: encoded, read back, and compared */
proctype check_add_order_long_message() {
  AddOrderLongMessage add_order_long_message_sent;
  AddOrderLongMessage add_order_long_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_long_message(add_order_long_message_sent, 0)
  :: pattern == 1 -> fill_add_order_long_message(add_order_long_message_sent, 32)
  :: pattern == 2 -> fill_add_order_long_message(add_order_long_message_sent, 255)
  :: else -> ramp_add_order_long_message(add_order_long_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_long_message(add_order_long_message_sent);
    assert(at == 31);
    at = 0;
    decode_add_order_long_message(add_order_long_message_got);
    assert(at == 31);
    equal_add_order_long_message(add_order_long_message_got, add_order_long_message_sent)
  }
}

/* Add Order Short Message: encoded, read back, and compared */
proctype check_add_order_short_message() {
  AddOrderShortMessage add_order_short_message_sent;
  AddOrderShortMessage add_order_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_short_message(add_order_short_message_sent, 0)
  :: pattern == 1 -> fill_add_order_short_message(add_order_short_message_sent, 32)
  :: pattern == 2 -> fill_add_order_short_message(add_order_short_message_sent, 255)
  :: else -> ramp_add_order_short_message(add_order_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_short_message(add_order_short_message_sent);
    assert(at == 23);
    at = 0;
    decode_add_order_short_message(add_order_short_message_got);
    assert(at == 23);
    equal_add_order_short_message(add_order_short_message_got, add_order_short_message_sent)
  }
}

/* Execution Flags: encoded, read back, and compared */
proctype check_execution_flags() {
  ExecutionFlags execution_flags_sent;
  ExecutionFlags execution_flags_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_flags(execution_flags_sent, 0)
  :: pattern == 1 -> fill_execution_flags(execution_flags_sent, 32)
  :: pattern == 2 -> fill_execution_flags(execution_flags_sent, 255)
  :: else -> ramp_execution_flags(execution_flags_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_flags(execution_flags_sent);
    assert(at == 4);
    at = 0;
    decode_execution_flags(execution_flags_got);
    assert(at == 4);
    equal_execution_flags(execution_flags_got, execution_flags_sent)
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
    assert(at == 28);
    at = 0;
    decode_order_executed_message(order_executed_message_got);
    assert(at == 28);
    equal_order_executed_message(order_executed_message_got, order_executed_message_sent)
  }
}

/* Order Executed At Price Size Message: encoded, read back, and compared */
proctype check_order_executed_at_price_size_message() {
  OrderExecutedAtPriceSizeMessage order_executed_at_price_size_message_sent;
  OrderExecutedAtPriceSizeMessage order_executed_at_price_size_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_executed_at_price_size_message(order_executed_at_price_size_message_sent, 0)
  :: pattern == 1 -> fill_order_executed_at_price_size_message(order_executed_at_price_size_message_sent, 32)
  :: pattern == 2 -> fill_order_executed_at_price_size_message(order_executed_at_price_size_message_sent, 255)
  :: else -> ramp_order_executed_at_price_size_message(order_executed_at_price_size_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_executed_at_price_size_message(order_executed_at_price_size_message_sent);
    assert(at == 40);
    at = 0;
    decode_order_executed_at_price_size_message(order_executed_at_price_size_message_got);
    assert(at == 40);
    equal_order_executed_at_price_size_message(order_executed_at_price_size_message_got, order_executed_at_price_size_message_sent)
  }
}

/* Reduce Size Long Message: encoded, read back, and compared */
proctype check_reduce_size_long_message() {
  ReduceSizeLongMessage reduce_size_long_message_sent;
  ReduceSizeLongMessage reduce_size_long_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reduce_size_long_message(reduce_size_long_message_sent, 0)
  :: pattern == 1 -> fill_reduce_size_long_message(reduce_size_long_message_sent, 32)
  :: pattern == 2 -> fill_reduce_size_long_message(reduce_size_long_message_sent, 255)
  :: else -> ramp_reduce_size_long_message(reduce_size_long_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reduce_size_long_message(reduce_size_long_message_sent);
    assert(at == 16);
    at = 0;
    decode_reduce_size_long_message(reduce_size_long_message_got);
    assert(at == 16);
    equal_reduce_size_long_message(reduce_size_long_message_got, reduce_size_long_message_sent)
  }
}

/* Reduce Size Short Message: encoded, read back, and compared */
proctype check_reduce_size_short_message() {
  ReduceSizeShortMessage reduce_size_short_message_sent;
  ReduceSizeShortMessage reduce_size_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reduce_size_short_message(reduce_size_short_message_sent, 0)
  :: pattern == 1 -> fill_reduce_size_short_message(reduce_size_short_message_sent, 32)
  :: pattern == 2 -> fill_reduce_size_short_message(reduce_size_short_message_sent, 255)
  :: else -> ramp_reduce_size_short_message(reduce_size_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reduce_size_short_message(reduce_size_short_message_sent);
    assert(at == 14);
    at = 0;
    decode_reduce_size_short_message(reduce_size_short_message_got);
    assert(at == 14);
    equal_reduce_size_short_message(reduce_size_short_message_got, reduce_size_short_message_sent)
  }
}

/* Modify Order Long Message: encoded, read back, and compared */
proctype check_modify_order_long_message() {
  ModifyOrderLongMessage modify_order_long_message_sent;
  ModifyOrderLongMessage modify_order_long_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_order_long_message(modify_order_long_message_sent, 0)
  :: pattern == 1 -> fill_modify_order_long_message(modify_order_long_message_sent, 32)
  :: pattern == 2 -> fill_modify_order_long_message(modify_order_long_message_sent, 255)
  :: else -> ramp_modify_order_long_message(modify_order_long_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_order_long_message(modify_order_long_message_sent);
    assert(at == 24);
    at = 0;
    decode_modify_order_long_message(modify_order_long_message_got);
    assert(at == 24);
    equal_modify_order_long_message(modify_order_long_message_got, modify_order_long_message_sent)
  }
}

/* Modify Order Short Message: encoded, read back, and compared */
proctype check_modify_order_short_message() {
  ModifyOrderShortMessage modify_order_short_message_sent;
  ModifyOrderShortMessage modify_order_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_order_short_message(modify_order_short_message_sent, 0)
  :: pattern == 1 -> fill_modify_order_short_message(modify_order_short_message_sent, 32)
  :: pattern == 2 -> fill_modify_order_short_message(modify_order_short_message_sent, 255)
  :: else -> ramp_modify_order_short_message(modify_order_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_order_short_message(modify_order_short_message_sent);
    assert(at == 16);
    at = 0;
    decode_modify_order_short_message(modify_order_short_message_got);
    assert(at == 16);
    equal_modify_order_short_message(modify_order_short_message_got, modify_order_short_message_sent)
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
    assert(at == 12);
    at = 0;
    decode_delete_order_message(delete_order_message_got);
    assert(at == 12);
    equal_delete_order_message(delete_order_message_got, delete_order_message_sent)
  }
}

/* Trade Flags: encoded, read back, and compared */
proctype check_trade_flags() {
  TradeFlags trade_flags_sent;
  TradeFlags trade_flags_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_flags(trade_flags_sent, 0)
  :: pattern == 1 -> fill_trade_flags(trade_flags_sent, 32)
  :: pattern == 2 -> fill_trade_flags(trade_flags_sent, 255)
  :: else -> ramp_trade_flags(trade_flags_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_flags(trade_flags_sent);
    assert(at == 5);
    at = 0;
    decode_trade_flags(trade_flags_got);
    assert(at == 5);
    equal_trade_flags(trade_flags_got, trade_flags_sent)
  }
}

/* Trade Long Message: encoded, read back, and compared */
proctype check_trade_long_message() {
  TradeLongMessage trade_long_message_sent;
  TradeLongMessage trade_long_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_long_message(trade_long_message_sent, 0)
  :: pattern == 1 -> fill_trade_long_message(trade_long_message_sent, 32)
  :: pattern == 2 -> fill_trade_long_message(trade_long_message_sent, 255)
  :: else -> ramp_trade_long_message(trade_long_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_long_message(trade_long_message_sent);
    assert(at == 44);
    at = 0;
    decode_trade_long_message(trade_long_message_got);
    assert(at == 44);
    equal_trade_long_message(trade_long_message_got, trade_long_message_sent)
  }
}

/* Trade Short Message: encoded, read back, and compared */
proctype check_trade_short_message() {
  TradeShortMessage trade_short_message_sent;
  TradeShortMessage trade_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_short_message(trade_short_message_sent, 0)
  :: pattern == 1 -> fill_trade_short_message(trade_short_message_sent, 32)
  :: pattern == 2 -> fill_trade_short_message(trade_short_message_sent, 255)
  :: else -> ramp_trade_short_message(trade_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_short_message(trade_short_message_sent);
    assert(at == 36);
    at = 0;
    decode_trade_short_message(trade_short_message_got);
    assert(at == 36);
    equal_trade_short_message(trade_short_message_got, trade_short_message_sent)
  }
}

/* Extended Trade Flags: encoded, read back, and compared */
proctype check_extended_trade_flags() {
  ExtendedTradeFlags extended_trade_flags_sent;
  ExtendedTradeFlags extended_trade_flags_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_extended_trade_flags(extended_trade_flags_sent, 0)
  :: pattern == 1 -> fill_extended_trade_flags(extended_trade_flags_sent, 32)
  :: pattern == 2 -> fill_extended_trade_flags(extended_trade_flags_sent, 255)
  :: else -> ramp_extended_trade_flags(extended_trade_flags_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_extended_trade_flags(extended_trade_flags_sent);
    assert(at == 14);
    at = 0;
    decode_extended_trade_flags(extended_trade_flags_got);
    assert(at == 14);
    equal_extended_trade_flags(extended_trade_flags_got, extended_trade_flags_sent)
  }
}

/* Trade Extended Message: encoded, read back, and compared */
proctype check_trade_extended_message() {
  TradeExtendedMessage trade_extended_message_sent;
  TradeExtendedMessage trade_extended_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_extended_message(trade_extended_message_sent, 0)
  :: pattern == 1 -> fill_trade_extended_message(trade_extended_message_sent, 32)
  :: pattern == 2 -> fill_trade_extended_message(trade_extended_message_sent, 255)
  :: else -> ramp_trade_extended_message(trade_extended_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_extended_message(trade_extended_message_sent);
    assert(at == 64);
    at = 0;
    decode_trade_extended_message(trade_extended_message_got);
    assert(at == 64);
    equal_trade_extended_message(trade_extended_message_got, trade_extended_message_sent)
  }
}

/* Trade Unknown Symbol Message: encoded, read back, and compared */
proctype check_trade_unknown_symbol_message() {
  TradeUnknownSymbolMessage trade_unknown_symbol_message_sent;
  TradeUnknownSymbolMessage trade_unknown_symbol_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_unknown_symbol_message(trade_unknown_symbol_message_sent, 0)
  :: pattern == 1 -> fill_trade_unknown_symbol_message(trade_unknown_symbol_message_sent, 32)
  :: pattern == 2 -> fill_trade_unknown_symbol_message(trade_unknown_symbol_message_sent, 255)
  :: else -> ramp_trade_unknown_symbol_message(trade_unknown_symbol_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_unknown_symbol_message(trade_unknown_symbol_message_sent);
    assert(at == 70);
    at = 0;
    decode_trade_unknown_symbol_message(trade_unknown_symbol_message_got);
    assert(at == 70);
    equal_trade_unknown_symbol_message(trade_unknown_symbol_message_got, trade_unknown_symbol_message_sent)
  }
}

/* End Of Session: encoded, read back, and compared */
proctype check_end_of_session() {
  EndOfSession end_of_session_sent;
  EndOfSession end_of_session_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_session(end_of_session_sent, 0)
  :: pattern == 1 -> fill_end_of_session(end_of_session_sent, 32)
  :: pattern == 2 -> fill_end_of_session(end_of_session_sent, 255)
  :: else -> ramp_end_of_session(end_of_session_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_session(end_of_session_sent);
    assert(at == 4);
    at = 0;
    decode_end_of_session(end_of_session_got);
    assert(at == 4);
    equal_end_of_session(end_of_session_got, end_of_session_sent)
  }
}

/* Transaction Begin Message: encoded, read back, and compared */
proctype check_transaction_begin_message() {
  TransactionBeginMessage transaction_begin_message_sent;
  TransactionBeginMessage transaction_begin_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_transaction_begin_message(transaction_begin_message_sent, 0)
  :: pattern == 1 -> fill_transaction_begin_message(transaction_begin_message_sent, 32)
  :: pattern == 2 -> fill_transaction_begin_message(transaction_begin_message_sent, 255)
  :: else -> ramp_transaction_begin_message(transaction_begin_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_transaction_begin_message(transaction_begin_message_sent);
    assert(at == 4);
    at = 0;
    decode_transaction_begin_message(transaction_begin_message_got);
    assert(at == 4);
    equal_transaction_begin_message(transaction_begin_message_got, transaction_begin_message_sent)
  }
}

/* Transaction End Message: encoded, read back, and compared */
proctype check_transaction_end_message() {
  TransactionEndMessage transaction_end_message_sent;
  TransactionEndMessage transaction_end_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_transaction_end_message(transaction_end_message_sent, 0)
  :: pattern == 1 -> fill_transaction_end_message(transaction_end_message_sent, 32)
  :: pattern == 2 -> fill_transaction_end_message(transaction_end_message_sent, 255)
  :: else -> ramp_transaction_end_message(transaction_end_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_transaction_end_message(transaction_end_message_sent);
    assert(at == 4);
    at = 0;
    decode_transaction_end_message(transaction_end_message_got);
    assert(at == 4);
    equal_transaction_end_message(transaction_end_message_got, transaction_end_message_sent)
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
    assert(at == 14);
    at = 0;
    decode_trading_status_message(trading_status_message_got);
    assert(at == 14);
    equal_trading_status_message(trading_status_message_got, trading_status_message_sent)
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
    assert(at == 20);
    at = 0;
    decode_statistics_message(statistics_message_got);
    assert(at == 20);
    equal_statistics_message(statistics_message_got, statistics_message_sent)
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
    assert(at == 33);
    at = 0;
    decode_auction_update_message(auction_update_message_got);
    assert(at == 33);
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
    assert(at == 23);
    at = 0;
    decode_auction_summary_message(auction_summary_message_got);
    assert(at == 23);
    equal_auction_summary_message(auction_summary_message_got, auction_summary_message_sent)
  }
}

/* Index Quote Message: encoded, read back, and compared */
proctype check_index_quote_message() {
  IndexQuoteMessage index_quote_message_sent;
  IndexQuoteMessage index_quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_quote_message(index_quote_message_sent, 0)
  :: pattern == 1 -> fill_index_quote_message(index_quote_message_sent, 32)
  :: pattern == 2 -> fill_index_quote_message(index_quote_message_sent, 255)
  :: else -> ramp_index_quote_message(index_quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_quote_message(index_quote_message_sent);
    assert(at == 27);
    at = 0;
    decode_index_quote_message(index_quote_message_got);
    assert(at == 27);
    equal_index_quote_message(index_quote_message_got, index_quote_message_sent)
  }
}

/* Index Quote Edsp Message: encoded, read back, and compared */
proctype check_index_quote_edsp_message() {
  IndexQuoteEdspMessage index_quote_edsp_message_sent;
  IndexQuoteEdspMessage index_quote_edsp_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_quote_edsp_message(index_quote_edsp_message_sent, 0)
  :: pattern == 1 -> fill_index_quote_edsp_message(index_quote_edsp_message_sent, 32)
  :: pattern == 2 -> fill_index_quote_edsp_message(index_quote_edsp_message_sent, 255)
  :: else -> ramp_index_quote_edsp_message(index_quote_edsp_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_quote_edsp_message(index_quote_edsp_message_sent);
    assert(at == 26);
    at = 0;
    decode_index_quote_edsp_message(index_quote_edsp_message_got);
    assert(at == 26);
    equal_index_quote_edsp_message(index_quote_edsp_message_got, index_quote_edsp_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_time_message()
  :: run check_unit_clear_message()
  :: run check_add_order_long_message()
  :: run check_add_order_short_message()
  :: run check_execution_flags()
  :: run check_order_executed_message()
  :: run check_order_executed_at_price_size_message()
  :: run check_reduce_size_long_message()
  :: run check_reduce_size_short_message()
  :: run check_modify_order_long_message()
  :: run check_modify_order_short_message()
  :: run check_delete_order_message()
  :: run check_trade_flags()
  :: run check_trade_long_message()
  :: run check_trade_short_message()
  :: run check_extended_trade_flags()
  :: run check_trade_extended_message()
  :: run check_trade_unknown_symbol_message()
  :: run check_end_of_session()
  :: run check_transaction_begin_message()
  :: run check_transaction_end_message()
  :: run check_trading_status_message()
  :: run check_statistics_message()
  :: run check_auction_update_message()
  :: run check_auction_summary_message()
  :: run check_index_quote_message()
  :: run check_index_quote_edsp_message()
  fi
}
