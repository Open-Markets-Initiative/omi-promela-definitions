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
#define WIRE 45

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

/* ---- Eq Time Message: 4 bytes ------------------------------------------------ */

/* A Time message is immediately generated and sent when there is a PITCH event for a given clock second */
typedef EqTimeMessage {
  byte time[4]
};

int eq_time_message_at;

/* every byte of Eq Time Message set to one value */
inline fill_eq_time_message(eq_time_message_record, eq_time_message_value) {
  eq_time_message_at = 0;
  do
  :: eq_time_message_at < 4 -> eq_time_message_record.time[eq_time_message_at] = eq_time_message_value; eq_time_message_at = eq_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Eq Time Message set to where it lies, so a field read out of place says so */
inline ramp_eq_time_message(eq_time_message_record, eq_time_message_base) {
  eq_time_message_at = 0;
  do
  :: eq_time_message_at < 4 -> eq_time_message_record.time[eq_time_message_at] = (eq_time_message_base + 0 + eq_time_message_at + 1) % 256; eq_time_message_at = eq_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* Eq Time Message to the wire, 4 bytes from where the cursor stands */
inline encode_eq_time_message(eq_time_message_record) {
  eq_time_message_at = 0;
  do
  :: eq_time_message_at < 4 -> wire[at] = eq_time_message_record.time[eq_time_message_at]; at = at + 1; eq_time_message_at = eq_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* Eq Time Message off the wire, 4 bytes from where the cursor stands */
inline decode_eq_time_message(eq_time_message_record) {
  eq_time_message_at = 0;
  do
  :: eq_time_message_at < 4 -> eq_time_message_record.time[eq_time_message_at] = wire[at]; at = at + 1; eq_time_message_at = eq_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Eq Time Message is what was written, byte for byte */
inline equal_eq_time_message(eq_time_message_read, eq_time_message_written) {
  eq_time_message_at = 0;
  do
  :: eq_time_message_at < 4 -> assert(eq_time_message_read.time[eq_time_message_at] == eq_time_message_written.time[eq_time_message_at]); eq_time_message_at = eq_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Eq Unit Clear Message: 4 bytes ------------------------------------------ */

/* The Unit Clear message instructs feed recipients to clear all orders for the Cboe book in the unit specified in the Sequenced Unit Header */
typedef EqUnitClearMessage {
  byte time_offset[4]
};

int eq_unit_clear_message_at;

/* every byte of Eq Unit Clear Message set to one value */
inline fill_eq_unit_clear_message(eq_unit_clear_message_record, eq_unit_clear_message_value) {
  eq_unit_clear_message_at = 0;
  do
  :: eq_unit_clear_message_at < 4 -> eq_unit_clear_message_record.time_offset[eq_unit_clear_message_at] = eq_unit_clear_message_value; eq_unit_clear_message_at = eq_unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Eq Unit Clear Message set to where it lies, so a field read out of place says so */
inline ramp_eq_unit_clear_message(eq_unit_clear_message_record, eq_unit_clear_message_base) {
  eq_unit_clear_message_at = 0;
  do
  :: eq_unit_clear_message_at < 4 -> eq_unit_clear_message_record.time_offset[eq_unit_clear_message_at] = (eq_unit_clear_message_base + 0 + eq_unit_clear_message_at + 1) % 256; eq_unit_clear_message_at = eq_unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Eq Unit Clear Message to the wire, 4 bytes from where the cursor stands */
inline encode_eq_unit_clear_message(eq_unit_clear_message_record) {
  eq_unit_clear_message_at = 0;
  do
  :: eq_unit_clear_message_at < 4 -> wire[at] = eq_unit_clear_message_record.time_offset[eq_unit_clear_message_at]; at = at + 1; eq_unit_clear_message_at = eq_unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Eq Unit Clear Message off the wire, 4 bytes from where the cursor stands */
inline decode_eq_unit_clear_message(eq_unit_clear_message_record) {
  eq_unit_clear_message_at = 0;
  do
  :: eq_unit_clear_message_at < 4 -> eq_unit_clear_message_record.time_offset[eq_unit_clear_message_at] = wire[at]; at = at + 1; eq_unit_clear_message_at = eq_unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Eq Unit Clear Message is what was written, byte for byte */
inline equal_eq_unit_clear_message(eq_unit_clear_message_read, eq_unit_clear_message_written) {
  eq_unit_clear_message_at = 0;
  do
  :: eq_unit_clear_message_at < 4 -> assert(eq_unit_clear_message_read.time_offset[eq_unit_clear_message_at] == eq_unit_clear_message_written.time_offset[eq_unit_clear_message_at]); eq_unit_clear_message_at = eq_unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Eq Order Executed Message: 24 bytes ------------------------------------- */

/* Order Executed messages are sent when a visible order on the Cboe book is executed in whole or in part */
typedef EqOrderExecutedMessage {
  byte time_offset[4];
  byte order_id[8];
  byte executed_quantity[4];
  byte execution_id[8]
};

int eq_order_executed_message_at;

/* every byte of Eq Order Executed Message set to one value */
inline fill_eq_order_executed_message(eq_order_executed_message_record, eq_order_executed_message_value) {
  eq_order_executed_message_at = 0;
  do
  :: eq_order_executed_message_at < 4 -> eq_order_executed_message_record.time_offset[eq_order_executed_message_at] = eq_order_executed_message_value; eq_order_executed_message_at = eq_order_executed_message_at + 1
  :: else -> break
  od;
  eq_order_executed_message_at = 0;
  do
  :: eq_order_executed_message_at < 8 -> eq_order_executed_message_record.order_id[eq_order_executed_message_at] = eq_order_executed_message_value; eq_order_executed_message_at = eq_order_executed_message_at + 1
  :: else -> break
  od;
  eq_order_executed_message_at = 0;
  do
  :: eq_order_executed_message_at < 4 -> eq_order_executed_message_record.executed_quantity[eq_order_executed_message_at] = eq_order_executed_message_value; eq_order_executed_message_at = eq_order_executed_message_at + 1
  :: else -> break
  od;
  eq_order_executed_message_at = 0;
  do
  :: eq_order_executed_message_at < 8 -> eq_order_executed_message_record.execution_id[eq_order_executed_message_at] = eq_order_executed_message_value; eq_order_executed_message_at = eq_order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Eq Order Executed Message set to where it lies, so a field read out of place says so */
inline ramp_eq_order_executed_message(eq_order_executed_message_record, eq_order_executed_message_base) {
  eq_order_executed_message_at = 0;
  do
  :: eq_order_executed_message_at < 4 -> eq_order_executed_message_record.time_offset[eq_order_executed_message_at] = (eq_order_executed_message_base + 0 + eq_order_executed_message_at + 1) % 256; eq_order_executed_message_at = eq_order_executed_message_at + 1
  :: else -> break
  od;
  eq_order_executed_message_at = 0;
  do
  :: eq_order_executed_message_at < 8 -> eq_order_executed_message_record.order_id[eq_order_executed_message_at] = (eq_order_executed_message_base + 4 + eq_order_executed_message_at + 1) % 256; eq_order_executed_message_at = eq_order_executed_message_at + 1
  :: else -> break
  od;
  eq_order_executed_message_at = 0;
  do
  :: eq_order_executed_message_at < 4 -> eq_order_executed_message_record.executed_quantity[eq_order_executed_message_at] = (eq_order_executed_message_base + 12 + eq_order_executed_message_at + 1) % 256; eq_order_executed_message_at = eq_order_executed_message_at + 1
  :: else -> break
  od;
  eq_order_executed_message_at = 0;
  do
  :: eq_order_executed_message_at < 8 -> eq_order_executed_message_record.execution_id[eq_order_executed_message_at] = (eq_order_executed_message_base + 16 + eq_order_executed_message_at + 1) % 256; eq_order_executed_message_at = eq_order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Eq Order Executed Message to the wire, 24 bytes from where the cursor stands */
inline encode_eq_order_executed_message(eq_order_executed_message_record) {
  eq_order_executed_message_at = 0;
  do
  :: eq_order_executed_message_at < 4 -> wire[at] = eq_order_executed_message_record.time_offset[eq_order_executed_message_at]; at = at + 1; eq_order_executed_message_at = eq_order_executed_message_at + 1
  :: else -> break
  od;
  eq_order_executed_message_at = 0;
  do
  :: eq_order_executed_message_at < 8 -> wire[at] = eq_order_executed_message_record.order_id[eq_order_executed_message_at]; at = at + 1; eq_order_executed_message_at = eq_order_executed_message_at + 1
  :: else -> break
  od;
  eq_order_executed_message_at = 0;
  do
  :: eq_order_executed_message_at < 4 -> wire[at] = eq_order_executed_message_record.executed_quantity[eq_order_executed_message_at]; at = at + 1; eq_order_executed_message_at = eq_order_executed_message_at + 1
  :: else -> break
  od;
  eq_order_executed_message_at = 0;
  do
  :: eq_order_executed_message_at < 8 -> wire[at] = eq_order_executed_message_record.execution_id[eq_order_executed_message_at]; at = at + 1; eq_order_executed_message_at = eq_order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Eq Order Executed Message off the wire, 24 bytes from where the cursor stands */
inline decode_eq_order_executed_message(eq_order_executed_message_record) {
  eq_order_executed_message_at = 0;
  do
  :: eq_order_executed_message_at < 4 -> eq_order_executed_message_record.time_offset[eq_order_executed_message_at] = wire[at]; at = at + 1; eq_order_executed_message_at = eq_order_executed_message_at + 1
  :: else -> break
  od;
  eq_order_executed_message_at = 0;
  do
  :: eq_order_executed_message_at < 8 -> eq_order_executed_message_record.order_id[eq_order_executed_message_at] = wire[at]; at = at + 1; eq_order_executed_message_at = eq_order_executed_message_at + 1
  :: else -> break
  od;
  eq_order_executed_message_at = 0;
  do
  :: eq_order_executed_message_at < 4 -> eq_order_executed_message_record.executed_quantity[eq_order_executed_message_at] = wire[at]; at = at + 1; eq_order_executed_message_at = eq_order_executed_message_at + 1
  :: else -> break
  od;
  eq_order_executed_message_at = 0;
  do
  :: eq_order_executed_message_at < 8 -> eq_order_executed_message_record.execution_id[eq_order_executed_message_at] = wire[at]; at = at + 1; eq_order_executed_message_at = eq_order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Eq Order Executed Message is what was written, byte for byte */
inline equal_eq_order_executed_message(eq_order_executed_message_read, eq_order_executed_message_written) {
  eq_order_executed_message_at = 0;
  do
  :: eq_order_executed_message_at < 4 -> assert(eq_order_executed_message_read.time_offset[eq_order_executed_message_at] == eq_order_executed_message_written.time_offset[eq_order_executed_message_at]); eq_order_executed_message_at = eq_order_executed_message_at + 1
  :: else -> break
  od;
  eq_order_executed_message_at = 0;
  do
  :: eq_order_executed_message_at < 8 -> assert(eq_order_executed_message_read.order_id[eq_order_executed_message_at] == eq_order_executed_message_written.order_id[eq_order_executed_message_at]); eq_order_executed_message_at = eq_order_executed_message_at + 1
  :: else -> break
  od;
  eq_order_executed_message_at = 0;
  do
  :: eq_order_executed_message_at < 4 -> assert(eq_order_executed_message_read.executed_quantity[eq_order_executed_message_at] == eq_order_executed_message_written.executed_quantity[eq_order_executed_message_at]); eq_order_executed_message_at = eq_order_executed_message_at + 1
  :: else -> break
  od;
  eq_order_executed_message_at = 0;
  do
  :: eq_order_executed_message_at < 8 -> assert(eq_order_executed_message_read.execution_id[eq_order_executed_message_at] == eq_order_executed_message_written.execution_id[eq_order_executed_message_at]); eq_order_executed_message_at = eq_order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Eq Order Executed At Price Size Message: 36 bytes ----------------------- */

/* Order Executed at Price/Size messages are sent when a visible order on the Cboe book is executed in whole or in part at a different price than the limit price on the original Add Order message or the limit order price in the latest Modify Order message referencing the Order Id */
typedef EqOrderExecutedAtPriceSizeMessage {
  byte time_offset[4];
  byte order_id[8];
  byte executed_quantity[4];
  byte remaining_quantity[4];
  byte execution_id[8];
  byte price_long[8]
};

int eq_order_executed_at_price_size_message_at;

/* every byte of Eq Order Executed At Price Size Message set to one value */
inline fill_eq_order_executed_at_price_size_message(eq_order_executed_at_price_size_message_record, eq_order_executed_at_price_size_message_value) {
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 4 -> eq_order_executed_at_price_size_message_record.time_offset[eq_order_executed_at_price_size_message_at] = eq_order_executed_at_price_size_message_value; eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 8 -> eq_order_executed_at_price_size_message_record.order_id[eq_order_executed_at_price_size_message_at] = eq_order_executed_at_price_size_message_value; eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 4 -> eq_order_executed_at_price_size_message_record.executed_quantity[eq_order_executed_at_price_size_message_at] = eq_order_executed_at_price_size_message_value; eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 4 -> eq_order_executed_at_price_size_message_record.remaining_quantity[eq_order_executed_at_price_size_message_at] = eq_order_executed_at_price_size_message_value; eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 8 -> eq_order_executed_at_price_size_message_record.execution_id[eq_order_executed_at_price_size_message_at] = eq_order_executed_at_price_size_message_value; eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 8 -> eq_order_executed_at_price_size_message_record.price_long[eq_order_executed_at_price_size_message_at] = eq_order_executed_at_price_size_message_value; eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Eq Order Executed At Price Size Message set to where it lies, so a field read out of place says so */
inline ramp_eq_order_executed_at_price_size_message(eq_order_executed_at_price_size_message_record, eq_order_executed_at_price_size_message_base) {
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 4 -> eq_order_executed_at_price_size_message_record.time_offset[eq_order_executed_at_price_size_message_at] = (eq_order_executed_at_price_size_message_base + 0 + eq_order_executed_at_price_size_message_at + 1) % 256; eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 8 -> eq_order_executed_at_price_size_message_record.order_id[eq_order_executed_at_price_size_message_at] = (eq_order_executed_at_price_size_message_base + 4 + eq_order_executed_at_price_size_message_at + 1) % 256; eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 4 -> eq_order_executed_at_price_size_message_record.executed_quantity[eq_order_executed_at_price_size_message_at] = (eq_order_executed_at_price_size_message_base + 12 + eq_order_executed_at_price_size_message_at + 1) % 256; eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 4 -> eq_order_executed_at_price_size_message_record.remaining_quantity[eq_order_executed_at_price_size_message_at] = (eq_order_executed_at_price_size_message_base + 16 + eq_order_executed_at_price_size_message_at + 1) % 256; eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 8 -> eq_order_executed_at_price_size_message_record.execution_id[eq_order_executed_at_price_size_message_at] = (eq_order_executed_at_price_size_message_base + 20 + eq_order_executed_at_price_size_message_at + 1) % 256; eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 8 -> eq_order_executed_at_price_size_message_record.price_long[eq_order_executed_at_price_size_message_at] = (eq_order_executed_at_price_size_message_base + 28 + eq_order_executed_at_price_size_message_at + 1) % 256; eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* Eq Order Executed At Price Size Message to the wire, 36 bytes from where the cursor stands */
inline encode_eq_order_executed_at_price_size_message(eq_order_executed_at_price_size_message_record) {
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 4 -> wire[at] = eq_order_executed_at_price_size_message_record.time_offset[eq_order_executed_at_price_size_message_at]; at = at + 1; eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 8 -> wire[at] = eq_order_executed_at_price_size_message_record.order_id[eq_order_executed_at_price_size_message_at]; at = at + 1; eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 4 -> wire[at] = eq_order_executed_at_price_size_message_record.executed_quantity[eq_order_executed_at_price_size_message_at]; at = at + 1; eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 4 -> wire[at] = eq_order_executed_at_price_size_message_record.remaining_quantity[eq_order_executed_at_price_size_message_at]; at = at + 1; eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 8 -> wire[at] = eq_order_executed_at_price_size_message_record.execution_id[eq_order_executed_at_price_size_message_at]; at = at + 1; eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 8 -> wire[at] = eq_order_executed_at_price_size_message_record.price_long[eq_order_executed_at_price_size_message_at]; at = at + 1; eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* Eq Order Executed At Price Size Message off the wire, 36 bytes from where the cursor stands */
inline decode_eq_order_executed_at_price_size_message(eq_order_executed_at_price_size_message_record) {
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 4 -> eq_order_executed_at_price_size_message_record.time_offset[eq_order_executed_at_price_size_message_at] = wire[at]; at = at + 1; eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 8 -> eq_order_executed_at_price_size_message_record.order_id[eq_order_executed_at_price_size_message_at] = wire[at]; at = at + 1; eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 4 -> eq_order_executed_at_price_size_message_record.executed_quantity[eq_order_executed_at_price_size_message_at] = wire[at]; at = at + 1; eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 4 -> eq_order_executed_at_price_size_message_record.remaining_quantity[eq_order_executed_at_price_size_message_at] = wire[at]; at = at + 1; eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 8 -> eq_order_executed_at_price_size_message_record.execution_id[eq_order_executed_at_price_size_message_at] = wire[at]; at = at + 1; eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 8 -> eq_order_executed_at_price_size_message_record.price_long[eq_order_executed_at_price_size_message_at] = wire[at]; at = at + 1; eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Eq Order Executed At Price Size Message is what was written, byte for byte */
inline equal_eq_order_executed_at_price_size_message(eq_order_executed_at_price_size_message_read, eq_order_executed_at_price_size_message_written) {
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 4 -> assert(eq_order_executed_at_price_size_message_read.time_offset[eq_order_executed_at_price_size_message_at] == eq_order_executed_at_price_size_message_written.time_offset[eq_order_executed_at_price_size_message_at]); eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 8 -> assert(eq_order_executed_at_price_size_message_read.order_id[eq_order_executed_at_price_size_message_at] == eq_order_executed_at_price_size_message_written.order_id[eq_order_executed_at_price_size_message_at]); eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 4 -> assert(eq_order_executed_at_price_size_message_read.executed_quantity[eq_order_executed_at_price_size_message_at] == eq_order_executed_at_price_size_message_written.executed_quantity[eq_order_executed_at_price_size_message_at]); eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 4 -> assert(eq_order_executed_at_price_size_message_read.remaining_quantity[eq_order_executed_at_price_size_message_at] == eq_order_executed_at_price_size_message_written.remaining_quantity[eq_order_executed_at_price_size_message_at]); eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 8 -> assert(eq_order_executed_at_price_size_message_read.execution_id[eq_order_executed_at_price_size_message_at] == eq_order_executed_at_price_size_message_written.execution_id[eq_order_executed_at_price_size_message_at]); eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  eq_order_executed_at_price_size_message_at = 0;
  do
  :: eq_order_executed_at_price_size_message_at < 8 -> assert(eq_order_executed_at_price_size_message_read.price_long[eq_order_executed_at_price_size_message_at] == eq_order_executed_at_price_size_message_written.price_long[eq_order_executed_at_price_size_message_at]); eq_order_executed_at_price_size_message_at = eq_order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Eq Reduce Size Long Message: 16 bytes ----------------------------------- */

/* Reduce Size messages are sent when a visible order on the Cboe book is partially reduced */
typedef EqReduceSizeLongMessage {
  byte time_offset[4];
  byte order_id[8];
  byte canceled_quantity_long[4]
};

int eq_reduce_size_long_message_at;

/* every byte of Eq Reduce Size Long Message set to one value */
inline fill_eq_reduce_size_long_message(eq_reduce_size_long_message_record, eq_reduce_size_long_message_value) {
  eq_reduce_size_long_message_at = 0;
  do
  :: eq_reduce_size_long_message_at < 4 -> eq_reduce_size_long_message_record.time_offset[eq_reduce_size_long_message_at] = eq_reduce_size_long_message_value; eq_reduce_size_long_message_at = eq_reduce_size_long_message_at + 1
  :: else -> break
  od;
  eq_reduce_size_long_message_at = 0;
  do
  :: eq_reduce_size_long_message_at < 8 -> eq_reduce_size_long_message_record.order_id[eq_reduce_size_long_message_at] = eq_reduce_size_long_message_value; eq_reduce_size_long_message_at = eq_reduce_size_long_message_at + 1
  :: else -> break
  od;
  eq_reduce_size_long_message_at = 0;
  do
  :: eq_reduce_size_long_message_at < 4 -> eq_reduce_size_long_message_record.canceled_quantity_long[eq_reduce_size_long_message_at] = eq_reduce_size_long_message_value; eq_reduce_size_long_message_at = eq_reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Eq Reduce Size Long Message set to where it lies, so a field read out of place says so */
inline ramp_eq_reduce_size_long_message(eq_reduce_size_long_message_record, eq_reduce_size_long_message_base) {
  eq_reduce_size_long_message_at = 0;
  do
  :: eq_reduce_size_long_message_at < 4 -> eq_reduce_size_long_message_record.time_offset[eq_reduce_size_long_message_at] = (eq_reduce_size_long_message_base + 0 + eq_reduce_size_long_message_at + 1) % 256; eq_reduce_size_long_message_at = eq_reduce_size_long_message_at + 1
  :: else -> break
  od;
  eq_reduce_size_long_message_at = 0;
  do
  :: eq_reduce_size_long_message_at < 8 -> eq_reduce_size_long_message_record.order_id[eq_reduce_size_long_message_at] = (eq_reduce_size_long_message_base + 4 + eq_reduce_size_long_message_at + 1) % 256; eq_reduce_size_long_message_at = eq_reduce_size_long_message_at + 1
  :: else -> break
  od;
  eq_reduce_size_long_message_at = 0;
  do
  :: eq_reduce_size_long_message_at < 4 -> eq_reduce_size_long_message_record.canceled_quantity_long[eq_reduce_size_long_message_at] = (eq_reduce_size_long_message_base + 12 + eq_reduce_size_long_message_at + 1) % 256; eq_reduce_size_long_message_at = eq_reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Eq Reduce Size Long Message to the wire, 16 bytes from where the cursor stands */
inline encode_eq_reduce_size_long_message(eq_reduce_size_long_message_record) {
  eq_reduce_size_long_message_at = 0;
  do
  :: eq_reduce_size_long_message_at < 4 -> wire[at] = eq_reduce_size_long_message_record.time_offset[eq_reduce_size_long_message_at]; at = at + 1; eq_reduce_size_long_message_at = eq_reduce_size_long_message_at + 1
  :: else -> break
  od;
  eq_reduce_size_long_message_at = 0;
  do
  :: eq_reduce_size_long_message_at < 8 -> wire[at] = eq_reduce_size_long_message_record.order_id[eq_reduce_size_long_message_at]; at = at + 1; eq_reduce_size_long_message_at = eq_reduce_size_long_message_at + 1
  :: else -> break
  od;
  eq_reduce_size_long_message_at = 0;
  do
  :: eq_reduce_size_long_message_at < 4 -> wire[at] = eq_reduce_size_long_message_record.canceled_quantity_long[eq_reduce_size_long_message_at]; at = at + 1; eq_reduce_size_long_message_at = eq_reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Eq Reduce Size Long Message off the wire, 16 bytes from where the cursor stands */
inline decode_eq_reduce_size_long_message(eq_reduce_size_long_message_record) {
  eq_reduce_size_long_message_at = 0;
  do
  :: eq_reduce_size_long_message_at < 4 -> eq_reduce_size_long_message_record.time_offset[eq_reduce_size_long_message_at] = wire[at]; at = at + 1; eq_reduce_size_long_message_at = eq_reduce_size_long_message_at + 1
  :: else -> break
  od;
  eq_reduce_size_long_message_at = 0;
  do
  :: eq_reduce_size_long_message_at < 8 -> eq_reduce_size_long_message_record.order_id[eq_reduce_size_long_message_at] = wire[at]; at = at + 1; eq_reduce_size_long_message_at = eq_reduce_size_long_message_at + 1
  :: else -> break
  od;
  eq_reduce_size_long_message_at = 0;
  do
  :: eq_reduce_size_long_message_at < 4 -> eq_reduce_size_long_message_record.canceled_quantity_long[eq_reduce_size_long_message_at] = wire[at]; at = at + 1; eq_reduce_size_long_message_at = eq_reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Eq Reduce Size Long Message is what was written, byte for byte */
inline equal_eq_reduce_size_long_message(eq_reduce_size_long_message_read, eq_reduce_size_long_message_written) {
  eq_reduce_size_long_message_at = 0;
  do
  :: eq_reduce_size_long_message_at < 4 -> assert(eq_reduce_size_long_message_read.time_offset[eq_reduce_size_long_message_at] == eq_reduce_size_long_message_written.time_offset[eq_reduce_size_long_message_at]); eq_reduce_size_long_message_at = eq_reduce_size_long_message_at + 1
  :: else -> break
  od;
  eq_reduce_size_long_message_at = 0;
  do
  :: eq_reduce_size_long_message_at < 8 -> assert(eq_reduce_size_long_message_read.order_id[eq_reduce_size_long_message_at] == eq_reduce_size_long_message_written.order_id[eq_reduce_size_long_message_at]); eq_reduce_size_long_message_at = eq_reduce_size_long_message_at + 1
  :: else -> break
  od;
  eq_reduce_size_long_message_at = 0;
  do
  :: eq_reduce_size_long_message_at < 4 -> assert(eq_reduce_size_long_message_read.canceled_quantity_long[eq_reduce_size_long_message_at] == eq_reduce_size_long_message_written.canceled_quantity_long[eq_reduce_size_long_message_at]); eq_reduce_size_long_message_at = eq_reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Eq Reduce Size Short Message: 14 bytes ---------------------------------- */

/* Reduce Size messages are sent when a visible order on the Cboe book is partially reduced */
typedef EqReduceSizeShortMessage {
  byte time_offset[4];
  byte order_id[8];
  byte canceled_quantity_short[2]
};

int eq_reduce_size_short_message_at;

/* every byte of Eq Reduce Size Short Message set to one value */
inline fill_eq_reduce_size_short_message(eq_reduce_size_short_message_record, eq_reduce_size_short_message_value) {
  eq_reduce_size_short_message_at = 0;
  do
  :: eq_reduce_size_short_message_at < 4 -> eq_reduce_size_short_message_record.time_offset[eq_reduce_size_short_message_at] = eq_reduce_size_short_message_value; eq_reduce_size_short_message_at = eq_reduce_size_short_message_at + 1
  :: else -> break
  od;
  eq_reduce_size_short_message_at = 0;
  do
  :: eq_reduce_size_short_message_at < 8 -> eq_reduce_size_short_message_record.order_id[eq_reduce_size_short_message_at] = eq_reduce_size_short_message_value; eq_reduce_size_short_message_at = eq_reduce_size_short_message_at + 1
  :: else -> break
  od;
  eq_reduce_size_short_message_at = 0;
  do
  :: eq_reduce_size_short_message_at < 2 -> eq_reduce_size_short_message_record.canceled_quantity_short[eq_reduce_size_short_message_at] = eq_reduce_size_short_message_value; eq_reduce_size_short_message_at = eq_reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Eq Reduce Size Short Message set to where it lies, so a field read out of place says so */
inline ramp_eq_reduce_size_short_message(eq_reduce_size_short_message_record, eq_reduce_size_short_message_base) {
  eq_reduce_size_short_message_at = 0;
  do
  :: eq_reduce_size_short_message_at < 4 -> eq_reduce_size_short_message_record.time_offset[eq_reduce_size_short_message_at] = (eq_reduce_size_short_message_base + 0 + eq_reduce_size_short_message_at + 1) % 256; eq_reduce_size_short_message_at = eq_reduce_size_short_message_at + 1
  :: else -> break
  od;
  eq_reduce_size_short_message_at = 0;
  do
  :: eq_reduce_size_short_message_at < 8 -> eq_reduce_size_short_message_record.order_id[eq_reduce_size_short_message_at] = (eq_reduce_size_short_message_base + 4 + eq_reduce_size_short_message_at + 1) % 256; eq_reduce_size_short_message_at = eq_reduce_size_short_message_at + 1
  :: else -> break
  od;
  eq_reduce_size_short_message_at = 0;
  do
  :: eq_reduce_size_short_message_at < 2 -> eq_reduce_size_short_message_record.canceled_quantity_short[eq_reduce_size_short_message_at] = (eq_reduce_size_short_message_base + 12 + eq_reduce_size_short_message_at + 1) % 256; eq_reduce_size_short_message_at = eq_reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Eq Reduce Size Short Message to the wire, 14 bytes from where the cursor stands */
inline encode_eq_reduce_size_short_message(eq_reduce_size_short_message_record) {
  eq_reduce_size_short_message_at = 0;
  do
  :: eq_reduce_size_short_message_at < 4 -> wire[at] = eq_reduce_size_short_message_record.time_offset[eq_reduce_size_short_message_at]; at = at + 1; eq_reduce_size_short_message_at = eq_reduce_size_short_message_at + 1
  :: else -> break
  od;
  eq_reduce_size_short_message_at = 0;
  do
  :: eq_reduce_size_short_message_at < 8 -> wire[at] = eq_reduce_size_short_message_record.order_id[eq_reduce_size_short_message_at]; at = at + 1; eq_reduce_size_short_message_at = eq_reduce_size_short_message_at + 1
  :: else -> break
  od;
  eq_reduce_size_short_message_at = 0;
  do
  :: eq_reduce_size_short_message_at < 2 -> wire[at] = eq_reduce_size_short_message_record.canceled_quantity_short[eq_reduce_size_short_message_at]; at = at + 1; eq_reduce_size_short_message_at = eq_reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Eq Reduce Size Short Message off the wire, 14 bytes from where the cursor stands */
inline decode_eq_reduce_size_short_message(eq_reduce_size_short_message_record) {
  eq_reduce_size_short_message_at = 0;
  do
  :: eq_reduce_size_short_message_at < 4 -> eq_reduce_size_short_message_record.time_offset[eq_reduce_size_short_message_at] = wire[at]; at = at + 1; eq_reduce_size_short_message_at = eq_reduce_size_short_message_at + 1
  :: else -> break
  od;
  eq_reduce_size_short_message_at = 0;
  do
  :: eq_reduce_size_short_message_at < 8 -> eq_reduce_size_short_message_record.order_id[eq_reduce_size_short_message_at] = wire[at]; at = at + 1; eq_reduce_size_short_message_at = eq_reduce_size_short_message_at + 1
  :: else -> break
  od;
  eq_reduce_size_short_message_at = 0;
  do
  :: eq_reduce_size_short_message_at < 2 -> eq_reduce_size_short_message_record.canceled_quantity_short[eq_reduce_size_short_message_at] = wire[at]; at = at + 1; eq_reduce_size_short_message_at = eq_reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Eq Reduce Size Short Message is what was written, byte for byte */
inline equal_eq_reduce_size_short_message(eq_reduce_size_short_message_read, eq_reduce_size_short_message_written) {
  eq_reduce_size_short_message_at = 0;
  do
  :: eq_reduce_size_short_message_at < 4 -> assert(eq_reduce_size_short_message_read.time_offset[eq_reduce_size_short_message_at] == eq_reduce_size_short_message_written.time_offset[eq_reduce_size_short_message_at]); eq_reduce_size_short_message_at = eq_reduce_size_short_message_at + 1
  :: else -> break
  od;
  eq_reduce_size_short_message_at = 0;
  do
  :: eq_reduce_size_short_message_at < 8 -> assert(eq_reduce_size_short_message_read.order_id[eq_reduce_size_short_message_at] == eq_reduce_size_short_message_written.order_id[eq_reduce_size_short_message_at]); eq_reduce_size_short_message_at = eq_reduce_size_short_message_at + 1
  :: else -> break
  od;
  eq_reduce_size_short_message_at = 0;
  do
  :: eq_reduce_size_short_message_at < 2 -> assert(eq_reduce_size_short_message_read.canceled_quantity_short[eq_reduce_size_short_message_at] == eq_reduce_size_short_message_written.canceled_quantity_short[eq_reduce_size_short_message_at]); eq_reduce_size_short_message_at = eq_reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Eq Delete Order Message: 12 bytes --------------------------------------- */

/* The Delete Order message is sent whenever a booked order is cancelled or leaves the order book */
typedef EqDeleteOrderMessage {
  byte time_offset[4];
  byte order_id[8]
};

int eq_delete_order_message_at;

/* every byte of Eq Delete Order Message set to one value */
inline fill_eq_delete_order_message(eq_delete_order_message_record, eq_delete_order_message_value) {
  eq_delete_order_message_at = 0;
  do
  :: eq_delete_order_message_at < 4 -> eq_delete_order_message_record.time_offset[eq_delete_order_message_at] = eq_delete_order_message_value; eq_delete_order_message_at = eq_delete_order_message_at + 1
  :: else -> break
  od;
  eq_delete_order_message_at = 0;
  do
  :: eq_delete_order_message_at < 8 -> eq_delete_order_message_record.order_id[eq_delete_order_message_at] = eq_delete_order_message_value; eq_delete_order_message_at = eq_delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Eq Delete Order Message set to where it lies, so a field read out of place says so */
inline ramp_eq_delete_order_message(eq_delete_order_message_record, eq_delete_order_message_base) {
  eq_delete_order_message_at = 0;
  do
  :: eq_delete_order_message_at < 4 -> eq_delete_order_message_record.time_offset[eq_delete_order_message_at] = (eq_delete_order_message_base + 0 + eq_delete_order_message_at + 1) % 256; eq_delete_order_message_at = eq_delete_order_message_at + 1
  :: else -> break
  od;
  eq_delete_order_message_at = 0;
  do
  :: eq_delete_order_message_at < 8 -> eq_delete_order_message_record.order_id[eq_delete_order_message_at] = (eq_delete_order_message_base + 4 + eq_delete_order_message_at + 1) % 256; eq_delete_order_message_at = eq_delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Eq Delete Order Message to the wire, 12 bytes from where the cursor stands */
inline encode_eq_delete_order_message(eq_delete_order_message_record) {
  eq_delete_order_message_at = 0;
  do
  :: eq_delete_order_message_at < 4 -> wire[at] = eq_delete_order_message_record.time_offset[eq_delete_order_message_at]; at = at + 1; eq_delete_order_message_at = eq_delete_order_message_at + 1
  :: else -> break
  od;
  eq_delete_order_message_at = 0;
  do
  :: eq_delete_order_message_at < 8 -> wire[at] = eq_delete_order_message_record.order_id[eq_delete_order_message_at]; at = at + 1; eq_delete_order_message_at = eq_delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Eq Delete Order Message off the wire, 12 bytes from where the cursor stands */
inline decode_eq_delete_order_message(eq_delete_order_message_record) {
  eq_delete_order_message_at = 0;
  do
  :: eq_delete_order_message_at < 4 -> eq_delete_order_message_record.time_offset[eq_delete_order_message_at] = wire[at]; at = at + 1; eq_delete_order_message_at = eq_delete_order_message_at + 1
  :: else -> break
  od;
  eq_delete_order_message_at = 0;
  do
  :: eq_delete_order_message_at < 8 -> eq_delete_order_message_record.order_id[eq_delete_order_message_at] = wire[at]; at = at + 1; eq_delete_order_message_at = eq_delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Eq Delete Order Message is what was written, byte for byte */
inline equal_eq_delete_order_message(eq_delete_order_message_read, eq_delete_order_message_written) {
  eq_delete_order_message_at = 0;
  do
  :: eq_delete_order_message_at < 4 -> assert(eq_delete_order_message_read.time_offset[eq_delete_order_message_at] == eq_delete_order_message_written.time_offset[eq_delete_order_message_at]); eq_delete_order_message_at = eq_delete_order_message_at + 1
  :: else -> break
  od;
  eq_delete_order_message_at = 0;
  do
  :: eq_delete_order_message_at < 8 -> assert(eq_delete_order_message_read.order_id[eq_delete_order_message_at] == eq_delete_order_message_written.order_id[eq_delete_order_message_at]); eq_delete_order_message_at = eq_delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Eq Trade Long Message: 39 bytes ----------------------------------------- */

/* The Trade message provides information about executions of non-displayed orders on the Cboe book and routed executions to other trading centers */
typedef EqTradeLongMessage {
  byte time_offset[4];
  byte order_id[8];
  byte side_indicator;
  byte quantity_long[4];
  byte symbol_short[6];
  byte price_long[8];
  byte execution_id[8]
};

int eq_trade_long_message_at;

/* every byte of Eq Trade Long Message set to one value */
inline fill_eq_trade_long_message(eq_trade_long_message_record, eq_trade_long_message_value) {
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 4 -> eq_trade_long_message_record.time_offset[eq_trade_long_message_at] = eq_trade_long_message_value; eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 8 -> eq_trade_long_message_record.order_id[eq_trade_long_message_at] = eq_trade_long_message_value; eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  eq_trade_long_message_record.side_indicator = eq_trade_long_message_value;
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 4 -> eq_trade_long_message_record.quantity_long[eq_trade_long_message_at] = eq_trade_long_message_value; eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 6 -> eq_trade_long_message_record.symbol_short[eq_trade_long_message_at] = eq_trade_long_message_value; eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 8 -> eq_trade_long_message_record.price_long[eq_trade_long_message_at] = eq_trade_long_message_value; eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 8 -> eq_trade_long_message_record.execution_id[eq_trade_long_message_at] = eq_trade_long_message_value; eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Eq Trade Long Message set to where it lies, so a field read out of place says so */
inline ramp_eq_trade_long_message(eq_trade_long_message_record, eq_trade_long_message_base) {
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 4 -> eq_trade_long_message_record.time_offset[eq_trade_long_message_at] = (eq_trade_long_message_base + 0 + eq_trade_long_message_at + 1) % 256; eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 8 -> eq_trade_long_message_record.order_id[eq_trade_long_message_at] = (eq_trade_long_message_base + 4 + eq_trade_long_message_at + 1) % 256; eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  eq_trade_long_message_record.side_indicator = (eq_trade_long_message_base + 12 + 1) % 256;
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 4 -> eq_trade_long_message_record.quantity_long[eq_trade_long_message_at] = (eq_trade_long_message_base + 13 + eq_trade_long_message_at + 1) % 256; eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 6 -> eq_trade_long_message_record.symbol_short[eq_trade_long_message_at] = (eq_trade_long_message_base + 17 + eq_trade_long_message_at + 1) % 256; eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 8 -> eq_trade_long_message_record.price_long[eq_trade_long_message_at] = (eq_trade_long_message_base + 23 + eq_trade_long_message_at + 1) % 256; eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 8 -> eq_trade_long_message_record.execution_id[eq_trade_long_message_at] = (eq_trade_long_message_base + 31 + eq_trade_long_message_at + 1) % 256; eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Eq Trade Long Message to the wire, 39 bytes from where the cursor stands */
inline encode_eq_trade_long_message(eq_trade_long_message_record) {
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 4 -> wire[at] = eq_trade_long_message_record.time_offset[eq_trade_long_message_at]; at = at + 1; eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 8 -> wire[at] = eq_trade_long_message_record.order_id[eq_trade_long_message_at]; at = at + 1; eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  wire[at] = eq_trade_long_message_record.side_indicator; at = at + 1;
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 4 -> wire[at] = eq_trade_long_message_record.quantity_long[eq_trade_long_message_at]; at = at + 1; eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 6 -> wire[at] = eq_trade_long_message_record.symbol_short[eq_trade_long_message_at]; at = at + 1; eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 8 -> wire[at] = eq_trade_long_message_record.price_long[eq_trade_long_message_at]; at = at + 1; eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 8 -> wire[at] = eq_trade_long_message_record.execution_id[eq_trade_long_message_at]; at = at + 1; eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Eq Trade Long Message off the wire, 39 bytes from where the cursor stands */
inline decode_eq_trade_long_message(eq_trade_long_message_record) {
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 4 -> eq_trade_long_message_record.time_offset[eq_trade_long_message_at] = wire[at]; at = at + 1; eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 8 -> eq_trade_long_message_record.order_id[eq_trade_long_message_at] = wire[at]; at = at + 1; eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  eq_trade_long_message_record.side_indicator = wire[at]; at = at + 1;
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 4 -> eq_trade_long_message_record.quantity_long[eq_trade_long_message_at] = wire[at]; at = at + 1; eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 6 -> eq_trade_long_message_record.symbol_short[eq_trade_long_message_at] = wire[at]; at = at + 1; eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 8 -> eq_trade_long_message_record.price_long[eq_trade_long_message_at] = wire[at]; at = at + 1; eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 8 -> eq_trade_long_message_record.execution_id[eq_trade_long_message_at] = wire[at]; at = at + 1; eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Eq Trade Long Message is what was written, byte for byte */
inline equal_eq_trade_long_message(eq_trade_long_message_read, eq_trade_long_message_written) {
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 4 -> assert(eq_trade_long_message_read.time_offset[eq_trade_long_message_at] == eq_trade_long_message_written.time_offset[eq_trade_long_message_at]); eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 8 -> assert(eq_trade_long_message_read.order_id[eq_trade_long_message_at] == eq_trade_long_message_written.order_id[eq_trade_long_message_at]); eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  assert(eq_trade_long_message_read.side_indicator == eq_trade_long_message_written.side_indicator);
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 4 -> assert(eq_trade_long_message_read.quantity_long[eq_trade_long_message_at] == eq_trade_long_message_written.quantity_long[eq_trade_long_message_at]); eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 6 -> assert(eq_trade_long_message_read.symbol_short[eq_trade_long_message_at] == eq_trade_long_message_written.symbol_short[eq_trade_long_message_at]); eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 8 -> assert(eq_trade_long_message_read.price_long[eq_trade_long_message_at] == eq_trade_long_message_written.price_long[eq_trade_long_message_at]); eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  eq_trade_long_message_at = 0;
  do
  :: eq_trade_long_message_at < 8 -> assert(eq_trade_long_message_read.execution_id[eq_trade_long_message_at] == eq_trade_long_message_written.execution_id[eq_trade_long_message_at]); eq_trade_long_message_at = eq_trade_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Eq Trade Short Message: 31 bytes ---------------------------------------- */

/* The Trade message provides information about executions of non-displayed orders on the Cboe book and routed executions to other trading centers */
typedef EqTradeShortMessage {
  byte time_offset[4];
  byte order_id[8];
  byte side_indicator;
  byte quantity_short[2];
  byte symbol_short[6];
  byte price_short[2];
  byte execution_id[8]
};

int eq_trade_short_message_at;

/* every byte of Eq Trade Short Message set to one value */
inline fill_eq_trade_short_message(eq_trade_short_message_record, eq_trade_short_message_value) {
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 4 -> eq_trade_short_message_record.time_offset[eq_trade_short_message_at] = eq_trade_short_message_value; eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 8 -> eq_trade_short_message_record.order_id[eq_trade_short_message_at] = eq_trade_short_message_value; eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  eq_trade_short_message_record.side_indicator = eq_trade_short_message_value;
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 2 -> eq_trade_short_message_record.quantity_short[eq_trade_short_message_at] = eq_trade_short_message_value; eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 6 -> eq_trade_short_message_record.symbol_short[eq_trade_short_message_at] = eq_trade_short_message_value; eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 2 -> eq_trade_short_message_record.price_short[eq_trade_short_message_at] = eq_trade_short_message_value; eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 8 -> eq_trade_short_message_record.execution_id[eq_trade_short_message_at] = eq_trade_short_message_value; eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Eq Trade Short Message set to where it lies, so a field read out of place says so */
inline ramp_eq_trade_short_message(eq_trade_short_message_record, eq_trade_short_message_base) {
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 4 -> eq_trade_short_message_record.time_offset[eq_trade_short_message_at] = (eq_trade_short_message_base + 0 + eq_trade_short_message_at + 1) % 256; eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 8 -> eq_trade_short_message_record.order_id[eq_trade_short_message_at] = (eq_trade_short_message_base + 4 + eq_trade_short_message_at + 1) % 256; eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  eq_trade_short_message_record.side_indicator = (eq_trade_short_message_base + 12 + 1) % 256;
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 2 -> eq_trade_short_message_record.quantity_short[eq_trade_short_message_at] = (eq_trade_short_message_base + 13 + eq_trade_short_message_at + 1) % 256; eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 6 -> eq_trade_short_message_record.symbol_short[eq_trade_short_message_at] = (eq_trade_short_message_base + 15 + eq_trade_short_message_at + 1) % 256; eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 2 -> eq_trade_short_message_record.price_short[eq_trade_short_message_at] = (eq_trade_short_message_base + 21 + eq_trade_short_message_at + 1) % 256; eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 8 -> eq_trade_short_message_record.execution_id[eq_trade_short_message_at] = (eq_trade_short_message_base + 23 + eq_trade_short_message_at + 1) % 256; eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Eq Trade Short Message to the wire, 31 bytes from where the cursor stands */
inline encode_eq_trade_short_message(eq_trade_short_message_record) {
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 4 -> wire[at] = eq_trade_short_message_record.time_offset[eq_trade_short_message_at]; at = at + 1; eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 8 -> wire[at] = eq_trade_short_message_record.order_id[eq_trade_short_message_at]; at = at + 1; eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  wire[at] = eq_trade_short_message_record.side_indicator; at = at + 1;
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 2 -> wire[at] = eq_trade_short_message_record.quantity_short[eq_trade_short_message_at]; at = at + 1; eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 6 -> wire[at] = eq_trade_short_message_record.symbol_short[eq_trade_short_message_at]; at = at + 1; eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 2 -> wire[at] = eq_trade_short_message_record.price_short[eq_trade_short_message_at]; at = at + 1; eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 8 -> wire[at] = eq_trade_short_message_record.execution_id[eq_trade_short_message_at]; at = at + 1; eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Eq Trade Short Message off the wire, 31 bytes from where the cursor stands */
inline decode_eq_trade_short_message(eq_trade_short_message_record) {
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 4 -> eq_trade_short_message_record.time_offset[eq_trade_short_message_at] = wire[at]; at = at + 1; eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 8 -> eq_trade_short_message_record.order_id[eq_trade_short_message_at] = wire[at]; at = at + 1; eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  eq_trade_short_message_record.side_indicator = wire[at]; at = at + 1;
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 2 -> eq_trade_short_message_record.quantity_short[eq_trade_short_message_at] = wire[at]; at = at + 1; eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 6 -> eq_trade_short_message_record.symbol_short[eq_trade_short_message_at] = wire[at]; at = at + 1; eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 2 -> eq_trade_short_message_record.price_short[eq_trade_short_message_at] = wire[at]; at = at + 1; eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 8 -> eq_trade_short_message_record.execution_id[eq_trade_short_message_at] = wire[at]; at = at + 1; eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Eq Trade Short Message is what was written, byte for byte */
inline equal_eq_trade_short_message(eq_trade_short_message_read, eq_trade_short_message_written) {
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 4 -> assert(eq_trade_short_message_read.time_offset[eq_trade_short_message_at] == eq_trade_short_message_written.time_offset[eq_trade_short_message_at]); eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 8 -> assert(eq_trade_short_message_read.order_id[eq_trade_short_message_at] == eq_trade_short_message_written.order_id[eq_trade_short_message_at]); eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  assert(eq_trade_short_message_read.side_indicator == eq_trade_short_message_written.side_indicator);
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 2 -> assert(eq_trade_short_message_read.quantity_short[eq_trade_short_message_at] == eq_trade_short_message_written.quantity_short[eq_trade_short_message_at]); eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 6 -> assert(eq_trade_short_message_read.symbol_short[eq_trade_short_message_at] == eq_trade_short_message_written.symbol_short[eq_trade_short_message_at]); eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 2 -> assert(eq_trade_short_message_read.price_short[eq_trade_short_message_at] == eq_trade_short_message_written.price_short[eq_trade_short_message_at]); eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  eq_trade_short_message_at = 0;
  do
  :: eq_trade_short_message_at < 8 -> assert(eq_trade_short_message_read.execution_id[eq_trade_short_message_at] == eq_trade_short_message_written.execution_id[eq_trade_short_message_at]); eq_trade_short_message_at = eq_trade_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Eq Trade Expanded Message: 41 bytes ------------------------------------- */

/* The Trade message provides information about executions of non-displayed orders on the Cboe book and routed executions to other trading centers. Expanded version accommodates larger symbol sizes possible through the ISRA plan. */
typedef EqTradeExpandedMessage {
  byte time_offset[4];
  byte order_id[8];
  byte side_indicator;
  byte quantity_long[4];
  byte symbol_long[8];
  byte price_long[8];
  byte execution_id[8]
};

int eq_trade_expanded_message_at;

/* every byte of Eq Trade Expanded Message set to one value */
inline fill_eq_trade_expanded_message(eq_trade_expanded_message_record, eq_trade_expanded_message_value) {
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 4 -> eq_trade_expanded_message_record.time_offset[eq_trade_expanded_message_at] = eq_trade_expanded_message_value; eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 8 -> eq_trade_expanded_message_record.order_id[eq_trade_expanded_message_at] = eq_trade_expanded_message_value; eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  eq_trade_expanded_message_record.side_indicator = eq_trade_expanded_message_value;
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 4 -> eq_trade_expanded_message_record.quantity_long[eq_trade_expanded_message_at] = eq_trade_expanded_message_value; eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 8 -> eq_trade_expanded_message_record.symbol_long[eq_trade_expanded_message_at] = eq_trade_expanded_message_value; eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 8 -> eq_trade_expanded_message_record.price_long[eq_trade_expanded_message_at] = eq_trade_expanded_message_value; eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 8 -> eq_trade_expanded_message_record.execution_id[eq_trade_expanded_message_at] = eq_trade_expanded_message_value; eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Eq Trade Expanded Message set to where it lies, so a field read out of place says so */
inline ramp_eq_trade_expanded_message(eq_trade_expanded_message_record, eq_trade_expanded_message_base) {
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 4 -> eq_trade_expanded_message_record.time_offset[eq_trade_expanded_message_at] = (eq_trade_expanded_message_base + 0 + eq_trade_expanded_message_at + 1) % 256; eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 8 -> eq_trade_expanded_message_record.order_id[eq_trade_expanded_message_at] = (eq_trade_expanded_message_base + 4 + eq_trade_expanded_message_at + 1) % 256; eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  eq_trade_expanded_message_record.side_indicator = (eq_trade_expanded_message_base + 12 + 1) % 256;
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 4 -> eq_trade_expanded_message_record.quantity_long[eq_trade_expanded_message_at] = (eq_trade_expanded_message_base + 13 + eq_trade_expanded_message_at + 1) % 256; eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 8 -> eq_trade_expanded_message_record.symbol_long[eq_trade_expanded_message_at] = (eq_trade_expanded_message_base + 17 + eq_trade_expanded_message_at + 1) % 256; eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 8 -> eq_trade_expanded_message_record.price_long[eq_trade_expanded_message_at] = (eq_trade_expanded_message_base + 25 + eq_trade_expanded_message_at + 1) % 256; eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 8 -> eq_trade_expanded_message_record.execution_id[eq_trade_expanded_message_at] = (eq_trade_expanded_message_base + 33 + eq_trade_expanded_message_at + 1) % 256; eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  skip
}

/* Eq Trade Expanded Message to the wire, 41 bytes from where the cursor stands */
inline encode_eq_trade_expanded_message(eq_trade_expanded_message_record) {
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 4 -> wire[at] = eq_trade_expanded_message_record.time_offset[eq_trade_expanded_message_at]; at = at + 1; eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 8 -> wire[at] = eq_trade_expanded_message_record.order_id[eq_trade_expanded_message_at]; at = at + 1; eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  wire[at] = eq_trade_expanded_message_record.side_indicator; at = at + 1;
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 4 -> wire[at] = eq_trade_expanded_message_record.quantity_long[eq_trade_expanded_message_at]; at = at + 1; eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 8 -> wire[at] = eq_trade_expanded_message_record.symbol_long[eq_trade_expanded_message_at]; at = at + 1; eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 8 -> wire[at] = eq_trade_expanded_message_record.price_long[eq_trade_expanded_message_at]; at = at + 1; eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 8 -> wire[at] = eq_trade_expanded_message_record.execution_id[eq_trade_expanded_message_at]; at = at + 1; eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  skip
}

/* Eq Trade Expanded Message off the wire, 41 bytes from where the cursor stands */
inline decode_eq_trade_expanded_message(eq_trade_expanded_message_record) {
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 4 -> eq_trade_expanded_message_record.time_offset[eq_trade_expanded_message_at] = wire[at]; at = at + 1; eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 8 -> eq_trade_expanded_message_record.order_id[eq_trade_expanded_message_at] = wire[at]; at = at + 1; eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  eq_trade_expanded_message_record.side_indicator = wire[at]; at = at + 1;
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 4 -> eq_trade_expanded_message_record.quantity_long[eq_trade_expanded_message_at] = wire[at]; at = at + 1; eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 8 -> eq_trade_expanded_message_record.symbol_long[eq_trade_expanded_message_at] = wire[at]; at = at + 1; eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 8 -> eq_trade_expanded_message_record.price_long[eq_trade_expanded_message_at] = wire[at]; at = at + 1; eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 8 -> eq_trade_expanded_message_record.execution_id[eq_trade_expanded_message_at] = wire[at]; at = at + 1; eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Eq Trade Expanded Message is what was written, byte for byte */
inline equal_eq_trade_expanded_message(eq_trade_expanded_message_read, eq_trade_expanded_message_written) {
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 4 -> assert(eq_trade_expanded_message_read.time_offset[eq_trade_expanded_message_at] == eq_trade_expanded_message_written.time_offset[eq_trade_expanded_message_at]); eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 8 -> assert(eq_trade_expanded_message_read.order_id[eq_trade_expanded_message_at] == eq_trade_expanded_message_written.order_id[eq_trade_expanded_message_at]); eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  assert(eq_trade_expanded_message_read.side_indicator == eq_trade_expanded_message_written.side_indicator);
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 4 -> assert(eq_trade_expanded_message_read.quantity_long[eq_trade_expanded_message_at] == eq_trade_expanded_message_written.quantity_long[eq_trade_expanded_message_at]); eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 8 -> assert(eq_trade_expanded_message_read.symbol_long[eq_trade_expanded_message_at] == eq_trade_expanded_message_written.symbol_long[eq_trade_expanded_message_at]); eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 8 -> assert(eq_trade_expanded_message_read.price_long[eq_trade_expanded_message_at] == eq_trade_expanded_message_written.price_long[eq_trade_expanded_message_at]); eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  eq_trade_expanded_message_at = 0;
  do
  :: eq_trade_expanded_message_at < 8 -> assert(eq_trade_expanded_message_read.execution_id[eq_trade_expanded_message_at] == eq_trade_expanded_message_written.execution_id[eq_trade_expanded_message_at]); eq_trade_expanded_message_at = eq_trade_expanded_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Eq Trade Break Message: 12 bytes ---------------------------------------- */

/* The Trade Break message is sent whenever an execution on Cboe is broken */
typedef EqTradeBreakMessage {
  byte time_offset[4];
  byte execution_id[8]
};

int eq_trade_break_message_at;

/* every byte of Eq Trade Break Message set to one value */
inline fill_eq_trade_break_message(eq_trade_break_message_record, eq_trade_break_message_value) {
  eq_trade_break_message_at = 0;
  do
  :: eq_trade_break_message_at < 4 -> eq_trade_break_message_record.time_offset[eq_trade_break_message_at] = eq_trade_break_message_value; eq_trade_break_message_at = eq_trade_break_message_at + 1
  :: else -> break
  od;
  eq_trade_break_message_at = 0;
  do
  :: eq_trade_break_message_at < 8 -> eq_trade_break_message_record.execution_id[eq_trade_break_message_at] = eq_trade_break_message_value; eq_trade_break_message_at = eq_trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Eq Trade Break Message set to where it lies, so a field read out of place says so */
inline ramp_eq_trade_break_message(eq_trade_break_message_record, eq_trade_break_message_base) {
  eq_trade_break_message_at = 0;
  do
  :: eq_trade_break_message_at < 4 -> eq_trade_break_message_record.time_offset[eq_trade_break_message_at] = (eq_trade_break_message_base + 0 + eq_trade_break_message_at + 1) % 256; eq_trade_break_message_at = eq_trade_break_message_at + 1
  :: else -> break
  od;
  eq_trade_break_message_at = 0;
  do
  :: eq_trade_break_message_at < 8 -> eq_trade_break_message_record.execution_id[eq_trade_break_message_at] = (eq_trade_break_message_base + 4 + eq_trade_break_message_at + 1) % 256; eq_trade_break_message_at = eq_trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* Eq Trade Break Message to the wire, 12 bytes from where the cursor stands */
inline encode_eq_trade_break_message(eq_trade_break_message_record) {
  eq_trade_break_message_at = 0;
  do
  :: eq_trade_break_message_at < 4 -> wire[at] = eq_trade_break_message_record.time_offset[eq_trade_break_message_at]; at = at + 1; eq_trade_break_message_at = eq_trade_break_message_at + 1
  :: else -> break
  od;
  eq_trade_break_message_at = 0;
  do
  :: eq_trade_break_message_at < 8 -> wire[at] = eq_trade_break_message_record.execution_id[eq_trade_break_message_at]; at = at + 1; eq_trade_break_message_at = eq_trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* Eq Trade Break Message off the wire, 12 bytes from where the cursor stands */
inline decode_eq_trade_break_message(eq_trade_break_message_record) {
  eq_trade_break_message_at = 0;
  do
  :: eq_trade_break_message_at < 4 -> eq_trade_break_message_record.time_offset[eq_trade_break_message_at] = wire[at]; at = at + 1; eq_trade_break_message_at = eq_trade_break_message_at + 1
  :: else -> break
  od;
  eq_trade_break_message_at = 0;
  do
  :: eq_trade_break_message_at < 8 -> eq_trade_break_message_record.execution_id[eq_trade_break_message_at] = wire[at]; at = at + 1; eq_trade_break_message_at = eq_trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Eq Trade Break Message is what was written, byte for byte */
inline equal_eq_trade_break_message(eq_trade_break_message_read, eq_trade_break_message_written) {
  eq_trade_break_message_at = 0;
  do
  :: eq_trade_break_message_at < 4 -> assert(eq_trade_break_message_read.time_offset[eq_trade_break_message_at] == eq_trade_break_message_written.time_offset[eq_trade_break_message_at]); eq_trade_break_message_at = eq_trade_break_message_at + 1
  :: else -> break
  od;
  eq_trade_break_message_at = 0;
  do
  :: eq_trade_break_message_at < 8 -> assert(eq_trade_break_message_read.execution_id[eq_trade_break_message_at] == eq_trade_break_message_written.execution_id[eq_trade_break_message_at]); eq_trade_break_message_at = eq_trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Eq End Of Session: 4 bytes ---------------------------------------------- */

/* The End of Session message is sent for each unit when the unit shuts down */
typedef EqEndOfSession {
  byte time_offset[4]
};

int eq_end_of_session_at;

/* every byte of Eq End Of Session set to one value */
inline fill_eq_end_of_session(eq_end_of_session_record, eq_end_of_session_value) {
  eq_end_of_session_at = 0;
  do
  :: eq_end_of_session_at < 4 -> eq_end_of_session_record.time_offset[eq_end_of_session_at] = eq_end_of_session_value; eq_end_of_session_at = eq_end_of_session_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Eq End Of Session set to where it lies, so a field read out of place says so */
inline ramp_eq_end_of_session(eq_end_of_session_record, eq_end_of_session_base) {
  eq_end_of_session_at = 0;
  do
  :: eq_end_of_session_at < 4 -> eq_end_of_session_record.time_offset[eq_end_of_session_at] = (eq_end_of_session_base + 0 + eq_end_of_session_at + 1) % 256; eq_end_of_session_at = eq_end_of_session_at + 1
  :: else -> break
  od;
  skip
}

/* Eq End Of Session to the wire, 4 bytes from where the cursor stands */
inline encode_eq_end_of_session(eq_end_of_session_record) {
  eq_end_of_session_at = 0;
  do
  :: eq_end_of_session_at < 4 -> wire[at] = eq_end_of_session_record.time_offset[eq_end_of_session_at]; at = at + 1; eq_end_of_session_at = eq_end_of_session_at + 1
  :: else -> break
  od;
  skip
}

/* Eq End Of Session off the wire, 4 bytes from where the cursor stands */
inline decode_eq_end_of_session(eq_end_of_session_record) {
  eq_end_of_session_at = 0;
  do
  :: eq_end_of_session_at < 4 -> eq_end_of_session_record.time_offset[eq_end_of_session_at] = wire[at]; at = at + 1; eq_end_of_session_at = eq_end_of_session_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Eq End Of Session is what was written, byte for byte */
inline equal_eq_end_of_session(eq_end_of_session_read, eq_end_of_session_written) {
  eq_end_of_session_at = 0;
  do
  :: eq_end_of_session_at < 4 -> assert(eq_end_of_session_read.time_offset[eq_end_of_session_at] == eq_end_of_session_written.time_offset[eq_end_of_session_at]); eq_end_of_session_at = eq_end_of_session_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Eq Trading Status Message: 16 bytes ------------------------------------- */

/* The Trading Status message is used to indicate the current trading status of a security */
typedef EqTradingStatusMessage {
  byte time_offset[4];
  byte symbol_long[8];
  byte trading_status;
  byte reg_sho_action;
  byte reserved_1;
  byte second_reserved_1
};

int eq_trading_status_message_at;

/* every byte of Eq Trading Status Message set to one value */
inline fill_eq_trading_status_message(eq_trading_status_message_record, eq_trading_status_message_value) {
  eq_trading_status_message_at = 0;
  do
  :: eq_trading_status_message_at < 4 -> eq_trading_status_message_record.time_offset[eq_trading_status_message_at] = eq_trading_status_message_value; eq_trading_status_message_at = eq_trading_status_message_at + 1
  :: else -> break
  od;
  eq_trading_status_message_at = 0;
  do
  :: eq_trading_status_message_at < 8 -> eq_trading_status_message_record.symbol_long[eq_trading_status_message_at] = eq_trading_status_message_value; eq_trading_status_message_at = eq_trading_status_message_at + 1
  :: else -> break
  od;
  eq_trading_status_message_record.trading_status = eq_trading_status_message_value;
  eq_trading_status_message_record.reg_sho_action = eq_trading_status_message_value;
  eq_trading_status_message_record.reserved_1 = eq_trading_status_message_value;
  eq_trading_status_message_record.second_reserved_1 = eq_trading_status_message_value;
  skip
}

/* each byte of Eq Trading Status Message set to where it lies, so a field read out of place says so */
inline ramp_eq_trading_status_message(eq_trading_status_message_record, eq_trading_status_message_base) {
  eq_trading_status_message_at = 0;
  do
  :: eq_trading_status_message_at < 4 -> eq_trading_status_message_record.time_offset[eq_trading_status_message_at] = (eq_trading_status_message_base + 0 + eq_trading_status_message_at + 1) % 256; eq_trading_status_message_at = eq_trading_status_message_at + 1
  :: else -> break
  od;
  eq_trading_status_message_at = 0;
  do
  :: eq_trading_status_message_at < 8 -> eq_trading_status_message_record.symbol_long[eq_trading_status_message_at] = (eq_trading_status_message_base + 4 + eq_trading_status_message_at + 1) % 256; eq_trading_status_message_at = eq_trading_status_message_at + 1
  :: else -> break
  od;
  eq_trading_status_message_record.trading_status = (eq_trading_status_message_base + 12 + 1) % 256;
  eq_trading_status_message_record.reg_sho_action = (eq_trading_status_message_base + 13 + 1) % 256;
  eq_trading_status_message_record.reserved_1 = (eq_trading_status_message_base + 14 + 1) % 256;
  eq_trading_status_message_record.second_reserved_1 = (eq_trading_status_message_base + 15 + 1) % 256;
  skip
}

/* Eq Trading Status Message to the wire, 16 bytes from where the cursor stands */
inline encode_eq_trading_status_message(eq_trading_status_message_record) {
  eq_trading_status_message_at = 0;
  do
  :: eq_trading_status_message_at < 4 -> wire[at] = eq_trading_status_message_record.time_offset[eq_trading_status_message_at]; at = at + 1; eq_trading_status_message_at = eq_trading_status_message_at + 1
  :: else -> break
  od;
  eq_trading_status_message_at = 0;
  do
  :: eq_trading_status_message_at < 8 -> wire[at] = eq_trading_status_message_record.symbol_long[eq_trading_status_message_at]; at = at + 1; eq_trading_status_message_at = eq_trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = eq_trading_status_message_record.trading_status; at = at + 1;
  wire[at] = eq_trading_status_message_record.reg_sho_action; at = at + 1;
  wire[at] = eq_trading_status_message_record.reserved_1; at = at + 1;
  wire[at] = eq_trading_status_message_record.second_reserved_1; at = at + 1;
  skip
}

/* Eq Trading Status Message off the wire, 16 bytes from where the cursor stands */
inline decode_eq_trading_status_message(eq_trading_status_message_record) {
  eq_trading_status_message_at = 0;
  do
  :: eq_trading_status_message_at < 4 -> eq_trading_status_message_record.time_offset[eq_trading_status_message_at] = wire[at]; at = at + 1; eq_trading_status_message_at = eq_trading_status_message_at + 1
  :: else -> break
  od;
  eq_trading_status_message_at = 0;
  do
  :: eq_trading_status_message_at < 8 -> eq_trading_status_message_record.symbol_long[eq_trading_status_message_at] = wire[at]; at = at + 1; eq_trading_status_message_at = eq_trading_status_message_at + 1
  :: else -> break
  od;
  eq_trading_status_message_record.trading_status = wire[at]; at = at + 1;
  eq_trading_status_message_record.reg_sho_action = wire[at]; at = at + 1;
  eq_trading_status_message_record.reserved_1 = wire[at]; at = at + 1;
  eq_trading_status_message_record.second_reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Eq Trading Status Message is what was written, byte for byte */
inline equal_eq_trading_status_message(eq_trading_status_message_read, eq_trading_status_message_written) {
  eq_trading_status_message_at = 0;
  do
  :: eq_trading_status_message_at < 4 -> assert(eq_trading_status_message_read.time_offset[eq_trading_status_message_at] == eq_trading_status_message_written.time_offset[eq_trading_status_message_at]); eq_trading_status_message_at = eq_trading_status_message_at + 1
  :: else -> break
  od;
  eq_trading_status_message_at = 0;
  do
  :: eq_trading_status_message_at < 8 -> assert(eq_trading_status_message_read.symbol_long[eq_trading_status_message_at] == eq_trading_status_message_written.symbol_long[eq_trading_status_message_at]); eq_trading_status_message_at = eq_trading_status_message_at + 1
  :: else -> break
  od;
  assert(eq_trading_status_message_read.trading_status == eq_trading_status_message_written.trading_status);
  assert(eq_trading_status_message_read.reg_sho_action == eq_trading_status_message_written.reg_sho_action);
  assert(eq_trading_status_message_read.reserved_1 == eq_trading_status_message_written.reserved_1);
  assert(eq_trading_status_message_read.second_reserved_1 == eq_trading_status_message_written.second_reserved_1);
  skip
}

/* ---- Eq Auction Update Message: 45 bytes ------------------------------------- */

/* Auction Update messages are used to disseminate Cboe price and size information during auctions for Cboe listed securities and for Cboe Market Close crosses on BZX, and for Periodic Auctions on BYX */
typedef EqAuctionUpdateMessage {
  byte time_offset[4];
  byte stock_symbol[8];
  byte auction_type;
  byte reference_price[8];
  byte buy_shares[4];
  byte sell_shares[4];
  byte indicative_price[8];
  byte auction_only_price[8]
};

int eq_auction_update_message_at;

/* every byte of Eq Auction Update Message set to one value */
inline fill_eq_auction_update_message(eq_auction_update_message_record, eq_auction_update_message_value) {
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 4 -> eq_auction_update_message_record.time_offset[eq_auction_update_message_at] = eq_auction_update_message_value; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 8 -> eq_auction_update_message_record.stock_symbol[eq_auction_update_message_at] = eq_auction_update_message_value; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_record.auction_type = eq_auction_update_message_value;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 8 -> eq_auction_update_message_record.reference_price[eq_auction_update_message_at] = eq_auction_update_message_value; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 4 -> eq_auction_update_message_record.buy_shares[eq_auction_update_message_at] = eq_auction_update_message_value; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 4 -> eq_auction_update_message_record.sell_shares[eq_auction_update_message_at] = eq_auction_update_message_value; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 8 -> eq_auction_update_message_record.indicative_price[eq_auction_update_message_at] = eq_auction_update_message_value; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 8 -> eq_auction_update_message_record.auction_only_price[eq_auction_update_message_at] = eq_auction_update_message_value; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Eq Auction Update Message set to where it lies, so a field read out of place says so */
inline ramp_eq_auction_update_message(eq_auction_update_message_record, eq_auction_update_message_base) {
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 4 -> eq_auction_update_message_record.time_offset[eq_auction_update_message_at] = (eq_auction_update_message_base + 0 + eq_auction_update_message_at + 1) % 256; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 8 -> eq_auction_update_message_record.stock_symbol[eq_auction_update_message_at] = (eq_auction_update_message_base + 4 + eq_auction_update_message_at + 1) % 256; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_record.auction_type = (eq_auction_update_message_base + 12 + 1) % 256;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 8 -> eq_auction_update_message_record.reference_price[eq_auction_update_message_at] = (eq_auction_update_message_base + 13 + eq_auction_update_message_at + 1) % 256; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 4 -> eq_auction_update_message_record.buy_shares[eq_auction_update_message_at] = (eq_auction_update_message_base + 21 + eq_auction_update_message_at + 1) % 256; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 4 -> eq_auction_update_message_record.sell_shares[eq_auction_update_message_at] = (eq_auction_update_message_base + 25 + eq_auction_update_message_at + 1) % 256; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 8 -> eq_auction_update_message_record.indicative_price[eq_auction_update_message_at] = (eq_auction_update_message_base + 29 + eq_auction_update_message_at + 1) % 256; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 8 -> eq_auction_update_message_record.auction_only_price[eq_auction_update_message_at] = (eq_auction_update_message_base + 37 + eq_auction_update_message_at + 1) % 256; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Eq Auction Update Message to the wire, 45 bytes from where the cursor stands */
inline encode_eq_auction_update_message(eq_auction_update_message_record) {
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 4 -> wire[at] = eq_auction_update_message_record.time_offset[eq_auction_update_message_at]; at = at + 1; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 8 -> wire[at] = eq_auction_update_message_record.stock_symbol[eq_auction_update_message_at]; at = at + 1; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  wire[at] = eq_auction_update_message_record.auction_type; at = at + 1;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 8 -> wire[at] = eq_auction_update_message_record.reference_price[eq_auction_update_message_at]; at = at + 1; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 4 -> wire[at] = eq_auction_update_message_record.buy_shares[eq_auction_update_message_at]; at = at + 1; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 4 -> wire[at] = eq_auction_update_message_record.sell_shares[eq_auction_update_message_at]; at = at + 1; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 8 -> wire[at] = eq_auction_update_message_record.indicative_price[eq_auction_update_message_at]; at = at + 1; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 8 -> wire[at] = eq_auction_update_message_record.auction_only_price[eq_auction_update_message_at]; at = at + 1; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Eq Auction Update Message off the wire, 45 bytes from where the cursor stands */
inline decode_eq_auction_update_message(eq_auction_update_message_record) {
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 4 -> eq_auction_update_message_record.time_offset[eq_auction_update_message_at] = wire[at]; at = at + 1; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 8 -> eq_auction_update_message_record.stock_symbol[eq_auction_update_message_at] = wire[at]; at = at + 1; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_record.auction_type = wire[at]; at = at + 1;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 8 -> eq_auction_update_message_record.reference_price[eq_auction_update_message_at] = wire[at]; at = at + 1; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 4 -> eq_auction_update_message_record.buy_shares[eq_auction_update_message_at] = wire[at]; at = at + 1; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 4 -> eq_auction_update_message_record.sell_shares[eq_auction_update_message_at] = wire[at]; at = at + 1; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 8 -> eq_auction_update_message_record.indicative_price[eq_auction_update_message_at] = wire[at]; at = at + 1; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 8 -> eq_auction_update_message_record.auction_only_price[eq_auction_update_message_at] = wire[at]; at = at + 1; eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Eq Auction Update Message is what was written, byte for byte */
inline equal_eq_auction_update_message(eq_auction_update_message_read, eq_auction_update_message_written) {
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 4 -> assert(eq_auction_update_message_read.time_offset[eq_auction_update_message_at] == eq_auction_update_message_written.time_offset[eq_auction_update_message_at]); eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 8 -> assert(eq_auction_update_message_read.stock_symbol[eq_auction_update_message_at] == eq_auction_update_message_written.stock_symbol[eq_auction_update_message_at]); eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  assert(eq_auction_update_message_read.auction_type == eq_auction_update_message_written.auction_type);
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 8 -> assert(eq_auction_update_message_read.reference_price[eq_auction_update_message_at] == eq_auction_update_message_written.reference_price[eq_auction_update_message_at]); eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 4 -> assert(eq_auction_update_message_read.buy_shares[eq_auction_update_message_at] == eq_auction_update_message_written.buy_shares[eq_auction_update_message_at]); eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 4 -> assert(eq_auction_update_message_read.sell_shares[eq_auction_update_message_at] == eq_auction_update_message_written.sell_shares[eq_auction_update_message_at]); eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 8 -> assert(eq_auction_update_message_read.indicative_price[eq_auction_update_message_at] == eq_auction_update_message_written.indicative_price[eq_auction_update_message_at]); eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  eq_auction_update_message_at = 0;
  do
  :: eq_auction_update_message_at < 8 -> assert(eq_auction_update_message_read.auction_only_price[eq_auction_update_message_at] == eq_auction_update_message_written.auction_only_price[eq_auction_update_message_at]); eq_auction_update_message_at = eq_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Eq Auction Summary Message: 25 bytes ------------------------------------ */

/* Auction Summary messages are used to disseminate the results of an auction of a Cboe listed security on BZX, and for Periodic Auctions on BYX */
typedef EqAuctionSummaryMessage {
  byte time_offset[4];
  byte stock_symbol[8];
  byte auction_type;
  byte price_long[8];
  byte shares_contracts[4]
};

int eq_auction_summary_message_at;

/* every byte of Eq Auction Summary Message set to one value */
inline fill_eq_auction_summary_message(eq_auction_summary_message_record, eq_auction_summary_message_value) {
  eq_auction_summary_message_at = 0;
  do
  :: eq_auction_summary_message_at < 4 -> eq_auction_summary_message_record.time_offset[eq_auction_summary_message_at] = eq_auction_summary_message_value; eq_auction_summary_message_at = eq_auction_summary_message_at + 1
  :: else -> break
  od;
  eq_auction_summary_message_at = 0;
  do
  :: eq_auction_summary_message_at < 8 -> eq_auction_summary_message_record.stock_symbol[eq_auction_summary_message_at] = eq_auction_summary_message_value; eq_auction_summary_message_at = eq_auction_summary_message_at + 1
  :: else -> break
  od;
  eq_auction_summary_message_record.auction_type = eq_auction_summary_message_value;
  eq_auction_summary_message_at = 0;
  do
  :: eq_auction_summary_message_at < 8 -> eq_auction_summary_message_record.price_long[eq_auction_summary_message_at] = eq_auction_summary_message_value; eq_auction_summary_message_at = eq_auction_summary_message_at + 1
  :: else -> break
  od;
  eq_auction_summary_message_at = 0;
  do
  :: eq_auction_summary_message_at < 4 -> eq_auction_summary_message_record.shares_contracts[eq_auction_summary_message_at] = eq_auction_summary_message_value; eq_auction_summary_message_at = eq_auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Eq Auction Summary Message set to where it lies, so a field read out of place says so */
inline ramp_eq_auction_summary_message(eq_auction_summary_message_record, eq_auction_summary_message_base) {
  eq_auction_summary_message_at = 0;
  do
  :: eq_auction_summary_message_at < 4 -> eq_auction_summary_message_record.time_offset[eq_auction_summary_message_at] = (eq_auction_summary_message_base + 0 + eq_auction_summary_message_at + 1) % 256; eq_auction_summary_message_at = eq_auction_summary_message_at + 1
  :: else -> break
  od;
  eq_auction_summary_message_at = 0;
  do
  :: eq_auction_summary_message_at < 8 -> eq_auction_summary_message_record.stock_symbol[eq_auction_summary_message_at] = (eq_auction_summary_message_base + 4 + eq_auction_summary_message_at + 1) % 256; eq_auction_summary_message_at = eq_auction_summary_message_at + 1
  :: else -> break
  od;
  eq_auction_summary_message_record.auction_type = (eq_auction_summary_message_base + 12 + 1) % 256;
  eq_auction_summary_message_at = 0;
  do
  :: eq_auction_summary_message_at < 8 -> eq_auction_summary_message_record.price_long[eq_auction_summary_message_at] = (eq_auction_summary_message_base + 13 + eq_auction_summary_message_at + 1) % 256; eq_auction_summary_message_at = eq_auction_summary_message_at + 1
  :: else -> break
  od;
  eq_auction_summary_message_at = 0;
  do
  :: eq_auction_summary_message_at < 4 -> eq_auction_summary_message_record.shares_contracts[eq_auction_summary_message_at] = (eq_auction_summary_message_base + 21 + eq_auction_summary_message_at + 1) % 256; eq_auction_summary_message_at = eq_auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Eq Auction Summary Message to the wire, 25 bytes from where the cursor stands */
inline encode_eq_auction_summary_message(eq_auction_summary_message_record) {
  eq_auction_summary_message_at = 0;
  do
  :: eq_auction_summary_message_at < 4 -> wire[at] = eq_auction_summary_message_record.time_offset[eq_auction_summary_message_at]; at = at + 1; eq_auction_summary_message_at = eq_auction_summary_message_at + 1
  :: else -> break
  od;
  eq_auction_summary_message_at = 0;
  do
  :: eq_auction_summary_message_at < 8 -> wire[at] = eq_auction_summary_message_record.stock_symbol[eq_auction_summary_message_at]; at = at + 1; eq_auction_summary_message_at = eq_auction_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = eq_auction_summary_message_record.auction_type; at = at + 1;
  eq_auction_summary_message_at = 0;
  do
  :: eq_auction_summary_message_at < 8 -> wire[at] = eq_auction_summary_message_record.price_long[eq_auction_summary_message_at]; at = at + 1; eq_auction_summary_message_at = eq_auction_summary_message_at + 1
  :: else -> break
  od;
  eq_auction_summary_message_at = 0;
  do
  :: eq_auction_summary_message_at < 4 -> wire[at] = eq_auction_summary_message_record.shares_contracts[eq_auction_summary_message_at]; at = at + 1; eq_auction_summary_message_at = eq_auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Eq Auction Summary Message off the wire, 25 bytes from where the cursor stands */
inline decode_eq_auction_summary_message(eq_auction_summary_message_record) {
  eq_auction_summary_message_at = 0;
  do
  :: eq_auction_summary_message_at < 4 -> eq_auction_summary_message_record.time_offset[eq_auction_summary_message_at] = wire[at]; at = at + 1; eq_auction_summary_message_at = eq_auction_summary_message_at + 1
  :: else -> break
  od;
  eq_auction_summary_message_at = 0;
  do
  :: eq_auction_summary_message_at < 8 -> eq_auction_summary_message_record.stock_symbol[eq_auction_summary_message_at] = wire[at]; at = at + 1; eq_auction_summary_message_at = eq_auction_summary_message_at + 1
  :: else -> break
  od;
  eq_auction_summary_message_record.auction_type = wire[at]; at = at + 1;
  eq_auction_summary_message_at = 0;
  do
  :: eq_auction_summary_message_at < 8 -> eq_auction_summary_message_record.price_long[eq_auction_summary_message_at] = wire[at]; at = at + 1; eq_auction_summary_message_at = eq_auction_summary_message_at + 1
  :: else -> break
  od;
  eq_auction_summary_message_at = 0;
  do
  :: eq_auction_summary_message_at < 4 -> eq_auction_summary_message_record.shares_contracts[eq_auction_summary_message_at] = wire[at]; at = at + 1; eq_auction_summary_message_at = eq_auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Eq Auction Summary Message is what was written, byte for byte */
inline equal_eq_auction_summary_message(eq_auction_summary_message_read, eq_auction_summary_message_written) {
  eq_auction_summary_message_at = 0;
  do
  :: eq_auction_summary_message_at < 4 -> assert(eq_auction_summary_message_read.time_offset[eq_auction_summary_message_at] == eq_auction_summary_message_written.time_offset[eq_auction_summary_message_at]); eq_auction_summary_message_at = eq_auction_summary_message_at + 1
  :: else -> break
  od;
  eq_auction_summary_message_at = 0;
  do
  :: eq_auction_summary_message_at < 8 -> assert(eq_auction_summary_message_read.stock_symbol[eq_auction_summary_message_at] == eq_auction_summary_message_written.stock_symbol[eq_auction_summary_message_at]); eq_auction_summary_message_at = eq_auction_summary_message_at + 1
  :: else -> break
  od;
  assert(eq_auction_summary_message_read.auction_type == eq_auction_summary_message_written.auction_type);
  eq_auction_summary_message_at = 0;
  do
  :: eq_auction_summary_message_at < 8 -> assert(eq_auction_summary_message_read.price_long[eq_auction_summary_message_at] == eq_auction_summary_message_written.price_long[eq_auction_summary_message_at]); eq_auction_summary_message_at = eq_auction_summary_message_at + 1
  :: else -> break
  od;
  eq_auction_summary_message_at = 0;
  do
  :: eq_auction_summary_message_at < 4 -> assert(eq_auction_summary_message_read.shares_contracts[eq_auction_summary_message_at] == eq_auction_summary_message_written.shares_contracts[eq_auction_summary_message_at]); eq_auction_summary_message_at = eq_auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Eq Retail Price Improvement Message: 13 bytes --------------------------- */

/* This message is a Retail Liquidity Indicator (RLI) that includes symbol and side, but not price and size. BYX Only. */
typedef EqRetailPriceImprovementMessage {
  byte time_offset[4];
  byte symbol_long[8];
  byte retail_price_improvement
};

int eq_retail_price_improvement_message_at;

/* every byte of Eq Retail Price Improvement Message set to one value */
inline fill_eq_retail_price_improvement_message(eq_retail_price_improvement_message_record, eq_retail_price_improvement_message_value) {
  eq_retail_price_improvement_message_at = 0;
  do
  :: eq_retail_price_improvement_message_at < 4 -> eq_retail_price_improvement_message_record.time_offset[eq_retail_price_improvement_message_at] = eq_retail_price_improvement_message_value; eq_retail_price_improvement_message_at = eq_retail_price_improvement_message_at + 1
  :: else -> break
  od;
  eq_retail_price_improvement_message_at = 0;
  do
  :: eq_retail_price_improvement_message_at < 8 -> eq_retail_price_improvement_message_record.symbol_long[eq_retail_price_improvement_message_at] = eq_retail_price_improvement_message_value; eq_retail_price_improvement_message_at = eq_retail_price_improvement_message_at + 1
  :: else -> break
  od;
  eq_retail_price_improvement_message_record.retail_price_improvement = eq_retail_price_improvement_message_value;
  skip
}

/* each byte of Eq Retail Price Improvement Message set to where it lies, so a field read out of place says so */
inline ramp_eq_retail_price_improvement_message(eq_retail_price_improvement_message_record, eq_retail_price_improvement_message_base) {
  eq_retail_price_improvement_message_at = 0;
  do
  :: eq_retail_price_improvement_message_at < 4 -> eq_retail_price_improvement_message_record.time_offset[eq_retail_price_improvement_message_at] = (eq_retail_price_improvement_message_base + 0 + eq_retail_price_improvement_message_at + 1) % 256; eq_retail_price_improvement_message_at = eq_retail_price_improvement_message_at + 1
  :: else -> break
  od;
  eq_retail_price_improvement_message_at = 0;
  do
  :: eq_retail_price_improvement_message_at < 8 -> eq_retail_price_improvement_message_record.symbol_long[eq_retail_price_improvement_message_at] = (eq_retail_price_improvement_message_base + 4 + eq_retail_price_improvement_message_at + 1) % 256; eq_retail_price_improvement_message_at = eq_retail_price_improvement_message_at + 1
  :: else -> break
  od;
  eq_retail_price_improvement_message_record.retail_price_improvement = (eq_retail_price_improvement_message_base + 12 + 1) % 256;
  skip
}

/* Eq Retail Price Improvement Message to the wire, 13 bytes from where the cursor stands */
inline encode_eq_retail_price_improvement_message(eq_retail_price_improvement_message_record) {
  eq_retail_price_improvement_message_at = 0;
  do
  :: eq_retail_price_improvement_message_at < 4 -> wire[at] = eq_retail_price_improvement_message_record.time_offset[eq_retail_price_improvement_message_at]; at = at + 1; eq_retail_price_improvement_message_at = eq_retail_price_improvement_message_at + 1
  :: else -> break
  od;
  eq_retail_price_improvement_message_at = 0;
  do
  :: eq_retail_price_improvement_message_at < 8 -> wire[at] = eq_retail_price_improvement_message_record.symbol_long[eq_retail_price_improvement_message_at]; at = at + 1; eq_retail_price_improvement_message_at = eq_retail_price_improvement_message_at + 1
  :: else -> break
  od;
  wire[at] = eq_retail_price_improvement_message_record.retail_price_improvement; at = at + 1;
  skip
}

/* Eq Retail Price Improvement Message off the wire, 13 bytes from where the cursor stands */
inline decode_eq_retail_price_improvement_message(eq_retail_price_improvement_message_record) {
  eq_retail_price_improvement_message_at = 0;
  do
  :: eq_retail_price_improvement_message_at < 4 -> eq_retail_price_improvement_message_record.time_offset[eq_retail_price_improvement_message_at] = wire[at]; at = at + 1; eq_retail_price_improvement_message_at = eq_retail_price_improvement_message_at + 1
  :: else -> break
  od;
  eq_retail_price_improvement_message_at = 0;
  do
  :: eq_retail_price_improvement_message_at < 8 -> eq_retail_price_improvement_message_record.symbol_long[eq_retail_price_improvement_message_at] = wire[at]; at = at + 1; eq_retail_price_improvement_message_at = eq_retail_price_improvement_message_at + 1
  :: else -> break
  od;
  eq_retail_price_improvement_message_record.retail_price_improvement = wire[at]; at = at + 1;
  skip
}

/* what was read of Eq Retail Price Improvement Message is what was written, byte for byte */
inline equal_eq_retail_price_improvement_message(eq_retail_price_improvement_message_read, eq_retail_price_improvement_message_written) {
  eq_retail_price_improvement_message_at = 0;
  do
  :: eq_retail_price_improvement_message_at < 4 -> assert(eq_retail_price_improvement_message_read.time_offset[eq_retail_price_improvement_message_at] == eq_retail_price_improvement_message_written.time_offset[eq_retail_price_improvement_message_at]); eq_retail_price_improvement_message_at = eq_retail_price_improvement_message_at + 1
  :: else -> break
  od;
  eq_retail_price_improvement_message_at = 0;
  do
  :: eq_retail_price_improvement_message_at < 8 -> assert(eq_retail_price_improvement_message_read.symbol_long[eq_retail_price_improvement_message_at] == eq_retail_price_improvement_message_written.symbol_long[eq_retail_price_improvement_message_at]); eq_retail_price_improvement_message_at = eq_retail_price_improvement_message_at + 1
  :: else -> break
  od;
  assert(eq_retail_price_improvement_message_read.retail_price_improvement == eq_retail_price_improvement_message_written.retail_price_improvement);
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

/* Eq Time Message: encoded, read back, and compared */
proctype check_eq_time_message() {
  EqTimeMessage eq_time_message_sent;
  EqTimeMessage eq_time_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_eq_time_message(eq_time_message_sent, 0)
  :: pattern == 1 -> fill_eq_time_message(eq_time_message_sent, 32)
  :: pattern == 2 -> fill_eq_time_message(eq_time_message_sent, 255)
  :: else -> ramp_eq_time_message(eq_time_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_eq_time_message(eq_time_message_sent);
    assert(at == 4);
    at = 0;
    decode_eq_time_message(eq_time_message_got);
    assert(at == 4);
    equal_eq_time_message(eq_time_message_got, eq_time_message_sent)
  }
}

/* Eq Unit Clear Message: encoded, read back, and compared */
proctype check_eq_unit_clear_message() {
  EqUnitClearMessage eq_unit_clear_message_sent;
  EqUnitClearMessage eq_unit_clear_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_eq_unit_clear_message(eq_unit_clear_message_sent, 0)
  :: pattern == 1 -> fill_eq_unit_clear_message(eq_unit_clear_message_sent, 32)
  :: pattern == 2 -> fill_eq_unit_clear_message(eq_unit_clear_message_sent, 255)
  :: else -> ramp_eq_unit_clear_message(eq_unit_clear_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_eq_unit_clear_message(eq_unit_clear_message_sent);
    assert(at == 4);
    at = 0;
    decode_eq_unit_clear_message(eq_unit_clear_message_got);
    assert(at == 4);
    equal_eq_unit_clear_message(eq_unit_clear_message_got, eq_unit_clear_message_sent)
  }
}

/* Eq Order Executed Message: encoded, read back, and compared */
proctype check_eq_order_executed_message() {
  EqOrderExecutedMessage eq_order_executed_message_sent;
  EqOrderExecutedMessage eq_order_executed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_eq_order_executed_message(eq_order_executed_message_sent, 0)
  :: pattern == 1 -> fill_eq_order_executed_message(eq_order_executed_message_sent, 32)
  :: pattern == 2 -> fill_eq_order_executed_message(eq_order_executed_message_sent, 255)
  :: else -> ramp_eq_order_executed_message(eq_order_executed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_eq_order_executed_message(eq_order_executed_message_sent);
    assert(at == 24);
    at = 0;
    decode_eq_order_executed_message(eq_order_executed_message_got);
    assert(at == 24);
    equal_eq_order_executed_message(eq_order_executed_message_got, eq_order_executed_message_sent)
  }
}

/* Eq Order Executed At Price Size Message: encoded, read back, and compared */
proctype check_eq_order_executed_at_price_size_message() {
  EqOrderExecutedAtPriceSizeMessage eq_order_executed_at_price_size_message_sent;
  EqOrderExecutedAtPriceSizeMessage eq_order_executed_at_price_size_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_eq_order_executed_at_price_size_message(eq_order_executed_at_price_size_message_sent, 0)
  :: pattern == 1 -> fill_eq_order_executed_at_price_size_message(eq_order_executed_at_price_size_message_sent, 32)
  :: pattern == 2 -> fill_eq_order_executed_at_price_size_message(eq_order_executed_at_price_size_message_sent, 255)
  :: else -> ramp_eq_order_executed_at_price_size_message(eq_order_executed_at_price_size_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_eq_order_executed_at_price_size_message(eq_order_executed_at_price_size_message_sent);
    assert(at == 36);
    at = 0;
    decode_eq_order_executed_at_price_size_message(eq_order_executed_at_price_size_message_got);
    assert(at == 36);
    equal_eq_order_executed_at_price_size_message(eq_order_executed_at_price_size_message_got, eq_order_executed_at_price_size_message_sent)
  }
}

/* Eq Reduce Size Long Message: encoded, read back, and compared */
proctype check_eq_reduce_size_long_message() {
  EqReduceSizeLongMessage eq_reduce_size_long_message_sent;
  EqReduceSizeLongMessage eq_reduce_size_long_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_eq_reduce_size_long_message(eq_reduce_size_long_message_sent, 0)
  :: pattern == 1 -> fill_eq_reduce_size_long_message(eq_reduce_size_long_message_sent, 32)
  :: pattern == 2 -> fill_eq_reduce_size_long_message(eq_reduce_size_long_message_sent, 255)
  :: else -> ramp_eq_reduce_size_long_message(eq_reduce_size_long_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_eq_reduce_size_long_message(eq_reduce_size_long_message_sent);
    assert(at == 16);
    at = 0;
    decode_eq_reduce_size_long_message(eq_reduce_size_long_message_got);
    assert(at == 16);
    equal_eq_reduce_size_long_message(eq_reduce_size_long_message_got, eq_reduce_size_long_message_sent)
  }
}

/* Eq Reduce Size Short Message: encoded, read back, and compared */
proctype check_eq_reduce_size_short_message() {
  EqReduceSizeShortMessage eq_reduce_size_short_message_sent;
  EqReduceSizeShortMessage eq_reduce_size_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_eq_reduce_size_short_message(eq_reduce_size_short_message_sent, 0)
  :: pattern == 1 -> fill_eq_reduce_size_short_message(eq_reduce_size_short_message_sent, 32)
  :: pattern == 2 -> fill_eq_reduce_size_short_message(eq_reduce_size_short_message_sent, 255)
  :: else -> ramp_eq_reduce_size_short_message(eq_reduce_size_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_eq_reduce_size_short_message(eq_reduce_size_short_message_sent);
    assert(at == 14);
    at = 0;
    decode_eq_reduce_size_short_message(eq_reduce_size_short_message_got);
    assert(at == 14);
    equal_eq_reduce_size_short_message(eq_reduce_size_short_message_got, eq_reduce_size_short_message_sent)
  }
}

/* Eq Delete Order Message: encoded, read back, and compared */
proctype check_eq_delete_order_message() {
  EqDeleteOrderMessage eq_delete_order_message_sent;
  EqDeleteOrderMessage eq_delete_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_eq_delete_order_message(eq_delete_order_message_sent, 0)
  :: pattern == 1 -> fill_eq_delete_order_message(eq_delete_order_message_sent, 32)
  :: pattern == 2 -> fill_eq_delete_order_message(eq_delete_order_message_sent, 255)
  :: else -> ramp_eq_delete_order_message(eq_delete_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_eq_delete_order_message(eq_delete_order_message_sent);
    assert(at == 12);
    at = 0;
    decode_eq_delete_order_message(eq_delete_order_message_got);
    assert(at == 12);
    equal_eq_delete_order_message(eq_delete_order_message_got, eq_delete_order_message_sent)
  }
}

/* Eq Trade Long Message: encoded, read back, and compared */
proctype check_eq_trade_long_message() {
  EqTradeLongMessage eq_trade_long_message_sent;
  EqTradeLongMessage eq_trade_long_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_eq_trade_long_message(eq_trade_long_message_sent, 0)
  :: pattern == 1 -> fill_eq_trade_long_message(eq_trade_long_message_sent, 32)
  :: pattern == 2 -> fill_eq_trade_long_message(eq_trade_long_message_sent, 255)
  :: else -> ramp_eq_trade_long_message(eq_trade_long_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_eq_trade_long_message(eq_trade_long_message_sent);
    assert(at == 39);
    at = 0;
    decode_eq_trade_long_message(eq_trade_long_message_got);
    assert(at == 39);
    equal_eq_trade_long_message(eq_trade_long_message_got, eq_trade_long_message_sent)
  }
}

/* Eq Trade Short Message: encoded, read back, and compared */
proctype check_eq_trade_short_message() {
  EqTradeShortMessage eq_trade_short_message_sent;
  EqTradeShortMessage eq_trade_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_eq_trade_short_message(eq_trade_short_message_sent, 0)
  :: pattern == 1 -> fill_eq_trade_short_message(eq_trade_short_message_sent, 32)
  :: pattern == 2 -> fill_eq_trade_short_message(eq_trade_short_message_sent, 255)
  :: else -> ramp_eq_trade_short_message(eq_trade_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_eq_trade_short_message(eq_trade_short_message_sent);
    assert(at == 31);
    at = 0;
    decode_eq_trade_short_message(eq_trade_short_message_got);
    assert(at == 31);
    equal_eq_trade_short_message(eq_trade_short_message_got, eq_trade_short_message_sent)
  }
}

/* Eq Trade Expanded Message: encoded, read back, and compared */
proctype check_eq_trade_expanded_message() {
  EqTradeExpandedMessage eq_trade_expanded_message_sent;
  EqTradeExpandedMessage eq_trade_expanded_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_eq_trade_expanded_message(eq_trade_expanded_message_sent, 0)
  :: pattern == 1 -> fill_eq_trade_expanded_message(eq_trade_expanded_message_sent, 32)
  :: pattern == 2 -> fill_eq_trade_expanded_message(eq_trade_expanded_message_sent, 255)
  :: else -> ramp_eq_trade_expanded_message(eq_trade_expanded_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_eq_trade_expanded_message(eq_trade_expanded_message_sent);
    assert(at == 41);
    at = 0;
    decode_eq_trade_expanded_message(eq_trade_expanded_message_got);
    assert(at == 41);
    equal_eq_trade_expanded_message(eq_trade_expanded_message_got, eq_trade_expanded_message_sent)
  }
}

/* Eq Trade Break Message: encoded, read back, and compared */
proctype check_eq_trade_break_message() {
  EqTradeBreakMessage eq_trade_break_message_sent;
  EqTradeBreakMessage eq_trade_break_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_eq_trade_break_message(eq_trade_break_message_sent, 0)
  :: pattern == 1 -> fill_eq_trade_break_message(eq_trade_break_message_sent, 32)
  :: pattern == 2 -> fill_eq_trade_break_message(eq_trade_break_message_sent, 255)
  :: else -> ramp_eq_trade_break_message(eq_trade_break_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_eq_trade_break_message(eq_trade_break_message_sent);
    assert(at == 12);
    at = 0;
    decode_eq_trade_break_message(eq_trade_break_message_got);
    assert(at == 12);
    equal_eq_trade_break_message(eq_trade_break_message_got, eq_trade_break_message_sent)
  }
}

/* Eq End Of Session: encoded, read back, and compared */
proctype check_eq_end_of_session() {
  EqEndOfSession eq_end_of_session_sent;
  EqEndOfSession eq_end_of_session_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_eq_end_of_session(eq_end_of_session_sent, 0)
  :: pattern == 1 -> fill_eq_end_of_session(eq_end_of_session_sent, 32)
  :: pattern == 2 -> fill_eq_end_of_session(eq_end_of_session_sent, 255)
  :: else -> ramp_eq_end_of_session(eq_end_of_session_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_eq_end_of_session(eq_end_of_session_sent);
    assert(at == 4);
    at = 0;
    decode_eq_end_of_session(eq_end_of_session_got);
    assert(at == 4);
    equal_eq_end_of_session(eq_end_of_session_got, eq_end_of_session_sent)
  }
}

/* Eq Trading Status Message: encoded, read back, and compared */
proctype check_eq_trading_status_message() {
  EqTradingStatusMessage eq_trading_status_message_sent;
  EqTradingStatusMessage eq_trading_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_eq_trading_status_message(eq_trading_status_message_sent, 0)
  :: pattern == 1 -> fill_eq_trading_status_message(eq_trading_status_message_sent, 32)
  :: pattern == 2 -> fill_eq_trading_status_message(eq_trading_status_message_sent, 255)
  :: else -> ramp_eq_trading_status_message(eq_trading_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_eq_trading_status_message(eq_trading_status_message_sent);
    assert(at == 16);
    at = 0;
    decode_eq_trading_status_message(eq_trading_status_message_got);
    assert(at == 16);
    equal_eq_trading_status_message(eq_trading_status_message_got, eq_trading_status_message_sent)
  }
}

/* Eq Auction Update Message: encoded, read back, and compared */
proctype check_eq_auction_update_message() {
  EqAuctionUpdateMessage eq_auction_update_message_sent;
  EqAuctionUpdateMessage eq_auction_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_eq_auction_update_message(eq_auction_update_message_sent, 0)
  :: pattern == 1 -> fill_eq_auction_update_message(eq_auction_update_message_sent, 32)
  :: pattern == 2 -> fill_eq_auction_update_message(eq_auction_update_message_sent, 255)
  :: else -> ramp_eq_auction_update_message(eq_auction_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_eq_auction_update_message(eq_auction_update_message_sent);
    assert(at == 45);
    at = 0;
    decode_eq_auction_update_message(eq_auction_update_message_got);
    assert(at == 45);
    equal_eq_auction_update_message(eq_auction_update_message_got, eq_auction_update_message_sent)
  }
}

/* Eq Auction Summary Message: encoded, read back, and compared */
proctype check_eq_auction_summary_message() {
  EqAuctionSummaryMessage eq_auction_summary_message_sent;
  EqAuctionSummaryMessage eq_auction_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_eq_auction_summary_message(eq_auction_summary_message_sent, 0)
  :: pattern == 1 -> fill_eq_auction_summary_message(eq_auction_summary_message_sent, 32)
  :: pattern == 2 -> fill_eq_auction_summary_message(eq_auction_summary_message_sent, 255)
  :: else -> ramp_eq_auction_summary_message(eq_auction_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_eq_auction_summary_message(eq_auction_summary_message_sent);
    assert(at == 25);
    at = 0;
    decode_eq_auction_summary_message(eq_auction_summary_message_got);
    assert(at == 25);
    equal_eq_auction_summary_message(eq_auction_summary_message_got, eq_auction_summary_message_sent)
  }
}

/* Eq Retail Price Improvement Message: encoded, read back, and compared */
proctype check_eq_retail_price_improvement_message() {
  EqRetailPriceImprovementMessage eq_retail_price_improvement_message_sent;
  EqRetailPriceImprovementMessage eq_retail_price_improvement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_eq_retail_price_improvement_message(eq_retail_price_improvement_message_sent, 0)
  :: pattern == 1 -> fill_eq_retail_price_improvement_message(eq_retail_price_improvement_message_sent, 32)
  :: pattern == 2 -> fill_eq_retail_price_improvement_message(eq_retail_price_improvement_message_sent, 255)
  :: else -> ramp_eq_retail_price_improvement_message(eq_retail_price_improvement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_eq_retail_price_improvement_message(eq_retail_price_improvement_message_sent);
    assert(at == 13);
    at = 0;
    decode_eq_retail_price_improvement_message(eq_retail_price_improvement_message_got);
    assert(at == 13);
    equal_eq_retail_price_improvement_message(eq_retail_price_improvement_message_got, eq_retail_price_improvement_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_eq_time_message()
  :: run check_eq_unit_clear_message()
  :: run check_eq_order_executed_message()
  :: run check_eq_order_executed_at_price_size_message()
  :: run check_eq_reduce_size_long_message()
  :: run check_eq_reduce_size_short_message()
  :: run check_eq_delete_order_message()
  :: run check_eq_trade_long_message()
  :: run check_eq_trade_short_message()
  :: run check_eq_trade_expanded_message()
  :: run check_eq_trade_break_message()
  :: run check_eq_end_of_session()
  :: run check_eq_trading_status_message()
  :: run check_eq_auction_update_message()
  :: run check_eq_auction_summary_message()
  :: run check_eq_retail_price_improvement_message()
  fi
}
