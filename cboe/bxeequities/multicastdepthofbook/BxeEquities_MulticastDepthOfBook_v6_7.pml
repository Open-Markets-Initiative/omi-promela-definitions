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
#define WIRE 62

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

/* Time */
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

/* Unit Clear */
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

/* ---- Add Order Long Message: 33 bytes ---------------------------------------- */

/* Add Order — Long */
typedef AddOrderLongMessage {
  byte time_offset[4];
  byte order_id[8];
  byte side_indicator;
  byte quantity_long[4];
  byte symbol_short[8];
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
  :: add_order_long_message_at < 4 -> add_order_long_message_record.quantity_long[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> add_order_long_message_record.symbol_short[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
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
  :: add_order_long_message_at < 4 -> add_order_long_message_record.quantity_long[add_order_long_message_at] = (add_order_long_message_base + 13 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> add_order_long_message_record.symbol_short[add_order_long_message_at] = (add_order_long_message_base + 17 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> add_order_long_message_record.price_long[add_order_long_message_at] = (add_order_long_message_base + 25 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Long Message to the wire, 33 bytes from where the cursor stands */
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
  :: add_order_long_message_at < 4 -> wire[at] = add_order_long_message_record.quantity_long[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> wire[at] = add_order_long_message_record.symbol_short[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> wire[at] = add_order_long_message_record.price_long[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Long Message off the wire, 33 bytes from where the cursor stands */
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
  :: add_order_long_message_at < 4 -> add_order_long_message_record.quantity_long[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> add_order_long_message_record.symbol_short[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
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
  :: add_order_long_message_at < 4 -> assert(add_order_long_message_read.quantity_long[add_order_long_message_at] == add_order_long_message_written.quantity_long[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> assert(add_order_long_message_read.symbol_short[add_order_long_message_at] == add_order_long_message_written.symbol_short[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
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

/* Add Order — Short */
typedef AddOrderShortMessage {
  byte time_offset[4];
  byte order_id[8];
  byte side_indicator;
  byte quantity_short[2];
  byte symbol_alphanumeric_6[6];
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
  :: add_order_short_message_at < 6 -> add_order_short_message_record.symbol_alphanumeric_6[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
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
  :: add_order_short_message_at < 6 -> add_order_short_message_record.symbol_alphanumeric_6[add_order_short_message_at] = (add_order_short_message_base + 15 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
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
  :: add_order_short_message_at < 6 -> wire[at] = add_order_short_message_record.symbol_alphanumeric_6[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
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
  :: add_order_short_message_at < 6 -> add_order_short_message_record.symbol_alphanumeric_6[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
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
  :: add_order_short_message_at < 6 -> assert(add_order_short_message_read.symbol_alphanumeric_6[add_order_short_message_at] == add_order_short_message_written.symbol_alphanumeric_6[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> assert(add_order_short_message_read.price_short[add_order_short_message_at] == add_order_short_message_written.price_short[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Execution Flags: 3 bytes ------------------------------------------------ */

/* Execution Flags */
typedef ExecutionFlags {
  byte market_mechanism;
  byte trading_mode;
  byte ex_cum_dividend
};

/* every byte of Execution Flags set to one value */
inline fill_execution_flags(execution_flags_record, execution_flags_value) {
  execution_flags_record.market_mechanism = execution_flags_value;
  execution_flags_record.trading_mode = execution_flags_value;
  execution_flags_record.ex_cum_dividend = execution_flags_value;
  skip
}

/* each byte of Execution Flags set to where it lies, so a field read out of place says so */
inline ramp_execution_flags(execution_flags_record, execution_flags_base) {
  execution_flags_record.market_mechanism = (execution_flags_base + 0 + 1) % 256;
  execution_flags_record.trading_mode = (execution_flags_base + 1 + 1) % 256;
  execution_flags_record.ex_cum_dividend = (execution_flags_base + 2 + 1) % 256;
  skip
}

/* Execution Flags to the wire, 3 bytes from where the cursor stands */
inline encode_execution_flags(execution_flags_record) {
  wire[at] = execution_flags_record.market_mechanism; at = at + 1;
  wire[at] = execution_flags_record.trading_mode; at = at + 1;
  wire[at] = execution_flags_record.ex_cum_dividend; at = at + 1;
  skip
}

/* Execution Flags off the wire, 3 bytes from where the cursor stands */
inline decode_execution_flags(execution_flags_record) {
  execution_flags_record.market_mechanism = wire[at]; at = at + 1;
  execution_flags_record.trading_mode = wire[at]; at = at + 1;
  execution_flags_record.ex_cum_dividend = wire[at]; at = at + 1;
  skip
}

/* what was read of Execution Flags is what was written, byte for byte */
inline equal_execution_flags(execution_flags_read, execution_flags_written) {
  assert(execution_flags_read.market_mechanism == execution_flags_written.market_mechanism);
  assert(execution_flags_read.trading_mode == execution_flags_written.trading_mode);
  assert(execution_flags_read.ex_cum_dividend == execution_flags_written.ex_cum_dividend);
  skip
}

/* ---- Order Executed Message: 27 bytes ---------------------------------------- */

/* Order Executed */
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

/* Order Executed Message to the wire, 27 bytes from where the cursor stands */
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

/* Order Executed Message off the wire, 27 bytes from where the cursor stands */
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

/* ---- Order Executed At Price Size Message: 39 bytes -------------------------- */

/* Order Executed at Price/Size */
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

/* Order Executed At Price Size Message to the wire, 39 bytes from where the cursor stands */
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

/* Order Executed At Price Size Message off the wire, 39 bytes from where the cursor stands */
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

/* Reduce Size — Long */
typedef ReduceSizeLongMessage {
  byte time_offset[4];
  byte order_id[8];
  byte cancelled_shares_long[4]
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
  :: reduce_size_long_message_at < 4 -> reduce_size_long_message_record.cancelled_shares_long[reduce_size_long_message_at] = reduce_size_long_message_value; reduce_size_long_message_at = reduce_size_long_message_at + 1
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
  :: reduce_size_long_message_at < 4 -> reduce_size_long_message_record.cancelled_shares_long[reduce_size_long_message_at] = (reduce_size_long_message_base + 12 + reduce_size_long_message_at + 1) % 256; reduce_size_long_message_at = reduce_size_long_message_at + 1
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
  :: reduce_size_long_message_at < 4 -> wire[at] = reduce_size_long_message_record.cancelled_shares_long[reduce_size_long_message_at]; at = at + 1; reduce_size_long_message_at = reduce_size_long_message_at + 1
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
  :: reduce_size_long_message_at < 4 -> reduce_size_long_message_record.cancelled_shares_long[reduce_size_long_message_at] = wire[at]; at = at + 1; reduce_size_long_message_at = reduce_size_long_message_at + 1
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
  :: reduce_size_long_message_at < 4 -> assert(reduce_size_long_message_read.cancelled_shares_long[reduce_size_long_message_at] == reduce_size_long_message_written.cancelled_shares_long[reduce_size_long_message_at]); reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reduce Size Short Message: 14 bytes ------------------------------------- */

/* Reduce Size — Short */
typedef ReduceSizeShortMessage {
  byte time_offset[4];
  byte order_id[8];
  byte cancelled_shares_short[2]
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
  :: reduce_size_short_message_at < 2 -> reduce_size_short_message_record.cancelled_shares_short[reduce_size_short_message_at] = reduce_size_short_message_value; reduce_size_short_message_at = reduce_size_short_message_at + 1
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
  :: reduce_size_short_message_at < 2 -> reduce_size_short_message_record.cancelled_shares_short[reduce_size_short_message_at] = (reduce_size_short_message_base + 12 + reduce_size_short_message_at + 1) % 256; reduce_size_short_message_at = reduce_size_short_message_at + 1
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
  :: reduce_size_short_message_at < 2 -> wire[at] = reduce_size_short_message_record.cancelled_shares_short[reduce_size_short_message_at]; at = at + 1; reduce_size_short_message_at = reduce_size_short_message_at + 1
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
  :: reduce_size_short_message_at < 2 -> reduce_size_short_message_record.cancelled_shares_short[reduce_size_short_message_at] = wire[at]; at = at + 1; reduce_size_short_message_at = reduce_size_short_message_at + 1
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
  :: reduce_size_short_message_at < 2 -> assert(reduce_size_short_message_read.cancelled_shares_short[reduce_size_short_message_at] == reduce_size_short_message_written.cancelled_shares_short[reduce_size_short_message_at]); reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Order Long Message: 24 bytes ------------------------------------- */

/* Modify Order — Long */
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

/* Modify Order — Short */
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

/* Delete Order */
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

/* ---- Trade Flags: 4 bytes ---------------------------------------------------- */

/* Trade Flags */
typedef TradeFlags {
  byte market_mechanism;
  byte trading_mode;
  byte transaction_category;
  byte ex_cum_dividend
};

/* every byte of Trade Flags set to one value */
inline fill_trade_flags(trade_flags_record, trade_flags_value) {
  trade_flags_record.market_mechanism = trade_flags_value;
  trade_flags_record.trading_mode = trade_flags_value;
  trade_flags_record.transaction_category = trade_flags_value;
  trade_flags_record.ex_cum_dividend = trade_flags_value;
  skip
}

/* each byte of Trade Flags set to where it lies, so a field read out of place says so */
inline ramp_trade_flags(trade_flags_record, trade_flags_base) {
  trade_flags_record.market_mechanism = (trade_flags_base + 0 + 1) % 256;
  trade_flags_record.trading_mode = (trade_flags_base + 1 + 1) % 256;
  trade_flags_record.transaction_category = (trade_flags_base + 2 + 1) % 256;
  trade_flags_record.ex_cum_dividend = (trade_flags_base + 3 + 1) % 256;
  skip
}

/* Trade Flags to the wire, 4 bytes from where the cursor stands */
inline encode_trade_flags(trade_flags_record) {
  wire[at] = trade_flags_record.market_mechanism; at = at + 1;
  wire[at] = trade_flags_record.trading_mode; at = at + 1;
  wire[at] = trade_flags_record.transaction_category; at = at + 1;
  wire[at] = trade_flags_record.ex_cum_dividend; at = at + 1;
  skip
}

/* Trade Flags off the wire, 4 bytes from where the cursor stands */
inline decode_trade_flags(trade_flags_record) {
  trade_flags_record.market_mechanism = wire[at]; at = at + 1;
  trade_flags_record.trading_mode = wire[at]; at = at + 1;
  trade_flags_record.transaction_category = wire[at]; at = at + 1;
  trade_flags_record.ex_cum_dividend = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Flags is what was written, byte for byte */
inline equal_trade_flags(trade_flags_read, trade_flags_written) {
  assert(trade_flags_read.market_mechanism == trade_flags_written.market_mechanism);
  assert(trade_flags_read.trading_mode == trade_flags_written.trading_mode);
  assert(trade_flags_read.transaction_category == trade_flags_written.transaction_category);
  assert(trade_flags_read.ex_cum_dividend == trade_flags_written.ex_cum_dividend);
  skip
}

/* ---- Trade Long Message: 45 bytes -------------------------------------------- */

/* Trade — Long */
typedef TradeLongMessage {
  byte time_offset[4];
  byte order_id[8];
  byte side_indicator;
  byte shares_long[4];
  byte symbol_short[8];
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
  :: trade_long_message_at < 8 -> trade_long_message_record.symbol_short[trade_long_message_at] = trade_long_message_value; trade_long_message_at = trade_long_message_at + 1
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
  :: trade_long_message_at < 8 -> trade_long_message_record.symbol_short[trade_long_message_at] = (trade_long_message_base + 17 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.price_long[trade_long_message_at] = (trade_long_message_base + 25 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.execution_id[trade_long_message_at] = (trade_long_message_base + 33 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  ramp_trade_flags(trade_long_message_record.trade_flags, trade_long_message_base + 41);
  skip
}

/* Trade Long Message to the wire, 45 bytes from where the cursor stands */
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
  :: trade_long_message_at < 8 -> wire[at] = trade_long_message_record.symbol_short[trade_long_message_at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
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

/* Trade Long Message off the wire, 45 bytes from where the cursor stands */
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
  :: trade_long_message_at < 8 -> trade_long_message_record.symbol_short[trade_long_message_at] = wire[at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
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
  :: trade_long_message_at < 8 -> assert(trade_long_message_read.symbol_short[trade_long_message_at] == trade_long_message_written.symbol_short[trade_long_message_at]); trade_long_message_at = trade_long_message_at + 1
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

/* ---- Trade Short Message: 35 bytes ------------------------------------------- */

/* Trade — Short */
typedef TradeShortMessage {
  byte time_offset[4];
  byte order_id[8];
  byte side_indicator;
  byte shares_short[2];
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
  :: trade_short_message_at < 2 -> trade_short_message_record.shares_short[trade_short_message_at] = trade_short_message_value; trade_short_message_at = trade_short_message_at + 1
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
  :: trade_short_message_at < 2 -> trade_short_message_record.shares_short[trade_short_message_at] = (trade_short_message_base + 13 + trade_short_message_at + 1) % 256; trade_short_message_at = trade_short_message_at + 1
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

/* Trade Short Message to the wire, 35 bytes from where the cursor stands */
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
  :: trade_short_message_at < 2 -> wire[at] = trade_short_message_record.shares_short[trade_short_message_at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
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

/* Trade Short Message off the wire, 35 bytes from where the cursor stands */
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
  :: trade_short_message_at < 2 -> trade_short_message_record.shares_short[trade_short_message_at] = wire[at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
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
  :: trade_short_message_at < 2 -> assert(trade_short_message_read.shares_short[trade_short_message_at] == trade_short_message_written.shares_short[trade_short_message_at]); trade_short_message_at = trade_short_message_at + 1
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

/* ---- Extended Trade Flags: 11 bytes ------------------------------------------ */

/* Extended Trade Flags */
typedef ExtendedTradeFlags {
  byte bats_trade_timing_indicator;
  byte market_mechanism;
  byte trading_mode;
  byte transaction_category;
  byte negotiated_trade;
  byte crossing_trade;
  byte modification_indicator;
  byte benchmark_indicator;
  byte ex_cum_dividend;
  byte publication_mode;
  byte off_book_automated_indicator
};

/* every byte of Extended Trade Flags set to one value */
inline fill_extended_trade_flags(extended_trade_flags_record, extended_trade_flags_value) {
  extended_trade_flags_record.bats_trade_timing_indicator = extended_trade_flags_value;
  extended_trade_flags_record.market_mechanism = extended_trade_flags_value;
  extended_trade_flags_record.trading_mode = extended_trade_flags_value;
  extended_trade_flags_record.transaction_category = extended_trade_flags_value;
  extended_trade_flags_record.negotiated_trade = extended_trade_flags_value;
  extended_trade_flags_record.crossing_trade = extended_trade_flags_value;
  extended_trade_flags_record.modification_indicator = extended_trade_flags_value;
  extended_trade_flags_record.benchmark_indicator = extended_trade_flags_value;
  extended_trade_flags_record.ex_cum_dividend = extended_trade_flags_value;
  extended_trade_flags_record.publication_mode = extended_trade_flags_value;
  extended_trade_flags_record.off_book_automated_indicator = extended_trade_flags_value;
  skip
}

/* each byte of Extended Trade Flags set to where it lies, so a field read out of place says so */
inline ramp_extended_trade_flags(extended_trade_flags_record, extended_trade_flags_base) {
  extended_trade_flags_record.bats_trade_timing_indicator = (extended_trade_flags_base + 0 + 1) % 256;
  extended_trade_flags_record.market_mechanism = (extended_trade_flags_base + 1 + 1) % 256;
  extended_trade_flags_record.trading_mode = (extended_trade_flags_base + 2 + 1) % 256;
  extended_trade_flags_record.transaction_category = (extended_trade_flags_base + 3 + 1) % 256;
  extended_trade_flags_record.negotiated_trade = (extended_trade_flags_base + 4 + 1) % 256;
  extended_trade_flags_record.crossing_trade = (extended_trade_flags_base + 5 + 1) % 256;
  extended_trade_flags_record.modification_indicator = (extended_trade_flags_base + 6 + 1) % 256;
  extended_trade_flags_record.benchmark_indicator = (extended_trade_flags_base + 7 + 1) % 256;
  extended_trade_flags_record.ex_cum_dividend = (extended_trade_flags_base + 8 + 1) % 256;
  extended_trade_flags_record.publication_mode = (extended_trade_flags_base + 9 + 1) % 256;
  extended_trade_flags_record.off_book_automated_indicator = (extended_trade_flags_base + 10 + 1) % 256;
  skip
}

/* Extended Trade Flags to the wire, 11 bytes from where the cursor stands */
inline encode_extended_trade_flags(extended_trade_flags_record) {
  wire[at] = extended_trade_flags_record.bats_trade_timing_indicator; at = at + 1;
  wire[at] = extended_trade_flags_record.market_mechanism; at = at + 1;
  wire[at] = extended_trade_flags_record.trading_mode; at = at + 1;
  wire[at] = extended_trade_flags_record.transaction_category; at = at + 1;
  wire[at] = extended_trade_flags_record.negotiated_trade; at = at + 1;
  wire[at] = extended_trade_flags_record.crossing_trade; at = at + 1;
  wire[at] = extended_trade_flags_record.modification_indicator; at = at + 1;
  wire[at] = extended_trade_flags_record.benchmark_indicator; at = at + 1;
  wire[at] = extended_trade_flags_record.ex_cum_dividend; at = at + 1;
  wire[at] = extended_trade_flags_record.publication_mode; at = at + 1;
  wire[at] = extended_trade_flags_record.off_book_automated_indicator; at = at + 1;
  skip
}

/* Extended Trade Flags off the wire, 11 bytes from where the cursor stands */
inline decode_extended_trade_flags(extended_trade_flags_record) {
  extended_trade_flags_record.bats_trade_timing_indicator = wire[at]; at = at + 1;
  extended_trade_flags_record.market_mechanism = wire[at]; at = at + 1;
  extended_trade_flags_record.trading_mode = wire[at]; at = at + 1;
  extended_trade_flags_record.transaction_category = wire[at]; at = at + 1;
  extended_trade_flags_record.negotiated_trade = wire[at]; at = at + 1;
  extended_trade_flags_record.crossing_trade = wire[at]; at = at + 1;
  extended_trade_flags_record.modification_indicator = wire[at]; at = at + 1;
  extended_trade_flags_record.benchmark_indicator = wire[at]; at = at + 1;
  extended_trade_flags_record.ex_cum_dividend = wire[at]; at = at + 1;
  extended_trade_flags_record.publication_mode = wire[at]; at = at + 1;
  extended_trade_flags_record.off_book_automated_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Extended Trade Flags is what was written, byte for byte */
inline equal_extended_trade_flags(extended_trade_flags_read, extended_trade_flags_written) {
  assert(extended_trade_flags_read.bats_trade_timing_indicator == extended_trade_flags_written.bats_trade_timing_indicator);
  assert(extended_trade_flags_read.market_mechanism == extended_trade_flags_written.market_mechanism);
  assert(extended_trade_flags_read.trading_mode == extended_trade_flags_written.trading_mode);
  assert(extended_trade_flags_read.transaction_category == extended_trade_flags_written.transaction_category);
  assert(extended_trade_flags_read.negotiated_trade == extended_trade_flags_written.negotiated_trade);
  assert(extended_trade_flags_read.crossing_trade == extended_trade_flags_written.crossing_trade);
  assert(extended_trade_flags_read.modification_indicator == extended_trade_flags_written.modification_indicator);
  assert(extended_trade_flags_read.benchmark_indicator == extended_trade_flags_written.benchmark_indicator);
  assert(extended_trade_flags_read.ex_cum_dividend == extended_trade_flags_written.ex_cum_dividend);
  assert(extended_trade_flags_read.publication_mode == extended_trade_flags_written.publication_mode);
  assert(extended_trade_flags_read.off_book_automated_indicator == extended_trade_flags_written.off_book_automated_indicator);
  skip
}

/* ---- Trade Extended Message: 62 bytes ---------------------------------------- */

/* Trade — Extended */
typedef TradeExtendedMessage {
  byte time_offset[4];
  byte shares_extended[8];
  byte symbol_short[8];
  byte price_long[8];
  byte trade_id[8];
  byte trade_timestamp[8];
  byte execution_venue[4];
  byte currency[3];
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
  :: trade_extended_message_at < 8 -> trade_extended_message_record.symbol_short[trade_extended_message_at] = trade_extended_message_value; trade_extended_message_at = trade_extended_message_at + 1
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
  :: trade_extended_message_at < 8 -> trade_extended_message_record.symbol_short[trade_extended_message_at] = (trade_extended_message_base + 12 + trade_extended_message_at + 1) % 256; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> trade_extended_message_record.price_long[trade_extended_message_at] = (trade_extended_message_base + 20 + trade_extended_message_at + 1) % 256; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> trade_extended_message_record.trade_id[trade_extended_message_at] = (trade_extended_message_base + 28 + trade_extended_message_at + 1) % 256; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> trade_extended_message_record.trade_timestamp[trade_extended_message_at] = (trade_extended_message_base + 36 + trade_extended_message_at + 1) % 256; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 4 -> trade_extended_message_record.execution_venue[trade_extended_message_at] = (trade_extended_message_base + 44 + trade_extended_message_at + 1) % 256; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 3 -> trade_extended_message_record.currency[trade_extended_message_at] = (trade_extended_message_base + 48 + trade_extended_message_at + 1) % 256; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  ramp_extended_trade_flags(trade_extended_message_record.extended_trade_flags, trade_extended_message_base + 51);
  skip
}

/* Trade Extended Message to the wire, 62 bytes from where the cursor stands */
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
  :: trade_extended_message_at < 8 -> wire[at] = trade_extended_message_record.symbol_short[trade_extended_message_at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
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
  encode_extended_trade_flags(trade_extended_message_record.extended_trade_flags);
  skip
}

/* Trade Extended Message off the wire, 62 bytes from where the cursor stands */
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
  :: trade_extended_message_at < 8 -> trade_extended_message_record.symbol_short[trade_extended_message_at] = wire[at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
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
  :: trade_extended_message_at < 8 -> assert(trade_extended_message_read.symbol_short[trade_extended_message_at] == trade_extended_message_written.symbol_short[trade_extended_message_at]); trade_extended_message_at = trade_extended_message_at + 1
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
  equal_extended_trade_flags(trade_extended_message_read.extended_trade_flags, trade_extended_message_written.extended_trade_flags);
  skip
}

/* ---- Trade Break Message: 12 bytes ------------------------------------------- */

/* Trade Break */
typedef TradeBreakMessage {
  byte time_offset[4];
  byte execution_id[8]
};

int trade_break_message_at;

/* every byte of Trade Break Message set to one value */
inline fill_trade_break_message(trade_break_message_record, trade_break_message_value) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 4 -> trade_break_message_record.time_offset[trade_break_message_at] = trade_break_message_value; trade_break_message_at = trade_break_message_at + 1
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
  :: trade_break_message_at < 4 -> trade_break_message_record.time_offset[trade_break_message_at] = (trade_break_message_base + 0 + trade_break_message_at + 1) % 256; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.execution_id[trade_break_message_at] = (trade_break_message_base + 4 + trade_break_message_at + 1) % 256; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Break Message to the wire, 12 bytes from where the cursor stands */
inline encode_trade_break_message(trade_break_message_record) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 4 -> wire[at] = trade_break_message_record.time_offset[trade_break_message_at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> wire[at] = trade_break_message_record.execution_id[trade_break_message_at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Break Message off the wire, 12 bytes from where the cursor stands */
inline decode_trade_break_message(trade_break_message_record) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 4 -> trade_break_message_record.time_offset[trade_break_message_at] = wire[at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
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
  :: trade_break_message_at < 4 -> assert(trade_break_message_read.time_offset[trade_break_message_at] == trade_break_message_written.time_offset[trade_break_message_at]); trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> assert(trade_break_message_read.execution_id[trade_break_message_at] == trade_break_message_written.execution_id[trade_break_message_at]); trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Session Message: 4 bytes ----------------------------------------- */

/* End of Session */
typedef EndOfSessionMessage {
  byte time_offset[4]
};

int end_of_session_message_at;

/* every byte of End Of Session Message set to one value */
inline fill_end_of_session_message(end_of_session_message_record, end_of_session_message_value) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> end_of_session_message_record.time_offset[end_of_session_message_at] = end_of_session_message_value; end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Session Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_session_message(end_of_session_message_record, end_of_session_message_base) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> end_of_session_message_record.time_offset[end_of_session_message_at] = (end_of_session_message_base + 0 + end_of_session_message_at + 1) % 256; end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Session Message to the wire, 4 bytes from where the cursor stands */
inline encode_end_of_session_message(end_of_session_message_record) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> wire[at] = end_of_session_message_record.time_offset[end_of_session_message_at]; at = at + 1; end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Session Message off the wire, 4 bytes from where the cursor stands */
inline decode_end_of_session_message(end_of_session_message_record) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> end_of_session_message_record.time_offset[end_of_session_message_at] = wire[at]; at = at + 1; end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Session Message is what was written, byte for byte */
inline equal_end_of_session_message(end_of_session_message_read, end_of_session_message_written) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> assert(end_of_session_message_read.time_offset[end_of_session_message_at] == end_of_session_message_written.time_offset[end_of_session_message_at]); end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Status Message: 16 bytes ---------------------------------------- */

/* Trading Status */
typedef TradingStatusMessage {
  byte time_offset[4];
  byte symbol_short[8];
  byte status;
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
  :: trading_status_message_at < 8 -> trading_status_message_record.symbol_short[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.status = trading_status_message_value;
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
  :: trading_status_message_at < 8 -> trading_status_message_record.symbol_short[trading_status_message_at] = (trading_status_message_base + 4 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.status = (trading_status_message_base + 12 + 1) % 256;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> trading_status_message_record.reserved_3[trading_status_message_at] = (trading_status_message_base + 13 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Status Message to the wire, 16 bytes from where the cursor stands */
inline encode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> wire[at] = trading_status_message_record.time_offset[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> wire[at] = trading_status_message_record.symbol_short[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_status_message_record.status; at = at + 1;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> wire[at] = trading_status_message_record.reserved_3[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Status Message off the wire, 16 bytes from where the cursor stands */
inline decode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.time_offset[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.symbol_short[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.status = wire[at]; at = at + 1;
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
  :: trading_status_message_at < 8 -> assert(trading_status_message_read.symbol_short[trading_status_message_at] == trading_status_message_written.symbol_short[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  assert(trading_status_message_read.status == trading_status_message_written.status);
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> assert(trading_status_message_read.reserved_3[trading_status_message_at] == trading_status_message_written.reserved_3[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Statistics Message: 22 bytes -------------------------------------------- */

/* Statistics Message */
typedef StatisticsMessage {
  byte time_offset[4];
  byte symbol_short[8];
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
  :: statistics_message_at < 8 -> statistics_message_record.symbol_short[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
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
  :: statistics_message_at < 8 -> statistics_message_record.symbol_short[statistics_message_at] = (statistics_message_base + 4 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.price_long[statistics_message_at] = (statistics_message_base + 12 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_record.statistic_type = (statistics_message_base + 20 + 1) % 256;
  statistics_message_record.price_determination = (statistics_message_base + 21 + 1) % 256;
  skip
}

/* Statistics Message to the wire, 22 bytes from where the cursor stands */
inline encode_statistics_message(statistics_message_record) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.time_offset[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.symbol_short[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
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

/* Statistics Message off the wire, 22 bytes from where the cursor stands */
inline decode_statistics_message(statistics_message_record) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.time_offset[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.symbol_short[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
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
  :: statistics_message_at < 8 -> assert(statistics_message_read.symbol_short[statistics_message_at] == statistics_message_written.symbol_short[statistics_message_at]); statistics_message_at = statistics_message_at + 1
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

/* ---- Auction Update Message: 35 bytes ---------------------------------------- */

/* Auction Update Message */
typedef AuctionUpdateMessage {
  byte time_offset[4];
  byte symbol_short[8];
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
  :: auction_update_message_at < 8 -> auction_update_message_record.symbol_short[auction_update_message_at] = auction_update_message_value; auction_update_message_at = auction_update_message_at + 1
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
  :: auction_update_message_at < 8 -> auction_update_message_record.symbol_short[auction_update_message_at] = (auction_update_message_base + 4 + auction_update_message_at + 1) % 256; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_record.auction_type = (auction_update_message_base + 12 + 1) % 256;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> auction_update_message_record.reference_price[auction_update_message_at] = (auction_update_message_base + 13 + auction_update_message_at + 1) % 256; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> auction_update_message_record.indicative_price[auction_update_message_at] = (auction_update_message_base + 21 + auction_update_message_at + 1) % 256; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 4 -> auction_update_message_record.indicative_shares[auction_update_message_at] = (auction_update_message_base + 29 + auction_update_message_at + 1) % 256; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_record.outside_tolerance = (auction_update_message_base + 33 + 1) % 256;
  auction_update_message_record.includes_primary = (auction_update_message_base + 34 + 1) % 256;
  skip
}

/* Auction Update Message to the wire, 35 bytes from where the cursor stands */
inline encode_auction_update_message(auction_update_message_record) {
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 4 -> wire[at] = auction_update_message_record.time_offset[auction_update_message_at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> wire[at] = auction_update_message_record.symbol_short[auction_update_message_at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
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

/* Auction Update Message off the wire, 35 bytes from where the cursor stands */
inline decode_auction_update_message(auction_update_message_record) {
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 4 -> auction_update_message_record.time_offset[auction_update_message_at] = wire[at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> auction_update_message_record.symbol_short[auction_update_message_at] = wire[at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
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
  :: auction_update_message_at < 8 -> assert(auction_update_message_read.symbol_short[auction_update_message_at] == auction_update_message_written.symbol_short[auction_update_message_at]); auction_update_message_at = auction_update_message_at + 1
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

/* ---- Auction Summary Message: 25 bytes --------------------------------------- */

/* Auction Summary Message */
typedef AuctionSummaryMessage {
  byte time_offset[4];
  byte symbol_short[8];
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
  :: auction_summary_message_at < 8 -> auction_summary_message_record.symbol_short[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
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
  :: auction_summary_message_at < 8 -> auction_summary_message_record.symbol_short[auction_summary_message_at] = (auction_summary_message_base + 4 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.auction_type = (auction_summary_message_base + 12 + 1) % 256;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.price_long[auction_summary_message_at] = (auction_summary_message_base + 13 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.shares_long[auction_summary_message_at] = (auction_summary_message_base + 21 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Summary Message to the wire, 25 bytes from where the cursor stands */
inline encode_auction_summary_message(auction_summary_message_record) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> wire[at] = auction_summary_message_record.time_offset[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> wire[at] = auction_summary_message_record.symbol_short[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
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

/* Auction Summary Message off the wire, 25 bytes from where the cursor stands */
inline decode_auction_summary_message(auction_summary_message_record) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.time_offset[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.symbol_short[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
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
  :: auction_summary_message_at < 8 -> assert(auction_summary_message_read.symbol_short[auction_summary_message_at] == auction_summary_message_written.symbol_short[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
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
    assert(at == 33);
    at = 0;
    decode_add_order_long_message(add_order_long_message_got);
    assert(at == 33);
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
    assert(at == 3);
    at = 0;
    decode_execution_flags(execution_flags_got);
    assert(at == 3);
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
    assert(at == 27);
    at = 0;
    decode_order_executed_message(order_executed_message_got);
    assert(at == 27);
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
    assert(at == 39);
    at = 0;
    decode_order_executed_at_price_size_message(order_executed_at_price_size_message_got);
    assert(at == 39);
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
    assert(at == 4);
    at = 0;
    decode_trade_flags(trade_flags_got);
    assert(at == 4);
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
    assert(at == 45);
    at = 0;
    decode_trade_long_message(trade_long_message_got);
    assert(at == 45);
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
    assert(at == 35);
    at = 0;
    decode_trade_short_message(trade_short_message_got);
    assert(at == 35);
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
    assert(at == 11);
    at = 0;
    decode_extended_trade_flags(extended_trade_flags_got);
    assert(at == 11);
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
    assert(at == 62);
    at = 0;
    decode_trade_extended_message(trade_extended_message_got);
    assert(at == 62);
    equal_trade_extended_message(trade_extended_message_got, trade_extended_message_sent)
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
    assert(at == 12);
    at = 0;
    decode_trade_break_message(trade_break_message_got);
    assert(at == 12);
    equal_trade_break_message(trade_break_message_got, trade_break_message_sent)
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
    assert(at == 16);
    at = 0;
    decode_trading_status_message(trading_status_message_got);
    assert(at == 16);
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
    assert(at == 22);
    at = 0;
    decode_statistics_message(statistics_message_got);
    assert(at == 22);
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
    assert(at == 35);
    at = 0;
    decode_auction_update_message(auction_update_message_got);
    assert(at == 35);
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
    assert(at == 25);
    at = 0;
    decode_auction_summary_message(auction_summary_message_got);
    assert(at == 25);
    equal_auction_summary_message(auction_summary_message_got, auction_summary_message_sent)
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
  :: run check_trade_break_message()
  :: run check_end_of_session_message()
  :: run check_trading_status_message()
  :: run check_statistics_message()
  :: run check_auction_update_message()
  :: run check_auction_summary_message()
  fi
}
