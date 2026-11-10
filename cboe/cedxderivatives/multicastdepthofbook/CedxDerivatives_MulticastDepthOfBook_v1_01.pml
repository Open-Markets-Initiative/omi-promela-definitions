/*
 * Chicago Board Options Exchange Europe Derivatives Multicast Depth Of Book
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
 *   - a run counted by a field
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 66

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
  byte symbol_long[8];
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
  :: add_order_long_message_at < 8 -> add_order_long_message_record.symbol_long[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
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
  :: add_order_long_message_at < 8 -> add_order_long_message_record.symbol_long[add_order_long_message_at] = (add_order_long_message_base + 17 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
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
  :: add_order_long_message_at < 8 -> wire[at] = add_order_long_message_record.symbol_long[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
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
  :: add_order_long_message_at < 8 -> add_order_long_message_record.symbol_long[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
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
  :: add_order_long_message_at < 8 -> assert(add_order_long_message_read.symbol_long[add_order_long_message_at] == add_order_long_message_written.symbol_long[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
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
  byte symbol[6];
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
  :: add_order_short_message_at < 6 -> add_order_short_message_record.symbol[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
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
  :: add_order_short_message_at < 6 -> add_order_short_message_record.symbol[add_order_short_message_at] = (add_order_short_message_base + 15 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
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
  :: add_order_short_message_at < 6 -> wire[at] = add_order_short_message_record.symbol[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
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
  :: add_order_short_message_at < 6 -> add_order_short_message_record.symbol[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
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
  :: add_order_short_message_at < 6 -> assert(add_order_short_message_read.symbol[add_order_short_message_at] == add_order_short_message_written.symbol[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
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

/* Order Executed */
typedef OrderExecutedMessage {
  byte time_offset[4];
  byte order_id[8];
  byte executed_quantity[4];
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
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
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
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = (order_executed_message_base + 12 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
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
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.executed_quantity[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
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
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
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
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.executed_quantity[order_executed_message_at] == order_executed_message_written.executed_quantity[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
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

/* Order Executed at Price/Size */
typedef OrderExecutedAtPriceSizeMessage {
  byte time_offset[4];
  byte order_id[8];
  byte executed_quantity[4];
  byte remaining_quantity[4];
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
  :: order_executed_at_price_size_message_at < 4 -> order_executed_at_price_size_message_record.executed_quantity[order_executed_at_price_size_message_at] = order_executed_at_price_size_message_value; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> order_executed_at_price_size_message_record.remaining_quantity[order_executed_at_price_size_message_at] = order_executed_at_price_size_message_value; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
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
  :: order_executed_at_price_size_message_at < 4 -> order_executed_at_price_size_message_record.executed_quantity[order_executed_at_price_size_message_at] = (order_executed_at_price_size_message_base + 12 + order_executed_at_price_size_message_at + 1) % 256; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> order_executed_at_price_size_message_record.remaining_quantity[order_executed_at_price_size_message_at] = (order_executed_at_price_size_message_base + 16 + order_executed_at_price_size_message_at + 1) % 256; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
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
  :: order_executed_at_price_size_message_at < 4 -> wire[at] = order_executed_at_price_size_message_record.executed_quantity[order_executed_at_price_size_message_at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> wire[at] = order_executed_at_price_size_message_record.remaining_quantity[order_executed_at_price_size_message_at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
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
  :: order_executed_at_price_size_message_at < 4 -> order_executed_at_price_size_message_record.executed_quantity[order_executed_at_price_size_message_at] = wire[at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> order_executed_at_price_size_message_record.remaining_quantity[order_executed_at_price_size_message_at] = wire[at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
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
  :: order_executed_at_price_size_message_at < 4 -> assert(order_executed_at_price_size_message_read.executed_quantity[order_executed_at_price_size_message_at] == order_executed_at_price_size_message_written.executed_quantity[order_executed_at_price_size_message_at]); order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> assert(order_executed_at_price_size_message_read.remaining_quantity[order_executed_at_price_size_message_at] == order_executed_at_price_size_message_written.remaining_quantity[order_executed_at_price_size_message_at]); order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
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
  byte cancelled_contracts_long[4]
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
  :: reduce_size_long_message_at < 4 -> reduce_size_long_message_record.cancelled_contracts_long[reduce_size_long_message_at] = reduce_size_long_message_value; reduce_size_long_message_at = reduce_size_long_message_at + 1
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
  :: reduce_size_long_message_at < 4 -> reduce_size_long_message_record.cancelled_contracts_long[reduce_size_long_message_at] = (reduce_size_long_message_base + 12 + reduce_size_long_message_at + 1) % 256; reduce_size_long_message_at = reduce_size_long_message_at + 1
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
  :: reduce_size_long_message_at < 4 -> wire[at] = reduce_size_long_message_record.cancelled_contracts_long[reduce_size_long_message_at]; at = at + 1; reduce_size_long_message_at = reduce_size_long_message_at + 1
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
  :: reduce_size_long_message_at < 4 -> reduce_size_long_message_record.cancelled_contracts_long[reduce_size_long_message_at] = wire[at]; at = at + 1; reduce_size_long_message_at = reduce_size_long_message_at + 1
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
  :: reduce_size_long_message_at < 4 -> assert(reduce_size_long_message_read.cancelled_contracts_long[reduce_size_long_message_at] == reduce_size_long_message_written.cancelled_contracts_long[reduce_size_long_message_at]); reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reduce Size Short Message: 14 bytes ------------------------------------- */

/* Reduce Size — Short */
typedef ReduceSizeShortMessage {
  byte time_offset[4];
  byte order_id[8];
  byte cancelled_contracts_short[2]
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
  :: reduce_size_short_message_at < 2 -> reduce_size_short_message_record.cancelled_contracts_short[reduce_size_short_message_at] = reduce_size_short_message_value; reduce_size_short_message_at = reduce_size_short_message_at + 1
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
  :: reduce_size_short_message_at < 2 -> reduce_size_short_message_record.cancelled_contracts_short[reduce_size_short_message_at] = (reduce_size_short_message_base + 12 + reduce_size_short_message_at + 1) % 256; reduce_size_short_message_at = reduce_size_short_message_at + 1
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
  :: reduce_size_short_message_at < 2 -> wire[at] = reduce_size_short_message_record.cancelled_contracts_short[reduce_size_short_message_at]; at = at + 1; reduce_size_short_message_at = reduce_size_short_message_at + 1
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
  :: reduce_size_short_message_at < 2 -> reduce_size_short_message_record.cancelled_contracts_short[reduce_size_short_message_at] = wire[at]; at = at + 1; reduce_size_short_message_at = reduce_size_short_message_at + 1
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
  :: reduce_size_short_message_at < 2 -> assert(reduce_size_short_message_read.cancelled_contracts_short[reduce_size_short_message_at] == reduce_size_short_message_written.cancelled_contracts_short[reduce_size_short_message_at]); reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Order Long Message: 24 bytes ------------------------------------- */

/* Modify Order — Long */
typedef ModifyOrderLongMessage {
  byte time_offset[4];
  byte order_id[8];
  byte contracts_long[4];
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
  :: modify_order_long_message_at < 4 -> modify_order_long_message_record.contracts_long[modify_order_long_message_at] = modify_order_long_message_value; modify_order_long_message_at = modify_order_long_message_at + 1
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
  :: modify_order_long_message_at < 4 -> modify_order_long_message_record.contracts_long[modify_order_long_message_at] = (modify_order_long_message_base + 12 + modify_order_long_message_at + 1) % 256; modify_order_long_message_at = modify_order_long_message_at + 1
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
  :: modify_order_long_message_at < 4 -> wire[at] = modify_order_long_message_record.contracts_long[modify_order_long_message_at]; at = at + 1; modify_order_long_message_at = modify_order_long_message_at + 1
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
  :: modify_order_long_message_at < 4 -> modify_order_long_message_record.contracts_long[modify_order_long_message_at] = wire[at]; at = at + 1; modify_order_long_message_at = modify_order_long_message_at + 1
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
  :: modify_order_long_message_at < 4 -> assert(modify_order_long_message_read.contracts_long[modify_order_long_message_at] == modify_order_long_message_written.contracts_long[modify_order_long_message_at]); modify_order_long_message_at = modify_order_long_message_at + 1
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
  byte contracts_short[2];
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
  :: modify_order_short_message_at < 2 -> modify_order_short_message_record.contracts_short[modify_order_short_message_at] = modify_order_short_message_value; modify_order_short_message_at = modify_order_short_message_at + 1
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
  :: modify_order_short_message_at < 2 -> modify_order_short_message_record.contracts_short[modify_order_short_message_at] = (modify_order_short_message_base + 12 + modify_order_short_message_at + 1) % 256; modify_order_short_message_at = modify_order_short_message_at + 1
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
  :: modify_order_short_message_at < 2 -> wire[at] = modify_order_short_message_record.contracts_short[modify_order_short_message_at]; at = at + 1; modify_order_short_message_at = modify_order_short_message_at + 1
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
  :: modify_order_short_message_at < 2 -> modify_order_short_message_record.contracts_short[modify_order_short_message_at] = wire[at]; at = at + 1; modify_order_short_message_at = modify_order_short_message_at + 1
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
  :: modify_order_short_message_at < 2 -> assert(modify_order_short_message_read.contracts_short[modify_order_short_message_at] == modify_order_short_message_written.contracts_short[modify_order_short_message_at]); modify_order_short_message_at = modify_order_short_message_at + 1
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

/* ---- Trade Flags: 5 bytes ---------------------------------------------------- */

/* Trade Flags */
typedef TradeFlags {
  byte market_mechanism;
  byte trading_mode;
  byte transaction_category;
  byte benchmark_reference_price_indicator;
  byte algorithmic_trade
};

/* every byte of Trade Flags set to one value */
inline fill_trade_flags(trade_flags_record, trade_flags_value) {
  trade_flags_record.market_mechanism = trade_flags_value;
  trade_flags_record.trading_mode = trade_flags_value;
  trade_flags_record.transaction_category = trade_flags_value;
  trade_flags_record.benchmark_reference_price_indicator = trade_flags_value;
  trade_flags_record.algorithmic_trade = trade_flags_value;
  skip
}

/* each byte of Trade Flags set to where it lies, so a field read out of place says so */
inline ramp_trade_flags(trade_flags_record, trade_flags_base) {
  trade_flags_record.market_mechanism = (trade_flags_base + 0 + 1) % 256;
  trade_flags_record.trading_mode = (trade_flags_base + 1 + 1) % 256;
  trade_flags_record.transaction_category = (trade_flags_base + 2 + 1) % 256;
  trade_flags_record.benchmark_reference_price_indicator = (trade_flags_base + 3 + 1) % 256;
  trade_flags_record.algorithmic_trade = (trade_flags_base + 4 + 1) % 256;
  skip
}

/* Trade Flags to the wire, 5 bytes from where the cursor stands */
inline encode_trade_flags(trade_flags_record) {
  wire[at] = trade_flags_record.market_mechanism; at = at + 1;
  wire[at] = trade_flags_record.trading_mode; at = at + 1;
  wire[at] = trade_flags_record.transaction_category; at = at + 1;
  wire[at] = trade_flags_record.benchmark_reference_price_indicator; at = at + 1;
  wire[at] = trade_flags_record.algorithmic_trade; at = at + 1;
  skip
}

/* Trade Flags off the wire, 5 bytes from where the cursor stands */
inline decode_trade_flags(trade_flags_record) {
  trade_flags_record.market_mechanism = wire[at]; at = at + 1;
  trade_flags_record.trading_mode = wire[at]; at = at + 1;
  trade_flags_record.transaction_category = wire[at]; at = at + 1;
  trade_flags_record.benchmark_reference_price_indicator = wire[at]; at = at + 1;
  trade_flags_record.algorithmic_trade = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Flags is what was written, byte for byte */
inline equal_trade_flags(trade_flags_read, trade_flags_written) {
  assert(trade_flags_read.market_mechanism == trade_flags_written.market_mechanism);
  assert(trade_flags_read.trading_mode == trade_flags_written.trading_mode);
  assert(trade_flags_read.transaction_category == trade_flags_written.transaction_category);
  assert(trade_flags_read.benchmark_reference_price_indicator == trade_flags_written.benchmark_reference_price_indicator);
  assert(trade_flags_read.algorithmic_trade == trade_flags_written.algorithmic_trade);
  skip
}

/* ---- Trade Long Message: 46 bytes -------------------------------------------- */

/* Trade — Long */
typedef TradeLongMessage {
  byte time_offset[4];
  byte order_id[8];
  byte side_indicator;
  byte contracts_long[4];
  byte symbol_long[8];
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
  :: trade_long_message_at < 4 -> trade_long_message_record.contracts_long[trade_long_message_at] = trade_long_message_value; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.symbol_long[trade_long_message_at] = trade_long_message_value; trade_long_message_at = trade_long_message_at + 1
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
  :: trade_long_message_at < 4 -> trade_long_message_record.contracts_long[trade_long_message_at] = (trade_long_message_base + 13 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.symbol_long[trade_long_message_at] = (trade_long_message_base + 17 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
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

/* Trade Long Message to the wire, 46 bytes from where the cursor stands */
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
  :: trade_long_message_at < 4 -> wire[at] = trade_long_message_record.contracts_long[trade_long_message_at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> wire[at] = trade_long_message_record.symbol_long[trade_long_message_at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
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

/* Trade Long Message off the wire, 46 bytes from where the cursor stands */
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
  :: trade_long_message_at < 4 -> trade_long_message_record.contracts_long[trade_long_message_at] = wire[at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.symbol_long[trade_long_message_at] = wire[at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
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
  :: trade_long_message_at < 4 -> assert(trade_long_message_read.contracts_long[trade_long_message_at] == trade_long_message_written.contracts_long[trade_long_message_at]); trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> assert(trade_long_message_read.symbol_long[trade_long_message_at] == trade_long_message_written.symbol_long[trade_long_message_at]); trade_long_message_at = trade_long_message_at + 1
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

/* Trade — Short */
typedef TradeShortMessage {
  byte time_offset[4];
  byte order_id[8];
  byte side_indicator;
  byte contracts_short[2];
  byte symbol[6];
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
  :: trade_short_message_at < 6 -> trade_short_message_record.symbol[trade_short_message_at] = trade_short_message_value; trade_short_message_at = trade_short_message_at + 1
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
  :: trade_short_message_at < 6 -> trade_short_message_record.symbol[trade_short_message_at] = (trade_short_message_base + 15 + trade_short_message_at + 1) % 256; trade_short_message_at = trade_short_message_at + 1
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
  :: trade_short_message_at < 6 -> wire[at] = trade_short_message_record.symbol[trade_short_message_at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
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
  :: trade_short_message_at < 6 -> trade_short_message_record.symbol[trade_short_message_at] = wire[at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
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
  :: trade_short_message_at < 6 -> assert(trade_short_message_read.symbol[trade_short_message_at] == trade_short_message_written.symbol[trade_short_message_at]); trade_short_message_at = trade_short_message_at + 1
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
  byte deferral_or_enrichement_type;
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
  extended_trade_flags_record.deferral_or_enrichement_type = extended_trade_flags_value;
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
  extended_trade_flags_record.deferral_or_enrichement_type = (extended_trade_flags_base + 12 + 1) % 256;
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
  wire[at] = extended_trade_flags_record.deferral_or_enrichement_type; at = at + 1;
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
  extended_trade_flags_record.deferral_or_enrichement_type = wire[at]; at = at + 1;
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
  assert(extended_trade_flags_read.deferral_or_enrichement_type == extended_trade_flags_written.deferral_or_enrichement_type);
  assert(extended_trade_flags_read.duplicative_indicator == extended_trade_flags_written.duplicative_indicator);
  skip
}

/* ---- Trade Extended Message: 66 bytes ---------------------------------------- */

/* Trade — Extended */
typedef TradeExtendedMessage {
  byte time_offset[4];
  byte contracts_extended[8];
  byte symbol_long[8];
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
  :: trade_extended_message_at < 8 -> trade_extended_message_record.contracts_extended[trade_extended_message_at] = trade_extended_message_value; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> trade_extended_message_record.symbol_long[trade_extended_message_at] = trade_extended_message_value; trade_extended_message_at = trade_extended_message_at + 1
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
  :: trade_extended_message_at < 8 -> trade_extended_message_record.contracts_extended[trade_extended_message_at] = (trade_extended_message_base + 4 + trade_extended_message_at + 1) % 256; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> trade_extended_message_record.symbol_long[trade_extended_message_at] = (trade_extended_message_base + 12 + trade_extended_message_at + 1) % 256; trade_extended_message_at = trade_extended_message_at + 1
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
  trade_extended_message_record.cboe_trade_flags = (trade_extended_message_base + 51 + 1) % 256;
  ramp_extended_trade_flags(trade_extended_message_record.extended_trade_flags, trade_extended_message_base + 52);
  skip
}

/* Trade Extended Message to the wire, 66 bytes from where the cursor stands */
inline encode_trade_extended_message(trade_extended_message_record) {
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 4 -> wire[at] = trade_extended_message_record.time_offset[trade_extended_message_at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> wire[at] = trade_extended_message_record.contracts_extended[trade_extended_message_at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> wire[at] = trade_extended_message_record.symbol_long[trade_extended_message_at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
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

/* Trade Extended Message off the wire, 66 bytes from where the cursor stands */
inline decode_trade_extended_message(trade_extended_message_record) {
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 4 -> trade_extended_message_record.time_offset[trade_extended_message_at] = wire[at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> trade_extended_message_record.contracts_extended[trade_extended_message_at] = wire[at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> trade_extended_message_record.symbol_long[trade_extended_message_at] = wire[at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
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
  :: trade_extended_message_at < 8 -> assert(trade_extended_message_read.contracts_extended[trade_extended_message_at] == trade_extended_message_written.contracts_extended[trade_extended_message_at]); trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> assert(trade_extended_message_read.symbol_long[trade_extended_message_at] == trade_extended_message_written.symbol_long[trade_extended_message_at]); trade_extended_message_at = trade_extended_message_at + 1
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

/* ---- Transaction Begin Message: 4 bytes -------------------------------------- */

/* Transaction Begin */
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

/* Transaction End */
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

/* ---- Trading Status Message: 16 bytes ---------------------------------------- */

/* Trading Status */
typedef TradingStatusMessage {
  byte time_offset[4];
  byte symbol_long[8];
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
  :: trading_status_message_at < 8 -> trading_status_message_record.symbol_long[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
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
  :: trading_status_message_at < 8 -> trading_status_message_record.symbol_long[trading_status_message_at] = (trading_status_message_base + 4 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
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
  :: trading_status_message_at < 8 -> wire[at] = trading_status_message_record.symbol_long[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
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
  :: trading_status_message_at < 8 -> trading_status_message_record.symbol_long[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
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
  :: trading_status_message_at < 8 -> assert(trading_status_message_read.symbol_long[trading_status_message_at] == trading_status_message_written.symbol_long[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
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

/* ---- Auction Summary Message: 25 bytes --------------------------------------- */

/* Auction Summary Message */
typedef AuctionSummaryMessage {
  byte time_offset[4];
  byte symbol_long[8];
  byte auction_type;
  byte price_long[8];
  byte contracts_long[4]
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
  :: auction_summary_message_at < 8 -> auction_summary_message_record.symbol_long[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
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
  :: auction_summary_message_at < 4 -> auction_summary_message_record.contracts_long[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
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
  :: auction_summary_message_at < 8 -> auction_summary_message_record.symbol_long[auction_summary_message_at] = (auction_summary_message_base + 4 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
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
  :: auction_summary_message_at < 4 -> auction_summary_message_record.contracts_long[auction_summary_message_at] = (auction_summary_message_base + 21 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
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
  :: auction_summary_message_at < 8 -> wire[at] = auction_summary_message_record.symbol_long[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
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
  :: auction_summary_message_at < 4 -> wire[at] = auction_summary_message_record.contracts_long[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
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
  :: auction_summary_message_at < 8 -> auction_summary_message_record.symbol_long[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
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
  :: auction_summary_message_at < 4 -> auction_summary_message_record.contracts_long[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
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
  :: auction_summary_message_at < 8 -> assert(auction_summary_message_read.symbol_long[auction_summary_message_at] == auction_summary_message_written.symbol_long[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
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
  :: auction_summary_message_at < 4 -> assert(auction_summary_message_read.contracts_long[auction_summary_message_at] == auction_summary_message_written.contracts_long[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Opening Auction Update Message: 62 bytes -------------------------------- */

/* Opening Auction Update Message */
typedef OpeningAuctionUpdateMessage {
  byte time_offset[4];
  byte symbol_long[8];
  byte auction_type;
  byte reference_price[8];
  byte buy_contracts[4];
  byte sell_contracts[4];
  byte indicative_price[8];
  byte auction_only_price[8];
  byte opening_condition;
  byte composite_market_bid_price[8];
  byte composite_market_offer_price[8]
};

int opening_auction_update_message_at;

/* every byte of Opening Auction Update Message set to one value */
inline fill_opening_auction_update_message(opening_auction_update_message_record, opening_auction_update_message_value) {
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 4 -> opening_auction_update_message_record.time_offset[opening_auction_update_message_at] = opening_auction_update_message_value; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> opening_auction_update_message_record.symbol_long[opening_auction_update_message_at] = opening_auction_update_message_value; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_record.auction_type = opening_auction_update_message_value;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> opening_auction_update_message_record.reference_price[opening_auction_update_message_at] = opening_auction_update_message_value; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 4 -> opening_auction_update_message_record.buy_contracts[opening_auction_update_message_at] = opening_auction_update_message_value; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 4 -> opening_auction_update_message_record.sell_contracts[opening_auction_update_message_at] = opening_auction_update_message_value; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> opening_auction_update_message_record.indicative_price[opening_auction_update_message_at] = opening_auction_update_message_value; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> opening_auction_update_message_record.auction_only_price[opening_auction_update_message_at] = opening_auction_update_message_value; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_record.opening_condition = opening_auction_update_message_value;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> opening_auction_update_message_record.composite_market_bid_price[opening_auction_update_message_at] = opening_auction_update_message_value; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> opening_auction_update_message_record.composite_market_offer_price[opening_auction_update_message_at] = opening_auction_update_message_value; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Opening Auction Update Message set to where it lies, so a field read out of place says so */
inline ramp_opening_auction_update_message(opening_auction_update_message_record, opening_auction_update_message_base) {
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 4 -> opening_auction_update_message_record.time_offset[opening_auction_update_message_at] = (opening_auction_update_message_base + 0 + opening_auction_update_message_at + 1) % 256; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> opening_auction_update_message_record.symbol_long[opening_auction_update_message_at] = (opening_auction_update_message_base + 4 + opening_auction_update_message_at + 1) % 256; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_record.auction_type = (opening_auction_update_message_base + 12 + 1) % 256;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> opening_auction_update_message_record.reference_price[opening_auction_update_message_at] = (opening_auction_update_message_base + 13 + opening_auction_update_message_at + 1) % 256; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 4 -> opening_auction_update_message_record.buy_contracts[opening_auction_update_message_at] = (opening_auction_update_message_base + 21 + opening_auction_update_message_at + 1) % 256; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 4 -> opening_auction_update_message_record.sell_contracts[opening_auction_update_message_at] = (opening_auction_update_message_base + 25 + opening_auction_update_message_at + 1) % 256; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> opening_auction_update_message_record.indicative_price[opening_auction_update_message_at] = (opening_auction_update_message_base + 29 + opening_auction_update_message_at + 1) % 256; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> opening_auction_update_message_record.auction_only_price[opening_auction_update_message_at] = (opening_auction_update_message_base + 37 + opening_auction_update_message_at + 1) % 256; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_record.opening_condition = (opening_auction_update_message_base + 45 + 1) % 256;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> opening_auction_update_message_record.composite_market_bid_price[opening_auction_update_message_at] = (opening_auction_update_message_base + 46 + opening_auction_update_message_at + 1) % 256; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> opening_auction_update_message_record.composite_market_offer_price[opening_auction_update_message_at] = (opening_auction_update_message_base + 54 + opening_auction_update_message_at + 1) % 256; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Opening Auction Update Message to the wire, 62 bytes from where the cursor stands */
inline encode_opening_auction_update_message(opening_auction_update_message_record) {
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 4 -> wire[at] = opening_auction_update_message_record.time_offset[opening_auction_update_message_at]; at = at + 1; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> wire[at] = opening_auction_update_message_record.symbol_long[opening_auction_update_message_at]; at = at + 1; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  wire[at] = opening_auction_update_message_record.auction_type; at = at + 1;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> wire[at] = opening_auction_update_message_record.reference_price[opening_auction_update_message_at]; at = at + 1; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 4 -> wire[at] = opening_auction_update_message_record.buy_contracts[opening_auction_update_message_at]; at = at + 1; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 4 -> wire[at] = opening_auction_update_message_record.sell_contracts[opening_auction_update_message_at]; at = at + 1; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> wire[at] = opening_auction_update_message_record.indicative_price[opening_auction_update_message_at]; at = at + 1; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> wire[at] = opening_auction_update_message_record.auction_only_price[opening_auction_update_message_at]; at = at + 1; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  wire[at] = opening_auction_update_message_record.opening_condition; at = at + 1;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> wire[at] = opening_auction_update_message_record.composite_market_bid_price[opening_auction_update_message_at]; at = at + 1; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> wire[at] = opening_auction_update_message_record.composite_market_offer_price[opening_auction_update_message_at]; at = at + 1; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Opening Auction Update Message off the wire, 62 bytes from where the cursor stands */
inline decode_opening_auction_update_message(opening_auction_update_message_record) {
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 4 -> opening_auction_update_message_record.time_offset[opening_auction_update_message_at] = wire[at]; at = at + 1; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> opening_auction_update_message_record.symbol_long[opening_auction_update_message_at] = wire[at]; at = at + 1; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_record.auction_type = wire[at]; at = at + 1;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> opening_auction_update_message_record.reference_price[opening_auction_update_message_at] = wire[at]; at = at + 1; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 4 -> opening_auction_update_message_record.buy_contracts[opening_auction_update_message_at] = wire[at]; at = at + 1; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 4 -> opening_auction_update_message_record.sell_contracts[opening_auction_update_message_at] = wire[at]; at = at + 1; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> opening_auction_update_message_record.indicative_price[opening_auction_update_message_at] = wire[at]; at = at + 1; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> opening_auction_update_message_record.auction_only_price[opening_auction_update_message_at] = wire[at]; at = at + 1; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_record.opening_condition = wire[at]; at = at + 1;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> opening_auction_update_message_record.composite_market_bid_price[opening_auction_update_message_at] = wire[at]; at = at + 1; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> opening_auction_update_message_record.composite_market_offer_price[opening_auction_update_message_at] = wire[at]; at = at + 1; opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Opening Auction Update Message is what was written, byte for byte */
inline equal_opening_auction_update_message(opening_auction_update_message_read, opening_auction_update_message_written) {
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 4 -> assert(opening_auction_update_message_read.time_offset[opening_auction_update_message_at] == opening_auction_update_message_written.time_offset[opening_auction_update_message_at]); opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> assert(opening_auction_update_message_read.symbol_long[opening_auction_update_message_at] == opening_auction_update_message_written.symbol_long[opening_auction_update_message_at]); opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  assert(opening_auction_update_message_read.auction_type == opening_auction_update_message_written.auction_type);
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> assert(opening_auction_update_message_read.reference_price[opening_auction_update_message_at] == opening_auction_update_message_written.reference_price[opening_auction_update_message_at]); opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 4 -> assert(opening_auction_update_message_read.buy_contracts[opening_auction_update_message_at] == opening_auction_update_message_written.buy_contracts[opening_auction_update_message_at]); opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 4 -> assert(opening_auction_update_message_read.sell_contracts[opening_auction_update_message_at] == opening_auction_update_message_written.sell_contracts[opening_auction_update_message_at]); opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> assert(opening_auction_update_message_read.indicative_price[opening_auction_update_message_at] == opening_auction_update_message_written.indicative_price[opening_auction_update_message_at]); opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> assert(opening_auction_update_message_read.auction_only_price[opening_auction_update_message_at] == opening_auction_update_message_written.auction_only_price[opening_auction_update_message_at]); opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  assert(opening_auction_update_message_read.opening_condition == opening_auction_update_message_written.opening_condition);
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> assert(opening_auction_update_message_read.composite_market_bid_price[opening_auction_update_message_at] == opening_auction_update_message_written.composite_market_bid_price[opening_auction_update_message_at]); opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  opening_auction_update_message_at = 0;
  do
  :: opening_auction_update_message_at < 8 -> assert(opening_auction_update_message_read.composite_market_offer_price[opening_auction_update_message_at] == opening_auction_update_message_written.composite_market_offer_price[opening_auction_update_message_at]); opening_auction_update_message_at = opening_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Notification Message: 41 bytes ---------------------------------- */

/* Auction Notification Message */
typedef AuctionNotificationMessage {
  byte time_offset[4];
  byte symbol[6];
  byte auction_id[8];
  byte auction_type;
  byte side;
  byte price_long[8];
  byte contracts_long[4];
  byte customer_indicator;
  byte participant_id[4];
  byte auction_end_offset[4]
};

int auction_notification_message_at;

/* every byte of Auction Notification Message set to one value */
inline fill_auction_notification_message(auction_notification_message_record, auction_notification_message_value) {
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.time_offset[auction_notification_message_at] = auction_notification_message_value; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 6 -> auction_notification_message_record.symbol[auction_notification_message_at] = auction_notification_message_value; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> auction_notification_message_record.auction_id[auction_notification_message_at] = auction_notification_message_value; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_record.auction_type = auction_notification_message_value;
  auction_notification_message_record.side = auction_notification_message_value;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> auction_notification_message_record.price_long[auction_notification_message_at] = auction_notification_message_value; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.contracts_long[auction_notification_message_at] = auction_notification_message_value; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_record.customer_indicator = auction_notification_message_value;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.participant_id[auction_notification_message_at] = auction_notification_message_value; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.auction_end_offset[auction_notification_message_at] = auction_notification_message_value; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Notification Message set to where it lies, so a field read out of place says so */
inline ramp_auction_notification_message(auction_notification_message_record, auction_notification_message_base) {
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.time_offset[auction_notification_message_at] = (auction_notification_message_base + 0 + auction_notification_message_at + 1) % 256; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 6 -> auction_notification_message_record.symbol[auction_notification_message_at] = (auction_notification_message_base + 4 + auction_notification_message_at + 1) % 256; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> auction_notification_message_record.auction_id[auction_notification_message_at] = (auction_notification_message_base + 10 + auction_notification_message_at + 1) % 256; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_record.auction_type = (auction_notification_message_base + 18 + 1) % 256;
  auction_notification_message_record.side = (auction_notification_message_base + 19 + 1) % 256;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> auction_notification_message_record.price_long[auction_notification_message_at] = (auction_notification_message_base + 20 + auction_notification_message_at + 1) % 256; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.contracts_long[auction_notification_message_at] = (auction_notification_message_base + 28 + auction_notification_message_at + 1) % 256; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_record.customer_indicator = (auction_notification_message_base + 32 + 1) % 256;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.participant_id[auction_notification_message_at] = (auction_notification_message_base + 33 + auction_notification_message_at + 1) % 256; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.auction_end_offset[auction_notification_message_at] = (auction_notification_message_base + 37 + auction_notification_message_at + 1) % 256; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Notification Message to the wire, 41 bytes from where the cursor stands */
inline encode_auction_notification_message(auction_notification_message_record) {
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> wire[at] = auction_notification_message_record.time_offset[auction_notification_message_at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 6 -> wire[at] = auction_notification_message_record.symbol[auction_notification_message_at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> wire[at] = auction_notification_message_record.auction_id[auction_notification_message_at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_notification_message_record.auction_type; at = at + 1;
  wire[at] = auction_notification_message_record.side; at = at + 1;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> wire[at] = auction_notification_message_record.price_long[auction_notification_message_at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> wire[at] = auction_notification_message_record.contracts_long[auction_notification_message_at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_notification_message_record.customer_indicator; at = at + 1;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> wire[at] = auction_notification_message_record.participant_id[auction_notification_message_at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> wire[at] = auction_notification_message_record.auction_end_offset[auction_notification_message_at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Notification Message off the wire, 41 bytes from where the cursor stands */
inline decode_auction_notification_message(auction_notification_message_record) {
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.time_offset[auction_notification_message_at] = wire[at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 6 -> auction_notification_message_record.symbol[auction_notification_message_at] = wire[at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> auction_notification_message_record.auction_id[auction_notification_message_at] = wire[at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_record.auction_type = wire[at]; at = at + 1;
  auction_notification_message_record.side = wire[at]; at = at + 1;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> auction_notification_message_record.price_long[auction_notification_message_at] = wire[at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.contracts_long[auction_notification_message_at] = wire[at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_record.customer_indicator = wire[at]; at = at + 1;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.participant_id[auction_notification_message_at] = wire[at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.auction_end_offset[auction_notification_message_at] = wire[at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Notification Message is what was written, byte for byte */
inline equal_auction_notification_message(auction_notification_message_read, auction_notification_message_written) {
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> assert(auction_notification_message_read.time_offset[auction_notification_message_at] == auction_notification_message_written.time_offset[auction_notification_message_at]); auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 6 -> assert(auction_notification_message_read.symbol[auction_notification_message_at] == auction_notification_message_written.symbol[auction_notification_message_at]); auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> assert(auction_notification_message_read.auction_id[auction_notification_message_at] == auction_notification_message_written.auction_id[auction_notification_message_at]); auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  assert(auction_notification_message_read.auction_type == auction_notification_message_written.auction_type);
  assert(auction_notification_message_read.side == auction_notification_message_written.side);
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> assert(auction_notification_message_read.price_long[auction_notification_message_at] == auction_notification_message_written.price_long[auction_notification_message_at]); auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> assert(auction_notification_message_read.contracts_long[auction_notification_message_at] == auction_notification_message_written.contracts_long[auction_notification_message_at]); auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  assert(auction_notification_message_read.customer_indicator == auction_notification_message_written.customer_indicator);
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> assert(auction_notification_message_read.participant_id[auction_notification_message_at] == auction_notification_message_written.participant_id[auction_notification_message_at]); auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> assert(auction_notification_message_read.auction_end_offset[auction_notification_message_at] == auction_notification_message_written.auction_end_offset[auction_notification_message_at]); auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Cancel Message: 12 bytes ---------------------------------------- */

/* Auction Cancel Message */
typedef AuctionCancelMessage {
  byte time_offset[4];
  byte auction_id[8]
};

int auction_cancel_message_at;

/* every byte of Auction Cancel Message set to one value */
inline fill_auction_cancel_message(auction_cancel_message_record, auction_cancel_message_value) {
  auction_cancel_message_at = 0;
  do
  :: auction_cancel_message_at < 4 -> auction_cancel_message_record.time_offset[auction_cancel_message_at] = auction_cancel_message_value; auction_cancel_message_at = auction_cancel_message_at + 1
  :: else -> break
  od;
  auction_cancel_message_at = 0;
  do
  :: auction_cancel_message_at < 8 -> auction_cancel_message_record.auction_id[auction_cancel_message_at] = auction_cancel_message_value; auction_cancel_message_at = auction_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_auction_cancel_message(auction_cancel_message_record, auction_cancel_message_base) {
  auction_cancel_message_at = 0;
  do
  :: auction_cancel_message_at < 4 -> auction_cancel_message_record.time_offset[auction_cancel_message_at] = (auction_cancel_message_base + 0 + auction_cancel_message_at + 1) % 256; auction_cancel_message_at = auction_cancel_message_at + 1
  :: else -> break
  od;
  auction_cancel_message_at = 0;
  do
  :: auction_cancel_message_at < 8 -> auction_cancel_message_record.auction_id[auction_cancel_message_at] = (auction_cancel_message_base + 4 + auction_cancel_message_at + 1) % 256; auction_cancel_message_at = auction_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Cancel Message to the wire, 12 bytes from where the cursor stands */
inline encode_auction_cancel_message(auction_cancel_message_record) {
  auction_cancel_message_at = 0;
  do
  :: auction_cancel_message_at < 4 -> wire[at] = auction_cancel_message_record.time_offset[auction_cancel_message_at]; at = at + 1; auction_cancel_message_at = auction_cancel_message_at + 1
  :: else -> break
  od;
  auction_cancel_message_at = 0;
  do
  :: auction_cancel_message_at < 8 -> wire[at] = auction_cancel_message_record.auction_id[auction_cancel_message_at]; at = at + 1; auction_cancel_message_at = auction_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Cancel Message off the wire, 12 bytes from where the cursor stands */
inline decode_auction_cancel_message(auction_cancel_message_record) {
  auction_cancel_message_at = 0;
  do
  :: auction_cancel_message_at < 4 -> auction_cancel_message_record.time_offset[auction_cancel_message_at] = wire[at]; at = at + 1; auction_cancel_message_at = auction_cancel_message_at + 1
  :: else -> break
  od;
  auction_cancel_message_at = 0;
  do
  :: auction_cancel_message_at < 8 -> auction_cancel_message_record.auction_id[auction_cancel_message_at] = wire[at]; at = at + 1; auction_cancel_message_at = auction_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Cancel Message is what was written, byte for byte */
inline equal_auction_cancel_message(auction_cancel_message_read, auction_cancel_message_written) {
  auction_cancel_message_at = 0;
  do
  :: auction_cancel_message_at < 4 -> assert(auction_cancel_message_read.time_offset[auction_cancel_message_at] == auction_cancel_message_written.time_offset[auction_cancel_message_at]); auction_cancel_message_at = auction_cancel_message_at + 1
  :: else -> break
  od;
  auction_cancel_message_at = 0;
  do
  :: auction_cancel_message_at < 8 -> assert(auction_cancel_message_read.auction_id[auction_cancel_message_at] == auction_cancel_message_written.auction_id[auction_cancel_message_at]); auction_cancel_message_at = auction_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Trade Message: 36 bytes ----------------------------------------- */

/* Auction Trade Message */
typedef AuctionTradeMessage {
  byte time_offset[4];
  byte auction_id[8];
  byte execution_id[8];
  byte price_long[8];
  byte contracts_long[4];
  ExecutionFlags execution_flags
};

int auction_trade_message_at;

/* every byte of Auction Trade Message set to one value */
inline fill_auction_trade_message(auction_trade_message_record, auction_trade_message_value) {
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.time_offset[auction_trade_message_at] = auction_trade_message_value; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.auction_id[auction_trade_message_at] = auction_trade_message_value; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.execution_id[auction_trade_message_at] = auction_trade_message_value; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.price_long[auction_trade_message_at] = auction_trade_message_value; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.contracts_long[auction_trade_message_at] = auction_trade_message_value; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  fill_execution_flags(auction_trade_message_record.execution_flags, auction_trade_message_value);
  skip
}

/* each byte of Auction Trade Message set to where it lies, so a field read out of place says so */
inline ramp_auction_trade_message(auction_trade_message_record, auction_trade_message_base) {
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.time_offset[auction_trade_message_at] = (auction_trade_message_base + 0 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.auction_id[auction_trade_message_at] = (auction_trade_message_base + 4 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.execution_id[auction_trade_message_at] = (auction_trade_message_base + 12 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.price_long[auction_trade_message_at] = (auction_trade_message_base + 20 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.contracts_long[auction_trade_message_at] = (auction_trade_message_base + 28 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  ramp_execution_flags(auction_trade_message_record.execution_flags, auction_trade_message_base + 32);
  skip
}

/* Auction Trade Message to the wire, 36 bytes from where the cursor stands */
inline encode_auction_trade_message(auction_trade_message_record) {
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> wire[at] = auction_trade_message_record.time_offset[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> wire[at] = auction_trade_message_record.auction_id[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> wire[at] = auction_trade_message_record.execution_id[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> wire[at] = auction_trade_message_record.price_long[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> wire[at] = auction_trade_message_record.contracts_long[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  encode_execution_flags(auction_trade_message_record.execution_flags);
  skip
}

/* Auction Trade Message off the wire, 36 bytes from where the cursor stands */
inline decode_auction_trade_message(auction_trade_message_record) {
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.time_offset[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.auction_id[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.execution_id[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.price_long[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.contracts_long[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  decode_execution_flags(auction_trade_message_record.execution_flags);
  skip
}

/* what was read of Auction Trade Message is what was written, byte for byte */
inline equal_auction_trade_message(auction_trade_message_read, auction_trade_message_written) {
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> assert(auction_trade_message_read.time_offset[auction_trade_message_at] == auction_trade_message_written.time_offset[auction_trade_message_at]); auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> assert(auction_trade_message_read.auction_id[auction_trade_message_at] == auction_trade_message_written.auction_id[auction_trade_message_at]); auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> assert(auction_trade_message_read.execution_id[auction_trade_message_at] == auction_trade_message_written.execution_id[auction_trade_message_at]); auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> assert(auction_trade_message_read.price_long[auction_trade_message_at] == auction_trade_message_written.price_long[auction_trade_message_at]); auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> assert(auction_trade_message_read.contracts_long[auction_trade_message_at] == auction_trade_message_written.contracts_long[auction_trade_message_at]); auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  equal_execution_flags(auction_trade_message_read.execution_flags, auction_trade_message_written.execution_flags);
  skip
}

/* ---- Width Update Message: 17 bytes ------------------------------------------ */

/* Width Update Message */
typedef WidthUpdateMessage {
  byte time_offset[4];
  byte product_code[8];
  byte width_type;
  byte multiplier[4]
};

int width_update_message_at;

/* every byte of Width Update Message set to one value */
inline fill_width_update_message(width_update_message_record, width_update_message_value) {
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> width_update_message_record.time_offset[width_update_message_at] = width_update_message_value; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 8 -> width_update_message_record.product_code[width_update_message_at] = width_update_message_value; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  width_update_message_record.width_type = width_update_message_value;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> width_update_message_record.multiplier[width_update_message_at] = width_update_message_value; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Width Update Message set to where it lies, so a field read out of place says so */
inline ramp_width_update_message(width_update_message_record, width_update_message_base) {
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> width_update_message_record.time_offset[width_update_message_at] = (width_update_message_base + 0 + width_update_message_at + 1) % 256; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 8 -> width_update_message_record.product_code[width_update_message_at] = (width_update_message_base + 4 + width_update_message_at + 1) % 256; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  width_update_message_record.width_type = (width_update_message_base + 12 + 1) % 256;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> width_update_message_record.multiplier[width_update_message_at] = (width_update_message_base + 13 + width_update_message_at + 1) % 256; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Width Update Message to the wire, 17 bytes from where the cursor stands */
inline encode_width_update_message(width_update_message_record) {
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> wire[at] = width_update_message_record.time_offset[width_update_message_at]; at = at + 1; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 8 -> wire[at] = width_update_message_record.product_code[width_update_message_at]; at = at + 1; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  wire[at] = width_update_message_record.width_type; at = at + 1;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> wire[at] = width_update_message_record.multiplier[width_update_message_at]; at = at + 1; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Width Update Message off the wire, 17 bytes from where the cursor stands */
inline decode_width_update_message(width_update_message_record) {
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> width_update_message_record.time_offset[width_update_message_at] = wire[at]; at = at + 1; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 8 -> width_update_message_record.product_code[width_update_message_at] = wire[at]; at = at + 1; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  width_update_message_record.width_type = wire[at]; at = at + 1;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> width_update_message_record.multiplier[width_update_message_at] = wire[at]; at = at + 1; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Width Update Message is what was written, byte for byte */
inline equal_width_update_message(width_update_message_read, width_update_message_written) {
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> assert(width_update_message_read.time_offset[width_update_message_at] == width_update_message_written.time_offset[width_update_message_at]); width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 8 -> assert(width_update_message_read.product_code[width_update_message_at] == width_update_message_written.product_code[width_update_message_at]); width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  assert(width_update_message_read.width_type == width_update_message_written.width_type);
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> assert(width_update_message_read.multiplier[width_update_message_at] == width_update_message_written.multiplier[width_update_message_at]); width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Futures Instrument Definition Message: 33 bytes ------------------------- */

/* Futures Instrument Definition Message */
typedef FuturesInstrumentDefinitionMessage {
  byte time_offset[4];
  byte symbol[6];
  byte product_code[8];
  byte expiration_date[4];
  byte contract_size[2];
  byte listing_state;
  byte price_increment[8]
};

int futures_instrument_definition_message_at;

/* every byte of Futures Instrument Definition Message set to one value */
inline fill_futures_instrument_definition_message(futures_instrument_definition_message_record, futures_instrument_definition_message_value) {
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 4 -> futures_instrument_definition_message_record.time_offset[futures_instrument_definition_message_at] = futures_instrument_definition_message_value; futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 6 -> futures_instrument_definition_message_record.symbol[futures_instrument_definition_message_at] = futures_instrument_definition_message_value; futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 8 -> futures_instrument_definition_message_record.product_code[futures_instrument_definition_message_at] = futures_instrument_definition_message_value; futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 4 -> futures_instrument_definition_message_record.expiration_date[futures_instrument_definition_message_at] = futures_instrument_definition_message_value; futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 2 -> futures_instrument_definition_message_record.contract_size[futures_instrument_definition_message_at] = futures_instrument_definition_message_value; futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  futures_instrument_definition_message_record.listing_state = futures_instrument_definition_message_value;
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 8 -> futures_instrument_definition_message_record.price_increment[futures_instrument_definition_message_at] = futures_instrument_definition_message_value; futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Futures Instrument Definition Message set to where it lies, so a field read out of place says so */
inline ramp_futures_instrument_definition_message(futures_instrument_definition_message_record, futures_instrument_definition_message_base) {
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 4 -> futures_instrument_definition_message_record.time_offset[futures_instrument_definition_message_at] = (futures_instrument_definition_message_base + 0 + futures_instrument_definition_message_at + 1) % 256; futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 6 -> futures_instrument_definition_message_record.symbol[futures_instrument_definition_message_at] = (futures_instrument_definition_message_base + 4 + futures_instrument_definition_message_at + 1) % 256; futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 8 -> futures_instrument_definition_message_record.product_code[futures_instrument_definition_message_at] = (futures_instrument_definition_message_base + 10 + futures_instrument_definition_message_at + 1) % 256; futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 4 -> futures_instrument_definition_message_record.expiration_date[futures_instrument_definition_message_at] = (futures_instrument_definition_message_base + 18 + futures_instrument_definition_message_at + 1) % 256; futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 2 -> futures_instrument_definition_message_record.contract_size[futures_instrument_definition_message_at] = (futures_instrument_definition_message_base + 22 + futures_instrument_definition_message_at + 1) % 256; futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  futures_instrument_definition_message_record.listing_state = (futures_instrument_definition_message_base + 24 + 1) % 256;
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 8 -> futures_instrument_definition_message_record.price_increment[futures_instrument_definition_message_at] = (futures_instrument_definition_message_base + 25 + futures_instrument_definition_message_at + 1) % 256; futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Futures Instrument Definition Message to the wire, 33 bytes from where the cursor stands */
inline encode_futures_instrument_definition_message(futures_instrument_definition_message_record) {
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 4 -> wire[at] = futures_instrument_definition_message_record.time_offset[futures_instrument_definition_message_at]; at = at + 1; futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 6 -> wire[at] = futures_instrument_definition_message_record.symbol[futures_instrument_definition_message_at]; at = at + 1; futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 8 -> wire[at] = futures_instrument_definition_message_record.product_code[futures_instrument_definition_message_at]; at = at + 1; futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 4 -> wire[at] = futures_instrument_definition_message_record.expiration_date[futures_instrument_definition_message_at]; at = at + 1; futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 2 -> wire[at] = futures_instrument_definition_message_record.contract_size[futures_instrument_definition_message_at]; at = at + 1; futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = futures_instrument_definition_message_record.listing_state; at = at + 1;
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 8 -> wire[at] = futures_instrument_definition_message_record.price_increment[futures_instrument_definition_message_at]; at = at + 1; futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Futures Instrument Definition Message off the wire, 33 bytes from where the cursor stands */
inline decode_futures_instrument_definition_message(futures_instrument_definition_message_record) {
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 4 -> futures_instrument_definition_message_record.time_offset[futures_instrument_definition_message_at] = wire[at]; at = at + 1; futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 6 -> futures_instrument_definition_message_record.symbol[futures_instrument_definition_message_at] = wire[at]; at = at + 1; futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 8 -> futures_instrument_definition_message_record.product_code[futures_instrument_definition_message_at] = wire[at]; at = at + 1; futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 4 -> futures_instrument_definition_message_record.expiration_date[futures_instrument_definition_message_at] = wire[at]; at = at + 1; futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 2 -> futures_instrument_definition_message_record.contract_size[futures_instrument_definition_message_at] = wire[at]; at = at + 1; futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  futures_instrument_definition_message_record.listing_state = wire[at]; at = at + 1;
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 8 -> futures_instrument_definition_message_record.price_increment[futures_instrument_definition_message_at] = wire[at]; at = at + 1; futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Futures Instrument Definition Message is what was written, byte for byte */
inline equal_futures_instrument_definition_message(futures_instrument_definition_message_read, futures_instrument_definition_message_written) {
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 4 -> assert(futures_instrument_definition_message_read.time_offset[futures_instrument_definition_message_at] == futures_instrument_definition_message_written.time_offset[futures_instrument_definition_message_at]); futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 6 -> assert(futures_instrument_definition_message_read.symbol[futures_instrument_definition_message_at] == futures_instrument_definition_message_written.symbol[futures_instrument_definition_message_at]); futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 8 -> assert(futures_instrument_definition_message_read.product_code[futures_instrument_definition_message_at] == futures_instrument_definition_message_written.product_code[futures_instrument_definition_message_at]); futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 4 -> assert(futures_instrument_definition_message_read.expiration_date[futures_instrument_definition_message_at] == futures_instrument_definition_message_written.expiration_date[futures_instrument_definition_message_at]); futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 2 -> assert(futures_instrument_definition_message_read.contract_size[futures_instrument_definition_message_at] == futures_instrument_definition_message_written.contract_size[futures_instrument_definition_message_at]); futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  assert(futures_instrument_definition_message_read.listing_state == futures_instrument_definition_message_written.listing_state);
  futures_instrument_definition_message_at = 0;
  do
  :: futures_instrument_definition_message_at < 8 -> assert(futures_instrument_definition_message_read.price_increment[futures_instrument_definition_message_at] == futures_instrument_definition_message_written.price_increment[futures_instrument_definition_message_at]); futures_instrument_definition_message_at = futures_instrument_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Options Instrument Definition Message: 42 bytes ------------------------- */

/* Options Instrument Definition Message */
typedef OptionsInstrumentDefinitionMessage {
  byte time_offset[4];
  byte symbol[6];
  byte product_code[8];
  byte call_put;
  byte expiration_date[4];
  byte strike_price[8];
  byte contract_size[2];
  byte listing_state;
  byte price_increment[8]
};

int options_instrument_definition_message_at;

/* every byte of Options Instrument Definition Message set to one value */
inline fill_options_instrument_definition_message(options_instrument_definition_message_record, options_instrument_definition_message_value) {
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 4 -> options_instrument_definition_message_record.time_offset[options_instrument_definition_message_at] = options_instrument_definition_message_value; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 6 -> options_instrument_definition_message_record.symbol[options_instrument_definition_message_at] = options_instrument_definition_message_value; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 8 -> options_instrument_definition_message_record.product_code[options_instrument_definition_message_at] = options_instrument_definition_message_value; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  options_instrument_definition_message_record.call_put = options_instrument_definition_message_value;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 4 -> options_instrument_definition_message_record.expiration_date[options_instrument_definition_message_at] = options_instrument_definition_message_value; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 8 -> options_instrument_definition_message_record.strike_price[options_instrument_definition_message_at] = options_instrument_definition_message_value; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 2 -> options_instrument_definition_message_record.contract_size[options_instrument_definition_message_at] = options_instrument_definition_message_value; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  options_instrument_definition_message_record.listing_state = options_instrument_definition_message_value;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 8 -> options_instrument_definition_message_record.price_increment[options_instrument_definition_message_at] = options_instrument_definition_message_value; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Options Instrument Definition Message set to where it lies, so a field read out of place says so */
inline ramp_options_instrument_definition_message(options_instrument_definition_message_record, options_instrument_definition_message_base) {
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 4 -> options_instrument_definition_message_record.time_offset[options_instrument_definition_message_at] = (options_instrument_definition_message_base + 0 + options_instrument_definition_message_at + 1) % 256; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 6 -> options_instrument_definition_message_record.symbol[options_instrument_definition_message_at] = (options_instrument_definition_message_base + 4 + options_instrument_definition_message_at + 1) % 256; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 8 -> options_instrument_definition_message_record.product_code[options_instrument_definition_message_at] = (options_instrument_definition_message_base + 10 + options_instrument_definition_message_at + 1) % 256; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  options_instrument_definition_message_record.call_put = (options_instrument_definition_message_base + 18 + 1) % 256;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 4 -> options_instrument_definition_message_record.expiration_date[options_instrument_definition_message_at] = (options_instrument_definition_message_base + 19 + options_instrument_definition_message_at + 1) % 256; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 8 -> options_instrument_definition_message_record.strike_price[options_instrument_definition_message_at] = (options_instrument_definition_message_base + 23 + options_instrument_definition_message_at + 1) % 256; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 2 -> options_instrument_definition_message_record.contract_size[options_instrument_definition_message_at] = (options_instrument_definition_message_base + 31 + options_instrument_definition_message_at + 1) % 256; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  options_instrument_definition_message_record.listing_state = (options_instrument_definition_message_base + 33 + 1) % 256;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 8 -> options_instrument_definition_message_record.price_increment[options_instrument_definition_message_at] = (options_instrument_definition_message_base + 34 + options_instrument_definition_message_at + 1) % 256; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Options Instrument Definition Message to the wire, 42 bytes from where the cursor stands */
inline encode_options_instrument_definition_message(options_instrument_definition_message_record) {
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 4 -> wire[at] = options_instrument_definition_message_record.time_offset[options_instrument_definition_message_at]; at = at + 1; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 6 -> wire[at] = options_instrument_definition_message_record.symbol[options_instrument_definition_message_at]; at = at + 1; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 8 -> wire[at] = options_instrument_definition_message_record.product_code[options_instrument_definition_message_at]; at = at + 1; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = options_instrument_definition_message_record.call_put; at = at + 1;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 4 -> wire[at] = options_instrument_definition_message_record.expiration_date[options_instrument_definition_message_at]; at = at + 1; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 8 -> wire[at] = options_instrument_definition_message_record.strike_price[options_instrument_definition_message_at]; at = at + 1; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 2 -> wire[at] = options_instrument_definition_message_record.contract_size[options_instrument_definition_message_at]; at = at + 1; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = options_instrument_definition_message_record.listing_state; at = at + 1;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 8 -> wire[at] = options_instrument_definition_message_record.price_increment[options_instrument_definition_message_at]; at = at + 1; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Options Instrument Definition Message off the wire, 42 bytes from where the cursor stands */
inline decode_options_instrument_definition_message(options_instrument_definition_message_record) {
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 4 -> options_instrument_definition_message_record.time_offset[options_instrument_definition_message_at] = wire[at]; at = at + 1; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 6 -> options_instrument_definition_message_record.symbol[options_instrument_definition_message_at] = wire[at]; at = at + 1; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 8 -> options_instrument_definition_message_record.product_code[options_instrument_definition_message_at] = wire[at]; at = at + 1; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  options_instrument_definition_message_record.call_put = wire[at]; at = at + 1;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 4 -> options_instrument_definition_message_record.expiration_date[options_instrument_definition_message_at] = wire[at]; at = at + 1; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 8 -> options_instrument_definition_message_record.strike_price[options_instrument_definition_message_at] = wire[at]; at = at + 1; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 2 -> options_instrument_definition_message_record.contract_size[options_instrument_definition_message_at] = wire[at]; at = at + 1; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  options_instrument_definition_message_record.listing_state = wire[at]; at = at + 1;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 8 -> options_instrument_definition_message_record.price_increment[options_instrument_definition_message_at] = wire[at]; at = at + 1; options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Options Instrument Definition Message is what was written, byte for byte */
inline equal_options_instrument_definition_message(options_instrument_definition_message_read, options_instrument_definition_message_written) {
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 4 -> assert(options_instrument_definition_message_read.time_offset[options_instrument_definition_message_at] == options_instrument_definition_message_written.time_offset[options_instrument_definition_message_at]); options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 6 -> assert(options_instrument_definition_message_read.symbol[options_instrument_definition_message_at] == options_instrument_definition_message_written.symbol[options_instrument_definition_message_at]); options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 8 -> assert(options_instrument_definition_message_read.product_code[options_instrument_definition_message_at] == options_instrument_definition_message_written.product_code[options_instrument_definition_message_at]); options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  assert(options_instrument_definition_message_read.call_put == options_instrument_definition_message_written.call_put);
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 4 -> assert(options_instrument_definition_message_read.expiration_date[options_instrument_definition_message_at] == options_instrument_definition_message_written.expiration_date[options_instrument_definition_message_at]); options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 8 -> assert(options_instrument_definition_message_read.strike_price[options_instrument_definition_message_at] == options_instrument_definition_message_written.strike_price[options_instrument_definition_message_at]); options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 2 -> assert(options_instrument_definition_message_read.contract_size[options_instrument_definition_message_at] == options_instrument_definition_message_written.contract_size[options_instrument_definition_message_at]); options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  assert(options_instrument_definition_message_read.listing_state == options_instrument_definition_message_written.listing_state);
  options_instrument_definition_message_at = 0;
  do
  :: options_instrument_definition_message_at < 8 -> assert(options_instrument_definition_message_read.price_increment[options_instrument_definition_message_at] == options_instrument_definition_message_written.price_increment[options_instrument_definition_message_at]); options_instrument_definition_message_at = options_instrument_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Break Message: 12 bytes ------------------------------------------- */

/* Trade Break Message */
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

/* ---- Settlement Message: 23 bytes -------------------------------------------- */

/* Settlement Message */
typedef SettlementMessage {
  byte time_offset[4];
  byte symbol[6];
  byte trade_date[4];
  byte settlement_price[8];
  byte issue
};

int settlement_message_at;

/* every byte of Settlement Message set to one value */
inline fill_settlement_message(settlement_message_record, settlement_message_value) {
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> settlement_message_record.time_offset[settlement_message_at] = settlement_message_value; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 6 -> settlement_message_record.symbol[settlement_message_at] = settlement_message_value; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> settlement_message_record.trade_date[settlement_message_at] = settlement_message_value; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 8 -> settlement_message_record.settlement_price[settlement_message_at] = settlement_message_value; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_record.issue = settlement_message_value;
  skip
}

/* each byte of Settlement Message set to where it lies, so a field read out of place says so */
inline ramp_settlement_message(settlement_message_record, settlement_message_base) {
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> settlement_message_record.time_offset[settlement_message_at] = (settlement_message_base + 0 + settlement_message_at + 1) % 256; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 6 -> settlement_message_record.symbol[settlement_message_at] = (settlement_message_base + 4 + settlement_message_at + 1) % 256; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> settlement_message_record.trade_date[settlement_message_at] = (settlement_message_base + 10 + settlement_message_at + 1) % 256; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 8 -> settlement_message_record.settlement_price[settlement_message_at] = (settlement_message_base + 14 + settlement_message_at + 1) % 256; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_record.issue = (settlement_message_base + 22 + 1) % 256;
  skip
}

/* Settlement Message to the wire, 23 bytes from where the cursor stands */
inline encode_settlement_message(settlement_message_record) {
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> wire[at] = settlement_message_record.time_offset[settlement_message_at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 6 -> wire[at] = settlement_message_record.symbol[settlement_message_at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> wire[at] = settlement_message_record.trade_date[settlement_message_at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 8 -> wire[at] = settlement_message_record.settlement_price[settlement_message_at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  wire[at] = settlement_message_record.issue; at = at + 1;
  skip
}

/* Settlement Message off the wire, 23 bytes from where the cursor stands */
inline decode_settlement_message(settlement_message_record) {
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> settlement_message_record.time_offset[settlement_message_at] = wire[at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 6 -> settlement_message_record.symbol[settlement_message_at] = wire[at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> settlement_message_record.trade_date[settlement_message_at] = wire[at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 8 -> settlement_message_record.settlement_price[settlement_message_at] = wire[at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_record.issue = wire[at]; at = at + 1;
  skip
}

/* what was read of Settlement Message is what was written, byte for byte */
inline equal_settlement_message(settlement_message_read, settlement_message_written) {
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> assert(settlement_message_read.time_offset[settlement_message_at] == settlement_message_written.time_offset[settlement_message_at]); settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 6 -> assert(settlement_message_read.symbol[settlement_message_at] == settlement_message_written.symbol[settlement_message_at]); settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> assert(settlement_message_read.trade_date[settlement_message_at] == settlement_message_written.trade_date[settlement_message_at]); settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 8 -> assert(settlement_message_read.settlement_price[settlement_message_at] == settlement_message_written.settlement_price[settlement_message_at]); settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  assert(settlement_message_read.issue == settlement_message_written.issue);
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
    assert(at == 46);
    at = 0;
    decode_trade_long_message(trade_long_message_got);
    assert(at == 46);
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
    assert(at == 66);
    at = 0;
    decode_trade_extended_message(trade_extended_message_got);
    assert(at == 66);
    equal_trade_extended_message(trade_extended_message_got, trade_extended_message_sent)
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
    assert(at == 16);
    at = 0;
    decode_trading_status_message(trading_status_message_got);
    assert(at == 16);
    equal_trading_status_message(trading_status_message_got, trading_status_message_sent)
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

/* Opening Auction Update Message: encoded, read back, and compared */
proctype check_opening_auction_update_message() {
  OpeningAuctionUpdateMessage opening_auction_update_message_sent;
  OpeningAuctionUpdateMessage opening_auction_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_opening_auction_update_message(opening_auction_update_message_sent, 0)
  :: pattern == 1 -> fill_opening_auction_update_message(opening_auction_update_message_sent, 32)
  :: pattern == 2 -> fill_opening_auction_update_message(opening_auction_update_message_sent, 255)
  :: else -> ramp_opening_auction_update_message(opening_auction_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_opening_auction_update_message(opening_auction_update_message_sent);
    assert(at == 62);
    at = 0;
    decode_opening_auction_update_message(opening_auction_update_message_got);
    assert(at == 62);
    equal_opening_auction_update_message(opening_auction_update_message_got, opening_auction_update_message_sent)
  }
}

/* Auction Notification Message: encoded, read back, and compared */
proctype check_auction_notification_message() {
  AuctionNotificationMessage auction_notification_message_sent;
  AuctionNotificationMessage auction_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_notification_message(auction_notification_message_sent, 0)
  :: pattern == 1 -> fill_auction_notification_message(auction_notification_message_sent, 32)
  :: pattern == 2 -> fill_auction_notification_message(auction_notification_message_sent, 255)
  :: else -> ramp_auction_notification_message(auction_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_notification_message(auction_notification_message_sent);
    assert(at == 41);
    at = 0;
    decode_auction_notification_message(auction_notification_message_got);
    assert(at == 41);
    equal_auction_notification_message(auction_notification_message_got, auction_notification_message_sent)
  }
}

/* Auction Cancel Message: encoded, read back, and compared */
proctype check_auction_cancel_message() {
  AuctionCancelMessage auction_cancel_message_sent;
  AuctionCancelMessage auction_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_cancel_message(auction_cancel_message_sent, 0)
  :: pattern == 1 -> fill_auction_cancel_message(auction_cancel_message_sent, 32)
  :: pattern == 2 -> fill_auction_cancel_message(auction_cancel_message_sent, 255)
  :: else -> ramp_auction_cancel_message(auction_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_cancel_message(auction_cancel_message_sent);
    assert(at == 12);
    at = 0;
    decode_auction_cancel_message(auction_cancel_message_got);
    assert(at == 12);
    equal_auction_cancel_message(auction_cancel_message_got, auction_cancel_message_sent)
  }
}

/* Auction Trade Message: encoded, read back, and compared */
proctype check_auction_trade_message() {
  AuctionTradeMessage auction_trade_message_sent;
  AuctionTradeMessage auction_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_trade_message(auction_trade_message_sent, 0)
  :: pattern == 1 -> fill_auction_trade_message(auction_trade_message_sent, 32)
  :: pattern == 2 -> fill_auction_trade_message(auction_trade_message_sent, 255)
  :: else -> ramp_auction_trade_message(auction_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_trade_message(auction_trade_message_sent);
    assert(at == 36);
    at = 0;
    decode_auction_trade_message(auction_trade_message_got);
    assert(at == 36);
    equal_auction_trade_message(auction_trade_message_got, auction_trade_message_sent)
  }
}

/* Width Update Message: encoded, read back, and compared */
proctype check_width_update_message() {
  WidthUpdateMessage width_update_message_sent;
  WidthUpdateMessage width_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_width_update_message(width_update_message_sent, 0)
  :: pattern == 1 -> fill_width_update_message(width_update_message_sent, 32)
  :: pattern == 2 -> fill_width_update_message(width_update_message_sent, 255)
  :: else -> ramp_width_update_message(width_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_width_update_message(width_update_message_sent);
    assert(at == 17);
    at = 0;
    decode_width_update_message(width_update_message_got);
    assert(at == 17);
    equal_width_update_message(width_update_message_got, width_update_message_sent)
  }
}

/* Futures Instrument Definition Message: encoded, read back, and compared */
proctype check_futures_instrument_definition_message() {
  FuturesInstrumentDefinitionMessage futures_instrument_definition_message_sent;
  FuturesInstrumentDefinitionMessage futures_instrument_definition_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_futures_instrument_definition_message(futures_instrument_definition_message_sent, 0)
  :: pattern == 1 -> fill_futures_instrument_definition_message(futures_instrument_definition_message_sent, 32)
  :: pattern == 2 -> fill_futures_instrument_definition_message(futures_instrument_definition_message_sent, 255)
  :: else -> ramp_futures_instrument_definition_message(futures_instrument_definition_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_futures_instrument_definition_message(futures_instrument_definition_message_sent);
    assert(at == 33);
    at = 0;
    decode_futures_instrument_definition_message(futures_instrument_definition_message_got);
    assert(at == 33);
    equal_futures_instrument_definition_message(futures_instrument_definition_message_got, futures_instrument_definition_message_sent)
  }
}

/* Options Instrument Definition Message: encoded, read back, and compared */
proctype check_options_instrument_definition_message() {
  OptionsInstrumentDefinitionMessage options_instrument_definition_message_sent;
  OptionsInstrumentDefinitionMessage options_instrument_definition_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_options_instrument_definition_message(options_instrument_definition_message_sent, 0)
  :: pattern == 1 -> fill_options_instrument_definition_message(options_instrument_definition_message_sent, 32)
  :: pattern == 2 -> fill_options_instrument_definition_message(options_instrument_definition_message_sent, 255)
  :: else -> ramp_options_instrument_definition_message(options_instrument_definition_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_options_instrument_definition_message(options_instrument_definition_message_sent);
    assert(at == 42);
    at = 0;
    decode_options_instrument_definition_message(options_instrument_definition_message_got);
    assert(at == 42);
    equal_options_instrument_definition_message(options_instrument_definition_message_got, options_instrument_definition_message_sent)
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

/* Settlement Message: encoded, read back, and compared */
proctype check_settlement_message() {
  SettlementMessage settlement_message_sent;
  SettlementMessage settlement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_settlement_message(settlement_message_sent, 0)
  :: pattern == 1 -> fill_settlement_message(settlement_message_sent, 32)
  :: pattern == 2 -> fill_settlement_message(settlement_message_sent, 255)
  :: else -> ramp_settlement_message(settlement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_settlement_message(settlement_message_sent);
    assert(at == 23);
    at = 0;
    decode_settlement_message(settlement_message_got);
    assert(at == 23);
    equal_settlement_message(settlement_message_got, settlement_message_sent)
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
  :: run check_end_of_session_message()
  :: run check_transaction_begin_message()
  :: run check_transaction_end_message()
  :: run check_trading_status_message()
  :: run check_auction_summary_message()
  :: run check_opening_auction_update_message()
  :: run check_auction_notification_message()
  :: run check_auction_cancel_message()
  :: run check_auction_trade_message()
  :: run check_width_update_message()
  :: run check_futures_instrument_definition_message()
  :: run check_options_instrument_definition_message()
  :: run check_trade_break_message()
  :: run check_settlement_message()
  fi
}
